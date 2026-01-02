Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121DCCEF184
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 18:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F610E279;
	Fri,  2 Jan 2026 17:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="rghlxYEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azolkn19010016.outbound.protection.outlook.com [52.103.23.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7981410E279
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 17:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1NfX+rSw6SlUDqXkbcsyPWgQwv3zmjXtS5nKJlmcD1x8/yyFfyl21cb83f0m/rGMdNaea3UkjlVuBHt7d8yyA1k0LgJ2oLpxaYx/hYg1RGNGdhJ0u0iq7uwQM6ZjDLB1F6G2NaNOzZd+BcYW/mOrXMIolADT6pf5GDNyE6YXKc598/YR9FtLgBLvV12YdhXEI1afnpWVk60hPhN+2jYcV0IxJlg67G6bMiTeS8sMa6eptIUo2VwDbLvyoAmuH0hPh+YZ6Tm9RLiMZFJkO+3BcZ6UwE9MarCEQSZZVgrQB9cw3cJuKuA1NUP6duNUwqwANYKHETp/y6WqkeTMpVjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgChXg1Za3S5JZQIcciz3uAFotB2qUPB9LnZoOl1ZS4=;
 b=LJALIKeLQjbd0cDeKxoQ9NeTzW/+RzyvjCqBv7QACPdkfal1IfdSiJAy+dgICT3x72oO9oUzsMWhky+VsawkEgWit38MLckpBol80WwAFshlnc8BSHFtEBshqzEL9bnDvV4zFkFnIPTM/EJSK8wuPyG7ehJA6+Gz/yPuLUSmgN3RUoVaX25NGT5rhH1FZVHOfvYNSKLFyvgtZdsPiz3/o8gcpe52kL5+jS+g1Hh7XGQxiwWnBqOAv4EUYCKSuLmKGav/P9E9S/HAPjUPYRJFPuwyibjKB2J63Qd5LHW++x5nNzHbF/n02H90ykGw2aDPgXIt+ql26qX23vqkcDU7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgChXg1Za3S5JZQIcciz3uAFotB2qUPB9LnZoOl1ZS4=;
 b=rghlxYEH/ikdWJIhGZER/sQDtkCCsMMZ/IYXO1f3Xh0uKpka3sd8cunlNIv/0fokzbuP0S24zZmf4JkJe22mmavpwuJ2KOhvU++s8OrQmJ3rKmX5FW95FPFfF4pZ7WFI8ZKaDM7B05/aePOloMX2e1bi0/rUDBNWX2a1OZVLQ0K2BdYTnv+nfPvRW38mpbOR1jxknWJpNLo9SeR5Nz+MR2RS3tM7VeAOjrt1xRoN4UemMu/osYP/wOpGK4ZgC8GaWr2IGNNE56/gJsIc2L3Ga6mz65Q1C1jIOAj0wrhhWpmXxesDZ6HGPRKWqmk+XEoqV0gNcEQIfp+4HxGc5ttXWA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB10991.namprd02.prod.outlook.com (2603:10b6:8:28f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 17:45:58 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 17:45:58 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH 3/3] drm/hyprev: Remove reference to hyperv_fb driver
Thread-Topic: [PATCH 3/3] drm/hyprev: Remove reference to hyperv_fb driver
Thread-Index: AQHcdunFyA3QdruH1k2rBCYe50mOa7U/Lxhw
Date: Fri, 2 Jan 2026 17:45:58 +0000
Message-ID: <SN6PR02MB4157B6BD98B5E96A1360D0E2D4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
 <1766809906-26535-1-git-send-email-ptsm@linux.microsoft.com>
