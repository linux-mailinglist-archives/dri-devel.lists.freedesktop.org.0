Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B0783968
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 07:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E12810E2D8;
	Tue, 22 Aug 2023 05:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C18010E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 05:36:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzpKdR5zIrV0wXR7r3LEfG45sPVJhXnegpiMa7UvXDX3E8wYL5bjnuYz9RamUYbTpFD2f3P9mvM8oVkZruBFaTNGZb3AXb66r7CSjjH3SUzLJnbENFPWogNXyUVTZ2NtmsyQE0g+Qapc1sg0xjjGlEjHwNmXPPLYmK7tVpmRpWsiY2VueJJKyboO+mVok4mO6GbC+y/0kBK84qGlZksPTbTV8x2OVTihGe8ngJdFJT4WxHkz0CNBBRG6GNYTpSPH2a0Rzg+aBUuNbXxNYzqjmc+kCs7/pJFRTo+rUwLVo2L/sjmWsZO04jkBVKfNYq+TCDmoYr4GebqpWF0NeBtDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/UFYwgVDt/SgkYJl+DgEdrjVujtj+yen9yD2FjzFJ0=;
 b=ns9UVwUI2nWGPO/6nagKYWyCpRhxgLRATwlWuNp8cVbX2PTlYJC/rlmRpE3A/ksg/r8flHlVAhuTp7Kpodgw0fk26+EbRh0Nv2aFru3no2EolYNsl8gr3v74QocCy8fN+Al2eBPZYM/VNSKIwvylOT5UOd8aY4hzRwp7dtqFtxCvyLvYbl2TvhTfMdsm8wC/n45qqn+6xdRz2LVEvMjVV36bVzxuzXoKX7jLbycxBSD476vbwhYu5moyOumfAwF9CN3oj1UXP/9awF1YD1tu+1LOk3X/+EqfHRWr8dNZcwBfwIoVKIye2DAYdnDyyddzpAvmBMvPrFPF9CNEhl2Awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/UFYwgVDt/SgkYJl+DgEdrjVujtj+yen9yD2FjzFJ0=;
 b=abm2KzdvTL2kLrosjechFaCVE0e+tbnggUCDuhjVVvcSHzH/pfM4Ck/jCQyvYHWQtpEcASyr31W3S+ZGk96PbkR5vm+TyoW/uQr5m98b+gs5GALNiN2b8rQ8fAJaoiHNQ+6nn8BLKD8bXwZBctdqPGMk6su/vO/DG28HB6oAGds=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:36:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:36:14 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Topic: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Index: AQHZIZK391aAnd1BtU2IGNfkhc3wq6/3Lu6A
