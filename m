Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03546EF59
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7630810EB2B;
	Thu,  9 Dec 2021 16:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9533710E120;
 Thu,  9 Dec 2021 14:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ML9tawc7itgNs9R2YZdpXR+DSGwHR0Q7LlX/t+CQAv0j+O5A3mcMDe9d7jHmRyG5o5EABKa9xCfgk+vyhYoGkKPDMFxOR4mOPFZXXLpLWuDSzGoiTKaqBV1QICbb/cxy+ag6UK6MdtW11nwF/nVrW8pTRd6Rly4CQrCXBMXhUwqmWRr8wZKoayNQXOZRGji5/DCIDL4E+OBA3q9AbKWQQKG5vrTx4r5f+70EPuBXoIpNXyvVZ1nIS/xjzX2yHbGn5BsHRUWb+ksLdg1w4XzVh3AhPOx3j51CjptJrpKVkB9xC0x8otAVOoCe0XKxoeV+tCBvuF1vCzJR8+azqxFIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dlHpxEJeQOvSQVhFmyJ91E96eP44ubyJyF41ZEhXFE=;
 b=fUXkM7b1gzAs34fEphEJhPCggsViHFZgVpgeTcwJaH4q+NEMcW2cADGMj6s3vBW5rXKMJ8Gf5IF5nrBI1C0Denl8UhLheg+2deXmA42g3TzXvCP1M5Mby9Q8u5HahG+rKp3Xlf+pEZYPiYQL2N+1SWWUcNaM1rda5AHy14Zd10gi417uUzePaf/KVTwLQl+YEZFyvJiupZLfxbuaz0WaD0bjF8n+NSZV78lo3qjSXkgZYTOPjODft+nFyF9W0xbeHDegijoJDZBHY1JSY9P9J/G5c+8vbTW84jekPjNiEvRGA2mWvuNTAIwqlq5txykUw37PxWMDRpI8/22oLcWDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dlHpxEJeQOvSQVhFmyJ91E96eP44ubyJyF41ZEhXFE=;
 b=Qav9qzpnIogjrLcAPDKlCyZbNkefGgYRAJ9ohHUW6aqiQNFIjXfXnGSfrPWgDBxJkIRivg5COZdDpQ86OK31ME7D1TENG2tV12qjvJzHq6DvoTt0R+dMzhS98aGBgVRfe1f3qbA9g76tI7ErT5BgIbUlJqh25nsDg5tYXMaKZ64=
Received: from MWHPR1601CA0020.namprd16.prod.outlook.com
 (2603:10b6:300:da::30) by DM6PR12MB5568.namprd12.prod.outlook.com
 (2603:10b6:5:20c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 14:21:02 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::e2) by MWHPR1601CA0020.outlook.office365.com
 (2603:10b6:300:da::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 14:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 14:21:01 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 9 Dec
 2021 08:20:59 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v4 0/6] Expand display core documentation
