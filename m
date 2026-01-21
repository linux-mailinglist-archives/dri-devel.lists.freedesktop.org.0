Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAnFDpalcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:08:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66D54F37
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BDB10E141;
	Wed, 21 Jan 2026 10:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ETXX0heM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010038.outbound.protection.outlook.com
 [40.93.198.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2663010E141
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5UsiSB6w5wioa3b58ZjSGFgzcor1teW++NZByvDfdDG5u2UEbsu/SsUFaWxXTZmP97XIb8AuAU1g5D2CEyHgF50QeNUXntRhk7RaoxWB8j5fhOSxL+tXZicvXRlKPJ08o5ztgxO2V1c0HjvkQZdYcGYP2RDX0yKaMl+JYvIr6qbhF4bUyqyh23RDLgDGFywDyd7YBhm/ftgCDoYt8H0UeRDMS8tm0NkhT0LSAai3QjWUWhz38q6L4hiuaccaeMTqxStx5r/Uta9l2JOBfVv0ZS7LWnyCi0TtpcXQ749gcAkMetwmbmi4XjpI2o+82c5ApNku3y9VKgFY/ow1bbBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQBpBeThUAXMak56uIpyE2AYV76yFwKtUt+E9SwJmMc=;
 b=D3hYj8mk+aTZm6RVC/xjUNq7BZX05kMZMuql5KBPFPOXFaRNyFqU6WwmWZFeAuB8tvUzI/hxPVSxW/xHvECKGDllYabr39dV8h4ukRlXfA5cjU6eVXrxm9vScw/J3qbpyI6B8+qytapKPt4GMMNqcfaxsg6J1IhGxPXHz0pONk5jqHhxQ2t8LzcVkydzsdtClyu3SATrWw2wTQ4PWqBba2b5hc81e4NhFOe3PoUgJzu1cbG7BFDXrmBiUw49JOKKjilWMIpmtl9/NxKtY8EbqTv/tDGORz8O6TLZOfJv3AXi9hq+yjEQrq4i0NqOdxZjNKc0DFoE8vH8hwsUwN93iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQBpBeThUAXMak56uIpyE2AYV76yFwKtUt+E9SwJmMc=;
 b=ETXX0heMYs++5orGdHLa5WF9EMkdVzRiriOROwJJd5rdDPRyPqssj3PJZ+q7Ug5C8h/e7J04Tf4sQJc2I9T29sVZvGTiZ+77/4vTUyLUw8b/7M3f98qMyoYMx3WxxDJDv1n8N/xFQ3qWxO7VfK929Gyxr642WobVu4gTe6a/DFAE6osPVdxU+WKDIZnf9lOM7xbEgLO7y30RxLUmhPj/DoxyyLPp/qV6vuQTs6wyzVTeFBplhkzA0VIRzIZKaKfYlWOSrg+XHYeWsgBH2u+A2dOIqtJdcDGoQl87zqWtvGlzFkQerX/ttWHrfzGlh2JN4Zsurt+dq3ceVXI6+8iZvw==
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 10:08:13 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::1a) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:08:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:08:01 -0800
Received: from [10.221.199.162] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:07:58 -0800
Message-ID: <919266de-f5d2-4f76-8c7f-1aeb55ad99cf@nvidia.com>
Date: Wed, 21 Jan 2026 12:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
To: Jason Gunthorpe <jgg@ziepe.ca>, Edward Srouji <edwards@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
 <20260120181520.GS961572@ziepe.ca>
