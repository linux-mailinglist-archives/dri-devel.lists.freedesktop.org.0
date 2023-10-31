Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F017DCCCF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D9910E485;
	Tue, 31 Oct 2023 12:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62010E484
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcRmZU52UQgrYRnc8RSoOriGcxzMc2BNOHuqaj7NV8tDFlbxH+bzlDCDmHu0JFt2KGBqtgOoVJyi/6jc+FMvCVe91dweGroCSFYQWvZILyuXCEZmJg62VaMhv5aDHcpm+5fJi2QrGZdZRmyL97mj0vbJeYcnkp5d5wAN/H40t+1cdtJM1nE71YJtSftF/cdvtO9k2vp2MFHPvVEWhrgQoMweFhRa0iLfXWnO27F1M2P0WeNwMpMbrkohoImFUTl5Q1RHYXpAn4aeJhzIXijxcqZ75+iSLXmCTwqIJywPCpWU4oywCUQzJ8RIKc6SAARp1p5IrMig25aOrNYGKkCWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBsVcUWTt1BgDfEMFWSgHsaxZwkWuBPkS6u/j+8EGbA=;
 b=hmppeBFv0PkQqfGwTH0EldAzIBOjuVAk0YcpWf8rwbC5+e17iWONjFvIjKqaTqtg2HJIDKJRg3J/PbYNEr9QGQlJkeb7GV/RC7kCMz/wkhhYX/dNnU4qBgWl1dyS5j3vXgLo9ubRLUdm5R75s60MNoOrpuMyucK+beOyHT1y9usO495oJwyNHHjMu4I6HOk3hfblS3gNpVmGmc6CuHbByaxs42pRL3TToR/cdmKp8qccb7ryK5ELRw+j+ULAo2EQnr5law6KLmQG0FFEsG8Rf7rQof10NTyP3hHJWWAoPwjYK6Ez1xOXbbPbZ8MXCg/3Wh99ogXZKsEQB9TsrnUVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBsVcUWTt1BgDfEMFWSgHsaxZwkWuBPkS6u/j+8EGbA=;
 b=HmYGZ0WqsRaTu9eNH4aDDvjg8LNQQBOtxwXZEJvqn3Nie5V7dADFgV0omCOqH/oekxUfZLN9YOCckvoXqyWZ+gR5fhRAdhPG3yvY0Id1eimvV85PJvTnC2X149i8FqzTnZXcx1blc5liVYmOjaYAWrIN9wnpjPs3C/8KHD518+CII3BVP95my2Lvy0P1sTfpPujwmPTVZonXK6xJyBfrokapPbQuTczLm7mx7hHmkZkvwArMFvB0t9L7WyKPQERf9jxnnD8aQFXCGCAScX1AMwj9utQx8rK3XEyvgO5CjKLNH3jTOiN6x6IJr+4gJZ78ty4DLpHHFwFLFhjlaJzvKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AM7PR10MB3876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:175::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 12:18:56 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 12:18:56 +0000
