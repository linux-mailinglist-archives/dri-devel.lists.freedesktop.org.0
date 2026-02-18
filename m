Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK5AJeYDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474141521C9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB68210E54C;
	Wed, 18 Feb 2026 00:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HGAQ71Nm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC3F10E2C1;
 Wed, 18 Feb 2026 00:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRuXTpowU325I6aHidq0+5VL4c7MhNpx3Ft494pxvgjLR4rO7KhMZ4T3wlT2O9VuXcy2VMOHednbHS6voBIMF/yewIhly10YciLtHWuaoyky2K9m4yY8OvcXw6woCAARaUyyIZZURsUCqAxuIWKjM7nvgRldHRNqWfZz7vvFSLvGzEdI9vSLAbHf5r3sIEcOQwA4TRkcePRSIT3Y0f53PPbgsSXfrzuE6w4HCbLvpBA+mKaTJJKgcf+KZhdVpYOp2DURyKIvBVlFymelvufsOR+9X/t/wVuLUvgU0H8AC3YIDZNTLxEL0wo3iWxZuP9P2IaGbko8hphkH6SD7vcDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itUYym2ovXT+DG6afKb0oF612w9PvR+OFrY1R3Y4e1w=;
 b=jB563RqqlnILv3nZYCxfec4L6uzYKWC+m/pNV6WN9+Fg/d2B1BgKMPryTKBmC5Dtuhh/M3+fynKV5JYU8VZlf1D7Fb5dSWbTX285lphW3GD6irWMQ1m76ycU7DjEULM5lRjUvhxHQyKPZUM/gZ2k+z9alfPVrB8myArLIdBKT0Bmzlx5t+o9q0isDM85OJzoHDz4+bdb/TlenFH8+rYpnxRcJfhWGrmuHBTGrnWqxVr+NEFv2U0nBYUmoa3+VR6V38gVwqrXJZrc/+TWE1P/E5FKqcmHXTjSbPkIpCshtCUzSjRISYOhwOuXce041a5hgcktH+hZoI+l3U7W1F3o9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itUYym2ovXT+DG6afKb0oF612w9PvR+OFrY1R3Y4e1w=;
 b=HGAQ71NmXlYcFUyVHClGBrKD6MiiOZYOykJMXc3UI76k3pYcsHQU6hlJMAXq/wL11Kn8Qfn/CSsZmyPtDR+b85ZV/UdA5IcClajcdPlkjuPMmEHKOECzU+FgdXdbuKXs2n+IVYlC17f7L9/Fue9nFu2Tr2q3uwz/lkybkwhzaUnqhInrs4+xsL82pX8zhgesRm5AXVajFI0ZKQ+WRzrDudMsiWOC2Aodd3h1GR57xyZCIo6VGGXEUoecY6sy1fvXd8U6Kn3jgpKmN02H+1J8VB01SbLLCwWGpnI8oVY1wsfLMsnljdEZtFDcnAkGkQlTh2vyuQMlF9PgAmmS3zM4LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:02 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 26/26] dma-buf: Add kunit tests for mapping type
