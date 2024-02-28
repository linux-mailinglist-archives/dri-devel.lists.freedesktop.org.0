Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EED86B8FA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 21:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC6310E37C;
	Wed, 28 Feb 2024 20:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="s0T3n2ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2105.outbound.protection.outlook.com [40.107.15.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F3E10E37C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 20:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A85D9ZoL0GmZK1260B/qUvKi2Izk8RCjE1hrCRcKT3s71bENePjxawwbZ14UjAOcc1WVYgFJsop+8FRyQabKzTZXE3TeBamCJtbVYZMOKQnV+0QLNWD4gUDIk1wVTChKKBv4RWZL5+0P+fz755quUZYwtekiADtZ+eWczhN67BGrrfcuNfgTos7hnRB7icXVslyzHochPuKgNjxhpKMC5XXMABN4kQj0cOdhD9MDRvjudUO5AbkbjmAuoCP4Azt9vKW/Oa8LDMTICD5UbrywjWX53jslJgdfdE+5EkQkSGvsKnAsioEhsA/IyWw1YxN6W1ttDo+FxhmsfchE9lddNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqEzPb/mVMcIU9eXjoP06fQJwVcbJk51Ys3HvOoWbI4=;
 b=bktvlJDuZy3TSIkLvy10VbT074CLxWxYwwzlBbGtOJaVxIOr65LdfOEMIc//L6I/ZbUxNc7C8YDjxpvzPoSj251e7MmmlN2qqqWOS3gOvDkkhKr1eYa/nu2Ju5Fo2VK8SfES26KpZw1bdlg6IufKtMNeYzqOUoLKgO7CBipFY+A53sUQZeNwvfOG1WMFmPtXmzFh7xWyqck8VGwp7xvCYwpRauzLBElZ7UMTe5ofzHauLFGaf85r4EWvRIWqXAyw+YH7JbBZDjLQEO6NVhb+O74FbDFb7qo5sqU6xoy3abFhtbrpM6UasRrr0rEj1b3j75wxAU3KuzN2wnlqg2/PNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqEzPb/mVMcIU9eXjoP06fQJwVcbJk51Ys3HvOoWbI4=;
 b=s0T3n2exBVXsfDNqFBbeeiPhFWG8ntcbO/pbedw2HqhWOAjULsnnCuZEGtTc1ZpJlCuZ0k6FkRCw2oTxvipG0IEW2+Xs4lEDnhIAgiXnvTvsWGpmM6GyHBiOG01gdrf/QPwcec7y+/y6vMF4d9QwPxKSVrIRSzWRIOj1tPX65Ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS8PR08MB8875.eurprd08.prod.outlook.com (2603:10a6:20b:5b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Wed, 28 Feb
 2024 20:21:03 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 20:21:03 +0000
Message-ID: <ecf303c3-d7a1-49d5-a997-32596215e43d@wolfvision.net>
Date: Wed, 28 Feb 2024 21:21:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] usb: misc: onboard_dev: add support for non-hub
 devices
