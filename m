Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E24AE63A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB8910E252;
	Wed,  9 Feb 2022 00:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CE710E21F;
 Wed,  9 Feb 2022 00:49:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0IPD+lC7WzogP7AZrbGsyExQRkROpt36a+5OBen+KXz6cwmul/47WFHD0oKNxKS+T+PPS/Y2oKZ0GaDRMe+YFvWCNxsJMF7SwvyvApvTsTkcqyJM1JAi0mZpwSv3C/94bhUypeuRRZhor6k5hK6rmRIUvZ6PntzHGtE+Fhc+Y/i+ZCqYlg0z9NlXjI77kx3o75hRoaCbQdvLKa93mVhvudvl3blC3hRkk8MUXMRLhlVDRAvXmp7lYHQBKk26YneHrktfP0alv1WETb63Z2EgkdHeGtJDPUyibfDIUdmpkdbMvKxbMgsIyuWVR3b0Pa62Diy0pp2ugKaWJSRhRG+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBWubjOvpumsKKWfPn4S030VL906vETthRbTyEwQF7s=;
 b=KM5Zt+s/PmAF01YxJHlG91D5O3iCP3VdhvC09AKqZ3GrcXgZgolg8/bdbH8wdA+NSXP0v2cYBADZQmLGHWsR9e4MyWK+zF7wzlwSeCycUQl+IW0jSTFGlRzFmVmzNtlVZMfY658fYDIgNJqaQEZMFfudgHA8WRN3JQESxSaFLXND1dbX92B2ydjRxM6pJ0wQBM1qFi+GT8V9l2nl07dSDJsW+PmFyNxD7Yg4C0pOxfw/tBRpLTuE+qGEVFKceHUjEsPf0B9dobiKyi6Es+LlIgvUYucoRx9PE5ODJ/KX3dJitt0CAxiluonFXPcP1rDfsEDPMdzWbWzeRC4Db6xm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBWubjOvpumsKKWfPn4S030VL906vETthRbTyEwQF7s=;
 b=L0rPHGuzVEOznMczj5dYOOyqlivL52x0r3sDyCIuFiVXZKfTvToR5xv42xkbSSqz8ny//oD8qce+jBscV+99v93G47GdEzrgMgLrM+c0xtOES4aWtDZu9pV284iXdZtBblTRcftdUz6xYiyJfe31GuAFNhk9Y5D95L+uqHd2Hvg=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 00:49:42 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::2dcd:d54f:4409:f1ff]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::2dcd:d54f:4409:f1ff%6]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 00:49:42 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [RFC v4 04/11] drm/amd/virt: For SRIOV send GPU reset directly to
 TDR queue.
Thread-Topic: [RFC v4 04/11] drm/amd/virt: For SRIOV send GPU reset directly
 to TDR queue.
