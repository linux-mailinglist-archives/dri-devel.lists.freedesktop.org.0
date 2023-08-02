Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766776CCC1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23FE10E0D4;
	Wed,  2 Aug 2023 12:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2070.outbound.protection.outlook.com [40.107.8.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1147D10E0C7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 12:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7EV/4z4Q225YG+/YBqsmThvdmr8DD7jbJd87kIsrODlTvRakbBf1PVnnHMQM6tbIGIUoBa31H2j3J7pXjP7l5xAfZr3w1k8MLL57Hoazwi6+ZIALrQ142Z4Mkd+KNyylotANF5AtOHcjZMAEhL9rQjBtd0e0/j0eV9Co02KANyI5D740At+zmFjYocRVJC1KABUESDptO6TGXTrCRWlQVmPxUrSZgi6D+kcUTzYUL7YtQ1p2zXL7ICz/+xwJfjBpcRNTHtzjPeNrRsb7RQwTSHaZhu5LmRmz6TqnyobZQkqeCyVEc4X9z+M61Qt15p9hKrK5W0hsZtrt66zf4LCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4LKmNJ/1Jq055Wn1u3vibA8cJx1wcAzHONwKC8UVqo=;
 b=elFspI+RTnDvoxnZNCZRQjAOU4MSF6VQUapOOzsT1ArhldHEArdXq3BHQ+T/iTVYGkNviYQ9lglbvGhzG/r3tR9L5dvjDgu3997HcBqZ9CX3PD6N4hTJ2SczU82qVcf1cBxY2bJSaTxq/uMUWdvi86960f25RV6PcTEXpumZQCqoygUjIGMqPPTyzR9B4OnR2aop/bc6jNP40asf4PFwNtTVhKqVATVydEnlfYzOSLKboMVX3UDZc7xU5SepeJg/s2raNnj7E0PhtckQREiq03xtSVPQi+cpgFfdkH4qSmwBycKwtVWKhhtLgbPcgUSxdk2KCukqnYjvs1ozMWxpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4LKmNJ/1Jq055Wn1u3vibA8cJx1wcAzHONwKC8UVqo=;
 b=dqCm2XjhRjZ5RFEaYF9gyrZ0ZKT2Z3YqKSq5PLMjSosTo5JiAqG5gJNWGTTo78aMOqll6fK+OqVy98dJGW1CfDaFab4HA6QmX19uZPyw9pG6gf1I+x29xlURvcSc9LDCHOF14zAAKzh8AovhHjvy4sHzZRO5dKTgoL8IuaIKoK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com (2603:10a6:150:d2::10)
 by AM9PR08MB6147.eurprd08.prod.outlook.com (2603:10a6:20b:2da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 12:34:34 +0000
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66]) by GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 12:34:33 +0000
Message-ID: <097de164-6d62-6a1d-f7b5-cbd7d4408ab7@wolfvision.net>
Date: Wed, 2 Aug 2023 14:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 3/4] drm/panel: sitronix-st7789v: add support for partial
 mode
To: Maxime Ripard <mripard@kernel.org>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <20230718-feature-lcd-panel-v1-3-e9a85d5374fd@wolfvision.net>
 <tbdwgfr4rqgytttoxhidsil42mda77qj3qmhw2do3k5rmwsaeh@qronuzdubv6q>
