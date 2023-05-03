Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB96F5AC1
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5C210E2F0;
	Wed,  3 May 2023 15:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::723])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A57410E2F0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxMae+4iaM/aNeZ9/ez2IHSdQRas/bMZ7m5lrW/h5VHPUwUY+j/Cj4iNtqr/7TEu4wg5k/4nMHT/Fqv8SnlTGUFmzQi6XWK1IvcCpJFEkmgTLWu8pSik7N4epSv+LnQHV8LDeY7DUVc2o8MHCxhSeT5rrYK05pg7oIHKHIh6ROU3MSQRBbL9MiWWFwZTNbM6Xs70zYrCQSJAZkAdNfOIwQQlwX36hnxfianmAc82+I+RsQs759FVoAd8Dk6x98KTLEG2Fo/9asF7GG/H9SNhN9acI99vQlaiMkpuxJ6PlP6bX0NEoh44UlqULEwuICBD4C+RBzNVfU+bIJrSFb2xkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K6T34yq9BxC626P7+XAqPI3REIPvOGDR3i0dC+McxU=;
 b=mNz9Rgdnrvw9uJ0hZQur9GnrnsPfePxdUnxvCx3ORgQ20Zcq8CGY5T2f4flW7lTkw00pwQ9NSbGLjLVjTCS0a6wMXM3pNaPtxqgoGha5tAJiy2/YlWZJzicIcXM7JvB9dMw8XnqUJOEPFxsFWwoM0Qz7Py9XY5+8ft8UcfsqsO1/fcZvBCrpAoWpq3eEtErD41Q4CjAlj+P+NfISXM2p2YsaJnOKJ+TLETA+50MLBONNqw6jcejYFWzT7fHDH7MDZuyfSAHduMASQZlojqeVsV+1/KFoRQoi3HbKAW1j9Bl1/aBZ39eYv6P+zF5CU6IJqT2cHRUIPV/yhu/UmRUwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K6T34yq9BxC626P7+XAqPI3REIPvOGDR3i0dC+McxU=;
 b=TzN95oLL+CIh2vLHXSGwL1wJcSmaKFu15O3XavBmLLUMW7JH/AQrLgqmd7idSHFDuZ9cbkchqY4YRfh1mUBt5Gy7pf/E1Ae1I4pUpofzJl5vqYFIaMDRRCR+QmmzamYJ2ODwQhMpoR3UsNdS6F+N3frpjOfrEeWmAYDCvF2g+Cs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3487.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:17:08 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a%2]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:17:08 +0000
