Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C564D2FE0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D2A10E9AB;
	Wed,  9 Mar 2022 13:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70095.outbound.protection.outlook.com [40.107.7.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7227310E988
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzP8//iQRvQ+IWY3kD/2+xD38obx85VvWyYI9uJY/FYVDzBwYTDg0s/NdKkzOixYsdobroyEAducHEbqSpGO1GjDLX+lYn8T74tkDEctiZH6rEtMlbsHwEGrPO9oEUYNFHhV1+QbHL4Q4rUK/a59wd3l/t/jx9fRZNza/nLobwyiHy8V3m6k1/+7SLsXRrrlDp4DM3P0l/W3ihwixSPX+JZiAS+7QI7G7GRhtMfJ8J9OxFiRK23WG20Q/FhoNM3Oz4YfLYM7oWzNbIFpSxg9tOw1CU+tI9rpN5k3KWXDyoPBINRZL2lafaWhWEU2E4e5r7WIUwTw/D8J5ZrTbecsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYy1JBgyJ//Z2LnXoX4s8e63d/QybpqMu2UZKZ1KQdU=;
 b=ijZaA+Z4+H/yo8rNpOiKSAuunaQ2GbycuNBxYBYvvT/+cTpFxVHidaWgMXkNs7lRExZO5n2OrxP89ja8JxJR99MKAnMosnBcqbM/HLqptFOmz4byGEyl71YlO9QQHNjKnboc9c9aQLrVo4NnfvF7Cw5dwilBeczi2wMrmxFdf22gibXmp/6zL+5D6+vyF7nw6ZVUYPdxNH3zhsoD3kCO8FH9c5ex9mtyO/3VjaZsLcn9hITscGmXRbpB0bkEJcz/RXxnZ8rhwdZYGbhIZzCkAEIx9QCJE8UeJXY3AqWg40n43ir4H2mRZj6CLUofx9ByqxxZNAd2Rfz25hKWLsecrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYy1JBgyJ//Z2LnXoX4s8e63d/QybpqMu2UZKZ1KQdU=;
 b=dkKXZQPbAQITcj5tIaUo+OeMirn5j7WaFTAvKonb3Z8/2I0quZFv1cFmQqckval5XXU0MaxOtVwanQRJpumzUSuPHrNrPoidUceJglm8F163RfkwLjYSuTSeQCtO53NslEwydsgQQtI69Pf7tn415olWoCSXGP2OSoj9vEyV7sE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by VI1PR10MB3197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 13:24:33 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5ba:3ed1:1acd:b5b7]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5ba:3ed1:1acd:b5b7%3]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 13:24:33 +0000