Date: Tue, 22 Aug 2023 05:36:14 +0000
Message-ID: <AM7PR04MB7046E7F22B817FC6FE8DA95A981FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
In-Reply-To: <20230106055056.2883302-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS8PR04MB7656:EE_
x-ms-office365-filtering-correlation-id: 4049913b-f9e2-425e-8e4e-08dba2d1b355
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KAV7n76xZVMY8zUHgahExwDs+BEThJ0RjeIIDxw9cVcIvpAuexz0X6DkQo0LobmSqUGD2pa8/isvTvtfsT/gaNtbmSvsjpN57BInYntKC9tXA+4ajsvOA1ibqiCPe6qHGVWE/ldFDab8ZanP6+/OMB6gaiN2cHLzI01lnE+gn7+Jr9RALYLVNnzxdyr9cwFzAyn1Kgc21ZhanpzfA6JcesphNUbfIXKuF3ndbdKRRG3B+Y54z79y0I2E0XAtliMpUmnGiblb510WXYuW7SLZEnzkbHv9UHfrZ1jzy6GggKzuoeGpol3umFCBVmTbzH+pC6s+twpFShnS8WiTFr9pOr//XIC0uJ7NgMfz2G3NR6uriNCXVmnR5iBOoSNZi0bOFeHrYOK2b9bkp3gw7dLXuq2pVRJ8M/sJwIV5i7xRL7PuSXnoUAtGIWLlj0KYWm2I5gJlar1b2MC60HsQPuuR6zTpmmm2J2XoOHcOG6VMj7MWkFhgWf4lkTqDmuOwqFHtMROK6zPHgspobY+vP2XMVdTFw3Ilc4hq0FZg/HqdLEqWlFfUJg4Ko9soDNohMcJ+wd2Zc6pKsxTQ7kX4C1BzBeG77NfUR/cFK+JWnIgYmqM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(54906003)(66446008)(76116006)(66476007)(66556008)(64756008)(316002)(66946007)(9686003)(66899024)(110136005)(8676002)(8936002)(4326008)(41300700001)(122000001)(966005)(478600001)(55016003)(71200400001)(38070700005)(38100700002)(53546011)(6506007)(83380400001)(30864003)(2906002)(7416002)(86362001)(7696005)(5660300002)(33656002)(26005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WRsuTXrzpzQALTohf+ru/H+dSuc9ZdLWzZnL23Ct+BijGxmmSwE66rsj4+?=
 =?iso-8859-1?Q?3OL/yuUnTdXkvuOtachS/oJPAYZaccwNWfEv39tRPbP8aUla5EX37YDt3l?=
 =?iso-8859-1?Q?YgmTvl9YzATlPYzaiL1gNhXbkqubzwAnKjTXbo7QnLcq62Z2Jll/x/WUAJ?=
 =?iso-8859-1?Q?8koRECpF4eBy2Kp8CBc5chp9rrDzoh8S9K/Sae07pWeGw3/blaJC6B8PIZ?=
 =?iso-8859-1?Q?dmiWSQRbt0EqYPOvHFfVLM3fzxNvXBolahlnGrCVUYAZL7GkS1ISzm/+3C?=
 =?iso-8859-1?Q?IYASq+vTL98VUYJk8XopgIDKRUUU3vofzRScnf20OXSbOHU9HnIkn5r/BW?=
 =?iso-8859-1?Q?9yE2oIBmLcAsHVHJwCEHTZYflQtZVNpMZypdorjgJEtWNC3j2DLUXmVgMb?=
 =?iso-8859-1?Q?zL5tzc2YRO9/HBomoWfC1XWGLzYP/GgRkoFS4rrDddtEOZjQ6gHdrMnYcM?=
 =?iso-8859-1?Q?nY6hl1WTZqp+j4Vu7Sk18qVPzF61L2dQ40Eshk1c25mQxQ6HraG6dsCXsQ?=
 =?iso-8859-1?Q?IrpzO+ncTAV3o6HqEnKRj/D0+XLUSQSEg150Th6Yhlo1LyLtov9M33/E9O?=
 =?iso-8859-1?Q?THNetnvXAou0oBrcWR1TYrrWoi+tp6iAPmYKDA5KVFJlJRW1IFrQvPBoSq?=
 =?iso-8859-1?Q?Tr2qM10dfjFtkug9e0xDq67exw6tDvCzaGm6glJtk3MGJrvqKINV+jpdCT?=
 =?iso-8859-1?Q?7rAKI3TOyIQOdlsGyyDNDpSNqSwJ7rMCTksELYW2MoVWT+sEbFMbZxnRoJ?=
 =?iso-8859-1?Q?mKYmTk6gpgFv9xTSHFWdWPov9ezbFhH8nKYw6ITckqjVUbaOZR4cqqNUxv?=
 =?iso-8859-1?Q?AVZ7wYQL0Y31CbmJlz9LJl9cQHw2UxgYq7jN79WFVWM/f1Q/2uTLw5txCW?=
 =?iso-8859-1?Q?WYghsQie1Re0wY6WMCmcGNX1Qc9g2ESbGp3rxdJYfpGvgdrCOKQsc7uD5G?=
 =?iso-8859-1?Q?vD2scbYgA5lFWgQe0TaX8kuyQ7e5AZklUEI8kxW5PHuIP80UJleFFCaCiY?=
 =?iso-8859-1?Q?erf8+HjHL1UJ+3qFuEYB1XszALT46n6hDe3Qvf5X6KttdyrlgB03TOMvY0?=
 =?iso-8859-1?Q?5CQf0mjeDjnyHQTtiFmrpRTEmd7TZQ6ilnXnXE1LU/nUMqY2LxDruLu4Wr?=
 =?iso-8859-1?Q?eyNmnNvxdck2BujcRPofTXV8FIiF9gHEkJjMa5QwS2QsTLMR5+MidxFVlB?=
 =?iso-8859-1?Q?sMI/n1myxQfQG/22zFAo69CfKdOBLpwW8GdzD/rEwcwvM6BQTiYUXRg62j?=
 =?iso-8859-1?Q?KScWQZhFpQz51KO6nkB5s+VYEGpyI2BmhDQsHCWqjnwFLho0Kv9orXl09T?=
 =?iso-8859-1?Q?y7L06U69VDFY4KIF4+tWVpDhBYeYQ+XbwHnmYQiMK8K87C/Sml1exR4ELF?=
 =?iso-8859-1?Q?eJmvY1AfhM2B3hSyOJNFNg3dtyJxmR50kz9bkupx2VkeZwLua6pSYm+GCH?=
 =?iso-8859-1?Q?jtlScCqAp/dusbLOwlIeDacRcYe7Dbq64mxlA1+SC5pcXwwhWfJ4M+BtZC?=
 =?iso-8859-1?Q?Jtu0h06NRdSLxp1vk2lbvgj+YDu8EZsg6uhZK01+J/YRE5++8FNrL9j7P6?=
 =?iso-8859-1?Q?LxQixCEFQc5HQYJfXA+4ogvLz+IGM6p1yoiGzBgtwmU7HEYnnDtyOXWn7m?=
 =?iso-8859-1?Q?25LMZW2WLmKoA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4049913b-f9e2-425e-8e4e-08dba2d1b355
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 05:36:14.3102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: My5RFvcQnDPv8GhI//wJh4kNfDXEW3QRXh9jX18CcAbzuuH0a3QRDSdSXOB+vbrH8QKtpkGuPFgHQ30E6rqSCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <guido.gunther@puri.sm>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> On Friday, January 6, 2023 1:50 PM Ying Liu wrote:
>=20
> Hi,
>=20
>=20
> This is the v14 series to introduce i.MX8qm/qxp Display Processing Unit(D=
PU)
> DRM support.
>=20
> DPU is comprised of a blit engine for 2D graphics, a display controller
> and a command sequencer.  Outside of DPU, optional prefetch engines can
> fetch data from memory prior to some DPU fetchunits of blit engine and
> display controller.  The pre-fetchers support linear formats and Vivante
> GPU tile formats.
>=20
> Reference manual can be found at:
> https://www.nxp.com/webapp/Download?colCode=3DIMX8DQXPRM
>=20
>=20
> This patch set adds kernel modesetting support for the display controller=
 part.