Thread-Index: AQHYHUtR0gSCEpLpx0ejTCpmUULCCqyKYmLw
Date: Wed, 9 Feb 2022 00:49:42 +0000
Message-ID: <CH0PR12MB5372D139E42F3EA1C76FCF1EF42E9@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-5-andrey.grodzovsky@amd.com>
In-Reply-To: <20220209002320.6077-5-andrey.grodzovsky@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-09T00:49:41Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=23376678-93e7-433c-af95-04d7e5d1a569;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-02-09T00:49:41Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 0c20585b-394e-480d-8e4f-d32cc46d95fd
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d0b70f2-613e-47a4-37fd-08d9eb660f6a
x-ms-traffictypediagnostic: CH2PR12MB4216:EE_
x-microsoft-antispam-prvs: <CH2PR12MB42164D3B2FA16DC74C253AA0F42E9@CH2PR12MB4216.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zh4AonJQW/wSlS+VggwoO1o1qyHOkKb2hko4KE+vNW2+9wOwAYbsnkyIxfHRRxd2ZijwwWfU2ggAHUPDF1LIGOmaHpuLIOCwPQAKvAdWq34otzE9Cjs+Wp4VX2tayrGV3/wgAYQpR7fumUtd2ZPNCCRTh/WkOyL3dQ3gQzO428ApIbIyf9VGzBcgpfLWwQoMO4d+GQ9A738daV7q3kw20YvQoe9iKcjjaXkeFVqpeNmOW/k/u0ktj/aBFWGVvtVpR0lvlutMKA0T3b+FSTTeTVyFj/wCLIqNVRSs1CtVAsAecXcPyR8wb7Gz6S4MhfKDJO88Swg4hrCUhPBXqIcZkR5IieLrpn0Yjqnr4Sr0eZQaV3HNZwx8nFdS5STP+0HjS8EMhce4hDokWpj2bOZVHBJk83XNDHdEGemiVCrfMgDsKivVfRdIBElkaKVlPH3d01udy92bRSrbtrFOqI1Uj/H3fYXS9/8Fr5WEIoPfesVmdT52aKF0iYkdqS6S4q/pubCx611rNYY0nL3h9Ils5RsW8okQ74+Seh6gejGAXUx5YRfmKXnwCUNXxxpxpl6uP0CIz7mKOGOA3DnPjjKx/drtRCKVAGZGRaLyeYFx9zU00npAr004ecYoMCA3VFHNYjEhIPN8F0KaLD/MvYSBYH6mcOvbeZUiNNoZwvVzgiW/L2FpZYYuLrP6f9omYYrJJCkf/w6sllSJjCsD7/omeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6506007)(9686003)(66556008)(66476007)(8676002)(66946007)(7696005)(53546011)(8936002)(64756008)(76116006)(110136005)(38100700002)(38070700005)(122000001)(316002)(508600001)(86362001)(55016003)(33656002)(4326008)(66446008)(2906002)(52536014)(71200400001)(26005)(83380400001)(5660300002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RgJpMy2PPPuA7BCbVB0552FksMhE6OCzYW5h/iz3Dj1A5G6U911YhOjv+Sxm?=
 =?us-ascii?Q?7pm0NNXZDoBCWcuTCqemiuxgN1tkMTRsv6bS7rb+0c1P2epgSQTlrhYI3wrH?=
 =?us-ascii?Q?gTj/CqQrDbNFjQppeKB8g9MeT0C+dbQo9EIFv9Rz1nrGWkHJ9ODEYJLP8mZ3?=
 =?us-ascii?Q?EEn7+mfDJq0U8MgQTxga0avdt82nbe4RS1Vud4sLAhiztD648Zv5tkIc0gJg?=
 =?us-ascii?Q?9b249+RRq3glcyUKDcWbg7sS9wnkDppwpCkp8Ji3VCJkmL4mK8Np0R0OgV01?=
 =?us-ascii?Q?5zA5oTk2o3rwFkRNgogybw0jX910K9MAZCqhz9xCQclmb1QBoHNYHye9PnG2?=
 =?us-ascii?Q?I4O+iwtoaKiQexcCV/dhnpDn5h8CjK2kjgUy2RUVdkdixKwbfExx/UjDPjt6?=
 =?us-ascii?Q?f05Av6sZDV4ZEQSY8ikop6axMhJAn9sb1g9AWme7OQlFtUgAFPDyq74E4w5j?=
 =?us-ascii?Q?ubde6hVpZ1PYXTISNMXz7eBm/52ZWlVDHS8sWzmSVHuf/lvcybu3tKUJKVUM?=
 =?us-ascii?Q?dGLH+M6OY6SmzHxVqnlhuGDWEyAoz/xf7U8Uq5Fk15AneFDTtOW4A+NWQklb?=
 =?us-ascii?Q?PNeKNrEnwdoccMFFsN5Vy++IaNBZQZuXuYtJZda8xocaCW90VxbgFp4cv8Yv?=
 =?us-ascii?Q?v2zMfEaE6orBdcFvoymUVuMuhYg6nc1ZYcD+96tXqNGv9AmQ7legg2PqKq99?=
 =?us-ascii?Q?XYmduLG8Syp7V3vuNbbDpHT3xzsFnmbVCcMB9WTcKw8Voux3MXty/kmsuSYo?=
 =?us-ascii?Q?O6TJkwqXJkff7B+BxAV46L8ihuLMt5e0cfGV3auRmFq4HegNVrvfrtyzgujU?=
 =?us-ascii?Q?uR7QMx0Be0sLmbCfb99cVPtCxe1spFcbSp6AUNVbtu4psv0NPsaRq+kvawuS?=
 =?us-ascii?Q?qlkFpfb82e8uK5uICWHZr6LSVG6XS2qjHtf+34DO86o5HnE04m/Fous6MucK?=
 =?us-ascii?Q?b7oyrsd6ESKVHmFsUFuHpBVk+tn/lNmVIdk8ZPX/KtqExsPO1FmgsBNDyTio?=
 =?us-ascii?Q?kSqE29WDwOrVyZ/Q8wmtpfgVFnGNI8+tMsrXbeikQwHhs2DJ60XzRQ1Fy5+N?=
 =?us-ascii?Q?i2eIhiqjutbLJi+mVAisAlaje5+4aajAD10KZJ+CqE6QoOyoJu/hmjXyb4Zh?=
 =?us-ascii?Q?YU/vw/39sTP61GxZ9YG1fDh5mQUbAu0rxhDYqC5V8AT0mAwBCOszwk13z+2v?=
 =?us-ascii?Q?LM8qe7P/BYJUjLhe7SoTvn34viokFhNXSxPqD3Zo8XaFu1UeYd30WIimNScW?=
 =?us-ascii?Q?HIa4oxY0ZJiiOq78ZBzN4wVzpyXlY+e6le+VEAY8DZLRFD7636vvp23l9AJk?=
 =?us-ascii?Q?MyWTBDN17V9kkdoR6GCuKJfIYKKCmcr1zLsxHn9znlFY0B58E2x1e5kbvoeg?=
 =?us-ascii?Q?Wx+p0AVnzNcCXklzMuwLp0CUX2NeJF6BTFbBl1Eyf9hvyp4vyGg+BgchEMZQ?=
 =?us-ascii?Q?jbB2EAlnr81RBZyVQqe+R58lKSw/yfP/IJNhZzLw/ph9xVSAU2k2ABfyCx6r?=
 =?us-ascii?Q?5nk+7G3/JI6SphfdiqkF1YUW2vv6OwyamG7dBC/yp8HEPsL0fJQDHB8QVhjF?=
 =?us-ascii?Q?rwHAQB0K/CuJNoDWR7PUMXqoIVEcS5h3IJGeBaLqidawd+dfksYUor8h6lKW?=
 =?us-ascii?Q?rc1iWuOwuwAbvMG0kl0RMsQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0b70f2-613e-47a4-37fd-08d9eb660f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 00:49:42.5571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7SAwm1dwUFz4ov/tukGNguTKcoE8Ba2Cn9KarO6hszkvI9Q0ALOmz6ySA4dAyExJUsZSSn7LGWX5eAg1UsRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
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
Cc: "Chen, JingWen" <JingWen.Chen2@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Chen,
 Horace" <Horace.Chen@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

This patch is reviewed by  Shaoyun.liu <Shaoyun.liu@amd.com>

Since  other  patches are suggested by  other engineer and they may already=
 od some review on them , so I will leave  them  to continue review  the re=
st patches. =20

Regards
Shaoyun.liu

-----Original Message-----
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>=20
Sent: Tuesday, February 8, 2022 7:23 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Koenig, Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch; Liu, Mon=
k <Monk.Liu@amd.com>; Chen, Horace <Horace.Chen@amd.com>; Lazar, Lijo <Lijo=
.Lazar@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Grodzovsky, Andrey =
<Andrey.Grodzovsky@amd.com>; Liu, Shaoyun <Shaoyun.Liu@amd.com>
Subject: [RFC v4 04/11] drm/amd/virt: For SRIOV send GPU reset directly to =
TDR queue.

No need to to trigger another work queue inside the work queue.

v3:

Problem:
Extra reset caused by host side FLR notification following guest side trigg=
ered reset.
Fix: Preven qeuing flr_work from mailbox irq if guest already executing a r=
eset.

Suggested-by: Liu Shaoyun <Shaoyun.Liu@amd.com>
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 9 ++++++---  drivers/gpu/drm/amd/a=
mdgpu/mxgpu_nv.c | 9 ++++++---  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 9 +=
+++++---
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/am=
dgpu/mxgpu_ai.c
index 56da5ab82987..5869d51d8bee 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -282,7 +282,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct=
 *work)
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
 		adev->sdma_timeout =3D=3D MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
