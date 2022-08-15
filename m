Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED535935C4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A92D0D15;
	Mon, 15 Aug 2022 18:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB09D0F63;
 Mon, 15 Aug 2022 18:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvKIYtsgxc1EWOaSpL6uTZTFaMJ00tPRDuIaQYbk+GBKJcHvs0z+nn5AgcZkDVFHJyTTSeEXsJizu7yz7g6PcbL25e9ydtZ5EQSWt8bC1BaBPEbHPR/lOADJyCr44ku8WobekVO/2a7kJbISpZhWO8mTSdRFvju0VqVo6loRcKxLAYs5NQVw2tN+W/SekjAW+cJNXdzYqgGNvP0Nw/BwduVxEJ79Yg84jj0KjU8f5gVNRpvjkdmsbFNQZa3fpRR+K4coZirMUnmesO0KBK+bITlbZWaJUnSn1iOA4wzHpJpTsE+x+2nEwvCaiOaWMVh28AhtIJK1YAOj7VgolkK0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBee4h2WTasQ9vS5BaOPsK9n/6IPk8hvZfCv88fm0wY=;
 b=M2fDqd7MFWhZGiDu+glr/VvI1Ne/yzjIyqfmooA9cW+Mgi7MweGCVT7z9aTcSdBjlYt0U96g5U4gm4+PX0QwkfIJQfc3ltnzYvLCD+x0y8k5jzxt6XCaK5WsWTQph78QTDJLGyCUCoOTQup91lDOYsy4gnTAMHKwpbjXRsXdO8e3c66sxT5EWmjN5pJI36Q0t166FQpgTPAp8XExqwHcLtWN2V6m/n4mJxJCRh1lnOTbs40gmEXdtN65MH0VEr9c3xtEk71kSlJKRLXDIRxXbL2R4o9zy805MU9unT8YMxFRMmyFuQfrcY6ujZrQWyJaDovdo88kqoVOZa1ITKLM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBee4h2WTasQ9vS5BaOPsK9n/6IPk8hvZfCv88fm0wY=;
 b=XxpUEk4zom9thPa8uvVZ6JX77HpjbVlC1IDKfegVVs3lAwQeglVBKCcOSQDOK+37gt0jYf03ea32d65dYabjUxN85avZqb6iXXEyN87Ldt4Qw5XpUOVtbXLdSpS/D2Fn5uNvvx4mCr1mUBsTRjPK5lgXYTsTEuxWu3SpyOGedHw=
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 15 Aug
 2022 18:39:30 +0000
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc]) by SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 18:39:29 +0000
From: "Dong, Ruijing" <Ruijing.Dong@amd.com>
To: Khalid Masum <khalid.masum.92@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH linux-next] drm/amdgpu/vcn: Return void from the
 stop_dbg_mode
Thread-Topic: [PATCH linux-next] drm/amdgpu/vcn: Return void from the
 stop_dbg_mode
