Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFwFO0CMpGlfkAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949101D123D
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306E110E05E;
	Sun,  1 Mar 2026 18:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ARO8Memm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5110E05E;
 Sun,  1 Mar 2026 18:58:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWixivLCp5MwlIC9mhcll0NMlknsFk5QOgAFBI9cuJzsL5zQlhwpWT6X0pM6Azl4SDO6U7pvfhLd6gCky978JAwfIDZEjfNflo4oMl02vY2wclLMc7L7bdpObTgT7S4HcK1vNzOm0AnznV0ocNk27qI4cW9WkjkvA6wd6cK/cQtIBrWsrD5IX+PjeERfpLdcHQRhxTmebW1r6W+bLjm5fmxUwo4QnVSLZGW8XhqbZshUyIXXjIBIPDzDnfv9IiorJSY56+FRLM3CdhFBfcmKeWTO75il0tOkye66Y9Awxy1peMdhgT+ssfJO6CKhIgzq9fE4fKcLwdx3V/nEo283Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGiIcbQX5FyihE+lGo37eKSzG2FvcKPu5KIVRU2o7NE=;
 b=olbT5RFFKTFpvjz/HwSTJlKtNK3XW5lHve7PP87j6quQOrw/Bto0881JxvHDWkutGmfISuTqRn/GH6YRgcZNpA3/gMmasnOCZHt15X1AR7gRizpZm7OAoLbrmCmi/RSTXWJGO4OhWtlfJk4eJmVOakb6Ot+yHPvL80pJIjQqw/iu6H6LnhI3djTjV+QYNbmWwfGAui5bAtIc0g/KBp6K9Eu64pqpM86tIW5gBaGJ+DQWkQrpriyHGaXeam9moJhgv6soxZGUJZMkw3w21orEvqOPCdahPMkEh4cZ9pVte6EVIOQbCdmWG8Id/pSBLzsb0060Uwq2P1ykhsyiPbDDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGiIcbQX5FyihE+lGo37eKSzG2FvcKPu5KIVRU2o7NE=;
 b=ARO8Memm3k7WXyNqyJF0k3sndsuGt3vD6Mv2amQ6s6ofHf/vRRv3cmYi1aS2F7X5FKX9A5dBfz2CjTk/O+h/+d1JRPUcDQkV1NUZLR8bx68LYDxAZlfGm7Jbluf2xOo0YaGGTxt0aSMv0uCytbgdW0TL1TpAMZMOMmMutyhSB86EgiEGUYOk9FLrFexs/okIOZq9GrJU+q/0A2ysVHdkThoR3jG40Ik3yW1cEA3MrtjGxp+Zf3B7b45UUq2bjWwEAZdksLsDLBoMHL4GtiXKnzBo6Aek61hso8qeZh/oohnzQdJaVM3rCfegY9719rLgC2do67/SYq8gr+HE0zOI9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 18:57:59 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 18:57:59 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: patches@lists.linux.dev
