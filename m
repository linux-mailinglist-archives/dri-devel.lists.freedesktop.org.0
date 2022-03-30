Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CD4EB9A9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 06:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9174C10F19C;
	Wed, 30 Mar 2022 04:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E8A10F193;
 Wed, 30 Mar 2022 04:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXBr0NwKlfbrBJ/jAzL2Cc+INCkuQa8dQ6GM/EKpRWYGdIANBbKTNUdXzvlzUM7s4W5XMU5vP0p6x04S3eOwTBpOn0wnJ881oznCix+7xb402HXUspkCgf8mMhf0RYidNX157lLQNmEnG7QbeRFLqXYfdEXHULiGycwAbqvjQdD2yplQXe3tLY+Y4+OPxqmjhXT0Ae3JwanCF2YPVl32Fl2E4m1e20vR6oFAy2ChwQkE40jNqxyL8/39yXYMLQrEqhp5bsJe0V8nodbzaiKCGi7+JtJSKAQgiW/ry5P+9YijC/Xub6K+2FVzpF33hl2Pz1rmX6uwXewW1pwiBywCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RruNfurWyES/3W8FL72ZJZYFwmAHkM0FpnqLlgsCEQ=;
 b=Peze90Q/88aUAF7bzOPOpp5DxcAcAhcAGPAgu5/nxMkVnAE1jt3RWE9eP75EZyoOWrO7DbOptFaWdBxecjBw8ddEu5pyGCI/lheF5/vqp3qL+3gR+xtbT2NQk+2W92l6erwR7eT/AWZufDYugC711C9otwNEuQSicvDFfsk6/vJBwuM24imgdyald6rOGOpGDKA71hCg03ktA6VmLmZj/wjGAlPR4UJMC5fJ34yLNq33hjzHM8YHEAwTmHvI0O4fdmzl4wBAJOeBDCnKU8gVa64XD67wkI8L0uWR2KVscph5eNueE+EQm/Ck2Ss0N9oHrDGSr1lx3XP+ESFWmB/2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RruNfurWyES/3W8FL72ZJZYFwmAHkM0FpnqLlgsCEQ=;
 b=RtoQ3EdTetboY1vtkp9BOXUHdaL4MhjqLitoBF9Ogwx7TSnnzFpkT2XNreGS+hl5F0FalnbCoJ2bInCptUoQ8v9KQUoMpsKcyPg7nHMf1hFrnCDydpqywIEDncRjkuKuuygjERQ7e9oAEOGX5S+f97Gej2iHF0Ol+tsPxtl2NJA=
Received: from MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 04:29:38 +0000
Received: from MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::5d27:53d9:5dbe:49fd]) by MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::5d27:53d9:5dbe:49fd%3]) with mapi id 15.20.5102.022; Wed, 30 Mar 2022
 04:29:38 +0000
From: "VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>
To: "Lin, Tsung-hua (Ryan)" <Tsung-hua.Lin@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: fix that issue that the number of the crtc
 of the 3250c is not correct
Thread-Topic: [PATCH v2] drm/amdgpu: fix that issue that the number of the
 crtc of the 3250c is not correct
Thread-Index: AQHYQ+Hv6rbl9hCEq0aViheFKo1J4qzXTxsA
Date: Wed, 30 Mar 2022 04:29:38 +0000
Message-ID: <MW4PR12MB566833076458CCAC433C4187961F9@MW4PR12MB5668.namprd12.prod.outlook.com>
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
 <20220330024643.162230-1-tsung-hua.lin@amd.com>
