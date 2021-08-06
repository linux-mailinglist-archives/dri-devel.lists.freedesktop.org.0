Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2DB3E3095
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 22:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA6B6E0C2;
	Fri,  6 Aug 2021 20:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4176E0C2;
 Fri,  6 Aug 2021 20:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibAA238VbvOhFgT6HWp+RbdqwcXjxfkxdxHvxeJkGa/AlvDQtPFkB6BLNE5pwoCnfu01RlKrp5mn/VsJrFuS0Sc04+geF45D7EHxsMSydoQzDMGAD8z5CKzPy5bTSG0auaCLlrK7wmwCicod2Hymnz+3izS7lMDx/nf4PYErI5ROIF8LtS+fzTvzExguyPpUegbRQwXuoIpq+HPLe3c3tINu7V/jLf6zv++nYfwxWzsQwj2VkB/JlA4HPIGnQBGSlK6lWNX2ZOOIUbpsA3JVuO4uNfJy1LeZy323PXF5I+7RS7pUs+KRyYq15g7A+OS8eceVTH3y2bDJ/LddfXVj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaSNn1fJAq2mlkMRqUSCze+XMOIAAYNH0WDHXlpOnvI=;
 b=OC+i4pKuB32Cb+LHkGEBur8fWNw7bqMwLmAK2qbRROmMUezmVosnHdg20AeRGjGI4InPQTgpH450DNYtxNmFZcuLVQYMxssDuFnEGQA44bCLtuTcVjgmJq4C8thKBPiRk77lAvZSnPjg5lSQ2upN3KsQlodOq3o3KVroVNkEf2ZDJqmxaHKaF26k+EgWmy4HzMyZYEr7kP0UKc+BDMamVzfHTCT6NW4UBSWKmiXl4PFeX8Gc72//Mnzip4W7QpxHI7otjuwW2/MjqXRtbEvA/tI1ydLa9fc/A54oyB8q2RoM1Y3NwdZT6M2VAKspvjdA6X2pNtIg+CX0WUDk45J5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaSNn1fJAq2mlkMRqUSCze+XMOIAAYNH0WDHXlpOnvI=;
 b=ylFL9zYB7VoUYvCo9zKYlvF98G038+5lUzqb0Vz2yZPxywSreg8Tw+R2iWSzR4DOu6FzhRb7K8rtm56Vp1NQta2yiGo3AnDV1lKBwAW0S0muWwgonD/uHWoUfZiPjYSSlI20rJxORAt+JwKXziBQdW+H5tevRbKseOTIgd5aybQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5237.namprd12.prod.outlook.com (2603:10b6:208:30b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 20:53:04 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%4]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 20:53:03 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.15
Date: Fri,  6 Aug 2021 16:52:48 -0400
Message-Id: <20210806205248.3864-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35)
 To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 20:53:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5c193dd-c802-4b62-53bf-08d9591c2f02