Subject: [PATCH 0/5] Replace the dmabuf custom test framework with kunit
Date: Sun,  1 Mar 2026 14:57:52 -0400
Message-ID: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:208:32f::28) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: b89fa751-23c9-45d0-7932-08de77c474a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: /6QwwSprA6zZTNdv028IXQDMPd1ydXMxamDF1vyxpc0dYnTJpOwQwqXqeqZTst1pzun/MsbHZkvPJbfoPIwUoMi+SDZ+U1TC2sZhffepSRqObFKqs2nahhRqF6HlIzaHqyZUef2qLBbSJh8ytZGwtAujVHTvkwiThQeI3txed34sDedQQjrNQA54tit6doKAQ6ZocDKpR7T3VbJ5CnrzNnWwsa0Go8r4KKLtChBzHR8imgiaqyNgvGaChsYrXR8I2587NaaXj43Z0iT/jMKocr3ECXp1TTy8xT8p1oW8XAQc3S4Fe52nMkeH5/X4E3TATeKD1IvZo9XhN5dcrTvgOYOfQPWAwCcC58vEfwEYNBHECavsbODUmqmSg1Z5NYLZOGv71qN7VNveXEEyeVPnTBsU7f3iBMi6Mk5mTsGKA1cZiwoSDUSGBsyQo02HqIZlRe5PGjMW/LvOQVEntXJrhvaq5xeg0zl0wzZqvxttVaHwZ0YoPJaE6ZG9LIsZnP8uJQakGDcc9R+lZa2EUFKcH9O18Xr/nBWip91VIBrSDugIp1CL+Kar/j6DtBCy5odIK61+w+yrAuV/BZruEL7GE7g4cZifMNOXCPtX0C6r99+OSSsVv+fv1Qc2CudAaPjxnTckXCMf+HTReOVf5pbwRwMPzB+Z1PO8qHUj0+/lEKBxMZk8Q090W2GTllHi9ayjCScvytCayvWy45nYyNmxKcIv5ElF5ZQCVPmT+rji0s9bj7QAa++TJ2IXnc6m+oQm/x/oynIsmGuahNcW1NdXZ8s2sPsax+286xPotYdszoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mdecMoy4F424oCSrEtHQ2QT8usDraNv0HA0DU6KeZEJfkAb3A+eTv/IgsVxw?=
 =?us-ascii?Q?/WQlJN+FulAJqZF2D+cZ1GFrt6yPfb93e32mHwauAox5alcviCx/6wI+t+lj?=
 =?us-ascii?Q?rh+ZgCDAOybyUtFSh4HL3UU3r8dQPkLVdhWwwfuCmNgrgCP/sevI6cx7g38l?=
 =?us-ascii?Q?JKp2O4VWuvwwH5kMjFN11xFHXnm9Ce35kYHwdaJaVExQ2YhzZbArpBZZ9zhc?=
 =?us-ascii?Q?Nn6p4ZtAsEUFHNkm1g3ebVeBj6oEeX6w8bAFYMBYNOgIkz75kWTbpZN6Lik4?=
 =?us-ascii?Q?tHkuS8PQPoP0C4EWSV3T4WRJZ51uvhjinrAIabpiy0lbQhdSlie2vsh2SVAT?=
 =?us-ascii?Q?0dYLR2Ir6FBhC9Jl0tNGVLhWcs6hQlmLmgI6NVgUXMdumCH6v+syTI6IkOlJ?=
 =?us-ascii?Q?oW1TMZU2PROkVRiOH20YQ/ygxmzE9noKYNF/x/Udt2lTJorBb0sOV/UOlYyr?=
 =?us-ascii?Q?cmwbmdoyio0cnkOhBowI9qIzhIp/g3nPCIXVJhZk/Sxi9KAAnV5+tM79VoOH?=
 =?us-ascii?Q?IAxmPl/Uws9vOuSm8KQnmi4bfLUcvjRFznxYLjSQxePDmr1MBIh/K3YEdFWE?=
 =?us-ascii?Q?hWP6NJRxCRNU9AQSqAEdniZNyrmZGRLMks1zB9H22hb3danI+ZfHYVddMdqW?=
 =?us-ascii?Q?P70vpNKf3mPD3w0+mPLGqkbmVB38wYg+xhhNZ7/jM5BTKRgfzloRzPjUBGFT?=
 =?us-ascii?Q?zXC/Lhevu9uBBPiWECoakk+6D5mo/ILYXM3j95t/ySSeklgLO/tehIKAF8rb?=
 =?us-ascii?Q?FlH6VWeBnDtENgMr8wM3PfQueI/dGB5XW/DEfu1u63v4/iPrL98dS7HhPRnp?=
 =?us-ascii?Q?CP/3FYVYyUaBah0uuPTcqeNAaR7YUCERXmUCTZkeSbdKIH1HRE1UT8i6P7S9?=
 =?us-ascii?Q?0ZTmigUoWx4+cRa3uEKe8giWlYO+VAKDCB/4bfqsLg/QvBIquomXnNV4qEOD?=
 =?us-ascii?Q?tB4dpPm5WFIT0aKbdM9KNV37e8n32FStccYTz31tuQnTs9UswkJe3NoUKCuW?=
 =?us-ascii?Q?j4TdXsR+eh0P0Y7Vm8Rzx63Q7DQkUmmlRTrzt/AlDopYe/52o7WRsYFp99ic?=
 =?us-ascii?Q?KuX/I9j/2rJy0uOAFiUbWgVtcC+60ZmidX+8wkl0gaP82O11ZnEuWp3n6hPH?=
 =?us-ascii?Q?zbXv64A9HJ5auswrlc+vbqiMgODe4tVVEhHrF90xG4CpZw2hR8ZuTpG00VAZ?=
 =?us-ascii?Q?bWGHr3TeEsTYfng0lOG4voBiSgXC3N4VJH4yD/cZzRqwAS+kEJkM/vm0jncK?=
 =?us-ascii?Q?J+WSekzlMwOCZbpqxKHsjH2BRZQK6Sb7qU/rPg/fT0qMd6Di9XlvSLK/t7Eu?=
 =?us-ascii?Q?V2C1++TI62Cc8TIhNZQH4zafamAxAIaVYit6ylTG0LcHgc4lM5DQNvpxtwCG?=
 =?us-ascii?Q?f+oTG4ifcK5HbUzyjZf+xdMSEbJiJ3fxzoven3PAX6P7KFdlX06+qLmsBuh/?=
 =?us-ascii?Q?lNdQcPWDqROByGgllXDNLfSPJrZEn9KtElHYOT3Mlzs/hsRVh1DMbC69922a?=
 =?us-ascii?Q?WwlqJ9TsDP9NG+L7htoV/M0Z9wtkCPYn4pix7eS9umccb8fjo3CgqleZVOhy?=
 =?us-ascii?Q?WQwCsdEPy1tv90xu/nKsPwiJOGqObpzw9Gx1+v9AUTyhTQ3nMdHxA19JlZcA?=
 =?us-ascii?Q?kxhcuSbGOEZCgTfhnuRTs+Y1cqwnIdxQ+2/409nHBG5mIeFYEAxjwm/+RWlL?=
 =?us-ascii?Q?ZXZrp/gpi41xatyawjyN9kHTj+OoQWl6r25aLLgYmEBIh1Fc1wMtA7MxAWcJ?=
 =?us-ascii?Q?qONwTdUKDg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89fa751-23c9-45d0-7932-08de77c474a9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 18:57:59.1118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7AdgP9tvuvSu53FGaY6h+pdNgOAjFgGY7q1EaCcML6s6dbYMH798l7eUJVRtPTg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 949101D123D
