Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7387206D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9FA10E4E2;
	Tue,  5 Mar 2024 13:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="s/UZXo5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2121.outbound.protection.outlook.com [40.107.8.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049A510E8A1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 13:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLyN1GNRsQOwA79k95qNVLKmIgWOEItgPK6mSgls9v+aY0KoDW0a7gK+cBLtzJwuRH0RsNzujUun89X5GyENl/GloNEGwMXZLL49owFM+7Wbyst/HMjD7VYil+AoYLykbgwIZMyNj+VHFPKKw+kab+E9tgvwJzntbg6I9WkSNyuqCyJ2X94bCuGLOnwVGMjcWBbFp31C1xJMQ+/AhY5XnFCmj4m4EJfTW8SoJewTu6k/JO8sfQff3DLwkEt4FmgLcMzEYbhOJ5qg6hCIk9clQqX+RbXrmrGqI0+HRGsr7l+ziTAdNDL/omLB9keV3lCfP0hW9Jc3rArSIoHHHgRqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7E+YYBE/dHRdZUZn0zstzc2fjejFi8Hm4rPLzpSAqE=;
 b=aKOpB6a/+RqK2ZtvlEAE5WKgXM/8OiUcN+JdacqDZGkYN9lazVaQA5S0Yn5MANrUax+LCFJovVS35zRu0rm3/9YOG0VdsaOcUnyi9eTCCVpbePUI+1McdpVniJkky7T8UC+HMLI695hhskrvacYoh1Nu1Lj/bXLuldELu4cUlEMmXGo+j8mZ4cwzO2J1j0IVeHFGEOLv/SbFKn7wQpIXyGhph7B81yAJAJQeDqQEvztwDzADNnAYNAUe8bfG8YJdLsWCABWrEDW9JrWJapTSH1eiC5Vct9IC3SV4kgqKArUnnk1fRYgS1YKrW4K0bDgMB5OtgZZsedEHT2MNkQCpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7E+YYBE/dHRdZUZn0zstzc2fjejFi8Hm4rPLzpSAqE=;
 b=s/UZXo5TGbRyGmqgV9D/zPD4Whi0ikuKq4sMDP+T33MryV9vjK81G7qGmOuvRX3aS5F7IM+S0DnNA6avSDuunA3nnG+WNZJ+K4RMCE3+uRenJmcLZPJ9S0AT4bfGtg9dYx8onMgYInI9axneso90pU/CZ+1WgPdACp/ntxdoGLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PA4PR08MB7596.eurprd08.prod.outlook.com (2603:10a6:102:272::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 13:40:08 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 13:40:08 +0000
Message-ID: <611caf62-1404-483e-8797-4096e0c3a433@wolfvision.net>
Date: Tue, 5 Mar 2024 14:40:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] usb: misc: onboard_hub: use device supply names
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
 <20240305-onboard_xvf3500-v7-2-ad3fb50e593b@wolfvision.net>
 <2024030557-mutable-subtype-f340@gregkh>
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <2024030557-mutable-subtype-f340@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PA4PR08MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b14db1-ff4d-4f55-acd6-08dc3d19c5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wVUWSA/dIzCb/8IxCTmngZQAoPWkHVmKEp7f4aBpbFGMVBz/0tWoc0wTa4v508y/Zu0eVZ15w2OAw7EFEkUNuS4hM8D3cHgEYimLK6kfBv7JGfQ9Ks0MRu+mUmeoWuSC4l1PAPtjbNpCanVEEL+V1cDAnvTynnjhN+mu6xcg1GGEhrB+uS8ONKo3sZR+6PQMOaHRpvj1NnXUWGtnYYmzc0Q/S0NLLmdBHNbj9AuSCYs1nu/LNZrzKg23yWzVSBwsgCUfvdgCbPhvhOFO58wTL8FLxRh5gXYG18EdkPmFvk3KvkdGGSlDKF+cwBgB2gjPpYhd1yLwqULxv0nq8VooRXqYoGNg0VnIU+AWxil6LMD/tkRl3NrxUU8YUQsoTQ+mRyt/JTOXdJTrLEFovgu8D8aGvvL9asRH5ufRe/vfRzN+Q4tiYzeRIKqculxSJu1CQchSHtytfvZAt3Z31bm2uMqMnSmEIQMo6ET6OxFmF0YkYDf/GeLxVNSOZh1l77nar5iAdE3j/QEnN4aad9OoOd/8zVPNsSKr+2e10acaU3lpiWvyl+hwEuLwJ5zIZMeYDPdLKH6ol3AcUVYTIrHCCFlzIUw93n0323nkwtJ9nEBsQflcO57jJKlURLbI1ppBemlvmmEXMYJ+vCaLyOPYTHrqYx1wSO8j+t7T+7nsbuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzNyUWlRM09PYU9Db0tpMDV6Y1J3S2gxTm5sT0s0dnNxYTd0NGNEQ0dHUVgx?=
 =?utf-8?B?Yi9ROHRqalZhc2UzY1YyMnppYTg4UWVsUnltblpFcjZuRUk2cUtQWlQ2UTN1?=
 =?utf-8?B?OEV1c2QxRXlVT3A4Z2RXWnJyWWZBanhaeTgvcjFxYTY0SW0wTWl5a29DUFM0?=
 =?utf-8?B?SFA0WXRieUJGZWdjTlhCcmhJM0Z6dFNmbE02dXlSYzJMNC9EOGR4STZYNGdi?=
 =?utf-8?B?ZlNlU0Z0UktUUFF6UnEzNW5McXJZeC9FWUJGejFNQ3ZRb2ZSM2xhTkxNMnNT?=
 =?utf-8?B?ZHdhTWJjZU8zei8xWDRyMG11a1VPQWtUR1psUjlHWDhZL0w1bllGZEV0RGRS?=
 =?utf-8?B?WkJ2eW1oQm9SOTQxbytncGlUTXVlTDFtazhCSi9lbTdRSHFWTTFEQWFDa0Ji?=
 =?utf-8?B?MTFybWRaMzliRHlxQ011dzROMnkyYTdUUXh6N1NEdGpYeFpCQ0Zqcmx1ZXlU?=
 =?utf-8?B?d2dGaXlkNFpvaXZDWVhVejJ5T0dhQjRUZW9iR1AxTjYrb3JWZ2VXRm1mdmJ4?=
 =?utf-8?B?dVdUeHUvY05sc0dBMG9DaVRZMmhQSmtaZ2FYL0o4MnhjN0ZYMnBWNWd6N0Zs?=
 =?utf-8?B?VGJtdmRZZDNnanBKQThHYXZIa0xJMG5PME51ZmhEVkFmTmsra1pXRFh4amJX?=
 =?utf-8?B?aWJQaGJCYkQrYmR0dFE4enp5bUNTOGZzSzdmMzkvVjRGaCtkNHlhVTJTTlAw?=
 =?utf-8?B?MEtTamNETEZoajlBcmQvRmUyNU56NS83cjhRUUVUeXVRbzJ0cHRLL0pQNWZR?=
 =?utf-8?B?WmdVVmo3K0ZEYWJsOE5YcXdiVUgxeHp1R2ZWR3hxMnc1d3o5ZllkeHJ2NjFB?=
 =?utf-8?B?T3ZRVGgxbHlTWHYvbnZDTzNibzdCRTZTMnJFSy9ZR2ZMa2xJd05nekNIVC9L?=
 =?utf-8?B?V2g2K3piekhkVXdITHJ1ajNNK2pRTUdkZGdEeVBDQnl6M3BMWnlyWUdlalpT?=
 =?utf-8?B?V0lHRXJ2ZmRQOE9adStyUGJZSnk1QTAraUFlZlpGc2Y1UzdwQ3ovelJHbU0z?=
 =?utf-8?B?RHZ3T3hTZVRRODhucGNHWjRTT1I0YVZaaFpLWEszWnd4ajBlNzNTelRGRHZL?=
 =?utf-8?B?RkJlNDdpZHpmYTZicWNSVU5FTXlVMVF2ODlWL3FIcWlnV24xRHJOQk5hbS92?=
 =?utf-8?B?VWh6YzNIYTVHTlVCbC9qTlB0OGc3VnB4VkNFbnByLzhzOTNVcFJCRTJTcGg3?=
 =?utf-8?B?clh5a3NPWERaWEtabzBMbllyK2NLbGVaUEhMazZHNnhCbkd1ak9MY2VablVN?=
 =?utf-8?B?dUdsSnIvNFJaKzFSVlp6WnZqN2pNc0JRbys3VUJGdzhPUVFMQmtqZ2swVTJY?=
 =?utf-8?B?Rk9tMkZuNkNxVy8rMDViRFpPaXdCK3l5MjJRc3ZqOWdGd051ZEY2bUVZV1Jq?=
 =?utf-8?B?cVVZZEIvTU1TVUVYek9pUVZLYlhsOWYwaFBPV2FidGlEd2pEUXhOampzcXdp?=
 =?utf-8?B?bkdnUm9BeVdydTREemNRVTV4WUNjdDYyMGdTTFBhWURHQUwyZUNBRVVEdVoy?=
 =?utf-8?B?WlBUTldYTHVPL09kTWFJMVN4Qm8vSWo5UGhJdTIwQUp3SGp1MmRiaUdwWmxk?=
 =?utf-8?B?R01lS3I1UWVFeFpNSzJJR1AzWHBUMmRaNmZmQ3Y1WFhQMFYxMjl4OUNFUWdJ?=
 =?utf-8?B?ZXh6a0h0NVVvRXhjZytRUCsvMzJOSWY2QkgxWldnbThvak9IWllsMlZZS3R0?=
 =?utf-8?B?Q1l1QXM4TWxadmI5aWNXSFhUZ0FWclpkT2taT2pweXBaVjkya01pZkU3QzJu?=
 =?utf-8?B?VU5iL2hsQ3l2TWdoTFFIS2JpeUt0RVdmdnNLejlsanA3ckI2Z3Vndzh1dVRw?=
 =?utf-8?B?ZHN6Z1lRVlJjVnYwQkNLeVBac1BLaC83cG16Tjg0SUlOUVpLQmd1Rmx1WnJF?=
 =?utf-8?B?WTYwOC9CN1Z2R3IvdDZUZ3hMRDNXZzNHZTh6OFlKQVBhemlFMzNadEhNdWpH?=
 =?utf-8?B?N3UwNVhsaTgzRVlnb09IS1l4WXR1cFR3Z1dYN3M5UytIMDJEWEFOeUloM1dV?=
 =?utf-8?B?bTAyaHRyY3VMUEVkWlh6TnNTckVHUCtFSHBxd3hMbjJNamhrNXN1dHNqZnBH?=
 =?utf-8?B?Y0VXeE1rbzZOR1R4N2J4VEhHU2JaaWRRekw5aktTZzY1MXZNOWdXM2wxaU16?=
 =?utf-8?B?elZsQmpyZ0ttZmFkMDkwOTk4MmVpaFJ5YmpwWFdhcGk1NHIrZDR6cTB5R3kz?=
 =?utf-8?Q?g84SLQFyYDsCQcZr3mckOL8=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b14db1-ff4d-4f55-acd6-08dc3d19c5a6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 13:40:08.1487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SruZP+ZL/OF6V/bvwKhupyXZxJ+mghvOcVFc3jVgTNhRLYVYTow9WCsZu3cRsVqjFwRGf57JMHtlxJgZBz7aVxJfyGgxqVfnrXEcxYgVlYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7596
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

On 05.03.24 14:34, Greg Kroah-Hartman wrote:
> On Tue, Mar 05, 2024 at 06:55:02AM +0100, Javier Carrasco wrote:
>> The current implementation uses generic names for the power supplies,
>> which conflicts with proper name definitions in the device bindings.
>>
>> Add a per-device property to include real supply names and keep generic
>> names for existing devices to keep backward compatibility.
>>
>> Acked-by: Matthias Kaehlcke <mka@chromium.org>
>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>> ---
>>  drivers/usb/misc/onboard_usb_hub.c | 49 ++++++++++++++++++++------------------
>>  drivers/usb/misc/onboard_usb_hub.h | 12 ++++++++++
>>  2 files changed, 38 insertions(+), 23 deletions(-)
> 
> Due to other patches to this file, this commit does not apply to my
> tree.  Can you rebase and resend after -rc1 is out?
> 
> thanks,
> 
> greg k-h

Alright. I see that you have added 1/9 to usb-testing, and the rest of
the series requires 2/9, so I will resend 2/9 - 9/9 after rebasing when
-rc1 is out.

Best regards,
Javier Carrasco

