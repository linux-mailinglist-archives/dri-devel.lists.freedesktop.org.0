Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJwdJ7Nkf2lSpgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:35:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA27C62DE
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA010E0EA;
	Sun,  1 Feb 2026 14:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eqqknNwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4010D10E0C1
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 14:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9so+SQ0Qs0/jFmKHJjijdC/6Qi+8Lxke7WL67ZDqBixIgC0ECcjAgNj7KlE1BWGJh9wB8Rooq0JlpNdEvL3083xTS03bO6zrZ9mykpXWTLApp3OhcQGc2uF1W7PjQGzUweCHmUhBGdf+6FaSkZrpMdXUBS792eGCQO3F7x8jYSI8Drou1vgynIvO98p9cZIJdHDL48UajLlg6jPrMbdkcbKuq0wv78r7V+ioO92gw7GCTUQWl0Ggx2USK55IS17BHINy6cZ0ILmXsqTCIJKNYWdvZX53k8zYWLUSqApZJdt46HPrW/gce5tly8Z0p+NkC8OWhgeZUzK9TkyAxFwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VrLw2X/xoBoeIyrjpErTeL8zmMYx9+QBUjkUcvQG30=;
 b=x8XiwAXVHJMu7+c6kXFSjFCvdvwIziZcr5e9iqN3C8AeqB7Wl7vZQHkCQSvWvWADHpnQIHKakt4eO7Je0Sa/zj3Hkwxx0o+J1a8Ba3qU6CBaYEuhathussMh0R66ZWqjrobT+56iyc9UICKynsgeNvy9ojNvoR9FvOqfRFqnoM89i/6HtYRTlwzEewcQ8xtU4qQx7yZud/kiePSEGdW1VDCgGPauURXvFGH+NM1xsWqAq179YHmSoLX9vsfQw2sBpyjaiOP7mwbgXEQbunhOaFLzTG7U93k5m+fYtjDMyUpyozjR4C/6XMsLeDVjGfCPyNiFWIeNfOkMVwzxJJGcwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VrLw2X/xoBoeIyrjpErTeL8zmMYx9+QBUjkUcvQG30=;
 b=eqqknNwLI7IpXIRJ/w31Z7GfQyP/zv/uHpXnHGxDfwSIvcHzf/2W9UowMby1xc3a4Gei9ekNu/2o4PVe9akg0ofgy6K6gw+QkheBZSAsJId60/9gS6GbL6VQI4nZCmwJ9kWYNlSD/9qFwbU048NC/BMswWjb5tiwQqFx1fUfNFxRC+NECNTy1eoFc0JmMjqGx7oc4YvkB/qlesW2oI6R8OAyxp0ZVhL5QsdWWDfRAjgwzQLY8eBtwz6deXPm+lzn71N8ygV69prZDqHPUPN4fb1B7aFUn1rj2W5BZZwkTqg8kY3Ljr/UKyLRBNVl0oIfOs4W0Nrg/3+O58rKtwiOZg==
