Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC00750B59
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B253B10E553;
	Wed, 12 Jul 2023 14:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EC810E553;
 Wed, 12 Jul 2023 14:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMPDXfsZtI12Yc1MADegdOKKh2n//TbC5upcP1OoieV/S8I+yVLfqpU9TI6Fz2NKg7uS/m+09IvWx+D3grzE6JjzN8lPjBlONl7Pxoqd5AJoIL1i4XY37zVkgcrRspi6ZeLwyjdbiuU1Kq5VGACiniHwqFnDFKe92E60QzMpTJJsOpPWdMHFp55Lwu2nYe7pJnOJr4FB0+1pLKxKQA+3hbuH8zOIqokV4/M8jJnNoKtQczST2qd39uxbVbchwJct8gpJy/dtxLhmBo31VvMR/TnPiuhbd3J7Hoa8YmHEyXmktWMfUSmo6W+AOirZ9GOWECWTf36k36EFZEkCxbh0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vkKIQP0ZQUNg79P7C1KQBD1MsoTr5ja9Dr7V298MUQ=;
 b=Sh2SQtfYlGRu9PNpSh/3jlZVbFRA0hqNUpsxhdoPcWxPUkrbhTcd66qtXFAxxsyo9TbrwUGPXVarsnn0btGIKuDPHVH0XyhLve4gGGwutSBwtW1sauGgqPix3UtBqoJd0ohSp18ynE4n3ClC8heT+FcAUYWXlOCHVyWnBp7Nzz9dW+ut8w60rT9hcx4KhAt0FapZDNZQcsx5ZiSri3GIGDfFvp9gycRowAwJbI+EN7MdLHOlQ2g3ij9VMKxPLAgr7tGlrbtNjrqRU9GxhJMAcbo8UYvJBigXQA/bHnmebKdmKQGl9uv02XofISv9fM8rPc74jAPwTUi7XR7KtdtkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vkKIQP0ZQUNg79P7C1KQBD1MsoTr5ja9Dr7V298MUQ=;
 b=f8gOQVT451g396ZC8Bm4gLfVPqbevOeXpksu9d6PzaP6Beqy8HeC9wLRac1jG5m9ex+aRrL7PNSYDFdcyxRulHJSAA/Mn9ziX0KoDkVjxG+q5c4jGt0BID3ok7kHhwEwbF9IyVwoc7y/K8/6EsmrjsW0HmYAq6sBsJ4M9NjRUJA=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by SN7PR12MB7321.namprd12.prod.outlook.com (2603:10b6:806:298::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 14:47:49 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::e02a:b0f7:e051:10cd]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::e02a:b0f7:e051:10cd%5]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 14:47:49 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Patel, Swapnil" <Swapnil.Patel@amd.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
Thread-Topic: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
Thread-Index: AQHZrQR7pijLbOIjQUGXEp6zXMKek6+072YAgABRvgCAAP/MJg==
Date: Wed, 12 Jul 2023 14:47:48 +0000
Message-ID: <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20230702164407.6547-1-gpiccoli@igalia.com>
 <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
 <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
