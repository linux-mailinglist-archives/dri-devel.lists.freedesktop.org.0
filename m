Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748577D968
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 06:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795A810E2BE;
	Wed, 16 Aug 2023 04:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C10A10E050;
 Wed, 16 Aug 2023 04:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7Yni5TxNaUbao9guTkv/sAxz3Ox+LNL2tyqP4vX4UHZaDZzyy6Nnicy2UNU0vNajbl2au+QWTh8TxFY1RjhnoNA+c0yMTuZ56sfVA1xdOiYSplxQobEMEUyoQ4GWaHo3lt95sFkyPloBtOKJfkL3qZqHry9zJJhK03EjW8nBtgWgV4/fz3uvukZ390sStM/sNBmEBrNUl9QydE8J6V6bWrCFU+nyp5IScSK2Eu3gQ3csMjWXXFBW3AcExlcXtilG4X1o5SNfU1dtHJMPUTuAc6OkcYo4z9Dl+pgavnSate9ykLaHhGBkwRCEiC602qP6jchXa3Cbgna65ug8gUBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWxsEViYY5GkA/D1XMkyh0OK0tOH9d07xQWw613yTTY=;
 b=dlhHxYg2Plh8ruNhDU1wO6a5BdwDxW029IsdO2tXwTsM1SL+SfLKAgF3w8GFZTdJ7yTqMPph3mzHZ/sXYgZtQBKTo3m+v9h4w9P2xavWrpYyxamIjQ7jD2ZugXkt4+iS0pBPspqF5waskD8JgO+C8QwkBPIX6CctxYR99HCYXdtSSOwEpiOrB3/acAX297wYtimh6JlhAKXPddHNodTpUHa+AHvoIH6XztZ2qZc2jn7g6At0Y6gfMKwMh+bzT8gLZDW3vHpAnGgSSEUTOzMwE0ezoiahdKBvnu08i3eHFgmrXnkazeZLTC17E4TSNodfu/vpfa8awEt1UKOqcXJwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWxsEViYY5GkA/D1XMkyh0OK0tOH9d07xQWw613yTTY=;
 b=JYcMXf71axL71b82ZTj7yR+QGWXEm08wwPoJiOUvU+MawOQz8+0qfJsM3UBwY7NzgPhoRUXsIwoXo8Gu4+TsCVT1i1mMsQrB8fs8ojRxFGgHofqpIpcja8DqouCKbwqZ95WptH2UFZeYa7TKsuwWiqMcCFeW+UhX03pkkFwFl7s=
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DS0PR12MB9347.namprd12.prod.outlook.com (2603:10b6:8:193::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 04:23:24 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 04:23:23 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Remove gfxoff check in GFX v9.4.3
Thread-Topic: [PATCH] drm/amdgpu: Remove gfxoff check in GFX v9.4.3
Thread-Index: AQHZz/c2ADJB12CVIk+0ndf0CWdPm6/sUq6g
Date: Wed, 16 Aug 2023 04:23:23 +0000
Message-ID: <BYAPR12MB461433B31DE3DD67351278B79715A@BYAPR12MB4614.namprd12.prod.outlook.com>
References: <20230816040711.690467-1-lijo.lazar@amd.com>
In-Reply-To: <20230816040711.690467-1-lijo.lazar@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=44b9591f-7707-4125-a142-b9ac560e8838;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-16T04:22:45Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4614:EE_|DS0PR12MB9347:EE_
x-ms-office365-filtering-correlation-id: b5fbe8d5-ccef-4b8f-8d66-08db9e10876f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ySzrIMontYQ3xQFiLnveaM74FzXmlm5guRDspqJ1eaHrCzHp92kJUyUqggkIYu0/0tSSEtFtMBat2xn8+5MP+/j0A4wMVoHg+X3vyJhHarq8RN3QMcpE3HMk9IFMGIR52tIvQkqpyBjnXlH0pQo7UMwiqKY9tG2J6Xaf70mFiSMTIg6nQ0pXIc4EBAe0eCm+qNGuSEKafuIVr0W9XdfbwZwRICWjKGT0uZNPN2nJRoR8l4PMKs7oTX9xZdoX6zj6Lw9w0No20fQvJIH9wqF2jPs8EXPRBABvpvU7r3OWF1lE/GwbvjyGlf+1eHgR2zuF7GsIJWFXxZHcooi39LcdiEisDoCxNcRqB+16I318Y1PgJQf7i6ZCcEgsFPiXfdUZCt8UGGNAL7v0JDMiKgOSrIzh+p/loVj8RbuUEqKmVpIpI/Nhkr3ey1XSRXb6XBcLCpzLYl1ToJtiA0ClhFonMaU9SuUTVSuk36OQN88ydVH8L3rA/Yj3LAcO3I567yYAY6coaJWf9H8/iobVwkI6EvIPtAuMy1/7FOnBJGc7uM6v644u12wpdaDfpGIKQDdxQUKDWTra5+ZmcyFvbJQA73K+kLgYFtjbcKUJn6UgltjCONUOatWTGWQq+noLVoKL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(7696005)(6506007)(2906002)(478600001)(9686003)(110136005)(5660300002)(83380400001)(52536014)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(122000001)(38100700002)(38070700005)(33656002)(86362001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q9XEEW8odWJnpV/I3x8JeL82BYMP6l482Hwy5Ah6oakeZIeE/9fHcOPln4Rl?=
 =?us-ascii?Q?x3vK2C8J5ROaeWL55CliBIF9v8e8L3RizjD27xB6iG35EBxaUdUaefk33sfh?=
 =?us-ascii?Q?qJa8yySosuP5CfR7f+HRZ6Hw7rHtSafs4tQBuIo1RG/n/4YmICQrUHIOkmoe?=
 =?us-ascii?Q?F2SlxtFJxJdcTa6ujvC/nK8VlNoA9r4MjeU4daiMY71kY5DQIXmOYkT9ZJ7V?=
 =?us-ascii?Q?GvIsFGt4m9MJVtx96GrzJcdXTTMWSamHhlt/fMKXqZnIPPMGwIKKCxZHHC+r?=
 =?us-ascii?Q?KfFgZiwMLcjEuyr1TANxIvcwY3VAmeItfwLXqcm1be7SL3V32CUdDZd+DVA9?=
 =?us-ascii?Q?cyFs0E+dTiQdQoW8mJX0IuAjey/07/pW0x+9lts8xCZldVCReMSWvoaw6NsP?=
 =?us-ascii?Q?wEejd4hKIZHmvObThuUHybDGCGshfduJ57PThcyR8e5QKEQFYt+H2eDutQ+U?=
 =?us-ascii?Q?tc3fhMZ3UWqqtNjPkgqt2djdBC4RLNbBgYnF0pndf3vXIFlXabWsNL3h2/84?=
 =?us-ascii?Q?SVHm62ucDZFBDRiOHqlO9Jz/upu/JcP2IgKwvYJmZY6lZwApPcoFsvs+4NDm?=
 =?us-ascii?Q?9K/58KhwmXP/DsDGabp9/YpiCdZxmR3FBKbCVuhUu8wsV8ABQlJPpJZoZLKS?=
 =?us-ascii?Q?SeS+Y4ciZGU/QONC6ujY84MMjfnFaubenOgRXaFf9W2xfnLFcguz1MHUneFw?=
 =?us-ascii?Q?fqdGdIpnW4cCgmVfsZMlwDwQuv73/HZm+aLZuWK9YUuwPzaiRzY1QKoUE43j?=
 =?us-ascii?Q?Nsqfc2ztvTzu1EjgTHiItZmu/W8dKWhM4kw0idNLZDVHM7tk3QRTCODlx5/c?=
 =?us-ascii?Q?mX4w8UalG+bwwSKYZgKC3HbTvP8v7H0mIKSIey8+lJ769JFOWAHm1opWPqzs?=
 =?us-ascii?Q?tnA9YaL5REFEMit/DQlAxuj+5AwIWkFWCvbBwUyi3ZuOp3mXuHkSdFmvv/5d?=
 =?us-ascii?Q?5XsBroggM6nXDvXnMTtz+53OTPc/RNLzk/RXzCapeK8SDilKMWQStAk/vLdf?=
 =?us-ascii?Q?3+SmfAswM/HxJcsAaqbCx9SObFOW1XgwCji/jc/QX+f559tk+sBbJ65+f0A4?=
 =?us-ascii?Q?BymKPdIwXO5zsageMndwFmJOHDr9uXaSCYQjuJ6N+WA/RePuqDGXWv3RL0EG?=
 =?us-ascii?Q?60sVR9qcRFrwWJdtbM7xo9jPAGYJVaAH+y8H8aJ/ET+tgY2we2f7qj+cq1ti?=
 =?us-ascii?Q?BUsCLSRGVa4qiEC3UooxMdsPEO+xnnoar+MsRKACQk3olVYEHEVShM72U/2z?=
 =?us-ascii?Q?cgDqk66+WDPd2+RABDiA8dXdNP/HqfN2wjldry1blcenz78Hly4tj5VJMpOo?=
 =?us-ascii?Q?uNnfe+3SS3zN1HokFSSBkofzdOgbejnNLaSO0bp6PDWtmCsHR7oOmdJjF76H?=
 =?us-ascii?Q?gXANmu7wi7mOratKnGW7hktnmmgjjUOFGQ/f384oQwu1T/LMF4sw8WHSMrSt?=
 =?us-ascii?Q?nXvXfYpnuCi23WT1CM9i+lwjShhXmoXxCK6JpwrZR98YAYQ99Q2/tDxxpv07?=
 =?us-ascii?Q?2wnYZ4Vv+sFgeOcJXN9MY9MUPcgAypw96aV03q6nG9sZB5N10ynpXCBqjQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fbe8d5-ccef-4b8f-8d66-08db9e10876f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 04:23:23.1723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fa2Ydco0YYitOs3GNc0u59Z+dEngH92spdEDQ7GTAZKM7yegngS4R8BcmEruNCVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9347
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "Zhang, 
 Hawking" <Hawking.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Sorry, for the spam. Please ignore this.

Thanks,
Lijo

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Lijo Laz=
ar
Sent: Wednesday, August 16, 2023 9:37 AM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; sfr@canb.auug.org.au; a=
irlied@redhat.com; dri-devel@lists.freedesktop.org; Zhang, Hawking <Hawking=
.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: Remove gfxoff check in GFX v9.4.3

GFXOFF feature is not there for GFX 9.4.3 ASICs.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_4_3.c
index d8d6807e7b96..57ed4e5c294c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -337,13 +337,11 @@ static uint64_t gfx_v9_4_3_get_gpu_clock_counter(stru=
ct amdgpu_device *adev)  {
        uint64_t clock;

-       amdgpu_gfx_off_ctrl(adev, false);
        mutex_lock(&adev->gfx.gpu_clock_mutex);
        WREG32_SOC15(GC, GET_INST(GC, 0), regRLC_CAPTURE_GPU_CLOCK_COUNT, 1=
);
        clock =3D (uint64_t)RREG32_SOC15(GC, GET_INST(GC, 0), regRLC_GPU_CL=
OCK_COUNT_LSB) |
                ((uint64_t)RREG32_SOC15(GC, GET_INST(GC, 0), regRLC_GPU_CLO=
CK_COUNT_MSB) << 32ULL);
        mutex_unlock(&adev->gfx.gpu_clock_mutex);
-       amdgpu_gfx_off_ctrl(adev, true);

        return clock;
 }
--
2.25.1

