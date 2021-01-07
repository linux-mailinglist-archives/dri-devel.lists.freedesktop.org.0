Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE42EE73C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 21:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D046E529;
	Thu,  7 Jan 2021 20:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7566E529;
 Thu,  7 Jan 2021 20:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMXJUHxamb2PWEI0hjvRxSwpIQijrOZ0o7/qKuK/hokmHKBydELIClVVVpFTHQQf7o3vOy4gC7GvU1dxK5X6J0gEO1k53TdGGNjrjRHiklNxT2zoldvIt0bfjBL4TNlEFLr5jSEvqdRl+A7uIf5egZAsevoJvA4/NuHJoCZpXxyHk+/qmPD5Q7+h4XMaFvT5qFXLnQH+OCndz1GiNd4NurNUJVauZTUR+L4KQboZrzVXf0rdlWCAU/JjFTdFycnGZV1h906NmD7OILDFO9LuBPYxEX6J+z2tFv5/cVvzMstwRCBIgZ1JrcKgqfBKDOKdc2SDBpthjD4web+/6vYkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EucwKT9gyEaB0xeAE02TNpSnrMWUqQd/tVquW8VUE5Y=;
 b=HvCRkT0s9+gq8IeSY94atb6wcCrgzmNH0gLji/kFay7YbWabx3nblcDLpvh8BFzaXje7gaTG7wrd+SW43WO5wTFnQchbtgwQKcLr4SEf6Nu9P3HQemOrvsJC6aSKBoMPb2hJ8NgUSEmnxZZHIWvkvs5FvfYHvqNte6tY07Au4jc+VoTwR68eVDc12Qi6AvdKKooAyyi/qblMaPtC++2ggzx7VV4uGqs9FXmG60GRfo0waQQtglhPahw109NOM6REG5U9ZK/Fr1yzraRLxr7PRyGD7RRZzNOnfDytQ5LitU1iM9i55PerURJ6WNJJp1Vow0ccBxVx7lSr90Qhx5oBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EucwKT9gyEaB0xeAE02TNpSnrMWUqQd/tVquW8VUE5Y=;
 b=AAoBHjoJ7+8xlGwtYbIoYUvHX8PyKvTamrwzP6ueA0AkKW4Qz6okqOgLvwwXVCDr/54OXB01NU/FtgnP/IMFjcKJcSqYXRGxUfwsSckYjTULzOj5eLgZWk8quuRpNNvQrSI1ClsZARxLBtKOE3PCZK+V+x/LnrCeOGhEhzBXCEs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM6PR12MB3210.namprd12.prod.outlook.com (2603:10b6:5:185::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 20:53:42 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 20:53:42 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] Revert "drm/amd/display: Expose new CRC window property"
Date: Thu,  7 Jan 2021 15:53:21 -0500
Message-Id: <20210107205321.166698-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
References: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3]
X-ClientProxiedBy: BN9PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:408:fc::9) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3)
 by BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 20:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79c3ebd0-6165-41fa-6150-08d8b34e5144
