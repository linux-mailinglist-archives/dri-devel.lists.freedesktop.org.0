Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA190B36B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F77E10E418;
	Mon, 17 Jun 2024 15:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zxR+k8K9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DE910E416;
 Mon, 17 Jun 2024 15:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReiNx4xdbYcQVflo+PooaN7ynmYHEKe12LZbZbeYCj/LpalA0Fu7dwbJrq96Ke9jlq95k0n6l+EmfSQwf8wvx0p51S088fUcYMf58jISNxhh/6x2nGuv6LgIoE+QDoJgOyhqGKTV/orEGbJkd5eqS2VOJ6iMQfaUIdY6DC69eedOZ7Y429r6qCGz3229Ox1znGotTBEHB4kfTVN1Koldp4IUj4futIDEd9akk2uWxMk9TprRI1E8l1/prCqX2xQKGBCB0HRLDhTzOSfgC9p1fi5KTLoa71aoITp5mVTYlHYPClXwG2n8avlM6tVlj3rhitDiC0ODphBF6U7MZ6Tz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhzOVY0LB96+WJdew0kihpRjDf40KdHOY4lZ8np2ZYA=;
 b=n2IEVDkeowZj7QjcL2pDageXLp3AJ1w7TOe26BVeyfff8gQutPk0ZvpzAT7CC2LEvdKuIvVokzs3dB0PF+ctaBtZRyYroDYVvZsmBCHETDBr6cLhzpePsbesewVmNRdRDRJlcKpKG4mM0j6/BoK5wlchyPPAFPa9IcFFXd/fxDEjmkzxBqXuRKXssdqpOgVx5bue5hBQh49WVfs3V5dqfO6ZSbbipxvlhLN1G4QOD8/rIQe7khFft5wsaGC4emSh8NsIKB9N/9WIWDahbPh5u5AJc1b25hjIblB5yNReYbYAm4rjqOX/0fRFbeKdaalt2x9MnYO20I8RTe0dG25r8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhzOVY0LB96+WJdew0kihpRjDf40KdHOY4lZ8np2ZYA=;
 b=zxR+k8K9WF58pjyfZ+6D4a7oNReBCMLdFgNy/27Lv334H0wibu5jyQz9zjQTu2kkD6VqN9W7D7GCdJLq/bASZokGzSI11168xZkJwSxPvLfyo4cx4yisYW85aMuefxM9FAqdMLA2bAzqGQVHnp0Lkg4EPRZc4EoCOv12MHiW84o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 17 Jun
 2024 15:07:24 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 15:07:24 +0000
Content-Type: multipart/alternative;
 boundary="------------qvbOhFODDNcpXYgDTfS4S77y"
