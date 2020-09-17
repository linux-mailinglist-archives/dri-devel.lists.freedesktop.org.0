Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F226D290
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA48F6E03F;
	Thu, 17 Sep 2020 04:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3A06E03A;
 Thu, 17 Sep 2020 04:26:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9Wnr040sazU9hjR+unu78o7kf8wcaP8unD333zlyyyxEs+bsH8m+d8kOkvH2J7J/qaHYUHPX32NqzgYwAD/6tga8vC8OLTORI41TDe+VtdAulrWm1THxsxpqvjb2x3rYGZv8je+/pH4yuNNWeNQtpPxf32jNKj4NAA011B2E5FBmJvg8jqHnkRu7+VhYDWeXIuadedI+cz0SSF/ZOVza5ajONvZXr/xjy3QCJlu+LU/HFA6E1JCAnfdKxFfi3vuwbcUAqlqmuTZLUS5Si6BG1m0pSre9lAujecJjHvg+BtZg3Oa2Yro4G/QBsWSkUJqoMcvePSkR4DugkIp8lZqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tlpAIUUn4O/mIxwQ9tZIK7Vf9JzQY8M/OPQ4KFiWJI=;
 b=RhArvXgwjEglvo8bmMY7buRIovwBP5Yy1seV+Ihpfqa3nyQC2KMInEmHXhqcC0KJK7OAn/yHpDQ/ottnm6SOKyecPzF1AOAzTyvtD042q2xMfziGOh+Vm/1hHA0AatMTSz4puWi+u8Ey1+/p2Sy/u9WrzM5Y4Sz9paM9qNIfkTlwuLHDhU9oHoe4OvvsGNwu4nbROoaQm71FFiyk02M1wvVhYS67syGH8kabIRK1Lk7mWvZ5oitK/NNg4etoHNPHhSY2arL1qXpNh5vLZnrH7q7Uyv3kB3ciYdADm52kTjCw4t7t2DenwD8p6CnDowbHpxyaaGrSm+9fgLb5q/SF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tlpAIUUn4O/mIxwQ9tZIK7Vf9JzQY8M/OPQ4KFiWJI=;
 b=oMfdNWPSSXsSiHnk0MVswXJ2OMn8GX0PSUy+ce4aLEALuWr+L2nuS0brvIEimU+n1YOd1wU8kjnbg8NUJwhpYoReDfamZGXyNAujVFqmfzrwR5UoQNmkeQBuQJnLCJQxgTdktuCMu0qBU4YqFOOCAF3sWNvpop4xAEqCd79PPgc=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Thu, 17 Sep 2020 04:26:20 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118%5]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 04:26:20 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Xiaoliang Pang <dawning.pang@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "zhengbin13@huawei.com"
 <zhengbin13@huawei.com>, "pelle@vangils.xyz" <pelle@vangils.xyz>,
 "yttao@amd.com" <yttao@amd.com>