X-MS-TrafficTypeDiagnostic: DM6PR12MB3210:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3210DC7E1FF97E1E22F259BC98AF0@DM6PR12MB3210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKKBWt2pBIeFng7PmVlGI2BrVKkSetrxiGMQVGO+w+gZoYXTR9F6AohCcwUWbPw41JnYHTk+TofedoL1CsFO8JaoVM4aUBqHZ4PiGhT40gKbP8NH8+jwbuMUEbHmv+11WU8la9Qeod/KEFIHuJO3SA3U/JbotPZ9d9WAi+M0sC7Rz6ZrmethfShY88mvUk2WKTyVL11WMQHS6Hwjkwa2LYjvaEhOhVCBFXzKMfD8Xhr85DZKRKSyTnXJeXWBo6Ffj5v++NjZcLUUxMVs2uBc8kN+ucZh3CxhPizAwU6uTXgSV8ur0imTgN8Nx/4q2H34cgmeANbC7qPwf97mfdk9/BA6NwoLedoDDJf5lupY6ttgMbDLFPuLbKpxZbwhit3ByHxucmor2igpFmoP16lSMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(54906003)(316002)(30864003)(36756003)(8936002)(2906002)(8676002)(83380400001)(6512007)(6506007)(66556008)(16526019)(66946007)(5660300002)(478600001)(6666004)(66476007)(2616005)(52116002)(6486002)(86362001)(1076003)(186003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Uu7wdO0Ibcf/wCn0QJINYhjebxtIIbuFgTg4X1F2r+5sdzD7LDe7mK5kgIXK?=
 =?us-ascii?Q?SNhbabmHP5pB/V/ArwIr9/wTOlWCRyNczTQFBWFIq4VTnkLnCMwBDLlc7SrO?=
 =?us-ascii?Q?0bLnb6tQF7lKhMqnZQs+8RYv6C9nvm83mbs5xnYWw18rXJ+FxSybft+X2KjS?=
 =?us-ascii?Q?bq7GzcF2Azp162PdW7hYUrw0SxA5D3HoTFNAIQQErW0QYYitHwc08kt03jSD?=
 =?us-ascii?Q?tGjahMYmUkXmikn72XHSkGEBKcny0HHrCqXaSjU0X8MUNjsnvsQZ3wdxEjUn?=
 =?us-ascii?Q?6UGuOGFHeRRGipEgXcXjB/QZk+RuHwkfhlI8U8+FHjeato7mMSnoqTmPQyHU?=
 =?us-ascii?Q?bh81pc5jjtKfStPdLnU875W52HU9NPUBjlhEC6zwsyKu18BjrMCGnoEL0mus?=
 =?us-ascii?Q?oCYa1T4N5i/16k8ABoszbUvc7ZzhsSbyuBllvEoYeF/nfG8QIIHm0rhC51uN?=
 =?us-ascii?Q?/4BMR5BPwFK2bSux3g1QrxQwnCpE/5+Vgczanc51pvMrX9QQiCpSJeMcu+1q?=
 =?us-ascii?Q?L/3XQr/p1VXWvDQ/NN/Ho2UP2s2ug8qXvU3ev+p+g7YgYXNrfIeREKV8LQMK?=
 =?us-ascii?Q?vgPmx6FRAMx4YgFpkGzcU9qJXpy//sTc6klIct1ZwTFAS2hDbdFgcKRTCrPh?=
 =?us-ascii?Q?ldDQVIM+8CO6cGJRkHRATClBak5Xh/hDdn1NIse3eam5/MKP6DmNR1RNdsxj?=
 =?us-ascii?Q?C7LXkeBKT5+OQz68jZ6LtRsHPpQ2L+aHcfZgkuyqyQo1OesFGHlStCiuffS2?=
 =?us-ascii?Q?PeDHJDGKPR90BeHObiy16b1d4EJ+RMQGpfS/QkAd9EqXpvoRiWt6z5i7K2fv?=
 =?us-ascii?Q?l2gwqkGpQx4srUK/6BHWhU3oz5CLcpTqOi7nujYGp1DysZWmu6vR6rbQHgxs?=
 =?us-ascii?Q?u0OR4xUDJ0jGRZzFo7K24G983bDqFusO/ibkEniZxGmS/61lSau7ZXK+tIL0?=
 =?us-ascii?Q?X2B/L8bPHhGoA7lfvQAdieIK9oSF/uRyVWfI8Z6MYSahfRLauyCfJ+wXmQ7l?=
 =?us-ascii?Q?rw5B4ZltPmMO+55dtwVvULRLfRF1TA8G5TDWlsiEiR/ZFLYKeJLMSF9W2IUF?=
 =?us-ascii?Q?w9B0MdFs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 20:53:42.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c3ebd0-6165-41fa-6150-08d8b34e5144
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88q1+d3XuWmBFeDrdivn4X6GYb7DCPB3KUIAERo88sI37yyEs2GyTONYaB07FH5LQxraHdNMFxj2jGw3FaZ7Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3210
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 110d586ba77ed573eb7464ca69b6490ec0b70c5f.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Bindu R <Bindu.R@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 +-----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  19 ---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  56 +------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   3 -
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |   2 +
 5 files changed, 12 insertions(+), 210 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a06554745238..0515ed0d125c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -938,41 +938,6 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
 }
 #endif
 
