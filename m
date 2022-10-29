Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB460611F53
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 04:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0705710E91A;
	Sat, 29 Oct 2022 02:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2037.outbound.protection.outlook.com [40.92.42.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D2610E91A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 02:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR1TDbxfn6/inKWGj6R+Sm0qEmM5RAbjUAzhrg/BBe7/ikahMPZ2UuSDg6XCFWmm2D0yWnqSq4SM1Sk6E796MrOb0HcK+KVO7zLvZN5YqlXyfSvxIQ5oea++/GA1QV4TxZMLgKL9waxB0e+PeGpIGZ4yp7Zea60uiuyC0VFfuSzp8Z+8AR/ozz43wde+PXUDvL6wDkEzcYjUg0PnOshab0m2L1TMXWkPYKgdZrEcdy9rRK+6sOf0jlQgpLd+1dHwOQOIMbCoPjLmb4YWBtjUCbVjzwOT3QtzOd9bkwjJwPxbtH2EZS/xGa32qRxBZ/yT+mKoI/ysHSAuUpI2kNTqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bMERPlyFYLSNcH0/2UGhFTZJhNE/aki+ZKLn9/eCF0=;
 b=gUbhtPVFHNQpcuucI+gFmpLxoNIN4m9Xt/mOlvpzuiHbx2zsNzVEnnTrjz6ui0S7CgL52L2rB5fRr/TTWEfU5J+XwXmFLMVbUW3rYjMK3nKX8kHytki7LvHHyu/djER+9s0SlGVNEGO9Wdov1qUaGf9LCXyV8X4ryqXLAXSiXeLjG3NVMfu9OSdqNVjw3ymfNVxZzF8drPT1YQwlqUzGnSllzf2s3ba7jmpnPKhfxhshN2cEessvFp2tgSMg3F7XHOhPQcXp5KFVK8wfR2fiKNqyZb7mrvFe/8wFvJjcgCXrMkUUa0qBjhvpE0W6d1dE8p8aJjFVSVR+1MS5wcKN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bMERPlyFYLSNcH0/2UGhFTZJhNE/aki+ZKLn9/eCF0=;
 b=VwIyLysP0SbIHn/+CNYToX7VEZSi260l9YVYAqbD5WBUEPq6iXO5wQs0cP6cohRd2z69w3bGF5wjrqg8rinaaql1E8283QTWwpW4hVSs5tVU/hR0x7DwJX8kRswR13mSgyPWiPxh1gqqKXGsuMiui3WheuandwoHcVIObyF28ZTSYq0ZW2vNVtp3yaCPcGQo/MvRlrW0dvgnvmf/L6i940IRZurTz4Tc632CspEipZBK0xQ94Tz808F9mtp5pFAJZI1JHn6x7jgg3muAavuqfVj1fD6Qa/Ddt/6WkWhalBSmC04aLHmY+1exDWjzSb+kMTsEAS4wRtAHZwLTj43+VQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW4PR06MB8332.namprd06.prod.outlook.com (2603:10b6:303:12b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Sat, 29 Oct
 2022 02:29:04 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d%5]) with mapi id 15.20.5746.021; Sat, 29 Oct 2022
 02:29:04 +0000
Date: Fri, 28 Oct 2022 21:28:59 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V4 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <SN6PR06MB5342D758FFA64096002E348FA5359@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20221028205009.15105-1-macroalpha82@gmail.com>
 <20221028205009.15105-3-macroalpha82@gmail.com>
 <762efc62-cad6-609b-c82d-01a4290e5948@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <762efc62-cad6-609b-c82d-01a4290e5948@linaro.org>
