Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398224F9D8C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 21:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7749610F22E;
	Fri,  8 Apr 2022 19:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2084.outbound.protection.outlook.com [40.107.95.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1319710F22E;
 Fri,  8 Apr 2022 19:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH2H7jnBhceWh0QgRsymAzC+lW7t5+Gx8sZy78b2Kwe+ZC6MhfQQ92aABrTJRX3B5TBi1uVBJsQ1KDC+Uw67ZsqhgHi5HaXe91TWifctO4CF+LHSHwpaZp+kNzSH7heVOotuc71TC76JRCEC+raWjkBzpZvWQ+HS4951oKxPz/LCIaoRs/KigFaOuU3N/AMIAyPBr9J4VwxeoCpBvcjgC/23kzPSYqRFKOgaGnoUPzAVWUlIbAH0pHTw3JEKCwWirURLFLFdPc1IxrRZib5OoTMNbPtQP71BFlnsg6Su+pbA3l/60mc4pdY4LmYie3OAts1+7m5uAZ9U+3gBPvt5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLxym25lY8eLjhuEQJzuPb+u1fjuMyJ5tuuAIPVtk9k=;
 b=W0Rp6/RILAd+kFDfeG6+/JebP++2AhlOzfdvT3jbCG6Kmp5om+L3hVE4YiW0rVQfrUk/75aeYUnPclsgRgsXAymwHH+f7Gg8nopYDlshoIy7JOZvefxy36YVe+0tZ7a/Gx5NiBlVSTe2NVa0MOdBumQQeR2SijUAgl3DJv6fgC38kWznr5emcpVuKh5BGD31DtDyyM8nkaXke36IED/MybpWko3D6OV2GWHbz0oe7xtK/TIS5Ezs/YFuM5AMxb0+X2EFQv3LZkAFXNKvUTvu1qh9VklELYB9pz60yIeJdZpyS1KfzzdEGMXqnbS9FuTuOYTMUhbVS4zHkoM7Bsn7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLxym25lY8eLjhuEQJzuPb+u1fjuMyJ5tuuAIPVtk9k=;
 b=gfv9HreEU7vjTReHhr0YAEVtf4Ckks5p7Bag/KOA8hZKLnhFYzoHSUfbOonR23WatWOL8jcUf9nF4g9f3PZoZvxqB9Im9nPHpoAEtjoOeBeUof/t7GLaujYjD6J6w673wX2GgafSE9e916/FJR2c5y8gjaMxGjS2EriFdkUju+Q=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN9PR12MB5081.namprd12.prod.outlook.com (2603:10b6:408:132::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 19:12:30 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d%5]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 19:12:30 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Gong, Richard"
 <Richard.Gong@amd.com>
Subject: RE: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Thread-Topic: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Thread-Index: AQHYS3ur4fhVQ9BfN02QW2I6djqPkazmYR2AgAAA6SA=
Date: Fri, 8 Apr 2022 19:12:29 +0000
Message-ID: <BL1PR12MB5157C47C289EC94283C09759E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <CADnq5_NY-2sX+5Q7LZWpRqPz0dQg4-xgqSx2_-qzvZ8Ar=J_YA@mail.gmail.com>
In-Reply-To: <CADnq5_NY-2sX+5Q7LZWpRqPz0dQg4-xgqSx2_-qzvZ8Ar=J_YA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-08T19:12:12Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=d424ae51-5b2f-43f2-9c33-e0ccdfa58293;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-08T19:12:28Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 748055a9-5543-4f00-8331-ca86da3b5771
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8c8b3c4-7f5b-4bf6-83b6-08da1993ba34
x-ms-traffictypediagnostic: BN9PR12MB5081:EE_
x-microsoft-antispam-prvs: <BN9PR12MB5081C52E92711C1E19D2AC19E2E99@BN9PR12MB5081.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsiyBNQLyIrWpq/xnk6+0hGHeWZ0fx/C0krErlrFtL0LNuf7OIpd6sHk6Q77t0dLbQntm0RqUACVXICipWgK0FHLyjMNcbdfP1VLYB5LL2daSL1YTqrahgnDRfgLaGGtbrp3ksv07Gf1ZipuDs04o6VFKlyxc1EtFoA46xs2W64c+T4QDgMjOq/mG2m7Fuiv1uCAYtqP8zitTy31OcgU1rlFCSMBztZeSkKh19eTxrnHKa/GJ2JQwhWd+WVxs0yUdA9YLCeUZVgOVuD8GQBovOLGErh8XvFNDBTO9RGF7XA4nVPFBV9FwKwya+NXDZfohx+63TR0ibibyHG8rJC6L0K4DntACGhM2qP+QlApUT+AMn8/awyYk8e+U1AHRwdeCodIeSfFLWcBo76zI0naVPZWfDfxhp3RvVI/hcg3bviGVFpTwM4pj6Dj35RbUW763lmWezzdqLOREQXkd3xlvo9ka91Wt8Jn+unIprW0iHL321vLCuD+OpiMeUT1aCCLYeEIqRpkCgnF3CdWdKOFunSaZaOwkMkhAT6dtHLqJts9NJE9KxKVE7qTsuTBoSrM/0xsx/qu0xYA6JbVmsgzx4tj+uhh5w3ZRPy3TVUgotPK4S+4HJs0yOH53Lpz4MJx4GnU16Bh/98ABv3pfaBFSklAm5JWngFiSD4qRt+DetMO3nNEehQV7uz79v9N7wErloymeOuGqM32mNsajU3FHmFBt3yAI/373d1g+qfM65yaOaZ2rCRQzr+qIVoRYGLfWW9XcFd0TXW0U7CClVLvU5NhDaWgLqwv3u50BpJeT4U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(33656002)(2906002)(53546011)(316002)(9686003)(55016003)(508600001)(5660300002)(966005)(186003)(110136005)(6636002)(54906003)(64756008)(6506007)(7696005)(76116006)(66946007)(66476007)(4326008)(8676002)(38070700005)(8936002)(66446008)(38100700002)(66556008)(71200400001)(52536014)(86362001)(122000001)(45080400002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4SEZcaY2cXIGgIhbUi+3WgX0x9zoWDhdWeIae07b3WD/4Fsd9ayT9erCgWnB?=
 =?us-ascii?Q?tyzwYEhbhfA+lVUopNbtOjWWHZlIgOZo/YCJgsheLQP5wnYFOqGe1Ick/vtT?=
 =?us-ascii?Q?mfsMnHdCvK8iloI5wxG3fxrd+CkxNeCPiL4vYwNdHuAeok7XGbylhKIS5AHr?=
 =?us-ascii?Q?by5LcTPiEf5WzQBQPsUgt3I+TOHzS5NFrgECGbdE3pPvc9MGijVKcECYgmD1?=
 =?us-ascii?Q?hOf9wdnad4/ntoevzpybdOrGHQh91LvkOt8cIjobbD4Bg2zUe5jFStKKL3Gk?=
 =?us-ascii?Q?DdhCZf+9ZftChI74GsTtPM/Jlrl+7vwDFhYhvb8WAPk4FuHkSMd7/aFt7wCY?=
 =?us-ascii?Q?oVaXn0IhptR88ypKqa2BL7iLPfDUCHL+tJT1OR5xKPGlnyGSGMiiB1XudPg5?=
 =?us-ascii?Q?Hpq1xQ6WSbnebY21FOwilKtfPVIauH0dTr0bcM1Ey3MrYP/roTl8nXue68DC?=
 =?us-ascii?Q?RTtcXKwHEnaHo9yAVfY1jbQwhTmrqlzYN1ZOhU3xIAHpn5JhT6N6dVgdUVed?=
 =?us-ascii?Q?S29VRVrQFBLd4bce8GQRHdWjzCLj0hyBVnURPVhNPXZbYVkM2QVTs2/tzxod?=
 =?us-ascii?Q?8851aOt3plPKJwCVpLnllK5ZxaLfUoposIfuwGBjcuH2/lF/7/00tLQbfJtN?=
 =?us-ascii?Q?xmIAEr5ku8bDHSR+k9ur1HB5ycH30j9NeOVwXmSf+8NychBiHiVviQ1x/GvF?=
 =?us-ascii?Q?1587Z+YBX1QIylpuNQ/Sq/63xi61bJMfYSk0E0ytafUB/JS602EuwE19E48o?=
 =?us-ascii?Q?CuMTAFRQPurydq4gnXc7eV8MYKogG0T6nOwGcO31I/k7aPrQ1I0oUNCJNMEF?=
 =?us-ascii?Q?y0cHd/hVGcSvGxN8ZGi+NVxg7sTG1MxcbKJo+nPZMUHEF6Hl/33PU2G9kS8s?=
 =?us-ascii?Q?/sY105XpIWPSWH90yBM4CR7ZLoQCWhZoyPhu/2x+UlT2ZJJakUsSfL8pFKFH?=
 =?us-ascii?Q?7kmMqxGK9PJxXyuogmB11b851Mr8ve2epR1hMMMAdY2igP46UeiO0u4U+AA2?=
 =?us-ascii?Q?OkSKWg2FTVgfcza3R5fdp8QyDlV1eG7ctp0f3DGpAv0wHVafxsxToo6zeMdX?=
 =?us-ascii?Q?wYfYDztvz1cedqpvilWGcIOpRfg/5xe04YAE5PSmJBveDnqDVBx4JjHwmcq/?=
 =?us-ascii?Q?BkUQsFvqqJR4rfV0FrcDFLEIxyjcS047uNtFqv9TT5o4s8nJ4/c4mN8DTV27?=
 =?us-ascii?Q?+ZHbTo6GjT5eKZNoqWDz5rtB/BuQawwyGrBZTDF3+iqZyvGR94FIl1Qhd1NZ?=
 =?us-ascii?Q?AhoLqFXcicVLSbTvc0P7x62v8VVkjfWbubNX84YAKmbQLg5y0w7q4UH6SPW+?=
 =?us-ascii?Q?S3wtt9bnFcpgjo8O9oxhooYiJUBasm2K9+lvthusmhAAPJC9sAc6hj0xGbmH?=
 =?us-ascii?Q?zB3NUAWYrkY6UvJIpz/XgS4RKjaKhhkjz3wz66G6UFukpqdz/+zxhSvszzep?=
 =?us-ascii?Q?YC8nw7Hga8wGONt0ARrAF0BptmOYTJeQxETO24UJk8FvOuJztxQaU0reFmIt?=
 =?us-ascii?Q?bwsWu1EbQ4pQaAZ4MSej9BSIhAGWvM3zcrUDF1fQWmorOXH5i8J6wESM8srP?=
 =?us-ascii?Q?MZiaacY6seC4RN8txvVU4QSZx6iOKyOVN2xSeAskHSlNAmpyiXnrAs+bX4PT?=
 =?us-ascii?Q?1xTD2StSCKgxx8hZ+IpReZ2fBaGf83jLqUR0cLDojf77nDMOFR9mBgGbtr0b?=
 =?us-ascii?Q?cifqUX4R5/wTfEzso09NJTfRVZc/OEZ+FUQ4xBFfcSdb5LXvnmHmdMJDuYrm?=
 =?us-ascii?Q?G/Y9C+1at9pJhTz6waGP7TXQ9w1+2EXlPe9lIvNtKB1r0d3fkN9ynqEUkCAx?=
x-ms-exchange-antispam-messagedata-1: IAWZ9myp3+UJaA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c8b3c4-7f5b-4bf6-83b6-08da1993ba34
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 19:12:29.8737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPHE2Tk6T04C4K6BZf5v4f0iveUJtIzqtoksJ/v6gcaYvIxnDxtb/0X1tYcy6f7iDquPzEcfkwdowGtgC4O85g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5081
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
Cc: Dave Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Friday, April 8, 2022 14:09
> To: Gong, Richard <Richard.Gong@amd.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Dave Airlie
> <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Maling list - DRI developers <dri-
> devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org=
>;
> LKML <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
> systems
>=20
> On Fri, Apr 8, 2022 at 3:05 PM Richard Gong <richard.gong@amd.com> wrote:
> >
> > Active State Power Management (ASPM) feature is enabled since kernel 5.=
14.
> > There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
> > used with Intel AlderLake based systems to enable ASPM. Using these GFX
> > cards as video/display output, Intel Alder Lake based systems will hang
> > during suspend/resume.
> >
> > Add extra check to disable ASPM on Intel AlderLake based systems.
> >
> > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > Link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.fr
> eedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1885&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%7
> C440357cd10e74d8c4e1d08da1993344b%7C3dd8961fe4884e608e11a82d994e1
> 83d%7C0%7C0%7C637850417310167943%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 3000&amp;sdata=3DWXyESh1FGlxgFLH14P7pYJu3tsyp53uKpUP9NyDV5yE%3D&am
> p;reserved=3D0
> > Signed-off-by: Richard Gong <richard.gong@amd.com>
>=20
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

>=20
> > ---
> > v2: correct commit description
> >     move the check from chip family to problematic platform
> > ---
> >  drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
> b/drivers/gpu/drm/amd/amdgpu/vi.c
> > index 039b90cdc3bc..8b4eaf54b23e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> > @@ -81,6 +81,10 @@
> >  #include "mxgpu_vi.h"
> >  #include "amdgpu_dm.h"
> >
> > +#if IS_ENABLED(CONFIG_X86_64)
> > +#include <asm/intel-family.h>
> > +#endif
> > +
> >  #define ixPCIE_LC_L1_PM_SUBSTATE       0x100100C6
> >  #define
> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
> 0x00000001L
> >  #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
> 0x00000002L
> > @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
> amdgpu_device *adev)
> >                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
> >  }
> >
> > +static bool intel_core_apsm_chk(void)
> > +{
> > +#if IS_ENABLED(CONFIG_X86_64)
> > +       struct cpuinfo_x86 *c =3D &cpu_data(0);
> > +
> > +       return (c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_FAM6_ALDER=
LAKE);
> > +#else
> > +       return false;
> > +#endif
> > +}
> > +
> >  static void vi_program_aspm(struct amdgpu_device *adev)
> >  {
> >         u32 data, data1, orig;
> >         bool bL1SS =3D false;
> >         bool bClkReqSupport =3D true;
> >
> > -       if (!amdgpu_device_should_use_aspm(adev))
> > +       if (!amdgpu_device_should_use_aspm(adev) || intel_core_apsm_chk=
())
> >                 return;
> >
> >         if (adev->flags & AMD_IS_APU ||
> > --
> > 2.25.1
> >