-#ifdef CONFIG_DEBUG_FS
-static int create_crtc_crc_properties(struct amdgpu_display_manager *dm)
-{
-	dm->crc_win_x_start_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_X_START", 0, U16_MAX);
-	if (!dm->crc_win_x_start_property)
-		return -ENOMEM;
-
-	dm->crc_win_y_start_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_Y_START", 0, U16_MAX);
-	if (!dm->crc_win_y_start_property)
-		return -ENOMEM;
-
-	dm->crc_win_x_end_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_X_END", 0, U16_MAX);
-	if (!dm->crc_win_x_end_property)
-		return -ENOMEM;
-
-	dm->crc_win_y_end_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_Y_END", 0, U16_MAX);
-	if (!dm->crc_win_y_end_property)
-		return -ENOMEM;
-
-	return 0;
-}
-#endif
-
 static int amdgpu_dm_init(struct amdgpu_device *adev)
 {
 	struct dc_init_data init_data;
@@ -1119,10 +1084,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 		dc_init_callbacks(adev->dm.dc, &init_params);
 	}
-#endif
-#ifdef CONFIG_DEBUG_FS
-	if (create_crtc_crc_properties(&adev->dm))
-		DRM_ERROR("amdgpu: failed to create crc property.\n");
 #endif
 	if (amdgpu_dm_initialize_drm_device(adev)) {
 		DRM_ERROR(
@@ -5456,64 +5417,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->crc_src = cur->crc_src;
 	state->cm_has_degamma = cur->cm_has_degamma;
 	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
-#ifdef CONFIG_DEBUG_FS
-	state->crc_window = cur->crc_window;
-#endif
+
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
 
 	return &state->base;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
-					    struct drm_crtc_state *crtc_state,
-					    struct drm_property *property,
-					    uint64_t val)
-{
-	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct dm_crtc_state *dm_new_state =
-		to_dm_crtc_state(crtc_state);
-
-	if (property == adev->dm.crc_win_x_start_property)
-		dm_new_state->crc_window.x_start = val;
-	else if (property == adev->dm.crc_win_y_start_property)
-		dm_new_state->crc_window.y_start = val;
-	else if (property == adev->dm.crc_win_x_end_property)
-		dm_new_state->crc_window.x_end = val;
-	else if (property == adev->dm.crc_win_y_end_property)
-		dm_new_state->crc_window.y_end = val;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-
-static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
-					    const struct drm_crtc_state *state,
-					    struct drm_property *property,
-					    uint64_t *val)
-{
-	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct dm_crtc_state *dm_state =
-		to_dm_crtc_state(state);
-
-	if (property == adev->dm.crc_win_x_start_property)
-		*val = dm_state->crc_window.x_start;
-	else if (property == adev->dm.crc_win_y_start_property)
-		*val = dm_state->crc_window.y_start;
-	else if (property == adev->dm.crc_win_x_end_property)
-		*val = dm_state->crc_window.x_end;
-	else if (property == adev->dm.crc_win_y_end_property)
-		*val = dm_state->crc_window.y_end;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-#endif
-
 static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
 	enum dc_irq_source irq_source;
@@ -5599,10 +5508,6 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.enable_vblank = dm_enable_vblank,
 	.disable_vblank = dm_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
-#ifdef CONFIG_DEBUG_FS
-	.atomic_set_property = amdgpu_dm_crtc_atomic_set_property,
-	.atomic_get_property = amdgpu_dm_crtc_atomic_get_property,
-#endif
 };
 
 static enum drm_connector_status
@@ -6829,25 +6734,6 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	return 0;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static void attach_crtc_crc_properties(struct amdgpu_display_manager *dm,
-				struct amdgpu_crtc *acrtc)
-{
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_x_start_property,
-				   0);
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_y_start_property,
-				   0);
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_x_end_property,
-				   0);
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_y_end_property,
-				   0);
-}
-#endif
-
 static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 			       struct drm_plane *plane,
 			       uint32_t crtc_index)
