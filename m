Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1B4738A98
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F126410E238;
	Wed, 21 Jun 2023 16:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF8E10E238;
 Wed, 21 Jun 2023 16:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1xmLpc+1ef5weZFgu6kVmIkGRPu/NsuOH9Ttd8AAVy5ZFHULy7Ctr2SXqBn0hJhaY8Z9sQiVspGd6duGWDqtEvVvtQOpw2Jiq7RgqfJcrCVzKRGAHGnfJByw3tsm3HHJKx/G4pO47OGegOfHRbUKCGGXH8nxWFXzzNjJy8b7VITEyINiTe1tizQMaNLXfXf1dJcMqB1g+PjZJOhntRSvnjuA51221buVpX8aBZQTCI+IfvBkLiXBvi4rKF8VHCTEElE8cuD9OAcAIYssNRz943Y9ZtkRdQ3CiE8y4Q5OCJZtp7xBWwxCxmFDnRDHk/B0wS4aHK14MBJ11FEN4lYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XuIkuVB09s2z0EXoibkagIFTtxAv4WP2pPDyyxrThI=;
 b=WoRnwhqT2Esd8RNktcLsIpNARcs/Jm23ypTAMlfqGRJ5pmKK+cna8MzCm+muOYQ/NqYPvdg0x2J40mc+eJKR6fqc2MiT+B2z2e26BtKpOIGq9DwGGgqL+fS/SnYlWUZl4gRUgd5mBrgfGgICw7rrFpuvov2zkoq8RUWQ3+z4QPLnl79LEMZ6qBV4XPjP1V04Q0Ep3/d9ZxYcpypwKpEDWq9Nr7rHUEkvwvE09p7iJnr//MjS5GyhM+EZh10qW3OqTX32UfVb9CN36zBPZUjENXwHVXStDok93l0EFsDNfbPC0+ZF25P7JnvmeZ8RqSWY9z1bphjtdOCI3W78YCZj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XuIkuVB09s2z0EXoibkagIFTtxAv4WP2pPDyyxrThI=;
 b=wSwpo+F0gqG87cDBUm4gI5LwnqC2UYoCbiq+XapIEpYXslzegdcBThn/OVeYMXEBBSiv9VgrmNEArJgC9CYgfRqjUk/TzQDU4nOX/+of/y/YVdvTCiHA8C+cPhL4HjcoF1GEADgAkochIqP7WBBViPxhauRl30PSq9OaNhaU6jU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 16:15:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 16:15:05 +0000