Received: from PH7P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::18)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Sun, 1 Feb
 2026 14:35:17 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::73) by PH7P221CA0039.outlook.office365.com
 (2603:10b6:510:33c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Sun, 1
 Feb 2026 14:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Sun, 1 Feb 2026 14:35:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 06:35:04 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 06:35:03 -0800
Received: from c-237-169-180-181.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Sun, 1 Feb 2026 06:35:00 -0800
From: Edward Srouji <edwards@nvidia.com>
Date: Sun, 1 Feb 2026 16:34:05 +0200
Subject: [PATCH rdma-next v3 2/3] RDMA/uverbs: Add DMABUF object type and
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260201-dmabuf-export-v3-2-da238b614fe3@nvidia.com>
References: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
In-Reply-To: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769956492; l=18464;
 i=edwards@nvidia.com; s=20251029; h=from:subject:message-id;
 bh=z4mKxhmVUWB71Ez6SQth7QbB8xIP3f9W007n+CGvyGY=;
 b=iX90r1LfzXXyApH7GXns3T/c/W69h8yGyJcN3bOH101uDQoEidjL/afXCG88Zalo/TxVGhjBg
 Me8K9LBHYLBCEITIlo1iZl+eKQBtliAGFyK9xh+T2K9PxoXJ09GYbHR
X-Developer-Key: i=edwards@nvidia.com; a=ed25519;
 pk=VME+d2WbMZT5AY+AolKh2XIdrnXWUwwzz/XLQ3jXgDM=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f4c05fa-affc-44c3-54f9-08de619f1e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGZBOW54b0J6NU5vd1hoUVlMUWFMWEZCUzlUOVVQZkFSQ25PRWE0amtKNm1k?=
 =?utf-8?B?eERvWEFBTnB3S0ZUc2JpVjBxWjZvSDVwdVdWN3NJSEloQmUvVmtjVU9EcUZo?=
 =?utf-8?B?UUJvWG5vM0Nlb3BZbVp1VUY3dWNRM1dabGRXOG9qNXJkcUxCUXhoWmNVODJ3?=
 =?utf-8?B?Z2ZpM0UwaE9uNXF0NXBqTitCS3BkWnM5eG9DOFpvODQ1UDd0cSthS2hjZ0hM?=
 =?utf-8?B?enU5UjBlUGdNbkhuaWFNNXZBM1RlK1R5dXpVWUNrVHorYS9vTnlIZWxMQ3FM?=
 =?utf-8?B?WExMeS8wcDU2ZzgyMTVyb09EQTAyQjBYNlBFZ2hZZ005azZZZHVQV3lhNE92?=
 =?utf-8?B?aElhUm5MVmZvcG13VkJSOXJBd2dNMTlFQ2M2dTJVbHJmREdabzlTUFcxa2xE?=
 =?utf-8?B?aUVJaEl5UmdsUkFNR1cxNGN3REhKNDJtMjdmY0VKdGd6aXpaRWh2SC9JdHFN?=
 =?utf-8?B?S3RKYnZpVjZiOVc4a3hHaFdMakNqdTBvZVh4ZSticG1CcEhQbHpOVW5xZjF5?=
 =?utf-8?B?bWZFdmVSZ3NEMVJQSXE3RFQ1ZDltR0NneE5rMy9GYStnSTkxZ09PdEFZTVZ1?=
 =?utf-8?B?cEJ1SUszNTdrSTdWUFBVTzlOMElEMFloKzJRZWhTNmdTZVZpNitlQlphYzho?=
 =?utf-8?B?WlN5M1U2eERqYTZ1RG1ONlA5cEE3Q0RmVll3YVZVeGlIeHJzUzhIcUtHRkFD?=
 =?utf-8?B?Mll1SDZDRmtodHgzY2haZ3JrNXVBNkpFMFl5MDlTb1FoVC9oYmlCRGFhcjRN?=
 =?utf-8?B?WFF4TDg3OXg2Rk04YzNaODBGYVpJdUg1aGtIQkFCdEFrdVZzQVFvVUxtcSsy?=
 =?utf-8?B?eHBKcHR5SFVBS05xbVFOd0M5aFIzSXBkbkhHMXVTdmpRdW5UcDFDM21JQjI5?=
 =?utf-8?B?UzN5RVJsYmd6V3o4d3JmQWwySmtsSVJBaVNpNmVqVXd4MUpMZEtJNnlVL0sr?=
 =?utf-8?B?RFhCbGZ0TldZdXBLTEtvSzBYTVo1VGtlc0d5YjZGNDRsaTBDWFB5N3pyM1NC?=
 =?utf-8?B?dE1CdVpJOXBySkxmeFpnckhFWU13YkxaSTdoSStXMjA1NFFqSHVmakszbWo1?=
 =?utf-8?B?Z1owd0FIdS91Z01PSVNtTWptV0VuMDFoRGpFdE1lWS9ZYzNTcFNDc0ZhMkF1?=
 =?utf-8?B?VlJ1Qnc2Tzh0MGpIRTNtdXB4bDd1aVNqajlCM1dJNFNrWlpDVWFFVUg3a0xl?=
 =?utf-8?B?bWJ0Z0FIUnJFaW5OeFMzQjFGZnRwYjhWZHc1UHZNSHpmaDlFckJOQS8yMjA3?=
 =?utf-8?B?OUw3RkRHNy9jWll1OUs2MVNSWTl5c1FqcGQ0THV3T2U2VGw3RUlQcFpLNThY?=
 =?utf-8?B?N3BZTE1lcFoyam9PK29OOE0yR1hGaWJxTkhQQ2lFN2FTamdlTjdJb05ISHBI?=
 =?utf-8?B?M0Z2OXhNYjlHUzdYM2xuUmpYbTBMQUU3VU0rY2JYN2Y4N3QwRlRxTUtZdVZt?=
 =?utf-8?B?YkY0bFZQeitjTUxCa3RmcmhyODZDWVlRNldGbjlIb2R4YXh2YUJWT3lIa2JB?=
 =?utf-8?B?TjhYTGFBTWpiYllmUVVnazVydkRUUWdGV1krcHdDNG56Z0JaNjlaVW1ldVBL?=
 =?utf-8?B?TzJqWStsNGZuTW1RRnZnTW1OUmcyMmlsQy9YTkRoSGYrYWpKMHlSM1lkRzln?=
 =?utf-8?B?NXpIQzRvNm9XNlA5Mjh5RGlrWjhEditNS0hkNndBVWUrMFg1VnJQa0pnZzFE?=
 =?utf-8?B?SGZ1M2p5enoxMHNMQ29xeXh5SUVETEpxeXVLdzluRk0waHRVMlZQWmNLbmQ0?=
 =?utf-8?B?bVlEYlltcmluSVBXNjdHbmxQcjBuN2Ixam53dTBSTGFEZFNDWlV2dTVLY3VG?=
 =?utf-8?B?QXBFYjNIZ1MwL25kVEk1eFpjMFBUNzMwL2ZLODB3YldFMmkyakpHTGF0SjMz?=
 =?utf-8?B?eUFRc1BZQUtyOUZyU2VuQlZuK2hOS2tRNWhnQVRrdTFwN0kwZTF0c0laaUFn?=
 =?utf-8?B?VTdYeVRKb0VxM3NjR2dRY0lZZzlWR3dJTkVXdkZ4RE54S0hHOUNkSzZuVWQ2?=
 =?utf-8?B?T1RFQjcxdEpUTytFRlZ2VjFTVWRiVWxMNjBmZGpLOER0SGFOVlB5MTJjUnJG?=
 =?utf-8?B?c09qZURBZEJMbGR5L1pseHRZVENuVml5MC8zdTl2MnNSRG9EbWlYNXRCcVht?=
 =?utf-8?B?TmVjRUdFQ0xyR2JzVHJGZmVzbFQ4OTMzcGpLc3d3a0J0dmtVSjgzSGtzZzNx?=
 =?utf-8?B?ckpTdWlyQ3FWbnhlOVdaWHFFbzRWTGpkS1FLS1JRNllJOWZmbmpkQUFkTnhO?=
 =?utf-8?B?SllqQXJrcVlHdDVIVUNhZEsveURRPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jqu9LXLRYBlNN24EINzYDUdrkqk6gRPt8RUB2busUZgfOcwjJRP+N6fd2BL3NxHvdq6t1dRsw2YWHNMHxEaQ6um5LUWHOzLOzpbXIfUm0DUeMMaT0Gcs5Hp+hBrToznQHIL/Zb7WSgCWhsAOQzxuHJAj/ORL3x+cIpLmmjTK/1gkgcn20d/3Ah9e2+PkwIrHLIDVWoSj6XouH7rmEYcp00K7w+e21Mvlrrlm02n8+v1oQkYjqu3XFACJnmsYkF+JNw3vaxLtbvijO2QILjXqmL9XEEcUOYl5fWzgFw7hSGfh+5jwmD8ibS8VAEhSPrtahMEGLngWTz198OgwL1W9mZ33+uGwPujejXkisupJS40ZMNWRvT3OCI97EFrWS/jZFentwzUmJ9kHBifuvnJ6GXAqMn9RSuy6HtyPeWFDZt71AYPpjDkHTUR2qNjjhQxe
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 14:35:16.3597 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4c05fa-affc-44c3-54f9-08de619f1e0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,m:edwards@nvidia.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4DA27C62DE
X-Rspamd-Action: no action

From: Yishai Hadas <yishaih@nvidia.com>

Expose DMABUF functionality to userspace through the uverbs interface,
enabling InfiniBand/RDMA devices to export PCI based memory regions
(e.g. device memory) as DMABUF file descriptors. This allows
zero-copy sharing of RDMA memory with other subsystems that support the
dma-buf framework.

A new UVERBS_OBJECT_DMABUF object type and allocation method were
introduced.

During allocation, uverbs invokes the driver to supply the
rdma_user_mmap_entry associated with the given page offset (pgoff).

Based on the returned rdma_user_mmap_entry, uverbs requests the driver
to provide the corresponding physical-memory details as well as the
driver’s PCI provider information.

Using this information, dma_buf_export() is called; if it succeeds,
uobj->object is set to the underlying file pointer returned by the
dma-buf framework.

The file descriptor number follows the standard uverbs allocation flow,
but the file pointer comes from the dma-buf subsystem, including its own
fops and private data.

When an mmap entry is removed, uverbs iterates over its associated
DMABUFs, marks them as revoked, and calls dma_buf_move_notify() so that
their importers are notified.

The same procedure applies during the disassociate flow; final cleanup
occurs when the application closes the file.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Edward Srouji <edwards@nvidia.com>
---
 drivers/infiniband/core/Makefile                  |   1 +
 drivers/infiniband/core/device.c                  |   2 +
 drivers/infiniband/core/ib_core_uverbs.c          |  24 +++
 drivers/infiniband/core/rdma_core.c               |  28 +--
 drivers/infiniband/core/rdma_core.h               |   1 +
 drivers/infiniband/core/uverbs.h                  |  21 +++
 drivers/infiniband/core/uverbs_std_types_dmabuf.c | 200 ++++++++++++++++++++++
 drivers/infiniband/core/uverbs_uapi.c             |   1 +
 include/rdma/ib_verbs.h                           |   9 +
 include/rdma/uverbs_types.h                       |   1 +
 include/uapi/rdma/ib_user_ioctl_cmds.h            |  10 ++
 11 files changed, 286 insertions(+), 12 deletions(-)

diff --git a/drivers/infiniband/core/Makefile b/drivers/infiniband/core/Makefile
index f483e0c12444..a2a7a9d2e0d3 100644
--- a/drivers/infiniband/core/Makefile
+++ b/drivers/infiniband/core/Makefile
@@ -33,6 +33,7 @@ ib_umad-y :=			user_mad.o
 ib_uverbs-y :=			uverbs_main.o uverbs_cmd.o uverbs_marshall.o \
 				rdma_core.o uverbs_std_types.o uverbs_ioctl.o \
 				uverbs_std_types_cq.o \
+				uverbs_std_types_dmabuf.o \
 				uverbs_std_types_dmah.o \
 				uverbs_std_types_flow_action.o uverbs_std_types_dm.o \
 				uverbs_std_types_mr.o uverbs_std_types_counters.o \
diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index 4e09f6e0995e..416242b9c158 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -2765,6 +2765,7 @@ void ib_set_device_ops(struct ib_device *dev, const struct ib_device_ops *ops)
 	SET_DEVICE_OP(dev_ops, map_mr_sg);
 	SET_DEVICE_OP(dev_ops, map_mr_sg_pi);
 	SET_DEVICE_OP(dev_ops, mmap);
+	SET_DEVICE_OP(dev_ops, mmap_get_pfns);
 	SET_DEVICE_OP(dev_ops, mmap_free);
 	SET_DEVICE_OP(dev_ops, modify_ah);
 	SET_DEVICE_OP(dev_ops, modify_cq);
@@ -2775,6 +2776,7 @@ void ib_set_device_ops(struct ib_device *dev, const struct ib_device_ops *ops)
 	SET_DEVICE_OP(dev_ops, modify_srq);
 	SET_DEVICE_OP(dev_ops, modify_wq);
 	SET_DEVICE_OP(dev_ops, peek_cq);
+	SET_DEVICE_OP(dev_ops, pgoff_to_mmap_entry);
 	SET_DEVICE_OP(dev_ops, pre_destroy_cq);
 	SET_DEVICE_OP(dev_ops, poll_cq);
 	SET_DEVICE_OP(dev_ops, port_groups);
diff --git a/drivers/infiniband/core/ib_core_uverbs.c b/drivers/infiniband/core/ib_core_uverbs.c
index b51bd7087a88..1de72ff4610c 100644
--- a/drivers/infiniband/core/ib_core_uverbs.c
+++ b/drivers/infiniband/core/ib_core_uverbs.c
@@ -5,9 +5,13 @@
  * Copyright 2019 Marvell. All rights reserved.
  */
 #include <linux/xarray.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 #include "uverbs.h"
 #include "core_priv.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 /**
  * rdma_umap_priv_init() - Initialize the private data of a vma
  *
@@ -229,12 +233,29 @@ EXPORT_SYMBOL(rdma_user_mmap_entry_put);
  */
 void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
 {
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
+
 	if (!entry)
 		return;
 
+	mutex_lock(&entry->dmabufs_lock);
 	xa_lock(&entry->ucontext->mmap_xa);
 	entry->driver_removed = true;
 	xa_unlock(&entry->ucontext->mmap_xa);
+	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
+		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
+		list_del(&uverbs_dmabuf->dmabufs_elm);
+		uverbs_dmabuf->revoked = true;
+		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
+				      DMA_RESV_USAGE_BOOKKEEP, false,
+				      MAX_SCHEDULE_TIMEOUT);
+		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
+		kref_put(&uverbs_dmabuf->kref, ib_uverbs_dmabuf_done);
+		wait_for_completion(&uverbs_dmabuf->comp);
+	}
+	mutex_unlock(&entry->dmabufs_lock);
+
 	kref_put(&entry->ref, rdma_user_mmap_entry_free);
 }
 EXPORT_SYMBOL(rdma_user_mmap_entry_remove);