X-MS-TrafficTypeDiagnostic: BL1PR12MB5237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB523799771741DF8FFF49088FF7F39@BL1PR12MB5237.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vzYikwc01ZenziV3RpJfDpKaTxL3d+Z5XuDKTbULHHggKUROrU/qLZ/2Ue84V64Ei6f3iOJMDQ0BkkArOCtcMel4B10hOb4ftPpfOzeObPx/6l22Z12Gr/VRaFmsZxiRXKXPLjq5K6/Pg9V97mBffvYUy40K511LQUKek12US5/jbYXQZ9QP7KMf23g2aIQor94oZ9JM2ktKtzVD1bRe3dwTYMhFV54roTO3U6xKY5r5IyiASxTy/MaMx9TBnEOFmxgGEf+oFvNILJOx2Voerzgla9TWURNdj3AnEFwD1zUJRyiX+emAfYVPvFW/Nhzx4oGLzVP01dR+3TdyyZHE6VRBGMPmkEj3znt0ffxL2eLAki1p0LaW3c/PtqUiXBF/i31WxQgxq0xBXMc0uQHfRa0ERUp7khxmKFKO1TXX5zA8RM+O1pmnM7eXRJfdmiDGRfS0C9ovmzCSsAz0jrTgDATa30J3du0s0ebPSAxrxGB0EBsnTW13KMaug5nwNRl0Yz1aWuoP+Y4Psc+HlI20ONvLY9V6ZG5lXV7LhCbH8BpMLupsP1l1XA7tzpt52aleib2az4bjAswU9rebCYR9LEPKNxoXXzTOI4RXXtC0x2xi522pgUG4it/mSlYZpfn9x9h0cLOp2fs9yx10dnGudnEi91XH5Y3RePI89CA2zBZvAxzQ4EtIiaiSS5xexRFFW5oMwLDf49p2c4HkxKbj4PIN+SPRxwbF2A7K3NYWJs8madCpXyBz49Cql6oaOYTZHqXa7/Woe6GPmmHzgZY8R17Y+JZVbe2OlYBtgUkQQmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(956004)(2616005)(26005)(316002)(478600001)(966005)(1076003)(30864003)(186003)(6486002)(86362001)(6666004)(6506007)(6512007)(66574015)(66946007)(38100700002)(66556008)(2906002)(8676002)(38350700002)(52116002)(4326008)(36756003)(66476007)(8936002)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhKZWJxWWRzbmFmVTcrLys3RURveVoxWXN5U1c2SjlUOUsyU2V2aWdjWTVO?=
 =?utf-8?B?dkRsWVh6UE5IUWFyQVFZNjltL2VOY1pRclRxUEw2NitqZnd0RG1sc1FJaVNJ?=
 =?utf-8?B?SkZWNG42cEkwa3cxTGcwb2gvQ2xaMTlWalBjdVV6NWdwczV3TEJZcFFSYU9Y?=
 =?utf-8?B?YXFEZTVJY0FNUWZDUW5XczZDSjlIbGk3OTZBK2tMMDQyNHYwdDFqRnVDMjdn?=
 =?utf-8?B?clpCVEhoUW5oZDZoTU9QZlVwVDlPT2lyV0c3dUdFMnVQaEdYT01Xcjdub3NV?=
 =?utf-8?B?M0dFL205d0FnN2YydkI2NWxYWlFtSWJhNTJlbmp0cTdiS2dZcE56NG5scVho?=
 =?utf-8?B?NGRTenVZZkIxRnNKaHJRYTJNSCsvN2lyOVByS3RYS3dwTkU5OWpnQWZQK28z?=
 =?utf-8?B?UVFrNC8wR3Z1bHphU1YvQ0YxNC9tamxCNWRvRzU1K1JBdERjcW5oKy9vMS9S?=
 =?utf-8?B?WXhKaXJ0QXdqMXBBUUFYZGlYRkdUeEVGdEhDNTA4QjN0VzFIUFdVcmtzOUo4?=
 =?utf-8?B?ay9zd3E0bkQ4eHlTSi8rd2p4cGR5aVh3a3NmMERPcDRSRG0wZzNPNlcxOVd5?=
 =?utf-8?B?U1JWaXcxT1kyRkVxeHFLSkh0R0crM3RpRTJuNU9nQWsxN0lLS2lja1FqRm1v?=
 =?utf-8?B?UVZUYTQ0elNPb1M0bkdnQUZ2WlNlcCtaSitERkFyL2ZjNG5PNHRBZmd5RzBt?=
 =?utf-8?B?cUYyR01BemN0aG5ZRCtoOFZLTjMwRjVHeGJZb0w1SkJlQXJIa1k2TEw2TmhQ?=
 =?utf-8?B?a1VML09QRlFiV0ZQZUtqRVVneGs5QmF6L3lCekloNm9qUVdKRTJkcDVQMWxr?=
 =?utf-8?B?UlJGclhGVWFjenFNWGRldy8yb28wd2JGL0JqS21CcVllckd6Q25vUHlLTW5P?=
 =?utf-8?B?YWxESmdoVXdmdlNtTi83R1BPOUcvN3RMOUFlWkk1UDJDaFBralVxKzM0UHhB?=
 =?utf-8?B?VXgzaWsxeW1MMVZXMGJWaUFVUW1SS2p3VEdSMjdFWU1NeVNjTENSeTZiQ2NH?=
 =?utf-8?B?dW5xMWpjN3M5NUp1c0xFd1h6Q2dFSFV5NHJWSHVNSGRHdTdwVktLOVdOM2Zj?=
 =?utf-8?B?TTIyN0Z5U1hFSkJWOGh4MUY1NStMMXlQck1KL09tc1NraVpUeHlsMmpVRHhn?=
 =?utf-8?B?OFhYQnNwUWxKUTIzTm5oclZ3ZHB1OUswWnpmQkN1SjF2WXhtTk9JV2QwNFhC?=
 =?utf-8?B?UU0yY2E3cDFWVk5BRnNMU0xlME1nVHNVUHl6TGpGOVlvd1g2bTBVMU5kUzdU?=
 =?utf-8?B?andqSVBjN3BUK2ZsSkcwWlBGQVl0WTAvM2hmRXFTMmZNd0pRUSt5cndLZGtT?=
 =?utf-8?B?MjdrQ2toZGRZS0tvMmpiUlBXbWJBQTB4ZDZmSmhxUWZScHRoeStCYmVlU2tr?=
 =?utf-8?B?T3ZPeXhDV1RnN2ZJZFhGYVlIemxIR1ZhL0JhWXdhUi9UQVBvbkFuTktUMVJI?=
 =?utf-8?B?SEJDMzZqclNEMSswU0QrVWZtRzRMSG5XYjhlK2d1QW5adVhlWjlTUXpMTHlu?=
 =?utf-8?B?NUIxd2pPYmNwQkxOb29VczduZ1pkUmFOT3pLb2ZyS1E3WDJncVB6ajF2SVZv?=
 =?utf-8?B?a2NKTTFiK1hQZTJ5WE12elcvQW1EVUlnZzBjMlBvRVFWU3RKclRCbHVMSGoz?=
 =?utf-8?B?Rnd2bVdxcTkxMVdTS2FiMXF0MXFnQWM0ZkE0R0NZbTFMdExBdldHNGNHNHE2?=
 =?utf-8?B?RGpsNUJLdjY3OC9mZ1VmZDhVNmVLbjFZMDEvWjJ4MllYSnE2T3NaUDluM1M0?=
 =?utf-8?Q?OGg190JHfWGZlYhzFK58lHPmedHuH2ZGGM987Ry?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c193dd-c802-4b62-53bf-08d9591c2f02
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 20:53:03.4892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtSCytWQSzySVyZVdrB/Wo6HHjtggkLt+betgP34vDGbBKUOinmnZdwJR5XKKZfUwZu4xITXIzDAHdOshgMR2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5237
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