In-Reply-To: <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-07-12T14:47:48.043Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|SN7PR12MB7321:EE_
x-ms-office365-filtering-correlation-id: 7802079e-cff7-4255-90b5-08db82e6f65a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRK0UcXkuxfMLysqvXVVfEiHV42pagwAGaclMG6o9N5TAP3rDVSOqGZKJrbGjTL+e9DoygLGO/EsnEF5SrgxZD/rHyXIODjZmhjeLbp+Ka2QGmvESwJ8Wz1UGTAStvHjAgj+3ukzI58MbqMB0GqA93Htn3GwxixEWHThS56QWU8IRJkZAyYbWrUMytVXgTSMardV/AfZ4cXOKgOtvAXlaXsKV4cNMLorcEgy6JJPbnu0v2Osn8F9X9Rw9DXsEV623u8F6fOWPTHA8ZwF91CyeLcGkF9X+QmWkcbh+Lcl1cXdMs7IAbcn+kDD3I7BHPSWaujMZoctlfLf6g05M6Jt8BViWcOHdQg82NJIGC6syM8xyJzQEmsy6Ke2YhJMqyUKGBDFdoXx9YLiSn8GzyYBgupjaBr30q9zNpDWQugZts0LfYBm6tvzOBvp4CG1oDnX4GaLuVyKihaFBdarVZ+cGurYufQPbsIw9fkmoU6bYWHUZH7Hcx20/2RWkIY98sg0nLLY203DGqIkGsj4Pzqy3e1HFjfMd2tuxWIqCcOQvt+knqlxM68TAF0CTBTyb+XkbLQxjLbdZNhFWwkl0y4+NruB1uXYWt44tJhpQDUnIZ1DCh3dzXC20r8thH0uze54
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199021)(55016003)(186003)(26005)(5660300002)(2906002)(52536014)(6506007)(53546011)(83380400001)(91956017)(71200400001)(478600001)(110136005)(54906003)(316002)(41300700001)(9686003)(19627405001)(8676002)(8936002)(66476007)(66556008)(66446008)(76116006)(64756008)(66946007)(4326008)(6636002)(7696005)(38070700005)(33656002)(86362001)(99936003)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aV2WAOMdbywO+SNI+icC6Kl1ernXYTUPjsg7fdS9tyD/qXjNzHREH6+atv?=
 =?iso-8859-1?Q?7hYPh221CikGbOgW0FcufdkZ01B1L2UM1TyLHh4MXbcEa2xQb0WWfKyJiw?=
 =?iso-8859-1?Q?8e8Dduk9QUvI79JOGhv9eLtafMGOX1kE/ts2n/9NE2g0TYMZNbm5lyLnJT?=
 =?iso-8859-1?Q?0rO8vQRz1Wm+WJNsOFm/imcvPoiFgAdoyZ318zDM5H4D5kLSWTldAuLw10?=
 =?iso-8859-1?Q?6UKaUqZL/IohUaRBK8EJmeSAx6BnQjHNAiXHL2u3j6F7D/JSWjFM4gVSBs?=
 =?iso-8859-1?Q?DV5i4dUsoIzcf/w9tfmzrvzv/+zMjg9rERAJB2RGnjYJrKuaddTwB4p4uF?=
 =?iso-8859-1?Q?nndW0M7MQHWPPnzu6ks/QPospioARA0m4Z83GVHbTQLXr1XkMpPopQnkfv?=
 =?iso-8859-1?Q?I0m/TrziGOssvJBWxPEL2NuB7sFNLdF9nsbgVycA+VHc6IZt1HlSVVOHKD?=
 =?iso-8859-1?Q?jCghM89ubrG0fphJO/ARWOZeaP+b9Lh/Pr3XLUUkJCsRAnMcE4GmQd6p5w?=
 =?iso-8859-1?Q?6EADR5H8s29kl8Z6K2jSQ1c+yB8pnL9w9XdqxZuEUlouCo60kQSpnmG+aV?=
 =?iso-8859-1?Q?eFHDcu5Huzibhe2OumUDBPfqGELC79jIL0vykKNbAN8I62rAGdycx3WJID?=
 =?iso-8859-1?Q?oWfy2wtIc3xpy1PO4CS1m0U608h82e4JMrZwXBhy7g/ZGcf2icTTWnxIO8?=
 =?iso-8859-1?Q?p8qV+KdsGgzzdVttUCUuq54Bmf6TxbHTW/MzV21dBLHrSUoE8IeMlMLls0?=
 =?iso-8859-1?Q?MTwje9ICAbzVAnecsnMOjSTYlWvfuQn8axTL4z4LUETfzhZrCO4NdLFCl0?=
 =?iso-8859-1?Q?Kzxe6sqlKuLlO3rvv4y62+AJ7U7YXw4sHnQ+thJWPQvBoFJ6suOCczC38k?=
 =?iso-8859-1?Q?Db4raqIUMu90ltrWIc7u4jPZzzADdUhfkr+0JoLVHw4tS6CG01kHr7G0VT?=
 =?iso-8859-1?Q?m3KQ+Mq0taQSg1w+PiZ+yWL/hJ+JENPVgdZlXZbx/GWO0/8Xpq+OfMBVGd?=
 =?iso-8859-1?Q?o5aftVX1NXmHLXqNW4YpefJ2LV7aAgav60KSyOoWYvqnk2zaNRlop0wbpI?=
 =?iso-8859-1?Q?9b/LOGL3lWDr7wobgGTyaDPUJT92XTpRPpCSs+5nVz18C5yTic1uUkC0lP?=
 =?iso-8859-1?Q?t/Pua1I6oRFaOgesgiO9X3fBIwZtpcSozkmTV4lFHJmgYmdJm01kxm7t6Q?=
 =?iso-8859-1?Q?x9UH4kUFuE47BmUy2PblqDKbnOyUrVf1ZfC3LuwyyCVhaSE4DLTAD0mRp5?=
 =?iso-8859-1?Q?kgtUa/rg3T/W9YskRm3Ne0Uq/qoIewz6oMGHe+uxZtCMlCSE310YgTXjBx?=
 =?iso-8859-1?Q?Omm1G+gNxoMWG+1mFwNWh2V6/jF984uZt/eCF673+IzaAwhJr192ajpz9W?=
 =?iso-8859-1?Q?GCcZJIBzSBSRC7wADvDpu/JH/g/jyeyPyUDSG56BWJKTLZs0Miq+4PIzI3?=
 =?iso-8859-1?Q?gBM5/pHcbKUh0auqgvcL5h0vLikeN7ud38M4/6ueO/xDru2GffcWLkh/Dj?=
 =?iso-8859-1?Q?tXpoZ6UY2v5ioSGX9LSdOXCVsVkybar/MH5MtOlejOyh2WFbzDvkOCvVi6?=
 =?iso-8859-1?Q?HgIChNQsYiCdLTLrHgYDV67+irfpxHcJDkEtrXqok794kAogRfmzBSr8QT?=
 =?iso-8859-1?Q?2P+0htiiliZZE=3D?=
