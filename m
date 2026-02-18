Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNkRCiMGlWmmKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE315238D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA4A10E556;
	Wed, 18 Feb 2026 00:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gVaswkKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A7210E54F;
 Wed, 18 Feb 2026 00:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTVK0/v7TAL/FoQzGCZV8h6nhmt3qfYpfWVaO3dbNbmkwoEdZUx8U2eh4Hae1ZGxe5kjY3jINgX7isl1scL4SYUmxKPa/PnmsblGNPippEFoD1o9DTyCEi1F3L34H9o3bEp6NmL1mZw8GfGaXjgcMsO2lECoC/mOVTnPzDGXj/ld5GTanGXiO8jXubBY7tBFPl2Tj/MDpeISw+y7aymZniBAbmYS9ZM5ORgDucgkDQpGDFFuoWnwQaAoRJ3FxOZgiz6KsDr+jIcmDEdEkRAn7k7jbwLQsZV4oDklH2yUKZLuGBRv/It0MBmF/NGu0IqhewVxH3HL/ccmBJUL9KEAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuxkBYusmblXsdT0RCQOCROpbG7ebCFuR56+qtuA3k0=;
 b=B9maNL6NIR/dXbqxgVc28ciFhOtV12uBXC/jkVdzAjIEaZC1Ly7ahRtSZjbRtDiHWAYEECST19n/Uw/jdRC2d7nj0iWuYEb3TwHkRHxG9zAwvdSAgvY4+99Q1gD5hnftITYHotwqZ7QekEoK9HCSOpYf54ec93Nuvx+F82cbGBIGCScDb4v5JECARyqd9nC5eZgcYETzwTO32OCOXgy9E8p3c4yZ8I96fyJ2xh0wOIYA8MOcxz2ZUFwI8ZS/Sx5NK9hiDfxhcPQzR0yDM47yX404yjlBkRVou6GvVHSIUjxHKQyWLWW5jli26pmjIhKV1Vq0Z2y+lgmCABphbjiX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuxkBYusmblXsdT0RCQOCROpbG7ebCFuR56+qtuA3k0=;
 b=gVaswkKf3QKFhAjllQd7N2CvYOv7XrjuSm9vKipw3regSTelk+xAf8B30AcfXprUBuGN+dHdsn8b7jCJBXUrrF1Nyjc4d4LWVLj34eF9fhyMrDz0WVBSvAlm6Ti9/ZACAenzPvameKNYHdc78ycFJ9gCMDn5W9qqX4dMng3MLbPYtk0Xj12H8pvpNEDCW8ctr60p+E+6Cm/R9gHFht0hSsYGQ26iHMMKFQ6OWoRC/+y8pEuO3v6R/SfvdDlsqTscLdSmkJzv81ByCwoGlc/tpIqjLtqrlH+mUCdrqlCd3QM+lGhKBuOLBOJHses2OSNkr3E1hwtJFQfMR2B95fEeUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 00:21:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:21:43 +0000
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
Subject: [PATCH RFC 11/26] drm/amdgpu: Use the SGT mapping type
Date: Tue, 17 Feb 2026 20:11:42 -0400
Message-ID: <11-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 290f5ac3-213a-4c99-02f2-08de6e83b09a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zckpS1NCM3iBdh/ShgYdhSAfMYs7PTTtjCeMIzcgrB0gfpxcnp16qBzNdidH?=
 =?us-ascii?Q?XInOgmhIi2MG/LCccAd6U13E28UHWeTAAh/KZqOMn1P50Hrg9IFP5MQKBwBx?=
 =?us-ascii?Q?Lk5x07HLtlKf/WisV1SRV68QLovm0gmYZsoiq2CXBiwBe7JCtYPXgvnYlsmb?=
 =?us-ascii?Q?lH9GTuPx2q6FBtbVBuDc3OY1qrZcPOcxPYF4tjm+/zaM3D0NfLBqXpOl3YIg?=
 =?us-ascii?Q?4qT8XYvFCJl8jU6LtXnUVd8rIelL5gaYNR8jjHgrSH2BF+PL2H9vJgsMzwWN?=
 =?us-ascii?Q?/N9Z3VImFNFPBjNaJQ7AWag3RoKGqJ/d+Hcq9+Wt9sJBbYj4FYm/VLVCN69K?=
 =?us-ascii?Q?EWqt4iXEbp+uiueblmsKxAud6Y9eYcajRuvT6AdqsaGp1jyx9QrjF1hbLVIr?=
 =?us-ascii?Q?ob8vAz7IUp809+zDVLIKRY3BTLwibuSCewQ6W85D9HzumiEM/VQavINGuI5k?=
 =?us-ascii?Q?bQfSZglbp7pIOSDdZVXptGKU2FFWhwUtUHueiCxtdHqp6Z0b2FloV47Uhcl+?=
 =?us-ascii?Q?yySSGRNeMxGvDQBkEhnz/yF3gYjWHM38vrqI63DkVsJBwlVFCRyMn5UkGtag?=
 =?us-ascii?Q?vWqYNG+j1nip5JDcpUIh6oaHUqpjXCe+i+So1LmoDfevh8igU86fMFMdQQug?=
 =?us-ascii?Q?Lk7VFiNf80XDhJHl2hfScaAgwpk9lflgrceA3JD3TZZOxqntYsBcqn1GtPpY?=
 =?us-ascii?Q?l0zbnujV2ZYiD16gEnRMG3irlbGGNf+qtJ3eFRQtX0zHcULaOd2V39G/KjgN?=
 =?us-ascii?Q?PFQXx4MRMKWeDlK0AW/HFCuTXagvf82oW+mWXKRGQuk/ArA9oZT6HhWebTB0?=
 =?us-ascii?Q?THW/BImQdWlgL8mWRIGwY7d9NTmFIYC27RE9Ro8RGb0ER9es0CDbRIeGrCRn?=
 =?us-ascii?Q?rX7xV7XXY3gDfAEHgv1UvPWnLhrOATiA2I0fPxg8iHX3qXgLydzKVOBG/fbF?=
 =?us-ascii?Q?2BcWWR/9kwsJ+62HVxqk10VIwjnkXLbC13RfCGW/09Oj0meWKL+llJKjttSa?=
 =?us-ascii?Q?ZRYIXltZmaP1dsjfcioWmdqyeTvo5BfhR94SqLLBSfoEErn06z2IDD9DHZxL?=
 =?us-ascii?Q?EpOF9YbRndZkC2FYsu4uqZFAHOrWF5Uq4masR//EXVktJ3rHIVNaNOk2TO2B?=
 =?us-ascii?Q?/pIQYMkLM+jQRtaZ1NDMbLPn2JoMuvay19HV195CfGeCjlVOha3+sjfc4Q1I?=
 =?us-ascii?Q?CqZAPNHky+vfnWXAUo1LUe2LSJkXJyd2AodJOHeIoUJY9Qf+lzEaeiRkoQk/?=
 =?us-ascii?Q?rRKMWhZC1syAb6MNYvRo6IAOqzlHpdIPVObr/AD4QOtzncO0bfECoaZexw6T?=
 =?us-ascii?Q?bmv/DYKN7Z5gnY4rYMkuhq5Y5iG1rTEGZB2C3+9mBkCXdjKMq9P3DMZqLED3?=
 =?us-ascii?Q?GpDJHpN1SjmFanhF26HtedUCY9RyHz3gArUDt1HgSGqRFz6+n5VfymzSPDkF?=
 =?us-ascii?Q?b+46fBQqXdNn4xB2amQmo5/5qa8CcVnyUT32cTI5GMdgn+CNmYxD7MnbultW?=
 =?us-ascii?Q?U3RREcGQ7fGgHzs09IXHDeQMtMieZhQxa1bH7t6LbN4AhWCwaFDKZ1VXQBUX?=
 =?us-ascii?Q?RE+xj+aplmT6PsxUhyw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxBn2W/tV+gH873PO8sMuwGidAxMMNBn17uxOllEYQC3nBjhysrpHWuY7GXy?=
 =?us-ascii?Q?UmZHQUM7Aigr8BpLhi2oTrfrG2gbKdGyr1mW1ci8bFLySLmEK+IMSMJpF6In?=
 =?us-ascii?Q?t95mW9HkbrRt+xM1/znO7G7RWVgAnMBGp0GbtUY/hwovNxRhWyziOJpbf/2z?=
 =?us-ascii?Q?PamEYi4TGYS9TW64ON5lAWHaovQoQq5ZWLEQ5B4sYuLF9tDUdOn0+8Ilqg7S?=
 =?us-ascii?Q?tWy33/sVLCjlHnybfOjewHe3tPpnP9N+XDXIarD0y+TVDsO4OXwJy4kfSIJM?=
 =?us-ascii?Q?aQ5B1dDcfYZE13eNBlZXOwW8W3dvdHjyOX+oTFxHQZno7vkqLYM8AJ3W42HY?=
 =?us-ascii?Q?e90nqhj4EDmAOxziY1iFVvN0XF0VOTqBI7idmtgANI+Ob+dPsY1VhFra+jUB?=
 =?us-ascii?Q?iS3y4g3BLrhDhPRry/54MndAVi4KhX8c/x3lzQzi6UXpEhMWg0kXmp3hH9oR?=
 =?us-ascii?Q?FZrAwKwSvoBXWCUbUu1vlIG3Y/sbxKmR4XvpAm6/Es5Dd5n2259sjJYD1YTn?=
 =?us-ascii?Q?pD8YYpD6rMjdMhT3SpVD/FOPfAjjk3U2EDLl+M7dFb5+MEqQw/hxPCker1Oq?=
 =?us-ascii?Q?NZHT7JDCZ4WvXaZCzjqb3dWrFjzFBi44MgNCpIQ98+AP5HJyFdLq3Ob43Qi6?=
 =?us-ascii?Q?SokxNqY5Fr7WEvUuTkAQuuHW/QO4r+tIKRYmByp8+MmqRq+NWCG8vsVcUE4a?=
 =?us-ascii?Q?xLWbVLE3b0XSjh6R7CwLKyd+TVaBxMbnBojL9RlW/xohUGHoGaQHqP3VaOUQ?=
 =?us-ascii?Q?MPCN9ASu4DoLSSlAu0/FR1A3PYZCaasuhxzWoSLZhKHTs1omFfaWP0L4idMD?=
 =?us-ascii?Q?1VNCWFP1JmHDEqqd02OELE0wUP8xbHMlzxkzlN27LGpbPFvhJ7Qv+tr3JmA7?=
 =?us-ascii?Q?VtLPrQCscJK2lDFH4TLUiB0a/UBexrJGcP+7El3epM8dtCUDmbUPxWPYrJn9?=
 =?us-ascii?Q?YJjvgXzPhXZNI/xtoZXQOvMhkcb5aMpqBza4wHkimK6vo71/c9Et4ykCt2Av?=
 =?us-ascii?Q?0lpn35/WqKL01LGMuTbMj28EzO/i5zHco54ZJfaGGHLe6kgU6q3fGbKysX+w?=
 =?us-ascii?Q?L8VvrAwPc8p1+lIvIgP5dksP5VQMhuHjF37s7Co/dAaDI5puV5QNxr+LqmvY?=
 =?us-ascii?Q?aGt/JIiGfCHqdeEiIXOjELxC2gZ40AJFdvJs3McbrN7DxaxtDAFc1ozqmthF?=
 =?us-ascii?Q?nR+NHsUIjjO3IOCPVxyvzn3bUrO599WZ65bO79Zj/LOHJxd3fAk8V67d8EpW?=
 =?us-ascii?Q?VXUKgF1KgO+jy+tWlH8L776Yti2uGRaIw5YHps8Sm2cYAxpixKrIRcGPpqHK?=
 =?us-ascii?Q?77qMZAfFP14x1Sm5WZJDmOMOO2gmZ+x+LYElfk6RGZIfNHOFo22aZbv1pfVK?=
 =?us-ascii?Q?MnzP6bmNVUupDEYOrTRCJKp1LrmZs2LBWAyPpSP66vDKUzEiimCTqIKl32F5?=
 =?us-ascii?Q?PFnQoxZF7YYgemkHdF364gCuQEqYW79lERTkW0VCzIV/BSFUp3H35ETRqp8x?=
 =?us-ascii?Q?cEXRLKHELH4GRuSyum4cyBQtqHiNZVXcGzoDHJ32FR2JD6v+wIumaVCO0zum?=
 =?us-ascii?Q?WFqnmcb0XO5Holt62pLVedYHOQMcPvMF9qyVT75a3fLncyzrwvqFH2tZnLIU?=
 =?us-ascii?Q?kTZOZjO2biG3fNL/uLoiHvwujiF+PM5RCKImCBW17mwYkbDYyByApuoMmlD9?=
 =?us-ascii?Q?riqToTq2xzyakWLjFoXDfXkIbYT1/IrVsfXfYf1wykiYqt+ZhD+hYeoVRntY?=
 =?us-ascii?Q?wzKNWBwU8g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290f5ac3-213a-4c99-02f2-08de6e83b09a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:21:41.8351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMO7A49i3GJKCJDsWrQ0fD9PvQr/GDFLzEGk+hUiRTNWiCB+JX3hFYyBxRd1bAX0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: CBFE315238D
