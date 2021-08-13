Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12EF3EBA64
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 18:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C86489B46;
	Fri, 13 Aug 2021 16:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87126E888;
 Fri, 13 Aug 2021 16:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG3U4UdjCnbwR7fQvk3BbmSdghExiOXpMiq5rNQR04rseB7KRX3+Ueh4dWxK/qFpYT5LvBTBtN79cQabJJXKUBfHHM+cD7bIWjsrml5Lzkq/xC6Xm9QoFLtGRXiwu+j9I8SsLtmsecHSY7nLQVOrfw7/JwA4QijjcBUAzsVadxhLX+Y0Bakw1X1hp3qPPceHqtbetOLNOBERxY9092q92aauRKRvb2NeX64uuqeMnWJV5L9I0Onk/n+JBWbipiXnqdPPDXOrwjhl6L0Mxo6EfPxkBS9XDzJAg95Gj7g3+sjRnDeMqoXVH6K7YrQqr7HNk51UebRgPdncqLlu67/cPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjdQcN5AnKZKPNs2H4C/GI6DbZvQJaYuN3XK3UFfuJ8=;
 b=YizfFDvk2UD22RqxP8uV/yO8Lqz07jE8wAnQz1WVYvP/7AWewLIPCR3K4Ee9Zq/g/xyZ6KoUjN1hAOi3DMKu9EE32zu0ihCwov1ArrKsLqa7RumsGdpawa67e99lB4l+cGAEt6zvwmuQABPKL9MKh+VpKBYMwuB004XruzEhHPwjsC2C5QM66ijr0/vNWUNTc2UdoYdpUf6jzqUGo+qlj9aHIfbu+hWxMf52g7/S/1/l1mlYzvP1/F38Rri8S9UKKifBGug70voW4j+Dyo4s8KRwxf2fAJs0XjxxVixNqkUZVkoY4Xin7I/pqq5GcYhUxtsvM527WyWVTVSNlPk2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjdQcN5AnKZKPNs2H4C/GI6DbZvQJaYuN3XK3UFfuJ8=;
 b=LPfBlT9MAXmfuk4F6tb4TbnOBQGVHa5Vv2Ol5QNIcUBKTfmrZSMo/a08Oyx3cfG4hyzt15ZPadmVvTwQsXYkGUTdAvzyiCDOBb13wlO94ep8/mq86LX0hIqVIKKz3GoiDRiag+BSCV5YMt7MeDFYlSU/lldqkWG9z7nOOH1+bqY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Fri, 13 Aug
 2021 16:51:20 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%5]) with mapi id 15.20.4415.020; Fri, 13 Aug 2021
 16:51:20 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-5.15
