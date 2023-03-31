Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF636D2044
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 14:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DB910E073;
	Fri, 31 Mar 2023 12:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF3710E073
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 12:28:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+ojmDpyl1jQNJdF3JSHzzJXO3YkpDndCwj4sTcj8XUXpVoDj5XZhqAuwBCZ4zomuzVgxmvPmgptM6j+4mQLaZUNzJqZGSPxWRTrpadCbr/rgchJj90shVlekugBP5XaEz9/6gw6wAih5B2jyGPjNc/EqIa18yGtl0Y8xObaQmyHb/Yooxeostb5qSYziDkjs8dNdVymjshGXLLrE7DLdhWLz02yYfUo/WVN6WU4qUn2I1Q3ZBakAmcczQA4vBAFB1HpOM2l2YPr/56aoqz1ChFPT1CfPSWp8WBpCXBhbvvZh2dFol6SZjdnOKdTC5g+EXNm4iD48G58TN7h1H3Tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBdfNw9JePE/MlyJmPN1s7AREZnzKi7yeZyymiwBXpo=;
 b=nO3ViVnG1MSwID3lI/W6L+SMRVld7ycawmH4QpXg5W5hfB6vQZntI+LnrYsFH8uEy7Xn99yoaBmwXju8NoP1sP7BQmUoKup3K7iVXjkDP+60ZqmpXryQtr5dWKW8EdkRYWkhlDKWQDRctQ+LkykE3Wb+QcYzH57lphpfpwXZ7ixDbsAizR+HwLbf2s0REIfFxX0D6QBcY/FvUOsTbKstndOBRa7oIkYN+1UUDLo47pFZbhpnZ9ZE2EoyIvsryGWkfZ74EQBnJu6RNqhla5LXxDnNwqYTuPldStTwz73dxQZeODq4rXu5qH8bR9HDHI1Ie6DpWa6Kmr8TKWy4DZ5Gmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBdfNw9JePE/MlyJmPN1s7AREZnzKi7yeZyymiwBXpo=;
 b=WD843wUXCxymJvfIiy6H2uaCwAF4L8lZtg9b5p4FBs01EzLTpahQEKzN2n7m/c6PhFdBJXc+8N2B1CZDS+3Qo3CIwyaKTol+366+cjazJfvNL2qYCN4276EX7lzygWyBl1Gc3ivCu1XCR3NZJxzLyaZn6nyi0pCgMVFIETG/PFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8903.eurprd08.prod.outlook.com (2603:10a6:20b:5f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 12:28:20 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 12:28:20 +0000
Message-ID: <a8f0aaa1-e412-18c1-452f-753e0a6b6d51@wolfvision.net>
Date: Fri, 31 Mar 2023 14:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCHv1 3/7] drm/panel: sitronix-st7789v: add SPI ID table
Content-Language: en-US
To: Sebastian Reichel <sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
 <20230317232355.1554980-4-sre@kernel.org>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230317232355.1554980-4-sre@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0041.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::10) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: 333b3f07-8d4c-4354-2fc7-08db31e3697a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UOL76oHztQlgqUReUnA77ezp7Jm0wyeLFF/lf82/Zk2inAQq4b5eoio01a8QPTnSv9FflXl5UBTJW5RJYY0lybAqY79CgAsHTEOYGccUjVB6qQgkwhZB7u1l3WmnNCTgvEwcnEg8MCnZ0XGQ0pT4qEivpFEoZdQF3VNLeXHJj9zvF4lrYaPA33nCo+BcJ7JfOPoRgjjQk66+4VQckgE7p/VooPJzQ1A6OcWG8XJ3hFoL++T+i6ladKaLgesXIkk1nWhguRWGH9ZI74+AdcRzOA6nmdfvBVsRvHpae4qw739CHjLqo1HFlXXG/PDfZk5x2Td2a3KP3Y/UKolBXg8ok6K/1PBTKhOIotD3YRx5mgaE9ziK3BTeCSJ4Bjl+YokqrOyLZ0tda6LPDtRMl5KZ1UslopEGPOqj07uAYJSQF7pgOiV51VA1TTW4A/Ee9I6XE6WZduDna1SlQJ3Qd4jlXnj6gYcvSq3xmnJM+F+T4a5hka38w0j5+45zPBavTytce62ardcpfudS772VKP81V+n0xpGaQI6EG3XJDnTB6nbHFSRnAz6s5W8D+qlNi+1N5wlM1Sy3PHDfZHsdjtAYGP4icCGM1GNuTkvxiD0FSeXHoju/xNWZVKeKM5CHiLlWl4LG/1GproMKGh3HgodKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39850400004)(136003)(366004)(396003)(376002)(451199021)(2906002)(2616005)(31686004)(44832011)(478600001)(41300700001)(54906003)(6666004)(7416002)(66476007)(66556008)(5660300002)(8676002)(36756003)(6486002)(186003)(31696002)(8936002)(316002)(66946007)(6916009)(4326008)(6506007)(6512007)(53546011)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkcxY2IxQUE5MkVLQXpjVHQyYnNNUWNlaExGUkhnSGdtVmlyNlExdTVncU5O?=
 =?utf-8?B?RUUvM09wR0RPNjBJWC9TQ3BzRlE3WnQ2WmUyM3RGcHVjNzJFT0krYU1YUjln?=
 =?utf-8?B?S1UwcTFlZVNQVEZwZjlLM1E4aUtwWUV3YWhKY0VpbUJxd2s2ejM1UHJGNTNP?=
 =?utf-8?B?WVVMZDdYNGgrSzFXL3pzYmFVaHdxaUhtUFdQMEJaNm9RT08rK2xha3g4VEVr?=
 =?utf-8?B?ejFmNFNLeWhIamtURjc2RC9JQkJPZGlnVFRTZFFIMzZESkpSUENuL28yOS9j?=
 =?utf-8?B?ZGFZSkV4UVR2YTFQd3BoSWJ6cEEwMGk5cy9BV2R3ZVF2UHlzVWtQVkEzSURQ?=
 =?utf-8?B?Um54aXVSZTd3SFBWaWRhTTc3d3NzS1RwcEJ6cnRBdHFuYnBYYXdYK0pDZVBw?=
 =?utf-8?B?Y3pVeHVGOXhzRmJOQ1kwd3BmbkFaNUlid3lST0pnRCs4UkN5VVdUSnBqM1BF?=
 =?utf-8?B?SWJxd1ZwQnZ1a21NNjJ4UGtXZEZtSmYxUHdQRFVMRThuUGw0bVRUaWVFc0Rs?=
 =?utf-8?B?N3lHS0RrRVV1Z2RJcnJXV3d6cEs1V1QyVkVobjF6UldRMEtXRGJ2UGVwVXpu?=
 =?utf-8?B?dGVZaFhlNVVIanNLNXFBZHIwZEgwdUhaWURWcWg5WG9VdjFxc0VJZjhTSnZV?=
 =?utf-8?B?bmZPNVI1Q2t3c3Y5SkpSckN1ZnhTWUltTURzd1dSbTJrZ0ZET2src1pVb1Mz?=
 =?utf-8?B?bHdLaksvR3ZNQ0phOUd4a0VWczdhb1dHVFNENDJvcXEwdlBLUVg0cWtNOVJU?=
 =?utf-8?B?eHZwQ21RS0JiclRUdnZuRzB0N2JFMmRtVXVrVG1MaU9LbkRnNWtRaGl0NlF3?=
 =?utf-8?B?YWJUUHlVcG9jZXpuamdkYllRemZwYUlsckQ3c0FUdnVoS1daZXVPNVZGTzlo?=
 =?utf-8?B?NERCT3VDQjJPVnRWdWV3NUlLamZ1WEtKSXN6enFWUmNuc0VuLzFKd2Ricloy?=
 =?utf-8?B?aEVoRGVxbVVnc3VWdE1ZaHFpdVhpTGo3N2xPOWZLVm9KNURVdmNvMXA4ZDYy?=
 =?utf-8?B?R0F0bDRuTXcxRFNnNnlXaDY1NFlVMHBtTHI5MG1YaUJwbDQrVW1mVkpDT2dp?=
 =?utf-8?B?MlM5anJoazlFSjd1YjBXYVpIcXJSSDM4Tm9EZUE2c0o5bGhYMWMvdFdnMG1s?=
 =?utf-8?B?RUZLQ3hjbDRYZXJLUDA3bUJ2TzRycXc2emxiU0Y4WTc3RmpTQ0RqSzU3RHdw?=
 =?utf-8?B?N2drTFZOZWR5Rm5zUnh5T080K21QZzRoMEE5Tjd4Z3JMU0MzRTBJT2U3NGxu?=
 =?utf-8?B?OWxrUGx0bndQMHMxRUE2elVtT2FlbGs2SWFFYldmSVFXRzd4bWRNUks2MDh0?=
 =?utf-8?B?WE1hVSttRlliYmlhRXlkd2NPbVRQUnFJNzNndk90dGVMNUtQQ2ovMUZGQjdr?=
 =?utf-8?B?Tm1FNVdlKzB4L3k1NmcxbmNyOGRVdlZzQXVjOElKYUt6TUJ0MUhTUzg4eE1Q?=
 =?utf-8?B?M1JEOGtsUk5qWkJYYW9od3pXZ0pBVWpBa2xseTQzVWFBR3FrMythR3lHVnpw?=
 =?utf-8?B?aFV3R3BVYUkvK0dhc24xalRkMmYrdmtCVFdpYmE4S1lpalpBaCtrMFJlNG05?=
 =?utf-8?B?cWtqMFNoaHBhR1JRUEJDZmtDWVBQUmNWYzI3Ny9xZmMvZUdXYTc1SmRlaXZK?=
 =?utf-8?B?SnRlVFM1aTZrTEJrZjY2dFZ2VlM3RmpQSm1TSHFFelgrY0dDVytKT09mazc1?=
 =?utf-8?B?Q2ZYUzROL3BrdHkzZkp1cm5VNjFGbmErSUlSb3NHY1dvcStndmVIcnZLZklK?=
 =?utf-8?B?Mk1UYUhSTnlJM0xhMDM0NXdsQ1Jzc0VFaTRzK01uMVpTdzhENUxiVjYyL0NR?=
 =?utf-8?B?N1lOSUhvM2xyTnhDQmZmWE0vd0Erd1FVdVJIU1E3T2xrMWVKK1JzMmtLS3hx?=
 =?utf-8?B?RTk2NDl1TmlnMGVTR3cyOUEyaTQrRmtuR0o1U3BJeVB3UG1ncENiMXU5cWhv?=
 =?utf-8?B?c0xwL09Faml6OHk1RGRFRm0vVnFIWnZsOUJVbDZOVHRmdGx0M2c4K1R1YzBR?=
 =?utf-8?B?OFZaLzI3SnZzOGpGeXVkU0FVakduWEQ2ditEYnd3amQxVzhiTkdlUE5TMHdh?=
 =?utf-8?B?SitBRnRnd01PRGZjZElkYzNoTlpjOWdjdC90Wm0xQTk0MWJJN1gyNFM4cTZr?=
 =?utf-8?B?a2N5Z3pwL2JhWURINGczZjBpZVllaVllZlZva2psQ2J2VHdzdG9nZWxUSXZ1?=
 =?utf-8?B?R1NhdkFJclJtdVR1N1MyOVU3WW5tVjhTaFFKZzd6dE4xL282Vjh2Nk5FaG1t?=
 =?utf-8?B?V0ZiQU9Sclk2bFRrTXd1cEthQlZ3PT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 333b3f07-8d4c-4354-2fc7-08db31e3697a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 12:28:20.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSwc73q9mRiHmS+VUrvlrVrs0Kz5ea5xo22FmbyCtjNuc7Py+25EDj62JT6TxVenMwmZD7zarEVjqD3YXAtL+zWpOs0MaRG9lMIZNoJjHj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8903
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On 3/18/23 00:23, Sebastian Reichel wrote:
> SPI device drivers should also have a SPI ID table.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index bbc4569cbcdc..e4d8dea1db36 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -394,6 +394,12 @@ static void st7789v_remove(struct spi_device *spi)
>  	drm_panel_remove(&ctx->panel);
>  }
>  
> +static const struct spi_device_id st7789v_spi_id[] = {
> +	{ "st7789v" },

Minor suggestion: The format

static const struct spi_device_id st7789v_spi_id[] = {
	{
		.name = "st7789v",
	},
	{ }
};

is more verbose, but can be extended easily.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
> +
>  static const struct of_device_id st7789v_of_match[] = {
>  	{ .compatible = "sitronix,st7789v" },
>  	{ }

The same holds for this structure here (you may want to consider this
when adding the .data field in patch 6/7.

Best regards,
Michael

> @@ -403,6 +409,7 @@ MODULE_DEVICE_TABLE(of, st7789v_of_match);
>  static struct spi_driver st7789v_driver = {
>  	.probe = st7789v_probe,
>  	.remove = st7789v_remove,
> +	.id_table = st7789v_spi_id,
>  	.driver = {
>  		.name = "st7789v",
>  		.of_match_table = st7789v_of_match,
