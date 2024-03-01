Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4890886DD2F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D348410EC06;
	Fri,  1 Mar 2024 08:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="jYXSeCCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2093.outbound.protection.outlook.com [40.107.8.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE1710EC06
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 08:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wp9X+CXl7mCHzpXH37dkqVvrX/nMg4bcMXhyA1JLa8lI6sSS8vWwPym2sTuwolPKYpMHAiLnTWMKWzvvWYJHjOz9czomrAtU7DZ0R17poYQkRJ5El3uf29JZWB2WAVXDUfVfe99C4Oyxl3i9XmwVuchAA7Z3G7GtAisKpd9ubvbyVFZBM3guj/dyis8RFMB0MligyymJzGiH1DgRE+9n4BE4rX3ordh6+q8TUkXmLe91MwSrzk3qYdEJrfNkdy8250j/xt9E6BkvUzJUL1QPvLLFMFS6EakMnqYG/AaiS43FUWfC+Y96XCaWEHL9EVLrLfasxZgwAWWzll5W/UUY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeELHccgS+d2UEnIjXMBfHR14N8yFGOSX9u7CpJvMrI=;
 b=igw8VLuTMITqbYpvuJh5ibE6wHdu4WASPyWGIQKybpZSfk3qXl9/pE7EYlNsGhnlTxYqw8cW+zuwL/S2YFKSyK164vHkmZn5NczW3cVZw6VhKzX4eHXbPwB4JaWNQxBbh9dAAuYHMV+Np9OghIJ8pXJT6BriXsCu8HXvS6qLStuLzBlaKvkznKypLfc1jsf9pGo4N9+v2ERnKi2eT5SLLdqItY2AwmHmL7d/2XumsD1REN1QcEn/2Hfs5cnmVWNPQ1q3fZa+wUNobVcITcz5Smt3r9GGCXV6ACSgEANExgTj8xIsM10ouoCjlXkEAtn0RQKWscQukjhDis9TgEIAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeELHccgS+d2UEnIjXMBfHR14N8yFGOSX9u7CpJvMrI=;
 b=jYXSeCCMRWeM+cZV8DoOPvp9RqkzdnN4+eklZGXS6/86KDPvoMHtAghl6yuH6RXMc5vR33VF4BdubhpDyZ2jDnGA/vxBkumiHC3gWyO3SXO6AloHaxOr4L/lGHl6Q6EZEVJ9x2DjAFl4ayp5krqjfj+hSDxqexvZqeo6dxtgvTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS8PR08MB6344.eurprd08.prod.outlook.com (2603:10a6:20b:319::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 1 Mar
 2024 08:36:40 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Fri, 1 Mar 2024
 08:36:39 +0000
Message-ID: <80e5800e-366d-4f29-80a5-8445ab692e5e@wolfvision.net>
Date: Fri, 1 Mar 2024 09:36:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] usb: misc: onboard_dev: add support for non-hub
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
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-7-a0aff2947040@wolfvision.net>
 <ZeDgfIojODIbhs6N@google.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <ZeDgfIojODIbhs6N@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS8PR08MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b779804-9090-42a6-b520-08dc39cab6d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfYXka8SBp/49XZNVQJQxd/+xy6Dr2+UAv5iKaHDZFdUJ5RFI45eZlI3V/msc9W9qRQtucGX2fOiyGyeirUFJY14CDedE9DuTkaW+qOqJTt5+GKUJn+vEEt73Uap18fwgy72p82xYgMp2TmC4FfRsvxZqftObzKFthLi9PNlG0BPWrML3hrq4into/kC7OAY/6Zf8zBI4DZZ7uuojZhraye5DjJhyAYZyOQ8j72Xrm671X8s5QsllpyRoqpx4oD5WisCDlcK0Mn5x65UB51MWt7tW17JWeGEfViT/i0nDJPX/EcXdu6xeifDXE7Kwysb506BB2ZfsoWOcFohBBfyplU+Agwb7nzLTtKgFc7lDYffTYBPnzSgbnRaSOsKRO1rk5mJgjEgFVExz6Jsu0uLZZEIstTEPQkoAPH84C9l4UTmbfDxP+cfHtX3MYhoyqGRRljtZef6FjPTmNnw7LhK0UZ1Sj18sasD02QMWXuASiH7koW08w8Z+yMSyYPodAY7uHLgvSfuI/ZGDCnV4MVR9lrtfxmuZBznxFI2Uh377NDS0fQW4ONaHjZXcZGyjY1Ul++uSqR9M/VhlpWX2ogCAX5DUXJmxfAzC0lowoSVrgG5dxgYtNQoVJ4c/tpy8XhIlxsZM3oT4Cjr+kvIYqK6IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3ZwbE1qZHUxVGdET2xBaEdZaXBGZ25kcHdNMjUwSzZWdjcwcGs5YU80aVhh?=
 =?utf-8?B?c0p1N1dZd1hGcXNDOVE1OFZPR0ZtTUdTM0VHenVXSmlGK1c2cjE0S29pSk82?=
 =?utf-8?B?cmcvWTNBSzZzbFlnMXVEcDRXVC9OY0ZqMWZvYkp0MXgvK2J6dWtZYXQyUVA5?=
 =?utf-8?B?ZUhIMDhaUEh4emU2ZDhKZWo1QmZSNkpGT1dEQUV6N3hiL3hRU29RUjI2aTY3?=
 =?utf-8?B?MTFyQWFqOGFpOGorWE9udjcvVm0yR3BDQUtOaG96Tk5Vd3NGWGxNVGlMeWRX?=
 =?utf-8?B?R1pDb0FDUVc5TDdYdi80bjVqaXpvN2lPd2hKQUk4VlgzcGRHVy9oeld6ZDV0?=
 =?utf-8?B?YmcvRHFTbXk2YStiRVY4dHNVaGJWZkxJWldVd1pxSmdER3JOMDBPNyttWGFW?=
 =?utf-8?B?T0tPWFFiVDR0ZnErTGQ3ekFONTVoVTA2L2EvNkxkVmV2SWVFOGpHNklzN3NB?=
 =?utf-8?B?dFBocVZ4S1BPRElYY2pFTkRSeDR2SExnZWxaRmF6U2s2ckVxYWJQUmJia2tz?=
 =?utf-8?B?akRRSTNENjY1by9DdEswbFYwaUQ5SUpOc1pzVnZ0N0NIaHdKamNyZk9vQXVk?=
 =?utf-8?B?MmpQTFJJd0ZLSUdqaUF2RUU1VDNTbk1RbjRtekNGQVNzTW5PQld5UEN6cVk2?=
 =?utf-8?B?TjRXcEZ2cTJ5cW81UHN2cFFLVWttZ3NCR1ZNV05BSUZsbjVmWVFwZnYyd3pK?=
 =?utf-8?B?N0NucWVaeXhIN1lxV2o3RUd2REY4aTJlNDNnM0V2ZGJ3QVNFTGIrRGtjYXoy?=
 =?utf-8?B?bTBuZ0Y0YzdQSG5rQ2NxazRGWkJnRXk2dmVlSTJoNWN4Y3ZKakhLckdvYjNB?=
 =?utf-8?B?cHRjZjVid3VRVGw4VktyMGJ1ME02dFdENEliNHpGN0tZYUVnZjNzcStzTEVp?=
 =?utf-8?B?OElGUGUwM1RPeU51T2o5d3N5Qy83YjdZRWlmaTdsbm1yUnNZTUY4WnRqSHNB?=
 =?utf-8?B?SUZjSHJNdnBWSWRVbTJrME1yTHdOc1Zlck03bThCd29CWmFVM0pJcnR1YVIz?=
 =?utf-8?B?QUZwZHJaTis2SG5tM0l1eVVJcHdJN3JXNWVDeU1RcXdQb0ZleEdnZSt5QkRX?=
 =?utf-8?B?RVRGTGpJeUpVQjFGSlhLWW9GYkhveFlBUkkvTHp6QjNEUHNrVEsxa21sbmpZ?=
 =?utf-8?B?aXNiTGZUdE9YbVJzWlNpQWhidzQydTdjRW5laWZnV3ZEQ3FCVGRvT0FFRmpB?=
 =?utf-8?B?SVN0aVMvalVYTWhyd0xXRndzL1ZBSGhSclZBYlN6bWFNeGdVUXprVHBjbHgz?=
 =?utf-8?B?SmdzT1ZYVnpNd0xwSnZYNVExdUdobnA3VGgxOVEwUjBDMGIxOVc2WExEWWdL?=
 =?utf-8?B?M0lVWFM1RFQ5L0s0QmpxNEluU1lKUEN6TktydE85cHF5elh2WlllVTNvWkJj?=
 =?utf-8?B?Y2YvUUthZVRWMytmeHRKbHROTThCOEJXR0hOSEluSnZraytDYWNTM1RScFRE?=
 =?utf-8?B?SkwxekJVZHlFM2Q4Mk9kbWUwOElJclV1eU9kbnUwd0k3aDVnMS91cXdZdVkw?=
 =?utf-8?B?YVJpSUpiR1M3MEkwdEwydTQrdmhrd24vTUFSdC9VRVBGSTlxekkxNTlJZllq?=
 =?utf-8?B?clpGN1NZVlh4THcxYXdkRkdOeE5vUlh4YzVRSW5xTVdnemIzdzZFY3IxYlFl?=
 =?utf-8?B?YkVwU0ZJdis5Y1RsalpFWmtub3FibGRRYW5wakZvWUdkcTRJN2lrL1NWUDBn?=
 =?utf-8?B?VW5aU1JkY0VybENtWU9xZStzcWJoN2dsaU1rTDBNY1pQUjV4dmhONmVIVi9j?=
 =?utf-8?B?R2F5OC8zdThnaC82TDNicmRXY3JBVGJ4RVJEQnBpcUE1cS9CSFo5c3hsbnV5?=
 =?utf-8?B?MmJURStOQmg2U00vbVVyRC9BK2lpUGxtVmxYYW5CZkp2THU4Tnc5MWJXdEQ5?=
 =?utf-8?B?ZURwdThZTDFtSmRMNi96SmR0RWVJeHZxVitONkt2ZVN5dHY4RGw1c0lTRE1s?=
 =?utf-8?B?RmRaTEdCT3hxN3JjR0NTQ0R2MGNsZ0RMY3dZcU1sRU1DWUNyNk5TcXVCNThQ?=
 =?utf-8?B?b3dhaHZ6TGh6NW95bnJDREJrYW9qUi8wSXQwdFpuUy90MUwvTlRwcjR2eTQy?=
 =?utf-8?B?MlBzWlVCVmxYQ29xWHRITDkwdXBLbmhsOXFZaHdyY0xTckpUMWtRQ2Q5elBG?=
 =?utf-8?B?VjNON1BjUlU1S0FxMDY3TGZYc2d4RExVS3I1YnIxVjRXKy9mVjdPY29tUk1E?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b779804-9090-42a6-b520-08dc39cab6d9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 08:36:39.5578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6rX8HC/LhZeG0aYO3+zUjRjppuyDq+5aCIFx0hlfx4TDkAzcvrFlafV8962l5Lno+CWouLRiQL2x3qeMX8bXZT73ezHlKVqtEdhKDUk6ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6344
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

