Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A917DC67C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 07:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD5D10E3FF;
	Tue, 31 Oct 2023 06:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2084.outbound.protection.outlook.com [40.107.249.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD64710E3FF
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 06:24:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC8unrdhKOK5N+r9Vj+QSwYlpSqfdWdbw0s0nIkpiDsPedplaMNuwDNuxhdfL0Iy0cXVWzNtkXIJcY/F7YAyBsQYwLsGlWkNf/OceDZqhtN7s6Gx++TCXMpzV2AFjt3v98w2dzRWKe1cIF0CuKkFMT41+qxhuyhv0N2sQbALKjFA+3Nrv3NXNAEflyQf22381Md7ZTp6vYhoXsrCE8/hwv1McHPaB9qZNbyK3EoTJMnQCRTFSBaoYVXejPWAndPRb6nUpDx01fxWCFlyPmk12HP9k+hny56nhUaYza9ozwFoqmEIL0PChMIJhVCIgoR96wqVldT10BaYPgJ2prWflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6F8ijHYiGNZYxAT2UYv51+fY3lh/6NOIcgZ3rBJfSM=;
 b=SLYPQ1xYOvAgqHFtrsN0G/1Yu1LJFJopdt7M9LmF7U4N/1+XtgT6gF6oiubmhPzkGwY7cfrWOWzQu52atBc7r2dC1xJO5zhPkI6O8YYBVAsSduv4LjVmkq8yTmX/WRauJn//kXK+7eoM+r7KyFHzaG5kJ/V3X/p6JZtMefttrD9C9948FzLOtYOEDxG6Z68t6SdyPhDBsOpqosHaylpYGjVev0q1ZwgCBpuTgIqfI4cCjGog6vnipFuw3qeQFIF7nvBBJL7PB5MnvrLuJwPlHFwqKDDpc4zeeYgVEAmxbC6SYe8t2oTbh1BFwN9khgTixVg/NPbVydmXGW2lRfFhDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6F8ijHYiGNZYxAT2UYv51+fY3lh/6NOIcgZ3rBJfSM=;
 b=z3t/6EPn7A/eDSW6Wsb/EupOoe++vj8uFKmfGsrGbpKM2GGVHFotS52xCBl51O+wqtyipX/J6DSuyMaHcctYQ524a2Tl2wGgURfiR1jzpUa7U8eGb5E0ieoNV4tYMkMtx531DZN+eyHaGJTj0GkFdV3AwOzOtwij9wbpKd4DzcOP2nKDYFo+8kMozSsqdwB5XRxKgWf1UyGryV6Y2gnkSD5Mv5M5zQHA24ngFCEqkq9m9XfTLPoi1BrhpxQUelOE1Q/2nXf8SGpP05BNEuSU1vw5ribCsPvcU/9BuWi6WP2ukADsfIMCypMxfwUF9MktcvjSPNZJYX32QTVDbPFEfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by GV1PR10MB5937.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 06:24:46 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 06:24:45 +0000
Message-ID: <fc113f51-35e9-49ff-8299-e7fc11b81c31@siemens.com>
Date: Tue, 31 Oct 2023 07:24:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: Support input format negotiation
 hook
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Francesco Dolcini <francesco@dolcini.it>, Sam Ravnborg <sam@ravnborg.org>
References: <20231030192846.27934-1-a-bhatia1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20231030192846.27934-1-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::11) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|GV1PR10MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a71d4d-e6c4-47c4-43d5-08dbd9da1316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: woR3d5MXGFtwPhUaLFGrB6qmiI37iVRmqCKBqu8rXvazd3FNnq9VuJhiqWi26riaFaQkDHyKl5rKr37AlKYb1sF5thH0EX4DgdrkHe8hD+02c4hy3L9mwqrOadrXkzzP5FrXRu8vEcS8OXKc1yzF5oOy9PF4hdlkGhPugDLUJSVcANo4r3T6v9LOX+OikMX+0dRTYFKcutKuKS8plw6OnMjZ3SYDPA7ALePwc7qtXM1QgTsabitHc6lIXUkA4PtApfNy+E8e8WXR4iROaJtswZX5MpixSBKiUe+JjpUcEhqZeQ2FlwYcXS/PV8Ki3L/jDLlB8MV+xQoaH3gTFyz2bOkMz282NF1G/WZKzfXRHXSZL9ktOFcdU/iC9B/jguTxBDZv59b0t1F0z2aeuC171PMU4YO/jumg8nhxobgsW/DHOW/PHZbrf/MFuuhGjRkGlP/MGlZUVP7kgex1GXxO+gOWbq23M8o9J+Mf1qvQJi9c7if17ftH3b1OXTHXhlG1W9EK6KHxqSjglCvyHetb79DFgZAN46PwtOU/lWb080FPmJEUzRO2FTRSUeZIkusyLt1icmlHu9llf153OJefM/2/fWr48u76nvv2J3TORiWShercof3WjkGSdrp1oeGGptWV7FYlY+aZG5S0CcaEY3wzYtrs9oVnl/wbEsPId/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(26005)(53546011)(6506007)(6512007)(38100700002)(31696002)(86362001)(36756003)(82960400001)(921008)(83380400001)(8676002)(4326008)(2906002)(8936002)(31686004)(44832011)(7416002)(5660300002)(316002)(110136005)(66476007)(54906003)(66946007)(66556008)(6666004)(478600001)(41300700001)(6486002)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWQxaGxUaDZPU1lBVXo1RHFTc1llWmhsL1lKRkV2QmJ6WTJ3RXVQZXlmVlc4?=
 =?utf-8?B?OHhTVXcvSGJOdzNkWHR2ODR2elhXTjlOMGh1d3JLWUYxcGh2SUU1VllWV3lP?=
 =?utf-8?B?VXRiRkRyN0ZsaHlJZlVUbThoM0JZUEc3NFFZNGYrYnlBZ2dTUTJFMXRxLzk0?=
 =?utf-8?B?Ni96NUVQNVZvS0VZUjZMQnM5LzBDbU5KOUhVZWhrNGlDUytjY2ZDbDFkV2Q4?=
 =?utf-8?B?QXR1bkoyWDUvMEdhNVo2emJIeXltNUFtRHg2NlpicWNoY2NHazdqYmxGWU96?=
 =?utf-8?B?QXVxV1UwTy9DUkh4Y1NpU1hPNm1YRldaa1VZSXd6Tm5BZFRLdmU4a0tXZklF?=
 =?utf-8?B?UEQ1WTEyUmVRWUpaUG90eTI0ZDRNKzNnYzNjSjRMd09sK0ppUm1uckEwVEt4?=
 =?utf-8?B?cVBITU9RTkdvSGo2aVZXSlQ5OHJPK3E4WkNOTXh4N1cxRVZYSzA3b0Urc1Fy?=
 =?utf-8?B?bTR1eFB3Ri9VWkNrM1dnQjN6VStjeHhaeHlRM3pvREs4ZTl3MkFHVjAxbHVM?=
 =?utf-8?B?dG1JZVRxQ2hNNllmRTg2R09OZU1pcmYzcTYxd2pWdXdmT0p4ZTlBK1Z1TlVw?=
 =?utf-8?B?SFcwVFBzWVAybmVzZS8yTFBzL3o3dkI2WlpkZkgzSFB3bThjMVhHMEJnU1lm?=
 =?utf-8?B?U2JucEhsYWpwYjJiWVVxTGx4ekpMVWxEM1RRQzNoK005dDdPVWg3L0h4akc5?=
 =?utf-8?B?OUhITFJSNXM0NlIzQldyaXd4NFRVMnZoMEZPbWRMZnN2VFdvbFBQTlpnT1lh?=
 =?utf-8?B?LytYM3QvSVNQVE54VVkyU0t0dzZEN1ZpcEhZd3h4bk5UOHdKSk1BYTYwbldF?=
 =?utf-8?B?SjM3Q0N2YmxyT01zR3B5M2JxdUQ1OE1yREdObFBYZjJleGk0WW5JOW1Mczhk?=
 =?utf-8?B?K0MwQW1OdTVya085WE5KdUlmWXUxbmx4VTd1VmtwSk1HcnM0Z2tQaHhOMGhq?=
 =?utf-8?B?TFRkQVBIT1ZhTXptQnBnVWpQOFBUbU9EZ0EwdnQxZjN6eWd6WFlqOFhJR0F3?=
 =?utf-8?B?Z2lWQ0dvMUdxS0NNUWdJS3BGSXU2eHcxeGxSRi9CZStNakZqUEhSaEFDK3lj?=
 =?utf-8?B?YWZiWGduOTlVdlUwemJFN1Y3eHJ5bUpCU3V6OHFEZmI3SHM0SDV6YXU3ZDd2?=
 =?utf-8?B?eDR2M1NxS2V0UldJN0ZqME5OaHlCUWYwWlBEMWJ3dldoSkVIUmxpME5HOHRI?=
 =?utf-8?B?OUUrQXltUm1nc2Nua3BobUtmUDRYWEFWdDNyRG5kMkYyQ0RlbThrUXBBT05V?=
 =?utf-8?B?K2l1WDU2cWZEMDlJSnpzQzhVdlB0cnVGWUJSeHdRdUNOM2FmSHFLcGtPS3p4?=
 =?utf-8?B?T0VjN3ZNYUFFNW52d2NzY0R6elNPWmFmM2FpYXQ0UTNqRS90RUFmTTJKeGZV?=
 =?utf-8?B?QTAzQ2pwYWNlVzQzMGEwMG1HUHBGbEdDV0N5M2xZRlZ2N3JZVkVIanp3U1gy?=
 =?utf-8?B?UERvMlA4UGRUZGszcHhoUXZDd2ZhTERQRll0RkZCYU55bFhsa3NjeENCWk1l?=
 =?utf-8?B?NUNpdnRSS2ZsWjIwM21jbzhqeHNCRERtcDdqVE1wdm4xMU95NXhKc3Y1MStM?=
 =?utf-8?B?dDBSVmU2YkpZTFZoN1lOeEVES2ZZdk5ibmU4eUhNWGZVS3RCQmxZSStiNVhl?=
 =?utf-8?B?YlZDNGJSMlRwZWVCU0N5WXN5SURoQU5md3RVRlFsbnFRTkhhaTNnVnhSaGMz?=
 =?utf-8?B?TjRnVHJsNU0vZkh5WHRWUk4xNFdkUTFCUE1OemZqM015L1lxcTJ6eUExTFBB?=
 =?utf-8?B?SHcwaHF4Z2dkdXM5Z0EyaFVoc2xDR2FWY24wSkxBRmg3TXJESFJLQjhlQ055?=
 =?utf-8?B?ek9JKzluSUo0cmwvNmZxNmFmWmZObCtPaEFrSHdPVmp2eEw5TkpmTjRCMGNI?=
 =?utf-8?B?cS91R2dnZHM1MjZrSGJWOUhHTnlGblVhL1Qrbll5Y09Wamo4MWV6TE1EMXd5?=
 =?utf-8?B?SjN0R0UvNkJjcTRqT3hReEM3UDFTT2dxcUlSM25PczVKWlpHakplT3g1Z3Yx?=
 =?utf-8?B?YjV4NDJBR3NFSWVYeGcreVhtN2szcmNYTFRDY2FUSTByMmhPYjFmYTJPTE9v?=
 =?utf-8?B?OXRaK3cvajdrRkh6eElybHJ6WExvUUhhNm5ZUGJleXhBMFlycFRUcXM2aG9h?=
 =?utf-8?B?ZnUzbE9BM1NvSGNtTm9ha3dUYkhhckpKNzVRR2hzQTVKTzRCUXhIZDF2TDNw?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a71d4d-e6c4-47c4-43d5-08dbd9da1316
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 06:24:45.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EduTjyWHcPSQgQi6ljzRxqgo+1iR264k9TuGe4ovFDm68+VFC1yvrfkyd+S1NtiyPAIOmyfApxVrx7bbgC3yRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5937
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 "Bajjuri, Praneeth" <praneeth@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.10.23 20:28, Aradhya Bhatia wrote:
> With new connector model, tc358767 will not create the connector, when
> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
> rely on format negotiation to setup the encoder format.
> 
> Add the missing input-format negotiation hook in the
> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
> 
> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
> the case with older model.
> 
> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
> 
> Notes:
> 
>   * Since I do not have hardware with me, this was just build tested. I would
>     appreciate it if someone could test and review it, especically somebody, who
>     uses the bridge for DPI/DSI to eDP format conversion.
> 
>   * The Toshiba TC358767 bridge is not enabled in arm64 defconfig by default,
>     when it should be. Hence, I sent a quick patch[0] earlier.
> 
> [0]: https://lore.kernel.org/all/20231030152834.18450-1-a-bhatia1@ti.com/
> 
>  drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index ef2e373606ba..0affcefdeb1c 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  	return input_fmts;
>  }
>  
> +static u32 *
> +tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				 struct drm_bridge_state *bridge_state,
> +				 struct drm_crtc_state *crtc_state,
> +				 struct drm_connector_state *conn_state,
> +				 u32 output_fmt,
> +				 unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	/* This is the DSI/DPI-end bus format */
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}
> +
>  static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
>  	.attach = tc_dpi_bridge_attach,
>  	.mode_valid = tc_dpi_mode_valid,
> @@ -1777,6 +1801,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_get_input_bus_fmts = tc_edp_atomic_get_input_bus_fmts,
>  };
>  
>  static bool tc_readable_reg(struct device *dev, unsigned int reg)
> 
> base-commit: c503e3eec382ac708ee7adf874add37b77c5d312

Doesn't help, callback is never invoked. There must be more missing.

Regarding test setup: Maybe your colleague Preneeth can help to give you
access, he just received some devices from us. Otherwise, drop me
instrumentation patches.

Jan

-- 
Siemens AG, Technology
Linux Expert Center