Date: Thu, 9 Dec 2021 09:20:41 -0500
Message-ID: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed152703-a47d-405f-91f8-08d9bb1f20cf
X-MS-TrafficTypeDiagnostic: DM6PR12MB5568:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5568C791A1C8F754E2D8DC0698709@DM6PR12MB5568.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEptBUUCsXJXlS3QfDxt8OAB2ABnvMXCT0naIXgendqf+N7nEOziacaAnGDLs+q6nP7HJbkZRcjjd4BjqanMhgzfAbfq9EaPlLVzTX+usO6SY5EMMSNUKXhgNQ+eVQpGgFsnZ7tQt+10CB5soTzE69CZOcMA0iDZ8n34zmKn9iT/6LwlsBDapoFXaelPog+p4IzBNwHnTdJHjXwWNoKYHf2wOnPr251DfjAwszcsQQ5UP27usyVeDgm1qkmh+KjP9MHzVxdvs8zpD/YicQ4OrJEkK1JyTm96V8BeXIFPBG5toyEXm43jqJZUdR4RPqblazaa28LDzSM2apRo4fLf++AEx2vqP+rJLbWf5aA3s95y85H2A/kNBCN/AemT54HXWBr0UHGaX4MDNPj0eHGXl6/Ndf59l4IpS+Qii1Qx8k0T3wuBwU2qjB9PBw83v5VO87DY05sSWlnEwfzCK6sIe3kJBTYYp93vV93Gfu1hJ8gq+7e09jxD42K2It3o+rJEKtRsqLTpcFiG+y11OExGShCVABtrguNfrWmEnVf5V/3xxNWdKQBYlet6woF2/FoVSI+i+ej2KldDzHgzRwNYrCROfiQAiAqb4/upkoaVfM7mBMBW2LX8sojZIC+CsitutlL2YMqu7rEWVRHw2SGci/OwH86inAHbd8Rv+zck90+z0RyzMCZnelJiGqrYa7m7OhTHZGZD8uoJSa6e8MGL0ICusUTN1nAgpO/uE6mTq8mFcRbKoVQ1xz/SVTWnqb782xpd+Ae6ddrTNiR8Mz5gNhQG/1Oods6tXLjkRrIK+fMYF66GIosuSykNKZJCqoES
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36860700001)(110136005)(2616005)(426003)(40460700001)(5660300002)(921005)(8676002)(356005)(7416002)(316002)(47076005)(336012)(83380400001)(26005)(508600001)(6666004)(82310400004)(86362001)(1076003)(70206006)(70586007)(16526019)(36756003)(54906003)(81166007)(4326008)(8936002)(2906002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:21:01.6973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed152703-a47d-405f-91f8-08d9bb1f20cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5568
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display Core (DC) is one of the components under amdgpu, and it has
multiple features directly related to the KMS API. Unfortunately, we
don't have enough documentation about DC in the upstream, which makes
the life of some external contributors a little bit more challenging.
For these reasons, this patchset reworks part of the DC documentation
and introduces a new set of details on how the display core works on DCN
IP. Another improvement that this documentation effort tries to bring is
making explicit some of our hardware-specific details to guide
user-space developers better.

In my view, it is easier to review this series if you apply it in your
local kernel and build the HTML version (make htmldocs). I'm suggesting
this approach because I added a few SVG diagrams that will be easier to
see in the HTML version. If you cannot build the documentation, try to
open the SVG images while reviewing the content. In summary, in this
series, you will find:

1. Patch 1: Re-arrange of display core documentation. This is
   preparation work for the other patches, but it is also a way to expand
   this documentation.
2. Patch 2 to 4: Document some common debug options related to display.
3. Patch 5: This patch provides an overview of how our display core next
   works and a brief explanation of each component.
4. Patch 6: We use a lot of acronyms in our driver; for this reason, we
   exposed a glossary with common terms used by display core.

Please let us know what you think we can improve this series and what
kind of content you want to see for the next series.

Changes since V3:
 - Add new acronyms to amdgpu glossary
 - Add link between dc and amdgpu glossary
Changes since V2:
 - Add a comment about MMHUBBUB
Changes since V1:
 - Group amdgpu documentation together.
 - Create index pages.
 - Mirror display folder in the documentation.
 - Divide glossary based on driver context.
 - Make terms more consistent and update CPLIB
 - Add new acronyms to the glossary

Thanks
Siqueira

Rodrigo Siqueira (6):
  Documentation/gpu: Reorganize DC documentation
  Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs entry
  Documentation/gpu: Document pipe split visual confirmation
  Documentation/gpu: How to collect DTN log
  Documentation/gpu: Add basic overview of DC pipeline
  Documentation/gpu: Add amdgpu and dc glossary

 Documentation/gpu/amdgpu-dc.rst               |   74 --
 Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   87 ++
 .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
 Documentation/gpu/amdgpu/display/dc-debug.rst |   77 ++
 .../gpu/amdgpu/display/dc-glossary.rst        |  237 ++++
 .../amdgpu/display/dc_pipeline_overview.svg   | 1125 +++++++++++++++++
 .../gpu/amdgpu/display/dcn-overview.rst       |  171 +++
 .../gpu/amdgpu/display/display-manager.rst    |   42 +
 .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
 Documentation/gpu/amdgpu/display/index.rst    |   29 +
 .../gpu/{amdgpu.rst => amdgpu/index.rst}      |   25 +-
 Documentation/gpu/drivers.rst                 |    3 +-
 12 files changed, 2690 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/config_example.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dcn-overview.rst
 create mode 100644 Documentation/gpu/amdgpu/display/display-manager.rst
 create mode 100644 Documentation/gpu/amdgpu/display/global_sync_vblank.svg
 create mode 100644 Documentation/gpu/amdgpu/display/index.rst
 rename Documentation/gpu/{amdgpu.rst => amdgpu/index.rst} (95%)

-- 
2.25.1