More updates for 5.15.

The following changes since commit 04d505de7f82c8f2daa6139b460b05dc01e354e0:

  Merge tag 'amd-drm-next-5.15-2021-07-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-07-30 16:48:35 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.15-2021-08-06

for you to fetch changes up to a43e2a0e11491b73e2acaa27ee74d6c3b86deac0:

  drm/amdkfd: Allow querying SVM attributes that are clear (2021-08-06 16:12:32 -0400)

----------------------------------------------------------------
amd-drm-next-5.15-2021-08-06:

amdgpu:
- Aldebaran fixes
- Powergating fix for Renoir
- Switch virtual DCE over to vkms based atomic modesetting
- Misc typo fixes
- PSP handling cleanups
- DC FP cleanups
- RAS fixes
- Wave debug improvements
- Freesync fix
- BACO/BOCO fixes
- Misc fixes

amdkfd:
- Expose gfx version in sysfs
- Aldebaran fixes

radeon:
- Coding style fix
- Typo fixes
- Pageflip fix

UAPI:
- amdkfd: SVM address range query
  Proposed userspace: https://github.com/RadeonOpenCompute/ROCR-Runtime/tree/memory_model_queries

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: don't enable baco on boco platforms in runpm

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.77

Aric Cyr (1):
      drm/amd/display: 3.2.147

Bing Guo (2):
      drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
      drm/amd/display: Increase stutter watermark for dcn303

Cai Huoqing (2):
      drm/amd/display: Fix typo in comments
      gpu/drm/radeon: Fix typo in comments

Candice Li (1):
      drm/amd/amdgpu: remove redundant host to psp cmd buf allocations

Chengming Gui (1):
      drm/amdgpu: add DID for beige goby

Christophe JAILLET (1):
      drm/amd/pm: Fix a memory leak in an error handling path in 'vangogh_tables_init()'

Colin Ian King (1):
      drm/amd/display: Remove redundant initialization of variable eng_id

Dan Carpenter (1):
      drm/amdgpu: check for allocation failure in amdgpu_vkms_sw_init()

Eric Huang (7):
      Revert "Revert "drm/amdkfd: Add heavy-weight TLB flush after unmapping""
      Revert "Revert "drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update""
      Revert "Revert "drm/amdkfd: Make TLB flush conditional on mapping""
      Revert "Revert "drm/amdgpu: Fix warning of Function parameter or member not described""
      Revert "Revert "drm/amdkfd: Add memory sync before TLB flush on unmap""
      Revert "Revert "drm/amdkfd: Only apply TLB flush optimization on ALdebaran""
      drm/amdkfd: Only apply heavy-weight TLB flush on Aldebaran

Felix Kuehling (1):
      drm/amdkfd: Allow querying SVM attributes that are clear

Graham Sider (1):
      drm/amdkfd: Expose GFXIP engine version to sysfs

Guchun Chen (1):
      drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)

Jaehyun Chung (1):
      drm/amd/display: Add check for validating unsupported ODM plus MPO case

