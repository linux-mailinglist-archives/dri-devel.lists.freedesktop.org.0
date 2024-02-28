Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE986B957
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 21:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5233010E083;
	Wed, 28 Feb 2024 20:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="F0p7kdLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2133.outbound.protection.outlook.com [40.107.8.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E88C10E083
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 20:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeDwHf2uWVFNnXvjirmpG5bdqr57wvvWbIAYfHC9ui2UhYTYfSiOFXX0goyodKPyUtpvFEWQBpKXo8loHPMEUfPtmhKnKaj8Wfoit+q74lqrbPBw96zw5FpdfbDqv/bGxeHQq/Gd8cVIsEUlsHLx5wI1uyyIDcAapeBXheESGxMpumGTiH7tiwwgMeYlDnCRvwvE1o3Y/PZ8ECg2W8HgMkYuzFydcDuX2+bCVAEQSJqcmqtpqGboTkBkpniAgl8e8xOZnt1w5yrJ92zm2suvSB+D2Luxw9jnxvrWfxahcj7bSf6WXEBJ4Fk6uzIHQx8506apw/DH9XmHTU4OgFQ2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOphKdFcjYy4xr0RV7m8P8dE/Wkg+pKiza/ydZMOQl0=;
 b=Uml6TsSDn0e5/W5gddLPqoprLRZ9NAojz1nF6Pi14YE9F4va8OwHzVBi4uAiRW+2mnOsQhO6FOQCfjiKrsh75MT2r248l4bwaMKYp2J/TyyzgKEG5mY6D1adtAZCrfKXB4adisH4qxgW5ILOIvdMy2vHJhAFPiDrb3RZ7KPEBYNVvXF1/doEujtSX5T+wk61rnm4+/Ct989eLJ6LDRrpD7nuOgzUbWV7dunYJ4uNDxYJ5KMABXcKAitvYj6QNebdYMbDeKQAMv6JbqAkpF+xOC/0ayIRYxSjBvVs+7klsw2A19+BkjRsq25m6ulfOGtydzMbkFp6q7COKBM6Sg3pCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOphKdFcjYy4xr0RV7m8P8dE/Wkg+pKiza/ydZMOQl0=;
 b=F0p7kdLhCDKthIlYNQdom/yMT14YXczyHmwCvXnFGGrWq1392fiZ1V0EiINvuVcW0O4pPSMtWRgDaYf2IQYmSXSAyKsniaqvwxjgKl/246/tC/fTUbhpDD+9EIBjHlAawxd93MJogLrR/piRUY9LGxwRxOwOWwsR3WLoaeBm7RQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS8PR08MB8327.eurprd08.prod.outlook.com (2603:10a6:20b:56e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 20:50:25 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 20:50:25 +0000
Message-ID: <63d9be60-40dd-49f6-9a75-72d4be746024@wolfvision.net>
Date: Wed, 28 Feb 2024 21:50:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] usb: misc: onboard_dev: add support for non-hub
 devices
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
 <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
 <Zd93JZTlN4BCxWm7@google.com>
 <ecf303c3-d7a1-49d5-a997-32596215e43d@wolfvision.net>
 <Zd-ahtPpI8zbAYQ9@google.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <Zd-ahtPpI8zbAYQ9@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS8PR08MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 29efb367-52d7-4e0c-09cf-08dc389ee365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uMptwcWlB2FEvxED37OAbe+3xOP3+V3tEj/Nh5qD5wOipE+KQCjFVRzzCDK590xx5B7ERoOoeWDU/+BDkJuiOXeLJZ/PJV+Ajy1wQdn5tVRvhNe9lO7gOWbENF2HKiJ82kfIIefgkkuesajlBFN8+m4zaJInTgLOY8X2zhMDeWOfE9Vjn+FAERRaOfn75bGHaof88nnxIU/tyIhLO8vM3ezQYRMS/7Pds3gKPSEfbnbKOngXzxg5S/hVe8YKnMDY+d8oumC0FgIAw5A0Dqyhpc0G07J5bRuY6PziynYGaGZI9b8Td/5aMED367hUUDkTdJqFgTCI1R6EJQu+6OHfsYQhkIPtIBH6OD4baczOIs7kOFXmjCidI9+yywZHVFQSSn3eGfcHWJ4F2z/1tIVgkrXnrw1DlcnXWltv37TqbCx97CAqW1FjVpPeLMN6E35IWE+SUXaY3Mo11YCy517racwWDmEcqBmuGvfPO5Bveaj//H7bnkmSwauCiI0MiDASeUsJzBZL2Fm+hLO3ASt6cQYeJ6Q23cvgaDci4P32aIkL2nCdW4VT0iMqBLkEZHe6UCXom9cwfIn5cdnI5hWDG0jo8/yTcBFweNtrFfatb2rqMmc8FlIAT110HTu1VnwX/NYKcaQlz/Re2HLoan80yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkJRKzZLT1dVbDJXbHUzaE9jWWdId2Q4UGxVUVd4VXZQMDVKK0p4dC9PL1d1?=
 =?utf-8?B?OXovVHVzTTdlNXNkblRLTC8reS9BbC9nd0NjYmdjRTZySkp2T0NRRmlhZzNl?=
 =?utf-8?B?TDQ3WklrTkcxOWJWYW5YendFbC9sejU2RUN3ak03dXE5TWNxY01LZVFUWHhj?=
 =?utf-8?B?emFOazlrb2o1d2RwWU4xR0I1MjZtd1pIOGdtcmFEMldhZWpLNFFvb2ZlcTBB?=
 =?utf-8?B?N01JaDBETWE1TkxGMzVyaDYvOTNqWUlMdkdRMmxPRDE0ai95dVdMdUxiYStG?=
 =?utf-8?B?dThZRVZRR2kzVDVNTmJtNlJaRkZjVGUrVDgwOVNRVTRaMVdMUDkyR096K05X?=
 =?utf-8?B?NVB4M3dTRjN1NmVpaUdTbmlFUWJVdmJYWmJFc0FnQlNHdS90clBBZjkwdHNl?=
 =?utf-8?B?N0I1T2tkQkFqVlRPOWZIYjRJL2Y1eXZja2FxTk5rRWhKMFNSTWtmSlpMcDlF?=
 =?utf-8?B?NFRZQW9DTnVIQ1NyVDZhSmdsaWlCWDdURitIUTQ4MDVGMDBpQW8vNEhLU0k3?=
 =?utf-8?B?bVdDUGs5YTFndmt5UnBtMVppL0RtL2piK1N0TXpsdW5sbVZWVU5pTFdYcDRi?=
 =?utf-8?B?VElsZkdjNFVuaFZ3ZFVaVWFCcTFJVFFNK0k2djFhaFJKeklBSFBLbENqWG45?=
 =?utf-8?B?dFRlWld1NkRGMXdrTzBtblpDVExXM2NrcTN3TjFXNlQxYS9KNkdGaVlvd2Ru?=
 =?utf-8?B?eWZ2SVlxbXpOSHI0RHg0bEJXT0o2UVBUTHcrMTg1Y21MWGFaVWJDeXdwUFVT?=
 =?utf-8?B?M29JUkx4QktUSTd6YVlBVmhQazJ3bmNPYkdJUng4WS9hTUw5VkNXbFlMcXRP?=
 =?utf-8?B?T29WVWhXQXpQbjdZbCtCdmhsaFJTdllDanlKQm1ub3dTejVjWllSMCtuL3gz?=
 =?utf-8?B?VFdFbGJ3L3hhVmpINE1WOE16aWFPQ1g3T0wzU21jUWp0dW5XS21sbFEyTER4?=
 =?utf-8?B?ZXRJcmdrU3d2TEpPeTEvZHZta2tEM3BTRDZTQUZqeFI0VUsvSStSSktlWDhE?=
 =?utf-8?B?bHZ5bmNtYzBlT1VpY0VDTHF2Q0dXRnpHUUFzZFd4VnFHdFREbHhwRitaZW41?=
 =?utf-8?B?Q04xa1NhemFsazUxWmw4VEltekZ4RnhVc2l0alNpTkhaMFd5b1h1amU0ME5Q?=
 =?utf-8?B?aEZTSUUxK1FnLzBvMjdDTXdqQ0tYOHoxQjc3bHI4Z3VJUUVobUszMnZFeVBh?=
 =?utf-8?B?QUV0MVNZUjBYMUExU0ZrNGd0MWM3SnNpMktOUXZ1OVVQQ0FZMnE5cGE0VmJN?=
 =?utf-8?B?RFkwa3REcDZ4Y3VCRm9XYmVaTHplTkpmb0RpK1BGcVlFUUNsQXEvanpld1Bk?=
 =?utf-8?B?aGhJTzV6QkhPZTZMcWIvS1pvck5aU0NGd1B0aG9vYm9XS1BiWW44RWw0VUpy?=
 =?utf-8?B?SHUxSzRvZGpVNzNheVZzK2txM1lmTDYxR3IvNllHQTZyaG5Dbm1WYVJHOURz?=
 =?utf-8?B?djZFdGJMeERVaGRtdGwrVUkzR1d4ak9FcDBxbFVERld0VmVtUk1DS2xoVWVN?=
 =?utf-8?B?eFFTSnFENjk5YVBYa3BCYlREcFpwanZHVThVeDQ5aFdDNDEwVEtGTzFsZDk5?=
 =?utf-8?B?ejhFTStTd3R0WGZsc2w2cExHa1lMUXpZcFFsT2hMRTNWUmNkSUk0SkY4enJi?=
 =?utf-8?B?Z3gxN2RzUDlPR0cvQTgwMEhNNGZiWmlmb3pVSURhdGZGSmZpUXBrclZqZHc1?=
 =?utf-8?B?Yk5TZFZDc3RXakpWd1NJRU0zRlR2VVk5WkVnTnJ1L1BCQXE2K0ViOUoxc0My?=
 =?utf-8?B?aEh1RzFUL0tPMXR1RWRYbE5WTms4YTBGdkVJMkpTZVFWcmZ5ZzE4TFRGZktt?=
 =?utf-8?B?bTZlb2l2S1ZSWnJIWlhRWHJYRVRVK1FPck1POWNmWXNFeTdrTzJVeHpGc2pI?=
 =?utf-8?B?NWtGaTFPTHhvcmp5Y1UzK1E3RVp2T25oU1gwajc3a0ZiODdwdWROZDRDYWdr?=
 =?utf-8?B?dS9lMnF1akFoMHdEQVhDYVczRWtta3BqK2psOUR3V0ZpV0ZVZVFYYk15R0Yr?=
 =?utf-8?B?czFJcmdMRkcyVE1xU0d0cXFpNFpmY2V0NUU2cHI3NUN2ZE5RU3BYSW91eEo0?=
 =?utf-8?B?cStDVU12d1g5V05jMGw5Mzc5SzNBYzJoaFByNExSazA4MlZkUU1aUWk5aS9E?=
 =?utf-8?B?SjRDRDVQblZLUFE1SHZBQ0U0VTNoTnFMRFg2a0ZYbzQxTXlnTEs4NkNYV1NR?=
 =?utf-8?B?VjlZVTBWOC9kZDRqai83cHZ1YkRGU05VRlFqU092MHZ6cFJIbVlVNE5wRTlu?=
 =?utf-8?Q?WdJdAa80Nt5J6NhsW17ETCgig4vMmjyzm7QoTpHyxU=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 29efb367-52d7-4e0c-09cf-08dc389ee365
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 20:50:25.1884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHL8/RrccjDBrErtse3jwVL0bCi6/viXGPez0Gfu/z7gmOcccUfS12q7XYumUxZRwd/Ty8IbVhs2emEcPAkUyggxo7DRJJTjSNO6Q5TsqrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8327
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

