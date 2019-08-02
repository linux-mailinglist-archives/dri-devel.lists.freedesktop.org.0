Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76007EBCE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 07:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836306E8A2;
	Fri,  2 Aug 2019 05:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710052.outbound.protection.outlook.com [40.107.71.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3CD6E8A2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 05:09:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxZOQzRz6FcgD310tIF5IEgN517JEcUBZqusFiQTuKL7fW2Zp3B5zmYVcNNg0YqPUS88UgnvTesclTvJb5GMT6DUuSJYO2pUA5zF/n0NT2VyWnIOpbEfhzmMxlu4vuSahPmKqWfg7ZoGYhdXWHB5Ig0P5zJ5la9vUK43fNnxL8fIsp5/gHMRN0RF/d6HegbkRivSYRNjklIJyA/D70k6WBEL90tgWlXW8j1Cf0ZhiSE39sJrvuRCOZHrwcsMOagmSi01UbEAb53wZg6ZZwFbbjAqmFN+Dref5f8O9JEXx2mX5Tgop5RRtU9PfOp9pH2XB8Ge1Mmd9UKTU/6KAtm0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0OJNX6TVg/1WeDpLrfHzXpVSTDxllpij7lTtrSnl7w=;
 b=ZcqrFY4UIz/6grugLPmieSYUDYW/n4s5pDPMne59gu8ifzfTlNG4ycr2BO+Kkh98WQ1iXqOZajh/IJj3MJsYeTTb7lPLtUmE1YYIEkHeds+5QN8LtmvNexLJRTar/Fl7MZ6c6nO9jUuWcG5Y+Jwsw3WrXVZhpkPxnqA0SXomQrUGrfdTg47Eb5qOydyHimJ5AyXOLN9g3ZAZ0h7Et/68i+t1pvG3hS1c91fxxGET+d7AC0MzZFUsJgVW7D8AdQ73FaJhk82u/dwumguiDegRhT/eX3ZNSMEPRcXYJqgZs/rukOEielXzAnBOIYLtVpclqhB6DauU5o3qoL0wYQKKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1179.namprd12.prod.outlook.com (10.168.234.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 05:08:59 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 05:08:59 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: Threaded submission & semaphore sharing
Thread-Topic: Threaded submission & semaphore sharing
Thread-Index: AQHVSKsIzzvy3ipII0arZE19bn6lgKbnMLaAgAATU4CAAAF0QYAABj8AgAADtng=
Date: Fri, 2 Aug 2019 05:08:59 +0000
Message-ID: <15c7ac0e-96f7-4b3a-b185-4ce50d046762@email.android.com>
References: <e8063826-a38b-e1d3-fe8b-63202b8bd264@intel.com>
 <MN2PR12MB29103E4B1ABDD9A9A40EF8F6B4D90@MN2PR12MB2910.namprd12.prod.outlook.com>
 <a9904cd8-c1ff-e1d3-eb16-5183dc9a7908@intel.com>
 <970c65d1-ad63-4492-8ae2-96b603b2c7c8@email.android.com>,
 <7029d51c-2e57-a58e-d621-d9dc15614316@intel.com>
In-Reply-To: <7029d51c-2e57-a58e-d621-d9dc15614316@intel.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:908:1252:fb60:d51d:9005:182e:634a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b03478b2-fbe7-491e-5451-08d717078708
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1179; 
x-ms-traffictypediagnostic: DM5PR12MB1179:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1179711761D692CB5B7DF73A83D90@DM5PR12MB1179.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(13464003)(189003)(199004)(54906003)(76116006)(256004)(6116002)(53546011)(5660300002)(316002)(8676002)(81156014)(25786009)(966005)(8936002)(606006)(99286004)(2906002)(76176011)(14454004)(102836004)(6506007)(478600001)(81166006)(68736007)(71200400001)(64756008)(446003)(66556008)(86362001)(186003)(6486002)(11346002)(46003)(229853002)(53936002)(7736002)(31696002)(91956017)(66446008)(9686003)(6512007)(236005)(31686004)(71190400001)(66946007)(54896002)(6246003)(6306002)(486006)(476003)(6436002)(6916009)(4326008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1179;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rpTgbW0XTN6FEOMWBlh88ScknGdf+47eo+Ut6jiHHo0wn0tqZrLR8oHnTQ73/udGq3mVvCGM2SyShy1TARA2oMFt3F0rcnrLH+q54JSMQUzsgVLYJhSsu/KhhBKMd73aPp6l6AFKiI/D0mKv5D92F/T8cOg7ScDX8pceba/pvd8yvleIxoViSR3ayiIkZDmREsq/wy2KlCageIlgv9+Fs/ZfKBD1XT60LW8E0Uticx4BPQ/1g3lpoDWnhAoR6lzYLm45ejBqxk6X+B1yY8/VFYpk7P6X2usUEC7xhWOR/5llhS3tWXf6eJvjeXWVe8jHTRAPRWNik+jqH6sBflrZ7JgYG9W0U4TK1++OwjCR7zxvGuu9HLgPMNmZhpwVs4+UZfgkhCxsh2aRFVFJie1dQA7/s2/jcUeCMTCqsgsZw6Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b03478b2-fbe7-491e-5451-08d717078708
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 05:08:59.2553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1179
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0OJNX6TVg/1WeDpLrfHzXpVSTDxllpij7lTtrSnl7w=;
 b=bHeUbzatSAFu+MbcUwqHxsM7YPd2vKh3Mab7bUOWjmttqtCJswgakCyEVcsV6hbnTmaXEUwz4SXRIlh6r+YUmLBQLydQLX60KMZvPGpKf0vJ+kSZVjVVlbpEej/9fYKiQruwmGl0ClwkwET6ZGyLa10mKm4czrcO6+ne8tv1+dM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0349124070=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0349124070==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_15c7ac0e96f74b3ab1854ce50d046762emailandroidcom_"

--_000_15c7ac0e96f74b3ab1854ce50d046762emailandroidcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Lionel,

Well that looks more like your test case is buggy.

According to the code the ctx1 queue always waits for sem1 and ctx2 queue a=
lways waits for sem2.

This way there can't be any Synchronisation between the two.

Regards,
Christian.

Am 02.08.2019 06:55 schrieb Lionel Landwerlin <lionel.g.landwerlin@intel.co=
m>:
Hey Christian,

The problem boils down to the fact that we don't immediately create dma fen=
ces when calling vkQueueSubmit().
This is delayed to a thread.

From a single application thread, you can QueueSubmit() to 2 queues from 2 =
different devices.
Each QueueSubmit to one queue has a dependency on the previous QueueSubmit =
on the other queue through an exported/imported semaphore.

From the API point of view the state of the semaphore should be changed aft=
er each QueueSubmit().
The problem is that it's not because of the thread and because you might ha=
ve those 2 submission threads tied to different VkDevice/VkInstance or even=
 different applications (synchronizing themselves outside the vulkan API).

Hope that makes sense.
It's not really easy to explain by mail, the best explanation is probably r=
eading the test : https://gitlab.freedesktop.org/mesa/crucible/blob/master/=
src/tests/func/sync/semaphore-fd.c#L788

Like David mentioned you're not running into that issue right now, because =
you only dispatch to the thread under specific conditions.
But I could build a case to force that and likely run into the same issue.

-Lionel

On 02/08/2019 07:33, Koenig, Christian wrote:
Hi Lionel,

Well could you describe once more what the problem is?

Cause I don't fully understand why a rather normal tandem submission with t=
wo semaphores should fail in any way.

Regards,
Christian.

Am 02.08.2019 06:28 schrieb Lionel Landwerlin <lionel.g.landwerlin@intel.co=
m><mailto:lionel.g.landwerlin@intel.com>:
There aren't CTS tests covering the issue I was mentioning.
But we could add them.

I don't have all the details regarding your implementation but even with
the "semaphore thread", I could see it running into the same issues.
What if a mix of binary & timeline semaphores are handed to vkQueueSubmit()=
?

For example with queueA & queueB from 2 different VkDevice :
     vkQueueSubmit(queueA, signal semA);
     vkQueueSubmit(queueA, wait on [semA, timelineSemB]); with
timelineSemB triggering a wait before signal.
     vkQueueSubmit(queueB, signal semA);


-Lionel

On 02/08/2019 06:18, Zhou, David(ChunMing) wrote:
> Hi Lionel,
>
> By the Queue thread is a heavy thread, which is always resident in driver=
 during application running, our guys don't like that. So we switch to Sema=
phore Thread, only when waitBeforeSignal of timeline happens, we spawn a th=
read to handle that wait. So we don't have your this issue.
> By the way, I already pass all your CTS cases for now. I suggest you to s=
witch to Semaphore Thread instead of Queue Thread as well. It works very we=
ll.
>
> -David
>
> -----Original Message-----
> From: Lionel Landwerlin <lionel.g.landwerlin@intel.com><mailto:lionel.g.l=
andwerlin@intel.com>
> Sent: Friday, August 2, 2019 4:52 AM
> To: dri-devel <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.fr=
eedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com><mailto:Christi=
an.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com><mailto:Davi=
d1.Zhou@amd.com>; Jason Ekstrand <jason@jlekstrand.net><mailto:jason@jlekst=
rand.net>
> Subject: Threaded submission & semaphore sharing
>
> Hi Christian, David,
>
> Sorry to report this so late in the process, but I think we found an issu=
e not directly related to syncobj timelines themselves but with a side effe=
ct of the threaded submissions.
>
> Essentially we're failing a test in crucible :
> func.sync.semaphore-fd.opaque-fd
> This test create a single binary semaphore, shares it between 2 VkDevice/=
VkQueue.
> Then in a loop it proceeds to submit workload alternating between the 2 V=
kQueue with one submit depending on the other.
> It does so by waiting on the VkSemaphore signaled in the previous iterati=
on and resignaling it.
>
> The problem for us is that once things are dispatched to the submission t=
hread, the ordering of the submission is lost.
> Because we have 2 devices and they both have their own submission thread.
>
> Jason suggested that we reestablish the ordering by having semaphores/syn=
cobjs carry an additional uint64_t payload.
> This 64bit integer would represent be an identifier that submission threa=
ds will WAIT_FOR_AVAILABLE on.
>
> The scenario would look like this :
>       - vkQueueSubmit(queueA, signal on semA);
>           - in the caller thread, this would increment the syncobj additi=
onal u64 payload and return it to userspace.
>           - at some point the submission thread of queueA submits the wor=
kload and signal the syncobj of semA with value returned in the caller thre=
ad of vkQueueSubmit().
>       - vkQueueSubmit(queueB, wait on semA);
>           - in the caller thread, this would read the syncobj additional
> u64 payload
>           - at some point the submission thread of queueB will try to sub=
mit the work, but first it will WAIT_FOR_AVAILABLE the u64 value returned i=
n the step above
>
> Because we want the binary semaphores to be shared across processes and w=
ould like this to remain a single FD, the simplest location to store this a=
dditional u64 payload would be the DRM syncobj.
> It would need an additional ioctl to read & increment the value.
>
> What do you think?
>
> -Lionel




--_000_15c7ac0e96f74b3ab1854ce50d046762emailandroidcom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta content=3D"text/html; charset=3DWindows-1252">
</head>
<body bgcolor=3D"#FFFFFF">
<div dir=3D"auto">Hi Lionel,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Well that looks more like your test case is buggy.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">According to the code the ctx1 queue always waits for sem=
1 and ctx2 queue always waits for sem2.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This way there can't be any Synchronisation between the t=
wo.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Regards,</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">Am 02.08.2019 06:55 schrieb Lionel Landwerlin &l=
t;lionel.g.landwerlin@intel.com&gt;:<br type=3D"attribution">
</div>
</div>
<div>
<div class=3D"moz-cite-prefix">Hey Christian,</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">The problem boils down to the fact that we d=
on't immediately create dma fences when calling vkQueueSubmit().</div>
<div class=3D"moz-cite-prefix">This is delayed to a thread.</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">From a single application thread, you can Qu=
eueSubmit() to 2 queues from 2 different devices.</div>
<div class=3D"moz-cite-prefix">Each QueueSubmit to one queue has a dependen=
cy on the previous QueueSubmit on the other queue through an exported/impor=
ted semaphore.</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">From the API point of view the state of the =
semaphore should be changed after each QueueSubmit().</div>
<div class=3D"moz-cite-prefix">The problem is that it's not because of the =
thread and because you might have those 2 submission threads tied to differ=
ent VkDevice/VkInstance or even different applications (synchronizing thems=
elves outside the vulkan API).</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">Hope that makes sense.</div>
<div class=3D"moz-cite-prefix">It's not really easy to explain by mail, the=
 best explanation is probably reading the test :
<a href=3D"https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tes=
ts/func/sync/semaphore-fd.c#L788">
https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/syn=
c/semaphore-fd.c#L788</a></div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">Like David mentioned you're not running into=
 that issue right now, because you only dispatch to the thread under specif=
ic conditions.</div>
<div class=3D"moz-cite-prefix">But I could build a case to force that and l=
ikely run into the same issue.<br>
</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">-Lionel<br>
</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">On 02/08/2019 07:33, Koenig, Christian wrote=
:<br>
</div>
<blockquote type=3D"cite">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<style>
<!--
.EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style>
<div>
<div dir=3D"auto">Hi Lionel,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Well could you describe once more what the problem is?</d=
iv>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Cause I don't fully understand why a rather normal tandem=
 submission with two semaphores should fail in any way.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Regards,</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 02.08.2019 06:28 schrieb Lionel Landwerlin =
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lionel.g.landwerlin@intel=
.com">
&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">There aren't CTS tests covering the issue I was me=
ntioning.<br>
But we could add them.<br>
<br>
I don't have all the details regarding your implementation but even with <b=
r>
the &quot;semaphore thread&quot;, I could see it running into the same issu=
es.<br>
What if a mix of binary &amp; timeline semaphores are handed to vkQueueSubm=
it()?<br>
<br>
For example with queueA &amp; queueB from 2 different VkDevice :<br>
&nbsp;&nbsp;&nbsp;&nbsp; vkQueueSubmit(queueA, signal semA);<br>
&nbsp;&nbsp;&nbsp;&nbsp; vkQueueSubmit(queueA, wait on [semA, timelineSemB]=
); with <br>
timelineSemB triggering a wait before signal.<br>
&nbsp;&nbsp;&nbsp;&nbsp; vkQueueSubmit(queueB, signal semA);<br>
<br>
<br>
-Lionel<br>
<br>
On 02/08/2019 06:18, Zhou, David(ChunMing) wrote:<br>
&gt; Hi Lionel,<br>
&gt;<br>
&gt; By the Queue thread is a heavy thread, which is always resident in dri=
ver during application running, our guys don't like that. So we switch to S=
emaphore Thread, only when waitBeforeSignal of timeline happens, we spawn a=
 thread to handle that wait. So we
 don't have your this issue.<br>
&gt; By the way, I already pass all your CTS cases for now. I suggest you t=
o switch to Semaphore Thread instead of Queue Thread as well. It works very=
 well.<br>
&gt;<br>
&gt; -David<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Lionel Landwerlin <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:lionel.g.landwerlin@intel.com">
&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
&gt; Sent: Friday, August 2, 2019 4:52 AM<br>
&gt; To: dri-devel <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:dri-de=
vel@lists.freedesktop.org">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; Koenig, Christian <a class=3D"=
moz-txt-link-rfc2396E" href=3D"mailto:Christian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a>; Zhou, David(ChunMing) <a class=3D"moz=
-txt-link-rfc2396E" href=3D"mailto:David1.Zhou@amd.com">
&lt;David1.Zhou@amd.com&gt;</a>; Jason Ekstrand <a class=3D"moz-txt-link-rf=
c2396E" href=3D"mailto:jason@jlekstrand.net">
&lt;jason@jlekstrand.net&gt;</a><br>
&gt; Subject: Threaded submission &amp; semaphore sharing<br>
&gt;<br>
&gt; Hi Christian, David,<br>
&gt;<br>
&gt; Sorry to report this so late in the process, but I think we found an i=
ssue not directly related to syncobj timelines themselves but with a side e=
ffect of the threaded submissions.<br>
&gt;<br>
&gt; Essentially we're failing a test in crucible :<br>
&gt; func.sync.semaphore-fd.opaque-fd<br>
&gt; This test create a single binary semaphore, shares it between 2 VkDevi=
ce/VkQueue.<br>
&gt; Then in a loop it proceeds to submit workload alternating between the =
2 VkQueue with one submit depending on the other.<br>
&gt; It does so by waiting on the VkSemaphore signaled in the previous iter=
ation and resignaling it.<br>
&gt;<br>
&gt; The problem for us is that once things are dispatched to the submissio=
n thread, the ordering of the submission is lost.<br>
&gt; Because we have 2 devices and they both have their own submission thre=
ad.<br>
&gt;<br>
&gt; Jason suggested that we reestablish the ordering by having semaphores/=
syncobjs carry an additional uint64_t payload.<br>
&gt; This 64bit integer would represent be an identifier that submission th=
reads will WAIT_FOR_AVAILABLE on.<br>
&gt;<br>
&gt; The scenario would look like this :<br>
&gt;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - vkQueueSubmit(queueA, signal on semA)=
;<br>
&gt;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - in the caller thre=
ad, this would increment the syncobj additional u64 payload and return it t=
o userspace.<br>
&gt;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - at some point the =
submission thread of queueA submits the workload and signal the syncobj of =
semA with value returned in the caller thread of vkQueueSubmit().<br>
&gt;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - vkQueueSubmit(queueB, wait on semA);<=
br>
&gt;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - in the caller thre=
ad, this would read the syncobj additional<br>
&gt; u64 payload<br>
&gt;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; - at some point the =
submission thread of queueB will try to submit the work, but first it will =
WAIT_FOR_AVAILABLE the u64 value returned in the step above<br>
&gt;<br>
&gt; Because we want the binary semaphores to be shared across processes an=
d would like this to remain a single FD, the simplest location to store thi=
s additional u64 payload would be the DRM syncobj.<br>
&gt; It would need an additional ioctl to read &amp; increment the value.<b=
r>
&gt;<br>
&gt; What do you think?<br>
&gt;<br>
&gt; -Lionel<br>
<br>
<br>
</div>
</span></font></blockquote>
<p><br>
</p>
</div>
</body>
</html>

--_000_15c7ac0e96f74b3ab1854ce50d046762emailandroidcom_--

--===============0349124070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0349124070==--
