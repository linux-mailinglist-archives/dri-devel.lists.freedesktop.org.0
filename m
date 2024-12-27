Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F69FCF8B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 03:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A4510E166;
	Fri, 27 Dec 2024 02:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QQlQSInw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F2D10E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 02:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZybpMZ2A7zB888Kuw5q/6PYcSVSbKa0WUdReXyy9lN+4FfBh608k/8B5RX3tRgUNJFk9HshUQsjdbNoItE1WHMu1y9S3yFcif34CZwgzgA8s51HEmGtsujYgF80dgXPCGfDmS+8+92kuJf7r9gedQPguBOjrtRI3zhDFUuxeZZANGHceV7vMyMOXDBQ6qrnxpqDOfhlJ7+iGcXioiUwUmwlSZigOkN48X1iydiHK+o9PTPjdsLulun7RYuj5gc+MBqiGb8h8lUoRGsGWVlLL+1gYulVsv8Cfjv5qtCxhNQQPGeKmqqKvtB8Sh6y9Nd/lWfNn96MzSGpSDYyWKCPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fg0hzrup9gs4OdLecwVyIpIm5fjyPXsBzmzOcwsQ68=;
 b=K8q/i0h97zXGzDGGBTudDxWtdBOlt3qTkjf8/imf2UtMi/79kxw3re2pZLIflgJ+YXCJc2JKwQDOc+KtpId1id/ord5gvjHDihWJBvqHgwAWhIIlLHRASMWK0OCziSmpbBzrLdiURbn/wQ4O3w+upTcypunLbqheXB7c1qWRl+Lc8ZxrwtrP5ZpCsciiycV/4pvm0cit+7tVk1kflwoRSlHqquDROBc+qqqqcAfGuKTBzpiVB6HezNxspQCx4+iWWai+csL1rKI81MWFeDDrD06/lvdQNE7VQhtu+tBkEApFXJ8ONUsNQtDF5ujlhFk/nyQVIpr1q/gZ1y4e9AB7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fg0hzrup9gs4OdLecwVyIpIm5fjyPXsBzmzOcwsQ68=;
 b=QQlQSInwwW5YfCTeEVCFid3Oup6b8sGxQtD0c9E3P6ntIJaw3cG9R7UdXGPIIzfJwdI0Nsc9nYqvjiU7ULALpDFVO7iJtk4Q9/z7N+lasa97yklZZqzNyaZEt3aw6aDdfeK9GtusGUrtJC1BpenCVc+qRpPkdkVfbm7jJ6CO0mA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Fri, 27 Dec
 2024 02:02:13 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%2]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 02:02:13 +0000
Content-Type: multipart/alternative;
 boundary="------------jv7PvqIrgnbiI4iK0mUa9fn2"
