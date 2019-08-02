Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177A7EB7D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 06:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E356E89E;
	Fri,  2 Aug 2019 04:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AD96E89E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 04:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDMfv2PHapQAKDPUw1lBlkneU9Hhpf/NvYc34cRAszdMGtUvpo40hPNAaTBWkwoN1SQAXyRHf7Vf5eNBMOmKXwWhG8b9cIIlNsElDt1T2gBCPI0b8zXq2thY8wgum6ZZuLYaNYJbLCR90uNNBK/k0kf1cpAbAMda4oYbFLaOx0iqzSDMFe1TpIN+BcoeWLwau+wJ6txVateczxwjFdCFDSmXn7FjVGlsJJCMHesCmaV/DDB8h5NLRLUcJk+uW9CEeg8uqtrbojHQXfjVSk+ePt5NU0CwyedAjReYQpmZa3tbOc4PV6JCT0tVxdDtIPusiEdeAsjw7QJgVyybgBQOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o0cGBPgjc2XPj/+bHrxI5aAGDBDuISMERUsalZKlJ8=;
 b=Wv6AiQvkDtEyt5gPf7+rJt9ocL9peKyKI2DsbYNCKpyD7nMjCPIFfpxD8SMeGMiQ63zn9u3HQ3AzxcVJ+MRKP8ZoFgXrJHCBk/HP1h8+Hbq7j+I9xqYuxJq2TVvyQN7HIzXtrPfd8uPHU2yj8it5oHhhzoJacAANxCVmRDKmwjLOdsrO4suirqGbvJgcGJkLQvuUPTGIjEOYChNkqSjNmoX5a3Tmxf50HeP40P5oqY1Taujf6J0Xm1kVPnt1LTI9l8VhMpZVBZRYeKjxiYBnQ3gAEdz2fzhqHdA+3KweDS/7YiK4RkviJ4sV4ELqgsz4Z93vVvd9OG8ahUFZrjT77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1561.namprd12.prod.outlook.com (10.172.37.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Fri, 2 Aug 2019 04:33:20 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 04:33:20 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: Threaded submission & semaphore sharing
Thread-Topic: Threaded submission & semaphore sharing
Thread-Index: AQHVSKsIzzvy3ipII0arZE19bn6lgKbnMLaAgAATU4CAAAF0QQ==
Date: Fri, 2 Aug 2019 04:33:20 +0000
Message-ID: <970c65d1-ad63-4492-8ae2-96b603b2c7c8@email.android.com>
References: <e8063826-a38b-e1d3-fe8b-63202b8bd264@intel.com>
 <MN2PR12MB29103E4B1ABDD9A9A40EF8F6B4D90@MN2PR12MB2910.namprd12.prod.outlook.com>,
 <a9904cd8-c1ff-e1d3-eb16-5183dc9a7908@intel.com>
In-Reply-To: <a9904cd8-c1ff-e1d3-eb16-5183dc9a7908@intel.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:908:1252:fb60:d51d:9005:182e:634a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7fdcf00-fb1a-4b4a-4bb4-08d717028c46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1561; 
x-ms-traffictypediagnostic: DM5PR12MB1561:
x-microsoft-antispam-prvs: <DM5PR12MB1561D340C258B5ED70AF47E383D90@DM5PR12MB1561.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39850400004)(366004)(199004)(13464003)(189003)(2906002)(6512007)(9686003)(64756008)(229853002)(54896002)(54906003)(186003)(478600001)(486006)(31696002)(91956017)(6916009)(76116006)(66446008)(6436002)(76176011)(6116002)(66476007)(66946007)(53936002)(53546011)(66556008)(8936002)(476003)(81156014)(86362001)(6506007)(5660300002)(99286004)(81166006)(6486002)(11346002)(102836004)(46003)(316002)(6246003)(71190400001)(25786009)(14454004)(31686004)(68736007)(8676002)(7736002)(4326008)(256004)(71200400001)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1561;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w5Vs0fgNc/uM+fT1vU0zQruiesX4rwXVSnO+jj/Dfg7eUPU6a+DHPSW5WPXZ0+5iRLeM+Lf6KhZm3Ymsre7ehglxvNyuXxbyACZuwJySvUyzXZPGF+EdKMuAHrL9wP7Z3dwTOjPyOT6OQuLEMaccUzYNIeQyEYrEmCLRTw3hVSQQJ0IvRxkdFFfcu1mqis08iMFBsOUN5v9pST1N/fmyBUNGPkLFAfDd7Bz0NR+NRdKO4lNapSeXuJr7oHiCFaOVjYCDgu/RKWr8eYMmr6tigyo2KB4EKYmlip1lRkrzo6uDSDXTWnb2dbu++ILrCbW04TyBUWNXPWanOOr8yd/M2vn5OHkz4K/qQAXX4QKhTDZ+vpqNoHwhxmNF3mCTWJSaikZDqMeIcahc103WEKu9AlTbBTprpu7Zw7sHogoJpuI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fdcf00-fb1a-4b4a-4bb4-08d717028c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 04:33:20.6624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1561
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o0cGBPgjc2XPj/+bHrxI5aAGDBDuISMERUsalZKlJ8=;
 b=MYSJ2U1iNS/BHUFNh6ylfZ7AxQlroeP266iOGi5mA0xcgOQC+VXybqJS+fy65OIHVDfVUS85Tn5gWeQP2JOnBhXmDY/hZFm34ovCm3dw/tXpM6egY5ItHreFzv76aIN+cni27RWclBZcBHe3h3EW53MUkURtXzxm5oELb30fO8U=
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
Content-Type: multipart/mixed; boundary="===============0223316488=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0223316488==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_970c65d1ad6344928ae296b603b2c7c8emailandroidcom_"

--_000_970c65d1ad6344928ae296b603b2c7c8emailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Lionel,

Well could you describe once more what the problem is?

Cause I don't fully understand why a rather normal tandem submission with t=
wo semaphores should fail in any way.

Regards,
Christian.

Am 02.08.2019 06:28 schrieb Lionel Landwerlin <lionel.g.landwerlin@intel.co=
m>:
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
> From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Sent: Friday, August 2, 2019 4:52 AM
> To: dri-devel <dri-devel@lists.freedesktop.org>; Koenig, Christian <Chris=
tian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; Jason Ek=
strand <jason@jlekstrand.net>
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



--_000_970c65d1ad6344928ae296b603b2c7c8emailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
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
&lt;lionel.g.landwerlin@intel.com&gt;:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
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
&gt; From: Lionel Landwerlin &lt;lionel.g.landwerlin@intel.com&gt;<br>
&gt; Sent: Friday, August 2, 2019 4:52 AM<br>
&gt; To: dri-devel &lt;dri-devel@lists.freedesktop.org&gt;; Koenig, Christi=
an &lt;Christian.Koenig@amd.com&gt;; Zhou, David(ChunMing) &lt;David1.Zhou@=
amd.com&gt;; Jason Ekstrand &lt;jason@jlekstrand.net&gt;<br>
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
</span></font>
</body>
</html>

--_000_970c65d1ad6344928ae296b603b2c7c8emailandroidcom_--

--===============0223316488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0223316488==--
