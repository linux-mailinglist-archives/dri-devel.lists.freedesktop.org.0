Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180084014B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DEC1127A7;
	Mon, 29 Jan 2024 09:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2110.outbound.protection.outlook.com [40.107.20.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE3A1127AF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:20:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bItDU4+J7L+G50aTcobMfhg5Vr/qcoGeduGSzk/2tPWdZENSI2x8E1zgafArdWW+tELWoWx2ca0Vc7r7KgKKgXwKJ0cG7NzOISVTOPUWKcl0zglP9+ETrNhZU2EES0U4N5r3jo8Orv1WbBgTlcHc2W651fxgEMwmYA6kAdCPBppmva+hxd0ML5mv4ldO6mNEtC0t5POtYh3Zf+zBhKRhrjmjsjL0Zl0QMXyZcITlfbT9IdT+Wsd/9yVPJ3bTKXunXQDTWnkOQrLtV7wIsZ+D1Fd3L3OUOIhqjvTePa9qZ9B7B3hFEWNISAcNzs/QXZ/QzIUjkcmhftIrvwgCBC10cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhAPFIm8yJqoBOItlE0oYv8X7BCbirV1KqXVx1Jha2g=;
 b=MbLSIJwqu9eXZ0BBCMWaJtPr5d5tLo8JLY1IrxDeQ0pbbIOsQ9ju5mEUbDr0odan/+TSRNDlA2bTvtubDzOt8buqw6AEfEz1SszVyAVXlZg6mesUiYix0M8ZDowwXyu3VBNbsDa6XIrBFbqXTl53t4HsHGrE4fwe2wHVoLMMCQCrwDBuHWqRaamqe+fqQslPwFHJyOs3SjHihiEXk/Gs6qvshW84n00/dg3kKss30yDaD2skvc6uHs23TEepUrkFkqbBj3UM2DBBotssStm3529averc5S2rQfFlUSyuJkFIbAxue9kVYiHXLxLop1rOILFmmn2NL/Md+UHs6XMwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhAPFIm8yJqoBOItlE0oYv8X7BCbirV1KqXVx1Jha2g=;
 b=LH6Z9PY2OIhW9oSUIVwt6dAH9SFoZjJ9BTW9xxdQKQi4tvOyItM0qm5QwhuczN/lVT1AX/xuYL2KABimY25r/XogaWTKPLWA+KEWxPRaKkzS903pTUXd+MRFzBZgp9ricSaUCsfQRM86KoZ1j/zq9PT1Hq0Tg2ne6TXMu4WurvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB5905.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:398::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 09:20:30 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::44de:8e9c:72ac:a985]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::44de:8e9c:72ac:a985%6]) with mapi id 15.20.7228.027; Mon, 29 Jan 2024
 09:20:30 +0000
