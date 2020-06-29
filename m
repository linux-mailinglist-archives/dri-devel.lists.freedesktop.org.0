Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6C20D050
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 19:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB6289E57;
	Mon, 29 Jun 2020 17:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AC789E57
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z37JlioYOg53krQV8UR3yPNt+BAVhutc/o+RBlZoM1Y=;
 b=xmFuP1WGzFK+Y+E02ahOIqk8F7SLOYn3X+Q0vOrg3wqg908IZvleMOE2LcsKzR4Fzrf4eq20XrXmYDaCaYsXpjqXv6C46YLqXypHsVUzdC9jDvl7cHGtk7aohIFhCNq5Q9qFm09nUphGCl8jO1WR7WrX7nriTiHHgqyk2QusdTU=
Received: from AM5PR0601CA0026.eurprd06.prod.outlook.com
 (2603:10a6:203:68::12) by DB7PR08MB3114.eurprd08.prod.outlook.com
 (2603:10a6:5:1b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 17:04:56 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::df) by AM5PR0601CA0026.outlook.office365.com
 (2603:10a6:203:68::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Mon, 29 Jun 2020 17:04:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 17:04:55 +0000
Received: ("Tessian outbound c282746a06a7:v60");
 Mon, 29 Jun 2020 17:04:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22d1ff3c8455ea7c
X-CR-MTA-TID: 64aa7808
Received: from 54ada7f6a703.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1DE948B-207F-4245-8E2B-3544E0619542.1; 
 Mon, 29 Jun 2020 17:04:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 54ada7f6a703.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Jun 2020 17:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dxs0n5gPEMqQaaDQ3c+ifZNOgLWMH/i9pF6GJYzE7SM4DwrUyOaAqbiH8G8dcBERwPkEF8DwObpDbF+By5d4aJ6bFjh3f7Ze1irJ0PadiqZlUuRIkLSdwmI29ekFJdLGAB6fARB8BOc1CAFQpe/rrJFtsatXhh4VyyD17Bk4/aXfcxL1mp6+/10E0QU+4QOqkaCyAVpI/UuQJHbKxYvcKISX06T8X22e5IPVUHMiFN3yTByT614pCRAPw6tni+XAL93c4TPUgSYMmEBXEOrWu2DgdPaLeA0Lzq6oEZyVgNdxfoIW1sKxvDjhfAIfJl/n1mCrV3Iy4j9KdFOMLFOeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z37JlioYOg53krQV8UR3yPNt+BAVhutc/o+RBlZoM1Y=;
 b=h4ZUtdUn9q+nR+qFN8SlkIouJ/l792FA7Mhnn0np1b8+1kbh+h+NvktskQiIPWxA4v4lIfeHsNVT8Ty4xqym8zMpM0gmKA4/i3nK6Q/rnMiupXShHbvf8TXp8Re7EbJ46J0udjn2FbZzWSfMSsYxxg4BLB/TY/wtXZQL7D142EhFaXUYGHbleJhUNSd8qKZgDSCRERoav/0rEtfv3de5E9x/kU994qOM/frwkhwWNDHsFZA39QfoznmkNgpO7ib+9FqBiqw0UFt0rZNkUJBfT6dYjPd3iQG3bEimURwGh3vELyC7orrLkNOdzdQA1F/XwaoHIXizPocRBww2oVEgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z37JlioYOg53krQV8UR3yPNt+BAVhutc/o+RBlZoM1Y=;
 b=xmFuP1WGzFK+Y+E02ahOIqk8F7SLOYn3X+Q0vOrg3wqg908IZvleMOE2LcsKzR4Fzrf4eq20XrXmYDaCaYsXpjqXv6C46YLqXypHsVUzdC9jDvl7cHGtk7aohIFhCNq5Q9qFm09nUphGCl8jO1WR7WrX7nriTiHHgqyk2QusdTU=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1897.eurprd08.prod.outlook.com (2603:10a6:3:4a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21; Mon, 29 Jun 2020 17:04:46 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 17:04:46 +0000
Date: Mon, 29 Jun 2020 18:04:44 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: liviu.dudau@arm.com, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm: drm_fourcc: Add generic alias for 16_16_TILE
 modifier
Message-ID: <20200629170444.v55yj2cti6b2texw@DESKTOP-E1NTVVP.localdomain>
References: <20200626163256.46duuouu6ebvtakw@DESKTOP-E1NTVVP.localdomain>
 <20200626164800.11595-1-brian.starkey@arm.com>
 <20200629083241.GJ3278063@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200629083241.GJ3278063@phenom.ffwll.local>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::33) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.24 via Frontend Transport; Mon, 29 Jun 2020 17:04:45 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d49e48af-2e21-4d53-80b2-08d81c4e8c4f
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1897:|DB7PR08MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3114A5B5867A8D138D13A796F06E0@DB7PR08MB3114.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: arjOg0z53FVHGujYdNnWn88WywcqAJs+RMV8bnNQnDXM+vUe8A3qwHly6sYtRGt4F3sf5ZgoDeqriJqlk22H2bxz2m7Mr/qLfCc9JEtWW7kr76Whjr88H7bVFgByemIg7As0PZWkqa2gSkHvyGMTjjBv3vxHndiXPkziVtSxMdVznwS0NaTmk7DNjqPT31tSJ0TieEGXBPuBb+8WyOxPY19q4tWJL5UxpuBjy/V5X6xZFhPI7t9EpA78CDhV5F8J8E9ftAi8exA2fISI043MRXACIOrre0FCbxs4/JZldqxhrma5qZXpoSf2eq+Rgv0fXz1WVcddgOceiuvaGWd3TgBGLutdxU+Aae3IdHXorRR+R5+rrlXJeMkOMseSUApcuu9b3xq1x1ivXWBdMGQoJ64WcXO2UV0wiPO0688fMWWAZshp/op9XR7h9l3nmy60ggj8nrw/jiXWGMj0sfQvIQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(5660300002)(186003)(16526019)(2906002)(6916009)(8936002)(8676002)(966005)(478600001)(86362001)(26005)(83380400001)(66476007)(66556008)(7696005)(66946007)(52116002)(956004)(6506007)(9686003)(55016002)(44832011)(83080400001)(4326008)(1076003)(316002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JJTqyFoR1XSsY9DFZr/uSQDL5cGHjzIVhW3hshqsLvWw6NMd3ygMhBea1SrSYNPAmYW5iz5hyNzQU5mm8UWX+rjIb/yE3D8jQvxy3iRdhys12+arRCPQrQ323OCRXWiyw/75lD8SvxQQOtcBtk1Kn2NPgGWdu2L5MsIndlUTlvaGBctY67YQ2Ez7iiVRE6ShH18bgQ0HJHVT9cdK4rTxL6VAcNRyn7/OrpLkH5/RV0u+PTRG5y/H5SFZSkU7+rkmixaJmRJuwq8PtYFBgwGNc6jWgnjsC3fj22NBMq0lcbcjRFLwfnFubqmEu2hZpxLMtt+7KHV+pghJYWQltH3zJziCjdTN8X6CV8dUwc27RnilQ0XuP+CnGZ/kqvrD1bnVSK/Skd2uCOMEQixnsWal4F5Q2BSHCWpvg8M9UxnKjSI15P/TJ7Gobd9mElwlk63eKusn2F5Zc2+aj0nvyUt0sdHd7TvDdrowMJhFy9t1QeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1897
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(55016002)(7696005)(44832011)(5660300002)(1076003)(70206006)(47076004)(6506007)(70586007)(9686003)(2906002)(86362001)(6862004)(966005)(336012)(36906005)(186003)(956004)(81166007)(16526019)(83380400001)(356005)(8676002)(4326008)(8936002)(478600001)(316002)(83080400001)(82740400003)(82310400002)(26005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 835d9209-7ed6-4c8b-9da5-08d81c4e8631
X-Forefront-PRVS: 044968D9E1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9aDqWaQVX/tVZk2O7s/1MMBdj3ao8fRBi6DBPns3FzH0ocSZ0PDkdyViBP0g9LqXVrUAWlQgzOClxERlpYqLVJvEcq6Ap1MFL3n3gEIBJ4DsQhHAGIYE81zwDXIHv4TVb1ogtiI02oqKJHXJD8GqyHRpXloX1n5qcxzfFY/NGw7z7U6BjZLlXb4Q3NL+UwoAw1ZG5RIbeYKq4gC5y3PQIp8IqtA+cSKTY8vr8htvPM3TqVc7xwIiSi8WWEdugMJWy9P+xCV87W1tjQVVRzcI4TeL8RuaQM07QZs3jR8IM2OSCnGfYYXC+3MsUpfsUM083xVx56dKw17DpuvMwjGeUM2Zy4k8VE6TJpeC6Jkqg41XEeOrvqlwWfvesI27wMnP1qdi/RnSRvAZliACVDUcdcMVxU7X7sSuIo2t+/8rs8ukRbX+hKyVqRI+mRcGwzHCgS1R1tvHDJ+W6Va23IVnxaNIaR6l5vu/ydPJbctIa3DB89/+Ly5zozjcGr00WXS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 17:04:55.8873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d49e48af-2e21-4d53-80b2-08d81c4e8c4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3114
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
Cc: andrzej.p@samsung.com, nd@arm.com, matteo.franchin@arm.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 10:32:41AM +0200, Daniel Vetter wrote:
> On Fri, Jun 26, 2020 at 05:48:00PM +0100, Brian Starkey wrote:
> > In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
> > describes a generic pixel re-ordering which can be applicable to
> > multiple vendors.
> > 
> > Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
> > used to describe this layout in a vendor-neutral way, and add a
> > comment about the expected usage of such "generic" modifiers.
> > 
> > Changes in v2:
> >  - Move note about future cases to comment (Daniel)
> > 
> > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks. I guess this should go into drm-misc-next? @Liviu would you be
able to pick it up?

Cheers,
-Brian

> 
> > ---
> >  include/uapi/drm/drm_fourcc.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 299f9ac4840b..cb3db4a21012 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -345,8 +345,33 @@ extern "C" {
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
> > + * In future cases where a generic layout is identified before merging with a
> > + * vendor-specific modifier, a new 'GENERIC' vendor or modifier using vendor
> > + * 'NONE' could be considered. This should only be for obvious, exceptional
> > + * cases to avoid polluting the 'GENERIC' namespace with modifiers which only
> > + * apply to a single vendor.
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
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
