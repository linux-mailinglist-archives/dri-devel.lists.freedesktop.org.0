Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA911797268
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 14:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ED010E7D3;
	Thu,  7 Sep 2023 12:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C70010E7CC;
 Thu,  7 Sep 2023 12:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgwuCbWDnYtUVM1md6GviPpnqGRTfAVQO4H03mC3ForOsmoVmGjv+ZbYfgZBzEOP8IxMFIjIaJbCedjb4LNAx/HSJAUYR7Ec7qyrr9FWmD7GV/OGFG9ae5AHnH8ysSq7X2RKEmJvEGuSBm9/TWYVkHFZzr8VvsfRBT5f1GtLX4PvMgp3TKEjnaeOcM7+2HBakEqkF920mtBEHz87sLUGecAsNL90eFF2XE38Bxbz0CCCFfNA6IgZfQjhRWf3sThq/dd5rsugIrGnna6HSzDZP2gG+pKCzCLPsP0nx2U8rBCSlmdoXyETV1YPzPU4aY0MLQrp4LUba3coEIRFZe2Wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2ofdhpSWS9+GZHGysvoXglLW1/JvT1Le9J/PUKFQrE=;
 b=XeR81X+zKkOQJmcD/uMmixAIqd8kdKip6Op2zkN9COXGyr1WW1kS5oUJi1g1+OtjaEFJjKTQmyt1FIAsq0HvmdB6mjtxMwdS0tIHVirN9X2GPF+4WJGYjkWETdDC+VgiSHoQh4AbEMK4hglATY31tV+i0VINBenzI0IlNXDjoZeNaEFGonFsG67XRng6xmusVoT1u8/vondC7i5Qc0Ya/buj6eSfu/FKIng6eThrddWaK6BDS7ywhj6t5uKdiBqkl+Xo6Ou9+UxafZ04XQBaA/h7xQTdMqdP6bc/P9wIMx8m+XE3Z7qzR1deLBfyv4WNAHa6V9h8wAJU5FiL79yZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2ofdhpSWS9+GZHGysvoXglLW1/JvT1Le9J/PUKFQrE=;
 b=2TP0274nv518Ac7PaBilwN3JpFHvqNmLlXCFdcDZst1/6JnzgzQ0sJc3KnZSgDUL2VJwTTI0lZ2QTG4KnuW9j178EddItNX6U5D7p2OkBz18OOcPeHv2k/K0dkJvZmBQd+s+uNlXzNCsOwnlLdYXyajNB28v088soRcKWYszUVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7997.namprd12.prod.outlook.com (2603:10b6:806:307::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 12:44:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 12:44:03 +0000
Message-ID: <714d5ecf-f0dd-c099-0970-9ee765d35161@amd.com>
Date: Thu, 7 Sep 2023 14:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas
 <bhelgaas@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
 <b51d49f3-e3de-6b8d-9cb4-df5c03f3cdc0@loongson.cn>
 <10509692-ce04-e225-5a27-abc955554bdc@gmail.com>
 <a9af88c5-4509-96ff-a7fd-a0f72d2f1e6a@linux.dev>
 <127fab21-bc5c-f782-e42b-1092fbb8df34@amd.com>
 <5d9f9780-995f-33dc-e3db-3112aa085062@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5d9f9780-995f-33dc-e3db-3112aa085062@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: ba80dea3-c906-4634-95cf-08dbafa01d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wggq3wBpptVwkhWYyaTw5Q0yO1xBSe9KSyfSAFqjFUvQMqYNPDEBVCToQ2idOzNE75YgsHArcXYzhBb0xwkcvFvaSMZsc8Omv0VUmYThfDC057w+vgHDkIwne/IFFsLzTtp02Jl1f+ktcEsJ/JeoXQGJlJsHeQuIkqEe1mjhK6qcRlX7WFINsWg06AimPdXdyui63LRQsJQi794VVPjsl2wkIWWYTQa+/BUUzUyT+lwpOjXNn+Gs77fzSKJJ7bqsi5TETMZNrEzdHZYtDTpE6a3YmSKqbKrLLEBEdcUtw1/C5CD90pHLpXx2ua9k4k6y4zXSC+9NB9wK2gK4AhTNQy3b3VDlGJbO5rMn7GcnI+1VsL7OZK5ElsQLBNGfSDjt/x3YgdTzhiCXNu5YPpk2W6iO2kAayybmQ0tydd4sUOBsbfg4lQcfUxlAeswqNpTbTQdF7+g/dQds5HNChZbqFG5B/GcSX8WJLRW2tyuJJfTkZ2xeGDUMOOpKOqT+nrkv+YU5hZPs6PTP0/cvZ0J9JHtJiT335fzObWLyWJiDOhTc1uPLTHvCSQtYZBr99884BICW/1EVF3SoMzSJW3XCQniRDZAt5Qsoe0bzRIx0iJQOMYjYZ4wKnYCtJZvDXcmg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199024)(186009)(1800799009)(966005)(8936002)(4744005)(8676002)(4326008)(478600001)(66476007)(66556008)(66946007)(110136005)(5660300002)(83380400001)(31686004)(7416002)(2906002)(41300700001)(31696002)(86362001)(316002)(6636002)(6666004)(6486002)(6506007)(53546011)(6512007)(26005)(2616005)(38100700002)(36756003)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDhxUHQ0dm1Ud1k4RnpyZ3ZFWEpXcFZLc25Ua0NUYnVHZTVRdGxjR1hKMW5q?=
 =?utf-8?B?R0N3Tmt3NEFnTkFxaUIva2huc3QybFJLODIralZESFhHSTMyNHc4NGQvUjVI?=
 =?utf-8?B?LzBXZVNiNUc4bGpIMUtXK1FyM1JYNDIwNVZJaXlsMzByTm1YdWxOYzM0b2ox?=
 =?utf-8?B?M3NIN0VreXVvUmJ1bDRoWTc2aWYwS2FLcVZBMEN4MDJ1YU9JZjEzZnEvZElS?=
 =?utf-8?B?TWxSTEY5eGJPRWwvbnM3TmQ4YVQ5R3VHaTNwd3ZTeGtGK0kvMll6V2RPU0NJ?=
 =?utf-8?B?UWlTNVMrS0NWRlAzMlVEUkpXNm1QQm9KcVJ0NlBPdUNCUFhKaW5Kb1BDMHA3?=
 =?utf-8?B?OHlrdWdlR1B2Qm85dXlSbXlwRUo1bHE1WUdmYTFUOUE3eHBNNTZsck5peWtk?=
 =?utf-8?B?VjVCK1V0elJjY2Q5cEJXeTgxZFdJTVpma0hRNitETXhBLzVEbjZNKzlOWUpU?=
 =?utf-8?B?N3lmcWUwMzlXbzk4WWNwTzRnK25ySWhVT3RmM3BINmlsSnFSYjJRcTJNb0tw?=
 =?utf-8?B?ZXo4WTdxRXNicGpRdWs1eGhLS2ZLRmVpRjhSeXFteSt0UzRJS2h3TngvV2tU?=
 =?utf-8?B?M2dkTE5jREZaV3RoajlFN2ttUG1FVzRqUkxSelJ5alRCdi9Dd0Q0bld1MWIx?=
 =?utf-8?B?dkZaZTljODRkamkwTm85R0E3T1hlNmxkbTRIbmpzcTBmc09uMTBSdFBGbDgw?=
 =?utf-8?B?TUUvNWk0Vnp5Um5GMTltWlNwVkxCUEU2UXcvNHc3eDROR1JPQXNjOENacGpw?=
 =?utf-8?B?a0MxWnlQcEZGZCt3aHM2K052UWpQbHZxSmcwTWNzQ0NLUXNQTVo0S0hieVhO?=
 =?utf-8?B?eWgzYXpUMVcwMm9iZGR4N1hOU2lOSzhqQzQwaGJWNlNGOEJmZTREOGQ1cE5p?=
 =?utf-8?B?YlhUL0s5eUNrc2N3bUFsc2g0V0l2RFFMSyt4Vkp3aThBQ1oyb1Y5bDFza1VV?=
 =?utf-8?B?aHB2ZzRUekhTNklackt6V2UwNEVDMWhyNkYyUWpLMklVMlpwVTIvN1RmQnh4?=
 =?utf-8?B?MUlLZDNOdHpXK1QybWlJRTZCWkFqbTJyT1hMZzRTYW9PYUwzWThiMUk4M1Vi?=
 =?utf-8?B?Q1FUMnpCOTV6ckUzVVpxdGRxTXFzRmNzK1IrYUlqejVOV3ZYTzluYXl1ZlBl?=
 =?utf-8?B?N2FEbkQ1aCtvTGd2a2s5QVJqZE9Ra3RPUmJzQTg4a2ozU21mOC83U0p1b2No?=
 =?utf-8?B?TnFJQUJnKzVwdFlOZzRRUEdjYnpiYVl3MFpVNDduT0dyMkMrOThoOGU2cnpO?=
 =?utf-8?B?QVNpTGllcm9HS3JvZnBRaHhmNFZSSk1sU1BLVEo1TTVEUjdBYU5KNHREbWp5?=
 =?utf-8?B?VXp5NDBPL0lLcGMyZ3ZQbE8xUnFGYWcxOTl3cHlzV3l3QUQzclZ0aHpQS3hO?=
 =?utf-8?B?bGtUNS9oNXJLK0tTVytFa0VCZFlkK3hkbW5vOVg2alJnSG5NVkpJTE9VcERY?=
 =?utf-8?B?Tkc4eGZRK3pQSXVuVXN2MnhCQ1N4T2Q5RFJHbDJGQm1RcW1iY3hCcUlXSVpQ?=
 =?utf-8?B?OFFsemtWUXYxVzFNRjIrRXlXTkdDTFpUWTdxc0tJZjg4NjMwdTJNeExqS215?=
 =?utf-8?B?ZDlYdjlieElVSHFTcEpDYldTUFJQOXJHQklKbEhBMk1pc3laVEUxTnk0Wklz?=
 =?utf-8?B?d21BSERIMnc3TXhhZXZMZzJ5enEvNkx6MWZIdjd4REc2Q0h5Wm1wR09tb3lr?=
 =?utf-8?B?dWQwbGZwTG1sTWNCaVgrNEoxbmJjNnlMZXhCZjFVaVZmeWdodXhGT3BKaWpW?=
 =?utf-8?B?dkpDWU5JRE5MakpxUWR5TS93VkhPaTlSMElDMzJ6dGQ0R3dmZzNSTEVXWlBi?=
 =?utf-8?B?QW03bkZlMWkvVkcxTm5JN2J3MWczOVBjSlBYaG1OUm1WN2VGbEFsS1RDWmlP?=
 =?utf-8?B?ejZldUdmL3pXUTVna0dWVFY3b0hrVWlOazA4Z21GY1VOR0ZDL0ZhZnRQcVh5?=
 =?utf-8?B?M0VnbE1SK1JIQVFXQWhuZE95WkJlZDRuNkUxWVJVMkhzVDlvdFdwTHZsM2k2?=
 =?utf-8?B?NE05YlRmU3gxakxFNXZSZW5FaTlRSzFOYnpXTExRMnViMEI5SDBvYWV5eGZJ?=
 =?utf-8?B?ZzNPRzdOdnRlOEFwUS91alZzaXNVZ1NtWkRTdVlXZXJncWpnamxaR1V0ZlRW?=
 =?utf-8?Q?mPv+33G7ba+U3KiRnN5s3ZYkd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba80dea3-c906-4634-95cf-08dbafa01d89
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 12:44:03.0049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkZJ/IzFvhrbVUY+MC0sqjmYQrsfKilPMqlEPCaERxevnn5/AKWSFP9r/JpNyqLT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7997
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.23 um 14:32 schrieb suijingfeng:
> Hi,
>
>
> On 2023/9/7 17:08, Christian König wrote:
>> Well, I have over 25 years of experience with display hardware and 
>> what you describe here was never an issue. 
>
> I want to give you an example to let you know more.
>
> I have a ASRock AD2550B-ITX board[1],
> When another discrete video card is mounted into it mini PCIe slot or 
> PCI slot,
> The IGD cannot be the primary display adapter anymore. The display is 
> totally black.
> I have try to draft a few trivial patch to help fix this[2].
>
> And I want to use the IGD as primary, does this count as an issue?

No, this is completely expected behavior and a limitation of the 
hardware design.

As far as I know both AMD and Intel GPUs work the same here.

Regards,
Christian.

>
> [1] https://www.asrock.com/mb/Intel/AD2550-ITX/
> [2] https://patchwork.freedesktop.org/series/123073/
>

