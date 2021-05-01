Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333B3704C3
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA426F621;
	Sat,  1 May 2021 01:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C2E6F621;
 Sat,  1 May 2021 01:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+DiHdNcQgzvxCMi0c9d8vU29UpNZY4cFqUWP6W0iTPJPU/uXoAcaVU1RNoHUDl65cIznmAcQ/oB/N9uLfeCnOylVd3K+1U76kT4KmEIeAHYTmA3CqIu3+dO0Ope2+kzly5226VbxqfCyI/hOZXkTayp+i6BaAFRSy0MfjXLe1ooyttj6i5gzIn7Awkx3yKpOB0Ju8eEUMRmT1+BGnInf/lNSAq+UCknS7wx6OkGQVfRMpDxa09St63OFXjb02VGuDmAih9W8gKjcA/MnNfrHEVIhrYMgJaRdURZEJbjpW/TI2Yn6uJlYzQW4mpLAHo/FTZBeoux83w0UZFN6Nhv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In+qYMWsP5Vd8vY02PjeYxA4bphaUOxBsuGP0Kfs2b4=;
 b=KhrY8258BTXM+2lxWl7+nKsToxCaVfAqaaw9iB8b8qfHpP0vjwOng6TK7V7TRiJKsFf+jnyCUiA26o1VBLuk2YT6aftlAY+BdeOZIEWC++udVpmiYp4lfPzhBeexbbDooRhz+j9EdBOvMUu7OO9k2JjZi6+jcQwNIHNirn5wBQS8kDGNiem2jHdgj81UNEP8xnkN6rJOKgd7m02WRBE7xQaCCZPsCPOosDyTTAG62iTtZJ8UVmhH18xFjgdpGYOMZ4vzoM4qQlUwDLdVMalCvMWkCYWWQD4xHTniD0hXaHwoq5j16OwjM1RWi6N7NmFRQ4QMBEsrQVQayWo1JMsefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In+qYMWsP5Vd8vY02PjeYxA4bphaUOxBsuGP0Kfs2b4=;
 b=oKJQTdjAJtGvnfkyJIAMjmHVUtI+zVeRIhH2quU6SarGzRRKSXAyKb8nW8vkCPHo1Jcd4+wgIChrmoNKoH4HPHkr1pexSp4pH08McFA8zkiqF9s8I2HMo6O0qR4UO96G3qNsq/aLfbYzzFgF/Cd2LRxRTmFSODIuQ1L/8CWqOlQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:19 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 02/17] x86/configs: CRIU update debug rock defconfig