Message-ID: <3d8af1e1-e969-4489-90dd-59de1050f39e@siemens.com>
Date: Tue, 31 Oct 2023 13:18:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: Support input format negotiation
 hook
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Francesco Dolcini <francesco@dolcini.it>, Sam Ravnborg <sam@ravnborg.org>
References: <20231030192846.27934-1-a-bhatia1@ti.com>
 <fc113f51-35e9-49ff-8299-e7fc11b81c31@siemens.com>
 <9e801f88-a15e-48f1-b103-0305c5807143@ideasonboard.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <9e801f88-a15e-48f1-b103-0305c5807143@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AM7PR10MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d28c0f2-89f5-4830-b326-08dbda0b8e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lz/uF4wu8TJ4dBjzJkUL7BL+fyxt2qwErobkTFM4PBfiH2WcK5zH6+JKYW+2kuu+4n04w7q2Y96yPvqpQN0eWVDUM1RXLn6J0np463X2ARGgfceS3aLfoO7o/lPYE6t2apiZZgvFNBT26dSl+4+XMlyeO+3VXI40JZlqdMT3OJoO/jmp0M6UNrZeIRRJz+jz5Lx7kl2qpsCUm+fpfbf/2wyPNAn6nL4Ap/p8PnQAvskBUtuEVupoQm2ae+iImDUPhekceZqbl/M3tU/iRht0e0i5KC4l8Q4h32vBX+/B9t/3sseMdugMDoUsjTrInPCPPQwJH18ZXa3KOY24VnSv1hw4NMLV+RZhZtJAonitC6afcQmkfIXrWzxO66/eD0Kv3I9UTeziK9gVzLTs7C6leyBjBq34vv7jIRyH0kC4RTha2cZuACBgQ7IQqIfm4SU00JhqiBYEQp0AEDfARrmY1gE1hxWYYullFoMqzQzWEjLRtp+/OwknQqf2HYvbo1V0ZmUpaeaOgLcVZGHuzMh3yf2HUJidfHO0KmBedXCRhzaHqD6wZq9BOrw5HCHx2nmz5IR4Z1HcA1FFmQsG2UioOK+adUaoaxVDORD48rrPFduLpFEPWTUYr18jnRkyMQwRld+W468JQl8lrvjF6YtDcSfp83LGk2q5ufkEx37Fwv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(7416002)(53546011)(6506007)(36756003)(26005)(2616005)(86362001)(921008)(6512007)(31696002)(38100700002)(6666004)(83380400001)(82960400001)(966005)(6486002)(2906002)(478600001)(31686004)(66476007)(66556008)(54906003)(41300700001)(316002)(44832011)(110136005)(66946007)(4326008)(5660300002)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1VkZ05WQ08vQWdSV2l3OXZwcDJJRnNCaWpUR0NhZVAyTmlKRkxzSkRVRU5P?=
 =?utf-8?B?UUs0MEpZdUF5YTNVNU44UmpVWnhsY3NTd2RyOXVJanVxUmNwQW1aM0lBWkth?=
 =?utf-8?B?a3ZnUGpqaThuWTNaWHVLWmNIYndmNW43d1N1YUhiSTJNb1NjWkQwVzZQL0lV?=
 =?utf-8?B?S1RMUndHS2VpOG1Ia0NQd3BNTnVSc2VtWGNCUXBZZndjZjh1ODJsSGF1bjc2?=
 =?utf-8?B?ZkJmZE81SEZ2TmRSRTZFd2h1TXJHTmlwaENVUGV4ZStWRFE5dk4wcm1pSmQ3?=
 =?utf-8?B?UGtoOTJhTkEwb3psWGNFWG5vUFBCM0Nta2JLSWxNby9lelFRRWVlc3VCdDN3?=
 =?utf-8?B?Nk5LblNMZ1R1ZlJqU3lYaGRWK0huaFg2U3A5Zm1GYmJES2dzRDhyczE4QW9p?=
 =?utf-8?B?czN5clk0dmhYck9oVExtRzkzQ1Y1WnJmSElna2JWR1U2VGVkZ1V2ZU5wZ1VZ?=
 =?utf-8?B?V1NRZHhNWnFSNHJmeU0wdXVwOUJSMWpJay8zTTMwQmpvWWkrTFRHam52NTVq?=
 =?utf-8?B?NzRISVgwUkhRTy9aYzNJSzd5MDlnMnJzOW9PTXZBK25UcWxXTnNYaWY5a2hD?=
 =?utf-8?B?ZHYxQUJTZXU5MzhTZVdpb1U5c0VWZ1NiZ3U5ekp3dCtaQVZuWUFjQXByYjQ3?=
 =?utf-8?B?UUlZclpyQUp0bmQ0T2pYYkxBTmVtbmh3S3Y3NU1ua1RKUW9DVWlpM2ZmNnZN?=
 =?utf-8?B?dS9MTEtTRndwcENxY1owalRNS0svb0oveUR3MjBKLzBHNHYrNVZKOTRmd09D?=
 =?utf-8?B?NCswQUd6QXpmR2FFS1BFTGxuQ245VXpscXFWVVppNHZzZ0VPVW9CQlFWRUZD?=
 =?utf-8?B?dlo1c3VqRElIOWlyTFVjTEpRWFB1dEFrdms4dHRDMVk2SzBoYXIxTmVMMkxI?=
 =?utf-8?B?VFAweVA5TTJIclkvc2U5UzV6Nkc0akkrcXRyS3AzSU5ONVlybklNNWdqQUZW?=
 =?utf-8?B?T3Q1K08yYjZlZmNaVzQzTlFSNmpxNlpRWHdmTGNBK3lDcXdLRXBCcVA3eVNy?=
 =?utf-8?B?QU9EWThPVnQyQ3FTUGZ5bGVSVHNzdHJBMU0wTUpqV0Y1NkdHSUhQRnBmVHU2?=
 =?utf-8?B?TlNSbitZb2I2aHpUWEVmTy9XWVdGaFRjQllkaW5RdlI2dGhFRm9hYTJXaWUz?=
 =?utf-8?B?Q0s0eGhrM0c0UFZvNTJlQ2NBemdIMHFCdWdYanFqQVNxZnBJcFk1MkJXQldw?=
 =?utf-8?B?eEIyVVFRMEtRRUZDaWlKNStpQnhhM20zV1RnUVRxYVEzN054VFRXTlFNM05P?=
 =?utf-8?B?Wm1kc1hRbWZ6aWphOUxwM3FpV1NVZDd5TkRMVjhzK2RSNzgrTmN0T1JQZVpa?=
 =?utf-8?B?djVvM0poRDgrMzlHOUtOUFFRZ3BxaEw3TVNZRjRvRzBrVC85TC9qRTh5VTBG?=
 =?utf-8?B?ZDEzb1N3cXNWVSsxbjZ1cHdIMjFNMkROem9wcEY2NVR4aWpvWlRJS1BmQmJq?=
 =?utf-8?B?TlJUUENXL1pHdFpzRFFUR0t2SnlDODJHRjNaM2dRMGU1TU5raVlVV0ZpcWxw?=
 =?utf-8?B?UHAyMVVPOHNDRnNya1dHMnZRcjZWZ0Nyc2xnZ1RiRmdQMDFZMk9qQkRFeGtw?=
 =?utf-8?B?V3hwTy9GNFFoMjRzOXBSQ0pkZDJFOXRQaXdEUi9maGkwclIzNzM2dXRhUXky?=
 =?utf-8?B?N2lhNklwYnBUb2Erb0hlL3hxZWNIWlk2aEN1RXlpWU1PT3JReHpNSXorbWp4?=
 =?utf-8?B?YWVPQUoxZUFETU9US2h2Rkl2d1ZJQVZnQ3Z3LzRCbzVjUG00b213SEpaTVQz?=
 =?utf-8?B?Y0dWYnM0UnpCM2I5Y0JzWXd3ZXF4dm5paitydGJGTWVlcTE3RVJ5OWhDVGM4?=
 =?utf-8?B?NG1uc2MyMnFRWkw1YkFNM3pwMll0bzA2TWNnUVovZUY3OFMrbEFJOXVMS3E3?=
 =?utf-8?B?dGdreHE0TVVVbG1VZDVZdXBLeTZVRUhBSllTM0ZpeERMaHZtaWJBRGN0cWtD?=
 =?utf-8?B?NmJ0dzE0cXY5TGdaUWc3d09aai9IWndVVE1CdGhkK2N5N2xsUEtPKzIxQ1Ro?=
 =?utf-8?B?TVB2ajQ1WFpaejU4L1ZBeW9GRUgxYWl0N09CMzhVY2RXWnVUc3J0NmRsVDBD?=
 =?utf-8?B?bzdOQXlySkhoMzlIRENHZG5MQUkrT01oTXZuejZ5Y0Zra0VmVGEvN3I5TjVj?=
 =?utf-8?B?YnhOQjl3UkpLMVFYS3J6WllRQ0tTSGJ6VDBuUGNZa0didjUzb3czY2JsOFJ6?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d28c0f2-89f5-4830-b326-08dbda0b8e03
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 12:18:56.6282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK7HMtwSTy/QRYOESAY8g2FnwrZTfY5n5+J+nyAlya2wkETuI4LGN+m9IECxXOt1gHMA8vvTthT0FH9lRTqoqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3876
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