X-TMN: [zNPjBcT90N0AaPEuhhxl3F8gY/TtOXmD]
X-ClientProxiedBy: SN7PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:806:f3::27) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20221029022859.GA25369@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|MW4PR06MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: a7712879-2319-43a6-4405-08dab95558ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxzNP2EGocq3FHtZ1Ml8I56B8cCcqWlOcthPzKkPDltJswBkOl2XZ2kiE40jWWcnzXp49oUo6iXccu6fSCrUfXctvQ3u4vHYYnMhHRMTowbad9z5W+rJgu7sqXxmJxDdBHpc7cXwTyuKUhh8E+Wg8+Cqhd4NeDcRs9dn88HnrvzYu1r6GBjCyfJZH/Orn/wJ4Zcv1RfedXWN6EdFThyLrv6wuZqMGEVAFW8Zz9naaRtpJHvfi737WLmpTr8JsLBq406PMMQRFIWxTniwdCtHvD6BneKXEvWd+L4qkBh487qg2TGMspGj9fC0ElwHu0ihxoqUIarrvWqP598/9A2w+ESLEJ9VVLZm4pGHs307TFkUybt0wF2hswQs/741C8MvNOAzTMQOmIttsV3Qp/VrtW3tumA8LHgfYgtEFoWqH33iix3L+mCqnrq6Nbo//OI4OLfOo7t8TI9PzkJDHq4shn37GrHtn52SAbsZ2sQ9Z7CVgHRWBaueC88BgonKeL14ylovFERf8IR3JJe5yN89bq+s4kXzCPXkHZA9XgGkgAT5Yl6OYAxgCEKC4WlrvVP0uZQX1vJ7A3lLoIbDh2jE/AVSYNAiqYL1wR6xy0oynTGR6RE336tqbiZZ1FGKmSccKdlw0tUsi6BYRVF7MbxzWFgwm44Qke258+Atdypn+/5hMQfh/Cj15cY3SneQYU7q
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZdEjfa5StSzOAuSTkLyhFK2tSY1vknwC4IWDpDn/+hxqCBpG5y8B7BHYPUMh?=
 =?us-ascii?Q?WRTECgUW4M9pzlBejvEJ80jQTCm01owh2g0EcQnmre9PgwdtW5cs7KesFHLZ?=
 =?us-ascii?Q?Alp4DA96+jlDDcMC7eDpvglfi8jkjtwPQdaRbkJa+i+56e2kmNl+XsF4ZvB3?=
 =?us-ascii?Q?SII9H5PNhScvfkEU2e5rdrPSdeXGNeDixECAExaOTkrgAnXKDcebHi1d/qtK?=
 =?us-ascii?Q?fvdvk0n9M5bZzjDPy5+q4nLMmbU6fqmQmVzgA7cu2T6mdl0wkpHK2IDnndJw?=
 =?us-ascii?Q?cwn965IbhD3FmEt4MbPn7QUJnWYa6TF+Yhy/9qsRRLH8FRom1yav7+8/et+o?=
 =?us-ascii?Q?0yZEjQJGcOM/q5OfIu2Oac69Hn68LTMyP3Gg5GGJZEdJLxjltUrQhQjpvn+H?=
 =?us-ascii?Q?VCMluS4XyJ4eBpYAv8TNoTyvtBwYmt0AcSkCb4YtOzXy5YUOgKKDJjw2pxcX?=
 =?us-ascii?Q?ZeH2C+oegwQihJd4zeQTCAL8wrKRn0UxL3OzXgHALNlAsee7qeeX3UvxUtk5?=
 =?us-ascii?Q?Xv4x+UyYELMhFsJOc35brx6Al9CQMUAVVY9VE3oQBtFU0/2C9n8zbDRRQZB+?=
 =?us-ascii?Q?hSgzcwHrzjhktl4x6Ptin0Pn24LHxAlzfIYwHw/fK80n5m2GwNET50+wDVFB?=
 =?us-ascii?Q?qmj2++ornB+Io6mOyHk16rtkDxMCl2F/rJpO8JJHCxf8iKee46PS8mo9N5Ic?=
 =?us-ascii?Q?BHH61lhYPmBMNjdARAXLKtDsz5xL5tgz/VYj43c23Vz3g3EuCizvdU/prhCU?=
 =?us-ascii?Q?wYQqsn02wy3AZOtyY/zc69ZvBMG45tdYNGKk71nGLSNtVnJeEthgvnGMcziL?=
 =?us-ascii?Q?bsQ1JIpaVjoJQ6Sa6/N/XK/qPI1jAKHwAzpzG1Hi7/ZZpTnH9aCs7HxPYXL0?=
 =?us-ascii?Q?GEiM94Rp49Y2GJwdzgoOYYRs6sxl90nk1JqFmpMa36oLXzI4pMSpF5U7FVB0?=
 =?us-ascii?Q?aS+DE7eBOoyrlG16e0Dau4Fv0Vh1hUEpdKmY5Ya+6xKQMjoyMcaRpS095qWl?=
 =?us-ascii?Q?aPH8i5juvgm72KcmfXj3h0FTJhA/zhCiF+9VR7YNeWyhlJFVFDbFnldXu93V?=
 =?us-ascii?Q?ARWUaWoR+3nVgC8AvfnwqnpC0Oj/PCoy14151Da5eeMpe03nKVYqNolV2VKh?=
 =?us-ascii?Q?BhhFw+uy95+jWJZqfBY9m7viNnXTe+EEHORnEi3mCV/cns0fkbjJyqTpTZc/?=
 =?us-ascii?Q?Y5QP841KRlF1u3hW/nJ61ljn9hPHy9+aOISG4cZrPuBhBOqDTaCQefCXEE4G?=
 =?us-ascii?Q?6bAr17S2HDlJZRYH+hS1QdA40wLmZDLCu6pwgRZwNA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a7712879-2319-43a6-4405-08dab95558ea
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 02:29:04.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR06MB8332
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 07:01:12PM -0400, Krzysztof Kozlowski wrote:
> On 28/10/2022 16:50, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add documentation for the NewVision NV3051D panel bindings.
> > Note that for the two expected consumers of this panel binding
> > the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> > is used because the hardware itself is known as "anbernic,rg353p".
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> Didn't you got here tag?

Yes, I'm so sorry. I always seem to miss one detail each time, I
promise I'll get better (eventually, I hope). This one should
already have the "Reviewed-by: Rob Herring <robh@kernel.org>" but
I forgot to include it. Literally the only change from v3 is the
return of a function changing from int to void, since that changed
in the 6.1 kernel.

Thank you.

> 
> Best regards,
> Krzysztof
> 