Message-ID: <40485636-7ea3-4e34-b4bb-1ccaaadd4e47@amd.com>
Date: Fri, 27 Dec 2024 10:02:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
To: Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui
 <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|SN7PR12MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: cfce65bc-a9d4-4baa-a7a5-08dd261a7acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZYUXphYnFtTklaWTVrSHgrTnJ1SDhRaWNqWjVMVkF0ZTE1enIzT0llbEll?=
 =?utf-8?B?UHl3NTBoZFYxYkE1bUd0TkhvbG9vNStuMmVieS9IbkxqVGV3QmlweGoxMjhG?=
 =?utf-8?B?S3FPZjJENlhEZlNFYjdyU3FaSVNhTm5XS1RjN1FGYWFhZjdJS1Q4S21uVlNB?=
 =?utf-8?B?NXc4RTZWaGVoYUVlZHZrKzh3M2YrYkEwMlNGVEdBMVNRS2lwVkJXOFRjeTdW?=
 =?utf-8?B?Q1o0ZTNCZmVtZ3E0SEovNDhISGkxc0lFWEppbE1TUTkyN2prNVpCUHMra0Rz?=
 =?utf-8?B?Mk5qZzJ4MUR6cGwvRExvWDQxL2tlKytMSmJqdk4vMVYzRzdhYVIwQ0RjaWtx?=
 =?utf-8?B?UHhQMHkrOWdjV29vQnRHOWo3MUZzZnFtMHB4Z252ZHlRUE1WT1kzbmo1bkFh?=
 =?utf-8?B?OENwN1lwWnhrM000V1h5Y2RTM1RwZ2M5SUE0Mld0clp2OXoxYTBKSk9wZEhD?=
 =?utf-8?B?RytEYWRPNjhyMm1EQ0phOGViUkE2bGtYWUxLQWtFQ2RYWW9kRVVkb205Yi8x?=
 =?utf-8?B?SnJLZWNCZWVWNnlWYVFvK082a2liVzBhYVlqYlFrQmRvS0x3WDZRdlJISm15?=
 =?utf-8?B?eloyTDFPdjBJa052aG5LSFpQNnRSbE9YcTRHdTFWZjFyQkdvREZzOUlFMzJU?=
 =?utf-8?B?dFJBcGpzR2lYV3dFaXN0RGk5VGpkbGZhTVAzODN1WHo3cHlWNDBnUWFrc3Y3?=
 =?utf-8?B?VHZaaWo5dExQdWZKMUZuNExDQnViUE0rTStSZFpTWXlUWkY2bUlSTjh5OEtX?=
 =?utf-8?B?dXMwYjV1OEsrZlpEZ1B0WlByQ2MvZ2lST1Bocm5WMFVSdWhuYU82ZnFsQ213?=
 =?utf-8?B?WWZ2SEpSQ3BERFRza2VjQ0xmVmZ3TFhLZCtPK1FSZG83aUxiZDRCRXQ4dG45?=
 =?utf-8?B?a0U3WVIvVEFIaXRnZ3VZQURSMjh5YWVrZDB5V2c0RnRTS2VCMm9oRUdpOHdZ?=
 =?utf-8?B?amdPSFRtZEQ4Z0hmZzFDOGh4ZllrZDJqVWlrT0NLMU0yMFBCQndyK28wcDhK?=
 =?utf-8?B?V0Z1dE9sTTNlRVFieEszM21tVFRlZkdyRkJZaEFHM29NMWV4QVlBc0FSL3c3?=
 =?utf-8?B?NGtwUFU5SFdhVkVaajdHcENHOEEwSkJSbDNlYmQyYUFVQ240QjRFbVFUV2ZZ?=
 =?utf-8?B?clVqckJES2tVUGIrTzNPWE9LQmkzL3pSYWJ6M1NGVTQwbnNuQWIwb1lrSUI5?=
 =?utf-8?B?MDRhL3ZYUHlwcWhlWFBlQ0I4U05MWkdDR1hmV0pJTjkxK1EwYmxVR3JkeEhr?=
 =?utf-8?B?YmlwU2oyMi9TMUlWc3lHYTd6OHRmdDVvTFRwWVd5My9yZkdJVUtBM3grT2hM?=
 =?utf-8?B?ZnNLSjVadGZERWI4SUFWdEpIeTZZcTI2eUlpZDVvcWNtWGlIUUxlTGgzZUY5?=
 =?utf-8?B?VFM1QzFlUFhmSndMNUhYMGx2aDhpcUtJSVlZRWZGVGIvSzlQeVk0TmppMG9x?=
 =?utf-8?B?MXhzN3FJYThYa25BREdmQXI1RW9La2MxSnZWRnRMRDhTM3BSem94eHhIYlFk?=
 =?utf-8?B?N2RKTEZRR0xPQUMvUGJmbk5DY0R6cjhUclVJOHVKODRzWVVyYmF0MnMxbUc5?=
 =?utf-8?B?TURTeEtkUndBT3JCUERVQmNSSlZSd2txazBWUjdaT05oYUZGSm5Hb0tKVzg3?=
 =?utf-8?B?NytWdDVxSzh3dVZEcHNRdWtuUmRiYU0zR25tU3pKc0dHcGhqZUFmME9BUDR4?=
 =?utf-8?B?SGJRM25yS1VTMTYvUDZKWnU0MXBQWlFJQU5DOEJuRktNN25tU2RFa0tlZXRp?=
 =?utf-8?B?MUprZWRKd1RvK3EwS0FsdGh0eFpJREovZndrdis4azl4cGFKUVl3SmNGbjdm?=
 =?utf-8?B?YTBUa3hyMXpZVy84K0xSaTFHamF3TmhRaW9Wa1lldHVMaVA5TldLajVET1dE?=
 =?utf-8?B?TXNrNFNBZ3c4aUJMMHlpcVd4cUtMTjRDbUxkMVBTbnJyVzFwUEhSczJVRi9Q?=
 =?utf-8?Q?6uSFn6CxdjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxSWklYOTFYQzk4WWlhSkY5Ym8zWlk1QTF1VFZHZDhFSFVjNnNIREZ5NTdl?=
 =?utf-8?B?SlIrSTBLM25MTU42WVVPQU4zQ21EczBQbUxwMEZrc1Era0xDekUvUEJjcjZB?=
 =?utf-8?B?Mm5PS0c1eTdtVWhQYzJNSy9ZQTlnY1UvVDRoajFud202MWx6b3g4aG1ZSWZV?=
 =?utf-8?B?YUJRSjJoZmZLQitmeERxaWRDQUVrc1BpSlc4Mk1oSnVCclFaRVZMNEFoVzdX?=
 =?utf-8?B?VVBFa1dQSlRVdlV6c3pGWHNybDNMNXJYdmk3VEdPK2t4dU9UODc2T0NSUnRm?=
 =?utf-8?B?L2dRb2VuTmx0S0VnMDU2SXo5cUJkQi9BMHA4SC91Z1d4VHZNTE1qWldiTlNX?=
 =?utf-8?B?RlNMM2VJdUV5bVdpUVN4c3FUZFhlS244cHpybmdFa0lmeHB4dHhpRHRFTllB?=
 =?utf-8?B?L1lQQWV5cVA0VzVKUDQvSUJraVczc1dDRkFiVnFUbmxyY0U5anRjTVpqR085?=
 =?utf-8?B?UVhxL1VOMXNsTXBOSTdCaUpGbWFkZk9tRGhPUHR3eFdlQml1UmR6NisxZGZQ?=
 =?utf-8?B?UTJaSWY4bFR3OUxRRnQ2a24vWEQveklUZEc2a0lObXNIZ21lZjM5N3hxQnht?=
 =?utf-8?B?V0tpRVEzMk5nMXd1VmVrRWNuL1BYVUwrOHZoQ1kxQUlqYWgzdmtmRzl3ck50?=
 =?utf-8?B?ZmI0eDV6TzJ3NGhpNE16UnRIMWFnSExRU0NzMWlTYVZWbXdXZjI5WVNuR05w?=
 =?utf-8?B?ajNhWFY2eTgyVks3QXFwSm1NN05MQXVIVDJkcTArRTIrVENNcThhbi8yUW11?=
 =?utf-8?B?aUdTaVNyVGFTM1BPMDg2bm9FYkxZZUUzY2o3RStiOVdUREpkWHRhMWszVVN5?=
 =?utf-8?B?TFF5OU42Ry9MN0FkWXhyNGV3Qnltb043WU5uMW1WY3lJYmVNYkdrREhYYjQx?=
 =?utf-8?B?eTJIdk9EeGVPZ2pLTGxHQnNzKzl3OCthNU1ROUkwNFk3czhRbHV2TE9ibmo5?=
 =?utf-8?B?MFN3SmJISU9vVUVJSkJnMEc3MGU4SG1heHBWUDZsc21XSGxPVUFDWS91SVpW?=
 =?utf-8?B?ME5oUVpJOUFFRnIraDMrMklQWmRBdlRTeVcraFJHVEFwOUR5eGZ2Vmtndi9p?=
 =?utf-8?B?VkNIMHNadVRXZ1dHejBIc1U5bC9WQ1ZHNFFvb2RCWkc1NVRkU1luV0t5eTBV?=
 =?utf-8?B?Y3JXVDV4Z0sza1dydG1ZQjdHZGtNc21mQ0QvVUpkQ0NIQkFBM09XSlFKVXQv?=
 =?utf-8?B?QlZ3MUYzZU9DUmY2YkZ1V3RTKytFMWV1Q1NlZW1iR3dmbHhpUzBmbHdtUXU2?=
 =?utf-8?B?OTd5T1lVaFF0ajBCUTYxSVk0bkhlcW1idVEvUWduVFpQNEg5N1BVNkNROXZY?=
 =?utf-8?B?ZER0dEZlUGowT0F3Q09pRTRjVW5zMVNzUkw5dGJmMUFXbklYTDJCZjVoTy9C?=
 =?utf-8?B?d1lnQTJobGZtRGZNMG5oS244V05ZeXRuc2h3VDB1V0hTVlltUkFOMU9HaDZp?=
 =?utf-8?B?M1lUSUphTDV0QUZWQnV5RnhsNGY2N3R4QkMrVnJGKzJZcGlHbzFlNTQwTERq?=
 =?utf-8?B?Tk10ZDlRNm5oNnNKekNpVkhFTk01VC9OYzJENzYzam40bFVFTnVtNWoySHVR?=
 =?utf-8?B?YXc1Z0M2UXNQVlIvZ2Y4aUNDOVcweTM3M1phdFFYa3FNTkVxRW9iOWhBTHls?=
 =?utf-8?B?ZWljdVY3bjNUcHNnV1BFOElnUnlQT3g0QUpab3FpNGIwZWJBOEJaZDZiRGVw?=
 =?utf-8?B?MTZHSHVsMk51bFVaR2plenhuWVBKZHdJOVhaSDk5Q0dFU3FsY3doNHhCSWwy?=
 =?utf-8?B?N2xSaGNOaDJ5dTUxancwNStldWVUUTBUTHR1dWdHU3JFdkYrV3hmSFdjMHVV?=
 =?utf-8?B?dFN5WmFuTG5maitVclhWdU44L0pGSXN2djhPUjJsS25Mb24vWW1IeFVlWlZ5?=
 =?utf-8?B?c3Rqc1B4ZThncTFHZGxWeEp6bG5jOHl0TGI1QmZKWmJOdkVWZFUrY0NJN3l3?=
 =?utf-8?B?cFllVWc5UVNFRm5MdzIrMThTZkZ0Y0E1RWgrM01OeWpENVNpYTFXZ2c1Qm0w?=
 =?utf-8?B?Z3RHMjRCbjA2eTM1eHpYOHFnSVBGWmVtREFBR2ltRzNZK3NqV2hGZ2VwcUgw?=
 =?utf-8?B?YUdwWVJ5U2F5VWVySWxLN0VBRHIrVENPU0Z0dWRIemdKbmo0RWhpaHZDRlUx?=
 =?utf-8?Q?LZA21fFvwdDgKH28gSoK7enRA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfce65bc-a9d4-4baa-a7a5-08dd261a7acb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 02:02:13.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WExh3NRjvt4Nm9ex8xwKgws88/WrKQ23WdjbAWccF6keCt7Mz/w5WmI5suCSBWmqDSrRqukz+EgM6O7aayv0nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816
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