X-Rspamd-Action: no action

Similar to xe, amdgpu wants to check pci_p2pdma_distance(), and
only needs that if peer2peer can be supported by the GPU. It can migrate to
system memory and support non-p2p DMA as well.

Further it supports a private non-PCI XGMI path. For now hack this on top
of a SGT type, but eventually this is likely better off as its own mapping
type.

Add two exporter SGT mapping types, one that matches P2P and one that
matches all of the non-p2p. The pin and map code will force migrate if
the non-p2p one is matched.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 94 +++++++++++++++------
 drivers/gpu/drm/xe/xe_dma_buf.c             |  2 +-
 2 files changed, 69 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index c1461317eb2987..bb9c602c061dc3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -40,6 +40,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/ttm/ttm_tt.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-fence-array.h>
 #include <linux/pci-p2pdma.h>
 
@@ -77,28 +78,10 @@ static struct amdgpu_device *dma_buf_attach_adev(struct dma_buf_attachment *atta
 static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 				 struct dma_buf_attachment *attach)
 {
-	struct amdgpu_device *attach_adev = dma_buf_attach_adev(attach);
 	struct drm_gem_object *obj = dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	int r;
 
-	/*
-	 * Disable peer-to-peer access for DCC-enabled VRAM surfaces on GFX12+.
-	 * Such buffers cannot be safely accessed over P2P due to device-local
-	 * compression metadata. Fallback to system-memory path instead.
-	 * Device supports GFX12 (GC 12.x or newer)
-	 * BO was created with the AMDGPU_GEM_CREATE_GFX12_DCC flag
-	 *
-	 */
-	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(12, 0, 0) &&
-	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
-		attach->peer2peer = false;
-
-	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
-	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
-		attach->peer2peer = false;
-
 	r = dma_resv_lock(bo->tbo.base.resv, NULL);
 	if (r)
 		return r;
@@ -137,7 +120,7 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
 		domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
 	} else {
 		list_for_each_entry(attach, &dmabuf->attachments, node)
-			if (!attach->peer2peer)
+			if (!dma_buf_sgt_p2p_allowed(attach))
 				domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
 	}
 
