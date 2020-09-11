Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D89A2661B0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 17:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CB66E053;
	Fri, 11 Sep 2020 15:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D9B6E053;
 Fri, 11 Sep 2020 15:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2PuAXXSYjrhvTms3E8MDf2uTsU5i9Y3nC1BNOELf/xjZy6ckQSP0z87g8gtmqoQ4mE/kxXGwPYTV2nr+OfmrWfxpztct7DegYTdoU8rXApO6vA6MulvCc/tzRvytbypZ/k6Fz60GVAh3yJxj4ISZs7gUWzm+ATPdGk5HAPyGlANgiJraB1sw58Lgwz2NZuMsGuKYpgMwDi4nNRHVkO1YIwBt8iIwCwTzLHAlgXUSKDIbU8YGAcu8A1ldxGjCpdh9LZUv1UTF6CPFILLpl6xwg4iUco5KWPx0FQfnHe6D/F2RQh06jUb1HO0r3xxB5c9HpJkW3kINXfER+tY1qqXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpO/bDPzVpvKN8ze0UnNjrvIBXZ2rNsIqv7XNbk9BY4=;
 b=DnLOPAnd/Ab1EhBQU1dqAB2Ch7EM9xExMfWMvojDGNZtO/kKTup5mFiDNhyjarZKMFXHiR2FvN+S/6ANBgtKIKfrNLN4LUDPpD5QQ9ZiNWs487v5eCN6T8JLaU8Wjz5gqvvgAu6CF14foTG2ZfksLOyzuc63N9MOx0Ba6w9PzBCWNqtFbJMWPOucV9geRlgm0m75sQkVZIv1Q3DVcsKUBkz6Y2oEQ/+QvXJiT84uwukBt0+nXSFR3zKEEEAkpDZe11PYa4ML0UtavJtFcieTD7F79/8p7wsHyG+Y2hLlHxhwSk67Tpwwc39agdq1PpfU+LBdswmU2/dFQcyagvG5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpO/bDPzVpvKN8ze0UnNjrvIBXZ2rNsIqv7XNbk9BY4=;
 b=HzDww0yl9TKy2MMu5/HmzSbzmOgAkkilGMQwwbvd6bMrTueYSfUC5XUVg5WVaXY9Gw4WmFJrI6TtPCof2oL+ge0OKpL9JAEXNt+E9qqz1fW746m3JxNNd+3bH8VNsG0nwLIk+lmCiEfrRG6/D+JwKKmP3KhFFwL4KK882CF+jCE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 11 Sep
 2020 14:59:58 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 14:59:58 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Enlarge tracepoints in the display component
Date: Fri, 11 Sep 2020 10:59:23 -0400
Message-Id: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.28.0
X-ClientProxiedBy: YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::37) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60::e9a1) by
 YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 14:59:57 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60::e9a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03fd1681-16bc-49d0-619a-08d8566359aa
X-MS-TrafficTypeDiagnostic: DM6PR12MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3082E026465DDA9CA9C2398198240@DM6PR12MB3082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: svr2wbzySw+fXShSBEj0izwBJDNCAOoGR4OoGtMakAdswf1nnzBX17lJUxGvFV9/nSqlwISyClrKBSDw2UpUZ9NYnqrtLbxBEdqOwhWqphEASOrZ7Zcg/2/39YBu9nWgGPBzPZQ9veldVv4QLXlFrZtF64D+ZATfUllC64eIxI9Y1gSP/hpXDgbujqOBff052hEq2YzUK6mydCghpK4EZXN2wAiXoLIE58cHifnyU0h1O/wt+kBGUgdS22GbA6JUfYDujf+PrVW2ZaOoobFD4FPne2cdb2ML55NBhArl15cOZ2x+0v3b4vCPlcbsWrkosuWegvU4g4BJnp87jwPwRwBBbj+BjzgUM1R2ofupme4Z2iCAljim3eLuq14YyPN+P+2+AAs9ZdmIXZu65I+Vig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(66476007)(86362001)(1076003)(52116002)(83380400001)(2906002)(6506007)(8676002)(316002)(66556008)(5660300002)(186003)(6666004)(478600001)(8936002)(4326008)(6486002)(36756003)(66946007)(6512007)(16526019)(54906003)(2616005)(161623001)(147533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1XxqxxoTSv3wkCooXey2CqfjW4V4xc7MPh8xsIvL9G5fHvBEfJPR5a1LksURuHgUiEsmJED8YbUH2u4bxgeN4dthPErX6PtbrwQUHexm26IpAWWn9gdgOXuiw4MDJnE5StpJ+UZ/TrenEA+4XTjJwKscEkxkjp8qFOM2qwGU8/+BNGlKYjtEe32MLfchbN2+TJYvIvKnYcACuEav+X72AJRmct+47wagyFPUUxolevhZ+vCrsj2tYotsF/XTiGqT9iFKynXab6OdUj9A/IY7/sF4M0Ln0BH/BhUTQPXjJAnLy1xjM4hpU7YcEUW/dLgicMh0aLYv7klpoyC6AZDjb6+aBm3P0oLojq6oPza8x1zY2eAHZtEkZOzJchBtcHvivCUxgOj3vCGEQgK/UqR79PCd0Zzm2gvNV1i0ne5aqYdAmndCYcLNzDIbxNsb8ZgTSdrWSYDyD7aGsxoxxtZGLj7Q+f+i2ru6tS8XA7W+CaY/cWtCO2HT0yLoTdvXoWB509llzOcZ3plq02j9e/tz0EPEuSpABX0DFW9s+HxN+t6TkQrRWE4yGjJ5pEp0fsVooSbDqPFkISXw0uYWIZVr/tFGLradnOvGnFi8vf3x0O9kxEaA2rIMqtFe/f6a8EvlJ6RkghPV9eszNFmY3Qkzk+6+1bbJOJHDKly6/h/vhxU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fd1681-16bc-49d0-619a-08d8566359aa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 14:59:58.1642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgwOcI5jldDEnW3J+Gcq+wr7cev02aqzyXxmyBcluAvgqP8fcFbNcwNokw4JQAL2946rpnpH7CJOCngVwEEY5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debug issues related to display can be a challenge due to the complexity
around this topic and different source of information might help in this
process. We already have support for tracepoints inside the display
component, i.e., we have the basic functionalities available and we just
need to expand it in order to make it more valuable for debugging. For
this reason, this patchset reworks part of the current tracepoint
options and add different sets of tracing inside amdgpu_dm, display
core, and DCN10. The first patch of this series just rework part of the
current tracepoints and the last set of patches introduces new
tracepoints.

This first patchset version is functional. Please, let me know what I
can improve in the current version but also let me know what kind of
tracepoint I can add for the next version. 

Finally, I want to highlight that this work is based on a set of patches
originally made by Nicholas Kazlauskas.

Change in V2:
- I added another patch for capturing the clock state for different display
  architecture.

Rodrigo Siqueira (4):
  drm/amd/display: Rework registers tracepoint
  drm/amd/display: Add tracepoint for amdgpu_dm
  drm/amd/display: Add pipe_state tracepoint
  drm/amd/display: Add tracepoint for capturing clocks state

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  17 +
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 712 +++++++++++++++++-
 .../dc/clk_mgr/dce112/dce112_clk_mgr.c        |   5 +
 .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |   4 +
 .../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c  |   4 +
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |   4 +
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |   4 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  11 +
 .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  |   5 +
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  17 +-
 10 files changed, 747 insertions(+), 36 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
