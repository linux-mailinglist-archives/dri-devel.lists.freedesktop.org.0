Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD14D808E13
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4687010E135;
	Thu,  7 Dec 2023 16:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2139.outbound.protection.outlook.com [40.107.8.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F197710E135
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/RjZl+Vo5TJvpCEDP3yTIKkKoY2B6/PuxnIdPXyKyQql6Vcg5eYfj/LS+phCBBZ01ecAwHdJWu4vTP30BkKrGQ4b7ryoSqLW1XqMW8lY1KQkuCXic3j7gNcKXbPq5vdCqTjacpkAcI/ma0rm5NopqowFR4O92LslsMeZEO6+L5jRNYHD1kXDee0SbMeT+1A+5RexN5amxuFtlvew7J5wvX4Ju3sEBnsCYvJoXhTXA5uPqf6FWF5bFtd9LQguESfUvr3KM6m4geolNtdXL6zgd0vZ3o2A9eAyVWmEDCB+NWLBcPr8WwU8Mb8JdqVLIT/BIcjlMhak61nHTA6BEn63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIM1SCe3ifWloVZ81SgDOmXKTicqzpCcwS81UvQ46UU=;
 b=FpyB7LhA/aldgvY7J5zTiX6qpGkN35WASAsnx+n/TNjEd3th2+ZFs8NKL/NtJ9IyFuT/m5l1i/GzQk0N6YPB/DGp3v9+tCJ3+KqjVOUbdR3EiIzZcB9pGS1b+AwB3mN+W0kdsymBvPnuEOOVTVWwz2sXlscfw2e1A2i4gxJNvdS3teUiDiGt3oWzjBe+fHCh42topr8CmJS+2NvD+BG30A0HJMe3TzUhQlla58h/Od6psnnISnqRypkRvA/PspREAzlt+J2clK/9VhYJYsT43kQlIHkDXhQs0cEh4wIDoryn1aLgIHRhdrT/tIJDUJPAQ6mN/Tzv1HFuoukPVjMg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIM1SCe3ifWloVZ81SgDOmXKTicqzpCcwS81UvQ46UU=;
 b=RjP8gEwyrM1QtFXRA+gG6/Zyn6wnDWQNJXHCv0dgw5UvIAYkmQuoXpLrtGYdRKi2NaFQbbkf2+y7NPJFwEtrlCZ3z5egFlPgSCyXOcexvf6bqBtnr1SSHkM2Z4YlJvF8e/WRiV0J1aTHJUuN+cX8bl2Afz4j1ANZRJAc97Q128o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VE1PR10MB3760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 16:58:28 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 16:58:27 +0000
Message-ID: <21e1b508-328a-4ec0-9f1f-75773f2686c3@kontron.de>
Date: Thu, 7 Dec 2023 17:58:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm: bridge: samsung-dsim: complete the
 CLKLANE_STOP setting
Content-Language: en-US, de-DE
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
 <20231207141723.108004-5-dario.binacchi@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20231207141723.108004-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0413.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VE1PR10MB3760:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2430ba-d50d-46b2-4bb1-08dbf745bbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sz+7VRoaFVACiW47yP8Fm9iWwfPjfiE3fo0bofXtCBlOJKT/3vGNKYZYHnaJ2WFo16LFXyReY6f3puiuzD/jAozblopwjr/w84lK2IcbQl0nRkd++MUNfy/ghvmBL5XzBRdIqTJPlGwFAdy/GdA3jf04JC63gZq8J3/EhUiH2i2xL6mhGzZTbeemnKthm8IlTb0WrbL5P6mvjTcGtqo8WVoTHs899eEoP97eqbIPyxsHrf+FBvthMYWzJA6lbkREBDilCLOnCto9EBb3ToULIMc/iD2lFt5Q9FbHHgIlK4nh2gcgHBc8AbzBBE0BO5VZ+vwV2ETR7Gl/jPx2GfrHI1hF2Wa/OoDwSmBdrmbSRYdKsavXjyiAiV8Pi8dsodolcGyy6/tP+TynJ8Ln/OtuE+cH+Cj+tjR6H58EtU1kaS6xAPVCXJqS1rxbveYM0848hyb9g4XGXYbGPeHqdHiZMS96zXK3DwQfRTSMNlL7oqYdz6wPm8fz7o54LFLBRve9dX15hkkUOzKlFbqk7sDbthf+egYsPmctJm1uGvcEcKusIEUvRv9qQJXxh2vb/0dFhWQnIgW8sRiOdNJt8MZBmD5jyHz0MQODG+azZixbkWy+pUnsraR1knucKYm+nEJkp2PkauBSOi6NPNKbYvi43w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(53546011)(83380400001)(478600001)(2616005)(7416002)(6512007)(2906002)(26005)(6486002)(6506007)(4326008)(8676002)(8936002)(86362001)(66556008)(5660300002)(44832011)(41300700001)(36756003)(54906003)(31696002)(316002)(38100700002)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzB1UW9zNXk4NnV5RUc2cnNZaFdXcDlKeE9YR3hEWThpSk9ZZ3NCWUNYcVpa?=
 =?utf-8?B?Vm41akdINzNCbXk0aWlRd0E0emlzdkh2elhDVDlDcHVYaTg1ckEzWDA3OFBu?=
 =?utf-8?B?Z0pWUWMwMzI2aUd5N0lxZm1KN2tzTlJwbWZJRzhYOGVacGJRY2xXUzA4U2lS?=
 =?utf-8?B?WFh6cjMrOE80Y3pyTUN5NjMzZGxPSFFrYit6RU8zcitUcnlZN1J6Y3ozeUFW?=
 =?utf-8?B?MnNzekE0M1dQTXBVajY4T0JjYktRbEVWSHcxZjZuQXI0UU9MNnhVU2VMTVBj?=
 =?utf-8?B?RDdCemhWd0xOWDdlS3Y1WjIrclVNSzhlRk1NZ2JRVUx4WTdib1ZpTGZGaTJ0?=
 =?utf-8?B?NlV0djhaSGFSRlRFZ0FxTGZidThZM01jQXYxVlB4aXVuNzJuQ3cycEpBaTdj?=
 =?utf-8?B?SU1COUZ5MVRHSVJFcG5LTi93THd6b2Z3L1llYml2RHR0eXhVbVUwTVRCR0pG?=
 =?utf-8?B?TXFhSlZwdWxoaVo2V29vQUp1Uzh0dURsMkJkam40TDJFYWxkT2FrVUxUVVdz?=
 =?utf-8?B?bEticjIrTlJNdkVhTEJORVBOWkhQL01HdThqMmNOb09wSjE3UG1vQjNtOU9l?=
 =?utf-8?B?M1pWZzdEN28vR1ljV0QzclRzT1BKUU9FcUFWNGVkcnFlemJldXlhZHhtZ1BO?=
 =?utf-8?B?dmpVM2VIVGFJN3Q4QTV3VFB5a0JsVElaTWdqZnRmQmtVM0UvTTVacjFsNHF4?=
 =?utf-8?B?NmUvL1ZtYVh1RkdaclZveDBtTmdPYndMNHF6UllsMFZxaVF1dS9waXM3M3VN?=
 =?utf-8?B?SFo5L1BQb3pod3E4Qzd5MFZrUHRScy9wd2txV3RGbjVDM1NCSFpwc1c3Ykx4?=
 =?utf-8?B?am9HL2lVNlBOZUdGMDV6a25VSTBIYzFGazFPdEpOSmxOeTRIc1djRnJQa3pk?=
 =?utf-8?B?R1BoY1krUzZZLzZJR3BPRnc3czBLL0hyMW5WNUtoYWxVS1l2d1Q4NU9sWStR?=
 =?utf-8?B?cFZCbVBzTGd4VXdYQktYdXBkU3l3LytZSk03M2k4THltSFM4Y0NENDk0aTZQ?=
 =?utf-8?B?Z1czZ3NiMWdFMGFObjBxTWptOU81K3VFeGxaeUJOK0NZbnVYTWIzZ2JTSmJk?=
 =?utf-8?B?RmVveGFISkNuM3F0bFhRaFpKckJ4Y3hGRDRyQVNJL29VVmt1MXFGbVp1QVBi?=
 =?utf-8?B?d29OSEpPTVhQUVhZUm1LMHBQYXN4clNTNW9Tb3FNOGhrbVk1NDFpRUFudDlJ?=
 =?utf-8?B?T0FZS2l1QVB1WkZQclZ0RE1mbC9jZlpIMWdHUDJiN0tld1pZa3BXbjBjVTlS?=
 =?utf-8?B?T2JqTi9hYTIzYzU0MGZ2UEgxYUVQNWZnellRai9zSFRtc1ZJSWNOT3pYeDB2?=
 =?utf-8?B?MTN6eW15VGhLbWFDRi9pMkZQRWhiWHgzTDdqR21ZcWt3OUpNLzdYSW5SdDdZ?=
 =?utf-8?B?NGdXU2hRQ01pRTkvcGxxN2NDZk15UGwxZDF5SHY4bTllNkYzUjZYWnZZeVRl?=
 =?utf-8?B?TFNrMUhDNmF0cHZ6U2ZnQUlPdW9kcEZrZlErMURyU0l3WjhySkFPcXkrZzNT?=
 =?utf-8?B?NHhROWxYSmFxL2twczdSWXF2aC9SSGNlTGRKNWoyaTdDeHl2eEsrQklnZnl2?=
 =?utf-8?B?c25iSVAvZzNUdzJKYkQwSlBhcUtlQnZDNm5QVmIxTWUzNVZidGZqSXJnU3B3?=
 =?utf-8?B?cjBweGVtSHBkOEdpeitlOHpCLzBoTi9UVFVpU1dDYk9JcnBET25QMlJUeVV3?=
 =?utf-8?B?cmN0Umk4MHJwOURiVHdsTk9ETWNzVUF3N1RCN1JoV3lmWEtBTVJHeE5qSlli?=
 =?utf-8?B?dk1WbnVqVUMxZ0lUeDFBK3M2OVZIZVoySVI1ZWVsQmdRMExZQnhuTE1oS3dB?=
 =?utf-8?B?VzFicE9vcHFjSENQbG5MQkpkRnlNWnd0ZkUyRzNBOWwxZ2dvU25Gb2pCOWFC?=
 =?utf-8?B?STgwOGU5dVZjcEVaR3QxbEFGNHJmWFIyUWlBbitIN0lrOUlZN0IzWEd2WHg4?=
 =?utf-8?B?ekhtM1ZXQUJScVNHZk5KRGZyYXRMQ200elR5L0tTU3F2eVBxaStjNW50Tlk5?=
 =?utf-8?B?K3ZaYWhOK0lHWE0xbmVzZ0p1Y2ZtQUhKQnltNDdnUGRXSHNXQnBZZlV4dy9H?=
 =?utf-8?B?NE5sNjJZUGp2K2hRSW1zdWxVTFAyNXNRekJIRS9zT3daRWlSVUhCSm52SGkv?=
 =?utf-8?B?OC9NejVRSzdDcGVtbGRFRk41dngwM3RaQlFvZkhLRlVsZFFudW1RTHZrcFl1?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2430ba-d50d-46b2-4bb1-08dbf745bbbf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 16:58:27.8693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2M9XrEWrBYaumrpLfO7fSEhv1i2ZrMk/4ovuF+u+m+d1JvTkdkrF9q/P9coJgPXCMLAm+hEnJgkw12eCvW0JBkABtVJl0BZgEfMEQDht7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3760
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, michael@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.12.23 15:16, Dario Binacchi wrote:
> The patch completes the setting of CLKLANE_STOP for the imx8mn and imx8mp
> platforms (i. e. not exynos).

This also affects i.MX8MM, so better just mention i.MX in general in the
commit message.

> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/samsung-dsim.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 15bf05b2bbe4..13f181c99d7e 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -96,6 +96,7 @@
>  #define DSIM_MFLUSH_VS			BIT(29)
>  /* This flag is valid only for exynos3250/3472/5260/5430 */
>  #define DSIM_CLKLANE_STOP		BIT(30)
> +#define DSIM_NON_CONTINUOUS_CLKLANE	BIT(31)
>  
>  /* DSIM_ESCMODE */
>  #define DSIM_TX_TRIGGER_RST		BIT(4)
> @@ -945,8 +946,12 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
>  	 * power consumption.
>  	 */
>  	if (driver_data->has_clklane_stop &&
> -	    dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> +	    dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> +		if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> +			reg |= DSIM_NON_CONTINUOUS_CLKLANE;
> +
>  		reg |= DSIM_CLKLANE_STOP;
> +	}

I really wonder what the difference between DSIM_NON_CONTINUOUS_CLKLANE
and DSIM_CLKLANE_STOP is.

If Exynos only has the latter, it's pretty clear what to use. But as
i.MX has both of these bits, should both be set? Or is setting
DSIM_NON_CONTINUOUS_CLKLANE enough and we should leave DSIM_CLKLANE_STOP
alone?

Maybe someone has a clue here. The description of the bits in the RM is:

DSIM_NON_CONTINUOUS_CLKLANE - Non-continuous clock mode
DSIM_CLKLANE_STOP -  PHY clock lane On/Off for ESD

>  	samsung_dsim_write(dsi, DSIM_CONFIG_REG, reg);
>  
>  	lanes_mask = BIT(dsi->lanes) - 1;
