Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42718751473
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4C310E5F4;
	Wed, 12 Jul 2023 23:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765AA10E5F4;
 Wed, 12 Jul 2023 23:28:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DazW8UB56x6wOJQKMGo2nWrl8pFvf5GtnX3WpfqWgfWKx3Z+E4LJRSKqHsxnA+gcfguBGeCWddqeFq/qUGY+ogYlfE2jPQs1Cb6+/3xks+/Eb9tvtweiJdEkSjUqRfe4ttSwIJ52vXs2vgU1Non1Cs30fpIkc3hKtzVrok4otQjrQ3ipbM0py85m5AR78gTCezShJ0zdkXgkAxTI61NKxluMQEfq0lcTNCfY2lxcEHbMei4AftIoOXzKS5ijY6e6WP1qVY3tVUfa/IGrno9RgW/hw0qtcGURtNVPKa5dD/OggVgbjUi6Kw2wO1L/2/QI14CY3CgPnpR4vWcQ//fePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BianAceytRTBFIZC6KDEm3WMNH6gDT8ZIyA+GSZgKeQ=;
 b=dVwxYQWxAhHfXYLVP2CsHjdcfjY0q1yLvoYh+dsEGGggrnJaD/T1Tdq0M+ofwJ/wjZI0mUABDQ6/e2FQ0x4nIUy3sxX2QqtGNJDuc8vpfwdt+mjWIagk1OBN7vyL8cQhDBIahlPXQLbQVW/jTjlM59leEVcszFMn7GFStD0EJm7Mp5Brl8/Gel525EhwnloqHTgDVv4R9uYJYsvEdXuClNWGACGWkKxKyrDxkXYrtnAdM9eSFOP2j7qfRaxrMzaomDRyvHaA2Chh9RlYWf8hEEV+9QmmZLuBUwjAJoBDzPo58ESgD800hIVJ46VdPWKJ/JqLptCBrzCEX5GihwOrZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BianAceytRTBFIZC6KDEm3WMNH6gDT8ZIyA+GSZgKeQ=;
 b=zxO+3Kdc0+zZ3mc6C2MTPjgDNlUdzT9oFkaby3iSHdYeI1QbTBYMc1aG07HeKg4zvVvSHYo/vz5jXkDqqCvyhaoZIeGBGnNE+3ClzB8YvN6+dIxv4jQ/Lljz1sgiGlVfUrrs5m6eELlHJVS30uA9i/A2a5+2YKGCSMs/HcGrHlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 23:28:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::bce4:716a:8303:efcf]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::bce4:716a:8303:efcf%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 23:28:45 +0000
Message-ID: <d4047df7-6e55-1fd5-a61b-9aea3b4da3c5@amd.com>
Date: Wed, 12 Jul 2023 18:28:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
 mitigations