John Clements (3):
      drm/amdgpu: update PSP BL cmd IDs
      drm/amdgpu: added synchronization for psp cmd buf access
      drm/amdgpu: set RAS EEPROM address from VBIOS

Joseph Greathouse (1):
      drm/amdgpu: Put MODE register in wave debug info

Jude Shih (1):
      drm/amd/display: Fix resetting DCN3.1 HW when resuming from S4

Kenneth Feng (1):
      drm/amd/pm: bug fix for the runtime pm BACO

Kevin Wang (1):
      drm/amd/pm: correct aldebaran smu feature mapping FEATURE_DATA_CALCULATIONS

Masanari Iida (1):
      drm/amdgpu/powerplay/smu10: Fix a typo in error message

Mukul Joshi (1):
      drm/amdgpu: Fix channel_index table layout for Aldebaran

Peng Ju Zhou (1):
      drm/amd/amdgpu: Recovery vcn instance iterate.

Qingqing Zhuo (1):
      drm/amd/display: workaround for hard hang on HPD on native DP

Randy Dunlap (1):
      drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled

Rodrigo Siqueira (4):
      drm/amd/display: Move specific DCN2x code that uses FPU to DML
      drm/amd/display: Add control mechanism for FPU
      drm/amd/display: Add control mechanism for FPU utilization
      drm/amd/display: Add DC_FP helper to check FPU state

Roman Li (1):
      drm/amd/display: Remove redundant vblank workqueues in DM

Ryan Taylor (3):
      drm/amdgpu: create amdgpu_vkms (v4)
      drm/amdgpu: cleanup dce_virtual
      drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)

Sergio Miguéns Iglesias (1):
      DRM: gpu: radeon: Fixed coding style issues

Shirish S (1):
      drm/amdgpu/display: fix DMUB firmware version info

Solomon Chiu (1):
      drm/amdgpu: Add preferred mode in modeset when freesync video mode's enabled.

Tom St Denis (1):
      drm/amd/amdgpu: add regCP_MEx_INT_STAT_DEBUG for Aldebaran debugging

Tuo Li (1):
      drm/amdgpu: drop redundant null-pointer checks in amdgpu_ttm_tt_populate() and amdgpu_ttm_tt_unpopulate()

Wesley Chalmers (1):
      drm/amd/display: Assume LTTPR interop for DCN31+

Xiaomeng Hou (2):
      drm/amd/pm: update yellow carp pmfw interface version
      drm/amd/pm: update smu v13.0.1 firmware header

Yifan Zhang (1):
      drm/amdgpu: fix the doorbell missing when in CGPG issue for renoir.

Zhenneng Li (1):
      drm/radeon: Update pitch for page flip

xinhui pan (1):
      drm/amdgpu: Fix out-of-bounds read when update mapping

zhouchuangao (1):
      gpu/drm/amd: Remove duplicated include of drm_drv.h

 drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  40 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 272 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           | 643 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h           |  26 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  10 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           | 780 ---------------------
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  22 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  22 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  10 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  16 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h              |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  33 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  47 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  29 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |   4 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  17 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |  24 +
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     | 144 ++++
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h     |  34 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  21 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_trace.h          |   3 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  41 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |   2 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  20 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  16 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   4 +
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |   2 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c   | 102 +++
 .../dce_virtual.h => display/dc/dml/dcn2x/dcn2x.h} |  16 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |   2 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   2 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/os_types.h          |  35 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   8 +-
 .../drm/amd/include/asic_reg/gc/gc_9_4_2_offset.h  |   4 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_2_sh_mask.h |  54 ++
 drivers/gpu/drm/amd/include/atomfirmware.h         |   2 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   1 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |   2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h      |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   2 +-
 drivers/gpu/drm/radeon/atombios.h                  |   4 +-
 drivers/gpu/drm/radeon/evergreen.c                 |   8 +-
 drivers/gpu/drm/radeon/r100.c                      |   9 +
 drivers/gpu/drm/radeon/r300_reg.h                  |   2 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   2 +-
 drivers/gpu/drm/radeon/radeon_fb.c                 |   7 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |   2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |   2 +-
 drivers/gpu/drm/radeon/rs600.c                     |   8 +-
 drivers/gpu/drm/radeon/rv770.c                     |   8 +-
 include/uapi/linux/kfd_ioctl.h                     |  16 +-
 96 files changed, 1611 insertions(+), 1196 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
 rename drivers/gpu/drm/amd/{amdgpu/dce_virtual.h => display/dc/dml/dcn2x/dcn2x.h} (77%)