@@ -6895,9 +6781,7 @@ static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
 				   true, MAX_COLOR_LUT_ENTRIES);
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
-#ifdef CONFIG_DEBUG_FS
-	attach_crtc_crc_properties(dm, acrtc);
-#endif
+
 	return 0;
 
 fail:
@@ -8538,7 +8422,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-		bool configure_crc = false;
 
 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 
@@ -8548,30 +8431,21 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			dc_stream_retain(dm_new_crtc_state->stream);
 			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
 			manage_dm_interrupts(adev, acrtc, true);
-		}
+
 #ifdef CONFIG_DEBUG_FS
-		if (new_crtc_state->active &&
-			amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 			/**
 			 * Frontend may have changed so reapply the CRC capture
 			 * settings for the stream.
 			 */
 			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
-			dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
-
-			if (amdgpu_dm_crc_window_is_default(dm_new_crtc_state)) {
-				if (!old_crtc_state->active || drm_atomic_crtc_needs_modeset(new_crtc_state))
-					configure_crc = true;
-			} else {
-				if (amdgpu_dm_crc_window_changed(dm_new_crtc_state, dm_old_crtc_state))
-					configure_crc = true;
-			}
 
-			if (configure_crc)
+			if (amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 				amdgpu_dm_crtc_configure_crc_source(
-					crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
-		}
+					crtc, dm_new_crtc_state,
+					dm_new_crtc_state->crc_src);
+			}
 #endif
