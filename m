Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4225547E773
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 19:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507D10E3A3;
	Thu, 23 Dec 2021 18:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F5010E3A3;
 Thu, 23 Dec 2021 18:07:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1iD5GCysmopP3gP5/5rW4l3D9kCIuPA3fZXuQm6EG4px4th3ZYhUPBaNdwLLCYoNg+aiwV7EQufZeo30pUDXr2jVch+T7lG7fXAeGDL7KqeXWEIXKJhW7OPrLy5NC7zs/+aKNSoRACyNaYpGqwsf6zXLyBMTFjiONwE8MhHSLDRArzSwwHbJgi8eCp1doNtvJOcWkSfy3u+tcSxJqf8VM8zl7IaUV3b+1q9CHR6K0ji3Leh4kq+su7E78T2u+8wNiR2IysB6a7RL0Tylw7E6r6VaUQ7HnI+RNsoU5UxAbBJ1RP2P8ffg2OdJq0yiAviaBHQ60uuhREEjz1BxeZ1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgRneGNZ3kW7mxMBfG9DelNCGYqE3IoYeCrKGXEXIY0=;
 b=k9yR62XQ4UZvlVXEvZtzssGuCPLQ4WFtbMDKAgBrjNhLEW3rHrCkI7/ujk3wP8MiA0Fa2WlUyJDH77sZPQI1Cht3BNt94FKvnV3Ou1HyQ/1RPJZypF3+Z+O+b6TVe/DwKKcohGp/GxNWjbPEIm8dfbo9m3S5RsOKzMJGdM/wnr81AW1/+LW3+B+coMwCRd03phEJcZq9+I4PGseQxCLQ3R+3zvZEcEVk+Ak5YiwBgAgVGU1xydzclwTuFqH4S5+hzi/pETcX6akZuqQ5IU0PmUQ/QiRyoRz1/FgeAT3gm3yCwqm7La4eYtTp1Q9xW2W2gv4ElanylFuYktZNgAPJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgRneGNZ3kW7mxMBfG9DelNCGYqE3IoYeCrKGXEXIY0=;
 b=CXteczjiJjTFp3xBMzV0PZ3HxFtLkwTO4IoZwDKp0K54+mZLFaaR3L2Q96hPKE7l1yuYRQO7NuMq+JmnKYFxRcIu6ciqg4+dNF0sBlpOYf8GuGRorqMSl0mFgOGPITWn28ZjdKjDVETaOjtx2+y+OhtRPjey5p9uCalJqH69XtE=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by CH0PR12MB5250.namprd12.prod.outlook.com (2603:10b6:610:d1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 18:07:51 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::31b4:ebc:1707:f563]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::31b4:ebc:1707:f563%9]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 18:07:51 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
