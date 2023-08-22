Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F1783BAD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F175110E1B0;
	Tue, 22 Aug 2023 08:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F82610E1B0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:23:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdEgGSdwYkLRDXaPtj+nhnMiWf3UIcpu1vWcAYoFEcLXDpM6KpwOFYzMTeEIdQdH6ouUMTOfzh6XcsnkQBn48IwtYfbXJDgdgBxQCB4K6iS3hh4pctu5wTi/f5EvJEx+YwZ2bOAWljODy2czsOZR32fix89otHp2O8ewkWT1KfpAiGFbhI3Jyj8XWa/5iV3sW1L4NhUJHwruxZ/SsZx/IBIFTAaQLDP+1Bh5rYmlWlKWweR+NUh5nh6eybk2CP13zBL7lVdPnLCMnQETTdmGNsWwDbkJmO8XqFtUdZZfEGVyscxW7fmTLFyFSaVdJK5oJTV8xXxqE8xRUwUYlikOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuWEv7dZoq3awqAmlm5KNdlg5dr1Qt+6XDJQ3U8+KjU=;
 b=Xql2aLHpPT3IabCf0HKty8gV8EJw5Yu9FexSX9Iih8LTO+oBOBM7rA3ovOUkmOSgXXZIJc5USaTwC4GujldlOO2YyIK8M62geMGCoyfqXgRB9DlW620TrMtIG4widp96YoWvGtZik2u9AILm3PX6F73TYjeuGN+VSckae61VAjLVZoEyQA+PmN/E9a0I7H/wHK/EgDPevGNUrMs8hFRaoZZoskPrpA2fd6ozG2lmZAdY/ufuGczriqsH6lH66rqUh1zd3lbPlLkx1AOzcaj59Hwi+rxphicqJzDuvqgkkjNqLyLuwWNuQ0T4v2MiAl1NeXU+upFvYKVRPf5IiZJMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuWEv7dZoq3awqAmlm5KNdlg5dr1Qt+6XDJQ3U8+KjU=;
 b=o5axI0ibuf47viftMjt9uBIq2QBW3hiSPr9ng9JFvWQ9cCRtQ3im/lwFzTgq+3mKYreXJ/LQMblkj+A35klQBiHb/beE9fNSP0kbBkMdrezVWi25Is75IgnpcxwJEtdEPAX8ySN3/TVFlh70f2FbTEyiMQqmWFDZUOnuKUfp7XY=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9286.eurprd04.prod.outlook.com (2603:10a6:20b:4de::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:23:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:23:33 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "mripard@kernel.org" <mripard@kernel.org>
Subject: RE: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Topic: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Index: AQHZIZK391aAnd1BtU2IGNfkhc3wq6/3Lu6AgAAs6ACAAAMlUA==
Date: Tue, 22 Aug 2023 08:23:33 +0000
Message-ID: <AM7PR04MB70461F09E4FD268D9D3FFBD0981FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
 <AM7PR04MB7046E7F22B817FC6FE8DA95A981FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <x3odw5zxaz5r52zmwf6owdgalthkhbjogsvblzuj3vjaugu3kr@6jr4lsaxkkn3>
In-Reply-To: <x3odw5zxaz5r52zmwf6owdgalthkhbjogsvblzuj3vjaugu3kr@6jr4lsaxkkn3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS1PR04MB9286:EE_
x-ms-office365-filtering-correlation-id: 573029fa-d7bd-4b4e-e137-08dba2e91318
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WOUTGw2vZ9sfh/zPqjsF9MAK+dQy2+bvNmlC08pqDjTKCkvy5IvmFL9jJF9sLVTbESkjCkto30yXCS0ZNNbiBd+6vjvYnsfKr6YkrzRmyKtnF2b67xseZGsRAuuZfCpjM218I3VOE2YGaEg3irXDlKBRfw9qk9jTiuoMIm+cmhpFFBSPHeDXS98S0hUsFZu1q2Tu7HBZ+skn8ELynFEodkkmtFtewsvAnKqZLhsSP/CU6P8QnzKAH7noxexcaTNY1WKrljB8sTb54+TY5S1A3Ar4FNEshuNcyyXTVqUuiYKNQqRPqNtpAZm12zZ2ChZBH2mhZVg17OGa0ufOT/3HkYors5J44QnYULEJNLcxWuIe5lAVioHBHg8A03k7ld4mKCdxyvDa5HxKS/cR2HGL05fU0ouTqjzu37rFCl1f4FZa4pglvpCamo8D9aMq7jUUWHwntZN5vn4gBMr74gS12HNrp756I1O0sBUu73fWDW/n3a6jotDQp+IjYFvJofdIOfJWZSuGYyo1kLbBDYGG831N6BHlQ4c/gF1eKrq8B7lJdKbMpYCtT1NlnEATVoyxUXdTVBIjXe77zVshrFFN0dmbKj8AlmynxUlLCX5oPVA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(30864003)(7416002)(53546011)(38070700005)(38100700002)(6506007)(83380400001)(5660300002)(52536014)(33656002)(26005)(7696005)(86362001)(8676002)(8936002)(4326008)(316002)(9686003)(66946007)(64756008)(66446008)(6916009)(54906003)(76116006)(66556008)(66476007)(66899024)(966005)(478600001)(122000001)(71200400001)(55016003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TWuqtbiTwDXDSSv1sctCxkScAGBoxbZVqdfBMEG89jGhG5BwtfaM5Hg1YX?=
 =?iso-8859-1?Q?AOtEZozZTW7SbG5jJo3EN2dTRQZ+kQ3zSZ37NkSEr8hoNqwzoS5b07v+bG?=
 =?iso-8859-1?Q?tyt1bbFpYvlahKJx1VSqLkDTBkIuy++7PbZfbZBvtyDKkf20gZweDskkZT?=
 =?iso-8859-1?Q?D9pAgRlruK4YD23PqvjAaGcDIhVB7mGzhfqrKNFLLmYYBt68CaX+JVcOts?=
 =?iso-8859-1?Q?24a5EG9uHkoc1cy8bsuEMtM4G1hSGLCU0K2uDWj6/djBM9FmhZIIOMsuVw?=
 =?iso-8859-1?Q?IDZYL3AKsaHzKbtNgsZy+Qbc5OIo7wslZE93jGUCDkhDeA4kjXGh14YFIg?=
 =?iso-8859-1?Q?4yn5Pjz8UgFnnEc049LMdxTC24DqlUIFQUg06MKuQoO7LkEvaiXLUOfOn5?=
 =?iso-8859-1?Q?e9NSBZiso8vDIzo3g6g6lSOYcHi03ykW1m4KK1i8qOAKm1B/q3FySgyEcZ?=
 =?iso-8859-1?Q?1oZ8nymGsWuo43Sh/LpAABSIIUH5sE7Wz35MOBOXzlWdH/H4UbJEe8U5mE?=
 =?iso-8859-1?Q?NWIaD1BSq11c8S3+F4EpL5NzCMz1u700FIbSwosAfl9eQMPOkiWzSTa5+X?=
 =?iso-8859-1?Q?JtckarapDXvZnGsDkN0TwPBVWX54lcmHr47G0G4XEtD0IIclf1Dp/dk7SH?=
 =?iso-8859-1?Q?XD1hjlGshUZ9vgpoN7cMs59SOBhKMKJcySlJY+Id7/09LCKwTVsGkNUhZR?=
 =?iso-8859-1?Q?2VzWGufdTe4SBt8EepO5V7FIw3IhwHBiMVqDVcE8LrsV2y/n8Scyur9w8a?=
 =?iso-8859-1?Q?BQhLu0MKsxY3FfLcGRge/2UZiFlmAaC12DKFvI9F8MQoV+rSHT9X6VGFdB?=
 =?iso-8859-1?Q?Pm8jeJWcQPZ/Gdtc5OmfhzjbbXgCix0d2iTWgfNM1aFJhWG+KAwddwC/FP?=
 =?iso-8859-1?Q?0unGXzRNiKGyJb1TJ5cc0wO+JGjRDZ5LZDk6pKFvzZSLTU+hpJytXQRYHI?=
 =?iso-8859-1?Q?uFDMNLop3s2dzmXgfJlyE9pOCR/JlOJZzgecyIrNljC5WbWt+w5mW/BWo0?=
 =?iso-8859-1?Q?DWRwIAp+ztmI7tN0h2g6ptXWYZQApg7dbIdrk3H6j0YE449ZNG35FEz2eC?=
 =?iso-8859-1?Q?xrOObwKdE1hBAsEE32SOHn9/6aRETpc7+Eee5ui876CnSr6JSwuLGwOd/T?=
 =?iso-8859-1?Q?tS7vP+m3DfJKHjYQ2HtWGMRhCkDZL07fQ0AtIj94uogQJz88e0XVfc1AW4?=
 =?iso-8859-1?Q?kbUPpmMfgUIqBrCskRY3aeUv3Xq+rSQEaREb0xhtnogLjY5IGDPYX8lAsV?=
 =?iso-8859-1?Q?2SHyCz58SPSuWbL8uazvRFoE6w3ofLKnOp88+eyUQX/PHgT/2FqLfvsI7O?=
 =?iso-8859-1?Q?prFiioEV2Hg77+gxylyhED8Z/xCXjMnpcc3K1MjwK+JDzu3C/5AWJX3GnO?=
 =?iso-8859-1?Q?AqKpQRuhfRSjhcexrdthGS0QM8VgTLZdtNjvQa/s5KLiS4XA3R0M8fbYVx?=
 =?iso-8859-1?Q?XEt2XddOJRMOoxJhIs/mGXt8fJSJcU5YxELD01m6NlTY8X1AoXRMQbx9HF?=
 =?iso-8859-1?Q?2pgYlDnBubhqQiMaYQMjzrr7AjhvU/wpopUv4v6H6YMuFl/5nJ0gxJOhv3?=
 =?iso-8859-1?Q?Dmj6ANedJ8Jx89biESLmYGsEOadoG5SSNImm6pMlgQbIwSna8XoBAyY9BG?=
 =?iso-8859-1?Q?CRgqhltZp2/kE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573029fa-d7bd-4b4e-e137-08dba2e91318
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 08:23:33.4215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /S3RtgEx30QhzTFDXCmZvuQOl1uiy0Lkk+15OZqm0zq1ZG/lyaPCYlrOJf90TxilFt+rHsqliAxMwabG8mI3TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9286
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


On Tuesday, August 22, 2023 4:06 PM Maxime <mripard@kernel.org> wrote:
>=20
> Hi,

Hi,

>=20
> On Tue, Aug 22, 2023 at 05:36:14AM +0000, Ying Liu wrote:
> > Hi,
> >
> > > On Friday, January 6, 2023 1:50 PM Ying Liu wrote:
> > >
> > > Hi,
> > >
> > >
> > > This is the v14 series to introduce i.MX8qm/qxp Display Processing
> Unit(DPU)
> > > DRM support.
> > >
> > > DPU is comprised of a blit engine for 2D graphics, a display controll=
er
> > > and a command sequencer.  Outside of DPU, optional prefetch engines
> can
> > > fetch data from memory prior to some DPU fetchunits of blit engine an=
d
> > > display controller.  The pre-fetchers support linear formats and Viva=
nte
> > > GPU tile formats.
> > >
> > > Reference manual can be found at:
> > > https://www.nxp.com/webapp/Download?colCode=3DIMX8DQXPRM
> > >
> > >
> > > This patch set adds kernel modesetting support for the display contro=
ller
> part.
> > > It supports two CRTCs per display controller, several planes, prefetc=
h
> > > engines and some properties of CRTC and plane.  Currently, the regist=
ers
> of
> > > the controller is accessed without command sequencer involved, instea=
d
> just
> > > by
> > > using CPU.  DRM connectors would be created from the DPU KMS driver.
> > >
> > >
> > > Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
> > > Patch 4 is a minor improvement of a macro to suppress warning as the
> KMS
> > > driver
> > > uses it.
> > > Patch 5 introduces the DPU DRM support.
> > > Patch 6 updates MAINTAINERS.
> > >
> > > Welcome comments, thanks.
> > >
> > > v13->v14:
> > > * Rebase the patch series to the latest drm-misc-next branch(v6.1-rc6
> based).
> > > * Include drm_fbdev_generic.h in dpu_drv.c due to the rebase.
> > > * Fix dpu drm driver suspend/resume by properly get drm device throug=
h
> > >   dev_get_drvdata().
> > > * Use pm_ptr() macro for dpu core driver PM operations.
> > > * Use pm_sleep_ptr() macro for dpu drm driver PM operations.
> > > * Use DEFINE_SIMPLE_DEV_PM_OPS() macro to define dpu drm driver
> PM
> > > operations,
> > >   instead of SIMPLE_DEV_PM_OPS().
> > > * Update year of Copyright.
> > > * Add SoC series name 'i.MX8'/'IMX8'/'imx8' to dpu driver module
> decription,
> > >   Kconfig name, dpu driver names and dpu driver object name.
> > >
> > > v12->v13:
> > > * Drop 'drm->irq_enabled =3D true;' from patch 5/6 to fix a potential=
 build
> > >   break reported by 'kernel test robot <lkp@intel.com>'.  drm-
> >irq_enabled
> > >   should not be used by imx-dpu drm as it is only used by legacy driv=
ers
> > >   with userspace modesetting.
> > >
> > > v11->v12:
> > > * Rebase the series upon v6.1-rc1.
> > > * Minor update on Kconfigs, struct names and macro names for patch 5/=
6
> > >   due to the rebase.
> > >
> > > v10->v11:
> > > * Rebase the series upon v6.0-rc1.
> > > * Include drm_blend.h and drm_framebuffer.h in dpu-kms.c and dpu-
> > > plane.c
> > >   to fix build errors due to the rebase.
> > > * Fix a checkpatch warning for dpu-crtc.c.
> > > * Properly use dev_err_probe() to return it's return value directly w=
here
> > >   possible.
> > >
> > > v9->v10:
> > > * Rebase the series upon v5.18-rc1.
> > > * Make 'checkpatch.pl --strict' happier for patch 5/6.
> > > * Add Rob's R-b tag on patch 3/6.
> > > * Add Laurentiu's R-b tag on patch 5/6.
> > > * Add Laurentiu's A-b tag on patch 6/6.
> > >
> > > v8->v9:
> > > * Use drm_atomic_get_new_plane_state() in dpu_plane_atomic_update()
> > > for
> > >   patch 5/6. (Laurentiu)
> > > * Drop getting DPU DT alias ID for patch 5/6, as it is unused.
> > > * Reference 'interrupts-extended' schema instead of 'interrupts' for =
patch
> > > 3/6
> > >   to require an additional DPR interrupt(r_rtram_stall) because the
> reference
> > >   manual does mention it, though the driver doesn't get/use it for no=
w.
> > >   Reference 'interrupt-names' schema to define the two DPR interrupt
> names
> > > -
> > >   'dpr_wrap' and 'r_rtram_stall'.  Accordingly, patch 5/6 gets the
> 'dpr_wrap'
> > >   interrupt by name.
> > > * Drop Rob's R-b tag on patch 3/6, as review is needed.
> > >
> > > v7->v8:
> > > * Rebase this series up onto the latest drm-misc-next branch, due to =
DRM
> > > plane
> > >   helper functions API change(atomic_check and atomic_update) from
> DRM
> > > atomic
> > >   core.  So, dpu_plane_atomic_check() and dpu_plane_atomic_update()
> are
> > > updated
> > >   accordingly in patch 5/6.  Also, rename plane->state variables and
> relevant
> > >   DPU plane state variables in those two functions to reflect they ar=
e new
> > >   states, like the patch 'drm: Rename plane->state variables in atomi=
c
> update
> > >   and disable' recently landed in drm-misc-next.
> > > * Replace drm_gem_fb_prepare_fb() with
> > > drm_gem_plane_helper_prepare_fb() in
> > >   patch 5/6, due to DRM core API change.
> > > * Improve DPR burst length for GPU standard tile and 32bpp GPU super
> tile in
> > >   patch 5/6 to align with the latest version of internal HW documenti=
on.
> > >
> > > v6->v7:
> > > * Fix return value of dpu_get_irqs() if platform_get_irq() fails. (La=
urentiu)
> > > * Use the function array dpu_irq_handler[] to store individual DPU ir=
q
> > > handlers.
> > >   (Laurentiu)
> > > * Call get/put() hooks directly to get/put DPU fetchunits for DPU pla=
ne
> groups.
> > >   (Laurentiu)
> > > * Shorten the names of individual DPU irq handlers by using DPU unit
> abbrev
> > >   names to make writing dpu_irq_handler[] easier.
> > > * Add Rob's R-b tag back on DPU dt-binding patch as change in v6 was
> > > reviewed.
> > >
> > > v5->v6:
> > > * Use graph schema in the DPU dt-binding.
> > > * Do not use macros where possible in the DPU DRM driver. (Laurentiu)
> > > * Break dpu_plane_atomic_check() into some smaller functions.
> (Laurentiu)
> > > * Address some minor comments from Laurentiu on the DPU DRM driver.
> > > * Add dpu_crtc_err() helper marco in the DPU DRM driver to tell dmesg
> > >   which CRTC generates error.
> > > * Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() in the
> DPU
> > > DRM
> > >   driver as it is done in dpu_drm_probe().
> > > * Some trivial tweaks.
> > >
> > > v4->v5:
> > > * Rebase up onto the latest drm-misc-next branch and remove the hook
> to
> > >   drm_atomic_helper_legacy_gamma_set() from patch 5/6, because it
> was
> > > dropped
> > >   by the newly landed commit 'drm: automatic legacy gamma support'.
> > > * Remove a redundant blank line from dpu_plane_atomic_update() in
> patch
> > > 5/6.
> > >
> > > v3->v4:
> > > * Improve compatible properties in DPU and prefetch engines' dt
> bindings
> > >   by using enum instead of oneOf+const.
> > > * Add Rob's R-b tags on dt binding patches(patch 1/6, 2/6 and 3/6).
> > > * Add Daniel's A-b tag on patch 4/6.
> > >
> > > v2->v3:
> > > * Fix DPU DRM driver build warnings which are
> > >   Reported-by: kernel test robot <lkp@intel.com>.
> > > * Drop DPU DRM driver build dependency on IMX_SCU, as dummy SCU
> > > functions have
> > >   been added in header files by the patch 'firmware: imx: add dummy
> > > functions'
> > >   which has landed in linux-next/master branch.
> > > * Add a missing blank line in include/drm/drm_atomic.h.
> > >
> > > v1->v2:
> > > * Test this patch set also with i.MX8qm LVDS displays.
> > > * Drop the device tree patches because we'll use new dt binding way t=
o
> > >   support i.MX8qm/qxp clocks.  This depends on a not-yet-landed patch
> set
> > >   to do basic conversions for the platforms.
> > > * Fix dt binding yamllint warnings.
> > > * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm in
> > > DPU's
> > >   dt binding documentation.
> > > * Use new dt binding way to add clocks in the dt binding examples.
> > > * Address several comments from Laurentiu on the DPU DRM patch.
> > >
> > >
> > > Liu Ying (6):
> > >   dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
> > >   dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
> > >   dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
> > >   drm/atomic: Avoid unused-but-set-variable warning on
> > >     for_each_old_plane_in_state
> > >   drm/imx: Introduce i.MX8qm/qxp DPU DRM
> > >   MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
> > >
> > >  .../display/imx/fsl,imx8qxp-dprc.yaml         |  100 ++
> > >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml |  387 ++++++
> > >  .../bindings/display/imx/fsl,imx8qxp-prg.yaml |   60 +
> > >  MAINTAINERS                                   |    9 +
> > >  drivers/gpu/drm/imx/Kconfig                   |    1 +
> > >  drivers/gpu/drm/imx/Makefile                  |    1 +
> > >  drivers/gpu/drm/imx/dpu/Kconfig               |    9 +
> > >  drivers/gpu/drm/imx/dpu/Makefile              |   10 +
> > >  drivers/gpu/drm/imx/dpu/dpu-constframe.c      |  171 +++
> > >  drivers/gpu/drm/imx/dpu/dpu-core.c            | 1044 +++++++++++++++=
++
> > >  drivers/gpu/drm/imx/dpu/dpu-crtc.c            |  969 +++++++++++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-crtc.h            |   72 ++
> > >  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c       |  117 ++
> > >  drivers/gpu/drm/imx/dpu/dpu-dprc.c            |  715 +++++++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-dprc.h            |   40 +
> > >  drivers/gpu/drm/imx/dpu/dpu-drv.c             |  294 +++++
> > >  drivers/gpu/drm/imx/dpu/dpu-drv.h             |   28 +
> > >  drivers/gpu/drm/imx/dpu/dpu-extdst.c          |  299 +++++
> > >  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c     |  292 +++++
> > >  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c        |  224 ++++
> > >  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c      |  152 +++
> > >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c       |  610 ++++++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h       |  195 +++
> > >  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c       |  248 ++++
> > >  drivers/gpu/drm/imx/dpu/dpu-framegen.c        |  395 +++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-gammacor.c        |  223 ++++
> > >  drivers/gpu/drm/imx/dpu/dpu-hscaler.c         |  275 +++++
> > >  drivers/gpu/drm/imx/dpu/dpu-kms.c             |  542 +++++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-kms.h             |   23 +
> > >  drivers/gpu/drm/imx/dpu/dpu-layerblend.c      |  348 ++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-plane.c           |  804 +++++++++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-plane.h           |   59 +
> > >  drivers/gpu/drm/imx/dpu/dpu-prg.c             |  433 +++++++
> > >  drivers/gpu/drm/imx/dpu/dpu-prg.h             |   45 +
> > >  drivers/gpu/drm/imx/dpu/dpu-prv.h             |  231 ++++
> > >  drivers/gpu/drm/imx/dpu/dpu-tcon.c            |  250 ++++
> > >  drivers/gpu/drm/imx/dpu/dpu-vscaler.c         |  308 +++++
> > >  drivers/gpu/drm/imx/dpu/dpu.h                 |  385 ++++++
> > >  include/drm/drm_atomic.h                      |    5 +-
> > >  39 files changed, 10372 insertions(+), 1 deletion(-)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
> > >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h
> > >
> > > --
> > > 2.37.1
> >
> > This patch series has been submitted for a quite long period of time.
> >
> > Anything I can do to have it landed ?
>=20
> I'm not sure why it fell through the cracks, but given that it's more
> than 6 monthes old, please rebase and resend it.

Ok, will do that, though "git am" still runs successfully for this series
against the latest drm-misc-next.

Regards,
Liu Ying

>=20
> Maxime