In-Reply-To: <1766809906-26535-1-git-send-email-ptsm@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB10991:EE_
x-ms-office365-filtering-correlation-id: 598116f7-9cfb-4a61-0fbd-08de4a26c9c3
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599012|19110799012|8060799015|15080799012|13091999003|31061999003|461199028|440099028|3412199025|40105399003|52005399003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?6dCTb/5KYvFYKH9jgqZZ3nPGx/aJ257JbdHwJVOlXpTcALbdOJWkfXJkhnTz?=
 =?us-ascii?Q?KdXBn7tB7cufSN18hv+ARdNvEG3j87dwbzH5+2ygrpX/ZsySye8AN9/fZMNo?=
 =?us-ascii?Q?vihLCmOsYRkpiF9sCS9ygY1qJFRGQSnFxsEJG0SJLGPufSHUOrgCRHfAlFTM?=
 =?us-ascii?Q?IxHzXBSrv5JdoRmXzP9eh4L7DEe8l+MaECTiRnyfZeTKtBY53RjCvQuwfYkj?=
 =?us-ascii?Q?qptPZamLeEGdORZ+c2Zl169CgNTooFj5xsOedwA/TAJf97i4gTsGBEyIW3x+?=
 =?us-ascii?Q?zUacG4txS+DQPVNavxtt6FAY7UWsdahE5CNCA4u7DSXTzridhdn91S/qas1v?=
 =?us-ascii?Q?F1ubkQwy7pVK1OvLCy46zLiPe00/MiqHjBA92hn/BGnPp/oe7czRQzKpB0K0?=
 =?us-ascii?Q?MuQE3xUOcD2nvr51klahSxd2mPGFM14YNWJ0eA238dmagjwZ8Xc2fd3EMe9m?=
 =?us-ascii?Q?Kv0nU0J/8uITr5QqMTIxpR8ez/xKCwndRl20tm4VWITep1ohLzt/tyhKj34j?=
 =?us-ascii?Q?hnBZUiwugk1+Sv0BfakAG0naX6jfIldKLRCXbNHIFFqh4G2qOg6PldcmEDLX?=
 =?us-ascii?Q?tGOwFtswREuzxy3wslxrLcKC/8Mj4cc7sj0Xz7TvyPz0K2jnacH5o0iEjr82?=
 =?us-ascii?Q?ASix+vkotWG7rTUoc9n8cjvG7Ia2MF6gCCRKwDeHW7UzBt7SpG+lr4JDASbu?=
 =?us-ascii?Q?5byr6aCaN45G1B2oCPXZPyON2LF/sH4pnuxokVBGWheIT0/TLbTtfEaOiKAN?=
 =?us-ascii?Q?R8y1Al4WCxbjWYfVW+fa6BQD6M01S9FBPnZO/wa0EFaRvopgIHblekDdpk97?=
 =?us-ascii?Q?aM55aqIfDYSf9qQ7vLlcMfEZNk5nHPsP6Q8sNVsJK/bnIBePhIjMyBjo5Wyd?=
 =?us-ascii?Q?t7+9saBfSmefAOxabz8i5/W2x007PP47p0maRX/uMwPTOIU1YFVwY0OrygRk?=
 =?us-ascii?Q?kQYw/UUSD7Y6WDpwCV9hgJIHaAC0B9dlimjYaQ0juSg0AjXbsp28rNDOA1WY?=
 =?us-ascii?Q?R9QIyoExC+zRuvSjH9qqqv3Kr/g/1kbIZ+h4C/2Ki8J8jJQvJ4CVwKhBBiH7?=
 =?us-ascii?Q?bkFP3OhVYsZJsXRiYVw09VoI7ke94Bb6ilnhSiw2B9C4VWGJxnA5+HGn1W4C?=
 =?us-ascii?Q?GrWSQZCBrUPOkS43dUX8JZHPD58kd2qQc9ricTx55BfA3Q0WPH5U70siV34K?=
 =?us-ascii?Q?QX77bhDbDUaI8vajdTUMvyK1aa6j4q/PwFlDIw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e1uSO203YTvtreVWrt9NhpDkyRkn8GWx9tkuHh3Lw4joFaiwHa5t0U1JHBty?=
 =?us-ascii?Q?OdHCV68Vg1QUXTDpN3fRywsc17bmEVQ6KG9jp7tfSouZaScHHj5fUirKEtxc?=
 =?us-ascii?Q?wjz2bpwaZhciK8JWbEPAu6gpojl/1S6/v6ll00Eh0dQ3PcqiewdCcyxO8QJi?=
 =?us-ascii?Q?hKKWPbq6sZHzd3Q2FjrWDm6CFwxhpcnDhEpqP5CqLp5mDqIqL4M9H4YPY03h?=
 =?us-ascii?Q?r9q+TqHmltOsXEeLWQM5QNyIHQmxl99npRZabmzzxMY9GDHvbJTCDVxtFqkF?=
 =?us-ascii?Q?bI3Hk5Xd1bQCDsB6ezC4NiA11yXi9uiZNvDxEkSRFkQBdyJ1N+OtKKqOdfkl?=
 =?us-ascii?Q?0ZM3KVLc2nShDCfkncp4anhGBcQ2/ZwcudM2nACRA6JIxrJhqf+2xzaFzS9p?=
 =?us-ascii?Q?UGiqa3lF4p4JxTrgkMBxUrYXubmpIW8pIAmiSI7CwVUVe6Ut0ArPjOl0N6S5?=
 =?us-ascii?Q?XxDCWPieQAdPm1UAPrIH1bVOrmdKLrOlAvzU1OmCO92E7rWTjJfizSe4/hUe?=
 =?us-ascii?Q?BybHF6Uhfi0broDRqo7/D+qEJDFZAZyC5M/e6PUrlCkceenAi+YR7zEoIcyi?=
 =?us-ascii?Q?qF621KFsE9P+dCkWAcI25QhBvut9Sv1JTs4KL+kdNZtdB5MDU6l8T/f2xL1P?=
 =?us-ascii?Q?2k8LBTItE/dxuE1qYdI8Rjyd98JSo7pbZaZX8vnV7L0enHKjP3ebKhKzVa/u?=
 =?us-ascii?Q?WXsjF3ISReyYkRBDSdWuGf5qL9lZGYi8p2rgaG2/87pVOXoTuNwYA+RWxM6J?=
 =?us-ascii?Q?ACUrLfk8mFXsIhzD0p9+6cG4p55n40U1QZmFV8u8Ivo3p+zaMqPVGFlCJlvk?=
 =?us-ascii?Q?Bix0SaWr9h8DovqKO7nwYplMyzn76k/KkxbiEphUknJ9ZC21Dr1fDuVYg1Hu?=
 =?us-ascii?Q?T+B3NSsLoSZP7etJl0d7VHclQse1gGt8XHF2Ec6WmNPCZeqKFV8wPWhA8VcO?=
 =?us-ascii?Q?wcIYcRiyIpKpAu0D6NubrrdgZP7ZPMSWQ3fYrSqsy8uoZCyLuodH8g5wLh6m?=
 =?us-ascii?Q?NA10ibYkeIwiE5+fVA6aw+TgVdysb9iCfqmyBec09P65VFkkrUoQNkQ8aT+n?=
 =?us-ascii?Q?PTmo379bSef1min+/9xHL6LUh2ozn2HSiuNlwN/CGMke3WNmYvgZ46JVMISy?=
 =?us-ascii?Q?mvHNBPZX/VPRVbDESgdc65D76gmoLtYoPmf9xLeKVEhzTzHtTdsOr+BA951m?=
 =?us-ascii?Q?BvoD95unGfySel+CNJxxnLgBC8suXgCf6Uwf4zwomNyKHSuzPJrkhN9Fm2fv?=
 =?us-ascii?Q?bQU6JWWhaMGUfQSHXTFbzLTRTLTFM0P85kcz4kCIPwKT/t/Xl06jTT/LmYlQ?=
 =?us-ascii?Q?yKjH8EnmJ3dvGOW9JIqgk9ZJ2/InFv3RSQ6MsI0s+frRxYlYLLwELIoWIwZR?=
 =?us-ascii?Q?4LmDyYQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 598116f7-9cfb-4a61-0fbd-08de4a26c9c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2026 17:45:58.6454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB10991
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

