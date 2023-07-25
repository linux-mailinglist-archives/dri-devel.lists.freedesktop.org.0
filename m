Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6814760B98
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545B110E396;
	Tue, 25 Jul 2023 07:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D9510E396
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve8WDTYmPhe/86dP8vtxDrOpMrltqHyQaLTIKFERTi1WvXalvtO/fbzatYuFBkvhYadxMYF9QVxRJX4bJ2xDwn/Mo8vpmMheoNs+JWLrcedSHNnibgPgoX9q0SVDWoiSMtHU7nqlD7bJ387JsvRe9Pt+F/iPNhP8qmc3Vyo6exwqwLz7EyB4mH8ezVHrJ5KLPqVNyLs1OjhNCYvhaNCa4dJbnu7q6j28WB6C4oIItoRnnnA5HnHM6vkdOZxIHCNVW4ll6eDUuyu0R0He44aqLbrWjGo0muPSmEL1cha0LN0KltM1sWkzjy2LuPjrIpes8mV2w9ta/xQ88e/s78J0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L67s+XZfoet+YQVCBX29FvjWE4RgO5KNWWNNQ49WlBM=;
 b=BWW3fjuB8gHf20IhtBUHKwpOututRiE8BtUPvWJ6PBp+cUYjePL0X+m7FUSTGW0YAusBy6g+qJ/G8uMpd4bwkePtAv/axuviKRyLnhWymTbTxxNP+bKbYbcFZCV0CY83cuRrY0D9UURSVfdIUzTWY52CS9sv8jWj7oH4FP3gBq8M0OpT6Pl+4dl+7PzLX0Ir3kYNyOpdr/eyIsQukXwQPhfrh12xRIUNzAlSUDK/TKlsgKSlFIcXM3r7bufYMzLmLXY+nDcOY5ok2eXRvQDJh3Q8tqPhiPdteJAq0Nsd7OkX8guLCCgI8MEM9Ftk25dJMBlFg0akfmKWCuL5nq8N7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L67s+XZfoet+YQVCBX29FvjWE4RgO5KNWWNNQ49WlBM=;
 b=Ct4EMxqE3AU4Y6CKZBEmxHQHpPAFOkrPaM8vNg9o9AmYtQxllyLg1RRYhMwXIO3XzwYu+TrILqPC4BE3vYT3dmZAlhOEQuoTFhPLs446zuRmCXOOCNx5lKeM73ESML4AM8n02wT9pOrlmzOIA3IGmdjZhWWrX8L+bbolavTkdHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB5312.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 07:23:23 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 07:23:23 +0000
