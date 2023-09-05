Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A579202A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 05:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE2610E161;
	Tue,  5 Sep 2023 03:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2210E161
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 03:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRVm8lRU62hVM9dVCqKwRdzlRymQKFMzWrqxRCLFcvNBMpmWSfiZznb7ztQqQwofIbhrSae7TSGdL8aIcpG7/PPXH7YlbWPeVu9kBeBGHvMBtC6wy3R+cSzwbrKUwFuHmyjTCVwp635ej5GBiiZlnss0U8O/Qm9A6B1CRmowHvZICeLgTgqykciv9yN2ncVLNGdDa/9/vSrGdLE7XSoNR8ae9dui0YYpgBHtxQtiLspp/KoSILLWLsoV37zk8HAkxK2qe9YPPU3qwlxbV4YNasXGIHAJ1C6A2SQqWSi3YsABbtps9V4+jIS7WnSEFscNZGLHswsHcxx55Jk5GCsfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J56z3FWjj+RQrCLrnzKAHC9cQ4JjBFmqnSkNc/52CNo=;
 b=iz9he04fXxFJAMe9m4WI5bw094iYRBsHZk/igbmHHqVataIc1XEH86nduxQC/gQSGpcUawAjc7lEcABDIDKZcG9tFj5SxC4KAelwmcYOdO+sTSx32EkJuCTV+EetoRPciOj90Xa5p4WoyUgKSTwT9apgrd6XszR06JAVHcslRYcn7VQlR1WmmFSbTXJUBujAu5yUoV4URiqe9TpQPU8xrejX3hwAGKoZrT+I/Qa8oNxGxY0Ey8xoBctBwEKz5FNogt/MyeeaAOZz3qdfcl/p8IcfqN+S9fmsn+SOQkJR/Phv45OCfDn9UoBIZ8nKqRXTJwrgnS4hUuiQLAYAWuOz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J56z3FWjj+RQrCLrnzKAHC9cQ4JjBFmqnSkNc/52CNo=;
 b=T1Q+VzaxVkiUs0KGkMOf0p8mHRRRPQactTogP/PMugSJC7wggqKYCHg/Xe6h+E+HHmis2P2V/QQrJi4ZeTMhUW4UQk+BwJZptW7DgGXJh6gW3R/R7dycDge9SXjesKzRNOanNgaIfzqenEboj0UPgOXXAZ7W6Kn/4GpVDnxyPZ0=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 03:32:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 03:32:47 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v14 RESEND 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Topic: [PATCH v14 RESEND 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Index: AQHZ1NaBVuCZngaloEG5niC6UwZ9La/2RzoAgBVKgbA=
Date: Tue, 5 Sep 2023 03:32:47 +0000
Message-ID: <AM7PR04MB704659DF09143D0C6777143098E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-6-victor.liu@nxp.com>
 <22parqvy44hkd2ypkglfwk6bafi5ov4qfhpvd6qnt36us7odec@iebwnwtwvnnf>
In-Reply-To: <22parqvy44hkd2ypkglfwk6bafi5ov4qfhpvd6qnt36us7odec@iebwnwtwvnnf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8763:EE_
x-ms-office365-filtering-correlation-id: 748228b8-0402-4efd-8ba1-08dbadc0c626
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MayoISCAoivL+q+M7Og2adigymg2Is5CcvwNcpQVosd1ZZfqO0j/+FWRMcJ4MxPuPytM8JtZrH80A38QAEwYHeMZpu9X0aGr71ophOVRKjTm8JDEkfogPyA9pstq9cCV1fR+E+n5I7b3hX8Ac5Kl7sNV91rvXGBeDDcg2vL6drPU1Q8L9EMS7Ab06I2wPIEkVFtnVcGs4fudoVJ8AmTxY9XEeOEuhLCFCwf0qIBjqMhLL1P9T9/p0Gv4POirHzR87W4uzbkjvE2A0R3W8JV4VREEbyRWHAYEb6hblC8urArWAhGRr3/fBWWYeRgi8yFos9f47JaY4TspqaLqEZAjq5eKJmkgnDafhn9fipuM0jEjwwrfBROQJ231pRDCepQTjf2QTft5+x2AHKmpUluNgTM4djNKwDYPKW5zxJP27US0FduzZ9zT4ZOl7NaCk7bEDYn2Jfn6tb+CcIwe+OnbrXHXaydQUKujCRKTTJb5vMHmlxUTtr4efNTloiVog7aPfgCwRSGem61qcrbGpsJM2xxuUb4Eqs1p4trMs1zKsbJI1Y17JJQJbOMWTKeNH072dCxUkCC2M6i6LjNrLaMjLCKv4TldG3RnMCuU6iaF+Mc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(396003)(376002)(186009)(451199024)(1800799009)(2906002)(30864003)(33656002)(38100700002)(38070700005)(86362001)(122000001)(55016003)(41300700001)(9686003)(53546011)(6506007)(7696005)(6916009)(316002)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(4326008)(8676002)(52536014)(8936002)(478600001)(966005)(71200400001)(7416002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hV9HRhv0ZgGyVj65vC3rbIit54mFOQrjZqv6McsZgXfjF00rbaGSSdb26B?=
 =?iso-8859-1?Q?+oD+OuDcr5/zaMatvxtSMJkFm1Pceg7hyY3zLKyPXrvXioW4CEYbkmMD5x?=
 =?iso-8859-1?Q?JGNOL/WFSYZ7XCk/RUMenDekDi3pfH2eS0v4BmQrkAp/zPqdTo/+zuQPzG?=
 =?iso-8859-1?Q?6ltq/ItolVYD/oZj35hDL26omAfkFt3Q83Kd/k23Wya6WjGQ3FQ2hmWxvN?=
 =?iso-8859-1?Q?5Xucs9qLGfYaT/ZMIc6q6/NcU44d1Q4rNqCbZZRVla32m7+E92qLxCk56Z?=
 =?iso-8859-1?Q?Mpy+Z0PkWE2ww0x4Mz8rEoqL72aSrHLtII5qfC6gV2gmZ3u2xbqnrQ60+7?=
 =?iso-8859-1?Q?V7qUieDscTG4rmaERu4dbfMJSEe7Harkl7iZmI0TDtYrGU+5yC+z2eI9Xh?=
 =?iso-8859-1?Q?qGVbN4tDtGFJElqeQDi1w58BqXsh/0nQtLs4Nl4aYf28uMhxB85GRPQlxr?=
 =?iso-8859-1?Q?B9jaD3yy6FhI2S5kjhtPPgfZiPedDzhXyYJ/EYgGXT0BOmQZbbwz1L8KDw?=
 =?iso-8859-1?Q?uMZTuxHMs2rWBvl4EizlJRqDfw5a17+gqrWqsJEwpA3iXWPCgvUKt8NSU5?=
 =?iso-8859-1?Q?Xb7oXSoBbjmnGdwXhaNmiDiDG2RInYwADgC5MQUNULAMkw2zZmLQ7SKufR?=
 =?iso-8859-1?Q?67zq6/hAIqLJuq2MS+wEUQD8JEHGgAwBrTnUVESRG3+ajaNpGUPOTvcQkK?=
 =?iso-8859-1?Q?cYGfXGtDCO+F3yQWXt+kqEHEA5OmbnFANcuKvSKzgP0huxpMe4eH4rnEK8?=
 =?iso-8859-1?Q?6ZAYFgMZyKzVNLGxV4v95m/hMY/hivi0aaWRjoTduYJmh4Gfs42/nMH156?=
 =?iso-8859-1?Q?w2AQd0CoJwa5dJrM9dLrlp2HJ4MrTHA/jh/5fMIzf0xzmZMEcigg6M14lO?=
 =?iso-8859-1?Q?hoRBioZ41l4/J61Z4gn1aP1s0ZzH1+h2vKKbwS4Qoo/lmbEsPIDtCevEV2?=
 =?iso-8859-1?Q?xPj9dS69+z3PnyYzb83Ri3zGY26r9qnA4CivqW6O2wToL26ppwcpk+CkgQ?=
 =?iso-8859-1?Q?lGYfJ8uCXOaZonjZwDKpsIiGfoV8NAfO9syU268dbXNTCqr2TXDSvNM0Y6?=
 =?iso-8859-1?Q?P5hYhqZnLE3pJTQMpw6o6y/2jbff20wCA+dSxGizpTNoem7dnws2LPWQd8?=
 =?iso-8859-1?Q?A5dLYAeqQXWMhzUgh1i7p4nqft7y52LFnjyjYDiMhkBdDwTdDMYNlg2D/M?=
 =?iso-8859-1?Q?+bjwLjwHaHsWbg5MUTPrghOIy3DrRad5Z1WIg5U8IgSWJEklHPtCxBPTnp?=
 =?iso-8859-1?Q?YSveAZxVOL/xat3cTCG/9xqJJQyqTsjj2F/QYQ16ih2AnhOetK5fxWIdE7?=
 =?iso-8859-1?Q?f7EU1Z2pI/hapg+ZLKccyiLJZ3S+5zBXqyDfCK3ZuO1OEwcXAghzGPoq3O?=
 =?iso-8859-1?Q?9nNep44up2y9xmPqjoUY/NVkUKARLrrG8vW8AWsaFyuu6VQ0AD44XamCQ9?=
 =?iso-8859-1?Q?oyQnNjZX3sJue4eTnUQT2laEhv5X31bo7mhTipFUDQxJrRaqg7fd3gPjCt?=
 =?iso-8859-1?Q?uGCMWYPJNos8ifaCbzqgIn+PLz4k3Yh38eLF/ETjsiQoQNPB+yfrEeeoVU?=
 =?iso-8859-1?Q?jX/clsKTAzxeWG7eS69VJmX6hpkXeC77wRJspNyZqpiiRHcl/BztK7ueWU?=
 =?iso-8859-1?Q?XUPv4AG1q6X7Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748228b8-0402-4efd-8ba1-08dbadc0c626
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 03:32:47.2632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3x4U8OTr5j+zqRYhtsNYHREvhxGyw/X/vQ2BOJrvOywvmmBr70hEOGRZ3Yi844apfZ0Aj7djXLVaTsPxNYZuxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 22, 2023 8:59 PM, Maxime Ripard <mripard@kernel.org> wro=
te:
>=20
> Hi,

Hi,

>=20
> Aside from the discussion on the binding and the general architecture, I
> have some comments there.

Thanks for your comments.

>=20
> On Tue, Aug 22, 2023 at 04:59:48PM +0800, Liu Ying wrote:
> > +int dpu_cf_init(struct dpu_soc *dpu, unsigned int index,
> > +		unsigned int id, enum dpu_unit_type type,
> > +		unsigned long pec_base, unsigned long base)
> > +{
> > +	struct dpu_constframe *cf;
> > +
> > +	cf =3D devm_kzalloc(dpu->dev, sizeof(*cf), GFP_KERNEL);
> > +	if (!cf)
> > +		return -ENOMEM;
> > +
> > +	dpu->cf_priv[index] =3D cf;
>=20
> You can't store structures related to KMS in a device managed structure.
> The DRM KMS device will stick around (and be accessible from userspace)
> after the device has been removed until the last application closed its
> file descriptor to the device.

The DRM device is registered after component_bind_all() is called in
dpu_drm_bind().  The CRTC components' platform devices are created
in the dpu_core_probe() where the device managed resources are
created.   So, it looks those resources are safe because the DRM device
will be unregistered before those resources are freed.

>=20
> This can be checked by enabling KASAN and manually unbinding the driver
> through sysfs.

I enabled KASAN and manually unbound the dpu-core driver with command:

echo 56180000.dpu > /sys/bus/platform/drivers/dpu-core/56180000.dpu/driver/=
unbind=20

KASAN didin't report memory issue regarding those device managed
resources.  However, it did report another issue in dpu_drm_unbind(),
where drm_device should be got from drv_data->drm_dev instead of
dev_get_drvdata(dev).  I'll fix that in next version.

BTW, the dpu-core driver was successfully bound again after unbinding with
command:

echo  56180000.dpu > /sys/bus/platform/drivers/dpu-core/bind

>=20
> > +	cf->pec_base =3D devm_ioremap(dpu->dev, pec_base, SZ_16);
> > +	if (!cf->pec_base)
> > +		return -ENOMEM;
> > +
> > +	cf->base =3D devm_ioremap(dpu->dev, base, SZ_32);
> > +	if (!cf->base)
> > +		return -ENOMEM;
>=20
> For the same reason, you need to protect any access to a device managed
> resource (so clocks, registers, regulators, etc.) by a call to
> drm_dev_enter/drm_dev_exit and you need to call drm_dev_unplug instead
> of drm_dev_unregister.

That's a good point.  I've tried to do that, but it turns out that the disp=
lay controller
cannot be enabled again after binding the dpu-core driver manually again.  =
It seems
that the display controller requires a proper disablement procedure, but th=
e "driver
instance overview " kdoc mentions the shortcoming of no proper disablement =
if
drm_dev_unplug() is used:

"""
* Drivers that want to support device unplugging (USB, DT overlay unload) s=
hould
 * use drm_dev_unplug() instead of drm_dev_unregister(). The driver must pr=
otect
 * regions that is accessing device resources to prevent use after they're
 * released. This is done using drm_dev_enter() and drm_dev_exit(). There i=
s one
 * shortcoming however, drm_dev_unplug() marks the drm_device as unplugged =
before
 * drm_atomic_helper_shutdown() is called. This means that if the disable c=
ode
 * paths are protected, they will not run on regular driver module unload,
 * possibly leaving the hardware enabled.
"""

A DPU reset in dpu_core() might be helpful, but I'm not sure if there is an=
y
reset line provided by the embodying system.

Even if the reset works, the 2nd DPU instance in i.MX8qm would be a problem=
,
because it won't be reset or properly disabled if the 1st DPU instance is u=
nbound.
Although the two DPU instances could be wrapped by two DRM devices, I tend
not to do that because downstream bridges in future SoCs might be able to m=
ux
to different DPU instances at runtime.

Due to the disablement issue, can we set drm_dev_enter/exit/unplug aside fi=
rst?

>=20
> > +static int dpu_crtc_pm_runtime_get_sync(struct dpu_crtc *dpu_crtc)
> > +{
> > +	int ret;
> > +
> > +	ret =3D pm_runtime_get_sync(dpu_crtc->dev->parent);
> > +	if (ret < 0) {
> > +		pm_runtime_put_noidle(dpu_crtc->dev->parent);
> > +		dpu_crtc_err(&dpu_crtc->base,
> > +			     "failed to get parent device RPM sync: %d\n", ret);
> > +	}
> > +
> > +	return ret;
> > +}
>=20
> That's pm_runtime_resume_and_get.

Ok, will use it.

>=20
> > +static int dpu_crtc_pm_runtime_put(struct dpu_crtc *dpu_crtc)
> > +{
> > +	int ret;
> > +
> > +	ret =3D pm_runtime_put(dpu_crtc->dev->parent);
> > +	if (ret < 0)
> > +		dpu_crtc_err(&dpu_crtc->base,
> > +			     "failed to put parent device RPM: %d\n", ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static void dpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > +{
> > +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> > +	struct drm_display_mode *adj =3D &crtc->state->adjusted_mode;
> > +	enum dpu_link_id cf_link;
> > +
> > +	dpu_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n",
> DRM_MODE_ARG(adj));
> > +
> > +	/* request power-on when we start to set mode for CRTC */
> > +	dpu_crtc_pm_runtime_get_sync(dpu_crtc);
>=20
> From the drm_crtc_helper_funcs documentation:
>=20
> """
> 	 * Note that the display pipe is completely off when this function is
> 	 * called. Atomic drivers which need hardware to be running before
> they
> 	 * program the new display mode (e.g. because they implement
> runtime PM)
> 	 * should not use this hook. This is because the helper library calls
> 	 * this hook only once per mode change and not every time the display
> 	 * pipeline is suspended using either DPMS or the new "ACTIVE"
> property.
> 	 * Which means register values set in this callback might get reset
> when
> 	 * the CRTC is suspended, but not restored.  Such drivers should
> instead
> 	 * move all their CRTC setup into the @atomic_enable callback.
> """

I can use drm_atomic_helper_commit_tail() but not
drm_atomic_helper_commit_tail_rpm() because the planes need to be
updated prior to modeset_enables(where trigger shadow registers in
plane's HW resources to take effect).   Using the former one means that
RPM needs to be get/put in drm_atomic_helper_commit_planes(), which
doesn't seem good because in some cases the power of the display controller
might be lost after RPM put and I'm not sure if the registers set there wil=
l
be lost or not.   So, to avoid the issue the documentation mentions,
crtc_state->mode_changed is forced to be true in dpu_crtc_atomic_check()
if the CRTC is changed to active.  Is this acceptable?

>=20
> > +static void dpu_crtc_atomic_enable(struct drm_crtc *crtc,
> > +				   struct drm_atomic_state *state)
> > +{
> > +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> > +	unsigned long flags;
> > +
> > +	drm_crtc_vblank_on(crtc);
> > +
> > +	enable_irq(dpu_crtc->dec_shdld_irq);
> > +	enable_irq(dpu_crtc->ed_cont_shdld_irq);
> > +	enable_irq(dpu_crtc->ed_safe_shdld_irq);
> > +
> > +	dpu_fg_enable_clock(dpu_crtc->fg);
> > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_safe);
> > +	if (crtc->state->gamma_lut)
> > +		dpu_crtc_set_gammacor(dpu_crtc);
> > +	else
> > +		dpu_crtc_disable_gammacor(dpu_crtc);
> > +	dpu_fg_shdtokgen(dpu_crtc->fg);
> > +
> > +	/* don't relinquish CPU until TCON is set to operation mode */
> > +	local_irq_save(flags);
> > +	preempt_disable();
> > +	dpu_fg_enable(dpu_crtc->fg);
>=20
> That's super fishy. You shouldn't need that, at all. What is going on
> there?

This aims to fully workaround the below errata recently released by
NXP.

ERR010910: DC: Display Subsystem First Frame Programming Restriction
Link: https://www.nxp.com/docs/en/errata/IMX8_1N94W.pdf

In short, to make sure the display controller can be enabled properly with
prefetch engine(DPRC + PRG), the TCON must be switch from bypass mode
to operation mode after FrameGen(FG) generates the first frame.

Timing is critical here, so local irq and preemption are disabled during th=
e
switch procedure.

BTW, the driver always use prefetch engines for KMS, although they can
be bypassed.

>=20
> > +
> > +	/*
> > +	 * TKT320590:
>=20
> Those are NXP internal references as far as as I can tell. They
> shouldn't be here.

Ok, will change it to be ERR010910.

>=20
> > +	 * Turn TCON into operation mode as soon as the first dumb
> > +	 * frame is generated by DPU(we don't relinquish CPU to ensure
> > +	 * this).  This makes DPR/PRG be able to evade the frame.
> > +	 */
> > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc-
> >fg);
> > +	dpu_tcon_set_operation_mode(dpu_crtc->tcon);
> > +	local_irq_restore(flags);
> > +	preempt_enable();
> > +
> > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdld_done);
> > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
> > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> > +
> > +	disable_irq(dpu_crtc->ed_safe_shdld_irq);
> > +	disable_irq(dpu_crtc->ed_cont_shdld_irq);
> > +	disable_irq(dpu_crtc->dec_shdld_irq);
> > +
> > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(dpu_crtc-
> >fg);
>=20
> The dance around the interrupts doesn't look great either. This need a
> proper description of the problem this was trying to solve. Also, what
> happens if any of those interrupts fail to trigger before you timeout?

Hmm, this is just following the display controller spec which provides deta=
il
steps to enable the display pipeline which include waiting for the interrup=
ts
and the FrameGen primary or secondary channel syncup.

If the interrupts fail to trigger and we timeout, then there must be someth=
ing
wrong either caused by DPU HW itself or driver bug.   Here, warnings are
generated only.

>=20
> > +	DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
> > +
> > +	dpu_crtc_queue_state_event(crtc);
> > +}
> > +
> > +static void dpu_crtc_atomic_disable(struct drm_crtc *crtc,
> > +				    struct drm_atomic_state *state)
> > +{
> > +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> > +	struct drm_plane *plane;
> > +	struct drm_plane_state *old_plane_state;
> > +	struct dpu_plane_state *old_dpstate;
> > +	struct dpu_fetchunit *fu;
> > +	struct dpu_dprc *dprc;
> > +	const struct dpu_fetchunit_ops *fu_ops;
> > +	unsigned long flags;
> > +	int i;
> > +
> > +	enable_irq(dpu_crtc->dec_seq_complete_irq);
> > +
> > +	/* don't relinquish CPU until DPRC repeat_en is disabled */
> > +	local_irq_save(flags);
> > +	preempt_disable();
> > +	/*
> > +	 * Sync to FrameGen frame counter moving so that
> > +	 * FrameGen can be disabled in the next frame.
> > +	 */
> > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc-
> >fg);
> > +	dpu_fg_disable(dpu_crtc->fg);
> > +	/*
> > +	 * There is one frame leftover after FrameGen disablement.
> > +	 * Sync to FrameGen frame counter moving so that
> > +	 * DPRC repeat_en can be disabled in the next frame.
> > +	 */
> > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc-
> >fg);
> > +
> > +	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
> > +		old_dpstate =3D to_dpu_plane_state(old_plane_state);
> > +
> > +		if (!old_plane_state->fb)
> > +			continue;
> > +
> > +		if (old_plane_state->crtc !=3D crtc)
> > +			continue;
> > +
> > +		fu =3D old_dpstate->source;
> > +
> > +		fu_ops =3D dpu_fu_get_ops(fu);
> > +
> > +		dprc =3D fu_ops->get_dprc(fu);
> > +		dpu_dprc_disable_repeat_en(dprc);
> > +	}
> > +
> > +	local_irq_restore(flags);
> > +	preempt_enable();
> > +
> > +
> 	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seq_complete_d
> one);
> > +
> > +	disable_irq(dpu_crtc->dec_seq_complete_irq);
> > +
> > +	dpu_fg_disable_clock(dpu_crtc->fg);
> > +
> > +	drm_crtc_vblank_off(crtc);
> > +
> > +	spin_lock_irq(&crtc->dev->event_lock);
> > +	if (crtc->state->event && !crtc->state->active) {
> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +		crtc->state->event =3D NULL;
> > +	}
> > +	spin_unlock_irq(&crtc->dev->event_lock);
> > +
> > +	/* request power-off when CRTC is disabled */
> > +	dpu_crtc_pm_runtime_put(dpu_crtc);
> > +}
>=20
> Same story than in atomic_enable here.

