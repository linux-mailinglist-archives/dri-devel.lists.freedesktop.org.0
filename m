Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1096F5ADA
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2D910E2F9;
	Wed,  3 May 2023 15:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F90010E2F9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbC75W+8AqJ04yzeVic+ajqH1YT+ylVQ43VtFOG+fj8VyCdKZUW/tMJb7mQB/pQqH8zIBelH2GYoM8l8xupvGAlKsJFzG7n49TITTdTXw8T2//+5tUjZJfTdAlihtthSiJkw3xil13W6+DcioN7WNVcy6eT64FLN6kT26t2lhl1ZxyOt0QZDiOH2uy2r3Sy2FtzCr05JS4q6TveuFDsGd1cgTgeJo1ITf03rg11ioERQLU7UA8tOjqqtOlK2P2HwM4ohksgpFSR5K8osuEOZXo2sF1jMZjY9FBHeqTeqnONX6u7wAh+JStD7UkPtD7neJFVYQzFUSXBwfg4bEqdJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udv82X1pSMwjpSXe5qE87cYdon18jmhyKM6UFirb8eU=;
 b=Hea+VX8nvG54PBP7/A1h1jxnTY61+/t2Ygyy1Vu5dIsbA4BVZxlJa9O7w7vtvZKN3h4Y9pCwLkwWP1X/vUG8gVHcrgLoyGwWwIpyY05n6e5OK1+lUVOdakzdDXbUVcKpBeR72/RjjcJVUkb5ddL7aBZqV+bEGqUl1WAvG9giAlv+2Z3B5QWG76U4HhAw8kaxvVysn7eTg02cdO9szEWLhFbX8+jLcLfK727YswRygO1lgBWce9LM/oCQEQayQnEflmz3hVz9GXDVZA/WNDFPA7xXHo/BsCNzJwDGFnZ/YU2eDaiO6Szl62AImUPLWFJ3XaEZUjPL6guD5iavssoeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udv82X1pSMwjpSXe5qE87cYdon18jmhyKM6UFirb8eU=;
 b=J7lPD2DcMGYdA2T+/AuD7NDn+kr57ompncffg6JlNH2b49zt6I/EcXAuOCIj7glHQccYy4ntmlJJHKL9ToWs/OW/1y6ovXoyl31xiIoL4iVHw2N93lqkFmX+j1S/vAEOqZIIVmq/Gl0+PfluM6N6VtS6PZ0ADB85lpssc1egXqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3487.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:20:11 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a%2]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:20:11 +0000
