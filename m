Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1209DB82D85
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 06:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623D710E634;
	Thu, 18 Sep 2025 04:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="o7fS0tNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazolkn19010079.outbound.protection.outlook.com [52.103.2.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AAF10E634
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 04:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVk52exmEPZE1FUtwa9fboJwtx6mVTrNHlhERFDP6UvuVRhv3yL8r9EBXlTE8rpEc9Nc24I/PIsM0ZL3CRppXeEVY3ul3aUGmrdVfHw/eno2+n4h0EPHsKd5S3HaHOzq3rQduu3Vdd9l4gfRskdBJ8QOWv/HrmdBWPF+ixPC2PegctIW3LdzIspgpJAndhA8abu/R7NNTgWTAUYaFKn9jLscbDihiRLJLMbakn55oT/bqKIc06gVQ+hqhtdS1uesVpYEtw+i89VQX28PousfVQjoSZ8mZOAbmlsBya9vH8MlCNJkaSf9wuHacbvuR1F+dnmvxkpzGBMhMj23eRCovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jb/Kv2yq0IeXO3nfVstZgRVmmHoidvgO/QKfjO2+Zs=;
 b=QmneixkMme2/4g8f38Pt3hXsuLCNgAOwCRl+YPEMX3CuP6TueJCYx1NErZ01Cet7SeF853RD06aD1m7gdkzQowXPUtZ3D2/79akK2IqXI6rE5+aRb6W9gB4O8dYKn8R5Wtpi06qzBDposKBZkBBc03I7dYTfWTa/9ePWPhOxBEC+WhgPHzQfbsW+FvsodgA9ax62ZPSaa/0o5NquENEJYOnqgkDMAleCp2+x8eu+wygaL3OAhse9gBWSBcPAgMjAds7CdhRCHHRjXTQPUmZuiK+FPo0EEoo1JWkt5afN0BJBoly2vQHVCPw2MzU6Q5cqoMPqSRoDmClfHVQjohPu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Jb/Kv2yq0IeXO3nfVstZgRVmmHoidvgO/QKfjO2+Zs=;
 b=o7fS0tNiJJbueDvzSFAl5RbVJFYg/yZUOq6TZseiWPoUtlNUSRW/tLAjZjGbzVtSK/d9Np+kObnyKMMHAOjkOZaK0vnTIrlzIr8TryOdWAi52XNIeI4ibyljXjJFEeTSzlSBYVo1M8DHl6uvN7/qB/rHY6DvX39oanfxUedzbpFKYcOgACtlnHWq6s/kWXi0qW+rP/XJDsDdozZbFGhRvXCM/byM0giCLDgMau3EtI42f9UW0wtr0DSYayAytPrHGxNUIy9vgO0zXCMN3Gf+FdmXbxHy9kMIL5qPloTlAOnoWFy9faVu2wEJfj2WOaobJ5nReSFDk8gt2AUMZbtWoQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by PH7PR02MB9409.namprd02.prod.outlook.com (2603:10b6:510:277::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 04:03:57 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 04:03:56 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "gonzalo.silvalde@gmail.com" <gonzalo.silvalde@gmail.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "decui@microsoft.com" <decui@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, "deller@gmx.de" <deller@gmx.de>, "kys@microsoft.com"
 <kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>
Subject: RE: [PATCH 2/2] MAINTAINERS: Mark hyperv_fb driver Obsolete
Thread-Topic: [PATCH 2/2] MAINTAINERS: Mark hyperv_fb driver Obsolete
Thread-Index: AQHcJ9vcHu9UfVHK+U+yRNCQQHHQvrSYUhCA
Date: Thu, 18 Sep 2025 04:03:56 +0000
Message-ID: <SN6PR02MB41578029C68F14D6EE010840D416A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <E5C2A201B1BD>
 <1758117804-20798-1-git-send-email-ptsm@linux.microsoft.com>
In-Reply-To: <1758117804-20798-1-git-send-email-ptsm@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|PH7PR02MB9409:EE_
x-ms-office365-filtering-correlation-id: 5147d576-d09b-486a-d597-08ddf6686387
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|31061999003|8062599012|19110799012|8060799015|13091999003|15080799012|440099028|40105399003|3412199025|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?sn6DBwQAqlRrArF5qPwd3ebkC4L/MRJ9UHfYdok611tXIVk4r9QcHrRsJvRP?=
 =?us-ascii?Q?aLabxJuym20d//Wtj0An4Ybv9+spL0kYqdVcWkBzsP4XMTRLRL8A/JajUjet?=
 =?us-ascii?Q?6brhT0SvPiejGaL8DUGOhQsuZMvtNpPa/5N371OLhlHskzfWAI4eQAua90aW?=
 =?us-ascii?Q?PwS46lUkKSm1QaICssmrAGxIBVxuhvFkt1Wb/mB9eONLbmqllQRysOaQ7YI8?=
 =?us-ascii?Q?bs9aIGx5+xSJgKLYy895sGqLBmE8bCgEpVcozMAgS0cpiU1SV8Jz8nelS1j5?=
 =?us-ascii?Q?TZgeNmFgBjoIB5LbeEOBRwNlEQVw2MpUhmSjasgxA9VAVqbpi6L4PTJssAOv?=
 =?us-ascii?Q?QGvnt2gnWzYJ9Mmh7ClnaAOTtHgPa+lZa1TQ1Hn8zr991U9Upr0qTgplcD+A?=
 =?us-ascii?Q?bSIL6Q5apXNli8jtnkj2G3SQS2Sy5dVjfhbui0M+fMm/4OM6PasimO5jHD9I?=
 =?us-ascii?Q?lkUCroxD5+fBtDz1VLTtKbqEpSVouFchCn8Ef2T3mAhrmMb30+SThJgXwz3W?=
 =?us-ascii?Q?WJHbbRADO+3LugvKtSyCn42vo9h7r6F3hnHOmRGGJr7AUjlq9HpbbumedKkY?=
 =?us-ascii?Q?KEKVHSFT+0WcXH+DK5leLAIONQ32sfU2eoGdPXFm1DTdilfUG5ng2FrhL34Y?=
 =?us-ascii?Q?xk1XAQA/DuDpE/9tYTcn/ufmgGo+MyQVv4EhZ8Jfr2M2rzdB9jkH2WK4JrOD?=
 =?us-ascii?Q?v7Ou8SlJcIfv6iEU+k9eoqgf37/vjQNde70O8FTJu6m6xPl1XSTReLkfsxVm?=
 =?us-ascii?Q?2GYeCljRugQISW6o+FNQXADyTPlUOS7SuffGFZXepaoowOl0kxbxLLUmZ0dH?=
 =?us-ascii?Q?eP25/vRx8oBMSR+zHdL7IdrmqXCz0PLBLQ4iCseETVN7QKOKrn87UHiIdbpP?=
 =?us-ascii?Q?1prB7qWZ/u/fZVUb6ExY2iWE0BAETJTyhCz66gvfbTxUAu13H3+kThRSrgkk?=
 =?us-ascii?Q?R8WAooKv1XidXYsrf/Jpp0uPp6QO/lY5PEG8TZGpW3oncZyvjelWKNOTxLxp?=
 =?us-ascii?Q?NUyi4N7DUEF4c9btxIXXayTPWwASgU5b/hsPXQuVP9SQ40t6C2scXOAsLK+u?=
 =?us-ascii?Q?x8dqhs39BcFMVjjYj5c9h2oTxGXvKrNM6dhFh56H3hkCrF3vARSSadfyT21V?=
 =?us-ascii?Q?jVbDSaSJl9QChi4mn85ScHTmKP4VdeyvOkbeOZWfyFDfcyq3xnbGZu0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AThIfgCZSyJl5fyUyqYjyTTart51DkVQV+CA1MggMIVGOcEwF2LBIRYOnRuM?=
 =?us-ascii?Q?5lHP1iGnQR3wgMqYIhgFGeJ54eYFrGoQSHIH6zIdWPtewgvGkd6ziMeVsthE?=
 =?us-ascii?Q?oWtUyhH7n9MtVXWxQv5gJUdFf+LBgUGn3N7MFgmxWT+wXpeBm9M5g/d07hk0?=
 =?us-ascii?Q?/d/2Qbq6H5vkpTDTREheqx3JPgDEhhxgGpJIgoCN28SLKho+VuFMMklQc6ck?=
 =?us-ascii?Q?ZtjH8/gT8kjJGyTLdVpCQICgeD28lF5V4LDhkpjbKwXDNQmis06TEN5GSXsK?=
 =?us-ascii?Q?OnPeG3C9dhvH9EQ+dFJw3i8g1LxHdaEygf/uusSMvncjTaWj2XFyfz0e+A06?=
 =?us-ascii?Q?LYEcBauFTMYsW48HrCYHZpEKfDa2/icmGThwegNNKVzHbTV3W5plcwfVJ8Ec?=
 =?us-ascii?Q?e7x4h61Bp5sQTuI2LaIKNm7R+JELJm04beuiY4E9xjB2ClF3ZOeHMX8IDBZb?=
 =?us-ascii?Q?cB7m+i58x/C7OpsyopQ0geNgKqLzAfARB8OA6r2UeYrufty0aH4d+edO3sqG?=
 =?us-ascii?Q?7tzplhIo3hnByoUnRlhRhe/TjIsnmgpab+QYA4y4Ri5xsk2mM9citGGaVDBa?=
 =?us-ascii?Q?6mOMd8oZyW7LTuUTH7LfkW5rWLvZslKy3xrHjEMIJ1QwBCAzcgEVWgZEAY5F?=
 =?us-ascii?Q?xQvIakbunJATw6rVhC2IBm3Gc4pk9Dv1gvecBdMjUdfwJk0NnaFd+Aqnpdxn?=
 =?us-ascii?Q?/p4efZCw3d19eES4U8rSKi8xA5pKnm0lBOOl2pH9GYtGSOY3IvuMCLGkWLi+?=
 =?us-ascii?Q?9vIhVyplLK38KpVGWe+4DRIaYKMAh2da+BTQ43U7v2fW17cgHvp2sROTdFM+?=
 =?us-ascii?Q?zZWwME0V9cDdyraxfzPPblG/Ape/7hQNTp+oPa5RN5aED4ByTUx2Ey0TIne7?=
 =?us-ascii?Q?kN8yKu3HetIUTB2YLBarDWZH73Dn53n090ANNoMse3nddLdkjonI4A936Qib?=
 =?us-ascii?Q?79oPAPA6lpzI+4klec2I1Wc2tqkfRpBr6SgcsvDnpZhnTNR1iMsn++5K3tls?=
 =?us-ascii?Q?5FdZirTToysElxY1Wk6GalYWVSi11i/DtNYiAFnSGsQK7hOc8eNxYTXjKll9?=
 =?us-ascii?Q?Ah94lfnOtuLEkGatC+35VvxgkCsth77jLDsRyAS0xlm3JWj/4Hi7ilmYE19b?=
 =?us-ascii?Q?LM7Ncg7sqwSRA1cKItboSIl1gVo+1L/9Ck8eNhEQ9x3UlXAMk2HmeU+QLwIe?=
 =?us-ascii?Q?J6A2K40WeFck9wateYyACDa15/DLL5pvSIMtKqHWoUAEywxEmDt+jsvdfU8?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5147d576-d09b-486a-d597-08ddf6686387
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 04:03:56.2892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9409
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

From: Prasanna Kumar T S M <ptsm@linux.microsoft.com> Sent: Wednesday, Sept=
ember 17, 2025 7:03 AM
>=20
> The hyperv_fb driver is deprecated in favor of Hyper-V DRM driver. Split
> the hyperv_fb entry from the hyperv drivers list, mark it obsolete.
>=20
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  MAINTAINERS | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f6206963efbf..aa9d0fa6020b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11424,7 +11424,6 @@ F:	drivers/pci/controller/pci-hyperv-intf.c
>  F:	drivers/pci/controller/pci-hyperv.c
>  F:	drivers/scsi/storvsc_drv.c
>  F:	drivers/uio/uio_hv_generic.c
> -F:	drivers/video/fbdev/hyperv_fb.c
>  F:	include/asm-generic/mshyperv.h
>  F:	include/clocksource/hyperv_timer.h
>  F:	include/hyperv/hvgdk.h
> @@ -11438,6 +11437,16 @@ F:	include/uapi/linux/hyperv.h
>  F:	net/vmw_vsock/hyperv_transport.c
>  F:	tools/hv/
>=20
> +HYPER-V FRAMEBUFFER DRIVER
> +M:	"K. Y. Srinivasan" <kys@microsoft.com>
> +M:	Haiyang Zhang <haiyangz@microsoft.com>
> +M:	Wei Liu <wei.liu@kernel.org>
> +M:	Dexuan Cui <decui@microsoft.com>
> +L:	linux-hyperv@vger.kernel.org
> +S:	Obsolete
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
> +F:	drivers/video/fbdev/hyperv_fb.c
> +
>  HYPERBUS SUPPORT
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
>  R:	Tudor Ambarus <tudor.ambarus@linaro.org>
> --
> 2.49.0

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