Message-ID: <49b26e7b-0205-45c6-b7ab-8424c20d3f6c@kontron.de>
Date: Mon, 29 Jan 2024 10:20:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
Content-Language: en-US, de-DE
To: Dave Airlie <airlied@gmail.com>, Inki Dae <daeinki@gmail.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
 <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 597257bb-2ac4-4670-362f-08dc20ab89ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DaDtz1WUiFL8X+hAtd7FfvmZi5FqIum3o5ktF0HOutQhcYfO2aooZIwVyn/dTrfHGPdjNmibbjdrTxBI7LS3OXmvpmkSX+rw4aK/wj4zFW+bGTMYy9Hj5qVQSOW4XlDTB42iTubdLVKAHNJt4QWp1S3yZ4Z3KOYgTwGz9XIg/8ovAeb4oRUCr36eoLOdrvjmimnSBT1oeEMkIYQf+dYuAFY7ASr/bYeJOQ0bohUE74Os/McqhxqGemu3tqJ0U6OTjCYdmLeWEMyYHVljwSDxO6M4T/0f1vTgVTGH+TrqqTJryMY1xAn6dKTSoLoSGZUWvqRoisKZwjUmclFZIgpRsKdkDsFwLV2uP0NmkR3fJTnnAjKAS69wEDkqxPmZpU4ZDgKSyZM2KiEykx93OHPOzyyjv7cRX3KBOXVi3AuwJGluBlon5b4p36U+/b0tDFC09FBLFnEGfH0cw6LthP/IvueuPI3i6S7xuMK3UM9CRO0nyZBPf8AwNoAr+EtSYAaiGazRGMu9aiCVQrLFeQiLGgcpio7otkSbe+r7yQOz5aY2HrJpOz8ORzCDhDNrgSHDiUmdYtcFn6iu1ch9B6E3QorfjaUuyKZb+bQzBGUzkEFccyfVkm/Ox0Z0UgyuFATKeROH5HIniHJN8jbQz2g40g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39850400004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(31686004)(38100700002)(66556008)(53546011)(6506007)(110136005)(66946007)(54906003)(316002)(86362001)(6486002)(66476007)(8676002)(8936002)(44832011)(5660300002)(2616005)(6512007)(7416002)(31696002)(478600001)(2906002)(4744005)(4326008)(6666004)(26005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFcyRThGdnlIdXZVSk53MHZScXMrdncrVWt5ZE90YWZwbC9HeW5semRidlBM?=
 =?utf-8?B?Rlp5TVR0RElnaTNMRnVHZzVaQkRVZHJub3Z5RzlzUEhyNjhzcE9GTTFVSGdl?=
 =?utf-8?B?TTVDaHY0d3F4NXVUakxBNHFYcHc3STZnQkRiSWRKUGg5WFNSWUdDL1ZUODlE?=
 =?utf-8?B?UGk2dU5FUEZFWFh6VXcwRGNrWWROaDd6WWtyaHBVSG52YXVzQmFYYzRlWWFB?=
 =?utf-8?B?T3hZaHJrNjJ4SXplNUFDejFNRzZPOHpwbXhWdU9sVXl4YmczbWRKZHpBSHZn?=
 =?utf-8?B?OGN2TXdHY1JpdzJEYlBEREU5Tkx6WnFWTmdTVlJKNXhxWE1QWGFJaTl2d3ZO?=
 =?utf-8?B?eVE3MEViM3l3TE5WdVlla2luYWo5QWljc1VDS0R2aENaaWtnalE2R1Rmemxl?=
 =?utf-8?B?Y2ZXUGtCTUxtU3BFNExCMkZ4N0VKMUZPUEFQOG1QTUFyemViZmx2ZUhyUVFF?=
 =?utf-8?B?cFozVWs5SFgvRjVuVHdoNHo4ZENhaHJCV1psNEpjMkttNlhhU1FNMm5PaVF0?=
 =?utf-8?B?NXVIRXpSMlFuSGtJQjZtbTM2SFRiUHphN2l2c0V3czRQUUYyam9qZkZJN2Ix?=
 =?utf-8?B?OFBaTU5LTHUrNnhsaUxXdUJ5WjhnTTFKOW9yMXFoVkROR0RrbDJXU0RlVEZt?=
 =?utf-8?B?ZUxvSkJPUE5WY29HNmhzRjhlQ0ZsSE8xYVlLeU5VN3o2UDFobGRVbGkxS2Fr?=
 =?utf-8?B?djZVd3FXT1YwU0JDZEthK1luRk1yTG1sT0x3SW1NMVNvQUtEQ2dQM0pnUUky?=
 =?utf-8?B?WmNxRjlZL3VxT1RwWE9kQVJpazE4bnh2THNuVDhlRXNOYTlyOUoxMCtQM1dj?=
 =?utf-8?B?ZlNERklGMFZOQ0FOUnluT0t1RENGUDliQ1laUXRkNWpzOG1zZkRTREdrWDFI?=
 =?utf-8?B?Y3E5SDdZaXVOT1k4QmlvZTl6V3hDWEVscEhiZ0FGYUUyelhQWmdlMjBYODFL?=
 =?utf-8?B?M2RSMmkrQ1dtTEJXdHNZUDFKcEo0ZnVqZWVFb1ZLVHZqMWxYUHZlTG9mampO?=
 =?utf-8?B?bG4wamprdHRmTlFQSThLTys5Q3d5TWg3c1BLSlZJSUZ6REZzQWlXVjFDNC8x?=
 =?utf-8?B?b1dxZzhzaGdaazhIWTF5NFN3UEt2dTRTZDBCUnZsRXRGR1FtR2RsSXR1R2lG?=
 =?utf-8?B?SWl3N1NwZ1YybEFGdnlFamV4UGtPWnZkY0pvU3pSaUtLaHk5VzhOZ3k1TEU0?=
 =?utf-8?B?bloreTIyWTVwbUV3TVZOTzhqekJUb1lTUndEcytKRm9hSjJTR0VSSmJwejBy?=
 =?utf-8?B?OWxVSWVUYkxoc25HbS9PRFJ1bWF5VjUySWVVRnlDTHdYaWlMRW9QZkM4c2FQ?=
 =?utf-8?B?YS9GUFBQZTRqNFJ5RURKL3BZcnh2c1FsRjE5eGsrWnVRQ2ZxaktzODBqejFD?=
 =?utf-8?B?Ty85MWdaa1ZnUGNDQ21wM25kb0UxRVE0S3JKdENiZUh5cGsvKzBLbjJvWDNo?=
 =?utf-8?B?bmdhSWFXWG0yVzZCTkZzNDZ4QldCRk5pMU9xUUZLTGNXRU5yMFZTRjNFYi9n?=
 =?utf-8?B?T0Yxdlc3Z1IyN21nZldieHhGMC85TTNRNWdCRW5kSXR4M0ZCRWUvWG9DU3RI?=
 =?utf-8?B?eTdSQjcyYmlTOGVjZ3pLc2VEZDcvK2RoTGZIT0FuTHRHVzU3Y0lXeEZYUHBY?=
 =?utf-8?B?ekxqUUV5WDZOcXlsbHpsTEhOeGttL0FMcnpTczNjTGNvNmNaNTh0TjNRNzF4?=
 =?utf-8?B?QTZoL2wrVU53NTZIclIrRDB4R0tRbnQ4K2xWMXVCVlJzaVU5THhQdGJtNGd2?=
 =?utf-8?B?amVqWU5XaGpZN0NvTk9PMnJTRVhQdGdRZUY4SjllMUxFN2J1Q3FvNVIxY09P?=
 =?utf-8?B?aVpmZWYraU1rVmVERktDK3N5RHcvQkp3Y3JYY3o5Y1NmK0FQNWJWd1NUODhx?=
 =?utf-8?B?SkNEbzJHbEJrYkdqSE1oclBPQ0dtL3lSdUswM3gvZFVZZWpEV1RHeTZDL3hF?=
 =?utf-8?B?TStUc0xWL0s4ZE9leklENUhVTGFEU2pwejhDOXZmR2IzbXhiK2ZjVWhzYjFG?=
 =?utf-8?B?ZXZsaURPTldTbHVhMEhhRmJwN1lsSUZGNHBEbWN6VGhkQXBKTk91UmtaMFNw?=
 =?utf-8?B?OGlIRGJvL0loOXNOSmZ6RUN5REc0MUNod042eEVKUGZBYXhDcVZ5Z01kUDBZ?=
 =?utf-8?B?RTBxYXJrekFMVDVYaFp5VGUyRGdKbk1QeXgxTkU3alZVemxVbHRhYXhqLzBl?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 597257bb-2ac4-4670-362f-08dc20ab89ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 09:20:30.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSMqUC9L3Bc8UiaIagnoEyM3D4uoPNaloDwdZME3PsLcq2pUFOl0FMPd9BvvPuVH1GzkOUj8zGmtWGV02paE3Am8+R+W79I6MFRIpKJtSeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5905
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Walle <mwalle@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.01.24 19:28, Dave Airlie wrote:
> Just FYI this conflictted pretty heavily with drm-misc-next changes in
> the same area, someone should check drm-tip has the correct
> resolution, I'm not really sure what is definitely should be.
> 
> Dave.

Thanks! I took a quick look at what is now in Linus' tree and it looks
correct to me. The only thing I'm missing is my Reviewed-by tag which
got lost somewhere, but I can get over that.
