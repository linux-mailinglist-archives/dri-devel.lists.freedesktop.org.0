Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C562F334A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF2E6E284;
	Tue, 12 Jan 2021 14:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EF26E25B;
 Tue, 12 Jan 2021 14:55:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOeRHcWS8t1Coffojb76mNLIFyHa7KzfI3XmNgQGt4+AXOGUaKeUx2RJP10KaoUlRNLVcebTFlnQAtWrKcT7mWP2aW/ocM6/dQWTupL9XI7ovaMj29IdBBNb36ik8Jkx3XOjRVQeqwHZLrrdTef26MoBspd97UQ9JInJKYn9VH/jqa7AFLkh+R0ZgXIixPmlyH1Oztfe9v4hw3mv6o/A5gAE2sDxSWvX+8u7VR3zOLB1WAqp3Q3u6HBwg9t8W+8Sw3hPSvQ4SnO5Df1OVb/xBqdh+IIj8Vw5FpGpzrNfegRK3EMZ0fa4oOgfou5/hx2WsFHWWq/0vtHskJPUA/hJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPShVxRQDUpZAPhPFTaRQ/idyIedPXI+iSyt3sDWyfg=;
 b=BgXZ8Mrrz29VYyGKttJ3YnIM6xEFzWOA0z6zovSK0brtE57u0HNRUCmuhpl6ZKyZKVB+82N6Cm3yQfukBJNiQ+fAcJJwYvp4RKutvTyOIA4VtH9Ut/mvNDu3P6pRGFaZ4tKo5a7iMCUg1mzIX24siCuDRQ1j6PMN4hoEKxOc6OK1IM4oUCUeUFQvPCVEQCSXmiz25RVpo+rP+1Ajfxl+/NoqSzEfLeFcg1TMutipz/fCy7JK1i/2UejUb8i/gPH0MEIiJpesNbKWF4xBIEWjwHbPotqHTvB9s5YrONJKJ5aoyTm7SvL+mK0ekpeFm9a/GaGVrwkASirHqYrFT1ZUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPShVxRQDUpZAPhPFTaRQ/idyIedPXI+iSyt3sDWyfg=;
 b=dtj2496OspGMz4ycnXIVoooA6ElHN5Sa1eiNiKQnwSuu4IFp+orihkooaD2mXfZAuQv3aWy1YXuN3dG6yubRHnOQkgDJLEpFDIsjTb7t81PV0taK1Ziogs8WQf5KuLbU1BImVjYw2ze2r/w7tyBwz0XikIdXqUET69BspTEhkJw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:55:52 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.012; Tue, 12 Jan
 2021 14:55:52 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] Revert "drm/amd/display: Fix unused variable warning"
