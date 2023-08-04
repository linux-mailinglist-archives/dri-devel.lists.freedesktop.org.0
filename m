Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7076FDB4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 11:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B577510E07D;
	Fri,  4 Aug 2023 09:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AD710E6C4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 09:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ0bSgM+LrQ6DlhaFagqfOhVfKVwXZggys2E5EHwKc5pe1c34SUkPuT9aEKKZUDTJriKMpMp0lg8HP4Sr2rBnvyUYGrHItjWSCVzTO4WzLkeX5a8Cu45QmOBkB5qs2zzO/mEYE6HV3//7pOgW9Mh0nx2K+PgH4fMQ2AKbNGNn8kq9nTRI5+IoK2WLNRxhjsa8bDGnbyiW1PSp/cNw5CgTDkQYJ20tO5bpXL7lOd8SdlTrlWXAJcyxYe0NzVfxiNpsiCNf9eW1MtEeP4S2brOt0JOE54GCzTNJ+grkIsJhwpU1ej/+D9lSwu0GpSJFqZqqFjREnH3pONzDMaOfGZHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJjv77+bi1LJusegC2ieGIPyNbRXKlpw7Ubt4k02OJ0=;
 b=XpX1amht9lJygHlN1GRgpHjwH9jCMkavtXFumi7wdeIFUYuLLoumyn2d0sQ36h8dSFVBWs9qXxKiHhyWUQfN5bpkre0VT7gVWaJQJ8NvCyW+6Hc74+y/4H45QeMZOVDSHtQByc5Hwdz1sV2J8b5Ozh/ai2LP+b+RuUB2gTzkH3nYs9qC3d4ET9gKAscCR5ko4MOzsPXef9QkgUFqkD2e8eJVjlqGZOjMjSI9VSVgn4FV/SsEzpxA0qqIWWWOdEc7OZ0OjK3On91JMEJyvSi7BErU1zhX3C+DMKpXpN1zPF15BMnMLleEQxKVJBNExdu/18bCl17C8HWBWIm+nRbArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJjv77+bi1LJusegC2ieGIPyNbRXKlpw7Ubt4k02OJ0=;
 b=ggLk2z5CGYgz50TzVid3KxRnFP8SAYbuEcM7jRLA0nb0s/sWeJAOONXSAEByDEzxkwDdJAcTU18vmhPw31iZq6wkEwhOrWur2Cj9x6aWnbCd6oUWOL1fkL73Z6egWiUauDZPHUURaoMDy7fmg1T9JCrEOsVJkwkAEC0vImdF0uE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 09:45:29 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 09:45:29 +0000
