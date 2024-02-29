Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC286C0C5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 07:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803E10E132;
	Thu, 29 Feb 2024 06:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="d0jIlIBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2112.outbound.protection.outlook.com [40.107.14.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF8110E162
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 06:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/Fa0nUWOrdxRrUASaQtWt+JwBC8pXp8ZQEXUxtEzb1kz58L0ChyFEXTbYfzDx8FUH9zwVl5ta5w+/Hbp5qeE+u3Bxk/cL2GvD6PxKH82XQ/jbH2Nx1ngbzBqGmHHw/MuIxSFnN1QqXdR1ErmZprB7o68Kg7NOhtZMIEdqL2OUWbK9pzdwt3hq50064L4IAVI+Qb2H7J849Yp24uE7zInWsEO7NZfqtM+j38Uwa25CrheaV6lPHBkfniqnpI1RQWndQN5nddPThyZTSCQRw22QzbfDpzjCYqEWbX7hEumDUWuSLP1+SBqn0C93fMob5HFA6HGlBJ1752ESuVe4EPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRETT8jF7zaoTMuk/Nel3QiJK4oIC817sMp3g/s+VWI=;
 b=gMIL9pCJVOFIIux3lUzD3muGNMKUzkCpQNlnPhMIUwBB57RmBTgmCNqAHUDfU5vzXGIStT7VcW2C2fEXFq35dkIxQc/DL1RcY57QwLPXnFrcXHujdV6G5oOLevpCobp5sOLoQt0XDUY6SFqUqKjVghwNw3kOAomBdQ4AIE8udAmxTjpakObiAG3NJEDgt+9oTiYUFi5Qo4BZ+oVTsQga/x1b9lO2xLu+sUQmlvq52KhGwAjQsFHiFVHiaq6xMHbAzRLvA70Sa/pdZOcrSm41Oou8fvlhyYa7eoMJ65ZvPcI8GLIbAcb/UK6CM5c7BL21e1BMdDtJO14G5MI6sonvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRETT8jF7zaoTMuk/Nel3QiJK4oIC817sMp3g/s+VWI=;
 b=d0jIlIBdJ2UFhghP4G9p31cPPmOReVYs9xh/oPHKfYB3WOxsH5A6X5SlF6CV4L74vEVyGUHnqu5Imn8196PPmpg2o7vGcwu6xQsNK8e299Xyx6QoLjilg12b4DYGXrSn+PZixozBXAgC0LjoUiAilpZJlKUC1V7s+pyAqAWs62o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS8PR08MB10316.eurprd08.prod.outlook.com (2603:10a6:20b:5b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 06:38:13 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 06:38:13 +0000
Message-ID: <04776f37-92bb-40bf-a3ca-3da4ce3bef88@wolfvision.net>
Date: Thu, 29 Feb 2024 07:38:11 +0100
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
 <63d9be60-40dd-49f6-9a75-72d4be746024@wolfvision.net>
 <Zd-m6WNd5ukXyJGx@google.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <Zd-m6WNd5ukXyJGx@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS8PR08MB10316:EE_
X-MS-Office365-Filtering-Correlation-Id: c18d1239-a9e7-4755-b2f4-08dc38f100fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PalCwCC+xsKgYLoeSdPGPthME0h41Qc35TJnx2TCEJ88ELIhNstSNazQv6ohQylRU6Chw0RIARBZzyK74SqIbf50e24EXl9/krmlBxD1xm//0Qbf2dAz+ey9kOdGLOn+ZDBcG/xKSSt5Ti9bjfSI82vj4XOOaldSASPKKlOFkRJ925K5nUMiurNBST5oMatvHxyJwcxACUxW92st6sNDyIBf2yuiKnu+SKOx/0uldUa13NDGWY2JRnfh3+xiblzHxboNoUHcC/gAFHDfoIeIKfD6OvXcxZ3zD9q02jO6Zkho/xYotgRjhSozJr8Ltc6R+fQ0+mukiKYYEpAE1IMhIFG0l5mpgFNRBz3WIoT+KOK32Nbn6olyxhRvjkYjaUky8I8AnCyBlB+BOJw7RBVaNVmJ97AVientXTv2DPWVHyhXq7FPyechx7A56F65h/2KQCl0+yBcwUGqJknaVrRfleylEyAdHjrXSMVQmYZs7MPCsj+NvlpPzyuVMbD80/zmU2N4MlVCYl3/HIWe++0wibDrOi1y3hTmj0RqQKtEcZpk7f7aM+uSL7CEaNp+RfGyE/5POPRFb1W/n1cAmQlAk1Q/9xAHrGN5sC2BSCb/fO81a4SS+TO2Wx8lDdmJrdV+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cklWSEcxcWtSM3NBeG8rbTlOL1ZmT2tvWmsva3dJSVBwMTQ5b0YrTDNEVTMw?=
 =?utf-8?B?Wm8ySHRrenoxakFYNWw0YkpTNnZmT2FSY3RVZEdCQ1RodmlXSEg5eDFNQVow?=
 =?utf-8?B?Tzc4ZG1pMTdjVllPTVpBMXhUZmJnTVBBcjIyK3FQbE9uZERZdEF5QzlCQVFt?=
 =?utf-8?B?S3J0WkMvVmRzY2pZaXFvcnFiY2RjbXZHL3BPRHRmT2RpdzJPbmMrRldqSEow?=
 =?utf-8?B?SE5sZkQ1OWFhMXRyVHNtQ1hvWnVPZy80MFJ5S2tEbVcveG0xYldrTTBJVU9U?=
 =?utf-8?B?VnFYSjJoMnBkcDd6ZFFWcXI2UFc5bVdYM2ZQYTE4bmduSi9qb3lYZWJDTnR3?=
 =?utf-8?B?blJRWVoyM29vamhjcWlBQTUyZ1lOQy9BVlFkRy9kTTBoV044bWdYeTJPdEh5?=
 =?utf-8?B?RnlmdTBhazVKR3d5NGhiK2JZZVlEcTV4TXd1Z1hiczY2SjM0ZDAvMllDUHRi?=
 =?utf-8?B?Z1NoWDhlNTFCNERmSGhKa3dqdTh2cFQ4NkVWY2lBdGhkNHZFdFZNMEFOQXJC?=
 =?utf-8?B?TWlYVU1aWERXM1FQZXk2YlltR0Z3OHVmQ0ZlUnpQZzNLaWNmZVlqMkY2QmZC?=
 =?utf-8?B?L3J6dFh2UXJKemszWUdpMmd5SVZxeWNraG96eGU3ZUMvOTFzYjN1dmhhTTA4?=
 =?utf-8?B?bloySkFsMmxWNHJCaFZUMmVWYnhkRnI5RnBPYVAwMFE4U0g5L2prbDdnWi81?=
 =?utf-8?B?M2UxQkdvWkY5b3ZsQThhUVFLQkMyeCs2N0V1RHBmMDRmdGxjMUkxTi91cm9H?=
 =?utf-8?B?TzFKUHMveGpuRFF5d21GcE1NWEkxQ1JhcXNWQU9LMmRmZWMvRWZKcEJMc2sz?=
 =?utf-8?B?UkxycFpoZ29XUUNXdDhEcDdyNERIYzBCekhUbVJOVmxDazBKd3BTMG1JWlBD?=
 =?utf-8?B?cmtSTmh5c01YUkpUR2JObmNmNXhNR21aQWZEbGs0ZkwzQTFveEN0WHBDclEr?=
 =?utf-8?B?Y0dJTlUyYVdLdU5zcWNzUDJQK2g0Y2ZreURob3pKd0s3SWw0T3JCOHdwYUNU?=
 =?utf-8?B?TkFZTnNqMEdTZ0xHbVZDbXJmbmRLc3M1UGI4MUs1N1ZoeHJ1bXdiNHB5c1RQ?=
 =?utf-8?B?Z05GaE16TWxMOFVQVitFYTN4dzZnaXMrUVRSK2c4TFpnMksrci9iREVTWlZu?=
 =?utf-8?B?MlRHdzJwRzMxWVlISitKS0ozYWkxejRMSzJWRzRYTEgwcE1STlR3YjQ5NDZy?=
 =?utf-8?B?N1c0ci8vb3dlQ3lWcVVRYWN0UVZFMWZIMzhXdFhlOEs0LzdMT2x1RFlMdmE0?=
 =?utf-8?B?cmtxMXUyM00wNmFGcklGOXV2V2xjZ0VmNVVvaGFiRTlSSjNTek1HQzhqSVNW?=
 =?utf-8?B?SlFxUTRUMXlOTVEvNzBxMFRXME9vYzVhdnJITGpPUFJORitQd1ZJcm9IWW5X?=
 =?utf-8?B?a0x3NlJ1WXdrL1NzbVZaYzJMZ1Bpd1dhVTZKV0ZYbjg5anVGVlR1Q3hsR283?=
 =?utf-8?B?U2RUVGszNTdJdk5vd3lrVDJtTWtWQmhJTEdMVTJtWVZtckFiRytqMm1hY0F3?=
 =?utf-8?B?R3FYQjd6dHRlVjl0YlJMb2Q3TXJhUlNjZ2NjVFNEN1dCbHlLNE9Za2hBYkx4?=
 =?utf-8?B?T3kzbzdXWnRVRDZQMGZzNHZ6WXpjYnNyZlRwT1lnOVpSNDJlQUtuRm94cTNU?=
 =?utf-8?B?Wnh0c2ZrLzJ1MjlWS3VRTnVzcUtOeGhHQ0xSemR0OGV5aFdqWlpjN0JwWmNK?=
 =?utf-8?B?anZZdENkWEhIK0c2cTh1TVdBMGdTQnpVYmtENGM4Z0dzTC9GK3hxUWFxU1dL?=
 =?utf-8?B?d29RQVRyeGFsNXdtdXR1TVBMY0gxSjUvbVdlR1YvNnZLZnhsOVAxM2ZKNjFF?=
 =?utf-8?B?Ri9TblNRbjZOUEtHYzhLU3pyWkZXbUV2U2p0NU96bWJsQTVmOHlVVmhVbFFi?=
 =?utf-8?B?OXpuYkRuYW11QXUrV2x0WUh2RHByRXIrZUVuSFp3SEs5aEtjN0Iwak8zWGgw?=
 =?utf-8?B?Q0tGai9WYjFLRlYxOW9oUWRvczFzNWhyOWJudjQ2REpFbk9SV3ZFVmVtbW5F?=
 =?utf-8?B?Nk9oRnc0d2JvK1dnZlM5K3RCRkJYMUhvSjdja2xKVnFkSmlTSDY3N3JsRGJl?=
 =?utf-8?B?cUZVVnQ5bUFSVUdvS3oxZ2RiVDBTcHl0ekhIUDMwa2crNHIwSFZ0eFUrWlh3?=
 =?utf-8?B?Z3BvZDg5cU9WZExoT0V1NTJ3Vmd2d2FMU2xFOU50ZHJQTHJxa0h6OFdzMHo0?=
 =?utf-8?Q?za+tqGJP61fs7/cmEyirZTw=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c18d1239-a9e7-4755-b2f4-08dc38f100fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 06:38:13.5994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gox6lU75vxQxh16DXKf4Clq43fGErZ8hIOWUMioF6qqqwHuF2y6la1LxpOGGMXZ4Kbebr4N6SSz99JvE6g57C35xFPdZCI2IyZ8ReOzx1NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10316
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

On 28.02.24 22:34, Matthias Kaehlcke wrote:
> On Wed, Feb 28, 2024 at 09:50:22PM +0100, Javier Carrasco wrote:
>> On 28.02.24 21:41, Matthias Kaehlcke wrote:
>>> On Wed, Feb 28, 2024 at 09:21:00PM +0100, Javier Carrasco wrote:
>>>> On 28.02.24 19:10, Matthias Kaehlcke wrote:
>>>>> On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
>>>>>> Most of the functionality this driver provides can be used by non-hub
>>>>>> devices as well.
>>>>>>
>>>>>> To account for the hub-specific code, add a flag to the device data
>>>>>> structure and check its value for hub-specific code.
>>>>>>
>>>>>> The 'always_powered_in_supend' attribute is only available for hub
>>>>>> devices, keeping the driver's default behavior for non-hub devices (keep
>>>>>> on in suspend).
>>>>>>
>>>>>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>>>>>> ---
>>>>>>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
>>>>>>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>>>>>>  2 files changed, 33 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
>>>>>> index e1779bd2d126..df0ed172c7ec 100644
>>>>>> --- a/drivers/usb/misc/onboard_usb_dev.c
>>>>>> +++ b/drivers/usb/misc/onboard_usb_dev.c
>>>>>> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>>>>>>  	struct usbdev_node *node;
>>>>>>  	bool power_off = true;
>>>>>>  
>>>>>> -	if (onboard_dev->always_powered_in_suspend)
>>>>>> +	if (onboard_dev->always_powered_in_suspend &&
>>>>>> +	    !onboard_dev->pdata->is_hub)
>>>>>>  		return 0;
>>>>>
>>>>> With this non-hub devices would always be powered down, since
>>>>> 'always_powerd_in_suspend' is not set for them. This should be:
>>>>>
>>>>
>>>> May I ask you what you meant in v4 with this comment?
>>>>
>>>>> Even without the sysfs attribute the field 'always_powered_in_suspend'
>>>>> could
>>>>> be set to true by probe() for non-hub devices.
>>>
>>> struct onboard_dev always has the field 'always_powered_in_suspend',
>>> even for non-hubs, that don't have the corresponding sysfs attribute.
>>> Currently it is left uninitialized (i.e. false) for non-hubs. Instead
>>> it could be initialized to true by probe() for non-hubs, which would
>>> be semantically correct. With that it wouldn't be necessary to check
>>> here whether a device is hub, because the field would provide the
>>> necessary information.
>>>
>>
>> That is maybe what is confusing me a bit. Should it not be false for
>> non-hub devices? That property is only meant for hubs, so why should
>> non-hub devices be always powered in suspend? I thought it should always
>> be false for non-hub devices, and configurable for hubs.
> 
> I suspect the confusion stems from the sysfs attribute 'always_powered_...'
> vs. the struct field with the same name.
> 
> The sysfs attribute defaults to 'false', which results in USB devices
> being powered down in suspend. That was the desired behavior for a device
> I was working on when I implemented this driver, but in hindsight I think
> the default should have been 'true'.
> 
> We agreed that non-hub devices shouldn't be powered down in suspend. It
> would be unexpected for users and could have side effects like delays
> or losing status. Since (I think) we can't change the default of the
> attribute we said we'd limit it to hubs, and not create it for other
> types of USB devices. Other USB devices would remain powered during
> system suspend.
> 
> Are we in agreement up to this point, in particular that non-hub
> devices should remain powered?
> 
> struct onboard_dev has the field 'always_powered_...', which in the
> existing code is *always* associated with the sysfs attribute of
> the same name. But there is no reason to not to use the field when
> the sysfs attribute does not exist. For any device at any given time
> the field could indicate whether the device should be remain powered
> during suspend. For hubs the value can be changed at runtime
> through the sysfs attribute, for non-hubs it would be static and
> always indicate that the device should remain powered.
> 
> Does that clarify your doubts?

It is crystal clear now, thank you.

Best regards,
Javier Carrasco

