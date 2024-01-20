Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DB8333BE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 12:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC3310E255;
	Sat, 20 Jan 2024 11:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2079.outbound.protection.outlook.com [40.92.99.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B4A10E237
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 11:02:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jzgr4CebkyMcsHccLvh4dOBtifCc+PfvPk8hyO/1k+2xgrw3Cfl0KmGf4QwLgpONsks+BfuZdH1zHHMKpE7pfJqD3mLhZPjZbLrCbpywO9O6PntSI9PjPWYeM5w2pz7NAdlWSubGIj0cuYOSma0KwSDRqB8hHysEU1zWSDcl+Lc7lcS4VSWUlRtvLrXipV326kXWAweMCWkFd/lIA/N+9wDJ3s4/heCRpzmRP9E8ik6QVbA0N6pQu+UgprYhPCSbvIjlMMaI7/9RinDMlUBPYKylT7USNYGzLQXYZyLfdK1mEHKsLGvWe7/plFrVJgO6+mli9JsRqrhqiqsZxup9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALk5HZm8/0FFqpTPeyI6qDGE5CIzDai4tr/ZkyAMbgY=;
 b=fk/K1hN8g4SmdWFLL4L62XTl4VhxFUg6JlSSwvLCEaiKOXyH8WC2qjCiX5CUll3frqiITyYunCekGqr7qk+X7XkLwtKo2BnVVVynG9FJ0FgymvBly6qg5mrlaxMM0bYmrSmm+/IQn3NhGIuMjbkyKxwD/zAsKvPPxGT8dpX0Kjz0oWiK9w3SqUhqgsBFCKJ/htFoEhUQ6j09VYSPBMY/GKl49+nEBXebcJAfOkkTLtM0wfJqrPIt6BlRL6v9aCogmjfOrk9MM1OpLD9cVkLzJOKWYqeS4jxHv5i7Mjmu2f7SBN9d78iBImc9QKgSK6zkis3yzVC/z6hFzFJFNeV2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALk5HZm8/0FFqpTPeyI6qDGE5CIzDai4tr/ZkyAMbgY=;
 b=MsppmUVNfZNyKrLCF4VCwPJ/NLWy7acufTWqLsep7d11Hx6I0m+6jOa1lxDWLF3FXjsKoZPzT6MYZkMhTHBcASvq7NTJFH0TTBKYalhNv7A58wl63vGoZ8jfSbXFSsnvhmr4cPM3qVIK2rC5wziJLinfeAUcMyZgIa8qOM6EDub/oj6BSpdIOae4oLdP+e3g27nnM9uHanu1N/e+nitZ+ZYvd25nzHLqyLhKgXqdxOAaxDgzb35lX3NHRoFbxDwM3p0Zh/soS6hF3ZSqz/LmDvfCrfXyIxnhYRgx0hnRPDCqwPehoS44oPWLy3IRnEHiagq1qcPS7cyUdquKbuQW4g==
Received: from TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:309::9)
 by TY3P286MB2578.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Sat, 20 Jan
 2024 11:02:23 +0000
Received: from TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a820:660b:bc07:c568]) by TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a820:660b:bc07:c568%3]) with mapi id 15.20.7202.024; Sat, 20 Jan 2024
 11:02:23 +0000
Content-Type: multipart/alternative;
 boundary="------------tMfAXY3Zz3emqBxQRNhtrrWv"
