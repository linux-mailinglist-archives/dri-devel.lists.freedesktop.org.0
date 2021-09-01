Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94E3FD0F7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 03:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8D389F92;
	Wed,  1 Sep 2021 01:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E889EFF;
 Wed,  1 Sep 2021 01:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxGiuNbWg7qpm8kbUz9EKdq6SFZUNlSGrjR/N/CGt4ZsKIaftyCK4r57GGXPoJHwotz74/2o+Ddgt+LaJS26niKS2QGUBegpN42eQJateQtd/x3ppJH7FIZ0UKaGXWE0voR3/v3PIqC9xap2GTNK0Zp/mYIhkiRBcQ6Wo5gN6l/PWuT+ZvJn+pNhBSP7xG1QFcKYWtveNlaEurmxORj+sQX0ajBtWvthIdq11QUCX9OO/aE9XRVgJaLNsdyCISIurzc9wuk8GXzVGSSVa2kAc58sja9Q46Nd2mlgvJaYJTrUXF+YaFUe8bOja3Mbgma0RJlCvz0I5nLVA5FkCdBc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM0LBYaeMOXDXZkoZzHIXjisirWwBanPzzDiCSQIJhI=;
 b=VTTN94AaflDj5Iky1xjEr8bcXGUQbSUPLuodmwKPYV7it9MHCtHrY+lDTZgT05P1YMYNqyNeUya+P4c9sxUCQeUNSwEGo8QG8UoyDNVXh0HhvnOOJDHbah/U5/O1/jEOEu02yOU9huKiOggKHvjPWEiWPAR+ZzkjWwuo8xbFBhSHANYz4/7/KS75ysoj6Ld7Hthgsp8MVO0UaPifVfXVVtgfjFBSRKrhKQDkD0ekT1xdrUYnc9SnB7nPQ9co8cIuqI5l0nqy8bduGOm9Hp6Vj5uUDsy6qcRvYAz2ToinAGq+ECpFlD0Nx9V8cpgGl2DGgUTNKmUg3eY4uJFIMb+C1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM0LBYaeMOXDXZkoZzHIXjisirWwBanPzzDiCSQIJhI=;
 b=CP26OpP3bmN7WonONBem6JfGMELg3LrJCkh3ZF+LMjtfsFua0lJWR58QtT8QMhYB6+A1NAtCSpwXXNJllHuQQBpX5t7vgKpoYyE/RvV4RAxqjZW7s+ENnONmwJFbJlHAoa6wILHTamqmZTtaFP5avvY7IlpbW35DMHzakjI906E=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5271.namprd12.prod.outlook.com (2603:10b6:208:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 01:58:27 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 01:58:27 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Chen, JingWen"
 <JingWen.Chen2@amd.com>
CC: DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Topic: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Index: Adeezw8WIoeNdpdaSO6/zguUPH+5CgABTufA
Date: Wed, 1 Sep 2021 01:58:27 +0000
Message-ID: <BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T01:58:25Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=c5d17fbe-6cdb-4bfd-861f-b770323aae9c;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c662c195-763f-4bd6-b4c1-08d96cebfd8e
x-ms-traffictypediagnostic: BL1PR12MB5271:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB52711707003E691422FD360484CD9@BL1PR12MB5271.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nIqnH1bWbwKvBuGeC2wdt77LROA+vn99d7m9FL8B0qQh4FwAYujOqgvN5n3GKaZQ/yQYBFcxZndWvX1MJKxavUqKHDuH4c3w35MAlw8HlD4CyCIjY2XatQiAxFSR/AIVvFZr//23SMioiIdhznAfpw616keNmNKqv15dGPmUPQWRYUxAdHEUqL/hDE0o/rVUW7cO8ywQDBk5cNqWwBfpWLzk6FpKiHjHTUFE2yiAEeoyWbaLpsLgugUiX2Jow/MYNe32DTXW6Gy5NXz29U1qUItO3fyLybS30ZkQelmzmUNzgKE/NxF3YSWutn4LRsdasGpc88fMajUyL7GKIxXV7IY5I585HWTuD2l4X4zDFNu+3/uK/Xr3Z01OhOsAjMiozLpN217g/oNuSuGhICLXYRkOaSeJjZ7KDEc2XpW/sNHJsobPc0d5UChRl8r4lDP0Rzr++HVjQ9pUdbLzH3WTk7IPxqH/KEnYwsIt+iherPaYCL1/nTxs7wlQq3YXk5codW+vjduDcTI6pEEvg8u4Wp25nRzJ8BRC1yDmbbprG5DRC0LkfRgahNz/fU+pl+gXyQeajMKE6QBBqtlNj1DfzUa0u+nRZozO3vDk8S2upMTwzZRVskuLZG/SNJzBJfIcmch+3MkjP55m14hhg8ZcS8HTPAkhp8Jx/HfCEz2ZmmygLkx0xwB0ofDXhPge874XvrK2XIH5Aj/OkV0Ftjc4ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(54906003)(110136005)(66476007)(7696005)(2940100002)(55016002)(122000001)(26005)(38070700005)(38100700002)(6506007)(316002)(52536014)(5660300002)(76116006)(2906002)(8676002)(6636002)(66556008)(9686003)(33656002)(186003)(53546011)(4326008)(66446008)(8936002)(64756008)(66946007)(86362001)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v+e1fqfhRuqzllLzx3L7C5FKSKeikKXCkIN4BaR5hwe3gZutFdqE0VWQtd9J?=
 =?us-ascii?Q?QF2YTEQZLQ4gdwHn/3hVmIo18w6KeTK7zzTyLamfSchTUxIy+Ks0tXNLxiUt?=
 =?us-ascii?Q?ATP7vx8gHQ/sTORVtnilZ2/ICoLTBNivN5V5ItTRxAkrwlxtuFYdnvYEPYTn?=
 =?us-ascii?Q?tFjOEFQ3UlBlNpLEqT6iOSt4B+gsLdf7sbkXX4WxY6sqUGFtWxZVHFNYzd2r?=
 =?us-ascii?Q?DYQo+urb1nYRN/YlWzlrVgwyxMH/te61K8XIS8iJwhupIEywWKWuj8/IepJL?=
 =?us-ascii?Q?1xAp9st7GLp6WxT5oYpg9IfD07VMRHdb4cmauHgbD13fwOHzr04NXQgAQ8qC?=
 =?us-ascii?Q?9ULPYZfursO8+ggJ4ETetUxuMf3E5+Uz3HKK8kT22wZWKpdZ/u6Aapccz3PP?=
 =?us-ascii?Q?/D9WU78xwHfJV6NbxdWLvlSO/KI6H21+f+7pV+fcQx6kyxN3Z/A9ZxHVgTog?=
 =?us-ascii?Q?NRQKHjllA+haB3dlWDM6+dsM4v9oduNffPztr17dx/sjtOBsKe3Cjni5bhV9?=
 =?us-ascii?Q?Uiuhp1k4M9ppp+9hJFTaorWHO/sJF7RuztQ/X3GxgAtyqprXpgrhGTuf6XqC?=
 =?us-ascii?Q?1C4GB4yTDpt+r8SqEPcgVYntMXFCjQhHZDyuUJ3ay/+3ZwzyFx1ziTREkZ0h?=
 =?us-ascii?Q?DdaFOz6FZzj7d/xXXYG0FUguYpvhrAGf8WawEVotgN+JD4jLrtUcnws+V9l7?=
 =?us-ascii?Q?ZSKEhBciB+WazPPGODGBfDXAMyfYKXq15dWb/Up34N2qH4w05xzTvOy8s/K2?=
 =?us-ascii?Q?crHe7JzNqF//PfkcTug1NkSOTpQDE5QK2hg7i810/8/H+5agqireLTIxMnO8?=
 =?us-ascii?Q?3C/Wv3vVx/vciL9ZfT3E2Zxbbfn2xOuU2a9PlZV0YfeawCN337TEciee4suK?=
 =?us-ascii?Q?Bws2u4okx3P5wxz5SYB/K+iE4CAUbqOwwfXUAtrtJhuZpluDhnK+XnqBuZuA?=
 =?us-ascii?Q?YGLuQK3jUceBRbhiidD5ZstAsF2v1mE0LKAf3FUH999CExCCNF0wo63ssWsg?=
 =?us-ascii?Q?nBEGFuGOUQie0RGL4aus/Nt3RfWJF8xNTKmS43R6bGItmZp/3xcUAGRiSSwv?=
 =?us-ascii?Q?v23Os498dG5VKHxqfovrq9KiDdlf6Nw3imuGKnvbSfAHNKyMoym7EfeaNJuL?=
 =?us-ascii?Q?L26mZ3Vkle/2CI6Zm94aI0I5V8ikDnae3Mb4lpGAmBi8xXjIp3+JoijmcrGk?=
 =?us-ascii?Q?2HycS539AOrWimDp5Nk+xtA7PPb3Cb1koWdpffrDJhp3KhcCj+ZJhiAm3Kbc?=
 =?us-ascii?Q?4WG3OtSFpPvKDBMFs3SBgbK+HiMHHU9WraeMzcN3plKb2f8Lq3SB2TCLsqNe?=
 =?us-ascii?Q?cYlOPjVN08a8XIzboiNDazNj?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB5269EB4E07A80EEB48A391DF84CD9BL1PR12MB5269namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c662c195-763f-4bd6-b4c1-08d96cebfd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 01:58:27.5573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99gPZpSDPQVqTpWwxGgz+QHUDEpQRgxzC0ddwOLw2+d8derjiII/eXm0aKK1GmHl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5271
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB5269EB4E07A80EEB48A391DF84CD9BL1PR12MB5269namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

In the previous discussion, you guys stated that we should drop the "kthrea=
d_should_park" in cleanup_job.

@@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sc=
hed)
{
        struct drm_sched_job *job, *next;

-       /*
-        * Don't destroy jobs while the timeout worker is running  OR threa=
d
-        * is being parked and hence assumed to not touch pending_list
-        */
-       if ((sched->timeout !=3D MAX_SCHEDULE_TIMEOUT &&
-           !cancel_delayed_work(&sched->work_tdr)) ||
-           kthread_should_park())
-               return NULL;

But I suddenly have a question here: if return the timedout job no matter k=
thread_should_park() or not, then we are backing to the original problem ag=
ain: that the timedout_job is suddenly signaling and cleanup_job still retu=
rns it to sched_main and job is freed while it is still handling by vendor'=
s timeout callback

If we return NULL when kthread_should_park() in cleanup_job, we can prevent=
 above scenario from happening: once a job is processed by job_timedout we =
can stop its scheduler, and after that even this job suddenly signaled the =
cleanup_job won't return it so sched_main won't free it in parallel ...

What do you think ?
Thanks

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

From: Liu, Monk
Sent: Wednesday, September 1, 2021 9:23 AM
To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andre=
y.Grodzovsky@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Chen, JingWen <Jing=
Wen.Chen2@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freede=
sktop.org
Subject: [diagnostic TDR mode patches] unify our solution opinions/suggesti=
ons in one thread


[AMD Official Use Only]

Hi Daniel/Christian/Andrey

It looks the voice from you three are spread over those email floods to me,=
 the feature we are working on (diagnostic TDR scheme) is pending there for=
 more than 6 month (we started it from feb 2021).

Honestly speaking the email ways that we are using now is not friendly and =
quite painful to me ....
Can we try to put all our opinions, suggestions, or even objects here toget=
her, let's go through them one by one, it's too hard for us to reply each e=
mail on different questions .

For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)

