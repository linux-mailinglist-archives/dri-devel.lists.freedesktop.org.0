Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C69307151
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5B46E942;
	Thu, 28 Jan 2021 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14C6E936;
 Thu, 28 Jan 2021 08:20:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXWUufwIzLLPLnVKOX5bNwn8Bd55M7ND9NOKUPvKoLE2EwWXrO8HzdZjMjox6Ai4LMkSQG45SRZA42X544U7qxlh4jbNikRhSxcP3Ufa071L5uiE1pEYADuHTEiWIfRUrrQnTYItpVSWD+f5F+TWxu5X+Ld5H3CrGmC5VfaczCfqISzwYTans1RtllkwrygNwGu2dVb5nrqajjVVcM/jmFwmK613d/Hf6pH1YLpBxBitBYJsCVg2/EalAok8tlkqydMbHPrmaqQqpdi0ORb4xvaco6+43b4cjAWjPjQhbskz8zDFrXH+lJCxDRaK8YUj2Pz4TfD6Eu3n/SVmpqykvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TImjiZ0x3WbLrazG2zgNS57HW+AQH5KfoBMNbuKXlj0=;
 b=CBrE4r7Hwh9nXrs0CPqnNAokupheVVMq5bxBELJcvqsEcnRfw5tjE8JkDyfBCk5bdXnrcI8zJA1YIg8hPDBwfWiyWVT4jmRAoJebd1EptKP8li1pvwgoo6Nnn2EdSGqvXvjoLMvXLe/C2NkvXUzfbYF+0miVhu7E7sSB4ksokKZP47eEeRTejN9xmPHGfZDBNgRnLIbX1ot7INI1b9Zia8nanbLmA9Op5VdWggnsQIehr3PIIBkK/++9HZ8FlTvSP+GNpPfF5DHJ7pjMVhVs8r7bz+AeqquUtksCiVA6FGjvYcyWongSEAxqTREq6WLPoAXz+YAy9k0DoXov9fNScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TImjiZ0x3WbLrazG2zgNS57HW+AQH5KfoBMNbuKXlj0=;
 b=g8TSl5QZJLzFq/mnTC8P5Fx+QVtQyGtn4PcqsWj+xt3h5qyakO9Xd7+DAeod+XXl5trUY038rxOcPnnS+6gxUpfALUbgfCFWTQgWnDobYuJPl3d2qp96m7cqTN+30FHMhrMX4ISEC7R7aRUx+ArMbacbUafGOhjMiJ84wnGEmvs=
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3343.namprd12.prod.outlook.com (2603:10b6:208:c2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 08:19:56 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 08:19:56 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [RFC PATCH 0/3] add ttm trace event support
Thread-Topic: [RFC PATCH 0/3] add ttm trace event support
Thread-Index: AQHW9UUfcI9HaT+tWEKKjApxXlGGiqo8qPCAgAAIlhY=
Date: Thu, 28 Jan 2021 08:19:56 +0000
Message-ID: <MN2PR12MB3022274A302C35FEF5EA3AE2A2BA9@MN2PR12MB3022.namprd12.prod.outlook.com>
References: <20210128071322.24313-1-kevin1.wang@amd.com>,
 <1da5dde0-689a-83c9-d49f-5b5eb0bbc8e5@gmail.com>
In-Reply-To: <1da5dde0-689a-83c9-d49f-5b5eb0bbc8e5@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-28T08:19:55.478Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 813662d6-664c-46ae-16a8-08d8c3657f00
x-ms-traffictypediagnostic: MN2PR12MB3343:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3343DF1D4BF28ABFAF08B62CA2BA9@MN2PR12MB3343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0W2/5lEN9RIqhzfHMBPYbAe5/T120AsXb30uZZ2EXrugai/dNbvReIPa6LQ6Hvk4vuJOMfHbvFf8uV5K57YWtUXKk3pFRrgm4hioVS8Bd+mnoYXBCKFEPFiltvHrwmTAcsoyUX9fExIwTUiwE2/hdF+hZtGGXQK+FT3h5hWMBeb3R4hikWZ87KeGf7o2CIZ0NBIbUTLepIOTy9vlBETIpMEpLrZ6Ww0GmQ1vH5HoksHXYa0Ps/5B+5HN9k1vQM3H4Qevakl/e6+hejvR/wcBmr6uNUbGm3aMrrLrTNAd5/CLpWwuQc77gWmQ6WaXrQ9t25elNYyP4s/vwWY8omUMLpi9zd5GFXIQFIVuT3CgONzY0H87hNFToHql3fnTGCvPdqvy4IYfocZb3WwWSXBWkTIl9qg+AmNgwQh6HMPYmfvt4UBBB/5y1gwAqI+4hEdHuu6sZpJigSxiRvaGktO1KxlOD3CqxbY3sZqtQnx7iyemYpYrl9oVuEHo5L1JEStFP4tXI/fHVKg8NjT1EczQRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(86362001)(66556008)(71200400001)(6506007)(316002)(6636002)(66476007)(4326008)(450100002)(83380400001)(52536014)(8676002)(66574015)(8936002)(19627405001)(91956017)(7696005)(186003)(5660300002)(26005)(478600001)(64756008)(66946007)(66446008)(2906002)(110136005)(9686003)(55016002)(76116006)(33656002)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?8dM+ZzC/CL1QPtADY4tX0mJqctCBOPOKRd+ZRezYOhpWahLvzYj2ZFvbj7?=
 =?iso-8859-1?Q?5HriHpjjhE56JgQLVJ9rXry1oyk8tXZocQ9LDRgH3GpycyLsfjw5elVl8z?=
 =?iso-8859-1?Q?i2n7LrIq6AuQixZzY3OdfyOtyTWdR4zkSaKqqgOpT/WTzMkuRrs3USWZ0c?=
 =?iso-8859-1?Q?65/suMF9U44Tl3l7291jnT67R+cYngeOiiO+4jbK/ZiawK2HUDn0+N1jS1?=
 =?iso-8859-1?Q?smcLrQALoqlk/dspeDHUZpuEp4vCMNlCne153RsdP3ZUsOruRDN7hYeTWD?=
 =?iso-8859-1?Q?9UxbPKaA6ZzbEUPxWQsGBXNyVukyf3HbDuiGCCwjjcwmwnvDRuWJE7exCr?=
 =?iso-8859-1?Q?B1DFoiEFOV/LCxY2PTOudw5DH4mCc4uBjd8YuMQ8/LbIjCQ9rCbhETDpiS?=
 =?iso-8859-1?Q?iT3QJXiyIeDwtN63Jta5XFqw55P76qKvI8LIDt/5RZOKhRR5G/BWQolyv2?=
 =?iso-8859-1?Q?Jhd+2E2AqsaZwt1gTkcVCa9XnsqDuFdKHwDDkMKbi1jYjGEEszmiPijEA1?=
 =?iso-8859-1?Q?NrqNXdLP4yVX1F1gXw2rI7y5u488mpjnlyqJjJOKwdEYF2FXGlRY5RWskA?=
 =?iso-8859-1?Q?WJNdIuSC/E+rd2OKsegr0KX/yo/sCXPQ9HvuCTIIguqhyJQAVH7KxuAmgz?=
 =?iso-8859-1?Q?P8VfI7XueU54hLli1dos3Pch0/iTHHtQqrL/dray3X/BxKS/l3Lec7vUYL?=
 =?iso-8859-1?Q?6VN4kWknOdk3LEQ3DCHu/FNaPapkCVQEowKeomccCLuzJcLd+DjDZac65O?=
 =?iso-8859-1?Q?xwWRaE2JAL6HBJTjgLyEc4tng4b6BWMtlFdbUap4eLetaB2QYpA9VWJkjm?=
 =?iso-8859-1?Q?5LRP8sbXP/gwF4/dhp58eg67ZPBQEn4QPnMrmjzYfCqvlQ25teDZ1G68KR?=
 =?iso-8859-1?Q?VyOp1LVyqUW6ju8zFyaFRqKKOrkeQRMkNDTSWnAu7AKnvohAA6wzp7C4fy?=
 =?iso-8859-1?Q?wZPCDySZufH92zs1+0rm07Dc2ogE2XYu8T9ll5NSKIKQQkrie2FS4gHo9O?=
 =?iso-8859-1?Q?T5QO8SM1emLqMBwa/Loy2iga+exMlLp9rNRGpsQGIuGKUCFXv6Ynd2N+oA?=
 =?iso-8859-1?Q?z7DWZ8AQCAhFs+6yt3GrBhqM4/h0iGtvdE+qJq7t97q8?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813662d6-664c-46ae-16a8-08d8c3657f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 08:19:56.1441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POLAx3PR6O1huQvQR+wvITlNhqBIw3RmYy/ElyEEKqQ6irESAin8rVL0YQMt98WG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3343
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: multipart/mixed; boundary="===============1240166673=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1240166673==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3022274A302C35FEF5EA3AE2A2BA9MN2PR12MB3022namp_"

--_000_MN2PR12MB3022274A302C35FEF5EA3AE2A2BA9MN2PR12MB3022namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

thanks comments.

I will refine these patches, then send out review later.

Best Regards,
Kevin
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Thursday, January 28, 2021 3:46 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; dri-devel@lists.freedesktop.or=
g <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx=
@lists.freedesktop.org>
Cc: Huang, Ray <Ray.Huang@amd.com>; Koenig, Christian <Christian.Koenig@amd=
.com>
Subject: Re: [RFC PATCH 0/3] add ttm trace event support

Not a bad start, but that needs quite some more work.

First of all please rebase on top of current drm-misc-next, a whole
bunch of the stuff you want to trace here was already removed or is
about to be removed.

Then concentrate on the necessary trace points, for example
ttm:ttm_bo_device_init/release are overkill.

On the other hand I'm missing important events like pool shrink, tt
swapout/swapin (ttm_bo_swapout can be dropped) and especially BO init.

I would separate the patches into one for each trace point. Not a must
have, but it could make it easier to review and we can discuss for each
one separately.

Thanks,
Christian.

Am 28.01.21 um 08:13 schrieb Kevin Wang:
> the kernel ftrace can better help analyze the kernel running status.
> add some trace events to support TTM.
>
> add trace events list:
>
> ttm:ttm_bo_add_mem_to_lru
> ttm:ttm_bo_del_from_lru
> ttm:ttm_bo_move_mem
> ttm:ttm_bo_wait
> ttm:ttm_bo_evict
> ttm:ttm_bo_swapout
> ttm:ttm_bo_device_init
> ttm:ttm_bo_device_release
> ttm:ttm_bo_init_reserved
> ttm:ttm_bo_validate
> ttm:ttm_bo_release
> ttm:ttm_bo_mmap
> ttm:ttm_bo_vm_fault
> ttm:ttm_bo_vm_access
> ttm:ttm_shrink
> ttm:ttm_mem_global_reserve
> ttm:ttm_mem_global_free
>
> Kevin Wang (3):
>    drm/ttm: add ttm bo trace event support
>    drm/ttm: add ttm vm bo trace event support
>    drm/ttm: add ttm mem trace event support
>
>   drivers/gpu/drm/ttm/ttm_bo.c     |  23 ++
>   drivers/gpu/drm/ttm/ttm_bo_vm.c  |  12 +-
>   drivers/gpu/drm/ttm/ttm_memory.c |   7 +
>   drivers/gpu/drm/ttm/ttm_module.c |   3 +
>   drivers/gpu/drm/ttm/ttm_trace.h  | 469 +++++++++++++++++++++++++++++++
>   5 files changed, 512 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_trace.h
>


--_000_MN2PR12MB3022274A302C35FEF5EA3AE2A2BA9MN2PR12MB3022namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D""><font face=3D"segoe ui, segoe ui web (west european), segoe=
 ui, -apple-system, blinkmacsystemfont, roboto, helvetica neue, sans-serif"=
><span style=3D"font-size: 14.6667px;">thanks comments.</span></font></div>
<div style=3D""><font face=3D"segoe ui, segoe ui web (west european), segoe=
 ui, -apple-system, blinkmacsystemfont, roboto, helvetica neue, sans-serif"=
><span style=3D"font-size: 14.6667px;"><br>
</span></font></div>
<div style=3D""><font face=3D"segoe ui, segoe ui web (west european), segoe=
 ui, -apple-system, blinkmacsystemfont, roboto, helvetica neue, sans-serif"=
><span style=3D"font-size: 14.6667px;">I will refine these patches, then se=
nd out review later.</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;segoe ui&quot;, &quot;segoe ui web (west =
european)&quot;, &quot;segoe ui&quot;, -apple-system, blinkmacsystemfont, r=
oboto, &quot;helvetica neue&quot;, sans-serif; font-size: 11pt; color: rgb(=
50, 49, 48); background-color: rgba(0, 0, 0, 0);">Best Regards,</span></div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;segoe ui&quot;, &quot;segoe ui web (west =
european)&quot;, &quot;segoe ui&quot;, -apple-system, blinkmacsystemfont, r=
oboto, &quot;helvetica neue&quot;, sans-serif; font-size: 11pt; color: rgb(=
50, 49, 48); background-color: rgba(0, 0, 0, 0);">Kevin</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Thursday, January 28, 2021 3:46 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; dri-devel@lists.f=
reedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freed=
esktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Huang, Ray &lt;Ray.Huang@amd.com&gt;; Koenig, Christian &lt;Chri=
stian.Koenig@amd.com&gt;<br>
<b>Subject:</b> Re: [RFC PATCH 0/3] add ttm trace event support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Not a bad start, but that needs quite some more wo=
rk.<br>
<br>
First of all please rebase on top of current drm-misc-next, a whole <br>
bunch of the stuff you want to trace here was already removed or is <br>
about to be removed.<br>
<br>
Then concentrate on the necessary trace points, for example <br>
ttm:ttm_bo_device_init/release are overkill.<br>
<br>
On the other hand I'm missing important events like pool shrink, tt <br>
swapout/swapin (ttm_bo_swapout can be dropped) and especially BO init.<br>
<br>
I would separate the patches into one for each trace point. Not a must <br>
have, but it could make it easier to review and we can discuss for each <br=
>
one separately.<br>
<br>
Thanks,<br>
Christian.<br>
<br>
Am 28.01.21 um 08:13 schrieb Kevin Wang:<br>
&gt; the kernel ftrace can better help analyze the kernel running status.<b=
r>
&gt; add some trace events to support TTM.<br>
&gt;<br>
&gt; add trace events list:<br>
&gt;<br>
&gt; ttm:ttm_bo_add_mem_to_lru<br>
&gt; ttm:ttm_bo_del_from_lru<br>
&gt; ttm:ttm_bo_move_mem<br>
&gt; ttm:ttm_bo_wait<br>
&gt; ttm:ttm_bo_evict<br>
&gt; ttm:ttm_bo_swapout<br>
&gt; ttm:ttm_bo_device_init<br>
&gt; ttm:ttm_bo_device_release<br>
&gt; ttm:ttm_bo_init_reserved<br>
&gt; ttm:ttm_bo_validate<br>
&gt; ttm:ttm_bo_release<br>
&gt; ttm:ttm_bo_mmap<br>
&gt; ttm:ttm_bo_vm_fault<br>
&gt; ttm:ttm_bo_vm_access<br>
&gt; ttm:ttm_shrink<br>
&gt; ttm:ttm_mem_global_reserve<br>
&gt; ttm:ttm_mem_global_free<br>
&gt;<br>
&gt; Kevin Wang (3):<br>
&gt;&nbsp;&nbsp;&nbsp; drm/ttm: add ttm bo trace event support<br>
&gt;&nbsp;&nbsp;&nbsp; drm/ttm: add ttm vm bo trace event support<br>
&gt;&nbsp;&nbsp;&nbsp; drm/ttm: add ttm mem trace event support<br>
&gt;<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p; 23 ++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo_vm.c&nbsp; |&nbsp; 12 +-<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_memory.c |&nbsp;&nbsp; 7 +<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_module.c |&nbsp;&nbsp; 3 +<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_trace.h&nbsp; | 469 ++++++++++++++=
+++++++++++++++++<br>
&gt;&nbsp;&nbsp; 5 files changed, 512 insertions(+), 2 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/ttm/ttm_trace.h<br>
&gt;<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB3022274A302C35FEF5EA3AE2A2BA9MN2PR12MB3022namp_--

--===============1240166673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1240166673==--