X-Rspamd-Action: no action

Using kunit to write tests for new work on dmabuf is coming up:

https://lore.kernel.org/all/26-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/

Replace the custom test framework with kunit to avoid maintaining two
concurrent test frameworks.

The conversion minimizes code changes and uses simple pattern-oriented
reworks to reduce the chance of breaking any tests. Aside from adding the
kunit_test_suite() boilerplate, the conversion follows a number of
patterns:

Test failures without cleanup. For example:
   if (!ptr)
       return -ENOMEM;
Becomes:
   KUNIT_ASSERT_NOT_NULL(test, ptr);

In kunit ASSERT longjumps out of the test.

Check for error, fail and cleanup:
   if (err) {
       pr_err("msg\n");
       goto cleanup;
   }
Becomes:
   if (err) {
       KUNIT_FAIL(test, "msg");
       goto cleanup;
   }
Preserve the existing failure messages and cleanup code.

Cases where the test returns err but prints no message:
   if (err)
       goto cleanup;
Becomes:
   if (err) {
       KUNIT_FAIL(test, "msg");
       goto cleanup;
   }
Use KUNIT_FAIL to retain the 'cleanup on err' behavior.

Overall, the conversion is straightforward.

The result can be run with kunit.py:

    $ tools/testing/kunit/kunit.py run --build_dir build_kunit_x86_64 --arch x86_64 --kunitconfig ./drivers/dma-buf/.kunitconfig
    [20:37:23] Configuring KUnit Kernel ...
    [20:37:23] Building KUnit Kernel ...
    Populating config with:
    $ make ARCH=x86_64 O=build_kunit_x86_64 olddefconfig
    Building with:
    $ make all compile_commands.json scripts_gdb ARCH=x86_64 O=build_kunit_x86_64 --jobs=20
    [20:37:29] Starting KUnit Kernel (1/1)...
    [20:37:29] ============================================================
    Running tests with:
    $ qemu-system-x86_64 -nodefaults -m 1024 -kernel build_kunit_x86_64/arch/x86/boot/bzImage -append 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -bios qboot.rom
    [20:37:30] ================ dma-buf-resv (5 subtests) =================
    [20:37:30] [PASSED] test_sanitycheck
    [20:37:30] ===================== test_signaling  ======================
    [20:37:30] [PASSED] kernel
    [20:37:30] [PASSED] write
    [20:37:30] [PASSED] read
    [20:37:30] [PASSED] bookkeep
    [20:37:30] ================= [PASSED] test_signaling ==================
    ...
    [20:37:35] Testing complete. Ran 50 tests: passed: 49, skipped: 1
    [20:37:35] Elapsed time: 12.635s total, 0.001s configuring, 6.551s building, 6.017s running

One test that requires two CPUs is skipped since the default VM has a
single CPU and cannot run the test.

All other usual ways to run kunit work as well, and all tests are placed
in a module to provide more options for how they are run.

AI was used to do the large scale semantic search and replaces described
above, then everything was hand checked. AI also deduced the issue with
test_race_signal_callback() in a couple of seconds from the kunit
crash (!!), again was hand checked though I am not so familiar with this
test to be fully certain this is the best answer.

Jason Gunthorpe (5):
  dma-buf: Change st-dma-resv.c to use kunit
  dma-buf: Change st-dma-fence.c to use kunit
  dma-buf: Change st-dma-fence-unwrap.c to use kunit
  dma-buf: Change st-dma-fence-chain.c to use kunit
  dma-buf: Remove the old selftest

 drivers/dma-buf/.kunitconfig          |   2 +
 drivers/dma-buf/Kconfig               |  11 +-
 drivers/dma-buf/Makefile              |   5 +-
 drivers/dma-buf/selftest.c            | 167 ---------------
 drivers/dma-buf/selftest.h            |  30 ---
 drivers/dma-buf/selftests.h           |  16 --
 drivers/dma-buf/st-dma-fence-chain.c  | 217 +++++++++----------
 drivers/dma-buf/st-dma-fence-unwrap.c | 290 +++++++++++---------------
 drivers/dma-buf/st-dma-fence.c        | 200 ++++++++----------
 drivers/dma-buf/st-dma-resv.c         | 145 +++++++------
 drivers/gpu/drm/i915/Kconfig.debug    |   2 +-
 11 files changed, 394 insertions(+), 691 deletions(-)
 create mode 100644 drivers/dma-buf/.kunitconfig
 delete mode 100644 drivers/dma-buf/selftest.c
 delete mode 100644 drivers/dma-buf/selftest.h
 delete mode 100644 drivers/dma-buf/selftests.h


base-commit: 41dae5ac5e157b0bb260f381eb3df2f4a4610205
-- 
2.43.0