To: Andrew Lunn <andrew@lunn.ch>, Evan Quan <evan.quan@amd.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
 <20230710083641.2132264-2-evan.quan@amd.com>
 <5439dd61-7b5f-4fc9-8ccd-f7df43a791dd@lunn.ch>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5439dd61-7b5f-4fc9-8ccd-f7df43a791dd@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 2516036d-7040-40e6-2503-08db832fbcb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kf0eDkYTRJL0ndD0qdii5mS8Kjfemz4RuwMlp0xkfFm3aItOH+ZEgjA2E1SO+C2q3d3ZLVat744U/zXqH/OeUJLthkaRxXfSpQ8DNDjvb1aInuSCO03fEKE9cEGe/6diPQ6bBXlst8ykvFHf8HgWZegTdzfKLv+HMwrU29mZPnDy3/TEFR//TcXjrnSNtQGGuSaCuSt3o5uyF89/DwMQnj4kwGXUlIxgOJFhsB6X1X79U+wBCtKNEic6bTv/Y3a3MmdsIa/gQv72NR5NI4kfOACr0KQLJ8Hr+hjngxEwnvtNNjCFvB7VH+Nhv1YGTjh+ow/KsurXRzDMeIL4RCV8zJVys6uf0HkJQPh0+/gvvYfQXaLtzWC/4hY0uQ+H+5tUTFTQpKTZaQXr2SkzrJMUKXSEG2B2R2xCs9K9mA4YMryDxhQ6F9B5VcHxNPGAV/IZT4xrieW7hfbuLo0wSL+nSpfIbPjk+BxqUjSH3xPu6NS0vCXs1I4GKLPPLOvhryjMMjC/8HBpfaIsGBRJkzHJsYP8RtQDfRcxEj/AQM+Ftm6wiyRWnFPiZs+LPOw1pOv/EfMcxfExjhIYCb9JQaK7Z/oX75rGlt79QuPFJV+GQMtEDUeLxESni7L+FoMaANu4tf1nGz5lkloMbAMe5Ntlhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(41300700001)(8936002)(8676002)(6486002)(6666004)(110136005)(66899021)(31686004)(5660300002)(2906002)(44832011)(7416002)(316002)(4326008)(6636002)(66556008)(66476007)(66946007)(6512007)(36756003)(478600001)(31696002)(186003)(86362001)(38100700002)(83380400001)(6506007)(53546011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9wRmliYVZYbjJhRDJrZHNaY3NRSzNNMDBLek5NdEFIL3ptZEN1bjdtdXIz?=
 =?utf-8?B?dklHV0VZT2d0TzlSZ2JlWDdhcjBCVk5mSTIwWENEdnZWd25HSC9lSmVQdWFJ?=
 =?utf-8?B?M0ZPYVJ2enJ6dVFrbGZoQk9wSjI5ZDV0TWVOeDRXR0lxZm8xSXRoTGZsa25q?=
 =?utf-8?B?c2V5cmUvNGl2UDF0V1dNSDJIdEg3ZjBEZk81eU96R1M4MWJYUE50RjBsMHVX?=
 =?utf-8?B?QjdIQ1B0UDc5RXlzYmFpekJlK0lFdURCbGhNK1BBejNzc0hlUEJyZ3hmTEg4?=
 =?utf-8?B?d050by9UZm91RFk2WEJXbWQ2T0ZsVkZIbVU1aGVtdFViWk9TRGhFNzlKaUNL?=
 =?utf-8?B?aitVMmJFN0Z0dExKZ1ZDOFZ2S2Nkb1JtazlzSXRLVU1jK3grMnI0Nk9xV0d1?=
 =?utf-8?B?R2hheWNEeTQ4cnFXTXRGeTQvMmlHeEtJWGRBOUppS1U2KzhRc3JEckhFeFNE?=
 =?utf-8?B?SSs2N0JQbGhhQ3FzS3hFdWkydEpoRThEbStkUWJCakNoV01MNkNzcGowcFZC?=
 =?utf-8?B?M1JXeEgrNlBXdlgvNU9yU0Mxa0VzRmVBWU5TaHFmSEcvS0pqbnQwWHJLTit2?=
 =?utf-8?B?bi9WMWhPL1gwaURuaEwvSmNITFZ1RjBXRGZzeVpIbm1wWU1Mb2JSODBydkEy?=
 =?utf-8?B?KzlHaUhRL0xaUG1iaFhKeXA1UVBlV2l2UC9xWEJDTSthY3dRTDZTZlJIYzZl?=
 =?utf-8?B?aWkxdnpVeFFLOFdNZGFWOXVYRU9MUWZseXEvT0I4WDczSGpaMCtwNlR3SnZL?=
 =?utf-8?B?Z0hCZC9nQ3ZBRjZDb1RLazdtTUdqc2hmUlFJZWtuSGdrVzFUQ2FGY0ZqQTRV?=
 =?utf-8?B?OXo2VVY3OG9MOUkzdEw1ZHdwS2I5OVhXVk5ncTl5UmpwNWgvbTZIYkVFMGgr?=
 =?utf-8?B?ZjNla1N3Y2xvanEvQk1QWU8wWlQxNW55QStscWtmWnhjVFNDOERWWENQVElN?=
 =?utf-8?B?N2pDU3cxWTB2QmptTjE5SFBtNWFPNmtqVjF3aEFTbllVVkRTaVcyU2RKeUZS?=
 =?utf-8?B?bGFCUUtuMUNXdFFKc0JwVjJqZkdOYTZNTlI2RHNhaUg2UlR5Yy9GWUpoMHla?=
 =?utf-8?B?QjI2TlRvVFpSRHJ1M0hZS3RGTlJVTDBZZi9VVTN1N2l4ZEQvbFdvcDZaU0Jm?=
 =?utf-8?B?T2Z4WGhOR1Jva1o2emVRblIyTTdualdDQ21XcFRST1VQK0lVeU45VEVmTW95?=
 =?utf-8?B?eHIyZGJrTnowbUY3MHAxQlRXbmxBNS91RHNyNk8xVnBMSHV3S0lkTDNtQ1Zi?=
 =?utf-8?B?U3d6NWRuN0VDcTVxNEJIQzdWdnA2K2VWZW9ITUVpQnhobG5ac09HUWpza1JR?=
 =?utf-8?B?czFTcXZ0bE5TRzl2MHFkZlhTVldvdnJzWHFtbGs4aTMvWUx1RUdwYUtySnBq?=
 =?utf-8?B?bS8vcTRsV3duMC9UN281YzBjclRqUzFqVUlqRXRuZHVOSGtqclFWQm9sR2Nk?=
 =?utf-8?B?MGV1RUlTeTJ0TXhMdlNSRWprK1pxelBpS0t6a2EySFI0NlYvdlFMeXk4WnFB?=
 =?utf-8?B?Nm90dy9MR3o4NU1IcnVlTGI1ZFMxOHNxNHZZbEFxekowUjFBUTlsUmgyNnI3?=
 =?utf-8?B?ZjdLSXI2Rzh4SzMrVWdNcklwT0FNaldSRGptenZLcWFuUWpxSDJaK2E3OXp6?=
 =?utf-8?B?dW5rbHVYaVI3ckllc1M1QWlUd1VySFlRd3J5eGt0YlBhQmluZ2FaLzVTenA4?=
 =?utf-8?B?TkFya1cyU3Fxb3JiTjhaYjA4YmNROUZlZGFvdnp5aFg3SHIyL1NnUS9EK09Y?=
 =?utf-8?B?Vmc0c1d1UGwyK0daUmRZdno1SDRSYXJBL0ljaS9yUmZoc1g1YVBiNmFadHA5?=
 =?utf-8?B?dTNoejFoYjMvQ21kdHNPeVQ3VUJLWm1Uam5QV2UrZkg1bkVLWFJxVEdHZStG?=
 =?utf-8?B?VlJnemx4ZlA1QkJyVnRNZVJROTQ1ZERqeS9PeTEyYUJXYStZdE44bjNFcTg1?=
 =?utf-8?B?ZjZTQld2aks2T2lJb3BsaHlORFQ3Wkpmd25SSXliSGIrOTJtdTlGUlVaVm12?=
 =?utf-8?B?cXZaRk51TS9CM1FvamRJeTlQVDhkS09EOHB0emxCeElFYTZNakwwckladWFv?=
 =?utf-8?B?eTJyU2Y5VWhkNXhGaE96emUydWE5QmxMeG1UaDZqZmNUQklhRG9RSWdMQUZi?=
 =?utf-8?B?a2VHeUtaRjJTQU0yVklGMDE0Z1IxeUVOUUkyTW5tdU9uVzQ5a0NDYUJUN0Vu?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2516036d-7040-40e6-2503-08db832fbcb9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 23:28:45.7824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vv+JZR7xb8ua8xXleDJLd3jMQqQy1O6VTMh8S36lVxh6yI6l0VxptJk+0dj155w3+fpzrLKdh3MCtq1l8wHlZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, Lijo.Lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, Christian.Koenig@amd.com,
 tzimmermann@suse.de, Alexander.Deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/23 18:12, Andrew Lunn wrote:
