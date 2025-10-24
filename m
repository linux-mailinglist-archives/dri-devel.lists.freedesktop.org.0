Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63BC0752C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C841510E216;
	Fri, 24 Oct 2025 16:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gBpYYLt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013062.outbound.protection.outlook.com
 [40.93.196.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD3E89701;
 Fri, 24 Oct 2025 16:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5T85Hka5WyNiIO4vLef5u97Yy1Pb1g1PGyGJpgDC6mms1Du+YgI0y2qVftz85OZrGOR3D9y6jbnD1tfgQs4ZhFD+ZeNRpW7ZsE4GUM9T/Epjs6Zm/9j7/q0jnV2DSbdbLkcpAOV637830S7a2SIQrlvzpUvCscDSFz8ZVMdkVVrqLgO2eYPDQgX2mb8pUDPktbdXBrNVonM72LoRR4hXJuxyulyypfffykS27A1aWrX4HZ0nh5Nr+r7bVc0kz3Sknrwi3I6UofoPnORB9CsJ6o3oS7ZfPZWBKWyiYFekS4M7ebbDZk3O9MH861fFOA8x3OY/g+dDu20gpJYs7NiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLkOT4z/eOghfZIZEBE5jptPfwoAac+OuX4VrvwkZtc=;
 b=q2UF9x5v5v6C2wq/lutSh19tu/mqlkJvrJ6ey1kSmBXPSj+rqW9yD9RcoEnWMxcwUqHLV1xbrSCkAk96vytFgng7SgB2xG0PMc8vy/tP0coBzlkTVh82kVveJzJuPocYrPgXV/+BGvl8eRftHpt7rsxaSSKjTLOrl+Lg+kD6EsBvjL1erpeoFthKirvoRJaAcBsyrah2P6fCGnXgZrBJFP9E/UJJvT1fsi3aY2NisFmph14yUIWG7Vb44tuvWIdNDZxfdu9y7z8SwX0BOQR1xkiVZdUKe0i6wUDQPmFRg7HN1Ukxyc2sHPp6LB+KxzE+QVlu0qWRUzeX3Ampz0qrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLkOT4z/eOghfZIZEBE5jptPfwoAac+OuX4VrvwkZtc=;
 b=gBpYYLt+fpGhoJAWDtolBAedqCZOO3vB5/Fc+2p5XBf/MPZo/p1MHB4Y7wsiRjZGXMPw/8supRiglHXeB3GRFr6ZlsRRqawQQmJPor6hEcXLbOGLZOV6sjoaKwYG/qi1MeZYc2W71u8jyL4eLyaZYNdK5Ud5nxvIxlpxUhSi4BE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:32:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:32:04 +0000
Message-ID: <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
Date: Fri, 24 Oct 2025 11:32:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Perry Yuan
 <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 97568012-3e5b-4797-74e0-08de131addd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGF6WXQ1OUJTTldXVGIzTURjNyt0cERXbFVwc1hNZUxpRG1CT1FWdmxIMHhn?=
 =?utf-8?B?bWFQOU1HMHhQQkdKaHV1bkFKZzlWZFlVcHVwY0k5TW41djRneWVGZkd1UHpt?=
 =?utf-8?B?dy80WnhIODl4R2RMKzlmYnkya0pjVE56N1R5dkgyR2ZEUlpaSEpkSmNYTUxL?=
 =?utf-8?B?M0syNTRXd2dRL0ljaVluUjZIZ0MyOVlBQnhqK25ZeU1oSEFiSjhPN3dsWXJP?=
 =?utf-8?B?STJVWGcwaUkrb2xna0lXczVydnYzYmdDUkdwcmh0dE9XY0lHYVlrUjBMR2tl?=
 =?utf-8?B?VjBKYmJIUGh3V3JKekhoZzlvUlUrNzNaOXhtWVgrTlQ3WC9PVjdGVUdQZldY?=
 =?utf-8?B?RHozS2pmdmlBQm84b0pmMit4bzBDUWVRZWRNbGc1aFRSVEQzQ0Z0WEVIU3ps?=
 =?utf-8?B?OWFYZ2VROEsvT1VFUnE4SDZ6OUxhK2JHVW5EanpHRnh1K2c2Ull1b01NeDRs?=
 =?utf-8?B?Q3ZseUh4Yk9od0lOYXNySVBhUzVDbVl6RWJ6V3NJZCtUSnYzRFdLZTBCTnNO?=
 =?utf-8?B?NTd6bGRHMVBka01LK1JXUW16bDJXOHUzcXYxM3pWQytRMHFHaVBwczF4eHNk?=
 =?utf-8?B?QVBTeis5dEE5STBVNHMxRy9DcHo0VXoyR0JWMC90SHFvbTExLy9pRVVQNENw?=
 =?utf-8?B?ZDBVaXQ3VWZGdGFEekNQZXBiVWczTHNRSnpNbTEyMks1anVaZDlGMXNwSGRk?=
 =?utf-8?B?RW50azZ4MHZOSC9OMGZZelAzUlZBT3BjTi9ER2VKYVBlSTlhUGtOYmNYcGtQ?=
 =?utf-8?B?WXgwd0RXUEpaUGdROGp1cTdlNkRienZ4amlvRTFuZExJRHByUmlEb1huaGtC?=
 =?utf-8?B?UmhYanphS2prL204QU5oLzZTUXlZT3VYOUdFaFVDT2N4RnVqc3NYOUo5cXN2?=
 =?utf-8?B?c0M5TU1Qb1FNWmJJNkhtL2R6Mm0wWGFXdzlEYkxlYzN2YjJ2cDdocG0xVWdi?=
 =?utf-8?B?SFAwbm8rM1RDdFhqS3c3N0lYU05PZ2tkcEUzT1lHb3BiQ3N2UGEyZVVjeWUw?=
 =?utf-8?B?QzNBek4wQTVDUUhkZkJXU1E3YTZhWS9HT2dCOVBOeDQ1amZLcmovVmFDS2Vs?=
 =?utf-8?B?elJRNWJNKy9vL2JCTTBpb2ljc1pxYlNDQ0hYalYybnh0WisvTndPZTc1QjFt?=
 =?utf-8?B?cFpaejVxcUdyc1NMRFNpdmNNeXVtUmxzZmpTS296aTZ0K015RGVWcTM4K25E?=
 =?utf-8?B?T3B0ZXlaa3ArU3ZRKzB3S0Vua0NaZUpWSjhyd3RSNHFjR2s0ODAxblNWb2g2?=
 =?utf-8?B?a1VldWxqa2JidUFvYTlFRHVRMlFWVFFzZ0YwZklvRnJzVklXdjgxYmxSSk9m?=
 =?utf-8?B?S25JYU9lcFl6K2JIZktXbVFxMjZWVS9QeEF3bFJjQTBHejZqRG5jeWdTVnJ6?=
 =?utf-8?B?UFMwR1dCTUVuandrcjBJc3d2Y2YvdWVLRk5vTGZoWis2OGlFNjEyUjN6ZERQ?=
 =?utf-8?B?OHNySTBpOGVaOU8zZXhTYWcrMkxCcEJVeEpJQnhpMGEzUXhsZWkwdGhnbSs0?=
 =?utf-8?B?NTNINDR0aTlwazl6VkxMOHZEUmRFV1hldVd2cTVKQnNmS0hTUUt0MnhNVUtC?=
 =?utf-8?B?dStacThBWWRBNGRtRFZsZ25HWFBZMmNmdGZpYlhFQzZESXl1WTAxWGpKRzJG?=
 =?utf-8?B?dFM3bDRJcHpsZTM3OVUxU1dqdjZYQTB2N2tLY3JDVkV6QnFQcmsrSWo1ZjV6?=
 =?utf-8?B?aDBHcWRROHA3aU9YdGdvc1ZkM2ZlVXFjZnp5dTE4dlBFMW43c1hyZnhkNjZw?=
 =?utf-8?B?cmJDOVpNZC91S2J0cm9sNGJjWUVXU2d0emVDOExBemlTVWw4eUthUk9PNnE5?=
 =?utf-8?B?THdnNkVpNGM2eUFzMWhXYjZsNEp5NHgxRGZVeXQ3cDZOdmxvRjFHOEpLWDdL?=
 =?utf-8?B?MFpXQnNqMHpCZTVjaDlRZTA2WGtsYmpLR3Y1bVB3aUt2c1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R002c2c0T2FRc3BRWkpUcUdpb1lnbysrbmF3N1lEZzJJcXFFVysxWG84RkNF?=
 =?utf-8?B?RVRuVHZmYTJFSWxUWXNFUnhuZnYvZUd2d3U3NHYrQUt6VlI2VmNDZDBuK3R5?=
 =?utf-8?B?U0tiT2ROSnVhVkJHUXNQWlFLUkMwVHhmU25ST2NCeHRMaTNRbG1JMVNONmNt?=
 =?utf-8?B?RnFZVVR0MmJ6L0ZpMXVreDU1TkhQZzMyb3RvRXF3b1NSSHhqd3c3Wk1KV3BF?=
 =?utf-8?B?NjNwSVZ4bnV4V21kMS9FNnZERVc5eUwrTms5L212Zit4aUFjbkpxTDNhNGFw?=
 =?utf-8?B?Qk9QbU5EaFZqb1h3MmVjc3NzRDA0dlYrTGVHdjUyaEw3UUtPeUNWY0RudWJ6?=
 =?utf-8?B?aU1QakJHbUtNTkNkTjdoY0NLVStSU2xoZ0orUjNLVXZYb2kvcGVrb1VrTkNP?=
 =?utf-8?B?UDZuZnNjNUFnVHFYcUFpcW5BbGpJNUlHUklSL3VCdHdZRGhWYTRpeXQvY2VJ?=
 =?utf-8?B?ZnF6emVneHkrUCtSNGxuSnUzdFVtVHVYT2k2ejFmTUdMQnBSVXlEdGg4VWgz?=
 =?utf-8?B?NmV0ZE5FWVM2b1VZZDNtKy8vS0FFR1UwTXJ4bkpFU1dKN2FvY2FBbE52dmxQ?=
 =?utf-8?B?YStYTFE5R05TZzEzUUxGSWh6Y0w5cklKQWt4Q3ZOUW9QbjZKN3dubHdudWUy?=
 =?utf-8?B?QzBKbTVYaFBHb0lUWVJCb2RBRWJqQmxPMlA0ZjFHYUNlUjdVSUowS01oQUFZ?=
 =?utf-8?B?amZucWlHT1F5WlJJcUttaUFCZ291ZlFvOTFmY0N3UjlYK203TVdUSUZHcVQx?=
 =?utf-8?B?eGp1NkJnUlF5REpQUFhnVk5hS1NBNFY4eWhjQnIwV3o1UFpuN2pjcEpyc1pQ?=
 =?utf-8?B?MStVTUh2ZGJSZHQzSStGVXQrZlc4V3lLbk1JU2xBaWZsVUIwNURwQzltN296?=
 =?utf-8?B?UGcwcno3VGVwZDcvbDMwYTBLUmpmejZTSlZUUHNESjB4ZHlBVUV1aml1c1FR?=
 =?utf-8?B?NTU3SUREQWpvT1pLRXNrT1BYN2RkZEtKR25mZzMzdEEvcU1kRGJmbm5ydFFi?=
 =?utf-8?B?Y041WlcrS3ZRSUlvMzkzSXBQS0ZBa3RLVk5PSE1GOFAvYkZjSkl5R1NBK2w2?=
 =?utf-8?B?RnhmQkRhaXl2QXo0WjVvQkEwZkQ3RzNjU0RHKzk2QWVOT1ptT1BkcDk4MFk3?=
 =?utf-8?B?dDRPdWxBenBmcFVYVU12YmpORmI4bWVYOGxvb3owaGQ5ZndHaVpGOFdQRTNE?=
 =?utf-8?B?ZThsRGV0TWFyd2Y5OHF2WmtIRXhEdXU0ellBcGV1YkF6MWJVZExFZmhKanR4?=
 =?utf-8?B?U0hpMFpvR0t2WnBmUXU3TG9zSW1QUGN1aXNRYW5adTZLUWFqVWZ1ZkhVbWxQ?=
 =?utf-8?B?a082MnpIcVRCNEdhYnVlZGo4MXdaeTVxR0tCemhIcmFTNy9xbjlJbWowaDFk?=
 =?utf-8?B?cEtkbWlQMTh0RkFSRGo4MzFuRlhDSjJDb1BkaWRXbWhnMCt4RDFGdkVyOVUz?=
 =?utf-8?B?dTg5dHhoRVFIVS9zQjNmbWNReXJ6VUJOOXd0bnk5UkRaYzNYSmRNVjQrOUZ2?=
 =?utf-8?B?OHlNQTYwYXlKclNYWEhXdW1aVjBieCtyL2JweTYrOVNKR1VyYzNDVjVYVE1T?=
 =?utf-8?B?M3RDTzgyWGI4MzJNZ3Q2OGQ5RTVubGwzYjJCMW42bjI1akVDeHZVUk1LOUFj?=
 =?utf-8?B?bGRlUkcrV09ta2cxV2lFUDl0MEFvcHlVWkpDVGg1WlQ3VkU3UnNnVVpTeGN2?=
 =?utf-8?B?amwzSng4OSszRlB4a0VIVktpRjdNTVJyMmxLOTNzblY2NzU4LzgwcXBKYWg3?=
 =?utf-8?B?M2JObElTRnY2dStmeXNxTkJWV1J1Q3VDbktoYkVjM0tyVzhaWWJxK21VUnZC?=
 =?utf-8?B?cEtLVEhDdHVqYllUcTZzaGhtVkEzdWZraW84YjV1KzRuN1JoWEk0S3BPbitH?=
 =?utf-8?B?NERmTWV4VEkyN3BUY2VuRnlJZlRkTk1SbFVKQzNQckJ4d2tWS2xBUFpPNnJK?=
 =?utf-8?B?cXhXZFN4VzVkb1FmVWZWNmtPRzZOZXJ6R0gzTS9ydlN3ZWFIbWp4UmdDUFZw?=
 =?utf-8?B?REJKNHh1aGlIeFkxaUxSS1hBVlRzWGNwNGlzRkV6Z3A5bGo0MVpHQURZdnpm?=
 =?utf-8?B?TnJvelZCdno1aXRnM2RRcEtKOTZWZjFxWGgzWEwzbGMyL1Y3ckNUNk94em5C?=
 =?utf-8?Q?J0y1omgzt3GsWPJAPiBFweC2T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97568012-3e5b-4797-74e0-08de131addd5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:32:04.6708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaTXxT/OSB2RuhGWWPfKGO7gAHnhWe0Rudzf1JC5gGW0yMbg724K8wroFdZUe5Qcp4lCsPPvk+f9P89BBbHfzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475
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



On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
>>> this support was dropped by the Xbox Ally which only S0ix suspend.
>>>
>>> Since the handler is missing here, this causes the device to not suspend
>>> and the AMD GPU driver to crash while trying to resume afterwards due to
>>> a power hang.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
>>>    2 files changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>> index bd318fd02ccf..cae3fcafd4d7 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>>        switch (dev->cpu_id) {
>>>        case AMD_CPU_ID_PCO:
>>>        case AMD_CPU_ID_RN:
>>> +     case AMD_CPU_ID_VG:
>>>        case AMD_CPU_ID_YC:
>>>        case AMD_CPU_ID_CB:
>>>                dev->num_ips = 12;
>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>>>        case AMD_CPU_ID_PCO:
>>>                return MSG_OS_HINT_PCO;
>>>        case AMD_CPU_ID_RN:
>>> +     case AMD_CPU_ID_VG:
>>>        case AMD_CPU_ID_YC:
>>>        case AMD_CPU_ID_CB:
>>>        case AMD_CPU_ID_PS:
>>> @@ -717,6 +719,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>>>        { }
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>>> index 62f3e51020fd..fe3f53eb5955 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>    #define AMD_CPU_ID_RN                       0x1630
>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
>>> +#define AMD_CPU_ID_VG                        0x1645
>>
>> Can you see if 0xF14 gives you a reasonable value for the idle mask if
>> you add it to amd_pmc_idlemask_read()?  Make a new define for it though,
>> it shouldn't use the same define as 0x1a platforms.
> 
> It does not work. Reports 0. I also tested the other ones, but the
> 0x1a was the same as you said. All report 0x0.

It's possible the platform doesn't report an idle mask.

0xF14 is where I would have expected it to report.

Shyam - can you look into this to see if it's in a different place than 
0xF14 for Van Gogh?

> 
> Any idea why the OS hint only works 90% of the time?

If we get the idle mask reporting working we would have a better idea if 
that is what is reported wrong.

If I was to guess though; maybe GFX is still active.

Depending upon what's going wrong smu_fw_info might have some more 
information too.
> 
>>>    #define AMD_CPU_ID_YC                       0x14B5
>>>    #define AMD_CPU_ID_CB                       0x14D8
>>>    #define AMD_CPU_ID_PS                       0x14E8
>>
>>
> 