Message-ID: <d173e4fd-29e2-281e-9c43-6f6b81cc62e3@wolfvision.net>
Date: Fri, 4 Aug 2023 11:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] drm/panel: sitronix-st7789v: add support for partial
 mode
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Sebastian Reichel <sre@kernel.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <20230718-feature-lcd-panel-v1-3-e9a85d5374fd@wolfvision.net>
 <422faa68-a741-0cf0-6a90-a9b46424e201@linaro.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <422faa68-a741-0cf0-6a90-a9b46424e201@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::11) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AM7PR08MB5335:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b3e35b-f6da-42b0-039d-08db94cf89b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 838Pf60U2poLx2A5ynLU/ONN9wO069hiRB3VbeZiAcJftYPiP8aw3V8RWtSE47c7rruAJjHkm00caEHa/HbKDahJODISxEoodRCYFjlSKf33ZZ0mTwMjq+0Zf0KKFEMUGBfnEVps3O3eHG2jgf4QXwsCVCXK/piCTsDJc+QbtnceG/+ai3FJhDiCwsIlG/cDHiTFBiwBIQfdgE2ruRN7aHGd7UOJcUKqTwaXJ5QXVLm9NDUTNppkCxLeeFF/EY9uSWNxuO4wdK+TnUnOeNfjNfOd+Lque8e6nHiECRvNdz4m+4BMTuNstYZGz/NsVSf+X7UXPdDTPtK9prSICx+1FIQcf+pIn7rSBzuD2W5EYx/F9ZRAVP4/vt+nxtAj/ti0sBAhWNosdCaKyZ/vd+1ZtyLnn5+JwXkpfezfMhaHiaslqvWmq9ro/1LuMDnYKMs/J0r1X5o+pmygsyLvLV0Cwnms9wai2Khh3/q0IYmj89eWVaq0Ti6tOzekdQXhws1Yqn0EndyCAQMAZfvIoeEPg6LBk6bR1SCSb01OgUBIE9m+7gEDRbCdaEzYN17QTs/g3Dz1o9RkvxTKuZWqmDqiT4J9i6SP/P/WzdUiuY/LDA/5cUqxpIQ+2DaPDc5p1TnqNWaP2AOFKl+bF5x3LAcf+/3GONnt4gEx3zgOWib0Pxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(451199021)(1800799003)(186006)(2616005)(83380400001)(53546011)(6506007)(8676002)(316002)(66556008)(6636002)(2906002)(5660300002)(66946007)(66476007)(4326008)(44832011)(7416002)(41300700001)(8936002)(6486002)(6512007)(6666004)(478600001)(110136005)(921005)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDB1a0thT2lNaXNRczhZQlA5T1lveldqMi9lS1dXa1VRcTdIcXVVQUwrVGp1?=
 =?utf-8?B?M3JCc08ycVpML29ITnFnOFpraEVQZTJNRGVaSDVYdC9lTGZwMm01aTI0MUpj?=
 =?utf-8?B?d2I5Q2xxY05uN2JDTlVMUXV2MXFnaWVpSDc2Ylc5S2Jvb3E4Z20ybngrckVB?=
 =?utf-8?B?Sy9uY0ovR256ZGV4VTA1ZVhyRGVjemgrNWdqUWltV2ltMVMralcwa3F6L3E0?=
 =?utf-8?B?eGZUd2N0M2o1c2tNVGo4S28wa05VbUt3ZERjS2owL2NEeE9jMWI1ZnUxVVd6?=
 =?utf-8?B?NTFoSFlTMk5nZ2RPeHJTNmU4ZyttWGpOeGdLQ1o2bFA3b01ENDZqdWZLQVpq?=
 =?utf-8?B?ZUQzcUZBZUxDRldYRWY3cVBPV1hDYzYxZGFhUURRQ1pMT2Npakt5bDZPaXYx?=
 =?utf-8?B?K2NCSFlXYkM0N0E5TVFscnlQM2N1V1N4OGNLeURha0tjdENBYnliakpmOE9P?=
 =?utf-8?B?SGVRRlhBN1FFY012VzdWUWo1UWxOR3FMd28zZTdnUlJqZnVnZ0prbk9wbExB?=
 =?utf-8?B?ZklyU0Q4RDZubjVYbHJocEgzZS9BdEhFVFc0cHBsTlkrdWFDNkZvRjlIZE5T?=
 =?utf-8?B?RjNYK1JWTTBvUlBvV1loaWtmcS9hcStXMDNEL2VldlpQUVdITHdpU3hsS2xm?=
 =?utf-8?B?VVVvT2F5dm5YTjFXZ0UzbllOakpaUmdvcGJaMnlUd3ZMWG9jTy9wY212NzZB?=
 =?utf-8?B?bERCUWFXUExCUHoxaUc4UUZQcXdVOTdlbksxWkR1SEp6NHpPejBxWVR0UEZp?=
 =?utf-8?B?UTgrSHpkTlRJNXcyNGdmci9MWHpZaWZjZFZtbTZLaExLSlNCQUhxUXZlK2xj?=
 =?utf-8?B?RlpJM2tjL3FLdk5GOGtLQkc1WnR3SjVUbnFLelV2RFhpeFZnRks2bjQzODhq?=
 =?utf-8?B?SUpObEpYWmlJQm5LVGRGRktGMmdkYXAxZWgxMU0zamZ0dXd2NjZDTEtIaWw5?=
 =?utf-8?B?VjRBRXdwT3BiNXpGUEo1TFU5b2JBNW1oL2o1bkxUc0RVUWIrbW9mZmZsWXZu?=
 =?utf-8?B?YWZ4NGlKdUtUSG8wTnhVUk45OE5MZnBvTEpQN2Rqc01ZaldUMHVHbnVGTkw3?=
 =?utf-8?B?V3VxSlFkZlZkMVVzVnllL0lLQmlVNW01Zm5UdytGcWZOZE5qT3UyNWxhOGs4?=
 =?utf-8?B?Y1FGdlZVQVdVdmo2dkYrdHk0RWNGaEM2bTd1SFR1RjBrdkdQenpvWTN0TjhL?=
 =?utf-8?B?WGRXNkpZWjRUcGFUeUhWdm9nMW9LeUhsbnhCZ2hZVzJFdnRxR3dBeWhKWDNx?=
 =?utf-8?B?TkRXVnpKVTBTVHI0NGZLbWYvTkFLK3RkZ21ZNjBaMzhBdk5lUUVOM3pzQmNh?=
 =?utf-8?B?blhheE1NN2FHdjZQSVVhdUVyckZyTklrWjdFcTdGMnpISHZzaWt2VGRNRzFG?=
 =?utf-8?B?WWNMWWRmeDNUb2FhYUpMQ1RaRnI0bHp0TFNrMnBpaW9seUs4bGtpa0FNR3pq?=
 =?utf-8?B?ak8wMUJ4alM4Wk81OE8rM1pTdktwRVZrRDVQTENJVVgyRFlqeGlKdWp0NERo?=
 =?utf-8?B?Uzd5eCtDTmZ4NjVpdWVTcThBRm9aZVNsWUxadnlSVXpwNFZYKzJkWTErMDNX?=
 =?utf-8?B?ZllzU1BGTjlQT1llYUw1T202cmFKM3dvYUdZK2E1USt0VE9jZUNTczJzUTJC?=
 =?utf-8?B?NFVaenFTNGpxTkF1L0FFU0dieGZBdC9qcFNaN1ZRRzZMMlpuTmx2cTAxem0r?=
 =?utf-8?B?QndUc2RkTFp4eWhCTXY0WmlYMEQ3SnpiN0dOa0FoeWx0eXBPZWJJdHVuNFRa?=
 =?utf-8?B?TGcyNUhMTGhEK1lqZy9LWkd6RS92VEhRaE5CRmROSU0yL01ZQ1FxTU41ZmVM?=
 =?utf-8?B?Z3NWWElEck5WcUJBenozWmVnMFQxcXo1S1YyRnJpYzFwd3NuV2pSTEdBR0Rs?=
 =?utf-8?B?ZitBVDFBbk9rM0NkbGNFWFBhemkraVZHWGtpeklNVmlWcTYwaXBybFJROVUz?=
 =?utf-8?B?Y3V0Sk5ydlAxMVE4eHdEUzNCdXFqUWRORWp6Y1hSTTB0WUZSdm9sOHdnV1ll?=
 =?utf-8?B?ZFZMclFlbDB3cVBSd21Oc2xZRnB1NmVUaE4ydTZTM2hKWW9uUUlCREwwVDl1?=
 =?utf-8?B?TjRDSVVDaTEraElmNkNhc0RqeXNXSjRtQTVpZkpXMjJQcmNXejlKRmxTOU1j?=
 =?utf-8?B?cHlhOXliS1ZYS3YydWhlTCtzcGRnbVl5WXFzYzRHVlFlOStvVy9aTS9SRk03?=
 =?utf-8?B?Tm9wa29ybk1aUitNdW9jZlVZOS9pN050WW5GQUN4Mnh2cE1JZGw4UVJ4b212?=
 =?utf-8?B?V1BaZTFnajRMSkNhQVZmZDd4TlF3PT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b3e35b-f6da-42b0-039d-08db94cf89b2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 09:45:29.3765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmT76U0O87KqkxMoM4fWJaYGKS/ZdHX8vV1OveBWhZitEMYJLgqDaGKZ5MujKshnSSBDseRbELDouWFdjdW2Ou+gNnH+G/GlDgY6YL1C14Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On 8/4/23 10:41, Neil Armstrong wrote:
