Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22976CC89
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E195810E0A6;
	Wed,  2 Aug 2023 12:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF41F10E0A6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 12:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDh/x1VGy8v7F+e9bCjtO1CC4mhIaZSEb8oc/d+BvTEFgTgy+h/IfZy9G0kxlWYa04VzPyfzAQ7KKGqAv9U/VDpIsyXWyQZHkMKab4o/yefxPZAcUFQ/u4K34cHM4a+dj3bRvdtiDhth4CHCiAbPxrPNEkl382H3xjkkZmk0rm/v82iJJC04/veBx/QjZBd7gdI2aCK7k+l67TSvHXZBUd8nxHX8yfY3LHkfSv3aXbHSQ5/cUtSLY4Vn/HeJrqWwGRQIyqS+Fc/hTPwNrRBM3SUKg9CkBupNqdtr3Ejxtyhnh4Dyno7AmI7aZHiSUw5xOX849IYoSzhuvNBHvF4hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSCnzKUcSANrYp+MUTO+dNRJ8euBfLseeNKJrrE9Fxc=;
 b=k34LTnx+vNoyGZUPaxRpX8L710XMGe+Ih44lzvbdZs4SPOu0hZg94IUqFjkTjRhXor0QfY/tPWG2NvjCKU9OiWBA+zNv+iF5868Set0R7nFqKjOpJzj0Ke0HwnSGewURCQJd82QMrVyUuxHNY1lKxufrYzXRj7Qse7oO///anlq6wy9y+QlYTuJrzZvHBBuRk6yN2pRk9pm45S4gUB4DQeXt4iPbjWf1IZWcuIgRYX4RrRpEh770cj65ISKRlXqo/f+crLxtVkvxngtXn62qUNMXWk0N3IfgvwlYL8EbBFJ7fgwlRNLcaMxyxKmT+iIrnvkwraGy0llKignL+JufLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSCnzKUcSANrYp+MUTO+dNRJ8euBfLseeNKJrrE9Fxc=;
 b=j1N4P7lHszFPgkwoltiEb2Dx3S3/F6W1I1SIIuTvnDS6yUVZAKEBIJWOGv0ScgL4YVahKfkAiYfVWjhEqMjEizjtethLldk7VpFy/gFJ20iOH/F83GfsPi4cE2gWIgJLkQG4LTutWHN/7LkdFTyX9GM21N6fwreEXJICgjzTDhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com (2603:10a6:150:d2::10)
 by AS4PR08MB7951.eurprd08.prod.outlook.com (2603:10a6:20b:577::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 12:23:30 +0000
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66]) by GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 12:23:29 +0000
Message-ID: <b8399e52-4b08-a372-29fb-aad2644221cd@wolfvision.net>
Date: Wed, 2 Aug 2023 14:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] drm/panel: sitronix-st7789v: add panel orientation
 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Reichel
 <sre@kernel.org>, Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::17) To GV2PR08MB9158.eurprd08.prod.outlook.com
 (2603:10a6:150:d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB9158:EE_|AS4PR08MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a289fb7-7dda-406d-025f-08db93534787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZoQ0tuVeQufUxp+ISXI33br4itlJ9l6vsAFv1TE4s98JPrD0n5Gl2bbyjEJpe2djIzwrospsrU/4/d0XZty07Y7f51oLxVHpWWnzf6qM3PTmc1uIme6icS9yjzIUIkMwsAV1z8rYmotOjy9Tg5hyQOXspc20uGwgEOLXbxPMUg9S6AC0jYZTKK2reH6UXOYzuMF5XkjGOOGBFq7edNmu6X9TNOqwj7m/yRscoE24YKjMrKGitcGjwgHIPGlhspsOUNoUUCkxTvSUHe3KIJO8qjrbaquBQO4ofaInJm9AUR2S5V9ciKk25sNhJgG1As+3GOrCRPg6/hBjD5vc64s+M/IuODrPoMbIiD+I8UIfs/Si/bs1lZFEKFICTV7qGOubH0YQSUcCGMcwkRcQi/yYBJUpceT3KbFKPygreIEhrPGBvR/VW553Kl8eVYXtu84RJ5jo5miKYXHH5A2BzyPQuFh3ip2URpsJZDmBu/IyzGiyD44peRfblHk8cCCSmebhihTk5nmXy9NNcb2Mm63FgyJbnr8K+YBLMTRwUMa1tBgE4FduVv2Lusq/bjeVXAJNxn8nOJ3XuRi4fMs3GqZYGgOUaQALWRaGMEe2GEfS0xh7S70vJLV7gSXCoa1p2fZlF0KhomTeykX+Jh7s+R3YcnEpefTYLR/H2i96aeHfQAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR08MB9158.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(451199021)(2616005)(53546011)(6506007)(186003)(83380400001)(316002)(66946007)(2906002)(66556008)(4326008)(6636002)(66476007)(5660300002)(7416002)(44832011)(41300700001)(8676002)(8936002)(6666004)(6486002)(966005)(6512007)(478600001)(110136005)(38100700002)(921005)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG84eWxhUEp6djE1dHBxWHJPMG12cUw4NG9kS0N3UlN5RHpOQ2VyTitRT2cx?=
 =?utf-8?B?ZWh4cEdQdGlXa2VtL2x5ZWd2THZraXJUaXJYNGpBNDIvK0VwbGh4TFJVRFJJ?=
 =?utf-8?B?bnJsb2lvT1pPRTFhTE9vNnE5OHQ3TXVmWUZFb1FQYkVMcE5sdTFrc2hDamh6?=
 =?utf-8?B?TVNvL2tnSzZvQkJzUVpldmVXYjlQMDROU2tuMGViZ1VHVS9ZLzlnYURCdmtj?=
 =?utf-8?B?NnM3M3ZrT05yZHB2TUVOZTZ2V0FyZGlkVGxpdzNxNUpiTzRSUUVxWVFkMnlX?=
 =?utf-8?B?OEwwYUNmcFYwTGdqSDlTRFFpZTZSTnQ5VEhOU3Y4TzhXb3lHR0xrZ3gvVFhB?=
 =?utf-8?B?VnBWeWVFVDl0RDlRb2tmVGFFSk9PTlJnSlNCdVdpWFFwVkNsMFVyNzExWXp0?=
 =?utf-8?B?b1BVTVhHSlpwU2RnU2IzVFlWNHZJME1CM01HQ3N1cy91ZXdMWVdZY1FQNlRn?=
 =?utf-8?B?SVNqL0FXSzZGcDJ4MCt0empUMWRyOXpZK1VpN1kyV1NzbiswYmdhRzFQeDBi?=
 =?utf-8?B?RzMvRGZJbWxIdEVYYm5HdEJtWFpyUnBmTk4xV1k2TndRclNva0R0UmsrR1Rp?=
 =?utf-8?B?OW1LQlZCakJlT3hlalFPd1J5NWV6bDhQTnJpUVNBSmtjK3NWV2xaaE0wUEpy?=
 =?utf-8?B?bSt4SGJQKzhSOG53N0ZwUVlVQlRjWEF4TEN0UlRFbUl2N3pldDFzcW94b2ZC?=
 =?utf-8?B?VCtzSDZVMUtHRGxEc2FVek85aGh1bDZ6MlBYTzZ5cmJzMjNJVzZWckd6NDQ2?=
 =?utf-8?B?ekpxU2lMaDFZeEE0TFFJVXhrMjBER2hOTEZEdDhtVnZXRVJCMHlKVDluVUJx?=
 =?utf-8?B?U1p5M3ZrZE1PZTZpU1Z3Y09wVUY2ekJXS2FjUWJnMmt2ZkVVYStTc3I1dEFk?=
 =?utf-8?B?WUxsV3dXaHNQczU2Y0lLMEFDaXFZTndjSUZxWk93ZEs2OEUrUnMrZGcvN3Zk?=
 =?utf-8?B?bndDRFl5ZHZ3NzFOSElNc3I1VjRzeTFFVVN1dXQ4ME1vaG9zelMyTVJWR2dz?=
 =?utf-8?B?OEFLVnBVVTJGbnVSYi90djZQaXdaSGNCdmgwVEZxL1pVdkk1Y1lUL3FQWHdy?=
 =?utf-8?B?TVFpWWtETFdiSkVncmp2aGFydVRHTnI2K3VPbkY1TXJLOW4wc2pWc01YRWor?=
 =?utf-8?B?eU9iTjVDNTRtaGpUaUxjVHl1NUxFSXhEbzN3QUNxOFhLYkVPNDN4QTdIY0Vq?=
 =?utf-8?B?elJHRjBybElVK1EwU2RDK3ZsZUtvWHRiWjA0a0xJYjRIMUJmb3FTV0R1aGxl?=
 =?utf-8?B?NURhYkgwSStNOExpQVprRmp6R1hMNitRcjJCRTBYWXlPSTJmU3AxaytLaWIr?=
 =?utf-8?B?UXBoU3FZbkpWMGlFQ01sMTgvZUd6NytUU0c3WjNTa05aamdSbWNYUExCcWZl?=
 =?utf-8?B?RjhQSWk1dmkzekUwNkFCZGNBZzV2bUZmWFI3L2JFaW94cXVnaG5QK1E5WEVv?=
 =?utf-8?B?ZUZOam1PK0dTSk1RWlUzV256a0szeEpJT0k3TGY0c3FOSkN6d0pkNTAvYy85?=
 =?utf-8?B?dDJVOEFvaXZSQTBLRktoQ3VqZTk1MXpLekRpT1dCeWJVLzdRbHpVeTlCS1dq?=
 =?utf-8?B?N011Nm9DT01OVFNlZjdHMThFcGpkVlFZQ1VGenZRMWZOcmF2S3E0WGpCWnJI?=
 =?utf-8?B?N0c0QUwxNlNubXlzVkwvamsxQ3ZpblViTUVvRUxkYWVBa1ljY0hpMG1rVm1m?=
 =?utf-8?B?ODZTR25NdnR5NUJROXliQVVwelZERHhHbTFWU1ZPY013d096YVJCYWpXYkxr?=
 =?utf-8?B?Zmcxbi95RDBpWWhNdjFsQ2s5N2grNzhkcmV2bU5VQkhVcDU2NDFBQlozS1hp?=
 =?utf-8?B?QnVERmlOMUJhVDNNWDFHM2lBOEFaSUhmbE9QWFprOHZMNnVIQUFUbmk2dXVP?=
 =?utf-8?B?dDJPNVBTdmdzQzZDbkZPbHB4NTg4SE84YVhVVFFOLzlTc3JIVXpUZXFEajVW?=
 =?utf-8?B?R2FML1lHMlZCRGVvNldPSlM5MldVMktaOTFaQ2tLR3FmNzRnYVpWYmJQQUVH?=
 =?utf-8?B?OEFtVUtHVHZJcXByNGxFYXh0OU1WNlpBamxOMy9tdis3eWpxOU5LekVjS3oy?=
 =?utf-8?B?dXpoakw1eU53aDAxMDJrcGMyUzA2K2trZEFwcHZsUGI5eXJnYmh3eVBXVG4r?=
 =?utf-8?B?QWdTRkRvOC9IZVVGTENsTHhwQlFJRmgyZmREMVM0S29SZFRncmRDVllNU2Vj?=
 =?utf-8?B?WVVxV25ZK2pBcnIwbW9XanJsTStMMkdkeVNSd2hHQWQ3bEhKRGVkK3Uzc0VE?=
 =?utf-8?B?Y2VzeTM0Q0NEcmE5TTJjUUNSdWtnPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a289fb7-7dda-406d-025f-08db93534787
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB9158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 12:23:29.6504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mJYKpXK6ZTKlE+JFN78Nu8U/PBqph8L78D/ZpJI4zzjJVaOmIogizAF3wlUyGXhxiuV+h1cVDRDzmZvSb99ZuEf6juGHka7Bv1e+6f7ql8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7951
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

Hi all,

On 7/18/23 17:12, Michael Riesch wrote:
> Hi all,
> 
> This series adds support for orientation specification in the device
> tree to the Sitronix ST7789V panel driver. 
> 
> This is can be seen as reduced version of [0] (some things of [0] have
> been implemented in more general fashion in the scope of [1], other
> things have been rejected).
> 
> Looking forward to your comments!

Gentle ping!

The DT part has already received an Acked-by -- are there any objections
from the DRM side?

Thanks and best regards,
Michael

> 
> [0] https://lore.kernel.org/lkml/20230314115644.3775169-1-gerald.loacker@wolfvision.net/
> [1] https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/
> 
> ---
> Michael Riesch (2):
>       drm/panel: sitronix-st7789v: add panel orientation support
>       dt-bindings: display: add rotation property to sitronix,st7789v
> 
>  .../bindings/display/panel/sitronix,st7789v.yaml   |  2 ++
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 28 ++++++++++++++++++----
>  2 files changed, 25 insertions(+), 5 deletions(-)
> ---
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> change-id: 20230718-feature-st7789v-4d0c2c6e2429
> 
> Best regards,
