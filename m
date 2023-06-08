Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D1E727F00
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 13:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5691110E0AC;
	Thu,  8 Jun 2023 11:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0704.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::704])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC3610E238
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 11:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCCpBNInR5rrwgSrslr5FeAxfi7yhM0OMVgvXQFSRIs7IcWrT+/QdT4L0u9Da+x//vlxc9XypH71CRpfyBMBo/rxn8bn/2ZbEIs4+RojP516a3WpWUAVlLJ+rqp208dOtaFJig2AKRLLzxix5m8vb834hks7AHl5q7jjDyS0nwOVKxPiW6TTbzfCFJDZNgBPeOZ8MdhU7ZTUVFum5sFtVEQyaP3wUQN1+JTvUZPz3svRxPpdzaUVLcE6N9zJNbOGeJ4NMGnQTxNSHI5EHcblmdpcNqsZ+u4sGLaBkAU7OF5yLeSoz3NvO1JdL3yXC8S5/oyCiDCJ2eZ4j+OEvTvZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGPZFO/nr8cel6dTbAtHcsLUDfXdgIVPQFzq5GJ8uyg=;
 b=RbG/COeUCAaroreKw7Ki3X58ZSiMtvm7h0MzQ/UMvIdg5rJ6d0vWsz+3ccbiiFDrQslqdipvrqAhgaaia6nQipA3lodI7SaqyEXEkx3Rd8OSH1fCQjST1iXxLIgaPwMCPRpfCQoVJC1nMhRPcV5hen0TUKUZN9MRji9Lq518taPUgjJJGODulBGVWV/hXbVmsvmo5vY4FCC9AYQ4TwZPUen+LDHDZRGaFFXQkMRckvdPHmjXriep3m57gsv6ynKXjsRslmkX2gcW35EZZAtCpMjgi5/qgL5W/YWtZaUvq/HIIYHpQ3UBW0YxLBqvC4N64FQcIurECW2zqpPmUrhikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGPZFO/nr8cel6dTbAtHcsLUDfXdgIVPQFzq5GJ8uyg=;
 b=jLMchT0g9QOOJ7IIPC/aMvr2dP9/LlxFwLlkJnyEb+BDjy6Ax0WnbK6tC2g73qZ+Vzs+s50VrN0LEBn6hhy/fBBKMan58VO7u4E5UCPMoCgJpULNL+AnawTWSAOuuxJ1TapVVW/+hOeVsI9gRM2YbvGsjAvueyH0CKEWxKV7WIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DU0PR10MB7532.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:427::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 11:40:37 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d66c:ec:aa54:f318]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d66c:ec:aa54:f318%5]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 11:40:37 +0000