--------------jv7PvqIrgnbiI4iK0mUa9fn2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024/12/22 9:59, Demi Marie Obenour wrote:
> On 12/20/24 10:35 AM, Simona Vetter wrote:
>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>> From: Honglei Huang<Honglei1.Huang@amd.com>
>>>
>>> A virtio-gpu userptr is based on HMM notifier.
>>> Used for let host access guest userspace memory and
>>> notice the change of userspace memory.
>>> This series patches are in very beginning state,
>>> User space are pinned currently to ensure the host
>>> device memory operations are correct.
>>> The free and unmap operations for userspace can be
>>> handled by MMU notifier this is a simple and basice
>>> SVM feature for this series patches.
>>> The physical PFNS update operations is splited into
>>> two OPs in here. The evicted memories won't be used
>>> anymore but remap into host again to achieve same
>>> effect with hmm_rang_fault.
>> So in my opinion there are two ways to implement userptr that make sense:
>>
>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>    notifier
>>
>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>    page references or page pins at all, for full SVM integration. This
>>    should use hmm_range_fault ideally, since that's the version that
>>    doesn't ever grab any page reference pins.
>>
>> All the in-between variants are imo really bad hacks, whether they hold a
>> page reference or a temporary page pin (which seems to be what you're
>> doing here). In much older kernels there was some justification for them,
>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>> now all sorted out. So there's really only fully pinned, or true svm left
>> as clean design choices imo.
>>
>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>> you?
> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
> in complexity that pinning everything avoids.  Furthermore, this avoids the
> host having to take action in response to guest memory reclaim requests.
> This avoids additional complexity (and thus attack surface) on the host side.
> Furthermore, since this is for ROCm and not for graphics, I am less concerned
> about supporting systems that require swappable GPU VRAM.
Hi Sima and Demi, I totally agree the flag FOLL_LONGTERM is needed, I 
will add it in next version. And for the first pin variants 
implementation, the MMU notifier is also needed I think.
Cause the userptr feature in UMD generally used like this: the 
registering of userptr
always is explicitly invoked by user code like 
"registerMemoryToGPU(userptrAddr, ...)",
but for the userptr release/free, there is no explicit API for it, at 
least in hsakmt/KFD stack.
User just need call system call "free(userptrAddr)", thenkernel driver 
will release the userptr
by MMU notifier callback.Virtio-GPU has no other way to know if user has 
been free the userptr
except for MMU notifior.And in UMD theres is no way to get the free() 
operation is invoked by user.
the only way is use MMU notifierin virtio-GPU driver and free the 
corresponding data in host
by some virtio CMDs as far as I can see.
And for the second way that is use hmm_range_fault, there is a 
predictable issues as far as I can see, at least in hsakmt/KFD stack. 
That is the memory may migrate when GPU/device is working. In bare 
metal, when memory is migrating KFD driver will pause the compute work 
of the device in mmap_wirte_lock then use hmm_range_fault to remap the 
migrated/evicted memories to GPU then restore the compute work of device 
to ensure the correction of the data. But in virtio-GPU driver the 
migration happen in guest kernel, the evict mmu notifier callback 
happens in guest, a virtio CMD can be used for notify host but as lack 
of mmap_write_lock protection in host kernel, host will hold invalid 
data for a short period of time, this may lead to some issues. And it is 
hard to fix as far as I can see.
Finally I will extract some APIs into helper according to your request, 
and I will refactor the whole userptr
implementation, use some callbacks in page getting path, let the pin 
method and hmm_range_fault can be choiced
in this series patches.