Date: Fri, 13 Aug 2021 12:51:02 -0400
Message-Id: <20210813165102.5086-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:408:fe::33) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tr4.amd.com (165.204.84.11) by
 BN9PR03CA0148.namprd03.prod.outlook.com (2603:10b6:408:fe::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 16:51:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e106e7b2-78a0-4b20-a911-08d95e7a9331
X-MS-TrafficTypeDiagnostic: BL1PR12MB5109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51092D34CEB2EDACA977F953F7FA9@BL1PR12MB5109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P40dQQw3UXax87bp7PNO+nPjBhJIpXFQr+faK4bESROlKNuf+Qll1J4ruloN9eRsuDnlWHotl4r9cctYK7pi70bqhsMILi4T21HFGt/6yc5AIzCSPuzh1gZAkK2Q39MyEpKWzbTUkDtiZ3j4Jbnonq6uhXQcW/yfG/37gzq1D5xuHAlVx8uLjKZUH3UuZXNuKJdbTms6bNCJpqR5+d08Vi70CsUxZbvf1mPlxXoA2GeZImQIXINHLV6fJ7BhxmDxzPkVAvzqqzNluEBsIMPW5KCzcKFfoeKB30MVEEPi8oRYO7Tj5EnvFsU92Ih3dDSOZSNpzY4Zc3kG7ee5BgnUcicFAzFXaU+s6/UgRSXpmRPXKT3hdWjnU1+DkC2qt6wKKczR6GxpKUzgP44330TfqW9YkEKxMWuy3cOtoBV+O6MdW+Uh9urRV0rxjeCQgCUdlhAHAjE58NurW0yakGVqQmq1d3tnu+Rjjad5B18eIhsKeP3Zs/KulHh6hD3cdILi+1ZsXAW5pXSs7Q3cq/uz4Ot7AjqBYdUfAgTH+i02TMODW1jG+FY0SM2Y5NTqekESbym4DU8A2xl5g2nyjXacfMhN+FXsh8bzHl3SDu8kJoFaWGBvBAWdxgNOERBR8tTwaac61BR/H+6Xk3JCqrTM81wf2ms0fT2pbHoTwUvqmodGMOnt8podtTvzpLl2NQ6/588wq2j+LKoDAQqfBPzS6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(38350700002)(38100700002)(4326008)(8676002)(316002)(966005)(66556008)(66946007)(26005)(66476007)(1076003)(5660300002)(2906002)(956004)(83380400001)(2616005)(6486002)(6666004)(186003)(8936002)(7696005)(86362001)(36756003)(66574015)(478600001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUI0cXNxRGhheHJXcUtoQldEa2ZWaXJEYWlLN3UwOWJhblF1YlRTZ09RQWEv?=
 =?utf-8?B?NzZhNUFTbE1zYW1lVG9la2c3NGRLcldPdnkrNGlzMEF4OFBiU0s5YjgyaU5s?=
 =?utf-8?B?dCtmc3A2bTQrL0ZnMGdNZnpNc3p3N2dsSXNhQkF1UVczc3pTekdLUVBxMVVz?=
 =?utf-8?B?RTROZUxrU04rcmhGOUJ4ZC9IK3RMaStWU0hOUmxRaTBIMm9UUjFyVGhKbCs0?=
 =?utf-8?B?VGlBNHNSb0gxUHBhY0g5UGJvRVltMXdIRXpYenhyaVpxQ1Y3aEttRlRaaWFu?=
 =?utf-8?B?RFFteGxGV0RscW9VU1hmRU51L1g2ZTZRSTdRTm53SUFiZ0YxYWE1VU1zR3BN?=
 =?utf-8?B?ckRqZXJmaERlRk90VGwrRHNkUjZkREp5ODJodENUalJpMlFkZEpVdUEvQmp2?=
 =?utf-8?B?S1NHNzI2eDJPbmFnSitrVndXWlo3czFZZnNnUjJuQWxIUndwMVpEMEFkQ3B0?=
 =?utf-8?B?NGIvajVZR0grTWVGQnBmdnB3WnlDdVl3M2RjNEQ2a0s3TWdXRTdpZjg5Qith?=
 =?utf-8?B?Tjg5bW5qVVBzM2Z6N1JmWUJwaUNZbVA5WHBxS2x5UEpNMk54YkhhZDI1VmVp?=
 =?utf-8?B?eDArTHFZL09lbHBYME9DTzZyemI0V0xDaWgyUGl6c3M4QWgzSWFScVlIQVlm?=
 =?utf-8?B?MHJ1U3h5R2szcUFhOHlzQ1pSck5YNXpWOXEwMHRtazlQVWF4VEU2UHFGSExr?=
 =?utf-8?B?US9SN0taV1o3OU9xWHJiYW9RU3RGdUMvbUtJOFpFNEZIZHlTUldoazBjcWQ4?=
 =?utf-8?B?T1d1UG92NHJQVzkzM0VTcWU3U0svUkpxZGpMaGpaL01ROS9kLzd0WHNvSlZ1?=
 =?utf-8?B?bCtFdkMrNDhwTFN5NlE5eEpGemdUbmVNL1ZOMTVXK2pzVXM0NENTalNMM0Rs?=
 =?utf-8?B?aytlY1J5eTkydkJsbGRmU1J2VlBGZWJEdWhremV3MkkySDg3WU01WFZxMkhv?=
 =?utf-8?B?SEtwU1FrdEl3ckFFQTJRdkhybzVGMGV6dGVQVXRMN2Q2WjZJdlpqcmticFhS?=
 =?utf-8?B?VXI0SDQ3bTVsSm9SeGthdmFLNDhYOU5ubEh3TjUvUm10TGFTQzlZMHdYOWht?=
 =?utf-8?B?dlE3RktSc1oybURXdm9vMklGRlRydmlDQ29ZVStRVXp6WlBLZXZIUkxFVUNQ?=
 =?utf-8?B?enpDYkxLWHQxM2RiZDlPQWQ5blljZ2RMN2hZN1NhNjlQWXZ6Mm5HRUJIVFVM?=
 =?utf-8?B?QXdoQkxMaEl6NjBTWVpjNlJmOEpHaU43d2RxSjhLaXh6Z0M3cmhzRURkamZ3?=
 =?utf-8?B?UDlLUy9Ccks0VUxtQWZlSnFmc25nMUIwYnpqUVdVMjdJaDhPTTJNbERpbWtX?=
 =?utf-8?B?K0NDR1FLOHgvYi9yMXQxemhidExEUERSc1pkY2d5Z0tBRkpvYlp2dHA3YlZE?=
 =?utf-8?B?TGx4OHNFRURjZEl3SHl5LzZzUGpTYmN3NG5BN09nL0dZejRaME4rc2NyT1hq?=
 =?utf-8?B?b3RGWmEvd1lPbHg0Z2FCTmJxNVMyMEM5dHFwcm9nQmRRdkZmcU1UZEI0UlRR?=
 =?utf-8?B?QWV5bDhIUS9pN1FQZTRtR0pGVHBQL3lEakthRGd1WTIreEVudzc5M0FZVXFZ?=
 =?utf-8?B?NWF0eUtrR0VMRzV4Y2NVUnlKeFhBbUNic29KemROVWd1a0NCWmNSMmFGbWx0?=
 =?utf-8?B?cDdBdnFuNXRCTUE4OXlsc1lKbUd5cmsvNVozYmxrcHBMTzczNTN6NUtoeFZn?=
 =?utf-8?B?WGk1VlBoVkJ6WkZKRkNmWFR5SVB0QU9kRjFWVGwvdWFTNnNBYXEvQmdUakVK?=
 =?utf-8?Q?ssnWeSV8GQqSZewurf0fKbFxTcuQjd4gkDu73Yc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e106e7b2-78a0-4b20-a911-08d95e7a9331
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 16:51:20.0472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwHgW74i2E5ms8EGaHa6ilVC8ePNPpXFMrMK0AvOYAcDb5B/7nJBrLJ8f9CpewcBPiIYo0cVD4HLHJeyaB84Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109
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

Updates for 5.15.  Mostly bug fixes and cleanups.

The following changes since commit a43e2a0e11491b73e2acaa27ee74d6c3b86deac0:

  drm/amdkfd: Allow querying SVM attributes that are clear (2021-08-06 16:12:32 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.15-2021-08-13

for you to fetch changes up to 554594567b1fa3da74f88ec7b2dc83d000c58e98:

  drm/display: fix possible null-pointer dereference in dcn10_set_clock() (2021-08-11 17:19:54 -0400)

----------------------------------------------------------------
amd-drm-next-5.15-2021-08-13:

amdgpu:
- Improve aux i2c tracing
- Misc display updates
- Misc code cleanups
- sprintf to sysfs_emit updates
- Fix some fan control corner cases with suspend

amdkfd:
- Enable CWSR with software scheduling

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: handle VCN instances when harvesting (v2)

Anson Jacob (1):
      drm/amd/display: use GFP_ATOMIC in amdgpu_dm_irq_schedule_work

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.78
      drm/amd/display: 3.2.148

Ashley Thomas (1):
      drm/amd/display: Add AUX I2C tracing.

Darren Powell (7):
      amdgpu/pm: Replace navi10 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace smu11 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace smu12/13 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace vega10 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace vega12,20 usage of sprintf with sysfs_emit
      amdgpu/pm: Replace hwmgr smu usage of sprintf with sysfs_emit
      amdgpu/pm: Replace amdgpu_pm usage of sprintf with sysfs_emit

Eric Bernstein (1):
      drm/amd/display: Remove invalid assert for ODM + MPC case

Mukul Joshi (1):
      drm/amdkfd: CWSR with software scheduler

Nicholas Kazlauskas (2):
      drm/amd/display: Clear GPINT after DMCUB has reset
      drm/amd/display: Increase timeout threshold for DMCUB reset

Philip Yang (1):
      drm/amdkfd: AIP mGPUs best prefetch location for xnack on

Randy Dunlap (2):
      drm/amd/display: use do-while-0 for DC_TRACE_LEVEL_MESSAGE()
      drm/amdgpu: fix kernel-doc warnings on non-kernel-doc comments

Roy Chan (5):
      drm/amd/display: fix missing writeback disablement if plane is removed
      drm/amd/display: refactor the codes to centralize the stream/pipe checking logic
      drm/amd/display: refactor the cursor programing codes
      drm/amd/display: fix incorrect CM/TF programming sequence in dwb
      drm/amd/display: Correct comment style

Ryan Taylor (2):
      drm/amd/pm: restore fan_mode AMD_FAN_CTRL_NONE on resume (v2)
      drm/amd/pm: graceful exit on restore fan mode failure (v2)

Sergio Miguéns Iglesias (1):
      drm/amdgpu: Removed unnecessary if statement

Tuo Li (2):
      gpu: drm: amd: amdgpu: amdgpu_i2c: fix possible uninitialized-variable access in amdgpu_i2c_router_select_ddc_port()
      drm/display: fix possible null-pointer dereference in dcn10_set_clock()

Victor Zhao (1):
      drm/amdgpu: Extend full access wait time in guest

Wenjing Liu (1):
      drm/amd/display: add authentication_complete in hdcp output

YuBiao Wang (1):
      drm/amd/amdgpu: skip locking delayed work if not initialized.

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |  31 ++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |  31 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  33 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  16 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  21 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  35 ++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  62 ++++---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    | 106 +++++++-----
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       | 192 ++++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  14 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |  90 +++++++---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  12 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   1 -
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  18 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |   5 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |   8 +
 .../amd/display/modules/hdcp/hdcp1_transition.c    |   8 +-
 .../amd/display/modules/hdcp/hdcp2_transition.c    |   4 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |  74 ++++++++
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |  72 --------
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   1 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   3 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  22 +--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  38 ++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   7 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  38 ++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |  14 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  74 ++++----
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  26 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  61 +++----
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  34 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  46 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  20 +--
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  21 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   6 +-
 48 files changed, 873 insertions(+), 459 deletions(-)