Date: Fri, 30 Apr 2021 21:57:37 -0400
Message-Id: <20210501015752.888-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29435bf7-11da-4162-da4c-08d90c4497b9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142C023BD92AB1A01E29171925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FbL+H24mCIU5LeR6o1UistdDhklj/0K8yNFp5KZFu61CEVaI8BnxbyXFC7rBSz1qxXFv3I+xpYMgXx+5KmrMr6GX6u/jSS8aZnkPCCq5r3Prza/h6PLrAygQ1jUrKSP9vkxaAdEw7bqsoAznFWoEs1OTtLt+J5t6kaove2KFKeqnNOgSJ/s1WLpxHoJXxRwfr6BvCuLxMSc9yaS7fp/25MLwx3TSxKhTtafNMW41TBq98CaxRJl7/Ofqv+vIMPIz1LuBCJCGKnK+7wTTSy+Ic2mMvWaTSo+HDWpldS18wwxwRm1jfQk7x4TyQPcrWaU4pBP52XdfdvkldEBMQI2E+Ei3jQD8jBkqfutAzPMmukjcVDF+sFFAZhacoCw36PkHBSfizdPupzgQ3wVmfAsvhTHdVYzLKThpGnPvXSkc47A/9V/Ur5oiEcTickqzfpSrWQOlM2Vt23IeLVEgpjcgtNFVDQEFZUinUCjx0sJOViZm44tMWLlhMypaoAVoiQyaTR2D2UrKnSBce0rSd+GvMIp+Lq0xeknM/Vzztwx4FjtAxhvAxOmfExqPJQO+pdd66DqXLLzVgbhxyMnHwPnPDmJFsYIayuw6WdEMR7RSiXuL88zgBhj9TjpT9+/Jok85yOMPFsJXXN5BOXUiK3iqRVWQ+XTJ4UWftPhPEbW0igOZQGPzbYWT56wcM/SC1r2/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(15650500001)(66556008)(6506007)(66574015)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ATNJQEA4FwEpTSMGQcWvoBb/Z8sD8xqA5eSOt88OoM7olliGoKcK9wM8kVW4?=
 =?us-ascii?Q?bRlqn/ba4ju8CjQTFgpzT2OcI+EJ6DNhS6XYlM7ksoA/rmooZZ1mTL27tMZv?=
 =?us-ascii?Q?kgBMGdAsVZikmg3HNlgQOBHL0epk2CAYpT+6rUtzaV0sa01Ev/fwsFR14Tdz?=
 =?us-ascii?Q?Gcv3/jRgwxsjGzueuP95vG0QvEcC28jRXRmzFIjhpo8V5LmyvPbEo2TGQ/jG?=
 =?us-ascii?Q?uVkisGRqsFcxSg7w3o5PI/X5Bm5xdw343sCA/5BerwjA9sy/Y6ZQ9PG6dO+W?=
 =?us-ascii?Q?f2ylpAnOY9yER4OGk9DxbKDJj/hcb7VcXdXUqQ55+UGZyy9izvQ6cloX3+OI?=
 =?us-ascii?Q?TTohKsN2zBonleiO5TSIoWd9ztnPfibNdRBV2qLuwu4BvPMvpvp3zt2XeClh?=
 =?us-ascii?Q?S8WfUFMesVcSPFxBVNlJu4SFA8vxVwwZxVxaunOlmw72jj1x8HOFKV4wz1ZN?=
 =?us-ascii?Q?65RsLU8D/GzhhauMTUSZsVTyGfpRHyidHTb6hpbpVUeGlL/UIRRC4iuJJ7MK?=
 =?us-ascii?Q?0IqlSTHAF1C2F8BfGK3S3xbPe0vur+nw2T9hncN+vJWSVS8RnMoAmM29NvVa?=
 =?us-ascii?Q?mGwGO7tL7ks0Y4dVsVX945OdSDIXg0owWDJot8jtRWre3pkJp3xwF2S3r8mi?=
 =?us-ascii?Q?B5Q4+n5IOwk4OlsSvee3HWWzkvhv3KHqoViT041IO/NdZ70PbPgHFndMbuXY?=
 =?us-ascii?Q?gGEJf3BRbYIeupyGrgnrvKsfPnrrPX2cHLNX3IMjV4B3cMFUhFiO1HKZq8sM?=
 =?us-ascii?Q?5Ol6TiDqRcTtXI7vtcdtJrSYH2P9RMPUv+vLDTOXqKv9t0FQD+8Aiy9Fh6c1?=
 =?us-ascii?Q?1ZOzVTNwvNa5QHlzLoMeCfvXQIOK2xoXqxGkig0OCPxAV40Nj4IOrLs4N4S7?=
 =?us-ascii?Q?yVF4/1w9VwAEJ/B+0X+JxyO2+zJZAtykqIZrZgXyjDGz5/9FGF+CxWiB9nX/?=
 =?us-ascii?Q?d6W3pvYj1JnGqfPQ5CQX/QU0713NmHbf+mIsk7ju+1b11HT5ONaaZPeV9gcZ?=
 =?us-ascii?Q?zdbCctnET04Hy17kkb3gzgFFZVAA6f8utQ18B8GcQt2BfL13P2RnWhSGKgto?=
 =?us-ascii?Q?izeOMbAXLX6XUnbBSpyQVg65MRCV1s50AyUR69w64edhE2fnonHBN12bBUJm?=
 =?us-ascii?Q?idBwY+l03DmZi86zTESgYBdC5necOz7Fg123bDn2tsLNg8/BSRKiU/Grfjj4?=
 =?us-ascii?Q?/sdPzUQv9ZlK9f6Nu1+apYABZtyEcwAAavmblWoPJj+bayeK15rj4Qfg6KMW?=
 =?us-ascii?Q?lyBpjNG80Z0+ul9zaRBR/XuPCJXnvBjkCBG/2oX6l5vozuDdDbIPEatLUP9M?=
 =?us-ascii?Q?A7zO5u5ykAN2h9qod2LjRSIe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29435bf7-11da-4162-da4c-08d90c4497b9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:19.4157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9T6LSRofrCwVPONYEzVQp6Qb2J48C5mF4VWADWcHUpx4ePhoCFrqlV+peqz7eiY2EHYnVYz9INbhBllkxMlIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

 - Update debug config for Checkpoint-Restore (CR) support
 - Also include necessary options for CR with docker containers.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Change-Id: Ie993f9b99553d46c48c60a5a1c054de0d923bc86
---
 arch/x86/configs/rock-dbg_defconfig | 53 ++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/arch/x86/configs/rock-dbg_defconfig b/arch/x86/configs/rock-dbg_defconfig
