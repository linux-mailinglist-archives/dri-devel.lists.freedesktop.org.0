Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DBFA7E16A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC17310E4A0;
	Mon,  7 Apr 2025 14:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="hlLXgiRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011028.outbound.protection.outlook.com
 [52.103.68.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5044C10E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWa4ni5lM89ftFBolIU/UplGFGmx2MhlajtiJ6vYKwi5dS3cLBBGpXD9ACK7VRPOwtBi5nWzZTsfTdk9ltBchkG1zN2XNk90k+tgIwqBsyjHxZPGxmqU+s+Lp/Gm4CJhpLlWLIO4iBlVcMOnh7Tn8Asiemytcsd1OEhaoUh7pQKRR/erzAw/6VrBnOGvW5zoq9SL4TjX+9kDhd+gAbLNJLWO3XdcpSajj9/Sz6UnU+NcfzJC/JfdgrptTyUDf2e0HqMDxq+lY8J6tWIJtwQ8fRlpoTO3vC41h0ZsbzR83OLkzplJgpmswcfzALdpy5RGrq//KnJdYtY+roulrHWC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0dM5yvqiFsDFIaJ9rroDlt2+tktDTqoYmy+5vh66OA=;
 b=Fzv2q3axntzxCgQM0cKvKNJFyWG8XhnDw9BR8bS7377PN594IINwZlHSrwWqgFLkRh3qzkheOyAv8eQkPATGQ2OVQifrXGIK8FF6g6PTK2VHx8t4xB68kbKVHZodP5GxChfZdYIPp1aeLqyDxir6TMd6ufLT6a50feINwnQbmOOVOnvgh+aT2eJgsa3UwxuLf+mg3rZ+MX5ybB0bwzspTv4SQhCbxO/d8ygh1CE+4bUSyDTa4q9LoXvmd9ikODHDpCqKQrqE+0Ul8M1vZ1dfvQ2AukqfHnNV5R5QWzkBAuDRHEawLfKOE12f6r/b3t3fzGtaHDwXdEdJIsXTsnfjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0dM5yvqiFsDFIaJ9rroDlt2+tktDTqoYmy+5vh66OA=;
 b=hlLXgiRoxxMB14+ORVXjN+nXuTL0KyUQ8qYElPKPXdGDweHN/Q8MVJWCGrEUSVCdLhHvq7Q68EVlSpHgHv5pCCnK5nkDMhlU/wzowv83AsZi3eMcwG1ZGQ2H2YRv2koKrO2MYQ7y1Z7ADl4VCh18xx8EL+KRBmEkBd4bPNxxaUNoZJZSGTimKoCad4/wWKNpp01LmVe2SRkznZjWImVVS0mxqZd35roHUaoxOclDMDTGrx3cnNSL6qEL1YH87DaDoX+A5q77iUmWoKribx0JbPYll8KLkdkmFY/Q2u2yO94b+1LKuaPqEXXrg972fXxjKa2cHAkl14ZiIUlEYo95mQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB5859.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:66::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 14:27:13 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 14:27:13 +0000
Message-ID: <PN3PR01MB9597227004F9472689FA6395B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 7 Apr 2025 19:57:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Use proper printk format in appletbdrm
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, "airlied@redhat.com"
 <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com"
 <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Kees Cook <kees@kernel.org>, "tamird@gmail.com" <tamird@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
References: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_PZXPAklfkMlx6O@smile.fi.intel.com>
 <PN3PR01MB9597E19A55EAFC3E7B191F5FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_PfwShQX95IyHWR@smile.fi.intel.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <Z_PfwShQX95IyHWR@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0083.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <8f6cfdff-001c-4823-985c-ee227e7c0813@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7262930e-7fae-418b-08b2-08dd75e04a37
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|19110799003|6090799003|5072599009|8060799006|15080799006|7092599003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmpIQTBtZXlJd083NDdybDVmMFRiM2RTd1FMTkZuNmxTdGZ5TGlZZHBySW9u?=
 =?utf-8?B?VmRDL1czSWVUaVZuWldHeUxQSllZVlVWdHlUMHV1VEVrWDZYMXBvS0FpeDN6?=
 =?utf-8?B?RXlUMHV6bWEwdjN6eE5zUXV5ZTErSFhBTFhBeEU2ZmNNUk5tR2o4Q2pCeGxt?=
 =?utf-8?B?dWNnNGQ2emVCWkx2Q0l1aldrV3AwTWxuZStYckxkbmtRMlVtQUdEdDIxdTZP?=
 =?utf-8?B?U2h0VUdkQnFrczZLcTFseVBrVWI4VzJNNEFmYUtyR25IOFF3MSs5ekZsTmh4?=
 =?utf-8?B?YWt4MUV5UytabUt0Mk1EVmpiTVYwOUJxQk1yV0pUb3J3dFBCYjBiNGtGUC83?=
 =?utf-8?B?YWR4QTdmMU1SMTNKeVZpYmNRYkNYQWlVN0hXSnJrc0pGWWVTTCtFM1Mzc1Vt?=
 =?utf-8?B?bGN4WHlQalNwM1V3WmNhUTNORXFZaWJmZTJpaTExdHVONVBWSEdXYzBtOExm?=
 =?utf-8?B?bFpaYkpnT3hwaE8yWThEQTVtUFBCb0gxREJCSzdkTFE2WnErK1FNUmdDU25o?=
 =?utf-8?B?VTJzaHJyNUFNckp0dkNDVEdVN3crWjd4ODNPcjlVMnY2cERvb0xxSDlsWnN0?=
 =?utf-8?B?QWJSa3E5Tng1d3BMUHkyd1Y4dUhSV0hqMDljMEFLVXJ2YWhiTlV5d042WjRM?=
 =?utf-8?B?Ym0wUGFoN1VSYkhQaGc4ZGMyclFZc040YVdOVnBCdThyMWtNTStJbVQ1NW9Z?=
 =?utf-8?B?ZEQyV0JnZnRuTDVSUytGOU9sQ3JzOGNvYVZxUEM4WkFGVkF3TzdLUFRKbHJh?=
 =?utf-8?B?LzVnZ0JZNG43OGJFMmF2V2tIZURsQmtrK0UvRWpFcDF2T3Vzbk5WbVVsVERS?=
 =?utf-8?B?OWFRdW1TZHY0a1BvbjNRLy9BRER3aHJkZ21Sa2JlS3hRWkpyYnFENENEaWl6?=
 =?utf-8?B?dG9UWTd4ZCttQzN6bEQwTEtxY1FIWFJ5Z0dxVVpKeTdPeXpsRHZsWUpWS1ZS?=
 =?utf-8?B?RnkzejJkUGRLWkhqUG5qbFc1VmU2NGtha2crcTFQd3VHTkVQUE9xV3o2RTlP?=
 =?utf-8?B?RHVaQTV1OU9iWTRlSkRtLzNvRFdVOEVlYXNWN2U2bG4wQUw4V1lsbTdnNXNu?=
 =?utf-8?B?Qlk0VmsyVGNyNFhnZkRKR2xHb244VkFzZ3JMVFc3djQ0S3lOYmhONytoRFd6?=
 =?utf-8?B?RzREL01MbThXbkFSWS82Titrb0hDdzl0bXFtS1h1am94a1QxNlVMZFlrdE05?=
 =?utf-8?B?NjJXcjhGVXJQT1JDczhJek1rT3htVWpUZWQvcG1nSHM0NlJzcEVNZWt2Ykth?=
 =?utf-8?B?Qnl5U1RQalpzai9CRTFBdVI3WFZkeE1iWkJEZStxMUcwMFV2aXB0TkF2Y3dw?=
 =?utf-8?B?OU1XOWpJZVN6T0RLREFzUEMyZUdVc0RPcU9MV3RINEVkSjNaQXVlSDN3NE1p?=
 =?utf-8?B?QVhDekVWTjROc1JhVXIvMlcweGpucXRKdGs1RllaQUgxcDB4MU92TjFNN0tm?=
 =?utf-8?B?UTZOZTVyUFlkcGFPOFV2RllraVhsMmZlMUtUOEdwUE8xNlBoaFZzdEpRUTFE?=
 =?utf-8?B?TG01SWp1NTZnZldGWU5lYU5VeG4vMzYxeU9BdEVPdk84NTZKSStwVWZQL3I3?=
 =?utf-8?B?S1NGQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmI5ZGpFU2VUcktvMHg3ejFMUGpnZlhYMjROZ3FBZ3MwSjFZc2p5dmQ1S2F0?=
 =?utf-8?B?QjlvSnZqeTllOXdCOTdpS0JaUGRSc1NRajF2b2V6a0NvajBIN0MyRWZIK25R?=
 =?utf-8?B?WC9GQ0JGRDFLUHdLYlhMWUJiN1BpelNJU3BvWFl1dzQyMWhpaU9VRHdvWCt1?=
 =?utf-8?B?NUJjY1EyKzFTbGZUNlZlQUhJWjZRT1JoVVNjL2RzY1Ercjdla2JBMUVZMjR2?=
 =?utf-8?B?S2xFSlYwTHV1SXk5UzRHUEE0UHY0TjUxSDFVNGRFa0pzYnBwdFFxQnN4N0Rq?=
 =?utf-8?B?NnJFWHJqOVVNaVkzbEFEYzNWOVFyRXlWYkhSZTlNRmlYSmlmMURyY2p3c1d1?=
 =?utf-8?B?NEFNZm96VHRuY08wTVdHbGdYbnljblBTekgvdElQVXFyK3BwSlVMWVcrVjVG?=
 =?utf-8?B?aUFYaXphRUZvd2J5VExCTWN3eHZKMmtQMFFzc3hoNjI3dXJCbzF4OTNyeGJa?=
 =?utf-8?B?YmVFd1RWc1VjYjNzckRIRG1aUW9DRG9vQjhpbEhHV2xLbVFKck03L00xNVkw?=
 =?utf-8?B?Zzc2MXBHNzc4S1NzWTVEbHpjZEdCUVpDa1pnNFVvN0xjR0UvaEtmMDFlbGgv?=
 =?utf-8?B?N09aSnhnUDFuSXU3MXJ4Vk55V2RYQ0JHcUZlWVdJQ29DMFg3dHFHYkZhenh6?=
 =?utf-8?B?cnRuWm1kMTFnbURsTCt1WXJYOGVEZU13R1RRNTNscTVRVjhPME9uV1BweG9q?=
 =?utf-8?B?bGttY09VZDNsOVg1T0RyMGxBbDA5bUJXanBXTzFIQWNQa1VGWVg4Rmk1aDMw?=
 =?utf-8?B?Q1NSVzRocWY3UDNVa0xrZzdoZ2M1eW11RmxwelAzeFBzVVdvVForTmRxRkdY?=
 =?utf-8?B?NWdJdlJMcEF0ZFB2cHkxT1U4czFkSGVuSC9aWnViNGsyR092R3BsR2JhenB6?=
 =?utf-8?B?YW9sNEhNSVpXMkprNmJkd0lVbGhNOHlXdFNwcmI4Z0ZBTHB6cnRwSUhPNFBh?=
 =?utf-8?B?YkxYYWVTMWFRdjBDU1F2Kyt3RnBrZnVPcmhSeVo3bzBuY3l6Tk42MjJlTXUx?=
 =?utf-8?B?a01ydFUrV084VEdlemVjUzYwbkZhdXlDWllvRnFpb2ZBakpoejdxdzVVSW1B?=
 =?utf-8?B?NjF6YnFDcG9udnY5MFdNTHp2aXZoZWpkSm53WmQ1ZW9BY2psY1hpMlpLd1Ja?=
 =?utf-8?B?Z1R0SU1CVWF3bHZSY3RteERCcWFRcGozYzRzbWM4K2RJVUJIQ1NHeS8vQ1VC?=
 =?utf-8?B?bjU4alh2cnV2ZCtVQXBOci92cUUzbHJheEZrZlJmd2MyVUxNNE9HbCtKUnBS?=
 =?utf-8?B?WHRJZlpIWUF5bVI3S1ZJTHU3MmRKNXlYODhrTVB1SzhjN0Vza1NZdm5lOHlT?=
 =?utf-8?B?NmZtenNEVmdEanZyc2NLWGZqNy9uWkFtSUUxL0ZCcEFmaG9OZlJlZFY2ZnBi?=
 =?utf-8?B?Q0VRRVJ3WW5qM1VNTlNTRjRWUjhZbHJ0VWc5TXRwL3lOcmpvWnFYckdrenNN?=
 =?utf-8?B?bG4ralFnWGJYQjJtMkZRWXhpWjBibWV3RldMTTRHbnR1bnJFaTBRa3NvTm1D?=
 =?utf-8?B?OHpTbCtLaFQ1SXIwYWxhRGszRUlEcGZtRjJXdXFIbVZQdW4yemlHR2pGMitW?=
 =?utf-8?B?RW9JZTFoUkcwTFBRVC9KSytUaXI0ditmZzNWb2o5ZnE1SkhIcXkxNitjNkpQ?=
 =?utf-8?B?Mmc2RGtaMXBqTUxEU0RpMXdBR1M2Q2RKa1VEWllud0FNeWJOMXNlczNxUFhH?=
 =?utf-8?B?STQ0SFVPcjltYWI0QytrTnBOcnZHYkliUmxpdkhDRHQrekY1VnRRSkJhdG9y?=
 =?utf-8?Q?kSbo5ODH0SqqvQqES/ShdeRNFfxO54wVT2igWro?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7262930e-7fae-418b-08b2-08dd75e04a37
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:27:13.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5859
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



On 07-04-2025 07:52 pm, Andy Shevchenko wrote:
> On Mon, Apr 07, 2025 at 02:17:00PM +0000, Aditya Garg wrote:
>>> On 7 Apr 2025, at 7:26 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>> On Mon, Apr 07, 2025 at 07:05:13PM +0530, Aditya Garg wrote:
>>>> The vsprint patch was originally being sent as a seperate patch [1], and
>>>> I was waiting it to be taken up. But as suggested by Petr, I'm sending
>>>> them via DRM.
>>>
>>> Your message is detached from the thread, make sure you use proper tools, e.g.
>>
>> It's not a problem with tools, it's a problem with my email provider.
>>
>> Microsoft now supports only oauth2 for SMTP, which git send-email doesn't
>> support. I had done a few tests using msmtp with git send-email, but msmtp
>> also had this detached from thread bug, since it doesn't read the message id
>> specified by git send-email. I've been using macOS mail for a long time for
>> kernel patches, but since it was a pain to reboot to macOS every time for
>> this. So I just tried using thunderbird in Linux this time. Now this time, it
>> was a configuration issue in thunderbird, in which it was making a copy of
>> the sent email in my sent folder, resulting in 2 copies there. I replied to
>> the copied one by mistake. I've finally fixed this issue as well, so should
>> be good in future.
> 
> There is a project called email-oauth2-proxy, which makes it transparent, so
> just take your time and configure your box or find another email provider.

I already have a way to get oauth2 tokens for Outlook, something similar to this.

> The above is not an excuse to break the process.

It was an honest mistake, and I just said I managed to fix it and should be good in the future right?
> 
>>> `git format-patch --thread --cover-letter -v3 ...` gives the correct result.
> 

