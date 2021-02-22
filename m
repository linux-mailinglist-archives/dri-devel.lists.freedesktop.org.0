Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB6320FA8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 04:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CBD6E4A5;
	Mon, 22 Feb 2021 03:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ED96E428;
 Mon, 22 Feb 2021 03:15:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ry9bP0RQxeAtqsX84boEIuLLByn3jQS/DcwgrAiDaWRRM47m+tjGphDq01VqC6jT8k2I9vvumRHZPgTE0Vsm0z4KjYJN3krIt3LrV1ILSSvHSUFKR41tL2UA7fQiFos1MkBdzZFegOVyLLMwvZyCmZO7oJyqdGjAzWBiDqS2kmwutCKE+5HCTOTg9PPPxQ8i1bWeV7/1RtYHy9f+9Ts9sq1C2vqH/Znc3GMtxBESW9vjHnl/+y83LON9zWhjnbKS8IX5cFyzLB02Qph+xnGvjVvzPeSFAr/Qxry8YDwRnUYU6JxMTb1/F0Oh2tMEc3ik7vivmjFdycj01kdf/I9eZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/Af4FdH9bpBO6j+iSrLgqC/6ar3NbDLPYHvL7WGVMs=;
 b=gMTARD1PVLBjYKamUbPOWluzJRkrf7KNdNE+GSp1ychWLMczv13DfclvtX39R1+8hu1jFYz71J/ki9D1eotMH4+oBrRyOA2rxqMdgu6OIRyVgD63z5Z3FbFt8WILRGxLMmBRcfjrtaY2/WuzmA3eMDRLv/15V842Ietx+4F70FXa8bJGtIS1wzdE1EX+yzUCiwCb3z9btBlEPTGMJ1y2S18va6X0kEo9XnFoberIXMO/ACWZjtok3wDpvTIzJLseA97BVBcusXnhw1f0WDDSmht33XNRDCM5HV0owKbVzshZE5hhlXThBKKUgHp/bgGD1blkF3zPtkiy3KzR8YqZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/Af4FdH9bpBO6j+iSrLgqC/6ar3NbDLPYHvL7WGVMs=;
 b=hJLB2dAQWETsq1eOclv8AMQmD1iq+fvXaWERbOavts3rGUv2BviMwBkObVY6vfmCUWQE/WF+AOKMQS4otIecwHvhPuDowMtp4IrBFOM4InU/UP5wu4WsTMsdwb9Dx+k7XbBZtx4aW/Iy7Mrd9cIvq7+XagYB2dcsoY+GK6DhSuY=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB2359.namprd12.prod.outlook.com (2603:10b6:4:b4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.30; Mon, 22 Feb 2021 03:15:17 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::11e6:53ff:8e98:31f0]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::11e6:53ff:8e98:31f0%3]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 03:15:17 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu/swsmu/navi1x: Remove unnecessary conversion
 to bool
Thread-Topic: [PATCH v2] drm/amdgpu/swsmu/navi1x: Remove unnecessary
 conversion to bool