On 28.02.24 21:41, Matthias Kaehlcke wrote:
> On Wed, Feb 28, 2024 at 09:21:00PM +0100, Javier Carrasco wrote:
>> On 28.02.24 19:10, Matthias Kaehlcke wrote:
>>> On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
>>>> Most of the functionality this driver provides can be used by non-hub
>>>> devices as well.
>>>>
>>>> To account for the hub-specific code, add a flag to the device data
>>>> structure and check its value for hub-specific code.
>>>>
>>>> The 'always_powered_in_supend' attribute is only available for hub
>>>> devices, keeping the driver's default behavior for non-hub devices (keep
>>>> on in suspend).
>>>>
>>>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>>>> ---
>>>>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
>>>>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>>>>  2 files changed, 33 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
>>>> index e1779bd2d126..df0ed172c7ec 100644
>>>> --- a/drivers/usb/misc/onboard_usb_dev.c
>>>> +++ b/drivers/usb/misc/onboard_usb_dev.c
>>>> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>>>>  	struct usbdev_node *node;
>>>>  	bool power_off = true;
>>>>  
>>>> -	if (onboard_dev->always_powered_in_suspend)
>>>> +	if (onboard_dev->always_powered_in_suspend &&
>>>> +	    !onboard_dev->pdata->is_hub)
>>>>  		return 0;
>>>
>>> With this non-hub devices would always be powered down, since
>>> 'always_powerd_in_suspend' is not set for them. This should be:
>>>
>>
>> May I ask you what you meant in v4 with this comment?
>>
>>> Even without the sysfs attribute the field 'always_powered_in_suspend'
>>> could
>>> be set to true by probe() for non-hub devices.
> 
> struct onboard_dev always has the field 'always_powered_in_suspend',
> even for non-hubs, that don't have the corresponding sysfs attribute.
> Currently it is left uninitialized (i.e. false) for non-hubs. Instead
> it could be initialized to true by probe() for non-hubs, which would
> be semantically correct. With that it wouldn't be necessary to check
> here whether a device is hub, because the field would provide the
> necessary information.
> 

