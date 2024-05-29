Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86918D2DBF
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 09:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4B3113362;
	Wed, 29 May 2024 07:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="pgDMHp14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2125.outbound.protection.outlook.com [40.107.22.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42611113362
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHjcKIAbkeiloH7nhQuae5uk18MoLuzolH54qdtLaYBKEC4f9CW1kf43uU/Fbx//gX28/8oL95CUQHeoY+/u/3L8WpJ0BohHRNJk4QQPt8eJjyjdnbhJuQ9CgQ1+3L8OGmfdMUheQ+JdYiSz3pZ73JliShsulARkIeVxsLHUY4wBRi/x1o4U5tBGn9dLIsN34hG/WTxUF/gcv6K19yE+Ht+OKAnHVjjRq+MS5zFZLHgYdcDQ63zFEJ6zUCPeoJ+LYACzoJC2NuIdswhHCvpvk0BB/TEvQJxJzisI6dXInXfM6ClHLgfDFVZ5/X+Tgc7lTnvWWVOmXO08xLBEKvhufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cKpq/o8dvTtQJ8EncQ/cvB16TM+BNx0WzTRZOg227k=;
 b=k1sAOKpIX5xIqCOQ5LzOIjx/sZW6AVOAGIrYKU/U7qlRyHipboZCr9ra7XYMqr2BPRP8UmCBAPmklyHFNrhtqIgew8R9vkIbpqQu7RQMOBjWFvuohNSRcwx1DCQYcGuKZ9Ua+CUyeHnQ0qRzr5MYdkf9XhH3SGD4Eug22rnQqm1yUc7bYqTQQo3CnB8oaeNip8SxP/EQwDNXfwYZ+Cyeq/LUrWe51h5J/rCIThUITNhraV5XBBC1NTH3xIvKiiux9hyliGoQa4jAUSSt8EKwGQCZwcyTAyJWZraepu5EO/VX7C6AGp4tXbjSEzOhblK0THSq1gvgKOPFVLAYWGoODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cKpq/o8dvTtQJ8EncQ/cvB16TM+BNx0WzTRZOg227k=;
 b=pgDMHp14yUdTC6D+I61EFqx19Sfxe0dlGSr1BcyjEZPZeASPErjdTHpH79ZVNeDfxNQ5C+SxAQqeephpszpvNb/dtv7wvdQZP0xUSJoop5Rs5W5Sl2jAfu2Gn1J1R685XXMKKf/h1lYfrzDF46nu1dwlTNme1rI0tlOWbqKEDSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DBBPR08MB4539.eurprd08.prod.outlook.com (2603:10a6:10:cf::22)
 by AS8PR08MB6422.eurprd08.prod.outlook.com (2603:10a6:20b:33b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 07:01:48 +0000
Received: from DBBPR08MB4539.eurprd08.prod.outlook.com
 ([fe80::87a9:a8d0:96fa:19e1]) by DBBPR08MB4539.eurprd08.prod.outlook.com
 ([fe80::87a9:a8d0:96fa:19e1%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 07:01:48 +0000
Message-ID: <820889e8-f004-46a8-9d03-b098ffcdade3@wolfvision.net>
Date: Wed, 29 May 2024 09:01:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/3] drm/panel: sitronix-st7789v: fix timing for
 jt240mhqs_hwt_ek_e3 panel
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f8351d4a8d4b@wolfvision.net>
 <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-1-f8351d4a8d4b@wolfvision.net>
 <d10e14ce-b65f-4dbd-8686-bf8c1796ba06@quicinc.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <d10e14ce-b65f-4dbd-8686-bf8c1796ba06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To DBBPR08MB4539.eurprd08.prod.outlook.com
 (2603:10a6:10:cf::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR08MB4539:EE_|AS8PR08MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: f7841815-729e-4f82-62f7-08dc7fad356c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWswYUk0S0hiaUhndjRtOXFiTXZOOVArQ3ZOLzFTUjlGcXk0WHI3bTJXUEVW?=
 =?utf-8?B?TldTNmVmK2NYdFEvV0srVE0xSzV5SWhjN3ZjRENnYzFVQXp6VHZhOTFXTTRm?=
 =?utf-8?B?bUVBSmZMRyt4SXUzTHJielJPd0MzbjczZWxVRnoyUzRLY0hwKy9mQTlKRkYw?=
 =?utf-8?B?TXJ0dVZqN3E2cjF6Ym9jc3BxZWtrZ2RFcTg5UHR5UU1HQ0V0ZGdPRjM3TGpi?=
 =?utf-8?B?VVFFbnR1Wk5MK2FGY0ZBb0lsOUduaDUyd0Y3WVBZcXl2bk5lYmlta2lIOGVo?=
 =?utf-8?B?Y1BHVHhWeUp5dzFFTXV6QkpFRnB2NitmT3dHNmlBdmoxc1VVTk9DWG5tNEhU?=
 =?utf-8?B?ZjI5RHZqZ05wOS9paFlmN09CTGs2NGxtVWE1VDdNYTdFa0FUQVNXdUIwS1lm?=
 =?utf-8?B?aEZMdXpOZnJZbHovbndwYU1ITDh6QTVaeHdoaWlxdmU0dVZUZzdMY1E1RWVx?=
 =?utf-8?B?WEtxNVNnUHZBTWs2eG9jZ09jbFBrL1lTd2lzZ3RkQ1VNaHBHTit0UDM3V1VM?=
 =?utf-8?B?SzhiS1JZYnRRSytHTG5mTjRQUmdUVko0UEkrdGsvUUV0c2U3NVJubUkyazNO?=
 =?utf-8?B?NWsvTC9KQUFENm0vVjluM3JpbkxiQmJlNmFFdTZidDAycHl5RTB1aEx6UEM4?=
 =?utf-8?B?bjN1RDFkbHp3MEJQTWtjMDgwVXMzaHZIS1pCZm5ROWMzc0xBZ1R1S1ltbXE5?=
 =?utf-8?B?MXlBRjl3TWNwR3NONldQZTc4eEIvekRubGNGQ2J5VmJGekgvUi8wbTZTMVo1?=
 =?utf-8?B?eGF6STlZcGtmSENVbUNYb0RJbGU4aUVDTVZ0VlZVOG9ETUl4Q2liakZmWDRP?=
 =?utf-8?B?ZjAwSnoveUR1N3hSQy9hbERoWTdoQUNwMFZzQkpCYVRMS1ltSkluaGRPV1cz?=
 =?utf-8?B?MHNRMmJQOW91bytBNDhGZGhnQ1pzcmFuZWluNjZGNWJVNmtqbEpUNkZ3Q0Vt?=
 =?utf-8?B?WDlKeER6VGJPWWJLQmpMSmR3MWhlYmFEK2JZeUFGdVhSOXV1UC96K25DRi9D?=
 =?utf-8?B?OEx6SDNxMGJIR1puRVVDQloxdlRiVHdaYXZJNzJXdDR0OTRHUVFwaXNVMWRx?=
 =?utf-8?B?Z2R4cWRaMm81aEZLbDVpbnNzK2ptTVNXOTB5Y0NNczRSNGRCMjJoTDlMTEll?=
 =?utf-8?B?MktoRFBkM0taV2NIUDZyYkRFclVHT09Fc2NrVWhiRGY3bEI1MCtOWUFOSlB5?=
 =?utf-8?B?WTdVWXIvUkREZmdOM29Dd05PUDZSdnRMa0hGQVpoRDA2OFZxV0ZzUE9OVC9k?=
 =?utf-8?B?b3d4R3dYR2RBQ1pPYlhvQmluYklNQy9aV2g4TUkzWEFIQTBxZjlUZlM5amNx?=
 =?utf-8?B?NTlreG1yQWN2UFl3eHNiK3VCWXdjb1F3cm8rV08zMkRIOWVtS2k5QUNLbzNF?=
 =?utf-8?B?NlVTSE5VMlVPT2IwWDJ2SWpURjlyNCtZYmNxTnBFVFNlUFBQMHh6b3NpazVU?=
 =?utf-8?B?MFd1bUJoQXBwNTEwWnFNcHEyVFE0bmVlT0p0RXdrQlZLNytqeVh6VUFGYXNN?=
 =?utf-8?B?YXRVL0tRWVNoZUV1TVNSclR5RGV1YUZiYTlTZXNKL2prc09KdnFxOEN6RFRp?=
 =?utf-8?B?Nm15Rm0vT001TTNveW5kSmVSZHZvNHNkTVR1VzNaYVg5RHorY0FpcmsxMHNq?=
 =?utf-8?B?QUppNzRpV2Nhd3dSZnh4TkYzcjJlOGRvdWxVcjdBTVlVdSt6cmMyNEEzNWFT?=
 =?utf-8?B?YVMzT3kyQlN1QW1xaU5VVndUT3JMdUd6RG5YQVBlUFRaVG8wWlRuVU93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4539.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVpFbGErMlNDVzFvYUpkZ1ZPKzd6S1RhS25xODQyV09LamlYRGtkUEZRd1NR?=
 =?utf-8?B?bmFibTh3RW5UcVZIUTFBWXBiZkVRbFRVano0b1FKTlRhVFBxQk11NzNrNzI4?=
 =?utf-8?B?U2RWdmtWQUNVbGJSb0xLQVEyMVdNRkZORDdJU3BHakl5ODV3bktrUzJnSzFF?=
 =?utf-8?B?UHdTa0FzeG9OK3ZBM0pyNzNwb3V1VUVxWkFHRFEwekt2WStyMXFMSXU4aEl4?=
 =?utf-8?B?Y0JlNmVyRFJVeUR6d2FJeHN3TWYyeWpOaHBRNlJDcjc5Mnd6MUlTaEtXTWtp?=
 =?utf-8?B?STl1WG41M3dBQlpzUHNDb3JwOTNpbTBSNWczZDBnbEJVYXhrOW1wTmNKZXRt?=
 =?utf-8?B?RmZ4bDVOdi9SN1RsNis1azNJTHJYT2hlSG45YW83QllzSXk5RGxoa0ExWSt3?=
 =?utf-8?B?UllPMGRGSWphazhwZ2p3UkhKRTd1WHY5VXpQQ1VaTFV0Um5xdmJ0dDduZHN4?=
 =?utf-8?B?VTJSb3NLYWFvS3VNUjJmRnVtV0hTQ1crbWptLzkycE1RMWkyM1pwNStrWEd4?=
 =?utf-8?B?dGxKanIwcmJQaUhxQjcrWVRMaTZncW52MGRGbDNmZnEzNk5oQnh4VDYzWC9O?=
 =?utf-8?B?OW1GZWJOUnhRVVhkREhzb291U09Xck1XMkwvZW9IaCtIR3V6YXdQMWZ1QWh5?=
 =?utf-8?B?bFFzMFJvazJDYU1HM2tMTG9EMHYwUkduTWRmaEQ1Nk00Rk9HOVNrSm50QTF6?=
 =?utf-8?B?WnFGQlJyaFh4UnJSbkliMzUwWEVSaTR1bk9hZDZpdk5rcDh5MXN2UGFWQWdI?=
 =?utf-8?B?dm9Cd1loMGJMdFZSdHp3UTFiZ3ArRVM3bzdKZ05RYi82UkcwUm5tNXhGbm90?=
 =?utf-8?B?b0JFYXNac1NvSEZUUkRiZHNqc2ptQ0lmYkwySUV1elduMWs0K2ovbmZMVjhG?=
 =?utf-8?B?OUk5cEd2WFlsZFJETWV2SFJmWEJFaXFIUnVnRnpDQS9XUnd2NmlXNmN0ZEJr?=
 =?utf-8?B?cVRycUNZLzc0NFhBbFQrQnFIQ09peGw4Q3MvVC83dElVYk41NzlSQlFBMS91?=
 =?utf-8?B?NFRzRGVPTVAvMytxODAzTnVCbEVKR3NWYmpkc2NHS2dDZkdPckdXOTZ2T1ZE?=
 =?utf-8?B?Qm5uQ05FSG9WbDZUbnNsNjR4WEFXejBVc29zbEZITFpDZWIvQ2hydnl2OWxr?=
 =?utf-8?B?V0NKQ1ZOZjFkdG9sOTRxdE5rZHFzajhyaUxFQ2t6T3lTaklQMHpnbDdUQ3k5?=
 =?utf-8?B?dXRDckQwTm9JR1F1UTRVNktHMjFnakttQm1UcERXUWhCcDRST1Z1US9pa2U5?=
 =?utf-8?B?MUtaeUZ0ZUZZRmRPVFp0cGVEWCtQbURJRS9VYXBtTnM3c0VMc0lUY0VHNFYv?=
 =?utf-8?B?MFlOSE4xdm1XeVpOOFl0eTVUMis0MXpZNTVjVTBEbWhtNzZ4UlBNZTlpL0x3?=
 =?utf-8?B?Wk5YZkt1Ly9YLzhyR2p1N1dhV0UrWnFzcGIzTXNxRXZRbXlkTHMyYkFkVFY4?=
 =?utf-8?B?YUpScm85OUhuKzA1Z1dFbW4rQUhHb2V5VXdmcDZwbFdEeHl6akVGTXJqVlBz?=
 =?utf-8?B?OGNYdzJMdjkxdHlsWjB6bmMxYjVYWVpJVnRQT0J6aVNkUHdKVEJ5eHplOU91?=
 =?utf-8?B?SzB1ZW40M1ladHRuQUFLUllqTEU3enBadzlaeGxEV1czTGhWTVZhVDNHdExS?=
 =?utf-8?B?Yys1NHhsaGxZdFFjYXhxVGs2UlRzV1JTVm9oblJUcExGY1greHdMc3BNU0Zv?=
 =?utf-8?B?Q0ZlVTExN3RPWHlBMVBuUHZSVnMxNVZIT2lOdmYvS2grcEZaWUZWbWdzdWJK?=
 =?utf-8?B?UjF6RmRPalVFRUF3TWNRZDZKSG4xYnozS0RhZitkZTl4NDZkMHh2dnlFdnBG?=
 =?utf-8?B?NFBKKzNNNjAvQ0tFYmdmNk42RlZmcnpHSE9GajR1Rm9iemdOMUtKM1Y5UVVU?=
 =?utf-8?B?bVZKTlExdVdvN0w2ZnNFK2FWTXhqOEpHZlJHaXlPandQVEQ5VGVKVDlXdHhl?=
 =?utf-8?B?UXRCVXc3TnNLdFdMTWZiR1E3R1Q4RjI4UVVaY1ppdElyaldHME1pTFZYam1K?=
 =?utf-8?B?TjhYd25JVncvQm1LRHZTN1h2VnAvRTRFRmtuYXAwNFlvK1AzcHZrWWpQVU9Z?=
 =?utf-8?B?Zmw2a1VaUHUwcXcyRlZPYzE1UWYyY2M5S0NDbkM2UDU5YW53NWNQbkxIYVZi?=
 =?utf-8?B?b3pwdlFXNzM0VUxhN09zcE9EYml6V2FVOWhEd1ZBSVdwUVM5b2NIN1B4NU5x?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f7841815-729e-4f82-62f7-08dc7fad356c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4539.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 07:01:48.4224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2I+6oQt2WGLunLksLbzzXI2cfkY8xx7I8IJU+qkTG+ERB/xU+soZjCBCkzNFXPtlU2fVeVmvDocxzwwXi33I3NAQfAcRR8YX04xpLzt1hoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6422
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

Hi Jessica,

Am 28.05.2024 um 19:36 schrieb Jessica Zhang:
> 
> 
> On 5/28/2024 1:32 AM, Gerald Loacker wrote:
>> Flickering was observed when using partial mode. Moving the vsync to the
>> same position as used by the default sitronix-st7789v timing resolves
>> this
>> issue.
>>
>> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> Hi Gerald,
> 
> Just wondering, are these new timing values taken from the panel specs?
> If the timing in the original patch was wrong, maybe we need a fixes tag.
> 

Both, the old and the new timing specs, are within the specified range
defined in the data sheet. But as the new values achieve a better result
adding a fixes tag is a good point.

Regards,
Gerald

> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Thanks,
> 
> Jessica Zhang
> 
>> ---
>>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> index 88e80fe98112..32e5c0348038 100644
>> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> @@ -286,9 +286,9 @@ static const struct drm_display_mode
>> jt240mhqs_hwt_ek_e3_mode = {
>>       .hsync_end = 240 + 28 + 10,
>>       .htotal = 240 + 28 + 10 + 10,
>>       .vdisplay = 280,
>> -    .vsync_start = 280 + 8,
>> -    .vsync_end = 280 + 8 + 4,
>> -    .vtotal = 280 + 8 + 4 + 4,
>> +    .vsync_start = 280 + 48,
>> +    .vsync_end = 280 + 48 + 4,
>> +    .vtotal = 280 + 48 + 4 + 4,
>>       .width_mm = 43,
>>       .height_mm = 37,
>>       .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
>>
>> -- 
>> 2.37.2
>>