Regards,
Honglei
--------------jv7PvqIrgnbiI4iK0mUa9fn2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2024/12/22 9:59, Demi Marie Obenour
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com">
      <pre wrap="" class="moz-quote-pre">On 12/20/24 10:35 AM, Simona Vetter wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Honglei Huang <a class="moz-txt-link-rfc2396E" href="mailto:Honglei1.Huang@amd.com">&lt;Honglei1.Huang@amd.com&gt;</a>

A virtio-gpu userptr is based on HMM notifier.
Used for let host access guest userspace memory and
notice the change of userspace memory.
This series patches are in very beginning state,
User space are pinned currently to ensure the host
device memory operations are correct.
The free and unmap operations for userspace can be
handled by MMU notifier this is a simple and basice
SVM feature for this series patches.
The physical PFNS update operations is splited into
two OPs in here. The evicted memories won't be used
anymore but remap into host again to achieve same
effect with hmm_rang_fault.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
So in my opinion there are two ways to implement userptr that make sense:

- pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
  notifier

- unpinnned userptr where you entirely rely on userptr and do not hold any
  page references or page pins at all, for full SVM integration. This
  should use hmm_range_fault ideally, since that's the version that
  doesn't ever grab any page reference pins.

All the in-between variants are imo really bad hacks, whether they hold a
page reference or a temporary page pin (which seems to be what you're
doing here). In much older kernels there was some justification for them,
because strange stuff happened over fork(), but with FOLL_LONGTERM this is
now all sorted out. So there's really only fully pinned, or true svm left
as clean design choices imo.

