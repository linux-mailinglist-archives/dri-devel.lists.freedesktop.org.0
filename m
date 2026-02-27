Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHVQLz6PoWkruQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291241B71CE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9151E10E189;
	Fri, 27 Feb 2026 12:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N/+2+Gc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907CC10E5F1;
 Fri, 27 Feb 2026 12:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4di6MUecVPQRFey1InMpykh/Q+D0qR/a1PEcLSbjH2/7VOuyOuo0ufGs0teK1ED6GUyNGFPT9XbfsRPnjWC2erPFKlNYA+qAZKVircHoLTaY0QVH2tpHW91cTP2+uIYp6nckNh5g5ZyD0StKdkmVJs9E0jfthID9gjhzxnRViVZSmzUc+FEPHLiJ3htCt1ddO8aB7lJw38HNGw61SOBh8WaqLdcE/FVIZxotzqpNLWtSSeQA9kQtaIqbNCaTdTxvqIy10xx9t/BsXpaG/fusHvxOEH6ym/rIuC1G4y+PuOalk1D2XcuFuKNQj7tYuHXyZfj8sKMKFAXUsDnDxOVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wHaLeiWym0mnWXOKFYtk17jkvO4aDmTzYsMQvU1U1I=;
 b=DJ8l4HEVwEmfkPQjrRfh5Vj9UGq6ZSzv37DrhJVwL6AIjzJyoSzrwHVSNR4rQqxBsKg7PsUYxAGQjvPfzb3o1p9oKTZ6RbGkbAt4Htnrn+NnTe8sQqXRqKVz/Dv4t8YtSmHhHPhjPc1L3/49IpsJKdI+M0lepf4KnQBeD20SBfIs6MRpwsCw/21aXZFfV/om9XMLTTnMa6H8ceEnpUoX+DKPpaVxtACfqcXkTTag4CBuK2C33wuutju9GkYT5v8lsgofjqsjvXWXYayXUR+w8voud8pUiqteuKODucD28yPECEY/XXiDiQIu7NK0SlT0JNRJ130w4sePBf2oJyhx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wHaLeiWym0mnWXOKFYtk17jkvO4aDmTzYsMQvU1U1I=;
 b=N/+2+Gc0TUBePjra8Z6cC67X6/Xqm/Dl8Y97kP5zm20r/NmtKZgdc2gKrbXkUHa4DiPbuzuIJgqNayZ/s6ed75OiF1NUunPoQ6G7BtiEFxl7I9OvU+P5wXeoU1ssb9wi5veaMrhk/gyB9FjVsDv0Q0foiLnea0rwUfxRLkPPob2C+ITReikq95aJ7Xo+8pFeKE8ncjdNrbYVUvTpUcv7wMA0p7r9zsDv1MWMgyj4GDoOTvb3wtVt9cLUZc6GCgMyOhl8bHGowHdluhmhYTca3TvS5Efe+LW3MQCMOZ7i7hap8Sfgqip7irRMyTUAezlCpQAqserIMIGnpWwT81Recg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:32:47 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:32:47 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:06 +0900