Message-ID: <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
Date: Wed, 21 Jun 2023 11:15:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn <andrew@lunn.ch>,
 Evan Quan <evan.quan@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0193.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c70935e-48eb-4e8f-026f-08db7272ac8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNj8/xhpnNQTd3MFZcv99BwPIF296qlnDlLXS5NC+GIqnb0HE9pjgTc1jBVIh+gUvCSIHsiuDMYuZKSmXmE/P+XGJBzk6rHKIVigotKDAcd7yQWi/Tw5YuvLbhmuMcWCpsqwB02x0PKuNAd9zZoqeAyjGhqwZYESvSyO6gbHSF1EfqO15JF6BqMVzb2vpHfvXPCYhUz8lgb7qtH1YHIxCmwRqrUBMTr1Vl2VKNt1cuMuS4+vfSmT1kqOrJ8MVPYVLJcyEeRQR+4llXHmiECTdu2d598YZcXM0me6Xk433xUqCL+A/mwTXwvCsk1sYwIgQpqaLsiDjPL/LR4w6rsax15r1ubbP4DCEotqO6XW9akaIJ55BJxs/d7mgZbBvxTOMK/3UXxO+ll+7KL/ReyDiOqZkSl/VpzNU9SUJK/8oJZx4BxymzHWoUqRFi/Ao5CEbmsKXXpRjSgrVHkqtO8OHgJfwt1uulPL9QR0dVnmjn4zTPRLcdsOMDHrSBL+/qrXyBTSo7ILk6aTZ/xOdlpUWh2i+UPZQzLJUjaHwV9VuAkMFDmKSxcaUMNBhulclbeu8DOdh73Eul6ihJSFxkWvhfA5iKyYmdYHuYDFnebx8bvud28A4ogmfqzlhTzmzK47hmzdqwz2xovv3Ke060aU+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(38100700002)(5660300002)(53546011)(26005)(6512007)(6506007)(83380400001)(186003)(2616005)(7416002)(41300700001)(2906002)(8676002)(8936002)(36756003)(6666004)(478600001)(6486002)(4326008)(6636002)(66476007)(66556008)(66946007)(316002)(31696002)(86362001)(110136005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2plNGpaeUxlRmNrOGFVcFVKYWNoeWJyZHJGay83eVYxNXNQaFV0aVRhd05K?=
 =?utf-8?B?ak9jY2preXg4Vm9UMVUxSWVtUkdtbFV2d29DVm01cTlJZnVoREdWY3pjSUVT?=
 =?utf-8?B?c0Z4dmRacnkyQnIzcHVLc2I5K1V1US8xb1NXK3czZUxtSUx3bk55eStadmN5?=
 =?utf-8?B?Nnlub3NlK1NDTkp0L1o5cHIyU3lvQUFHU1Q5dEEyeWFxNXJ5ZnMwbDBtUjFh?=
 =?utf-8?B?Z1Y3UUNwRU1FUnRFYWtZdWJHVTZjVHlsQURydG5GQjgreCtobS8xMmpBd2Rw?=
 =?utf-8?B?KzRJNjF5d1hvZDJjWVpRTnVqRnN6VFJ2SThXNmhHaHJwL1J5elBwRktnTDhN?=
 =?utf-8?B?KytjK0s2QnA1bGQ4MjNIaytYdTZuUHB5MjQvL3QxbmtPSldRbFhnRW5sdzN5?=
 =?utf-8?B?VDJmU284NHh5SGVCdEdGTVd4MDdFZDF5L2d4UWx5eldXVmRLd2p1QWZnNWUr?=
 =?utf-8?B?dXJ1OWpMRWc4OW5TTkxRQ04zc01XVzhkOWRHaWJHdzJacTB1WVBYeXp5Qkxa?=
 =?utf-8?B?NTZuUlR0b0tjNzkzY1lIMWUrMU12MzNrcVcvSDRLcGg5RTJyVFRRUjBNNkY1?=
 =?utf-8?B?MXlkL3NpMURzWERHUjJIZkViazQzTlRCZ01wRnE4NCs5d2ZsdUFiUEhjWlZm?=
 =?utf-8?B?ZUxXdmZvYnZ6K2xjVmVQYjZENGdLdFFmQWwyVjdjZzcybzZSOW1kV0Q2Z0Rt?=
 =?utf-8?B?eDRqcmlPbUNibCtlVU1OVUtDa1RaTDFZTFdhYklQamw0dWVXWWxHbDZtWisz?=
 =?utf-8?B?c2pHOTFFT1E5YmdtdHZKbTRkclJpQUhiblEyL2hYWTd4cEhiWTJWYjlaQW1Y?=
 =?utf-8?B?NUJEV1ArMnBIQ0QrWG5yV0o3aTNHS3AyL25GMThrMVR5UE9nN2tGcEEwM3Vo?=
 =?utf-8?B?SXl0MHYxZldCWFdBR1RSbTFoZWc0dEdidXU2dy9JSGNXUWcrSEZDZ21XRCtt?=
 =?utf-8?B?bDJCN2RnNnYzc21MMk8wN05ZUnZoU0JCempLTWVpZThjZlRxRmthaXl2MG9F?=
 =?utf-8?B?YWtSUExlUDlLVG5pOW8vZVRLTExjbXhhOGZEekV6UytZczlmeXAvU2o3YnYr?=
 =?utf-8?B?aS9JTjRrT2xJT2VVRUhFdmgya0EzMGJoeVdtdlNVSVZjalFGS25zZUp5bmhh?=
 =?utf-8?B?bW1xUGQvZ3BpaFVVWk55eVVzNkVRcktBTzhuVGdNSnUyZWFkYjkyVTR2YUJG?=
 =?utf-8?B?MGhuZzNLTjlFUmpJQlU5bkc2UG1lT0tScVArRGE3N2gwSjFwMjcwVXNwRk5D?=
 =?utf-8?B?R21XT0JsWG9sQkJ2T2xxUWh1cTAya2RDejVjbzFGL21EREpiamd0bzZ4OU5D?=
 =?utf-8?B?andyNmNTeEw5cTQvQkRuZ0t2ZTc3STVLS0xxc1pnZnFnRHhOL2lsN29BWllZ?=
 =?utf-8?B?QjBHQ0NCcWpLVUp0WGpPOTE0LzdDdi9DZk05WFZmUUpIN1JNS3ZjOU9CeWJm?=
 =?utf-8?B?ZXVOM2g2YXJtK3ZweWdFYlQwY1NvUWtnS1BQZm5yREttcnU1c2VPSWo5T0Np?=
 =?utf-8?B?bEhWK0hocGlSdEtJbTJUdGs3M2dqRGN2VTg1aTMyd0Z5UEVRNHpwUkFvRzls?=
 =?utf-8?B?NGNBRmJYUS9iM1Y5THlia0pKKzZqclEyUU5aNTRBOFl6dmthWnR3emxZSTcy?=
 =?utf-8?B?THg4ZzhYSms3MFp1dExCWEJRZGdlbU1vZXV0Y2U0SFEzV1pQaE92L2U3cU8z?=
 =?utf-8?B?WHJyUHU5UzFPNjVEcmNkeTFrZ05pRFVYNVlvWGo0MnR3KzRiZk1XVXNicWVB?=
 =?utf-8?B?UnRleEZNdDE1TnU2dy8xSXZQTmxFU0RyRTRXc2NzTFBXYkNjbFMyT0crU1Vp?=
 =?utf-8?B?RVpwV1NROXJUcXpMaVdGaTN4eWNPb3J0MHpRSHVsZWhHTDhPRUZMOU9FeGVD?=
 =?utf-8?B?dEhLWSsrTXh0U1JPMnZkY3VscmZrRzY3MmFqMnMyc1ZWaVRCT2tNOHRIVzBp?=
 =?utf-8?B?cHFLT3ArTi9IMUhHTGpUY0hnajBZc3VGMEZvbWtiY3p6WkFWT2Jla1RpSERZ?=
 =?utf-8?B?MG1QMDJpSk9sbkxPNG83S21RQk1neStFZTNnY014TlhBWjQzVzQrSFNuVWhH?=
 =?utf-8?B?cDNyNUhOOVZHTzJBV0ZsN3loL2MzTmNUNUhMWDBBU0h4T0w5VlJNSytrTnJr?=
 =?utf-8?Q?3k+8C/2FQKzWb5hwJlMrWKC/q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c70935e-48eb-4e8f-026f-08db7272ac8d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:15:05.1658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCcOnNKscodZcJZ3WJUzqWYGQI1IEtArbgmYSfl+Uf0qqlHf1iyRsMTcNs4PSfXqWv6fCVGaH9RcZhE4WeZbDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602
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
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, christian.koenig@amd.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2023 10:39 AM, Johannes Berg wrote:
> On Wed, 2023-06-21 at 17:36 +0200, Andrew Lunn wrote:
>> On Wed, Jun 21, 2023 at 01:45:56PM +0800, Evan Quan wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> Due to electrical and mechanical constraints in certain platform designs
>>> there may be likely interference of relatively high-powered harmonics of
>>> the (G-)DDR memory clocks with local radio module frequency bands used
>>> by Wifi 6/6e/7.
>>>
>>> To mitigate this, AMD has introduced an ACPI based mechanism that
>>> devices can use to notify active use of particular frequencies so
>>> that devices can make relative internal adjustments as necessary
>>> to avoid this resonance.
>> Do only ACPI based systems have:
>>
>>     interference of relatively high-powered harmonics of the (G-)DDR
>>     memory clocks with local radio module frequency bands used by
>>     Wifi 6/6e/7."
>>
>> Could Device Tree based systems not experience this problem?
> They could, of course, but they'd need some other driver to change
> _something_ in the system? I don't even know what this is doing
> precisely under the hood in the ACPI BIOS, perhaps it adjusts the DDR
> memory clock frequency in response to WiFi using a frequency that will
> cause interference with harmonics.

The way that WBRF has been architected, it's intended to be able
to scale to any type of device pair that has harmonic issues.

In the first use (Wifi 6e + specific AMD dGPUs) that matches this
series BIOS has the following purposes:

1) The existence of _DSM indicates that the system may not have
adequate shielding and should be using these mitigations.

