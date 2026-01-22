Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGunDskKcmmOagAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:32:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF02D660A2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD3410E986;
	Thu, 22 Jan 2026 11:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cYwCXeM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013055.outbound.protection.outlook.com
 [40.93.196.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0FA10E980;
 Thu, 22 Jan 2026 11:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YU6CJ03/TIrc5O4mI/qdGMv4z1G1X+FqyY0Av7RAmETbdApiIWelpDD1YsZalN3Pp/Q5AEpHLE6VcvNZTV3aM6kCLNnn3ZrcavLVemmQLevIhHA8AmvV7M5nmdWqfbwdHs2hREen+K0Gyil0FhUiBu23muqaAO+SbZUM2LaQEKfYjqzeQwapYpTXt6mRjRQgZ1ozRsccdoVwaN5Eh1TOKTwr6kcjWd9X8Pw+9ubo89hH2cc5o68pjrrD0UHoKBRhMCeE5J8mzX1VdCdAYVYahgy4df/odzH6efi683P00WHvYRDooa+2IuWJRWT2tGIzjmNeaJMRXWi9f1BP/ofciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaO84MlMGfc6mc/rZyA5SsotjF3Am9RhVWbgtVvDeLY=;
 b=omjiR1B9CltHjlvKU79/A05oALRSbb0f6iZZ7IvVg6y+tQnWLqwN+AoFfyHazF/CBq0LBHy0bm9ZGJinnauy4qxepEG6X3yR7Quk6CA9Gm4MrqU5e4FG1h4M7NJvmqQGSe8vIT3FeiMr34+nLQWwYjZZKIXokiOx6OKt0YXbhCcj80HpyFwnsdL8WTMk+CMaJk+p4tgFAmOj5kLHW19N1bIPU6rzyBYxPUG4jDA0MWf9Ouh2r5bX0tjSY34JxrWDLgBS9NOGbPghBY8HUX+PO7jlOdSFLXEhhtzGLI/1K3opuJdu9c3JcJGty36udKYMfe9ysjmqg8zR0pQOqvgSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaO84MlMGfc6mc/rZyA5SsotjF3Am9RhVWbgtVvDeLY=;
 b=cYwCXeM+2u+nSEVr+xyMEKZwY+2CaJOpm827GFDGLQVwut8rlg48UYWWWUj0wpbcar8uicMOeyKkUNaNndxjo6mxGqxfzB5P8vibowFkVPrEjxIYbfZF1hT/fRD9mbxO/Lrd+N03bUUhrs3gElBhgNTgridVLiGlO+8vNzwhJUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 11:32:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 11:32:18 +0000
Message-ID: <a1c55bd8-9891-4064-83fe-ac56141e586f@amd.com>
Date: Thu, 22 Jan 2026 12:32:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
 <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
 <20260121133146.GY961572@ziepe.ca>
 <b88b500c-bacc-483d-9d1a-725d4158302a@amd.com>
 <20260121160140.GF961572@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260121160140.GF961572@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:408:f7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a484d5-837e-49f1-dc37-08de59a9e61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1dRcmtaRzh6Y0UzOWRtUFFKcVVYQVNEVFBqTU9aZU5tdkpiTGRXVlBvVTds?=
 =?utf-8?B?cnN2VFFVYVZSTUxsYlF4TlF0eDFWYUZGdUtlSzNWN05BQzdHRW1oM0dFYkdH?=
 =?utf-8?B?Z0VFN0RyblU1RHl0UVpPZmVpZG5taFlXVHNDYzBla0RUM2dVZjBBQVRXUUF6?=
 =?utf-8?B?WVFtNnprZFhSUWVhZzE2NTRrSk1EaERYTGtud0FYZVh0aVpBVEc1dmxXcXVB?=
 =?utf-8?B?Ym5FY05yWHB1Ynh5SlFuc3Fud21UbWE0L3pVQ3FycDRpRmFOS2JZb3A3R1NV?=
 =?utf-8?B?cG9aNlVqT3JSYWYwQ01aQjhGd3oxYmlZS3FTTWtTcUI1N1h3TE1mWWhtTHQ3?=
 =?utf-8?B?TXVUMUNXa2NDZFZzOWg0V1VoczNuQU01T3M2ZlZLcUMwbHdDRUpoRVd3a2Fa?=
 =?utf-8?B?SEF5T1g5TUY0am96SGJlSXM1WUJQU1ZWY2w1eStzem51WENnejJYd0JkRE1U?=
 =?utf-8?B?bHNOeVVyTGJGaE9IcmJiWjdGVCtMSDQxRmVyNW1jemQvSVFiVU9BNlBzVjNm?=
 =?utf-8?B?VmFKdnZETS9JcWdMYU5HcW93N0xqQWVwNy9nSTBkL3ZZR2Q3SkdERzZ2empq?=
 =?utf-8?B?U1lvcnI2YjVpNjFDeEtJVVQ5dnM4Q2d2YVY5UmtOWGJNcXlQRXA1dXR1YWhv?=
 =?utf-8?B?dnljd0QzVWU5cElhMC9WK21pMmJYWGxpYnNCLzljQitzRzIvV2VxMmFtbUpu?=
 =?utf-8?B?K3dFS2hxRHMwK0oxRHJRVEJVWDM0OU1qUWFLNm91WUYrNUxITU1zdDg0M3di?=
 =?utf-8?B?aFRJNVY5MDhoTURVVVE2azNOMmdlRTBpQjVsNUlFRkpxRGl6bkFzTXdLVUZD?=
 =?utf-8?B?R1FENnhob0VGbHlNWWlac3BJSDZDbGZPUDg3OEhqYmUzUlBHQ1E4UStPOCts?=
 =?utf-8?B?eFE1aWVERktHRGdYZG5ka1ZlR2hUWTd0S2pneVdvZjR5elA5d1lHTFBVN0R5?=
 =?utf-8?B?VHdlRm1vZDY3NlJ5M3FRbTBTN0JxdE16dVVveG5iRk9OMi9JQmhqWVViVzcz?=
 =?utf-8?B?UjA4d1ZrRU9GRDYyTFV2cjFxL3FFakQrR1g0aFlMWllqb2t0Snd5eXAxU0J4?=
 =?utf-8?B?b2VMenJnb3NTVmsxZ0tZdUwrQjFEWmhVQiszYkhyM1UxZWVBYVF6RjExclNu?=
 =?utf-8?B?M215cGkzR1RlUnFrcU9hVUFlSlhLTDFock1qUG9IRUd6amNBR241dEMrWklT?=
 =?utf-8?B?ZFNhZlI0QWZURk4zZVJCL284UEgvWTFBV29ObEQxa21NWVE0RnhiWWdablhu?=
 =?utf-8?B?aERRems1V1dTVFVGeGVOOU9MSm8xRjZuNk1zN2tKNlhLMElsTGNkdkgvUURm?=
 =?utf-8?B?bmczNWJ1YXRIeGI0eHU1QVNBKzVYZEpldVB1V2FFY25KWWxoejRCbmtZSzNy?=
 =?utf-8?B?UXdDWk5OL0s0VXZNWWNGT2JuVjc0ME5xNGN5WWhXd1RwNkNaL2xGRzBKUm4z?=
 =?utf-8?B?cmI0M3lrVk5zeVBMWUdRN0U4bTg2STZ6MjVIbnE4U09ZQlQ5UXlNeGZ2MHBn?=
 =?utf-8?B?SG4vKzJETlJPOGpySkdXb0JXbERrOVl3RmZpUjc4VnNrelV6cVd3ZGFDazA1?=
 =?utf-8?B?NktHZDRYbzRURjc2VkJ6bmxzRWpCK21qaXArRVhsUis0NERaVlhOdUZQSjQv?=
 =?utf-8?B?cHFkaG5nNDlMUVBiSmwvZ1Z2WmtXeFYva3VzSllIR0sycGh5cHlLc21NNk12?=
 =?utf-8?B?MVR3RFlSY0VmYXVFT2hBdG9NQ0RhV0wxbHMyREE5WjlJQzZjYVF5VzRNdDc2?=
 =?utf-8?B?cVFLK0NxekQvNVU5MWVMREg1SE9xdGN4V09WaktOUXY1RlZUQlNjNnBiUGpv?=
 =?utf-8?B?U3pQRk1aTFlBanNJdzlrZUJsbWs3VHUzNm15aHFjUXdDSUxzeE5YNm5nUGh2?=
 =?utf-8?B?a1VMV3RMV3VhVGliWFN3UE40VWhSRW5Hb2RXdFlJOHROK0dWR1BpVjU3Slky?=
 =?utf-8?B?M1l0STFMUjZOS2VVL0tsMmo3MWc3N3ZHeU41azh6THlyWDNPZVdMZ0k5RHJo?=
 =?utf-8?B?bmVxdzZkN0dnSkUxeVhza25pZUk5UFJZNklFZnRBNU1NV1JBUDhzNTVPT2ox?=
 =?utf-8?B?Zi9uRXdZeEhyQllXUVRWcENBRDNmNzlHZFBxNkRFWm5pVU5SakFEMmpoOFNh?=
 =?utf-8?Q?agDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHdrN0ZsY01mdkNRU2FuZEFTd05LRm9wYzF4WExUOFBOQmZhOXdHLzFRS2pl?=
 =?utf-8?B?L3NPUWE5Sm4yVXVmQ1IwTU1yU0h4bHRLRjE2N1h2ZDR6QktURXpXbTV3cVJo?=
 =?utf-8?B?U0JWVTAxT1RGemE2SjRYRS9hNCtjR2VkYXZ4ajRoeFBtS1IzZ3lKYkZicWZP?=
 =?utf-8?B?L0tQY28yR1gwOTV3NUYzWms2MXcxSkpWZC9RU3Naeng3M0dsMDlMUVV5LzdF?=
 =?utf-8?B?U2dDWmJpSU1rcHJKZm5mUFl5OVVxa1grWDh3TktQTjNtZTVFWVlsdkNMbENo?=
 =?utf-8?B?T2RQK1ZiT1lmZFRjWHArRWdNRVlsN0NzV3FoV3cydVhvcy9tMENZOGE5L1Nt?=
 =?utf-8?B?SjZKYjVxTzBNMWhQa1VLTnR2SnR0ejdmc0sxU0F6aU5PR0hkeC8rY3ZKaTFq?=
 =?utf-8?B?MHBYZkRoSnU3VXdIa1BRUFBPc2srMGUzU2ZBODFOTDg1V0x4NGpNRmU3ZGtI?=
 =?utf-8?B?NmxRcjcveEpSVEFnM2FsZG54cGRkOHliNzBiUWN3QytTS2wrTXZtdG91VmFD?=
 =?utf-8?B?djByNUdEUzB0MjJpd3dvWk12bG5Ya2lLOG9Xc0JOVElTbTBDcXRVOUtuVXhG?=
 =?utf-8?B?NWM2aGZIOUJud1llS252T0hNSGljUnRTWjhzaFBjaFd1dnpWUHErL29MTHdO?=
 =?utf-8?B?SkZ6aHRRaHZHVUQ3eUxFSkREQVRrSlJ0NldKVDRGbDFhVGozTTViRkp6WjZs?=
 =?utf-8?B?NnkySUlXeWw3OWFwOE82cnYwc2pUREVwcGsxT2VMeUxkcGNCRzZ6OC9QdnpQ?=
 =?utf-8?B?NVdpYmY5UWl4YXRUSWJoTVdXQ05MMTU4endEcjRKamMzMUhSRmg3b2NDVEtX?=
 =?utf-8?B?ZFFITzJ4VkJzT01mQUw5bnhsTkJWeWMyZHRjRFVUNHFaOW92M293bEdFNlJK?=
 =?utf-8?B?cUFOcmh0c1JpQWNUb1RyR0wxbkdEcS9KQVZUNFpuRm1Xbk5ZbEE0bHhtaEh0?=
 =?utf-8?B?Q1NtaFNEdmVxK0hEYjgxYkZMcTNIaTUwdS96YTJxeXB6K1RadHFpUURybnNj?=
 =?utf-8?B?VjdtZFRPUVZxc0lacUhVVkxUN01KeUtHbE0vdFVwZ3lOeGI0OFNBeVFIOXJL?=
 =?utf-8?B?RWd3WXdQMXVZc0R2Ulg3QUVHeG5Cbm1LaFU0R2cxVnI1L3NHaW1UTFJxS2pU?=
 =?utf-8?B?bjB3OGQyQkRlUmNlbWJTaTJscE5xak5SUzBESFhtS2tic2JTR3ZqUWNBSFFL?=
 =?utf-8?B?TmpVcjg0SElpb0hmTDJUd0pPY0hVQVhZdjdLOFhXa0xLMW10THNOaFN1ckVH?=
 =?utf-8?B?eTEyR0NGOXNlMGNOUElwTGxUZXNMajNHdjJNSnQ0MG43V09SMUYySnFsZ1F6?=
 =?utf-8?B?a283S01LanhHSldUazBMcVMraEh6aWw2eTFLMFRjdndCYmwyL3dKMXd0ZGI2?=
 =?utf-8?B?ZUZjdWdvSitRUWg2b0xHM3p2d2JlRHEwYnFIcW5pRy9sb2NzOXhHWUR0K0pr?=
 =?utf-8?B?OC9mQjNKZ0J2MzZFdnhsMTY5NXZkcmdTV2pzUTZJai9rUmc2ZlA0REdQUVVW?=
 =?utf-8?B?WjBjWVhIei8xNWoybjlHT2dIYkRrajlBc3QrQ1I0RWNvT3RqTnR3N0d2Ym9k?=
 =?utf-8?B?VExMT3ZJUk14cDRKb0IvV0lGaVFHSDVKRk1IYnhkWTJ4NlZZTWxVZ2dJTmxj?=
 =?utf-8?B?ZW1pN2NPUUwwaG5CbEY0aGhlM3JGUjVCbTBaTmEzdE5FWStPRlprN2FwWjhB?=
 =?utf-8?B?V2p5dFZWQWxmekl0bnJWUXZpRHQyc2Z3Rzd3ckxWcXpqYzlTVDN1RStxZmtE?=
 =?utf-8?B?cm5Lcm9IbzVOUFlucEhtSHNVc2R0bTJWVnpnZE9rNkdWcG5OWGVDQTluOGRC?=
 =?utf-8?B?aXBXbDk4Yzgwcmd0RlBpci80TEJkL1kzNW9FK2xzTnlRazFQWjVNVUpCK2Yy?=
 =?utf-8?B?Tkl6UGJXckRiaEJHaE1YVThMZGNaWmpnSk9aRlNpZmllRG1ISlVkVElGOGhO?=
 =?utf-8?B?T3FjRmxZQWNrcEVxL0xoUmpDTTcyVXpJTmlSQkFjLy9NczlOTkI0RitITHpv?=
 =?utf-8?B?dFpjeXF6MlVmanF1R2NmdjJZaUdKRE82K0F2Vi9TckZoMVpIRUZKNEtUMU9E?=
 =?utf-8?B?YmVwVkNXZnkxN2RmN2o5UjlSZHR0UkdIbXpKSHorUVlHQVB5TE5SVXM1Rk5D?=
 =?utf-8?B?a0pUL1g4UnZoREJ0ekEyT2FVOWhGOXBOMVIyRWZuYWM5TFMrT1lFTnIyQ3Z1?=
 =?utf-8?B?YitVSzZidFc3Zm96cVAwVHlHRDZQc3dxd2hyN1gxQWRPREM3djdzU0lNQkEx?=
 =?utf-8?B?TmU5ZGVleW9CMDhHNWtXSGxvT1lLT0ZNanpMaXp1cVR1NGpNVWtDdEsxK2oy?=
 =?utf-8?Q?3wnynFD1uymlv1TEak?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a484d5-837e-49f1-dc37-08de59a9e61f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:32:18.0549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzFQ0U10xjIM8kgJX9Fi53NQ0ZHBqw8aCaNhn6jOzqmEBhJtoMZM3ioMteuVDOaH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: AF02D660A2
X-Rspamd-Action: no action

On 1/21/26 17:01, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 04:28:17PM +0100, Christian König wrote:
>> On 1/21/26 14:31, Jason Gunthorpe wrote:
>>> On Wed, Jan 21, 2026 at 10:20:51AM +0100, Christian König wrote:
>>>> On 1/20/26 15:07, Leon Romanovsky wrote:
>>>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>>>
>>>>> dma-buf invalidation is performed asynchronously by hardware, so VFIO must
>>>>> wait until all affected objects have been fully invalidated.
>>>>>
>>>>> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
>>>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>>>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>
>>>> Please also keep in mind that the while this wait for all fences for
>>>> correctness you also need to keep the mapping valid until
>>>> dma_buf_unmap_attachment() was called.
>>>
>>> Can you elaborate on this more?
>>>
>>> I think what we want for dma_buf_attach_revocable() is the strong
>>> guarentee that the importer stops doing all access to the memory once
>>> this sequence is completed and the exporter can rely on it. I don't
>>> think this works any other way.
>>>
>>> This is already true for dynamic move capable importers, right?
>>
>> Not quite, no.
> 
> :(
> 
> It is kind of shocking to hear these APIs work like this with such a
> loose lifetime definition. Leon can you include some of these detail
> in the new comments?

Yeah, when the API was designed we intentionally said that by waiting for the fences means waiting for all operations to finish.

But then came reality and there HW just do stuff like speculatively read ahead... and with that all the nice design goes to the trash-bin.

>>>> In other words you can only redirect the DMA-addresses previously
>>>> given out into nirvana (or a dummy memory or similar), but you still
>>>> need to avoid re-using them for something else.
>>>
>>> Does any driver do this? If you unload/reload a GPU driver it is
>>> going to re-use the addresses handed out?
>>
>> I never fully read through all the source code, but if I'm not
>> completely mistaken that is enforced for all GPU drivers through the
>> DMA-buf and DRM layer lifetime handling and I think even in other in
>> kernel frameworks like V4L, alsa etc...
> 
>> What roughly happens is that each DMA-buf mapping through a couple
>> of hoops keeps a reference on the device, so even after a hotplug
>> event the device can only fully go away after all housekeeping
>> structures are destroyed and buffers freed.
> 
> A simple reference on the device means nothing for these kinds of
> questions. It does not stop unloading and reloading a driver.

Well as far as I know it stops the PCIe address space from being re-used.

So when you do an "echo 1 > remove" and then an re-scan on the upstream bridge that works, but you get different addresses for your MMIO BARs!

> Obviously if the driver is loaded fresh it will reallocate.
> 
> To do what you are saying the DRM drivers would have to block during
> driver remove until all unmaps happen.

Oh, well I never looked to deeply into that.

As far as I know it doesn't block, but rather the last drm_dev_put() just cleans things up.

And we have a CI test system which exercises that stuff over and over again because we have a big customer depending on that.

>> Background is that a lot of device still make reads even after you
>> have invalidated a mapping, but then discard the result.
> 
> And they also don't insert fences to conclude that?

Nope, that is just speculatively read ahead from other operations which actually doesn't have anything TODO with our buffer.

>> So when you don't have same grace period you end up with PCI AER,
>> warnings from IOMMU, random accesses to PCI BARs which just happen
>> to be in the old location of something etc...
> 
> Yes, definitely. It is very important to have a definitive point in
> the API where all accesses stop. While "read but discard" seems
> harmless on the surface, there are corner cases where it is not OK.
> 
> Am I understanding right that these devices must finish their reads
> before doing unmap?

Yes, and that is a big one. Otherwise we basically loose any chance of sanely handling this.

>> I would rather like to keep that semantics even for forcefully
>> shootdowns since it proved to be rather reliable.
> 
> We can investigate making unmap the barrier point if this is the case.

I mean when you absolutely just can't do it otherwise just make sure that a speculative read doesn't result in any form of error message or triggering actions or similar. That approach works as well.

And yes we absolutely have to document all those findings and behavior in the DMA-buf API.

Regards,
Christian.