Message-ID: <74381387-357c-8091-9ad3-8739a432360a@kontron.de>
Date: Wed, 3 May 2023 17:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 3/7] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-4-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230502010759.17282-4-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3487:EE_
X-MS-Office365-Filtering-Correlation-Id: 97986687-07ad-4002-1007-08db4be9e35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/jbqGzD6p+Wm+DW0Q4flcpvmBlNGXYZqvjS7A2ygAd/nLjxt3f51hYZorYkrXd82w51TvUZiQHqcPlUbWLgxE9kICZBQo+YwTqWyatV/Hiukw2Numybb0eT8BO1SxFubQ/obGrtf5jkBcUkrbBXrQvrxORtkIZ21FMsrDGeW3YaJFIP2L9ay4sWE4WC5ZfDcDPbsSkT6zQWObQOwejmFt0LFA2IGYH8dpifiujD/4gh0CO2u3t5gtXVgoK7mWxTZkbUSSPdNyCCLFG7gSJktLkwD+6cFyecMX15bFJPhKFHTKs+Ozeia/lrmAslwQfvHoRj81Yt1ugWnSvgU0QbYc2nhP3OmPIYzFWAoMy5t4NzRr/nkyTXtpb/FOvXMoROOK0Bs0sUNKIoZSBTeiulSxCxiXpeNuSUavlWHpPLP38eGSfyCkpsvFrgHIcPsGd5ZMzJDSJHZA+Jmelo7viENpDlzrQYw/4qppIfUqG4+3TkxCvX5M5nKRAj6s0Rn75uN9rBiGfN+0b6ZoEbLwTaaw8KyadAK54sDxuLRr5tHTWDvFiWxJnuHzul6tc73cuR1+vAIXE0DhLELpLo7RTbMSslNKr2/v8xb3DML/t4P8045T9rXaOcPrZFoxyZApHHJPFo7pNqQoFXUzPnDbKuOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(38100700002)(4744005)(86362001)(316002)(2906002)(36756003)(7416002)(44832011)(31686004)(8936002)(83380400001)(8676002)(41300700001)(31696002)(5660300002)(2616005)(4326008)(6512007)(26005)(6506007)(66946007)(186003)(66476007)(53546011)(478600001)(6486002)(66556008)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFpwU0p2b2N4SHJoOGQ1UU1lYXNjd3QrNkV1SndyRDR1Q0Y0V3hEcENjMHhs?=
 =?utf-8?B?b3JJQVZrNklRamZGMm1CWDNOa0ZnbUFtVy8xK1F4L1ltd1E0N3VsYi96ajM2?=
 =?utf-8?B?ZkEvNXYrM3FoZVVQR2dvMk1xWWlvRE9NNDZSMzZxTDBjZnpEM1dUTkcvRitz?=
 =?utf-8?B?U2w1dmVzSWYzK1ZKTHNDdWo0b2h4YXJUcXRsMmtvREMxeU8wS2hRSHR5Mm1i?=
 =?utf-8?B?dmpZSDlmVkxrZHdYSFdodktKdlMxaGhuN0JiMC85RkZYZkJaYTVpcU80NnBt?=
 =?utf-8?B?dytTQ09BSE9OVmtYbElKYTUxdFRISFRMdW5Fb25MRzFwTDVORFFYK0dTMTdk?=
 =?utf-8?B?ZXZQclRCQjRQdWJWT0xHeFpPL3lJcWp5VjVxMFBxZ2Jma1VzSUhpOTZRNkhR?=
 =?utf-8?B?alUvWk84Y3l2K2ZQa3Nubi8xUHI1SXM3dUZDN0hzODBubTc0eFo5Qmtkcmlq?=
 =?utf-8?B?bXZnTDFkeGM1a0FISkZSVHY2eEdhS2JOeVVhTjh6YzVTSGJwL0J1VkY5cVBk?=
 =?utf-8?B?TXpzd3c3YjhBTjB3RUZqN3BzK3d0VVFubC92K3RhSnhrZmRNUmxUb1hLTHdm?=
 =?utf-8?B?QVJwcmhoSFVzUnNQdTltU1l6a0dLQTVrRXFMb3U3d24wRFpBRUVPOVRBRENE?=
 =?utf-8?B?TmwrSlJJMmpVYzJKZ3ZwYTlWMlB0UzJXR2VYQ0l1eW5Namp3ZVExR3h2N0dk?=
 =?utf-8?B?N2ZNT1R3VmIzSHhsOS96cEJ1YWJPTkJaa3JjMTZsOHdMTHZ4OHZaREZiOUVF?=
 =?utf-8?B?eFVaYUJEQ3lBbWFDVzZQNHJKTWlqbHRidUN1NE13R1N4S2RkYytER0dTam9V?=
 =?utf-8?B?MFNsbmI1TEFQUnVEbktTU3RISnNQUVhFK0Qvbm9KNHdWNjVxYmpWbi9kZ0gz?=
 =?utf-8?B?T3V4WGZsR3ZXZVY0ZWh0aUYyTjZnYTRNSDlESVVDQ3VzL2hrZFZESS9lMWNo?=
 =?utf-8?B?L2ppc0YyZEQ2QkROSGJhejkySVdpM0xiL3hNS3g1T1c1QlNtMnFKNTk4ZW81?=
 =?utf-8?B?aEIxa2Z0NE5qWXQ2UzZRNklBRU8zZklxSFlEODloa1g3TXN4cWtRMkY3VWxX?=
 =?utf-8?B?VWZ6OURmbW5xbDY4RWIrVGVhSG5lTDNVK1JnZ1B3UzlMcXFHQU9vNlRndUps?=
 =?utf-8?B?dGJ6aHFRcERjZmFXT3M5YmIydWV1K1IxdXMybmJMekdVeUFnOW9Id1pSV2pF?=
 =?utf-8?B?MFFwQjkyRkpNUkZ5eWNwamNDWGRQd1hlajZieElUNEtiSHhwTE1yMzZ0TjNQ?=
 =?utf-8?B?VlR6ZU1ISHd0VnVpcmF4ZjBYMllJZzE1RXFSdjFWbDU3bEdMRG5NZk5zOE1R?=
 =?utf-8?B?Vm5BQ3d2MVpjMStaQnVadm4xSFFreEVVV2xRamNYcSt2Zko4clNEdHV3bW1Q?=
 =?utf-8?B?VlkvWGUvUnRpWVJzaFJDMk1IbHVuU3JMOWczYnpLQ01BZ00wOHFOdk1PUnlK?=
 =?utf-8?B?MVRoL1Mxb2NFaklwVzNRaTA0TXBrTitKNjYwRG9rSWhSNnQwZWFUVnRodzBw?=
 =?utf-8?B?bU9iOG5NK0h2ZGhTakhYUHliWDZFUUhia2NvakYwdHlVNHpxTFJqMmNNRzN1?=
 =?utf-8?B?MzFpaEtEVElWNFJTWjQ2Q3Q2TzRHVXFoRG1YclVyOGtmWWJ4c0lsazhCbzg4?=
 =?utf-8?B?TUg0SkJoOTRnWGZFN2VoZG5XbFk2OE0veWhLOHN0TUJnVXh6b2U0cGthWlBt?=
 =?utf-8?B?cU9xSHJkdHV5Qkk5OFlFbFkyVEJxL2cwMDJmTVIxZFpvYW9ITGtxaTBQeGI0?=
 =?utf-8?B?cFB6V3B3VVM4WHpnYXdDRUNsMXdmeit2OGJ1WDFzbk1iSHZnMG1xRlJlS2Ry?=
 =?utf-8?B?YXlOUjFIOSsrRWdZSlpsQ3RIaXltMzN1QWJPaXBDbFdFUk1YaEFwcUtKRWtJ?=
 =?utf-8?B?NkNBUjBpTTFDM21hUytwR3VYYVRXNmhvNUFNR2FzUUl3WlEvclpvdkRSaHYy?=
 =?utf-8?B?em9oeHhjYTNBdXlzWVdTekRBL1o4M3BQcUZLb05LbTZYTzhUaE1HUXU4c0h2?=
 =?utf-8?B?ejBDR00xQnM5RHdDd0dIdEJOOEFhTldKakZIeCtJV29lUGZJMnR4UkRBdHNL?=
 =?utf-8?B?QTU2T293RzhiUWhaYU9jQTVsU2p1NlVOL2JaQkllRTZhTVUrR21jNUdDeXhU?=
 =?utf-8?B?WVV0cCs4K0c3eDEycWV0S3dtLytoYVFpNkFkNm1VSUUrZnY4aEg0czlkZEhT?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 97986687-07ad-4002-1007-08db4be9e35b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:20:11.8129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwbneQJ2LB3wxgCURLISrWDDZaHj6mTK7QGMlYN2PG8DKBzKV356oD9bzKHpFc/jFErqhOtGhWRXMHJ+Zfe+X3SckbYKAj+h9sI9rU3emzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3487
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.23 03:07, Adam Ford wrote:
> Make the pll-clock-frequency optional.  If it's present, use it
> to maintain backwards compatibility with existing hardware.  If it
> is absent, read clock rate of "sclk_mipi" to determine the rate.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on Kontron BL i.MX8MM with SN65DSI84 and ADV7535 bridges.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

