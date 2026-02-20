Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMvGKV0YmGki/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:16:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36F165914
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047B810E35E;
	Fri, 20 Feb 2026 08:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZVg8Pwo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010054.outbound.protection.outlook.com
 [40.93.198.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827AB10E229
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 08:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxu6en2UU7963EQAKwx88U+g1PESTp/E5xX0SBtN+HwMBFotmVCfjM0i9cl6EBWzsbeyCTLDOwOtvxroTW3oZj7Wup3ttCLxazKsVP/TVWfO2lvN3FZEpy9PLmjukJV0Nf5ryyA6435WtJVLnpfgAXs5e5LviuaMu8/RcGSsLKIJNrVPgsilYJYwKzIDz220O6HOzYEySf0Q+mDT6yGVGCIB8BU073jkzFa9noqIPmkLltC6q+y9zlHivV2pg+/2R5TwsCo3e3zwgbNg91bpItn1mruNLt6+nSlB1J77C4IXqnIp+2ZQtk1nPGnlWDSzRZXHRGVmEmMHqridNS7Wug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM9D+9LALR47xbjCtwNGkGM7vWrb6dVpZplY2410FM8=;
 b=Wdk3eEPnUalnZmBHDB1ZwPE4XAqYNyzFxMH4IjtQSQr3aXfUfMssr/DsMvAtdY6P8a3MYitzdblg/WvmDT/Pa3tCn9vdltJXoSc+1p9/EumlIDK1zUdCCMBzUSs9zHzya7/tji/14JOYKiOU/XL58tf/AsOVE/oILdm9zE4F7x7Fwap4JmuzDH9+JSL6tKtost3C7jYO1sc1GJr20kRNwk2pxTYUvW1ipkZnhHOY5s345y/qfgC+gqQXoB4m/zInY+6izVCwlarinUbnh0Oa7H7lOuX8E+QtaMkkB5qbKW+FXIAf9g6SIh459qoqNEZ2e9mU9zZ08xy5VWzUnzvB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM9D+9LALR47xbjCtwNGkGM7vWrb6dVpZplY2410FM8=;
 b=ZVg8Pwo4g+VGyyqT9J+pswE1Be94ylTiHUyKbZkNQAYoEmeVcwaUtb8w1/2xc9jw2GzzgTX+BHTTXfekL45gG4eEvvX6YV/ijeh9v4PNFiizpab25fxD1KVBRWhUw3oeTCLqCm1icqU1tFtCu+KQWE2HR5FrHHj5SRpYEMVcuKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:16:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:16:23 +0000
Message-ID: <0ff02d77-13e8-4b2c-b714-38037595d535@amd.com>
Date: Fri, 20 Feb 2026 09:16:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>,
 linux-mm@kvack.org
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
 <435330fd-ecdd-43c7-8527-f285c03c6421@amd.com> <aZdAOMBRdRw59fa0@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aZdAOMBRdRw59fa0@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bcc803-8acd-46e8-5bbe-08de705855ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzBTSERZdUhkUk9tUkx3cE9zdGh1cTd0bUF0amZaeXhYd1F0a1ZxRXozUTZE?=
 =?utf-8?B?VVh6cDlhdzV0SitJYzEvK0dXa2l6OGVYL1liRjNhMEpBNldiZWQvdW4zZXVo?=
 =?utf-8?B?OG9aNFg0MHNyUmRGbVRIb0Z4MUY1RGhiWDBnQlZhNmlaeGpuUWFWR1EvMDBj?=
 =?utf-8?B?V3JGQXhpWEZFQzZ4WHhxZEVmTm14RzNBTHFLUUZCLzEvaGlXN09ZTEhjNDln?=
 =?utf-8?B?TGVKOTJBZ21qaFdtbGdJVFVRKzVBcTArcVFoOUlSWDNUakU5cnVrMi9DRGg1?=
 =?utf-8?B?WkJvSGkvVXdJSXdGbW54NzBnVEszUUxpKzhrV2hlZUxLbUsxNHYvVmMzOEdF?=
 =?utf-8?B?NUpCS0RxLzBNODVhK3pzclFJZmViTVZyTDFDNjBqaUJKYktySUs4YndmV0dm?=
 =?utf-8?B?RFZ5UGQ2aDZmSCtrUEFZT2lDWStnakU3dFdGZjFUdFlRaTYxRlVRZXFhV2NG?=
 =?utf-8?B?TUl1ZkhlSXU1bXBiOWgxK2JHTjBYUnVRZzdLT1VuOEVWZ0ZwN3hTeHBubDVm?=
 =?utf-8?B?dzl0b2Zjcng2OXdEaDFEWEx3L1pVK1NoTW1ZT2V5OTFYTkRhVWdqSCtkM3Q1?=
 =?utf-8?B?ekVvQkczV01rSlJLeXZwV1pyWk9BV0dqY3djZDNNaW5FTTBTQnNScXowNXVE?=
 =?utf-8?B?QzRIS0o1MWlMWGhxTVVyczk5RGFST2Jqcno1ZVlQNUJzSHh4WVJVQTlxWWwr?=
 =?utf-8?B?VHZ1R0cyNm43cnlyL0t5YU9oV0haQ2k2U2V0TjNwTk8zQm9FU1NWb1JSa1cv?=
 =?utf-8?B?VVNtaDl1NGNhRGZjalp5QkZDS1FNZ2ZicTRadXdtZEc2b2FNdEpVUE5ua25x?=
 =?utf-8?B?dG1NVUVhL0RLT25PVGMwMVc2alNLYThRQ0pUbEZRMEkzWE1SRTdmd3NVNmlN?=
 =?utf-8?B?OTF4U3V4K3ljRDhRNmlxMk1ZWU9ZM3lQcU85TlBwRmJReFl3YXpQTDR4VkIv?=
 =?utf-8?B?eDhwRjZNbFcxOXkvUzFENnhGYzFhZlViK1lrbGM4T0NYMWxwU3pjN1gxZlFB?=
 =?utf-8?B?SHY5R1hnQzNrVnI4SWZveEZ1OWt6bGV5MUh1Z0EwYWF0S05IcXhqNU9wQUdk?=
 =?utf-8?B?aW9VcGdzVlpTbjBWNTVpRFUwTnZNVmxRaW4zZHJDVFowV1ptTk5wV25MViti?=
 =?utf-8?B?WTJQdFIzT1lpbEp0cElwUWUxY3czMUp1aS9FU0sxT1hSRE1aSUpCNXJ2VlE3?=
 =?utf-8?B?K0p2SEhDUW9SNTNkQ0FoL3N1RzNVMmZDcm0xSTNQSHZTVVhYR3ZzZk5tMjF3?=
 =?utf-8?B?cC84OXdQL2ZhL3NQeEJNbUNNQjdvQ2M3blVIRzBCamVwcTNRS0twTFlVY3N6?=
 =?utf-8?B?TWZlZlVvaWxCNjNBemlKK3JKR2FKaUY5T0RvZnVwc0UrS2VySVpTbUpFWUhF?=
 =?utf-8?B?SzhsMEVNbjhRL05FVjd1U2h6WUJ2ajBHUllUNnlYaDNSKzJBeWttemVOcENV?=
 =?utf-8?B?WUxDUXJDQUdoUVIwT0o4ZzloYkNjU2J3c25vcXBWcUFSbmpyZ3hUM2xQczF4?=
 =?utf-8?B?ZEluZUk2TEtGTDZGcjViVkVGcWo2UkJNNlNzMGJueGxpY2tWVTFJMkQ5V045?=
 =?utf-8?B?U3p0eHRtSUszb0x1UDhvWk5ESVpoaVR5TlZtMnUydlpidHFsSGtXVENYU3VZ?=
 =?utf-8?B?Qmg0WkJZdU1JdzBMcjlrZ3ZLcjNxYjhIVEdsWHN4MlRKNmJTb2QwYzRTWTVt?=
 =?utf-8?B?NmViaXR0OGZ6T3EvOUZXTTJRZDZZamR2OXc5cVpxOWw5OURYYjVSMkswQ1Nh?=
 =?utf-8?B?Z2V2clhod0U1cGJuYnJROTdXOUhwd0tzZHlCck5zTTF0VUNQMkFneCt6ZVd3?=
 =?utf-8?B?TndGSTM2VzMwMW5FOUU2dStyckNnaWdDaWgvOGhPSDBTcDFOZkRGSnVjS3Ni?=
 =?utf-8?B?QzVadEZkZ0ZBaVhFRlBxUnAvWVFVWXh0RFVPc3RDeFpuS0pOdm9UeUhPdVFy?=
 =?utf-8?B?TEpUZUdoZDVsak9BRUU4MEFCdjU3cGpNeUNmcTc1NjJpcXBMR1lpaEcyMElx?=
 =?utf-8?B?RjB3eC9VWnVQd2VEeXFXTnZwNGdoanRwMUhOSndqUnRwU1dkQUI0TnpRNEZr?=
 =?utf-8?B?TkhrdVdPUjE4bUJodUlTZzlnWDFoMC81aFR4cVJTYzFYRTA5b3dQaWVjS0hl?=
 =?utf-8?Q?FWLg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTRmZ21KbXJ6RXpHQVROcGdkOE55UTZsOFFQTkI3VGZoeWREb1dPVnY2Ty9M?=
 =?utf-8?B?SmxwMlRYMGV6TGthQzQwSkVpVk85bll5Y0JUK0RmdWlHK2NPQnlia3Z4azlE?=
 =?utf-8?B?QVFlYzF1djd3T05pVzlvSEZEQU9iOWhacXd0M3M3OTNpa0xGbUl5bDh5amdN?=
 =?utf-8?B?T3FwWldSeFNVZ2VPOVF3dUFXaDcvMlNPVXhVOHQwSkV6cEl6UGNLRDRFN24v?=
 =?utf-8?B?bldIZzJmTEhHVHRVdHFTT095cjNUUjZVRXZEd2Z1THF5bkcvbkIyNjFjUlh3?=
 =?utf-8?B?QWluaGxNR3o4S2crMVU3bllxKzVHazY4V2lUZ0ZkanVIOHFYWUZnbFp6dnVw?=
 =?utf-8?B?V2FhVHlWZktITkNMRWlDRVB2aDNMYU5rMmhqOEVabTd4YkFrMjBqdmdYOFI1?=
 =?utf-8?B?TGZhSExmK0hjdTlrYWtjb2tGblhLd0xGMU5vMHVLSkVlNUZKZSs3cmZYcmhi?=
 =?utf-8?B?ZVRxSjRZWTZITnRza3FNVStJdUZrQitpRmZnUENuZTZ3REFoRXR3QmpOUEp0?=
 =?utf-8?B?RHhYNGVVcXJsUThMRWFVUjZ6YTNGUHhIRU5lS0R4UzVEdEE3ZVROWHZFYTFu?=
 =?utf-8?B?SDRXMGVlKzZ1WFh5bEY2UUxpbGFsSUROSFF6dG8yZnBKelp4V1YwT3ZicUw1?=
 =?utf-8?B?b2NQTkFJR3Yzb0ttMlhUTkUyUFJVUXl6ZFhMd0tMKzV5cTlZYWFEZnhqcnNi?=
 =?utf-8?B?UHdyMDBCVWVoN3NEMHVGL2NoeE1kcFhyTU1JNysvLzNFdnVQekI2SnJEb1Nw?=
 =?utf-8?B?c0I4WGQ0TEV0b09UUS9Rd2Vib0pabms4c2NkWTZzc0MwM3ZubzU0SDBJR0hQ?=
 =?utf-8?B?bnc5TE11anhhYnZKOTJ4NVVjb2RmZm44MkxVeEdUM2tiYUY2SlJQeW13OVN4?=
 =?utf-8?B?c01aMWQ2UmU0dmtMaHBxeWtYUlV4bVArZExxaTRDb3hMTyszcTM5VWVmRFU3?=
 =?utf-8?B?akZtQmxQbnZkVEhnTHJ6aG9sNTh5UUh3ZGt3NGFrdENZM0MwTmp1eWhSTGlT?=
 =?utf-8?B?S0JQKzBWRXJ0T09DdE1JbUVvblFNNzMrN1ZFUjFYV04wTFZ0TTVIOGV3V2wy?=
 =?utf-8?B?WnYxeGc1bFlxZFJPOVN3TFZmR3RGRy9kazk0ak0zVkUwaTh0ZHBRKy82RXli?=
 =?utf-8?B?NTNIc1pUUWlTSitVUytIU0RqOUxsaUpMR0ZlUlFEbllIRnVjUGVBWXg2R2p4?=
 =?utf-8?B?M08zUlNrQWZzR0JlcGh4RnhLRkwwV1lCMitWa2VldUFhcnB4N01SYVlyVWFu?=
 =?utf-8?B?QU9KNDFMK3A4bktjMHlUa3E5Mm9YWjBPU3JpdXFmT2p5czlqd25HbXU1Mmt2?=
 =?utf-8?B?SzN5eTM2WVBqdHFmUDUyT3c4N0xmaml0VkhRTlNxb01KRnFlQUtvbGdEOG1v?=
 =?utf-8?B?RmJzTlRqRklpaVJWQmxzMDJiUnl2S1RUcDdlQWRSTWdUNU5SRGErVGppTXBi?=
 =?utf-8?B?UlpoOThMWjhBRGptUVovWlQ2bWo5aC9Md3BMcUFVKzNaNWRFWFIzTDF2MWph?=
 =?utf-8?B?VlR6czFucjdrNEFhTVZoWUNCb2E3L2NtazkxRmt0YkpaVi9ESEhzWis0QVFG?=
 =?utf-8?B?cUtxVWVtdkZWVUNoSE9lRzQ1YWtnc0JxSVdpNTU1WDBVKzlQOXhiMUQ5YlhN?=
 =?utf-8?B?cmFjNWlwOHFLUWZhbVJabExMa1FHTUJJMUwxZG5sU2ZMbGZURjNWZW8veVNH?=
 =?utf-8?B?dmZEQk5UNUdxNXdZMTFKd0pVWnFqdk8wNFI4SnB2dGxRQTNId042T3Z1U2lw?=
 =?utf-8?B?cWF5MWtnVld4TlJuUm1VblZoVjRFSEhRc21HNHdWck4yelZGL3c2eGVSQjNN?=
 =?utf-8?B?WTlWWFdGWGs4VXd4KzZMT3FLcm4xUXJJRWNpRngwMWlDU1VjMXVwV0xYbTZ4?=
 =?utf-8?B?M1dXWXBYVHR3Qk54WDVXU3dpUVNDc3c4Uk80MGdNdFlhM2Rka1ptL2p4SnlG?=
 =?utf-8?B?UTlBdTQ5M1hHSlhzelA4aXpIWmV4ckhxSXo0b2lDakZzZlNiQWMrZkgyYTZW?=
 =?utf-8?B?V01XTCtjVml2c3pqbFk3UzRCWlVOOGdrVnJFOTBxbkt3YlNZUkRydmdFaCtI?=
 =?utf-8?B?ZTlVSjA0dEdjUTBET3ArWVpaYmd4NUxUL0tWdEpTb3Y2bTlzcGczRjVZVExr?=
 =?utf-8?B?aVVXcUJ3Z3lvZ2lNRjhSTlJXL2dtZEhoOWU0a3BJcDI3c1Rwd2g1THRYMkIx?=
 =?utf-8?B?VHNCdWh6U1hwKzZiOTdRZk5saktZdCttK3lmSGY3RmNiaFlzb0xEeGUzOGdP?=
 =?utf-8?B?eWdGRWxac3NLaDlhZHpVTSt6SXRGN3lBNlEvbENVYXA1YzZLM3hoNkoyempD?=
 =?utf-8?Q?JvBLmOE9xTJg5uwi9C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bcc803-8acd-46e8-5bbe-08de705855ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:16:23.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0lvyLmTX8aoX1SICHMQT9OCwOTvQEommOiR8wON6i+wUC4hAtf94gvsmSEo8MwH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560
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
	FORGED_RECIPIENTS(0.00)[m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0C36F165914
X-Rspamd-Action: no action

On 2/19/26 18:10, Eric Chanudet wrote:
> On Thu, Feb 19, 2026 at 08:17:28AM +0100, Christian König wrote:
>>
>>
>> On 2/18/26 18:14, Eric Chanudet wrote:
>>> The cma dma-buf heaps let userspace allocate buffers in CMA regions
>>> without enforcing limits. Since each cma region registers in dmem,
>>> charge against it when allocating a buffer in a cma heap.
>>>
>>> Signed-off-by: Eric Chanudet <echanude@redhat.com>
>>> ---
>>>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
>>> index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
>>> --- a/drivers/dma-buf/heaps/cma_heap.c
>>> +++ b/drivers/dma-buf/heaps/cma_heap.c
>>> @@ -27,6 +27,7 @@
>>>  #include <linux/scatterlist.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/vmalloc.h>
>>> +#include <linux/cgroup_dmem.h>
>>>  
>>>  #define DEFAULT_CMA_NAME "default_cma_region"
>>>  
>>> @@ -58,6 +59,7 @@ struct cma_heap_buffer {
>>>  	pgoff_t pagecount;
>>>  	int vmap_cnt;
>>>  	void *vaddr;
>>> +	struct dmem_cgroup_pool_state *pool;
>>>  };
>>>  
>>>  struct dma_heap_attachment {
>>> @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
>>>  	kfree(buffer->pages);
>>>  	/* release memory */
>>>  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
>>> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
>>>  	kfree(buffer);
>>>  }
>>>  
>>> @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
>>>  	if (align > CONFIG_CMA_ALIGNMENT)
>>>  		align = CONFIG_CMA_ALIGNMENT;
>>>  
>>> +	if (mem_accounting) {
>>
>> Since mem_accounting is a module parameter it is possible to make it changeable during runtime.
>>
>> IIRC it currently is read only, but maybe add a one line comment that the cma heap now depends on that.
>>
> 
> Agreed, while read-only it is easily missed without at least a comment.
> Alternatively, should that value be captured in the init callback to
> guaranty it is set once and make this requirement clearer?

It probably makes more sense to make nails with heads and make it runtime configurable.

I'm not sure how exactly dmem_cgroup_try_charge()/dmem_cgroup_uncharge() works, could be that it works correctly out of the box and you just need to initialize buffer->pool to NULL when mem_accounting is not enabled.

Regards,
Christian.

> 
> Thanks,
> 
>> Apart from that the series looks totally sane to me.
>>
>> Regards,
>> Christian.
>>
>>> +		ret = dmem_cgroup_try_charge(
>>> +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
>>> +			&buffer->pool, NULL);
>>> +		if (ret)
>>> +			goto free_buffer;
>>> +	}
>>> +
>>>  	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
>>>  	if (!cma_pages)
>>> -		goto free_buffer;
>>> +		goto uncharge_cgroup;
>>>  
>>>  	/* Clear the cma pages */
>>>  	if (PageHighMem(cma_pages)) {
>>> @@ -376,6 +387,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
>>>  	kfree(buffer->pages);
>>>  free_cma:
>>>  	cma_release(cma_heap->cma, cma_pages, pagecount);
>>> +uncharge_cgroup:
>>> +	dmem_cgroup_uncharge(buffer->pool, size);
>>>  free_buffer:
>>>  	kfree(buffer);
>>>  
>>>
>>
> 

