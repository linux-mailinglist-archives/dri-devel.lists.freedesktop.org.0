Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJDMKEachWmUDwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 08:46:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0284EFB1B5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 08:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B1310E3A4;
	Fri,  6 Feb 2026 07:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="przKZ9rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D513010E3A4;
 Fri,  6 Feb 2026 07:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aj6K4ABBoDzwFVsQkOhSd/I8qT0PZD5G+kzbZ2Q9Nn4dj5ZINVY/Hu5TZFevlBF2pHPRoXPd+RypcBM4BhxKxmHDhafA28QHcUsC0fAVRaSOUP/kY29NYIpMvrLjRqmUHhBlBaPMQnSZKlwCIh7Z/OQQamuHV4Wx5K6JhjXkmT2EUjZyurZOQr+CFpDd4JAnpUHJu9uRws2Y7hVr7RpupDkkhsXmQqccfSrAuQU0afSeai8IuOr6gdCI55qP8Pi8tMJuHqruHsf3vFb4isC/vHjnLYoZoMFqn9BViHDjoFiAa94WfSbxR3FDOpTfyFPLOW+rSLEsKdJQC61xSZU2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHdeAVJRoOfxkmNwRYce/sl6BjQR/+zrQQc2PcJ7vjE=;
 b=xb6zuo6jOTOttUkAn7SVAc41UB8iBxt38ap8dNkTW+VAGszYBdKdljjcqbZwE3wAAAIjy+X8GP5N9KRysF33oThptK9zXKXpvV2KcJq/E1LTGT6lDbfvWts4hIXpN7xev2+TY9uwrcrgbp1C7s9Wke//1MdojjJCXTb3D2RMt2wqBrjuVHDYlXlXc3CqJWlNYPe0qVCAc5EJcINiJ0fnbPnhTpvJIE3XFjtH0e9QIWIKczswOf0EuIgJ5kOK/iuI84GVxf4C6MakwLWcNGeMBdsaWKE4958/CoYQJUqW+qmsWg9c7P07xrkXqbJgWJDhZbwDjK6CoDDA8TQeIPHEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=redhat.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHdeAVJRoOfxkmNwRYce/sl6BjQR/+zrQQc2PcJ7vjE=;
 b=przKZ9rwzU/iC/371AbgAJvYOe54MzGiJ6Ypa2LiVfEjJob1dsiG4WMNevoNTSX5gekk705oX4DsGgilXksw2JFs8HkrWp7jZ7FzBpqKySCJgDMl0kpCn4WPoJ9LtfuK8z6PUV+Zk4A2HGov5tvROig0Osc0KFdr96RctGybj7z8g7REa3aiz/a1fZQ0rtBcmsnsepFPYmShqg9COFuGjT22X3DWYfteAY/SWKwcm8lWexUqZnUXUDHeXM0Z0ZuR0iGIA23//d0y9WwHcO6oasaD3SZmoryBvxpnVaI9TZzboRQXflpAEpLLbhJQrjp0hkwpJZXNv1epl2ENKZha5Q==
Received: from DU2PR04CA0358.eurprd04.prod.outlook.com (2603:10a6:10:2b4::31)
 by DB9PR10MB7956.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:305::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 07:46:05 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::91) by DU2PR04CA0358.outlook.office365.com
 (2603:10a6:10:2b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 07:45:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 07:46:05 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Feb
 2026 08:45:49 +0100
Received: from [10.34.184.244] (10.34.184.244) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Feb
 2026 08:45:48 +0100
Message-ID: <4669209d-c53b-4cc5-ab2f-0f09aa5dfc50@de.bosch.com>
Date: Fri, 6 Feb 2026 08:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] rust: pci: add abstractions for SR-IOV capability
To: Peter Colberg <pcolberg@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Dave Ertman" <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 "Leon Romanovsky" <leon@kernel.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Xu Yilun
 <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, Moritz Fischer
 <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Zhi Wang
 <zhiw@nvidia.com>, Zijing Zhang <zijing.zhang@ry.rs>
