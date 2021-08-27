Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412203FA0AE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 22:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC206E9C3;
	Fri, 27 Aug 2021 20:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8961E6E9C0;
 Fri, 27 Aug 2021 20:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb0Qe2UqwoxXJ+DOb7mamHIZMfSbJzH5nCs601gvZDMFizoSgEOL3qFGNawSrw33MdBLFOwXsH2UK8kz+sCqB+gvA3dbmJgDXtSPmPkwE+JMqFp33uw9nKKS0ZdGMQzQO9GV8mHsOY3HG/RTyNN3nKzxXo8wC9IrzVIUuh6Otk9MUffX+BvmR5uWAz8nmujPyamXb0X93caRPAEJHta9QZBWEkQZSD8MMPjAPupZY2nHcZcNfChlEV/NYSNV0DxbMc+tCBZBtDJ95Hg423E9QyUDldN+mjSykZwS8QoOUW2zTdKoXm9XfgKkHR0B65ggbGB+liAVhkhuMhbyS/4TVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgrXsw5gwGJnlgE/QDHrq9WCKt/zayMqL/hGFZ1cWF4=;
 b=lIuX9kL1Rdnj370rNBDdLIcM5ENtNle17qaEA+TbSEhj3624yr2yes8B9fjFA4mikor1zFb0j3KjDMpFEDmEzDmkXgO9nwgL1+6F7CEiWxkm2rjJ625FeQ/tExtB0iUUzIjciGdzjExrhYUj0+02YmcXO4bjgmG6Am+/KIXId7+rG6S5oArrtGFGEJoaDBuM13LuUc/0W1olxO9xWqO1UEynLC+mofudr0GaZD+p4PsVTyqaoXrdADbxIixAiKXfIEU2KvSrn3GZ3V9kg4IaKeC4djMSVwNlS5Dgk7m85WBzv+h9JtdSFRkqEKtZmxhwmWvtdy8G7d9uN5cITRPIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgrXsw5gwGJnlgE/QDHrq9WCKt/zayMqL/hGFZ1cWF4=;
 b=VM5ntgt277hugsEAKadUr9K+tg70KRp0dWwlmZRGJ7YDWrYrxzcnVHiD3xH9pthAOYzUwa/DACechnQNoBF4KEhsLPEFwiGRh1jug9aaj8D0Ux6CirvMTCzxS+Iblot6wrc5IxUggtVEM4hvoSXflHCxVWZR8j9AaBKkXtrRoqs=
Received: from BN8PR07CA0035.namprd07.prod.outlook.com (2603:10b6:408:ac::48)
 by BY5PR12MB4933.namprd12.prod.outlook.com (2603:10b6:a03:1d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 20:39:20 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::8) by BN8PR07CA0035.outlook.office365.com
 (2603:10b6:408:ac::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 20:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:39:20 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 Aug 2021 15:39:19 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v3 0/4] Various fixes to pass libdrm hotunplug tests
Date: Fri, 27 Aug 2021 16:39:06 -0400
Message-ID: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 681c3dac-85b9-4c7a-5a7b-08d9699abf6e
X-MS-TrafficTypeDiagnostic: BY5PR12MB4933:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4933B06B540426C69A976316EAC89@BY5PR12MB4933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZV2Bfl6lSkoGxgYSmG01IrKj0onOHAdh9VLDqvtvOfHCmeD04QQZq+NEa7vr9nnLKDdP7DPMNhQD0ChkRsePHGPykoiFM6/U5ylRQOQt1UwqmdUoz7A0a/+8BFPUlFAabV5+j55tNWP+NZ2UinqGobz5SAY1sRJn3End7RjAT+zQVHhikmNkNz6fH9F/UUAv4FWNFgbNIKXdrJ7xjWPBKhMeT3sO4KhGoGLkab5M/grpRFlmvMp2DpSxiBkJVg3Yo2QyHbFU3Sczipuik+/aVVCzT7oW0fZ1ZBEEouaYuaoS9K6m6vnnDxxT7md46dQTPZ0AXqf8x5Bup7y1fDumGUeWp6pFmfjBQH6QixuZRd7r0XrrRkd070ASWlrw0bDvtTAbOt+/lCaFwZVEAbTRzMDSg5l9/1BqFGauQvGh5k4WNAs0Bo1HnpkDPyt3IthX5skd0J8O/Jy5Q/GA2vglfGRnAxkR9MdI6PP2CtunhcoNcK6FqGpXeAZnBR5u/fYtpI/KoCmLeqzvXeA4Xo0EYvx4nLiGiEWED56rJbeLqfge5Zp1b4DLvMEj63pFx5q+BLwRt5mHDBTcUBvdPCJr/mEd+jh0OXxM/7iCf3dw22ffM00sWmpVgJstUhpIMtwn6Lq0WBy+9+6HTSsBytR1zNd9apvgO0Uj46vtAlDK5TPkLtkTcvvkHHgTKJ5qE7DH7k6rdjzwIGzwvtbl3r0uCwjfhcYFUbAziMW51zx2v/Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(46966006)(81166007)(186003)(2616005)(2906002)(336012)(316002)(44832011)(47076005)(70586007)(6666004)(83380400001)(86362001)(110136005)(70206006)(7696005)(82740400003)(82310400003)(8676002)(36860700001)(356005)(1076003)(966005)(426003)(4326008)(36756003)(26005)(478600001)(4744005)(16526019)(8936002)(54906003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:39:20.6776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681c3dac-85b9-4c7a-5a7b-08d9699abf6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4933
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

Bunch of fixes to enable passing hotplug tests i previosly added
here[1] with latest code. 
Once accepted I will enable the tests on libdrm side.

[1] - https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/172

v2:
Dropping VCE patch since relevant function already fixed in latest
code.
Moving IOMMU hnadling to TTM layer.

v3:
Move pinned list to ttm device and a few others.

Andrey Grodzovsky (4):
  drm/ttm: Create pinned list
  drm/ttm: Clear all DMA mappings on demand
  drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
  drm/amdgpu: Add a UAPI flag for hot plug/unplug

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  3 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 18 ++++++--
 drivers/gpu/drm/ttm/ttm_device.c           | 48 ++++++++++++++++++++++
 include/drm/ttm/ttm_device.h               |  2 +
 5 files changed, 68 insertions(+), 5 deletions(-)

-- 
2.25.1

