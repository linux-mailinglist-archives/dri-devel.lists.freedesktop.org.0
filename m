Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67B2F2859
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 07:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008A289E26;
	Tue, 12 Jan 2021 06:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5C89E26;
 Tue, 12 Jan 2021 06:36:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdxZf1tYSiBgZYu0Z2AekkxDGdKNMFxQGAQaEG4VLYE/8WC3jIi5lHZpQK2xTPj8KChEmvLEyOF5GAk4y5He+wYhihRQgmPJSUOTxI+v4I/eH3D5wIdWlqpV5Xmvk9KpWO2LTZS2jwNKiNeRITA18HLG7i67S3YIHlhg5QoaS/jSufmyPeLc7PtC0SkwqsTEBT5zz4Ckjn6uCiAZX/C69XjUpz18drRo3xNTkVmBvOLZZYL9z3ixPOHI4Epe9lU2pP8gpheJ/Aw6lc3ZJRdI2yP5aKLYzp0JxXX+3yclL62UipE9rQNc0aXSwwmHtf9a9R+I3lbiGzMfDBhLBATomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9I/KsKA/qp4PQ3h610/2znWNVtPydf0xbAyJy0Ah+8=;
 b=g5+yJEGwxDRpSPieROpqqYpmECceH+DFbkAn4u7+pSka8aiOUMtq6mm3CGshh5AX/0AfPztFK2sRWoVP6SrLUTO1coIpO7NTp5NhsYCCBNQWnEHDWX+tUdoo93s8YGVO2xVoziidJ7CZ1v8NVpXIEhPkIiVSpFWv0nPhUdUpCEWFKM9WvW0rwsTn5n4p2gLC0jv7/uBG2dAYPL8w2dRlCOw4+x17ipoXhUhR7UMUDfsF4IesvVIcQn3rMZtPDz+85CRNAeCCWec3pc0GO46sjirTnDyTgErNmsANPcz+Dc3O8XGUcr/BrD2gye9xTB/kblnCWnSt1P85IrR9ibnIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9I/KsKA/qp4PQ3h610/2znWNVtPydf0xbAyJy0Ah+8=;
 b=uVXz5jDZJkO92CdZa9Vr547PCeWqyV6s8fyYcoNqbN9uDRWVFhkFvUIxzn2pILQfroFnGdSWnXcOu2n2qxE/FgrC9uqDjJr+ik+2mmloedx0w6xSDDUZZHHx3NkGDpPW8CnjaJW4M2vKpH3LWeBe+oSi/kpHB8X8+oqqhvwRmxY=
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Tue, 12 Jan 2021 06:36:53 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::196d:529b:914e:a60a]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::196d:529b:914e:a60a%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 06:36:53 +0000
From: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@linux.ie" <airlied@linux.ie>
Subject: RE: [PATCH 1/2] drm: distinguish return value of
 drm_dp_check_and_send_link_address.
Thread-Topic: [PATCH 1/2] drm: distinguish return value of
 drm_dp_check_and_send_link_address.
Thread-Index: AQHW4l87g80Wo2yCuEm9ejmyFFwqbqojlbww
Date: Tue, 12 Jan 2021 06:36:52 +0000
Message-ID: <DM6PR12MB2602B6281BF8C9430115E03BE3AA0@DM6PR12MB2602.namprd12.prod.outlook.com>
References: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
In-Reply-To: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-12T06:36:44Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=4eecd0bf-2fea-43b7-8493-0000321159f8;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2021-01-12T06:36:44Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: a3554cc2-5aba-46c6-945c-0000f28a4b5d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_justification: I confirm the recipients are approved for sharing this
 content