That is maybe what is confusing me a bit. Should it not be false for
non-hub devices? That property is only meant for hubs, so why should
non-hub devices be always powered in suspend? I thought it should always
be false for non-hub devices, and configurable for hubs.

>>>   if (!onboard_dev->pdata->is_hub ||
>>>        onboard_dev->always_powered_in_suspend)
>>>
>>> Checking for the (non-)hub status first is clearer IMO, also it avoids
>>> an unneccessary check of 'always_powered' for non-hub devices.
>>>
>>
>> That makes sense and will be fixed.
>>
>>> Without code context: for hubs there can be multiple device tree nodes
>>> for the same physical hub chip (e.g. one for the USB2 and another for
>>> the USB3 part). I suppose this could also be the case for non-hub
>>> devices. For hubs there is the 'peer-hub' device tree property to
>>> establish a link between the two USB devices, as a result the onboard
>>> driver only creates a single platform device (which is desired,
>>> otherwise two platform devices would be in charge for power sequencing
>>> the same phyiscal device. For non-hub devices there is currently no such
>>> link. In many cases I expect there will be just one DT entry even though
>>> the device has multiple USB interfaces, but it could happen and would
>>> actually be a more accurate representation.
>>>
>>> General support is already there (the code dealing with 'peer-hub'), but
>>> we'd have to come up with a suitable name. 'peer-device' is the first
>>> thing that comes to my mind, but there might be better options. If such
>>> a generic property is added then we should deprecate 'peer-hub', but
>>> maintain backwards compatibility.
>>
>> I have nothing against that, but the first non-hub device that will be
>> added does not have multiple DT nodes, so I have nothing to test that
>> extension with real hardware.
> 
> I see, the XVF3500 is USB 2.0 only, so it isn't suitable for testing.
> 
>> That could be added in the future, though, if the need ever arises.
> 
> I expect it will, when a DT maintainer asks the hardware to be
> represented correctly for a device that is connected to more than one USB
> bus. IIRC that's how 'peer-hub' was born :)
> 
> Ok, we can leave it out for now. I might send a dedicated patch after your
> series landed. If a switch to 'peer-device' or similar is anticipated then
> it's probably best to deprecate 'peer-hub' ASAP, to avoid it from getting
> added to more bindings.

Best regards,
Javier Carrasco

