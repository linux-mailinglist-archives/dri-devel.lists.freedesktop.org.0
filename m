Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621174CE4E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6870E89B78;
	Mon, 10 Jul 2023 07:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::709])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1885810E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+hGjSkMfZUlMQxtg1WbsrHwCCzXI+t+bpRsdBnT8Q0WQxG9QryLyjvPYfdS1sm6aqmVTVR9YinmtoetVMpCCse3Gla5EUAq2Coj2n0GcG1l++/zzlnJ5eRwMTdGmEjRd28/hF1+D4Pzc/4dBGx9lg3E+qcqVdhv6VFmTCQFI+SAnKxK4R4MvPW2xhJD/rXVIdD3dDKi3eHBHjVXAMkny4fjE/vrQS8SelQFxchp0/Z/pH076J9QfFfUvHJba0sTwVC5d/MAv1OlZOiJpksuKjFUzEEEN3oIO1UEXFQHcrA1EFtElZTtConsO8uJFJFlRT5G0zOTg2nNIM900oTWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7ThpV/Kse4KGDmj/oodzqt1hQ1cMkkCrOvyj7GRqkg=;
 b=OPbiZbg84LWLYaXRPxhC2ApRL4H3OtDXnnV62nuE3mr1z5owwUkAo9UFvF5Q5zfv9rLf9iUfX5xZntn3/sjxkx0UygWLa0c5IJ+xakY7OSDsnBX6OJZdVJEur8e10zrNgwl36Apb3n24CJdNBlh4McVYI7JjAPYbbimF/w7E9ecFDvtZAedXBocblrAuieqPk+wBz2Zo4N3Th5+Qc2D2uPxGgqhqfLzJdxLsJpeXLt6Qtj/oQebx8GwiQbZV8kIUhXtqb6+gbV0UIEcpqS4icxpCMchaMX9wDeVv2NQpM3Wb2A2NKZ10sFH8ucp/3PpnMyePMrWcNjklgKnxAN1GJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7ThpV/Kse4KGDmj/oodzqt1hQ1cMkkCrOvyj7GRqkg=;
 b=IXH21Ynach7xazDn4GfJ5UZ9X9/FXZhFwb8nEmQm1Jw6FKDDi35u+LgqdfTGker0p/v6daNas5fbkWNoIYOO+89dsN0Q4aanWeZ3aOzJviteozCfOHnHwNMxAlNfaix9JaW1Motm+VUagqVNDkIJr8esCUKoxGBLc9F3LSZrJlI9KGvBoyh90vTpJj/bhdZjuV2Oaic9fXmN53pFo5AbVNCn0dum/mE/cxmjLg67Ja+fDK8CUCELNfEZ6MLtFx4UsR1y+xxpWJi/fF07EVJGeG84KueYTCDuXF0wsekgd12scq4SUX3QZBp+YjzfXmdkrow+t+BeJnzQ0k5Zc62jvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5807.apcprd06.prod.outlook.com (2603:1096:400:268::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:25:28 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 07:25:27 +0000
Message-ID: <da543602-f88e-45ee-d7fd-8fddd0b0ac56@vivo.com>
Date: Mon, 10 Jul 2023 15:25:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] fbdev: imxfb: Convert to devm_platform_ioremap_resource()
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230704093652.18191-1-frank.li@vivo.com>
 <CAMuHMdWrBY1+JDuwODyqLrwJJivt=ewCOKfK41xq+0Hpaf8akQ@mail.gmail.com>