Thread-Index: AQHYsNW2WvWGJFVv00ykl5mN7a5bXq2wSrNw
Date: Mon, 15 Aug 2022 18:39:29 +0000
Message-ID: <SJ1PR12MB6194F4ADBF5DEBB1AEEF1E5295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
References: <20220815183425.14867-1-khalid.masum.92@gmail.com>
In-Reply-To: <20220815183425.14867-1-khalid.masum.92@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6c4fd424-d964-4bcc-bfd9-2989dc10d7c0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-15T18:38:17Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe731d03-fffc-480b-bf8c-08da7eed7d1b
x-ms-traffictypediagnostic: PH8PR12MB7136:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JLfINLtNOHTwGoUR/NQE+R04L3u7iK2kgfKHJXkTiIIt1rfYvOe8WNyBPey5/y50nGdj3VtTMK9bRetdzNXJgErzacTrtDfwjAzAJwM7sRdbGjXMiIpZA9mhr5aIS3dn2odH2pCo9H6STKN4Lc62EqW57fNjZExDt5WHtk8VPVzWGrmBW9/B+oJyuhbfY1+ovYgGzAH2Mez6r2O/SWO8y7JK2768lG+W0G/UwaI0L5Q78TnG1O/8aC8+zuvUv1p41nBPrZiRh2QGvixLZs9Bvf+jnDNlLePUoifvYgr3JTm5Y9DqR9Riw2qCxSPNuSPhBMlw9Tuj6aznpVuhVa7TPY50M29iSZNBD4z9+tJrUd4GDaiH0Z/QJmDjhC7fS504TdJMlnV4pG5eCWei40Rsrb3chY74LP9t8PwyV0LHFBZ1lUZo4vJjDPSwvBH/BMaGri3+AbX2ND7i0vkSFvnd4l/s1hfZKBq0qx/EkrD0Lw2wlxYvE3wPgCm1Ho2XA5CeWVhAmNdqPJ/qF0AHx3v7d107pYWB062SepEMnWsF1OAh/H99mF5Thc2XdFQZ+jJR2paEAXvieTyeDkiDtVLg1to6UD1EOjfsPqJoSMeD8PbHVt3hOoel1q1CLgrkh+92w4dtWYYVaV6WtBvzoJcB7Ly3u83dozbeVxD5EVOPyp2jtrm4M4RrHv5B9j/VGjWm0zG2FKvSagIFh3s4y1mNOACYJke2+SLeJOuOdW4RPjW36Cd910HKWjay0KI6O44OqlsnjFrD+qDkmf38Yok2478XBOeUaqRckSNuU4miN4HxDwWQ2afzm07g7/4TDSVQaeM/j6CiHQL3/YLupduc8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR12MB6194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(33656002)(478600001)(7696005)(6506007)(53546011)(38070700005)(86362001)(26005)(9686003)(186003)(71200400001)(966005)(45080400002)(41300700001)(83380400001)(5660300002)(55016003)(66476007)(8676002)(66556008)(66446008)(76116006)(54906003)(110136005)(316002)(64756008)(4326008)(122000001)(38100700002)(66946007)(8936002)(52536014)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?txkVEiFmt/h71wWJI2BWamkKzyyIIpg1Fz/Lfez5OWRLPdmtAbvUIM7gJdlT?=
 =?us-ascii?Q?yhoWD+VnPRvgmdf3Xzby/4uH4+pdkv0nKeQpNetZa7JwZgVqDj+WIym5iEcm?=
 =?us-ascii?Q?aqidXCqI0jSuUTarCj4U+UrrHkMtgx7ym33EvruflYeAAx9aV+caOU5bHelB?=
 =?us-ascii?Q?MO/mBF0P87GI3eeOwbiNviXTvYXa4ncOZ9Fk9XifXyFVGNx49FK9wGK0aIum?=
 =?us-ascii?Q?b4JbRLdZAa+1UQkuIVNyj6FZtwwPXYcAzN1TkKM0crQ52nSrxVsLDS1gFhyo?=
 =?us-ascii?Q?me0z76fDb2rv0Cbat8GM4Dgdupj9AnnphQXiHWb/DOUTveff7gW4rviJS7S8?=
 =?us-ascii?Q?4YboQoaMb7r4Hrj8FUjaOjnwaVW642UzF1gXNimKU2li+cXVWckUi0rrddIy?=
 =?us-ascii?Q?yc2FxaQf40DFP8uHaq0nwAY6s6VFh3hzrI/8YbgwscMNvHfjSfIH31cDeZZT?=
 =?us-ascii?Q?fXxAVPVJ+B+XXzk1QA8iwW9uLfN5D6xHJ8iu21lgXVCXMjLHV1CyEThQDnOx?=
 =?us-ascii?Q?dvY5X8Ek4w6WQulDG/0e6tC0fLIRuzxgn7fc5c4tidoshot+qATqja55PjYg?=
 =?us-ascii?Q?S/bn8aC/+HHulqcr9yRCor0IzJpGnxSL+ugi4uWS5TKDOv+APAyra+Dra7rR?=
 =?us-ascii?Q?C4EQr0I6FnoYUZyJ2T13yK9iFroZddPCQPzg9MFldHvf3LoxiWOzzTpxaRWI?=
 =?us-ascii?Q?/ujydCTNaUG9Cw5rVYIv87P5SDjHE8h64ehPU3vXyxYSTATKfACYAe6W+SYU?=
 =?us-ascii?Q?y9zhfNMwfLFsl7acetFbO8K4LA6BUIb1nJx1ad/Vwgb9jHnEDceV1Xo0XrOD?=
 =?us-ascii?Q?HbxFnnHjX+kF1s6+QjZ7N22Z09ghu9Y0/1g6AJTuGBHLCQWbtY2o3Vy6e1Hq?=
 =?us-ascii?Q?s3h+xX6GQO3nQBwVDiD5p4bALI/5LWXx12Px3uQGCfbfYNJm7CJc+8GoPdRY?=
 =?us-ascii?Q?ajknzkCSVL4upDvN3H0rfREo3+5zzZINoyKdMFVNNMcnt3Chq0S1XxUB2J2M?=
 =?us-ascii?Q?gdoRl4wb5iNqdP7YoFP3n6hosKNGfdX9mPvh8Yje/QtWaHJQOnaNiedFGc44?=
 =?us-ascii?Q?sEL5HEoSO7Wxr9r0H8mjXmeNV7kj+5KNsS+OrpDwXeBp1GhBXhSGWz//0GPP?=
 =?us-ascii?Q?nwKch0oeQ/H5CIP+ijUUcbqsI/HLF50aH0Kbk7bYYBR3MQFt11ZE2yKC/4CN?=
 =?us-ascii?Q?v6Kj0OgmwGYXppN1LSYgYX9sckVZA9e9ZFjnir3LVpb5tvRyaMfvgW15Pxd9?=
 =?us-ascii?Q?ARdHI+LwOIOxymCxnv2T01cmd8D/hDTFXK/ZJZKhkyhW97dM4Jkw8MOqDlvR?=
 =?us-ascii?Q?y6gTdz0jVBbG+jAPf+V2HLxXcWTpOpJlJoB/k+e9YbPIQnhB2+55c1LCOrfL?=
 =?us-ascii?Q?d8QgDDJ6yu7RlLM4uU2nqAGRL+j8IWRmPXaaTybE3izLnH4lIFND10W75dh7?=
 =?us-ascii?Q?eCYx9Jo/CReDMAljd6RSDXuaozMCbG0XuypCIapBjrGfuD9QM5Y0k0x+NXom?=
 =?us-ascii?Q?q4SAd8qI8qYGCwKsKRTzlWfikmx6/zFVv8clMTvidNiI8TYKKGc5BgOyHNjA?=
 =?us-ascii?Q?06wPu3XPmhiw0W8gZos=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe731d03-fffc-480b-bf8c-08da7eed7d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 18:39:29.7509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+uLtpoV0Xq1aVShzz02vbbx5/KJOTkRBheLRgZ73sSXtqICipwTeo+JGjcN0a6G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

