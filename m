Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGriMeYZmGki/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:23:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297A91659E9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0BE10E798;
	Fri, 20 Feb 2026 08:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c0+sZ2TK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3010E798;
 Fri, 20 Feb 2026 08:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfpKUGc43hl3EOwYjBDdKllEoV5nTwEbSXVxWKYrf5P+kvrOne1p9TbWJpDG/ofKE2dlkEHn9xRZF5t5Nzl/Wy8T9MBTt6xjHJzyjv5+bQXKJrlzevtNxi8qPcJVpt5a8FuDeQ3LFddK0aRmPQBI8SqQFt7sC3l6NmVSarRsR73473hnLyNxKWB8L6PmgI6RTHybna7xnkZSaxl6rYJxc1jYRU/qgzu7gNy560GIoMbNq8H3QdY+Y0AELNHcXyZeLMWSX+3CfUyVfg/CBv0hhrxu2VRcA6MO435BdLzvF1N/DjxaEhLKN8Mjo2K2UfPJJ5PY+DkF/2wIRlY4tyjNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LURDp/60JpbRxOwLYoC1fHYkPzM6Mzg83PczV4MhtMU=;
 b=qyMwfUZR5ZVQHl7L3rA0PcYf5NDtAmnMwMqkGLcUGvs03C8bR+rajZmZ88Ca/wn4ojJNJdKruoNYqK/wznMVGU1J3dcc94MKTw3+NV0eyXRCTb9t9KDBccERCAD5aOY0adScXI0aEgSuj6PjFuAvtdd72+eMxCS+KB6i3Q9UdR0SLmB99PgZGIR6stACeliLPmu8Oc+Y/ecZVo/axedOtQ/zdNuG50OdWdLP5GRDqRFdTjWw+E5s6ZUYk7IkkZVz3e2PSLoqKgp4e8k0y/JDDvlH9uJg6BUj3bJe7yia8h/MP8TeCPCekishI6v8TGMPiYugaM1A3U3hDuAlgb9Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LURDp/60JpbRxOwLYoC1fHYkPzM6Mzg83PczV4MhtMU=;
 b=c0+sZ2TKSUlqDPXFbrt2y7MogCIeWBgq1xOf9oDkGwpZViIMKHVg/oI/z3PcLu7mUAyNH/p0GvR4jPyjzDQMvqIiqPC7IdKZNIB8QvFpt+oofPPRMUEhgWJARh/0VV+ebBSXbDqFulw5lnPhcnReGGzKDcXfvqo+Xn97gOifzAOmOEREefK9h50HmWjjd+Vd/fGxL2o7i0+xpOG7EHtkd1KuNZzYOoYrR9b6+1HJT+cQTdDEI1AzBHuKhFPC+jrfWWtwsgtK/vFLYuvIy98IyvbFxeT9B1JNCMBCUAQ9buBSojECuToGtnV5q7UM4xsq608eei/B442nQwXm0aZE7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9694.namprd12.prod.outlook.com (2603:10b6:610:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:22:52 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:22:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 17:22:48 +0900
Message-Id: <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: "Dave Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-7-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8b3517-156a-4e2d-7e88-08de70593dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3EzN2NnWHl5ekQyOWkzd3F3eWs5TlFIcnEwYkVTRkN0TFpTWHFyUkloQ29z?=
 =?utf-8?B?Q3pKOXNrWWptOHpPTVNLcWF3L0xQN3Rrb0syNTJHeXhycUtCZUtKdFZnWmdR?=
 =?utf-8?B?NVBEZFh5Z0orMmlZRGlmVHBpZDEzU2FQRFZHc0JrUENSR1RuSXhsSHZtUU81?=
 =?utf-8?B?YlZqLzU0RC9yZTJVZzZFOWQzQlFtejFnT3djcTQwY0R5clVOMUcrbkpJeHo0?=
 =?utf-8?B?Z0c4bkFQcHV1MUlqZnMzbHZEdWdqMGs3NXBYU1pFM2pPSzVMQ1IzOGxlSFN6?=
 =?utf-8?B?aE9ZaFZ6MHBidXpid0hJdC9wbURBeG9JUnpneENlVlFvVHhtdTU1U0xuR2hq?=
 =?utf-8?B?S2thdklkeVBrd0dsM2VNY2RuZjh4Ri9LM0lOK0RLMldkUFZ2eGJRQlJYb3pX?=
 =?utf-8?B?aEdtcWxoY2ZybHZuQnY5Rm93WkhHWWwwMnQ2bnA3dWxVS1VjL3dLUEhncDhy?=
 =?utf-8?B?RHpNK1poVzl5UWZXbHJjVGJJelh1Q3RqSGpqcUJYTFFkaUhMRXF5Z0lnem5u?=
 =?utf-8?B?M1p2YUJpUnMrd05Qc1NYRXBHdm9sQU0xa0xDUXNhaWtlUlZYWUQwSk43Q1JP?=
 =?utf-8?B?Vmo3ZWhMWmxLK0s1ZW5BakdMbUhhSWFtY0pnTGMwYS9KdGFETExPU2Y4Vk5v?=
 =?utf-8?B?OGc3VHlVZGZvWVVXUlJSbFA4VFowRGJ6YjdIVkh5TG5LWjg2OWF1aW1LN2hl?=
 =?utf-8?B?eTg4dWVFZUZZRHpid2dIaTU0ejBHM1FjU0dlUldQemp4T0YycHBvdnZ6TXRa?=
 =?utf-8?B?T2EwZVJzb25pZ3ZuTUI4a1k3VHcvVUhRck0xTndyMmdoYkoxOS9Jc0dseWo4?=
 =?utf-8?B?MWxzTVdpRU1kSTlSYU5lTEF6Zk9LbmR1REZPcWN1VWdxNzJRR1c3L1lEM2ZP?=
 =?utf-8?B?MTRxd0E4eURBdU0xcGEvU1ZLWEVpSWpJZVJscDdaWkUyTTFOWDlnQlFkNUo2?=
 =?utf-8?B?RE5nWGJFKzBmT2ppbVBCQ0dScHNZMDVsbTdISkdiU3pRME51Tzhvd1pRdkV4?=
 =?utf-8?B?NEhOZmRvR2VVenRob1FPOGpmcUdoQ2cyTVNsNHZMd1VRcGJGOWtBd3pPNktN?=
 =?utf-8?B?Y1RCK1FEZW0vUUJ0SHFLMXp3a1VJV2E2L2lyb2Q5WkdEZ1dhWHlFb1lyb08z?=
 =?utf-8?B?VS9MY2ZEY3YzMnViVnhGdTlWNEM4blcrc1J3TTZoTnRNTGVacHhPdk5qOE9R?=
 =?utf-8?B?bjRaZk5NK0RCM1dVWDZqVlBXbGxocll1cWJxVUJoUlA1TmVRR0N4cmFXUmlG?=
 =?utf-8?B?UnEzQmpPOFp4QWJ0OHFoSVkyL3J2NElIVnZBYUhnN1E3MjdTbnFlRFpOdExp?=
 =?utf-8?B?ZE9maUwzQ0RzYjlEOWVSb29LOGFCdTkweVhWUTVmczcralNTa3ZSelJtcjFJ?=
 =?utf-8?B?OExoWlY2K2JqalZ3Z3dwMmlCbERGVGJJVGFPZVFjRkk1U0ZCaEhKOU4rOHpT?=
 =?utf-8?B?SUM4NUdmV1J5bFFKMlpHUVBsbUQwcnRwOU41dHpUYUxyOGRNTm9mcVAzblln?=
 =?utf-8?B?Z01BQXdhT2Jya0kxOVhKOUdEZFR2Z1BsNEdzQXVrSXJVZlhIVktCdEhURys2?=
 =?utf-8?B?V2ZVU1JjRWRoTEdyd2Ixdmx3aVNxL1EwaTUyM3RDK1NXei8vUnRCUjAvbkhv?=
 =?utf-8?B?WXpsLzBTTG9ja1JxcGt3YlNSNGNkT0ozL0JKWXFSSmRTMVA3ek9rTEcvUWpE?=
 =?utf-8?B?YzFPTy9IQVNiU1lYdVU0MG9NaE5aQi9rYUpLaTBCb1gwMXV1V2lUNU84NTR4?=
 =?utf-8?B?ek00SC9xemtYUGdKR2lJM3EvQzFoeGlmTElDMjhQMkMxSFlMOTUzTGZaZGYy?=
 =?utf-8?B?a0p1R0dhcEJJNjZYMXhyWWs4anhKd2VJVXRlYXoweGZBSC85Wk1iU2FwZ0xy?=
 =?utf-8?B?NEp1bkcySWdzNFVCQWQ3REhwcEpsVFBDdktTQ2V1WWt5QUJ1dzJ5VTJ4NFhS?=
 =?utf-8?B?WktvOS9OcGYxdlRRcmhiZk5kdnBldVJ2ZitzMS9sZzNDZzMrR2x0ajA4RWFC?=
 =?utf-8?B?UG9Ta0tyaCtvTkM5S3orb1o3THBPZm9BYkpTR3BGYTRKWEROaVIxS2dEVUpE?=
 =?utf-8?B?Y09GSWFsMUR4aE1aQzB2dExBQW4wa0pGamVjNy9oUnh6RkRDcUc1N21YNzNW?=
 =?utf-8?B?MDlpSHIvZkVlakV6R00zdSsyU2lDcXpjNlkyVnZNYjhMRTFQVldwYTAxVi9C?=
 =?utf-8?B?R1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2puUktGb2R4eWYraEFHcVJHSXJqNWhneExDTDNsRmdVcWJPVWhURi9nUnRt?=
 =?utf-8?B?dE5FWUFhNExSQWdDRjNQOGF4eHpTbWQ3Y1NiUG5tVDZYR1pGakQ2V2xIclVl?=
 =?utf-8?B?RVh6UmNvZmNUd1pJaWdnN1hSaEY1ZHh3dE1abEZWNnpnTHY5cU5PUUhCWkZD?=
 =?utf-8?B?cXJJc3lydHRzc0Z5aXIzb1FLQi9Rb3ZsOVlaUnNtS1VHay9YMkNraFpuVXZy?=
 =?utf-8?B?bkV0c08vU1dxU2VGdHExRWRJQWp0SHgrdUtCdDZCbTdxNU1Xa2MyRlo4L01m?=
 =?utf-8?B?YnVaOW9XUHVXWGxmcDhydlY2OCsxQXBJcmFmYjZocTZKNkE5WlZSem5GMnNW?=
 =?utf-8?B?dWlZV2pzZUxhaUEyV3dGQ1plL3NXQUZWZHZ1OFpwSFBXdis4SmMrK2ZSZ3lY?=
 =?utf-8?B?ZysxNk1PaG80ODZJTlRXV1NyUy8vdi84VXdodVoxbGRCR3h4d0s4VVBRZUQ1?=
 =?utf-8?B?ZHBiSGRkdXBzK21HeTNDUForRjcyaVkvOU0vdmZFdTVaOWRKMXZsaFVPQkdG?=
 =?utf-8?B?NXlOYjZPQVhDMFpzV0d2MEVrcXRIVzJlaHdqSWhHTXNNVkNmdFIyRkVvSmsz?=
 =?utf-8?B?Z0o5bW04eVJtTnhvUUpTZFBGaXpYTSt1VzNLc2JBOTYzWFlNWS9NbXhoWUR5?=
 =?utf-8?B?cGJMRkx3UjJUbzd2VTd3ZDVPY2w5Z2ZJZ041MndhWDZMRVExdkJjS2pSS1BW?=
 =?utf-8?B?bW5XZ2hRRGhZNUo3UFRPU05PcC96d3VkSEc2T3F4LzRDRVNRbnA5eGllRFNw?=
 =?utf-8?B?bVptUi85QkFZR2JoYTJybXl3S2FZL3RKSkd3YWxXNkVhSFh2UXQ3S2FlbUVu?=
 =?utf-8?B?V3BxUDlpV2pZZENNREdsWm9RVEYrRWIyQ2p0NDdnT1VzczgyRm0ycEJxZlJo?=
 =?utf-8?B?Y1QvSTdBdFdqZ1IyZngxbS9SdjgyQ2EyVWZsTDl2K0dOalhiaTM2aEVDQndT?=
 =?utf-8?B?LzJYektJNGp5czEwRS9rcHFZVHk5RVdJM3dUQ3RrZ0xORDJlVXVVOXRVeHhP?=
 =?utf-8?B?dDFCTCtBbHl0Z2EyVTRHb3dHV0V1RWFkWmhMNnZKb1lXSTM5QkMza0hwUUVo?=
 =?utf-8?B?QTIwNi8rM2ZSaXJrc3ZkOER1TzJVY2NYNlZNbktwcXdRSVZmeUhoRGozdEdY?=
 =?utf-8?B?cURtWEIvRUgrL0Z2cWd3dUNmYmJnazVYS09pN0FObzIvdjNDV2l3V1gwYnZx?=
 =?utf-8?B?MDBjcCs1THN4M0FSZVlvVGFyM0VZSlZUQUx4VmlaYzRrbTVlSS90YnNaK2o4?=
 =?utf-8?B?RjVmemtSditCWVZVQnlNZnZ0THhkckRtaThFRktZUFhnd1hPM3JMYUtndCtv?=
 =?utf-8?B?TVVscnRDSTB0T201ZjdQbGpJb3NFVERIVlF4MXBnNFU2SmxaWWVaSHdROFFm?=
 =?utf-8?B?MzNKdjJYeHQzZUNOR1IvczMyTDZjMzVpNGQrR2ZLbVpIZ2JwdHd4TG9WVW1K?=
 =?utf-8?B?RXpEQXU5RTZ3ZHpZNld6cmc2TGc2OHBTSWRWSkVZV1g2VmNGeXppa1hoZ3NT?=
 =?utf-8?B?NVdrNjl4UnJ1U05iM0tQelJ3U2xkU2hXNE5hT1plRlZERVJtNW9qeFMvY1o4?=
 =?utf-8?B?OXg3UGlPQnNsL2JvZDhaWFpKUmpNclBrcmhlVXJaNWtKenpjVGRmM2N1QXBO?=
 =?utf-8?B?Smk3LzNNNC9TanlOTjFYQktjZUhyRWFMbnRlY2J6ZUhQdjZjb2VpcVJXYmFt?=
 =?utf-8?B?eVBHaTJyTVRRNnNVUlpUR0txTkU4cWVmR2dPeFV1M2RrSzBjenVHb2JQVTIw?=
 =?utf-8?B?azk5WWIxemJvOFlPN1k1L1ovT0JRYkplNnplZFdibU5Na1MrbnNETXpDdGhh?=
 =?utf-8?B?eUhFRFh2SkFtT2p3T1JBcEo4dW1MYXE1eGNVcnNFZElOK3VtbGZEdGxlbUJz?=
 =?utf-8?B?UGRCNjBNUSs1WVlBN0c1Ym1QcW5RZ2M4NEV2WktCVjNDMC83UExuMUs4VUVq?=
 =?utf-8?B?VTVNU2FoMVNvYXpWTEh2ZThBUnJFTWplVjZ1VTBoazRoeGhKbmdWT1U2a2pE?=
 =?utf-8?B?WExrRjBvYmR4TENhMzJlQjRKdHI0bWpseXRRYjZOT3FWOWVwTCs1bTM0RklM?=
 =?utf-8?B?d1Bjc1Y2ZTZib05HZXlkb20xaGZ3L2FWdGVjZWlrNE0vSG5wRDVkT296bDB3?=
 =?utf-8?B?S1pPQWNaSEcrZjJXQjBuMWRuaCtCNXJoZlVDdTRuOWhPNXdjUEMremJBeFpu?=
 =?utf-8?B?V1JENTA5SGwyTExLdFZnbmRqZ2JQK3dQMzRUbTlqeStBblRjMmNFRWxaNVdX?=
 =?utf-8?B?Tm1jTHBRWDZMSDZESkdIeXFvcGwvZi9qZ2tvSlVrblhYcXpCSTIydHJoV1pE?=
 =?utf-8?B?d2FKbEl2eGMvdjhoYlptTlFhaW1FV3ZLS3VrditPaWZ5VUFRSkVoSnpNNUVL?=
 =?utf-8?Q?eFLP/2EqNojtIWzbxwheT1polzR5wizBnnE+sHn1mR37r?=
X-MS-Exchange-AntiSpam-MessageData-1: TTjwJmgWAM+F0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8b3517-156a-4e2d-7e88-08de70593dba
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:22:52.4579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVSxI61Fpw3iAwQBxD54GeV9h1Y20tJEKckSMqYp24l230hdQbTgc/l88FHnvgHHniGqvbqZPjsl0Y1HcjdjpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9694
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,buddy.rs:url]
X-Rspamd-Queue-Id: 297A91659E9
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
> +						   struct gpu_buddy_block *block)
> +{
> +	return gpu_buddy_block_size(mm, block);
> +}
> +

Will `rust_helper_gpu_buddy_block_size` be used in the future? It
doesn't appear to be used in buddy.rs.
