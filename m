Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A952A3DB9A3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 15:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365216F441;
	Fri, 30 Jul 2021 13:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592D26F441;
 Fri, 30 Jul 2021 13:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQB+k+f+j5LoMHI2Ac0MUhpkGSCGe97ZetHhQSYJCHJK3MgwllNQrEKJ0KGf0u7NXggiyRq5+Tcx3ed97XqvmvT1fmdm2h9IdpLt3K+1F6hkoyDoIr9SNpkLXKl6Y5UXPPbf2DdTEB3TZAwU9TNSmZQikmN5AaRWbLxlqDn4HTgH5GBW51k4KAIXQwNOZEUwV6R56RcV2M50XXBZQokKbXqv/IpMJFSMLxeeMp6Qc5umeyLqKxxBWrgjYBCOClE6wZaihXC9EdJWjyKpXU2pXzZPw5d0Ri8AftXrERaTn07aPfC4iVMCfGqR9vyPjXr2wXsby5jeAM8938KfF1H65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr4xyUQ4RgK0Qhp4G5PIvmkXTjHt06QmQPR8cA/O4PQ=;
 b=I/rtl/D+qtUWVwyCiHfB+ezz+W4aM6jS3EJKBKzuJcTRnprJtWSNyuae/p05y1slRFEOYrZBnC98GRW+Uhs5Qajg/9bEPFT1Em20+8+/UsOiz3Paa22OmfI1bPKPvdc9vm/IPsUA/FVLu12vjinARVBl0tuaR48ZIP6geVOEaqd8qo/g59FGs2+3cqyXg5ALNAepgm+xI0U/B9KEP0wc8d4yKDN+pfpT5Ax5/+wONpaqqs5pxubG0Ba6c/DafxQ5zDEyG5a98UGACjxm21q3NEazorpDkfE6KugzL8s2YGNzHM5ihAXXslhtbc/V+U4MzK/XnzdlkbceeyIDYSEs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr4xyUQ4RgK0Qhp4G5PIvmkXTjHt06QmQPR8cA/O4PQ=;
 b=IMHyOmvmE8L2G5ytn5F7kC8UC/dSgjUA5MhPzS2DWtIbFMUF6Q+IiCEXMhkMjsuqIhwoIQth9/q0szv4cv/9yrUrWtBbmR6GucFvvAa9iedmrdKTzFpuzKWEKJgYTEkdV45Vk/LnpQUXQBNUxGO+R5wUAmAEQSdsPjIterAqUso=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5077.namprd12.prod.outlook.com (2603:10b6:208:310::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 13:52:34 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 13:52:34 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 xorg-announce@lists.x.org
Subject: [ANNOUNCE] xf86-video-amdgpu 21.0.0
Date: Fri, 30 Jul 2021 09:52:19 -0400
Message-Id: <20210730135219.38441-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:208:32e::34) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BLAPR03CA0149.namprd03.prod.outlook.com (2603:10b6:208:32e::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 13:52:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e271957-8d2b-4f4c-1676-08d95361484b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5077:
X-Microsoft-Antispam-PRVS: <BL1PR12MB50775F16676415CD743A6CBEF7EC9@BL1PR12MB5077.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsrRMKq6pI+BkEhK2r+lNDUhLHbOr7ItHpM2+O9R17ibQZn8Gj10ocxMuEMSslEdzK+JoD03XDj0lnd8EBxmJ2Kp0i2XQQyPQd3qn+249CtBfiPPCzlFtc6qe6J9wh98cQTa6UC2GhFOe8noEGZZ2cwSWsvShsCYuxvUkvpS3R+5wQ3InJR595SqsKGQpUnC9FzpyRnJj2WT50J8+oN1LpDtEi5PrqW1SxG+xItkBzqEhhOYkJO8ZE+zFyNLm6Iu376/wv6WFfvcBuQLggaATdFsBJLYkPLdLjf3XldCTFxG8/BJ9KIqIJvuAGneevbhdPLPKNbpHl6JLdgSsJ9xC9IPTkm21aNckzYa3ABO5qGOQn2CApNR0m6xEdBklUQ3g5+/H3cUIvfPhZDD0A8UZWLXtY63YzIu+hbItzKARThl77KInYdY5H4j1tJBV4exPdK63YgdzvMRe83T6ZisFteN7xZ3VeR5JxTAs21bwA0SxdEPZ0WOScNcpgFvF1U+jqAxc7OL5m5Iam3Qudl6TQw4oADMcLybv5JmCznRe5yBz8CaRU2z5Fe7F+MG/4osFSoh/W7ig0f1ftKXqD+5CMe4HqJ2Y/0//w9A4ISeDv6zxz5/QV+HREI2pbMxR/Mg3UZCvZeYOqaXPIe3UIxaJ2Oj6Nt0OPb1B/oltPAvHs901vlKdpFJ0eWIN2KLR3EIL6bC4llu6PxX9R1q1/eqaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(66476007)(52116002)(66574015)(1076003)(66946007)(6506007)(83380400001)(86362001)(316002)(6486002)(6512007)(2906002)(66556008)(6666004)(26005)(186003)(8936002)(2616005)(956004)(4326008)(36756003)(966005)(38100700002)(8676002)(478600001)(5660300002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NoWnlnMThKeHpiNjFhQ3lUdUk4eHMwczBLNmx2MjZUY0ZRMDkxY0lCenhV?=
 =?utf-8?B?WDBlVHlzWG51azlST1hKVURZNG95eE45TE5FZWZxMHhzSm1jb1pZOS9zVG03?=
 =?utf-8?B?M09kU05ZdDVuSmFFZVphbDlsTFNUemlTd05PUXdhWTI0Ukk3V3ZRNUgrWTZG?=
 =?utf-8?B?cHNpQXRCbXVvYWpNM3Zsd3FhM3hRRjBva2p4VkFtRXJKVDFTbFN3R2dYbDRH?=
 =?utf-8?B?bXZydXhoak5UdWhCTmtBRjhxZE9QRnpmSENYRnFIMk9LejNldlNmRGMzenJa?=
 =?utf-8?B?ZkswNitSb2RGY2hDTjZ6em1KSjIwdXBRTTVaOTBTUUdpajN4RE1EZnZGbVBz?=
 =?utf-8?B?Umh0eGZ3U3liRVkxTTdzOG5oUlI1S2ZadTZaV2dIcnFockFPVVBUYy9ZVjFQ?=
 =?utf-8?B?Z1RuZlgxTVBVc1lJWlJTei9YZk41UGg5QVhVZ2kyViszL2czd3hDdWpiSkVl?=
 =?utf-8?B?R0R4aGZ4ak4rbDBGK3lCYVRPcmJWcmlIcitSU3EzK2UwUS9QRXpGZFpWazlP?=
 =?utf-8?B?a21IUHU1VDRTNlVOUVhNektnZGFEc0RaU1pjQmw0azJBRXV4S25JZW1Ta0d3?=
 =?utf-8?B?Q2NVc2dsVGVoS0hxcjh2MEYrUXE2c2tnZEMwNEY0cGttZXVEaXFOV0ZCUmtD?=
 =?utf-8?B?QUVISThka05vRjZNYXFtcnorSiszeWxPTWkwN3NBemF1WkRuV1NiaEhZZ2hr?=
 =?utf-8?B?RVRPbjlDa2tZOTRWWlVGQXN6cUdlSWZwL1pIZjR4Z0NnVE1DSTBkRmZlN0Zj?=
 =?utf-8?B?YzR5Z0F4K3ZlQWtvR1hOOE04WnJqamZ0TGN3TVlIdWNGSHBJWTNkZFBpOHVX?=
 =?utf-8?B?eDN5NkFWc0N6NG04T1BPQjZZR1VaRnpjN1crb3FaQ3lMc1A5U1BMcnJKY1Y4?=
 =?utf-8?B?a2lZQWJPd09nT1JzUUtzOUs4Y0RyR1VOUStSVjl0UmxtUlI0eVdaMy9FTlln?=
 =?utf-8?B?NFFSMUt4cVYxcjA2MWx2V21URVJmcU1tMnNOMEVBSWlIdUd1SDZJYVlTT3R0?=
 =?utf-8?B?S3o1M0RKcGluWlU5V3d5cVNZditaaHJVNXZ0dk5QbWwyczRSVy9RalZ1YW1i?=
 =?utf-8?B?dFB3SmQvc0hSdjNoS21uZE1PcDUwNHc2aE5OalViSGx5VUpVUUM2L3BtMmYx?=
 =?utf-8?B?SStBQlBteHdqMzJ4WlNEbTFDbWR0LzM4Q2ZZSFlzRmNYL09wTzZtbjBoSU9o?=
 =?utf-8?B?TVJxL3BKdTY0enlmdWlGZXlrVkYwb3lMSWFOT3liR0ZySE0xWUFmOXZrL3h1?=
 =?utf-8?B?akZoNzV3WSt3UDNURStVUzVlcks2ZkVxZDdUQUxSc3RacHlwN2dEMy9YQUxH?=
 =?utf-8?B?dElqU29DaUlYTE9aUnQyUEROVzI5SW1vVFZMbklsZHhPcVJLQUNmWFVtdmR5?=
 =?utf-8?B?NFFVTmJiVy9EcnZCZUo1OGlmM245SFJqMWpubVVTdTJQRmNINHJhUkNvK1Rr?=
 =?utf-8?B?RDg3RWFhbWUzam9zVGtocnBINU4xWS8rQ29qUkV6Si9ydFhvN0NUWmp0SXNq?=
 =?utf-8?B?VUdFMEJuTlBCbWxGalFYYUhQTjJEZHVYL2FxNVYxYzkyeFdIUW9sdHRHcUpx?=
 =?utf-8?B?cmtPUmtoRWFPOENoWXhLWERhbTl2YU54c25yRTM2dDdQVGhEUzV4QjByeHVz?=
 =?utf-8?B?N054c09OOGV5eFJ5UjhxNnRObkpDdmlkaHNxdlN5S1E3TGgvZnF2c2p1Mk81?=
 =?utf-8?B?b3ZCZk83WlB5OUUrRVdVZmZLeXN3OENxNUpmeDVWRSs0U0l1QlVFbHQrYkxy?=
 =?utf-8?Q?R2PfdM//ToFGgWWXsIxrfredYRHovo+q12tg72c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e271957-8d2b-4f4c-1676-08d95361484b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 13:52:34.1122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7ReQN/UvAqb/jiieC1rNs3GmcKHEJNYEJU/4GcKkHTn9ar7HWgyLhgDT6OyAUVXB0oddkEghOlxW+/i+oRSHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5077
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
Cc: xorg@lists.x.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Adam Jackson (2):
      kms: Handle changes to SourceValidate call chain in xserver 19
      Fix link failure with gcc 10

Alex Deucher (1):
      Bump version for the 21.0.0 release

Emil Velikov (10):
      Use ODEV_ATTRIB_PATH where possible for the device node.
      Remove drmCheckModesettingSupported and kernel module loading, on Linux
      Fixup the amdgpu_bus_id() string format
      Remove NULL check after a "cannot fail" function
      Store the busid string in AMDGPUEnt
      Reuse the existing busid string
      Use the device_id straight from gpu_info
      Kill off drmOpen/Close/drmSetInterfaceVersion in favour of drmDevices
      Introduce amdgpu_device_setup helper
      Factor out common code to amdgpu_probe()

Likun Gao (1):
      Fix drmmode_crtc_scanout_create logic

Michel Dänzer (11):
      Bail from amdgpu_pixmap_get_handle with ShadowFB
      Handle NULL fb_ptr in pixmap_get_fb
      glamor: Make pixmap scanout compatible if its dimensions are
      Drop bo/width/height members from struct drmmode_scanout
      Drop struct drmmode_scanout altogether in favour of PixmapPtrs
      Make drmmode_crtc_scanout_create/destroy static
      Fix build against ABI_VIDEODRV_VERSION 25.2
      Replace a few more instances of "master"
      Check for AMDGPU_CREATE_PIXMAP_SCANOUT in amdgpu_glamor_create_pixmap
      Drop dri.h includes
      Include xf86drm.h instead of sarea.h

Niclas Zeising (1):
      Fix return value check of drmIoctl()

Peter Hutterer (1):
      gitlab CI: update to use the latest CI templates

git tag: xf86-video-amdgpu-21.0.0

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-21.0.0.tar.bz2
SHA256: 607823034defba6152050e5eb1c4df94b38819ef764291abadd81b620bc2ad88  xf86-video-amdgpu-21.0.0.tar.bz2
SHA512: 44ccc8ddc36f09d1608cf58b6cf85dda090671c46c5643e9453f7d67f4d6850c3c9753eba43539d45773198b8042898a50153b5225780e4b2852410c5521314a  xf86-video-amdgpu-21.0.0.tar.bz2
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-21.0.0.tar.bz2.sig

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-21.0.0.tar.gz
SHA256: c3df02cc280c120d07eac01559b1e2c09890546f5044d4853209e5eff71a2f7e  xf86-video-amdgpu-21.0.0.tar.gz
SHA512: c744ff096695b3d80f4dc3977f0952284e890fd72ed635a04c57806747621c32686f5982cf127de47f5895d73d7b52791a27d8eef4034e2e79547b3c8a6ee8c1  xf86-video-amdgpu-21.0.0.tar.gz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-21.0.0.tar.gz.sig

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQBfpGodcujISWDgPGbTuT5hHTeQAUCYQQDWgAKCRCbTuT5hHTe
QHXKAKDIw5l0TpJ8gPvB9tw50WCp2WktpgCgpuhzs+UfUrZZ76OOzRWClz0CbpA=
=0H9K
-----END PGP SIGNATURE-----