Date: Tue, 12 Jan 2021 09:55:05 -0500
Message-Id: <20210112145508.1564863-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
References: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:24ef:ec9:b88:9a22]
X-ClientProxiedBy: BN8PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:408:4c::24) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:24ef:ec9:b88:9a22) by
 BN8PR16CA0011.namprd16.prod.outlook.com (2603:10b6:408:4c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 14:55:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f36b4307-7954-469c-59e7-08d8b70a2829
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB249077DD317B220A01C7146D98AA0@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbs2kJmXKgAEOaR18eDYuFY+BxqrHAgG2h0WSgezvo7A4P8R4otcA9KujtAO/0W5yF7hH8wqyLs4gT377dLXBufxRAOwauBqmu7jnPnciTnIddhasISijgZ1fiwbDXgLe2BBJGOhykYStGeiMS+MoiONE80Zz+wmbT1+Yt42ZdqD0oZJNjICFfLsbGZBoGYZtgrOEogpvlmos7y74iIWP0BLNACJ/+ekxIbsV6qOvVqQ/+zUXAhChTroTKg0Aomgg2S2uG72wA8/yK+BBDCLQeqgs1DavKjO0G40ZuxfdPeLG7EO/2SwbDR/+6h1Cr1AhjDTY3DF6YWMNtbB3T+ouXE5jfvdw7VwAR6jMa2hsbkQBTywS1XvJ2j1iq1RWF2ESNPJeH9i9RcnNU21fXETVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(54906003)(186003)(6666004)(6506007)(6512007)(8936002)(86362001)(52116002)(66946007)(83380400001)(16526019)(8676002)(5660300002)(6486002)(2906002)(316002)(4326008)(1076003)(478600001)(66476007)(66556008)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GQoAzajVTg+6MaQAuEMr4M45TYzo5veS6QPb9U2bGI1lFuLBOfLtdACkXy5T?=
 =?us-ascii?Q?8gJhyjz1DlkX6Ist9bqfA5G+lW2XkA06UMJBuXdWU9DQfuxBa4uk0JnRIs0K?=
 =?us-ascii?Q?FWAo+b3jTkqVzPgaNu0DBO0AGe92vGB8rX6YROZDxaMgmzC567d0GvrRFG0q?=
 =?us-ascii?Q?ARGE0B3kKKm5ql9ZJlpBWc/tl2vMBcfHy0UKG28daPsM9JXDWLSAxoQACNmG?=
 =?us-ascii?Q?z6Zq6Ry4HK0jieoqX6yqqySb9rr6+w090v7d4ktLWNur2cXYx4ZlyMUkXZF6?=
 =?us-ascii?Q?I6esliPAHMwQhB4RRDWIFfrNzuuxGhnU2UEitddHx6gHReBo+rKGOwrhiiX/?=
 =?us-ascii?Q?yi9RIAE73bpPn4Zwn2iaawOcN7ODTqdsOF2kzKPqIk9YC+Th/PLP6Vrmyql2?=
 =?us-ascii?Q?ixckEb6X+D12XhVJ6qQXe9a35h+XD60oG74d0AsS+XYoK8xnWadjJrasvrq/?=
 =?us-ascii?Q?/qxySu13BdIpzxm+jN2VDsM+e3zh116sQ6N/tcjDPODcSxVBIi8oGWbbJl2s?=
 =?us-ascii?Q?A96g4AgsBHYxLV1fNL9fFQglpL3PWq6hUaUqDYwKng7sE4OkLRqjAEgQMl/f?=
 =?us-ascii?Q?cjRGT6Ep3xavq9dUuIyNA2vnoa9lndF6ftwhfnF88Zo+bFnZ1Pusf6anJAyJ?=
 =?us-ascii?Q?yRo4vd4VjkMxa+keUFh5iKO8WbWWA5lb9O7r0f2YpYY4Wlkflndgt8BoP9u9?=
 =?us-ascii?Q?KF2B9Ue8M6L2pK4VrPmGRqI/zSkw5i88+U1iE6UpkosccaJzo+AebgRIa3Mg?=
 =?us-ascii?Q?AaHrDz5EFV3XXwpIxkHQorP2xfx6cfdHCFw9z8yODaWld04p64zm2gM0FcM8?=
 =?us-ascii?Q?RWXuLLTIt2S65Z/UTT2dRmRppgjoTFEPHVy5AQ+7BwCM7NN2Mj13AU3z+Gvz?=
 =?us-ascii?Q?kuYGNv6YptYwbApPtSi6soJEtQES5Aj8t4PMheIjCuC8+F9ypo0Q1sjrIb+c?=
 =?us-ascii?Q?TpoBbCoV+PbSYleW0NiA+V9nVzCU+j9BmyrPOSSp5vBPsd0Sibl7S+eZZ5zw?=
 =?us-ascii?Q?8jOAa92eLG1htnB6M7whXD4FrTSvvW6Rb2GnjTO+61UzyWW22aUABy4fL+HU?=
 =?us-ascii?Q?d9ok8t16?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:55:52.2810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f36b4307-7954-469c-59e7-08d8b70a2829
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SvAP/fCu4uzI6i1bP6WQjFiWWnawiuBn0y5VCbKi+i1OtlG+X+aTejbVj6wWUkM/dCz7wpyEi/0Lakh516LrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
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

This reverts commit b5d8f1d02ba7021cad1bd5ad8460ce5611c479d8.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Bindu R <Bindu.R@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 4 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index de71b6c21590..1ebd83337e29 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8551,7 +8551,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
 			manage_dm_interrupts(adev, acrtc, true);
 		}
-		if (IS_ENABLED(CONFIG_DEBUG_FS) && new_crtc_state->active &&
+#ifdef CONFIG_DEBUG_FS
+		if (new_crtc_state->active &&
 			amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 			/**
 			 * Frontend may have changed so reapply the CRC capture
@@ -8572,6 +8573,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 				amdgpu_dm_crtc_configure_crc_source(
 					crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
 		}
+#endif
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index eba2f1d35d07..0235bfb246e5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -46,13 +46,13 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source
 }
 
 /* amdgpu_dm_crc.c */
+#ifdef CONFIG_DEBUG_FS
 bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state);
 bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
 					struct dm_crtc_state *dm_old_crtc_state);
 int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source);
-#ifdef CONFIG_DEBUG_FS
 int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name);
 int amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc,
 				     const char *src_name,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