@@ -181,6 +164,7 @@ static void amdgpu_dma_buf_unpin(struct dma_buf_attachment *attach)
 static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 					   enum dma_data_direction dir)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(attach);
 	struct dma_buf *dma_buf = attach->dmabuf;
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
@@ -194,7 +178,7 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 		unsigned int domains = AMDGPU_GEM_DOMAIN_GTT;
 
 		if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM &&
-		    attach->peer2peer) {
+		    dma_buf_sgt_p2p_allowed(attach)) {
 			bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
 			domains |= AMDGPU_GEM_DOMAIN_VRAM;
 		}
@@ -212,7 +196,7 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 		if (IS_ERR(sgt))
 			return sgt;
 
-		if (dma_map_sgtable(attach->dev, sgt, dir,
+		if (dma_map_sgtable(dma_dev, sgt, dir,
 				    DMA_ATTR_SKIP_CPU_SYNC))
 			goto error_free;
 		break;
@@ -224,7 +208,7 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 			return ERR_PTR(-EINVAL);
 
 		r = amdgpu_vram_mgr_alloc_sgt(adev, bo->tbo.resource, 0,
-					      bo->tbo.base.size, attach->dev,
+					      bo->tbo.base.size, dma_dev,
 					      dir, &sgt);
 		if (r)
 			return ERR_PTR(r);
@@ -254,12 +238,14 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
 				 struct sg_table *sgt,
 				 enum dma_data_direction dir)
 {
+	struct device *dma_dev = dma_buf_sgt_dma_device(attach);
+
 	if (sg_page(sgt->sgl)) {
-		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
+		dma_unmap_sgtable(dma_dev, sgt, dir, 0);
 		sg_free_table(sgt);
 		kfree(sgt);
 	} else {
-		amdgpu_vram_mgr_free_sgt(attach->dev, dir, sgt);
+		amdgpu_vram_mgr_free_sgt(dma_dev, dir, sgt);
 	}
 }
 
@@ -334,17 +320,73 @@ static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map
 	amdgpu_bo_unpin(bo);
 }
 