Message-ID: <6824d9a8-561f-70ce-fc7c-f74132191985@kontron.de>
Date: Wed, 3 May 2023 17:17:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 1/7] drm: bridge: samsung-dsim: fix blanking packet
 size calculation
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-2-aford173@gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230502010759.17282-2-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0093.eurprd07.prod.outlook.com
 (2603:10a6:207:6::27) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3487:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f40cbf7-e51e-494a-52b8-08db4be97618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: naOdI7GqTJhhjt1CQWkLF3DDbItWtJRGZ6iod6JdzJk6+eWRXLvBQUWXu++Qw9EFwG/9U+PtznnGKEj8YaAqLuF2Vy1PjZCzk0YhIQROuQNPQCJpjX+JUEjjzWER6kgEvViNj/dbYVJ9kU7Q9tUa+qYO3Eucx6cPIA6vPi4p2ZVQxyR5pBN4idp7+eLfPz9P6PWdiegrBdQ4i1K+nnXV52PwEDM6XZSHrlL+MlIsv9h4sSEY4tDu9ft8SqhQiGeMl47MV1LDEsOaYI+WWMx6CoVcTDJ6Rquj92FhhFvAVRG2RkncTXYNa9OSe0C4Ajmzf56Cff3R8zRsx2O0g5dNUcA5QQEY1H0RQEl6dhUyKfNQ4C27k2aDJsTg8W3sRXgC2/G5khaFBPV/qiQFmAqLZiav9Kzk1Y9MsAr15fL1BjdOvsojszkxl8wlNiPztgMw5pGnhXoY2W8RR/2vlMv4EC6R3I3FAsVurPgdkGJujCzyD8Vg/pf4sck+KvkIDY9cHJYrNqpHnRJikCMWJ0V4URvqemtZOgmk/RTL0iqJVETPt7sszYNojccUq6CV+MX+lxM5iN/zAgMxf6qCyJSBp7nr4IwyBBR+3srmpd7lJwVngb01pWgSwaDRbwyxno2+19SeRylt6hJ55JFcIAGBRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(38100700002)(4744005)(86362001)(316002)(2906002)(36756003)(7416002)(44832011)(31686004)(8936002)(83380400001)(8676002)(41300700001)(31696002)(5660300002)(2616005)(4326008)(6512007)(26005)(6506007)(66946007)(186003)(66476007)(53546011)(6666004)(478600001)(6486002)(66556008)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXVMYmxZOHY4MjVPLzJjcUIxTXJGc3FWTU1jTEZZanpsNjIzRjVhcEk4UFF6?=
 =?utf-8?B?RkVhNHAzSW9KTTlpcjBlLzdnNjlrSHg1cU1TdHJPMXRVc0wvZ1RJZy9IYnov?=
 =?utf-8?B?amF0WHF3SFozaGdsRFdjZFJZdWo3L2V4a0tDcE01Z2VFOGNlQTFCbVBCUnpx?=
 =?utf-8?B?dEZWd1UwajlNUjBXVDNqdnNJa2E0OE90QjdvWTdnTzlXMkJYWTZpWERldjFs?=
 =?utf-8?B?VEVzMy9zUjdHZmZiakl1SmVJN2ttbnVXMGpRWFB5M2dQdHErSVFNbFRwQmpu?=
 =?utf-8?B?UDhWaGlsUzhvQjQwL0NWTG5PU1REb0JKa1U0SDQ0VDhxUUtZQll0QXBUOFE4?=
 =?utf-8?B?bW9iTDVDdzVUK1pnYmVsY1pEWG1sSFpRNFVTVE9oT2ZkZ1EyRW4wcDE3eDUw?=
 =?utf-8?B?RHJZOUpIUXNwYTZnMkZ2NDNmT3d0QS8wZzRxanV4SE53d3ZlQTF5NlVUVmc3?=
 =?utf-8?B?K2QxclkwdUNFeFhSbEd2Y1pGb1lIZS82a1ROZ05iL0VXd2dXN3FYdjJVRWlT?=
 =?utf-8?B?NVRWN0N2eWhMakNSN1V5bVhTcEdlWDRrK0JSeTJzMWJSeklIcFQxSGdiK0ta?=
 =?utf-8?B?c3c2aE5XajJJcksyUXR5NTdNS0MwYndLNkZxMENxVjl0dEsrREVjaGtRRXFj?=
 =?utf-8?B?NkJmNTF0RHAwRlBjQitVemlQZGwvQXBaaWNMZSszaC8zcHJVUjl2bGpySFBs?=
 =?utf-8?B?Y3NtYTBXcUUzUk80YXBTTGgvQWlzenl5R3BVbytJL3NxVlVzNjNJdDV1U3RU?=
 =?utf-8?B?T2tmaUxYa0lRalVsMlRBWDhQQXZuSTNYSGlSOVFkNWprcTlnalBCS1F3MjJU?=
 =?utf-8?B?L1lvQ0lnZENtSGpwT2p0TDcwU2Ryd0IycmowdW1NWkFuWS9UWFJ2Nnh0blNn?=
 =?utf-8?B?cmpzVmoxbHhNTVdqcXA1R2hnYjZoZnRLMjZqeHlzQ3ZMTWFwWXI2UUdrMWRE?=
 =?utf-8?B?aTRKOTVDbW1JVnZRWGt1S2FWRkwrSEpWSnJXYnRveEFEUURSeWdoNkM4bzBN?=
 =?utf-8?B?cTdSckw0emtkSHBLbG9SQzZWYTVmM1I5WEFIeDB2OWdkdGM0ZFVleEJCZWdT?=
 =?utf-8?B?Ukltamd2eXd6b0VQUkVWQ2hzYkRTeXBNeHU4NHhpSVFZc0dNdk5IcDlib3Fw?=
 =?utf-8?B?bVJGZG1TM0hFS3pJdFJZUW5XOVEwOTgxUkNRSmZQRUF4RjVLTE9DZTBWMUYr?=
 =?utf-8?B?MmFaa3lJSWJxSjZoT3JjRVIvWE5LNFhVNWt5d0ZGWk4wYndTL0d0K3dKQjBq?=
 =?utf-8?B?U2t6YXZHRmlWYzdjakRxYlprTUEyWVpYQUgrbDV3UmoxaDF2aHhqMWg4S1ZN?=
 =?utf-8?B?N2kxYjhQSTY5dXhrL3NUYjIwcExBL3NldEM2MUtLZDlzZUVSZjF6QmtJMWhi?=
 =?utf-8?B?MVp1eWNaLzA0cmJmM2UzcVJ0YTE0SVdzU1MxWDRuclgxWi9sUVo0OENuL2tS?=
 =?utf-8?B?Y2h2QVZEWkRYc0tzSjdSQ1ZZNWdtNHBMY0IydnV2cm1wMU5GM04xQ0FRdzFI?=
 =?utf-8?B?ZzNBYWZLdiszZzNITGVwVVJZaTUxSEVNYmtsSjg3OWRKUmxNMXRNRkdjNHc1?=
 =?utf-8?B?cWx2WG9STVFNYjRicVdtd3crT0xxbzlYRnVUTTVRTzJQNXQ1UjRhYW1mTkFo?=
 =?utf-8?B?WHZ2aW9BaXRmWUZhUDNQY2sxMDBWYWt5UWpaTGowK2tPUVZ6elA0aTRRWjlz?=
 =?utf-8?B?bTRTbG1OVmd6TXUzcjhIMHRvQzEzekVYUmFzMk1Kd2ZwNFdmTS8xRktoVTgz?=
 =?utf-8?B?TmQ1YzduTGx6Tm1xNHlvNnBRVXkvNm1Ea3ZSZ3BKVzFwVThMaXEvYnpCckFm?=
 =?utf-8?B?Y3phbEVhTkFoVDhRMmZvczVaV05SR0pCU0JBbXdxTHloZndERDd1YlBiaU9C?=
 =?utf-8?B?aGwxNEJ1K0d5bDJkYnEzSlVhRDh4NGMxWHhCR3lnUFpWeUdvbVd4WFRBRlNB?=
 =?utf-8?B?cTVhZHBTNkFTWVBJODVsSkdEaGYreXVlekxRWXNGdWMyUjIrcngweU1Mempl?=
 =?utf-8?B?MEN1Ny9iZjFneEpHT1lHbTVocm9ESVc1M3hVQlNwSEJUd1dhR09rSmJibVox?=
 =?utf-8?B?MHgxWDhXdjdmYk1TaEpMS3d1ZlVTbVVHUzFRekppVVhUd1pFb0hMZFRQZUpy?=
 =?utf-8?B?MnBKWk5GZyt4dFM4aHIwckMrVFg0akNvazJSYTFlbU9ibnlBaXJGVEpmeWpx?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f40cbf7-e51e-494a-52b8-08db4be97618
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:17:08.5596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STw7cAELyIQ+A115j+72PRmuQ84aHFegkYE6m1S023aY6KI9QHUVfuiLD4AqAXm4wC10yDxoggskypvpQJl6jsugKyyfGMV7IaCwViVkczY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3487
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.23 03:07, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> Scale the blanking packet sizes to match the ratio between HS clock
> and DPI interface clock. The controller seems to do internal scaling
> to the number of active lanes, so we don't take those into account.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
