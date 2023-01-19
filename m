Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF12673906
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 13:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FB710E234;
	Thu, 19 Jan 2023 12:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2070.outbound.protection.outlook.com [40.107.8.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8110E234
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 12:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAu+oykyfnm0cWo1RAxxeKbqTm0LhZ2vuf+gc71SQnJU6Nb3F9aciKEl1LZSLxcVZSzemEzowl3j20U9wlEReIUAf7/s4A0jtNsXUzxRZALNI/ovC5IpQij6etrramZEYhSghZlS2M7ABJS3TGLsTQ2VxyNWZErTMqSA3BvJbu2/0sRdQ/bthpRObZ/LGroIl2xWiWwKYUkmjHYfOuhHvSjQDJyQQh/FHKsyeWYJr1JOv0bpKFYcnDHRsN8HrelBIGOi81m449xeeoHB7OU4q/OqZezt4Is7A2ozZxvbnErdiQ2W/G3LYmNFooppxcOZOd1+ysoAiOrlDeyyEINJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0j2iDIXE+LlH7kzbp+5QNgAHmuHIMvaUt6pTrBJEO0=;
 b=ntWSq2lLciCE/B+CPsPjBp0QjM7KJhcsTdy2M+M6jVM6V3+RlrQdAohADBj9MVmHSfpltcysYsE8txuGyFSHXqzsffHD6v3FaCXkBQF4WRy6YcuTbw5qA4CWaqjekYHJR2/KzF6/vtweUWUq47G7PFpXJdo1ywYbKogXFa46uuZbtYsqOGy8hr7npnsfKQjv/G39rMExtlhaap/o/goMyBNMBLK5OHMIFU54lvzYYtHm9BR5QxHDsioV+CSCNjGqv4/LW9Rz8owjGVMySmNpH/0An9jolNUD86UPeAvXNoqN4NJss9if7F5SFTv9/uU2k57zhG2JgSfHFSyl4b4bvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0j2iDIXE+LlH7kzbp+5QNgAHmuHIMvaUt6pTrBJEO0=;
 b=Dl7hzxAEx5AKpmUZwdiUf4nCvLvCoEVFSquSd3tlQeLkl+F5PyqlWvqxJlEBomBHn5dYKVBnu2Wq52SLLX1Bh80K7vxVe1sAVPA3QEDR0u7dBBet0hY8+o6fYFhjZddXI8w7Mk1co24ZrI6/U9K5K05Lzpf4kLZ+l8fSFUBXEx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB9245.eurprd08.prod.outlook.com (2603:10a6:20b:59f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 12:56:35 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 12:56:35 +0000
Message-ID: <c97a8778-2f02-d74e-d38a-d11829fc15d9@wolfvision.net>
Date: Thu, 19 Jan 2023 13:56:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] drm/rockchip: rgb: embed drm_encoder into
 rockchip_encoder
Content-Language: en-US
To: Sascha Hauer <sha@pengutronix.de>
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
 <20221130140217.3196414-2-michael.riesch@wolfvision.net>
 <20221207064507.GV29728@pengutronix.de>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20221207064507.GV29728@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0019.eurprd05.prod.outlook.com
 (2603:10a6:803:1::32) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a62e34-87c3-4fc0-f60e-08dafa1c989e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ozxhzoHarlZ7iL7MSuctmU7cqKHRFT6NPP3RiKd+ObYjh3W2cgtJvdfeLAbn6ByR9lDumUaXXHSnuy0Oy1BfW/l4loEqjnXsGZG9Yn9BgRYvtXzi1OnAZUGcHiByWljtNRbTEbOFb+7jEWccKSI/Yp5tbFgM5lW12tnpQ4xgdqfNwPt5/aCVHO1GvV0Im2KDoGktfInKTUWzD7EI/wTE1WY8gGyL59UIcRhS0OB4BZCNcgBvz+R5TR6kBYOb9PNQEofpTgliSUZsbBqa3bkoj/h1QGwPrvzSGfc9hRrcUEeF62dKIKtzAoHOVxHycsf6aYLpUmRI1frZ0J3+s1yWCEqK7aKu2VVZosxYok/LSsXnrLnHZTwPFMr38QCPLdtsU2iUG/eJDLyyYwTM7xqbFicJ6s9HSX6jTME/uxXuapx1eDLbhV94DbOneJlo0L4EJWBtHM8DJbxZJBAhysrClZjIuLnmm7+d4OCkcpyGFzRC7WwXERHewuaGacd8d9ROQBdQhn4tdgrKt+47ujUONoZFY/CaBvPWobDA5gymJvcygB3OBf7bYFiE8KxpGpd59apfLckUNAG38gr8lkir7LiwGOv4TBGs16WyLPUGX2WadEvdD8RZm+GzzKmV6AqrTnGAEHD8C/aH4l9wtqClT7ivJjxGE9KsdKhLvQFSJdP27AEv4i+icWTUN4dl5NpViclOH0rdQU80U7Of02xapMzVDjOGK9gEsAkuvi7ICfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(39840400004)(136003)(451199015)(2906002)(38100700002)(31686004)(2616005)(8676002)(316002)(52116002)(86362001)(54906003)(31696002)(36756003)(7416002)(83380400001)(66476007)(44832011)(66946007)(4326008)(41300700001)(5660300002)(66556008)(6916009)(53546011)(6506007)(6666004)(8936002)(6486002)(186003)(478600001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEFQQjlFcmNRZFlRSU0wUWlhOGE4MEpaQ0Z6TUNnQ1VxcE9pUmtRaDNqS2dQ?=
 =?utf-8?B?RU9mVGxHV3FwRlhobTF4QzQ1RUtEOGVaaUJWcDFCUVdZWDFBaUhUWUFBRVJB?=
 =?utf-8?B?RXJUaTlXQXYxRXU2dWFRaktHOUZkQjFDZEdZblpNYlBWRi9BSlNZY3g2QzhP?=
 =?utf-8?B?WERydDRvdndUUHdGczVtNVlyR0pRRWdOSkZnSjdseGR1VFUyeDN2bGdXcThP?=
 =?utf-8?B?M3FRTDE5SlFtNzQrVWFVRnRvRk43YStDZlpsd3NKTnhZR0pVZTFtRHBpbnZi?=
 =?utf-8?B?M1FwRTVxSGk5QVVDK2tuVXN1NTFud29taWdRaU41dlRIQVNESWxrTmMzZjVt?=
 =?utf-8?B?Q2d6ajVNMHZyOGFKUU1PNmU2SEM1NDlzOGZHS3dxUm1wQktiNU82V3FFZGpO?=
 =?utf-8?B?Um5FL0tMUTRYbUw2WUFmaEdKYzZBeDI2dHYweWtJWTk2UXVmM2R3enFCT1k4?=
 =?utf-8?B?N3FQYytwS09NbURiV0JjMEVlb2xzMHZXUlBwWmtFVmZqZWxHa3BYdHl6N01o?=
 =?utf-8?B?dEw1aWR0Y0JReFZleG84Y2w3cDErNkNFbzl1bXZXdlZjd2VuZFQydldKMy9a?=
 =?utf-8?B?WWlhVVJQSThsZGx4K0NMMXlQdElhRmNjQ1VZaHZXaVNyZ3J2K3JmekhUYlYx?=
 =?utf-8?B?Y0VLeFB1Y0l6cllaUVJpeE44Tjdxd2gxSWNnTlE4M0lZNUNUdndaSTBDNzNL?=
 =?utf-8?B?YythalpnRGp1VmFLcVhycnQwbUkyVE9RL1k0M2FwSmovbW9GTmFWZkZaS0U3?=
 =?utf-8?B?bFRoUmxIaTk3ejViZ3BQOXovRXhiM1h1ZjMzRVJnM2dPMEZnNDVoMVlVM3RV?=
 =?utf-8?B?cW9zWUw3K3M2bzk5UTVWcVlMK0dSNGhWbHVGZWtMbVhoMWJZcVE3SGwvUFBh?=
 =?utf-8?B?Q1lzamNWa0NabHF0T0ZuVjZKa1ZSZlBzSThoNk9XWnVOUmRnaXRJdnNqWm81?=
 =?utf-8?B?cDR5OEM0UnZrWmcxaGlHbWM0OExIckN2WGdlazdXbEJjdzFNTlU4RmNYLzZE?=
 =?utf-8?B?Q0FZSDlvVkVWWS94YWIvUFZJeVUrUnQ3WVg3a2FpMlB0ZjlLRTBNb0Z6TVdp?=
 =?utf-8?B?U3pIT0Rvc2JDZThwS1Q1bVRYZGpCOUhoNUg4Yk02TFBBU3VsRFdYbjFPMFJj?=
 =?utf-8?B?T05pOHBVZUNDZFFaL3hISnI0bHltQjhpTmVXaEV6UDNaaGZqQmc4cnNNd0Q1?=
 =?utf-8?B?ZWlpQzM3SThFMW5OUENyRG9BOVBZRzBxdThUdk45N041Q21hd25BNS9TSnNo?=
 =?utf-8?B?R1ExVEtZU1A4d1RUdncwL0c1VWJVN1JzY25NNVAxMm90eEk4amJWWS9BTmdB?=
 =?utf-8?B?RVg3eHhuQ3dvS2Qxd3VMK2d5cGJlNkt3bFZXeTkvQzN0WGJySEJXRGNKOXRX?=
 =?utf-8?B?d3RjWG9CTGtaRHFKRDFrUjAxWmg0RlI0RVI3TXNRSEIrYnNHaWN5ZjNJbnE1?=
 =?utf-8?B?aXJlbVU3SGFEcTRrcDBjM2NneDIrRkRPa0tYWkprcTVxSEJuUmRKOXJYTEF2?=
 =?utf-8?B?dTdkTUE4QWpuQnVTR0I3cyttWkJodEhybFlweW9OSTBDNFZDLzRCRjRHQjBh?=
 =?utf-8?B?ZWUwNDFRUmFaZnN3c2N1eC9qajlhWktrdjJtZUpGT3Qzb3dQUnA5UmQyZkta?=
 =?utf-8?B?SjJoZEhJUGQ0WGVQQTNaQjZpcWVWRFVNdXg4aURnM1JMM3ZsY0ZNckprZEpX?=
 =?utf-8?B?aU16ZVZDN3djZU04YjZvTjU4SWd0c01UczVEb1dmSmZibi9Hc0NXcnVkalN1?=
 =?utf-8?B?UjBueHl2NTNPb2JlaS9iUHRTTmxHSUVRREVmUzVSbTBlOWJKcy9Xd1lPYXZm?=
 =?utf-8?B?bTlzWVIrYUpMelQvZTBMZmFMTFhUZWVRc3lIVk1yRVNFMDh6SUR1MXF6K0tS?=
 =?utf-8?B?d25lSEN3TFlRTnFoYnpWTlJaR2orR1pMWll1eHJpNEJKS3NuVXhRNXJjQkQ5?=
 =?utf-8?B?aFgxc0o3aGN4STVxa2dEa1VsbysrcnlkOEZRSHpSMnFZZDR0YXErNzFiaUJO?=
 =?utf-8?B?RkN1RVgxdCt4WThoYnN0OXNKL3UzNEk2YUphWWcrSVo5bGRqblgvVERWR3Vx?=
 =?utf-8?B?Y280THgweFVTcXd1T0ZCWXl6Ri9tOGU3QkszZFlEYTFUck1wVk1OZVJYR2lW?=
 =?utf-8?B?S0FzdkpUN0ZUekdxVis3bDQvSklsU1hUVlVDYllrelR1ejVUbHlvUnRKQWFC?=
 =?utf-8?B?QktZWmhKVzFHN2gyUDV1M3ZLNURuYythbFBPUGs4ZEtadHlZTEI4Z2ZsTEhR?=
 =?utf-8?Q?fZHGHaWHqgB6tyO22Ue/ClmtFpK8KxiFasEFM59lTE=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a62e34-87c3-4fc0-f60e-08dafa1c989e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:56:35.3867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJ6sHmJpWMuM5j56FcEvCh0rWOF17crUZ6oEJmSD8DzJuyVVDuOv7DOpETs++cL9DV56g5CSE5AVoG83ZCXkNcvQjtXDOdEEMjmWJOUPwRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9245
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
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

Thanks for your comments!

On 12/7/22 07:45, Sascha Hauer wrote:
> On Wed, Nov 30, 2022 at 03:02:13PM +0100, Michael Riesch wrote:
>> Commit 540b8f271e53 ("drm/rockchip: Embed drm_encoder into
>> rockchip_decoder") provides the means to pass the endpoint ID to the
>> VOP2 driver, which sets the interface MUX accordingly. However, this
>> step has not yet been carried out for the RGB output block. Embed the
>> drm_encoder structure into the rockchip_encoder structure and set the
>> endpoint ID correctly.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_rgb.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
>> index 75eb7cca3d82..16201a5cf1e8 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
>> @@ -18,17 +18,17 @@
>>  #include <drm/drm_probe_helper.h>
>>  #include <drm/drm_simple_kms_helper.h>
>>  
>> +#include <dt-bindings/soc/rockchip,vop2.h>
>> +
>>  #include "rockchip_drm_drv.h"
>>  #include "rockchip_drm_vop.h"
>>  #include "rockchip_rgb.h"
>>  
>> -#define encoder_to_rgb(c) container_of(c, struct rockchip_rgb, encoder)
>> -
>>  struct rockchip_rgb {
>>  	struct device *dev;
>>  	struct drm_device *drm_dev;
>>  	struct drm_bridge *bridge;
>> -	struct drm_encoder encoder;
>> +	struct rockchip_encoder encoder;
>>  	struct drm_connector connector;
>>  	int output_mode;
>>  };
>> @@ -125,7 +125,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
>>  		return ERR_PTR(ret);
>>  	}
>>  
>> -	encoder = &rgb->encoder;
>> +	encoder = &rgb->encoder.encoder;
>>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>>  
>>  	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
>> @@ -161,6 +161,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
>>  		goto err_free_encoder;
>>  	}
>>  
>> +	rgb->encoder.crtc_endpoint_id = ROCKCHIP_VOP2_EP_RGB0;
> 
> This is vop2 specific. This code is used with the vop1 as well, so it
> doesn't look like it belongs here, at least not hidden in a patch titled
> "embed drm_encoder into rockchip_encoder".

OK, the very least I can do is to create an extra patch that sets the
crtc_endpoint_id.

> Normally the crtc_endpoint_id is set by the encoder, coming from the
> encoder node, asking the question "To which port on the VOP am I
> connected to?"
> 
> Here the situation is different. We are called from the VOP and the
> question instead is: "Is there something connected to VPx endpoint id
> ROCKCHIP_VOP2_EP_RGB0?"
> 
> You might need a vop2 specific entry to this code.

I just realized that rockchip_rgb_init parses the endpoint ID. If I am
not mistaken, we can directly store it in the crtc_endpoint_id member.

Seeing that this would be pretty generic, can it be included in one
patch (or should I still split this into a separate patch)?

Best regards,
Michael
