Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5669F409D48
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 21:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A676E23D;
	Mon, 13 Sep 2021 19:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-oln040093003005.outbound.protection.outlook.com [40.93.3.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1BD6E231
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 19:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5LYNfbllHAfGecyONJWtBUX3l33CLvrhWsRQveBSkFrw4Gl/KIPK6kT9CasmBTPG39L0QaAmtbU7ANgn93GwHXeyz7ZLEN77HvJbXDJVYO7Xy46SRlOms8pjUc6ajJ2+hCytnUYdbE7bsBYRBfOZsg8IoflIfGJzHS+rs4GCoW3rl1WRnyUZ1Ge05uSuZCkZhDX38hZc58wmnQl0029UqlVjG7HIO93hPOrYmdjGsLMNxo6/f5z8XRmbFWrC0yW1/+KFWE3w8LTJuo4QxdLAtlDedGR6DwInVgNJIRLNOj1bqRlwKb/fClHOtC24fsbi2jlvSwBtHvzRvtzwXXLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Y8iJfgoD3pcJaCiYTag9exf/ZrobisCzoKEgAvUYl5I=;
 b=Aicn/V6pCKW7pTP5+H8oMR1JMBPe/lBIeoZ9Cl3BqGlOZ5Fv49iqLJSCJE47sV61bu6jjx7XMHLRs1olMbGByU6lTr0JOek6H3ZsGEPjCZTRZN+vMe7sA0tEEiFNs6fb6HJBZK0xZiU0ZLFPEjlUdhGd0roBoz7Ngh0fXXIyxp2kYrvCTqQfRNELn2KIGnbVXBqTh78OtCVnyPPldvKa2Ix6lunT8j6uPIm84LQu/HtzSVEvb9Cj/Fgxn1QdBaEaN8qITZHRl5/0Tz/V/eg73cdN08eU8NeFuZhxfs0OCNUWzP5Cyb+CZbWu+4hMYmOMXOy1lO9/4WhHp3MUZe3lEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8iJfgoD3pcJaCiYTag9exf/ZrobisCzoKEgAvUYl5I=;
 b=JImaigRgYCcwnxdco5S3YqTi/3KHT2+KiCYItz8jbfJ3Xx0rfV73JeZotlCtHJCUX2kXRwE/i0YX+5x2HzN1qGDtg7bmq8ETJUWpo+ehcJksScUJmwcgh/uV7jgLp2ywB+CgnkEcakbcQGKbLJa6w8rWIWy96dGsk8hO4cEhBVI=
Received: from MN2PR21MB1295.namprd21.prod.outlook.com (2603:10b6:208:3e::25)
 by MN2PR21MB1535.namprd21.prod.outlook.com (2603:10b6:208:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.3; Mon, 13 Sep
 2021 19:39:43 +0000
Received: from MN2PR21MB1295.namprd21.prod.outlook.com
 ([fe80::d804:7493:8e3d:68d3]) by MN2PR21MB1295.namprd21.prod.outlook.com
 ([fe80::d804:7493:8e3d:68d3%9]) with mapi id 15.20.4478.015; Mon, 13 Sep 2021
 19:39:42 +0000
From: Haiyang Zhang <haiyangz@microsoft.com>
To: Dexuan Cui <decui@microsoft.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Topic: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Index: AQHXqM0C9sVFExQjI06yoxOltM89b6uiXCLA
Date: Mon, 13 Sep 2021 19:39:42 +0000
Message-ID: <MN2PR21MB12954E9D3C7F7BDF9B737214CAD99@MN2PR21MB1295.namprd21.prod.outlook.com>
References: <20210913182645.17075-1-decui@microsoft.com>
In-Reply-To: <20210913182645.17075-1-decui@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=dbbe75b4-87e4-4c1a-a3bd-b59ab2982ea1;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-09-13T19:38:03Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35313155-3b14-4b2e-db49-08d976ee3bec
x-ms-traffictypediagnostic: MN2PR21MB1535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR21MB1535F9CF011F3DC57F3D57ADCAD99@MN2PR21MB1535.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QECnRerTCfd7ugO9x+ZeIwy4CLmz0sT0ZHGtEAN+PUmwOmeaeqFMe2g0j1J56oiPirMnAt9OHa7b9KVPc1ePAb46bkY362IoFUJv48p2/+DlUTjOVsuqsPXrMfrfamp5X4JeBOphBY+vzfsbxnkFmpzRi7QPfx3Mhb5mP8P3qPu91lBVv96oonS/HWVHh4+O3UpFr49RDtnxcHBfIfVU3Hh9Cg4TRYDzzEEmFQLtZJVtGnB8uQzWv3SdAqRZEGDDn1YDAs0USMerjcFfddMRgHLTuQ9iCYgniblh6UIPfMdoEJaA6qXjRy7EYMdf+SnosRuxWIP1Af/7mU7qcaLVvlGUwwcXbuBr4450/YyGTuKM/01lN059oYZs1kjcpjHgavn0UqFv0P1ocNwSD7asVdWSEyaNE1nZ60evN3o9i3T63bWoROEZQSgnAxcFI9sDpxhcCaccdMXpiEJXHy9XlBpeHia4Zn/VRfiJxqAZvl856+HFsmPRgAr6YwhTiAA1DWQGgqbNTyCQwHjkEMXoY9zul/IpE9UM0LnAxwTzRAh/TYJzddQNJcf+NF6nrZJ6gEpVF2GCavkNkPCE7Q6OtAXrzG4Qk6h/bvZeT2woD2edYz2y8cuTXwVJNfkY1Fz9bR79qQqZzBaIkNlGDNaMNYNsxhzFXOkeTpwwS9KsWZdCh1Pde90IyfU3yPOz8m8dGapPkN0/WnsrbIMD6dsJsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR21MB1295.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(82950400001)(83380400001)(4326008)(10290500003)(54906003)(8676002)(2906002)(66556008)(53546011)(316002)(38070700005)(66946007)(9686003)(26005)(64756008)(71200400001)(38100700002)(76116006)(7696005)(110136005)(8990500004)(8936002)(52536014)(55016002)(33656002)(5660300002)(508600001)(86362001)(6506007)(122000001)(66476007)(186003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W0qH2dgneHatLdtEN2FAEqaWyiOeAV4k+RInRgVsTTUA64wmr+RNUgYreUYC?=
 =?us-ascii?Q?uImUowyhTrGDLP3kWDmcODkcEP5KyK7U+wKO4ndLZe108JhXyBcyJmhIeYVl?=
 =?us-ascii?Q?CMMPVM50QmgUHZdakd2K2edDRw7/wNQa6i139uDtgeXwnj3pbype2KdZHHHD?=
 =?us-ascii?Q?gDLi28yWcByPwb+qsXs8caTFXNssPsySY06EBv3K1vDhLgQgi9sZYN6aIngp?=
 =?us-ascii?Q?I6lQ57v0ioEephRscvXpBgD5NcppHd8hqqASCFicuExlmOq+vfN1/4w6ChvJ?=
 =?us-ascii?Q?0db9zrO5mY36vDidZ14IlP6UTPq22ONcsu4p6at6NTdcLjjJ65DIVvT8T8uT?=
 =?us-ascii?Q?Kauhs8r/aweXkqHtA2ZeoK4E+zns/KD5BGniNUFIWPBvRX0qQO64uUF4arb7?=
 =?us-ascii?Q?9fidUTzLOwy3yfGNPU/soQwEneXLj+0kbp3MP25YH8O+DfN+Ld+UcT/rvT5T?=
 =?us-ascii?Q?4FXvl1SF24bzPpLawhDSKnTj3VXIWzaRd23/iEpZUGjV33pKTnK5HcAAm+t8?=
 =?us-ascii?Q?bt0aSvQrOEZkO+5JkX84GEDyTiyE90/5EeMLERm/65fXC0s+CZNutqg57eoi?=
 =?us-ascii?Q?6tMJc1KWW4c1mih2ydRntvn0LfZIzw4qXEo5O8HLRXmyeZoO27P39imRQmFX?=
 =?us-ascii?Q?KVzFEERwWbSA+SPfiB4zsA8eoUFTz1oO15u7qUeVl2TserkzeIs/cpO4zZmU?=
 =?us-ascii?Q?Y5AdkmH5EY9NAfJnGKrx5Mk+5gH8oERcVx/Gj3y+WdGrJzFyO/eXUOjxFBCG?=
 =?us-ascii?Q?rs1suaW4vtiBmayaiugmqz38JO+YAeH0EPFg5dOHxKzdsjrzykSTnPleBYcD?=
 =?us-ascii?Q?+w1mY4aTseC5MkswSzfUr/Dl26mgcrFC9QiRfApYMw7fjsGB+mwbet3opg6Z?=
 =?us-ascii?Q?3UYItRjsC095fLeYELb1d0T6LQ1bWaaB+kN6iTmQlTM8lcgCWHlOBwPAKXnZ?=
 =?us-ascii?Q?OwvFY/SSm3Q0LHuYGCphaHDe2kTaRFOAKPukVlZJIqp9u5tU0N5R9r6KHAi0?=
 =?us-ascii?Q?Ae2E0yxy7gmXlYRTuJCaHrc1UI7+9lQ2gEp07N/hG4PZgnbUBEURAnHD2tXA?=
 =?us-ascii?Q?6DB4fbfGTJ0p3J0ZudHN0LuFbIGMxQSjLdyT4wCmme9YIgFzuAi6bljFpj47?=
 =?us-ascii?Q?Pl7+g9N5O+QVcWm1Ap/RBemOx+muxQWdS96puPXdbi+Akc0kCnULbd4iQ8WI?=
 =?us-ascii?Q?qCUf8cU/HR5YjV3Ho06jiWkKeHprDzVjTbnfl/RwXTVPsU0T0W5ivVRlhc6x?=
 =?us-ascii?Q?hP/xFf3WbgYBWkVE9iiFZF6/lwgl7gnWXQtZI0rkvWqGzJ0RBPKMH6pe4u9/?=
 =?us-ascii?Q?Z/0zls3uir3HPGANGh8XWQEx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR21MB1295.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35313155-3b14-4b2e-db49-08d976ee3bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 19:39:42.8538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFVdUQkLL35pEazSxi5h1y0ZYFZR5I3EYZaF4EieorBLa7cN+3W/OyPb2u45mCIDC+J1+8T495heQUwIPO5G5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR21MB1535
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



> -----Original Message-----
> From: Dexuan Cui <decui@microsoft.com>
> Sent: Monday, September 13, 2021 2:27 PM
> To: drawat.floss@gmail.com; Haiyang Zhang <haiyangz@microsoft.com>;
> airlied@linux.ie; daniel@ffwll.ch; tzimmermann@suse.de; dri-
> devel@lists.freedesktop.org
> Cc: linux-hyperv@vger.kernel.org; linux-kernel@vger.kernel.org; Dexuan
> Cui <decui@microsoft.com>
> Subject: [PATCH] drm/hyperv: Fix double mouse pointers
>=20
> It looks like Hyper-V supports a hardware cursor feature. It is not used
> by Linux VM, but the Hyper-V host still draws a point as an extra mouse
> pointer, which is unwanted, especially when Xorg is running.
>=20
> The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted
> pointer.
> When the hyperv_drm driver was developed, the function
> synthvid_send_ptr()
> was not copied from the hyperv_fb driver. Fix the issue by adding the
> function into hyperv_drm.
>=20
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic
> video device")
> Signed-off-by: Dexuan Cui <decui@microsoft.com>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm.h         |  1 +
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  1 +
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 39 ++++++++++++++++++++-
>  3 files changed, 40 insertions(+), 1 deletion(-)

Thank you!
Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