Similar to atomic_enable, strict procedure needs to be followed
to disable the CRTC properly, including disabling FrameGen by syncing
to frame counter moving and disabling DPRC repeat_en as soon as
possible.   The critical timing is achieved by disabling local irq and
preemption during the procedure.

>=20
>=20
> > +static int legacyfb_depth =3D 32;
> > +module_param(legacyfb_depth, uint, 0444);
>=20
> No custom module parameter

Ok, will remove them.

>=20
> > +static void dpu_atomic_put_plane_state(struct drm_atomic_state *state,
> > +				       struct drm_plane *plane)
> > +{
> > +	int index =3D drm_plane_index(plane);
> > +
> > +	plane->funcs->atomic_destroy_state(plane, state->planes[index].state)=
;
> > +	state->planes[index].ptr =3D NULL;
> > +	state->planes[index].state =3D NULL;
> > +	state->planes[index].old_state =3D NULL;
> > +	state->planes[index].new_state =3D NULL;
> > +
> > +	drm_modeset_unlock(&plane->mutex);
> > +
> > +	dpu_plane_dbg(plane, "put state\n");
> > +}
> > +
> > +static void dpu_atomic_put_crtc_state(struct drm_atomic_state *state,
> > +				      struct drm_crtc *crtc)
> > +{
> > +	int index =3D drm_crtc_index(crtc);
> > +
> > +	crtc->funcs->atomic_destroy_state(crtc, state->crtcs[index].state);
> > +	state->crtcs[index].ptr =3D NULL;
> > +	state->crtcs[index].state =3D NULL;
> > +	state->crtcs[index].old_state =3D NULL;
> > +	state->crtcs[index].new_state =3D NULL;
> > +
> > +	drm_modeset_unlock(&crtc->mutex);
> > +
> > +	dpu_crtc_dbg(crtc, "put state\n");
> > +}
> > +
> > +static void
> > +dpu_atomic_put_possible_states_per_crtc(struct drm_crtc_state
> *crtc_state)
> > +{
> > +	struct drm_atomic_state *state =3D crtc_state->state;
> > +	struct drm_crtc *crtc =3D crtc_state->crtc;
> > +	struct drm_plane *plane;
> > +	struct drm_plane_state *old_plane_state, *new_plane_state;
> > +	struct dpu_plane_state *old_dpstate, *new_dpstate;
> > +
> > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> > +		old_plane_state =3D drm_atomic_get_old_plane_state(state,
> plane);
> > +		new_plane_state =3D drm_atomic_get_new_plane_state(state,
> plane);
> > +
> > +		old_dpstate =3D to_dpu_plane_state(old_plane_state);
> > +		new_dpstate =3D to_dpu_plane_state(new_plane_state);
> > +
> > +		/* Should be enough to check the below HW plane resources.
> */
> > +		if (old_dpstate->stage.ptr !=3D new_dpstate->stage.ptr ||
> > +		    old_dpstate->source !=3D new_dpstate->source ||
> > +		    old_dpstate->blend !=3D new_dpstate->blend)
> > +			return;
> > +	}
> > +
> > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> > +		dpu_atomic_put_plane_state(state, plane);
> > +
> > +	dpu_atomic_put_crtc_state(state, crtc);
> > +}
>=20
> That's super suspicious too. Are you really going around and dropping
> and destroying plane and crtc states in a global state?

Yes.

>=20
> At the very least, you need to describe what this addresses and why you
> think it's a good solution.

This is the solution to assign HW resources of a plane group to the two CRT=
Cs
in one DPU or one CRTC group _dynamically_ at runtime.  Dpu.h has some
comments which hint this:

"""
/*
 * fetchunit/scaler/layerblend resources of a plane group are
 * shared by the two CRTCs in a CRTC group
 */
"""

I can add a DPU display controller block diagram in dpu_kms.c to tell the H=
W
architecture and some SW architecture to clarify this more.

Regards,
Liu Ying

>=20
> I kind of skimmed over the last part of the driver, but we should really
> address these first comments. There's a larger discussion on the fact
> that this driver does much more that it should and needs to (especially i=
n
> atomic_check, but not only), and this applies to the rest of patch.
>=20
> Maxime
