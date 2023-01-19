Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E07FE6737CB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 13:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228A310E061;
	Thu, 19 Jan 2023 12:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061.outbound.protection.outlook.com [40.107.105.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7693310E061
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 12:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwpDp7xdTvPkaM6C219LlOC+C8qJOS4wp8ksd676uaH9HDDapJb9YV3DucP/FGJWxA/csDABQa+OzynKPXjdoomqH/uLuomeKAZ2Ez7ct3MW6q5WNJh0jxueODHHdwYLF00J+JOwKrLx3P0LK0EDy4e1vxLmn0GW7OY8la4pzku753MJJzI98zu30tSfpHd7bx8f5jCIfX7PHuiLUzt4QPSftCcZZ5cRMAzOIbJGnp/8Y7XH47N1yDKWeRwcrMXCL0KIdfZe0XDgsdlzHMNvuMH/FGs42DEqDbKvCcX98hNeQiJHzrJJ4e1cuu78jyFZhGVEcfPDeXWAOCuk+qtplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvNUL9UFzz08jjrV07Zem5Ycc2HL29SeA7JbteU39Ow=;
 b=jTif/CVE4nbA3BRfildukxqrVf+9led0QhGLa9KhDW9JP4V3vHsq1ZTLu8l7tL8FNkVB7lxphqHpierjGXvAp24f+x/fcD1O9neXqbtS9yO1GvXBZwB/wPAjgUwAFhldu+sPLu0usSggGRcQlW0w4j8olPiJp50kfRzNLP/O2JDZT1XevR1ILKtt1nPbyASfC9qJzYrR0aJ9FS62XUb4K64PrXTaCTWmKy7y3klWH+X5u5/Byf6Uq5psnFRjEoYy7pMdJp7zI/EOTg9SbRLVwn7Lwd2KNisLULjz3vLi2NcGCHw4we5jiSjfsidPEa2gSYjcy8vqXubtitKjBFc+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvNUL9UFzz08jjrV07Zem5Ycc2HL29SeA7JbteU39Ow=;
 b=BrR6rQYfAyhwjEebt2cEOxlIqY3myG/7qYe9F01xcB10ayie8V9mMtBtwkh6iVORC3ymvDhU+FVVaXXdBnnDvBniD6WbTfWnm+NkxVcPkt49NOI/7Anxn2tuj0z5m3JszhFBq6zeL9tp3tltvavhEJF0RQvqPC3zDysctTI9o/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAXPR08MB7468.eurprd08.prod.outlook.com (2603:10a6:102:2b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 12:01:52 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 12:01:51 +0000
Message-ID: <b9172e14-0370-7ba5-2589-b3429b6c1e5d@wolfvision.net>
Date: Thu, 19 Jan 2023 13:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: add pinctrls for 16-bit/18-bit
 rgb interface to rk356x
Content-Language: en-US
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
 <20221130140217.3196414-6-michael.riesch@wolfvision.net>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20221130140217.3196414-6-michael.riesch@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::12) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAXPR08MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b5896f-dc8d-408b-0285-08dafa14f37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tgo70ndkU5S4lS+kRIYzSgvX+nDglunXm3GENRKMzZ0dbdEsOkLLLH0T+TYGOTUX/jaonEfTNaqwgyay2Y0S1G/aOGQ+LYQptYz7GYsypSXB/SKL/1AFWUp2VKy34+3NovZG97ifZH04zL9ksI3vm2kaO1nj/OSNijt6bXxW8n8Upv9ZPrQgJrU8gDLChG2EKiMY5OtpEJdEmMa3fQndR5YGVfYC8O+upVlwu0tq8CTt6uEVki/BYNxARo1w4wSBCl1jrICFA4tjDKAajiPL0+lKECkkFhQ0UM+A5dAnXpAPSLJhX8bWUaDm+NEYxEvFqTrK556YrFOItJTnM5jSsOrEejAwLftlVkC8FUECBMiihazlOKcayn21ndCkrnxXKpJ23YrTzx/e6uTxviaIpTK/K8WM3vzpp5pkVY6HnAHV0IX95gW6WlHNYYwPmkCFOmnf15r2jcj31vNuPFH1fp/vbXXwPBEpzo0eCQSJ8j9T/v/LvppU5d29T0hDcOQDot8pnAmDJMr/lKfR15eo4yRvWj/GAGf4hU+w0xbl+A6Zi8QV2ObPGcYPlJQ/Sy8bCP62X6BznHmXJlu0h+Lcy18U/2IAPXd91+Re1pMExovC0R6OacG5dFAqENJBKidbKaZu4HSu3nhTjq8hWTsb1LEvDetiI6hR96YVpDfhGfhJOQKwdhuZg/J5MxKjV/8sF8daaFV8WyqynVaHkMItzsJLpI8UgJk/awGDeqELYazzrANxEygiHnwfgcehdjEr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(451199015)(6506007)(38100700002)(36756003)(31696002)(86362001)(54906003)(2616005)(31686004)(316002)(478600001)(6486002)(966005)(186003)(6512007)(6666004)(52116002)(53546011)(2906002)(44832011)(83380400001)(8936002)(41300700001)(5660300002)(66946007)(66556008)(8676002)(66476007)(7416002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjJMcVBWMURWMFVzYjBybWZSU2o2Zm1vc1YzbmRCaitIOG5FdVlqNUJHY1FC?=
 =?utf-8?B?azMwUklySy9BUUVXQUcwc3pLVDYzMjNIV2lFdkhzM2JEWUQydHpORzBSdUUw?=
 =?utf-8?B?K3pYRElrYWgzVXRLOVB5UWtvTHZBTjZzVWdwUjZBU2laZmhYd3pqVFdlSzl1?=
 =?utf-8?B?Tzg0L3A5REpROCttNTFSWTVkdVVzZHdlYVBoS2lvRzQyTmo4SHlpbVdhSzlU?=
 =?utf-8?B?aHc2d2lDeEp0VENIa3NvM3Z5YzhJdDNDQ1d1eXhwblBsZzFaazN3SGxpT1FI?=
 =?utf-8?B?UlcyQUptaFZmTGpYUTBQUGltNG1DTDVYdlZkbEhEeXNCTG9HZGhoZlZER1pp?=
 =?utf-8?B?SDlMZmVnR0ZkOWVPa1o5T3JHaTB1bW1DbklhL1BXSmxBSTlkQTlWUjA0clJG?=
 =?utf-8?B?ZmpzbkM1NG5lR2V3c2tmT1RXOWxJK3VRcU5EMTArOFZVZlFvNWF0NkhmWW5p?=
 =?utf-8?B?NUhYL20xeFZEdVdoSVpIYmduZjdXVi9HaDQxT0VHbmo0TjJkZk1LcjB4OXNT?=
 =?utf-8?B?VWgvYjFYTFZQUnI3SUVGVEsxRlo0NmdRSlNHcXJscFZKZlowTlF4aEFDY1RO?=
 =?utf-8?B?T05INEdqcWcrSjhudEthQmJ2Wk5YRXc3Q0wvdkxETXgrd044eXIrZjVObGdT?=
 =?utf-8?B?ci96aW05U1dKeThBYzg2ZHRCVDJ4SHk1emF1SW85MWNtZHowQlVaMDcwakIz?=
 =?utf-8?B?bGtPUk1UZHZiQlllMVd2c2tiWnB0MjM1ODJaMGpoYlh4aTVEKzZjSk9lYytD?=
 =?utf-8?B?ODRobFlpeEQ4MXVrZkVYM1BMWmtvaitIanEyNVFTMkdYaWRwZ052djNlMzQx?=
 =?utf-8?B?QWZXa21YS2Y4TXFFRTZnNFFQTXpMZXUxRzBxSWdBMHRNdnVSS2xTQWVOVUJt?=
 =?utf-8?B?UEFKNmdVOXNtTU9oWnVMWGlIRnIrODl2RVdYVk4wMzRid1hnZDVYWnNQUU40?=
 =?utf-8?B?bTZ0QWRKZWJseHdtbkZRWmJEOUU3dGUrbHphVzZJRzVLZFpneDkwWDhXK0Fv?=
 =?utf-8?B?SjFDc01IMFhjM2pZWWtHY0N4N1pzZzdZMmdhR0FKVmkwMEI0dDZHZ29XWGVS?=
 =?utf-8?B?dXRvUDZBM0k4QXdzTjF0WGNZaVJFWCtPWTlUYTFHSzVERDVFbGNheWRpM2NT?=
 =?utf-8?B?UE9RNmZScHJLZVlMMWZmM3ZaeHdqR2wvMFFsY0pPM0xBVTBzMTkwNkIzVGYz?=
 =?utf-8?B?WlpOWEIwZU5rektvRGRWTXlrNkVjVTlrdkdFVGdTNHdqMDQxRnFkMWNCeTl2?=
 =?utf-8?B?bW5kaGxMZkFDcVZxdXYwcldJbUZ6UW5URTlacElLREtFbnlRQkxNdTZOMWk2?=
 =?utf-8?B?ZFlTV2pueGxqNWdZVFpWQ2xwdmJZQVNHSzhYZFBqMnExMG51RzVyZjZZVDJn?=
 =?utf-8?B?dGJqbFhxNitWQU1ZU0RKMjY2MEppcldYTGxTN1JHd2ZtSEh6WWF1ckM5QnJh?=
 =?utf-8?B?REw2ekRXcEtLNDJNRC9Wd0JIUFFWdmJ2UHltd3Nya0gvS0w3eXNMMzJOU3ll?=
 =?utf-8?B?d3JvQ095Qmpoa3RMeXZFUGJjYUpSOERVQlhNTG9DR0FHUEFRUmp1OTQzMHI3?=
 =?utf-8?B?TVUyNkM4clhlbEdIV2haK24zWi9VYW4rNnpwYWRCdzBSWUR2b1BGSDRxR0dH?=
 =?utf-8?B?M3F6TFFjZzVlWWd3Z0lZdjM0b0w1WnZDaElvL1hTL0l1L1VBQTF6akEvMGxz?=
 =?utf-8?B?Skd5cVlkcE9VcVFiUGVqSGNUR0NOMFpEcFdiY1c0YjVvZ0M2a0VHMk95L2d0?=
 =?utf-8?B?VjZrS0N5ZGg1ajhOQjBJQnNsVVJtd2J4S2ZLYlRNSU9HeWczS0c4V3FiMmNU?=
 =?utf-8?B?SnV4SXpGYThiazNHcC83aGVlMmt2bzd1MnMxbE9FbWJlZ1BsMWVHbndyL3Rz?=
 =?utf-8?B?VUF5Nzl0S3NiU1hkZ2M4ckpVM1RGblpSNnE3V09WN0RrTjRCYTZVcnh4UWxE?=
 =?utf-8?B?aDlHNXhhMUFkd2pxQ0V6QlpjbmpHa280Smp0a1RLcjI5TytaQ2c4N1R0UTlj?=
 =?utf-8?B?REJrVThqbDlybW44MmtuY0dvemk0bW00Y3paMFpRcU1OTFh4Q3ZWM1RZLzdn?=
 =?utf-8?B?STc3N2pyUEJKY05MekdDaVhZQWRPeXR3UVRXWGxnclhFTU1zQVgvT3ZRQXVY?=
 =?utf-8?B?eWlnRjg3bGhNRVZwWkN5OG45Qy9sdjBadEd2bjVBNitrRkNwb2JSNVlNaWpk?=
 =?utf-8?B?V3NLSi9vY3lwUDc2MFBWRk9hTFZ5ZjQ1OGVsSkxaZm5lVTJ5TlhwYUdZOWFS?=
 =?utf-8?B?NWcreVVqS05zWWd5N3N5dllRQ0xBPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b5896f-dc8d-408b-0285-08dafa14f37c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:01:51.8875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Z1TcIpE63hHJptxZbD37UQbCJrcZnpz98Jdkb/VtIRHx2UVJEDOIffyoSN7UvVeEPVuU3c6zKlz/NC6G5g6QWT3bii65Ro5e4aEvAFQe8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7468
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

On 11/30/22 15:02, Michael Riesch wrote:
> The rk3568-pinctrl.dtsi only defines the 24-bit RGB interface. Add separate
> nodes for the 16-bit and 18-bit version, respectively. While at it, split
> off the clock/sync signals from the data signals.
> 
> The exact mapping of the data pins was discussed here:
> https://lore.kernel.org/linux-rockchip/f33a0488-528c-99de-3279-3c0346a03fd6@wolfvision.net/T/
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

This patch is somewhat independent of the other patches of the series.
In particular it is not affected by the comments that this series has
received so far. If there are no objections, you might consider applying it.

Thanks and best regards,
Michael

> ---
>  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> index 8f90c66dd9e9..0a979bfb63d9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> @@ -3117,4 +3117,98 @@ tsadc_pin: tsadc-pin {
>  				<0 RK_PA1 0 &pcfg_pull_none>;
>  		};
>  	};
> +
> +	lcdc {
> +		/omit-if-no-ref/
> +		lcdc_clock: lcdc-clock {
> +			rockchip,pins =
> +				/* lcdc_clk */
> +				<3 RK_PA0 1 &pcfg_pull_none>,
> +				/* lcdc_den */
> +				<3 RK_PC3 1 &pcfg_pull_none>,
> +				/* lcdc_hsync */
> +				<3 RK_PC1 1 &pcfg_pull_none>,
> +				/* lcdc_vsync */
> +				<3 RK_PC2 1 &pcfg_pull_none>;
> +		};
> +
> +		/omit-if-no-ref/
> +		lcdc_data16: lcdc-data16 {
> +			rockchip,pins =
> +				/* lcdc_d3 */
> +				<2 RK_PD3 1 &pcfg_pull_none>,
> +				/* lcdc_d4 */
> +				<2 RK_PD4 1 &pcfg_pull_none>,
> +				/* lcdc_d5 */
> +				<2 RK_PD5 1 &pcfg_pull_none>,
> +				/* lcdc_d6 */
> +				<2 RK_PD6 1 &pcfg_pull_none>,
> +				/* lcdc_d7 */
> +				<2 RK_PD7 1 &pcfg_pull_none>,
> +				/* lcdc_d10 */
> +				<3 RK_PA3 1 &pcfg_pull_none>,
> +				/* lcdc_d11 */
> +				<3 RK_PA4 1 &pcfg_pull_none>,
> +				/* lcdc_d12 */
> +				<3 RK_PA5 1 &pcfg_pull_none>,
> +				/* lcdc_d13 */
> +				<3 RK_PA6 1 &pcfg_pull_none>,
> +				/* lcdc_d14 */
> +				<3 RK_PA7 1 &pcfg_pull_none>,
> +				/* lcdc_d15 */
> +				<3 RK_PB0 1 &pcfg_pull_none>,
> +				/* lcdc_d19 */
> +				<3 RK_PB4 1 &pcfg_pull_none>,
> +				/* lcdc_d20 */
> +				<3 RK_PB5 1 &pcfg_pull_none>,
> +				/* lcdc_d21 */
> +				<3 RK_PB6 1 &pcfg_pull_none>,
> +				/* lcdc_d22 */
> +				<3 RK_PB7 1 &pcfg_pull_none>,
> +				/* lcdc_d23 */
> +				<3 RK_PC0 1 &pcfg_pull_none>;
> +		};
> +
> +		/omit-if-no-ref/
> +		lcdc_data18: lcdc-data18 {
> +			rockchip,pins =
> +				/* lcdc_d2 */
> +				<2 RK_PD2 1 &pcfg_pull_none>,
> +				/* lcdc_d3 */
> +				<2 RK_PD3 1 &pcfg_pull_none>,
> +				/* lcdc_d4 */
> +				<2 RK_PD4 1 &pcfg_pull_none>,
> +				/* lcdc_d5 */
> +				<2 RK_PD5 1 &pcfg_pull_none>,
> +				/* lcdc_d6 */
> +				<2 RK_PD6 1 &pcfg_pull_none>,
> +				/* lcdc_d7 */
> +				<2 RK_PD7 1 &pcfg_pull_none>,
> +				/* lcdc_d10 */
> +				<3 RK_PA3 1 &pcfg_pull_none>,
> +				/* lcdc_d11 */
> +				<3 RK_PA4 1 &pcfg_pull_none>,
> +				/* lcdc_d12 */
> +				<3 RK_PA5 1 &pcfg_pull_none>,
> +				/* lcdc_d13 */
> +				<3 RK_PA6 1 &pcfg_pull_none>,
> +				/* lcdc_d14 */
> +				<3 RK_PA7 1 &pcfg_pull_none>,
> +				/* lcdc_d15 */
> +				<3 RK_PB0 1 &pcfg_pull_none>,
> +				/* lcdc_d18 */
> +				<3 RK_PB3 1 &pcfg_pull_none>,
> +				/* lcdc_d19 */
> +				<3 RK_PB4 1 &pcfg_pull_none>,
> +				/* lcdc_d20 */
> +				<3 RK_PB5 1 &pcfg_pull_none>,
> +				/* lcdc_d21 */
> +				<3 RK_PB6 1 &pcfg_pull_none>,
> +				/* lcdc_d22 */
> +				<3 RK_PB7 1 &pcfg_pull_none>,
> +				/* lcdc_d23 */
> +				<3 RK_PC0 1 &pcfg_pull_none>;
> +		};
> +	};
> +
>  };