This patch is

Reviewed-by: Ruijing Dong <ruijing.dong@amd.com>

Thanks,
Ruijing

-----Original Message-----
From: Khalid Masum <khalid.masum.92@gmail.com>
Sent: Monday, August 15, 2022 2:34 PM
To: Dong, Ruijing <Ruijing.Dong@amd.com>; amd-gfx@lists.freedesktop.org; dr=
i-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airl=
ied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.c=
om>; Liu, Leo <Leo.Liu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Wan Ji=
abing <wanjiabing@vivo.com>; Greg Kroah-Hartman <gregkh@linuxfoundation.org=
>; Khalid Masum <khalid.masum.92@gmail.com>
Subject: [PATCH linux-next] drm/amdgpu/vcn: Return void from the stop_dbg_m=
ode

There is no point in returning an int here. It only returns 0 which the cal=
ler never uses. Therefore return void and remove the unnecessary assignment=
.

Addresses-Coverity: 1504988 ("Unused value")
Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
Suggested-by: Ruijing Dong <ruijing.dong@amd.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Past discussions:
- V1 Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flore.kernel.org%2Flkml%2F20220815070056.10816-1-khalid.masum.92%40gmail=
.com%2F&amp;data=3D05%7C01%7Cruijing.dong%40amd.com%7C017222a9e81f49ea336f0=
8da7eecd6c8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637961852950464412=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DTyXtoF2flWNqabtiJ%2BDVcR2vdsnL=
Z19qr3b%2BQT2DBQA%3D&amp;reserved=3D0

Changes since V1:
- Make stop_dbg_mode return void
- Update commit description

 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v4_0.c
index ca14c3ef742e..fb2d74f30448 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1115,7 +1115,7 @@ static int vcn_v4_0_start(struct amdgpu_device *adev)
  *
  * Stop VCN block with dpg mode
  */
-static int vcn_v4_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx=
)
+static void vcn_v4_0_stop_dpg_mode(struct amdgpu_device *adev, int
+inst_idx)
 {
        uint32_t tmp;

@@ -1133,7 +1133,6 @@ static int vcn_v4_0_stop_dpg_mode(struct amdgpu_devic=
e *adev, int inst_idx)
        /* disable dynamic power gating mode */
        WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 0,
                ~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
-       return 0;
 }

 /**
@@ -1154,7 +1153,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
                fw_shared->sq.queue_mode |=3D FW_QUEUE_DPG_HOLD_OFF;

                if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
-                       r =3D vcn_v4_0_stop_dpg_mode(adev, i);
+                       vcn_v4_0_stop_dpg_mode(adev, i);
                        continue;
                }

--
2.37.1

