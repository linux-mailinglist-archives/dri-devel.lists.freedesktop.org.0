Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3EF5B051E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 15:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B57E10E761;
	Wed,  7 Sep 2022 13:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04olkn2098.outbound.protection.outlook.com [40.92.45.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E0910E761
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 13:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSpRavGoDk0winj1/GJHXaTtNxPNcjJtg1emFF+Hd/QTtz/H8n85DH1EIUJL1ZicVgQXXQlYyhehI9seYSoAwshC0rv6DVJxIjtARTiFERRV0aCOKVX3+5kH+OqGzEwA8UZXtYAV2KqBW/24TG6RA4bjM1RAsfKIMYTKuk9VP4OF8SCrcVDnsFSH1Fr1cD/3uNcD4cJMtqlRqLW3tzLZN8fapQAEXqckaWMdLWedE7qiXsVMt5xdz5oZs0W53+atuW+8zPdsZTe7RvSyYwZPSkILF5AX+Ndvl/Xr4P34eTWLlTFVws6CPeaS4MNXgVNCy4SNxHfsT1vepzYbrss/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=it31qk/zpZ9dJqnupJp3wzJpN3CanlMvczd7TxYGnYI=;
 b=BytbHh5PUKkAVaUzYrkDmbp60CTQivWIhKKgVg9bM/0SCyeIBxtsgMoojG4P5wMRfm4I0Qxh4p6A8vw/78PS+Z11MtCW0+ijQ5OgYWVsueQ7imgbqUHPsbj/3jdOA+eH908r/4HPc2dNKtILIenO1Ox+N3LDM+vi/Qi6gV46+rjz5hitllUxhuOlM6WaEdDQU84uq1xh1QE10NwqUwingh779gvTmHI2Af27OIwIC8I1KcITlPmuUkWsyN1vEMhgmBhLmtJzi0bLxT88oDQcp/gUB5bsAxIJJZVLcxwsp6EC+DTMnRjxZy/XrknYo8s7BnxMX9nSuO4v44Xxx1ii+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=it31qk/zpZ9dJqnupJp3wzJpN3CanlMvczd7TxYGnYI=;
 b=HJBpHuL1cgJ91xipwDUwYQYTvq0csCcHVA3xFpH35PMvg4Xb+btfk994qQumOA7ss89ak9hAhZBqyxZH7/g5zwUACOEgWDZxqMddCAiCRuRbO893quaFBxL9kLe78TI0aSmFQp5eRe+shX1AmLq/JWK/U8Ntly6nneQ/3qWsP1ntJ0gbTChHvnVWAmVdzCIoyA9quM1prW4fo9tBY+ZNHhq2ZFdb/0D2MH4cPH2V5Tm/8Pc/rOTNuEZ9FY7i3QIeuGJp6623r2E3koc5mK5Yw5t5VkqvpXlqzBd+PF+HhegCx9+spo7B6hl7QoInzaQxH237rPg9ARHK3hQokQTWOw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by BN6PR06MB2788.namprd06.prod.outlook.com (2603:10b6:404:11b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 13:29:11 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::9999:3123:e227:5259]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::9999:3123:e227:5259%6]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 13:29:11 +0000
Date: Wed, 7 Sep 2022 08:29:06 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: Add byteswap order to chrontel ch7033
Message-ID: <SN6PR06MB5342DE0461F8573CE1E6DC54A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220902153906.31000-1-macroalpha82@gmail.com>
 <20220902153906.31000-2-macroalpha82@gmail.com>
 <YxKdE7ZQ97NsuqZk@pendragon.ideasonboard.com>
 <CAG3jFyu5_ZOn48=y=5u=NyALefczQUxiwVJnJW=irvE5sK4tKw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyu5_ZOn48=y=5u=NyALefczQUxiwVJnJW=irvE5sK4tKw@mail.gmail.com>