2) Notification mechanism of frequency use.

For the first problematic devices we *could* have done notifications
entirely in native Linux kernel code with notifier chains.
However that still means you need a hint from the platform that the
functionality is needed like a _DSD bit.

It's also done this way so that AML could do some of the notifications
directly to applicable devices in the future without needing "consumer"
driver participation.

>>> +/**
>>> + * APIs needed by drivers/subsystems for contributing frequencies:
>>> + * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
>>> + * If adding frequencies, then call `wbrf_add_exclusion` with the
>>> + * start and end points specified for the frequency ranges added.
>>> + * If removing frequencies, then call `wbrf_remove_exclusion` with
>>> + * start and end points specified for the frequency ranges added.
>>> + */
>>> +bool wbrf_supported_producer(struct acpi_device *adev);
>>> +int wbrf_add_exclusion(struct acpi_device *adev,
>>> +		       struct wbrf_ranges_in *in);
>>> +int wbrf_remove_exclusion(struct acpi_device *adev,
>>> +			  struct wbrf_ranges_in *in);
>> Could struct device be used here, to make the API agnostic to where
>> the information is coming from? That would then allow somebody in the
>> future to implement a device tree based information provider.
> That does make sense, and it wouldn't even be that much harder if we
> assume in a given platform there's only one provider - but once you go
> beyond that these would need to call function pointers I guess? Though
> that could be left for "future improvement" too.
>
> johannes

There's more to it than just sending in the frequency that is
added or removed.  The notification path comes from ACPI as well.

This first implementation only has one provider and consumer
but yes, we envision that there could be multiple of each party
and that AML may be the mechanism for some consumers to react.