+static const struct dma_buf_mapping_sgt_exp_ops amdgpu_dma_buf_sgt_ops = {
+	.map_dma_buf = amdgpu_dma_buf_map,
+	.unmap_dma_buf = amdgpu_dma_buf_unmap,
+};
+
+static int amdgpu_dma_buf_match_mapping(struct dma_buf_match_args *args)
+{
+	struct dma_buf_attachment *attach = args->attach;
+	struct drm_gem_object *obj = args->dmabuf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct dma_buf_mapping_match sgt_match[2];
+	unsigned int num_match = 0;
+	bool peer2peer = true;
+	int ret;
+
+	/*
+	 * Disable peer-to-peer access for DCC-enabled VRAM surfaces on GFX12+.
+	 * Such buffers cannot be safely accessed over P2P due to device-local
+	 * compression metadata. Fallback to system-memory path instead.
+	 * Device supports GFX12 (GC 12.x or newer)
+	 * BO was created with the AMDGPU_GEM_CREATE_GFX12_DCC flag
+	 *
+	 */
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(12, 0, 0) &&
+	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
+		peer2peer = false;
+
+	/*
+	 * Disable peer-to-peer access for DCC-enabled VRAM surfaces on GFX12+.
+	 * Such buffers cannot be safely accessed over P2P due to device-local
+	 * compression metadata. Fallback to system-memory path instead.
+	 * Device supports GFX12 (GC 12.x or newer)
+	 * BO was created with the AMDGPU_GEM_CREATE_GFX12_DCC flag
+	 *
+	 */
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(12, 0, 0) &&
+	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
+		peer2peer = false;
+
+	if (peer2peer)
+		sgt_match[num_match++] = DMA_BUF_EMAPPING_SGT_P2P(
+			&amdgpu_dma_buf_sgt_ops, adev->pdev);
+	sgt_match[num_match++] = DMA_BUF_EMAPPING_SGT(&amdgpu_dma_buf_sgt_ops);
+
+	ret = dma_buf_match_mapping(args, sgt_match, num_match);
+	if (ret)
+		return ret;
+
+	/* If the transfer will use XGMI then force a P2P match. */
+	if (peer2peer && !dma_buf_sgt_p2p_allowed(attach) &&
+	    amdgpu_dmabuf_is_xgmi_accessible(dma_buf_attach_adev(attach), bo))
+		return attach->map_type.sgt_data.exporter_requires_p2p =
+		       DMA_SGT_EXPORTER_REQUIRES_P2P_DISTANCE;
+	return 0;
+}
+
 const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.attach = amdgpu_dma_buf_attach,
 	.pin = amdgpu_dma_buf_pin,
 	.unpin = amdgpu_dma_buf_unpin,
-	.map_dma_buf = amdgpu_dma_buf_map,
-	.unmap_dma_buf = amdgpu_dma_buf_unmap,
 	.release = drm_gem_dmabuf_release,
 	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = amdgpu_dma_buf_vmap,
 	.vunmap = amdgpu_dma_buf_vunmap,
+	.match_mapping = amdgpu_dma_buf_match_mapping,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 9968f37657d57d..848532aca432db 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -211,7 +211,7 @@ static int xe_dma_buf_match_mapping(struct dma_buf_match_args *args)
 		sgt_match[num_match++] =
 			DMA_BUF_EMAPPING_SGT(&xe_dma_buf_sgt_ops);
 
-	return dma_buf_match_mapping(args, sgt_match, ARRAY_SIZE(sgt_match));
+	return dma_buf_match_mapping(args, sgt_match, num_match);
 }
 
 static const struct dma_buf_ops xe_dmabuf_ops = {
-- 
2.43.0