On 29.02.24 20:52, Matthias Kaehlcke wrote:
> On Thu, Feb 29, 2024 at 09:34:50AM +0100, Javier Carrasco wrote:
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
>>  drivers/usb/misc/onboard_usb_dev.c | 25 ++++++++++++++++++++++++-
>>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>>  2 files changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
>> index 4ae580445408..f1b174503c44 100644
>> --- a/drivers/usb/misc/onboard_usb_dev.c
>> +++ b/drivers/usb/misc/onboard_usb_dev.c
>> @@ -261,7 +261,27 @@ static struct attribute *onboard_dev_attrs[] = {
>>  	&dev_attr_always_powered_in_suspend.attr,
>>  	NULL,
>>  };
>> -ATTRIBUTE_GROUPS(onboard_dev);
>> +
>> +static umode_t onboard_dev_attrs_are_visible(struct kobject *kobj,
>> +					     struct attribute *attr,
>> +					     int n)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
>> +
>> +	if (attr == &dev_attr_always_powered_in_suspend.attr &&
>> +	    !onboard_dev->pdata->is_hub)
>> +		return 0;
>> +
>> +	return attr->mode;
>> +}
>> +
>> +static const struct attribute_group onboard_dev_group = {
>> +	.is_visible = onboard_dev_attrs_are_visible,
>> +	.attrs = onboard_dev_attrs,
>> +};
>> +__ATTRIBUTE_GROUPS(onboard_dev);
>> +
> 
> nit: remove one empty line
> 
>>  
>>  static void onboard_dev_attach_usb_driver(struct work_struct *work)
>>  {
>> @@ -286,6 +306,9 @@ static int onboard_dev_probe(struct platform_device *pdev)
>>  	if (!onboard_dev->pdata)
>>  		return -EINVAL;
>>  
>> +	if (!onboard_dev->pdata->is_hub)
>> +		onboard_dev->always_powered_in_suspend = true;
>> +
>>  	onboard_dev->dev = dev;
>>  
>>  	err = onboard_dev_get_regulators(onboard_dev);
>> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
>> index 4da9f3b7f9e9..58cf8c81b2cf 100644
>> --- a/drivers/usb/misc/onboard_usb_dev.h
>> +++ b/drivers/usb/misc/onboard_usb_dev.h
>> @@ -12,60 +12,70 @@ struct onboard_dev_pdata {
>>  	unsigned long reset_us;		/* reset pulse width in us */
>>  	unsigned int num_supplies;	/* number of supplies */
>>  	const char * const supply_names[MAX_SUPPLIES];
>> +	bool is_hub;			/* true if the device is a HUB */
> 
> nit: either drop the comment (the variable name is pretty self explaining),
> or s/HUB/hub/ ('hub' isn't an acronym).
> 
> Acked-by: Matthias Kaehlcke <mka@chromium.org>

To be honest, I added the description to follow the same pattern used
for the previous fields:

unsigned long reset_us;		/* reset pulse width in us */
unsigned int num_supplies;	/* number of supplies */

Best regards,
Javier Carrasco

