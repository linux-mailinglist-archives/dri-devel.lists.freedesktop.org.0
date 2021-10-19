Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8524341BA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B22E6E0C1;
	Tue, 19 Oct 2021 22:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8191A6E0AD;
 Tue, 19 Oct 2021 22:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnsoC+slh7BPhEWgOLQO+pFxAhJV1qSshTCFmOVyP2FjUThTpu89ykXche/xfMXbKAX34w4PgZAlIZEF79WmNQpRXRRXQmsaVjzrH1cwLcQM4Op/UK3awaDZ5/zdIyDoU46cXSnHTt4vx16TZVEQ3AY4N4E8tj7FMlufdq58nfj+FMmB0KRr3R4cZEjv9GQR1nF+MubiIVK3bYjQouWoz02I+YUd+amqTr/c//Gmkh62HcEyBjYPoYiOd1RbhoOw7rdwfZbcVD+Ai5YjAIwni2i+oeWZPyo8RrHnhjmGbqJR64IqbTHpN5TnDTpKMQgv9WPlkz7fh3iKyCfao4fAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hegkA3HAWOHnzKLnTQqIPr0o5bEwxOinaDGNgrEo6R8=;
 b=L4RND9KSJtxmtvpXc9iYx4hYrJokXxD2LNVqLRRT+oTE/nro1plcgAThBqojRNJL3Coof8vWhy0LYBS8dISQjtw2C6cxgx02g5Q0xkAs6v9KjN6IHi67rZYBw3XNg48Z3WIS9WDUegbnU7Te14bIiIg9xUrXLLiWx6DFftbq+uvKpsTwVVgpJw57RLwUEOVFWsfgyLx/okeRkaNQbT8+ozZib/yJFw0Jb5sIsaeYYo9P1UWcL2Y8DV+V50CBk0V64kHWzEXw71mRUz6guWupl7KQPnMh07pKAFs+aaZd3acsKTkhjGyQZWKqUGexZy/b45J1Nhl2LI1hjbA0G8JDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hegkA3HAWOHnzKLnTQqIPr0o5bEwxOinaDGNgrEo6R8=;
 b=Xm1IWHJDRQZ+6OzYdhs0R8pVD5PFLt3i4GH72hWtxNtHlyY8I9KGUmQ/mijdY6nigaS/xo/PTTyhGt/IZrHgG4y01VX3Rk5MPsV1aKejhlw0xLu/7ihx12lSoVjiENIOaWol63TSehGgN7q+xUqvFp65q3/vRDJ9trhECkUanA0=
Received: from MW3PR06CA0001.namprd06.prod.outlook.com (2603:10b6:303:2a::6)
 by BN6PR1201MB0226.namprd12.prod.outlook.com (2603:10b6:405:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 22:55:02 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::58) by MW3PR06CA0001.outlook.office365.com
 (2603:10b6:303:2a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:01 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:54:57 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 00/13] drm: Enable buddy allocator support
Date: Wed, 20 Oct 2021 04:23:56 +0530
Message-ID: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6eb6cd8-4014-43fc-1892-08d993537bfb
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0226:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB022679F38CE4C26BCDDD0AEBE4BD9@BN6PR1201MB0226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gzx20bGIxcFRNX9pELbQ4EgTaCGAuEdbskTE5UZKx5FmX+YpFhdmIy0sdoeEf+sfJ4O2e0o+0W5vB26M6IUK6v2TUiLMg4wGbitbP6ZPT0wkEuKm3VlObCP5/T3DDQOY99AxxxCilfJIha2wIyASE674Ecrd/fUsuI8UPIw6d3rHeiYvB4jYQ8bdgkiJtG8ss0YKAp5/aMKjkeOylirXwoP8Toybj/cgiGKpvrdrVqAwQJT67iY5UX8p0gaQjRPN6UMm9weW2qj5bmCI4LOKomnkXuifOoy7sOVFgPSy5NNa1CN8Qz+EyfdE9YCfRDEn85WjtI24JdpuRvwXFsylvjjJy/BY+ZwiBWR8Uwq0CIttAQ+uxHlSVnhsD+RtFetPV4/O+TVcEUtd+D0jyJ443GdRz4mdHR9CWzla1Sr4FLdq3dPK1AJIPFeNjxFbJcKuk2CAPgFjBKXxOjSkwn4fnyqGovcbNxZboJ7La0S2RQU1KJ6E3FAP+vi8MjAu0KkVXA88qhptFG1X4NvHgvYQHAVGP1ZVUetyTiOvXUaeuWAPekRK8wfNE2+8Iraf+ldYHi3RXKnh2QoLjOtJKcxFgPqrX8+V518GC5qNrsvRYES3uZdFJLsDax4lsF/bjwA6UYBdgfVsgUEpapsIqYsCamPEyubJq2ozoP8BmW5ZDQFjuxqDX/Yh1djK5ywYAEPvRmucMJAqpoE5gQJosAtwudLbQAlTJ2oLv73BgKSz01c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(86362001)(4326008)(36756003)(1076003)(82310400003)(8936002)(8676002)(5660300002)(70586007)(70206006)(83380400001)(186003)(16526019)(356005)(110136005)(2616005)(47076005)(508600001)(336012)(36860700001)(81166007)(426003)(316002)(7696005)(54906003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:01.9738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eb6cd8-4014-43fc-1892-08d993537bfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0226
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

This series of patches implemented to move i915 buddy allocator
to drm root, and introduce new features include

- make drm_buddy_alloc a prime vehicle for allocation
- TOPDOWN range of address allocation support
- a function to free unused pages on contiguous allocation
- a function to allocate required size comply with range limitations
- cleanup i915 and amdgpu old mm manager references
- and finally add drm buddy support to i915 and amdgpu driver modules

selftest patches will be sent in a separate series.

Arunpravin (13):
  drm: Move and rename i915 buddy header
  drm: Move and rename i915 buddy source
  drm: add Makefile support for drm buddy
  drm: make drm_buddy_alloc a commonplace
  drm: remove drm_buddy_alloc_range
  drm: implement top-down allocation method
  drm: Implement method to free unused pages
  drm: export functions and write description
  drm: remove i915 selftest config check
  drm/i915: cleanup i915 buddy and apply DRM buddy
  drm/amdgpu: move vram defines into a header
  drm/amdgpu: add cursor support for drm buddy
  drm/amdgpu: cleanup drm_mm and apply DRM buddy

 drivers/gpu/drm/Makefile                      |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 251 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  72 ++
 drivers/gpu/drm/drm_buddy.c                   | 704 ++++++++++++++++++
 drivers/gpu/drm/drm_drv.c                     |   3 +
 drivers/gpu/drm/i915/Makefile                 |   1 -
 drivers/gpu/drm/i915/i915_buddy.c             | 466 ------------
 drivers/gpu/drm/i915/i915_buddy.h             | 143 ----
 drivers/gpu/drm/i915/i915_module.c            |   3 -
 drivers/gpu/drm/i915/i915_scatterlist.c       |  11 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  91 ++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   5 +-
 include/drm/drm_buddy.h                       | 164 ++++
 15 files changed, 1214 insertions(+), 803 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
 create mode 100644 drivers/gpu/drm/drm_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 include/drm/drm_buddy.h

-- 
2.25.1

