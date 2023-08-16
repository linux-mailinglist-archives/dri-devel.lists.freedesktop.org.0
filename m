Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F877E5BA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 17:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768110E383;
	Wed, 16 Aug 2023 15:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65F610E383;
 Wed, 16 Aug 2023 15:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrRWPYON/g006LZRm/8FW2Hi74KZY++3/6Wrf9uQjl+pwz4/R78KKCuBiLtDnO63MGT87vardIcak4/JGUyCkeS6nwkILToM3anhhmTQ2Ey2cs5++iGuSKaLkveGMZsmS31utG/iGdvchQj92JJcf7UQrg4nSTvre58OTpyjg1gnzMIGCDBfjiDqk2v2ni8oV5vwJXLQuzKG77Xskjne19NVsqr+pGgJRBG3lYUUL/1cSaOQU37a1BacI+owRYDf4dy8Xipelj5btthg7deszZROVOuB6byLP/aiKgTtJxL8vZYIlBG7LrXBmFzt+rVOkAYyNY8lx+CxXkyLEhys+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+uXSg7TUDLXt0Fq+Kmqr23iaYwnoFbZIn/sjXoiYgU=;
 b=ggf/oh/xBqOXHrFRrJPLOzCFkHeL+hf/ospPiiSaZwyUxsSGRmwJLAwNzF2DIQFSl7ZkH9z9YIZyfLl1gN3jUoqfBAAWpdSxWPoxbeJH/v5qtfhUFXAXz1jp0y6THrYY0Sg0IBbEUMllz5AHEZPl69etiLbzodZxymdPSDV9yaG0RMzBa5c2ckrmv4/PsOZghEij7nZXlhTEbJKxcjjSa+F0HSQ5piM2VRTSRtc+5qWGvPLQ/vRd5OBAnXHeAiFCGSqVkpyGy17lCdxI4yAK6Dm84mBFIp18Z2sfbcMEzJKVRrH8IQOcsenE37wZ+muVHa556pV0dRSP1y0kUMCzkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+uXSg7TUDLXt0Fq+Kmqr23iaYwnoFbZIn/sjXoiYgU=;
 b=5FNAf/uGXOXbXAtODGmJW+vgv7qe4dQtRxy0Un0iinl56kvENUVMC/Kv/RYmZbpOcdkvWiakDGEFK7C9Mrj0kTDvrIgNjsl8vYNz+FvWkWeWShlchYkklSXm7l9CF6BJfOeET/HIuNx3IxYWx2kztGTlGiVGRZa0NfngAnYVPaQ=