index 54688993d6e2..87951da7de6a 100644
--- a/arch/x86/configs/rock-dbg_defconfig
+++ b/arch/x86/configs/rock-dbg_defconfig
@@ -236,6 +236,7 @@ CONFIG_BPF_SYSCALL=y
 CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
 # CONFIG_BPF_PRELOAD is not set
 # CONFIG_USERFAULTFD is not set
+CONFIG_USERFAULTFD=y
 CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
 CONFIG_KCMP=y
 CONFIG_RSEQ=y
@@ -994,6 +995,11 @@ CONFIG_PACKET_DIAG=y
 CONFIG_UNIX=y
 CONFIG_UNIX_SCM=y
 CONFIG_UNIX_DIAG=y
+CONFIG_SMC_DIAG=y
+CONFIG_XDP_SOCKETS_DIAG=y
+CONFIG_INET_MPTCP_DIAG=y
+CONFIG_TIPC_DIAG=y
+CONFIG_VSOCKETS_DIAG=y
 # CONFIG_TLS is not set
 CONFIG_XFRM=y
 CONFIG_XFRM_ALGO=y
@@ -1031,15 +1037,17 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_NET_IPVTI is not set
 # CONFIG_NET_FOU is not set
 # CONFIG_NET_FOU_IP_TUNNELS is not set
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-CONFIG_INET_TUNNEL=y
-CONFIG_INET_DIAG=y
-CONFIG_INET_TCP_DIAG=y
-# CONFIG_INET_UDP_DIAG is not set
-# CONFIG_INET_RAW_DIAG is not set
-# CONFIG_INET_DIAG_DESTROY is not set
+CONFIG_INET_AH=m
+CONFIG_INET_ESP=m
+CONFIG_INET_IPCOMP=m
+CONFIG_INET_ESP_OFFLOAD=m
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_TUNNEL=m
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+CONFIG_INET_UDP_DIAG=m
+CONFIG_INET_RAW_DIAG=m
+CONFIG_INET_DIAG_DESTROY=y
 CONFIG_TCP_CONG_ADVANCED=y
 # CONFIG_TCP_CONG_BIC is not set
 CONFIG_TCP_CONG_CUBIC=y
@@ -1064,12 +1072,14 @@ CONFIG_TCP_MD5SIG=y
 CONFIG_IPV6=y
 # CONFIG_IPV6_ROUTER_PREF is not set
 # CONFIG_IPV6_OPTIMISTIC_DAD is not set
-CONFIG_INET6_AH=y
-CONFIG_INET6_ESP=y
-# CONFIG_INET6_ESP_OFFLOAD is not set
-# CONFIG_INET6_ESPINTCP is not set
-# CONFIG_INET6_IPCOMP is not set
-# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_ESP_OFFLOAD=m
+CONFIG_INET6_IPCOMP=m
+CONFIG_IPV6_MIP6=m
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET_DCCP_DIAG=m
+CONFIG_INET_SCTP_DIAG=m
 # CONFIG_IPV6_ILA is not set
 # CONFIG_IPV6_VTI is not set
 CONFIG_IPV6_SIT=y
@@ -1126,8 +1136,13 @@ CONFIG_NF_CT_PROTO_UDPLITE=y
 # CONFIG_NF_CONNTRACK_SANE is not set
 # CONFIG_NF_CONNTRACK_SIP is not set
 # CONFIG_NF_CONNTRACK_TFTP is not set
-# CONFIG_NF_CT_NETLINK is not set
-# CONFIG_NF_CT_NETLINK_TIMEOUT is not set
+CONFIG_COMPAT_NETLINK_MESSAGES=y
+CONFIG_NF_CT_NETLINK=m
+CONFIG_NF_CT_NETLINK_TIMEOUT=m
+CONFIG_NF_CT_NETLINK_HELPER=m
+CONFIG_NETFILTER_NETLINK_GLUE_CT=y
+CONFIG_SCSI_NETLINK=y
+CONFIG_QUOTA_NETLINK_INTERFACE=y
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_REDIRECT=y
 CONFIG_NF_NAT_MASQUERADE=y
@@ -1971,7 +1986,7 @@ CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_NETPOLL=y
 CONFIG_NET_POLL_CONTROLLER=y
 # CONFIG_RIONET is not set
-# CONFIG_TUN is not set
+CONFIG_TUN=y
 # CONFIG_TUN_VNET_CROSS_LE is not set
 CONFIG_VETH=y
 # CONFIG_NLMON is not set
@@ -3955,7 +3970,7 @@ CONFIG_MANDATORY_FILE_LOCKING=y
 CONFIG_FSNOTIFY=y
 CONFIG_DNOTIFY=y
 CONFIG_INOTIFY_USER=y
-# CONFIG_FANOTIFY is not set
+CONFIG_FANOTIFY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 # CONFIG_PRINT_QUOTA_WARNING is not set
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
