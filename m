Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF020B354
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 16:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732C66ECA8;
	Fri, 26 Jun 2020 14:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866B46ECA8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1YCAPd9WSV6hj3Syw9hKghT4sBqej2ZvsjrvPsb06o=;
 b=BZU+NiPPG6wE9NJLasat/t9BX/ED6Oiu/5hzSk3yOCa5hEKvWH87DpjNLt94mfnEhmE4Z+26zGFMf2RydfNgFViD5c4hargtS1Cn5Ohr2XFDdGc0cbg7r9tInviVr8qlxmXknhB3z5YtNCgYK/XM4T8/OOyqaV0tldJcTwjy2DM=
Received: from AM5PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:203:91::11) by VE1PR08MB4640.eurprd08.prod.outlook.com
 (2603:10a6:802:b2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 14:16:06 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::43) by AM5PR0502CA0001.outlook.office365.com
 (2603:10a6:203:91::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Fri, 26 Jun 2020 14:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 14:16:05 +0000
Received: ("Tessian outbound 217a52b9caed:v59");
 Fri, 26 Jun 2020 14:16:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a5be40a3429317f
X-CR-MTA-TID: 64aa7808
Received: from fbabd4c7b729.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BAB6AFCC-60E6-4CA4-8C17-4C45BA1E6EA6.1; 
 Fri, 26 Jun 2020 14:16:00 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fbabd4c7b729.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Jun 2020 14:16:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkbB+sdQ1aV15SAFKbm2PuVnJ+glotOZNWPBF7HMjSJ9+5MHOgDWdeg94zJNTkJHdgHXu/4q7Xo6BmjQrjVMHNTSi1KxNJtIjg9wWFJ2DTdIf55eSdVF7lq+TUVkyWC/1H003LphlkkY6mqwSq5BpDO9pqLaeNP4palig8fvJUQ2/CmUdeQTk4C+kyLxWxXNrhLKgHLSzfrJdaQX8ZyQDgApDXWpk+4oazmoibg4tEgwD3UbpqXrv84BZKrZf50qryaqXrTbz47U0wTm5DnKLfRByyf8R4I9jb198KMx2gtTfDImVkfQfXnsXhhmYC3N2Zcg+Wi7g8lxhJ61UryDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1YCAPd9WSV6hj3Syw9hKghT4sBqej2ZvsjrvPsb06o=;
 b=l857Lm8DkdtTUNvdiom+EDr2MB0Gkz73uGgw4fX9oRILPQGW1FSujwI0RQTzTDz37LuFR/1aQRBL1Eh6wcYtfsYKkkv7BsIvvUC0IRfoJFTYRTvxB9K00Fxgz3Mlc6ljeTFjjzL0m9wHUHUn3h2EAwpx1Z9Td+PCXmHDePvvMGIrUz1pWfK1abHMxqCEWh/X/Tu9UhhrdoCdzsi2YFeWe44QSd4Bn5mjN5XR2OXnioTnNRbTQOHsaS4KE4v3FsFoScEav+MnorhOd8mwYbwmA+Gj0PPNt3wpEojqszzsVzVyni263o44l//XjzKkkcGtqDIpxL5eoPMo1Edyvww0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1YCAPd9WSV6hj3Syw9hKghT4sBqej2ZvsjrvPsb06o=;
 b=BZU+NiPPG6wE9NJLasat/t9BX/ED6Oiu/5hzSk3yOCa5hEKvWH87DpjNLt94mfnEhmE4Z+26zGFMf2RydfNgFViD5c4hargtS1Cn5Ohr2XFDdGc0cbg7r9tInviVr8qlxmXknhB3z5YtNCgYK/XM4T8/OOyqaV0tldJcTwjy2DM=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1625.eurprd08.prod.outlook.com (2603:10a6:3:7f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21; Fri, 26 Jun 2020 14:15:59 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3131.024; Fri, 26 Jun 2020
 14:15:58 +0000
Date: Fri, 26 Jun 2020 15:15:57 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: drm_fourcc: Add generic alias for 16_16_TILE modifier
Message-ID: <20200626141557.g7vhzfyre764otr4@DESKTOP-E1NTVVP.localdomain>
References: <20200626135233.32137-1-brian.starkey@arm.com>
 <CAKMK7uGCQV7XptAAycHG_XOW-VOtHpUB2qqp2Kvo+3oUhkmOQA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGCQV7XptAAycHG_XOW-VOtHpUB2qqp2Kvo+3oUhkmOQA@mail.gmail.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0402.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::30) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 14:15:58 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1bcb6648-c153-4031-73de-08d819db7715
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1625:|VE1PR08MB4640:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB46402A702EB918487963ABE6F0930@VE1PR08MB4640.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sSE+X3WT9yEJ4Fo9cXpEXUT+pcpfVujNhyAyKFTuoIv+RsDHMBcANpnMOt4tSnt9drbEJkVYyLwEk6WzM6McwTSebNd8L/drEa0tDJyYkjt+W0V8Cr4vwOPKInM5VI6sqaaOGKETRK/8UQJuy8+v+bnsv5MeuvHyU9sYezHs/CKjWBuWOAQ7isshkb5dS+32Y2Tg3vGon2fVE3NMc5AYuU2D36FxG3cVKwWqqGcE6ky0eNKy1NeF3CnhrUkh/gnsOOdF5amYwUm5Oc7m4IUIgNmVJwDSz9xeTL7vT+bBIxgpAW37ijFVkO39bUGywU1KgoIFKiv5dBKlLUvgPxPVdSfySdrhIcygMFXVSLEurgFHRW70/rK2s5zsptUHAocE2Hr9KGL6mmoRSuCDOqqGrUx2huKwAQiCdm66KDXqpxP/0Sf0KWhEnnX2vRB2xvht
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(66476007)(66556008)(316002)(16526019)(478600001)(1076003)(956004)(54906003)(86362001)(6916009)(44832011)(53546011)(6506007)(4326008)(9686003)(186003)(55016002)(5660300002)(52116002)(7696005)(8936002)(83080400001)(8676002)(966005)(2906002)(83380400001)(26005)(66946007)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b8OPtrICf/30Isucwk3+ysLKH4FpQSC9jSY7kuS9ceXHAFi+0RdYHnCrtYaHVHcVAEFJKwGn4V909M0Zn14ifJEX3ohQVjpdTzHo79zlGmKKtb9uengK3+eTT8RJ1mHCcGeoyGNehP23n7W+Pw0UhbmVc7j8MqQgXeWGZBAYm56uyPOsjDxnEQXPJ5IfHCw3yAsSIGChvqdtFhtsDXyHp064EmORbRz2QOn0BvHJSM6CAP2rmuU3WRR5LN0tCCZjJvzsq05LnucQd/MjMdE6BUndaEztsGmtz4KVvFdGzdpD+chFEFY6AQDCZrl3j3Sdd7rEOLCt9WlCDHHdbM8pPP7N3vUp5tB1RsbbDyEMh7As9SYYUoZw/e81ODBy3p0RN8Hz8i+yhvHSs4iSljRVr86xGi1psechg0pSqIRqFS4wM1+z3tfFcdpc4z+8Hxcx1JLpp8toglkfcK7z/7LPegTRcxS6nDFqR65WIFWd9hnvhqusSJGt1Xr+l4qv+Ydc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1625
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(478600001)(316002)(16526019)(6506007)(44832011)(956004)(54906003)(53546011)(1076003)(9686003)(4326008)(55016002)(186003)(7696005)(8936002)(5660300002)(86362001)(82740400003)(336012)(70206006)(356005)(2906002)(81166007)(70586007)(6862004)(47076004)(966005)(83380400001)(26005)(83080400001)(36906005)(8676002)(82310400002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9e6e5320-9629-4102-f6d6-08d819db72ae
X-Forefront-PRVS: 0446F0FCE1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: veee+xdMYvwhZQuYQoFxpCNZO3SbrWjmCbab0czmytOSEaPT4bTjpUhJ1/34sOdpLeYtYebi2VumnQwC4NnDbDF+51fjLnoGQ9cVez4R6VBT+niXGpEH09HJGEeJHjuxlYnvqMtHQAA1TDcfxRgc7sz35v2yKrxWKSvSw7eE0zgAOchgDAvPj1pkaXW2ZUXiXGSBFCFcXUxU7vZ58ytj554O37SsydBufaYYPFKmjPdQkHEH6zzCrNzRO5TT5wWMR7MHZFbJnJDu9fpziXQSZhDZ1dXdTGRhKFVxB999+YXsR1cF4iqvQ8bsHu+NOyKFh1sZGdSlKNVjH1qnkBiLUeA1sXg1Uqreiu5YzeRrY84KpZOIY14mYOtOXK5t7lLk7FU2iRtOUUK3rDtSAHhdoAdsEkARP8cmf+fxOSxsNQNalQaxZXC1zblEBCzSIZfFGuAOeXLVbz/zLm7lA5nIwehbI8n54pwGnv7oqEOmB3KWWcD85EHKRPkNefFmXV6a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 14:16:05.8732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcb6648-c153-4031-73de-08d819db7715
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4640
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
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, nd@arm.com,
 Liviu Dudau <liviu.dudau@arm.com>, matteo.franchin@arm.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Fri, Jun 26, 2020 at 04:07:43PM +0200, Daniel Vetter wrote:
> On Fri, Jun 26, 2020 at 3:52 PM Brian Starkey <brian.starkey@arm.com> wrote:
> >
> > In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
> > describes a generic pixel re-ordering which can be applicable to
> > multiple vendors.
> >
> > Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
> > used to describe this layout in a vendor-neutral way, and add a
> > comment about the expected usage of such "generic" modifiers.
> >
> > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > ---
> >
> > This is based off a suggestion from Daniel here:
> > https://lore.kernel.org/dri-devel/20200529115328.GC1630358@phenom.ffwll.local/
> >
> > If there are future cases where a "generic" modifier is identified
> > before merging with a specific vendor code, perhaps we could use
> > `fourcc_mod_code(NONE, n)` or add a DRM_FORMAT_MOD_VENDOR_GENERIC.
> >
> > However, I also think we shouldn't try and "guess" what might be generic
> > up-front and end up polluting the generic namespace. It seems fine to
> > just alias vendor-specific definitions unless it's very clear-cut.
> 
> I think the above two things would also be good additions to the comment.
> 
> A totally different thing: I just noticed that we don't pull in all
> the comments for modifiers. I think we could convert them to
> kerneldoc, and then pull them into a separate section in drm-kms.rst.
> Maybe even worth to pull out into a new drm-fourcc.rst document, since
> these are officially shared with gl and vk standard extensions. Then
> this new modifier's doc could simply point at teh existing one (and
> the generated kerneldoc would make that a hyperlink for added
> awesomeness).
> 
> Aside from that makes sense to me, maybe just add it to your patch
> series that will start making use of these.

This is only supported by the GPU, so we wouldn't be using this on the
Display side.

Thanks,
-Brian

> -Daniel
> 
> >
> > I typed a version which was s/GENERIC/COMMON/, other suggestions
> > welcome.
> >
> > Cheers,
> > -Brian
> >
> >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 299f9ac4840b..ef78dc9c3fb0 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -345,8 +345,27 @@ extern "C" {
> >   * When adding a new token please document the layout with a code comment,
> >   * similar to the fourcc codes above. drm_fourcc.h is considered the
> >   * authoritative source for all of these.
> > + *
> > + * Generic modifier names:
> > + *
> > + * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
> > + * for layouts which are common across multiple vendors. To preserve
> > + * compatibility, in cases where a vendor-specific definition already exists and
> > + * a generic name for it is desired, the common name is a purely symbolic alias
> > + * and must use the same numerical value as the original definition.
> > + *
> > + * Note that generic names should only be used for modifiers which describe
> > + * generic layouts (such as pixel re-ordering), which may have
> > + * independently-developed support across multiple vendors.
> > + *
> > + * Generic names should not be used for cases where multiple hardware vendors
> > + * have implementations of the same standardised compression scheme (such as
> > + * AFBC). In those cases, all implementations should use the same format
> > + * modifier(s), reflecting the vendor of the standard.
> >   */
> >
> > +#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
> > +
> >  /*
> >   * Invalid Modifier
> >   *
> > --
> > 2.17.1
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