Message-ID: <002fa4d5-b46d-eac5-28a8-a2e22ad0d92d@kontron.de>
Date: Tue, 25 Jul 2023 09:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/4] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI
Content-Language: en-US, de-DE
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-2-l.stach@pengutronix.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221216210742.3233382-2-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 3075f4d5-956b-4caf-0816-08db8ce007df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1EntE/21vjTfaA3AxzWiNGS98ocCgWSMhDaXqRcmYhR4+li6WgSImomaDvrbnMGIg3KhqWLDEyHeWh9lwDCYbFboRcogT6ZsE4yUpAyaAonlUf+SJ5s87YRimq6dtmM3rpRTGslrt+xM6WI1gCcwuUfIwGVHMdtH5zGZ9HdT3SM6y8epIqlJMXXiFua6PLRf4YEnBIOjjlgF3ProfiRPth7Cpqf+Ap//ck+NPqkutjpU9WjmXGIwwhL+zL0MXiwF84iQ4QylTAcay24OMbT28Huu3fiNabDMTlQltO4pOkeDcsp0u272ZBTe04Ml9AsqPUnH51DJyAPDRUG50EjhExLwrYdqwJhodhW/P9kI75FfIP0cf90MEC+CtTrxHIdQSl7t9UEUkU/0XeAUhd3nAAFl3bdn+eUs34LqcqNWhP5SlP2EUAJvrkCTfqTuSkx4raVbyMOOiaOb+SBxt4ePNeUFC6om59vUs3W7cOuPJUKUSE+r+JcOzbvYkRIj1MwuPsEjT4NhBQKAleFbXrrtyaK151KjsoA6stShC1H7OWH1POkI4KHW5LjmHEaX8rYiwGu3rd7Cw69kXwyllOnUJbq8fYbJlqDYmAU2SQngr7spnN4ZjoMGC/blSGwgCz52ezXuubz1C+DYBW69M+4JRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(4744005)(2906002)(41300700001)(316002)(44832011)(7416002)(5660300002)(8676002)(8936002)(36756003)(31696002)(86362001)(6512007)(6506007)(53546011)(26005)(478600001)(6486002)(2616005)(186003)(38100700002)(31686004)(66476007)(66946007)(66556008)(110136005)(4326008)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVoT0Jzd0NYSWc5VW5HNktnK1MvcjFhTDVnb1ZrdTI0ZnVVeXBaREhoZUFq?=
 =?utf-8?B?U2R1Y2lTbUhDMmdDUUgyK0lxTUl1cW5xM1pNbm1zamNhbXJLL0VLbjl5OW1R?=
 =?utf-8?B?cGxwRE1Gc0NrbkdGWUFZMGljQUVvcTJmVVhRcW5pQXlLRVpWV09nRklYa21s?=
 =?utf-8?B?ZWU3L05mQUJqYUxYT0IyL1RDQ0ZWdmdna2lQaTlNR1RBamFZVjhEUFJmd3ht?=
 =?utf-8?B?WEtVTEZiR3VKbVFzazl5anZ0V1MyMUdHR1V6TVBSSGR3R2I1bjNZZTBlMlEx?=
 =?utf-8?B?U1EwQmIrM055YVg0Z1JyN0hDOVduYnZqejRGMDZ1czhFazdHMnBhWCtBMGxC?=
 =?utf-8?B?WHgwUjBpOGtyZUVOVWowdE81Um4vMG1XNXd6ODBHNkdMdXFkZWt4TjZXelBa?=
 =?utf-8?B?Y3BkckRiWmlkc1FqcmhlWEg5VDVSUXdKZmFSSTRraEd4Q0FVNmtVR1hTUTli?=
 =?utf-8?B?Uk9CUkNHbUV3RTNPeVhiSW53VkVIalA3WEFxcG9rNGw5NHZsVEUyMGJBb3Yx?=
 =?utf-8?B?WWVTbFIzWjhpVUkxb0xJcDhZN1hhUTVBNHFaOW1yTzY1ZUREZE1IbHRBUkZN?=
 =?utf-8?B?bUplMFYvTktDUERyOTIvMXIzSldJV3NhRVNpbWorRnRVUGlaUUErK0FxSWc0?=
 =?utf-8?B?UDI1dlZ5YVd6cGdUeHBnaGpta1FWZFlBUEh1RmVRM3JTU1M5bzdJemd0cW5C?=
 =?utf-8?B?RGVkSTU3OGdwa05RbjhIYVhENEJlWEkxNXg4Z1FoeWhLb0tIYUxvUnUxL2FV?=
 =?utf-8?B?c2FWYjU0WEtScVViY3dyWGNjeS9BNWhBNHZPdDYzTjVyV1lteHRobklJVVBt?=
 =?utf-8?B?MEdBZEI3ZHZCN3lnVnhmQWQ0Mi9ZbVFKbmEvcFlDTTluOHZPcnd4empCa2Ry?=
 =?utf-8?B?clNqSFl0ak5JMmlCc2VrQmc5QU0yOGRZOVp0MHIvaFRSNE1oUko0RThDWVRs?=
 =?utf-8?B?ZGYzaUc0Q2Znb3RoUkRlaHhNWk1YVFZoRnluejhFZHh2N00xdjJwc0duTVB1?=
 =?utf-8?B?TnB0b0Q4SzdIOStjeDNSNjg0NWJiK2xSdGpoODRCR1NWS0h4ZXFMb3ZIdDZp?=
 =?utf-8?B?VXdYTVZqR2syakdDVzE0WWtlOW1sYWg2enpCWlYvNEpNbk41d0tvQzk1cVNv?=
 =?utf-8?B?am9kR215MVhKNDAwOXhVaTBPMTFsL2hyd2Jpd3cyWGZLVm00ZnFYWCtjTjQy?=
 =?utf-8?B?VzJaeHlQZHhMUHVyR3hLNjZJdVZMWFVQN3BWZlpyVVFZS05KZUlWYzBUV0N5?=
 =?utf-8?B?WURMSTJLV0JZS1Z5NlQvbmJjVGYwRHBEVGZlSGNNeXR2Ym92bnd5Ty82OHFx?=
 =?utf-8?B?dk1pc3ozZnRjWnJNR1BhK1dxNGE2bHk3b2crVzRMNUR4UitZdmVNSE9QRFJh?=
 =?utf-8?B?S1VxWjhBcE5OczNOSjVRK09YRjFRVVpOamJtZ0ZnREJCZzI4dzNLQkVSQ0Zs?=
 =?utf-8?B?bm1iZUdhT1dWWjk2TUgwNkk0Sm05ZjFuMHU5ODRLdSsrZW9sa0ZBeXcxYm5p?=
 =?utf-8?B?WW5RYXNCQ3ZFTlBnZ3UzMEovQ3dUaHFXaW82djNxV2R0Vkc2MUdYU0JpY1I5?=
 =?utf-8?B?eXF4WDViNWFmK0pXWnRkWEs4Z1dnZUFDL2RmdXlyZVRnOWZNNmwyUE4rT1BK?=
 =?utf-8?B?VnNUaUVpaUpvanpFVUs5RXRxMXk3a2VRNWZsbERuYmVsWVBXSW9IY01CY1Uw?=
 =?utf-8?B?dXNKclQzUC9sMGRiakpmTFFqM2hZYUZxMWtkSHNXVkRGRFJZOXNYakkzU2ZF?=
 =?utf-8?B?NW42Y1hLWVRVRmY5MUxQM2V3aVhsRmxjR05RZ051VTU3QWFNSW9WUzNSTzdZ?=
 =?utf-8?B?OE5qMmRhZ3JVUmVGYzJmRWFBb1FnaU9uWmE0YWpCOTE4UnpXSE5UL0NRck81?=
 =?utf-8?B?NnYrZWJZUEdzNm5NQWdDNHJ3QXN4RUNpQ01jUG1mWjhTMEkyc2lSc2JPUXJq?=
 =?utf-8?B?T2JJazlMNjluMGtHWW41VGJvaUwxUTFOSURUWjFOWlpYSE54bStQQlV5eGlv?=
 =?utf-8?B?NXZSSlJROVhkbFhMdDdKMW91M09adnZ3MXJZTDZLNHNIUlNXZnYyNUhiMUgr?=
 =?utf-8?B?TDNvTXdibVJwUC9md3d3RENQSEZaaHd4R3hBZk5BWGRGbWZ0aWRWdDh0S2pW?=
 =?utf-8?B?YjFtWnpzcVNCOWlIV1NzSGMxemhFcXI4SmJUR3NYOVNselhaQnM0WnVPa3Ni?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3075f4d5-956b-4caf-0816-08db8ce007df
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 07:23:23.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zm9n7hYPKXoGtyNyD9BeyCqZGNvEGsVwNfIPyJwrDpdClfFIKRtNSV54E5b1c5+1XnMvZbz/vQQnwLVwnvXXdm/r8aiKOEyAcM+9yHE4tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5312
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.12.22 22:07, Lucas Stach wrote:
> Add a simple wrapper driver for the DWC HDMI bridge driver that
> implements the few bits that are necessary to abstract the i.MX8MP
> SoC integration.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Marek Vasut <marex@denx.de>

I tested this on our Kontron BL i.MX8MP board. Feel free to add:

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