+		}
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ef394e941d9d..9d22d62ac2d1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -343,13 +343,6 @@ struct amdgpu_display_manager {
 	 */
 	uint32_t active_vblank_irq_count;
 
-#ifdef CONFIG_DEBUG_FS
-	/* set the crc calculation window*/
-	struct drm_property *crc_win_x_start_property;
-	struct drm_property *crc_win_y_start_property;
-	struct drm_property *crc_win_x_end_property;
-	struct drm_property *crc_win_y_end_property;
-#endif
 	/**
 	 * @mst_encoders:
 	 *
@@ -436,15 +429,6 @@ struct dm_plane_state {
 	struct dc_plane_state *dc_state;
 };
 
-#ifdef CONFIG_DEBUG_FS
-struct crc_rec {
-	uint16_t x_start;
-	uint16_t y_start;
-	uint16_t x_end;
-	uint16_t y_end;
-	};
-#endif
-
 struct dm_crtc_state {
 	struct drm_crtc_state base;
 	struct dc_stream_state *stream;
@@ -467,9 +451,6 @@ struct dm_crtc_state {
 	struct dc_info_packet vrr_infopacket;
 
 	int abm_level;
-#ifdef CONFIG_DEBUG_FS
-	struct crc_rec crc_window;
-#endif
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 7b886a779a8c..c29dc11619f7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -81,41 +81,6 @@ const char *const *amdgpu_dm_crtc_get_crc_sources(struct drm_crtc *crtc,
 	return pipe_crc_sources;
 }
 
-static void amdgpu_dm_set_crc_window_default(struct dm_crtc_state *dm_crtc_state)
-{
-	dm_crtc_state->crc_window.x_start = 0;
-	dm_crtc_state->crc_window.y_start = 0;
-	dm_crtc_state->crc_window.x_end = 0;
-	dm_crtc_state->crc_window.y_end = 0;
-}
-
-bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state)
-{
-	bool ret = true;
-
-	if ((dm_crtc_state->crc_window.x_start != 0) ||
-		(dm_crtc_state->crc_window.y_start != 0) ||
-		(dm_crtc_state->crc_window.x_end != 0) ||
-		(dm_crtc_state->crc_window.y_end != 0))
-		ret = false;
-
-	return ret;
-}
-
-bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
-					struct dm_crtc_state *dm_old_crtc_state)
-{
-	bool ret = false;
-
-	if ((dm_new_crtc_state->crc_window.x_start != dm_old_crtc_state->crc_window.x_start) ||
-		(dm_new_crtc_state->crc_window.y_start != dm_old_crtc_state->crc_window.y_start) ||
-		(dm_new_crtc_state->crc_window.x_end != dm_old_crtc_state->crc_window.x_end) ||
-		(dm_new_crtc_state->crc_window.y_end != dm_old_crtc_state->crc_window.y_end))
-		ret = true;
-
-	return ret;
-}
-
 int
 amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 				 size_t *values_cnt)
@@ -140,7 +105,6 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 	struct dc_stream_state *stream_state = dm_crtc_state->stream;
 	bool enable = amdgpu_dm_is_valid_crc_source(source);
 	int ret = 0;
-	struct crc_params *crc_window = NULL, tmp_window;
 
 	/* Configuration will be deferred to stream enable. */
 	if (!stream_state)
@@ -149,25 +113,9 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 	mutex_lock(&adev->dm.dc_lock);
 
 	/* Enable CRTC CRC generation if necessary. */
-	if (dm_is_crc_source_crtc(source) || source == AMDGPU_DM_PIPE_CRC_SOURCE_NONE) {
-		if (!enable)
-			amdgpu_dm_set_crc_window_default(dm_crtc_state);
-
-		if (!amdgpu_dm_crc_window_is_default(dm_crtc_state)) {
-			crc_window = &tmp_window;
-
-			tmp_window.windowa_x_start = dm_crtc_state->crc_window.x_start;
-			tmp_window.windowa_y_start = dm_crtc_state->crc_window.y_start;
-			tmp_window.windowa_x_end = dm_crtc_state->crc_window.x_end;
-			tmp_window.windowa_y_end = dm_crtc_state->crc_window.y_end;
-			tmp_window.windowb_x_start = dm_crtc_state->crc_window.x_start;
-			tmp_window.windowb_y_start = dm_crtc_state->crc_window.y_start;
-			tmp_window.windowb_x_end = dm_crtc_state->crc_window.x_end;
-			tmp_window.windowb_y_end = dm_crtc_state->crc_window.y_end;
-		}
-
+	if (dm_is_crc_source_crtc(source)) {
 		if (!dc_stream_configure_crc(stream_state->ctx->dc,
-					     stream_state, crc_window, enable, enable)) {
+					     stream_state, NULL, enable, enable)) {
 			ret = -EINVAL;
 			goto unlock;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 0235bfb246e5..f7d731797d3f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -47,9 +47,6 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source
 
 /* amdgpu_dm_crc.c */
 #ifdef CONFIG_DEBUG_FS
-bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state);
-bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
-					struct dm_crtc_state *dm_old_crtc_state);
 int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index f4a2088ab179..da292cea0f56 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3272,6 +3272,8 @@ void core_link_enable_stream(
 			}
 		}
 
+		dc->hwss.enable_audio_stream(pipe_ctx);
+
 		/* turn off otg test pattern if enable */
 		if (pipe_ctx->stream_res.tg->funcs->set_test_pattern)
 			pipe_ctx->stream_res.tg->funcs->set_test_pattern(pipe_ctx->stream_res.tg,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