Date: Tue, 17 Feb 2026 20:11:57 -0400
Message-ID: <26-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::32) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: dfaeef1e-59c7-4b37-4fd3-08de6e8255b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oUZd8tXaFXddOJjRrh/YVYfQMtxiAWiu5ULfRhDvZmpCbkWHEDr3f2IvVNwm?=
 =?us-ascii?Q?Q0bAste815ai64D4cr6zBba56MRufNz7N/XQBcArGxxQdBx1yVBRpWB3rF36?=
 =?us-ascii?Q?bOXRu0Qxn8BsjVfOabcWwSF+UjLkAHxxbDap7tWEUuPNBYE8i9a8tacyZSpC?=
 =?us-ascii?Q?bVeAMG1Ccnyqqm1GjNyBHbwrdYt9QaiICTfM42j28AIRcWqX5lWTnvB+na7a?=
 =?us-ascii?Q?HQ1KoVZDmRvvPMpnBsag1Iwv5FB3RS+7w4RoTbKSaGo923TUhuPfurM8q6ft?=
 =?us-ascii?Q?ZcBuKMbiODIB0lF62O7AQN79WUVLJTynYQJG8s1IjNuiLKc+TjeWlG+rzCPE?=
 =?us-ascii?Q?17ho6nxqJh8bvssiTrUeQjBYpmD2WeVVvC66iAVOXPxuV/gJUV9y/M/XRZW6?=
 =?us-ascii?Q?NqWocgeoDjWKqwrgG2U7XzZmud/e67t1+oQ8igDsXFwlKzPz+w4ceRawfJ8k?=
 =?us-ascii?Q?bCHNbcUcib+193aD4zvr8wUXEqQ76FI6xOj7JxIzGGcn7gQ5NeKiMRFOZgq9?=
 =?us-ascii?Q?blfAEYUVhN4PoTNXdgPQb4YDDdw0GEjf3OO13KjxoanMkfRBpKttgQbT0vVJ?=
 =?us-ascii?Q?8li9mOBcM8cCnQd7GBd91OGia562WvsbwzcXXuWW+LkrbgeKLTc5I8fPjwt+?=
 =?us-ascii?Q?XMQUGAeunKTVNwUIw4oJAQ2uUGsohLV5KQFrcY3bs80Qnd8SN7stdEbtBgTO?=
 =?us-ascii?Q?yHXz70HkHo4d+L7u0V7fBv8IwyyNEq2wRK6I9MP9rqC33XFe+TLeLjJKdBXL?=
 =?us-ascii?Q?tFOKDQ855mD7oOqIJjEG3ZjO2/ozhNt6ufhIYhceWW4DJAhX4x7FRPtAj+oY?=
 =?us-ascii?Q?sicvUQaZTGgdgxF1isTCTYKptaN0h6BCWpVt7YVLW7Pp5Cu5XDdghYmEoH1G?=
 =?us-ascii?Q?/8FlRHmCrxMrjh6e/bI5BP+G+nC5gCNJ+Oc467mjmu8BS8xUmGLtWMuY2tc4?=
 =?us-ascii?Q?KHYzcSmHhW2hlyB4Zr+P7t0sS58knMsLBQ4rlGGeo0p3aNJIenK6yph2oy+f?=
 =?us-ascii?Q?0CjaWd2zRTGMjy/a560DQ3PqCPXW/GOiyvtZ/Gh5XyM7cF8nZ9G74KcY2PgJ?=
 =?us-ascii?Q?Zk3N2u5T+plIQi/Petrt4YcoO94eBdsaVnHnrz8/uC53E3BRLOnEJHSxXAMR?=
 =?us-ascii?Q?3ir0WvYKCScf39JGtQJI3r/gpl2rPCjCXM2pyTrW8zeYO2eyN4dq4I9jzhAd?=
 =?us-ascii?Q?AZlxKkY5wC7NJyRngCfqOAQ+dbtqkGyJ8kcZk9owiI/lSisMjb+UWogFpTz8?=
 =?us-ascii?Q?YERBoffomAX3oXCTmqOkbGiEAhWWiD0ZDl6CmI1HNTJqliCd6cqEjtu3Kapw?=
 =?us-ascii?Q?i2gIJv6CTHeHL6GpguCgrricc49NQnWirL7sggcw4YnDjTwg9MXTjKM0Z+oY?=
 =?us-ascii?Q?SV4Ibl8UAr3kcuNDgXLJmFOcUqaAXoMzzH2X7u0Kvygi4b/ZkUxByWLM1yTZ?=
 =?us-ascii?Q?VUx8v8l7ayCOtK8+hOsoMdQcEC2PcEHRIrNeQsAMydaBgGhUzcOiw2OS0obv?=
 =?us-ascii?Q?9HVtYwdfCRIibb3w3szEV9k8OJ0feWeBeM29iRHRWEs+beY5k7KqDX8GQiHB?=
 =?us-ascii?Q?eycBaINtkO0acPvpMiw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1RIrupWxqZuDuRnx7RpjT961vhy6gFOPOSKd390E3qYagh4P+QUVoT4qVpHE?=
 =?us-ascii?Q?L1XBQYAmPZ2LGXgVtTLjfRaF9/ByMW4MHtu+muz1KjjRLzBhksNi/8PFc/OD?=
 =?us-ascii?Q?1xb7Qxz9FtQ1KLVU/NUZEQrMp1nshQMvu1xvgmODphqAOys+8J/XFa1lfq5J?=
 =?us-ascii?Q?le0t1E8iZabZUBAtzcahqOtEhHZc/qZWg/lq2aiITjLjDg2gu74Vryw5O9lg?=
 =?us-ascii?Q?/cCuqHCG4IFfOpsVw9qLEwId2TB1g/u3geHI6kygzgX5XF73gCdx3xZ7EJE+?=
 =?us-ascii?Q?B6i1avEl1CTE6oYVtnM5Sgxso+Y0YyfUcprRU0Saiuq9ugYYeZYd2swgKaJm?=
 =?us-ascii?Q?bE+FTrbuIdYEWtJYzmeru6Gct5ac5ErqtNs3c5cjRC8exbpYouBTfH/cVwFT?=
 =?us-ascii?Q?hgKYvOrH1/yCqaPXoeFQMGYIFKWYCZbM2/xqy2LZu2LCNLa155pCRdFNaMts?=
 =?us-ascii?Q?8prdrBnSq5gLkddd4MmOTUuB3Y+lbVSfUa9Fjksqhf/Dj0dCGpp0/xEdwK4F?=
 =?us-ascii?Q?YfkwjHecMmBM6ZEomcHWB+Ara955GUHb/z6irlEnngff+10nBroIk/R3Vnap?=
 =?us-ascii?Q?eFFgCe7US/yt5aRWxZef2imntOuqFXBHJWZ1PVKYbqkzbSgUXcL3NKHM6K/8?=
 =?us-ascii?Q?JvQTWWf0QGKOu36pCzb+P3EkFWAw9COmVCz/yng4sU4IDw1nx2vNIOdpiHui?=
 =?us-ascii?Q?F41VkD3nKpbcFDNVQX7RXPClODEzoBPdjzrKUn5Dy0pwVDwnlBffLXhxOfm7?=
 =?us-ascii?Q?tx0LpgJBklTjIyLup+3QN/1q3p/kCy2XgtPt6q63/zKyPlNfBJM0DoEzduhX?=
 =?us-ascii?Q?+0l0bQDKrWttitKSr61Y38ywdrL6VskULDVc3xQQzn4u2J8e6mojGKfMCHcG?=
 =?us-ascii?Q?uaf7IHBlLUUWLcnM0ud2KkCXv5LifGsSSEBJrWGy+6QpqEPUjcVzbK2y7dYD?=
 =?us-ascii?Q?2R3dxyX+E0syMWeVfOR1kt6mfCrxdYXkb/t1e7QpgP2UNGOZjJ99XDxFFcJA?=
 =?us-ascii?Q?JpXPuahiBKSXsuW/RmS0tlFGDF4j0t0gGsz/yBJ8Mgax3N8KQbbADbvxMxkW?=
 =?us-ascii?Q?TtJpYrDnkfAUBdslEHPOj50q++0q8xMS2fvJYt7P/DE//sKwqTINx5wbOKMv?=
 =?us-ascii?Q?BxN0qINYBsffP3wPFT+AsLis1xLCNTxNOeClb+Fe9sxnB84K7n8wc7Wj4yEN?=
 =?us-ascii?Q?PAWAwDCzGK25tNQQWFQNmORl2IS6Pp+QOuvzrU6vqokWa+kAsyzoRqEPXmp6?=
 =?us-ascii?Q?YK4duuSorDzNCu0/TXaKDBYthaUE+/ID+zvE3yufMtG3tGi4W11buVIs6UxL?=
 =?us-ascii?Q?3G2dROPRZZ7iUVtC32Kw+9OdYZboGUQ3c1oOx1DK8qvx6+6HWCK+Z3wrD8t7?=
 =?us-ascii?Q?6Cp3vRLn0khUmqmt9pe8pEcNozH8Frec3xQGYjppkc9dSMEmaj/nqZke3DQU?=
 =?us-ascii?Q?hV301HuTbasHYIB/bL6u9hkRC+1dPgySENeORcLd6qq2IUqQE4sToCPGG/XV?=
 =?us-ascii?Q?8DVIC7XrHn6gg6s3KM5coAUejz8xFvkIY7MZp9hmsfLskhIANgSJUDCDoI1F?=
 =?us-ascii?Q?N0JdTS7zKVGk7k5Rk3XLrDF7fvWTKJrO+qbFsoBk6UHZMCFVKBKHTemHBbA4?=
 =?us-ascii?Q?0GOo7a1EwpVLyp8Fzu3NESb5VBJqeZs3Qzz5vqxkIexKoO9ZL9nINGSGnMVB?=
 =?us-ascii?Q?I/NMC3JeKIcl8R2jKgS//3JZl78ZGbmo50O89Vj/svXbzA4glP7r6HSg4Cuk?=
 =?us-ascii?Q?1+dp8x6p+g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfaeef1e-59c7-4b37-4fd3-08de6e8255b1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:59.7886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YUgiDTST81uVYhrt7SiEEBqUTL3T/Mybq+vs+kIAgD4NsIpnmMbxZjdj2D9iaDI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 474141521C9
