Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55859C84F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 21:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9EAA05E8;
	Mon, 22 Aug 2022 19:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD543A05CD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 19:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5vqb2pLdGOp2YG3WV0mkhPPn7oLeV/ef6UFSrAOErEzS2WXpadR1uGZbrJksfm21TUNWPvwv7N7ou1+VJoRTNfZwSjhH01Ugr5ImCSTfdEsxDM0yBor7tnBAfOKXCDSkjEMQbj0uHt1pZ0ilomg2exlgd3v/5e5AKr9l7MfkJvZVAPywGKp2dGTwWWWtZtBbxok9Zy29GnYhmBI9W2aNMb5E4DIh/aC1NjwQnPAlMA2LPlU2ZxYR8eW2Q2v+iRdCTPPAhBLZvnTf/Xx0PEoXJEcAOxKYEIe+sISuKjUlI+PexWm33n0lJVMcfblqBbPmKcnS1+c5YGcW5pNxkaY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArfLVpMNm9lqgRey5P11Zuo45l64ixfqDVScOXCpEAM=;
 b=W6dRYh1dbsxhdTKvnu8PNKe/ZlhGMPk8TIPRf2EA3Ob0ZFLmB+sWaVEpdCXadYCenL1c7SSafAQW3Wb5mlg6rzIvJa6MtHimAbnBps0DTGNq6ffdnYDSWSfeoPrJCuo5q4wdQrE7SjdaO/O5r/VlOJd2OarMVrhPcourPX5/q7hS0kBrFB0IZlcG4kiI9CRbVDvwGNjVm/mfDokCZZc65yZxKZxThWzYy7LcraVJbof++QS+7r3hvcUAdYl5gY0AgHtD1Ycq28OjGHZwDJJKfKL+c2ZMIxnKFSd8OAG4jnuiuAUZ3FOYanyOYLNMv9o/y1NWNV7pdcxbzAjkvcdnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArfLVpMNm9lqgRey5P11Zuo45l64ixfqDVScOXCpEAM=;
 b=bvtce5AKD1/xVsdrmK10TFKYMD08xYTOWmK9AvBX2wOkg3bZRYUGZBoGZcbbnUcsqw/jpkC9RatjYkByeyj8ZDI3EAm8SgLBWutwI9hvSiyVldEEAOz9NQMOpaSYhGe8VhuLuZjwaZ+l/jRLPMXD0i6RU7ZACRqB7NAG2xcfL+g=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by DM4PR21MB3584.namprd21.prod.outlook.com (2603:10b6:8:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.2; Mon, 22 Aug
 2022 19:00:06 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e848:505e:d1e3:97a0]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e848:505e:d1e3:97a0%7]) with mapi id 15.20.5588.002; Mon, 22 Aug 2022
 19:00:06 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: vkuznets <vkuznets@redhat.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v1 1/4] Drivers: hv: Move legacy Hyper-V PCI video
 device's ids to linux/hyperv.h
Thread-Topic: [PATCH v1 1/4] Drivers: hv: Move legacy Hyper-V PCI video
 device's ids to linux/hyperv.h
Thread-Index: AQHYsw5aBuPcAfExyEmwNR3ut6To9a27SdJw
Date: Mon, 22 Aug 2022 19:00:05 +0000
Message-ID: <PH0PR21MB30259340B9E6BA09DED4CEC4D7719@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
 <20220818142508.402273-2-vkuznets@redhat.com>