From: Yangtao Li <frank.li@vivo.com>
In-Reply-To: <CAMuHMdWrBY1+JDuwODyqLrwJJivt=ewCOKfK41xq+0Hpaf8akQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5bf168-7e72-460c-9ae8-08db8116d585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BH3YlO5Jpq5kdQmZyCYvIjbHD1sikFbwfGTlFxu0hfFOVw9do9iLiV1feZ+pczoh6Te6RwPM7gQtusE8M1KVhpel3nbVQfC56icVJ4E0h9dAyRFuyuqafabpMMYVIYewbPHjw7c4IZUiwH/Urr07ftUdsv4k7hl0ZPI64EEaN8Bwzr1sfKo0FKkWo9p+uGoh+E4Eon7k5VglUn6CcJiHssWLFUpUSeNkTJT9Kv5KcwpOWqRQfhrLF40MUfDdRyDf4PDbPPJx5hFaCzN+vfiDgS9yYzmZqVun+uC92VeLL74mD94pu+IzwJP6Cu/gfhT4fcNr4/wdlwng6jjYZ89gqeUug/lf3+obgVR34XH/ZgE18WzT0O5AJ7RKggvuoKQWsoqBmfVgMmqpOcnctPNU0aJRRv1Xj9l8o6rhOq4QgHCspeTnALQ86+XTe7s4ymX6b7ajrdp4OafLZrxwvppyWNxbblDZiTEqVe7lnoyPVanK3pOMTT7xCxUp6HMTKjHjCzxkTwFJ8gDDoHMsbLtq94QJxlzdu5czk8Vwj3r9DfyNUBC0ZDE3EUzxSvy3AW9ou7y6xJE0MmpWYvXqngoM50t2z41FRXU5HkZY13EvWi5M/p//T0UZs6T7XkmfX65fDW6VsZbUuI6vz/11hZXD3xwVn6wMW2SN1EMmqksINmxnGQhyyWWOJNjD0oowE5RE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39850400004)(376002)(451199021)(86362001)(31696002)(38100700002)(38350700002)(31686004)(66899021)(36756003)(6666004)(6486002)(52116002)(54906003)(6506007)(53546011)(26005)(186003)(966005)(6512007)(2616005)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NxbzlENWhPWEpwMmlwYS9Mak1IakpjVGxUa1ZPMU4xN0JTbTRXT0w5K0s5?=
 =?utf-8?B?allaYWFBVVE4Qk4vdUk0U2djWjlmdWQxanZiOWMvZDJYME0weThoRmEzQjFT?=
 =?utf-8?B?cGUzS2xhdmVIbjY4UlN4OUg2ZXNpOTJuUXBESm5nU0g5b1QyL1h0c3d5U2Fl?=
 =?utf-8?B?RGRscjhZcjA1QVp2NXpZdUdwVHNBSUx5d1hLRmVJQTJ4cURYZVg4T0NTZzVI?=
 =?utf-8?B?OHlSRjBkVkwzcHlPRXNvZVpQRkl5MEh1ZnhhZE9sS0JEQkducWZQL1FiVWMr?=
 =?utf-8?B?Ujc5NHJwbnpNaGl2bE1MM0dLWDhyN3Y0M1UwbmpUVjUvc2lxM21CSTk0emxy?=
 =?utf-8?B?RzRIMkVxOWs2MU9CaStJMU9wWG1jQlRXQmsrQmNxTm5rUWlmOXFGZ2YzRHhM?=
 =?utf-8?B?c3FlY0VkNDVLZVF2YkdTU2RNdTBvMmFhZGR0Umk5UU5oVXRqVFUwZEVUVitO?=
 =?utf-8?B?YXRjRVpBUWNhVS83bE1mWFVPRjFYNDBQUEF3bFgwMFlKayt0dFYwa0ZFY1lG?=
 =?utf-8?B?RjZCZHBjbjdOd1FabTJ0QXRtQVFVRXlia2dBWGduYkFHRDB3bFBZdy90dzZZ?=
 =?utf-8?B?ZzFZUVp1SVl6UWowTDdiZ0VUTklka01WaitBMDZuNFV5NEN3TUlMem52NTdT?=
 =?utf-8?B?K2M5SVhaK2hRZVcrYm80WUNWOTZsdnJHdlpqMTNVbERqQmRMdnovUDdyTjZn?=
 =?utf-8?B?TkFiWHg3VGQrYU9MVzFyYkFlN3Y1ZDNkS0J3WGN4LzRFSDIrMlhiTWhCRmdQ?=
 =?utf-8?B?UVZCYjZVZnJGb3RET283b1RIMk5sSVJZQ1BhNDFqWHluSlVuT1RHUSthYjhR?=
 =?utf-8?B?TDZvQXo0QkgwL1RCQis1enZYcTIzeXk3ZkwwemNNckd1V1BNU2FpMFZxWEZY?=
 =?utf-8?B?bHVEK2dmOTZnWENXK1Yrenp6d1NrUXYvOUFjN0NZem1YWUNURGNXQlhVdjBr?=
 =?utf-8?B?M25aY2FieEE1YTRpY2FuVGhBUCtTT1duLzA5SDJLdC9VR2JoQkVqdzk3WHAw?=
 =?utf-8?B?cmYwL3cxYWJwOGFWckFhQjNXZDVSWEVJd3J0Qm42QnJPYmlyQVRpM0hoVzFM?=
 =?utf-8?B?TmVKVFF6MlpNRnZLVkxoWWZ4NEU3bHBsR2orUVRHcjk5RGZaNFpwQ2ljbDVn?=
 =?utf-8?B?aFExNUVDNnV0NkJZS242WkI0WlgvWGkxQ3MvWnNUTFBGMktYVG9WMzFXZzZ6?=
 =?utf-8?B?eVZ0TlBjQkNqKys2QjB4S0g1WEpsMmQvQmJFM2lGSitzMmRCMXM4ZTBiR2la?=
 =?utf-8?B?ZjliWXBrSDN5cGV5b1pFbXZxWXF0K20vMmpETTBnbnk5VVFVYmluZDJrd3dC?=
 =?utf-8?B?Q0YyQmdHbFNJNkkwTGlhclFVMzdxQ2E3b2VkVHlidk9JNkVHSXE4M3F6QTYy?=
 =?utf-8?B?VkR1c2NTWENEVmpVdWIvM2s3ZjdMZkM4WVhXVnpiaHRCaGhoZWlkbUJTbzhX?=
 =?utf-8?B?RUpHZE80T0FGeTJublVKTkRxWkZRbEgzMUVxQ1VjZHVLWFNwZWRIODlPS2NL?=
 =?utf-8?B?Z2lTMzBPZHBCN1M3V0tjNUhrbEdCV1J4RklrL084YXAvbnAyZkJKK0JXWFFn?=
 =?utf-8?B?TUlYMjVHSkRaSDkwZUhMYkJsTkR2bzc1M1Z5ckErQXV3VDA5ZndSSnpKczRY?=
 =?utf-8?B?R2JpOVNnVWhEaGtjOTNTZEF0aVRzYlVlRTczNi8xSUwrRVozUThseGtXRUlk?=
 =?utf-8?B?ZXpOOEozZ3AwOFRUcWNUNWtoWWV5eS9hWW4xcjhqUlg3NnRrK0FCUWtSd1cz?=
 =?utf-8?B?RkJSZGw4RG14L0xLV2dmOFhKWkMvVEhoS2M0VXV4RFEzcTFVSmFwbWgxZ1Jx?=
 =?utf-8?B?VWJSZHQzVE9xR2Y4YzZKd3ZNK2dIeE1QNk1hbEdhb00xUVk1T0s5R0NjbUxK?=
 =?utf-8?B?YnRuQnJpVzRlekhBbDdqMXR2eTVRcnFpVFBrU1ZtV25pU3JtdFovY29rOEI0?=
 =?utf-8?B?TURNNGZ3NzVvb2NFQnRFaEhiY3Z4UVg3R1lQZGRXY3V4eDAxdVFMZmc2QlJm?=
 =?utf-8?B?czErdUVGNUJCQVdvU0hkOUd6L0ljcmcvRGxzd2dFVjVubVlXVTFNaUZDVURO?=
 =?utf-8?B?VW0wN2xFNW92OFhrb21nV2l2SElGTXlyRjNPb2NTbHc0bVZhUlVuSUtuVmNx?=
 =?utf-8?Q?NtIEUDNG9XnlrbFGBAEYaHpEI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5bf168-7e72-460c-9ae8-08db8116d585
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 07:25:27.7657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eodtrQ8NOHpdC2qtniBC9U+tj9y2UCG3rbKg95IyPbqUw+NZl2WG2OcwWfz1xfw2SDcmaXZ1/DOvuWMufEWeug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5807
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
Cc: linux-fbdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Helge Deller <deller@gmx.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 2023/7/10 15:10, Geert Uytterhoeven wrote:
> [你通常不会收到来自 geert@linux-m68k.org 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
>
> Hi Yangtao,
>
> On Tue, Jul 4, 2023 at 11:38 AM Yangtao Li <frank.li@vivo.com> wrote:
>> Use devm_platform_ioremap_resource() to simplify code.
>>
>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Thanks for your patch, which is now commit c1cd7a7a231a26c6 ("fbdev:
> imxfb: Convert to devm_platform_ioremap_resource()") in fbdev/for-next
>
>> --- a/drivers/video/fbdev/imxfb.c
>> +++ b/drivers/video/fbdev/imxfb.c
>> @@ -868,7 +868,6 @@ static int imxfb_probe(struct platform_device *pdev)
>>          struct imxfb_info *fbi;
>>          struct lcd_device *lcd;
>>          struct fb_info *info;
>> -       struct resource *res;
>>          struct imx_fb_videomode *m;
>>          const struct of_device_id *of_id;
>>          struct device_node *display_np;
>> @@ -885,10 +884,6 @@ static int imxfb_probe(struct platform_device *pdev)
>>          if (of_id)
>>                  pdev->id_entry = of_id->data;
>>
>> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -       if (!res)
>> -               return -ENODEV;
>> -
>>          info = framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev);
>>          if (!info)
>>                  return -ENOMEM;
>> @@ -970,7 +965,7 @@ static int imxfb_probe(struct platform_device *pdev)
>>                  goto failed_getclock;
>>          }
>>
>> -       fbi->regs = devm_ioremap_resource(&pdev->dev, res);
>> +       fbi->regs = devm_platform_ioremap_resource(pdev, 0);
>>          if (IS_ERR(fbi->regs)) {
>>                  ret = PTR_ERR(fbi->regs);
>>                  goto failed_ioremap;
>> @@ -1043,7 +1038,6 @@ static int imxfb_probe(struct platform_device *pdev)
>>   failed_map:
>>   failed_ioremap:
>>   failed_getclock:
>> -       release_mem_region(res->start, resource_size(res));
> This part is not directly related, but a bug fix for commit
> b083c22d51148f3d ("video: fbdev: imxfb: Convert request_mem_region +
> ioremap to devm_ioremap_resource") in v6.0.


IIUC, split this patch into two, remove release_mem_region in one and

mark it as Fixes: b083c22d51148f3d ("video: fbdev: imxfb: Convert 
request_mem_region +

ioremap to devm_ioremap_resource")?


MBR,

Yangtao


>
> Please do not mix bug fixes with other changes.
> The stable teams want to backport only bugfixes .
>
>>   failed_of_parse:
>>          kfree(info->pseudo_palette);
>>   failed_init:
>> --
>> 2.39.0
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
