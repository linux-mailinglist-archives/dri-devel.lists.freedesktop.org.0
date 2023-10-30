Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE77DB926
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 12:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8547D10E293;
	Mon, 30 Oct 2023 11:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E6F10E257
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3g88dcHcV/EmdgpwsFrshSMmLTvloemLQ+KxP1ZAV+W9dGDs+5o3P4QPJbM10PRL0254Xl5uwfXnuJqxHMOKq6aKYRscZeezpJdMC9LS2t68C8dePLYYbKBMDjFr86VRYwxTTpDuuGwQjE0y7p/s5mJ9r5opTnWNkncrGDft8FSRDIH4IlBsa8E5mIb0aUSO+OEFYrvbVEVPjfUTre7yLuYYEMK676q0RAtP888y4mUK8/mRo3/V6UXIlQgWuZGRbfboaQytZ97zhfIA/14amohOZ6tAH5osOl5OvIz/PngXISxN7ntC1EQw0TWGMyxcayiNL1+Dlxfwik33Ft9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF/eNHmDh4fPjyDdZoDCBW6Yb/wAkDp9px6IPNBnWf8=;
 b=mon+RJwHxVmIGH48XsOL7mz0w3Ku5DJ14iditSu/FO3M7YZnZKpFZI0WEBdCGkrsGSt0GYInl7Pn0Ln6I2v/E46rCBfruyxZUwe1EJB558skGkGBL+yCyZYlU9BTx17BalzBNktk1VXSnsz6c//ES6sv2z63SJOr6rb3R4ufTNee6LyZAAq6wVCjJO76oI7pAxKwyLscYtY6FeBAb+DIECPDs/Zd3ToK/TnOGGiByvhjpkQNF9O8+DacNUG7o0wngT37xtCP792xP5iSsLvKiy00eANrYAKfvVpS3knqgfHyka0kbtV00+o6oIcPWhM+d9aS/LVqoYkd+07XdznFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF/eNHmDh4fPjyDdZoDCBW6Yb/wAkDp9px6IPNBnWf8=;
 b=WiwuA9sd/fQsPDjLi9sLn2i+2vSV2Xc2GOr/wSBgUnzggutvWptUY1MBcnZEzQ9Od/YElCmTXxFskzTLCW6Rc4QEURIZiAniOh5ljezllgJMeERtJcUOusI5ZIkxzMMwH0WFLV+O1El6d0BIOVymxV6co8z3qeAsNLB7IlaaTLCrWOKs9OnSiMaQXmFTZEho1mgIAuY95zCpF33ZljI8XuGPNq/1/1zK84//Wuao14nbEf3Zj5zCoignhzcrTMu4cm/gxdBPnKJC1hrBev4l1bP/UY2Wx8/2bD9W7w+RXvqUfWxTTucGVS2gbI0PHv0kOHZW030hdh4ma+iQ0dbX1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AM0PR10MB3489.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Mon, 30 Oct
 2023 09:25:16 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d%4]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 09:25:16 +0000