@@ -274,6 +295,9 @@ int rdma_user_mmap_entry_insert_range(struct ib_ucontext *ucontext,
 		return -EINVAL;
 
 	kref_init(&entry->ref);
+	INIT_LIST_HEAD(&entry->dmabufs);
+	mutex_init(&entry->dmabufs_lock);
+
 	entry->ucontext = ucontext;
 
 	/*
diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
index b6eda2fb0911..3e0a8b9cd288 100644
--- a/drivers/infiniband/core/rdma_core.c
+++ b/drivers/infiniband/core/rdma_core.c
@@ -809,21 +809,10 @@ const struct uverbs_obj_type_class uverbs_idr_class = {
 };
 EXPORT_SYMBOL(uverbs_idr_class);
 
-/*
- * Users of UVERBS_TYPE_ALLOC_FD should set this function as the struct
- * file_operations release method.
- */
-int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
+int uverbs_uobject_release(struct ib_uobject *uobj)
 {
 	struct ib_uverbs_file *ufile;
-	struct ib_uobject *uobj;
 
-	/*
-	 * This can only happen if the fput came from alloc_abort_fd_uobject()
-	 */
-	if (!filp->private_data)
-		return 0;
-	uobj = filp->private_data;
 	ufile = uobj->ufile;
 
 	if (down_read_trylock(&ufile->hw_destroy_rwsem)) {
@@ -850,6 +839,21 @@ int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
 	uverbs_uobject_put(uobj);
 	return 0;
 }
+
+/*
+ * Users of UVERBS_TYPE_ALLOC_FD should set this function as the struct
+ * file_operations release method.
+ */
+int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
+{
+	/*
+	 * This can only happen if the fput came from alloc_abort_fd_uobject()
+	 */
+	if (!filp->private_data)
+		return 0;
+
+	return uverbs_uobject_release(filp->private_data);
+}
 EXPORT_SYMBOL(uverbs_uobject_fd_release);
 
 /*
diff --git a/drivers/infiniband/core/rdma_core.h b/drivers/infiniband/core/rdma_core.h
index a59b087611cb..55f1e3558856 100644
--- a/drivers/infiniband/core/rdma_core.h
+++ b/drivers/infiniband/core/rdma_core.h
@@ -156,6 +156,7 @@ extern const struct uapi_definition uverbs_def_obj_counters[];
 extern const struct uapi_definition uverbs_def_obj_cq[];
 extern const struct uapi_definition uverbs_def_obj_device[];
 extern const struct uapi_definition uverbs_def_obj_dm[];
+extern const struct uapi_definition uverbs_def_obj_dmabuf[];
 extern const struct uapi_definition uverbs_def_obj_dmah[];
 extern const struct uapi_definition uverbs_def_obj_flow_action[];
 extern const struct uapi_definition uverbs_def_obj_intf[];
diff --git a/drivers/infiniband/core/uverbs.h b/drivers/infiniband/core/uverbs.h
index 797e2fcc8072..895a4eaa050a 100644
--- a/drivers/infiniband/core/uverbs.h
+++ b/drivers/infiniband/core/uverbs.h
@@ -133,6 +133,18 @@ struct ib_uverbs_completion_event_file {
 	struct ib_uverbs_event_queue		ev_queue;
 };
 
+struct ib_uverbs_dmabuf_file {
+	struct ib_uobject uobj;
+	struct dma_buf *dmabuf;
+	struct list_head dmabufs_elm;
+	struct rdma_user_mmap_entry *mmap_entry;
+	struct dma_buf_phys_vec phys_vec;
+	struct p2pdma_provider *provider;
+	struct kref kref;
+	struct completion comp;
+	u8 revoked :1;
+};
+
 struct ib_uverbs_event {
 	union {
 		struct ib_uverbs_async_event_desc	async;
@@ -290,4 +302,13 @@ ib_uverbs_get_async_event(struct uverbs_attr_bundle *attrs,
 void copy_port_attr_to_resp(struct ib_port_attr *attr,
 			    struct ib_uverbs_query_port_resp *resp,
 			    struct ib_device *ib_dev, u8 port_num);
+
+static inline void ib_uverbs_dmabuf_done(struct kref *kref)
+{
+	struct ib_uverbs_dmabuf_file *priv =
+		container_of(kref, struct ib_uverbs_dmabuf_file, kref);
+
+	complete(&priv->comp);
+}
+
 #endif /* UVERBS_H */
diff --git a/drivers/infiniband/core/uverbs_std_types_dmabuf.c b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
new file mode 100644
index 000000000000..dfdfcd1d1a44
--- /dev/null
+++ b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES. All rights reserved
+ */
+
+#include <linux/dma-buf-mapping.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/dma-resv.h>
+#include <rdma/uverbs_std_types.h>
+#include "rdma_core.h"
+#include "uverbs.h"
+
+static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	if (!attachment->peer2peer)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static struct sg_table *
+uverbs_dmabuf_map(struct dma_buf_attachment *attachment,
+		  enum dma_data_direction dir)
+{
+	struct ib_uverbs_dmabuf_file *priv = attachment->dmabuf->priv;
+	struct sg_table *ret;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	if (priv->revoked)
+		return ERR_PTR(-ENODEV);
+
+	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
+				      &priv->phys_vec, 1, priv->phys_vec.len,
+				      dir);
+	if (IS_ERR(ret))
+		return ret;
+
+	kref_get(&priv->kref);
+	return ret;
+}
+
+static void uverbs_dmabuf_unmap(struct dma_buf_attachment *attachment,
+				struct sg_table *sgt,
+				enum dma_data_direction dir)
+{
+	struct ib_uverbs_dmabuf_file *priv = attachment->dmabuf->priv;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+	dma_buf_free_sgt(attachment, sgt, dir);
+	kref_put(&priv->kref, ib_uverbs_dmabuf_done);
+}
+
+static int uverbs_dmabuf_pin(struct dma_buf_attachment *attach)
+{
+	return -EOPNOTSUPP;
+}
+
+static void uverbs_dmabuf_unpin(struct dma_buf_attachment *attach)
+{
+}
+
+static void uverbs_dmabuf_release(struct dma_buf *dmabuf)
+{
+	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
+
+	/*
+	 * This can only happen if the fput came from alloc_abort_fd_uobject()
+	 */
+	if (!priv->uobj.context)
+		return;
+
+	uverbs_uobject_release(&priv->uobj);
+}
+
+static const struct dma_buf_ops uverbs_dmabuf_ops = {
+	.attach = uverbs_dmabuf_attach,
+	.map_dma_buf = uverbs_dmabuf_map,
+	.unmap_dma_buf = uverbs_dmabuf_unmap,
+	.pin = uverbs_dmabuf_pin,
+	.unpin = uverbs_dmabuf_unpin,
+	.release = uverbs_dmabuf_release,
+};
+
+static int UVERBS_HANDLER(UVERBS_METHOD_DMABUF_ALLOC)(
+	struct uverbs_attr_bundle *attrs)
+{
+	struct ib_uobject *uobj =
+		uverbs_attr_get(attrs, UVERBS_ATTR_ALLOC_DMABUF_HANDLE)
+			->obj_attr.uobject;
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
+		container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
+	struct ib_device *ib_dev = attrs->context->device;
+	struct rdma_user_mmap_entry *mmap_entry;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	off_t pg_off;
+	int ret;
+
+	ret = uverbs_get_const(&pg_off, attrs, UVERBS_ATTR_ALLOC_DMABUF_PGOFF);
+	if (ret)
+		return ret;
+
+	mmap_entry = ib_dev->ops.pgoff_to_mmap_entry(attrs->context, pg_off);
+	if (!mmap_entry)
+		return -EINVAL;
+
+	ret = ib_dev->ops.mmap_get_pfns(mmap_entry, &uverbs_dmabuf->phys_vec,
+					&uverbs_dmabuf->provider);
+	if (ret)
+		goto err;
+
+	exp_info.ops = &uverbs_dmabuf_ops;
+	exp_info.size = uverbs_dmabuf->phys_vec.len;
+	exp_info.flags = O_CLOEXEC;
+	exp_info.priv = uverbs_dmabuf;
+
+	uverbs_dmabuf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(uverbs_dmabuf->dmabuf)) {
+		ret = PTR_ERR(uverbs_dmabuf->dmabuf);
+		goto err;
+	}
+
+	kref_init(&uverbs_dmabuf->kref);
+	init_completion(&uverbs_dmabuf->comp);
+	INIT_LIST_HEAD(&uverbs_dmabuf->dmabufs_elm);
+	mutex_lock(&mmap_entry->dmabufs_lock);
+	if (mmap_entry->driver_removed)
+		ret = -EIO;
+	else
+		list_add_tail(&uverbs_dmabuf->dmabufs_elm, &mmap_entry->dmabufs);
+	mutex_unlock(&mmap_entry->dmabufs_lock);
+	if (ret)
+		goto err_revoked;
+
+	uobj->object = uverbs_dmabuf->dmabuf->file;
+	uverbs_dmabuf->mmap_entry = mmap_entry;
+	uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_ALLOC_DMABUF_HANDLE);
+	return 0;
+
+err_revoked:
+	dma_buf_put(uverbs_dmabuf->dmabuf);
+err:
+	rdma_user_mmap_entry_put(mmap_entry);
+	return ret;
+}
+
+DECLARE_UVERBS_NAMED_METHOD(
+	UVERBS_METHOD_DMABUF_ALLOC,
+	UVERBS_ATTR_FD(UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
+		       UVERBS_OBJECT_DMABUF,
+		       UVERBS_ACCESS_NEW,
+		       UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY));
+
+static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
+					  enum rdma_remove_reason why)
+{
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
+		container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
+	bool wait_for_comp = false;
+
+	mutex_lock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
+	dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
+	if (!uverbs_dmabuf->revoked) {
+		uverbs_dmabuf->revoked = true;
+		list_del(&uverbs_dmabuf->dmabufs_elm);
+		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
+				      DMA_RESV_USAGE_BOOKKEEP, false,
+				      MAX_SCHEDULE_TIMEOUT);
+		wait_for_comp = true;
+	}
+	dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
+	if (wait_for_comp) {
+		kref_put(&uverbs_dmabuf->kref, ib_uverbs_dmabuf_done);
+		/* Let's wait till all DMA unmap are completed. */
+		wait_for_completion(&uverbs_dmabuf->comp);
+	}
+	mutex_unlock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
+
+	/* Matches the get done as part of pgoff_to_mmap_entry() */
+	rdma_user_mmap_entry_put(uverbs_dmabuf->mmap_entry);
+}
+
+DECLARE_UVERBS_NAMED_OBJECT(
+	UVERBS_OBJECT_DMABUF,
+	UVERBS_TYPE_ALLOC_FD(sizeof(struct ib_uverbs_dmabuf_file),
+			     uverbs_dmabuf_fd_destroy_uobj,
+			     NULL, NULL, O_RDONLY),
+			     &UVERBS_METHOD(UVERBS_METHOD_DMABUF_ALLOC));
+
+const struct uapi_definition uverbs_def_obj_dmabuf[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(UVERBS_OBJECT_DMABUF),
+				      UAPI_DEF_OBJ_NEEDS_FN(mmap_get_pfns),
+				      UAPI_DEF_OBJ_NEEDS_FN(pgoff_to_mmap_entry),
+	{}
+};
diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index e00ea63175bd..38d0bbbee796 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -631,6 +631,7 @@ static const struct uapi_definition uverbs_core_api[] = {
 	UAPI_DEF_CHAIN(uverbs_def_obj_cq),
 	UAPI_DEF_CHAIN(uverbs_def_obj_device),
 	UAPI_DEF_CHAIN(uverbs_def_obj_dm),
+	UAPI_DEF_CHAIN(uverbs_def_obj_dmabuf),
 	UAPI_DEF_CHAIN(uverbs_def_obj_dmah),
 	UAPI_DEF_CHAIN(uverbs_def_obj_flow_action),
 	UAPI_DEF_CHAIN(uverbs_def_obj_intf),
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 6c372a37c482..5be67013c8ae 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -43,6 +43,7 @@
 #include <uapi/rdma/rdma_user_ioctl.h>
 #include <uapi/rdma/ib_user_ioctl_verbs.h>
 #include <linux/pci-tph.h>
+#include <linux/dma-buf.h>
 
 #define IB_FW_VERSION_NAME_MAX	ETHTOOL_FWVERS_LEN
 
@@ -2363,6 +2364,9 @@ struct rdma_user_mmap_entry {
 	unsigned long start_pgoff;
 	size_t npages;
 	bool driver_removed;
+	/* protects access to dmabufs */
+	struct mutex dmabufs_lock;
+	struct list_head dmabufs;
 };
 
 /* Return the offset (in bytes) the user should pass to libc's mmap() */
@@ -2500,6 +2504,11 @@ struct ib_device_ops {
 	 * Therefore needs to be implemented by the driver in mmap_free.
 	 */
 	void (*mmap_free)(struct rdma_user_mmap_entry *entry);
+	int (*mmap_get_pfns)(struct rdma_user_mmap_entry *entry,
+			     struct dma_buf_phys_vec *phys_vec,
+			     struct p2pdma_provider **provider);
+	struct rdma_user_mmap_entry *(*pgoff_to_mmap_entry)(struct ib_ucontext *ucontext,
+							    off_t pg_off);
 	void (*disassociate_ucontext)(struct ib_ucontext *ibcontext);
 	int (*alloc_pd)(struct ib_pd *pd, struct ib_udata *udata);
 	int (*dealloc_pd)(struct ib_pd *pd, struct ib_udata *udata);
diff --git a/include/rdma/uverbs_types.h b/include/rdma/uverbs_types.h
index 26ba919ac245..6a253b7dc5ea 100644
--- a/include/rdma/uverbs_types.h
+++ b/include/rdma/uverbs_types.h
@@ -186,6 +186,7 @@ struct ib_uverbs_file {
 extern const struct uverbs_obj_type_class uverbs_idr_class;
 extern const struct uverbs_obj_type_class uverbs_fd_class;
 int uverbs_uobject_fd_release(struct inode *inode, struct file *filp);
+int uverbs_uobject_release(struct ib_uobject *uobj);
 
 #define UVERBS_BUILD_BUG_ON(cond) (sizeof(char[1 - 2 * !!(cond)]) -	\
 				   sizeof(char))
diff --git a/include/uapi/rdma/ib_user_ioctl_cmds.h b/include/uapi/rdma/ib_user_ioctl_cmds.h
index 35da4026f452..72041c1b0ea5 100644
--- a/include/uapi/rdma/ib_user_ioctl_cmds.h
+++ b/include/uapi/rdma/ib_user_ioctl_cmds.h
@@ -56,6 +56,7 @@ enum uverbs_default_objects {
 	UVERBS_OBJECT_COUNTERS,
 	UVERBS_OBJECT_ASYNC_EVENT,
 	UVERBS_OBJECT_DMAH,
+	UVERBS_OBJECT_DMABUF,
 };
 
 enum {
@@ -263,6 +264,15 @@ enum uverbs_methods_dmah {
 	UVERBS_METHOD_DMAH_FREE,
 };
 
+enum uverbs_attrs_alloc_dmabuf_cmd_attr_ids {
+	UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
+	UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
+};
+
+enum uverbs_methods_dmabuf {
+	UVERBS_METHOD_DMABUF_ALLOC,
+};
+
 enum uverbs_attrs_reg_dm_mr_cmd_attr_ids {
 	UVERBS_ATTR_REG_DM_MR_HANDLE,
 	UVERBS_ATTR_REG_DM_MR_OFFSET,

-- 
2.47.1

