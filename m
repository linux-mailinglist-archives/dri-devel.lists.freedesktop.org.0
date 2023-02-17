Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADCD69B256
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 19:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CEC10E2DE;
	Fri, 17 Feb 2023 18:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2103.outbound.protection.outlook.com [40.107.20.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16FA10E2DE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 18:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4p1HlSg9R6/pSlxTS2hZRE64GT6NyZGKKx4HA2OayctqRXsTrQkdatLXMcje1ciJLpKf8vhJvltvVBpSIoocPWVui1Yn0mjH6fiUp0VX8VfjC0UrKmV7SwVOF/7rVvWxbQb5Xgy0mUeePWCsLewrou+Vpkjp4oFD/65q5It5hJrl9Cu3iFrdK8MStZ7SG+BsxwYjfnjHx42Z1wzuDnyifx9r/kp5uuD55gepSkx5S3dYGkRodtXM+STU6WXYXQlnJKednNBsoAN/VkrkJjYp3W4erjpmAZAWdUiQtgMipZawl3QQLmnZBzC8a8tULfqSQqhR6hMi8JAI07RFIb74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH1S+utjI0M1708ktEfAU3+ofpK/wnugdDCEEtLWTxw=;
 b=hPk9tJa4wj0oT4Ac03AgdQwmTgfHim9XM6JhlfCAGOEfdcLsH6BmkfHEmqqw438r2CaJSj8sLfLVSMPaePjkP5Zgd9DYJtkDUuyjUv9SK69EvVJ9SRMr3EzqtSEcmtDJ5oTyochzKkmWwbGYIB7P+2RZ8OWKjj16HlXN31aOBF+WC2fswpPwPcrNd+xtg9DBMzQ7KleMDcEjObXGx2TChTwGju5ToxkHYsazSu0WU172wLKPrvyIDjaJOmmKCrZF3A0y4eTGY9t5Lhqp4Q4YRroJX5bl3Jbl0RAUzPdERwgbAoqqRI4XWpDjmnm8XMGzWAkKg25KSLd3SmQexi0iqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dH1S+utjI0M1708ktEfAU3+ofpK/wnugdDCEEtLWTxw=;
 b=igY9NSKx8+sSWgmvJw6qhxLAss9OMaif+ZzWk4iJfq+gLJYftCdyw2mztTzzjTpdZCoK7PJWqrMMudf4pgSKrIO6lzFbJzMQwzF+35Uq/jAEgS2338/57664SeRrhGDvlpjNcPZMBKFoXh285HsS/cRjCB/E/hrFiNhe+K8qi+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by GV2PR10MB6648.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 18:22:21 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a%5]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 18:22:21 +0000