> It supports two CRTCs per display controller, several planes, prefetch
> engines and some properties of CRTC and plane.  Currently, the registers =
of
> the controller is accessed without command sequencer involved, instead ju=
st
> by
> using CPU.  DRM connectors would be created from the DPU KMS driver.
>=20
>=20
> Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
> Patch 4 is a minor improvement of a macro to suppress warning as the KMS
> driver
> uses it.
> Patch 5 introduces the DPU DRM support.
> Patch 6 updates MAINTAINERS.
>=20
> Welcome comments, thanks.
>=20
> v13->v14:
> * Rebase the patch series to the latest drm-misc-next branch(v6.1-rc6 bas=
ed).
> * Include drm_fbdev_generic.h in dpu_drv.c due to the rebase.
> * Fix dpu drm driver suspend/resume by properly get drm device through
>   dev_get_drvdata().
> * Use pm_ptr() macro for dpu core driver PM operations.
> * Use pm_sleep_ptr() macro for dpu drm driver PM operations.
> * Use DEFINE_SIMPLE_DEV_PM_OPS() macro to define dpu drm driver PM
> operations,
>   instead of SIMPLE_DEV_PM_OPS().
> * Update year of Copyright.
> * Add SoC series name 'i.MX8'/'IMX8'/'imx8' to dpu driver module decripti=
on,
>   Kconfig name, dpu driver names and dpu driver object name.
>=20
> v12->v13:
> * Drop 'drm->irq_enabled =3D true;' from patch 5/6 to fix a potential bui=
ld
>   break reported by 'kernel test robot <lkp@intel.com>'.  drm->irq_enable=
d
>   should not be used by imx-dpu drm as it is only used by legacy drivers
>   with userspace modesetting.
>=20
> v11->v12:
> * Rebase the series upon v6.1-rc1.
> * Minor update on Kconfigs, struct names and macro names for patch 5/6
>   due to the rebase.
>=20
> v10->v11:
> * Rebase the series upon v6.0-rc1.
> * Include drm_blend.h and drm_framebuffer.h in dpu-kms.c and dpu-
> plane.c
>   to fix build errors due to the rebase.
> * Fix a checkpatch warning for dpu-crtc.c.
> * Properly use dev_err_probe() to return it's return value directly where
>   possible.
>=20
> v9->v10:
> * Rebase the series upon v5.18-rc1.
> * Make 'checkpatch.pl --strict' happier for patch 5/6.
> * Add Rob's R-b tag on patch 3/6.
> * Add Laurentiu's R-b tag on patch 5/6.
> * Add Laurentiu's A-b tag on patch 6/6.
>=20
> v8->v9:
> * Use drm_atomic_get_new_plane_state() in dpu_plane_atomic_update()
> for
>   patch 5/6. (Laurentiu)
> * Drop getting DPU DT alias ID for patch 5/6, as it is unused.
> * Reference 'interrupts-extended' schema instead of 'interrupts' for patc=
h
> 3/6
>   to require an additional DPR interrupt(r_rtram_stall) because the refer=
ence
>   manual does mention it, though the driver doesn't get/use it for now.
>   Reference 'interrupt-names' schema to define the two DPR interrupt name=
s
> -
>   'dpr_wrap' and 'r_rtram_stall'.  Accordingly, patch 5/6 gets the 'dpr_w=
rap'
>   interrupt by name.
> * Drop Rob's R-b tag on patch 3/6, as review is needed.
>=20
> v7->v8:
> * Rebase this series up onto the latest drm-misc-next branch, due to DRM
> plane
>   helper functions API change(atomic_check and atomic_update) from DRM
> atomic
>   core.  So, dpu_plane_atomic_check() and dpu_plane_atomic_update() are
> updated
>   accordingly in patch 5/6.  Also, rename plane->state variables and rele=
vant
>   DPU plane state variables in those two functions to reflect they are ne=
w
>   states, like the patch 'drm: Rename plane->state variables in atomic up=
date
>   and disable' recently landed in drm-misc-next.
> * Replace drm_gem_fb_prepare_fb() with
> drm_gem_plane_helper_prepare_fb() in
>   patch 5/6, due to DRM core API change.
> * Improve DPR burst length for GPU standard tile and 32bpp GPU super tile=
 in