Content-Language: en-US
From: Yishai Hadas <yishaih@nvidia.com>
In-Reply-To: <20260120181520.GS961572@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a8aa0c-9bc7-4e8e-fc07-08de58d4fc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWR2MklMT1RuSVMraVhkNDhMazlrSDI3SitqdVM0MEdHTjZIam51em9meE9x?=
 =?utf-8?B?TGVxa2g2VVE5Sy84THFLZFp5VXJVd1drUWtkazhNaVBFcU5JblljeGllZmlk?=
 =?utf-8?B?eE1SbEV2REc0dm8zZlV3VXNzSklHOEEyZzFKSFFsZ3djaURsZ05QSFFTa0gr?=
 =?utf-8?B?YXcyNmxueXBBclhrTmFEWGI2c1B0WkozNkRqQklJeldaNXEzRnNVc0xXd0N2?=
 =?utf-8?B?WE93a0Y2ajZtb2MzMzQ0dlJLenBOTUw4dU9NekYwTTZnSWpkWldyYmJFUVZp?=
 =?utf-8?B?T0lkWGpGNTdiM2lGcWZVQWMyWVM3MXlLKzRRT2NPSkNJVGNraXVnY0g0RXpy?=
 =?utf-8?B?N3ovdi94dFRKclluVVZJRU11Yk5Pb2t4eDN4WW8rRU5SUmtKOG5pOW4yZFUw?=
 =?utf-8?B?R01xVDJWY3o2N1JuUFVZdkk4SmxjOEMvM0ttSGIrVXgrNUxlNE91WWFLUTFi?=
 =?utf-8?B?R2crb1dVKytLWmtRemJIM3VlbDdTZ04zMlFIb1l3STluUG5uZUh0ckUvc3J5?=
 =?utf-8?B?RElnWnNTdFhEQkFqVXNJbmw1ZVlWY3haNXdKMnFwUVMrQ21TZWQ1WFRMWkFE?=
 =?utf-8?B?V0U0WU0xN0xWVmgzUkRBOGtDbk1NQ1VDVUo4SjlBTlBTYmdDQ1V4ZElxdytQ?=
 =?utf-8?B?UU5xM200ZUhUQ3FKQXVFRzRWVUI2bzNUcnlZYXNhb1A3ckNZb1NkZlNiM3p0?=
 =?utf-8?B?cXNZTTBCQmpsV1pBNkF5OHFzcXUzUmhPQXp6T3lJcEgxV2x2ZWZiRXdXRlhx?=
 =?utf-8?B?MDdVaTY1N2xtdTVTVndlRXFkd1cxdzF0bmpkNk1XSE1qWGdUNW5qQmxJTGtm?=
 =?utf-8?B?dk5iYm9ST05BVWFxSFQ2YUFKcmlkMjNtMUhaRVQ5VG1FN0IzK1pUQjFjSklB?=
 =?utf-8?B?R2V6SnlTc3o1ZmpIdk85NjJjT0FsNGUvTXJPaVFzekhkQitTMEUwNWpGTjBQ?=
 =?utf-8?B?V1cwMnZDTjlqQkVmRUNwdWl0L01aQkpzMmdmQmtkSmFSMG51UU9wMWM1MzIr?=
 =?utf-8?B?citqVHNEeU05SVRjajZIQ2RCbEFpUlI2aSt3cm5UVk13U3BqWnZrZUczMDNC?=
 =?utf-8?B?cWlxcUxnUTFLNnpwV0dsSjBsYVdkMHdUQkUvM3l1RTZCM0UrWWVKL3JUMmtq?=
 =?utf-8?B?akhXQUh3MThQNFd4UTUwUHZORlNXQXFrNFRTVGR2a1dvNk15RjRRaU1FM3JB?=
 =?utf-8?B?MDNhTkNtcDQrY295RmdNbUh2NEp5VmJ1ZmZvTVpxME5TeUNjK0o3cnhPeUti?=
 =?utf-8?B?c3VmRTJwYldsUE9KNitRanRaSzE5YkZSdENWVE5HOG1VNW50RmxzbzJESFY2?=
 =?utf-8?B?ZWdyVWdlaVRMU2Zoc3FFdDFxN2NxK3hMWHBXWWtsYjBVQkV2WVVNcGh4bDB1?=
 =?utf-8?B?MFpjc21HaW9ub1czUkNnbTI4Q1krNWV5OERFbzYwMUlnVnVmLzFxbVp5YzR6?=
 =?utf-8?B?bWR2U2Q4V0QwUUg2TFB6WHVIenNQK1d3akY4TThEUHY3dGFOL3ZUY0tMYWc3?=
 =?utf-8?B?dzNwVStnRnpSRkdDdXZaKzZMeFFzTzExVDBtTkZxTnRRdTZnK2p6cGhQbExH?=
 =?utf-8?B?aDBHWkNzMzh1WlhjR3o4YkprMFpNdXFEdUVTeFJWbHo0SW5BRkg5SnpwSmlR?=
 =?utf-8?B?S040NVI3WkozYXFsYzdFS0ZPQW1CeDRtaVdrUmxndllweXFBSjg3Nm8zenZW?=
 =?utf-8?B?V25sdTVvMTAybUtSRjNIalhLcGhvSEN3QkxXdk5Udmh2bGs3dTR6TW1oUHZ2?=
 =?utf-8?B?OUJZZ3dhNUpObTZHbm1NMEY0RTlLMTlZR2xNZFM0Z1BpQmRXM1VuYi9penU4?=
 =?utf-8?B?UFJpR256NWg5RnFPM1J3MHhiUEhmbHNEamlIUGZ2Ymw5b2Z0MnluQUFsMURx?=
 =?utf-8?B?NlVPVmZzUTFYOS92Ymx3K1lFSHpMM2c0MGlLU1B0SU04cUVMa3E1am1Pblcx?=
 =?utf-8?B?a3pveC9CbEpuc0d2blZVQ0VNWnBzcjYwUmJiQnRsTHZJMHp5UStPYUFvR05u?=
 =?utf-8?B?TzJRVWZJaXhvb3dTL05jNE5iYkV0YVh6OFRWcXVQVU1CVkJseERDT3MrNFl6?=
 =?utf-8?B?b2tyRzVwWDhuVlVDVSt5RnhuTkhDbkVMeVd0cEpIZEp3QkZrN3VuVlZZdGhI?=
 =?utf-8?B?V2k1Z2JWQU5ndEJ1WWV1dHpuUmV1clViOURSdDNNWkhITVpFQklmczhvRUk5?=
 =?utf-8?B?YlZGVzdzcWVodmw3R3ZxTnU3R2tSU3Bqa3hVY3ZkcERWSUVxR2FnQkYvNWFv?=
 =?utf-8?B?V2J3NEF4dWNNbzJ6QlRZOFgrVXNnPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:08:12.5580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a8aa0c-9bc7-4e8e-fc07-08de58d4fc89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366
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
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:edwards@nvidia.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
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
X-Rspamd-Queue-Id: 9C66D54F37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 20:15, Jason Gunthorpe wrote:
> On Thu, Jan 08, 2026 at 01:11:14PM +0200, Edward Srouji wrote:
>>   void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
>>   {
>> +	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
>> +
>>   	if (!entry)
>>   		return;
>>   
>> +	mutex_lock(&entry->dmabufs_lock);
>>   	xa_lock(&entry->ucontext->mmap_xa);
>>   	entry->driver_removed = true;
>>   	xa_unlock(&entry->ucontext->mmap_xa);
>> +	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
>> +		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
>> +		list_del(&uverbs_dmabuf->dmabufs_elm);
>> +		uverbs_dmabuf->revoked = true;
>> +		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>> +		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
> 
> This will need the same wait that Christian pointed out for VFIO..

Sure, I'll add.

> 
> 
>> diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
>> index 18918f463361..3e0a8b9cd288 100644
>> --- a/drivers/infiniband/core/rdma_core.c
>> +++ b/drivers/infiniband/core/rdma_core.c
>> @@ -465,7 +465,7 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
>>   
>>   	fd_type =
>>   		container_of(obj->type_attrs, struct uverbs_obj_fd_type, type);
>> -	if (WARN_ON(fd_type->fops->release != &uverbs_uobject_fd_release &&
>> +	if (WARN_ON(fd_type->fops && fd_type->fops->release != &uverbs_uobject_fd_release &&
>>   		    fd_type->fops->release != &uverbs_async_event_release)) {
>>   		ret = ERR_PTR(-EINVAL);
>>   		goto err_fd;
>> @@ -477,14 +477,16 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
>>   		goto err_fd;
>>   	}
>>   
>> -	/* Note that uverbs_uobject_fd_release() is called during abort */
>> -	filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
>> -				  fd_type->flags);
>> -	if (IS_ERR(filp)) {
>> -		ret = ERR_CAST(filp);
>> -		goto err_getfile;
>> +	if (fd_type->fops) {
>> +		/* Note that uverbs_uobject_fd_release() is called during abort */
>> +		filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
>> +					  fd_type->flags);
>> +		if (IS_ERR(filp)) {
>> +			ret = ERR_CAST(filp);
>> +			goto err_getfile;
>> +		}
>> +		uobj->object = filp;
>>   	}
>> -	uobj->object = filp;
>>   
>>   	uobj->id = new_fd;
>>   	return uobj;
>> @@ -561,7 +563,9 @@ static void alloc_abort_fd_uobject(struct ib_uobject *uobj)
>>   {
>>   	struct file *filp = uobj->object;
>>   
>> -	fput(filp);
>> +	if (filp)
>> +		fput(filp);
>> +
>>   	put_unused_fd(uobj->id);
> 
> This stuff changing hw the uobjects work should probably be in its own
> patch with its own explanation about creating a uobject that wrappers
> an externally allocated file descriptor vs this automatic internal
> allocation.

Sure, I’ll split the current patch into two patches.

> 
>> index 797e2fcc8072..66287e8e7ad7 100644
>> --- a/drivers/infiniband/core/uverbs.h
>> +++ b/drivers/infiniband/core/uverbs.h
>> @@ -133,6 +133,16 @@ struct ib_uverbs_completion_event_file {
>>   	struct ib_uverbs_event_queue		ev_queue;
>>   };
>>   
>> +struct ib_uverbs_dmabuf_file {
>> +	struct ib_uobject uobj;
>> +	struct dma_buf *dmabuf;
>> +	struct list_head dmabufs_elm;
>> +	struct rdma_user_mmap_entry *mmap_entry;
>> +	struct dma_buf_phys_vec phys_vec;
> 
> Oh, are we going to have weird merge conflicts with this Leon?
> 
>> +static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
>> +				struct dma_buf_attachment *attachment)
>> +{
>> +	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
>> +
>> +	if (!attachment->peer2peer)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (priv->revoked)
>> +		return -ENODEV;
> 
> This should only be checked in map

Please see Leon's answer on that.

Yishai