Message-ID: <TYCP286MB29897A1BAEC60654F6AC3D13AA772@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
Date: Sat, 20 Jan 2024 20:01:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: drm/loongson: Error out if no VRAM detected
Content-Language: en-GB
To: Sui JIngfeng <sui.jingfeng@linux.dev>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
From: Katyusha <KatyushaScarlet@Outlook.com>
In-Reply-To: <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
X-TMN: [UYnoR5/8fNERQDxttHJLOcpAfVoCuqzDrl5/Rs9w0ws=]
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:309::9)
X-Microsoft-Original-Message-ID: <38364a01-42de-4018-8147-d04ebbf5806b@Outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2989:EE_|TY3P286MB2578:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b56aa6-d7fe-4566-f832-08dc19a747e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEAuXmDwpoVw/1IjsA+yf0SZjcaESe0O1Fdx9fEV569flOlfgW0tLQ1A/QGDhKpzu7L3km48FHmplTy3tLrouvhn98sEeYhEpwkTe2p/XVghs3VVNgKuRFKqaEbH9rekZAWV5xOxzlCnrpEoNm+guK5yKQHLZBF93qDJ955suPGX0McUVDlupMzMJycM+OnuovB/KfAB2qrJZaqeNfv4wKL7V3iSojw1zCvXU/zeRa2LNvRo4ndxjvcxpNRsX1HDUSYYz/+iJRiCjaAC7lTExjLOZsT2/+e+wYHsd3WG9KDYJBdLXHqP2hOBQDcoIPTDRuNBvhP7x95Kx+eBe2yKjHljHs5Cez/rOunczMU+YpdBUi8VrVwl3RLjHBgBVvbF7VeMOnt59eS7OlVGMACCPw3EPhmhz6KKL7/VU2k3r4EX4f2ncVkoKPr+JX/yzwAy+5/DMZwBUNI55+5b42gaS4TRtzKU9IbnLK1EnA7SNdyyXPs+FS7ydajRk91qupYMBbTmA9/4h13gJB8nOhHxujGydafRHXJL5tHBWuNbp0beX1KVUjnGThMgwUN5yLy0dQhbYMKicBeZ3c7duMPo3oZTtLKXYVeJbsCr6hluyhIIqz77KTupWmZ4Fdm6xsK3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUx1TWJGZjBJeVFwRVlUeEZ5UDZJL3pSVmdTVjE1ZTd3RytHVVRWeFhySlpi?=
 =?utf-8?B?WVBQZzNCUmhxOXhENk45dFVVYUpHZW5XOXl6cFRXVUhkbm5nbEhKcWpqV05k?=
 =?utf-8?B?NDVQT0VkbUh2MHZQK0tld3V3NUhESWZqdHFjR1J4Z09oR1NGV2dRYkVVanFv?=
 =?utf-8?B?NTROaC9FZ25yRFpwanA1a3VUTnN3Skl0QkhnczBKZURXVVpOK2YvSnRGc2Y2?=
 =?utf-8?B?MjlWWkZGc3FIYStlWWxHT1hIekhMMXppM0hCSmZ3ZDF0cFdwZ1JpNFRLN2M5?=
 =?utf-8?B?QUZwU0xFd3dsZ1MyTlVYd0lBdkFhMVF5SER4aXI5YmpqQ1lVRzUrTTMxcFh3?=
 =?utf-8?B?ZWh6TW1lbXFkRHNZM3hJMjVxV2NNNm5Idy8wbHcrMndSNEdaaCtWQW80RDlL?=
 =?utf-8?B?VG93cXFQWHdWZFhtMmY2cHJQVlVrckQ4MHp4UjZzdTg5SGdmMmFJRFdsTHNM?=
 =?utf-8?B?UU03R2Q2TGxaOFQzemZYNnlITkZBU05SQzFRQmh6bFR2M3YrQUNuRDhYQjZK?=
 =?utf-8?B?elZpRnk1MDhsUGV3d3lJM0g1cm1JeUVSMEhJc1FwL2RqeEE2dHdZeXo2K3hI?=
 =?utf-8?B?RFpPMFFKbWlCSERPcFY5TUtjc3YrMEdxOE1udFArWFhsWnY3dVppaUxOdFdF?=
 =?utf-8?B?eGZlMzRZdGNlcG9paEhrOW9SdVFTcnEvazREQmpvbHdWMW04Mk1VOUJwRFJx?=
 =?utf-8?B?YW0wcEpkdmRtNVpyV1EzR3pOSzV0RzBTNUQ4M2ZBSENxZmxGMktVUjdaOW1L?=
 =?utf-8?B?aW9zRHd3a2Q1RnVOeUp2Z1E5NytxNElKdUdadm1DOEo0N0VzazN3dGYwSVdm?=
 =?utf-8?B?ZW9zcUNPbS9TZVFSRk1hVFZDTEtua0ZzSXlnVmlHdFdCVVIyWVN6VWhES2Jv?=
 =?utf-8?B?d2tGRkhtSGc4MFlLYzlXL21aK0x3cVU4aitBcEhvd3k0elJxNlhaMk8rWUY4?=
 =?utf-8?B?MkpHQ3A3L0NtT1RmSERZQ0pmMnV6ejNSemRrQjMraVVTalBKK2FVTlV0Y3dI?=
 =?utf-8?B?K2FKcFduUkVPeUFNY1gxTFAzemxXN0U3UmFVUVJHaVNhNnU0bEN1V0lRdHY4?=
 =?utf-8?B?bVpLUXIySjhWL3ZHWVdUbjkwZkNWTlVSMncrVWhMRXoyNFJSL0htaWhZamlw?=
 =?utf-8?B?TWZXNFowaDREekt0a0VLY0dMazlsWnVjd3BGeW9KNzM0dHdnTjVZM3Q3YkdC?=
 =?utf-8?B?NXNkdVVJbEpYYytqTUEyNzF2aVRvWDdUVXI3TnEwWE50Q3Rib0plcVAreFRi?=
 =?utf-8?B?ZDZtUXRMYm9vdkhKMGRsSHN0MFpyWUtlaTc4OE96bWk3SVU3akZWaWRseFll?=
 =?utf-8?B?SzRJYTNBUGRReTg3TVc2S3ptbTAwdzZrcHI3SlIzc21oSXY2d04zY0VhQnBR?=
 =?utf-8?B?cmUzNFhuZnR0b0J1Ym13ZW5JNDRTeHdpN0luKys4c2JWY3YwdzkwcVRxck84?=
 =?utf-8?B?ME0zRlRlYW9WbExhTUNmTTdRMFBlUUZPaHgzOHZDT2lsVUlKejhZbnNrR0M1?=
 =?utf-8?B?OGpMdDVRS1dCUlJwWGlBRTlXL3lRdU93aHIvdzBuWnZqSGU0cjY3OUM1TFVM?=
 =?utf-8?B?MFEvbzVSRXNrekhsTHFlQnErRFo2Y29ua2VxNjN5QmVaQTB2c1RFTk01OEVP?=
 =?utf-8?B?WXhIS3Bsd0J1ZHFQcjBhTitiZ3BDUlE4OXFIQUFHN2VJUlBpd2tTbnhuV05y?=
 =?utf-8?Q?cY1OJ0iLw4+hFWkYR6cc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b56aa6-d7fe-4566-f832-08dc19a747e2
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 11:02:23.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2578
X-Mailman-Approved-At: Sat, 20 Jan 2024 11:09:20 +0000
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------tMfAXY3Zz3emqBxQRNhtrrWv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