Content-Language: en-US
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
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <Zd93JZTlN4BCxWm7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS8PR08MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: 700deb88-100c-4417-ba46-08dc389ac903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4msH3Yh6JePWIHERyK7aFgdNvpZzv6Vu9LOl4irhHOCa7dngEzZCE6NZrhrAqdsNSvkLke5mQfcO2ozb+t4vaDAOF7S4N8miFm92HafgjKPGsQmmWU22trDk55UZb2oaCwTGQbWic6qMQcf9a9sNramjggrwbCZVoijFq5iBqlhpkPgqNFhxBxcGK0Gv1uGYInIS8w5SpPUQ1M5yrM3dsw40g443l0zz6TC0yinJe2ThWq7U9GQUBO+F7ag+la7BrR5iuUy1nL5o3Y6NJ/DV6Sf1Wc0ucU1XTY1ex8o6RUZx79wdLqTwuOqC12hZsA2NQIranhpTCfgqh8RZsxAJ3EgI8nxK57F7NMSM3MXlaQ2Nbn0zDGoQY2l7gpVitElZd3LbJSruybY6Yx47GeFXgwZf0/x99Fspf2sdoTQqR6VHDd+TtjhcqSnRO+1da4OhVPt/CBxz99+FP+gvN4OBlOh3naJcp8y36UrrLlEnFGXRGkTdmOyRSSQaI1Htp8d0h1Jih9F8JoAVRq+84SUaPs0jkdaB3BUq8JF1QprIUOMAU8VdEbbh6xSiWpn++CsCQWUIR108H7J9VOoF5XdmI30k0H+5Q5WWyS1dP0EWVcp8s5d0J+TOMKZaLNGByGxGYBzb485fbkvKhOIxwmpUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW1BMDVDSGUyTS9yaWIzZHpsamhsVlpTSXk3R0gvVXMyQm01cHB6Sk0wckdN?=
 =?utf-8?B?NFBoeDYraHBtb2xYYjJHV3ZKblpxQm1udnV6eGFJclU2dlRUVFVCKzhkazlM?=
 =?utf-8?B?K0JLelU0emVqbE1Fc1ZxNVF6MHVBTm9JM2ZxS3lOdFdlZFdDbzc4c0pZUWNK?=
 =?utf-8?B?ellIaGtOdWJudlU2ZGptd3QxWnhUeXJJUlBOeWxuUkx5ZlhDN2pWSzdUYjhy?=
 =?utf-8?B?MjVLMVBqUXBSV1ZqREpVcVgwL3EyREd0YXppM3ovb3IwVDVHaW1lNy94VDMz?=
 =?utf-8?B?RFhzNndnRjIwc042N25HUm1aTjdOa2NRNlpicC92ZUhBWjg2MzBvUUlVQTBR?=
 =?utf-8?B?Q3ZDdUJFZWJQVmlNZWc4aHBmWFgrRzI5eEs5NmFDSUJtcnc1aVozalRRODZU?=
 =?utf-8?B?bGJJVDBJcWF2NGRhNmNXakZBaUZ0WVcybGZlNTJ1RzcxWnZoUlQxd205VGVj?=
 =?utf-8?B?a1czT0VyMTRubHl5WkRaZzhoUmlHTDNCRnpSQ2J6ZmVyMWtkT1BPK2Z1dmwv?=
 =?utf-8?B?STJwVjNVTkhGRUxxK2IrM241czV3MXVwMzFTMWxnWlY1VDJqTzgvV2NtcXR6?=
 =?utf-8?B?UlVBYklrbVdOUUhvQW8wcHg4UC9RcERSM2dla1Q2ZG40RGUrd3Zrd3lZRk5Q?=
 =?utf-8?B?M0VXVXhOb013d3R3czZRN3hQOVNzSjArMm01ZGV3ZTJOb0hmeDYzWElSUklB?=
 =?utf-8?B?MnMvYWhzOHpzaG1BNjlUVXlPbnVJUVF2WEVXZEc5dXljbWhndklyeENuUzlG?=
 =?utf-8?B?OVNKTTZiR0c0c0lQaDMvK2E2MUxBT3dDUm1PaVN1VFh0VUF5RGoxVklyYVN2?=
 =?utf-8?B?c0V3OC9SWHF2dUc5dlB6ZlhKNThyRWFNYjRHMzg0VG9SanY5STJnQm5wZGl3?=
 =?utf-8?B?MHJFQ0V3VmVYeXdTY2RjZTBSa1h4WDVxTGlTZVNpb0dRZWxuaXNQa1ZpdUlz?=
 =?utf-8?B?TXJzb1RveWNHOVNiSkJxSVpiZ3Z2emNIazR1b2hpZUFRS0lDQnVNVEV3NjB5?=
 =?utf-8?B?REk3OVE4MStCL0xnZDVMVTJnSFpJOE5zNnZnSysySEREMXQ1NEc3VlE5bHV3?=
 =?utf-8?B?WDMrZUpXYVJoQ2VXMUdlLzY1Z1IrR2lFbFJjOHdxbjB4aDJCelZUeFlBSW4z?=
 =?utf-8?B?SnBXZGZXSURQTU8yckdwbmYxRlpLTzJJSWZiSUdEaEtldDhwUGJFZWNhKzFp?=
 =?utf-8?B?QTRrR1VneFhpZmdhWmM4TEduZ2x5MnhaTXF4Mm52WjFkWXJpdzNabERhUXI3?=
 =?utf-8?B?bGVUYUNWM2gxQWRJRGN1dWRMWVFWZWtuaktmMncyZEFWWkNLZFpwa0V1cnhE?=
 =?utf-8?B?MGxtVmlsZy9IdmtDQnlqVko1OVROcXE0Nk1IWmp0ZDBkMFBFeTF2elY5KzA3?=
 =?utf-8?B?T3E5cEFpVlZ3MFZQNzExaFlsNVMyaGlpNUxlVGpqbzV1SGMyb0dycFIyWS8y?=
 =?utf-8?B?Vmc5VUdHS29GVG1CWXNNZm8xNnVEV2JqOHgyU1lNTTdIaVlmYWFmZEorT2Mx?=
 =?utf-8?B?ODdJWmdRNjhISUVBTHFLb3JVcE4xMjBCbkxmd3VJUy9zTzE1V3g2b1FOTGVv?=
 =?utf-8?B?T1REUjZVWFV0UmhxVE1SeWV2TDUza3BVV1RuRzRSVTJUbXpRL0V4T2hmYzk1?=
 =?utf-8?B?SHU0U2dpNHdreEhyQmlwQkRiZTE3OGJ4RjZmT1djY2F5Si9HWVloWTJVMmlr?=
 =?utf-8?B?ZTV4OWVUSW9acWxoeTRyQVZ0L2Q1TU41cjBCL0ExMVJGMHMzekQrSUhuUito?=
 =?utf-8?B?clBzaFdUMXlXNWJGY3pYMTNsRENWOWhSYVdnSUNrOWNPL1lBWjl4UHAwRGhO?=
 =?utf-8?B?VSsrYjM4Qnd0YjF6dnE3UUU1RFBZY0dleXcxSVBKQ2QxZDBzdVhOdENGc1pj?=
 =?utf-8?B?YjljRnoycEp6S1k1Z08rcmxqWTNOd3ptNWNJVzk4K2JkZjlzNm5zOWpDeUlG?=
 =?utf-8?B?TTNORGJJclZVZGNUazBrYlFQUEJCMnA3VUkydW05T3R0ZTF5NERzR1VvWGJK?=
 =?utf-8?B?UHI0OEZVMGVyNDExNC8ybFN5LzNGaG5NVHprekJURmJ2U1BrV3F2elhMUWIv?=
 =?utf-8?B?dE1STlkzbjFtbGdFMlB1a242ZWh4VjJaa3U4dmhTWGZTSm1aVGdyNHFuMXk2?=
 =?utf-8?B?WjZBampGWnMwcE1aTDA2bEhLT25pNnZacHlKLzRrOHJtMkQzc3JXYld0T25z?=
 =?utf-8?B?NnVCMHhWdEdENWRXbFlNQ1UrK3prcEF3bUZ3TUhBVHNwd3p2UzJCdWY4R2Zq?=
 =?utf-8?Q?LR1g2VLcLqQTge5RUzdCm5khnNCs1TFrSSgJ6iYn5E=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 700deb88-100c-4417-ba46-08dc389ac903
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 20:21:02.9698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRPFOV3zqhujatAQ+f5Io1DZ7dNbaIUJOFDZ/UYR35E7MCNFNxHcpl3xbKRRE8wcs+I+O4GOL1RBnGh+9m+EHU7jTqz64cnVjjyWig4t0+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8875
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