From: Prasanna Kumar T S M <ptsm@linux.microsoft.com> Sent: Friday, Decembe=
r 26, 2025 8:32 PM
>=20

There's a typo in the "Subject:" line of this patch -- drm/hyprev should be
drm/hyperv.

Michael

> Remove hyperv_fb reference as the driver is removed.
>=20
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/gpu/drm/Kconfig                   |  3 +--
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 15 +++++----------
>  2 files changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7e6bc0b3a589..01a1438b35a0 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -407,8 +407,7 @@ config DRM_HYPERV
>  	help
>  	 This is a KMS driver for Hyper-V synthetic video device. Choose this
>  	 option if you would like to enable drm driver for Hyper-V virtual
> -	 machine. Unselect Hyper-V framebuffer driver (CONFIG_FB_HYPERV) so
> -	 that DRM driver is used by default.
> +	 machine.
>=20
>  	 If M is selected the module will be called hyperv_drm.
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> index 013a7829182d..051ecc526832 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> @@ -1,8 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright 2021 Microsoft
> - *
> - * Portions of this code is derived from hyperv_fb.c
>   */
>=20
>  #include <linux/hyperv.h>
> @@ -304,16 +302,13 @@ int hyperv_update_situation(struct hv_device *hdev,=
 u8
> active, u32 bpp,
>   * but the Hyper-V host still draws a point as an extra mouse pointer,
>   * which is unwanted, especially when Xorg is running.
>   *
> - * The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted
> - * pointer, by setting msg.ptr_pos.is_visible =3D 1 and setting the
> - * msg.ptr_shape.data. Note: setting msg.ptr_pos.is_visible to 0 doesn't
> + * Hide the unwanted pointer, by setting msg.ptr_pos.is_visible =3D 1 an=
d setting
> + * the msg.ptr_shape.data. Note: setting msg.ptr_pos.is_visible to 0 doe=
sn't
>   * work in tests.
>   *
> - * Copy synthvid_send_ptr() to hyperv_drm and rename it to
> - * hyperv_hide_hw_ptr(). Note: hyperv_hide_hw_ptr() is also called in th=
e
> - * handler of the SYNTHVID_FEATURE_CHANGE event, otherwise the host stil=
l
> - * draws an extra unwanted mouse pointer after the VM Connection window =
is
> - * closed and reopened.
> + * The hyperv_hide_hw_ptr() is also called in the handler of the
> + * SYNTHVID_FEATURE_CHANGE event, otherwise the host still draws an extr=
a
> + * unwanted mouse pointer after the VM Connection window is closed and r=
eopened.
>   */
>  int hyperv_hide_hw_ptr(struct hv_device *hdev)
>  {
> --
> 2.49.0
>=20