Message-ID: <bfd050f2-b39e-c091-614e-0c77fe324435@prevas.dk>
Date: Thu, 8 Jun 2023 13:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US, da
To: Adam Ford <aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
 <e1379d94-66a5-8538-abdf-de7770befb7d@prevas.dk>
 <CAHCN7xK9RaLRSK_jSbbuGBUf14-FOHsrawi2J8G29iHSOj2Nyw@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CAHCN7xK9RaLRSK_jSbbuGBUf14-FOHsrawi2J8G29iHSOj2Nyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::16) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DU0PR10MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e33f2cd-02f6-4a26-90dc-08db68152d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNpJCzGsP8fIlIRxJwVg2qo30Vy5KfjnhkHFxzyiFnWTfmIY7jk7QEFSOp+8TGtXbm/NfhwrHnOmP/BwIiRcz0oqcWFqrhQhT8uLLR37y+9LuXAnaRBRxuT9iBe0j/65AMaZE6ZMvl6GchVUyNH37Z2gCI0wOFKz+uaq+sJK+AJTf7/dxJOLo9czSr6FZc7Clizt9AO69+prFkY7U60vKDjg8Nchpc0/90kqPqiqcc5j+T2yyLeojhv4ihBrloOdW5Gnyriu2gp9ewzpXwIJP2I4hzSRw3MXoJnYytHpbhnUYskXpgqmBDKgg6x4+JvOlux2M9SXawyb3udeFN8gGvHXoAitii1L4pJYWQVXks/w1hBKhXnejrnKeY3lZiG5j7AOtBdxVKOOMJF+s6Cori7gUZtjMbOdedZ9v62Mqg1WsnRZcKlUaxsih4qKV3CkP8FwZDg0gL26Cs1yfm1mX8JzkXnuW+C4tYZA9hiZpibU5bjyKE4k0V8aQSCtIzvGD1ZUfeKZPrRYJzCY2JefKzcu5bpo6e3VOHY9RFWhPABaUrNtt5um05yqU/+sE9T572T+G6Cb/ffAbUZDugoeL/2bjTMZa8ZlmsSHaOjRtqpviSvFJLWMniURnRF3WFcnAgrCjQHvQxsBT6zQZ5M9SpaCdcfxUP9QYsk8JO5RCGVfN69eM5R3L2G/Ecbj72JP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(396003)(366004)(451199021)(186003)(6506007)(26005)(6512007)(53546011)(2616005)(31686004)(83380400001)(52116002)(7416002)(36756003)(6666004)(2906002)(8676002)(8976002)(8936002)(6486002)(54906003)(478600001)(44832011)(6916009)(31696002)(86362001)(5660300002)(41300700001)(38100700002)(38350700002)(66476007)(4326008)(66556008)(316002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEpWdHo0NjNlSHk3Ukh5cG1jdTJJcERpeGxCQytwd1djRDFMQ0pRSjd2djJI?=
 =?utf-8?B?YWRtVER4MTZtZEhXa0pFbm4vaFJQK1B2SWtMcVUvR3UxQVlIRTJKOTJKV0wz?=
 =?utf-8?B?YXU0MWJIMkllV3ZzMGxxNWVPZHZ6alFQTlloVGVoellzTlZyU0pPWjlDeHZ5?=
 =?utf-8?B?Z3hpRHZPQlU1RXUvZzNPZXJRdXdXV2JSRXprTTR5TDNXdmZoYXJMY0tnOXha?=
 =?utf-8?B?ajRuRU5uSHJOTHJpaHN5VFpnWTIrazMxQlVJYzlvMmlrbGtWRVhtQVdqcEFy?=
 =?utf-8?B?UWJrbVNYWktuMkdOdnRuenllQ002YlZMNjVjVmxqRS9rMFY1VGN1emY1NDZx?=
 =?utf-8?B?NGtJL01pcWhGK1RvT3Q1RitLS1ZoYTg3OGF2VHA4bmNzcmZJaC9WTlhzcE9h?=
 =?utf-8?B?dlF4ZU9OQThJMzdzVEtmSTk1Z2hIVjQ0Tm5pUUtBTWFQMmZGa2tGTEMxZGh0?=
 =?utf-8?B?TXV1MFdLWkR2Z2lhaHVlU3FoaDJUZ1hqWCtpUDFsMVFwTkZzRnY3NmlKZTBO?=
 =?utf-8?B?b3dtd1hwbVRvVGFxdVdtYlZRMm83V2xNNDd4MDdXVk96OHZORXJ4NkROV2Jy?=
 =?utf-8?B?b2plQ2JXNnFQVzdXbXpFUTJJWXdtQU12RzFsWExSOWhqYnJTbkJBNmhpaGpW?=
 =?utf-8?B?bmo1L0VYWUk4WWVHYVFjR2lCemlWM2FSclZhR3gyNmVLWno0RTRVcTBCM1cy?=
 =?utf-8?B?c05Feng0YW5IcXB0NzdVblVlZ2hjL1dibGNYVlBqc3pNSWJKT2ZGcjRiNDRn?=
 =?utf-8?B?bFh0eW1DL3VLWFdEdFdoZHpUWE45N3ZWWlhXdTRNekZ6bHpwd3BnTkYvSUdG?=
 =?utf-8?B?aElidTFpUURiOXVqNWRIMWdwb1RmQXBqaUszNmgxRDhmc09rclBGMUxxWCs2?=
 =?utf-8?B?dUJvaThTVTdPcTdLc1B4dktXSFppaWQrUTBjZ0Q2NG5HRlZmWXlLQ2tsU1Jk?=
 =?utf-8?B?UEhsTXpsakZ2YlN1Q0N3WE52SEIwR0hKMW9HU3BEcDJ4dGxnd1dSbHh3YXdV?=
 =?utf-8?B?anJyVW1YVlJkSzhBdVlESWZNM0s3dnFaYXZzTUVMYjNCeGF3NlJLd0tpdGFx?=
 =?utf-8?B?emlVaEoyOFFLdTBONGgwazVRK1krNzBjbllFR2oxMVFDM3ltcGxQejFvQzJv?=
 =?utf-8?B?SzZFZDY1M3hLR055bHEzeno3dXFEL25RYXRvZlQ5Q09jbE9JOCtXdWc1czUw?=
 =?utf-8?B?K09NOUxYY29UcnMwaGZHazIwdFdZWkVnN2JaUzhwWWdTMmFhdnUwR280akpq?=
 =?utf-8?B?Z3U1VitFS2ZldnZpTk50NjRObm5WMml5ZUk3VlNNc0xDU1hyc3EzbDdrM2Rm?=
 =?utf-8?B?K3R2aU1PakJ4eGh2RUxTUnFmYWdLbEZmTHBRbnZCZGhuUFk5cXYweUMzWUtw?=
 =?utf-8?B?d1J6M0hyS2hmK1RPZnc1QlBNQm1FaWV6cGxnOTZ6TElVLzdudlVvZUdTam40?=
 =?utf-8?B?cDgzN1FQS0QwVDFadFdZYittUUVTeUprV0M5UlNmZ1djcURqRmFuZkpOU3hx?=
 =?utf-8?B?SFdCRXptVEIveU53N2dLdllOcThuQVIrazZEZEs5WnNmaHlFR0o1d3BBUStY?=
 =?utf-8?B?VUlWc3lVL3FqSkF1cm1YOFM2NEpnYzJqMkV5cW9ScER0SUZDbFhxbjdmTXph?=
 =?utf-8?B?Vno2dlJNamhYeTFBYU1meVA0UkFkTnU2ei9md0FIS2dpN1QwVHplc3dZT1k0?=
 =?utf-8?B?dncwRHBiMTN5VTc1TmoxVk9veSsrRDN4UkpURjlBZ2FucXZZMWl4RTNFUWdi?=
 =?utf-8?B?MTU2OVQyRWJYMUliZVVWaTlhbktNeS9QZXl0Rm56bVZrYWlBL3NpUXRwL1Rx?=
 =?utf-8?B?dkZxdnJSMkRtVkJhRUpVN2lQcDJkOStKQkVwRjVocURuaHpiTjJNSDZaK0pB?=
 =?utf-8?B?Y1IxeUpiL3A3dHRQdmx1aXh2VjlGckpIRGJmc3BuQTN6a3hWR3R3MDAyMzF0?=
 =?utf-8?B?czVNUG1WVU5vN1FHWWl3Q1l0YldmcVlxNEZCY2tMVTgzclE0NUdTS1pPc2ph?=
 =?utf-8?B?NDZIY1ppQjRXWEIvOVMxS1VXMDNzSnBhN2VycDFpTUx6Q2RKVDYrYjBSSWRB?=
 =?utf-8?B?c0pqZUFoM2NVUStKSjU3SEZRZmRwc3dkMTUwWmFPK3QvNHFvNDh2eDJDZCts?=
 =?utf-8?B?aC9UMDB4MUlJaFA2R0hsNzZtSFc2ZVIrNEU5Q012TTlhZ3lBcmx4dXBKSm8w?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e33f2cd-02f6-4a26-90dc-08db68152d6e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 11:40:37.0385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWvuri4ObRj9Hyc0dfdjFMihb7lLdQlKr4I/ZZVhwdkZDSzx36jKrcumL6U2Epoos2UYtS8vXVDsHZfJn2PITh3ZoHJCL+FhPrlVOHzTYN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7532
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 15.27, Adam Ford wrote:
> On Wed, Jun 7, 2023 at 8:15 AM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>>
>> On 26/05/2023 05.05, Adam Ford wrote:
>>> This series fixes the blanking pack size and the PMS calculation.  It then
>>> adds support to allows the DSIM to dynamically DPHY clocks, and support
>>> non-burst mode while allowing the removal of the hard-coded clock values
>>> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
>>> burst-clock device tree entry when burst-mode isn't supported by connected
>>> devices like an HDMI brige.  In that event, the HS clock is set to the
>>> value requested by the bridge chip.
>>>
>>> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should
>>> work on i.MX8M Mini as well. Marek Szyprowski has tested it on various
>>> Exynos boards.
>>
>> Hi all
>>
>> We're testing this on top of v6.4-rc4 on our imx8mp board, which has a
>> ti-sn65dsi86 DSI -> DisplayPort bridge. We do get an image at
>> 1920x1200, but the monitor says it's only at 58Hz, and measuring on the
>> DSI signals does seem to confirm that the update frequency is about 57.7
>> or 57.8Hz (it's pretty hard to get a good measurement). It looks like
>> it's the lines that are too long, by a time that corresponds to about 80
>> pixels. But all the frontporch/backporch/hsync values look sane and
>> completely standard for that resolution.
>>
>> Setting samsung,burst-clock-frequency explicitly to something large
>> enough or letting it be derived from the 154MHz pixel clock makes no
>> difference.
>>
>> Any ideas?
> 
> What refresh rate are you trying to achieve?  It seems like 57.7 or
> 57.8 is really close to the 58 the Monitor states. 

Oh, sorry, I thought that was clear, but it should be/we're aiming
for/expecting 60Hz, or (154MHz / (2080 * 1235)) which is about 59.95Hz.
We've tried with a variety of monitors that all have 1920x1200@60Hz as
max resolution, and parse-edid always gives the same hfp/hbp/...
numbers, namely

       Modeline        "Mode 0" 154.00 1920 1968 2000 2080 1200 1203
1209 1235 +hsync -vsync

> I would expect the
> refresh to be driven by whatever the monitor states it can handle.

Well, it states that it can handle 60Hz, and the pixel clock is also
computed to be the 154MHz, but still, the actual signals on the wire,
and hence also what the monitor ends up reporting, do not end up with 60
full frames per second.

> Have you tried using modetest to see what refresh rates are available?

Hm. My userspace may be a little weird. When I run modetest I just get

trying to open device 'i915'...failed
trying to open device 'amdgpu'...failed
...
trying to open device 'imx-dcss'...failed
trying to open device 'mxsfb-drm'...failed
no device found

> The 8MP shares the video-pll clock with both disp1 and disp2 clocks,
> and the imx-lcdif driver, which sends the display signals to the DSI,
> uses the disp clock, so the video-pll needs to be an exact multiple of
> the pixel clock or the output won't sink.

Bingo! I enabled the

  DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",

in drivers/gpu/drm/mxsfb/lcdif_kms.c, and indeed it got me

  Pixel clock: 154000kHz (actual: 148500kHz)

Modifying the 1039500000 in imx8mp.dtsi to 1078000000 (i.e. 7 times the
desired pixel clock) gave me "actual" matching the desired pixel clock,
and the monitor now reports 60Hz.

This product also has an LVDS display on lcdif2, so I'll have to
investigate how changing the video_pll1 rate affects that. And also what
to do about the case where somebody plugs in, say, a 1080p monitor that
would indeed require 148.5MHz pixel clock.

Thanks,
Rasmus