Subject: [PATCH 1/9] gpu: nova-core: gsp: add NV_STATUS error code bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-1-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 063f9af7-6f50-4d80-e7f6-08de75fc5048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: T4sYECvPdA1SmszcdPIJSeVV3h8OCRsOt+fB2uJeO3VEYK739D2WDAateULjiw8yVGBWvMUzngzjgpZJBOSumvIrKX8GF88fxuhwl/TjitLDwyFtu5g1W7op4FFRLUKqXNENGZxJFYT7XRmbPjZI+tkflPF0l+CEaZkQCeOW23RgIxltYSreJ87nHyzqftkOQglGCMa2aGzXgtmolKTeXMO4Uv0Ki5q23OVXnZmCdFacRCPdseDmcCGXnDvkIqBDoNfvPjVZEsA6QjgxYjNnvUOADCaZmU7clIogYSWB34VlzT+zjPUqRLuTbUN3ePTfNB3wwklnKLOGdo8xF1qlIaFIjkOHEmzCHRR5p1Vlsj3a4smoyzIID0PLj4SRxrPMWWpYTs+b1tg0LLWEweJEAp9Maf0SLMwQ1OrPsrEewBenhsX9Qwx7wtwWVZiibRx6h+UjAYfbW2cok4FGBAq809BpCWEGjMfk2QL0S95rM3jgsWDOxmDyiPO1iSlEgXDGkluCMJR98n1fXnFrRItJIqmXyD71HXzqk0+jo3W6LWNAo3TAWhWYu8Nm2ZfR9lkJ+d14hURrq3mVfT+3cvwUTrWzd6XT177VZifFdyS6QL0x8x0B354vA1j5SGwiiceSrKEtlafvjGMFZ7USyWQIXVk04ALqHEAg5tnVh54vtPkH4rzy/QoEPbh/zblHq3MJX9MHQrAiJhb5k5AYr7WtSdiiUJq5yQC44/4tGurO+jg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFBQWRhbTVlVGlpbXZsVmJmNFBGWEkwSUpXRit5MXVzVGhiSk83cU9mcnl1?=
 =?utf-8?B?dFkrZGRyU0VhOVVWRmlla3F6Y3hyemVSUU9wZDZqblpxYTZJaUpXWWU1MWt3?=
 =?utf-8?B?V0w1YWgrY2J5OEVyWldQWnpCU3BVaFBVcVRmTzVCSEVnVUFIZTc2UWtFMStp?=
 =?utf-8?B?MHozVGFoQUlPTkh5UVpFcGdibzhxZjhwa2NidS9vbUcvRStaRzRLUXN6dUt0?=
 =?utf-8?B?V0Iyc2ZuM1dIVXhQZmpGQ0E1UFo5b1FSc0dMVE5NL2NFRUxSdkFsYUppQXor?=
 =?utf-8?B?dUJtc2YxNC9rQzRaa0E5QUU3dE1XMThnTGNuTm5LRFlhVGRkRlN1R24veVpX?=
 =?utf-8?B?ejVhSVg3cVZRR3VyZGpwTGp0dFVzSnl0eFlYSUx3M2E3bVVvRlpwV29kNmk5?=
 =?utf-8?B?c0JUbUg1Z0o4bVp3R3ZYN2ZjdW1rckc3UW9IL25uM0dYbXFWNnlaVXVSaFk4?=
 =?utf-8?B?K2FpS3hOL2kvZWgzUXlGUTlGWGJsTFkySytjMk9TK2JPSGJtSitmakNvV3Q0?=
 =?utf-8?B?cGFZR0VwU241d3JBUUdoUTZhbXNqT1E4WWNIcWV1d0xyTVk4UEtDWmRQZEVJ?=
 =?utf-8?B?TWMzd3I2Y0JmNlVldWFZM25JTm9oTGNEaDhlVzlScGwvZTZQS0VVbVpXZDht?=
 =?utf-8?B?NHJMVEdiRFVERjJEazNPaVhyV2N5RmNlUWQ0MlVhS2FkWFJqcHU5V2JiYnhr?=
 =?utf-8?B?eWhoOHFtbU5NdTRlZitKRzJkRXZxMlFRdm9BaDl2ZjRoUXg2bzNzVE5FMDFQ?=
 =?utf-8?B?WW5SSWlZOVYyc2dRR1JLR1dSWHRERjdPTzZFQ0IxVGpmVHAzVWdnR0tuTGZv?=
 =?utf-8?B?MkFTNFNhbTgwcXZsSWRBU1NBMFdMRUFWZXg2Y2hxMjBHR3dqV0I2Zm4zNnMv?=
 =?utf-8?B?L2FJMGl1YnpudWkwaWJJSGY2MUVJUFptWCtONXFHbTdpRGxnY0FWK01YUHFP?=
 =?utf-8?B?bDlhTXRnUFMxVTBYRTlSRzJMbW5GS2NoMmtIZTEyZ256MUtoNi9jQmd2NjZJ?=
 =?utf-8?B?MW15YXd2dW94MG5FaTcxd3VhbzNjV1BDS3h4WGtYQ1IyQ1YrUEF2VlFLcDZP?=
 =?utf-8?B?RHNUVU9zZElIS3A3aXpOL2dOVis5aDh6dUxmYUdrcmJDczVpUWpEckMvZWVs?=
 =?utf-8?B?bzhaVHRDbitPT2NWWGZFRkcrSWs5OUFMTUlxVllkalRrY0NDUkRsNXpFQzE0?=
 =?utf-8?B?Ujh2Q0V6WHhpUUJiRDhCUWdFSkN4Ulg3ajBmMVJEcmZhTGhlRFlEM3VadzJa?=
 =?utf-8?B?UkJsQm9wcHRWbjMvSHYzLyt3d1cvOGsxMEI3NHZwYjJrZ2R5TnA3S0I5QXF3?=
 =?utf-8?B?YmUwYWRkK2JrcjRNTWREeW9vUTU2YTRWVVVzMWtRQlBFL1lINmZSSHVQaWps?=
 =?utf-8?B?UlJhbXV0Qll6R3orck1ZNHY0SEZqdmcyTTNOUnloeDFwd1c3d3NFZHRwbERZ?=
 =?utf-8?B?M0RmNlZHRGNYMVhwNFE2RFlWb3pIeFd2SjNCbEJxOW5sbk14R245SXNud3J0?=
 =?utf-8?B?bUQ2ZWs3N0o1OFZLSkdBWFBxSlpOdnlRb0U4VnRCQ1BJRUVnbmRMTXFwOVdX?=
 =?utf-8?B?N0puWFZTY3RoUnZieHBuMmdCOXVrRTRxL0JPdEhldVQzTGpXR01sK2FRMEY0?=
 =?utf-8?B?ckpIaU5xNGRHc3lIdDhaa05RYUEySkJpU3N5QzBiWG92dTJYZW02Yzh3eEhK?=
 =?utf-8?B?QzFuUGJzaXp1clppaVZZblFCQ2dLNTROZW43b01tZjV6TTRmbVh6U01OVHNr?=
 =?utf-8?B?ZzNZMFZEa245ZE9PcnRuT3BLd1BZdTUzZnN0SmpweXUrTktZeHRicVBZbWQv?=
 =?utf-8?B?RktHTEJ3a0hkOFpKWTF3bmlRbk1GdUkvV08veU9rNG9lZHlCTDJ1QWdpbjRu?=
 =?utf-8?B?T1pHV0JNUGZSQ1FrTkFkTzdVMVRKcER2U2p0UmlxMEpIZUI1emtvWVg2b0tk?=
 =?utf-8?B?cnRxdFlSZS8vM3VwVlpPODBFcDRpMWF4WUEzSXBaVzU2SEpIdlFNa00yZThY?=
 =?utf-8?B?QkhhT0I2SmpySWJZS2I4bVFHRjlNMTErTzd2bkNRUE5UY3lVKzZ1WU9CY1p3?=
 =?utf-8?B?N3FXYnpYemdaaUY2cFFmamRXZVU3Zk94NERmeEplbmJjVHI5bzI4a1duMk9C?=
 =?utf-8?B?aVdhSTFaalFvZEJMSk9pckI2N2QwZGQ0OUZKWnBJb2lKR3MwL2ExWFp5UFgy?=
 =?utf-8?B?UmJSOTFpUm9CL3dwMlhPaFU2MDRRMjc1M3lOYjhtRURUTSt5NW9yZ0xEZUdO?=
 =?utf-8?B?NFM0WkVvQW4rcGx2MnRQSjNZSGRCWXhEZFFsbUR6Q3BmVEV3MGJaVlcvcllM?=
 =?utf-8?B?VVRQNU1VTXoxdGx2UVMrRlRZQkNDSFplNnZHVWlnRlRBVFhhc3UvTnhJY2hS?=
 =?utf-8?Q?ejcAPVs+S2uJYnmGbBbi6JW5W87KYKvQrjgPc4Vk5Y1g2?=
