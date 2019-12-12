Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFEB11C492
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 05:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1128C6EC4C;
	Thu, 12 Dec 2019 04:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756736EC4C;
 Thu, 12 Dec 2019 04:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eil2gP0TgApaijUJi/8tSoYFuxH8+Dc5VhhLOsPX8bJzMxmNSjPqlCrTzGuR2NwqmRQMsKWNx6AAwbHL4Ostmaa2nlB58d2mVZilRMUvxkULtCeNGp7j3K7CAIJXw4tF1hRB/GB4cYPW6sq9L12LGReYlp2SzzKKXQZqBL76GwmdZH08oj2Q3ww+KcdFv09quat4HCpgPXXKWiG1ezyvZkNybD6vO7qgutsszSwdbYZQQySDMjRAPEeE5+tHubEszbezTkw0Zrf6iahI9BmqTR2kN8BZ8WOVqgz9c+IjEfAxClGNT5HVk0TsiUGwNfQ59SOWSHnCEpcTn4J9ZWoO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMXBTPmezQrW0NMlXMw6CAoa1GsznNgzNYh4IiUobZU=;
 b=U8vgI5JrTzTQ+vEX42rNS+do1pGefdEp+8GMLTYT39RdcOeg+d5j9BzFQUPXQ2cSnGkJW0sb7m2JVSXP7qyTuY3hG6NLG55IKzpNPybLUFUKKbEiPBubea25e7T/kNBbmxYtmEZVagaR32YpB5nigOHLwv0YeLZ7MOnvhfLugRORr2Iyk3+9+SIBDkMZWjWsXmeTYI31Vw2+PgbGp0+jX2hteWPoRPjmuhXcTdNmJ88U2kAzmLjKshvX9iBxPrg7R7+/TuQR4+XvjZIUjqzSG3Ii21qu1oLpuemtKpziSXDq+cX2ymlYQ/hswHbtJSW2giLiE/INHAX43Ora2bYXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMXBTPmezQrW0NMlXMw6CAoa1GsznNgzNYh4IiUobZU=;
 b=cgm29Kuw2m75X2L2ZdHkFU9ML5aIdJPm6h+ES8fbSTq/4zZEcKbjm76t+piNTuBvIA5xVU/KQKeChNn61AAeUqTRonzWKLKIS742cXsDDMnkOFaZT7ne9ndxpVvZih9N9/oGyz+Hgyg9Hdv83ArwSLcEwr1Fa0dtc7CKFPGz9wo=
Received: from MN2PR12MB4285.namprd12.prod.outlook.com (52.135.49.140) by
 MN2PR12MB3069.namprd12.prod.outlook.com (20.178.241.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 12 Dec 2019 04:04:41 +0000
Received: from MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6]) by MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6%6]) with mapi id 15.20.2538.012; Thu, 12 Dec 2019
 04:04:41 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [RESEND PATCH 3/5] drm/amdgpu: Add task barrier to XGMI hive.
Thread-Topic: [RESEND PATCH 3/5] drm/amdgpu: Add task barrier to XGMI hive.
Thread-Index: AQHVsGMOTHtACecMTE+9hvDYeC17F6e12rDA
Date: Thu, 12 Dec 2019 04:04:41 +0000
Message-ID: <MN2PR12MB42859EBA49DC563163F5469CF6550@MN2PR12MB4285.namprd12.prod.outlook.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
 <1576096732-3596-3-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1576096732-3596-3-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-12T04:04:37Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=087f4d2c-c055-4007-939c-0000cab3e071;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-12T04:04:37Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 152f438a-d5a2-4c8b-8a0d-0000a5dd8b75
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is ) smtp.mailfrom=Le.Ma@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6bc5000e-452d-46b8-56ae-08d77eb86a23
x-ms-traffictypediagnostic: MN2PR12MB3069:|MN2PR12MB3069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB306939FBCE9CE36C09873C91F6550@MN2PR12MB3069.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:415;
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
x-microsoft-antispam-message-info: JVVqzVgzWIUzCIOcJgsQLAK0ILcmZZPgsRQ024QYqNXUs+zXxNCsngXv4xmsIW6E1tKdVzdQWXm3R+fO7I36VX6IdaLR/tzsYUUsEo3folOJPKEtuuEHfXiJuHwlzta7wcOaCY/OLB66ZwzsnLngQbbJzy1XSNFQxiUsahmvHWwMsSikDwkkVKQC+TSyIsq3gz7CaVU57YyH204ritIJMK60rt+6SIfOyDByJUGRrgNjcx23EOdS9gc+HugAwtsTZgLV2R341RHlunk3p+hvAXoR4LMPsTVDp7ARA8QJzIzg9yhwStQi1VTxtOSwWZ4ZkeqDewPuec1l9BIMzqQZq9+1Zzv6DKsgf9+YBbUC0fRKrxa0NdaNzjP0nwzQPrMKGx67IeZAo/bOwH7iNf/qDctwW1p1rCVwMaqEi1BxXdBs8361IbN8+ZMTVmE/w0jeXtdmCDUXRmqFbhwGbFDy1C0bDtVPfv3A1AZVSfAXN9DvRobGSCVzPr48MkXw/DCy
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc5000e-452d-46b8-56ae-08d77eb86a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 04:04:41.4673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvXI1cs9xK1AbVqkbxgXZF9aSeWIEXJNttRXNAstj3Utv+piuuEgAPMyqL9d+5oW
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
Subject: [RESEND PATCH 3/5] drm/amdgpu: Add task barrier to XGMI hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 4 ++++  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 61d13d8..5cf920d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -261,6 +261,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev, int lo
 	INIT_LIST_HEAD(&tmp->device_list);
 	mutex_init(&tmp->hive_lock);
 	mutex_init(&tmp->reset_lock);
+	task_barrier_init(&tmp->tb);
 
 	if (lock)
 		mutex_lock(&tmp->hive_lock);
@@ -408,6 +409,8 @@ int amdgpu_xgmi_add_device(struct amdgpu_device *adev)
 	top_info->num_nodes = count;
 	hive->number_devices = count;
 
+	task_barrier_add_task(&hive->tb);
+
 	if (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_PSP)) {
 		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
 			/* update node list for other device in the hive */ @@ -470,6 +473,7 @@ void amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
 		mutex_destroy(&hive->hive_lock);
 		mutex_destroy(&hive->reset_lock);
 	} else {
+		task_barrier_rem_task(&hive->tb);
 		amdgpu_xgmi_sysfs_rem_dev_info(adev, hive);
 		mutex_unlock(&hive->hive_lock);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index bbf504f..74011fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -22,6 +22,7 @@
 #ifndef __AMDGPU_XGMI_H__
 #define __AMDGPU_XGMI_H__
 
+#include <drm/task_barrier.h>
 #include "amdgpu_psp.h"
 
 struct amdgpu_hive_info {
@@ -33,6 +34,7 @@ struct amdgpu_hive_info {
 	struct device_attribute dev_attr;
 	struct amdgpu_device *adev;
 	int pstate; /*0 -- low , 1 -- high , -1 unknown*/
+	struct task_barrier tb;
 };
 
 struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev, int lock);
--
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