This is a fixing patch on the timeout timer in scheduler, can we complete t=
his one first ? it should already resolved all the questions and suggestion=
s.

For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler

I think I already explained the questions raised by Daniel in other thread =
, regarding why I use __kthread_should_park()
For other aspects, can we put all our opinion synthesized here ?

Thanks !

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------


--_000_BL1PR12MB5269EB4E07A80EEB48A391DF84CD9BL1PR12MB5269namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msipheadera4477989, li.msipheadera4477989, div.msipheadera4477989
	{mso-style-name:msipheadera4477989;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"msipheadera4477989" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the previous discussion, you guys stated that we =
should drop the &#8220;kthread_should_park&#8221; in cleanup_job.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">@@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struc=
t drm_gpu_scheduler *sched)<o:p></o:p></p>
<p class=3D"MsoNormal">{<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dr=
m_sched_job *job, *next;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Don't =
destroy jobs while the timeout worker is running&nbsp; OR thread<o:p></o:p>=
</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is bei=
ng parked and hence assumed to not touch pending_list<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<o:p><=
/o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((sched-&gt=
;timeout !=3D MAX_SCHEDULE_TIMEOUT &amp;&amp;<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; !cancel_delayed_work(&amp;sched-&gt;work_tdr)) ||<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; kthread_should_park())<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But I suddenly have a question here: if return the t=
imedout job no matter kthread_should_park() or not, then we are backing to =
the original problem again: that the timedout_job is suddenly signaling and=
 cleanup_job still returns it to sched_main
 and job is freed while it is still handling by vendor&#8217;s timeout call=
back<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If we return NULL when kthread_should_park() in clea=
nup_job, we can prevent above scenario from happening: once a job is proces=
sed by job_timedout we can stop its scheduler, and after that even this job=
 suddenly signaled the cleanup_job
 won&#8217;t return it so sched_main won&#8217;t free it in parallel &#8230=
; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">What do you think ?<o=
:p></o:p></p>
<div>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">------------------------------------------<o:p></o:p=
></p>
<p class=3D"MsoNormal">Monk Liu | Cloud-GPU Core team<o:p></o:p></p>
<p class=3D"MsoNormal">------------------------------------------<o:p></o:p=
></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Liu, Monk <br>
<b>Sent:</b> Wednesday, September 1, 2021 9:23 AM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Grodzovsky, =
Andrey &lt;Andrey.Grodzovsky@amd.com&gt;; Daniel Vetter &lt;daniel@ffwll.ch=
&gt;; Chen, JingWen &lt;JingWen.Chen2@amd.com&gt;<br>
<b>Cc:</b> DRI Development &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx=
@lists.freedesktop.org<br>
<b>Subject:</b> [diagnostic TDR mode patches] unify our solution opinions/s=
uggestions in one thread<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"msipheadera4477989" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Daniel/Christian/Andrey<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It looks the voice from you three are spread over th=
ose email floods to me, the feature we are working on (diagnostic TDR schem=
e) is pending there for more than 6 month (we started it from feb 2021).<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Honestly speaking the email ways that we are using n=
ow is not friendly and quite painful to me &#8230;.<o:p></o:p></p>
<p class=3D"MsoNormal">Can we try to put all our opinions, suggestions, or =
even objects here together, let&#8217;s go through them one by one, it&#821=
7;s too hard for us to reply each email on different questions .<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For [PATCH 1/2] drm/sched: fix the bug of time out c=
alculation(v4)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is a fixing patch on the timeout timer in sched=
uler, can we complete this one first ? it should already resolved all the q=
uestions and suggestions.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For [PATCH 2/2] drm/sched: serialize job_timeout and=
 scheduler<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I think I already explained the questions raised by =
Daniel in other thread , regarding why I use __kthread_should_park()<o:p></=
o:p></p>
<p class=3D"MsoNormal">For other aspects, can we put all our opinion synthe=
sized here ?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks !<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">------------------------------------------<o:p></o:p=
></p>
<p class=3D"MsoNormal">Monk Liu | Cloud-GPU Core team<o:p></o:p></p>
<p class=3D"MsoNormal">------------------------------------------<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BL1PR12MB5269EB4E07A80EEB48A391DF84CD9BL1PR12MB5269namp_--
