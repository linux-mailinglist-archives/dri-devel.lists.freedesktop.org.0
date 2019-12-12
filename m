Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA511C496
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 05:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675AB6EC4B;
	Thu, 12 Dec 2019 04:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700055.outbound.protection.outlook.com [40.107.70.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3396EC49;
 Thu, 12 Dec 2019 04:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSP7OTXz6j39DZYT1JJ3k87w80rhc8aQGoUpOO9vGGfQOCS5XBRI166ZT0j6E+JuIM7RA9BMcRKU9ihA7d7E1bGDArZTRgFV/RH9RMsC7Y03i2jF84wbSsER8omP3QDHSf3TCwMAReRh+5T8syfR0m3zI0p3/TMOj1CF94NGO76EZHpQcbKUjwAt+MA0XPwlEk5cM2hweOmLtpxgUrkueXtP7Ac24qRK96kBQTAaH3GRY4VXlPNpsueI/RDt/36EnajvKm77fTeRabfsC4p3JsYLAAMPyz3azdvObnXSdWb7JXwU5TQFPZay1M3odCccGxigg7cUbf+VbA9U3sbLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apasXu21ckbUYQTvyeOT8SC6OYyDlKQhkIBn9GV81U4=;
 b=Aof0/NIL6wt7raFthcID0VX15A0fBOeghfGT0NncffO06s6o/qk96wV1+afkjlnZKOj5Ml8HZeGcEOdxfYmQwmym3KH3SnCF47kfIC/ybeNjdnBURaG7MM8uVy/IgabA/56lNksFuBWfNZsIeZGoD+xWkQ5Y/yFiKgSaOloKs4ZB/+FYOxfK+E/6pPU8ewAmDlmACLyZuw7rbueKxP7bnEf7A5eYsN8uyVa5xN8HJMkSg0nWf5uftviDe0xRAR+Vv8v9r6GhbJ8r2XP2sdgGXDD+KfuzmqkU4lLdkv6rGgqLCwrrfNMWm0r0QTsA7W0dYF//d4NgQeP3sMO4F7oM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apasXu21ckbUYQTvyeOT8SC6OYyDlKQhkIBn9GV81U4=;
 b=RJTXxW+YciNHx5FIFftvdo/oNoFhQs7gdIXG85SpQp3LNHcs0kYjzEweay3/iWgDwdkWxB1wZgu9HMbPyd937YMIlBn4KaSnlubm7+YoiFSykvBXPjwgxXopbparl6yHWQk/pezblYYVZ++q84MwUkyH5Sy30dXtLZLDPFr4Jno=
Received: from MN2PR12MB4285.namprd12.prod.outlook.com (52.135.49.140) by
 MN2PR12MB3069.namprd12.prod.outlook.com (20.178.241.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 12 Dec 2019 04:05:53 +0000
Received: from MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6]) by MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6%6]) with mapi id 15.20.2538.012; Thu, 12 Dec 2019
 04:05:53 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [RESEND PATCH 5/5] drm/amdgpu: Switch from system_highpri_wq to
 system_unbound_wq
Thread-Topic: [RESEND PATCH 5/5] drm/amdgpu: Switch from system_highpri_wq to
 system_unbound_wq
Thread-Index: AQHVsGMMkisfGlTyEEOIrt04JqoXPqe14PyQ
Date: Thu, 12 Dec 2019 04:05:53 +0000
Message-ID: <MN2PR12MB4285F26B150952CFD3B543E5F6550@MN2PR12MB4285.namprd12.prod.outlook.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
 <1576096732-3596-5-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1576096732-3596-5-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-12T04:05:51Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=eae65dc2-272e-4c52-8e8e-00003859b1a1;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-12T04:05:51Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 4e6c8e3e-b6d8-4c83-bc7f-000038c4f196
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is ) smtp.mailfrom=Le.Ma@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 55968364-7fc9-45f3-9903-08d77eb89544
x-ms-traffictypediagnostic: MN2PR12MB3069:|MN2PR12MB3069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3069287D818920978B2BF16DF6550@MN2PR12MB3069.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(189003)(13464003)(199004)(7696005)(81166006)(8936002)(6506007)(81156014)(26005)(5660300002)(71200400001)(52536014)(8676002)(53546011)(4326008)(86362001)(478600001)(450100002)(55016002)(186003)(54906003)(316002)(66446008)(2906002)(66556008)(64756008)(66946007)(76116006)(66476007)(33656002)(9686003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3069;
 H:MN2PR12MB4285.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /4Zk8/SR8jiHGp/9J6I2lSlEULvf7veIZeQ6q1Y9+stXdVsK0u/8v5Qgbn6N+5JeUwjU31dvr3iFkT5By925Olm9Q6Cn2c7efno+0HxxGVq+RODFtqmPtnZ4VovSGJimB1toPYIHNv2m3nbihG6HIWnhNbOB1UPh0ZYehBD3iOloOsl44uTtczXzbWj50Hz870JWecVuUeuc5Mqnrd9wMEnHemC6jCd6p5JUIP7nRxH9VlYxDe9vlHHRa0O6wjTiq8EsjwRUEWuDmVe4r/HJxnPzBTh7aHNP8g9M+ZZBTpVsiucXsckWisTmYsNKeST1Te07NnnfILvf6sTHxf1K5dBHPZ/D9M0OkgmtYZPjwBi+xW/eAfopkLgvKKchwG67PQ12ngFDhWuRPkT3crET0WlWS867alVsZuiqngYUCLuyrTyDGgqrEftn1wtLgU6Bgj5vqlPW+yiT/ppRfj+XgOwIN3jjGPYLcq8AW3tWDGyl0vfaH4WPyCQdjTbI6Enx
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55968364-7fc9-45f3-9903-08d77eb89544
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 04:05:53.8183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RSfNnvwnr+FbRruSaOExAR1M6WpdDXz01lUVZPW/waeWl85Khy1gHBRLXME45u5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3069
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Le Ma <Le.Ma@amd.com>

Regards,
Ma Le

-----Original Message-----
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com> 
Sent: Thursday, December 12, 2019 4:39 AM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Ma, Le <Le.Ma@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Subject: [RESEND PATCH 5/5] drm/amdgpu: Switch from system_highpri_wq to system_unbound_wq

This is to avoid queueing jobs to same CPU during XGMI hive reset because there is a strict timeline for when the reset commands must reach all the GPUs in the hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e4089a0..1518565 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3842,7 +3842,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
 		list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
 			/* For XGMI run all resets in parallel to speed up the process */
 			if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-				if (!queue_work(system_highpri_wq, &tmp_adev->xgmi_reset_work))
+				if (!queue_work(system_unbound_wq, &tmp_adev->xgmi_reset_work))
 					r = -EALREADY;
 			} else
 				r = amdgpu_asic_reset(tmp_adev);
--
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