With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
you?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
+1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
in complexity that pinning everything avoids.  Furthermore, this avoids the
host having to take action in response to guest memory reclaim requests.
This avoids additional complexity (and thus attack surface) on the host side.
Furthermore, since this is for ROCm and not for graphics, I am less concerned
about supporting systems that require swappable GPU VRAM.</pre>
    </blockquote>
    <span style="white-space: pre-wrap"><font face="monospace">Hi Sima and Demi,

I totally agree the flag FOLL_LONGTERM is needed, I will add it in next version. 

</font></span><span style="white-space: pre-wrap"><font face="monospace">And for the first pin variants implementation, the MMU notifier is also needed I think.</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">Cause the userptr feature in UMD generally used like this: the registering of userptr</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">always is explicitly invoked by user code like &quot;registerMemoryToGPU(userptrAddr, ...)&quot;,</font></span><br>
    <span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap"><font face="monospace">but for the userptr release/free, there is no </font></span><span style="white-space: pre-wrap"><font face="monospace">explicit </font></span><span style="white-space: pre-wrap"><font face="monospace">API for it, at least in hsakmt/KFD stack.</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">User just need call system call &quot;free(userptrAddr)&quot;, then</font></span><span style="white-space: pre-wrap"><font face="monospace"> kernel driver will release the userptr </font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">by MMU notifier callback.Virtio-GPU has no other way to know if user has been free the userptr </font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">except for MMU notifior.</font></span><span style="white-space: pre-wrap"><font face="monospace">And in UMD theres is no way to get the free() operation is invoked by user.</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">the only way is use MMU notifier</font></span><span style="white-space: pre-wrap"><font face="monospace"> in virtio-GPU driver and free the corresponding data in host </font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">by some virtio </font></span><span style="white-space: pre-wrap"><font face="monospace">CMDs as far as I can see. </font></span><br>
    <span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap"><font face="monospace">
And for the second way that is use hmm_range_fault, there is a predictable issues as far as I
can see, at least in hsakmt/KFD stack. That is the memory may migrate when GPU/device is
working. In bare metal, when memory is migrating KFD driver will pause the compute work 
of the device in mmap_wirte_lock then use hmm_range_fault to remap the migrated/evicted 
memories to GPU then restore the compute work of device to ensure the correction of the data.
But in virtio-GPU driver the migration happen in guest kernel, the evict mmu notifier callback happens 
in guest, a virtio CMD can be used for notify host but as lack of mmap_write_lock protection in 
host kernel, host will hold invalid data for a short period of time, this may lead to some issues. And
it is hard to fix as far as I can see.
</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">Finally I will extract some APIs into helper according to your request, and I will refactor the whole userptr</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">implementation, use some callbacks in page getting path, let the pin method and hmm_range_fault can be choiced</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">in this series patches.</font></span><br>
    <span style="white-space: pre-wrap"></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">Regards,</font></span><br>
    <span style="white-space: pre-wrap"><font face="monospace">Honglei</font></span><br>
    <span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap"><font face="monospace"></font>
</span>
  </body>
</html>

--------------jv7PvqIrgnbiI4iK0mUa9fn2--
