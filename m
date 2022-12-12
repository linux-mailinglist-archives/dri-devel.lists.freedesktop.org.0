Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7B649EA8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 13:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECB310E1D2;
	Mon, 12 Dec 2022 12:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2138.outbound.protection.outlook.com [40.107.103.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9510E1D2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 12:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edxb3rB1dsftjRXHxOAaRvnjg5lLJqAay3ibtD45XsQbBy1iwjbCt/Y3y44Balvqb790sT430Bco3UiSDhuvrZFJJlO3LE9x9S8kEFznmOiVxYGu9ija2Cgoz3AHtGiw7ce6BSpeOWx6hQE9h4wGTDg8vuq1j2dPebiHw76EG9pYMTb30udxVQnTp/oJ94+v22CgCjHtha+zfLWGU75qlbYya0w2FwtlpqGuYRtsrMsZhDna41AUp2b9juXEy4zlAc6BWJPy/MXtUzJjaWXv4hrqpjPZcytsFWc+VRTkAj8ykfpFw5aQMVtTrfV25MpGL4ExhCRv9tEQNXadCWiIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yi30gRKiDYDkgWQqWRKXHpnqZW4B4Olb6SnDDyZheiE=;
 b=itMNdbo2qH4VjbECtB2WCeQdyPQToch4fQnV8KyH5Er+YQuwixNBXOnvvOe4yStWOjCa7ftX3VOTC8xHn0mjFqPI0OlzazYhfFaF2qP920Y202ec3VI9urAWw8n53k7Oy3TUIcLWTAnI4KuhxRdOhJf4LJuZELQBqNUygYQAaowkJ/Ku5y3wBn9G8sUGQvD8w8tgG5w0EWK4cva/uOt9346Vtn1W5Jk3MMcE1UWAUnugJL+1HmH30Uc90d0CRByr/vSxbIiPb68aCScDu58sVOHLhIgctGJrejdsUFJ1mfksluYTROh10+pZiQ/cHcDtPfYkN9xqVu2FI501qUlMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yi30gRKiDYDkgWQqWRKXHpnqZW4B4Olb6SnDDyZheiE=;
 b=DYm1OkESF00ii1gh6yKLUScyBNcWdiwTYx7rKBw2w+H0XwCKm/aoYtmb63rZVGXP44vDUqWtdgGW9abgc3mlZCmOcfG1LOWvIsgcTbvyRSnb/nID5gpz0mQ1zZG0Tn/fYvQV+LubMwVi9mLW+60W4xv656NXWhyN5HZu2BAAE6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB6691.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 12:29:40 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 12:29:40 +0000
Message-ID: <8dc209df-8b69-d4a5-a056-b5aacdf41a14@kontron.de>
Date: Mon, 12 Dec 2022 13:29:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <45157029.fMDQidcC6G@steina-w> <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
 <2735716.BEx9A2HvPv@steina-w> <c6f2cc52-41c6-028f-4d3f-e8a4d5d73dcd@denx.de>
 <9f8b1c17-0bc5-ae99-b7b1-cb2f52f9310d@kontron.de>
 <5f61cc70-9501-ee4e-010f-5188f87e3ef1@linaro.org>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <5f61cc70-9501-ee4e-010f-5188f87e3ef1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: b64ab946-a2f5-4681-d593-08dadc3c8a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDb80Tih72nui3MEXUiWpJYWepyBvj1FydhdLSTQzI0lB7iVYcKkc1aUr0J3iiBsoQRqDBHC3Fi2feqyS0aUVJTQoiTGkmlUIEFrUjxMle6uXJg4Kef6DK5oEfLtrPskR7Iac+sEJ9AWtMUjKUx5VlGPbozNciH5yfz9dO+wdmx+5/u1ttEkj+Ac20mUyZ3XGlfHzRJ4smGMWKcvT+PrnfO0pr/4Ojwjg79ntNYMQELmzkjEDZc9Xdes6q6TPRCHbdoNCBmfYHj9T6HArB/W30t+SALvwbueuTpqDw1CIj+bKWiJi5wm4K6OrkbJxgOEEa/Z53SOtPzBew8QwWY/xVge5EQV1hFx72d/qvBpiyLBWnpkV2c8lxYzep1KbScRvvUkk6SaTPqel9mM+KLqRYubhK0OnzxA1rJswVfHWzPNhfS7rD84sk0VsqQwt4hXs0Dc1YZLxHFTfsJObRh+TldgwyiGEu6d5ZHCcge4bJGI7HOkGgQRzQSFyzx6MaTtEmuLIxxGbnomMYpkpcP0NT1+FuKZxNo1VHNSoxtFOs4BTy1uvMpIJuZamooabhxHPSt8vnNjpwyprrtdQAvAs1SJAqUKyEteeIbnOVAtor+jin18x2V3he99GcDLchdvHo9/Qvt95miZDRx9gvYXOv6eOJ5GlmY1g6tgCGgfjkrZF2QLLP6mQKAnoRt+QBkROOHmzNzyuVo5xRZlPbZns/HP81+AX+wj0xNnrq66aS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(36756003)(316002)(53546011)(6512007)(110136005)(186003)(6486002)(6666004)(54906003)(6506007)(31696002)(86362001)(66946007)(66476007)(38100700002)(66556008)(4326008)(8676002)(31686004)(2616005)(478600001)(41300700001)(5660300002)(2906002)(44832011)(7416002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3ZRSjk5RW0yZFB6M21mNmZaTzR0TExkbVBOblZzS1F4OGZXMGYvcFJVVnk0?=
 =?utf-8?B?QVJGWktPMUpDdWpnRktMZUh5dHpmb0d0WnlsUnlTRVVNZW95cVVSTldiRUVv?=
 =?utf-8?B?dU9Wb0NPejhhcEZDNjhQeHdiT3Q0NzBxamxIWEt6djRkTnliZnFkdm4rSWV1?=
 =?utf-8?B?LzlBZkdpVTNwUXBTNldtTHhaYnBnZEMzbXd1N1J3ZDZvdXpBWEFKRWRYYm5q?=
 =?utf-8?B?NTZ5dXJ1TXhHNGNjenI0WEd6WFpWYUlNMlpadGdQRisrMlZabWNsTFU2SjhW?=
 =?utf-8?B?TU9ieVdtVFUzUXlYcjUvVUYxMG51TndyejBmNFJzZGF3OEFuQkV4Wkxpd1h6?=
 =?utf-8?B?Z25DMlg3RXlRb0VIY015TWYvSmdOcEoxSkZiVjFFS0tVRVAwWTZCcVVzVXFV?=
 =?utf-8?B?WXhmZjFBNXJRTjhTeVZEQWtDdm1PUVI2c0xwOVZubzAxV1l6aTNqY1ZyRWdL?=
 =?utf-8?B?N2NXU2pKTWY0TVA0cm4wYm5jdWp5MnJ4SjdCSjBabXhTYmdtYllEQWFaNGlp?=
 =?utf-8?B?K1FNTHNZWnVWdWFIdXBWb2w5VndqUGlpYytTcTMwd1FEWFdwM1NXbmhoYmxK?=
 =?utf-8?B?M0puYkRMVzc0TlZ2azhZNXUxUkcwcytUajV3MnU0aXdCRzRBbk9mYVAwTGVj?=
 =?utf-8?B?WDIxWitkMXVBcCtTZlFuOVZXY3hOaHVCdDZkNURqRlpzMjN1ZXY3RzJ1MWM5?=
 =?utf-8?B?NWdhNGhseHBvaEt2ZlF4MkZLQVo0NEEzSnovUFN3K3FZZGhnUi9HbDRDTlVF?=
 =?utf-8?B?dC9BRGNaeXUraFVHMElPM2FYcHN1c1BYTnM4NklzZk5WdDVZYUZvNTB6ZkJX?=
 =?utf-8?B?Y3ZaNGM4MUhNZWVUekx4MHNWK1BWWUNIY2laTURzSW5tTHVsc0JTYlViU2Nw?=
 =?utf-8?B?YWNtNjVXUVpNQUhqbEV3Uk1yS3hYVEdZKzh2TnFic3VpRUZrS3Vyak90TWxj?=
 =?utf-8?B?SGxaaE0zbmtHQUp5eitpUzREZzRyeS82R0tBZnV4WlJSdUVST3B3QmNwZk9R?=
 =?utf-8?B?NnQvWXNYUE04YjJoSHdJdVN1OFFVNlp6c0xVZEFJdmNlSmM3OXphTWlVcWRF?=
 =?utf-8?B?T0RQN0ZSWXpMOEhpdGZ6QVl0QTUxVkpyV3pKeDgxdVZUVXh3a25sVzdWd09B?=
 =?utf-8?B?MWxHU3Urc2tHRjhxSjlTb0JwS3NCVURibHRxWG14ZUxBQlZtR0JpQS9WekJu?=
 =?utf-8?B?T2Zncms0ZzBZbXVKcWFSb3JYNTUyVitWQ2lBYmRMQlZJbThOaHJ4NE9xb01o?=
 =?utf-8?B?SGJXdm5wREJ4R3JMbTQzSnFjT1VWNDVrT0x5b1RYWTQ2NGVJUlJ6eWdFTGJT?=
 =?utf-8?B?TFVnSS9uL2lhSkQ2VXozU09SNENxeEJFL2NTQUFrQ0tsdUlRaWw3anpWMW5t?=
 =?utf-8?B?dDdpZkEvS1YvT1g0cWkzbmtia3NRclpNdXlsYy9SMEE3VDlqZTVzOC9POHhI?=
 =?utf-8?B?SXozZXRCSG4wcXJiYjF3MHhJT3I4dlVqaTFlb1ovZ29mQjZtOEp6WjVoMlUr?=
 =?utf-8?B?Q09DV0toMlhwVTNSR1pKV3lmMzhZOWU1SWhmdk16STUzZnYwWG83K0FyVUlL?=
 =?utf-8?B?dmlzb1JkaWJ4V0tISk16OXErdlRNVnBESGdCajN5WTNJdEQ3OXdUd3dySWdR?=
 =?utf-8?B?WGppWTJoWkQzeU9VVTlicnhYQVRYd2prelYzQjdOWGlYcEt2eUF4enhUN0Jj?=
 =?utf-8?B?ZzNjS2MzaEg1Q1NQR01jbW5qZFNObGVCTVIyVExoVmVRcVVNNTAxOFVWQlJa?=
 =?utf-8?B?YW9PNVBtejhGUTBXc1lnd0N3SEpIWi9mbWVJdGdrYW5DcUhvZmllNGZwK01C?=
 =?utf-8?B?elFOdDllVDZtOGs3cnR4cW9mLzVSL0VPWWI3NFlkSHJwMnBvRFVrajZVb0sx?=
 =?utf-8?B?MG55Tll1OFR2NUgzQzVGclBLMGM4QUNkZ3NpeThteVA3bFVxRk1xdEdqK0JE?=
 =?utf-8?B?ZkMrNTE3bWp4aDVsV0Q4R1dndU40ZmVzM0ZETGNzSi9xQlBNYkFXd3M4eWVh?=
 =?utf-8?B?eVFXRyt0blhxWWhmbmhVM1Z5elk3MjFoR005RlNrREZ4ZkVlUFpIbWlENDhW?=
 =?utf-8?B?ZXdPcHlUK0xCNmlnbTIxcnpzL2hreTlkUi9BS3BmSm14TVpvQnI5TkNodUpl?=
 =?utf-8?B?bkdmbVR5bkxDYldISnYyMXBMRTFWQm1kS0xCN2h5RUIyZXhkVFV5SHBBYmY1?=
 =?utf-8?Q?xbwzkWCBaDIRj6/m7UK/8cbEMPNV1zZUsSTlknbvSLlt?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b64ab946-a2f5-4681-d593-08dadc3c8a08
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 12:29:39.9736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPbbVi/gV4Y8ZmthCLKSKwl5KXMhoR5dS/baLaa1AfUu4hXQipWbIHsSpZqm3jTX9m5MQerhevYh7uPt8OY6ZcqORCF8WyfIRgZ4ZhDDQ5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6691
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.22 10:23, Krzysztof Kozlowski wrote:
> On 12/12/2022 10:09, Frieder Schrempf wrote:
>>>>> This does seem like a hardware bug right there, can you double-check
>>>>> this with the hardware engineer ?
>>>>
>>>> Yep, checked with hardware engineer. An 470nF is attached, together
>>>> with an
>>>> open drain output and only the internal pull-up. So yes ~113ms rising
>>>> time
>>>> until 0.7 x VCC.
>>>
>>> I don't suppose you can have that capacitor reduced or better yet, some
>>> external pull up added, can you ?
>>
>> Actually our HW engineers have implemented a similar RC circuit to
>> provide a hardware delay for the EN signal. I think this is due to a
>> design note in the datasheet (see chapter 7.4.1) and therefore it's
>> probably widely spread.
> 
> If I read section 7.4.1 correctly, it would be enough to just add delay
> Ten=1ms instead of the capacitor, right? And that would be
> device-specific. But if one chooses the capacitor solution, it becomes
> now board specific.

Yes, seems like that's the case.