Message-ID: <b246aae9-b719-02f9-dd0f-305b74611fab@prevas.dk>
Date: Fri, 17 Feb 2023 19:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
In-Reply-To: <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::13) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|GV2PR10MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: e265389e-589a-414c-0998-08db1113e8c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFPRKnn501ZJGbL8V0X3fV4ON2ZWuq2MdgigpxM8OsaXdCHXqM72FerOUPJ4OT68ydK4O1Wr/vN/tNoUUq8eWfWaUSlEmI/GUHHAuvQesHL07ANZqA2WArTFRY0ne1UyaehMccnI5AY3PVg6Suth6W+VmxRq5KdvY/faSjLPvgsNiLwmXhWOoJDexztIQI+E47myR4LJI32ywxTW13YrAJebqXiCFObfrrrosP8z50o82bVTp/ruEdEv9EsU2xlyi4dUlQKYMvXCoR9FI+yQdTWQ0h3khofsav5yEn4lZDnYzjXSEpvNs4sDFwXyCwMkObOJKr/+tuIRA0CRuKGwd7lgI9P6Quzii8kJdWzw3MnWmPUcPBbuHRj2DB1aW4YUK8A0pJve199iODf7sJnuRsJ/Zz2gr44RwYKqhnu9quxnwMQxGEO1gtXbsl7DZKdeQEZ9Hr44wF1gv2Nv4OkW5IzPkZqvECSvzEhIAQOOxPwu8PQDDMfpsSMjod3Fk07n+QTXpQwtI53rlBbTKJsIql3LWcPDDnxZV8WbnChZeNTQqOXNX8nnbPlDvAgg2xbb747FGSGRhsb12iti4eo3r73dM6DFF1G5R4J/58NDK8THPzBKz/mk+n0e/hIKs60b5PupzulolIJnNuF9HSTG5za4gJ8TjD4PvhyonYtvGbIIKx+5GVL4+/YHmjW5UHTRnezHyW0ADxQO012AfaZJ9lvycUKxSZzaGeNSWKgY+dDggEhjyo7fmNPDP60I7m/uL0bFZdzm5YnE1NAG7qO2OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(366004)(39850400004)(346002)(451199018)(2616005)(31686004)(38100700002)(8936002)(38350700002)(31696002)(8976002)(5660300002)(110136005)(8676002)(83380400001)(6486002)(6512007)(52116002)(26005)(186003)(36756003)(478600001)(66556008)(66476007)(2906002)(41300700001)(4326008)(66946007)(44832011)(86362001)(7416002)(6506007)(6666004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qy9kdzNJMVFRd2RncWg2QnpBY1ZOSkd2Sk1iSnF2OEhYNkZYckpRMmY5Vm51?=
 =?utf-8?B?dWRGSEJSVlZXeUNkTUFMTjAxc1czQWlkc1FDK25hMDlMUnhyOFAvVHhldGpv?=
 =?utf-8?B?L3k3bHE0S0JpSW9WaHpRdjRnaGpyeFpkcThURklaQzdGUzVCYkdQRDNrUTkz?=
 =?utf-8?B?a1VjMFBWYk5sUFRUVFphNGtSeXk1THNlZWRxbDYxazhqa0xJNFhFQUNOTXp6?=
 =?utf-8?B?ZWVtWmdTbHFoYVA4MVZyWG5PZUFGalRQNTV6ZktUVGNFU24ySFBjV3kxSmFw?=
 =?utf-8?B?VjZ4YWhlMkovQTJwNUVhWmFzRk1DL0E2bUo3VkxVT3duVGcrSkNadVlDV2Ey?=
 =?utf-8?B?RHpUN1l4UzI5NkxSaWhsMjVWZjFuallwbVlwaWorY09vazJwMVZxZXJqV3Ax?=
 =?utf-8?B?Yzk3VTI1T2paY0ljdS84dFN2eE5aNkJPYSs3RC9RYWZtdlVUYlFLa2ttVW8x?=
 =?utf-8?B?S0dya3dwTGlqdXpGaTMyV05ZWWNqNVR0QVoraXFMdkg5MHYwZjdHYUQyVHhK?=
 =?utf-8?B?QWtyTWZCYUJObmppSEUvaHZFN2t4a0RuKzZJajJ4RFlncEQrTHpaNjFpRTNO?=
 =?utf-8?B?MlhBM1JWRG1NS0xOZzhOVGJ5MFdoTDNDNXR0OXhUVXdtODlDRHB2SG1rbDE1?=
 =?utf-8?B?MFdKVCtoRzVUOG43VC8raHdVM043SGs2b1B0eHdJYzU2alpnNUdyWnp6R09m?=
 =?utf-8?B?SU9hSE9Ha1VJWDhOb00vTUpudWwvVFMwTzk4WFhjN0lSUjZXZllKQi84SjBT?=
 =?utf-8?B?SHBNckgyUENWVTRSZlVtOWVFc3FQMW40am5UdksyQVd2SUtPcjFEMlYreHpG?=
 =?utf-8?B?Zmh4L1ZQdUdCZzViMkZITDJmUUdGMHhDY3M1bHdLMDRwOXIrSWR0T2pLZXF6?=
 =?utf-8?B?dlBpazRCK2J5eGxsTGpXa0cvc0pPR1NvTzhZVFhxTFN0TjlSWGRjYlJjZnls?=
 =?utf-8?B?cmV6dy9aZSs2ME0wRkh3ZXVnZjVENUJNMUFpSGg1djlUcnN4a29RbW04VVZG?=
 =?utf-8?B?NEU5dEt1NUlBQlozQzBsYzluN2VSa3VFRnRhL3N4bUZIdDU4NlhFT2ptWXRa?=
 =?utf-8?B?Zm1YRUlVaXVlb3BQd0ZjWkh3dmlTaVpvcHhaeUJreHdqVWowaC83MWMyeGZl?=
 =?utf-8?B?b0UzMmE4TWtGdzJjc0ZzVUVHWFFJQmgwRXV3UUtZdWZNZkJEeDd5NzNFS0ZH?=
 =?utf-8?B?RlNXZVhoc29aQmV2NjBJQUIvTFhwL0I0a3J6OU5ENE9WVFVDWmJ5a0RkSDdw?=
 =?utf-8?B?alpYanpyMXhsSUw5ODRUdU5sczVxdE9FUTVmNFFvM1hUZG9odlZ2RnFmWGlq?=
 =?utf-8?B?cXZVUzFPcWhNbUlIS0hSbDVIWWUrM01PdjcxMHFFZ3h6SzIyaDJNdVRkWnFZ?=
 =?utf-8?B?eFhQREZEMVdYOSt6ZlhWa1VMa05TZlkwOVVOMXJIOGp3dFFBVEo3dzNydjdj?=
 =?utf-8?B?dTgwWk9wTlh0N1pOVlJta2JYNS96Z2xtUkxqeVlFRVFmRWhJdDRCbm84Ynll?=
 =?utf-8?B?UVU5d3F1cHZySmtHWGxZOXhpWFJjYTlkc2JxTGRIY0JHbjlRcWl2SmZicmpT?=
 =?utf-8?B?MGk2SS9oYTZ1VEEyTUQwNkwxMWlPNFROZEgzQzBPYXUvWnZvOE52bDExK1hp?=
 =?utf-8?B?bWVtY3ZlN1puMGg5UkQxcmhFSmdMVktlMTdyeVBGb2lSNzBqamEvR0hOaW9p?=
 =?utf-8?B?WDN2Sk4vT2VYNXRYcGd4b0JnUWpjRS9uekpNUHIyaUFjNEhtWjFIYmE0Q3Rr?=
 =?utf-8?B?V1pxckhiVlV0M29pcFNUYTkxdExMck9ZYzBQUS93YXJJUUNaQ1JWTzVqZzdp?=
 =?utf-8?B?ZVFJSyt4VnZTTDdMQnJLVnY0Q0lTWjhkS2VyblJQeGJ3U3pLb0xMSHlYbFJk?=
 =?utf-8?B?djhla0VSc1VyYWcwM3hWMm9RYXF0cmF1cjV1Y0ErU3QxampaK2N1aHBpckZD?=
 =?utf-8?B?UHl2N1Q3alJzWkNKVVNFNmd0Tk43SGV6aXhXSklxZlg1aVdjejJyOWV2YUdW?=
 =?utf-8?B?WHc1dk9tc0hvNHl6RmxIdEJITk1uNHh2eTIrYStiTVhRczlybXBWQnJMR2tH?=
 =?utf-8?B?cDlvYUcxOCtKSml3RzlxWWxDTFhDa1dUUmQwTlV3MGFFL0h4ZmdHM3dpZlFq?=
 =?utf-8?B?TFZmQ2w3K29DbHI3MEpvTzZqSVFoRUFOKzIrdlVualFtRTJiSkExUDZsSTAv?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: e265389e-589a-414c-0998-08db1113e8c6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 18:22:21.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ytK1ajbynVnyV0bvgv/73C3+ow2IDOg9euxMYD4nKsLQhxcNqI6B7zfqJDnVx7W+qPdmsKia9f6/+J0tjWQqd/SmksYxbkt+feuFxaZVaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6648
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 10.09, Rasmus Villemoes wrote:

> I managed to get the whole chain lcdif -> mipi -> bridge -> dp-connector
> to probe with these settings
> 
[...]
> Now hotplug-detect doesn't work with the current sn65dsi86 driver, but
> that's a separate issue; when I boot with a monitor attached, its edid
> is correctly read out. But I still don't get any output, and the monitor
> says "no signal" - my naive attempt (which has worked fine in other
> cases) was to just dd /dev/urandom to /dev/fb0, so I'm clearly missing
> some important step.

No idea if it's important, but in the NXP kernel, there's a

	display-subsystem {
		compatible = "fsl,imx-display-subsystem";
		ports = <&lcdif1_disp>,
			<&lcdif2_disp>,
			<&lcdif3_disp>;
	};

node in imx8mp.dtsi, and when commenting out that node, the graphics
ceases to work, even if all the devices in the lcdif->mipi->bridge chain
actually probes. However, adding a corresponding node in mainline, which
does have a driver for that "fsl,imx-display-subsystem", makes no
difference; with or without that, I do get a /dev/fb0 device and the
whole chain probes, but again the monitor says no signal.

Rasmus