Message-ID: <24282420-b4dd-45b3-bb1c-fc37fe4a8205@siemens.com>
Date: Mon, 30 Oct 2023 10:25:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] drm/tidss: Update encoder/bridge chain connect
 model
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
 <20230606082142.23760-8-a-bhatia1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20230606082142.23760-8-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::13) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AM0PR10MB3489:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4f1840-b56b-4325-8bac-08dbd92a2099
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kfbu4MNGHrReDE5UVKDejdBfA5FeFlO9NZGaojQhbNsoEyZYMW9Y41uYsm+Cqiz8zIyYdyv+c57zF1bjxBb7yu/Qp5uNCt7Uaz5M+pCjZDBmPtP4FUTEnFeg/w/U+kTtKKrDVRXEOAjrm4yv9BDR5oFcBDbz5BpCvffPixkNIkr1iqaVIUwDk04aFHgD8wOMAOUJ4KZglgbbEUz2lMsgbLTHljmUSh+TzSIQXoUEk8n9huqNxRHjOCKFdN4727E+Z9ucNPPWdDgo/eyx2AUfFQV2BZ2Mxjmx1zIMXlMXTGFGIHGpQVWwO1LnQYR8obVmUrg1iJYLNdLq+DNuR7WO2p1il1M9uWw8ivCFrj3BhMU2H15XdNaMIQgauDLIpdfQsxOuRFksBrZCyGEaqsAQv5JvrvwOJDJ0hC7MmybG2Butte5hwKrfkeJeAUxapFQ+zcsLp4w9Ki+KnT3eMKgTM2QsyrMzTeXNf27KRSQFgwQV67SC4T8LXeIrghoQ26HYsgYSYjyquBhX3Vli+fReHSsNqMvGqcwlN1SOx6OLix55pOPqstlVkL7TIfM7ealF7bAw3aC/7FfXOtapjToH0GGG/dlS7zXRrxOGQ8R4X0nMY0qhE90+25cim6L0Pgz23OLA8Zs978Nr5o376v/YuFJFVC1P3crySf2dZhaF3qGtQk9ZLp4+lkiF1IHvL6QT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(2906002)(6512007)(53546011)(2616005)(26005)(107886003)(478600001)(6666004)(6506007)(83380400001)(5660300002)(7416002)(44832011)(15650500001)(41300700001)(110136005)(4326008)(66946007)(8936002)(8676002)(66476007)(66556008)(316002)(54906003)(6486002)(38100700002)(36756003)(82960400001)(921008)(31696002)(86362001)(31686004)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmtSK0tMR1hqb1M3TTNWRzhOTEZnOUtYaUdQRi80TW9oSFRJSm9ucWlPdUxK?=
 =?utf-8?B?cDJadFNLcEJHTU05Wkc5MmVaNURCQU1NYkg4bVBLSGVxcWxQS2pXa3Q4SEpo?=
 =?utf-8?B?YjFHdEpIeUJOOU1mU0F0bHpqUmZEVVQyRGZib24wVFkwSWV1bG9HZGdwTTNB?=
 =?utf-8?B?a085YjRPeFgzclNQVmlPZFU0aitMaXYyWXRpMXRRbUJmRTNwODYyV2FOYmYy?=
 =?utf-8?B?dFpwWVRSajExeXJ2SUorUDNPZzZDUHF0Z3pLajUzcTJ3d1R3c3hJWFNOY05s?=
 =?utf-8?B?OVBhMUpvL0h1QUFxMmVzb2V6RFBER1FuVmIzRThodVZ1M1I1dWFiaURIV3hV?=
 =?utf-8?B?b1JhaVVyeTl0cjYwZHhFV081OEhjeis0S2tXOCs2MWI3NU4yb0hXTnNjSHBO?=
 =?utf-8?B?RmNxZVJtNzJOd3oyN3JxUVlNc0twV3R3UlVjYStBV0ZvSmY5TGgxd0V5RFBB?=
 =?utf-8?B?a200dDN5RE5WWmNpTFF3bHg3emd3RmRsQmxRc3pUWGxLOTIyMVZnM3c2eElU?=
 =?utf-8?B?clZ5eEp6MFpFcUZkZjNuVVBjckdSdGdFOEkwQjVEaTA2TmtSc2RJUmJoK2hW?=
 =?utf-8?B?Z0I2S0lwM0F5RWpTcVJpR0VLdmpva2IySTd4Y0ZyZFBYbEFiVlZtbmQ2cUov?=
 =?utf-8?B?YTdINWw4ckhZRnB2YWZHNStHZDFWN1lmOEFVbnVGYXZUV2RscUZycktZMlox?=
 =?utf-8?B?TTd3OGxJREtVbzVkQWtrOG5YYWtraFZFdjFFK0F5NHJtN1NzeVA4b1F5YjFi?=
 =?utf-8?B?Y2FjcXlVNGxwV2x1a0J4VnYzb3JOWEFyTWxVcHlHWm5PYmpOVnN5cTBJbDRC?=
 =?utf-8?B?Sk8zSGVLdGtzRG9mbjNSckVvR2M3dFh2V0tUU21ZaUo3VCtTbzhxRDBzQjkw?=
 =?utf-8?B?R2lJczB0RTh2RXo2Mm5nbTkvY2FPUE4zODRVRStCYzg5QStDcTk2OXRmNVJQ?=
 =?utf-8?B?RVJraDJyUU9na3FLZUFWZFdoV2t1RWRXMmQ2SDlJQ3JwRkVKVkYzVTVUSlpo?=
 =?utf-8?B?WDNJaUVsWHZBL2IwYUkxeVlqdElIR01qbHhIMFg3dFczaHI5cFNzR3VCMDdy?=
 =?utf-8?B?S1NIMEZ5MXB4dVI0Q2M4MnFkZWVoNU00OFNDbkVUZ01HR282SDIvU3laVG9v?=
 =?utf-8?B?TjVISWhneFQzREdMeUhVMDhTNERlZytKZmtTUTI5Um4weThDeUhOeWk1ZTEr?=
 =?utf-8?B?MDYzSENBOEZOZmlOUGxMSmhzbUx3L1RCaXdidnpkQnhoS29pNVlhNmtlVFl2?=
 =?utf-8?B?ZmMvcWJIUVc0dUhiUTRDUTFTaXdMTDNNQnJ3QkVzamZNbHA4L0xVN1U0Mi80?=
 =?utf-8?B?MnE4aDFJdkJkK2VYa2pKV1BncHpJMGRUcjJ4STV3L2lxazYyaGZIci84V2R5?=
 =?utf-8?B?SnEyR2dKRVdyVlhjYkVPZ25TZzJpWFppR1RWMCt3ZjA1RXpHV2ZKYmpWVjdD?=
 =?utf-8?B?MjZwYmJ4aml5dXVRb2hRQzh4YkJ5aUpWb3YyS0ZGYnRIc1NJRytQTU14dkQy?=
 =?utf-8?B?ZUgvRXhpVWgvWnY0SUxNelBZTjNlbCtLcGVLK29NYXVOYzcyUXZuU2lJTUFS?=
 =?utf-8?B?TVZKTTM1UGRZd2VNZjJaR0pwY3dzNGpqa2NDSWdlbFNTNUwxbjZEc2ZrTERq?=
 =?utf-8?B?Y3hPU29OT1hPUjZkNG15NnVDVlJaSzUxNFVnSDFIWE4zZkdVVTlwWXo4alNw?=
 =?utf-8?B?ZGJyb1UrYlZ4UWRpZ3JZeUszajJFczVGZGFHM25NR1prWERkS2NzTFg5bDBt?=
 =?utf-8?B?SDk2L0l4UWJGblN3bzZiaG4vby83ZDdydGVudUhrOGR1YTZjUUU5YnBnU1Nx?=
 =?utf-8?B?YUZYZ0cxYnhlNTBUbUsrZHVmRXFWendMRHNXc01pNEkxUnJrRnMzYjBQQXhy?=
 =?utf-8?B?d25WL2hSUFpUVWg4Y25mUWRnaVNhamxtKysyRnUvOGppMGJtc1hOVDZldFpr?=
 =?utf-8?B?SFM4SThxUGlmSC9GdTBqSHRkelBZV1ZxbDVIeGZSbVB1RmcrNFVhbXNlVlli?=
 =?utf-8?B?Zk1pN0VlTlYyNWx6d0NFZGZsVVFaeEJhWlN4bjROeW9ZQWVBWHU4Y1d0YVE4?=
 =?utf-8?B?Rms2ZTNwQkZyN1hra0Zsc3NSc1FKbGFKWGg0WE5WaEVMMG9FYVZLUFBnTGsy?=
 =?utf-8?Q?7dPQrC7mQOdQwhGNlG3yQMT2D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4f1840-b56b-4325-8bac-08dbd92a2099
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 09:25:16.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHQH6D72+dVLIA60jf9HcV8IhMpiavuxgXBDFzCKtfH9UUpYE5IBHMK417lN+BRzpmCpiOtmXkAbqM/Fx/dhYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3489
X-Mailman-Approved-At: Mon, 30 Oct 2023 11:41:13 +0000
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
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>, "Su,
 Bao Cheng \(RC-CN DF FA R&D\)" <baocheng.su@siemens.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.06.23 10:21, Aradhya Bhatia wrote:
