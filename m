Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1840696187
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 11:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3740C10E878;
	Tue, 14 Feb 2023 10:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2109.outbound.protection.outlook.com [40.107.6.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE32810E871
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 10:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeTuy0cptMuhWa/aaqGzv2wct6un4qPWnHO41OHFDsggw+GtqdKGpnyS2xF4s/inQYSEuVm7wW/oelLXHTlMhVBTzli1YAsLugLowcAffnGR7nTHfxb51Z3HQL5/iuedObqtLDkpz2u6YIRt7XjZaRQ5xQOuprthJxQI3Rj7Dhopk2G68JgUpCwirUZ+ylQWk9qrg11OW3e1AsW3R6j3q2xGdmZEOjq98y3yX+GjEDVVFZVcWhgcWoRe8n8Boq+oCaohiaCEmomSS0xz9c92g5iBtKk5WBZayTfuVBDaERwjYZqH7m/RZWkI/GgFVPGQioZ1UmCE0ZX87PW/aCt1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ5wju/vQvl72PC6ZQQoxaU8iAQ2RuI7QkOrHFkNroY=;
 b=Xm4itAG9K2NhmTXEy9EtDd0gPw77WfQnKCkZCEQDyzslMyKTfiPOttxU0lfVi/G6FmfppjzKCpD5NnRQIVPkCdCObyKZoR6hBCm6dG9Fvknf2NYkTjIXXDK5N6PcUp2+FkxkoFFSsV4WtuMblCiQzU64qHheaj6fOOm4VCR2hYE0tHBgGEaGqgPT4odejhDrph8agmuLesuBNM5thvsX/ROrziLnY7pbB72amv1tofdSE+OwdI6x9vTkbjNKCklnePpLi70jwkJQy/p1XBboc9NiPduj/58s1+qOgV0qAGjIF++cwI8IMwmT6bSj07LFTGUm4u5rqPzWrfyc5BajaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQ5wju/vQvl72PC6ZQQoxaU8iAQ2RuI7QkOrHFkNroY=;
 b=R/fQm0GcCK0PiFlHQOv1i07iUVBYIYSztHus34M6ZXkSkCzdyS2IoZ9TT+Urcq/EtIZHBC2o1zWpfdRlT/HHdho2AsFrh+syoT5Zigw0f1lTBvLdowwXLBC4VDIpPa6q9su7ZNpYOwGhtv9fb4hwn+HLIvtd14zTuV8DqWdOpq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AS4PR10MB5598.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 10:55:07 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a%4]) with mapi id 15.20.6086.023; Tue, 14 Feb 2023
 10:55:07 +0000
