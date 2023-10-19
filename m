Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9127CFD4C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 16:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DB710E500;
	Thu, 19 Oct 2023 14:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2067.outbound.protection.outlook.com [40.92.21.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECD510E500
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuGD60ROio8VGWA7kdrfRMCF73A2UBi69JQnUpap93hW8dksO7xF/DNgJeGfdhMjeQMMDE980DZsbwkx0zoMsTPA6qyPLNernTTk379TBEn4548f4yzobcLm+/62RluB4AdN3guw/P48KYKod+r2bI+Ihfi5y32hzwxCjiZozkVmUd1+IjVSaGtUvXT4CtTCtjX/rAjm4NHtQP9IUki5C3+SoQaLXmdzr6XNXZPjJ9Hm8D1z0CPpr5ihOQEasb1mYivzqgH/DAZSmpxpo0zDWxvxJCjTZb63BwPDd1CG/QhMdNR4TlQp92MOFImi27dZ+Fzh6k/UGCbc1Y3geBD1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I4ZZkoqhjSuOARM339cgVz4z+/KI3kg7BtPs7E/RGM=;
 b=Pxy1kn/RB3a38mVpwwYIsp0A6smcHQvgDkaVHQ9wtTa5ODSKuRFReghxw46Z9Z5aU5o8tKKByG+sWgNzeyTaHxngXmtTjPkZJ8WGfwmF9Kyymn8FdMq7Mwi+JaeVV7UyO9cv5RNT9d0wK3qYaT2gW4kY1o8bzaq1qh/7zW3DY6Nbueu9qHnKiXb+dIRkBU68WWPl6/C38Cg+Tt2uSJkKlEp6aTOzWQZ+U1K6fVgiPOFtM//f7X4qxTv8zfeqsU8eQ1RQG5krttGRIwjNpCEwepPvFic7W1jH+Hd0b7aUknkhoJT85eKK+Oi8meaYBBplgXjFJvSm+fr4FGax431HZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I4ZZkoqhjSuOARM339cgVz4z+/KI3kg7BtPs7E/RGM=;
 b=GmJ8icQ/zz3HwUZF1CiNP+Nx6wCUCVRvazVPrGEjgJz/oeYk9C9Q7hACtzVkpA6SmTx4g/gEKA1xvGmTnjd0iyXh1e+OBV6k/RoW+6LWFt2TSoyc43mi0l0m3bC1VKMzcHSXPk6qOt5ooKhjvtdKLsnBMKw1DBglL5QdI9NTCardEaLNJknIzgaiwOvww7Si4ZkNjsDeEpvz1JB+vxCkwCmvNuY4AaS5ka/4xZBe1TZ9XaJZZGcTJNZ8slroCbJvXsQZZAoMHG9I6t19Ctb/vhoFzL3kQsx3A7o8H9FRN2C08i+fhUHGOj/Cox53+51gbaOFxG4MvuZUhgLKMgKW1Q==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DS7PR06MB6855.namprd06.prod.outlook.com (2603:10b6:5:2c6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 14:50:41 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6863.032; Thu, 19 Oct 2023
 14:50:41 +0000
Date: Thu, 19 Oct 2023 09:50:38 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: Update NewVision
 NV3051D compatibles
Message-ID: <SN6PR06MB534271680DB8A3A3F0A1A31CA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <20231018161848.346947-2-macroalpha82@gmail.com>
 <e684983a-9399-4fd7-8fe5-41faeabbfab1@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e684983a-9399-4fd7-8fe5-41faeabbfab1@linaro.org>
X-TMN: [6kSOxYNG+c2QUq5xdZxnXtJwuxNNPM4j]
X-ClientProxiedBy: SN1PR12CA0095.namprd12.prod.outlook.com
 (2603:10b6:802:21::30) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZTFCPiR4Jbmjrq2E@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|DS7PR06MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e912031-acf8-442b-fdbd-08dbd0b2c377
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GKcqmupYMxW/zjBY2VTtwT2SqNTCzo3FEI8Zk/kMbO1arH51W0oLCkhJo6RHah2NyDSCrUngUfFpy/lxCpJ06T8PTN96yGmfTzoi5AoA5/ETOls0dkOcuIUz+nrI6qWjSfLZvnBg8aYqTnT2/Q6jKKKxN3oET0BY09G0cZxwGxtzIAlIPSPYafAg0LYpdV9+6fxVbCRJx+NAh7l9ExibdZ5RJ1TMK9SkgOm7JlCyAUqhtMEA/MkZf/jE509dGtZg9+hWLXsH/0IxdRriHs2I4BWwyJNWu0jwflOomPKLXEwd7DygEmkH1RBYIB7LcD7IUa0OICMHVN0Envhi9zF/T1j8G+kqbEleEbFhOIF+n/F+fP0X0+qMH2Tf2xMwQg7+pFdXZU3R93ed4VGrwz4FjYmfNYBxV/Gx/raFOK6dz3gRJfiG6VTzybzBVDGnEKqn79S/QRd0CAQxx/lI8D0UvmFCbDwARJAgOc8GsfGRKLfYi63Mo9+o0LjuCdTVdGxPt3XG8A2m00j6AA+awSPZGxb0YEr2/5W24s2F4Q2p2DIZ8w80lB4YMULEM83PJ9RA
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/dDOkNZifF4L7VjVs4ea57uBuY2twV5Eg//F/V2m4ie9wXtBH2wMvjuKX0B?=
 =?us-ascii?Q?om8fpUp9CqwGUl7eG/oK2CwWrUX/7u/lwYfU1/MGFgSRjfrOHfMA6FLrHYtT?=
 =?us-ascii?Q?WvizjgOH3lj6ujCQs9qY6lfFBQrTLTeX4xvb+G/VWC2Rk8Pq6ZL/YPZ4UMo1?=
 =?us-ascii?Q?EfrZKOba964RksJ8PFub9UZfZv3JaoyugGHomNzl6WXLtS2yQvYzbkX1mFfQ?=
 =?us-ascii?Q?eLhkUfZZfMSZ7GqpZ9GPPiiYSxQ8afjm3t33ZbBYdlGKq1R4UQfslqW0uyW8?=
 =?us-ascii?Q?wR7x1AA63nJ8QlSVJ0lHPxbnfZm3iuU2H3X5fNjfnVdg2CpKS3M0EkoyMS2Z?=
 =?us-ascii?Q?sVReYUqNg7BTyigBwIYsQHuQZh0+UuoY58H8If0cccccuen0/YbKr9Zn8eey?=
 =?us-ascii?Q?SaHDYCZEzjvqZKRzq3FdgfzUuLPcHvDQS3wtnjkD+L9f3kCzrGizYxVeD8P2?=
 =?us-ascii?Q?hDhWMk6c8XydkLEsxwIoIGnrlCUMz0QhBNtFLYI6tNB0s7IdGABHjsg9/bxr?=
 =?us-ascii?Q?VnD2nCQHv+bWsMrQmcg1N+bp6qxEWqiGom4ZQxWNJ+zBX51LFoQ72xy+uDgX?=
 =?us-ascii?Q?N+6W+6XtuYl8tvl+RQdLAK+G/JBKTzNtlJsJVERT5+aNMupKsut7Dzh6/6Am?=
 =?us-ascii?Q?nZxl2euxz0bvHaGuCbILw12iUQ3+5fOn77ua0tgeLGqOwxrat1yKacjcOswO?=
 =?us-ascii?Q?m8WjYnkb9l1wZRX/RzdAuPwgboDydH8kN9UhY3DnyOgaAAQGY+Uc0W2uDqWs?=
 =?us-ascii?Q?uzYDjZ6XUx4J3EgvrQ8fOKn/vK9m/d+WGNm4II/M0Pb9DABewJuF3NQlB3oy?=
 =?us-ascii?Q?a4HY+XwBAMMWqSknWRQsWdpH9L/ED2ZLZKzRoD04AGzLjXtVdtxHhCKxkwAS?=
 =?us-ascii?Q?iwJIk3AWAaK+HbDbAJbh+XiVwgUfIVwJRsSVVOWoFrH8J5J3CiXDsosZoaPg?=
 =?us-ascii?Q?r2BlL6RcG6RdgowMlyJ1PiVb5UNSFEGh1qNuwI9ucg74FtJ160tTrx9APHCM?=
 =?us-ascii?Q?c4fCWyjOVDfo8RBVZAO28SYM1yHXB14HJGGH03mYZu0YnAJaVGhTDtenXjRs?=
 =?us-ascii?Q?f9Z9YygigHnVVu/k/aPukdIwE01uLh+0WCRqwqk2+V+UmPf6sj8vBPGFTNO2?=
 =?us-ascii?Q?4MUrSdPt9h3Qtq6PeHM2OrftQhNba3E6KaqtLLICqJHllcdagnDUX4qosBul?=
 =?us-ascii?Q?En19lR47ydSEolGLznAtleoTURzUUSI2O1twm/wSLaviMptyW+tRtr4NOVY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e912031-acf8-442b-fdbd-08dbd0b2c377
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 14:50:41.1239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR06MB6855
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
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 11:22:19AM +0200, Krzysztof Kozlowski wrote:
> On 18/10/2023 18:18, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Update the NewVision NV3051D compatible strings by adding a new panel,
> > the powkiddy,rk2023-panel, and removing another entry, the
> > anbernic,rg353v-panel. The rg353v-panel is exactly identical to the
> > rg353p-panel and is not currently in use by any existing device tree.
> > The rk2023-panel is similar to the rg353p-panel but has slightly
> > different timings.
> 
> This still does not explain me why do you want to remove old panel.

When I originally wrote the driver I only had one piece of hardware
and I set the compatible string in the driver as newvision,nv3051d.
Unfortunately since then I've found 2 more devices in use that are
*just* different enough to require the driver to do things a bit
differently. In the case of the anbernic,rg351v-panel I need to
enable a new DSI flag; in the case of the powkiddy,rk2023-panel I need
to decrease the vertical back porch and drop the higher frequency
timings.

The best way to accomplish this was to change the strategy from having
a single binding in the driver of newvision,nv3051d to a binding for
each distinct hardware where the differences apply. Note that I've
looked at querying the DSI panel ID, but for each device the value
is identical (so it can't be used to differentiate the hardware sadly).
So the driver now has 3 different compatible strings. I could in this
case add a 4th compatible string of anbernic,rg353v-panel but it would
be identical to anbernic,rg353p-panel. For the moment we are using
anbernic,rg353p-panel everywhere (including the rg353v), so it makes
sense to drop this unused value while we can, at least to me.

Let me know if you have any more questions, thank you.
Chris

> 
> 
> 
> Best regards,
> Krzysztof
> 
