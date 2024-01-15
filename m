Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BE582D71D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFF310E273;
	Mon, 15 Jan 2024 10:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773E10E26D;
 Mon, 15 Jan 2024 10:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agB1bXx4vN1nQCqmWaTLW3n0RB89+RD+8yKXU2qDxj42Ib2b4i7CEJ7wli6cGYn4MZrInaMdDvdPCEbSWbtWx8bTk/dMspOhCfG/IYXAI+Ojkw9JyW3+OFaZraiia51Wrbt7OUO0Nnu2OM5owRpNMqZQgw79Fvh+UOfhQFPcQb55JSmkbnattq+6N0Dy+dISB4qILYBVW3CjHAw+3BpOLBudlouV1adhf0kezmYsajusNf5p9FI3UOwQP4T4TfFKVBK6ZSmorcdw1JsldYF/cSpl/g3fdoZEtzXPx8nW3eE0GHlWSBTDPhf8hWFQ3LfMMbMgGAJTeiuAy7e3uYNI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5Kjd9zWweXnge3gHWZMWH1+7E96cbbRNBxNMUVRzIM=;
 b=PaxeY3kBVHnHB6NIMe7UX3yA2P+VfwvHCTdxdy3sA0MWRTfH1GC2LM+oWh03uYbmQgBNNPWv39ooYsFEAWQgVFfXsRpRQ8JIIEcQmAdE5urWwUesuUDYEdwx4XKroqZm7Qem89Dq6csEMLplrkCZUisXMDs1PRd4c6v8pxDEHqyLUOnBCdo4jVGP2WFY6Lccz7TbnY0ckbYaNNig5Ovnisuc2HJMdBlgz8mevZfh1nsZIlqdiz9WBT0Dh+ngrjWQDKXrH88BY1i3KpX9BNnq9hXfqAPZ7bm2QkVv8CXo7CBZRLDD/g47/TDhkKxhBYSc3Ue2oc16/eJyiaEnmuqnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5Kjd9zWweXnge3gHWZMWH1+7E96cbbRNBxNMUVRzIM=;
 b=IWm6I0faJDHf6EGEk/2VAzsLQt0e0nZ9EhDBSIGKTBbOMidaxBNtKJ4RUk9AtqC52IbG3fYx6Zk/ZxIYEi2xbvxaOPlZJ4Y2CU+mJolwtWwlGYKhHbqHJU5cJIeVyoMUC+ypIfx6q4lMmG39kXVK/Ja8riqMvIjSJTaWMHNI7U0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Mon, 15 Jan
 2024 10:20:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Mon, 15 Jan 2024
 10:20:28 +0000
Message-ID: <8acb0860-1c9d-4fb1-8ec5-ab2104dcb7b7@amd.com>
Date: Mon, 15 Jan 2024 11:20:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Failed to create a rescuer kthread for the amdgpu-reset-dev
 workqueue
Content-Language: en-US
To: Thomas Perrot <thomas.perrot@bootlin.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, lijo.lazar@amd.com, kenneth.feng@amd.com,
 guchun.chen@amd.com, evan.quan@amd.com, srinivasan.shanmugam@amd.com