Content-Type: multipart/mixed;
 boundary="_004_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7802079e-cff7-4255-90b5-08db82e6f65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 14:47:48.9907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcDvQAGKFsSWfTmGC6N6MHs7M6XmVNfrB2GfeOBES5FcmYLylwf6eClZHaUAg1Gk2tGv67P98b6NKaanAFECzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7321
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
Cc: =?iso-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "cristian.ciocaltea@collabora.com" <cristian.ciocaltea@collabora.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_004_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_
Content-Type: multipart/alternative;
	boundary="_000_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_"

--_000_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[Public]

Hi Guilherme,

Sorry there was one more patch which I missed to attach. Please add this 3r=
d patch and retry.

Reverting that patch would cause high power consumption on Navi2x GPU also =
cause hangs on certain multi monitor configurations. With these 3 patches, =
you're getting the same effect as reverting the aforementioned patches, but=
 it makes the reverted sequence available only for Steam deck hardware.

--

Regards,
Jay
________________________________
From: Guilherme G. Piccoli <gpiccoli@igalia.com>
Sent: Tuesday, July 11, 2023 7:15 PM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, =
Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; dri=
-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; kernel-dev@=
igalia.com <kernel-dev@igalia.com>; cristian.ciocaltea@collabora.com <crist=
ian.ciocaltea@collabora.com>; Andr=E9 Almeida <andrealmeid@igalia.com>; Mel=
issa Wen <mwen@igalia.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max se=
lectors unconditionally for DCN1+"

On 11/07/2023 15:22, Aurabindo Pillai wrote:
> [...]
> Hi,
>
> Sorry for the delayed response, this patch went unnoticed. This revert wo=
uld break asics. Could you try the attached patch without reverting this on=
e ?

Hi Aurabindo, thanks for your response!

