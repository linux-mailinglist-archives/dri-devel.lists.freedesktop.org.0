Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68264D7D2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7286D10E0BC;
	Thu, 15 Dec 2022 08:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2099.outbound.protection.outlook.com [40.107.6.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7799410E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmjgXeT7KhESaClXG3+2d+sHzBgCCrR1olkXpnkRR45EU9Hoi9sNlt1bY1lGmJUBNuZv6nlWW7IM93eC60/CUhNyofEZxzqNDJOMIWITxtjqNltJb0sNUERSsIJdL93OrgoRmIfBRUHLZZENSDpzb8oan1HRS0+7fzxP+rfGD7Ia1ZGdPeTYE2J2PVS+AQVGwwVTapjBEFqX3jiZ7sixf8dY77BkQgY6bumnbh91yRNHMMeBPX4vl631FXJJ8Gd/8YnYXgUegQ2LksOuo2jn9jffX2HW7JqFDOu8ZwD0IvX+3lWSC8F+8se54yBbEga8f10y/zVa5KqefLUBIxi1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFDhxrb2UjAvAajO4RyKVlHe8D6NEketIB8X2i8uqFs=;
 b=Nk7FgL5T0Yq5pRgbGa60NZRofI58R2c3dQagvTh2TrjC+BFYs+O3WLbZaioPnFZozIK4hi/xIFrSHS41jtdtX88up4PGl6ECE2Zk2eLMZ/ymYgLiY2DV6uNVgNB2y/v3rZO7CfrN/Jh7w6PhdjXb2Lf/wsMOR6nO9rbrW6pSS/gMG0mrkQzm3j+R/wL9bbtqGZLR6uwX7W5hK8mmJQM116k1IgltlC1tbWtOF6/UfKHBTtl/vgDRi6g3rlSlkJxywfcH3VZpGH9oVieRfsNM4zg9zB9POrzCGomoEnA4CTXOCoP2ju5hlLnWd57ItuWj8Bt5gsnd9p2P6mwj+SSmlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFDhxrb2UjAvAajO4RyKVlHe8D6NEketIB8X2i8uqFs=;
 b=ZmlD0u3A3oGx2Ji6qw4Kmr5FuxgKtsczKX8Q0WNaooO9Zye2NVlLov/ZmrPf2HYda98DIHjAJdLf7Wu63A+orEdHSbtKFaTggKeM0GslSap29/kl/Wcba/a49d6uE6NmafzjApxxMjjrT5cGCLwpIyMBui0Fnmq92DRkvyF0IoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS1PR10MB5723.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 08:33:14 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 08:33:14 +0000
Message-ID: <0715a9d1-fc2e-2342-f943-cae08ac9c622@kontron.de>
Date: Thu, 15 Dec 2022 09:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 05/18] drm: exynos: dsi: Mark PHY as optional
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
 <20221214125907.376148-6-jagan@amarulasolutions.com>