dlp-product: dlpe-windows
dlp-version: 11.5.0.60
dlp-reaction: no-action
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e64382f4-0f52-4cd2-8673-08d8b6c472f3
x-ms-traffictypediagnostic: DM6PR12MB4267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42675F4CCDE072CDE7582C2BE3AA0@DM6PR12MB4267.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ja3at7oqM7ODERBiZZc0Acijy81kOUhbX5JFPVOK0PzqxnREqDqW/1HI0f5o62heOoCzu2sUb84DrqU2MW6DPjGj7Dq4iUMVBjvVgkw8HB+JB4xOR8JY+iuTcX6eLozgIEc2SCdNuhoiWG+eWtosfP+LJzFwqCvpFw3E7f8YCFFFEPf0xIfPwEZ/a62GW8aricw083BJ5FMFRn3Q+gVVzJSFuysBrV2VTFppJeYX+9LHwr4lQYuCwXc3pOK7o4XHY07D5d5Yn3YUppdcbtsXdTfAs2jY70aqQGiBg42qc6nqpkv3ADTIOFuKkKzwVHb4yMaoijYWWpQSljV0ssD/LvWBIrBy4Q0FwiAJCwd3Yp02fRYDJ8q49qEHUgrE+JRf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(478600001)(110136005)(2906002)(5660300002)(76116006)(66946007)(66446008)(66556008)(7696005)(83380400001)(55016002)(64756008)(66476007)(8676002)(8936002)(53546011)(316002)(186003)(6506007)(26005)(52536014)(9686003)(71200400001)(86362001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0vUwNXEPj24hrlHXRFEe88EBUPh31ITrZuDkgJnYJ78X34CZWK48RI9DLkqg?=
 =?us-ascii?Q?nW0FylF85t47YWStHlce9uaoAYj9lT5H5Ph6PYnx61kSfcuD/NjwIY13Y7fD?=
 =?us-ascii?Q?+si5FS3rQBR+pME/0ImUZhyluYsEQnueA9ycFgk0j6y5nherjl+QesLxefYV?=
 =?us-ascii?Q?08FzktoRm+6SZaZ6HrDM8sX+G2AcE39ZKVcMbtvEupciA6sERTuPJ1Ymt3GK?=
 =?us-ascii?Q?JLhhDdAFVXSJor72mYbUX4ZEqNdn+1q+jtQ92Kq4KvHvnELXz16ImdUcrYKd?=
 =?us-ascii?Q?rXGS8z/9LUkPTA/iNI2UlUYpNi/IPpZtMKRYp3GNvnQYqFapGBNbZVQj7Xuh?=
 =?us-ascii?Q?2sHnP2q2nIQ/SUB/MIoAXYVYq/eVFYDUSDxo5uWrlgCSFcAE4y0XPdNN2Qqh?=
 =?us-ascii?Q?omoRO/vUyiTDEiYsYoxeR9lht86E5+N9HA+dtPJVKEO+lmjOQJbY+OltflO+?=
 =?us-ascii?Q?Qnx9PrC2dBsvxPnx3P1l7oCKoj/UV033NFZZCjmM/UsCzmGJd9NjZ2H79SCj?=
 =?us-ascii?Q?IXXleFrAE6H/0NxlkZZIfXftbj3c3qx9bCG756WEtFTmfSA0Eq+Q3cd2cNpI?=
 =?us-ascii?Q?b6u+oqXoXjRnGiMTsl8ywK4OIsh+pI8N7FIuZz02nR/Bm1hNm+5bbI1AgxPi?=
 =?us-ascii?Q?uLqRwEmUOD0iLCUWNJOXhG4DckoRXGkT7yVjWPBPFTp6zkUZTLitQiES9tfc?=
 =?us-ascii?Q?/bqBC8Dhr1b7+MSuSLrgUROtVpBewUphUKGXMZD3X+IrPp0hpWXWL8HDzJQo?=
 =?us-ascii?Q?Y2/PqbzEPo8SyrSrBLAh/QtSzEwahKH/U0vgXEE9AvOGvtKdmBhWDedcUxP9?=
 =?us-ascii?Q?VEao+kgLuItpODiXKT4e8AuD1jeAOs4JuCT1hgrvwBbvezoHhNg02xTp/Lt6?=
 =?us-ascii?Q?uw0TfwQig1kljb8vGVVe9zAkHiBd/9ehPqR7EAU3AGYt0nSWZu/LMf61Xf39?=
 =?us-ascii?Q?plOs8r9mDOxcyo5Facq+efcw8MdoteNzfxAnvgag+l4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64382f4-0f52-4cd2-8673-08d8b6c472f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 06:36:53.0743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohH//OFxgNo5JuFfrtpfruCCnE296X828V7+uTg+7qg2x+unrYGiyu6IJJk7vMIn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Any comment?

-----Original Message-----
From: Xiaogang.Chen <xiaogang.chen@amd.com> 
Sent: Monday, January 4, 2021 12:02 AM
To: amd-gfx@lists.freedesktop.org; Wentland, Harry <Harry.Wentland@amd.com>; dri-devel@lists.freedesktop.org; airlied@linux.ie
Cc: Chen, Xiaogang <Xiaogang.Chen@amd.com>
Subject: [PATCH 1/2] drm: distinguish return value of drm_dp_check_and_send_link_address.

From: Xiaogang Chen <xiaogang.chen@amd.com>

drm_dp_check_and_send_link_address discovers MST device topology.
It can return both positive and negative values. When it returns positive values there is no error found. If it returns negative values there is error found, such as get NAK , timeout, etc. Following drm_kms_helper_hotplug_event should be called when drm_dp_check_and_send_link_address returns positive value.

Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 17dbed0..3ef5206 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2650,7 +2650,7 @@ static void drm_dp_mst_link_probe_work(struct work_struct *work)
 	drm_dp_mst_topology_put_mstb(mstb);
 
 	mutex_unlock(&mgr->probe_lock);
-	if (ret)
+	if (ret > 0)
 		drm_kms_helper_hotplug_event(dev);
 }
 
--
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
