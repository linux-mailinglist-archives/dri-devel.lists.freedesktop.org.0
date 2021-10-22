Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8E4371C1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 08:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6636E832;
	Fri, 22 Oct 2021 06:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310113.outbound.protection.outlook.com [40.107.131.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711156E566
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 06:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdD2s9vLQjk9XDdkORg1vz8+q8a+cPhsV+fv5OqbxLUPL6klAIS+HuZRz0b4t5IOmbcGxonw5KlxRzccmqHBay99GPKH/ofx3s48esYBI9gKBJAdtZPsf3IAhNA/rCozwQb0BU7agV+GnICr/aHSzROQfcjR4ndIvFtYdb7gf9RqyOXt/hOzxTgLbTzCCDj/ql+Cbu8IBlvSEph6NoOI33NpleD32jtIPNj0uKYz+7El90cRMYBLJPLJDB45Ga5kPXRhVim3ICpFAVkXGwSmZOgT4xB2NixYhRiPDOQ7/97jaf7H72u6A8GhI0sHF3U7QKHK8w9W0SsBxfvsJX5zCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0GKXqL2OIQtWMD1zz8tLlbXN446+8CORWtQhLP5Ibc=;
 b=NeuUALJnTqbzxseSfecI4b7Qw4j5T8AAhRd0gNsru4wLkRXlkBjPWCSH7ykbfYnUwCt06pHnSybYYjFobxd1k4jaGfFBl0CG5BF3LB+nGB85p07KBBjZN/ggGoltWJ/MqwBDd+r2C2p22QLNnmtyZGpsolyz/4rVJ5t33dB91qTuUBosos3lNn1EOBO1Sg+bWeXu1E9NDIlq/ocmp6JUGdt/ii/isYdXboJGaOBi0GiiFy70VXnCa0anEmbU2q4WYnnb6uU3OUHPR88UCCxBEKWDC2ozCOugFqHBCcAGrzERhK1jsjSJ+0kkruZxYUSM1zjbMw/LRmDRzsTEOgMRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0GKXqL2OIQtWMD1zz8tLlbXN446+8CORWtQhLP5Ibc=;
 b=FTq/wJUKvxyeBjTSKYHVI7GetpDJ1109VpxppDna2X6PAHeBfwTsKtxWXrneUHzuD0dsrseL7TVL8V2PnB3eaTMRE74HkjE0BMxHd7R6uXMZlmj5NzqLLnMLbw9yQCwymo7OTPYhnSZY7r9002/9dgeNvvhBEyvk3Zf/62RUs0g=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS2PR06MB2502.apcprd06.prod.outlook.com (2603:1096:300:4a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Fri, 22 Oct
 2021 06:30:46 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%4]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 06:30:46 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] gpu/drm: fix potential memory leak
