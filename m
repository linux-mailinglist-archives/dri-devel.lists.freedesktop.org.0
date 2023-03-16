Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767996BDBAB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F50410E0DB;
	Thu, 16 Mar 2023 22:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0AB10E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 22:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6yTIkxfyzAh+WMUnUlsV5Th5B+ApuIb8XQYOUOuLjjlwrNYcbHqL/4RHQFMqNJlkJmIu6P4owz1MQFG4UpannhznqRwVyGazQFfQcMsH9qTHcQ5VGjc7JQ9aIhAonztk5Pxar+rL8y2jUuVBFfkvWUUwMaEj7+ns2E4w0b+ACB1c5PFuN0mOw/k30Y4K2bKKpzg7a3/ZNkil6niOBkqUbVZ7LKxi0lNFpmSiRB0TbiUHHAjtP8YsX5KaNnnA3pdrtkiyP21dcyPMfpvw/hAZ9hASy11iuzL0BzNKCcovS9U2f8ZJUMsoKUYKEMtemUxzFnHMsa6ZxrBZWpNy4b+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMRQRmgClOAcAoQqPKdoS+t5jSS7Idul7pXfJA1BgT4=;
 b=WjsdAZ37DHnV1FDbhKErAMkeUJ22V9pS8nZJdtDwXxNxIvTbJWpNVewCNOUcbkS6dSsjQPJ/mvKHk0zppCxLtWaKP6owuSXbmdMXOqkMInnfRnQt1/CqvHAsG23gR+pplQ29j2cEd3Tx3js/b7AMVgpfROng5ufUCAagUQGYJmo1zJfkWWNv65XpUzIa11XMITDUzcHdIBYt5LkXaAEAYKeRntKbo34/82yWeMsrZHXX0pWzSuyKrD3f1q5QzPOmY8qKQQqU2uQi1ewmuYXEtz/WsRESCrVnEF1oePhdKp+GpEQNVf6craE2oupZbGELDmQ1yBNk6mS381JJU57u3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMRQRmgClOAcAoQqPKdoS+t5jSS7Idul7pXfJA1BgT4=;
 b=nw1Nzfqhiwb0Rg2R4X16PuID+cTcnkJMX5clwVFG8vEww77km4mxrtrUlNFvy0tdzH4lkVsNhs0VzQXCbfObL0UiUl8/z4ixNDhq9ZUtqdFTadlN2J2y4dKs7Ew6ijxBpMbFT/xVIlJmsDHRDfxeSCFW8vHlbRxUA0XlXzfWbpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9460.eurprd08.prod.outlook.com (2603:10a6:102:316::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 22:29:56 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 22:29:56 +0000
Message-ID: <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
Date: Thu, 16 Mar 2023 23:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
To: Rob Herring <robh@kernel.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230316215735.GA3940832-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0184.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::19) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f601704-4a95-43dd-9667-08db266df834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCZKK/zeYiRBZgEaNfu+LqrXqU+AOM5/zBsy0IV14+xfiGfIofKNWxu3Z4OEWZf1wdEhZoucoYraCKURhCIG28/Q2OTcBdHpo7rcrfGaeV3rDCyuKlF9UatfXX5+OV3rINLxMiigVwFHv5+p9f7J55NFUVpVzuYijmCuNyPbVjYQHncQzvVmC5GYk1y6qxgxngn/cMzHFH5oPbVju6+7qLBOHZpO5tOGQtAnKFCjC+sBDywGHBjdQfXTsMqNAw1WrPlHrARZAr6nigktiooOadPRCxV+qlAiMpi8AmrgegjV+CNpdoqezMpWwNETOLqEMZSCbl3vyBbU159M/4gK2Na959s4v3d2+NcmQqCtbzZG9PySUZPS9e2xXEWfXk4YoM6knfQgSOAU1Ahnkb2UERNpqNKtYDjt4DLmZNyZdAvFt5Pc/zXZwVPRh/Z1PMNWz2gUJT/YmM4oBFQAWCyHYjjlFXT+R4gv4Q5WKNA2pymU8pUrwezmV7ZCLIc/IVgBTX+6Nf0NMSQPwtqQjTXPAbbYNVMZlEcRKYQVxA9GudA5iNaopwey038oeepLqlp5cDshx/A3AzVVgeG+likbMTAci1oDOBdoatbZUnV+dhHvGDJVl5iFBoLBKvwt/lKKTaEwJxM1+lC1gXTz5+ujJcEKMWfJFuElQ0fCwmJ4tmI2QYQghpUYYNOhso8twgUa5mgO3ZLAFfhutoNDnAaTfhWTovwWFhSH5764Y0U1Csw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39850400004)(366004)(136003)(396003)(346002)(451199018)(6666004)(38100700002)(54906003)(6636002)(110136005)(31696002)(316002)(478600001)(83380400001)(86362001)(66556008)(66476007)(4326008)(8676002)(66946007)(41300700001)(7416002)(8936002)(36756003)(6486002)(5660300002)(2616005)(31686004)(2906002)(186003)(44832011)(6512007)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky8xbkh1c3dQMElDdVdwaEdSUlpKTnRORUNTRERZK3V0OXhoNUdHalk1bXF1?=
 =?utf-8?B?SjQ4TVh4L1FUVThQT2QvdUpXelJQWDJYclFydUt3MVgwOXFyTnRqVDU3bWNM?=
 =?utf-8?B?QWRTSmRvTzNaalFzZnd6VnBDWmNyMklveGJiWEMrV2paYjNQRVVRcy9MUzBK?=
 =?utf-8?B?MGw1UEtDWG1VZ1FlMVJhZ2cwMURWZ1FHbDJ0UHY5LzZjNUVRMFp5UkxhbnF5?=
 =?utf-8?B?SzhGT1Q3Qy80QWNXOW1JNkVpd1h2SStReit4dW92Y2YzUzhiRHNwMncwSDdT?=
 =?utf-8?B?clZUTmllcDlZdnJCakF2QjZZWVR2QkxGdisyTk1tVEs4dnNQbnA1d3hZblBE?=
 =?utf-8?B?NjJaRjVraTQwb0lTb25IaGI4YkZ4WTNvR1FjMkxGbWtSWEppUmR2aElrVXBJ?=
 =?utf-8?B?azZJQ3BXWFRpb1dLMlFDWlJrSGVKTC9tOVZjdFJDRXlFYUsxL0JZYUtSSUl3?=
 =?utf-8?B?dHRFN1BzS3cwZlZGanlPRXEyK2hRdVk4T1l0eEFjak5kY3U0MGNEdk5yRUhn?=
 =?utf-8?B?QmtlZ01wS2svcDBnN3FDWEtiTEtJd2xGWFZhUGlMTHJ4ZTlPWDcvMExGL2lD?=
 =?utf-8?B?VlE2TUJWdktqalA4emtuUzFKVUZLaGpYbEx6OVFwdnZvMEhZR1lVYktPWUJG?=
 =?utf-8?B?bHUvU1lWV3BtbWU3dmdJdXVoZUs1QnhwcG1tai8wT3dGN1BibTczVzNpV3NC?=
 =?utf-8?B?Zmd6dmpNemJtVkdYMHhJRHdiNGJiN1lDaU9mQnFuWlk5OVorTXd6aUFHNW9y?=
 =?utf-8?B?SWY5NDE4cUM2UUxObUI1dFc0djZ1emtxRHoyeWZoSGh4VS9oQlU3YnZGQkhq?=
 =?utf-8?B?R1dPYWxyUEJtd25TWWxWNkQxQnkwRW1FckxlVUc1OE5nOEpBVXNZdVdmMDNK?=
 =?utf-8?B?cG1pQTkrNjVyTGNkZlF2TkEweXY0RVlydHpaQlJIY2ErK29NOHE5WFdmekE1?=
 =?utf-8?B?eFVMOEZZaUV4WDRyMEszTHRZSThXTE43QzRPdzFvRWxjZTdKNnRDRjFadkhH?=
 =?utf-8?B?VTlOVExNNG93SkZZTVlCQzl2eUlvSlJXbVBscTd1aDMvZjhzSnhuV2k5ZFNx?=
 =?utf-8?B?Tnh5SmNrRVZJcWt4YlRLdXd6U3UycVRVeWM4NHpTb0tCYkcyRENJWk0xMUNE?=
 =?utf-8?B?RHM3VVNnTWRrTlZLZ2d5MlRGamZVcitjUVhJVlV4SmVYTmsrOXlMbTcyaTNn?=
 =?utf-8?B?NVpScW1SZ3lEZWlNL3E1bHFIY0dTUTdxZm5yK2xyYWlYTk5pZSt0ZHgvUzV0?=
 =?utf-8?B?Q2JDYm51SDl5b29pTjVoQnFadDdVQnJVZmtIUFZFTjFxc3BHVWIzN0R6QUE0?=
 =?utf-8?B?NXNEcVYvYVhrOW5yeDhhTVhpNUZlQUlQZFRiMWJzQ3VxN0ZVTHJHWGplZm5B?=
 =?utf-8?B?NUVNL1JnWG1sbnk3Q3FVb1dnSE5xUm9sVzBIbXhreVUrQUIvNnIxSW5DUit1?=
 =?utf-8?B?TytEaTdHOXNMQ3ZWbjhFdWtva3NmdlRDMHNtZXNDQkZCaFlEcmxiWXU1dkRR?=
 =?utf-8?B?UC9IOFo0WE8rYVhTeU5CT2F4c3dJbTBQVnREc0J4WUJnNHV2eHNxWDR4bEpF?=
 =?utf-8?B?VC9jRjQrM2xoQ1VxQ3kvdi9TQ2tvWUxuNHZjSmRTVDNEWGN5Zi9kc0crRkda?=
 =?utf-8?B?T1g0dSs1SXJqYmV0LzRHVEpMd2VlRUVacjM3K3dPSjYwYnBrK1U0MExZeSt6?=
 =?utf-8?B?YVZPTm45OWt6TnZ1YUJQYktvRmM5MFJ1L3JINHcrcWg1bjFOVnBNcWY1TTVM?=
 =?utf-8?B?SnVoam5MM0FVWTFuNGVnVnFFYUJzYlNYQVgyZmJSZ3dIelZTTE8xeFZMU1JE?=
 =?utf-8?B?dUozQTR1aVBpMDJVUk9iZWhoaGRWT0hzRHRWVnVmTE13VVljd1FwbTB6Zk9K?=
 =?utf-8?B?RnZTKzRZK2g0cGJ1NW5MWktDV0hlYS8ySHRXR1cwNXVCVzMrdW1hT2k3UTN6?=
 =?utf-8?B?WWNOaVNWRUhOSytTV0RoWGR3dlVscHY1M0ZINzJmbEEzT2FkaVViMmdPWHk2?=
 =?utf-8?B?ZGlFaFhTaG5lM0prTFpQZWI0cTlOTnRVd0pYUFNQYXhPamtjbXp5OTVadTZG?=
 =?utf-8?B?aFJSTlc5cDdjMDdWOG1WdG54K2lNVU9YcVNHTXB6Y3VNZHozSG1oVXN1VVpZ?=
 =?utf-8?B?K3JxanltVFlGNjRMMTdMcEdSQ1VTMURTZDF6N0o2NDB1NFlEWjVzUHkrSE1s?=
 =?utf-8?B?M2xicGdIaXovdEJKdWZad0w2SmZWQnNESTdrNGNFQVFoSXNtSmtCZU9nc0Yw?=
 =?utf-8?Q?gjXLIEd2lW+AM9ClUTfGg2e0Fo7rkIrzolwhDX/CVE=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f601704-4a95-43dd-9667-08db266df834
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 22:29:56.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSW/DLxbgybNSXK0S/J1LoierR7fyJVu6bH48hxp9wefQeWQbGtqLqiQbuPUntK8BDzUXKFH31I7tJ6hp86+icrrUq0bLzkXVCz6smwQExM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9460
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 3/16/23 22:57, Rob Herring wrote:
> On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
>> The sitronix-st7789v driver now considers the panel-timing property.
> 
> I read the patch for that and still don't know 'why'. Commit messages 
> should answer why.
> 
>> Add the property to the documentation.
> 
> We generally don't put timings in DT for panels. Why is this one 
> special?