CC: <linux-pci@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-fpga@vger.kernel.org>,
 <driver-core@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.184.244]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|DB9PR10MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a07b5c-2065-48da-48ff-08de6553c864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGZ3VnFyUU5zalF2ODVvYUZjWHczS3pDZWZyNWZSeVB1dTFsVFpndG4wd3hJ?=
 =?utf-8?B?STRZL0V5N3NlUU9zbXBqWXlkZnVmMi9nN3M4VW90eDlEZStqVmdkY3VSVWZN?=
 =?utf-8?B?S1JFaVhQejM0eWxEdy9Sa3dPaWt5WTQ0TnRRZTlDaXdVWTFYejRZYkdxWm9R?=
 =?utf-8?B?OEFadWhPd3VJVVFacHdJd0lDYkh3UUdrTEEzUDFLdGlOMUgycWczRm9kSXFJ?=
 =?utf-8?B?N1BFcTNxcVZCQzNYbXJpODBqNE5aZU5pb2VQQVAyZVAyQ1lOUXVhenRWTnNW?=
 =?utf-8?B?M3FYQUhjd2FoWldkZkZrY3owdzNkc1pSeFhzN3RVaHRmWE02dTdGOVJhcUZp?=
 =?utf-8?B?aDBHY2tUMzZEN1R4Z01ySTRQWVYzaE1RcGJwbS9ZQVdIaVBuRWoraTlBaE9u?=
 =?utf-8?B?SmtOQUVMNTNBOTF6UTZ0VzdYd242UVd3TWJYNDBmZStZL2FjM3VqN0JLNXRu?=
 =?utf-8?B?M05JbVRwd2QzZzJ5K0xaVGJvak1LSzE5d1pLb0JDSkhiMWl4NFNGYkZSRzJy?=
 =?utf-8?B?QUJmTzVGRnV5Zmx2WGVVNUsvV3VPOUVSa1lvbnVxdTNQTStNTW5QWVVkd0V6?=
 =?utf-8?B?a3ZDRm9ETlhncVVjYTVDRVAreUlCK3JIajRRWEp4YWxLcXJTejVpeFozWHh1?=
 =?utf-8?B?L28zTE5oQTFRM1JYQ1BWQnY0UzZycTNEVHo5WjJNOHFxUkNBb2g1Nit5YS9t?=
 =?utf-8?B?UmtCT20zVGVoMUpuZGNqdFdOdXdqWHNrd2wvVnNFRC9IditLMnF2VUdIa2c0?=
 =?utf-8?B?Tkx5NkpWTGFnUjZpS0dUYklGZXFQeTExSU8rVkt2eStVejM4MGpWcVowbHVJ?=
 =?utf-8?B?V1A3dHZXR3U3d2JNZ0FwYW92Sk5pNS9LWENiM3RqVnlDVUdUUmkwSUpYUzBx?=
 =?utf-8?B?QnBvYmNiZWZ4eTZkc1Z5YkhYOHF4L29VdXYyR3hhUWpQeGJqK3JXdmwxNTBH?=
 =?utf-8?B?RDExMzE2cTlRMHlCdlJPT3BSL0hLWWJIOStic0RNenEvampsQUZzRVFYaTlZ?=
 =?utf-8?B?WjJ4MU1KMjZMc0VXVERYUVk2UGpwR0F4WXFZRDkvRTA1WkJMa3lNT0ZyMDlQ?=
 =?utf-8?B?aEZEQVhGTlQ1Y3VnOTgxcFhGTEgzckJxSUc1R1pTVEVCNEtBZHYvd212L01L?=
 =?utf-8?B?TmFOMU5PWjJpakhhTTRqN0Z1T3pDMnBSNEg4OHdVUmxoWnMvM0I1UWF6WlE1?=
 =?utf-8?B?VmpyaWNxMVhjSUc5R21sdDhEblgzcEdSQXpaMDBneWNxMnhaM0RWRWV4dTQr?=
 =?utf-8?B?SGpoa2VXT1h6dWZxb2t5L0pKU2tDQlF4NkgxZ01aWlhoR3ZIQkphUVo1Y1Zz?=
 =?utf-8?B?YS9GUUdmYjVPM01CSkJ6MmloY1Nha1FmWU9URHdHV21JV3QwblE3TWp1dEt1?=
 =?utf-8?B?VEVqYjA1aXRKbDNuY1pFeUVpK291NzU2aGZDWkhXYW9OcEJuVS84TmI2YmFi?=
 =?utf-8?B?K0dQZ05KekRXUEFWWnYvcGd1UytpaDFSYWJSR2hBS1Z3cjRpM3NSc2dtYUxF?=
 =?utf-8?B?UG50eWxDQkhhTCtOdE0zaEQ2M2c2Ti9BeFlvNHFHQjdxUmhZN2FHU3dZY0hG?=
 =?utf-8?B?NmNxYUZ6eTU4UWFWOHZqNDQ0eTd1ZzhlazI0YzVBMXFKQkpIQ0hCS3lyTXhN?=
 =?utf-8?B?TG52RFdsSm5KK292TTVHK09XNzlXbWdlVlUwN1NkY1hSOHErdXNMTFY4U2JP?=
 =?utf-8?B?WnNVck9XcUtaVVptUUI1ODFWYTJSWUNoWlRtNHhvUUUwZXB6VFMvZlFqZGEz?=
 =?utf-8?B?SXloY3FEbFdpL241OWdPN2kydHNKQmhBRk05RDBacGdWQUtpUGI3a21qZktr?=
 =?utf-8?B?SCs3YS9scnlTc1RYUk9sS2ZlRmNtdENXbWVHYzJyeDlPZEJXZTNDRjRtM0pZ?=
 =?utf-8?B?OTJMNGx0dmk4eTFZTDFlc1VkcUxoZDBWWG1qY3dUaHk1bXZCVjVFNVJ2VFFn?=
 =?utf-8?B?UDRRN29IVjRYdmhXVW81L1FwcHNVc0RXd2VQUHl0dmV0azFWUzQ2RVovcy9N?=
 =?utf-8?B?cmRIVFRKWVhacWZ2d0pOVS9lODZUUzFkWm56a3hTYnVCd1hHbnF0UG5pVjhl?=
 =?utf-8?B?N1dWR0pHalEwTFhvS05UUm5SY0ZKQWVrTzVwSDNpZEcxamZBNmRLemRRZlFB?=
 =?utf-8?B?U3Vad2JIM1R6ODhTaURZSnE3QnIvSmZjc1FzRkdKM3VRZ29NbFZ2bTZVU05V?=
 =?utf-8?B?c2sxWjl2MXlBUndPd1JKZGNaVTNLUFlkQzNPMTlFUWQ0THYzK2tKZ3h2RU5n?=
 =?utf-8?Q?dRUi7C/N98N1al1kRsNBQTdBO5vXwkazGOISncfE7Y=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.206; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5K23AzGlOtrrbwUXZqateGtM2vxrXNT4pKfLIWxuz+2HQoNjeuiZDQh8TdOOJ7HREoYRvEOGKi2n9xL880f4hvKus59dPFojAsg49EG037mooANWgAJRMPAo0paGWb8xVPIiART17r8BVA8qmdSGRxh4oU9rmLDPXf56kPNyxWu2PoRqPQvzKggWe6uNYUKowaYXreKUK73ON/nx7AzQprkGJFPdlrJL37f0RGisS7QeqbxatewAaY7NTSHjotg8F/h+sO6j9g3drMcROy+ygSi7Kb17qiGbdQ0TNyu6TU6hgDqOI/jBcAD2chJ+EZ0WM/8YgwWNzl9l91BE/dbgbMbmAU3zEkX3X8UrTMmrB2DqR5g5muSH+OFlrpjLyfpWqK6QPmtN294nWgj3Tqna20KpZTBXibZ2xT1AVE+Xg00l3mepPDWPdUb9mTKsoxq0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 07:46:05.1115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a07b5c-2065-48da-48ff-08de6553c864
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.206];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7956
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[de.bosch.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[de.bosch.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,nvidia.com,ry.rs];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qemu.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dirk.behme@de.bosch.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[de.bosch.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0284EFB1B5
X-Rspamd-Action: no action

On 05.02.2026 21:59, Peter Colberg wrote:
> Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> capability of a PCI device. Provide a minimal set of wrappers for the
> SR-IOV C API to enable and disable SR-IOV for a device, and query if
> a PCI device is a Physical Function (PF) or Virtual Function (VF).
> 
> Using the #[vtable] attribute, extend the pci::Driver trait with an
> optional bus callback sriov_configure() that is invoked when a
> user-space application writes the number of VFs to the sysfs file
> `sriov_numvfs` to enable SR-IOV, or zero to disable SR-IOV [1].
> 
> Add a method physfn() to return the Physical Function (PF) device for a
> Virtual Function (VF) device in the bound device context. Unlike for a
> PCI driver written in C, guarantee that when a VF device is bound to a
> driver, the underlying PF device is bound to a driver, too.
> 
> When a device with enabled VFs is unbound from a driver, invoke the
> sriov_configure() callback to disable SR-IOV before the remove()
> callback. To ensure the guarantee is upheld, call disable_sriov()
> to remove all VF devices if the driver has not done so already.
> 
> For PF drivers written in C, disabling SR-IOV on remove() may be opted
> into by setting the flag managed_sriov in the pci_driver structure. For
> PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> 
> This series is based on Danilo Krummrich's series "Device::drvdata() and
> driver/driver interaction (auxiliary)" applied to driver-core-next,
> which similarly guarantees that when an auxiliary bus device is bound to
> a driver, the underlying parent device is bound to a driver, too [2, 3].
> 
> Add an SR-IOV driver sample that exercises the SR-IOV capability using
> QEMU's 82576 (igb) emulation and was used to test the abstractions [4].
> 
> [1] https://docs.kernel.org/PCI/pci-iov-howto.html
> [2] https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
> [3] https://lore.kernel.org/rust-for-linux/20260107103511.570525-7-dakr@kernel.org/
> [4] https://www.qemu.org/docs/master/system/devices/igb.html
> 
> Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> ---
> Changes in v2:
> - Move logic to disable SR-IOV on remove() from Rust to C.
> - Add driver flag managed_sriov to opt into disabling SR-IOV on remove().
> - Demonstrate flag managed_sriov for dfl-pci driver.
> - Uphold safety guarantee for physfn() when PF driver is written in C.
> - Let physfn() return error if driver flag managed_sriov is unset.
> - Use "kernel vertical" style on imports.
> - Use to_result() to handle error in enable_sriov().
> - Note Bound device context in SAFETY comments for {enable,disable}_sriov().
> - Demonstrate how to reach driver data of PF device from VF device.
> - Add missing #[vtable] attribute in PCI driver trait example.
> - Add missing #[vtable] attribute in nova-core driver.
> - Define struct MyDriver such that physfn() example compiles.
> - Replace VF -> PF in doc comment of is_physfn().
> - Add #[inline] to is_physfn() and is_virtfn().
> - Link to v1: https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com
> 
> ---
> John Hubbard (1):
>        rust: pci: add is_virtfn(), to check for VFs
> 
> Peter Colberg (9):
>        PCI: add driver flag to opt into disabling SR-IOV on remove()
>        fpga: dfl-pci: set driver flag to disable SR-IOV on remove()
>        rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
>        rust: pci: add vtable attribute to pci::Driver trait
>        rust: pci: add bus callback sriov_configure(), to control SR-IOV from sysfs
>        rust: pci: add is_physfn(), to check for PFs
>        rust: pci: add num_vf(), to return number of VFs
>        rust: pci: add physfn(), to return PF device for VF device
>        samples: rust: add SR-IOV driver sample

Would it make sense to somehow align / coordinate / stack this with the 
work from Zhi Wang (and Zijing Zhang)

https://lore.kernel.org/rust-for-linux/20260126215957.541180-3-zhiw@nvidia.com/

? Or is this completely orthogonal?

Best regards

Dirk