Date: Thu, 21 Oct 2021 23:30:35 -0700
Message-Id: <20211022063036.21763-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:c9::20) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.190) by
 HKAPR03CA0033.apcprd03.prod.outlook.com (2603:1096:203:c9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.8 via Frontend Transport; Fri, 22 Oct 2021 06:30:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 944ffbc5-7172-4010-9543-08d995257b34
X-MS-TrafficTypeDiagnostic: PS2PR06MB2502:
X-Microsoft-Antispam-PRVS: <PS2PR06MB2502F951C03B7A57CABC4B83DF809@PS2PR06MB2502.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKnH3r3x7z3LugIrYZVCh1G0pl0tLLmS7Je8FESsC8J6PTuDxx+CAmqoQ88DrprJd9j7WjEn3wIt2TmKimAuGQJAia91Jasdl9zrcK9md16cslk4A129udLL+hyRDzTN5k+Rr+qzUVNWIgl4puZGFZszWE6e6ucw/OLbdJYY6t7V9u5VPLjxG1rHRpTJy7hChPtzbU6XEYrgMJOCaw0wHeelOLataACnCvg2LB1szY35npyBhRzsHSAwjUaFy8WyGtkfxKC8lpBt5p1QdktmlS8LEwDyxeb7mKl6n8OaJjjWOZQfWmoqSk6WpRSW1ujycMHktjllwecWNqGBswQ9P93YGR0ov6FCgA1uAnBYkpSgaBxZC37YVw94KkhtuaRMDZiLBMm+CUzDydCqGw1hCeXDFuYpQuNFgLtDaxpf8CYTxq1dwRxmOXBGKIvXmJwQNHREpvcDkr71Q2W7AZAXiOQAtJaNxJMgKC55ebkaM1J1lQh1o7oGeSNzjjCaXTlZtRth1nwMPAUXcUrgO3jNSLbUGVvjmqhPSMCrnIYskFWzTL8eomV95dHDc7a5yZ60e/hCaJOdw6828ujTcgMkkwZBKTcSCQYDhN62nnd/NXaP/6PdTOdj0NYcOSPzdLWTWhQ2KTH2/EiNXEKgOBOaYuIztDux4eAbAJAk/nmmXuUPyxzNDZZhVtyWR8KNeSB6pLukhVNXtExBM1B0vDwHJc3RHqwCBMyxSm4tdPw6gHglvilAvVhWX2XJZN8+Dm749t/viaJ4Hi9LS3GV5tvioS911Gc4Zf0KlYpga3VJrHJEK4lMHCM9ha3i3HdrA4qQ0/FCUpELoWZrxH/IaPc4eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(6512007)(66946007)(86362001)(186003)(8676002)(36756003)(2906002)(8936002)(4326008)(316002)(110136005)(1076003)(26005)(6666004)(107886003)(6486002)(966005)(5660300002)(52116002)(38350700002)(956004)(2616005)(66556008)(38100700002)(508600001)(66476007)(83380400001)(99710200001)(505234007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fKMippH9CT9HFNoMsCwqNkEPVrbfOn+D3vZlC/b3kovCCm5o6C0jfn8GOTnQ?=
 =?us-ascii?Q?0LldrHKXKVuNXmy+ewuMqDPYjm5VDCtMWSxsKBJDNlgNGI1ThKLss7zUHI4z?=
 =?us-ascii?Q?bJidLWpgbXiX1/CYQ444cGnuuR4hmA3ukNm4sBIXnZ6yj3d+ib3oo3oPkZ3A?=
 =?us-ascii?Q?5mnmNlEXSU+MDbc0uMCodiXNSnrVHOJvwWf4IZBBQPOq+MusyI9C6pxm0g75?=
 =?us-ascii?Q?QTsoPGW8Pru+j+AK1RqhkUIZEBmAC1988/utLW2JyCx4REDkNseiwYLRgavC?=
 =?us-ascii?Q?yPgkgoFT5U79Igr7x60KijE4CbEL0w720DqF8/bNMLVJiV5U2SWR2s6fV8Gm?=
 =?us-ascii?Q?Ll1h6d95+ub9TYV+aLArbBtR8ZeFck6bMkAmDnmLHenlusfwhVsv2pIJinRJ?=
 =?us-ascii?Q?P7Lt34rjg55/IFhoOXVY0AJc9thl7C4swCjAiNcQ2nE3rU7Zr0ArPufefVVB?=
 =?us-ascii?Q?/UuZ2BLSpVaSOH7am6ZBcbdCVtS2fwy2GDiYw8a1plVICWM4950uetCzcPtq?=
 =?us-ascii?Q?0oJ/J0EmeS942gyO/2S9F3BX6xXA8MQzb/zk5Obz7WBpHjEjv2PWYzvBnXKj?=
 =?us-ascii?Q?EU0pdht9aPCMZsXPIk352oxJOl2N2Fds094428RXUfkszKyKP43+G65cDqs2?=
 =?us-ascii?Q?sCZn4MAMpdrFVILx4l95Nz83iRi0rq66nU1fDE1evPjcMJ1ovxoH6Hw3hEZi?=
 =?us-ascii?Q?2TCECOlA8FFv18CSLUIWprzESCmmYzIs/HIWTGXuc0o2O3wUhrqmJJqXOqfP?=
 =?us-ascii?Q?woum6/tf05k/oY+xQCmlDHQdgfyV5ns7wbam4Ufr+cRNgG3p1yg//TLwHONe?=
 =?us-ascii?Q?d42rI9aJgPEO0V/WGSYPVISNV5M3DvFVSumtgY0oDgH6/EyE5HOn++7+N3jm?=
 =?us-ascii?Q?3bcEeM1NwweaKNs7VW5G7JEFGpb8hG9qeZGn4Yp/XsHocpe4cJhyyNAChP0b?=
 =?us-ascii?Q?dvVXBQ5F8sRKOQDDdZmOR8M42GAdlPFiUwMUQWyTL5/a3LyvZ+dVymTsqP+Q?=
 =?us-ascii?Q?zP0gspbMuO0ow4/+S5j7jdTMP09fYpIujFImU1S8PLJpO7aIvPLhYvvavtHF?=
 =?us-ascii?Q?BrRrCB8CctMtFlpkWGz0nuoH70OMI0DFeVVaJ3lRjhyoAH3hmq4KXzOfca4i?=
 =?us-ascii?Q?zwBHvV/GI049LM6Ktdp4KStFSR3jqBMfFBwxjoMTD61S/mBZY00H7JNksUpp?=
 =?us-ascii?Q?4EyNSQ+E2Zehb3BhuLGnieqxqUpgrjCyvMu5DojKjtTzucmYz4RhVILKh2uE?=
 =?us-ascii?Q?yLOzedAu81CTKEirHZMdjL7DZCWP4fA2QWgrYDGShUJTWmTKNBnGGAlF6mK1?=
 =?us-ascii?Q?ogz2+G7B4mkVRyNPCtQO6WBd+O2BQBufwZp+JcxqAsi5ZD7Pu3gKayiErEeR?=
 =?us-ascii?Q?9eZDrxi9VcnueFXN4H63qGb++/Q32W53DmczFRtTTTU4Zo5pglUZzXJIIvn1?=
 =?us-ascii?Q?sY8egyPLD9M=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944ffbc5-7172-4010-9543-08d995257b34
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 06:30:46.5576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11115066@vivo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2502
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

This patch try to fix memory leak reported by syzbot:
BUG: memory leak
unreferenced object 0xffff888127338180 (size 64):
  comm "syz-executor.6", pid 11434, jiffies 4294961165 (age 15.480s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 4a 0d 28 81 88 ff ff  .........J.(....
  backtrace:
    [<ffffffff825b2892>] kmalloc include/linux/slab.h:591 [inline]
    [<ffffffff825b2892>] drm_vma_node_allow+0x32/0x120 drivers/gpu/drm/drm_vma_manager.c:274
    [<ffffffff825983b7>] drm_gem_handle_create_tail+0x107/0x250 drivers/gpu/drm/drm_gem.c:390
    [<ffffffff826271bd>] vgem_gem_create drivers/gpu/drm/vgem/vgem_drv.c:203 [inline]
    [<ffffffff826271bd>] vgem_gem_dumb_create+0x8d/0x240 drivers/gpu/drm/vgem/vgem_drv.c:223
    [<ffffffff825c72f1>] drm_mode_create_dumb+0x121/0x150 drivers/gpu/drm/drm_dumb_buffers.c:96
    [<ffffffff82599660>] drm_ioctl_kernel+0xf0/0x160 drivers/gpu/drm/drm_ioctl.c:795
    [<ffffffff82599c7a>] drm_ioctl+0x2ea/0x4f0 drivers/gpu/drm/drm_ioctl.c:898
    [<ffffffff8158e45c>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff8158e45c>] __do_sys_ioctl fs/ioctl.c:1069 [inline]
    [<ffffffff8158e45c>] __se_sys_ioctl fs/ioctl.c:1055 [inline]
    [<ffffffff8158e45c>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:1055
    [<ffffffff843b6675>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff843b6675>] do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84400068>] entry_SYSCALL_64_after_hwframe+0x44/0xae
The link is:
https://syzkaller.appspot.com/bug?id=bd059c6ee8aee1d3af51cff3a2849b8c0027b822

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/drm_vma_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vma_manager.c b/drivers/gpu/drm/drm_vma_manager.c
index 7de37f8c68fd..870d5bc7f1fa 100644
--- a/drivers/gpu/drm/drm_vma_manager.c
+++ b/drivers/gpu/drm/drm_vma_manager.c
@@ -300,11 +300,11 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
 	new->vm_count = 1;
 	rb_link_node(&new->vm_rb, parent, iter);
 	rb_insert_color(&new->vm_rb, &node->vm_files);
-	new = NULL;
 
 unlock:
 	write_unlock(&node->vm_lock);
 	kfree(new);
+	new = NULL;
 	return ret;
 }
 EXPORT_SYMBOL(drm_vma_node_allow);
-- 
2.33.1

