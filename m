Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F738BDA6
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 06:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398AC6F5B8;
	Fri, 21 May 2021 04:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2062.outbound.protection.outlook.com [40.107.212.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873996E489;
 Fri, 21 May 2021 04:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atO7kJ1djCXunOLi6TL6pIEjfhbG1FjoJSFRC0fH093QV4wkC9NWht+NxepyFXyFq6dPZleYWWWywb45OSU0dSYDVAROpblA0yVxN1q4/Nj8AmJsCh3AP2pSTUKa2vH43EpZIj5ZAKIaoNkltZQrmmK5Rw9aynwdve2ortyRO78gmvGOWl+CvcYCir2jIqasFiSI8rjfgtFA4N2JC21WqWPy0W5J6SwvAcBFtRmjySalJwMIjfGPb2/oehCZVfjnhqXbZTf2z9rWLgktJf0Fh00SRxWZUK+Bm2NguO7KAmBUoksnffIlct/nifhytZLPq9JUrdf8vhfjuB1uk/g8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFwvPNt00DT5j4QbZrei/YLsDnan5lQG2dgYILoP3Q8=;
 b=Yx4q+dFUseZGFq0/6TMWWclqUdCBtM2gCUTW+bn5ZBkh83q+SZC3r/lr2X07a4XOKm0/xOYzT5rI0JUyGgqAPPpx8CM8yfXfbea4o+ezYLSRB0OulfKToSrTPJhHtT/9/3K9k6A2NriM2y1nEIcTlN84OxxCXu8aS8+9DljL68T/3bBvNplOLh7kMxIt2+d6sbori7skG+HXgErpFMHh3jLvZ/G6Hs4hDcXhN/Wnk2Pr1tc+69p8AOMS58bzCCkQ49P1eiURBwvdIC4sq35sY3unC+A+kkvEJXbheMIVlG1i1XMrOEHzEv4Zazxf/2+lQJhq8siA60PiAB/MQpDoxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFwvPNt00DT5j4QbZrei/YLsDnan5lQG2dgYILoP3Q8=;
 b=1LiAmW3i1t2eajT8OZ1vIFDi/VMiAHXSjmy4hw2u8b0sJmI/nkMvUMhKbX3cZESzreNEXHqwhpiHi5noAaWl884t/8uAHQvNu8xS8xEjRk54BcpcF4M7vs3ZKtiSnyScwSEF5tiDbqEdO0VmKpmn17gBS6T9dXv8QQVPTzHsTLs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 04:58:08 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 04:58:08 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-next-5.14
Date: Fri, 21 May 2021 00:57:43 -0400
Message-Id: <20210521045743.4047-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [204.111.139.213]
X-ClientProxiedBy: MN2PR19CA0022.namprd19.prod.outlook.com
 (2603:10b6:208:178::35) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.111.139.213) by
 MN2PR19CA0022.namprd19.prod.outlook.com (2603:10b6:208:178::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Fri, 21 May 2021 04:58:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15dc225-ea91-4701-f43b-08d91c1506c8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4407:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4407BBB79061515ED1E5F677F7299@MN2PR12MB4407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sl+DD9J0nNUE7D1FIJvQjIuV9nKIsf9h7BncnpB76xIuW8bZfvX2eJQE4lc6A8FoWpUCPnp6wnlwfWXlncANdRHsm+ZWByyX6UkJWJTHZBTfdbUVMa2yJ3QpnuUSPtcdAOrOql/PsZQ5Xb/cqEn3sbycKo1k86vTfnNbwpLfBMs7ZCoAnC+1vV8M2BMZTfZFsothme27lhGEVdv3wzW7Ws9ELxV4A4jyKcHGO1UYw/xyHa4DQVCl49JTwrnWV9FlQcKLwPporsy/cbxOcDGxwMSapqyWF4mVeAYglV9zbR3SYVsOD2FKBByjhYqdujJVBZZYEmjd/i22R4Z0cWSFk9e76Yh2UlkD5c+u6qeXWY4z8hgD6yZYny5gLlcALmUoZJwveErThpjGCW9PiKhy9oEQ78JFhvIIbM3hatRYdQ5FQm98bg10Fhr5M2nDtl8NzyKGeLzqtqlx9FJjJfnb9pTEpPWutRjgHU4cCugwbwz56TNHotPYI9buBXd9ZO40CXmAvtyh8gM8qnbGhNE7Y4FUNozv9ovTgisMSwgkbtmskXLCaQ8xiqJPsp1IMywcyzbbXPxjexVFGIwmjYfo6Gkh6nj2wjqA8J/UCY0l4T8Tiv7aqDPjG4PxTnuyo4LO2PkNGMLU7lMWkIiwIZTxGOUGQ/7pYkSgKLHc6iKlZrVEuUjmIC8+AiY1DVW5EWJN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(478600001)(38350700002)(38100700002)(6486002)(4326008)(6666004)(86362001)(83380400001)(6512007)(1076003)(66574015)(966005)(26005)(6506007)(36756003)(316002)(66556008)(8936002)(2906002)(186003)(66946007)(16526019)(5660300002)(956004)(2616005)(52116002)(66476007)(30864003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmRxcjdhR2h0cVdMUitIUzRLeW5NazVOcXdwTmFNSU1aUXlRbzY1dktTaGpl?=
 =?utf-8?B?VmdCZG84Vzg0UmNROWVPTGZkTG45bmI1eUxnVnZFYndZVjAxT0tweHVoWHJG?=
 =?utf-8?B?RmJicDNncTY3VkJoMnFma08rNXkxZ1F4MzkvY21pcll4QkdKc0JSaDNicUhR?=
 =?utf-8?B?UGZCYTJrUVVxVVNkQmlpK0Q0SXVTVjB1MFhlejh0aWhscEo4WkpCSEk4UDVG?=
 =?utf-8?B?OWg2K3RleWFXQmowc0IyUlBBTTk1UTVYVm4yY0d6eHBIVFYrdjZKd3d1YnU4?=
 =?utf-8?B?WmxDdTA2cnptSE05SWMwQ3NPTVlMV0l0NVhIUmFneHljNllOVVNPVlBpUnlD?=
 =?utf-8?B?VnhXMDFvMUZWazJhSFdXT3djaUYva1M5b1BYby9xYUMrKzhsRzZkWlQyS1p3?=
 =?utf-8?B?ZlliR29SclpxNC9VMk1OOVZaZUN1ejhrUXBxRE9vOGhUSWROSm05cm9KNGVL?=
 =?utf-8?B?QU1Zc3l1c0VyQ3BPdkJpV1hYSjlmVHVDV1QrUUF3OWtJbWlkNmFsb0l0ckRB?=
 =?utf-8?B?UHY0RGVjOHVZZFVwbnJMTFA4QVU4UCtiM3M4N0tFOFJUNkV4Z2QwWGVDTkdU?=
 =?utf-8?B?ODRVRTFRNG1BMG5GMER4RGhkK0Fkc211dER1ajhUYXQrWDZaZ1BCWkVweU1F?=
 =?utf-8?B?ZHlTN01YSUJMTHdhWHRKZXF3bC9EWU84bDZ3N1Y3UmdUWlNhOUV3cGllVzJO?=
 =?utf-8?B?T1dhYklOWHdBT0lnSVF5Ny91RWEwTUs5L2NGdGFGL1ExdXZUS21MdTBDNXBr?=
 =?utf-8?B?Y0Jpd0FXOCtBM3dpb0V6VVplK0JCVDVMVU5MY2tVc3JwQWYyaEIwZlJiYzha?=
 =?utf-8?B?bjlvekhCbUNQUnU0U1RtWVMyNkVJZHlNaUpWNmdZdHNNUlpXRHpJTUJpUXc2?=
 =?utf-8?B?UmdXQ3BiaHdDQWoybXZOMkxvRENhVGp4QnM1VHNZOHdrQ05XYnVFSXhPQ3R5?=
 =?utf-8?B?ZGdsMk9UK2sxQ0xxcmhaVlFzaTZpZnRkTG1jeWVUOTd4WHJTc1VZVXJ5SzU0?=
 =?utf-8?B?NVBnWlZiamFtNG9MTXN2NjZVWlVRUkdWSGdUVkhPRmJYYjRuN2ZoUU5HdXdz?=
 =?utf-8?B?T3hSMUNLTVlpTlI4SjFraWtFb25PMHFZVWpWc0YrUk5taWdzeGhFNmNTNGsy?=
 =?utf-8?B?bEpTdWo2Q0Y2VFp1NGo3ZGVNQ0k3QnkzNG5zZmJFdDVRdlRZRnZ6aUtLUXdz?=
 =?utf-8?B?UWE3ODNJeVBnQVlFQWcwK0VHb05aVXc0NkhLYWN3eHFtYjNhNERqSjM4TGRH?=
 =?utf-8?B?bHhPZk4za2NoTGhuOTEvTkI0Wlh1QzJhdXQ5bHVyRW40M01RU1lCSGFXRGZP?=
 =?utf-8?B?L3JTS2l2ZndmSm8ySFhUS0srelVVSlB5aFUyRHZQbElyaGlYV00xdk1VT0px?=
 =?utf-8?B?T0dWYUNWa1NxTzJPTDZXQ0NrYnRLYlVBQVhFVHNZWVE4WWZNREZwRWVURlBG?=
 =?utf-8?B?cFA5UExnL3dUZjl6MDZqM0hrYmkxc2tVNXRLODNGbHJPVlllVzQ5bkNuQlRH?=
 =?utf-8?B?WWh0ck5QWkluTWZNZWQ5dTF0MkdZV0VmaVVvUmUxbmtSdFB0aURaZ1pxeHEy?=
 =?utf-8?B?WHF5emk0dU5mS2dBNWdpU3JFL0R4KzBpU1BVOFg1cnRhSnU1WHdaWUtSdHN4?=
 =?utf-8?B?a1FKODNxYzBoRzRmMjlvQjUzMmw0aGJENGIxY2V0Q3ppZ0NDTis0d1c4QTk0?=
 =?utf-8?B?Q1ZsT293b1dwZ21CdENCa0hlaWxKY082N3BFd21HWjg5TmVUMmllTXVBdXhZ?=
 =?utf-8?B?TVJ0Yms0WTVKQ1RYODhpak8wVGdWZ0pET0R1YjdheE5QbU1EblAyWFZFNGpr?=
 =?utf-8?B?N3dOMUp3aldpdlNiOTU2dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15dc225-ea91-4701-f43b-08d91c1506c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 04:58:08.4972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw3uJBYDvTEjSF3Su2+I6oQqkvpR4E489kaW7Y8uyfjB5yBPkZH/Fyo6c/ZjJ20aG8wgID8YC2sHx5F/L64YZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

More updates for 5.14. On top of the stuff from last week's PR.

The following changes since commit 2bb5b5f688cbbd5030629905d3ed8032ab46e79f:

  drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz monitors are connected (2021-05-19 22:29:40 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.14-2021-05-21

for you to fetch changes up to 81db370c88196400972acd6ebbaa73a1d1e4145f:

  drm/amdgpu: stop touching sched.ready in the backend (2021-05-19 22:45:00 -0400)

----------------------------------------------------------------
amd-drm-next-5.14-2021-05-21:

amdgpu:
- RAS fixes
- SR-IOV fixes
- More BO management cleanups
- Aldebaran fixes
- Display fixes
- Support for new GPU, Beige Goby
- Backlight fixes

amdkfd:
- RAS fixes
- DMA mapping fixes
- HMM SVM fixes

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: modify system reference clock source for navi+ (V2)

Alex Deucher (3):
      drm/amdgpu: add mmhub client support for beige goby
      drm/amdgpu/display: add helper functions to get/set backlight (v2)
      drm/amdgpu/display: restore the backlight on modeset (v2)

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.66

Aric Cyr (1):
      drm/amd/display: 3.2.136

Aurabindo Pillai (8):
      drm/amd/display: Add register definitions for Beige Goby
      drm/amd/display: Initial DC support for Beige Goby
      drm/amd/display: Edit license info for beige goby DC files
      drm/amd/display: Add DM support for Beige Goby
      drm/amd/amdgpu: Enable DCN IP init for Beige Goby
      drm/amd/display: Add callback for update_soc_for_wm_a for dcn303
      drm/amd/display: Enable HDCP for Beige Goby
      drm/amd/display: enable idle optimizations for beige goby

Bhawanpreet Lakha (1):
      drm/amd/display: Add Overflow check to skip MALL

Bokun Zhang (1):
      drm/amdgpu: Complete multimedia bandwidth interface

Changfeng (1):
      drm/amdgpu: disable 3DCGCG on picasso/raven1 to avoid compute hang

Chengming Gui (27):
      drm/amd/amdgpu: add beige_goby asic type
      drm/amd/amdgpu: set fw load type for beige_goby
      drm/amd/amdgpu: set asic family and ip blocks for beige_goby
      drm/amd/amdgpu: add support for beige_goby firmware
      drm/amd/amdgpu: add gmc support for beige_goby
      drm/amd/amdgpu: add common support for beige_goby
      drm/amd/amdgpu: initialize IP offset for beige_goby
      drm/amd/amdgpu: add mmhub support for beige_goby
      drm/amd/amdgpu: add common ip block for beige_goby
      drm/amd/amdgpu: add gmc ip block for beige_goby
      drm/amd/amdgpu: add ih ip block for beige_goby
      drm/amd/amdgpu: add gfx ip block for beige_goby
      drm/amd/amdgpu: add sdma ip block for beige_goby
      drm/amd/amdgpu: configure beige_goby gfx according to gfx 10.3's definition
      drm/amd/amdgpu: add virtual display support for beige_goby
      drm/amd/amdgpu: support cp_fw_write_wait for beige_goby
      drm/amd/amdgpu: Use IP discovery table for beige goby
      drm/amdkfd: support beige_goby KFD
      drm/amdkfd: add kfd2kgd funcs for beige_goby kfd support
      drm/amd/amdgpu: add smu support for beige_goby
      drm/amd/amdgpu: add psp support for beige_goby
      drm/amd/amdgpu: update golden_setting_10_3_5 for beige_goby
      drm/amd/pm: add mode1 support for beige_goby
      drm/amd/pm: update smu11 driver interface header for beige_goby
      drm/amd/pm: use macro to get pptable members
      drm/amd/pm: Use the PPTable from VBIOS for beige_goby
      drm/amd/amdgpu: Enable gfxoff for beige_goby

Chris Park (1):
      drm/amd/display: Disconnect non-DP with no EDID

Christian König (7):
      drm/amdgpu: re-apply "use the new cursor in the VM code" v2
      drm/amdgpu: use cursor functions in amdgpu_bo_in_cpu_visible_vram
      drm/amdgpu: set the contiguous flag if possible
      drm/amdgpu: check contiguous flags instead of mm_node
      drm/amdgpu: move struct amdgpu_vram_reservation into vram mgr
      drm/radeon: use the dummy page for GART if needed
      drm/amdgpu: stop touching sched.ready in the backend

Dennis Li (2):
      drm/amdkfd: refine the poison data consumption handling
      drm/amdkfd: fix a resource leakage issue

Felix Kuehling (10):
      drm/amdgpu: Arcturus: MTYPE_NC for coarse-grain remote memory
      drm/amdgpu: Albebaran: MTYPE_NC for coarse-grain remote memory
      drm/amdgpu: Rename kfd_bo_va_list to kfd_mem_attachment
      drm/amdgpu: Keep a bo-reference per-attachment
      drm/amdgpu: Simplify AQL queue mapping
      drm/amdgpu: Add multi-GPU DMA mapping helpers
      drm/amdgpu: DMA map/unmap when updating GPU mappings
      drm/amdgpu: Move kfd_mem_attach outside reservation
      drm/amdgpu: Add DMA mapping of GTT BOs
      drm/amdgpu: Move dmabuf attach/detach to backend_(un)bind

George Shen (1):
      drm/amd/display: Minor refactor of DP PHY test automation

Guchun Chen (2):
      drm/amdgpu: update gc golden setting for Navi12
      drm/amdgpu: update sdma golden setting for Navi12

Hawking Zhang (7):
      drm/amdgpu: add atomfirmware helper function to query fw cap
      drm/amdgpu: switch to cached fw flags for gpu virt cap
      drm/amdgpu: switch to cached fw flags for sram ecc cap
      drm/amdgpu: switch to cached fw flags for mem training cap
      drm/amdgpu: add helper function to query dynamic boot config cap
      drm/amdgpu: query boot config cap before issue psp cmd
      drm/amdgpu: add gc_10_3_5 golden setting for beige_goby

Hugo Hu (1):
      drm/amd/display: treat memory as a single-channel for asymmetric memory V3

James Zhu (1):
      drm/amdgpu: add video_codecs query support for aldebaran

Jiansong Chen (1):
      drm/amdgpu: fix GCR_GENERAL_CNTL offset for beige_goby

Jiawei Gu (1):
      drm/amdgpu: Fill adev->unique_id with data from PF2VF msg

Jingwen Chen (1):
      drm/amd/amdgpu: fix refcount leak

Jinzhou Su (1):
      drm/amdgpu: Add compile flag for securedisplay

Joe Perches (1):
      drm/amd/display: Fix typo of format termination newline

John Clements (1):
      drm/amdgpu: Conditionally reset RAS counters on boot

Joshua Aberback (1):
      drm/amd/display: Update DCN303 SR Exit Latency

Lang Yu (1):
      drm/amd/amdgpu: fix a potential deadlock in gpu reset

Lijo Lazar (3):
      drm/amd/pm: Add custom/current freq to pstates
      drm/amd/pm: Fix showing incorrect frequencies on aldebaran
      drm/amd/pm: Reset max GFX clock after disabling determinism

Mukul Joshi (1):
      drm/amdgpu: Query correct register for DF hashing on Aldebaran

Nikola Cornij (1):
      drm/amd/display: Use the correct max downscaling value for DCN3.x family

Peng Ju Zhou (2):
      drm/amdgpu: Skip the program of GRBM_CAM* in SRIOV
      drm/amdgpu: Refine the error report when flush tlb.

Philip Yang (3):
      drm/amdgpu: flush TLB if valid PDE turns into PTE
      Revert "drm/amdkfd: flush TLB after updating GPU page table"
      drm/amdkfd: heavy-weight flush TLB after unmap

Rodrigo Siqueira (4):
      drm/amd/display: Add documentation for power gate plane
      drm/amd/display: Remove legacy comments
      drm/amd/display: Add kernel-doc to some hubp functions
      drm/amd/display: Document set RECOUT operation

Tao Zhou (7):
      drm/amdgpu: enable GFX clock gating for beige_goby
      drm/amdgpu: support athub cg setting for beige_goby
      drm/amdgpu: enable athub/mmhub PG for beige_goby
      drm/amdgpu: enable mc CG and LS for beige_goby
      drm/amdgpu: enable hdp CG and LS for beige_goby
      drm/amdgpu: enable ih CG for beige_goby
      drm/amdgpu: add cgls for beige_goby

Veerabadhran Gopalakrishnan (2):
      drm/amdgpu: Enable VCN for Beige Goby
      drm/amdgpu: enabled VCN3.0 CG for BEIGE GOBY

Wayne Lin (2):
      drm/amd/display: Refactor suspend/resume of Secure display
      drm/amd/display: Avoid get/put vblank when stream disabled

Wenjing Liu (4):
      drm/amd/display: determine dp link encoding format from link settings
      drm/amd/display: decide link training settings based on channel coding
      drm/amd/display: rename perform_link_training_int function
      drm/amd/display: consider channel coding in configure lttpr mode

Wyatt Wood (2):
      drm/amd/display: Add get_current_time interface to dmub_srv
      drm/amd/display: Refactor and add visual confirm for HW Flip Queue

Yi Li (1):
      drm/amdgpu: Fix GPU TLB update error when PAGE_SIZE > AMDGPU_PAGE_SIZE

YuBiao Wang (1):
      drm/amd/amdgpu: psp program IH_RB_CTRL on sienna_cichlid

Zhan Liu (1):
      drm/amd/display: Correct DPCD revision for eDP v1.4

xinhui pan (1):
      drm/amdgpu: Fix a use-after-free

 drivers/gpu/drm/amd/amdgpu/Makefile                |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   539 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   196 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    58 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    54 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c   |    54 +
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |     9 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    75 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    16 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |     2 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     2 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    33 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    21 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   165 +-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |     1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    13 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     4 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    12 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   109 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    61 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    20 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    41 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |     1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    94 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     7 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    63 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |     4 -
 drivers/gpu/drm/amd/display/dc/Makefile            |     1 +
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     7 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    48 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |     3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    18 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   106 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dc.h                |     4 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     5 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     9 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |    43 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    49 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |    13 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   230 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |     5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    29 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |     5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |     9 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |   175 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |     9 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |     1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |     9 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |    39 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h    |    30 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c   |    40 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h   |    17 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |    19 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.h    |    15 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  1675 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.h    |    17 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |     6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |     3 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     4 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     8 +
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |   262 +
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.h |    15 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |     4 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c |    37 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h |    19 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     9 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     4 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 .../drm/amd/display/include/link_service_types.h   |     1 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_offset.h    |  8427 +++++
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   | 35330 +++++++++++++++++++
 .../amd/include/asic_reg/dcn/dpcs_3_0_3_offset.h   |   204 +
 .../amd/include/asic_reg/dcn/dpcs_3_0_3_sh_mask.h  |  1192 +
 .../drm/amd/include/asic_reg/df/df_3_6_offset.h    |     3 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |     1 +
 drivers/gpu/drm/amd/include/beige_goby_ip_offset.h |  1274 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |     8 +
 .../amd/pm/inc/smu11_driver_if_sienna_cichlid.h    |   366 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |     1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |     4 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   799 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    82 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     9 +
 drivers/gpu/drm/radeon/radeon_gart.c               |     3 +-
 include/drm/amd_asic_type.h                        |     1 +
 135 files changed, 51823 insertions(+), 932 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/beige_goby_ip_offset.h