>   patch 5/6 to align with the latest version of internal HW documention.
>=20
> v6->v7:
> * Fix return value of dpu_get_irqs() if platform_get_irq() fails. (Lauren=
tiu)
> * Use the function array dpu_irq_handler[] to store individual DPU irq
> handlers.
>   (Laurentiu)
> * Call get/put() hooks directly to get/put DPU fetchunits for DPU plane g=
roups.
>   (Laurentiu)
> * Shorten the names of individual DPU irq handlers by using DPU unit abbr=
ev
>   names to make writing dpu_irq_handler[] easier.
> * Add Rob's R-b tag back on DPU dt-binding patch as change in v6 was
> reviewed.
>=20
> v5->v6:
> * Use graph schema in the DPU dt-binding.
> * Do not use macros where possible in the DPU DRM driver. (Laurentiu)
> * Break dpu_plane_atomic_check() into some smaller functions. (Laurentiu)
> * Address some minor comments from Laurentiu on the DPU DRM driver.
> * Add dpu_crtc_err() helper marco in the DPU DRM driver to tell dmesg
>   which CRTC generates error.
> * Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() in the DPU
> DRM
>   driver as it is done in dpu_drm_probe().
> * Some trivial tweaks.
>=20
> v4->v5:
> * Rebase up onto the latest drm-misc-next branch and remove the hook to
>   drm_atomic_helper_legacy_gamma_set() from patch 5/6, because it was
> dropped
>   by the newly landed commit 'drm: automatic legacy gamma support'.
> * Remove a redundant blank line from dpu_plane_atomic_update() in patch
> 5/6.
>=20
> v3->v4:
> * Improve compatible properties in DPU and prefetch engines' dt bindings
>   by using enum instead of oneOf+const.
> * Add Rob's R-b tags on dt binding patches(patch 1/6, 2/6 and 3/6).
> * Add Daniel's A-b tag on patch 4/6.
>=20
> v2->v3:
> * Fix DPU DRM driver build warnings which are
>   Reported-by: kernel test robot <lkp@intel.com>.
> * Drop DPU DRM driver build dependency on IMX_SCU, as dummy SCU
> functions have
>   been added in header files by the patch 'firmware: imx: add dummy
> functions'
>   which has landed in linux-next/master branch.
> * Add a missing blank line in include/drm/drm_atomic.h.
>=20
> v1->v2:
> * Test this patch set also with i.MX8qm LVDS displays.
> * Drop the device tree patches because we'll use new dt binding way to
>   support i.MX8qm/qxp clocks.  This depends on a not-yet-landed patch set
>   to do basic conversions for the platforms.
> * Fix dt binding yamllint warnings.
> * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm in
> DPU's
>   dt binding documentation.
> * Use new dt binding way to add clocks in the dt binding examples.
> * Address several comments from Laurentiu on the DPU DRM patch.
>=20
>=20
> Liu Ying (6):
>   dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
>   dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
>   dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
>   drm/atomic: Avoid unused-but-set-variable warning on
>     for_each_old_plane_in_state
>   drm/imx: Introduce i.MX8qm/qxp DPU DRM
>   MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
>=20
>  .../display/imx/fsl,imx8qxp-dprc.yaml         |  100 ++
>  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml |  387 ++++++
>  .../bindings/display/imx/fsl,imx8qxp-prg.yaml |   60 +
>  MAINTAINERS                                   |    9 +
>  drivers/gpu/drm/imx/Kconfig                   |    1 +
>  drivers/gpu/drm/imx/Makefile                  |    1 +
>  drivers/gpu/drm/imx/dpu/Kconfig               |    9 +
>  drivers/gpu/drm/imx/dpu/Makefile              |   10 +
>  drivers/gpu/drm/imx/dpu/dpu-constframe.c      |  171 +++
>  drivers/gpu/drm/imx/dpu/dpu-core.c            | 1044 +++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.c            |  969 +++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.h            |   72 ++
>  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c       |  117 ++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.c            |  715 +++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.h            |   40 +
>  drivers/gpu/drm/imx/dpu/dpu-drv.c             |  294 +++++
>  drivers/gpu/drm/imx/dpu/dpu-drv.h             |   28 +
>  drivers/gpu/drm/imx/dpu/dpu-extdst.c          |  299 +++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c     |  292 +++++
>  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c        |  224 ++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c      |  152 +++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c       |  610 ++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h       |  195 +++
>  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c       |  248 ++++
>  drivers/gpu/drm/imx/dpu/dpu-framegen.c        |  395 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-gammacor.c        |  223 ++++
>  drivers/gpu/drm/imx/dpu/dpu-hscaler.c         |  275 +++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.c             |  542 +++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.h             |   23 +
>  drivers/gpu/drm/imx/dpu/dpu-layerblend.c      |  348 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.c           |  804 +++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.h           |   59 +
>  drivers/gpu/drm/imx/dpu/dpu-prg.c             |  433 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-prg.h             |   45 +
>  drivers/gpu/drm/imx/dpu/dpu-prv.h             |  231 ++++
>  drivers/gpu/drm/imx/dpu/dpu-tcon.c            |  250 ++++
>  drivers/gpu/drm/imx/dpu/dpu-vscaler.c         |  308 +++++
>  drivers/gpu/drm/imx/dpu/dpu.h                 |  385 ++++++
>  include/drm/drm_atomic.h                      |    5 +-
>  39 files changed, 10372 insertions(+), 1 deletion(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
>  create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h
>=20
> --
> 2.37.1

This patch series has been submitted for a quite long period of time.

Anything I can do to have it landed ?

Regards,
Liu Ying