References: <cf1a3a2b7599b7b6900ff45aa8b204169411687f.camel@bootlin.com>
 <95e791b0-4672-4a1a-940b-684d8c96e995@amd.com>
 <d3ffc899948961cd3327db1ad0e59970dcf87bca.camel@bootlin.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d3ffc899948961cd3327db1ad0e59970dcf87bca.camel@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 7640183e-6dd5-44f5-58d5-08dc15b398a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4ojibCYeeoRfAaPFXOf/QaCSr3nkSft8IVtXTKPKGnwZXDNvBs6VrN9XrXZartXL/9qhGNgHYytWA1a0GlnI2UsqC3rAyL9nhmciO9zIIpuon1HPA+pW0o07jkghadC+F9jQlhPHDk+kLjJVcmw1Bqd/tTvaErNfbHOprFaNRrc1zbB5af+uf3H7cBysnKqZgZZKBEWZ5hkEN0dOL4SK6RuHk5KLrrbxllRRyXoNhSFSmMgS+l4HREezBoMUyOxT2HzfPnZ1W0fIouxY/3M9hUg7bKCdphHNZyh0QLUoKRjKW08YgdxNDtui7iuuwIkIdKdLBD06FNyUAKfZgSaNL9lk2/E9c3NcX3K42IYIZK0s+r7RBYKLX3/hyRDRIiwCQoRP9LPEtMrtTItEYE8FZEXrnfl1luFO3h9UIg+6GxYZjNKjlJM7Q51QZnDuwZgwL2Dc0Paoxo2de9INFSg5wGxvHjbBB1SEEQcV7wu5zI8ILFyz6DLVZn2AoFI4JSj4nAGPJeTKl1UcqudhRofE8Vlie1cgcudGmqzrfRzZtObtV4V/MkBAIXYpHRraTiTl36H4oM7OwkK2K1OW6vfQmChSQ6laZqXahNVMWHiG81P/nNnvUDUCGKCKA/fyUt5/BNUAZnSZ10K2xOgw0saBJ9jiNCWGfEUU5Y0wSxbzeTwOBp3CHe0N2uj0byUNgoe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(1800799012)(451199024)(186009)(2616005)(26005)(41300700001)(5660300002)(6486002)(31686004)(36756003)(31696002)(86362001)(316002)(6512007)(6506007)(2906002)(8676002)(66946007)(8936002)(4326008)(6636002)(66556008)(66476007)(38100700002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFlzdVVoZHFpNHY0ZnhTZzNqRElxWXRJR281b0twMnhZcVlUT01tVGxvUXor?=
 =?utf-8?B?b1NaeEluSFRCa2N3S0hyeVRSVWM5a3diNHVqMjNCZ3JnUVUrS2l1ZjJXL0Mx?=
 =?utf-8?B?Tk44Zk04aVhOZnViaWxuWmFJWmlPdE9aZWJyTVNGVVZlMVlxMi93VjdMM0Fq?=
 =?utf-8?B?REJZRWlYQ2l6OCs0T3BWWEk4cnB4ZXNBdXo5WWlld3pkM256TlNkSVBIelBs?=
 =?utf-8?B?dS8zRFMyT3pCZ2h5R09tNlZCUVdPeTAvalkzUFJXVnhzYklDZk82eWpyU0lO?=
 =?utf-8?B?SDRTV3gyYTFGVjNORXIwZGdZeG5CNkJzY2hGNGl1OFVEUHRIWnBnbTk1cEdl?=
 =?utf-8?B?ZjNveG5yNjN4S1ZyMjQ2TWdKMzUzRW45aGJQcGRJN29wNWJqSlpEMTBvaDFQ?=
 =?utf-8?B?TVZZcmtzeVAzUGhyOHF1SkVMOW1KeW1PQm43anIwZEtPWGxVT21pdnNMMUNt?=
 =?utf-8?B?QkU2M2l6d1hWc0ZTZjFDb05ncjJNcHE2ajZxdjlzcExrdGE4THRFWmR5dXR2?=
 =?utf-8?B?azlZQ3lTQ0U4dEEyNXRPQXFLeW5GWHFBdmFnbWFPcHBETzRBaElPaklUdUts?=
 =?utf-8?B?RnN2ZVN6M3J0djNaN2p0NXplY3h5ZHVDdERYTk1ncEJTSmxrUzdzMHExa0Zq?=
 =?utf-8?B?YkRsK0VnSGk3RVBJdlZMdlIweWNYL1JRSTIrTm52YWdxQjVIeXhBRC95MktO?=
 =?utf-8?B?Nk5Ga3ZtYVdHTDhXL0tLQUlwc3RxSkpodjdoVmkrbzc3c2RmWFBYWHBMVStj?=
 =?utf-8?B?ellJcmh6ekErd29IdUVuVURKMkdQeUQ3Q29LTXZvSHJNcC9sUG9kOXZmNkJz?=
 =?utf-8?B?aTFIeVZDWTdTTURmaHcwQ2pBZHFseTNubDJEUC8rT0U0QkRidWpUL21yTWpO?=
 =?utf-8?B?aEYyVUZhM3JScnpVbGY5ZVRBZzYydEEycXFONmpTOC9XcTVpdmlOR05SeUlT?=
 =?utf-8?B?TVpmeHFMbGVQckxaekZjOHJkQXVuVUROYXpmS2JCNW9WVE1FOTJUZUlpNmhC?=
 =?utf-8?B?WGFkd21Xd1pLZ3lzdUJYd0ZNNXdFTk1kSk9wd205ZlNCcE9KZ1hPZ1NHQ0pX?=
 =?utf-8?B?YWdrd1M4ZUdVTllmZE5ZTDNrTU9VZWxqTnU3RTNBemd2cnk2ZDA3dVhSWWxC?=
 =?utf-8?B?aEMvdUdSbHNyZlRFcXVndHVxQmx0OVRjcGo5ampscjV3Z3R3MjdvQ3VvTVJm?=
 =?utf-8?B?T2R5cHZWWGYxMTdxRnRCdjdObjVzcVVVUU82dGRkRlF1a1FSKzhHeW1RSWxa?=
 =?utf-8?B?QUhhamxvUTBkMW03aTdkN0NmRFF0R0xUSGVmbUVaUjFyRkE5bEc1aDJLSmpE?=
 =?utf-8?B?S3k2MVhwMTdTWFJFS1F6eUNuelJ3WHF0RUo1Q0FhMEIzRkNHb0V1Z1BCcGZr?=
 =?utf-8?B?ZVNEYndpVTVSazlaSlVxdzJsS2dkbE1YclVHRmtldWltRzNHcHpNeTRFVGhh?=
 =?utf-8?B?VEFYaEZqNWxsT0lmVlJSVlB5TzRRdlFrQjBNd1FFenhMUDdMazE4OFhsY2JC?=
 =?utf-8?B?S0N4WVVWb0g4MmxlNERRbVg5MkpmNU9OanlhR0xLQjBtS1E4dkd5WVg0UVEr?=
 =?utf-8?B?bzdvSGR5OEVNU0hBTDNSN3R3M3UzaThKb2d3NE5JRnJ5S0NsNHFPOGQwbkhr?=
 =?utf-8?B?UTcxbmNhWG9aZmsrM3FaKzQwQThuT3V2L2Q2S0cxZGpsV1BDUm44K25hdUh1?=
 =?utf-8?B?UWUwcGU5K3lmS2xJQ0UydkFoakNkR2QvMFFLMUR3VFJOQ0dBRkRNVE95OG5x?=
 =?utf-8?B?WXVMdit1T3RaMnRzWTBVWjNhMWdsSVpzRjJIUGNraFlPVHdmNVljRmpBZnV5?=
 =?utf-8?B?UHlJcG4wODRESTJZaG9PaHVDK1JJZUFSY3hJNm9uSWw2VDMvVGJCcVZtbzF0?=
 =?utf-8?B?M0FkbTJMZWRScmtKUmhpdjBHM1RWZW50d2t6RnRLWXY5Rmw5elRaV1RRWWFv?=
 =?utf-8?B?dnh3R0JPV2JXaXJPaXhHdWpiTG95QlcrUUlQNEVzQlFUQjdUaE5BWEZvTWw1?=
 =?utf-8?B?N0FlWDE5MGJlRFh3Mm80S0grZTREZ0dOZW1zNEsyd2ZlZDAyR0lXcGtKaXE2?=
 =?utf-8?B?UDNVaFNVL29YTk9ZQXloMlpuWVdMK0phY1VGeGZ6elpLa0lGQXFjNFFRbGhs?=
 =?utf-8?Q?tqy7GmqhsKgykKDlKwaBnFz25?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7640183e-6dd5-44f5-58d5-08dc15b398a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 10:20:28.6464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnMLUq5gkWFIiwaUl5S/XuBvP/0IlPuv6Vwt0Y69D0oorQlTUH+o6NUMRdp7kAoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.01.24 um 11:17 schrieb Thomas Perrot:
> Hello Christian,
>
> On Fri, 2024-01-12 at 09:17 +0100, Christian König wrote:
>> Well the driver load is interrupted for some reason.
>>
>> Have you set any timeout for modprobe?
>>
> We don't set a modprobe timeout.

Well you somehow abort probing the driver.

This seems to be an external event and not something the driver can 
influence.

Regards,
Christian.

>
> Kind regards,
> Thomas
>
>> Regards,
>> Christian.
>>
>> Am 12.01.24 um 09:11 schrieb Thomas Perrot:
>>> Hello,
>>>
>>> We are updating the kernel from the 6.1 to the 6.6 and we observe
>>> an
>>> amdgpu’s regression with Radeon RX580 8GB and SiFive Unmatched:
>>> “workqueue: Failed to create a rescuer kthread for wq 'amdgpu-
>>> reset-
>>> dev': -EINTR
>>> [drm:amdgpu_reset_create_reset_domain [amdgpu]] *ERROR* Failed to
>>> allocate wq for amdgpu_reset_domain!
>>> amdgpu 0000:07:00.0: amdgpu: Fatal error during GPU init
>>> amdgpu 0000:07:00.0: amdgpu: amdgpu: finishing device.
>>> amdgpu: probe of 0000:07:00.0 failed with error -12”
>>>
>>> We tried to figure it out without success for the moment, do you
>>> have
>>> some advice to identify the root cause and to fix it?
>>>
>>> Kind regards,
>>> Thomas Perrot
>>>