Message-ID: <50573575-31a1-4ba6-8064-64399a5eac0f@amd.com>
Date: Mon, 17 Jun 2024 17:07:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
To: Icenowy Zheng <uwu@icenowy.me>, Alex Deucher <alexander.deucher@amd.com>, 
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
 <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
 <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
 <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
 <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
 <d44651a7-0c07-4b84-8828-f1d405359aeb@amd.com>
 <1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me>
 <e7a814fc-7b1a-4e32-8868-292be004f920@amd.com>
 <977af3daf5f7eb048eed0310bc93a321728b6106.camel@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <977af3daf5f7eb048eed0310bc93a321728b6106.camel@icenowy.me>
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|SA1PR12MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7138be-6ea3-41dd-9031-08dc8edf315d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmVjWlJSZnNoazZ5a3l0OEl5bWxvVWwzME40Y0JCQUhFTFYyVGlKWXliSGI1?=
 =?utf-8?B?Z2lwMjJxS0RBcUJCTElhMm9mTzVYVVJIN3RYWkNHUFhRMGlSWVJsbDRGWmlk?=
 =?utf-8?B?U0p1Rk1PcWhXVjIwZGhyZHppZGQ0MVN3em93d3pzMzVoYXpXTkJPNDVTckcw?=
 =?utf-8?B?dGQrSjlFK1phdnlTK3hFWC92ZGVqbkxscUs1cEU3STRneEFJM1JGQndtaVNt?=
 =?utf-8?B?eFlnVHQwWEd3NXdIRkNWT2tRYWJ1M1NhWjdnclBOTE1wWllOc3pnUHc5UlBp?=
 =?utf-8?B?Vkl1U1VuSTZKZEJKdkhROGNTMEhaM3RTWjU4UGswVmhyeDEwQUtKcmZ0MnpV?=
 =?utf-8?B?UkNMcUVOUWRnMTFXcEJEWnU0TVdKVTNKNXVUQ2lVM1NJdEZrMXdGaURIVTVG?=
 =?utf-8?B?Nk1oOGlGcXpzVzMyMlUyUHJoWVNDcGozREF1L2t4YjM3aURJQm5wbFI2NUNX?=
 =?utf-8?B?VGVNTFQ5a0xBcVhNZmhOWHM4V29FUnlrZzdjODhIQUpHYnZWUGpkc0JtRkhw?=
 =?utf-8?B?cFY2eWtGNGl0NTlobkxHWG5qVVY0T3pNd2trVXFqSGQ4bGxiN0x6Q290RHls?=
 =?utf-8?B?QmNsU0FNd000RWp1S2FYOGNpZHNQdWtkR0c5NERzZ01tSWY2ZTdXaDZqSDNs?=
 =?utf-8?B?M3VIdmgzSVUyZzkzdkJyRTZCaS95M0ppU2V1Vlp0WThud1BrT0NLaDcxdGYv?=
 =?utf-8?B?RDNPQ1RMREZneUdyY2lvbVRreWxadkE0WGFlSG9xQ2ZjUVlaeDhKTDVxWkwv?=
 =?utf-8?B?NGVEYW8xZE5tejhYZDNDYnVkTHRNTGJscVJzV2E1RzJxYU1TZkhwTzN1ZE9V?=
 =?utf-8?B?aXdiUDNlaHlJSnpkUU5DY0tNNlhTZ01Zc2d4TVczYlpnSVlHN3FWbjc3bWhS?=
 =?utf-8?B?MXhBL2NOWUFGSENUQXcyNVpjRDl2REFKdGRBd0pLaG9ydThzbW5OZ05Wa21O?=
 =?utf-8?B?blEvUVhmUTQxUjBObU5qYkpCM0JCZ3AzdjJWK0ZYdklLVXRnM0N3ZWh5d0pN?=
 =?utf-8?B?RnFEcjZ6blB4TDdoeFlnN283M2xTSGlRQnJnZVVsRjRuT21XVFpqdkNEYlEz?=
 =?utf-8?B?TUU3d280YjFIb1dhZmRNc3ZOSitHUkw4V1ZFMGp6S3NENitKbExCWnZtL0FJ?=
 =?utf-8?B?N0pMSnp5czJ6LzJtektjTnk5SjJpQy9JSHBRSHdDNlpuTHlKVlIwcjF3RWRx?=
 =?utf-8?B?VVVzNFVwNy83bTZEVlVHd0tzMUd1RENSZElWZllRbk54dG4xdjEyMGhLL3hr?=
 =?utf-8?B?L0VhWlMycDRTeTlQNUNGYUtmN3ZrWi9EbnpQMHVCbThJVnZKRTl5eUQxaGZX?=
 =?utf-8?B?eHpzeXBWWnd1dmpZNXlUQXE3MHhOUXBMcENCaEM1ZjlZNjR2M1BDVXVlbXRn?=
 =?utf-8?B?RXd5Vmk0ZkVURm80UzFkSUZGU0JFbWRxOVk4MVVGa3JOeCtodWpIb0U5VjlB?=
 =?utf-8?B?dzNQRWVsTWNvdDRTNjlTdndhRzAxVXl2cDMyZVBQR3czUmtPYzBjUVNabFZG?=
 =?utf-8?B?ZVl0RlVuU2YwYTJMVzBacTJyeitJdjhHUGtmUjVHR3FuL2RvMVNxY1BaOVd5?=
 =?utf-8?B?Q294TXJ2MitJd2pyR0k3QlhnWk8zUk9GcS9HNk1wZ2NRRnZ2aVpxbEJ2SkM5?=
 =?utf-8?B?ZGhhWnByNGltM2EwZ2dPQ2I0b083bmtrcFV6MTB4T1FlampabFAzWm11YU9J?=
 =?utf-8?B?bXhHM1g5SVRnbW14QVdrN1hDNlVOVUJVUFhsanh2OUNVVGl1Y2lTZmE0bWxo?=
 =?utf-8?Q?Gf6t27G6t8JqPIfqvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2QrN1lZNU9UMnVaNytySWZMTU9hUTZlTmxKM0NsVlZMcHFoQ2QrUytZMWFu?=
 =?utf-8?B?Tk01c2gxMlZ3VHVBZnZETVZzYjRnVS9FL0RmaEtqd0pOTmNhaGVyVDEreENW?=
 =?utf-8?B?T2dXSEgyaFgzWGVhVENXb0xkcGRSc0w0c3BoV201cWxHanIwVjhkc0kycFd5?=
 =?utf-8?B?L2xYYkhrc0lSZzRDZEVBbGFsdUthVkMxUEVzUE1wcFRXV05QSG9lQU40aEkw?=
 =?utf-8?B?U0QwN29haWlJS1pZSHpOYng4YWlKckNuMkx5bnFGamsrbnd2eGxzTnYyY3ZY?=
 =?utf-8?B?UDk5NUFZMXh4cnRuT2tHS1hhQmhyQ3hrSHE4Y2N4c0VrcnpwMnc3a1lEM1Uz?=
 =?utf-8?B?cTQ5azBwdVM4bW8vSWUzeVpLUE52M20rRmRpM0xzbWhhNDY5cTBRcWRVZFFz?=
 =?utf-8?B?TTdKeFIrZDJoNUREeGRkMnIyMTlDRzYyK2thN2k3MnhZR1dsamRxSVErdnB3?=
 =?utf-8?B?MVQ5c0dLSnRxV3V1UUxKSHljZlpUcUYxczRwaUo1cHVqYmxMSEZWRk9sbVVT?=
 =?utf-8?B?TGp6TG5ETFJubG50SjJIOTZPaXlZZjVHVXRHL2xJM2VsaUdXV1dhNG40S3BU?=
 =?utf-8?B?L0I4bExPaGs5c1ZranZyTXRhOE5lQlFPY3cwc0xhNUJ1VGd6bHFsK2dhUGFk?=
 =?utf-8?B?L0NtOVBZTmJKRWMvMTV5YUs1NFd0Qlp6UTdsWFhmMGJmQll4RVRxTHhNNUo0?=
 =?utf-8?B?SFMzYzI4cUIrZUhkdWFUdmF6VFZIcDZtbHFzQ3d0ZlNuSE9oY1hUMERtS1VZ?=
 =?utf-8?B?RnBLTUZML00zL3JsZmt5SnVKa08rTitkMnU0cE9HOUFYMTFYaG91SnVJMG55?=
 =?utf-8?B?TmhNZGdkMnBCMGh3dnlOY3ZsRmUwM3BGcTlWVjdSMUt4SDV1cUFmLytrOVN1?=
 =?utf-8?B?aTkrcGFzUFZVbTFtMnVhckNsN2pERFhhWXAycTVmSFRCeWIrUzQ0anNkVUc5?=
 =?utf-8?B?WFAyWDRkY0VjTSttc2hNdjhaclRqMGJXM3BZcW4xNzdUMkFYYVNCRG5zalpu?=
 =?utf-8?B?RTg3S1o4TmVDMXJndXlZaVl2MXNlZlhJeVBucE12eU5wMzdhNEIzbU9JQ00x?=
 =?utf-8?B?RVBVQlU0VFd4eEViYkhhaWlDeDN5eVhkQzVkS2hQM2YzaWZsQ1JybUQ3Rndo?=
 =?utf-8?B?WEJKcFR3K0xzSWU5VUVvWmppbzYrRTYyeFJrWFliamhaZVdXMThxek9FcEZv?=
 =?utf-8?B?VnZaY2Q0ZDhGRlVnczc4T1NXeUxBZnpEa1NxVER0eUs0SkIrNnNBajVmNVhj?=
 =?utf-8?B?UUFKbTFyYUl2SXk2RUx4cTVYUXZiS0VqdzZ0STFjeUVNRXJSWHFkdHE4R3RT?=
 =?utf-8?B?WkNvZE9TM2lLOFhkWVREZXhEdVE3U3FjV3VaZDFlYlZHOGw2b1dYYmdZYVRu?=
 =?utf-8?B?bXc4bjhqaUtkV01xR1BvQ282aGFMSmI4TS95MFFsc3l5c3lrN1BJSVA2dXZD?=
 =?utf-8?B?OGxtZ0M1QWs0bFdrWVdHL0dMQWxhRXgxU2RaVndERXY5aExpaHdwOFVWTTN6?=
 =?utf-8?B?aFUrS3htdFh6U0FvVzgyVjRFdnhMWG1BK0FyRWJBQVdxWjFXUkIzVk1uSHlz?=
 =?utf-8?B?d2dJSGxuSThqSk0zc1d3UFdnblBIaGhBQ1VNajdxenpEMUlPc0xHZWQxNGlu?=
 =?utf-8?B?MmJPd21NY1l2akxNY2pOUTRTUW5GZTUzUC95ckI1VGowTWVuLzBnN3oxOXNG?=
 =?utf-8?B?MkFQWDFWR2hqTC91bTdCMlovZi9yWlkwc0hmTDgyc083bStNOW8vRllyVHZX?=
 =?utf-8?B?NDhzZkN4angvVVQ1aGFGSE1TajBOMVdwYllyUFFtNFV3Z29WZEl2bWROQjQ2?=
 =?utf-8?B?OHY0NXo4akUrRU1odDRwenlUV1BmcHowaC9qYmY5MmozV0FEdThpaFdGMUhv?=
 =?utf-8?B?aWpYSHFuWTdqTG1IQ2NXWHFQN294UVcyOUVFdmJPakMvSjFjK203Tkh4eFlN?=
 =?utf-8?B?bm5aTFByUnZPam5BWFk5SE5yaDMzVDdjL0xCajBuNUk5Si9PcEFtQXhOMHp1?=
 =?utf-8?B?K2ovM2lQdXZyTmdoV2lsb3JBazdWeUpyQzFOSEhVS1BFYm1LczVFMDZ3bjg4?=
 =?utf-8?B?UThvK1I4S2RzOHpPZ2pZdjJIQVRTQWRaTzZOMy9EQnlFUkVDSHFRNXZoc0Nq?=
 =?utf-8?Q?mva2adBOpEDuBTCXssDw542hc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7138be-6ea3-41dd-9031-08dc8edf315d
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 15:07:23.9558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylT9ofRnk8fgg+5qBCr8JeNKebBPLte1/z/MRgTyYawcXu0uz6ezCQenyoPNDfwL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678
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