X-MS-Exchange-AntiSpam-MessageData-1: +ZyywTj7qmtuRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063f9af7-6f50-4d80-e7f6-08de75fc5048
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:32:47.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUSE5SEqT4p7whcI2Hvw65OM+HKQ7XMWHHZU9E4ZVXygG8dDGEvAlBO8rdEwnRYJ8dXtMeCK/O+RvxYT0g8A5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 291241B71CE
X-Rspamd-Action: no action

Add bindgen generated constants for NV_STATUS. This is used for RM
control messages.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 144 ++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 334e8be5fde8..dd37a7fd58c6 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -379,6 +379,150 @@ pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
     pub __bindgen_padding_0: [u8; 4usize],
     pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
 }
+pub const NV_OK: _bindgen_ty_4 = 0;
+pub const NV_ERR_GENERIC: _bindgen_ty_4 = 65535;
+pub const NV_ERR_BROKEN_FB: _bindgen_ty_4 = 1;
+pub const NV_ERR_BUFFER_TOO_SMALL: _bindgen_ty_4 = 2;
+pub const NV_ERR_BUSY_RETRY: _bindgen_ty_4 = 3;
+pub const NV_ERR_CALLBACK_NOT_SCHEDULED: _bindgen_ty_4 = 4;
+pub const NV_ERR_CARD_NOT_PRESENT: _bindgen_ty_4 = 5;
+pub const NV_ERR_CYCLE_DETECTED: _bindgen_ty_4 = 6;
+pub const NV_ERR_DMA_IN_USE: _bindgen_ty_4 = 7;
+pub const NV_ERR_DMA_MEM_NOT_LOCKED: _bindgen_ty_4 = 8;
+pub const NV_ERR_DMA_MEM_NOT_UNLOCKED: _bindgen_ty_4 = 9;
+pub const NV_ERR_DUAL_LINK_INUSE: _bindgen_ty_4 = 10;
+pub const NV_ERR_ECC_ERROR: _bindgen_ty_4 = 11;
+pub const NV_ERR_FIFO_BAD_ACCESS: _bindgen_ty_4 = 12;
+pub const NV_ERR_FREQ_NOT_SUPPORTED: _bindgen_ty_4 = 13;
+pub const NV_ERR_GPU_DMA_NOT_INITIALIZED: _bindgen_ty_4 = 14;
+pub const NV_ERR_GPU_IS_LOST: _bindgen_ty_4 = 15;
+pub const NV_ERR_GPU_IN_FULLCHIP_RESET: _bindgen_ty_4 = 16;
+pub const NV_ERR_GPU_NOT_FULL_POWER: _bindgen_ty_4 = 17;
+pub const NV_ERR_GPU_UUID_NOT_FOUND: _bindgen_ty_4 = 18;
+pub const NV_ERR_HOT_SWITCH: _bindgen_ty_4 = 19;
+pub const NV_ERR_I2C_ERROR: _bindgen_ty_4 = 20;
+pub const NV_ERR_I2C_SPEED_TOO_HIGH: _bindgen_ty_4 = 21;
+pub const NV_ERR_ILLEGAL_ACTION: _bindgen_ty_4 = 22;
+pub const NV_ERR_IN_USE: _bindgen_ty_4 = 23;
+pub const NV_ERR_INFLATE_COMPRESSED_DATA_FAILED: _bindgen_ty_4 = 24;
+pub const NV_ERR_INSERT_DUPLICATE_NAME: _bindgen_ty_4 = 25;
+pub const NV_ERR_INSUFFICIENT_RESOURCES: _bindgen_ty_4 = 26;
+pub const NV_ERR_INSUFFICIENT_PERMISSIONS: _bindgen_ty_4 = 27;
+pub const NV_ERR_INSUFFICIENT_POWER: _bindgen_ty_4 = 28;
+pub const NV_ERR_INVALID_ACCESS_TYPE: _bindgen_ty_4 = 29;
+pub const NV_ERR_INVALID_ADDRESS: _bindgen_ty_4 = 30;
+pub const NV_ERR_INVALID_ARGUMENT: _bindgen_ty_4 = 31;
+pub const NV_ERR_INVALID_BASE: _bindgen_ty_4 = 32;
+pub const NV_ERR_INVALID_CHANNEL: _bindgen_ty_4 = 33;
+pub const NV_ERR_INVALID_CLASS: _bindgen_ty_4 = 34;
+pub const NV_ERR_INVALID_CLIENT: _bindgen_ty_4 = 35;
+pub const NV_ERR_INVALID_COMMAND: _bindgen_ty_4 = 36;
+pub const NV_ERR_INVALID_DATA: _bindgen_ty_4 = 37;
+pub const NV_ERR_INVALID_DEVICE: _bindgen_ty_4 = 38;
+pub const NV_ERR_INVALID_DMA_SPECIFIER: _bindgen_ty_4 = 39;
+pub const NV_ERR_INVALID_EVENT: _bindgen_ty_4 = 40;
+pub const NV_ERR_INVALID_FLAGS: _bindgen_ty_4 = 41;
+pub const NV_ERR_INVALID_FUNCTION: _bindgen_ty_4 = 42;
+pub const NV_ERR_INVALID_HEAP: _bindgen_ty_4 = 43;
+pub const NV_ERR_INVALID_INDEX: _bindgen_ty_4 = 44;
+pub const NV_ERR_INVALID_IRQ_LEVEL: _bindgen_ty_4 = 45;
+pub const NV_ERR_INVALID_LIMIT: _bindgen_ty_4 = 46;
+pub const NV_ERR_INVALID_LOCK_STATE: _bindgen_ty_4 = 47;
+pub const NV_ERR_INVALID_METHOD: _bindgen_ty_4 = 48;
+pub const NV_ERR_INVALID_OBJECT: _bindgen_ty_4 = 49;
+pub const NV_ERR_INVALID_OBJECT_BUFFER: _bindgen_ty_4 = 50;
+pub const NV_ERR_INVALID_OBJECT_HANDLE: _bindgen_ty_4 = 51;
+pub const NV_ERR_INVALID_OBJECT_NEW: _bindgen_ty_4 = 52;
+pub const NV_ERR_INVALID_OBJECT_OLD: _bindgen_ty_4 = 53;
+pub const NV_ERR_INVALID_OBJECT_PARENT: _bindgen_ty_4 = 54;
+pub const NV_ERR_INVALID_OFFSET: _bindgen_ty_4 = 55;
+pub const NV_ERR_INVALID_OPERATION: _bindgen_ty_4 = 56;
+pub const NV_ERR_INVALID_OWNER: _bindgen_ty_4 = 57;
+pub const NV_ERR_INVALID_PARAM_STRUCT: _bindgen_ty_4 = 58;
+pub const NV_ERR_INVALID_PARAMETER: _bindgen_ty_4 = 59;
+pub const NV_ERR_INVALID_PATH: _bindgen_ty_4 = 60;
+pub const NV_ERR_INVALID_POINTER: _bindgen_ty_4 = 61;
+pub const NV_ERR_INVALID_REGISTRY_KEY: _bindgen_ty_4 = 62;
+pub const NV_ERR_INVALID_REQUEST: _bindgen_ty_4 = 63;
+pub const NV_ERR_INVALID_STATE: _bindgen_ty_4 = 64;
+pub const NV_ERR_INVALID_STRING_LENGTH: _bindgen_ty_4 = 65;
+pub const NV_ERR_INVALID_READ: _bindgen_ty_4 = 66;
+pub const NV_ERR_INVALID_WRITE: _bindgen_ty_4 = 67;
+pub const NV_ERR_INVALID_XLATE: _bindgen_ty_4 = 68;
+pub const NV_ERR_IRQ_NOT_FIRING: _bindgen_ty_4 = 69;
+pub const NV_ERR_IRQ_EDGE_TRIGGERED: _bindgen_ty_4 = 70;
+pub const NV_ERR_MEMORY_TRAINING_FAILED: _bindgen_ty_4 = 71;
+pub const NV_ERR_MISMATCHED_SLAVE: _bindgen_ty_4 = 72;
+pub const NV_ERR_MISMATCHED_TARGET: _bindgen_ty_4 = 73;
+pub const NV_ERR_MISSING_TABLE_ENTRY: _bindgen_ty_4 = 74;
+pub const NV_ERR_MODULE_LOAD_FAILED: _bindgen_ty_4 = 75;
+pub const NV_ERR_MORE_DATA_AVAILABLE: _bindgen_ty_4 = 76;
+pub const NV_ERR_MORE_PROCESSING_REQUIRED: _bindgen_ty_4 = 77;
+pub const NV_ERR_MULTIPLE_MEMORY_TYPES: _bindgen_ty_4 = 78;
+pub const NV_ERR_NO_FREE_FIFOS: _bindgen_ty_4 = 79;
+pub const NV_ERR_NO_INTR_PENDING: _bindgen_ty_4 = 80;
+pub const NV_ERR_NO_MEMORY: _bindgen_ty_4 = 81;
+pub const NV_ERR_NO_SUCH_DOMAIN: _bindgen_ty_4 = 82;
+pub const NV_ERR_NO_VALID_PATH: _bindgen_ty_4 = 83;
+pub const NV_ERR_NOT_COMPATIBLE: _bindgen_ty_4 = 84;
+pub const NV_ERR_NOT_READY: _bindgen_ty_4 = 85;
+pub const NV_ERR_NOT_SUPPORTED: _bindgen_ty_4 = 86;
+pub const NV_ERR_OBJECT_NOT_FOUND: _bindgen_ty_4 = 87;
+pub const NV_ERR_OBJECT_TYPE_MISMATCH: _bindgen_ty_4 = 88;
+pub const NV_ERR_OPERATING_SYSTEM: _bindgen_ty_4 = 89;
+pub const NV_ERR_OTHER_DEVICE_FOUND: _bindgen_ty_4 = 90;
+pub const NV_ERR_OUT_OF_RANGE: _bindgen_ty_4 = 91;
+pub const NV_ERR_OVERLAPPING_UVM_COMMIT: _bindgen_ty_4 = 92;
+pub const NV_ERR_PAGE_TABLE_NOT_AVAIL: _bindgen_ty_4 = 93;
+pub const NV_ERR_PID_NOT_FOUND: _bindgen_ty_4 = 94;
+pub const NV_ERR_PROTECTION_FAULT: _bindgen_ty_4 = 95;
+pub const NV_ERR_RC_ERROR: _bindgen_ty_4 = 96;
+pub const NV_ERR_REJECTED_VBIOS: _bindgen_ty_4 = 97;
+pub const NV_ERR_RESET_REQUIRED: _bindgen_ty_4 = 98;
+pub const NV_ERR_STATE_IN_USE: _bindgen_ty_4 = 99;
+pub const NV_ERR_SIGNAL_PENDING: _bindgen_ty_4 = 100;
+pub const NV_ERR_TIMEOUT: _bindgen_ty_4 = 101;
+pub const NV_ERR_TIMEOUT_RETRY: _bindgen_ty_4 = 102;
+pub const NV_ERR_TOO_MANY_PRIMARIES: _bindgen_ty_4 = 103;
+pub const NV_ERR_UVM_ADDRESS_IN_USE: _bindgen_ty_4 = 104;
+pub const NV_ERR_MAX_SESSION_LIMIT_REACHED: _bindgen_ty_4 = 105;
+pub const NV_ERR_LIB_RM_VERSION_MISMATCH: _bindgen_ty_4 = 106;
+pub const NV_ERR_PRIV_SEC_VIOLATION: _bindgen_ty_4 = 107;
+pub const NV_ERR_GPU_IN_DEBUG_MODE: _bindgen_ty_4 = 108;
+pub const NV_ERR_FEATURE_NOT_ENABLED: _bindgen_ty_4 = 109;
+pub const NV_ERR_RESOURCE_LOST: _bindgen_ty_4 = 110;
+pub const NV_ERR_PMU_NOT_READY: _bindgen_ty_4 = 111;
+pub const NV_ERR_FLCN_ERROR: _bindgen_ty_4 = 112;
+pub const NV_ERR_FATAL_ERROR: _bindgen_ty_4 = 113;
+pub const NV_ERR_MEMORY_ERROR: _bindgen_ty_4 = 114;
+pub const NV_ERR_INVALID_LICENSE: _bindgen_ty_4 = 115;
+pub const NV_ERR_NVLINK_INIT_ERROR: _bindgen_ty_4 = 116;
+pub const NV_ERR_NVLINK_MINION_ERROR: _bindgen_ty_4 = 117;
+pub const NV_ERR_NVLINK_CLOCK_ERROR: _bindgen_ty_4 = 118;
+pub const NV_ERR_NVLINK_TRAINING_ERROR: _bindgen_ty_4 = 119;
+pub const NV_ERR_NVLINK_CONFIGURATION_ERROR: _bindgen_ty_4 = 120;
+pub const NV_ERR_RISCV_ERROR: _bindgen_ty_4 = 121;
+pub const NV_ERR_FABRIC_MANAGER_NOT_PRESENT: _bindgen_ty_4 = 122;
+pub const NV_ERR_ALREADY_SIGNALLED: _bindgen_ty_4 = 123;
+pub const NV_ERR_QUEUE_TASK_SLOT_NOT_AVAILABLE: _bindgen_ty_4 = 124;
+pub const NV_ERR_KEY_ROTATION_IN_PROGRESS: _bindgen_ty_4 = 125;
+pub const NV_ERR_TEST_ONLY_CODE_NOT_ENABLED: _bindgen_ty_4 = 126;
+pub const NV_ERR_SECURE_BOOT_FAILED: _bindgen_ty_4 = 127;
+pub const NV_ERR_INSUFFICIENT_ZBC_ENTRY: _bindgen_ty_4 = 128;
+pub const NV_ERR_NVLINK_FABRIC_NOT_READY: _bindgen_ty_4 = 129;
+pub const NV_ERR_NVLINK_FABRIC_FAILURE: _bindgen_ty_4 = 130;
+pub const NV_ERR_GPU_MEMORY_ONLINING_FAILURE: _bindgen_ty_4 = 131;
+pub const NV_ERR_REDUCTION_MANAGER_NOT_AVAILABLE: _bindgen_ty_4 = 132;
+pub const NV_ERR_RESOURCE_RETIREMENT_ERROR: _bindgen_ty_4 = 134;
+pub const NV_WARN_HOT_SWITCH: _bindgen_ty_4 = 65537;
+pub const NV_WARN_INCORRECT_PERFMON_DATA: _bindgen_ty_4 = 65538;
+pub const NV_WARN_MISMATCHED_SLAVE: _bindgen_ty_4 = 65539;
+pub const NV_WARN_MISMATCHED_TARGET: _bindgen_ty_4 = 65540;
+pub const NV_WARN_MORE_PROCESSING_REQUIRED: _bindgen_ty_4 = 65541;
+pub const NV_WARN_NOTHING_TO_DO: _bindgen_ty_4 = 65542;
+pub const NV_WARN_NULL_OBJECT: _bindgen_ty_4 = 65543;
+pub const NV_WARN_OUT_OF_RANGE: _bindgen_ty_4 = 65544;
+pub type _bindgen_ty_4 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {

-- 
2.53.0

