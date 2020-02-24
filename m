Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F032169C9A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 04:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31E6E04E;
	Mon, 24 Feb 2020 03:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013FA89B0B;
 Mon, 24 Feb 2020 03:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cfq5Lmt4VV1yKsLAiZUND3zBRZx9lI2JgzRS1VBSTpBSpfKqRwPZSG/bsYAfry6rBBRIf54YxHfoCKU62nEySGxsdk1G7vjfg1sTYjJnjzCaZn71fsCVEr8bRAkf+KaWtKIrqGOok+dLrV5nEWOxnq74HKLo9NsBEm/T8p4PzLwg78m9IVt1SRnljTc0MxIcirHcVN+SrPcvr9snvsZc89R5OInjpYGKJFdLWWa9q0RAj6EDZ+j56P0jdECiypRXameK10oIZWkfIR2t7ZukeDmopGygIWwhOyXcqCZkyLHTEiH5pjkv7U0T2tNI4s2TmQ4gujYb3MSv1SZwhpJJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYiK360nRyA7aqtzCF9gPYS3mFfa9ATdkvebWnxZjzk=;
 b=cOtLgeuq2b1ZWJkPeCnKMhDY/laClEu9HkRcSAPNpseMMODhUjML8xI+N+ZAzl5D1wGq8KFY3k0i93YDTmAaVr5pLEa6MyqlGkvLLuKvml6NgucRiNK72MiIuVhMxZr8GGe+ig3o5Ry6ciZyBiR1ILPcM/ClthCDpe9ml3cxvZhr4uW3WY/luP+cJuPBF1y8OMeVBAzmyJhNNuJjd2mw7y2N48mOXbZ2pWHFQJQB+w96ON2Rq5YqzEOwTlr3FB1HmN7GSHB0U/5ifer1IwnWQQjau8FmmPWnJ6LjvoLeCg/3aw9QbY1TTBPrNeMreZItD3U7ICPjBh12AiwpGbLx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYiK360nRyA7aqtzCF9gPYS3mFfa9ATdkvebWnxZjzk=;
 b=njT8+Bu9Lsn4NFlnKqzQGqud5xDYy15TxMV0h9bhC+jDWvwTAXUbjZG9l3NBHO50kk21YMpvm10VcfbWyfnJJMeyZJez5AgzKtCI4WUXUIKRml1hqBcVtLW4af9wLRCK8XJCUA74hT4Jxb44liK9/p6h/KHMsqzif11tqxra3do=
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (2603:10b6:208:c5::10)
 by MN2PR12MB3805.namprd12.prod.outlook.com (2603:10b6:208:15a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 03:21:49 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::69c7:b493:690:2173]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::69c7:b493:690:2173%3]) with mapi id 15.20.2729.033; Mon, 24 Feb 2020
 03:21:49 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Chen Zhou <chenzhou10@huawei.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH -next] drm/amd/powerplay: Use bitwise instead of
 arithmetic operator for flags
Thread-Topic: [PATCH -next] drm/amd/powerplay: Use bitwise instead of
 arithmetic operator for flags
Thread-Index: AQHV6LJreIpz8B8T80OFeSAr9vQubqgpsZ2w
Date: Mon, 24 Feb 2020 03:21:49 +0000
Message-ID: <MN2PR12MB33447575BAF26E919965AB5CE4EC0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20200221122139.148664-1-chenzhou10@huawei.com>
In-Reply-To: <20200221122139.148664-1-chenzhou10@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=5cc58c55-68c2-4342-86f5-000040c15cb1;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-02-24T03:21:30Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b553474c-0bda-4a81-fb1b-08d7b8d8af6f
x-ms-traffictypediagnostic: MN2PR12MB3805:|MN2PR12MB3805:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB38056BEE928F8768BB4F34C8E4EC0@MN2PR12MB3805.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(33656002)(4326008)(81156014)(8676002)(186003)(6506007)(53546011)(7696005)(86362001)(26005)(81166006)(8936002)(66476007)(66446008)(64756008)(76116006)(66946007)(66556008)(52536014)(5660300002)(110136005)(54906003)(55016002)(9686003)(478600001)(2906002)(71200400001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3805;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Qx5shFwmHgQHVt0kQxKy9JULCvq2Cq4cJKr6Xuwk2zex+b1bmFM6SoAuCnjT8kZ6AVGegGdUmurBJTe3H6J0Lu8eUyklYOl17JzNZ/JON+wDu7QPDNSayRTcinfYTjGDAh6I3NF99dcUy4jVRhX6CIxU59WdPj4zRSNjmROEuaweeYcyup3OkxoK/fV5cS64ssGZ+0nOpWfd/1Uqi18i6l/cs3Zm64D8iRUQETAFU48fdtTN+g2oIC8kF83gWA370kpv94/SN6luR7Fh1eVOSk6ZM89sRPqSk0Qs6BBpAqUAVJAUI+aEQtLYpncaBq/tKVJqSS4V5tJvGR207FIi/pTfBG9nq8leckkn0YyRvbYqdB6BWXpeKlQMwbQkYdre88tKRrZ/11LoYNzREfBRiiAm1TPpK8T8yGkKkrrNf617BWqtLRpDS/6twHu3pJi
x-ms-exchange-antispam-messagedata: 8mP70oeWnmlNrp08F9V4w6pjW+hKF/Obww2tMqJltb7TsTYm56CGAIXjkIa4GYTeBYp7ECKbw7X/zeWGBs9E+knbqGJfIjA24/pNzuPaWgXBgi9Td0lKnANadS3imScMdIJK1UouvvgnWMWtMI2LYw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b553474c-0bda-4a81-fb1b-08d7b8d8af6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 03:21:49.1363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9WypD+Ky7YGYBWqfdCeEFJHZUvBTuFadsQ9AqbSzl8fcrvspwMueCtGUN4nRdEx1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3805
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks. Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: Chen Zhou <chenzhou10@huawei.com> 
Sent: Friday, February 21, 2020 8:22 PM
To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; airlied@linux.ie; daniel@ffwll.ch
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; chenzhou10@huawei.com
Subject: [PATCH -next] drm/amd/powerplay: Use bitwise instead of arithmetic operator for flags

This silences the following coccinelle warning:

"WARNING: sum of probable bitmasks, consider |"

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index 92a65e3d..f29f95b 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -3382,7 +3382,7 @@ static int vega10_populate_and_upload_sclk_mclk_dpm_levels(
 	}
 
 	if (data->need_update_dpm_table &
-			(DPMTABLE_OD_UPDATE_SCLK + DPMTABLE_UPDATE_SCLK + DPMTABLE_UPDATE_SOCCLK)) {
+			(DPMTABLE_OD_UPDATE_SCLK | DPMTABLE_UPDATE_SCLK | 
+DPMTABLE_UPDATE_SOCCLK)) {
 		result = vega10_populate_all_graphic_levels(hwmgr);
 		PP_ASSERT_WITH_CODE((0 == result),
 				"Failed to populate SCLK during PopulateNewDPMClocksStates Function!", @@ -3390,7 +3390,7 @@ static int vega10_populate_and_upload_sclk_mclk_dpm_levels(
 	}
 
 	if (data->need_update_dpm_table &
-			(DPMTABLE_OD_UPDATE_MCLK + DPMTABLE_UPDATE_MCLK)) {
+			(DPMTABLE_OD_UPDATE_MCLK | DPMTABLE_UPDATE_MCLK)) {
 		result = vega10_populate_all_memory_levels(hwmgr);
 		PP_ASSERT_WITH_CODE((0 == result),
 				"Failed to populate MCLK during PopulateNewDPMClocksStates Function!",
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