--------------qvbOhFODDNcpXYgDTfS4S77y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.06.24 um 16:57 schrieb Icenowy Zheng:
> 在 2024-06-17星期一的 16:42 +0200，Christian König写道：
>> Am 17.06.24 um 16:30 schrieb Icenowy Zheng:
>>> 在 2024-06-17星期一的 15:59 +0200，Christian König写道：
>>>> Am 17.06.24 um 15:43 schrieb Icenowy Zheng:
>>>>> 在 2024-06-17星期一的 15:09 +0200，Christian König写道：
>>>>>> ...
>>>>> In this case shouldn't we write seq-1 before any work, and then
>>>>> write
>>>>> seq after work, like what is done in Mesa?
>>>> No. This hw workaround requires that two consecutive write
>>>> operations
>>>> happen directly behind each other on the PCIe bus with two
>>>> different
>>>> values.
>>> Well to be honest the workaround code in Mesa seems to not be
>>> working
>>> in this way ...
>> Mesa doesn't have any workaround for that hw issue, the code there
>> uses
>> a quite different approach.
> Ah? Commit bf26da927a1c ("drm/amdgpu: add cache flush workaround to
> gfx8 emit_fence") says "Both PAL and Mesa use it for gfx8 too, so port
> this commit to gfx_v8_0_ring_emit_fence_gfx", so maybe the workaround
> should just be not necessary here?

What I meant was that Mesa doesn't have a hack like writing seq - 1 and 
then seq.

I haven't checked the code, but it uses a different approach with 64bit 
values as far as I know.

>>>> To make the software logic around that work without any changes
>>>> we
>>>> use
>>>> the values seq - 1 and seq because those are guaranteed to be
>>>> different
>>>> and not trigger any unwanted software behavior.
>>>>
>>>> Only then we can guarantee that we have a coherent view of system
>>>> memory.
>>> Any more details about it?
>> No, sorry. All I know is that it's a bug in the cache flush logic
>> which
>> can be worked around by issuing two write behind each other to the
>> same
>> location.
> So the issue is that the first EOP write does not properly flush the
> cache? Could EVENT_WRITE be used instead of EVENT_WRITE_EOP in this
> workaround to properly flush it without hurting the fence value?

No, EVENT_WRITE is executed at a different time in the pipeline.

>>> ...
>> Well to be honest on a platform where even two consecutive writes to
>> the
>> same location doesn't work I would have strong doubts that it is
>> stable
>> in general.
> Well I think the current situation is that the IRQ triggered by the
> second EOP packet arrives before the second write is finished, not the
> second write is totally dropped.

Well that sounds like the usual re-ordering problems we have seen 
patches for on Loongson multiple times now.

And I can only repeat what I've wrote before: We don't accept 
workarounds in drivers for problems cause by severely platform issues.

Especially when that is clearly against any PCIe specification.

Regards,
Christian.

>
>> Regards,
>> Christian.

--------------qvbOhFODDNcpXYgDTfS4S77y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.06.24 um 16:57 schrieb Icenowy Zheng:<br>
    <blockquote type="cite" cite="mid:977af3daf5f7eb048eed0310bc93a321728b6106.camel@icenowy.me">
      <pre class="moz-quote-pre" wrap="">在 2024-06-17星期一的 16:42 +0200，Christian König写道：
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 17.06.24 um 16:30 schrieb Icenowy Zheng:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">在 2024-06-17星期一的 15:59 +0200，Christian König写道：
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 17.06.24 um 15:43 schrieb Icenowy Zheng:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">在 2024-06-17星期一的 15:09 +0200，Christian König写道：
</pre>
              <blockquote type="cite">...<span style="white-space: pre-wrap">
</span></blockquote>
              <pre class="moz-quote-pre" wrap="">In this case shouldn't we write seq-1 before any work, and then
write
seq after work, like what is done in Mesa?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">No. This hw workaround requires that two consecutive write
operations
happen directly behind each other on the PCIe bus with two
different
values.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Well to be honest the workaround code in Mesa seems to not be
working
in this way ...
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Mesa doesn't have any workaround for that hw issue, the code there
uses 
a quite different approach.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ah? Commit bf26da927a1c (&quot;drm/amdgpu: add cache flush workaround to
gfx8 emit_fence&quot;) says &quot;Both PAL and Mesa use it for gfx8 too, so port
this commit to gfx_v8_0_ring_emit_fence_gfx&quot;, so maybe the workaround
should just be not necessary here?</pre>
    </blockquote>
    <br>
    What I meant was that Mesa doesn't have a hack like writing seq - 1
    and then seq.<br>
    <br>
    I haven't checked the code, but it uses a different approach with
    64bit values as far as I know.<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:977af3daf5f7eb048eed0310bc93a321728b6106.camel@icenowy.me">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">To make the software logic around that work without any changes
we
use
the values seq - 1 and seq because those are guaranteed to be
different
and not trigger any unwanted software behavior.

Only then we can guarantee that we have a coherent view of system
memory.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Any more details about it?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
No, sorry. All I know is that it's a bug in the cache flush logic
which 
can be worked around by issuing two write behind each other to the
same 
location.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So the issue is that the first EOP write does not properly flush the
cache? Could EVENT_WRITE be used instead of EVENT_WRITE_EOP in this
workaround to properly flush it without hurting the fence value?</pre>
    </blockquote>
    <br>
    No, EVENT_WRITE is executed at a different time in the pipeline.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:977af3daf5f7eb048eed0310bc93a321728b6106.camel@icenowy.me">
      <blockquote type="cite">
        <blockquote type="cite">...<span style="white-space: pre-wrap">
</span></blockquote>
        <pre class="moz-quote-pre" wrap="">
Well to be honest on a platform where even two consecutive writes to
the 
same location doesn't work I would have strong doubts that it is
stable 
in general.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well I think the current situation is that the IRQ triggered by the
second EOP packet arrives before the second write is finished, not the
second write is totally dropped.</pre>
    </blockquote>
    <br>
    Well that sounds like the usual re-ordering problems we have seen
    patches for on Loongson multiple times now.<br>
    <br>
    And I can only repeat what I've wrote before: We don't accept
    workarounds in drivers for problems cause by severely platform
    issues.<br>
    <br>
    Especially when that is clearly against any PCIe specification.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:977af3daf5f7eb048eed0310bc93a321728b6106.camel@icenowy.me">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------qvbOhFODDNcpXYgDTfS4S77y--
