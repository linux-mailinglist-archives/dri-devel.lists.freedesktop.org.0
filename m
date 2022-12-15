Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A164D7F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790510E4FC;
	Thu, 15 Dec 2022 08:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2139.outbound.protection.outlook.com [40.107.249.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20D610E4FB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io7dTzO6Lvn641Xe+BOD3/ZiaMFnq6FfnP1cEjtdy1F+tjIN5qHj9myjLzPwfl2QQyAcv/yKln8iGL/1nnG0vMl42aFkrp7qyCl2W7cxyNF02h1a4DPASdI+B7Z3YDnq0G5MO7uDy2zLxSolObAZ6K6npciQ2NVE3Bk/hHgl+vaaHn8tq77Fk5kZ+pJ3BzhWpJM4RPMwVYu6zn5yDrke35tKcEbhKpQvUOAufa6/1FYqiKNs1smod828gY1DnsywcvFO6afkQZxYs7rWVcmwmo/wAdzsFRmYOhZu9w8zuK2gPxMQGq5IZ2S4ZzXqaNejdDLZE4ma6/3jT48PTgz05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exKXGIGLIpPSiE82KDMc/dDSAXhgUFjyncePG9ts2OE=;
 b=YOgjfrxPWbehrZs4wGbJ68+kio2M8Ioe2fr6QiWw0JrcTaAc8L8qjU9wJUQ2F7Vs+62W1wHB0AGNZqJlSxXruxDrJFhbg3uux+P6hY89polstlnC3xvkc4slRV8qc2olTeHIXLuDkQRB7M3aE8+pFncjuzFgml5RVWEcXAhrvH+tw2JExxGBv3PZuTDmdn6lCbi5DTuHZmZsMzuGV0y/EJJ5h2wT0nir5K2C9/9FqwDxT8Nx6/JIjlYXAPkcLzHqgOlQqwXm2ud3BEHr/Ozy8AZBITTSPzMWHbFCObBA610F/Fi712Ldssfbvd6LQn1zJVXY+Ex5wopMsEL9G3x50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exKXGIGLIpPSiE82KDMc/dDSAXhgUFjyncePG9ts2OE=;
 b=NJMXur7sJFheQcDspLR2IDAcgrjNd7mxJljK7KGLtnRYC8Kxwpdv+ZW/bQ+M5mv0VwjWEAR/snWlvO5x/1WmBnTKoTTiMcMDQ7myAVsvfPixUIDao+3A8LMgvywyg04xb6NTpcpAaabZ+ZldmCap4vDcAfkyHYmsAKSKGTLVCfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB5356.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:336::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 08:42:43 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 08:42:43 +0000
Message-ID: <ea555095-10af-cdef-fc57-6438a8bd2f9b@kontron.de>
Date: Thu, 15 Dec 2022 09:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 10/18] drm: exynos: dsi: Add input_bus_flags
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-11-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-11-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::20) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6f4cd2-1650-4b50-151a-08dade785541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCUhMTrA2Pc3oC7SrKehTOIWgEOTNTsoJ/DULZpGRqAAU5Q0M+W8mug6WxBTLp0wx0NrRv1RrEXoKLue0SY/RwPmDzJlcf/Mti43Jx4HSmrB6WWJkmbHRAoSplCdsNdvDgG6U5i3rr44l5ppQDKDULSVyn9opqXdv4lAiJoHgkJmU7tMsLfhFJgWDdRXd8q0NOaQuUATfxTS3gcbvcJiAGeYuFGxI9WJUqCCMarr9d1lzwgXH19s8Pt2NBWVmfuD5asL1UGzXvnRlqS/SlnMPaJVlyePuyxC3RlP3GWRJ0xD18KXiOU5k7cZtbqHLJrYVldrmfV3lBrIaltB1GYV97cKyD+WSBEOeLsxqQ+6uUIr0EaikJsHQtN/9pgYwrQ8KX1T8njI2lZQhOm2DdrixsbiO6FDdTZxrIl8oCbEFdXA8MCCoDRrexe3csMFcXH5zMfWOJ5Rz7D9kk4DFJC9z1ddYJedde3ZYy8jT2A0mF3J98Z3wV7tDr4W1/I2DKxUfvE56eUyQNrVEwVoXa2fPPtiBhZZj1YYsh5iBRvqJbP3O8zLrlwhiD+7rEtZSLa4DsK/aJ9HvSSjAMyV/KO8kLkFehDAKGeMVgr5lzqaL6s/mOlO6W34PBUJOU4YpIM+RfkTeWNCoFDMmzxgQw5j0OmuPAQdTnLDffpD6t/RAn9thPpkSnevtR9LQntdiMS2PcPWl1mZdQFrjYZHNW6BT9RIcbsxUiOWjdPfN4waHs3rZ2aXRtOV4q70QzZrPJRv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(31686004)(36756003)(110136005)(6486002)(478600001)(8936002)(316002)(54906003)(38100700002)(31696002)(921005)(86362001)(53546011)(6512007)(186003)(6506007)(2616005)(66556008)(4744005)(66946007)(41300700001)(44832011)(2906002)(66476007)(7416002)(8676002)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJ2eU9HQnc1WUQ0WGtETlh3NHZSTWIyeHpTTXk3YzVkNmlDTnpmUjhyekpy?=
 =?utf-8?B?aFRZZ25FNXZVQlRsRVVUTnFtVGVJZ1lGMnFXbXFPKytkTGlTaVJNdlgyKzNW?=
 =?utf-8?B?Tk9FOVFKcmpLdjJ1T2cvUlRxb0p5aTAzTHVsZlhSWFZPYXdCVTZWUndXT2tz?=
 =?utf-8?B?YWdyU3dvS0dpTEdTczJkQjNjNklmVmV5NGVZSGZ6OUtBUmllclA5c0RqN2hR?=
 =?utf-8?B?ZmRiN2VSM1FLWXFTNFFERmxyVmR3b3lDRlJTakI5WXN0ZUFQQWx1b0U0Q2lv?=
 =?utf-8?B?RnRSQTVYMGJIWldjNC9UL0x1RGtMYVRaVTBtMnhEcDM4S0JZNzJnZE9pM0Ev?=
 =?utf-8?B?YlRvT0hFMituWmJtWnVxV0dRUnVVbjc4YXViTTVkYS9sN1VjTmZjdnl1MDdK?=
 =?utf-8?B?aFBwV1dZcnJiWm5wS3RXMGtsQ3UvY2YxT1hleGZnenZyL2t4RG1JV1gzQWl5?=
 =?utf-8?B?ckdjam9qTjM0SExWZHVjV2hlQktvMFNwTENRTTc0Q3BBNzMvK2R1N2doQWJM?=
 =?utf-8?B?QVNSa2RwbnJYRWhEWDRqcXQzcTNGTWN4ODVTSG1qeXB2QkM0Q1ZWY0ZpbEhk?=
 =?utf-8?B?Zm0yTHhEMXREOWJlSGZaYW4zNC9kd0tZaWdOK3BaMVlOUzJPb3BBdjVtTkZm?=
 =?utf-8?B?b0NzQ2FjN3BEZTJyT1FnNlhibDhqNDZVOVhEdldCZEN0eGtrUElLUExqNEhn?=
 =?utf-8?B?Q0pJK2YraWRidS9VaFM1eWlZOWVnc0pKc0NHMHZvSUc2UGY5NXBsci9SUFF1?=
 =?utf-8?B?a2hSZkpMLzV1bHBKZzUxdmRZVzdDZ0UwYjBDSkhwbGE0TGIxWEM2VmhwQzlT?=
 =?utf-8?B?M2t0UE9GMHIzTWJrb0pxUFMwVXFJOGUwdTVHU0VVM3d1akdsMTBwa0d6RHJm?=
 =?utf-8?B?aDFwdTdQSUFObEJSS0VqU0NEemRrMXJKdlNMRFB4YktIZEpadE5pak9FQ0k4?=
 =?utf-8?B?UDNpSjFsTjRXWVN6eUJpdlhFdCs3RnFhblpmYzdFSDRmcVRocGpBRDJsZjBw?=
 =?utf-8?B?L1RiYUUrMWI0eDVpNkRabUpVYTlyVDk3N1Rpck9hbTFGZlZoNWdkUmw3dmNz?=
 =?utf-8?B?eEpXbXBpK1FFNGZsOEdVV0o3czdITWIzVVJFWklhMUJVNDExd3BZNXVzUXMv?=
 =?utf-8?B?OUw1MXRsd1RUVk9sckhyWTJwQ2huUTZlbHBLM1gwNllyODNFZVEvOXFmaUtJ?=
 =?utf-8?B?WDdrZXptZ2M5VUJhRFRqcHNmZE1kOUlCQ0g3MTE3Z29JN3l4M0xsaXJyVG5k?=
 =?utf-8?B?T0FVR2xZRXluZWNSRXZrL1hqMi8xRmJtV0pBeHpSWHc5ZjZmU3RnaHRic0pO?=
 =?utf-8?B?RFFzQWdvZ25FcEx4NlFYMXp0K05pMnUzOENaRDVDRFMyQXhvbUxCY1JpaG9B?=
 =?utf-8?B?ZWRrY1IzdnpjMFdGRjJJU1FrbXJ6UzFvRmxxM2xlQ0w2a1VpNU53ZDZ2eS9E?=
 =?utf-8?B?NnZxM2diUXJHcklZN3RFSk5ZWU1TbmFmci9aeVRxQXR2ZlZiMVZHRWJpUEhX?=
 =?utf-8?B?N21sdC9zajk3Kyt3V1I0MGw1N3BxNjlTWW1kZ3Y1ZXRTYkhGL2g1ck5UV1l6?=
 =?utf-8?B?NXU5a3YxZ3lNMzN2ZlNFRk9wK3B4ZUVqR3VzTWNHdnNValdlVEZrTW8vR2Ew?=
 =?utf-8?B?UU81TXJ3Rk9qRHhQQ0l0elVlVnc5MGJlZU5MdGhtVG8wTU16WVFzVGNNeWJm?=
 =?utf-8?B?d0lsQStqcEREQ2VFNlRFLzJxNFpsWFBpc0o5Mmxqc0JEa3hVN0NCTlZDK01W?=
 =?utf-8?B?N0dpc1p2THpZaEJkUlc1Z09DaEY2WlRudUpES2pTcUt4SXhHUGdCRFpMNlBJ?=
 =?utf-8?B?dCswaEhRK0hhMTVGWGxjSlNwdlRnSXVEQ2tBK3liSVhUNGNDb01Ya0JBOEVl?=
 =?utf-8?B?Tm15WjZjZnk2ckIwTUJxODlYWTllVlkzWTNTc3h0bTIwSkhrV0VkOE4rTGdC?=
 =?utf-8?B?Mnp4cGhjY1JtblFHM2JiaWJoa01jK1Z2ZjZ1aUJNUnNUNG03bEhNQlVrdnZE?=
 =?utf-8?B?cWlmTnRyTi9EdTJxaGdvMElkaENsWlk0YmdteHdZaDlqekxDem4xbytwZ0xq?=
 =?utf-8?B?djVmSEp5N3lON1pZMTBwZ2lQcjMva0VtbFhIaUFPSjdsQ3NzYzRNd3R5Rmxp?=
 =?utf-8?B?WnVjQVl1d3lyc2ZzUTl2ODlYMnllSFJMejd1MTZiaVVGVm5JcW5VdWg3QlFv?=
 =?utf-8?Q?SINF+eZVqg0D/WPMKGd5vSs=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6f4cd2-1650-4b50-151a-08dade785541
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:42:43.5679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gM9QeCIlz5/lD6XegONA+rxw/z/4XXNFwcnKasCddjHaeOs5L4UDqf+xCuMvia8uTNPFI8Po17VwM+Zhi1mmNHEE6vYL2KFHNDywFSIov8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5356
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.12.22 13:58, Jagan Teki wrote:
> LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
> the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
> active low (DE_LOW). This makes the valid data transfer on each
> horizontal line.
> 
> So, add additional bus flags DE_LOW setting via input_bus_flags
> for i.MX8M Mini/Nano platforms.
> 
> Suggested-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