On 28.02.24 19:10, Matthias Kaehlcke wrote:
> On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
>> Most of the functionality this driver provides can be used by non-hub
>> devices as well.
>>
>> To account for the hub-specific code, add a flag to the device data
>> structure and check its value for hub-specific code.
>>
>> The 'always_powered_in_supend' attribute is only available for hub
>> devices, keeping the driver's default behavior for non-hub devices (keep
>> on in suspend).
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>> ---
>>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
>>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>>  2 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
>> index e1779bd2d126..df0ed172c7ec 100644
>> --- a/drivers/usb/misc/onboard_usb_dev.c
>> +++ b/drivers/usb/misc/onboard_usb_dev.c
>> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>>  	struct usbdev_node *node;
>>  	bool power_off = true;
>>  
>> -	if (onboard_dev->always_powered_in_suspend)
>> +	if (onboard_dev->always_powered_in_suspend &&
>> +	    !onboard_dev->pdata->is_hub)
>>  		return 0;
> 
> With this non-hub devices would always be powered down, since
> 'always_powerd_in_suspend' is not set for them. This should be:
> 

May I ask you what you meant in v4 with this comment?

> Even without the sysfs attribute the field 'always_powered_in_suspend'
> could
> be set to true by probe() for non-hub devices.

>   if (!onboard_dev->pdata->is_hub ||
>        onboard_dev->always_powered_in_suspend)
> 
> Checking for the (non-)hub status first is clearer IMO, also it avoids
> an unneccessary check of 'always_powered' for non-hub devices.
> 

That makes sense and will be fixed.

> Without code context: for hubs there can be multiple device tree nodes
> for the same physical hub chip (e.g. one for the USB2 and another for
> the USB3 part). I suppose this could also be the case for non-hub
> devices. For hubs there is the 'peer-hub' device tree property to
> establish a link between the two USB devices, as a result the onboard
> driver only creates a single platform device (which is desired,
> otherwise two platform devices would be in charge for power sequencing
> the same phyiscal device. For non-hub devices there is currently no such
> link. In many cases I expect there will be just one DT entry even though
> the device has multiple USB interfaces, but it could happen and would
> actually be a more accurate representation.
> 
> General support is already there (the code dealing with 'peer-hub'), but
> we'd have to come up with a suitable name. 'peer-device' is the first
> thing that comes to my mind, but there might be better options. If such
> a generic property is added then we should deprecate 'peer-hub', but
> maintain backwards compatibility.

I have nothing against that, but the first non-hub device that will be
added does not have multiple DT nodes, so I have nothing to test that
extension with real hardware.

That could be added in the future, though, if the need ever arises.

Best regards,
Javier Carrasco