Thread-Topic: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
Thread-Index: AQHX94FOLP/rEZePZ0yv2ikB8y1voaxAQMXQ
Date: Thu, 23 Dec 2021 18:07:51 +0000
Message-ID: <CH0PR12MB537265C4F088C1137B85631FF47E9@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
In-Reply-To: <20211222221400.790842-4-andrey.grodzovsky@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-23T16:12:32Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=3a98f16a-bbac-454d-ba49-46787e1cd8e6;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-23T18:07:49Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 9789078e-ae2d-489d-8d5e-44d485f8498a
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 507dc9aa-d238-4fc4-81a0-08d9c63f2269
x-ms-traffictypediagnostic: CH0PR12MB5250:EE_
x-microsoft-antispam-prvs: <CH0PR12MB52500DE6C87C3ABDB203A32BF47E9@CH0PR12MB5250.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OTDMNpbMK2Pkd8/Ew6+T3ebmtwv01eXlO0oGVxlg51+F7vM9v51OHBWSBE7VJQl+X8R/E9UUy84aZDxmYUlsGpF0IusuYHK2iMWwq/Gx5NetWsq1aTgKTsFltJDPYFYFxODih2GeTifocljMZpnEBoq7+s/FMDVSPrWLzsap+9HUfLSnRO4C2TYb9TSbz1Sd6xPOPCSC2qzYbZVnIB+j2a1hINcvUhOBO4HiH1ciLx6XYjqIp+m85P0YNksr0DPRFeibnUenraPOKaHgrWQSlzL1MDsBNiV7a2DlcXqi1Nr/wHOEglyng/eq593vJwCNLt/BM0aM4iydJBmRiNGcKWJu0yG3COt2K2Q+QaDhfD/ieFxqm0/5TNSOHL8knMVdSczEClGvZyQZiQjwnoNb+f95pKWnuaGjOXb4lPB/PUIgLSKtb44zly6kkS9ctqHIzlBsue+UDk6JQpsf8CPkebJXVJypn4SChaS5FiPs5O0z4BdrQzoh2brS4l+WIK7H6q8wzumwDyzLvUswz/AJADKSDUbp4n4m0UgaRs3xCWVSxfnLZQWd/cXRkgpTGUOjEMVKmsn/UZEjm3FNM7Ont+lwnOZhZeKXTZENUHhisEibVCqQt/yyA5jE0YJXUnKxC3drH2n8T2b9P7MwxWYlMOk0tz0ndZBaJUOt7Rj68LAwKiJ0aJC9k43fHbct5gMkz6rCjVbEvvzHC25ukGc5tQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(52536014)(66946007)(71200400001)(55016003)(33656002)(26005)(8936002)(66556008)(9686003)(76116006)(66446008)(8676002)(64756008)(66476007)(4326008)(38100700002)(122000001)(186003)(7696005)(316002)(5660300002)(38070700005)(508600001)(110136005)(2906002)(53546011)(6506007)(83380400001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dgs3s2qmRvdt9Y4f7c7zxmHkP7Qh3SDmut20mGVi7/7yyWV0Y0G2pJVXxvkj?=
 =?us-ascii?Q?2kYEaKgBd7uur/mHUkA6e8LxBxrQi1m/B49S+RgerAmD35FyhZmshV6po1ki?=
 =?us-ascii?Q?nxZ92KRQ5o7C3Wq2B1VQtLHBO1KPiTSAmoZqLkakIzWzVkkq84alJ47C9a7q?=
 =?us-ascii?Q?2f7pspebilJXIxXr1FwH+fCBW0FN0501xwkdqEtNO9XN9Jo7HpdCWCD3MVG/?=
 =?us-ascii?Q?WS5HWaj7Yxw7GTJt6PvQCSieYYjSDLNv2owzeK678h3IriVoDTnJ7QoFQYzf?=
 =?us-ascii?Q?Cx2xqL6Oq/OXEbZsPDxl6af3quXiq0fOrinYV7ec56lB2y/NrnC3GLay222V?=
 =?us-ascii?Q?47B6NfBhoO8FnE8ICB4JVtZZHW7c11VTZf7CgkaxTPXi+Kgaj0j4hLX/QlpP?=
 =?us-ascii?Q?WZncN/bMKVmUuHgPaZmlBJ1/TLQHqSZi1a1wkZLvL1z3uFVm1v63j+SHpvOZ?=
 =?us-ascii?Q?NEQdlK8idODxLzd05Ap7+WfZsz8fT76EM1b0Aw1gXMMoFW7M0Mu93sT1jNom?=
 =?us-ascii?Q?dkxEfGuHmkvse/nz9f+tulNU1ThVRikfQNtVQK7tL8XtSPmV3hIixKBR0TAe?=
 =?us-ascii?Q?MyCGkligRAFGrLtuoxNXTpcIrgh9hFcZFMNL+VkqIf3sXW2bIKNMLko6SWuv?=
 =?us-ascii?Q?EQmUoU9ISUj7cbu+R7tPOIjBdlXEGtWVVvOiaK3c8pZPcOKTnVL+YQUs7iVb?=
 =?us-ascii?Q?UkdVefCka81YUzQMSeI/hpVhV3UsZAjufANjBarmmodAbsSsZqHWDV8rRtSu?=
 =?us-ascii?Q?5H3+F9QHdVar4q+yGf4tQ7mhqxoUISM+uJ6WKwjFl8SSwuyOxhHFFzlEI2jM?=
 =?us-ascii?Q?mnzUEMmpqG9sdGwPia12kHXdSray36LAEEH1lQRsJTY37zauDLGlvqTaI2Bg?=
 =?us-ascii?Q?BrebIc7IdFyj15rE2Vro1ckGdwtieOHwiT+zliLMp8l+qddtYub7/M0Fxo4d?=
 =?us-ascii?Q?kk3RNy1VwLLOkmTMxuTWmLwxQd9f0Zgzgimq9j610BYFrlMeDDaNSYuoJCOf?=
 =?us-ascii?Q?ZYuv/il5BKDkgKZhHlBpWPKn0ZqXAbD8stKBJvcheypZSz/CwgiKFsiLUj9U?=
 =?us-ascii?Q?pLbY11p/enFEEE3nlrSeoA+lyK0zxle0cXCBPoHE4oEYTEhHA3YSZV7a1e1C?=
 =?us-ascii?Q?dymOt+fGdLjcYIHjyJCeSAPPFEqQ7pDhbh6lDpLwkdVuOR2sTuRvEoK2e3YV?=
 =?us-ascii?Q?yKSeeQ+jhLApBMNZIe8b/rqS/2rm+QTRXTMk6WbfiK/uS33MXaqvtcaD3+Ro?=
 =?us-ascii?Q?uPUeqh4NiDzL+35v2F3bas+jPP+TvnOEOi1Q9y/urGs8sm2lPWDoL3Ug3YJ2?=
 =?us-ascii?Q?hmmGxqU3sTUy3ZGLsKIWRhDdheAvXGE0JJbPYpdpASR1mJmusJKuddfC9+hf?=
 =?us-ascii?Q?SvovQCvcCwOBrEwE7PgrQ9xdHseOGl82o0Nad9DDkIw/Uk/TnCSXIvsqfM8F?=
 =?us-ascii?Q?P/M08+G1l+nclpDdsjMmKiZpc+Bce/9R7AfYdLs5oQm3buqxElqlpr7punmy?=
 =?us-ascii?Q?vAqx/pifL8sbZqFe4sDuNd+d/owJdVB9KTVHEA/1Jmzqan+Gb7gUolbWDaXa?=
 =?us-ascii?Q?A/Kuxy0W1vGqwaCfLFWzTMsqvgXVYma3Yr3ZnW1lBX8m/7plDuZF9Fg+EU7e?=
 =?us-ascii?Q?E6G5S4zjmxrgUEHE1NmVatM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507dc9aa-d238-4fc4-81a0-08d9c63f2269
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 18:07:51.0313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZ4D6bw1sThFGEtmlcrcnU2dBvRbnge57HDQ2SY4WiG5J+nC1TsvtQZiqXMhxc2J2ZGGHG9Pmcxtdq+8BJ4B7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5250
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
Cc: "Chen, Horace" <Horace.Chen@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

I have  a discussion with  Andrey  about this offline.   It seems dangerous=
  to remove the in_gpu_reset and  reset_semm directly inside the  flr_work.=
  In the case when the reset is triggered from host side , gpu need to be l=
ocked while host perform reset after flr_work reply the host with  READY_TO=
_RESET.=20
The original comments seems need to be updated.=20

Regards
Shaoyun.liu
=20

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Andrey G=
rodzovsky
Sent: Wednesday, December 22, 2021 5:14 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Liu, Monk <Monk.Liu@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd=
.com>; Chen, Horace <Horace.Chen@amd.com>; Koenig, Christian <Christian.Koe=
nig@amd.com>; daniel@ffwll.ch
Subject: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection fo=
r SRIOV

Since now flr work is serialized against  GPU resets there is no need for t=
his.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------  drivers/gpu/drm/am=
d/amdgpu/mxgpu_nv.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/am=
dgpu/mxgpu_ai.c
index 487cd654b69e..7d59a66e3988 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struc=
t *work)
 	struct amdgpu_device *adev =3D container_of(virt, struct amdgpu_device, v=
irt);
 	int timeout =3D AI_MAILBOX_POLL_FLR_TIMEDOUT;
=20
-	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
-	 * otherwise the mailbox msg will be ruined/reseted by
-	 * the VF FLR.
-	 */
-	if (!down_write_trylock(&adev->reset_sem))
-		return;
-
 	amdgpu_virt_fini_data_exchange(adev);
-	atomic_set(&adev->in_gpu_reset, 1);
=20
 	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
=20
@@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct=
 *work)
 	} while (timeout > 1);
=20
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
-
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) || diff --git a/drivers/gpu/drm=
/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index e3869067a31d..f82c066c8e8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struc=
t *work)
 	struct amdgpu_device *adev =3D container_of(virt, struct amdgpu_device, v=
irt);
 	int timeout =3D NV_MAILBOX_POLL_FLR_TIMEDOUT;
=20
-	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
-	 * otherwise the mailbox msg will be ruined/reseted by
-	 * the VF FLR.
-	 */
-	if (!down_write_trylock(&adev->reset_sem))
-		return;
-
 	amdgpu_virt_fini_data_exchange(adev);
-	atomic_set(&adev->in_gpu_reset, 1);
=20
 	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
=20
@@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct=
 *work)
 	} while (timeout > 1);
=20
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
-
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
--
2.25.1