In-Reply-To: <20220818142508.402273-2-vkuznets@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=e3a54f7a-ba55-446e-a07e-0ea306424494;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-22T18:49:53Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffe6a53b-4467-46b2-9fb2-08da847086c5
x-ms-traffictypediagnostic: DM4PR21MB3584:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jMHEjpSQ8bADLD3255tlKyZ5kCK6c3udNTz5xxsPtfkAn0no/sgFXQtgtZlzuugz4JXISGxJtYarJPn1QqGeZ17LuFtZitKBIoE/eI7r26w6O7iJg6xbOqXVoqXE7CeRLJQH//LbxeiCUOEr8CNJH6bpeiAQ+uOrWMt28TG0XtG9fv2KfnCuyL5JVd8vgYEmBrECnwVb4a+UO2+W7teKuA47a2RPJe/hEVW9yXjlto4Ksn5wUb/aALtum+GH9XyXMtY21I+c9SmL7oykUVqp2s6yVsMAKMDN7E5ZC4A5OXXY7zThXacIUStMo25cy1tl+rH7sggNCgcimfyaHYMSqeqzkK/OzsKTQCmrv8mxGyhjfg9GmafqFz8Bs6e14lDO5721mQsGPN19hly5MQMOXKhuDaoyj2w4219be8xY5Ezu7cDuhHUVE+lv5UCvj203ZYJ/BWDvOo+y2XpEbKcOcl/Odym2no5hbUNRBK4T8jxJrJgSNV8GFwipefkM6Iq36vxdFWLDEtGU3dAJL0k2ViZfc7Y7DcEgB1/mR1dinm2JsPW3ExRUKm3cCQjW6hUGOerD3Qf4pCbbsQGxFgCNizNczCkpbsNOMXhzxugZeEXp4UymUEC6J2Pnjo7DrjTm9/bLt94oGg/u9WfeSOxd6a40iI9HGdOeP8KQxg+OKdYSaDwW8Tk63kYAtilJUeJ+Pc32F5EDRQr77eBe+bqskq4+ZFfM6yLH4EdQSWOOLbQJRAcH71+ZmMLsHiBquWSNxwcqGbfq3pKdjoAp95nKbnDP/W96Cb/fLn3qtjv53aaCJLYsD+7VKQOP/wK/Xlky
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199009)(52536014)(64756008)(38100700002)(55016003)(66556008)(33656002)(66446008)(8676002)(76116006)(66476007)(4326008)(66946007)(5660300002)(2906002)(7696005)(41300700001)(478600001)(6506007)(8936002)(86362001)(9686003)(26005)(83380400001)(38070700005)(82950400001)(82960400001)(107886003)(8990500004)(186003)(10290500003)(316002)(54906003)(110136005)(71200400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iZbX12LzeVo/fX88YYa/lsxO2pHqTqHLTmRcfxcZ4YBVCQu2Q3M5CoHv/Pm3?=
 =?us-ascii?Q?ak79NZJGclykkToFZyoJFNEjLyHpK5Hpg1vi94qsreOL6AKvY754NkxjYXdS?=
 =?us-ascii?Q?8iH5V2Vz5qj0j8JywMO5WvkGZJNJSFeA8niZ4zQ8zJt5zXBXo0V5dxPX0aLX?=
 =?us-ascii?Q?yFT39ATPIyojTBL4QrEIbxliIJUWKfVqbunPKJS4pvLNUpuZJRS8oPsrutX/?=
 =?us-ascii?Q?SDl793v3XC62qS8LAPyHDPSNU3LizVj1w20kDiYGJ5BOeEpxbe4bnjY5Ycox?=
 =?us-ascii?Q?loqJuQIGoF4+/0TavvwQY/HvUyWsVIrX54KmUcPe+C/Q0JEH9p69uX7kto2i?=
 =?us-ascii?Q?UjxGGWaNWaKrwqnqV4H+6wzw1di4d6LhWLrHctIpYyl09s+wLbSD07WUXixk?=
 =?us-ascii?Q?kKTFC7eN1zsiVtGloy2/1jpmg0zTr+v7B72Z3NKOQp9UbC9bKKoqZOJlofYI?=
 =?us-ascii?Q?s2MSgqcPbRgMBE3TwE8DstcOda5PhJyXXJM/FVb6sapoAZzyD+3tdOgeeaty?=
 =?us-ascii?Q?970l4WU+VVyPJ+yteopqxYNYO4DbnfXhuCW5u2WfkCqbTJTr7MwX3qMkzHTW?=
 =?us-ascii?Q?7gP3DBFA30Y//Lp+INjAyT6yJ7qCQiCar2mjLiQRG14yK0fKujXMnePrpb0v?=
 =?us-ascii?Q?b5F+aNoRtDDoiXe8k6lSrTd4ou6szfp1xS2ThE2MknmBk2/Mdg3pJ5E557UK?=
 =?us-ascii?Q?5Z2KL6ulUGBNSf6QAyS/LUwuDOP7Z+QtAE0SVJwg2XZ0sIVYulAOuvZQK1o9?=
 =?us-ascii?Q?f5hN15zqWjyVp656jboSBD9HjxZlDSCudgpAd54bz3y3CTeStOvYB0MMhr1m?=
 =?us-ascii?Q?0dhLWzvtX6i6V0HtL3GqtBwpLM0jdq6RjboOZhK3C5AklzUrrYyvrGIre9Yl?=
 =?us-ascii?Q?f92PQkZdAIv+iYbPoP7U8VFL0MbiRx6Nnj+RpRNkuLHIaBe4n8nRckwhqfVl?=
 =?us-ascii?Q?TGIYJibTpUgTNjrwC+fRiqJYi2RnYK9krMYY2k16aNZlOfXiqdaSk52Rrd3p?=
 =?us-ascii?Q?poPHUQ9ZmkkyAc/uidsJuKyZ3Y2x//cLC6MRQYdHWHR67eWzY0iu1q2fHtyS?=
 =?us-ascii?Q?5wooN93/lXxgsPsHP0SZA6yUQsG9XaOUV2RV+fjI/lHw/MCamIvy8DON4Zcg?=
 =?us-ascii?Q?28FhDtwlbW9vJSD2oktGU4YRz9EjJE2oOtk5qVrC39NcKLPqg6nC4AyyPTKc?=
 =?us-ascii?Q?f+UaGVcqfexIu06QbRrCZIKgLsIMgBdblTDsPawef+8O4ra5tzcljCy2T8qH?=
 =?us-ascii?Q?x1J+GRs8fjnk2zYeMSUJA+szEk0il9CbEZ8i3P4pHgK29WOE2NHpbqYPHvNg?=
 =?us-ascii?Q?Y9rsJ9Zq7RXM6BNaaIU3knoVP06Ve5hmdU/L0wlm2012PNC5UnojZ6vQdx2F?=
 =?us-ascii?Q?2PhOpfuxfjCk6zqOr/0uO06/W9bvFEEP24q/JNaYdM3rn8QsjQ0wcPhvLXBT?=
 =?us-ascii?Q?5H3CmD1Wk88AjtV6D7fN+rWz6PaqO+3mBFlND3BTzwBOAdyLCMUMVfuFjNnZ?=
 =?us-ascii?Q?2j51FebqFqgZYRyCUPTX3phnTspeBUd0Fy89g/wGHfLzgI+XQ0igwGyyACeM?=
 =?us-ascii?Q?D72B6Teitw+skEYjBGO/5H7lkzSJ1hfmsg0R1wWLMLJIkjqY/0uQO+JQMDVL?=
 =?us-ascii?Q?LA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR21MB3584
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Thursday, August 18, 202=
2 7:25 AM
>=20
> There are already two places in kernel with PCI_VENDOR_ID_MICROSOFT/
> PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these from core
> Vmbus code. Move the defines to a common header.
>=20
> No functional change.
>=20
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 3 ---
>  drivers/video/fbdev/hyperv_fb.c         | 4 ----
>  include/linux/hyperv.h                  | 4 ++++
>  3 files changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 4a8941fa0815..46f6c454b820 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -23,9 +23,6 @@
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>=20
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
> -
>  DEFINE_DRM_GEM_FOPS(hv_fops);
>=20
>  static struct drm_driver hyperv_driver =3D {
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 886c564787f1..b58b445bb529 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -74,10 +74,6 @@
>  #define SYNTHVID_DEPTH_WIN8 32
>  #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
>=20
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
> -
> -
>  enum pipe_msg_type {
>  	PIPE_MSG_INVALID,
>  	PIPE_MSG_DATA,
> diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> index 3b42264333ef..4bb39a8f1af7 100644
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1516,6 +1516,10 @@ void vmbus_free_mmio(resource_size_t start,
> resource_size_t size);
>  	.guid =3D GUID_INIT(0xc376c1c3, 0xd276, 0x48d2, 0x90, 0xa9, \
>  			  0xc0, 0x47, 0x48, 0x07, 0x2c, 0x60)
>=20
> +/* Legacy Hyper-V PCI video device */
> +#define PCI_VENDOR_ID_MICROSOFT 0x1414
> +#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353

I've never looked at this before, but shouldn't these move to
include/linux/pci_ids.h with all the others?  And we've got
another #define of PCI_VENDOR_ID_MICROSOFT in
drivers/net/ethernet/microsoft/mana/gdma_main.c that
could be deleted.

Michael

> +
>  /*
>   * Common header for Hyper-V ICs
>   */
> --
> 2.37.1