I've tried kernel 6.5-rc1, and it seems the issue is present, due to the
patch being merged on Linus tree [as 1598fc576420 ("drm/amd/display:
Program OTG vtotal min/max selectors unconditionally for DCN1+")].

Then, I tried both your attached patches on top of that, and
unfortunately, the behavior is the same: Steam Deck doesn't boot with
graphics, and we can see the single error "amdgpu 0000:04:00.0: [drm]
*ERROR* [CRTC:67:crtc-0] flip_done timed out" on dmesg.

Do you / Alex think we could get this revert for 6.5-rc2, so at least we
could boot mainline there while the issue is handled? It would be an
intermediate fix. You mentioned it breaks some asics, but did they work
until now, without your patch?

Thanks,


Guilherme

--_000_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;font=
-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi <font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0"=
>Guilherme</span></font>,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry there was one more patch which I missed to attach. Please add this 3<=
span><sup>rd</sup>&nbsp;patch and retry.</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Reverting that patch would cause high power consumption on Navi2x GPU also =
cause hangs on certain multi monitor configurations. With these 3 patches, =
you're getting the same effect as reverting the aforementioned patches, but=
 it makes the reverted sequence
 available only for Steam deck hardware. <br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Guilherme G. Piccoli =
&lt;gpiccoli@igalia.com&gt;<br>
<b>Sent:</b> Tuesday, July 11, 2023 7:15 PM<br>
<b>To:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Deucher, Ale=
xander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Pan, Xinhui &lt;Xi=
nhui.Pan@amd.com&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.f=
reedesktop.org&gt;; kernel-dev@igalia.com &lt;kernel-dev@igalia.com&gt;;
 cristian.ciocaltea@collabora.com &lt;cristian.ciocaltea@collabora.com&gt;;=
 Andr=E9 Almeida &lt;andrealmeid@igalia.com&gt;; Melissa Wen &lt;mwen@igali=
a.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] Revert &quot;drm/amd/display: Program OTG vtota=
l min/max selectors unconditionally for DCN1+&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 11/07/2023 15:22, Aurabindo Pillai wrote:<br>
&gt; [...]<br>
&gt; Hi,<br>
&gt; <br>
&gt; Sorry for the delayed response, this patch went unnoticed. This revert=
 would break asics. Could you try the attached patch without reverting this=
 one ?<br>
<br>
Hi Aurabindo, thanks for your response!<br>
<br>
I've tried kernel 6.5-rc1, and it seems the issue is present, due to the<br=
>
patch being merged on Linus tree [as 1598fc576420 (&quot;drm/amd/display:<b=
r>
Program OTG vtotal min/max selectors unconditionally for DCN1+&quot;)].<br>
<br>
Then, I tried both your attached patches on top of that, and<br>
unfortunately, the behavior is the same: Steam Deck doesn't boot with<br>
graphics, and we can see the single error &quot;amdgpu 0000:04:00.0: [drm]<=
br>
*ERROR* [CRTC:67:crtc-0] flip_done timed out&quot; on dmesg.<br>
<br>
Do you / Alex think we could get this revert for 6.5-rc2, so at least we<br=
>
could boot mainline there while the issue is handled? It would be an<br>
intermediate fix. You mentioned it breaks some asics, but did they work<br>
until now, without your patch?<br>
<br>
Thanks,<br>
<br>
<br>
Guilherme<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_--

--_004_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_
Content-Type: application/octet-stream;
	name="0001-drm-amd-display-switch-to-DCN301-specific-TG-init.patch"
Content-Description:  0001-drm-amd-display-switch-to-DCN301-specific-TG-init.patch
Content-Disposition: attachment;
	filename="0001-drm-amd-display-switch-to-DCN301-specific-TG-init.patch";
	size=1255; creation-date="Wed, 12 Jul 2023 14:46:56 GMT";
	modification-date="Wed, 12 Jul 2023 14:47:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlOTkwNjlmMWIzZGM5NDliNTM4MTE4MmZjOGI0ZTBlZGI1NTFhZGNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdXJhYmluZG8gUGlsbGFpIDxhdXJhYmluZG8ucGlsbGFpQGFt
ZC5jb20+CkRhdGU6IFdlZCwgMTIgSnVsIDIwMjMgMTA6NDM6MTEgLTA0MDAKU3ViamVjdDogW1BB
VENIXSBkcm0vYW1kL2Rpc3BsYXk6IHN3aXRjaCB0byBEQ04zMDEgc3BlY2lmaWMgVEcgaW5pdAoK
U2lnbmVkLW9mZi1ieTogQXVyYWJpbmRvIFBpbGxhaSA8YXVyYWJpbmRvLnBpbGxhaUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMDEvZGNuMzAxX3Jlc291
cmNlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMw
MS9kY24zMDFfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24z
MDEvZGNuMzAxX3Jlc291cmNlLmMKaW5kZXggMzQ4NWZiYjEwOTNlLi4xYmVlOWE0NjM2ZTYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMDEvZGNuMzAxX3Jl
c291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMwMS9kY24z
MDFfcmVzb3VyY2UuYwpAQCAtNDIsNyArNDIsNyBAQAogI2luY2x1ZGUgImRjbjMwL2RjbjMwX2h1
YnAuaCIKICNpbmNsdWRlICJpcnEvZGNuMzAvaXJxX3NlcnZpY2VfZGNuMzAuaCIKICNpbmNsdWRl
ICJkY24zMC9kY24zMF9kcHAuaCIKLSNpbmNsdWRlICJkY24zMC9kY24zMF9vcHRjLmgiCisjaW5j
bHVkZSAiZGNuMzAxL2RjbjMwMV9vcHRjLmgiCiAjaW5jbHVkZSAiZGNuMjAvZGNuMjBfaHdzZXEu
aCIKICNpbmNsdWRlICJkY24zMC9kY24zMF9od3NlcS5oIgogI2luY2x1ZGUgImRjZTExMC9kY2Ux
MTBfaHdfc2VxdWVuY2VyLmgiCkBAIC04NTUsNyArODU1LDcgQEAgc3RhdGljIHN0cnVjdCB0aW1p
bmdfZ2VuZXJhdG9yICpkY24zMDFfdGltaW5nX2dlbmVyYXRvcl9jcmVhdGUoCiAJdGduMTAtPnRn
X3NoaWZ0ID0gJm9wdGNfc2hpZnQ7CiAJdGduMTAtPnRnX21hc2sgPSAmb3B0Y19tYXNrOwogCi0J
ZGNuMzBfdGltaW5nX2dlbmVyYXRvcl9pbml0KHRnbjEwKTsKKwlkY24zMDFfdGltaW5nX2dlbmVy
YXRvcl9pbml0KHRnbjEwKTsKIAogCXJldHVybiAmdGduMTAtPmJhc2U7CiB9Ci0tIAoyLjQxLjAK
Cg==

--_004_CH0PR12MB52846616C04D37205DD1B70C8B36ACH0PR12MB5284namp_--