=20
 static int xgpu_ai_set_mailbox_rcv_irq(struct amdgpu_device *adev, @@ -307=
,8 +307,11 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev=
,
=20
 	switch (event) {
 		case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 		break;
 		case IDH_QUERY_ALIVE:
 			xgpu_ai_mailbox_send_ack(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/am=
dgpu/mxgpu_nv.c
index 477d0dde19c5..5728a6401d73 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -309,7 +309,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct=
 *work)
 		adev->gfx_timeout =3D=3D MAX_SCHEDULE_TIMEOUT ||
 		adev->compute_timeout =3D=3D MAX_SCHEDULE_TIMEOUT ||
 		adev->video_timeout =3D=3D MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
=20
 static int xgpu_nv_set_mailbox_rcv_irq(struct amdgpu_device *adev, @@ -337=
,8 +337,11 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev=
,
=20
 	switch (event) {
 	case IDH_FLR_NOTIFICATION:
-		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 		break;
 		/* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ can ignore
 		 * it byfar since that polling thread will handle it, diff --git a/drive=
rs/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index aef9d059ae52..02290febfcf4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -521,7 +521,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct=
 *work)
=20
 	/* Trigger recovery due to world switch failure */
 	if (amdgpu_device_should_recover_gpu(adev))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
=20
 static int xgpu_vi_set_mailbox_rcv_irq(struct amdgpu_device *adev, @@ -550=
,8 +550,11 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev=
,
 		r =3D xgpu_vi_mailbox_rcv_msg(adev, IDH_FLR_NOTIFICATION);
=20
 		/* only handle FLR_NOTIFY now */
-		if (!r)
-			schedule_work(&adev->virt.flr_work);
+		if (!r && !amdgpu_in_reset(adev))
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __func__);
 	}
=20
 	return 0;
--
2.25.1
