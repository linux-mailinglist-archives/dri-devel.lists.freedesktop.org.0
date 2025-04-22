Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20156A96189
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321A10E174;
	Tue, 22 Apr 2025 08:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="JNSlZw1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011037.outbound.protection.outlook.com
 [52.103.67.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6910E174
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3dGkOCIeoRxsF62+NwjWqiUJ1SnhBR38ZplLtdH3Wit0TT9gTJ8okT6BIiD3NioaVId/NGWUKCwTsW5mCM9fDTWNvkdPZpLKzI+VFO847KzzP4TvZcx00KrXalkayschIEi/wZgWhZrlzX3LWAhUSv12BQ+fEnHoF5XsbPN7lyfQ44/a2xV3ziULhPwkRDOybwNGvNQx5gMYBMNMcDbWlz63zpDIqgQFo5L9RHY2m+i6/ML9NBIKAwQf8EgMqLBq4ZZXPtnHMGt3uejoQ8GtrCmxvpqWHhw1+Qd5WKiTPvgsdHg5MxzhPoGkpKJL68oBsfK+2tj693e/rYImTrHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4MVuYhk59MIDXtBDW7oQHPIQ3QFj9hh2GXnA329RJE=;
 b=pSFMUOzUo0iYrJaEiQ+mAPbVYAE4JcLfBFl4kzjO+oNvE+JlZuAi0xtIOVttKFKdUJCysCtJE0PBLJTJplVjNsFwnEY0v6W6k+4CMzbfQet0QGoa4uWKeP9Et+gzlM5gGSG4JOKbWeQxJZG1/KsjeSMawQWGQxhKLr7G7BSK+x8QrLiDzAANnVAoeuaRSX8VIdUR/VGesXM/XhgaEvU8XNevKPoPPys5W/GoFdAbtgvhqCrC1RLLSsKjBMO/CbEHVuUbb/9ZnYSg/+8QGHeXbZl4xLV9v4qULoVnHs8B1qpGxstmpTAl+BwK4aG40NMeHV1aPK6fg12XGdCXlFr4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4MVuYhk59MIDXtBDW7oQHPIQ3QFj9hh2GXnA329RJE=;
 b=JNSlZw1lWW4f+HeS2ef52p3FurfUklXBLkX2XHj0UHa1Wl5RKTjXZDpRhCv8g9zV9x5esVBwSuARmpRmDqxU2m9+Puj9rygOa62djtDArykuYTjhRQOwFfPva14JfC0iagIpHLeRKVZ+CptUI6MZEH6hBhl/b2vwPrEFf39lr9rLZAEsc8qvfF7pR9FPKYcfd234gFqwqEdbSM1q4x8BQOGlHeTrXTTY8bgkaCsHCuLQGC5o5CwnXZLa4RdL1z3rtNt//RSI4EANZMQG3XQ5zTaPYDx3ULLd/+yshc7QIRaPd0RfJwen1Sip3RZ9k1SXgQvElOTEJTdyLnel/TGHCQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::5a8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 08:30:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:30:03 +0000
Message-ID: <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 22 Apr 2025 13:59:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Geert Uytterhoeven <geert@linux-m68k.org>, Hector Martin <marcan@marcan.st>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::17) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <a511caca-ce0f-4a1a-81dc-c2faf7caa563@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PPFCAA8F9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4f6130-76a3-4370-d188-08dd8177e116
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|5072599009|8060799006|15080799006|7092599003|461199028|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azFHNDN4bUZTL3BRcWEwdkhQYys3MGc3ckpXUjNPSDR1eDdPNCtGZ0hmQmRv?=
 =?utf-8?B?M0twVE5wdWtYSGY0QitYbmRmMWVxa09EZnpBeW4rcStJV0JmWFk4ZzVwbjYy?=
 =?utf-8?B?S2FlWDEyTndXZTJWb0gza2hyMjZlbVNHNS9Ic09IOW9HbS9tUER6NUR4Tlkw?=
 =?utf-8?B?WkQwTUtUUVBwdEZRclRBaS9xVXU0YWMyVnZ0N0NsOHplbFl1TElyaURFdFUy?=
 =?utf-8?B?UnJuKzJZdEoxejMvOTdTZ0Vsd2VWUkF5Und0YnVQWTlHbXgyRGJseTJzY1lN?=
 =?utf-8?B?bzlMeUtuazAyUEltYXFZbzNnK3huWERPZHgrR1A0dk1pNG9VQzhvMnFQeFQy?=
 =?utf-8?B?dUx1SEg1WG1aRFZMOTc2RXRyZklwMDBqWEpoVjdJdjNPOTVVcVpnbWd2a3RK?=
 =?utf-8?B?cjhYazgxdlZhNEpocjJhTHFnZmx6SXRTeEdSTTUxU0xQUjRScXJnZmJFUUxG?=
 =?utf-8?B?eVZjOVVQc2F1anFMaERqd003Q0hSZlZDeWNmOUN6RTF4dWJISW52dGJtZmJt?=
 =?utf-8?B?YkxNR1RKUTVSeG5aSHdzTkVMT0loQmZMc2JVNWNqcnNTd0RXcWY5UmtUeVRo?=
 =?utf-8?B?dmgyak1oWmI2K3N6MFF6d2JFWHNzWXdtTDVMRjB3M1lMeW50RWpseFZZanJy?=
 =?utf-8?B?Ri9LaHNsUzJhOXlmeFAzMUFsQU50Q2dYaU5abkFCWTNONnNubUk1ODRJRy93?=
 =?utf-8?B?MGdwWE1uazV3TytZVjFjam1YajhsakMybzhOVmM3VW5UR1dZV21sUzRQenUr?=
 =?utf-8?B?eE9aZVNkVEY1TWxIRWNmN2VnS2RMY0svVnZBYXlHQnlQYnFzUUVxb0VoQVBq?=
 =?utf-8?B?VWtGV1BYTktSdjZwNUNhUkRLT0hmWTVjcG5rd3hEQ0JYMHNwcVROeDNId1cw?=
 =?utf-8?B?M0xXRnlwNXlKb1lIZEFoOWxtSG9uMG5zSVdJREplVmZaU1J4S2RoYXVrQXdN?=
 =?utf-8?B?aC9XaWdFSVk3QXFBMGRranNUWnROaTNDSUZrUEdNZDFlOC85a2VSeU4xaXVV?=
 =?utf-8?B?Zlk3YXlQQXBaZ01yNjBRQUMrT3BtZnIzcWNCUUdRTzRXTDFRYnN0ZmtocGMx?=
 =?utf-8?B?dEVPcjNTQXlNSEoyUjJab2svQ3hTbm5kdmgwc0p0T1ZPVEs2TyszZUpXZEU4?=
 =?utf-8?B?bndTSG8vVG9SV2JzWTVsWWdHRWR2djBFajB1K2ZhaHRvMkZsMExBM2hOa1lK?=
 =?utf-8?B?RGhkemE1ZXNYUXBOSEpDcGwzTmZsN25neGFyTXk2RGFoWFJ1TUh3dTJQdkRN?=
 =?utf-8?B?ZEd1RzdjUkplMUM5TCttS1l3MUE2MzBHU3BOVTYxcmhjMHdLWld0eEllbHdn?=
 =?utf-8?B?Q0diWW9UdEdWODVVcXhkY1dQcDlqajN0andaZ3VrZWNlR0lrTDZvcmVpWmd6?=
 =?utf-8?B?QWxJRHR5NUxLd3duNXZRM1JEM2phY093Q003QzRLNnlkbnpXOFNkU3RFNWpE?=
 =?utf-8?B?WnIrQ2VBWlZ3R3Uwa2lNUWR5T0YzNHorZXFvSFpvNm9sTTdtV2pJRGZRNUM5?=
 =?utf-8?B?Z2lLSTNuLzJUZDUzZHBRWm9YU1QwSjRWUE8wRGhHT0FVelZTSVYvQjlQOXJC?=
 =?utf-8?B?NTZaUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZhTnlsdDJFclRuYnE5NkZvVHNhcVBucDlOSGNRQkc3bE5hR0pNRmRyUTdG?=
 =?utf-8?B?NjRUVUVNTEVPak5md3F5NTZWaEE1MXUzZ2lva09mOFY5RFdtYS9VRldrWDli?=
 =?utf-8?B?QmIzTkx0UVR0RFJIVG8ycG8vcWJkY3d6WXhHbHdOSzRudUlNc2RHbWdkSHU4?=
 =?utf-8?B?WUZGRkZweHNPWnBwVmFERS9SZkJzanFDQXkraUdVZEJFVEVyTlhOV01VeFN0?=
 =?utf-8?B?K3BqVXh4dElGMDdEQXdiaUlaemRRLzNlcG1UbUpEZU0vY3N0cFVLTjBTVlJr?=
 =?utf-8?B?ZXRRV3RmYWNPbWtlR2pHTVhpMXluM0owVnFSMk94ZHNCRklLcXBrS2Y5ZkVJ?=
 =?utf-8?B?UnNKeElSekk5TXdRUGdSZFpSNXliVG9WNTVkZFB2OWYxUkNacXloc1JoZlEx?=
 =?utf-8?B?aGxxY1ZPWFRTd0JJWVZ6THRvUjM5RlFDbW41c3UrdndmaGpQZjE5ejlMMTJD?=
 =?utf-8?B?MW1XV1phVFQvVHR3TjA0UTdOeUhtdWhlTUtWQ2NSSzFVeFI0UjdhQkZZcWho?=
 =?utf-8?B?VVBQTjZFTHpjR0NxMjk3OVkrNXpkdGxZcFYxQ0lsNjZQZHllTW9UTitwR3Z2?=
 =?utf-8?B?aEVabDVFcDdteFhhTDkzZHlSSzBaS29XNWhuWGR1ODhseFo0N0lIQjY0ODhY?=
 =?utf-8?B?MnhXYkd5U1VlR2xFR2JUclBtY3Y5M1hjcXNlNzErdlo2M0VxeUorVDhTSUdO?=
 =?utf-8?B?Q1RpWnhldHRtZy94a3BDNFRvTVQyT3plQzY1aVg3a0ttakdoV1VUMmJkVngw?=
 =?utf-8?B?SFF2ellJQzZNZmRiMStJSGZOSDhkaVFXeVFPVWw2WU1qM21YV0xyNXRlS1Nk?=
 =?utf-8?B?cFdtSmVsL2IxczlwTWgrYmt6dGtrOVNlVWJOZElLTXN0Zm85Q1VCZHFsQjR5?=
 =?utf-8?B?a0JrUGE4UjBhNTZFeU9IYzJLRHc5TC85SHg5Wkc3K0t1L1pTZzRXSU5EYytT?=
 =?utf-8?B?WEZmV0Y1Nk1ZbmZCWU1Lc1hRTzlWTnlTNzZvUmZRYTJ5aXFiU3dhckhEZWZT?=
 =?utf-8?B?dG5aYnhVbU05c1VPYVZPQmJsYjRNc05uTzdycTRoaUZlT3BIbjhJT2JLQllL?=
 =?utf-8?B?SkswWEVzU3FKNTlWS3ltS0hkYW81akpkOVZ4WHYxWUVxQ1d3ZVNzSFJEZDNY?=
 =?utf-8?B?ZkNoQ2l0cjRNaWZ3eDBkVFJZSDM4aXZwTjd6Z2ZDUzNRRzhVWkRpekxxN21E?=
 =?utf-8?B?aWxMSjJIM05JR0UvbFNTeGJwRUZ4b0J0enkxcDUwWFFNSFYvS1l3cEU0eGxx?=
 =?utf-8?B?RjVQUk1yNnduN09zb1N3L01rSURyZjR0My9qSVJ2c1dBZXlaWGVXNEN5bEhj?=
 =?utf-8?B?TE9XK21QUFNhTERMV2ZDeGgrOVRXMy9aMGJYbnN3cHFHRXEvWG5pbkh6NkZ5?=
 =?utf-8?B?aHVLQ1ZaeXlEMHd0NTBrSklNOGpCbEpwd29OREovVDVKRzFDR0FyM2RwQktq?=
 =?utf-8?B?SEtvNnhORUdIT2EvWm10QUQ1ZWVPVzRRVlM4Z1NhcWV2c29ZZ3NKWDY3R1pz?=
 =?utf-8?B?Y0x4Z0RmKzdYV1p5bjg1b1JDY0k4YUREcUdlQld0WW9pUm11eTVCR2dneFhs?=
 =?utf-8?B?dFpRbXc5MUJZenBVZ3Q3d1pLbjB3NXVkalpCcThQZDFqSDBWbjdpdjRDY3p5?=
 =?utf-8?B?YU1KYjJHY0dkSkdPTmQ1bzB6TjZPb0Nra0NORys3bDFLY3Q4c0wzWXdwSitS?=
 =?utf-8?B?ZVI2WmhQK0pCUTNUNW1TcUJwY05FdDdxaUQ0ZkxoY0sySGMzTUtzd3NQdGU4?=
 =?utf-8?Q?RLnyT5v6Y4F/FsSCw44dL1maWSPPbZqpceurztn?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4f6130-76a3-4370-d188-08dd8177e116
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:30:03.6232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFCAA8F9158
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