Thread-Index: AQHXCEEAWyGwDw8ghEeNkTKiJTABAqpjgT7A
Date: Mon, 22 Feb 2021 03:15:17 +0000
Message-ID: <DM6PR12MB2619934BA14F887DF37BF2C2E4819@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <1613789706-100430-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1613789706-100430-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-22T03:14:53Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=68aa5021-becb-4278-9c46-8ea9e74387f8;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3fe971b5-fc0a-478f-3973-08d8d6e0144d
x-ms-traffictypediagnostic: DM5PR12MB2359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB23593F9058713CAC21A18ED6E4819@DM5PR12MB2359.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:416;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RC7FQtkb1893ylrayO2OceG5GwdzHBt1Iag05j7w6goNUuk3hw6zBdw3S0RX44Uv/kvcrKNXgoAfftgZNv7OnFcAtR5IfqCG7pZ1DjwZiCb5e54PQrMPtEbWJLO7rAr5GbQYIfQndUcsiZ6GwmLm3kmy2iNhOEG73a7QaVRpe4FK5EpMQksV+0yH/DKP+gcCUNPAr1gKrjs4AD1mKfdMc83Pt6XuB1pcKCdXonlcptphvldG669L9Gv9+iLq8snYSmdNUxPUXj0flf7lY0s18Ze+OHANDJvkgxXZUJY5GHgHF8Bh0b80j0UfUie12VnzkkVSQRrzm9NJv8xY/9It4eCpI4/PHwxyX8kONjWmJH57q6tnYGBhPaiYx0k0dYtXf4akATMHref5DNd58G5Em+cvx+fZLKhvjxlrZdEupQ/qbtyAD1W4E2ysUE9FMs3KqzcKCB+/RYx5msn8q2k6zh8kzwxzl0fcwaWbsbg+KvnGGeaopcmTjBafgtR/OLLK/bX8CToWj1feQqWbLh2lprW0FQs1Jbkk5K6KDlFYPTIEdDCX2mLkCubmHVwS+CuVqBGzO8vALKJ39JkNXwLYA9dNG8bOe4SUnk6RrU1Y2LY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(5660300002)(55016002)(86362001)(2906002)(66556008)(66476007)(66946007)(66446008)(64756008)(76116006)(52536014)(9686003)(316002)(83380400001)(54906003)(478600001)(45080400002)(71200400001)(53546011)(966005)(8676002)(110136005)(6636002)(4326008)(6506007)(186003)(33656002)(7696005)(8936002)(26005)(357404004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pHYGvsWvcHDMLFKigJJ7lMBGUySuxp5Xiz8hnrNNQ9am1ISRKloMP3kyGxA2?=
 =?us-ascii?Q?zGoJ4sZ2NHABQSXpfLOGtki7uaCiNsTNAbp65TFbqrYIQKRP55hPg4l83neR?=
 =?us-ascii?Q?uAoq4gBHyAEuP0e+CrkWmjgG+vb1S5fhpB0irKHGMuTmmMJ20A+dG0D2Idpb?=
 =?us-ascii?Q?BJeetTL77ikVtA2kEVVrt/bjQVGY7rhOPg0YG4Jkw74F3g6j/caqXKKtJKlV?=
 =?us-ascii?Q?kAKmrG2AQSLUf+d1azWDPfaBJrNDkQiBlbsSgo2gbPrRsmye1wBQxOvAc7Ly?=
 =?us-ascii?Q?5AbC0kb9apOZXNgJJuRl2rayRBMz4jz+YFzcEbktqe7WsXQJyduvmvf7Vyk6?=
 =?us-ascii?Q?yOskQACo6s019X+rLfYaqYqC1RY6TwFu/3Et2MTe6IO2knYXTn3lwZ0VNN/n?=
 =?us-ascii?Q?JUuQIDxSTb/KtlzEqfiOMqBDhPqaOIeZ4II8Q7KQEUg8MHs3qfOPEU84LNh9?=
 =?us-ascii?Q?AI/BUF2G/Xcunp3sYGi/DGRy9WJlI3/OvzzSspQir9aIXkWK5bLy/Mm71iLd?=
 =?us-ascii?Q?DWseyc5xI5mlLA0eaxOkZgqlrTgDFyNMGGqwlGtX6HDwZpzFZ22tX02gfsFu?=
 =?us-ascii?Q?o5hpqEZhprkILpKojUEuuObbViRT9ZR4X+tjjPt0hLlHAJJLAUGkENo4xS6P?=
 =?us-ascii?Q?eYcz3KePBppwB/jROh4DI0LvJteq/SoSbT+alMO1ZfUgwjmmN66orZV6digt?=
 =?us-ascii?Q?ICQD+uEqtDhumqcEQHfa3vmYRNGfOoqQUZFnRT6eY+57zXuiaFm8ClkBfc7p?=
 =?us-ascii?Q?aEzOBDd+1kWAuMvR1qKE444XpxvI6/ucTuqbGH9KhQC2aQVkPGUIhSJM2vL/?=
 =?us-ascii?Q?FWaEuxSw8ZwkXf9ooUqMrBm9cok9V8tKMIXyjtF3usTIHTE/HZi9T9vfgjgl?=
 =?us-ascii?Q?hSazn1+73e2sRk/fo+7n+IKjIw08w/+t6Mp9JJm0edN2Ft8GEJTueBwdZ0VL?=
 =?us-ascii?Q?AsAmZX3s/8gl7H6fI6G8VwvtNr5lGjOYhywLSSLbZkx7fh0CH9tOZK05xC/C?=
 =?us-ascii?Q?E4A9KNBEZ3dcL+Gs42juOrwDUJaQwqje0+KelOA5q47fUOCCLtYFUmS3ZNeg?=
 =?us-ascii?Q?VNTpF3+R+neQPH77httPQ4NcU8ObXpgNd9yJW3zsupqIdGYtEUAY462Oz5zE?=
 =?us-ascii?Q?q8BimbkTzOT0qoLorM+8ESt2r3jB9uzhIGXW2uzw3uVUgL+PPdv8znjJqguj?=
 =?us-ascii?Q?MWp3QRHfAAFuqoj6z8KjuoG8XonLFYgrf3mXBtkhh2pOigvDrMI7QzKRZyL9?=
 =?us-ascii?Q?ES60n/nVDUYQe47aU4aDpz+gRns5f/3C3XHepA491rWP1dB7hzdQ2rsz4HSS?=
 =?us-ascii?Q?fUYk14dbu0GcjFHmcbNofkTG?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe971b5-fc0a-478f-3973-08d8d6e0144d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 03:15:17.2769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FTvl/FJ8H+uIoVJyMdYoPihubNzlQFudDfSi27BZk+4ICrkuj6a8Sg1cPQrfG1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2359
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Jiapeng Chong
Sent: Saturday, February 20, 2021 10:55 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>; airlied@linux.ie; linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; daniel@ffwll.ch; Koenig, Christian <Christian.Koenig@amd.com>
Subject: [PATCH v2] drm/amdgpu/swsmu/navi1x: Remove unnecessary conversion to bool

Fix the following coccicheck warnings:

./drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:900:47-52: WARNING:
conversion to bool not needed here.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index cd7efa9..58028a7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -897,7 +897,7 @@ static bool navi10_is_support_fine_grained_dpm(struct smu_context *smu, enum smu
 	dpm_desc = &pptable->DpmDescriptor[clk_index];
 
 	/* 0 - Fine grained DPM, 1 - Discrete DPM */
-	return dpm_desc->SnapToDiscrete == 0 ? true : false;
+	return dpm_desc->SnapToDiscrete == 0;
 }
 
 static inline bool navi10_od_feature_is_supported(struct smu_11_0_overdrive_table *od_table, enum SMU_11_0_ODFEATURE_CAP cap)
-- 
1.8.3.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cevan.quan%40amd.com%7C443a5df938954827326108d8d6582201%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637495021310885387%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6ETadiVbRBgbXfEbkXbxTX%2F1Ozg1wp3Nr9lHGF3SKHk%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