Message-ID: <c13b6b1e-04b2-b013-7cdd-dbf960808ea5@kontron.de>
Date: Wed, 9 Mar 2022 14:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20220303163654.3381470-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::36) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c04b4b2d-8a0f-4a06-98e9-08da01d025f2
X-MS-TrafficTypeDiagnostic: VI1PR10MB3197:EE_
X-Microsoft-Antispam-PRVS: <VI1PR10MB319730704A42FC43973F30EFE90A9@VI1PR10MB3197.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tS4mIns3pC8DAZ8FSrw9idzMeRmTAeGWS1SQYVD4/dqUydBEA+TFatIuF/WhLJfiwJOLtHL+C0Pf5j92PfI+nYRApNoCRfwmcauHLuiBLNJerVAzHSCuMsZ8N/fhAqQN1A6jNZbUYeULDTrpLdELaOnQ6F5H/4yHky8KmUDyQOGnmC1MW+IS9VBxRF21Meoe4xZgkdDKLf4IbWpzwzqIQ4t0nJ39y8wXdnXhRJwTZLqpkxjRHuOdwh00M+1j0/Ovz25mA/TYS28Uo8svLwDxcvuBBLnoN/ftTxp9OKKoue1y0hPDZSrP4INov1ppP/5LE3SMh8Vl+HOfcR7NgbNLmgbpHmnZBWnStFZyEs9CSPDNKfWG42/8b45KF+Cdj/ZBt4dwWMnapxNgWSCHU32MO6k0mpIcrMvRm/AB0sJ31Hdb/asxYvrP+zNs21CEIkxCMnYM6+PD5Z5HNXA0AQE5zTQi2XOL3HTND+wOxwjq9EHFahBOCnu1RxkVteeGOptY+2fhbf5Vq9ZEtlcv3d0Fqh13NDFUxEgAg05Y8rY7ZGzJMmqnSVYwCuDRlA7dzkyXlN0XuOU0/eVlKzSQzlV+A1/g3qS6kgmLszNoFpHl60XeznTXOkpjpHM/932T2GDQs9cNhgDbvqhEDeg/QcZuAq1gK+72f0Y7Vnm5+bLDzv4bNSgiZGfCgPOCqHo3UXcb9e9QS9nzxtXHGzzKYHqU6S1YE8eF3C3sMqh02r28M2/eG5hm2UKryQyN/mIj0OoxLn3fm6xmXegTMF5Ej6WiQmfP5y0ws9HtFC8S0V3CB7MdG1UniIllwjvj5firhuoRwr0pK1or8/ziY/afAT8MVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6506007)(26005)(2906002)(66476007)(66946007)(66556008)(8676002)(966005)(6486002)(508600001)(4326008)(38100700002)(316002)(86362001)(110136005)(4744005)(83380400001)(186003)(31686004)(44832011)(2616005)(36756003)(7416002)(5660300002)(31696002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFmMlovQ2hzRkNBWDdoVGFtaGlwTGppK2p3WTNwSVh4U0VyM3UzaGRIYnI3?=
 =?utf-8?B?YkNRYkxwTXgvTS9CNm94aG16MGRsTnlTV0tSbkFmTUlIY1BDSU15djh6RnVI?=
 =?utf-8?B?cVk1VTNPY2lKTFZmZ29oekJMZG45dE80SWNMcFVNT2w4cmZTWVVzelo3aVVx?=
 =?utf-8?B?WjJmMzRIOW9VNVdjT0sySWZoRkJ0MkxKZUd5RlhiOEZ0bnYwY3dKdDJhSVlj?=
 =?utf-8?B?S1FWT2RSYTZ0TDBOaXZSTS9hRU4zWW1FaURaWkxwbHpWcFZwSC8yWDZRb3Zl?=
 =?utf-8?B?TDM3QzR6QkoyZVBjWjNPbnF1akphNUpjRkFhbmxMR1JQbnZucUVSR0FPN3VR?=
 =?utf-8?B?cWxKbkY0YVJOYmxaVW1CQ2V3UWIwV3gvMzlUbFdSK3FmRFZPUms4NC9KN09w?=
 =?utf-8?B?V2FqK1VieVRMUWw4SEo5SjR0KzA2T0VyRGU0enpaTTVocDYweVZYMktQWC9U?=
 =?utf-8?B?dDAyeHQwMml1dnNDdkRJYkt3dDRvMXN4akFLVFJFRk5tWi9Bdk5Ta29GRUZl?=
 =?utf-8?B?YTNTYWI3TGZQVGpibFR3eWovcUMvZUhOVURWZ0NLdExkSzhEUG41c3ZwVmdw?=
 =?utf-8?B?VFFUOURUOGJsMmdoV0VxMUtrYWpsWlBLVUNsZkI3NGdUQjBGNzE0SVdNK1hL?=
 =?utf-8?B?RitMTEFUK1NPS0cwYkk1dGhxYTg2ZDhqeU5zZ0taRXkzUTE0ME04N09MYjZz?=
 =?utf-8?B?NnVzSTdKZWRudW5QbGg2SjdLanJKZ09zWUl2V1FSSmN2TkhsMHlBL2UxeVph?=
 =?utf-8?B?VEZIRHBSU0pUNlR0dEVSZVJYbEdrWS84UDYvZHRaTmNEZnhWRlQ0YkM3ZktE?=
 =?utf-8?B?WHNuNmlMTG9QUGduWm5qREpUeXlJNXk3Vk82eEswOVhOQlJKcFJPb2hDaitl?=
 =?utf-8?B?NEJiNVk0Zmp5M094MEhiZ1pNK0hmT2FDRjVvTmgzS2tIclF5TlNqaGRVMHo1?=
 =?utf-8?B?bU9yZUZ2bVR1Z3ZrRXV1Vmo2RWVZT2V2MDVhbDhMbWN1WFduZEl1Q2pQYzNh?=
 =?utf-8?B?dG9hZG0zSURMd01WelN4cnpFcllIMU9WV24rZVlaeldpV1dITEFjcHFZakU0?=
 =?utf-8?B?bzJPdHRjQUpkTkRMNVVreVNoQWl5VnpCUjRRQzNOVkFmc3pJUWoxbFJzdi95?=
 =?utf-8?B?ZUg1V2Fzc0FuVldRMnZHRVdpWlE2a24xNDVPT2FKdGtYcE8yV1BoTDYwK09I?=
 =?utf-8?B?T1VXamFhTTFZK1dTQXQwdFZGZXd0ZktJRTZyampmWllqV0IydXBoc3BNdVk1?=
 =?utf-8?B?M3E3TmYwY3hqWjdHLzh1TXZ0am9CZUhnNnBURHJFUkN5Z3gzQ295VnA5VkRE?=
 =?utf-8?B?TlVnY29zS2lXMlcwWkwvaHVpWUNRUWg5V0xXVFU2VXhQOW1yMmYybmY1YjdD?=
 =?utf-8?B?My9nMDkvVUI1V3pSQXV0OHloYjYvLyt3NUh0L2tSTHBXVnpidEJLVnNBYmUw?=
 =?utf-8?B?cUlZeWtjOHc0RWwzOFhuVVorUGZUN0s2TC9kTXlVdkpiSzE0cGl3Q3JZU1Nk?=
 =?utf-8?B?SzY3VVFVZkJ4S28za2xJeWxqUnc3QVV0VVFsUWs0ZGc2V21KNkpPUXZoMlN3?=
 =?utf-8?B?TUdLaEJXd0cwVEdpMmlmK0pxRTNVWUVSTUF2bi9OdnF1a0xiaVljVk8xWnRr?=
 =?utf-8?B?emgyRDk5WXptTk0zQUpNaTlHUytPVEl4aEh6WFVIMkoxMjZSVHZjekNpSGsx?=
 =?utf-8?B?eVlqdGN5b2xEOU9BRHFrTmZCWVdOVk9MVWNMSUdna3lYSE55L1piK0dsYSt0?=
 =?utf-8?B?dytKYlBlTzZhczY2MlpaZkxxL29SRTk1RzFOSnlhNVMvOG1OMkQreGZ3T1Fi?=
 =?utf-8?B?TjVLaFJ6bXVDWXlKNXp5V1RJTklhekdad3doVXI2UmdlTjJCMjEwRytrQWp1?=
 =?utf-8?B?ZVJHZmd1N0lnckgwOUdmVUpGUjlqekpOb2YrUUo1UlJobUdBK3RXbFM3RFJH?=
 =?utf-8?B?RE5DOFRHTXJGYXFiZHZEUm5KZWFKay9DMnNZSThGRVB2cEh3Sk1IVDQzY3NP?=
 =?utf-8?B?MVFLN1hFY1I2MUxCRk9pRkYvWm1hMko1UjFTblJqbnFzVlBad2JsS3NSTm9k?=
 =?utf-8?B?dFZ2WWxtYjY1SXEzZDNnTVVJbGUrOGdCUEo5VU1idEV6OGR1NHFTd1UwdlBl?=
 =?utf-8?B?RWtrcW9wWjR1QkxIa0J5VUE3TU1VK0x2bmFFMzZPK2FxQmpRVjNldDR0UXY4?=
 =?utf-8?B?Sy9tblFOelBmSVE4akZVVERtbERKVUZpbno5K05qcm56NUpNaldwVDNkRzFW?=
 =?utf-8?Q?b3MVfz0cjw61gfDXBy7f4Y5VzKnkcTPVNA+l1nohlQ=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c04b4b2d-8a0f-4a06-98e9-08da01d025f2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 13:24:32.9233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXRZF9gT62alTvxJ5BlOo2db1E5uYQ+gxuVfDGANuDNUI1XNQKqFDnKbLGIIapOATC7JukNlnWzt2mx4EhckG1y/2B0cUoVd/mIqTwR8jAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3197
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Am 03.03.22 um 17:36 schrieb Jagan Teki:
> Updated series about drm bridge conversion of exynos dsi.
> 
> Previous version can be accessible, here [1].
> 
> Patch 1: tc358764 panel_bridge API
> 
> Patch 2: connector reset
> 
> Patch 3: bridge attach in MIC
> 
> Patch 4: panel_bridge API
> 
> Patch 5: bridge conversion
> 
> Patch 6: atomic functions
> 
> [1] https://patchwork.amarulasolutions.com/cover/1839
> 
> Any inputs?

Thanks for your efforts. I didn't follow the whole history, but I'm
looking forward and hope to see upstream support for the i.MX8MM DSIM in
the not too distant future.

Can you give me a short update about the state of this patchset? Are
there still any major obstacles?

I can't help with testing on Exynos, but if you have the matching
follow-up patches for i.MX8MM support somewhere around I could do some
tests with those on i.MX8MM.

Thanks
Frieder
