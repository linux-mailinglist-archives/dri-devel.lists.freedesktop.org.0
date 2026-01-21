Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONLpBpz+cGmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:28:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8E859E2B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4D210E838;
	Wed, 21 Jan 2026 16:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FErnbiSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011034.outbound.protection.outlook.com
 [40.93.194.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA2010E838
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1hBeNGvwIhH1m4gEjfZNCPEMTgcQ+Agi0HPGigFSZzqT00+iHTHrW4RstpLk8fymrWSpDyfG655iUOJEASXDgq/0L/jYvYoBCmst8upr7oGd6rDhnkL6qtc1zeN6n2UvYraS+C8dtSWNjTGYm/m40L2Q6evGAVOGVtUnNvF2Upt8O6ZCuUU/Zqaq/M08JERiOrvjzXeh+HoDTZvqHLOS27/k1JBcrWwfRDe7ffiZqTSt25ZzoNt/sPAPW5Sq5qt1MPAytwEAad/KriS1a40O+dwH43zF4pU5gF2qFvHDYINvdcxrfmAOY77gTSbS8i4GnChKqQl4Pb6dXG6eTaCBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ii6kB0o07+zjknuZtGQET/2PKUcPNEmKC+G+mIGqpoQ=;
 b=mc3kUuUa8IVG4mVvOH93P+M3e56i0ejO98FQP163AhxImRvvTcHBOKTkJp/KYMbS+5oEElhk2N0XuKDISwX5HZ/pPbKn2l16P/6QZCqQZilJlPYDXQh0HIPzy44zqfa/11SJN3XcOi0QR5uVVo5D8d7GEgGsLzG7OH1x7/We/l/43CUv/0uTwCq73Yp8cBe0Y+p9JXKvIO+2t+BVxV0S+vrO1sqFwhcZhLczWaS3CNDgywCFOeoqEqY8mdkiiY5Lq/e7nlFMHzaHDuiA3LAXYOG8i7KeQje2S6FeEOIWCiFFgGqmy+WwDz0ZwiJIgQFO9dQbPPD/VK5RJ/FEyuqM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ii6kB0o07+zjknuZtGQET/2PKUcPNEmKC+G+mIGqpoQ=;
 b=FErnbiSgziMH1lEWxgunL70JRq55y4D+luxIR7rSX3bRNIstds/T7FUABUcpY6Ji9oeD5tBsaV4IQFRs6bdMsONKzpvpHkNOY6DcynaitDCrd29GafsABT8rZY2N8mGg9Uunpd6kKX/6zK5m4OfZjSzM/1/L4XWAUycnwHHy4swiFPCZ5jIo0XVCZIXrx+KbAduGXRfWQPWp90g2yTfhWmv8FUB7esWPak+ulFgrxwtlR6HryWwIYpQ9/754y7CHW0uy26fxrwIWD7dTXdCplFz4A7q06rxzUKssYf9SUA08a5DdlmhW6Xa8Px0HFWp3RmcCSmEau1abUblw3rPG4A==
Received: from PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::12)
 by BY1PR12MB8448.namprd12.prod.outlook.com (2603:10b6:a03:534::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:28:02 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:348:cafe::23) by PH8P220CA0026.outlook.office365.com
 (2603:10b6:510:348::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 16:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 16:27:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 08:27:33 -0800
Received: from [10.221.199.162] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 08:27:30 -0800
Message-ID: <c03a82ca-5dc8-407d-a1d4-ac97bb646b2e@nvidia.com>
Date: Wed, 21 Jan 2026 18:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
CC: Edward Srouji <edwards@nvidia.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
 <20260120181520.GS961572@ziepe.ca> <20260121083246.GV13201@unreal>
 <20260121135643.GA961572@ziepe.ca>
Content-Language: en-US
From: Yishai Hadas <yishaih@nvidia.com>
In-Reply-To: <20260121135643.GA961572@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|BY1PR12MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: fba4d574-c1b6-4d3f-eb4c-08de590a0a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1c1cXJKdHR5Q0gvTE95cE5FWEZqWVg5dnJiWVZUMWlZeUhPekRCYi9LSTcr?=
 =?utf-8?B?MDVyN1AvQkZSTkpYRXd6NCtGVy9hRDJqM2hmZlh4OFpERlEvbmhmNzgzRk9V?=
 =?utf-8?B?SzBxUCt3SklFSkY2b2FsVERQTVgrNWNPeCs2VW04ZnRodkpiTzVtdW9sL3VC?=
 =?utf-8?B?bTRWWXFmNi9ObUxwUlVtUitnRUtIZ09UeS9DTVlMOThXUnZKUmZRdC85WDVW?=
 =?utf-8?B?NEdIK2psUzVYcFZRbDY0U3pYOHE2S000Q09XbE9CYnJKRSt5dll2TnpRUmY4?=
 =?utf-8?B?RTBBUkVneStuWFFpcGxRNnR1eUZ4NWRjdU1yL1Zsdk83cWUwYVhTWXl6eWQ0?=
 =?utf-8?B?a3hESFZTK2t2cmdrajdsRlpPcG9HQWVRRjlEek9EWk5EbXFoVHc4Wll4ci9B?=
 =?utf-8?B?YldqSEMzdEkvZ1ZtTmFDNlhuN2ZMMzNhOGdBY0xOU3BvVnowQ0FveFVCa0Zw?=
 =?utf-8?B?WU5hdmdjV296eDZudmw0NFJPUkJyamNqSWp1dEF2LzBSTUpSY1piWXlobHR6?=
 =?utf-8?B?VEUwY1lQSHprTUJ0ZWtpVGkvTlVPZGJWa3FBQjA2ZFBPWFpBMC9BNE5uV01I?=
 =?utf-8?B?WHhiSEFRT3FXT3lrNjN6UE41T3NhMHVlZVNmVXR5RnIwdUxtay8wc2t5QjNF?=
 =?utf-8?B?RHBxVVJueVFET05CdDlHNVNQQ25PMnZFS3hsNDEvVlgvb1BNM0k5emliZFhi?=
 =?utf-8?B?Zkx5MEFiYnpZSm9PUm12QVN1bjBsSWZldXNqL0l0Vjd6RHJJQUd5K2NzbGJF?=
 =?utf-8?B?Nlc2bnlKTHdRZXprMThGTjdvdTM0UFdZYmN1NTNhQWlNb2pOUmxnc25Wa21Q?=
 =?utf-8?B?WVRyNUZXd3R4NHI4NVd5NmZCeDUzd1Z6RndkazJYVUJGc2NZN3J4VGRQVS9m?=
 =?utf-8?B?NVZ6U1QwTDY3b0pKN3Exdkx1RGZSVDNJYW5kazJmcFRrQmJ1OWNLZGhXYWV4?=
 =?utf-8?B?RTQ1UENTWVhmOTk1OVhidFlSNWtEQ2MxcDhIVkVWWHBBb0ExRENDOFQ0N3lF?=
 =?utf-8?B?RGpOZ3hQNmhIUDBTQ0p5a0wxaWRlQ2FYNDVWeVVNbEVCdTFNMmZPTE9jU0tS?=
 =?utf-8?B?VEpQUk1hdDRFbHUvU2t0RWhhVW5jcG1tOUFGUTVXQ0JDLzFMa2d2Q2FLK3Fn?=
 =?utf-8?B?dGgzMkVRQm5TZURVcEpFZGdVbkcxQU8xak1sWFVvM3hFQnBvV083QW1xZHps?=
 =?utf-8?B?SHc1VjJ0MkNRZnFUQm1HcERaUXNZTkhUTm9Gc21FOEJCcEFlVk1BS05zMzNS?=
 =?utf-8?B?ZWhIWnoyQ3VZQlErdGRhWWdhRVFMbWMxeHNBTVg2aVV5cG1GMUtLZXRHY2x3?=
 =?utf-8?B?dGVWVGd4N1RYNGJzMEdrRFVaMCtpNUVKYWJaTUhRVUJ1ZFU2WThWOTVGRlhN?=
 =?utf-8?B?eXoxUjVCcFNsVTRWOXRoQk5EdjZBZjZXRVVFWDhCc2xyK2xXTG0zUyt1cWZz?=
 =?utf-8?B?TGFueUUzRkR3MHliQVdPYlNKTXNoWlpySGw2aVpuU09tQ25WL1FvV1FTVHRC?=
 =?utf-8?B?UEIrQVg5ZGRrWm0yU3NnZDY3a0dJbHd6NSt6MlY0V2h1SFo5VFBqYVZTZ3FZ?=
 =?utf-8?B?b2lxS3JuOVlLUWpXbG1yZ25vZDBFbXRBd1d3azJYZlRIa1B2eU9UVEZoZGp4?=
 =?utf-8?B?MURSVUhVUGxaZmphTHJHYmlRUUxPbWtrN2x2VTN2ZEIxVzgvNGhibXF6ZlFW?=
 =?utf-8?B?UEdEakdhenJaRVZmVTZlQ2xxYTN1bEswdHJocjJFM0w4czNRWCt3R3gwaDR4?=
 =?utf-8?B?NXdTbkFMbEJPVjVTTkhXZXZ0R2xJSkttQStJMTRuUm5UckY1L1JIbnFvenBm?=
 =?utf-8?B?V1RRNzJCQlFrVjN0QlRhWVN6ZzFVMmlmT1FyRFBFYkRCdDdUREhkNXJTcXpI?=
 =?utf-8?B?LzcwUWZrMWJPVm1KZ2pRMTg2TkpsKzhrMEdsYXIwV1p5VUZrVExiZHVVa2Ro?=
 =?utf-8?B?bWZCeFJkR21lTDQ2b1orQVBWL0pwczhhRjAvc3RJSEREcFVSQ0dEZldiWTRP?=
 =?utf-8?B?QmY5RUN6Ni9mU3k5dEZMdG81VVlVV2VZU3RaT04rMDVSOER2ZzJkZ0Z1TmZw?=
 =?utf-8?B?V0VaUG5TK0FCd3RzWGJta2dxRmkxK1hYanpzdGgrNUxRaXZCODBUUVY0alJC?=
 =?utf-8?B?QWhxYmp4NTJVdGlkcDhTandzTDJYU2l2SmI4WlU2QmdSMnZ6MlM2endhTGhO?=
 =?utf-8?B?OGI1azdMenh0SWtzYkJHWkxleUo2eFZaR05ZRjFNU25aOVJUM0pQNGlPUmpH?=
 =?utf-8?B?dUZaekppbGJ5cG05UU9DZjdqbHJBPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:27:58.7618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba4d574-c1b6-4d3f-eb4c-08de590a0a2e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8448
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[yishaih@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:leon@kernel.org,m:edwards@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yishaih@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E8E859E2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/01/2026 15:56, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 10:32:46AM +0200, Leon Romanovsky wrote:
>>>> +static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
>>>> +				struct dma_buf_attachment *attachment)
>>>> +{
>>>> +	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
>>>> +
>>>> +	if (!attachment->peer2peer)
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	if (priv->revoked)
>>>> +		return -ENODEV;
>>>
>>> This should only be checked in map
>>
>> I disagree with word "only", the more accurate word is "too". There is
>> no need to allow new importer attach if this exporter is marked as
>> revoked.
> 
> It must check during map, during attach as well is redundant and a bit
> confusing.
> 

OK, let's drop this check as part of the 'attach'.

>>> This should also eventually call the new revoke testing function Leon
>>> is adding
>>
>> We will add it once my series will be accepted.
> 
> It should also refuse pinned importers with an always fail pin op
> until we get that done. This is a case like VFIO where the lifecycle
> is more general and I don't want to accidently allow things that
> shouldn't work.
> 

Sure, will be part of V1.

Thanks,
Yishai

