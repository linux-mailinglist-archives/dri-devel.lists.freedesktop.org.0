Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8682C1A29
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 01:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59976E170;
	Tue, 24 Nov 2020 00:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734166E15E;
 Tue, 24 Nov 2020 00:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHwq7kAewyZuCzc0CAMT6uLj7L4PbpKmNFBvTVZe4+0me0AS2GPYOSkKdBfs6XgEIytjESn+xO9vELLYVSsoM2oZ0+1JBkX44KQgUG4vJ5LbPQdNXVSDskQ0TG8rajc4pPUcVUMbJx9xv5DGxhbU4ctxxsrY1CVnbO1eoem35JMWtHU5U2LvwfQ77Y9joIJ2nlcy0UkDNGszOnptbULNwKKMyuuIxdbAleT8iUrQ4gteYCdgfMK2beEkUPHll+f9Az+nA2LmDHWJlfET8eg65+UFx8AJpgC85dby4qUOHLpfuUG0IvFLcFisGejHKclnrlfN9ire6Aap8U0kpyzb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeMfEUMNIlGhdLn7PS6D1YTJ/Kqg3Y/zwYuvYJ5MDXw=;
 b=WsagQT9tEsXhgUb1kj+oUVAN0iG8OU40qxRDuXRREKXWPV/6scaC8K3QzpbE/tAdww0LdOPcdQQQxrexUsjEpzo+RS6MF3tNIS6yH4ZpbuLazEeNdwMx3y3dhUu6jU9hSUK/krQSJZpQRKiNvehZf2gdi2MUpJyDYvsPqW168z291Al///W81i6J+FCeMIOpDn7zEY1tq88F1KMsBgWqzmvoEIe1l23u3GwcF1qqA9HM0/uPIBQNyQ6j1kK/b0mW32VUVT1x4uFWtXNYbgSpOzxm+0Jw9kpzq0QLs2E7d0irVTUFScdrr7vP4Cmmk6DfwFXKd/lbFdkOft40cuISKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeMfEUMNIlGhdLn7PS6D1YTJ/Kqg3Y/zwYuvYJ5MDXw=;
 b=cp4qubYIk3N9rcfcRILDqNhSjLC8hB/S5+it7AxoKgW1ms9Jrq4uhVDxT+FFNX8qDFxFIWLfnv1thsyJaB1ESAPGd8+5StNtidEuf9U/wSehTdSfW4CjGbir1Acl/GLPlWyTF0QK+yf7Dy4KyiiPDEOV+JNgc1ST+qpfrFsUzbs=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB2358.namprd12.prod.outlook.com (2603:10b6:4:b3::34) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Tue, 24 Nov 2020 00:42:51 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5a6:dfb2:fdfd:2d91]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5a6:dfb2:fdfd:2d91%6]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 00:42:51 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Colin King <colin.king@canonical.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Wang,
 Kevin(Yang)" <Kevin1.Wang@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix spelling mistake
 "smu_state_memroy_block" -> "smu_state_memory_block"
Thread-Topic: [PATCH] drm/amd/powerplay: fix spelling mistake
 "smu_state_memroy_block" -> "smu_state_memory_block"
