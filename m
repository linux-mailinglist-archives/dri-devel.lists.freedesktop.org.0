Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A805B5A51A6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3534A10E517;
	Mon, 29 Aug 2022 16:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF26410E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 16:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFuRM+6RSvjcVV4z5t+XgbD+tGF+maXlH5Q10yXgp1bk9JcU4BYxhpRhjHFRsL+Zj14SBCTOWao71BWe7a7KkpGCxq7jpPUH60DQweTJWGgMIRdWf6Tmwb5Apw8BdmiGwdapt5pZXIuaw7pGGMBvE4vL5w+eZ5Yup4qCZSzKY4xwup3BQBl8QT8S0uFhODnALXVqPSlthMM2p958atXSw/sM3HV0ADs/7YW+mwSHxkfK8Vg7PmE+LeT4it6mZEHACmMkALe9FItfqk+IeD7VXvBTch9BPWre5wiwrLTA33yeTEVgBfYu4kuCcT+YGGk+EJeKgyGqrWxzLjsMKVfZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nSLfN5yzRMINccDtK3XNzhiJVNXYxQieoh5FuqRLE4=;
 b=PbqkEz+iEnlA/7AJjXVJQsFD8ZPQOgeG8sd6gDVfyWMft+1MEjyNSR6NbZhS23OF3ohA6zj/vKRn31McyP+xhRQ1WS1L/Rk6/lD2rB/ELYXb90LVMdC4MQKET4x4Xh4HKeChz9jWh+MUGct1I3tXnkanMjzLcif85kqfTiua3jiflUxCU5Zp8rZjJHXVL1DO2/UQzorlXf/8Xqjmcm5LomyiWC+YvnZqK++ck6CZp5uz/gQ2zCw8E71I6Oyn1mw6p3PklQW1DkTNds/4wMGHWWHchb6dh25Jye8S3MyAiMW8CpNERfx93cgj7fikQbidaI38x40pRLDmxRDzC4B/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nSLfN5yzRMINccDtK3XNzhiJVNXYxQieoh5FuqRLE4=;
 b=Qt+PZAdWQjMcuYhjblvYpkSCRLYgqFFXwMCUOwxIM00EaSBj1w/S3aiL1ra8eL/GkbihpxuQpupgaAm6R3XVV0DIt0U/y9SX8sxF9ffiVhpryk2z5DB3IW2ws3K6bYnq54qJPaG98bnfktHxvgnIT6JsjBEFdu8qFt6XgUPzU5U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10249.jpnprd01.prod.outlook.com (2603:1096:604:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 16:26:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 16:26:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Robert Foss <robert.foss@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHYu4hv/CDDY6+M30+sYprn/JM1O63GBEiAgAACh8A=
Date: Mon, 29 Aug 2022 16:26:02 +0000
Message-ID: <OS0PR01MB5922BB4E4924ECE0E8A3312186769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220829091901.641784-1-biju.das.jz@bp.renesas.com>
 <20220829091901.641784-3-biju.das.jz@bp.renesas.com>
 <CAG3jFys4fKWBGBLX9CNB3xvz4ztgv4vdaTjB-sgrCMy6Zc9Yag@mail.gmail.com>
In-Reply-To: <CAG3jFys4fKWBGBLX9CNB3xvz4ztgv4vdaTjB-sgrCMy6Zc9Yag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f6bde68-ae5f-48e3-b569-08da89db2a7d
x-ms-traffictypediagnostic: OS3PR01MB10249:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Bf5oWndipaZLg9Fx8sHJSf+39iYcjY8ZenP6TZDGUX713fjgUstE0t/HDGH4triOMLrJXAbgz6v7dt8mVZ2MJO1sAoj/YmlFFfX1f4rU3MXr0s3K5flT7j2KrzGtenzRgnmSi4LGJ9/Rks5dLqnsThvGn4uaHRp6bCgtbgDGrqvLjyYpJBhzO1oyIpaOW7gN++P/cRnfSFkTZaCot2EOTK0/ub6KT1rqZxnrbOeCDY6pJP1B7pARhh2RNGAcSXyefJc+luYDuRAHWGBbu5Y9i7uFgG29tyWGmYH7QDclbGbUuEeuaAEWop/WGvLGRG/DjoCMvFfgpsmuQK7GGFKaQWuEga/cSa7YLqXs4QWouosiuWOsljzVeqM46/wbRpNxDhDyp3yWyrNevKLSgGryKneKgmxNxRFLxkWzJ3Ja7JAm2JnSfv/F8lomxtGQLcDkG/lc2s8cenichV3WysNzLIhLs57vbhS+JmZP/sY996LuSlj7YQwpm9aV1HkxKl9d5OV83E+/VTE1a1xQdF3XDTEv0KmyXSW3Qj5kou6gMhiFE+XEMko3TyHXkBh/0Ucd+3CtFf9JI98+rB6W9t/oFFLIBPO5knADK2adiAoIcT9YQzWRsCesqqN4iWXQqjaqtuqIhsyx+eIWTK3YvudIVedEfE84NX9hO4EVsqi9U0omqnguxmdBeF5D2zD3XI2tyJFFthMoyzDxslywRCTvhqaWqrFDCO2D0XpPfLcUJ+yhOpbiWVbwbGyaH7estbeHKwYnJgRGeob7sypB4HDCzrmLqioa9yRT88V5OJtpx70Y5d+ThkY10OUTSrlHUD5CMQjkleiE6N0XMMyN7720Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(7416002)(30864003)(66946007)(45080400002)(8676002)(4326008)(76116006)(66556008)(66446008)(64756008)(33656002)(38100700002)(86362001)(38070700005)(122000001)(966005)(83380400001)(186003)(41300700001)(478600001)(6506007)(26005)(7696005)(71200400001)(9686003)(316002)(110136005)(55016003)(54906003)(2906002)(66476007)(5660300002)(52536014)(8936002)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e+GU2hqxx03DhlgrgHFr4kajG0WdlBOzjfjEPmf3awr/HUf9gXkz99PQbGPl?=
 =?us-ascii?Q?6sypeTLV8dSrH7c4ujg5RuMsCK11r10FK9TJ89QpHpLD/LBqdL0sq9J2Z2FP?=
 =?us-ascii?Q?B/Jk7hpuE8IS5/fo0u9UUmi/xhkjGsjPhDx4QS5+fySAgVgE02ZnG08zhSe6?=
 =?us-ascii?Q?wtfqDbZrPWPtVEdv/DD1hsYnlPcJfS97TLDRWFh3Z1UfLcOpDgC86GFvpztA?=
 =?us-ascii?Q?glsVLK2ynY7L12GPIgWU7IU5tLcjUlzUkYM3JH+2kEQfA15W4z/A34/UI715?=
 =?us-ascii?Q?B7azthEXEyXBoxdxWX9ZF/Ar/DIjAV31urA7o+k48gg3mkeHJeQpxTaY7rXB?=
 =?us-ascii?Q?3N2AP57s1X/bs6rmr9sx27+nOtmiU5H4eRdkB037KRX5b7zuo9np1k1X8RrF?=
 =?us-ascii?Q?j4WcWys+gTJLI/8QwRFdt2sWl1MRpI49zvqkPksfjIdZ53qPN1AAYrKHM1gf?=
 =?us-ascii?Q?LmzjADP0RedG38/KM2jWjFIwZkha+/uRA4CPmZok5ACYNQka5jQ+Hy0qj3Gt?=
 =?us-ascii?Q?Qzy24ql+jM10AQFxT+2Z2LTuQYyeRFapf6JLq07tyAuOVIDAhCAfXs99hkpE?=
 =?us-ascii?Q?ucApFbUAmkGVWlUdH4N9/XXqKpdzIC0n4yIqebSyBL+XMOP751mXxM3MjyjR?=
 =?us-ascii?Q?L5IolLVsI3GJQv250qMGxanIeMnPUaL1K4as7iHV9SNyUgPRd4xCMjVV4/0n?=
 =?us-ascii?Q?s0t5d58ONKAnPeTeoa5yITsK8zH36om5kKMcyq9XRH3Pq3od8OP8v58URcNY?=
 =?us-ascii?Q?YafMfra4ywm+ZJETnBucGxMQCjnTEJilCeJhBsTxISVUX6+2le3xj4xR8OC6?=
 =?us-ascii?Q?TdI5HyPQuFnlQ+uANNLMu5y5UA7afjwO8uNkBAdr1nR6ccY1I4neOhgEJu7E?=
 =?us-ascii?Q?PYnQkY4k/mrZ6i3TQdNbcTR+uCFXszUKQ16YablsMOv1/xoc2PzrIWnL44vZ?=
 =?us-ascii?Q?aX8/zhpmOshAecDYv7E8Kt0A7yRoG4JD2fKLFQpD7c33pg1XHPf7DsbY/xEU?=
 =?us-ascii?Q?fZp8Cdd4QgCWZXbedcbnVrUaYY2x2rVSYSBHHNhorBxYPGkFvl2DFy8cWYCq?=
 =?us-ascii?Q?xvZ+3/BRsCj2sBeTHkWzwABsXlpDI86x8ZO1U4+zezFg2u/qQrKZQPMw1/9W?=
 =?us-ascii?Q?fWqAW2UmKln0qh4SjVTqDdHQ03VoWnyTBHUzoNXFRPuj77xXQZ2LsamewBW/?=
 =?us-ascii?Q?ygOf/xtEt3SVtzEQPddqA/7UHYZTf4IgTJSiHjEVqHHx1C2RPqnjlC6uTIeK?=
 =?us-ascii?Q?j6ww4FIUFj43RZKRYx3OdXb07fmmPXo5q6LU5eUIFfXuBudJxRnOyHgceHvA?=
 =?us-ascii?Q?7EXa+VFkGx9w44jO/PahFyEX0lgkmWQUnFkTblL8C5J/ynFjyuWyME2qjXJu?=
 =?us-ascii?Q?2eMGD00hrriX1GcJfipd/GO94fXjcgBvRypWLsz5zmZcd7uDnZhFSCunTU85?=
 =?us-ascii?Q?ZkHIQHC3Bqg60Kii7yPysjQJ21NDAHVEiCgKKE1ZzCTHyJhYVLfA0mTgdw/w?=
 =?us-ascii?Q?J/ZI/z5KrfDu2TFDeNSN6HqJB5Fnw1RupBt5aAT0+TF5yEnPO0tjQ+dSW0QH?=
 =?us-ascii?Q?0Wcdrp7ZEljTMD7XEF61alYHKGwL0ITPnHwsigLJQA5CqDiWfaq4u+S7lsug?=
 =?us-ascii?Q?6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6bde68-ae5f-48e3-b569-08da89db2a7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 16:26:02.9446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSYAttMuz7wjpb+DIejebBAYJVZ4k8zbkSoTOzJe6sIW60LiSipC0inTFSNXZymbI73mgpCRv0U0/JgcYIJ+OY7LYDTkB+csqEoFVT0OQzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10249
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

Thanks for the feedback.

> Subject: Re: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
>=20
> Hey Biju,
>=20
> The patch does not apply on drm-misc-next, could you rebase it and
> submit the next version?

I believe[1] is dependent on this patch series. Sorry for not
making it clear while sending this patch series out.

I thought Laurent is going to give a pull request for RCar DU patches.

Based on that assumption, currently my environment is drm-tip +=20
12 patches from[2], as [2] doesn't have all the latest patches from
drm-misc-next/drm-tip.

[1] https://git.linuxtv.org/pinchartl/media.git/commit/drivers/gpu/drm/rcar=
-du?h=3Ddrm/du/next&id=3D2de250465c3ed5e13bfb5139d9a8c17105d3a1f1

[2] https://git.linuxtv.org/pinchartl/media.git/log/drivers/gpu/drm/rcar-du=
?h=3Ddrm/du/next

>=20
> Additionally it has a few 'checkpatch --strict' warnings.

I got a review comment[3] to use (1 << 1) style instead of BIT macro.
Some of the warnings related to this.

[3]https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220328065=
115.11724-1-biju.das.jz@bp.renesas.com/

Laurent, any thoughts??

Cheers,
Biju

>=20
> On Mon, 29 Aug 2022 at 11:19, Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> >
> > This driver supports the MIPI DSI encoder found in the RZ/G2L SoC. It
> > currently supports DSI video mode only.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > v5->v6:
> >  * Updated commit description
> >  * Moved handling of arst and prst from rzg2l_mipi_dsi_startup-
> >runtime
> >    PM suspend/resume handlers.
> >  * Max lane capability read at probe(), and enforced in
> >    rzg2l_mipi_dsi_host_attach()
> >  * Simplified vich1ppsetr setting.
> >  * Renamed hsclk_running_mode,hsclk_mode->is_clk_cont.
> >  * Fixed typo in probe error message(arst->rst).
> >  * Reordered DRM bridge initaization in probe()
> >  * Updated typo in e-mail address.
> > v4->v5:
> >  * Added Ack from Sam.
> >  * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
> >    with drm_of_get_data_lanes_count_ep() in probe.
> > v3->v4:
> >  * Updated error handling in rzg2l_mipi_dsi_startup() and
> > rzg2l_mipi_dsi_atomic_enable()
> > v2->v3:
> >  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function
> instead
> >    of the memory pointer
> >  * Fixed the comment in rzg2l_mipi_dsi_startup()
> >  * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
> >  * DRM bridge parameter initialization moved to probe
> >  * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
> >  * Inserted the missing blank lane after return in probe()
> >  * Added missing MODULE_DEVICE_TABLE
> >  * Added include linux/bits.h in header file
> >  * Fixed various macros in header file.
> >  * Reorder the make file for DSI, so that it is no more dependent
> >    on RZ/G2L DU patch series.
> > v1->v2:
> >  * Rework based on dt-binding change (DSI + D-PHY) as single block
> >  * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
> >  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
> >    and rzg2l_mipi_dsi_link_write
> >  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> > RFC->v1:
> >  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
> >    and dropped DRM as it is implied by DRM_BRIDGE
> >  * Used devm_reset_control_get_exclusive() for reset handle
> >  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
> >  * Added error check for pm, using pm_runtime_resume_and_get() instead
> of
> >    pm_runtime_get_sync()
> >  * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
> >  * Avoided read-modify-write stopping hsclock
> >  * Used devm_platform_ioremap_resource for resource allocation
> >  * Removed unnecessary assert call from probe and remove.
> >  * wrap the line after the PTR_ERR() in probe()
> >  * Updated reset failure messages in probe
> >  * Fixed the typo arstc->prstc
> >  * Made hex constants to lower case.
> > RFC:
> >  *
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> > hwork.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F2022011217461
> > 2.10773-23-biju.das.jz%40bp.renesas.com%2F&amp;data=3D05%7C01%7Cbiju.da=
s
> > .jz%40bp.renesas.com%7C003e031f5e7f454bdfdf08da89d4d82d%7C53d82571da19
> > 47e49cb4625a166a4a2a%7C0%7C0%7C637973844501238222%7CUnknown%7CTWFpbGZs
> > b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> > %7C3000%7C%7C%7C&amp;sdata=3DuNJMSsB3FHHDBnczS4jLEL8OADLe03K6gksF2aNn31=
k
> > %3D&amp;reserved=3D0
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> >  drivers/gpu/drm/rcar-du/Makefile              |   2 +
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 703
> ++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
> >  4 files changed, 864 insertions(+)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> > b/drivers/gpu/drm/rcar-du/Kconfig index c959e8c6be7d..58ffb8c2443b
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -51,6 +51,14 @@ config DRM_RCAR_MIPI_DSI
> >         help
> >           Enable support for the R-Car Display Unit embedded MIPI DSI
> encoders.
> >
> > +config DRM_RZG2L_MIPI_DSI
> > +       tristate "RZ/G2L MIPI DSI Encoder Support"
> > +       depends on DRM_BRIDGE && OF
> > +       depends on ARCH_RENESAS || COMPILE_TEST
> > +       select DRM_MIPI_DSI
> > +       help
> > +         Enable support for the RZ/G2L Display Unit embedded MIPI DSI
> encoders.
> > +
> >  config DRM_RCAR_VSP
> >         bool "R-Car DU VSP Compositor Support" if ARM
> >         default y if ARM64
> > diff --git a/drivers/gpu/drm/rcar-du/Makefile
> > b/drivers/gpu/drm/rcar-du/Makefile
> > index 6f132325c8b7..b8f2c82651d9 100644
> > --- a/drivers/gpu/drm/rcar-du/Makefile
> > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > @@ -14,3 +14,5 @@ obj-$(CONFIG_DRM_RCAR_DU)             +=3D rcar-du-
> drm.o
> >  obj-$(CONFIG_DRM_RCAR_DW_HDMI)         +=3D rcar_dw_hdmi.o
> >  obj-$(CONFIG_DRM_RCAR_LVDS)            +=3D rcar_lvds.o
> >  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)                +=3D rcar_mipi_dsi.o
> > +
> > +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)       +=3D rzg2l_mipi_dsi.o
> > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > new file mode 100644
> > index 000000000000..46a71e39e336
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > @@ -0,0 +1,703 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/G2L MIPI DSI Encoder Driver
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */ #include
> > +<linux/clk.h> #include <linux/delay.h> #include <linux/io.h> #include
> > +<linux/iopoll.h> #include <linux/module.h> #include <linux/of.h>
> > +#include <linux/of_device.h> #include <linux/of_graph.h> #include
> > +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
> > +<linux/reset.h> #include <linux/slab.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "rzg2l_mipi_dsi_regs.h"
> > +
> > +struct rzg2l_mipi_dsi {
> > +       struct device *dev;
> > +       void __iomem *mmio;
> > +
> > +       struct reset_control *rstc;
> > +       struct reset_control *arstc;
> > +       struct reset_control *prstc;
> > +
> > +       struct mipi_dsi_host host;
> > +       struct drm_bridge bridge;
> > +       struct drm_bridge *next_bridge;
> > +
> > +       struct clk *vclk;
> > +
> > +       enum mipi_dsi_pixel_format format;
> > +       unsigned int num_data_lanes;
> > +       unsigned int max_lanes;
> > +       unsigned int lanes;
> > +       unsigned long mode_flags;
> > +};
> > +
> > +static inline struct rzg2l_mipi_dsi * bridge_to_rzg2l_mipi_dsi(struct
> > +drm_bridge *bridge) {
> > +       return container_of(bridge, struct rzg2l_mipi_dsi, bridge); }
> > +
> > +static inline struct rzg2l_mipi_dsi * host_to_rzg2l_mipi_dsi(struct
> > +mipi_dsi_host *host) {
> > +       return container_of(host, struct rzg2l_mipi_dsi, host); }
> > +
> > +static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32
> > +reg, u32 data) {
> > +       iowrite32(data, dsi->mmio + reg); }
> > +
> > +static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32
> > +reg, u32 data) {
> > +       iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg); }
> > +
> > +static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32
> > +reg) {
> > +       return ioread32(dsi->mmio + LINK_REG_OFFSET + reg); }
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Hardware Setup
> > + */
> > +
> > +static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > +                                 const struct drm_display_mode *mode)
> > +{
> > +       unsigned long hsfreq;
> > +       u32 txsetr;
> > +       u32 clstptsetr;
> > +       u32 lptrnstsetr;
> > +       u32 clkkpt;
> > +       u32 clkbfht;
> > +       u32 clkstpt;
> > +       u32 golpbkt;
> > +       unsigned int bpp;
> > +       struct {
> > +               u32 tclk_miss;
> > +               u32 t_init;
> > +               u32 tclk_prepare;
> > +               u32 tclk_settle;
> > +               u32 tclk_trail;
> > +               u32 tclk_post;
> > +               u32 tclk_pre;
> > +               u32 tclk_zero;
> > +               u32 tlpx;
> > +               u32 ths_prepare;
> > +               u32 ths_settle;
> > +               u32 ths_exit;
> > +               u32 ths_trail;
> > +               u32 ths_zero;
> > +       } timings;
> > +       u32 dphyctrl0;
> > +       u32 dphytim0;
> > +       u32 dphytim1;
> > +       u32 dphytim2;
> > +       u32 dphytim3;
> > +       int ret;
> > +
> > +       /*
> > +        * Relationship between hsclk and vclk must follow
> > +        * vclk * bpp =3D hsclk * 8 * lanes
> > +        * where vclk: video clock (Hz)
> > +        *       bpp: video pixel bit depth
> > +        *       hsclk: DSI HS Byte clock frequency (Hz)
> > +        *       lanes: number of data lanes
> > +        *
> > +        * hsclk(bit) =3D hsclk(byte) * 8
> > +        */
> > +       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +       hsfreq =3D (mode->clock * bpp * 8) / (8 * dsi->lanes);
> > +
> > +       /* All DSI global operation timings are set with recommended
> setting */
> > +       if (hsfreq > 250000) {
> > +               timings.tclk_miss =3D 1;
> > +               timings.t_init =3D 79801;
> > +               timings.tclk_prepare =3D 8;
> > +               timings.tclk_settle =3D 9;
> > +               timings.tclk_trail =3D 7;
> > +               timings.tclk_post =3D 35;
> > +               timings.tclk_pre =3D 4;
> > +               timings.tclk_zero =3D 33;
> > +               timings.tlpx =3D 6;
> > +               timings.ths_prepare =3D 9;
> > +               timings.ths_settle =3D 9;
> > +               timings.ths_exit =3D 13;
> > +               timings.ths_trail =3D 9;
> > +               timings.ths_zero =3D 16;
> > +       } else {
> > +               timings.tclk_miss =3D 1;
> > +               timings.t_init =3D 79801;
> > +               timings.tclk_prepare =3D 8;
> > +               timings.tclk_settle =3D 9;
> > +               timings.tclk_trail =3D 10;
> > +               timings.tclk_post =3D 94;
> > +               timings.tclk_pre =3D 13;
> > +               timings.tclk_zero =3D 33;
> > +               timings.tlpx =3D 6;
> > +               timings.ths_prepare =3D 12;
> > +               timings.ths_settle =3D 9;
> > +               timings.ths_exit =3D 13;
> > +               timings.ths_trail =3D 17;
> > +               timings.ths_zero =3D 23;
> > +       }
> > +
> > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +
> > +       /* Initializing DPHY before accessing LINK */
> > +       dphyctrl0 =3D DSIDPHYCTRL0_CAL_EN_HSRX_OFS |
> DSIDPHYCTRL0_CMN_MASTER_EN |
> > +                   DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 |
> > + DSIDPHYCTRL0_EN_BGR;
> > +
> > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > +       usleep_range(20, 30);
> > +
> > +       dphyctrl0 |=3D DSIDPHYCTRL0_EN_LDO1200;
> > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > +       usleep_range(10, 20);
> > +
> > +       dphytim0 =3D DSIDPHYTIM0_TCLK_MISS(timings.tclk_miss) |
> > +                  DSIDPHYTIM0_T_INIT(timings.t_init);
> > +       dphytim1 =3D DSIDPHYTIM1_THS_PREPARE(timings.ths_prepare) |
> > +                  DSIDPHYTIM1_TCLK_PREPARE(timings.tclk_prepare) |
> > +                  DSIDPHYTIM1_THS_SETTLE(timings.ths_settle) |
> > +                  DSIDPHYTIM1_TCLK_SETTLE(timings.tclk_settle);
> > +       dphytim2 =3D DSIDPHYTIM2_TCLK_TRAIL(timings.tclk_trail) |
> > +                  DSIDPHYTIM2_TCLK_POST(timings.tclk_post) |
> > +                  DSIDPHYTIM2_TCLK_PRE(timings.tclk_pre) |
> > +                  DSIDPHYTIM2_TCLK_ZERO(timings.tclk_zero);
> > +       dphytim3 =3D DSIDPHYTIM3_TLPX(timings.tlpx) |
> > +                  DSIDPHYTIM3_THS_EXIT(timings.ths_exit) |
> > +                  DSIDPHYTIM3_THS_TRAIL(timings.ths_trail) |
> > +                  DSIDPHYTIM3_THS_ZERO(timings.ths_zero);
> > +
> > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM0, dphytim0);
> > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM1, dphytim1);
> > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
> > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
> > +
> > +       ret =3D reset_control_deassert(dsi->rstc);
> > +       if (ret < 0)
> > +               goto err_rstc;
> > +
> > +       udelay(1);
> > +
> > +       /* Enable Data lanes and Clock lanes */
> > +       txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) |
> TXSETR_CLEN;
> > +       rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
> > +
> > +       /*
> > +        * Global timings characteristic depends on high speed Clock
> Frequency
> > +        * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> > +        * - videoclock =3D 148.5 (MHz)
> > +        * - bpp: maximum 24bpp
> > +        * - data lanes: maximum 4 lanes
> > +        * Therefore maximum hsclk will be 891 Mbps.
> > +        */
> > +       if (hsfreq > 445500) {
> > +               clkkpt =3D 12;
> > +               clkbfht =3D 15;
> > +               clkstpt =3D 48;
> > +               golpbkt =3D 75;
> > +       } else if (hsfreq > 250000) {
> > +               clkkpt =3D 7;
> > +               clkbfht =3D 8;
> > +               clkstpt =3D 27;
> > +               golpbkt =3D 40;
> > +       } else {
> > +               clkkpt =3D 8;
> > +               clkbfht =3D 6;
> > +               clkstpt =3D 24;
> > +               golpbkt =3D 29;
> > +       }
> > +
> > +       clstptsetr =3D CLSTPTSETR_CLKKPT(clkkpt) |
> CLSTPTSETR_CLKBFHT(clkbfht) |
> > +                    CLSTPTSETR_CLKSTPT(clkstpt);
> > +       rzg2l_mipi_dsi_link_write(dsi, CLSTPTSETR, clstptsetr);
> > +
> > +       lptrnstsetr =3D LPTRNSTSETR_GOLPBKT(golpbkt);
> > +       rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
> > +
> > +       return 0;
> > +
> > +err_rstc:
> > +       pm_runtime_put(dsi->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi
> *dsi,
> > +                                             const struct
> > +drm_display_mode *mode) {
> > +       u32 vich1ppsetr;
> > +       u32 vich1vssetr;
> > +       u32 vich1vpsetr;
> > +       u32 vich1hssetr;
> > +       u32 vich1hpsetr;
> > +       int dsi_format;
> > +       u32 delay[2];
> > +       u8 index;
> > +
> > +       /* Configuration for Pixel Packet */
> > +       dsi_format =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +       switch (dsi_format) {
> > +       case 24:
> > +               vich1ppsetr =3D VICH1PPSETR_DT_RGB24;
> > +               break;
> > +       case 18:
> > +               vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
> > +               break;
> > +       }
> > +
> > +       if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
> > +           !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
> > +               vich1ppsetr |=3D VICH1PPSETR_TXESYNC_PULSE;
> > +
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
> > +
> > +       /* Configuration for Video Parameters */
> > +       vich1vssetr =3D VICH1VSSETR_VACTIVE(mode->vdisplay) |
> > +                     VICH1VSSETR_VSA(mode->vsync_end - mode-
> >vsync_start);
> > +       vich1vssetr |=3D (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
> > +                       VICH1VSSETR_VSPOL_HIGH :
> > + VICH1VSSETR_VSPOL_LOW;
> > +
> > +       vich1vpsetr =3D VICH1VPSETR_VFP(mode->vsync_start - mode-
> >vdisplay) |
> > +                     VICH1VPSETR_VBP(mode->vtotal - mode->vsync_end);
> > +
> > +       vich1hssetr =3D VICH1HSSETR_HACTIVE(mode->hdisplay) |
> > +                     VICH1HSSETR_HSA(mode->hsync_end - mode-
> >hsync_start);
> > +       vich1hssetr |=3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ?
> > +                       VICH1HSSETR_HSPOL_HIGH :
> > + VICH1HSSETR_HSPOL_LOW;
> > +
> > +       vich1hpsetr =3D VICH1HPSETR_HFP(mode->hsync_start - mode-
> >hdisplay) |
> > +                     VICH1HPSETR_HBP(mode->htotal - mode->hsync_end);
> > +
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1VSSETR, vich1vssetr);
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1VPSETR, vich1vpsetr);
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
> > +
> > +       /*
> > +        * Configuration for Delay Value
> > +        * Delay value based on 2 ranges of video clock.
> > +        * 74.25MHz is videoclock of HD@60p or FHD@30p
> > +        */
> > +       if (mode->clock > 74250) {
> > +               delay[0] =3D 231;
> > +               delay[1] =3D 216;
> > +       } else {
> > +               delay[0] =3D 220;
> > +               delay[1] =3D 212;
> > +       }
> > +
> > +       if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > +               index =3D 0;
> > +       else
> > +               index =3D 1;
> > +
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1SET1R,
> > +                                 VICH1SET1R_DLY(delay[index])); }
> > +
> > +static int rzg2l_mipi_dsi_start_hs_clock(struct rzg2l_mipi_dsi *dsi)
> > +{
> > +       bool is_clk_cont;
> > +       u32 hsclksetr;
> > +       u32 status;
> > +       int ret;
> > +
> > +       is_clk_cont =3D !(dsi->mode_flags &
> > + MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +       /* Start HS clock */
> > +       hsclksetr =3D HSCLKSETR_HSCLKRUN_HS | (is_clk_cont ?
> > +                                            HSCLKSETR_HSCLKMODE_CONT
> :
> > +
> HSCLKSETR_HSCLKMODE_NON_CONT);
> > +       rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR, hsclksetr);
> > +
> > +       if (is_clk_cont) {
> > +               ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read,
> status,
> > +                                       status & PLSR_CLLP2HS,
> > +                                       2000, 20000, false, dsi,
> PLSR);
> > +               if (ret < 0) {
> > +                       dev_err(dsi->dev, "failed to start HS
> clock\n");
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       dev_dbg(dsi->dev, "Start High Speed Clock with %s clock mode",
> > +               is_clk_cont ? "continuous" : "non-continuous");
> > +
> > +       return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_hs_clock(struct rzg2l_mipi_dsi *dsi) {
> > +       bool is_clk_cont;
> > +       u32 status;
> > +       int ret;
> > +
> > +       is_clk_cont =3D !(dsi->mode_flags &
> > + MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +       /* Stop HS clock */
> > +       rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR,
> > +                                 is_clk_cont ?
> HSCLKSETR_HSCLKMODE_CONT :
> > +                                 HSCLKSETR_HSCLKMODE_NON_CONT);
> > +
> > +       if (is_clk_cont) {
> > +               ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read,
> status,
> > +                                       status & PLSR_CLHS2LP,
> > +                                       2000, 20000, false, dsi,
> PLSR);
> > +               if (ret < 0) {
> > +                       dev_err(dsi->dev, "failed to stop HS
> clock\n");
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi) {
> > +       u32 vich1set0r;
> > +       u32 status;
> > +       int ret;
> > +
> > +       /* Configuration for Blanking sequence and start video input*/
> > +       vich1set0r =3D VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
> > +                    VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
> > +
> > +       ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +                               status & VICH1SR_VIRDY,
> > +                               2000, 20000, false, dsi, VICH1SR);
> > +       if (ret < 0)
> > +               dev_err(dsi->dev, "Failed to start video signal
> > + input\n");
> > +
> > +       return ret;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi) {
> > +       u32 status;
> > +       int ret;
> > +
> > +       rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R,
> VICH1SET0R_VSTPAFT);
> > +       ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +                               (status & VICH1SR_STOP) && (!(status &
> VICH1SR_RUNNING)),
> > +                               2000, 20000, false, dsi, VICH1SR);
> > +       if (ret < 0)
> > +               goto err;
> > +
> > +       ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +                               !(status & LINKSR_HSBUSY),
> > +                               2000, 20000, false, dsi, LINKSR);
> > +       if (ret < 0)
> > +               goto err;
> > +
> > +       return 0;
> > +
> > +err:
> > +       dev_err(dsi->dev, "Failed to stop video signal input\n");
> > +       return ret;
> > +}
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Bridge
> > + */
> > +
> > +static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
> > +                                enum drm_bridge_attach_flags flags) {
> > +       struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge)=
;
> > +
> > +       return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> bridge,
> > +                                flags); }
> > +
> > +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> > +                                        struct drm_bridge_state
> > +*old_bridge_state) {
> > +       struct drm_atomic_state *state =3D old_bridge_state->base.state=
;
> > +       struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge)=
;
> > +       const struct drm_display_mode *mode;
> > +       struct drm_connector *connector;
> > +       struct drm_crtc *crtc;
> > +       int ret;
> > +
> > +       connector =3D drm_atomic_get_new_connector_for_encoder(state,
> bridge->encoder);
> > +       crtc =3D drm_atomic_get_new_connector_state(state, connector)-
> >crtc;
> > +       mode =3D &drm_atomic_get_new_crtc_state(state,
> > + crtc)->adjusted_mode;
> > +
> > +       ret =3D rzg2l_mipi_dsi_startup(dsi, mode);
> > +       if (ret < 0)
> > +               return;
> > +
> > +       rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > +
> > +       ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
> > +       if (ret < 0)
> > +               goto err_hs_clock;
> > +
> > +       ret =3D rzg2l_mipi_dsi_start_video(dsi);
> > +       if (ret < 0)
> > +               goto err_video;
> > +
> > +       return;
> > +
> > +err_video:
> > +       rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > +err_hs_clock:
> > +       reset_control_assert(dsi->rstc);
> > +       pm_runtime_put(dsi->dev);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> > +                                         struct drm_bridge_state
> > +*old_bridge_state) {
> > +       struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge)=
;
> > +
> > +       rzg2l_mipi_dsi_stop_video(dsi);
> > +       rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > +       reset_control_assert(dsi->rstc);
> > +       pm_runtime_put(dsi->dev);
> > +}
> > +
> > +static enum drm_mode_status
> > +rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> > +                                const struct drm_display_info *info,
> > +                                const struct drm_display_mode *mode)
> > +{
> > +       if (mode->clock > 148500)
> > +               return MODE_CLOCK_HIGH;
> > +
> > +       return MODE_OK;
> > +}
> > +
> > +static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops =3D {
> > +       .attach =3D rzg2l_mipi_dsi_attach,
> > +       .atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +       .atomic_destroy_state =3D
> drm_atomic_helper_bridge_destroy_state,
> > +       .atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +       .atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
> > +       .atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
> > +       .mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Host setting
> > + */
> > +
> > +static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> > +                                     struct mipi_dsi_device *device)
> > +{
> > +       struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +       int ret;
> > +
> > +       if (dsi->max_lanes < dsi->lanes || device->lanes > dsi-
> >num_data_lanes) {
> > +               dev_err(dsi->dev, "Invalid lanes");
> > +               return -EINVAL;
> > +       }
> > +
> > +       switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> > +       case 24:
> > +       case 18:
> > +               break;
> > +       default:
> > +               dev_warn(dsi->dev, "unsupported format");
> > +               return -EINVAL;
> > +       }
> > +
> > +       dsi->lanes =3D device->lanes;
> > +       dsi->format =3D device->format;
> > +       dsi->mode_flags =3D device->mode_flags;
> > +
> > +       dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> >of_node,
> > +                                                 1, 0);
> > +       if (IS_ERR(dsi->next_bridge)) {
> > +               ret =3D PTR_ERR(dsi->next_bridge);
> > +               dev_err(dsi->dev, "failed to get next bridge: %d\n",
> ret);
> > +               return ret;
> > +       }
> > +
> > +       drm_bridge_add(&dsi->bridge);
> > +
> > +       return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> > +                                     struct mipi_dsi_device *device)
> > +{
> > +       struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +
> > +       drm_bridge_remove(&dsi->bridge);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops =3D {
> > +       .attach =3D rzg2l_mipi_dsi_host_attach,
> > +       .detach =3D rzg2l_mipi_dsi_host_detach, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Power Management
> > + */
> > +
> > +static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct device
> > +*dev) {
> > +       struct rzg2l_mipi_dsi *dsi =3D dev_get_drvdata(dev);
> > +
> > +       reset_control_assert(dsi->prstc);
> > +       reset_control_assert(dsi->arstc);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct device
> > +*dev) {
> > +       struct rzg2l_mipi_dsi *dsi =3D dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       ret =3D reset_control_deassert(dsi->arstc);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret =3D reset_control_deassert(dsi->prstc);
> > +       if (ret < 0)
> > +               reset_control_assert(dsi->arstc);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct dev_pm_ops rzg2l_mipi_pm_ops =3D {
> > +       SET_RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend,
> > +rzg2l_mipi_pm_runtime_resume, NULL) };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Probe & Remove
> > + */
> > +
> > +static int rzg2l_mipi_dsi_probe(struct platform_device *pdev) {
> > +       struct rzg2l_mipi_dsi *dsi;
> > +       int ret;
> > +
> > +       dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> > +       if (!dsi)
> > +               return -ENOMEM;
> > +
> > +       platform_set_drvdata(pdev, dsi);
> > +       dsi->dev =3D &pdev->dev;
> > +
> > +       ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0,
> 1, 4);
> > +       if (ret < 0)
> > +               return dev_err_probe(dsi->dev, ret,
> > +                                    "missing or invalid data-lanes
> > + property\n");
> > +
> > +       dsi->num_data_lanes =3D ret;
> > +
> > +       dsi->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(dsi->mmio))
> > +               return PTR_ERR(dsi->mmio);
> > +
> > +       dsi->vclk =3D devm_clk_get(dsi->dev, "vclk");
> > +       if (IS_ERR(dsi->vclk))
> > +               return PTR_ERR(dsi->vclk);
> > +
> > +       dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst")=
;
> > +       if (IS_ERR(dsi->rstc))
> > +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > +                                    "failed to get rst\n");
> > +
> > +       dsi->arstc =3D devm_reset_control_get_exclusive(dsi->dev,
> "arst");
> > +       if (IS_ERR(dsi->arstc))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(dsi->arstc),
> > +                                    "failed to get arst\n");
> > +
> > +       dsi->prstc =3D devm_reset_control_get_exclusive(dsi->dev,
> "prst");
> > +       if (IS_ERR(dsi->prstc))
> > +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
> > +                                    "failed to get prst\n");
> > +
> > +       platform_set_drvdata(pdev, dsi);
> > +
> > +       pm_runtime_enable(dsi->dev);
> > +
> > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       dsi->max_lanes =3D ((rzg2l_mipi_dsi_link_read(dsi, TXSETR) >>
> 16) & 0x3) + 1;
> > +       pm_runtime_put(dsi->dev);
> > +
> > +       /* Initialize the DRM bridge. */
> > +       dsi->bridge.funcs =3D &rzg2l_mipi_dsi_bridge_ops;
> > +       dsi->bridge.of_node =3D dsi->dev->of_node;
> > +
> > +       /* Init host device */
> > +       dsi->host.dev =3D dsi->dev;
> > +       dsi->host.ops =3D &rzg2l_mipi_dsi_host_ops;
> > +       ret =3D mipi_dsi_host_register(&dsi->host);
> > +       if (ret < 0)
> > +               goto out_pm_get;
> > +
> > +       return 0;
> > +
> > +out_pm_get:
> > +       pm_runtime_disable(dsi->dev);
> > +       return ret;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_remove(struct platform_device *pdev) {
> > +       struct rzg2l_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
> > +
> > +       mipi_dsi_host_unregister(&dsi->host);
> > +       pm_runtime_disable(&pdev->dev);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> > +       { .compatible =3D "renesas,rzg2l-mipi-dsi" },
> > +       { /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
> > +
> > +static struct platform_driver rzg2l_mipi_dsi_platform_driver =3D {
> > +       .probe  =3D rzg2l_mipi_dsi_probe,
> > +       .remove =3D rzg2l_mipi_dsi_remove,
> > +       .driver =3D {
> > +               .name =3D "rzg2l-mipi-dsi",
> > +               .pm =3D &rzg2l_mipi_pm_ops,
> > +               .of_match_table =3D rzg2l_mipi_dsi_of_table,
> > +       },
> > +};
> > +
> > +module_platform_driver(rzg2l_mipi_dsi_platform_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> > +MODULE_DESCRIPTION("Renesas RZ/G2L MIPI DSI Encoder Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > new file mode 100644
> > index 000000000000..1dbc16ec64a4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > @@ -0,0 +1,151 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RZ/G2L MIPI DSI Interface Registers Definitions
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */
> > +
> > +#ifndef __RZG2L_MIPI_DSI_REGS_H__
> > +#define __RZG2L_MIPI_DSI_REGS_H__
> > +
> > +#include <linux/bits.h>
> > +
> > +/* DPHY Registers */
> > +#define DSIDPHYCTRL0                   0x00
> > +#define DSIDPHYCTRL0_CAL_EN_HSRX_OFS   BIT(16)
> > +#define DSIDPHYCTRL0_CMN_MASTER_EN     BIT(8)
> > +#define DSIDPHYCTRL0_RE_VDD_DETVCCQLV18        BIT(2)
> > +#define DSIDPHYCTRL0_EN_LDO1200                BIT(1)
> > +#define DSIDPHYCTRL0_EN_BGR            BIT(0)
> > +
> > +#define DSIDPHYTIM0                    0x04
> > +#define DSIDPHYTIM0_TCLK_MISS(x)       ((x) << 24)
> > +#define DSIDPHYTIM0_T_INIT(x)          ((x) << 0)
> > +
> > +#define DSIDPHYTIM1                    0x08
> > +#define DSIDPHYTIM1_THS_PREPARE(x)     ((x) << 24)
> > +#define DSIDPHYTIM1_TCLK_PREPARE(x)    ((x) << 16)
> > +#define DSIDPHYTIM1_THS_SETTLE(x)      ((x) << 8)
> > +#define DSIDPHYTIM1_TCLK_SETTLE(x)     ((x) << 0)
> > +
> > +#define DSIDPHYTIM2                    0x0c
> > +#define DSIDPHYTIM2_TCLK_TRAIL(x)      ((x) << 24)
> > +#define DSIDPHYTIM2_TCLK_POST(x)       ((x) << 16)
> > +#define DSIDPHYTIM2_TCLK_PRE(x)                ((x) << 8)
> > +#define DSIDPHYTIM2_TCLK_ZERO(x)       ((x) << 0)
> > +
> > +#define DSIDPHYTIM3                    0x10
> > +#define DSIDPHYTIM3_TLPX(x)            ((x) << 24)
> > +#define DSIDPHYTIM3_THS_EXIT(x)                ((x) << 16)
> > +#define DSIDPHYTIM3_THS_TRAIL(x)       ((x) << 8)
> > +#define DSIDPHYTIM3_THS_ZERO(x)                ((x) << 0)
> > +
> > +/* --------------------------------------------------------*/
> > +/* Link Registers */
> > +#define LINK_REG_OFFSET                        0x10000
> > +
> > +/* Link Status Register */
> > +#define LINKSR                         0x10
> > +#define LINKSR_LPBUSY                  BIT(13)
> > +#define LINKSR_HSBUSY                  BIT(12)
> > +#define LINKSR_VICHRUN1                        BIT(8)
> > +#define LINKSR_SQCHRUN1                        BIT(4)
> > +#define LINKSR_SQCHRUN0                        BIT(0)
> > +
> > +/* Tx Set Register */
> > +#define TXSETR                         0x100
> > +#define TXSETR_NUMLANECAP              (0x3 << 16)
> > +#define TXSETR_DLEN                    (1 << 9)
> > +#define TXSETR_CLEN                    (1 << 8)
> > +#define TXSETR_NUMLANEUSE(x)           (((x) & 0x3) << 0)
> > +
> > +/* HS Clock Set Register */
> > +#define HSCLKSETR                      0x104
> > +#define HSCLKSETR_HSCLKMODE_CONT       (1 << 1)
> > +#define HSCLKSETR_HSCLKMODE_NON_CONT   (0 << 1)
> > +#define HSCLKSETR_HSCLKRUN_HS          (1 << 0)
> > +#define HSCLKSETR_HSCLKRUN_LP          (0 << 0)
> > +
> > +/* Reset Control Register */
> > +#define RSTCR                          0x110
> > +#define RSTCR_SWRST                    BIT(0)
> > +#define RSTCR_FCETXSTP                 BIT(16)
> > +
> > +/* Reset Status Register */
> > +#define RSTSR                          0x114
> > +#define RSTSR_DL0DIR                   (1 << 15)
> > +#define RSTSR_DLSTPST                  (0xf << 8)
> > +#define RSTSR_SWRSTV1                  (1 << 4)
> > +#define RSTSR_SWRSTIB                  (1 << 3)
> > +#define RSTSR_SWRSTAPB                 (1 << 2)
> > +#define RSTSR_SWRSTLP                  (1 << 1)
> > +#define RSTSR_SWRSTHS                  (1 << 0)
> > +
> > +/* Clock Lane Stop Time Set Register */
> > +#define CLSTPTSETR                     0x314
> > +#define CLSTPTSETR_CLKKPT(x)           ((x) << 24)
> > +#define CLSTPTSETR_CLKBFHT(x)          ((x) << 16)
> > +#define CLSTPTSETR_CLKSTPT(x)          ((x) << 2)
> > +
> > +/* LP Transition Time Set Register */
> > +#define LPTRNSTSETR                    0x318
> > +#define LPTRNSTSETR_GOLPBKT(x)         ((x) << 0)
> > +
> > +/* Physical Lane Status Register */
> > +#define PLSR                           0x320
> > +#define PLSR_CLHS2LP                   BIT(27)
> > +#define PLSR_CLLP2HS                   BIT(26)
> > +
> > +/* Video-Input Channel 1 Set 0 Register */
> > +#define VICH1SET0R                     0x400
> > +#define VICH1SET0R_VSEN                        BIT(12)
> > +#define VICH1SET0R_HFPNOLP             BIT(10)
> > +#define VICH1SET0R_HBPNOLP             BIT(9)
> > +#define VICH1SET0R_HSANOLP             BIT(8)
> > +#define VICH1SET0R_VSTPAFT             BIT(1)
> > +#define VICH1SET0R_VSTART              BIT(0)
> > +
> > +/* Video-Input Channel 1 Set 1 Register */
> > +#define VICH1SET1R                     0x404
> > +#define VICH1SET1R_DLY(x)              (((x) & 0xfff) << 2)
> > +
> > +/* Video-Input Channel 1 Status Register */
> > +#define VICH1SR                                0x410
> > +#define VICH1SR_VIRDY                  BIT(3)
> > +#define VICH1SR_RUNNING                        BIT(2)
> > +#define VICH1SR_STOP                   BIT(1)
> > +#define VICH1SR_START                  BIT(0)
> > +
> > +/* Video-Input Channel 1 Pixel Packet Set Register */
> > +#define VICH1PPSETR                    0x420
> > +#define VICH1PPSETR_DT_RGB18           (0x1e << 16)
> > +#define VICH1PPSETR_DT_RGB18_LS                (0x2e << 16)
> > +#define VICH1PPSETR_DT_RGB24           (0x3e << 16)
> > +#define VICH1PPSETR_TXESYNC_PULSE      (1 << 15)
> > +#define VICH1PPSETR_VC(x)              ((x) << 22)
> > +
> > +/* Video-Input Channel 1 Vertical Size Set Register */
> > +#define VICH1VSSETR                    0x428
> > +#define VICH1VSSETR_VACTIVE(x)         (((x) & 0x7fff) << 16)
> > +#define VICH1VSSETR_VSPOL_LOW          (1 << 15)
> > +#define VICH1VSSETR_VSPOL_HIGH         (0 << 15)
> > +#define VICH1VSSETR_VSA(x)             (((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Vertical Porch Set Register */
> > +#define VICH1VPSETR                    0x42c
> > +#define VICH1VPSETR_VFP(x)             (((x) & 0x1fff) << 16)
> > +#define VICH1VPSETR_VBP(x)             (((x) & 0x1fff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Size Set Register */
> > +#define VICH1HSSETR                    0x430
> > +#define VICH1HSSETR_HACTIVE(x)         (((x) & 0x7fff) << 16)
> > +#define VICH1HSSETR_HSPOL_LOW          (1 << 15)
> > +#define VICH1HSSETR_HSPOL_HIGH         (0 << 15)
> > +#define VICH1HSSETR_HSA(x)             (((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Porch Set Register */
> > +#define VICH1HPSETR                    0x434
> > +#define VICH1HPSETR_HFP(x)             (((x) & 0x1fff) << 16)
> > +#define VICH1HPSETR_HBP(x)             (((x) & 0x1fff) << 0)
> > +
> > +#endif /* __RZG2L_MIPI_DSI_REGS_H__ */
> > --
> > 2.25.1
> >
