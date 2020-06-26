Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A820B5F1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 18:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4FF6ECD9;
	Fri, 26 Jun 2020 16:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40067.outbound.protection.outlook.com [40.107.4.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3B96ECD9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Vqg2HxvrfWZj83aLOC1EBEqqBXGP+X8kBSngH6QxOg=;
 b=QMIVMZ2Y4aoN95cj2xTsapAQ5DbbyN3W6omBGsH+40b9fWwLcJ0/fh1sJYi6TgBtAxcXk1YP8SRr7YuBuMXkq5GDB9EaAVy355EfbGcTby43p8svPZBVA1pH3ih3GnVYRIwQTnVIh33NweHBYDqRSd5XzUZmxz/dgXj+wdkrmpw=
Received: from MRXP264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::15)
 by DBBPR08MB4329.eurprd08.prod.outlook.com (2603:10a6:10:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Fri, 26 Jun
 2020 16:33:07 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::a3) by MRXP264CA0003.outlook.office365.com
 (2603:10a6:500:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Fri, 26 Jun 2020 16:33:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 16:33:07 +0000
Received: ("Tessian outbound c282746a06a7:v60");
 Fri, 26 Jun 2020 16:33:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2722316aa7f548be
X-CR-MTA-TID: 64aa7808
Received: from 04f067b2c6b6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 69070D72-154E-46C8-8156-01CFC5D59B3C.1; 
 Fri, 26 Jun 2020 16:33:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04f067b2c6b6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Jun 2020 16:33:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fre5duPYzEC97nRUHJvGj0ecoFw2k+QU86VFJ7pUDHXjUKxs5Q4kMaOU7dfyiVw3T2zJ2BPz0UGWVW9dB/8IFN5deV+sQcdq3DwiUu8TFu7J7Bey9N1zN7sS/EaIAcUBbkVvjkR2WQcJERYQIrt1BNDT/IkwDYbnnT0tfMNL7L9z71vBcAA+BC77QTStI+TfLwfOBc178cUNmklQVjBZF+TfG5tg6cwV/b0FySzfbOn61ls985aZc7If5c0nhoM6Cy4jbet6AQX0i2Mu5vtYHaYgbuZNNoT/j3JjfWx65yn+VhimiJ67TbfMLafBhqoq94BQ57sspDtj8wpv4GmKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Vqg2HxvrfWZj83aLOC1EBEqqBXGP+X8kBSngH6QxOg=;
 b=NlfI6n88c/ez4kyEMEM9cyXyjEy+DL0HXM6wVuCLC3LQChaXdnLSD01na1elKjW9jdmsNEXNl1mbbKL1P9S65iJ7YvZbHnx6yqdrAUW7TLVTWPlRz5klq5/PmtmnnWx6VI0cjku4fYP8xBJii66V1CAlb0qhmLwm92x3PL3aGou14HI08BmlaqEGLqAz+89xHKUSAKceUA4WNt2EBMJJJBwi4PxC4DDs9ecQi1uRxpvwX3VwhIpPq2hfcYiQC/8icL5sE5iyGvVpkygJ9tREZf3An1reVpp81MUHSVUMbp6foVymukPRAZHKwSD3HoCoarwSSQUCdEm+MwwQje5XXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Vqg2HxvrfWZj83aLOC1EBEqqBXGP+X8kBSngH6QxOg=;
 b=QMIVMZ2Y4aoN95cj2xTsapAQ5DbbyN3W6omBGsH+40b9fWwLcJ0/fh1sJYi6TgBtAxcXk1YP8SRr7YuBuMXkq5GDB9EaAVy355EfbGcTby43p8svPZBVA1pH3ih3GnVYRIwQTnVIh33NweHBYDqRSd5XzUZmxz/dgXj+wdkrmpw=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1628.eurprd08.prod.outlook.com (2603:10a6:3:7d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.23; Fri, 26 Jun 2020 16:32:58 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3131.024; Fri, 26 Jun 2020
 16:32:58 +0000
Date: Fri, 26 Jun 2020 17:32:56 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: drm_fourcc: Add generic alias for 16_16_TILE modifier
Message-ID: <20200626163256.46duuouu6ebvtakw@DESKTOP-E1NTVVP.localdomain>
References: <20200626135233.32137-1-brian.starkey@arm.com>
 <CAKMK7uGCQV7XptAAycHG_XOW-VOtHpUB2qqp2Kvo+3oUhkmOQA@mail.gmail.com>
 <20200626141557.g7vhzfyre764otr4@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFy59UegLzWhrx3a1u1Hiv3+0iDhViHC+SecPJBo+O0mA@mail.gmail.com>
 <20200626152144.5e4pe3y4nw44mf2d@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uG+Wc3aAThZekkaCMzAS9OVrLipw+VD8Ope+AOaM21ayQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uG+Wc3aAThZekkaCMzAS9OVrLipw+VD8Ope+AOaM21ayQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LNXP123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::31) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LNXP123CA0019.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 16:32:57 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45e5e812-69cc-4d4d-e44d-08d819ee9b63
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1628:|DBBPR08MB4329:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB43296B9EA7B6C828D69E4093F0930@DBBPR08MB4329.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: eZvP4x9fROmd75JxtSDdoKlHvKDkWh9s98qxkjiFHtCMiuQpZlvnafGdY8+gClHueU8G/U9IO/ZyswHST6A41IthlL5Ba1yJiaf9LScFUH9EGWCxgvM3Nh/203osLGJe9KRHAqD9pziP2s5yrxBBXrHIF9g0439sSiQZR8K8Br4M3BY2GVmr6jm8Z61jBQDl5zw9Vc9M2WvQAhkAV5BrkodeexgB75NX43vkJLvhebtB/EGQ7/2bU56nK4+Bkr+oDlzIz9kdoaOyVegC11Tkm6dqy0m/9ZS9Kuw1L6e3vqWauAi5IGphpFw1X8T96yoI5bNpmGPrNYIpA8crQ0ajRxk807B3FZ7a+BN3kBShtYh/ind+F/Q1HCBtVXuNOb5/Wo2vHdp158+C09pkNf21gv3DdO9VEWXfJ0JjjBQTfLa/dC/GZv/tMsYBpxFVWpKw
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(66476007)(5660300002)(8676002)(54906003)(83080400001)(9686003)(1076003)(4326008)(52116002)(44832011)(55016002)(26005)(956004)(2906002)(7696005)(83380400001)(66946007)(6916009)(66556008)(186003)(86362001)(966005)(53546011)(6506007)(8936002)(478600001)(316002)(16526019)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mggZPtRwJZGKUz/pD8tQZbvc0ZE6C3zYJUlo87bfMMRwC+PGoHntA6t+Nt2dyPAjjqXBll+yQsbC7/IOuX3SxYJU34kF7Cl07/mErl+X8eyMOToiRgXf6RtZC4/m6dsE8XNr4C+RdpYZ0ETkm6YE0NFdzgKWNt3BBGXUJLPcHHGIHc6haMseC+gFWeHa756Jb5BAAQxaFhUgHu7WE2c+IxwQNKikDeZor18nvetUVwx8MTe46srJfMtYgoPTfw5aVDGJVR+NZAiDJ+iMATGhyTQQPmctMXx4Pq7aOWq7HHLzW5X/YJJQvP2rBdnfKRyhp6+5Ub7YJ3QR4EPUkyygwCKV5STB9P04RdMecQrxmD8tWXK9rMUJ3b3nJCBRe1Q3QB/Q4sZ5m0yG0f6WS01GeuQbmgP9UF1ZAzKPYtrZnks8IjNviZV9v46OSbLFk14eAai4h6AZyEXjSoDdY6aujRvrl9CWaXIkfvu4htixb2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1628
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(4326008)(53546011)(36906005)(82740400003)(6506007)(81166007)(6862004)(316002)(54906003)(7696005)(8676002)(82310400002)(70206006)(478600001)(70586007)(966005)(86362001)(47076004)(55016002)(2906002)(83380400001)(9686003)(26005)(956004)(8936002)(186003)(356005)(5660300002)(16526019)(336012)(44832011)(1076003)(83080400001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2336e87e-1660-43bc-0bf8-08d819ee95d4
X-Forefront-PRVS: 0446F0FCE1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UjjN44/nL/J2W3gpT9Ta8D4kKI0mZ9kGm0a97dIIGbyyyiMMEdE3sjA3VmMEorlqr3JY+FhieoaOAiTeuPeAqY85L3/EN3UJpW9K472n4k5epI3RqQXR4/5oXEsbaujD+0QAuA13ESYPgHyXrwxsjU25WSh5HyRjkBsvTOjEoPwAdrkv8PYHQL+LfOoW5acQkeMNN6349WGC7yFghPhWAqtVfXSsSngdaMMFT3c+b9THGvU+UVvEOiv+hq13OY61+zedSGhXRg/1OZKl+RtE2mGa0pLm6y5XgsQE7K5AYyUMFtVdRY2Ta+zuARser1xCmgK7lgmthH5Ybvr48lxECv7vvqsz8nGwasFbLC/wvLOwg9lpJODNKs6x2aJQzSSzUpAeTEEHpKGcMo/UX2qtqaQuBrKC7cYtze+um91MxrpWCcl+kKLZrhTeRWmQJ0DG3nIGFxgG3O2X7gDZOSuXNMgCp3X0N9My7cCyVI0eIwB+jYItZnc7dXd+pqvaLGu2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 16:33:07.1747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e5e812-69cc-4d4d-e44d-08d819ee9b63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4329
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
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, nd <nd@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, matteo.franchin@arm.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 06:15:36PM +0200, Daniel Vetter wrote:
> On Fri, Jun 26, 2020 at 5:21 PM Brian Starkey <brian.starkey@arm.com> wrote:
> >
> > On Fri, Jun 26, 2020 at 05:16:53PM +0200, Daniel Vetter wrote:
> > > On Fri, Jun 26, 2020 at 4:16 PM Brian Starkey <brian.starkey@arm.com> wrote:
> > > >
> > > > Hi Daniel,
> > > >
> > > > On Fri, Jun 26, 2020 at 04:07:43PM +0200, Daniel Vetter wrote:
> > > > > On Fri, Jun 26, 2020 at 3:52 PM Brian Starkey <brian.starkey@arm.com> wrote:
> > > > > >
> > > > > > In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
> > > > > > describes a generic pixel re-ordering which can be applicable to
> > > > > > multiple vendors.
> > > > > >
> > > > > > Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
> > > > > > used to describe this layout in a vendor-neutral way, and add a
> > > > > > comment about the expected usage of such "generic" modifiers.
> > > > > >
> > > > > > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > > > > > ---
> > > > > >
> > > > > > This is based off a suggestion from Daniel here:
> > > > > > https://lore.kernel.org/dri-devel/20200529115328.GC1630358@phenom.ffwll.local/
> > > > > >
> > > > > > If there are future cases where a "generic" modifier is identified
> > > > > > before merging with a specific vendor code, perhaps we could use
> > > > > > `fourcc_mod_code(NONE, n)` or add a DRM_FORMAT_MOD_VENDOR_GENERIC.
> > > > > >
> > > > > > However, I also think we shouldn't try and "guess" what might be generic
> > > > > > up-front and end up polluting the generic namespace. It seems fine to
> > > > > > just alias vendor-specific definitions unless it's very clear-cut.
> > > > >
> > > > > I think the above two things would also be good additions to the comment.
> > > > >
> > > > > A totally different thing: I just noticed that we don't pull in all
> > > > > the comments for modifiers. I think we could convert them to
> > > > > kerneldoc, and then pull them into a separate section in drm-kms.rst.
> > > > > Maybe even worth to pull out into a new drm-fourcc.rst document, since
> > > > > these are officially shared with gl and vk standard extensions. Then
> > > > > this new modifier's doc could simply point at teh existing one (and
> > > > > the generated kerneldoc would make that a hyperlink for added
> > > > > awesomeness).
> > > > >
> > > > > Aside from that makes sense to me, maybe just add it to your patch
> > > > > series that will start making use of these.
> > > >
> > > > This is only supported by the GPU, so we wouldn't be using this on the
> > > > Display side.
> > >
> > > I mean the patch to add the NV15 fource, it mentions "suitable for 16
> > > by 16 tile layout", would be nice to just put the generic modifier in
> > > that comment.
> > > -Daniel
> >
> > Ah right. I saw that one went out in Maarten's pull request this
> > morning.
> 
> Oh I missed that, then maybe just amend this patch to update the other comment?

It was only mentioned in the commit message there, so I guess I can't
do anything about it now.

I'll respin to put the extra notes into the comment.

Thanks,
-Brian

> -Daniel
> 
> >
> > -Brian
> >
> > >
> > > >
> > > > Thanks,
> > > > -Brian
> > > >
> > > > > -Daniel
> > > > >
> > > > > >
> > > > > > I typed a version which was s/GENERIC/COMMON/, other suggestions
> > > > > > welcome.
> > > > > >
> > > > > > Cheers,
> > > > > > -Brian
> > > > > >
> > > > > >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> > > > > >  1 file changed, 19 insertions(+)
> > > > > >
> > > > > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > > > > index 299f9ac4840b..ef78dc9c3fb0 100644
> > > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > @@ -345,8 +345,27 @@ extern "C" {
> > > > > >   * When adding a new token please document the layout with a code comment,
> > > > > >   * similar to the fourcc codes above. drm_fourcc.h is considered the
> > > > > >   * authoritative source for all of these.
> > > > > > + *
> > > > > > + * Generic modifier names:
> > > > > > + *
> > > > > > + * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
> > > > > > + * for layouts which are common across multiple vendors. To preserve
> > > > > > + * compatibility, in cases where a vendor-specific definition already exists and
> > > > > > + * a generic name for it is desired, the common name is a purely symbolic alias
> > > > > > + * and must use the same numerical value as the original definition.
> > > > > > + *
> > > > > > + * Note that generic names should only be used for modifiers which describe
> > > > > > + * generic layouts (such as pixel re-ordering), which may have
> > > > > > + * independently-developed support across multiple vendors.
> > > > > > + *
> > > > > > + * Generic names should not be used for cases where multiple hardware vendors
> > > > > > + * have implementations of the same standardised compression scheme (such as
> > > > > > + * AFBC). In those cases, all implementations should use the same format
> > > > > > + * modifier(s), reflecting the vendor of the standard.
> > > > > >   */
> > > > > >
> > > > > > +#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
> > > > > > +
> > > > > >  /*
> > > > > >   * Invalid Modifier
> > > > > >   *
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
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