>> +/**
>> + * wbrf_supported_producer - Determine if the device can report frequencies
>> + *
>> + * @dev: device pointer
>> + *
>> + * WBRF is used to mitigate devices that cause harmonic interference.
>> + * This function will determine if this device needs to report such frequencies.
> 
> How is the WBRF core supposed to answer this question? That it knows
> there is at least one device which has registered with WBRF saying it
> can change its behaviour to avoid causing interference?
> 
Potential producers are supposed to be the ones asking the question.
> Rather than "Determine if the device can report frequencies" should it be
> "Determine if the device should report frequencies"
Agree.
> 
> A WiFi device can always report frequencies, since it knows what
> frequency is it currently using. However, it is pointless making such
> reports if there is no device which can actually make use of the
> information.

Which is why this function exists.

With the AMD ACPI implementation the platform will dictate this information.

If a future device tree implementation is added it would work similarly.

> 
>> +bool wbrf_supported_producer(struct device *dev)
>> +{
>> +	return true;
>> +}
> 
> I found the default implementation of true being odd. It makes me
> wounder, what is the point of this call. I would expect this to see if
> a linked list is empty or not.

The point is a lot clearer when you look at the description for the 
Kconfig included in patch 2.

+	  Ideally it is the hardware designer/provider who should provide a
+	  solution for the possible RF interference issue. Since they know
+	  well whether there could be RF interference issue with their
+	  platforms.
+
+	  Say Y to enable this generic WBRF solution for diagnosing potential
+	  interference issues on systems without the ACPI mechanism and
+	  developing solutions.

WBRF_AMD_ACPI and WBRF_GENERIC are mutually exclusive.  I don't expect 
the average user to enable WBRF_GENERIC, but there isn't anything to 
stop them from doing so.

It may also aide in developing a WBRF_DEVICE_TREE or similar.

> 
>> +/**
>> + * wbrf_supported_consumer - Determine if the device can react to frequencies
> 
> This again seems odd. A device should know if it can react to
> frequencies or not. WBRF core should not need to tell it. What makes
> more sense to me is that this call is about a device telling the WBRF
> core it is able to react to frequencies. The WBRF core then can give a
> good answer to wbrf_supported_producer(), yes, i know of some other
> device who might be able to do something to avoid causing interference
> to you, so please do tell me about frequencies you want to use.
> 
> What is missing here in this API is policy information. The WBRF core
> knows it has zero or more devices which can report what frequencies
> they are using, and it has zero or more devices which maybe can do
> something. But then you need policy to say this particular board needs
> any registered devices to actually do something because of poor
> shielding. Should this policy be as simple as a bool, or should it
> actually say the board has shielding issues for a list of frequencies?
> I think the answer to what will depend on the cost of taking action
> when no action is actually required.

Again, look at patch 2 and the purpose of WBRF_GENERIC.  I suppose an 
argument can be made to bring WBRF_GENERIC into patch 1.

> 
>> + * wbrf_register_notifier - Register for notifications of frequency changes
>> + *
>> + * @nb: driver notifier block
>> + *
>> + * WBRF is used to mitigate devices that cause harmonic interference.
>> + * This function will allow consumers to register for frequency notifications.
>> + */
>> +int wbrf_register_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_register(&wbrf_chain_head, nb);
>> +}
> 
> What are the timing requirements for the handler? Should the handler
> block until the device has finished doing what it needs to do and the
> frequency response has settled? We don't want the WiFi device doing a
> SNR measurement until we know local noise is at a minimum. I think it
> would be good to document things like this here.
> 
>> +struct wbrf_ranges_out {
>> +	u32			num_of_ranges;
>> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
>> +} __packed;
> 
> Seems odd using packed here. It is the only structure which is
> packed. I would also move the u32 after the struct so it is naturally
> aligned on 64 bit systems.
> 
> 	Andrew