In-Reply-To: <20220330024643.162230-1-tsung-hua.lin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0580cd3b-6e72-4f79-b316-08da1205e712
x-ms-traffictypediagnostic: BY5PR12MB4323:EE_
x-microsoft-antispam-prvs: <BY5PR12MB432345471498FEFAE49FCF35961F9@BY5PR12MB4323.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BptSHKWzOhzaHNP7v3sMALt9dqrFbeKZ6ZUknvEYGC/srXTpHLjonn+hmEtHENuquwvg+1wDwpfvlWvc6gb6wnqwpIvOfYvdGSPuZRZczOiKHO6YF60CTT0m5uw5R0bC9PsydAb0WbDUBF34ASYKJtFUMtxwWD/P+ZaPQ50RblNairpIOCS3ARGgV5XfrxBIiGZAVRK7UL2iar4ajj55B8N/9STmndk4upYwIVvySeHdGKGWrLQTLq9ulbL9f60hIIAQJLuCce6PwhaRwM7nnnC30RlbPADhAmFewtaxaBfqdU2ww92rVsg0kbuT3Z32+Q84PVj6aR4HfJS2/nEsGWCpVZO4uIAvLk+bydBE/gs10GgDy6XM8t3x5yMZDmoG3qqx4TX1ZtPyVbeueQuQGbBKpzyi6oq7Q7CjjQJxyHja1b16Hrzz7RO16fzwa8FJPX28SMzfngxo/R8Cub9R0eT/8xiq73Ti4F4QyIav/lrkcrW0BPRrQSpM9gK3txtH2P0iGbgNn2JBZ7R4w6H9Uf6qXmcFOIegF+t1tzViN5NAD3k7B3SkwTS5dIvK0Nc/DeuFnyZW5Eakuf0sK5K2O8FRL36CBZwM162z42C6RdleAYrYufkG1XCPLzLNuCuAwgHw3BnbPmbAYbJPjLKTr8LT0kRp0ddCDM9V6MbYN+dyZOlfqzRQnx/3FS7fsIpvxjWIP4NFD+1Eb/rpR99cAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5668.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(508600001)(122000001)(186003)(26005)(38070700005)(71200400001)(8936002)(7416002)(55016003)(2906002)(4326008)(66556008)(6862004)(86362001)(9686003)(33656002)(8676002)(7696005)(38100700002)(54906003)(316002)(76116006)(83380400001)(66946007)(66476007)(64756008)(66446008)(6506007)(6636002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qchmbPmBGeiVeuuPBTdJvcsXCzRYIwxV3jLdIzTheCbVsjvIrillVvgE7u?=
 =?iso-8859-1?Q?jvHoRl6NKEUL1c2tHTS0tgUfwnv+DAdfblNiSCH6FWEWzg+YowdgzP2G4X?=
 =?iso-8859-1?Q?R+ukrV34f+RkMFNSZAoqHgj2R+gsrt1YbiBtNFpI+ytz1gM2YmaQPO0aDK?=
 =?iso-8859-1?Q?FzMRIcXZgERLxAcmnsi4S0Q64nkhlujj2YiZWgQSo3KIskQSFrL+YCQJP2?=
 =?iso-8859-1?Q?wNRI69wbrGd4ovmorL56jNcoOFu5bdMVpA0RhUAO3nvCuA/cjnlw6Qd8bN?=
 =?iso-8859-1?Q?gGBsxrAe2AlOEklR1svUJ4mB7mPAOdvq5e+sAu2L2TtyMeW9tobueMtTNO?=
 =?iso-8859-1?Q?+S3VHA/8gN2bqIC8/OYTvWMF3ZFT8O/w5BSSxEGPhFrTOluOG+MDWb8UVR?=
 =?iso-8859-1?Q?h2atpyhpP11LPQ+6d0hD2A3B2UvXCv5mH5r2RIcJfge5fIc2XfGaVFvXAq?=
 =?iso-8859-1?Q?PQQMrFLUzoFoCmMjOuqiPHqTpx/Xm4Pv2/SKDHZ8zuNbl5gr3w6mm8jMzN?=
 =?iso-8859-1?Q?p2UD/RxgmKhiUliGT6KpBiTeWCSmuywf0HZgE2PjoHgGK3J0g/KSQ63kOi?=
 =?iso-8859-1?Q?TBz7vVBvthipZDW2d349YF9jqtzCGywXFEyZcs/cd7QIeJAKUhgrWCfDFL?=
 =?iso-8859-1?Q?CPBK/31HannxOl2UPM1z0QLlFfsBq8lA4zDmzCv7NYJ1lwdVusuFG7JYKO?=
 =?iso-8859-1?Q?JU6uVbfBEVkDixrj/TTWNogtrB0xvo17wUgzNUIbDg+SwinegcADSNCpkb?=
 =?iso-8859-1?Q?Fg3KccAz9sYDp9VCfhbFPpNKUm9+RXJoJotmUUDLAl++q+wx2GUqN14BEb?=
 =?iso-8859-1?Q?0O/JIN0QJTFi+P0EHOJzMs8JwYRiqUUip+G9xnmHMww5kabpEJyUYSMaqS?=
 =?iso-8859-1?Q?PGeH+nnmQAq5NwtdpMlx2iaLo7pqRVrwXg5jQ7DfIhJcsmbPqBvoTgCSEc?=
 =?iso-8859-1?Q?JZjV70I21DmubAJe5R0ghT2qSPKX8xocB8rDyZgC6zqwvgF8xfjQue5emA?=
 =?iso-8859-1?Q?LNw5lX8sI0F/+URv0OJGSffCWBgg+LP0mJ/8uOG+aSq9Y1AWzziqo1XcUb?=
 =?iso-8859-1?Q?D/rBWFwBNxJL0v17HWC8jx1b7rgknXYoVkpjigRv7YzTElDnunwDLRHb8J?=
 =?iso-8859-1?Q?AxFsQ+Gv3uaV2ek6kZqkqo8N5/iaWjjMFh8eMyOu0Ge0JtnjEneZZ58YE5?=
 =?iso-8859-1?Q?Rytia/HJU3JxrWuuJHi2NORZ21diRjKNX1XrOGcT27lUnT3968Kl4yLJBb?=
 =?iso-8859-1?Q?SbM+Q5KeYWE9hjZH+qMEzNocOJk1KVl0xIOyTMaU2GUBpf944FbpPpw9Ua?=
 =?iso-8859-1?Q?lyXRoq8VypU8tFA4S6IBOHEruJ3W4R+mYK2A/URG6VD4kHYAzs+zZvrNPk?=
 =?iso-8859-1?Q?yh0l07cIaA043uesAGVVawo97yOlR77A64qfneRYzFGbxu7/tJk5QGLtLO?=
 =?iso-8859-1?Q?FSFBx/BdkqTKMexXEfUfPpWlSOy5KVMKdeYVVwUr9DbRjOHAphKBdBaFJz?=
 =?iso-8859-1?Q?EASvIJ2qxdHe9UcORJcz9pEmbiXmkZqdesXFDOQ343qyOsMnH91W/elJbo?=
 =?iso-8859-1?Q?Qv8td9m97+O/wu5k70MVvtTSPXvl0YrDlw8RxUoHxLxZMVLXj2ttWFWn9o?=
 =?iso-8859-1?Q?YmAk9y4FoISc76XN7BsPS4RxNm7WaRLt+z8WiksGalneDRz8gCjagZhxqF?=
 =?iso-8859-1?Q?coj7V9X1TAKr2nahrKyEptUPs6m7Gx/WtAniLBhKLPyA991IzbWHQil+qZ?=
 =?iso-8859-1?Q?jl/0ylEs0BjUTdVHchcdqt6yUKn3/ssSSWpKYw4ik8dP3juWsS7ALlt4+5?=
 =?iso-8859-1?Q?JRSjL6kSaA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0580cd3b-6e72-4f79-b316-08da1205e712
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 04:29:38.5058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXKlIFfHmJ5UoNbv/dIhUaSEe0apWap/WfSg3T6WEHNn2q3PQKiDJMcavDCQLakvuEXIzJJffvODYU0uIvGw9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 =?iso-8859-1?Q?St=E9phane_Marchesin?= <marcheu@chromium.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Li, 
 Leon" <Leon.Li@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Drew Davenport <ddavenport@chromium.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Mark Yacoub <markyacoub@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Lin,
 Tsung-hua \(Ryan\)" <Tsung-hua.Lin@amd.com>,
 Louis Li <ching-shih.li@amd.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Ryan,

Is this change applicable on a specific kernel version?
On latest I see IP DISCOVERY based impl for CHIP_RAVEN.

>[Why]
>External displays take priority over internal display when there are fewer=
 display controllers than displays.
>
> [How]
>The root cause is because of that number of the crtc is not correct.
>The number of the crtc on the 3250c is 3, but on the 3500c is 4.
>On the source code, we can see that number of the crtc has been fixed at 4=
.
>Needs to set the num_crtc to 3 for 3250c platform.
>
>v2:
>   - remove unnecessary comments and Id
>
>Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>
>---
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/g=
pu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>index 40c91b448f7da..455a2c45e8cda 100644
>--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
> 		break;
> #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
> 	case CHIP_RAVEN:
>-		adev->mode_info.num_crtc =3D 4;
>-		adev->mode_info.num_hpd =3D 4;
>-		adev->mode_info.num_dig =3D 4;
>+		if (adev->rev_id >=3D 8) {

May I know what this ">=3D8" indicate? Also, should it be external_rev_id i=
f its based on old version?

>+			adev->mode_info.num_crtc =3D 3;
>+			adev->mode_info.num_hpd =3D 3;
>+			adev->mode_info.num_dig =3D 3;
>+		} else {
>+			adev->mode_info.num_crtc =3D 4;
>+			adev->mode_info.num_hpd =3D 4;
>+			adev->mode_info.num_dig =3D 4;
>+		}
> 		break;
> #endif
> #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
>--
>2.25.1
>

BR,
Chandan V N
