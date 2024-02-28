Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DA86B8D7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 21:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241110E2A1;
	Wed, 28 Feb 2024 20:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Szwlaen6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2122.outbound.protection.outlook.com [40.107.241.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFA810E2A1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 20:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/eO3PjJTT6bBzs1D2853TDN6qsM757QLa77OCbrGCjUnBe2TYiqJWkxZtrWJzxGmhQ51gYWxiP1hmYTFwFecrPz1WdE1/21+Ou8v2XMWEZyh1KQvhY+yg0h5siDTJlTJyxJ2OQITM9WbUmKlGKmCuCZ90qxbmgIz1rYbbaP0dfFTFh6BhuU7CDC/Lh5fvy2U1r39FeWSGeIy7W89te07AtQVidLxxpsHGSRIMEQeahVRCNcGT1vgjiP8rsLmhKuOF7sM1VC7TAO9D0RR2bKs8i+MMdQBV7cjGgah42+vTBRz9JkfwHlHVqMf/LXnTu6AOOcJm9RFpsoJByHhub19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgHzYPxRXqzgVmM835etgMzjz3/Zb9jEr4WnIXJipwk=;
 b=XIyY+kBfVIZF4UD2pHZDcb1jbUFuP1zTQXna1x7rP4akhqJozOZb3bGV3gTWvem/ldcYM/JtI6jkI/VrNyWEknyZJOar5NHhC0GmMl2GU3kW9OIFpgc8aW03aWr6qvC9+Ca8S8bF/mm+kWWhg+qOMY1x1BH9L8VssA8MbtmT3V0eZ6Q9GsDMRvK3lQcZrYsbbn/ZkwGJDq4b4sM+UTgHfZae9NYdfSplUF5HWg4/oM912euidLY1eVUQWd+pE9eoNqriLokfy8Qt93f67gI4r3nEDOlgtXZGvRquPjOWfC8y+oy5kwu5FGCI/ngR9CBcJN3jZqCJTDlm7NsyIT39yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgHzYPxRXqzgVmM835etgMzjz3/Zb9jEr4WnIXJipwk=;
 b=Szwlaen67kK/8OZWJE9O3QPbCiggVkmh7lDgsbK8S4OwgAsXU3ADnsLTukvJBypsrmVs+mO0trbPhyQ1yhn3Mli45g9pw9Lb6AYO2m9IPnAN+mEiqAcun3FA7CtP5QECLqklP1I8OJsqlSWijq7u8A8/Vhduo+hkaw6ppyle54I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PAWPR08MB9590.eurprd08.prod.outlook.com (2603:10a6:102:2e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 20:10:19 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 20:10:19 +0000
Message-ID: <26262e37-55e8-4488-9489-51e640ba1586@wolfvision.net>
Date: Wed, 28 Feb 2024 21:10:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] usb: misc: onboard_hub: rename to onboard_dev
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-2-76b805fd3fe6@wolfvision.net>
 <Zd946sKywJNvIJq6@google.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <Zd946sKywJNvIJq6@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PAWPR08MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 54db64ba-5bbe-4c55-c820-08dc38994928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZszxwNu6SlNWHD69DzVeXFtSehGA7W0yv831y0PO+CjYp02DUe1W9pOb0LBbF6GiEVddlFzTZSVnlUcZXSLyxLm1OymAIsvzLhLiJsXgdZZnUF9j3g7IyZdDdF6vcnVrkO40bczySfTw0CE2mRN7RErrLRj0TlZ3rsksTTCZ/RvRmdV+UaM1b5V7oatjFdf7Bt5M3/MvpRSNqMEKicvbR13illFM3jxAz1M57PPWRCmBO5uaAeTPsV8bU1pP82kyD27KG7ykWhnCXCNVfZvoIgc8OLNBkKzgP5+7FsKDeNx5X3FgIif8LULCmUBmSYini7e9rvOHZNG9K/Jpa6dvzZ8Krto6TPkqYh1zY1CVlkLRXFhG0phRuws9GWOKGXuN98/mwkRPNQu8qReEUom6wxtkne9qsAD2pgrvHL3K7+ZH8etMBQVXD0pFLy54ZbaDfjuWXSvGmHhHBeQv0bf0DNDesSniqrYy1GCQqQDN4Te6vznxrbmi1lK8X3vcxnto6t0nYBeJ4cpBKJv0Sp1yb+hBVDXJDagjcF9JAPwsTFYS7Ostxdkbi6zmeEdlNzxUBJA39cf8mfEYF+lCwGBcIf16CMnxEaVV/MP1+cWqsPgWIWuFHB4IAokBU1BinLWHtxgzUbewKUajkvFXDa6KWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWlIdkVRTXk3VlplWk5zWmpocFNzOC9GMXBqSGhIOUlxQm1LR2ZUZXlSKzk4?=
 =?utf-8?B?Vlc2eENnK1orN243OCtaK3FTVitsUklUeXVUenF0cll6Vlo4MXNrT0FXMGFv?=
 =?utf-8?B?QjFvemZyWDNsc01zMTZGdkhtQnFjWEFWTm91Z2NoMVlpRlRsSUtQcUNhWi9O?=
 =?utf-8?B?VkI0dXRFN0xFRU9ZRTJGd3lqNHROeWt5MHhySWtHYUFxTlVmbVpOYzJzWXhK?=
 =?utf-8?B?MkVFbnA4bm1yOWE5UzRKeXdaclRXWFk2SnE3VVVQa2dOZnFZN29DNkEzYnhH?=
 =?utf-8?B?TjNtTVRybDBnRUhPZStIMHhFTXlObzJ4TE1jNzlVdVkxMUhHZlpmQi9nSERq?=
 =?utf-8?B?Z3VxS2NBbmREOXdOYXFCdXFsamw5NEZ4VE5YZkdmSkhzNFdmV3p4NmFrWnAv?=
 =?utf-8?B?bUNwL0NlL3pjODhQNHVQM1IzMXFOTVdvUnJsRXNHbEFLanpsVEVIbmVqK1dK?=
 =?utf-8?B?eWhpWFNuekxXNm1BdFBLeVFLaXQwVm9wYkNIVEFueDZqZmFYQ2RWZ1pYdzVX?=
 =?utf-8?B?bWNBR2JBSFc1Y2ZIM1pwOFg4d1krbmRmS1Q2aFJqZ04xc1ZJOEpYWlVuOHVP?=
 =?utf-8?B?azhWQjc5aE5US3dZMU1TQVJyUCtGbE5mUlJvdm00b3YxckltUnNlZXFvWlBY?=
 =?utf-8?B?b2h5czBSVVdrS3RiQTJWdmxyOG5iZGtnSXBDZkt1RytOalhEOElDY3NCMm0w?=
 =?utf-8?B?QXp6alBiT1RFWmR5L3k0WDMzcE5JM2RqY04yZHZkNjBpUXM4Qzc1K1QrcmRD?=
 =?utf-8?B?QVhLWUt5ZFo4cFJyRVlySjNocFFjbHkyc1F1QldienJvd0tlUUk2K2JoTEpB?=
 =?utf-8?B?VStVbU5Yb3hiMm1lWEJHeGpQKzFSMzFoa0Zib0xzTUhXRi9rS3NXcUEyUkps?=
 =?utf-8?B?Q3JPN1BycnhMQ3dmM3FseVRFeXRqUWkxWGR3YnU1UFhQaCtCSFQwYTBVQ3NM?=
 =?utf-8?B?Ni84dkFseG5iNUdodTlhN0ZEUWpMaS83dGxnMXp4akVmdktKL0NEZktGcC9m?=
 =?utf-8?B?OHlMM3loZWVENHJYT2RNK2t5VUY3ZGRlWGFsSUdreE5JRUFzTWtlSXllNUZq?=
 =?utf-8?B?RU5vYjR6aXhURlh2aHZRbGJSb285N1NOZ3J0eFcxY1c1SmkzRTVzd3U3K3lN?=
 =?utf-8?B?WGVUcS9LV1RyZ3o4Uzl3S0VtUkhOdklJM0dmNkNPeENLcDdHY283Y3U2Y0Nz?=
 =?utf-8?B?WTg2WkhjTVRVek9LakpUc3V5T1lnNm5pemNEUkZmSU56MExzQ0tmSGEyU2J0?=
 =?utf-8?B?K0lwZkx4ZG1md1pGWjNEZk1ERmNQUmtPOGlBTjJOVjg2Z2FtZ2NmRllJRmla?=
 =?utf-8?B?OU15YzE4MGNxOWxLWUhUK25xR3daUGhSaDhXQUhLWmxZc1FUM2lNQ2cydHdw?=
 =?utf-8?B?Y2ZMalNtTno2VDNkRTdub0RzQm5uUEtTc3FtQVNUV29rZlJkVkFZUnJUUlFw?=
 =?utf-8?B?bFdvZXVOUEM5eE9Td2VyVUJ5dWxBai9sZmsxMGZwbVp0K2VEa1U4RzBpUldM?=
 =?utf-8?B?d1NsTGh4SkhUTzVVUFR1SFh0TG53MWlONHJBNDczYy9ERnhzem1lWHlwaE5u?=
 =?utf-8?B?SFN0aEpldUpBSS9pMVBxR3FDYWhsaHZaUXdyQk5RekJqcytVYWxIQm50cHpp?=
 =?utf-8?B?SVZsSENqVkJKZDhwQ25CQmlaeXg4bkdLVXdlWTN0OHJ6MFpuMVJGcjlPR1g1?=
 =?utf-8?B?VkJxWENoQ05zb3RkUHhibUhndUhRczVseFhYc2ZyeGlyMWx6LzhSM3hYelRJ?=
 =?utf-8?B?NVd1QUdNYitZejZzK3FyRWRZb2xmU1FQcHdZTVpVUzh5Wjc0M20ra3BzOXlu?=
 =?utf-8?B?OS9rZUE1MFJ3dmtWMDNhMEZQejBueVJyY2dad3FQQnZTOUdMZWdUbFZWU0lt?=
 =?utf-8?B?WGxpMm14cHN2T2xXdjRSenArdFVpZEszcUhENmwzNVhNbElNcWVXL0YwQm95?=
 =?utf-8?B?QVN4ZUJ5SWRrcithSlFBZDJrdHBUT2dvOVRwdU9HQWF1Q0dEa3VOaWlqREMz?=
 =?utf-8?B?TXNnMkVtbmg5MjdYMWttb2pzd29UNWl5WTFKQjhtemlWd1JKTEVRRG9SQW1m?=
 =?utf-8?B?T21lK0J3aEVVQThRek94Y0dOZk9EejFqcVZGV2QrWmoyTHRPSU1kS3lQK2Nw?=
 =?utf-8?B?L3pRYVpwRHFMUU91bFc3NjBLKy9UNE1aeEh1OE9uRzlnNURSRjR3alFKTmJI?=
 =?utf-8?B?M1JtMXFiU1laU0c4SGpWT0Y1SkZqL1lHS2VFNDIzOXNWRDlqYVFOajFINnR6?=
 =?utf-8?Q?m3cL96cJc+cLENKyuOv43nKTcQ0LyN1hx2NxPw0eJY=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 54db64ba-5bbe-4c55-c820-08dc38994928
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 20:10:18.9905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4b47o10VPqMTJxcRDx7kPDEGf9FW95znYsRruPvslVkBZj6fVOHnNAgXwW2mZ6EKJLUDXpGKcjpIeVEPTxqX2QKw/hcWklw9FaA7vw1kGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9590
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

On 28.02.24 19:18, Matthias Kaehlcke wrote:
> On Wed, Feb 28, 2024 at 02:51:29PM +0100, Javier Carrasco wrote:
>> This patch prepares onboad_hub to support non-hub devices by renaming
>> the driver files and their content, the headers and their references.
>>
>> The comments and descriptions have been slightly modified to keep
>> coherence and account for the specific cases that only affect onboard
>> hubs (e.g. peer-hub).
>>
>> The "hub" variables in functions where "dev" (and similar names) variables
>> already exist have been renamed to onboard_dev for clarity, which adds a
>> few lines in cases where more than 80 characters are used.
>>
>> No new functionality has been added.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>> ---
>>  ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   3 +-
>>  MAINTAINERS                                        |   4 +-
>>  drivers/usb/core/Makefile                          |   4 +-
>>  drivers/usb/core/hub.c                             |   8 +-
>>  drivers/usb/core/hub.h                             |   2 +-
>>  drivers/usb/misc/Kconfig                           |  16 +-
>>  drivers/usb/misc/Makefile                          |   2 +-
>>  drivers/usb/misc/onboard_usb_dev.c                 | 519 +++++++++++++++++++++
>>  .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  28 +-
>>  ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
>>  include/linux/usb/onboard_dev.h                    |  18 +
>>  include/linux/usb/onboard_hub.h                    |  18 -
>>  12 files changed, 595 insertions(+), 74 deletions(-)
> 
> This does not rename/delete onboard_usb_hub.c. With a rename there would
> probably be an actual diff for onboard_usb_dev.c instead of a new file,
> which would help with reviewing.

Thanks, I noticed that when I started working on v6 and it has been
fixed. I must have lost that one when fixing conflicts during the patch
re-ordering.

Best regards,
Javier Carrasco