X-TMN: [YSEFTSVK59+B2OlWZ6nfKF/WlvyFOP7+]
X-ClientProxiedBy: DS7PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::34) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220907132906.GA29500@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea434d2f-0e93-44bc-eeca-08da90d4f295
X-MS-TrafficTypeDiagnostic: BN6PR06MB2788:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7n71XNMZCXiWmvjXsK2D3xmVTcE5bZH3a2jNqalSH2kdJj/jW2yrg6Zun8G26fmPgKqWwcE1G2yFNbNYMVpgDW0kEwPOFLeS/uh8L99MzBbKVbIXvcvCZQ7SVPcFBI2c7rkaaOgjCUeyixGnUg+McZQdGUr/s1AXxXTBPavuRktoTqTDAieZACXivVpdxhWB2xf17ckQVVp8mE/oFaI8jroA5bhhb5Npk9Mc1VUhJuK97nLg16cfz3MUC7nYQ+KEsiuKvM8kcaf1ZbHM7a5ncQFHrBRFLZxTRBk8TyIrTYQboHn/ZTONLBSEpHRlA8EnAxY44QG5xw4meB45vdhDyBr29ByMcIsJtwZbZVVqeDCZ78nL7EUD3qmsRf9kYJu1OndZ4eZAsPBEnZCBh7D6CEPcODlF30+MEXGcCfqbVdnci1DwS36jLXh0GJgnnxKApHZLZPTluFjjjkzoid2Lm7TanvQ/Bq1n+yJf/5/ixEgL4BRve256LRzyi9T4jzIWnqbymq7uaX5K+wCwabmRsF3W80Pc5n3Sc6pzq6dhvEMahZZA0L/UIRSQHJgS5Iec0MtzIzrPS2rrI2AiZ++NAkLDQT1xyBSeM6NQg7l2ge2xzuCX3Zes++4rgVPxhuxmBC1bTe0rr+PhxofoGlNoh2pJyQcGVP8eQJuQOrATRniP6ITNtzBH49dkphDGq/p
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZVb6PNoY4MLfZX3jvYOhz5esXQo2R0Iq4f2JqAeOxAJZJdG5tSpdxbX5PNZE?=
 =?us-ascii?Q?crotiGnAZrcBsTc8d1/cwTftNSGiYmcFnEgTAnIeTiEyNKCXYqxdDZ8JUbLe?=
 =?us-ascii?Q?IVBIMgb4NFXVNjdQ2RZvNXihuA170znfhn21n1dXX9O8lpSRFMIhxYyXV692?=
 =?us-ascii?Q?c5qTYIiDpoEW7/8oRmw/GJvIDF4zy+bssdugPpHV+jxva8CW7/S9sQnWzQ9T?=
 =?us-ascii?Q?nof0bTHYWvrLF8S4IyzLuIfrG59K1NzCcQokezwCEKxIVVYOLM7N3BO4WbeP?=
 =?us-ascii?Q?m7/KCSZYTh3gDbgbg1qxQhwyyvW5WwbBI4nMubc+eA4g/4Dq32PK2l8bt5R7?=
 =?us-ascii?Q?CnKX1UJQUmW6r5gBVuuyenYskbMuDQXwJzwTaAVXNBDDxQXIHAeeJ3asjAH8?=
 =?us-ascii?Q?F3+E1w7Ac87To8K+p1sg2oH6nWsBaGRGr1lOSV0KPJOeMvN0caZ0vagf/1iY?=
 =?us-ascii?Q?K3a1owrW8unP/rIYpoRXlsD2GzgtE8LERa7cy3m1e1obUzfoqWW+1ktsCfNs?=
 =?us-ascii?Q?5OcJgL/xxh8PpH/j+pG16rRmI/pnkJ104FMG6ztri+hf/RVFxh1P9U2yHdL3?=
 =?us-ascii?Q?sMOW+flrUhcpxYzmbkMX9KrFu/Tkco6mEpBpURqQSISlaTDqgZi8yzIV2jqq?=
 =?us-ascii?Q?ZjGcsBqotVJmYcrzv1J3x9Sbqwj4okYFgfT01FN14GCc4MV3xJ1lVtCiOnBM?=
 =?us-ascii?Q?pSIzfhEUQbXSHVIhu5/Xm/pN80FC3vv6lW5WG9OLJFcmnFXb/Aj3Yxt9BpLE?=
 =?us-ascii?Q?/G7B2GhmJrKKnNOgPL6p16Rg0ztxUuWktLwKv1DXLxos8kMHa2Oqhthb6Xdh?=
 =?us-ascii?Q?G49wwMsFyOt59qfFPcwaHA2v8zf+PmOHDFUJoU8bUZjXHCTCci3Q0xOwZy0l?=
 =?us-ascii?Q?4+fZykfdBiZVe0aq68ksOF24JA5Dysw1rSc1BpHE2zK4TIz57zHHRTakDlx5?=
 =?us-ascii?Q?hpPTrSKW7b5OOa1+OErmz0w28ZOPwaBWVRpQaCvqA/yOQGq5RGD0oBp1gdWx?=
 =?us-ascii?Q?5dK7jJnm8h4Ne0OtAy1OoIc6RUX0DTTjyLQE8S0fivRVla+XruOtFB9t+pNW?=
 =?us-ascii?Q?NVrP0Cn6KjME0IY/9wI1gGhkxpt5OpLkz5OZSQwT8iASpDk/rXUPaziwlRWb?=
 =?us-ascii?Q?iilpoznCXtXtR1f2KXdZfDG2gHb4ZalEnMjhuocJI25kc3urB7r3SjXu+B4r?=
 =?us-ascii?Q?p92wWvEDhvClUWC7T3MImj60i5gYSUP4WaAJ0bbU6GPmIXpiEuIiurZk79cG?=
 =?us-ascii?Q?rN9EQD21ur9eTuKdEutmgC6dIQvZU40b7H4uPOzG5w=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ea434d2f-0e93-44bc-eeca-08da90d4f295
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:29:11.1068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR06MB2788
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, lkundrak@v3.sk, andrzej.hajda@intel.com,
 robh+dt@kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 05:20:57PM +0200, Robert Foss wrote:
> Thanks Laurent,
> 
> On Sat, 3 Sept 2022 at 02:17, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Chris,
> >
> > Thank you for the patch.
> >
> > On Fri, Sep 02, 2022 at 10:39:05AM -0500, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >
> > > Update dt-binding documentation to add support for setting byteswap of
> > > chrontel ch7033.
> > >
> > > New property name of chrontel,byteswap added to set the byteswap order.
> > > This property is optional.
> > >
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > ---
> > >  .../bindings/display/bridge/chrontel,ch7033.yaml    | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > > index bb6289c7d375..984b90893583 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > > @@ -14,6 +14,19 @@ properties:
> > >    compatible:
> > >      const: chrontel,ch7033
> > >
> > > +  chrontel,byteswap:
> > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > +    enum:
> > > +      - 0  # BYTE_SWAP_RGB
> > > +      - 1  # BYTE_SWAP_RBG
> > > +      - 2  # BYTE_SWAP_GRB
> > > +      - 3  # BYTE_SWAP_GBR
> > > +      - 4  # BYTE_SWAP_BRG
> > > +      - 5  # BYTE_SWAP_BGR
> > > +    description: |
> > > +      Set the byteswap value of the bridge. This is optional and if not
> > > +      set value of BYTE_SWAP_BGR is used.
> >
> > I don't think this belongs to the device tree. The source of data
> > connected to the CH7033 input could use different formats. This
> > shouldn't be hardcoded, but queried at runtime, using the input and
> > output media bus formats infrastructure that the DRM bridge framework
> > includes.
> 
> Chris, will you have a look at submitting a fix for this during the coming days?
> 
> If not, we can revert this series and apply a fixed version later.

I'm not sure I understand (or know) what needs to be fixed. Presumably
using something like EDID we can predict what color format we need to
use for the connection between the bridge and the HDMI device, but
wouldn't the color format between the SoC and bridge need to be
constant?

If there's something I'm missing please let me know, I'm relatively
unfamiliar with the display subsystems as a whole. I'll be happy
to make the change once I'm clear what I need to change.

Thank you for your help.

> 
> >
> > > +
> > >    reg:
> > >      maxItems: 1
> > >      description: I2C address of the device
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