On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> Hi Aditya, Hector,
> 
> On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>> From: Hector Martin <marcan@marcan.st>
>>
>> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
>> it's useful to be able to print generic 4-character codes formatted as
>> an integer. Extend it to add format specifiers for printing generic
>> 32-bit FourCCs with various endian semantics:
>>
>> %p4ch   Host byte order
>> %p4cn   Network byte order
>> %p4cl   Little-endian
>> %p4cb   Big-endian
>>
>> The endianness determines how bytes are interpreted as a u32, and the
>> FourCC is then always printed MSByte-first (this is the opposite of
>> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
>> allow printing LSByte-first FourCCs stored in host endian order
>> (other than the hex form being in character order, not the integer
>> value).
>>
>> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Petr Mladek <pmladek@suse.com>
>> Tested-by: Petr Mladek <pmladek@suse.com>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> 
> Thanks for your patch, which is now commit 1938479b2720ebc0
> ("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
> in drm-misc-next/
> 
>> --- a/Documentation/core-api/printk-formats.rst
>> +++ b/Documentation/core-api/printk-formats.rst
>> @@ -648,6 +648,38 @@ Examples::
>>         %p4cc   Y10  little-endian (0x20303159)
>>         %p4cc   NV12 big-endian (0xb231564e)
>>
>> +Generic FourCC code
>> +-------------------
>> +
>> +::
>> +       %p4c[hnlb]      gP00 (0x67503030)
>> +
>> +Print a generic FourCC code, as both ASCII characters and its numerical
>> +value as hexadecimal.
>> +
>> +The generic FourCC code is always printed in the big-endian format,
>> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
>> +
>> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
>> +endianness is used to load the stored bytes. The data might be interpreted
>> +using the host byte order, network byte order, little-endian, or big-endian.
>> +
>> +Passed by reference.
>> +
>> +Examples for a little-endian machine, given &(u32)0x67503030::
>> +
>> +       %p4ch   gP00 (0x67503030)
>> +       %p4cn   00Pg (0x30305067)
>> +       %p4cl   gP00 (0x67503030)
>> +       %p4cb   00Pg (0x30305067)
>> +
>> +Examples for a big-endian machine, given &(u32)0x67503030::
>> +
>> +       %p4ch   gP00 (0x67503030)
>> +       %p4cn   00Pg (0x30305067)
> 
> This doesn't look right to me, as network byte order is big endian?
> Note that I didn't check the code.

Originally, it was %p4cr (reverse-endian), but on the request of the maintainers, it was changed to %p4cn.

So here network means reverse of host, not strictly big-endian.

> 
>> +       %p4cl   00Pg (0x30305067)
>> +       %p4cb   gP00 (0x67503030)
>> +
>>  Rust
>>  ----
>>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