Content-Language: en-US
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-6-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS1PR10MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 188a0b6e-a370-4516-e26e-08dade7701a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dR6CgkSLPlnq+MLwHzrE2UKBhALWOk38o8U6j3/aKF8TQ45INOI7MP/oW6E/Xm+j+KkyMJMCICgIQQEOwt4cnADcmcMimbZp6//DAAXBn0u2udG1PqdKaS6lpsn9bZpfanw+7MUK3LZ9KSYaipgI564QEXhHFcAmeVuMAessJtW7n2Ar1DRvClKPPO/zhYW0kCCJXWYqAxgtBnb6NKJeCUaXVBAmTjakGLJCgDkl3tjEeuUx7OoE/HpBLuwZcElPqMKT8Isux08+alFIXxarnNtXD12E/TK8qCcJqsv3AR/d4d/WR7OCs5ha9kheJWckbj7Sb+3WvFh/HjKnXwkkhQAfxe+kYTOyodUxDAoBZsbuBO6UU6xtZC5n0a5tVh8Oc9NfvYvfvq38RYvSKMbZ37HLOQbY37oc6DR51APGhETGFy6yBAoT4eiEdSXywMwCJEZb3a9TZuq5tljT9p/7qBmPARfrfRgEyQR8tEDyrvFgbXiht3CanJuRpY+Jxfjxuf7qwQDLwpk6nwmGKj7ihaWwSh8bpyj7NTqa6gdc+6BYm3KF+4Dq551ye7hNKpP94kEXvEn3iMODdZ8Tm2eYx4HgB4+QkGNKL67jBPBDeaIOgxkvyz46QBtVKxaZjpAhhhz9NVPUXQh0zg7OiyyGKmBJYY7LaAuZb1KxJSU1AwiFrV+OB8clYoVe9ceE9Bwv0ZpSFFDBqoqjCEw4+rW0Z+w1gmhXP+QSw1obuNnsdv9qzN7WokjyPEkuNyt7oRg7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(31696002)(8936002)(36756003)(38100700002)(8676002)(316002)(41300700001)(110136005)(4326008)(66556008)(66946007)(2616005)(66476007)(54906003)(921005)(7416002)(5660300002)(4744005)(86362001)(83380400001)(44832011)(2906002)(186003)(478600001)(6512007)(6506007)(53546011)(31686004)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NitVN2RubDhkMW0vSHkxVFNoaysvdm40QUtsdlExZ2VLTEJla3haU0I0b01R?=
 =?utf-8?B?TkJIYU8xRWdmTnZRVFJNc0FpblVSVWhqVEZGVVRGVGNpMmp0bTNFd3NXdnNu?=
 =?utf-8?B?WUZDNzUzbTZhcTAvZVorOHVNNWhqSzBwNk05UHlGbklBZU1wQytqT1o4NDhU?=
 =?utf-8?B?S2hBYnorS3lwWmRycE5VNnlGUWtDRDVvdy9Ca3phanM1b1pHR0JhVHc5L0w0?=
 =?utf-8?B?NUd4Zy80OE80ZmpsSmIwNCtYZFBDcHlxSlZNcVcvbnNFSFpaenpzOXBiZFor?=
 =?utf-8?B?dXg4TExyYXJ2OUR5TWRVZUpLL1ZHQ1o5RVJ6RWlZdEJlMXgyQ3hEZWhNeUZD?=
 =?utf-8?B?SEdsTWZhRTdFM0srTEw4UU4xbkhOZzJOckkvZUwzMHgrTlJZK2VudU96NmVS?=
 =?utf-8?B?RzNlSVZjQmJxNGh6dndPT0gwVkJxWmhvMHlvMGdwMU5keDBoVXh4OXZNREVW?=
 =?utf-8?B?Unh4b3NLdkNVNk40akZJeFd5aE03R3p6WG1jU251VGM4Wm5LUGU5bzlWbGlF?=
 =?utf-8?B?TGM3bWZEa1hqMkNSTUxTZy9sNWwzdW5mQVIvTWdMc3ltcUFLNW84U0QxL3V5?=
 =?utf-8?B?Unh2S3JOYzJhT1FCRDhoSGRxdXhoMHdDVXhWZENiRWhwWUpoUzcvSXpFMW91?=
 =?utf-8?B?cDQ1UFIvQVhIVEZzTCsvV2xyeUg3NmF4RFJxdnI4dWNWUmVJQW1Zb1FUeGRY?=
 =?utf-8?B?ekdOcU1qOFpkaG11a1k1MDVEOXIzSFRZZnRSV28zM0xxa1p1OGtWVnhBcFpy?=
 =?utf-8?B?SFN1RDRjOE5yeDg1bXJjRUxENFV1Yk40UkRLV2RQL2RrVG4vMXMvT0JrRTd5?=
 =?utf-8?B?d3g5V2R6dWh2bGpQeVZoRzRhSDM1bFVoUllTRXV5dUlsMEFaNzRqS0grYTJy?=
 =?utf-8?B?aHBVUzdHL2h1NndOYjc5TnJ4OWlwV2ljM25iSHNacVdKeVNUanhEN1E1eW1a?=
 =?utf-8?B?allMcW4zZ1B3aUxQVklxMDVkTW1RQ3BkdndlU2NwOFlnVHpsTXFtVVNRZXRm?=
 =?utf-8?B?T0ZNdlhvaWF6Vm1KdGc0bVJTL0dVUFZmelQ3cmNadmdGS1l4aXY1QlEzUXdk?=
 =?utf-8?B?aDJaeWw5MkJHN28vbzFhSUlpY0llMVdWVi9nNmU2T3R5bDZzcTdvT3NKMHpw?=
 =?utf-8?B?cC94UENjNDNPVWZFb3Y5TkduTzRXMWt6c255dUplUXVNWDRCcE1sZEJXbGd0?=
 =?utf-8?B?eW9KWUUrYWx5dFViV3RycThVVmRkaHA3K1hyaU90aGJsSktoUzFIemdLRE4y?=
 =?utf-8?B?eWRnVnlYOHdIbzMzbytKdmNIb2VFOWp0TU56OTJGYThFaXIrdUJKdTk1cjZX?=
 =?utf-8?B?SnN4YitncGxYa1JVZ3cwQ1RQaSt5YTEveUxyZXVmZ3FGL0FrRlhUa0Y5eDB6?=
 =?utf-8?B?WFpvbDViZWVUbVRFRVNjVFdHcDcwbHNLV3YvekNMUVkvNEd3ZG02aS9hT2Zl?=
 =?utf-8?B?MERqT3Z0SjdxRWtFSHY4V2xEYVNHWFgxQUdZN29QQVpvQjJaRDN1ZUlSeVc2?=
 =?utf-8?B?RmhoYlVnSWxWdENIdnBRVDlGYXp3cWNjQUNOeUcyd0pBaENHZ0o3d2w2bS9G?=
 =?utf-8?B?elhodCtTT0xBd2FacnJueXMzSlVMT1FwRFMybnBSZUk5MTliZzI3SE01Ny9x?=
 =?utf-8?B?ZnAweE5OYlZSTzFXVStxVkMvUUdQVEh0Kzl1YnRCQ0NQVFFUSDR5cmhpMEI0?=
 =?utf-8?B?SVBiRWFwR0pPdDJjVDQvWktmY1hoTGRYNytVSnhCWTNBeWtJVnh1enVtMkpq?=
 =?utf-8?B?cXpSVTNwU1BCTExvdGdXdGpINis2Y1JGaU9IMm5Xa3ZaWlZBYXhSWnpRTVFa?=
 =?utf-8?B?Ty9uNUZETjBpSE1IRkdvUFk1ajNZRzZkNlVKeXB2U0tGd0k4MytCWnUrdy9L?=
 =?utf-8?B?YStjdHNwT1BpZm1QZVVvUDA5UjNYbm4ybnVWVkdpcTJ5UjU3VVVHdFFRYlZs?=
 =?utf-8?B?OVZzNGx2YkpBR2pyc1F3T01GcjlkSXdCV2kyUmpmQXJEdHpFT3VmVXZoREp1?=
 =?utf-8?B?Z0JMbW10ZGJDY294YkVVYlJZRFkycnl4OUQ4YnlBQ1hadzZ4SmRxSHNzZGNU?=
 =?utf-8?B?STJCN3l6NDUwY0FlN05HQmhSdkthd1BKeUZsNEdsL0VRdE5EZis3WXpIM0hM?=
 =?utf-8?B?dGJxSTdXcFVpUjE0amE2cUJLUXh0bm81U0N4RytLbiswcVVGaUFaL3VoWTFt?=
 =?utf-8?Q?mFBC3UKWovtex2xU0iidNZg=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 188a0b6e-a370-4516-e26e-08dade7701a9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:33:13.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQgt8StxYQq2PPft1UCpgOAbJMYZCss1eHAErF8yJnqLeDLfasnWZQaIdh5Q9zFwp+kwE2lnRo3OVeXoTjRPfuK+X1Wpph3cALex+FB0Tho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5723
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
> The same Samsung MIPI DSIM master can also be used in NXP's
> i.MX8M Mini/Nano/Plus SoC.
> 
> In i.MX8M Mini/Nano/Plus SoC the DSI Phy requires a MIPI DPHY
> bit to reset in order to activate the PHY and that can be done
> via upstream i.MX8M blk-ctrl driver.
> 
> So, mark the phy get as optional.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