Received: from MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 by IA1PR12MB8538.namprd12.prod.outlook.com (2603:10b6:208:455::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 15:57:46 +0000
Received: from MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::c725:d5a0:a4a8:772b]) by MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::c725:d5a0:a4a8:772b%3]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 15:57:45 +0000
From: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
To: Yang Li <yang.lee@linux.alibaba.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Subject: RE: [PATCH -next] drm/amd/display: Simplify bool conversion
Thread-Topic: [PATCH -next] drm/amd/display: Simplify bool conversion
Thread-Index: AQHZ0BUQHAsPWv1SWEm90bFvesT8RK/tE/hQ
Date: Wed, 16 Aug 2023 15:57:45 +0000
Message-ID: <MN2PR12MB41288BBA7E33B34DA7E8DAF39015A@MN2PR12MB4128.namprd12.prod.outlook.com>
References: <20230816004603.2908-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230816004603.2908-1-yang.lee@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1e1560f5-33b3-4685-b0e2-cc863cd95c05;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-16T15:55:24Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR12MB4128:EE_|IA1PR12MB8538:EE_
x-ms-office365-filtering-correlation-id: 943be440-45cf-4bd7-b5c3-08db9e718859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YuHPuAaSzeG70etF5w4LVk1OLHtX5ojVXhmkjV1yS0pofSlTyxZsS6MHjYiiJ8klyR4m532YHKSWURkfYyH6tI2E2cv+/JPP/pXwYWiXl++3WBUzEdZ5YyP0S7IkNHnO7Ze351vo3ju7r/h2Sc3m9uII/pHt/cLs6J6vWehsU5AXNYC+5KZ3Du8Du1aQEkTOlzq17ptz2OWrwSkwff+/R6nPbZx5czdZlE9aYjyTTNr8uZXhlqgKlFYKAGvfoddnps8OGRv6RZyQI8hY9BxZ19sWIm1BCqyFE1kE380sa3nlSG4WB0Dbmcg74aMQwT9SG2a7sVcBJx6v/prEGAs6Z4f38YxzLdTAqM4EoaN3FmFPy8ob8A702P5LsMy4xnLpX2Zml0w5cHjPn49KdKTia79ztUvcJFPr1CTO/UxXUyVrLT0t6cO2z0bUAcfZQkqtwf03x12V3WvjJHdeqtN9OlGBFaa9+2kHv0UVAp+rYK1cC7O/mzap1lURGBy5zxGlhHqam/XUhmOqXjyI5VmoppMq+NfnKWpsSRGYhgRK3aTqXjDWlOfcdQ0dhyqPXE2EPsqkqn1nN6fr6AJgIJc6yGUv/KJTpiVh3+RY1kVgJzY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4128.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(6636002)(76116006)(66946007)(64756008)(110136005)(66476007)(66556008)(66446008)(122000001)(966005)(41300700001)(52536014)(5660300002)(38070700005)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(55016003)(478600001)(86362001)(9686003)(53546011)(33656002)(55236004)(7696005)(6506007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wVIhQ32ilQ4S9E9mvMme2cP/oZB/h22GUNgQ2ULr3xSMXTxscx0eIB5LcsQ5?=
 =?us-ascii?Q?A5EeiZ/gG+dwv2j+rnnyzmBWe18LC8vxmIsLxSR5vXaA1fMhSCqaiEZ0Vw+R?=
 =?us-ascii?Q?LAlGFqKt8t5VXv2pIfCM6zRtRM1+gWEJHUebOzoTmoWxbmAi65xg6vLOTIzf?=
 =?us-ascii?Q?zq4IZCEl2gPENSDsj8HiuuufYrX0ZYHi7Y3iMW08LoD+LTk1qrV+kJ8pF+Zb?=
 =?us-ascii?Q?yeXC5D5/va4F4tMlMifWOGR7Xg1wRe0ZQ/IzeLVDL2XJAuDFvDqAsLmwAYrJ?=
 =?us-ascii?Q?6bpgQx2FXdg7LER0d8FVQ/QFwEv7DWSXvyZjZ40teqd7CQ7Ae96LjSzdcznj?=
 =?us-ascii?Q?Gkq8Sb/IRmOejtR+uidtKgMsNsmgb/WpqrIno8MTKDey96otCRAaeVTao6yt?=
 =?us-ascii?Q?iflnbnI8B4UCb8PRWfb7vstH6UF6ehIaN/8EWO13PZiSEKWIbgbxfE44C1Nn?=
 =?us-ascii?Q?M9eAAjk4juuTDGdr/FgZBokO1aNWVjkGQB54XewzAdBrrK+uffLtVYPHy8Am?=
 =?us-ascii?Q?fMEVExobC3CCMyhufebUePOJd3GEfTEOXw5rR9xR0iKkMQ2XI4jTPafVscPC?=
 =?us-ascii?Q?AIv703AEukJ2gCzZ63dWMXzguELRYrsvQtINMggzipGNDodMcxBxi0bwxB1X?=
 =?us-ascii?Q?1w5rg+1JaMzuJktnR4glkoUJZXjkjGjElkiiqDARyJEl5Y3kXxRdH4ZbPR9Y?=
 =?us-ascii?Q?98ey0bLl2urgq4AhQ2imgXqAojwZEQNuRsOAqOgV9tkaSpIGducZARTnevWj?=
 =?us-ascii?Q?0U0MMh0MryynyJA71H/aWK1eX2oUIv1Bojvi9VP4TEYkUyZSGtlejqgZ87Re?=
 =?us-ascii?Q?C2lTUKBKy4/uuHqll6vQILtSod1q6/lDDSlzVOWVb715uPKecTJUZ3rHIKbX?=
 =?us-ascii?Q?nxqFY20fpj0NpxI1jzIKAdDech/qyAZcHI+JfuWq75oRp2mj9LuLMBFeEfMY?=
 =?us-ascii?Q?5FxK63GzoiPvcw+xd9SqgLVPbDkFvaRuf28q950JBUMJ1cqoaees3mcsPjG9?=
 =?us-ascii?Q?f9gglvUZZ1cEV/alAGdilLRckJ03cVhc5lAsia5FSVLpsGHHCDSUUhrUx2WR?=
 =?us-ascii?Q?eTyfbctz4r8KIbbIGsiiNBRiMuCZ0moWEh/kS4ZHHU74yn5zto/zgQYeMh1o?=
 =?us-ascii?Q?ELcLUumE5yc6WF5JxKRCDQb1b6fd86auA/tSi1nySwUOVFzzWmUAvtefTc52?=
 =?us-ascii?Q?vVzB8WHU3BMrBCEPvlZNSLynXEEMg6/FurKGe0kLO93SBwdabppyU9bBXN0R?=
 =?us-ascii?Q?cyGGTkBSn/GgO0P6FsDvpueHLFm8i3xX37ZdEOPhoyRWzMA1OJPEEK+TyB/j?=
 =?us-ascii?Q?VAXzhb8Ctw51RJljMcbOVIlY8whpDcoJ/mEFdBbS/tx8HXEX1YUVc+ieG8IC?=
 =?us-ascii?Q?u57cE+kF9LS/aV3pEt5yzNIvN1Np319f0Ct8U+kxL010MUM+QMnmF6s2bkdL?=
 =?us-ascii?Q?FSs+Rzm/13Abex9pbgTxrt5ND+nofRl9y+CRVYfZm/B574azKrMvywamtTpi?=
 =?us-ascii?Q?0Ne7v13tygmkZsBM+wn7MnOPAwufujlS5tBrFSU6Cb2Xu+I3liuWcA3sj2Vd?=
 =?us-ascii?Q?yEbPIZefVnjT1bPG2+4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4128.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943be440-45cf-4bd7-b5c3-08db9e718859
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 15:57:45.8848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sfe4o6wKgYNayeNENO7LTGQwKpoS7FEumXV9M4/L32l7RPemVE03a0rU30wytmXZDUChzVUlLsfDX26Xd9acUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8538
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Thanks Li, for the fix, the fix is already in process of merging into amd-s=
taging-drm-next.

https://patchwork.freedesktop.org/patch/552568/

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Yang Li
Sent: Wednesday, August 16, 2023 6:16 AM
To: airlied@gmail.com; daniel@ffwll.ch; Deucher, Alexander <Alexander.Deuch=
er@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; Siqueira, Rodrigo <R=
odrigo.Siqueira@amd.com>
Cc: Yang Li <yang.lee@linux.alibaba.com>; dri-devel@lists.freedesktop.org; =
amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/amd/display: Simplify bool conversion

./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:94:102-107: WARN=
ING: conversion to bool not needed here
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:102:72-77: WARNI=
NG: conversion to bool not needed here

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
index 32d3086c4cb7..5ce542b1f860 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
@@ -91,7 +91,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct =
amdgpu_dm_connector *ac
        pr_config.replay_supported =3D true;
        pr_config.replay_power_opt_supported =3D 0;
        pr_config.replay_enable_option |=3D pr_enable_option_static_screen;
-       pr_config.replay_timing_sync_supported =3D aconnector->max_vfreq >=
=3D 2 * aconnector->min_vfreq ? true : false;
+       pr_config.replay_timing_sync_supported =3D aconnector->max_vfreq >=
=3D 2 *
+aconnector->min_vfreq;

        if (!pr_config.replay_timing_sync_supported)
                pr_config.replay_enable_option &=3D ~pr_enable_option_gener=
al_ui; @@ -99,7 +99,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, =
struct amdgpu_dm_connector *ac
        debug_flags =3D (union replay_debug_flags *)&pr_config.debug_flags;
        debug_flags->u32All =3D 0;
        debug_flags->bitfields.visual_confirm =3D
-               link->ctx->dc->debug.visual_confirm =3D=3D VISUAL_CONFIRM_R=
EPLAY ? true : false;
+               link->ctx->dc->debug.visual_confirm =3D=3D VISUAL_CONFIRM_R=
EPLAY;

        link->replay_settings.replay_feature_enabled =3D true;

--
2.20.1.7.g153144c