Subject: RE: [PATCH v1] powerplay:hwmgr - modify the return value
Thread-Topic: [PATCH v1] powerplay:hwmgr - modify the return value
Thread-Index: AQHWjKUirneuuuI6L0uBp9h/EISx6KlsO/vg
Date: Thu, 17 Sep 2020 04:26:20 +0000
Message-ID: <DM6PR12MB261972F93A745AD5BEF2B357E43E0@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20200917034610.21703-1-dawning.pang@gmail.com>
In-Reply-To: <20200917034610.21703-1-dawning.pang@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=efcc980d-c30c-4674-8d87-ac157225a809;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-09-17T04:25:56Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8e5e9d8c-f9fe-4774-c915-08d85ac1d435
x-ms-traffictypediagnostic: DM6PR12MB4337:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB433756B78A9E3D0F4F032C7BE43E0@DM6PR12MB4337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qmiNRHZQza2GqEe0pVJ7pYm2aedtZETdkQNez+dMyS+pm8oko+lmPkYgcdIpU98YwbxuGKlH/4asWwjMI4G/PSttWWau9hNfYPvmaE2ea8rggbmcKz160xYhRPKK8Rocc37oDJKxKN792RPT4QH8isIeqDZT4exv3tNphPzbXDg6CiSJ2+9cBzdpGwN4OE7Q9N0AZAq9+VNT8+bd+UHKN6GnzPhtBi5X/nolAk7yx64UtJ6oaIZFsXNkTk3bduTakXu8EBger1KsECkUQIrAFYj5CHnmbuaou/fTFKmdlMhsyo2WiGuzusLa/Xm+rL/YShs4Q7Ma9cFuLjiUilAX3M5jjDK7rFSegIJTSIUcH2A9ecDcWyrNtPplaHOs9Nrr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(6506007)(76116006)(110136005)(8936002)(478600001)(54906003)(4326008)(5660300002)(33656002)(8676002)(55016002)(52536014)(9686003)(66556008)(66946007)(71200400001)(2906002)(316002)(86362001)(66446008)(6636002)(66476007)(64756008)(83380400001)(7696005)(53546011)(186003)(26005)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: a/K3e8KwW3zlTlHRsB7C1L8NM0l3zBEOuyvmt0YZ3M4N+O6nk/5nSTViiIugve0Nuibtl2chLJfJwpHn272k9pGC+urEVj/YEoFor4G/NrcpylR6s91Zh49lcWRM48Wzg7JJou2PFXQpNt9H3oEoMm1JQAYLhSjPtArV04OdPJ9pAhXB7YdJ79XfLHOUE0A5HNdY7DT114o1IroSA5d/BbcFPo3yYoCGJcLdB3cnypxa0yQpzopSweelHgBjrfDAkDxD0+7J73i5Ovwy0gUAQsm7Iabn7sbWlIDt9J6prfzGFKYjX1DTv0l7QFQS82g4BKY/57BTn4pX7qOGQknnRHdtZ9S1IPt1SYyllqz/S4fPmEWibJdMebgjD656hcQvlVZ1e8siXJEUmwLeaOxdsEqfJfvD8VbugVT6P0ILBdx86CsfVJjxhl1ubB1eknAIPqwKbsEf02r7ahJEKIeS4642BoIlRLbmEMgC5yq14G4gNHFV/kxy2Lit/1rJk4EJK06lSU7GWLJQjvk17fV32rvLIxzdkORdOKENxjmEozzNssQ3SX6RiyXMNTBTExXyqo+bI50WqhAGF1Tb8QvIzesN0JFbKEslhtlounb8hL/A+mVmv0v7EeSbo/i7TXXTuvy9VSYkICNkZAQUJYIO9A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5e9d8c-f9fe-4774-c915-08d85ac1d435
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 04:26:20.6918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJ7uDJel4qaxATf9rLPAPS2o5xqwzbbIoVEAX/7AfH2s4Uylv32hjvsH73ZXtEXf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
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
Cc: "tianjia.zhang@linux.alibaba.com" <tianjia.zhang@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Das,
 Nirmoy" <Nirmoy.Das@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Thanks. Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: Xiaoliang Pang <dawning.pang@gmail.com>
Sent: Thursday, September 17, 2020 11:46 AM
To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie; daniel@ffwll.ch; Feng, Kenneth <Kenneth.Feng@amd.com>; zhengbin13@huawei.com; pelle@vangils.xyz; yttao@amd.com
Cc: Das, Nirmoy <Nirmoy.Das@amd.com>; Huang, JinHuiEric <JinHuiEric.Huang@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; tianjia.zhang@linux.alibaba.com; dawning.pang@gmail.com
Subject: [PATCH v1] powerplay:hwmgr - modify the return value

modify the return value is -EINVAL

Fixes: f83a9991648bb("drm/amd/powerplay: add Vega10 powerplay support (v5)")
Fixes: 2cac05dee6e30("drm/amd/powerplay: add the hw manager for vega12 (v4)")
Cc: Eric Huang <JinHuiEric.Huang@amd.com>
Cc: Evan Quan <evan.quan@amd.com>
Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index c378a000c934..7eada3098ffc 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -4659,7 +4659,7 @@ static int vega10_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 if ((data->water_marks_bitmap & WaterMarksExist) &&
 !(data->water_marks_bitmap & WaterMarksLoaded)) {
 result = smum_smc_table_manager(hwmgr, (uint8_t *)wm_table, WMTABLE, false);
-PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return EINVAL);
+PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return -EINVAL);
 data->water_marks_bitmap |= WaterMarksLoaded;
 }

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
index a678a67f1c0d..04da52cea824 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
@@ -2390,7 +2390,7 @@ static int vega12_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 !(data->water_marks_bitmap & WaterMarksLoaded)) {
 result = smum_smc_table_manager(hwmgr,
 (uint8_t *)wm_table, TABLE_WATERMARKS, false);
-PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return EINVAL);
+PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return -EINVAL);
 data->water_marks_bitmap |= WaterMarksLoaded;
 }

--
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
