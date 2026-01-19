Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C9D3A4D4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2027510E3ED;
	Mon, 19 Jan 2026 10:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qqnqHDL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A9210E2A4;
 Mon, 19 Jan 2026 10:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdROaQleD0KEvunjJSuKbpwsYLCTuanX9YV7TCG3mvBGJ9g7OlxYAtJfGF4YQBR7WAXL9ChV4E5kLy7ECskhU+7WapgeytA2F3ZtLwrYuUvxP00HejJmigry9IRhqr8EklN0Fp2Hr+Dr+96oiOopsr7YmF4zWYa9U00VDxF/l8qXctQ/StaMfFN4lo6hIehogHXgEpmuLUgwIG2dA5pRw+EFuSnqkC//aj0WTsFCZN05lpx3MDnWTJzsc91ZH4qRagjfr+rnYV/gWwzlZ2rKCXdQo8ugiijP6w8J4Z+a2kYemV7KaMYmSreguEd7cHD0SfsL4jHXNf5V4cC9QoZKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f0bi+WdX4wdtHuX/LNM0yZrNF8c4JwZkycRzS94DQ8=;
 b=cDtFYliGXZBjst7Z7SD14FHTJ/3cC+wB1CrIWwy+R9spLOsPwlScKwFqVG4M8Pwx+S5QG3DmZM8oftG8nAanCPtsgxnZR9cm0u6Thla1k4PfrkEtn70eUOBhhBVWtfRNXcURPKOsqSghGx1t+LsTCiDPJgK74o0Q7ZmCU1czFMf0j7nVYej/52Cgh+RxmAmIESwyoeW5/f3BG5sdzFDMN1rdUVu2mdvd6t8y4I3EjeO1vbGA/z8AUG2fP34QmysI5H45ovIKbdWYPENQ385pwf4d+xuRVCYozFmLxlObjkJxe9XWkemYX1vfB321lVGhjVarQvS2NUSQtBUAcjsdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f0bi+WdX4wdtHuX/LNM0yZrNF8c4JwZkycRzS94DQ8=;
 b=qqnqHDL6FRISnCdYUo5XCvxlzBm7hKdcHv2aSs/FbaOzGNb21ohhBboFKxb5toefhw9IRK+n0w997EnecslyOwWAdNi67z9xFNIKBjhfnhgfMPrlaowxApYGF/aJUEaHsQEpzkie6c7qLZNeadIfp9t/YPlsz5uwHZacI/rSv68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH8PR12MB9744.namprd12.prod.outlook.com (2603:10b6:610:27a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 10:22:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:22:55 +0000
Message-ID: <345b8dcb-5015-4801-b263-0dca4d1b3fca@amd.com>
Date: Mon, 19 Jan 2026 11:22:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dma-buf: Rename .move_notify() callback to a
 clearer identifier
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-1-a03bb27c0875@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260118-dmabuf-revoke-v2-1-a03bb27c0875@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0402.namprd03.prod.outlook.com
 (2603:10b6:408:111::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH8PR12MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f2964c-5061-4876-7ef6-08de5744b59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmVOZ3pCbERrQVhYVWtKVlltY01CUk5DOWtWYk91WEFrRkEyLzhFandwU3pj?=
 =?utf-8?B?NTNDUHhnZmttQVNZMWFMZHpISXk0bCtvTlpLcGdvUkNROFlOUGxITFZXM2ln?=
 =?utf-8?B?dWRPUEJ0aml3bnRqVzYvYkxLVVBEOEViOThKclVGSUtYaUMvTnJVWGdWQm44?=
 =?utf-8?B?Vlg0R2tSemZjRG1vWE1sRzFuODE1MDBGbVQ1UDcySnFlaU1sZTFyc2FLRDZY?=
 =?utf-8?B?NElXUkE1QlhHRlRZbE56SzVJOXRiZjNzeWJWOVBHNjFsRldzNWVzaU5tcXpr?=
 =?utf-8?B?VFg1Vy9tT1FPUUxNSXdDcFlGeHBzVXlubHM5ZjZDcWl2S3RMUXVIWGcxK01O?=
 =?utf-8?B?KzYwNW5sVmdreEVVdkx0SmJrS3AxVEk4blRlcUZHWTdsa2xycldUNkM3cHlu?=
 =?utf-8?B?eFpxREJmRDdFSVhrTEtJT1RLTkJ6TVVTVm9CdDVXOE92a00vcXg0TDZQYVdG?=
 =?utf-8?B?dzJIMEtydml1MEcxVlVvRVl1Q3VNL0FpaXpKWk9Wd1F0SzA5NTYwQlZxQ2dq?=
 =?utf-8?B?WUY4UHZVdWllVENGVUpNeGQyQWVOQzBWS1F1dkd5L1gvV0ZXdFJDbnVnRisw?=
 =?utf-8?B?UHk1TzRQbkxQTjkzakhjY250VFo2bG1jYndUaDAxWVBVQW12VmJOclpScjAy?=
 =?utf-8?B?aXpiYm5OMGwrbG03ZHBxTmU4K3ZBaXprUDgzVUNKcXZwOW0waHZnUzR5N3FL?=
 =?utf-8?B?WEQxY1p4VGNzVWE5aVF0MkQzWVZqRDRXeUU5K3J1d0E3VTdPZEJ0UjFjOUg5?=
 =?utf-8?B?M1VsRnIvTllzRnlZa2dpYVl3cjF4S0p2NW4vTU1uU3p1Z2RzNWFocUZ1Y3Vl?=
 =?utf-8?B?Z05uNmpqWFdSWE1GT2I2TXp5S3FzVzkzNnk4dWVkRmNEcmlGbWhMSTB5cWUz?=
 =?utf-8?B?RkhWaHBtTkZtSk53SWMrTW1mc3VzN3VjN0p3MmFGSXFpTWxLcW9UcWZic3Bl?=
 =?utf-8?B?SExVaC8xaXpmY0Q5bUVaUmJLckVUVm9WRG5oNWpzbXRodDRSREpnTXZXeXJB?=
 =?utf-8?B?OEYvdFYveGxkYzNUajlLcTZJYW5KRlBKSkZnUHFqTnExd0Vrc08xY2tqTDU3?=
 =?utf-8?B?YXE0Y2k2VEgxSnZsZVJFRm11d3dPd1luUnYwb21CYkxyajYvN1BCbHk3Mkhr?=
 =?utf-8?B?UTF1MWNySHIzV3BrRjBka3JOdzlGT1paQXduNjFCTG5YeDM1RUJ1a3B2aFBF?=
 =?utf-8?B?Wno5Rzh4Rkw4bUFocFBrZDJiWVJsd2trTE9vWi94dDFORkpzbnhsQUJXTTNJ?=
 =?utf-8?B?YzV2WWtEVWFtRzRBVkMzQ2J4M2ZLVjA1Q3JMM2FkQXBDY1dzMDljOE1vUUJI?=
 =?utf-8?B?c1duS3pKNHcrM01JOURNQUNNTjJqd0xsMFB1MlVyUEVkYXFSRUNPRnVPMEFp?=
 =?utf-8?B?MmRkOEYwWGdiTVBMWEFIN29sdlJHMVpmb0Ywa01rSktnK2ppN0EyejkrQllx?=
 =?utf-8?B?U2hsTVovRlZ3RUpuWnJEZ3lPUkY5bk9VTFlreU5XWjhMWE4wcnU3bnJuN2Rn?=
 =?utf-8?B?eWRLaTJ4QXRpRFQ1dGJETUlCUjZUS1IydkZyQi9HYkk0WUpUZEc5SjFQTS9P?=
 =?utf-8?B?NmJrSVpsL1pPREpydUNHQUg2dEVUMVBhekFFNDJ1bHhpZkZnYjVXeFBwd3BX?=
 =?utf-8?B?enBocHBuMFVxMTlNVUw2R3FoY1lZY1o4UkN1QVkvYnZXUGhaUWhBTXcvVlZ5?=
 =?utf-8?B?YzVLTEVNZDhCZWtTSHJhblFMSjMzVTc0T1BjUk9sVCtuUE9DZGdCbU9TNTBS?=
 =?utf-8?B?NjlFaVVTQzNwK3IrcmdyKy94ekdJa1U3NHpVbXZFSk81WUlFaGE4NXViUy82?=
 =?utf-8?B?WXJPUDBhYWN6cmRtd0xPSWJ3bzdUT3MvaENYYllqazNzY216Mmp3SU8xWnk3?=
 =?utf-8?B?ZkY4azN2L2o4MTU2MnFOMGIzOGFRRDFGYXZ3c0lLNkNGZ1dwTC8wckcyQ2l0?=
 =?utf-8?B?OE9NZWFqZ2xNUmpLNkQzNTgvTjNNOEtVWSt5MDRBUGJLcXBzSTAwclhBVDFY?=
 =?utf-8?B?TDI4bVhLZDRXTjZDTDU2em9NcS9lak5TRmFaVzJsSjNKdi8rbXg4c3BzS2Z3?=
 =?utf-8?B?ZURHWUNOSXY5Y05wZmhFdzZsVWlMb1B0MjZTZUJ0eXh5K3F2VTdPYURYRmhJ?=
 =?utf-8?B?cGNWbjFJd3pFYW9ERlhWSzZzVGFqdTQwcnJIeWxKT2Nmem5RREtBVlExckRI?=
 =?utf-8?B?c1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTFuVlhXTkxCVU5BQkovOUUyZHhNQ25lVjd3L0JMeWFudlNXZXVTWVF5dDh6?=
 =?utf-8?B?YW44c3hzd3AvNjQ3bWZ4RnNJVHArYmp2aVhCSjRYNVdUcG9HNjlIMUhGWXFV?=
 =?utf-8?B?MkpyNk1pQytBLzcyU0lmNkxGQmVvQlIreDVLRlBNbVV6Nk9heFI2a2lXREdr?=
 =?utf-8?B?WFZ2WlRJNzFDeDg1dHAzYnR1UVRCNm81MituQk9YN1VWenpVUWp6QWFBNUNL?=
 =?utf-8?B?M3N4Y3RaczVDUXlSUUNBWm4yWUJEL3Vjd3RvMndlWFlhTFhJMU1xV2ZUUjBx?=
 =?utf-8?B?VlVVbnlQS3FwRk9uRy9aT1lRQlY5NUlmQzhaT1FUYkxQbDhuVXB0RFFXOE9j?=
 =?utf-8?B?ZDhCbUEzbENoSUIyMElrTk93OHBROHVRMjVoSlZlRlo3L3VrRHdCcGVmWTNp?=
 =?utf-8?B?OEh1QnNpTDZ0V3FveGV1b1cyUko5MkRDdGdJTmY0bkJjWUNMR0hZN01wUXlX?=
 =?utf-8?B?ZTJ4WVhoZUNpbUJuVUhCcnJYc0NpR2UxZlhZTWdvenk4akZBZSt1L04vcUt1?=
 =?utf-8?B?eXViSnRqUTAyU2R2ZHpHTlg0by8xcGxxZDRrY0VGbGxtU3pCL3E1SUxnaTdZ?=
 =?utf-8?B?QThlanVFdFQ1UkVTNzYwYjJOTURzTXBrVzBXWkZTeEtYdyt0ekYyaHF6YThv?=
 =?utf-8?B?bWFUQzE1OUY2cGVydC95NE9Jbys2RmwrNldjMTBKWi9xS1FLejVsQ2JGbnkr?=
 =?utf-8?B?b3BwUkh6Q3JiT0h0WlVSditEOUluNlZ5S2dka2p5aHBxUTNvVVNrVWJHNU9Y?=
 =?utf-8?B?blJWeStraXZsSm4rQThSd2dWKzB1TFlvZzZ1RHI5VzROV1hUZ1k2RU5ENDVG?=
 =?utf-8?B?UHVWT1FSc2ZRd3BHSG5QK2tCOEw0SitZc3YyZWlKeHZrTENuVlJ3cmp5RDFI?=
 =?utf-8?B?MkJ1NkxLbVV1RzZjbW1iQlk1dml6MWhZQ09UYzdMbmJ2b3F0cGdyRnRKc3pT?=
 =?utf-8?B?c1RTOTJwOTNldEp4VUF6V1pkOCs1VGhveTMxZXEwME43NnVmeTJjYWVFRS9a?=
 =?utf-8?B?c3NFZHNHNVl2RkFNZUpNaFVlbG94SDlrUlpLUU5qcW1kWmZmMmR4eXU5WCs5?=
 =?utf-8?B?YjM4eldZNGpSdnZYV0o4SGd1OTZxQ1AxR1FPbFp6VGpVQVlDeUdlUnh0UjJ0?=
 =?utf-8?B?S2xDQTlTWk9YbXhDQS9zQTZ2cFNsWWJKM0d4bnVoSHVmQ1dkYVQ0VllMR1Uv?=
 =?utf-8?B?TVQrOHpqb3ZnZXRVeEIvckJUL1crQWE1MjQ1RmQvaTZnY1VEL2JNVkxrWEZN?=
 =?utf-8?B?UFIyazUvcDN0ek0xeklDeWZKVGJMbEtRdnBPWUk3V1A3c2s4MC9KQUxRSUlE?=
 =?utf-8?B?VFNoM0s4eDlsVWtLc0Rrc3JEODZ3N2xlQkFmM25ZaE12NzE2MkorZVpCNndm?=
 =?utf-8?B?WEp4WHhNSUl6dFhBajY4ODZsV2JwTEJDSjAwODVhSDVjR3hOeHh3WnQwc3k3?=
 =?utf-8?B?WkpYY0Uya1VGVTQ4YnlIK3pMRGc2NEFmNzVtSytzeE9XaEcrRzZHU09YNVd1?=
 =?utf-8?B?c3JUeUNuSG4rcmtPdjVXZXFXT2c4WkJtanlKamdTa2gxNFIrckFSdGpHeHIx?=
 =?utf-8?B?Qnk0S3hWZ2Q4RGwyMHdMcm9KVC8vMkR2alRHelBJcm5PVll4RE5tbEhOWDMz?=
 =?utf-8?B?d1p3YWZjN3NUVmFXSDdnMnJiRU1rMW4zQ1R4NDlnT0l3SHFzQzduM0JzR3dI?=
 =?utf-8?B?akVuT1l3QXdZYnYydGV3dHd1R1duOW9BaTNyVTZGWTZVWnN5d0c5YUlwdHho?=
 =?utf-8?B?SDVqajZhelQ5QlRiT3VtWU5lbFJaVmgvckVJdkZEdCtHTDJmOUtZYkxoWm9Y?=
 =?utf-8?B?K2o2Y0gyOG14amZZeXhheEYyUjRBYkcwd3NSeWh1UzQvYW1xTkZYcCtmQ2xv?=
 =?utf-8?B?Q1NSUHNZamJIckxEMFA4OG9MRGl0cEZNSmVqSk1abU1BbmczWDhFcStCSTM2?=
 =?utf-8?B?NUcvR3V6VUJ5Zm5ON0NTOWhoZ2l2em5xWGQwOFRabUNIOXVWeUFEK0pieDFF?=
 =?utf-8?B?SWtVRjNHcW9SRVJOUWhaa2pWUUY0anE1NkZRYzd1V0s1dDNJMXV5YStyS1Jv?=
 =?utf-8?B?VWdaaTYrQnNxT3Z2YWxjSTczeFAyRkhGTmhGVkp3a0Vjamlmam1iTHhGTWZZ?=
 =?utf-8?B?MC85WnpQQW0yc1JKb25pR1doOXFDUVYvdFhnRDR4VzY3R1NjU2F1eS9rbWJM?=
 =?utf-8?B?OWdWYU5iV0dQbXluQnFXNk5GVlFrRHZuQTVrUEQ3WG04cXlkWUhnTXFNWW9R?=
 =?utf-8?B?NVBVTW4yWFAxNE9kb3ZkcmQ3MDdmdTkzc25zVkpGYndrUkQyV25TcUZMTGFU?=
 =?utf-8?Q?zD5zvE5GYuILl9d+1W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f2964c-5061-4876-7ef6-08de5744b59e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:22:55.0987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ee0F6QUoFDuw0g/854cwFzpZ1a4e1PlppQHA/p3yzraGOagk6RpXgnAfU/9dissm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9744
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

On 1/18/26 13:08, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Rename the .move_notify() callback to .invalidate_mappings() to make its
> purpose explicit and highlight that it is responsible for invalidating
> existing mappings.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-buf.c                   | 6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++--
>  drivers/gpu/drm/virtio/virtgpu_prime.c      | 2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       | 6 +++---
>  drivers/gpu/drm/xe/xe_dma_buf.c             | 2 +-
>  drivers/infiniband/core/umem_dmabuf.c       | 4 ++--
>  drivers/infiniband/hw/mlx5/mr.c             | 2 +-
>  drivers/iommu/iommufd/pages.c               | 2 +-
>  include/linux/dma-buf.h                     | 6 +++---
>  9 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..59cc647bf40e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -948,7 +948,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	if (WARN_ON(!dmabuf || !dev))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (WARN_ON(importer_ops && !importer_ops->move_notify))
> +	if (WARN_ON(importer_ops && !importer_ops->invalidate_mappings))
>  		return ERR_PTR(-EINVAL);
>  
>  	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
> @@ -1055,7 +1055,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_pin, "DMA_BUF");
>   *
>   * This unpins a buffer pinned by dma_buf_pin() and allows the exporter to move
>   * any mapping of @attach again and inform the importer through
> - * &dma_buf_attach_ops.move_notify.
> + * &dma_buf_attach_ops.invalidate_mappings.
>   */
>  void dma_buf_unpin(struct dma_buf_attachment *attach)
>  {
> @@ -1262,7 +1262,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
>  
>  	list_for_each_entry(attach, &dmabuf->attachments, node)
>  		if (attach->importer_ops)
> -			attach->importer_ops->move_notify(attach);
> +			attach->importer_ops->invalidate_mappings(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, "DMA_BUF");
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e22cfa7c6d32..863454148b28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -450,7 +450,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>  }
>  
>  /**
> - * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> + * amdgpu_dma_buf_move_notify - &attach.invalidate_mappings implementation
>   *
>   * @attach: the DMA-buf attachment
>   *
> @@ -521,7 +521,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  
>  static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = amdgpu_dma_buf_move_notify
> +	.invalidate_mappings = amdgpu_dma_buf_move_notify
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index ce49282198cb..19c78dd2ca77 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -288,7 +288,7 @@ static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  
>  static const struct dma_buf_attach_ops virtgpu_dma_buf_attach_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = virtgpu_dma_buf_move_notify
> +	.invalidate_mappings = virtgpu_dma_buf_move_notify
>  };
>  
>  struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 5df98de5ba3c..1f2cca5c2f81 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -23,7 +23,7 @@ static bool p2p_enabled(struct dma_buf_test_params *params)
>  static bool is_dynamic(struct dma_buf_test_params *params)
>  {
>  	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && params->attach_ops &&
> -		params->attach_ops->move_notify;
> +		params->attach_ops->invalidate_mappings;
>  }
>  
>  static void check_residency(struct kunit *test, struct xe_bo *exported,
> @@ -60,7 +60,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  
>  	/*
>  	 * Evict exporter. Evicting the exported bo will
> -	 * evict also the imported bo through the move_notify() functionality if
> +	 * evict also the imported bo through the invalidate_mappings() functionality if
>  	 * importer is on a different device. If they're on the same device,
>  	 * the exporter and the importer should be the same bo.
>  	 */
> @@ -198,7 +198,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  
>  static const struct dma_buf_attach_ops nop2p_attach_ops = {
>  	.allow_peer2peer = false,
> -	.move_notify = xe_dma_buf_move_notify
> +	.invalidate_mappings = xe_dma_buf_move_notify
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 7c74a31d4486..1b9cd043e517 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -287,7 +287,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  
>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = xe_dma_buf_move_notify
> +	.invalidate_mappings = xe_dma_buf_move_notify
>  };
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index 0ec2e4120cc9..d77a739cfe7a 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -129,7 +129,7 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
>  	if (check_add_overflow(offset, (unsigned long)size, &end))
>  		return ret;
>  
> -	if (unlikely(!ops || !ops->move_notify))
> +	if (unlikely(!ops || !ops->invalidate_mappings))
>  		return ret;
>  
>  	dmabuf = dma_buf_get(fd);
> @@ -195,7 +195,7 @@ ib_umem_dmabuf_unsupported_move_notify(struct dma_buf_attachment *attach)
>  
>  static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = ib_umem_dmabuf_unsupported_move_notify,
> +	.invalidate_mappings = ib_umem_dmabuf_unsupported_move_notify,
>  };
>  
>  struct ib_umem_dmabuf *
> diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
> index 325fa04cbe8a..97099d3b1688 100644
> --- a/drivers/infiniband/hw/mlx5/mr.c
> +++ b/drivers/infiniband/hw/mlx5/mr.c
> @@ -1620,7 +1620,7 @@ static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
>  
>  static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
>  	.allow_peer2peer = 1,
> -	.move_notify = mlx5_ib_dmabuf_invalidate_cb,
> +	.invalidate_mappings = mlx5_ib_dmabuf_invalidate_cb,
>  };
>  
>  static struct ib_mr *
> diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> index dbe51ecb9a20..76f900fa1687 100644
> --- a/drivers/iommu/iommufd/pages.c
> +++ b/drivers/iommu/iommufd/pages.c
> @@ -1451,7 +1451,7 @@ static void iopt_revoke_notify(struct dma_buf_attachment *attach)
>  
>  static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = iopt_revoke_notify,
> +	.invalidate_mappings = iopt_revoke_notify,
>  };
>  
>  /*
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 0bc492090237..1b397635c793 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -407,7 +407,7 @@ struct dma_buf {
>  	 *   through the device.
>  	 *
>  	 * - Dynamic importers should set fences for any access that they can't
> -	 *   disable immediately from their &dma_buf_attach_ops.move_notify
> +	 *   disable immediately from their &dma_buf_attach_ops.invalidate_mappings
>  	 *   callback.
>  	 *
>  	 * IMPORTANT:
> @@ -458,7 +458,7 @@ struct dma_buf_attach_ops {
>  	bool allow_peer2peer;
>  
>  	/**
> -	 * @move_notify: [optional] notification that the DMA-buf is moving
> +	 * @invalidate_mappings: [optional] notification that the DMA-buf is moving
>  	 *
>  	 * If this callback is provided the framework can avoid pinning the
>  	 * backing store while mappings exists.
> @@ -475,7 +475,7 @@ struct dma_buf_attach_ops {
>  	 * New mappings can be created after this callback returns, and will
>  	 * point to the new location of the DMA-buf.
>  	 */
> -	void (*move_notify)(struct dma_buf_attachment *attach);
> +	void (*invalidate_mappings)(struct dma_buf_attachment *attach);
>  };
>  
>  /**
> 