On 31.10.23 11:53, Tomi Valkeinen wrote:
> Hi Jan,
> 
> On 31/10/2023 08:24, Jan Kiszka wrote:
>> On 30.10.23 20:28, Aradhya Bhatia wrote:
>>> With new connector model, tc358767 will not create the connector, when
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
>>> rely on format negotiation to setup the encoder format.
>>>
>>> Add the missing input-format negotiation hook in the
>>> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
>>>
>>> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
>>> the case with older model.
>>>
>>> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> ---
>>>
>>> Notes:
>>>
>>>    * Since I do not have hardware with me, this was just build
>>> tested. I would
>>>      appreciate it if someone could test and review it, especically
>>> somebody, who
>>>      uses the bridge for DPI/DSI to eDP format conversion.
>>>
>>>    * The Toshiba TC358767 bridge is not enabled in arm64 defconfig by
>>> default,
>>>      when it should be. Hence, I sent a quick patch[0] earlier.
>>>
>>> [0]:
>>> https://lore.kernel.org/all/20231030152834.18450-1-a-bhatia1@ti.com/
>>>
>>>   drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/tc358767.c
>>> b/drivers/gpu/drm/bridge/tc358767.c
>>> index ef2e373606ba..0affcefdeb1c 100644
>>> --- a/drivers/gpu/drm/bridge/tc358767.c
>>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>>> @@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct
>>> drm_bridge *bridge,
>>>       return input_fmts;
>>>   }
>>>   +static u32 *
>>> +tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>> +                 struct drm_bridge_state *bridge_state,
>>> +                 struct drm_crtc_state *crtc_state,
>>> +                 struct drm_connector_state *conn_state,
>>> +                 u32 output_fmt,
>>> +                 unsigned int *num_input_fmts)
>>> +{
>>> +    u32 *input_fmts;
>>> +
>>> +    *num_input_fmts = 0;
>>> +
>>> +    input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>>> +                 GFP_KERNEL);
>>> +    if (!input_fmts)
>>> +        return NULL;
>>> +
>>> +    /* This is the DSI/DPI-end bus format */
>>> +    input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>> +    *num_input_fmts = 1;
>>> +
>>> +    return input_fmts;
>>> +}
>>> +
>>>   static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
>>>       .attach = tc_dpi_bridge_attach,
>>>       .mode_valid = tc_dpi_mode_valid,
>>> @@ -1777,6 +1801,7 @@ static const struct drm_bridge_funcs
>>> tc_edp_bridge_funcs = {
>>>       .atomic_duplicate_state =
>>> drm_atomic_helper_bridge_duplicate_state,
>>>       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>>       .atomic_reset = drm_atomic_helper_bridge_reset,
>>> +    .atomic_get_input_bus_fmts = tc_edp_atomic_get_input_bus_fmts,
>>>   };
>>>     static bool tc_readable_reg(struct device *dev, unsigned int reg)
>>>
>>> base-commit: c503e3eec382ac708ee7adf874add37b77c5d312
>>
>> Doesn't help, callback is never invoked. There must be more missing.
>>
>> Regarding test setup: Maybe your colleague Preneeth can help to give you
>> access, he just received some devices from us. Otherwise, drop me
>> instrumentation patches.
> 
> Can you try with this change:
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c
> b/drivers/gpu/drm/bridge/tc358767.c
> index 0affcefdeb1c..137a9f5e3cad 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1579,6 +1579,13 @@ static struct edid *tc_get_edid(struct drm_bridge
> *bridge,
>                                 struct drm_connector *connector)
>  {
>         struct tc_data *tc = bridge_to_tc(bridge);
> +       int ret;
> +
> +       ret = tc_get_display_props(tc);
> +       if (ret < 0) {
> +               dev_err(tc->dev, "failed to read display props: %d\n",
> ret);
> +               return 0;
> +       }
>  
>         return drm_get_edid(connector, &tc->aux.ddc);
>  }
> 
>  Tomi
> 

Yep, that does the trick.

Thanks,
Jan

PS: Your mail client is mangling tabs - was already suspecting our
server would reformat again.

-- 
Siemens AG, Technology
Linux Expert Center