X-Rspamd-Action: no action

Some basic coverage of common flows:
 - Check dma_buf_match_mapping()'s rules. These choices effectively
   become driver facing API and it would be a pain to change them later
 - Test the dma_bug_sgt attachment flow to see that the new wrappers work

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/Makefile         |   1 +
 drivers/dma-buf/st-dma-mapping.c | 373 +++++++++++++++++++++++++++++++
 2 files changed, 374 insertions(+)
 create mode 100644 drivers/dma-buf/st-dma-mapping.c

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 12c86da25866c1..0ba311be8d3547 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -12,6 +12,7 @@ dmabuf_kunit-y := \
 	st-dma-fence.o \
 	st-dma-fence-chain.o \
 	st-dma-fence-unwrap.o \
+	st-dma-mapping.o \
 	st-dma-resv.o
 
 obj-$(CONFIG_DMABUF_KUNIT_TEST) += dmabuf_kunit.o
diff --git a/drivers/dma-buf/st-dma-mapping.c b/drivers/dma-buf/st-dma-mapping.c
new file mode 100644
index 00000000000000..1bccfe43a576d0
--- /dev/null
+++ b/drivers/dma-buf/st-dma-mapping.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for dma_buf_match_mapping()
+ */
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
+#include <linux/errno.h>
+
+/* Mock tracking state -- reset before each test */
+static bool mock_match_called;
+static const struct dma_buf_mapping_match *mock_match_exp_arg;
+static const struct dma_buf_mapping_match *mock_match_imp_arg;
+static int mock_match_ret;
+
+static bool mock_finish_called;
+static const struct dma_buf_match_args *mock_finish_args_arg;
+static const struct dma_buf_mapping_match *mock_finish_exp_arg;
+static const struct dma_buf_mapping_match *mock_finish_imp_arg;
+
+static int reset_mock_state(struct kunit *test)
+{
+	mock_match_called = false;
+	mock_match_exp_arg = NULL;
+	mock_match_imp_arg = NULL;
+	mock_match_ret = 0;
+	mock_finish_called = false;
+	mock_finish_args_arg = NULL;
+	mock_finish_exp_arg = NULL;
+	mock_finish_imp_arg = NULL;
+	return 0;
+}
+
+static int mock_match(struct dma_buf *dmabuf,
+		      const struct dma_buf_mapping_match *exp,
+		      const struct dma_buf_mapping_match *imp)
+{
+	mock_match_called = true;
+	mock_match_exp_arg = exp;
+	mock_match_imp_arg = imp;
+	return mock_match_ret;
+}
+
+static void mock_finish_match(struct dma_buf_match_args *args,
+			      const struct dma_buf_mapping_match *exp,
+			      const struct dma_buf_mapping_match *imp)
+{
+	mock_finish_called = true;
+	mock_finish_args_arg = args;
+	mock_finish_exp_arg = exp;
+	mock_finish_imp_arg = imp;
+
+	/* Test doesn't always set attach */
+	if (args->attach)
+		args->attach->map_type = (struct dma_buf_mapping_match){
+			.type = exp->type,
+			.exp_ops = exp->exp_ops,
+		};
+}
+
+/* Type with both match and finish_match callbacks */
+static struct dma_buf_mapping_type mock_type_a = {
+	.name = "mock_type_a",
+	.match = mock_match,
+	.finish_match = mock_finish_match,
+};
+
+/* Second type -- distinct pointer identity from A */
+static struct dma_buf_mapping_type mock_type_b = {
+	.name = "mock_type_b",
+	.match = mock_match,
+	.finish_match = mock_finish_match,
+};
+
+static void test_match_fail(struct kunit *test)
+{
+	struct dma_buf_mapping_match matches[] = { { .type = &mock_type_a } };
+	struct dma_buf_mapping_match exp[] = { { .type = &mock_type_b } };
+	struct dma_buf_match_args args = {
+		.imp_matches = matches,
+		.imp_len = ARRAY_SIZE(matches),
+	};
+
+	/* Zero-length exporter array returns -EINVAL */
+	KUNIT_EXPECT_EQ(test, dma_buf_match_mapping(&args, NULL, 0), -EINVAL);
+	KUNIT_EXPECT_FALSE(test, mock_match_called);
+	KUNIT_EXPECT_FALSE(test, mock_finish_called);
+
+	/* Zero-length importer array returns -EINVAL */
+	args = (struct dma_buf_match_args){};
+	KUNIT_EXPECT_EQ(test,
+			dma_buf_match_mapping(&args, matches,
+					      ARRAY_SIZE(matches)),
+			-EINVAL);
+	KUNIT_EXPECT_FALSE(test, mock_match_called);
+	KUNIT_EXPECT_FALSE(test, mock_finish_called);
+
+	/* Different types produce no match */
+	KUNIT_EXPECT_EQ(test,
+			dma_buf_match_mapping(&args, exp, ARRAY_SIZE(exp)),
+			-EINVAL);
+	KUNIT_EXPECT_FALSE(test, mock_match_called);
+	KUNIT_EXPECT_FALSE(test, mock_finish_called);
+}
+
+/* When type->match() is NULL same types always match */
+static void test_match_no_match_callback(struct kunit *test)
+{
+	static struct dma_buf_mapping_type mock_type_no_match = {
+		.name = "mock_type_no_match",
+		.finish_match = mock_finish_match,
+	};
+	struct dma_buf_mapping_match matches[] = {
+		{ .type = &mock_type_no_match }
+	};
+	struct dma_buf_match_args args = {
+		.imp_matches = matches,
+		.imp_len = ARRAY_SIZE(matches),
+	};
+
+	KUNIT_EXPECT_EQ(
+		test,
+		dma_buf_match_mapping(&args, matches, ARRAY_SIZE(matches)), 0);
+	KUNIT_EXPECT_FALSE(test, mock_match_called);
+	KUNIT_EXPECT_TRUE(test, mock_finish_called);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_args_arg, &args);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_exp_arg, &matches[0]);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_imp_arg, &matches[0]);
+}
+
+static void test_match_callback_returns(struct kunit *test)
+{
+	struct dma_buf_mapping_match matches[] = { { .type = &mock_type_a } };
+	struct dma_buf_match_args args = {
+		.imp_matches = matches,
+		.imp_len = ARRAY_SIZE(matches),
+	};
+
+	/* type->match() returns -EOPNOTSUPP. Skips to next */
+	mock_match_ret = -EOPNOTSUPP;
+	KUNIT_EXPECT_EQ(test,
+			dma_buf_match_mapping(&args, matches,
+					      ARRAY_SIZE(matches)),
+			-EINVAL);
+	KUNIT_EXPECT_TRUE(test, mock_match_called);
+	KUNIT_EXPECT_FALSE(test, mock_finish_called);
+
+	/* type->match() returns an error code. Stops immediately, returns code */
+	mock_match_ret = -ENOMEM;
+	KUNIT_EXPECT_EQ(test,
+			dma_buf_match_mapping(&args, matches,
+					      ARRAY_SIZE(matches)),
+			-ENOMEM);
+	KUNIT_EXPECT_TRUE(test, mock_match_called);
+	KUNIT_EXPECT_FALSE(test, mock_finish_called);
+}
+
+/* Multiple importers. First exporter compatible type wins */
+static void test_match_exporter_priority(struct kunit *test)
+{
+	struct dma_buf_mapping_match exp1[2] = {
+		{ .type = &mock_type_a },
+		{ .type = &mock_type_b },
+	};
+	struct dma_buf_mapping_match exp2[] = { { .type = &mock_type_b } };
+	struct dma_buf_mapping_match imp[2] = {
+		{ .type = &mock_type_a },
+		{ .type = &mock_type_b },
+	};
+	struct dma_buf_match_args args = {
+		.imp_matches = imp,
+		.imp_len = ARRAY_SIZE(imp),
+	};
+
+	/* First matches */
+	KUNIT_EXPECT_EQ(
+		test, dma_buf_match_mapping(&args, exp1, ARRAY_SIZE(exp1)), 0);
+	KUNIT_EXPECT_TRUE(test, mock_finish_called);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_exp_arg, &exp1[0]);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_imp_arg, &imp[0]);
+
+	/* Second matches */
+	KUNIT_EXPECT_EQ(
+		test, dma_buf_match_mapping(&args, exp2, ARRAY_SIZE(exp2)), 0);
+	KUNIT_EXPECT_TRUE(test, mock_finish_called);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_exp_arg, &exp2[0]);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_imp_arg, &imp[1]);
+}
+
+/* Multiple exporters. First exporter compatible type wins */
+static void test_match_importer_priority(struct kunit *test)
+{
+	struct dma_buf_mapping_match exp[] = {
+		{ .type = &mock_type_a },
+		{ .type = &mock_type_b },
+	};
+	struct dma_buf_mapping_match imp1[] = { { .type = &mock_type_b } };
+	struct dma_buf_mapping_match imp2[] = {
+		{ .type = &mock_type_b },
+		{ .type = &mock_type_a },
+	};
+	struct dma_buf_match_args args = {
+		.imp_matches = imp1,
+		.imp_len = ARRAY_SIZE(imp1),
+	};
+
+	/* Single importer */
+	KUNIT_EXPECT_EQ(test,
+			dma_buf_match_mapping(&args, exp, ARRAY_SIZE(exp)), 0);
+	KUNIT_EXPECT_TRUE(test, mock_finish_called);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_exp_arg, &exp[1]);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_imp_arg, &imp1[0]);
+
+	/* Two importers, skipping the first */
+	args = (struct dma_buf_match_args){
+		.imp_matches = imp2,
+		.imp_len = ARRAY_SIZE(imp2),
+	};
+	KUNIT_EXPECT_EQ(test,
+			dma_buf_match_mapping(&args, exp, ARRAY_SIZE(exp)), 0);
+	KUNIT_EXPECT_TRUE(test, mock_finish_called);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_exp_arg, &exp[0]);
+	KUNIT_EXPECT_PTR_EQ(test, mock_finish_imp_arg, &imp2[1]);
+}
+
+static void mock_dmabuf_release(struct dma_buf *dmabuf)
+{
+}
+
+static struct sg_table *mock_map_dma_buf(struct dma_buf_attachment *attach,
+					 enum dma_data_direction dir)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static void mock_unmap_dma_buf(struct dma_buf_attachment *attach,
+			       struct sg_table *sgt,
+			       enum dma_data_direction dir)
+{
+}
+
+static const struct dma_buf_mapping_sgt_exp_ops mock_sgt_ops = {
+	.map_dma_buf = mock_map_dma_buf,
+	.unmap_dma_buf = mock_unmap_dma_buf,
+};
+
+static const struct dma_buf_ops mock_dmabuf_simple_sgt_ops = {
+	.release = mock_dmabuf_release,
+	DMA_BUF_SIMPLE_SGT_EXP_MATCH(mock_map_dma_buf, mock_unmap_dma_buf),
+};
+
+static int mock_dmabuf_match_mapping(struct dma_buf_match_args *args)
+{
+	struct dma_buf_mapping_match sgt_match[2];
+	unsigned int num_match = 0;
+
+	sgt_match[num_match++] =
+		(struct dma_buf_mapping_match){ .type = &mock_type_a };
+
+	sgt_match[num_match++] = DMA_BUF_EMAPPING_SGT(&mock_sgt_ops);
+
+	return dma_buf_match_mapping(args, sgt_match, ARRAY_SIZE(sgt_match));
+}
+
+static const struct dma_buf_ops mock_dmabuf_two_exp_ops = {
+	.release = mock_dmabuf_release,
+	.match_mapping = mock_dmabuf_match_mapping,
+};
+
+struct dma_exporter {
+	const struct dma_buf_ops *ops;
+	const char *desc;
+};
+
+static struct dma_buf *mock_dmabuf_export(const struct dma_buf_ops *ops)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+	exp_info.ops = ops;
+	exp_info.size = PAGE_SIZE;
+	exp_info.priv = ERR_PTR(-EINVAL);
+	return dma_buf_export(&exp_info);
+}
+
+/*
+ * Check that a simple SGT exporter with single_exporter_match works with
+ * dma_buf_sgt_attach()
+ */
+static void test_sgt_attach(struct kunit *test)
+{
+	const struct dma_exporter *param = test->param_value;
+	struct dma_buf *dmabuf;
+	struct dma_buf_attachment *attach;
+	struct device *dev;
+
+	dev = kunit_device_register(test, "dma-buf-test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	dmabuf = mock_dmabuf_export(param->ops);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dmabuf);
+
+	attach = dma_buf_sgt_attach(dmabuf, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, attach);
+
+	KUNIT_EXPECT_PTR_EQ(test, attach->map_type.type,
+			    &dma_buf_mapping_sgt_type);
+	KUNIT_EXPECT_PTR_EQ(test, dma_buf_sgt_dma_device(attach), dev);
+	KUNIT_EXPECT_FALSE(test, dma_buf_sgt_p2p_allowed(attach));
+
+	dma_buf_detach(dmabuf, attach);
+	dma_buf_put(dmabuf);
+}
+
+static void mock_move_notify(struct dma_buf_attachment *attach)
+{
+}
+
+static const struct dma_buf_attach_ops mock_importer_ops = {
+	.move_notify = &mock_move_notify,
+};
+
+/* Check a dynamic attach with a non-sgt mapping type */
+static void test_mock_attach(struct kunit *test)
+{
+	struct dma_buf_mapping_match imp[] = { { .type = &mock_type_a } };
+	struct dma_buf *dmabuf;
+	struct dma_buf_attachment *attach;
+	struct device *dev;
+
+	dev = kunit_device_register(test, "dma-buf-test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	dmabuf = mock_dmabuf_export(&mock_dmabuf_two_exp_ops);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dmabuf);
+
+	attach = dma_buf_mapping_attach(dmabuf, imp, ARRAY_SIZE(imp),
+					&mock_importer_ops, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, attach);
+
+	KUNIT_EXPECT_PTR_EQ(test, attach->map_type.type, &mock_type_a);
+
+	dma_buf_detach(dmabuf, attach);
+	dma_buf_put(dmabuf);
+}
+
+static const struct dma_exporter dma_exporter_params[] = {
+	{ &mock_dmabuf_simple_sgt_ops, "simple_sgt" },
+	{ &mock_dmabuf_two_exp_ops, "two_exp" },
+};
+KUNIT_ARRAY_PARAM_DESC(dma_exporter, dma_exporter_params, desc);
+
+static struct kunit_case dma_mapping_cases[] = {
+	KUNIT_CASE(test_match_fail),
+	KUNIT_CASE(test_match_no_match_callback),
+	KUNIT_CASE(test_match_callback_returns),
+	KUNIT_CASE(test_match_exporter_priority),
+	KUNIT_CASE(test_match_importer_priority),
+	KUNIT_CASE_PARAM(test_sgt_attach, dma_exporter_gen_params),
+	KUNIT_CASE(test_mock_attach),
+	{}
+};
+
+static struct kunit_suite dma_mapping_test_suite = {
+	.name = "dma-buf-mapping",
+	.init = reset_mock_state,
+	.test_cases = dma_mapping_cases,
+};
+
+kunit_test_suite(dma_mapping_test_suite);
+
+MODULE_IMPORT_NS("DMA_BUF");
-- 
2.43.0