This patch works fine with my Loongson 3A5000M laptop (L71), which has a 
7A1000 chipset without VRAM.

On 2024/1/20 0:18, Sui JIngfeng wrote:
> Hi,
>
> Thanks a lot for contribution.
>
> On 2024/1/19 18:40, Huacai Chen wrote:
>> If there is no VRAM (it is true if there is a discreted card),
>
>
> Why the dedicated VRAM is gone whenthere is a discrete card?
>
> As far as I know, this is only possible on Loongson 3C5000 + aspeed 
> BMC server hardware platform where the dedicated VRAM chip of Loongson 
> Graphics is NOT soldered on the motherboard. Probably for cost reason, 
> but then, the platform BIOS(either UEFI or PMON) should turn off the 
> Loongson integrated graphics.
>
> Because without dedicated VRAM, this driver can not work correctly. Or 
> carve out
> part of system RAM as VRAM, and write the base address and size to the 
> BAR 2 of
> the GPU PCI device.
> This is NOT true  for Loongson 3A5000/3A6000  desktop hardware, 
> because I have do
> a lot test on various platform[1] before this driver was merged. It 
> never happens
> on a sane hardware configuration. Please update the commit message and 
> limit the
> scope.
>
> [1] https://github.com/loongson-gfx/loongson_boards
>
>> we get
>> such an error and Xorg fails to start:
>
>
> Yeah, If there is no dedicated VRAM, the driver can't allocate memory 
> for framebuffer.
> But this is probably more about the hardware configuration issue, not 
> a driver issue.
>
>
>> [  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>> [  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) 
>> failed
>>
>> So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is less
>> than 1MB which is also an unusable case) detected.
>
>
> This is not expected, if you want this driver be there and run normally.
> You should guarantee that there have at least 64MiB dedicated VRAM.
>
> I'm OK if this patch is strongly requested, but this is a kind of 
> error handling.
> Please give more details about the hardware in using and explain why 
> there is no
> dedicated VRAM available for your hardware.
>
>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>>   drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c 
>> b/drivers/gpu/drm/loongson/lsdc_drv.c
>> index 89ccc0c43169..d8ff60b46abe 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
>> @@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct 
>> lsdc_device *ldev,
>>       drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
>>            (u64)base, (u32)(size >> 20));
>>   -    return 0;
>> +    return (size > SZ_1M) ? 0 : -ENODEV;
>>   }
>>     static struct lsdc_device *
>
--------------tMfAXY3Zz3emqBxQRNhtrrWv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-text-html" lang="x-unicode">
      <p><font face="Times New Roman">Hi,</font></p>
      <p><font face="Times New Roman"><span style="font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">This patch works fine with my Loongson 3A5000M laptop (L71), which has a 7A1000 chipset without VRAM.</span></font></p>
      <p><font face="Times New Roman"><span style="color: rgb(55, 65, 81); font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></font></p>
    </div>
    <p></p>
    <div class="moz-cite-prefix">On 2024/1/20 0:18, Sui JIngfeng wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev">Hi,
      <br>
      <br>
      Thanks a lot for contribution.
      <br>
      <br>
      On 2024/1/19 18:40, Huacai Chen wrote:
      <br>
      <blockquote type="cite">If there is no VRAM (it is true if there
        is a discreted card),
        <br>
      </blockquote>
      <br>
      <br>
      Why the dedicated VRAM is gone whenthere is a discrete card?
      <br>
      <br>
      As far as I know, this is only possible on Loongson 3C5000 +
      aspeed BMC server hardware platform where the dedicated VRAM chip
      of Loongson Graphics is NOT soldered on the motherboard. Probably
      for cost reason, but then, the platform BIOS(either UEFI or PMON)
      should turn off the Loongson integrated graphics.
      <br>
      <br>
      Because without dedicated VRAM, this driver can not work
      correctly. Or carve out
      <br>
      part of system RAM as VRAM, and write the base address and size to
      the BAR 2 of
      <br>
      the GPU PCI device.
      <br>
      This is NOT true&nbsp; for Loongson 3A5000/3A6000&nbsp; desktop hardware,
      because I have do
      <br>
      a lot test on various platform[1] before this driver was merged.
      It never happens
      <br>
      on a sane hardware configuration. Please update the commit message
      and limit the
      <br>
      scope.
      <br>
      <br>
      [1] <a class="moz-txt-link-freetext" href="https://github.com/loongson-gfx/loongson_boards">https://github.com/loongson-gfx/loongson_boards</a>
      <br>
      <br>
      <blockquote type="cite">we get
        <br>
        such an error and Xorg fails to start:
        <br>
      </blockquote>
      <br>
      <br>
      Yeah, If there is no dedicated VRAM, the driver can't allocate
      memory for framebuffer.
      <br>
      But this is probably more about the hardware configuration issue,
      not a driver issue.
      <br>
      <br>
      <br>
      <blockquote type="cite">[&nbsp; 136.401131] loongson 0000:00:06.1:
        [drm] *ERROR* Requesting(0MiB) failed
        <br>
        [&nbsp; 137.444342] loongson 0000:00:06.1: [drm] *ERROR*
        Requesting(0MiB) failed
        <br>
        [&nbsp; 138.871166] loongson 0000:00:06.1: [drm] *ERROR*
        Requesting(0MiB) failed
        <br>
        [&nbsp; 140.444078] loongson 0000:00:06.1: [drm] *ERROR*
        Requesting(0MiB) failed
        <br>
        [&nbsp; 142.403993] loongson 0000:00:06.1: [drm] *ERROR*
        Requesting(0MiB) failed
        <br>
        [&nbsp; 143.970625] loongson 0000:00:06.1: [drm] *ERROR*
        Requesting(0MiB) failed
        <br>
        [&nbsp; 145.862013] loongson 0000:00:06.1: [drm] *ERROR*
        Requesting(0MiB) failed
        <br>
        <br>
        So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM
        is less
        <br>
        than 1MB which is also an unusable case) detected.
        <br>
      </blockquote>
      <br>
      <br>
      This is not expected, if you want this driver be there and run
      normally.
      <br>
      You should guarantee that there have at least 64MiB dedicated
      VRAM.
      <br>
      <br>
      I'm OK if this patch is strongly requested, but this is a kind of
      error handling.
      <br>
      Please give more details about the hardware in using and explain
      why there is no
      <br>
      dedicated VRAM available for your hardware.
      <br>
      <br>
      <br>
      <blockquote type="cite">Signed-off-by: Huacai Chen
        <a class="moz-txt-link-rfc2396E" href="mailto:chenhuacai@loongson.cn">&lt;chenhuacai@loongson.cn&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
        <br>
        &nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c
        b/drivers/gpu/drm/loongson/lsdc_drv.c
        <br>
        index 89ccc0c43169..d8ff60b46abe 100644
        <br>
        --- a/drivers/gpu/drm/loongson/lsdc_drv.c
        <br>
        +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
        <br>
        @@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct
        lsdc_device *ldev,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(ddev, &quot;Dedicated vram start: 0x%llx, size:
        %uMiB\n&quot;,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (u64)base, (u32)(size &gt;&gt; 20));
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +&nbsp;&nbsp;&nbsp; return (size &gt; SZ_1M) ? 0 : -ENODEV;
        <br>
        &nbsp; }
        <br>
        &nbsp; &nbsp; static struct lsdc_device *
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------tMfAXY3Zz3emqBxQRNhtrrWv--