> With the new encoder/bridge chain model, the display controller driver
> is required to create a drm_connector entity instead of asking the
> bridge to do so during drm_bridge_attach. Moreover, the controller
> driver should create a drm_bridge entity to negotiate bus formats and a
> 'simple' drm_encoder entity to expose it to userspace.
> 
> Update the encoder/bridge initialization sequence in tidss as per the
> new model.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
> 
> Notes:
> 
>     changes from v5:
>     * Drop patches 5 and 6 from the original series.
>     * Instead add this patch that addresses Boris Brezillon's comments
>       of creating bridge, simple encoder and connector.
> 
>  drivers/gpu/drm/tidss/tidss_encoder.c | 140 ++++++++++++++++----------
>  drivers/gpu/drm/tidss/tidss_encoder.h |   5 +-
>  drivers/gpu/drm/tidss/tidss_kms.c     |  12 +--
>  3 files changed, 94 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index 0d4865e9c03d..17a86bed8054 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> @@ -6,91 +6,125 @@
>  
>  #include <linux/export.h>
>  
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "tidss_crtc.h"
>  #include "tidss_drv.h"
>  #include "tidss_encoder.h"
>  
> -static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
> -				      struct drm_crtc_state *crtc_state,
> -				      struct drm_connector_state *conn_state)
> +struct tidss_encoder {
> +	struct drm_bridge bridge;
> +	struct drm_encoder encoder;
> +	struct drm_connector *connector;
> +	struct drm_bridge *next_bridge;
> +	struct tidss_device *tidss;
> +};
> +
> +static inline struct tidss_encoder
> +*bridge_to_tidss_encoder(struct drm_bridge *b)
> +{
> +	return container_of(b, struct tidss_encoder, bridge);
> +}
> +
> +static int tidss_bridge_attach(struct drm_bridge *bridge,
> +			       enum drm_bridge_attach_flags flags)
> +{
> +	struct tidss_encoder *t_enc = bridge_to_tidss_encoder(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, t_enc->next_bridge,
> +				 bridge, flags);
> +}
> +
> +static int tidss_bridge_atomic_check(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state)
>  {
> -	struct drm_device *ddev = encoder->dev;
> +	struct tidss_encoder *t_enc = bridge_to_tidss_encoder(bridge);
> +	struct tidss_device *tidss = t_enc->tidss;
>  	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
>  	struct drm_display_info *di = &conn_state->connector->display_info;
> -	struct drm_bridge *bridge;
> -	bool bus_flags_set = false;
> -
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
> -	/*
> -	 * Take the bus_flags from the first bridge that defines
> -	 * bridge timings, or from the connector's display_info if no
> -	 * bridge defines the timings.
> -	 */
> -	drm_for_each_bridge_in_chain(encoder, bridge) {
> -		if (!bridge->timings)
> -			continue;
> -
> -		tcrtc_state->bus_flags = bridge->timings->input_bus_flags;
> -		bus_flags_set = true;
> -		break;
> -	}
> +	struct drm_bridge_state *next_bridge_state = NULL;
> +
> +	if (t_enc->next_bridge)
> +		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +								    t_enc->next_bridge);
>  
> -	if (!di->bus_formats || di->num_bus_formats == 0)  {
> -		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
> +	if (next_bridge_state) {
> +		tcrtc_state->bus_flags = next_bridge_state->input_bus_cfg.flags;
> +		tcrtc_state->bus_format = next_bridge_state->input_bus_cfg.format;
> +	} else if (di->num_bus_formats) {
> +		tcrtc_state->bus_format = di->bus_formats[0];
> +		tcrtc_state->bus_flags = di->bus_flags;
> +	} else {
> +		dev_err(tidss->dev, "%s: No bus_formats in connected display\n",
>  			__func__);
>  		return -EINVAL;
>  	}
>  
> -	// XXX any cleaner way to set bus format and flags?
> -	tcrtc_state->bus_format = di->bus_formats[0];
> -	if (!bus_flags_set)
> -		tcrtc_state->bus_flags = di->bus_flags;
> -
>  	return 0;
>  }
>  
> -static void tidss_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -	kfree(encoder);
> -}
> -
> -static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
> -	.atomic_check = tidss_encoder_atomic_check,
> -};
> -
> -static const struct drm_encoder_funcs encoder_funcs = {
> -	.destroy = tidss_encoder_destroy,
> +static const struct drm_bridge_funcs tidss_bridge_funcs = {
> +	.attach				= tidss_bridge_attach,
> +	.atomic_check			= tidss_bridge_atomic_check,
> +	.atomic_reset			= drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
>  };
>  
> -struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> -					 u32 encoder_type, u32 possible_crtcs)
> +int tidss_encoder_create(struct tidss_device *tidss,
> +			 struct drm_bridge *next_bridge,
> +			 u32 encoder_type, u32 possible_crtcs)
>  {
> +	struct tidss_encoder *t_enc;
>  	struct drm_encoder *enc;
> +	struct drm_connector *connector;
>  	int ret;
>  
> -	enc = kzalloc(sizeof(*enc), GFP_KERNEL);
> -	if (!enc)
> -		return ERR_PTR(-ENOMEM);
> +	t_enc = drmm_simple_encoder_alloc(&tidss->ddev, struct tidss_encoder,
> +					  encoder, encoder_type);
> +	if (IS_ERR(t_enc))
> +		return PTR_ERR(t_enc);
> +
> +	t_enc->tidss = tidss;
> +	t_enc->next_bridge = next_bridge;
> +	t_enc->bridge.funcs = &tidss_bridge_funcs;
>  
> +	enc = &t_enc->encoder;
>  	enc->possible_crtcs = possible_crtcs;
>  
> -	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
> -			       encoder_type, NULL);
> -	if (ret < 0) {
> -		kfree(enc);
> -		return ERR_PTR(ret);
> +	/* Attaching first bridge to the encoder */
> +	ret = drm_bridge_attach(enc, &t_enc->bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(tidss->dev, "bridge attach failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Initializing the connector at the end of bridge-chain */
> +	connector = drm_bridge_connector_init(&tidss->ddev, enc);
> +	if (IS_ERR(connector)) {
> +		dev_err(tidss->dev, "bridge_connector create failed\n");
> +		return PTR_ERR(connector);
> +	}
> +
> +	ret = drm_connector_attach_encoder(connector, enc);
> +	if (ret) {
> +		dev_err(tidss->dev, "attaching encoder to connector failed\n");
> +		return ret;
>  	}
>  
> -	drm_encoder_helper_add(enc, &encoder_helper_funcs);
> +	t_enc->connector = connector;
>  
>  	dev_dbg(tidss->dev, "Encoder create done\n");
>  
> -	return enc;
> +	return ret;
>  }
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
> index ace877c0e0fd..3e561d6b1e83 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.h
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.h
> @@ -11,7 +11,8 @@
>  
>  struct tidss_device;
>  
> -struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> -					 u32 encoder_type, u32 possible_crtcs);
> +int tidss_encoder_create(struct tidss_device *tidss,
> +			 struct drm_bridge *next_bridge,
> +			 u32 encoder_type, u32 possible_crtcs);
>  
>  #endif
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index ad2fa3c3d4a7..c979ad1af236 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -193,7 +193,6 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>  	for (i = 0; i < num_pipes; ++i) {
>  		struct tidss_plane *tplane;
>  		struct tidss_crtc *tcrtc;
> -		struct drm_encoder *enc;
>  		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
>  		int ret;
>  
> @@ -216,16 +215,13 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>  
>  		tidss->crtcs[tidss->num_crtcs++] = &tcrtc->crtc;
>  
> -		enc = tidss_encoder_create(tidss, pipes[i].enc_type,
> +		ret = tidss_encoder_create(tidss, pipes[i].bridge,
> +					   pipes[i].enc_type,
>  					   1 << tcrtc->crtc.index);
> -		if (IS_ERR(enc)) {
> +		if (ret) {
>  			dev_err(tidss->dev, "encoder create failed\n");
> -			return PTR_ERR(enc);
> -		}
> -
> -		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
> -		if (ret)
>  			return ret;
> +		}
>  	}
>  
>  	/* create overlay planes of the leftover planes */

This breaks the IOT2050 devices over 6.6, just bisected to it:

[    3.435153] [drm] Initialized tidss 1.0.0 20180215 for 4a00000.dss on minor 0
[    3.491246] tidss 4a00000.dss: [drm] Cannot find any crtc or sizes

vs.

[    3.436116] [drm] Initialized tidss 1.0.0 20180215 for 4a00000.dss on minor 0
[    3.910574] Console: switching to colour frame buffer device 80x30
[    3.937614] tidss 4a00000.dss: [drm] fb0: tidssdrmfb frame buffer device

Do we need to adjust its device tree to anything, or what may be the 
reason?

Jan

-- 
Siemens AG, Technology
Linux Expert Center

