Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA1E7D1220
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7019A10E5C1;
	Fri, 20 Oct 2023 15:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2092.outbound.protection.outlook.com [40.92.21.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2762C10E5C1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHwa+nEPG3M82kPoiRYj+wyabrT7erjIrNJ8rWe6pb3miolZjc/xWK23JHOhOzKfDRn6ZGmsLZgibOQlyLwh8B0JIIcKrJqWIjVi2kiUCDNNgne2zkKB0WgR590RCNbqq2aFJ6BREutQmdyo94CdbkqThGCfKLYlPIyFXX9iOWStP2GFYWcuxB3Vqi0rVYJRE0FVV4XPhTiAX6p0h/StB7e3qUug4FfjbEjYmNIG/pFas0oNV31/8YbOTwMdV/g8l6j7g+fDLAIBhs5Z3QlxeUpeiyVKTdsm0VSMZGphShM/rAz5/xvyJXjLt7UjMfUJe6+9uvxWJhrzT3CXmzbbMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Puiq7iX+dPTRN5eSVbIKzBd24MB8P/DYwXvjFFOJR0=;
 b=TdO+1F74mYThqnyMkH5oPXBHgq132dTD5+Wo/nRjx3M4qG3U3dHi8iGK10ez9IyYEtQehbasBLBQyJnrpf5T86ly1RA0L6SrGTsGchg8IJZ3MIu/yYjVRnP2/sTrBf3oFQAezMT4+hg2/TThSOgCGBf/XFe5pO+6op1UTPNP1WRy2y/rdrpBmGBfJT+LRp4/REktlY0eOK2wtXKUp3kX7/bSAlCgXvWmr2JwH+cVL2+a8fG+JQ7LAuNqza7IG2jGmbEzYg1lqIL1PLD3ivGg3jywMnnsGGPQ8+dPX5AdnLB99sEGO/+OLaxEyYSThHCvtCapSgLy/E697vQy9tfZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Puiq7iX+dPTRN5eSVbIKzBd24MB8P/DYwXvjFFOJR0=;
 b=qFW08pwzMd5HB8W2hd5a2psnE8F6Z9UbRrT3qxvDzPDEHaYL+fUixm/5m2U47O05KL7ws7oElzaX6gFWePGiaOcGpRTKRlewJoJ6ka/IjL9GqB+3pv4jX6jDwhfTT3/0/GAcNy06dFNClttIE8QhZ+JFQvgYDF6r2uPdDE/gC/6N8Dkdsz4jTH709GAlROyDuvffWbpKAYbbgWtjmhyBsxIaTSCejuvcx2nrPkAxViCSmvNWjXkfrsEcv+1U+NZMhwhI9uNRRCyXCGQqFjkI7s7STP0TaMFadD4Es5UB5DnBFGdQt8o8EnO6jS886NEAeDwxTBrZI7AVeb5IKbKFKA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA1PR06MB8241.namprd06.prod.outlook.com (2603:10b6:806:1c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 15:03:12 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6863.032; Fri, 20 Oct 2023
 15:03:11 +0000
Date: Fri, 20 Oct 2023 10:03:08 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Message-ID: <SN6PR06MB534206AB35C00B3D003765AAA5DBA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <df3c067f-8732-46bf-aa93-852f41e9e4e9@linaro.org>
 <SN6PR06MB534289953F0A72345D679A7EA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
 <3083498.U7HbjWM52l@diego>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3083498.U7HbjWM52l@diego>
X-TMN: [YAcPVPsMtNKLmyCDpoXP40ic1TkBJoG7]
X-ClientProxiedBy: SA9PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:806:22::33) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZTKWrOmdtMwmG+Lr@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA1PR06MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b01782-bfb4-4e64-ddb5-08dbd17dace5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0q4CuYbN6MS6KWtZmbE7A8YBqYoacsx1d/Y4+Vxo6cQbk5GYfgXYKV/9DD01R3tP/ioBvFTJyJRomTCSMiRBrEveCSczEaoWULhWziFAvmw6msNbCoZK7jojigmVs8Q4qvngYwmkrdGZgX/kxUPKLjiQnB7GOC+6o9rbspJ9apb1VyN3xYu7Jvc0zD3w1yWNewZ7imkPxzkbn1VGF81B7obzNMuFXpoOMhjzPXMD37SKbokqiiMxpop7X6bSZRNv8h0XcQOkavcpHJCxk7+6zMpAo6XY9+o1xrR6pCkgRtws7jdakOYeg3MdX8dihMk1qyG/RW2LXJPKYAwKdyk3b4UT9HjqeBCIjghtdZG5Y4cxN2EM/jODLbbQvYjoAX0EK3FBmUECaHx4HR1tXN6IZGb+9b0tGBqZHymxHw7HeNxfZP0o6ozQ05g75b/dnd84h1UMF5/d0oEH1+MJpa7V+/j5bhtNd5RdOG1z1uMqp5iUTva9mUSGGWEZtEi1y/xRtBuEeJAhrf2123ceXJUG6aFLm2ZxZue97lOw2bNb6/Io3f+r2pPcUf5SxoxTPni
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/uT4Ay0sW0tG5wHhbg0e4iTmd20Q5BMc3mAKp0jg7PPpK29jEjlhGlStkG?=
 =?iso-8859-1?Q?DNtxhyOg16oBiCS45hjRZucAlz7r1vFUq1s3mHroeIE0VOnYm3GT+4U3fk?=
 =?iso-8859-1?Q?txWd9M5WzKAa5uuaDbwdnLLh3cNWqrpHtbbYtiUbBsxrZFQLZRVw5ptxgc?=
 =?iso-8859-1?Q?NnCmOxqRp9cafQdwVcsqkDIXzfYpxO8QGYf7+P85BN/Lnh2WG4EyqBcabY?=
 =?iso-8859-1?Q?gnc0IQAOwJLtgAs493diwNF+2xiAT5eA4Bp2Zb3NL2xqm6FnzT6a9QvHIj?=
 =?iso-8859-1?Q?ABlXWKzX0ckZRTXujS1aLbwkd7ZktHY8jXhRdJSz+hie6bnMUEa3SyPFcm?=
 =?iso-8859-1?Q?XcS5OYxHUn4CDmBHdX0en57KvWbh2nziuHR5Gl9hFFBBO1/NzzFHnqCifJ?=
 =?iso-8859-1?Q?GVLqelch2mUl+Gqg/70bBNfxW8MugJAlLJfzOYaBxk4OoV++o5vE0OXj48?=
 =?iso-8859-1?Q?pRDGHSLLNeW47cD/i4hsPnaHnL6g7ii0N3L15hubMNu7mMuve/vHIuHSlg?=
 =?iso-8859-1?Q?t0M/f+Xhvw+s7aRwz7wsDZ0CtPX1f6Jhp4CpMitsJgrtFE5+v7xsk0/wHZ?=
 =?iso-8859-1?Q?bQu6JZmnvxbMykFCrcZl/kXw7NMq/cqf0/kxkaeO4qvKMjmAnvI81q7rBd?=
 =?iso-8859-1?Q?gkoW0R9XAdIM1ZEp3Nw/6ifetesj9FcPGnonumJaJpYf0ZVbohsKp/v8xI?=
 =?iso-8859-1?Q?XQY4yjKR59g9v7PDrom0B+FCGOYk3ACJWwUm4zWTWZw3gKgmu6Eue8aIy3?=
 =?iso-8859-1?Q?7fGfQhmCBglPtGsAvmL19qNErDDWzNZ+jeK1NuwFy401oxp57RfeGlg7+b?=
 =?iso-8859-1?Q?MjZTLm+JwT7gCUwf3c0SCmkNhUrkwMB6TQgH6wdMmObLKaImg5XFzUCpvm?=
 =?iso-8859-1?Q?upvvHnGYbhWAgh0/KpL579HONt6vWAVuUE6dtwLcQKbwptXWFUMsTRR+cb?=
 =?iso-8859-1?Q?aPcQXrZq3smBMryvM5ECuIuLS1w8R+2iVPT6S8mi6kZZr467tvkneXxI7N?=
 =?iso-8859-1?Q?IBt8OMRJRVorD2QqtN9bHLm3Pqa05Kwo9VHXarI5VpFJAFnGOCBk/WpIZj?=
 =?iso-8859-1?Q?8Ongjix3fxJJuvdEowQEGV2qKJ79vdxGTdJ0BR+x0lOg/kvucG64XVWkuX?=
 =?iso-8859-1?Q?cx2qaUru6l9q8YIjXXRx0qfhOtZxH1LWLm1fx+DQ0s1wcLNOu2Z+fAGNWd?=
 =?iso-8859-1?Q?NqAvtG/ab34Hw1HREuHYAT+/1t4Mnqcw3qiSaALzI3LKLdTPdOw4hScyFM?=
 =?iso-8859-1?Q?136EiRATsHDgmIl3wwAEbN4NgBBJfrOEFVBQVaJTE=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b01782-bfb4-4e64-ddb5-08dbd17dace5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 15:03:11.0497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR06MB8241
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 07:45:17PM +0200, Heiko Stübner wrote:
> Hey Chris,
> 
> Am Donnerstag, 19. Oktober 2023, 16:43:56 CEST schrieb Chris Morgan:
> > On Thu, Oct 19, 2023 at 11:21:47AM +0200, Krzysztof Kozlowski wrote:
> > > On 18/10/2023 18:18, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
> > > > powered by the Rockchip RK3566 SoC.
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > index a349bf4da6bc..a6612185a7ff 100644
> > > > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > @@ -674,6 +674,11 @@ properties:
> > > >            - const: powkiddy,rgb30
> > > >            - const: rockchip,rk3566
> > > >  
> > > > +      - description: Powkiddy RK2023
> > > > +        items:
> > > > +          - const: powkiddy,rk2023
> > > 
> > > This cuold be just enum in previous entry :/ but I remember we talked
> > > about this once with Heiko.
> > 
> > For hardware that requires a different device tree, is that possible?
> > While most of the devices I've worked on for the RK3566 series are very
> > similar for the moment only 1 is identical (the RG353P and the RG353M)
> > and can use the same device tree.
> 
> In my reply I pointed to the Rock PI 4A/4A+/B/B+/C family, which also has
> different devicetrees but is part of the same family of device designs.
> 
> So similar Powkiddy RK3568 based gaming handhelds also sound like
> a nice family name in the description ;-) .

Gotcha, I can do that. Would you like for me to go back and do the same
for the Anbernic devices as well? I can do it as part of a seperate
patch series.

Thank you.

> 
> 
> Heiko
> 
> 