For now, having the timings in the device tree allows for setting the
hsync/vsync/de polarity.

As a next step, we aim to implement the partial mode feature of this
panel. It is possible to use only a certain region of the panel, which
is helpful e.g., when a part of the panel is occluded and should not be
considered by DRM. We thought that this could be specified as timing in DT.

(The hactive and vactive properties serve as dimensions of this certain
region, of course. We still need to specify somehow the position of the
region. Maybe with additional properties hactive-start and vactive-start?)

What do you think about that?

Thanks and best regards,
Michael

> 
>>
>> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
>> ---
>>  .../display/panel/sitronix,st7789v.yaml         | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
>> index ed942cd3620f..8810f123dedf 100644
>> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
>> @@ -21,6 +21,7 @@ properties:
>>    reset-gpios: true
>>    power-supply: true
>>    backlight: true
>> +  panel-timing: true
>>    port: true
>>    rotation: true
>>  
>> @@ -54,6 +55,22 @@ examples:
>>              spi-cpol;
>>              spi-cpha;
>>  
>> +            panel-timing {
>> +                clock-frequency = <7000000>;
>> +                hactive = <240>;
>> +                vactive = <320>;
>> +                hfront-porch = <38>;
>> +                hback-porch = <10>;
>> +                hsync-len = <10>;
>> +                vfront-porch = <8>;
>> +                vback-porch = <4>;
>> +                vsync-len = <4>;
>> +                hsync-active = <1>;
>> +                vsync-active = <1>;
>> +                de-active = <1>;
>> +                pixelclk-active = <1>;
>> +            };
>> +
>>              port {
>>                  panel_input: endpoint {
>>                      remote-endpoint = <&tcon0_out_panel>;
>> -- 
>> 2.37.2
>>