Content-Language: en-US
In-Reply-To: <tbdwgfr4rqgytttoxhidsil42mda77qj3qmhw2do3k5rmwsaeh@qronuzdubv6q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0188.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::20) To GV2PR08MB9158.eurprd08.prod.outlook.com
 (2603:10a6:150:d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB9158:EE_|AM9PR08MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: beb24c9a-1a04-4912-1205-08db9354d378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AtqYJiBnxn+8VSYMOVsSQvZO+8K8ACpVkvEwLHapEVRWxXrDxJn25YQE0KaTaXN8zhKCf0ksrlv8dzbC3minSmn2DdwafgfYf6/+P9iWKmPhbzw0b5gTzV3Ras7JNRoxFd0wVo7IWtMKv+ijAI4ba5Vu6pogO0NSUcMEmXUybkNY8FP5SVmH8q5qlxaMs+MHQ2opElkh3epFPVStezBWkGDXbPdtcnbWqpzoeN2ksb4uR37LFEna8AMRxbZQa67+0G+GP8MHB5Uq7mw186z69MbY25AtFWeRaqRqZqQlLXFmfaoRLl6PIXKbITgfIygXrs3tg7SiTulM4Qtv5nIC+TqojMz7iQgPeCKrXJ+95UGfAK4NW1/qya1/3Rt0EwAOstNwj8y3ycw8KjkMCzh73LxEn3lJjyF8hDZeFlmAsXBXAGC1pouq9WbbIVx+CLFP8PQiL9/8SH/1M/bq46R0baJZXVBoFT34ORQaVcM7u4UZ2xoL061ei53tNWuYvxObucFZhAB5vMBxBYXWrvhlrVzhGVHVX7D5994h+kjtTMoH36iA3uOc4aIEIw42ELmr4ht2eLmUbyOXmVEOae77Y8r+DkGP1Lx+QfiZmLVxm4276TXHlbDezmgiwC9WtYoup5uKs1hWQSpc2onNUYOVqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR08MB9158.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39850400004)(366004)(136003)(396003)(451199021)(478600001)(86362001)(31696002)(6512007)(966005)(36756003)(6666004)(6486002)(316002)(8676002)(8936002)(41300700001)(5660300002)(31686004)(6916009)(4326008)(44832011)(66556008)(66476007)(7416002)(54906003)(2906002)(38100700002)(66946007)(2616005)(186003)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTRMNzArN1kxdUMwTnBMWElPVHFnM0FiVy81V3RqUUlBZXRLZVNSeWJlY2xO?=
 =?utf-8?B?M2p1djZwR1hFeFI0WnhYL2FQamFkcUZVWXM5THd3NUlFWmpSMGcvZG1hMjdj?=
 =?utf-8?B?WjVBRWRDSy95VVVJVmNBL1IyNFowZ2tQRVpzMmNSY0pCb0FTSHhHN0tXNXZr?=
 =?utf-8?B?YWFGeFJYNHA5TGJyOUNEV09IK3VQMlIzbXd1RlhtQ1RXLzRWYWlieGVBeGJ4?=
 =?utf-8?B?WnJUR3MrZkJrdDV0d2tOaUg0VitpSlMxU1UrcDRzVlp2anJsNFdCWnpGVGxq?=
 =?utf-8?B?Mmg5aWpScDdUUkZLVytFQjgwUVJBTkEzeUgzMFFJM2R2TmlLZld0WC94bnkw?=
 =?utf-8?B?THFyMlA2aEszS1E2QnJwL2RjMzUwYjA4NGZKYzVrL0s4bTYvY2NTN3g3Wmdq?=
 =?utf-8?B?SFFHMytiWEk1L2ZpUUtiNk9oNUJFUkVHbzFBSlIvRXEyam0wUlhBSlF4Nk5m?=
 =?utf-8?B?MXJsZkcwWlVuL0E5QTN2WStIbGhkc0hzVFRhRzdjTWJaQVFZajNqc1VWbkJD?=
 =?utf-8?B?bmlwM2h2TXNtblo4OFJwWUQxUFZzc3VXZ21QQkE3Q01nNnBFNkw5czBWUkdU?=
 =?utf-8?B?emlSUDYxWXVzMUIyNWFrbkgxQlRYVWI0VXp3VjRrakd0QkZ4ankySmd6NW43?=
 =?utf-8?B?aVFCZDJITnluWkFBaUJzb0tNSm9kSnJ4R3gyUGRFY0FRVkZ0bE1QZXlFNkpp?=
 =?utf-8?B?OE4wd21MbExwdXJQSjMxTHUwa3NQOTFpUzRNT3JOMlFyaHZTWUdFTDZlSloy?=
 =?utf-8?B?Mi9yTnpaSUhsOUNnS1hLdkRoWkkyNkEzWXRLb3JpN2hvakkrMUorRXVIZVIx?=
 =?utf-8?B?R0NJNDdML09yelJLZVN5a0Z0OGRzZ081OHZNQWtCYjRDQTlIVDRqOEV4dkxR?=
 =?utf-8?B?UVVzbk1VNkZIaGppTjJhc0VpZE5hVWN5STZvVFE4RE5UWFZ1bGh5em03eExx?=
 =?utf-8?B?cWk0azBkdURzQkkyYUdQa3ovY3kwVzJMMlEyenZYR0owdEZydlc5bk5haHJq?=
 =?utf-8?B?bkJvY0hkSmxsRk1UZHVsZFBjOEFDa2RhemhXdFlSbWxqNS8xd2wvRlRkWjB5?=
 =?utf-8?B?blEycFg4Ly9GbXRPWDdhVlRUUTVSMFBGOG5UOVlOYzJpc2l1REJEcmVZUyt0?=
 =?utf-8?B?SlpmTVFIUVBoS0sxdlRNaGMvWS8vbGNEZWcrQmF5d3Z1RXpxRXZuWExqcHVX?=
 =?utf-8?B?bHJxaUtTOHYyQkNiTXJYeW1tZUIxV3RSY0J3OFd5TythdGtUeGdXT2dpOHVB?=
 =?utf-8?B?RkhOdzBXKzIraGM3ZzhqNWw4VG9kRU5KYi9GMVBzRTFrQ1B3cUx6TjJxcVJz?=
 =?utf-8?B?blVSQy9oeVhxWlNqUklPd3F1T0wrNnlqZzBoZ3A4VlBPdzlvYjQ2YmZqbW05?=
 =?utf-8?B?REl4SW5xSzBMbXc5aWdkT2ZPM2FSQW8vVUF0c0tzTE1RZnBIbVhvZFY0Wnhz?=
 =?utf-8?B?TkNUeklzN2lrRHlueWRuVzA4YXJld2NkMVhoNzhhbnlwcFU3dXFHRDVVejQv?=
 =?utf-8?B?Qlp3dDUvTkovTmtYWXpNdkFCK285VGNWYlNUVWVpNkZJNS9Xb3k5dHJPQ0w2?=
 =?utf-8?B?ekZvWFBpMkFzb0hWem9IeXlWQnBoUXJMYjFuM0xuMGdDTzNhQm5Za3NDcmFz?=
 =?utf-8?B?TkxHS0xNczB6bDEvU3Nob01pZkd2OXZOejg1c3BJVlpKTXhtTmhpa1ZwOWFm?=
 =?utf-8?B?ZFF0SUNrMWJMUlg5Tmk4OWtPVm91Z0xpcXlJS1pWZUxCU3F5TDRiK0RVbXlR?=
 =?utf-8?B?Z3NPcmFwMzhmZXpGQ3JzWk9uVzU5Q2d5V1dzSmZ6MmVoYkNBbWpjOEZkSHVY?=
 =?utf-8?B?U0pqcm9Sbm5zdTNLOURFY1RaaVBlWW53VlNxS1hFNmpOS2trc1J1UkJnbkRG?=
 =?utf-8?B?dUdCUStUMHZVa2lXUzVReHEyRE1LZEEzN1dDdkRVM21TTFNxa0xPcjF4MTZF?=
 =?utf-8?B?WFozVEg4dTU1RWhQZVErOHZaOVc2NkpnMlNJS0xONnZQa3FQZUFsYk94dkRh?=
 =?utf-8?B?RnoxbmZJSExTQlROVHd3ZVVRZWVtTVRveFlySUJFdmQ3VzNKRUt2bnVyWkFh?=
 =?utf-8?B?M3pEVy92UzVKYTZPb09GN2RjUXhiTmN6YlRhU0tlRzVMT2FyaTdDTlhTazdk?=
 =?utf-8?B?MVRpT3ZRMDRiNDQyMXdiSFRRK2RqUWtJb2hBU3dtbkl1cmFvRVFsU2RQMnBm?=
 =?utf-8?B?U0FZbkk2Q0I1ajhHSDNnWlFOd3BmU0trb2JEZ1RwRnpDbHphSmxpRyt3TU5W?=
 =?utf-8?B?b2lYOXpyMlBmTFI0d1FLbXQveDlnPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: beb24c9a-1a04-4912-1205-08db9354d378
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB9158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 12:34:33.8959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfuDyOr0+gMs9Wba3iyCZsMJeYuRn7zfMA8tXu0pvSg/5keybr8pvOZwu2jR+Tg+6B6ZWyV7NUn9nB3HXbmxyV2oTVQUB7K983r4n4MXMbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6147
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 7/19/23 08:39, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jul 18, 2023 at 05:31:52PM +0200, Michael Riesch wrote:
>> The ST7789V controller features support for the partial mode. Here,
>> the area to be displayed can be restricted in one direction (by default,
>> in vertical direction). This is useful for panels that are partially
>> occluded by design. Add support for the partial mode.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> 
> We already had that discussion, but I think we shouldn't treat this any
> differently than overscan for other output.

Indeed we had that discussion. For reference, it can be found here:
https://lore.kernel.org/dri-devel/20230329091636.mu6ml3gvw5mvkhm4@penduick/#t
The thing is that I am still clueless how the overscan approach could work.

I found some DRM properties related to overscan/margins and I guess
userspace needs to set those. On my system weston is running. Is weston
in charge of configuring the corresponding output so that the correct
margins are applied? If so, how can this be achieved?

Will DRM handle the properties generically or does the driver need to do
some work as well?

In any case it could make sense to write the partial mode registers and
enter the effective dimensions. At least I have seen this in other panel
drivers.

Thanks and best regards,
Michael

> 
> Maxime