> Hi Michael,
> 
> On 18/07/2023 17:31, Michael Riesch wrote:
>> The ST7789V controller features support for the partial mode. Here,
>> the area to be displayed can be restricted in one direction (by default,
>> in vertical direction). This is useful for panels that are partial >
>> occluded by design. Add support for the partial mode.
> 
> Could you send a v2 with a comment in the code as Maxime suggests ?

Sure thing! I must admit that I do not understand his concerns exactly,
though.

@Maxime: I can prepare a suggestion but feel free to tell me the exact
wording at the preferred position.

Best regards,
Michael

> 
> Thanks,
> Neil
> 
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 38
>> ++++++++++++++++++++++++--
>>   1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> index d16d17f21d92..729d8d7dbf7f 100644
>> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> @@ -118,6 +118,9 @@ struct st7789_panel_info {
>>       u32 bus_format;
>>       u32 bus_flags;
>>       bool invert_mode;
>> +    bool partial_mode;
>> +    u16 partial_start;
>> +    u16 partial_end;
>>   };
>>     struct st7789v {
>> @@ -330,9 +333,14 @@ static int st7789v_get_modes(struct drm_panel
>> *panel,
>>   static int st7789v_prepare(struct drm_panel *panel)
>>   {
>>       struct st7789v *ctx = panel_to_st7789v(panel);
>> -    u8 pixel_fmt, polarity;
>> +    u8 mode, pixel_fmt, polarity;
>>       int ret;
>>   +    if (!ctx->info->partial_mode)
>> +        mode = ST7789V_RGBCTRL_WO;
>> +    else
>> +        mode = 0;
>> +
>>       switch (ctx->info->bus_format) {
>>       case MEDIA_BUS_FMT_RGB666_1X18:
>>           pixel_fmt = MIPI_DCS_PIXEL_FMT_18BIT;
>> @@ -472,6 +480,32 @@ static int st7789v_prepare(struct drm_panel *panel)
>>                           MIPI_DCS_EXIT_INVERT_MODE));
>>       }
>>   +    if (ctx->info->partial_mode) {
>> +        u8 area_data[4] = {
>> +            (ctx->info->partial_start >> 8) & 0xff,
>> +            (ctx->info->partial_start >> 0) & 0xff,
>> +            ((ctx->info->partial_end - 1) >> 8) & 0xff,
>> +            ((ctx->info->partial_end - 1) >> 0) & 0xff,
>> +        };
>> +
>> +        ST7789V_TEST(ret, st7789v_write_command(
>> +                      ctx, MIPI_DCS_ENTER_PARTIAL_MODE));
>> +
>> +        ST7789V_TEST(ret, st7789v_write_command(
>> +                      ctx, MIPI_DCS_SET_PAGE_ADDRESS));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[0]));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[1]));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[2]));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[3]));
>> +
>> +        ST7789V_TEST(ret, st7789v_write_command(
>> +                      ctx, MIPI_DCS_SET_PARTIAL_ROWS));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[0]));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[1]));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[2]));
>> +        ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[3]));
>> +    }
>> +
>>       ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RAMCTRL_CMD));
>>       ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_DM_RGB |
>>                            ST7789V_RAMCTRL_RM_RGB));
>> @@ -479,7 +513,7 @@ static int st7789v_prepare(struct drm_panel *panel)
>>                            ST7789V_RAMCTRL_MAGIC));
>>         ST7789V_TEST(ret, st7789v_write_command(ctx,
>> ST7789V_RGBCTRL_CMD));
>> -    ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_WO |
>> +    ST7789V_TEST(ret, st7789v_write_data(ctx, mode |
>>                            ST7789V_RGBCTRL_RCM(2) |
>>                            polarity));
>>       ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
>>
> 