Thread-Index: AQHWwYb/QG3R3a5QL024dYjMdI9elanWckgQ
Date: Tue, 24 Nov 2020 00:42:51 +0000
Message-ID: <DM6PR12MB26197807564F833B9A2E18E8E4FB0@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20201123105417.198314-1-colin.king@canonical.com>
In-Reply-To: <20201123105417.198314-1-colin.king@canonical.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=f32d5e88-8f5d-4a47-bd4c-d72c443bef13;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-11-24T00:42:23Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c045ddce-e8cf-4f82-be4f-08d89011dfb0
x-ms-traffictypediagnostic: DM5PR12MB2358:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB23585D8AF6BDBDB0BFBBEB7AE4FB0@DM5PR12MB2358.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZlWHmH20f+n9uRJ6UqDUuAnpZgwCE+C2w+lhl7aNHo5IHf2vdkBl+XUnzttyM534c8uLEOMZnzfQj9mv6yvOLhGPkvPPEcU5wzaab9wVmBcBmqDIM4Q7mPJqsB6vF+ssH4GWRK0Q8YN5fcAoXjY8sYIkcUdnpFR/hXLa+p9bSLrh3KaJWnDA6SRR2Esb+ok+VFzpErs+BdZ7UFvVuNDNRlVufGKFtOln+iaI1CWUoB1wdMdm9prYvddxxIKJLCsku6G+V8eZjJxVMUiOFABiQ0UlCN0mSbny43tUwcZuDvgN/EmpTtIh7OVoFWK6/8nRvYs6dVgqTSxsdA57qmSkwUWFoWu87NCJMY0w2zylnp94J3GHxJvZqi28cyOwhOGQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(8676002)(26005)(478600001)(186003)(66556008)(76116006)(66446008)(4326008)(64756008)(33656002)(66946007)(2906002)(66476007)(5660300002)(71200400001)(7696005)(52536014)(53546011)(6506007)(86362001)(8936002)(55016002)(9686003)(83380400001)(316002)(54906003)(921005)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: tUhLQX6BP181GW+ZJWO44XWJp4pErCeGd047x/HgKXoCdyPv2LISo1cOJjLOs1Y8nS4ElFEVBP7JzMSqEPPJgDK8Dq7mWzWeO1X4FNDDPIIypwxCMhF7oUdQEx1bO35rAp4EvEP62RKKJ2jnexxTvt5Bk/B1Ye0jscW4h518Jl7D91P+O6Ci9tDv9nloaxNF3F6zfwNWo+93FhCxFHmO1sZCMGdEfb70OxLMqlqjKjvIJgUGBPj0nN7EPGP66oJYk95HUn/2z35ShMDjGcK6IXc+ntkfrAHfnxoM2O4FnAG7USqkKCUOqpNrR/Bx0mF7zY6EH0YYKN0p45z/4qEJp6gXBAnMSgaQX3RmF+sRUjdxO66lJ2AYSBHnRy8fxdStVH0MtzGXwxN32rYAVdqddKkTPE8IAyhjgA/C0MOXNWyGgl199Ifj7sqNU0oA17LWvO2wqOWE1wQ6CvLQbtneHpJzw7V1f1LrVCoFyjjrnZ6fULsSRGc3HR9/r1SEADAynBoqrcdktORfLStqFv0HxH//rlrgHCCvNO2dT6iRGaYQdSVwyYmJqhzCOvrYC5g68+17hLEjKck6RZW8X3NxvbuxN69dgSrwUmBurnYAdOKTdmTlnB5OBWS39XW07Wi43/AUto3inZhAtVV+8ljC0qysiU7bL2JNx0cbfYDXKrMNcMUR5nZTO0HHKlc0lJJGgjdGJLg3I4MUHAzaesnRZN7BncyOTBpAslokK8fI5Lf7PuGTe/wFlzcx/Z7TrMxLM5UFAVBDzoqJ98pwEc1uR+k2Pg12KmkBInJhyhgLR39vikolLOktctxFYMOWjFcxxXMFR+KRo9QfUr8oVXUt02RmWCDCPJxd3Rh/mYSxfIDT/Typ4H/cq+FTPEqdQICLEnTRIm4V8WmLLS+axFsxpA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c045ddce-e8cf-4f82-be4f-08d89011dfb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 00:42:51.3343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gyl3B0f3QWzaA0a7DbVI/wTHLhjLp5Z24qUFPyrrdD/FPZS8JlmAiPNAgfe1r0pi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2358
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: Colin King <colin.king@canonical.com>
Sent: Monday, November 23, 2020 6:54 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Quan, Evan <Evan.Quan@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Gui, Jack <Jack.Gui@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: fix spelling mistake "smu_state_memroy_block" -> "smu_state_memory_block"

From: Colin Ian King <colin.king@canonical.com>

The struct name smu_state_memroy_block contains a spelling mistake, rename it to smu_state_memory_block

Fixes: 8554e67d6e22 ("drm/amd/powerplay: implement power_dpm_state sys interface for SMU11")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
index 7550757cc059..a559ea2204c1 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@ -99,7 +99,7 @@ struct smu_state_display_block {
 bool              enable_vari_bright;
 };

-struct smu_state_memroy_block {
+struct smu_state_memory_block {
 bool              dll_off;
 uint8_t                 m3arb;
 uint8_t                 unused[3];
@@ -146,7 +146,7 @@ struct smu_power_state {
 struct smu_state_validation_block             validation;
 struct smu_state_pcie_block                   pcie;
 struct smu_state_display_block                display;
-struct smu_state_memroy_block                 memory;
+struct smu_state_memory_block                 memory;
 struct smu_state_software_algorithm_block     software;
 struct smu_uvd_clocks                         uvd_clocks;
 struct smu_hw_power_state                     hardware;
--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