Message-ID: <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
Date: Tue, 14 Feb 2023 11:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
To: Marek Vasut <marex@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0021.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::22) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|AS4PR10MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e89d619-2524-4bae-b6e8-08db0e79ef1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9moswNbluu0znwUS5aFPKpjcFyBXf4y5StLGM3kMH60lb9oM9UIvllzpqub8j67ibIp8KcLyoDBxcGSYg0GIXN+nbbNeU2tJmTB1g5aE1hzrYnNKFe0dUbKLElJ9e1blp7JGTHSOPqCzbktGBz+/yVh+IR7bB09t0cwU98vQ0TucFkiVPlFDeNBBsh2cEXaQY8cF91IfrDQNnZ1jlVlMLJ9j+yxDhOstx6n5ccxMaLqUGzy9G5lLI4lte9G+nP1RdKNctBfZg3F6QO9vzdB33g0k/0hnLegaEAWw28Vt8tZU72YV6bzFLk3mo7NfsXAWIDSx3hyd6BetqsX+EnTsrd66rSvUEd5iLEWcOm771Lmd5wR23PftirRytmicvrT35f73X6vFsKamxJwaQLlmsuM5ZbCks63DBJ3Ry+NETTtXYk2qyXgpkc8id9ck1kujJ2ReS8tEG6AYz9SXntExXGBa5nJXQff/G1D5tO3hJ2PoBaKd7VprPX1HkrPh8hnVrTUBOyKMP8Ccgxg4RvyLi199wtp67CY1+yzecTE8F770RZ51iACyi9Uh4D2i2G1vWa5RRJvxfqLfp3x+CV+Ad0T4Xs0ap6gOap3QEJNTlaRvsLwkA7y0eU9NksGNUHVQDpS2YsCUgZHXq/jggMATJUfmuLJE7W6qrRtt+6IxTwhmB7cIYpS/atTyr2cPtnv7WYLXbHTLlNmRSkqMn10f8fcD8Yj8QnpnueZqCjuiCiW3gDivvuYG9h4Thn6cLor6qmuFC7IJ5ZwZqPfcY3LGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39850400004)(136003)(366004)(396003)(346002)(451199018)(38350700002)(66946007)(38100700002)(6666004)(66476007)(5660300002)(478600001)(2616005)(41300700001)(6486002)(36756003)(8936002)(4326008)(8676002)(66556008)(8976002)(2906002)(83380400001)(110136005)(31696002)(316002)(31686004)(26005)(86362001)(186003)(52116002)(6512007)(53546011)(6506007)(44832011)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akppYkwrd3FoUnVSNE9Nbmg3b3EzTEZEZkZyZkRsY1NRaUMxeVB6L2pSWnhw?=
 =?utf-8?B?d1QzT0xGVm9YOFY4MW9zNGttQ3VubXY2ZXB5SWpSNStEcEVqZk5kaFVMdWNR?=
 =?utf-8?B?Y3BzMjMzVlh1S1RmZG9LQ2NBTVJRZ2JMQTE0MkdnbU5obmdTMnF0MmVHUHBW?=
 =?utf-8?B?N2toWjhHUFBoWndWOEQzU3ZabmI1SG83aEQ1K2ZDK05jOUZaVEh2OFNscm9i?=
 =?utf-8?B?YUlKejN5VTBXOTNMczZuMmVzWWR3VWUwZElsdTVLQXJqWDF1Ri8vMjZrN0Yr?=
 =?utf-8?B?TG5pUXpMNVU0Y005THVRalY5a1hkL0Z1NlpxdFFyQld2Q0xPL1NFS0xEYWJj?=
 =?utf-8?B?MEFPcDhDV1habFpiajhYQ0pvQVpwc1BYYnVQRFZwNkV1dWdkdnl6VUZlekRs?=
 =?utf-8?B?cHo2ZG5tbEdFbDduKzNNZkk5QUJobWFnSG1ubTFXOXpoanV4TXNRUDVMVzUy?=
 =?utf-8?B?dTRibzFJRHBGSG4wYm56ZG5GMDF4QnB1a0d0Z3NtYmtkbnhtMUxrb3hRWXBs?=
 =?utf-8?B?blVuQ1Iyc2tBTkVpR2FFTVk3VjU2bFR5bGNUNnhFd1ZkOG44NUo0RFgxQi9j?=
 =?utf-8?B?eVovTnBhdEdEZlhzZDcxZnRHZDY1R0lRN1ZMQ09vZTFoQkg5eWRQYWNDRG4z?=
 =?utf-8?B?K0o3YnZjQ1l5b1lGQktjRittYXBSY0ZSYy9WSFc0cmhuWVR2Vi9BcWZ1c21T?=
 =?utf-8?B?cCtDeDQrNS8yd3VtRWZCUi9yeFA0eStVVkkvVDFPVTdvZ1pMVHhNYllvSGNz?=
 =?utf-8?B?YWwvcVNMejVYQmtXL2ZtdHNqa3BlSUZNMU1uY2VhV0FVQjhiZ2svSnBEU1VS?=
 =?utf-8?B?OW4yUHRUTnRkaVBkYWFNVlBzNlZtTnhtSCs3T01ReFFiU1JmSkx4UnRzelhz?=
 =?utf-8?B?WlpvbklwNjJ5VDBsbXRlV0lWbFdQdFJ3Vy9ic0paWndvMEFhaU85TFd1STNx?=
 =?utf-8?B?Vm5Mam16RTJzSUJ4VTJlajlnSzdhSnhRdHFYT3Q3SkZrZVBNNG5QOHhrOHZS?=
 =?utf-8?B?a0trMldSVUxMcFFydjhGVER6M2E4TmQxZnB6ai9ZTW5lampiZFlMNGFLM3ll?=
 =?utf-8?B?MDV3blM4Q29hRUpoTi9TZllLWXhTUURVMUlzL0pFRjBpUTRSUG1KK1BiYm1k?=
 =?utf-8?B?VzI5Q1orZmRnVjFTbGVaRjd1bzZvZEJTUnJFeFk2aUM3RWdpWjRCbWl4UVFR?=
 =?utf-8?B?R1pONkx3UHMrMVhMVGdWUFRwdGh0NWJoWWpSdWU0cnlkNFVBMmRUOU55Uk4w?=
 =?utf-8?B?RktLSEdZUTlXVkV3REJFdlB4TXptVVZoWjJTTjJBSDFPWXAxdkRtUW1oQ3lq?=
 =?utf-8?B?S2lhNXIvNDNqaGdvTVpORGtDS3ZPdHJBSDIzYTdXSXgwN0JMdEdhWmVCZmpS?=
 =?utf-8?B?dWtxRlZYMGlHZzNudWZUUHM0cEdTRWNxU05Mb2d6UzllclFTU29NS0oxWTJk?=
 =?utf-8?B?dVlTb2cxdG8rT01JbDhKbmFOa0hxSUMyTHRMNzE4NzB2OU1EU20vTEVNRksy?=
 =?utf-8?B?RStISGErQ0dBcHRUUDhXKys5YTVNVmdTcmVxOTNlYTdSYUtNcDdhcjBxRDZN?=
 =?utf-8?B?MDdvTVk4ZFR5dXBxcVhVN1A0UjVnQjBkWkljcEVMcDFkQVFEb1NvV2h2ZGFY?=
 =?utf-8?B?RWhiZzJzdzBxbVNYWGwrUGxZSUVFWVFVcUlqZFVQSDJ6b0dWV1ZUUzd5cG90?=
 =?utf-8?B?QVFENHBMNlpvaU5MUkxqT1JFblhpSDVxbDgxUFhlQzNtMHBwTGhaaVVYNmM5?=
 =?utf-8?B?blFVb0hPMkV3L0NXOGlJRU16NE1uWWdlaytOYW1aNFhlc3pnSDJGZjRHL0pB?=
 =?utf-8?B?cjAxQi9icEFUd0FsK2YvWkI2WnB1WDE3dFVYc0NtUEdkTjhGaForWlMwQzdz?=
 =?utf-8?B?bWNvMCtPeGs1dSsrbElnM1lYTmRlaU1FUWdkWEhwQVFGeHZtc0p0SXc0cWoy?=
 =?utf-8?B?ZmQvdUUvTElNUDViZm53QS9PQm96OWFmeXFTWWNEZ3E1anU0RENnd2hSRWVx?=
 =?utf-8?B?a2RTRENKdE1FZExleFdlYmVaZEx0d29oVVRqWVRyam5DWFpBRkNFZGlBY1lz?=
 =?utf-8?B?Uk5wcGZ5cjB5dlp1bWJJQkhwbXZlU0g1UVl4R2I2OXpnRnIzbUF2eUg0Rktp?=
 =?utf-8?B?cS9mdGJhb01Kb2p5U0ZHVGo3VjE5UWU1SnV6VU9wYXA1M1pReEZDT2hnQnlU?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e89d619-2524-4bae-b6e8-08db0e79ef1b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 10:55:07.0490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xYKaDvdcVcfxXnhT5l0scEetYVutfrNCtcfGpt98OfbZ37gT20Hqkj22hxlqMcrrpsEq1KchCYC6JtveDVpB+1qMhUUrp8kUNkH42VH/OQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5598
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 10.23, Marek Vasut wrote:
> On 2/7/23 10:09, Rasmus Villemoes wrote:
> 
> [...]
> 
>> Now hotplug-detect doesn't work with the current sn65dsi86 driver, but
>> that's a separate issue; when I boot with a monitor attached, its edid
>> is correctly read out. But I still don't get any output, and the monitor
>> says "no signal" - my naive attempt (which has worked fine in other
>> cases) was to just dd /dev/urandom to /dev/fb0, so I'm clearly missing
>> some important step.
> 
> You could try and tweak the DSI mode flags in
> drivers/gpu/drm/bridge/ti-sn65dsi86.c to operate in DSI burst mode
> MIPI_DSI_MODE_VIDEO_BURST instead of MIPI_DSI_MODE_VIDEO . Then you
> could configure the DSIM PLL to 891 MHz , but you also have to make sure
> the DSI86 would expect the 891 MHz (please check the datasheet).

Well, the data sheet for the dsi86 says up to 750MHz DSI HS clock, and
if the value specified in samsung,burst-clock-frequency is twice the DSI
HS clk, I suppose I should be good up to 1.5GHz? I have tried many
different values, but I never seem to get anything through; I think I'm
missing some piece.

So now I've tried to use these patches on the imx8mp-evk with the
mipi->hdmi accessory from NXP, just to see if I can ever get any
graphics through the mipi interface. And there the story is the same:
the adv7535 bridge gets probed, and can read out the edid from the
monitor over hdmi. And while the mipi block and the bridge seem to
attach to each other, I still don't get any output.

Do any of you happen to have this working on the imx8mp-evk, and if so,
can you share the .dts updates you've done and how exactly you test the
graphics?

Thanks,
Rasmus

