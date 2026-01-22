Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIJUFcyScWlZJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693D611DD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9173810E836;
	Thu, 22 Jan 2026 03:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lkDT3wl3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013060.outbound.protection.outlook.com
 [40.107.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F16910E8A0;
 Thu, 22 Jan 2026 03:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKC8aPVu3Jjdb3nwyul8hmKpUFQipUo1sXBfxDrthfpZt5u+N0/7xNuvjfBTBM9PTWk1jNjxLqCmRtcqcprO4GSFLSopsX31BH9BAvAh/kQXqAk1vMcSkjX1lolQWp+Mp/zS8KrEg4/PcotPNP0WFhr/+iqu+uil/G1JXvSddLecRVCLept+ZJuZvFqxo7yyZl6XpIjFo60NVfGziwjd2X24IIwQqOZssnYhZv7AYuvd2wLCobE4eRGIh77qzztUQSXDdmBfvvlkjNFU9iNCTLBD3m2t6pVTQJQeIncQXsSocMN1HpPLYX6lw/Om/YbSbsOPbJBNdbWvpxklQSkH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REx9ZFL33SHL/Y3hf7WaBe4cOQ1mtKshVcngJgPkt0U=;
 b=iBU0mG5B17ocUhGevu1rviuc0TMdWk8p3qkY4ZmquaZ00VbMTd+YnIZ/I/UeKxeFlZ5GQIP0F2rgPz881d+iASvEym4Gflp48cAwcrYwXKkInMoJAUwNF/VBOIVS5FExM4/BFc3MIs+a+TytELdvBDlVIK27t3J6oXD2dcEZQAk0qLtl3cl0N208J7ngcqdTb/NvIFpZbbvhTUNwVFaRZrhn/c3m2xdVw57hxE9OETLZwdQhm/4sCspiPFErEGv6FuhOXYRned85rHYdW9L213ppm0CwFAxp14Pdg84VSmvYiWB2VUe4PziOGOtE6q4SLvJqer/jf3uww1Nw0F+6dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REx9ZFL33SHL/Y3hf7WaBe4cOQ1mtKshVcngJgPkt0U=;
 b=lkDT3wl3O04HB+rwNLjn8EPctYtKsvP1iSOnpfoBaWcCWxdW5vyxeaSyYzzb/pB85/kX3jsD7CIctTeFlTUcUu1S2et/laKYpzSklAFKUzyHUJ85cjT8ZXhryPrN8VE/03NBa/rYtiBPj2kPAw1nUUEZnMOy4f8885cj6sCCoG8OfYujx009Q58o6ky2ZTevuVuQ2+9EKA3KCXLiJKZlgeZErFSd7ch7BoYy2smSf9dyAYGJD278VRM/RnjWicyEudf8NXfXmHf4R8Z569orRd/fgjqCL/3vhfkO17dtktARWPW1PcfwyNfXkDATyvZ8r4Xq/sV7hHcdEQ6KX2IFdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 03:00:19 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 03:00:17 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 22 Jan 2026 11:59:04 +0900
Subject: [PATCH 1/4] gpu: nova-core: gsp: fix incorrect advancing of write
 pointer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-nova-core-cmdq1-v1-1-7f8fe4683f11@nvidia.com>
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f0e476-3884-4da5-5170-08de59625f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXpiL2FOVUsrd1Fhb2tGTTRVYXpkTUdxaXk2dG5wemVHbk1LaGRBQjNuWGhx?=
 =?utf-8?B?UXRQc09sRmx3Ui9rNjZpZzZkdTR5cXFaQlJCcjZSdXlSK3l2cnp2V2UyMHdV?=
 =?utf-8?B?ODhwODVWQ3lFaGJkTkJEbVZhY3NYdnFlckN1MndwbElSN3gvdE9Pa1ZWeFhz?=
 =?utf-8?B?U1IxSFl1ZitrTTNqbDhWN1NBZ0g0WktDY3dDN21HRCtoQkpzNlZ2WVN4ZTVI?=
 =?utf-8?B?bGFzZC9SRDFDdTNIbTBKcXZOTWtveGlXdkMyMThSblc2elc2cWtxRzBLUVlu?=
 =?utf-8?B?cjJ4cVk0aVMzU0N5eXhpSVpaa2dTVmpCcDJ1a0psZy8xb3BKQ2szczFPNyty?=
 =?utf-8?B?SitOVEJjUDdsY3lzSGRQdXdzRWNqRVNUaEJoMHRUZXBKNkxVUm1ISzMwQTBK?=
 =?utf-8?B?eVViZmRxTTVacnFCMVdDaE44Rm5SYWVIY0hvSXI0andPcjZzUG9xUENOY2Fa?=
 =?utf-8?B?Y1V5WWFFREZDRzg3OFd3ZExkZ0I0RW52UmhCZjQ2Z1o0ODNoLzdSOUhzNzlP?=
 =?utf-8?B?TTZsMFBsVEpJa2dUT0F6TTBpRFgzQVE1SGQvcXg3VGx5QUxBWGFkZ0IxejNX?=
 =?utf-8?B?TytzV1Y2eU9GeDZxb1VDeGQxSWpMM2pxRUY4UzlKQTFPQW1ZNGpydG1PQnVG?=
 =?utf-8?B?c1VQeG1vTU1hVkJPWS9haEpBOUdwYmZXYkdYVmJkQmx0OXhPSm9lU05nOGFP?=
 =?utf-8?B?aVZGaUszYjNRZWh3aDEvTjZKK0tvbFlCQUVRenpMcjVLUys0bEJySW1WZW9C?=
 =?utf-8?B?Wm9zcnhHYzlmVnR1eTduelZPV3phOUNISXUxUVNPZmo1RnFIczZVSzNPZEd4?=
 =?utf-8?B?VERFZEFxWmo3ejRleUdNVXFHd3FHd3ZnYlRGNU1IdzFjaDZsemovcmROekVJ?=
 =?utf-8?B?MytmaWtvZ2UwLzZCYzVHN1M3aWV4U3laR3VLYmFmUjIyRVY5a0lRZTZ4UHJa?=
 =?utf-8?B?bk9VVjVma2piY01TQnovaVBpWlkzL1lhYWdnbllwcUFTVkdreWZOb09taStN?=
 =?utf-8?B?U2U2elM5ZXYyQmhWZ05JL1RFb3lVM29oVTVpWnFHelV2d2h2ZDlSWVFZL2NZ?=
 =?utf-8?B?SGFkTmJsN2ZPenpaNU5FWWp5c1FhYnlTam9JbjJoSUdjNDE3UEVjU1g2TDlB?=
 =?utf-8?B?SDVWL1lzVGlUTkppWkF0aHJTa1RpZHhUTSt3ME84R2wvYXBOUjVWWnY5SURo?=
 =?utf-8?B?Nmk4dGNpbjMrV0w4b2dwWTVwRXkvOUQwY2s2QUZvQ054YXdkUWkyTC9FcDBQ?=
 =?utf-8?B?b0hCTWYvampjRnprYTRFbW1FT0pxeWR2TTJXWUcrUC9va1piemRCQTBTaHdt?=
 =?utf-8?B?OHJjTmVmRnpDQUptSVI1T3JpbjhFRGVSK2I2WXdYZGdFeVNtazQwYXBGN2tS?=
 =?utf-8?B?Yk93WlJuMm0zZW8vNHFLZXp1bEYrS2ZFTUpPdDJlcFVXaGdVTm5uSG15akla?=
 =?utf-8?B?ZjZHbFhSeFBMOGhSeHdDenNVVUxnQWIrQmhKUzFJZlQxUkhGUXEzRFBVVDdO?=
 =?utf-8?B?Q3EybHFxVkVlb0hWYmsxSHE3OXUvbVhMSHV6MzVKMkkvYU1KRzQ2enFTM0dP?=
 =?utf-8?B?ZXUvcVJrNDhuQXB5a0ZrUDVEdUFiMEVuZ3NrcFpVZFZkdFp6T1NTVS9xWmh3?=
 =?utf-8?B?emtrT09rWlhTSGkwWitrRWl3QlNzc1Z4bmNzaklQN0JvSVh0MjBLU1lUUjBL?=
 =?utf-8?B?aXlBR0xlSUlyazNGdWJQYnV2a2VaZDQrNmZBMTkrUmVnYjgwUUdKTW5KM0dC?=
 =?utf-8?B?NVRBcHpPODFHdHFLSVYwTmhKcjRUS0lFNEpoRVJPNkxWQXlITm9sbjZxUENh?=
 =?utf-8?B?SW1Yb2pzWXNxdkFnM0xKaEhEenNQdzJBTi8xcy9QaGgzSjdzUndHK1hHSDFZ?=
 =?utf-8?B?RU1kNGFyNXFIOVNMbjFsRTJUWGJJbDhVQ0N0WU9pUWx3SFBqb3laTWp3Ny9I?=
 =?utf-8?B?TlhDL2g5cHM5QmcxNnJYNFlYUzJ4bWpoNXhmQjVVQ2VZZXVDRndOazRuZWow?=
 =?utf-8?B?V3RMdGF6bnNvcnJMYkpKTVc1eGZzdHd5VzhST0psVVZtNHVLUVRBaThVMUNz?=
 =?utf-8?B?TlBQM3FtSHBqTTgyZmVXSFVrZEszQmNhNUhZOVpwalNkQkYwL0l0ejE1Ulo4?=
 =?utf-8?Q?9OR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU83UHlHRWNnSFZWb2FEWWZWOHFTczlRYWNRWGJxQ0xrWHNmT1dBQUpvNVk3?=
 =?utf-8?B?Z1paK3F5QlVoRDNxNmt0YnU4Zk9CWUt5azFBZVJiQnlBWUdXSzI3QlhOa0tZ?=
 =?utf-8?B?OU9nbnRFYmtpYVZueG5VMW90V0o4M204WW5ycTgzeVpqSkpLV0xvb0Y1cHpE?=
 =?utf-8?B?WTRMdEk2bXdVeUR6eVltUEVBNTBHNEkvZnAxQmZpSnViS3VhY2NwM3BQRW9p?=
 =?utf-8?B?VTdzaGtsYzdEUHk4czBUQWRUdGd0cDc1WGNNdGRnTWVUa2hQTVlQMk1VY2R3?=
 =?utf-8?B?djROYjZrclBCVzhLeEdkMm8zTm5CUkgxTXFQajhVZUJZcGUzZDdsVE8yZmto?=
 =?utf-8?B?cDYxRFFQMHZQUTRBVXpnZStxd21UcXYzQnlUK3RLNHczR0tiRjdRempxL3RW?=
 =?utf-8?B?V2R6Nk9zRXgzRjRiTVNaamxCRUJBQjhvUXZjVFZKb0Zkb0UxQWx2ZCtQNngy?=
 =?utf-8?B?eGZUdXUxVUdMUjgxdjNhTENZUUpVSmlxV0xxNGt3SUUyb1F1eE5xc3VGNWRj?=
 =?utf-8?B?cmNHT0Qxei9tTnRhVGpQbmhpbkI1OTFLREd0WUZFQzlXUUlEcDNUcDNXdkp4?=
 =?utf-8?B?M0VRN0MrQ0tVTi9PK3BIQ0JXdWhJRUhBd0Y2YThRVjRzbWl5NmFkTXZPd3Ra?=
 =?utf-8?B?Y1l4SWI1L3BpMncvWFBIbTYzRmVWRnF6dG9VR0t0Z2FQcXNSSlhIUHdwQVBy?=
 =?utf-8?B?Q0RsUDlVSUNtZHNRQ0FYVHdoWjZIQVh2M3VlcTBlNUcvKzZSRmxUeVNaQkxw?=
 =?utf-8?B?TjlZV1ozdjYyZ29aVjBFNFp0NG9Rc2p5bmZ6RDRkS1pKUEVvZEEyeUVQYklv?=
 =?utf-8?B?K0pqUVllRHNueG9rMWwrOGovYnZ3UFNNNXc1OC9VK3I0WngyemYwNlNmRDJZ?=
 =?utf-8?B?SEo1MGVlMjVudFR6cDdMLzVkODJPeXdlbSsxcDFvc0U0Snc1YW9mMUZsTC9m?=
 =?utf-8?B?bGRNWFZqSEVlMW10K1NwL1o1MTZmUC95aWRDQzV6Z0lOa3c2ZkN5RkxZQTIz?=
 =?utf-8?B?WUJjRy84eVdmZG5PY1NLS2ovZ2h3WSszRkk2eDJyQ3F3TzFPTEY2cy94RXJI?=
 =?utf-8?B?bWE3RktKS1lpK3dxOHIzUTU5cDRLMkJsdUJwMEJLcWFacy9xOTBEYWRRczFn?=
 =?utf-8?B?Vloyd1JDYXFocXV5anF3M2ZrdzJ4YzJOMzFBQ1FrejFVVWIzbWI3anZpK2lU?=
 =?utf-8?B?UTVJMHVpODY1d1JFWXZ6VkpvU0VzeWRqQlh0UHQxNm5aaklueHVhRW5NL2w5?=
 =?utf-8?B?OEVyekVhSUozTjRVL3cvMXBIdjlBamdsaEdXRlFMbCtQZEU5eTRBWDZ0dlcr?=
 =?utf-8?B?T0hmR1ZhR21ialhHUXpOL1E5ZVhiQlNGR3NHK29mRnBLMDFhSVNoV3l6bVBH?=
 =?utf-8?B?VWIwU3RMYTg5MEN4dVdTUmNlRENVV0pyVURrYnVrQVRIZmp1cjNqcVNZSXBY?=
 =?utf-8?B?RVdhQkdYalV4cFVZNXltSmFkN0ZFOFZsZkpQNGc4WGtjVnM3RzAzMEVhTndV?=
 =?utf-8?B?MlpJWjFJbmhCcTJOMFNNdElIVU9LSFdSMnB1TXBOQ3g1dUNHdjBiNmlOVzBE?=
 =?utf-8?B?VkdNa3VVaEY4a0lBdWFONGFhOXZkRWZRSjFWTENPZUtCMEVSMjdMT0hEbzQ3?=
 =?utf-8?B?clZYZWF4WDk5a3FKUFV5Ri9ESDNKdzhTTzdnYnNXbVk3VjFBWlFPVnNBRVNh?=
 =?utf-8?B?RWtuUVY3SC9DMjU1THdpK3BUMnJmVENtaTEwK0xPMERrZnhNMzBJQUZOdU5E?=
 =?utf-8?B?b2txL3Ura2h2Z3N4QzNNc1l5OHR3bW9TUUh4NkFjdEtZUnUrR1N2Vjdxa3ZQ?=
 =?utf-8?B?Ym9obUkrTUd4VTA2TG5ZeVY2NFZnUXNJTDNiK0lPOVhHNlM3OUY0UGZtZ1FE?=
 =?utf-8?B?MXEvYys4VVdocm9ObW5HUVY5eFpMSzlpeVVoa2d5enJrMUYwTmtlb1NQSWNN?=
 =?utf-8?B?ZVF1cU5Qc0JoeGVaNGtJd2ZocVM5Z2V5NVRDYVoyVzZhRHZZaXRMOEd2OVRi?=
 =?utf-8?B?a2x2TDRSU2ROQUNIVElIbGU5WTR1b2hacW1vejNqZFFBMFZqVmhydmJ3bGdr?=
 =?utf-8?B?ZDJmVXFVbEl3V3Fici9uaU1FVDNQSm91OUZrSDVzVXRQSTJTZzFyS2JCVUw5?=
 =?utf-8?B?U3hzMERXakYwR0NTWDUvZTVsTGZrRHRNZEpPYUpUNy8wSGw4YWliTXdoNVFs?=
 =?utf-8?B?dkVkSUZDWXhMRnJNdS9CeHI0Z2NIT3QrdnN2aVk2TVdCY1pnc3RGVHhBRUl5?=
 =?utf-8?B?UisxTEwwNlNEblJveUt4MDFBSWJmK0NqN0xxRnZjSlNNZ2pWc2xUMDhpQTdQ?=
 =?utf-8?B?NUxFVUx2eUtpY2UySzNMTDQrWXl3a2phWmc2YUg0RUxOVk1XWGtoWXJjc3ZO?=
 =?utf-8?Q?6CFYHFay2JMZZsCTkvDeG04O4epb/mJmNlSjd+J4rfxB3?=
X-MS-Exchange-AntiSpam-MessageData-1: fIPGusII6Ym6Gg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f0e476-3884-4da5-5170-08de59625f2b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:00:17.4542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nxk+MyxyvdtGv2nh8Ae/NP+SJ1tmwjWy/Ks9q3KRBAcqmvnTvlj1Fn2fsj5MFSnz/8zA4evia3UHd7yw+1Yxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 0693D611DD
X-Rspamd-Action: no action

We should modulo not bitwise-and here. The current code could, for
example, set wptr to MSGQ_NUM_PAGES which is not valid.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..f139aad7af3f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -384,7 +384,7 @@ fn cpu_write_ptr(&self) -> u32 {
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
+        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         let gsp_mem = self.0.start_ptr_mut();
 
         // SAFETY:

-- 
2.52.0

