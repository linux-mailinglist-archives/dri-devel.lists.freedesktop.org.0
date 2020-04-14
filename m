Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03141A93FA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59BE6E84F;
	Wed, 15 Apr 2020 07:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E0089B65
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yydiogp/vpSSLH9eN5GUoWOL0zbpmAr1t2AyqgGKMk=;
 b=zxglla7JfSjehbSOOWBtOzmDU2lrnveS40//W28a5JG2PQHGZP81CkOQTzVRP0QUvftt1W3q1sifbOVihtYgpqJWm2A9AuzPXszMZoRrGrY4+omNxKmnNtvwXDB+j5Zd7ObuPPgCdnkr1bF8l2RMR1taD62vkOpb05x0DRMJ1Xk=
Received: from VE1PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:802:a0::22)
 by VI1PR0801MB1821.eurprd08.prod.outlook.com (2603:10a6:800:5b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Tue, 14 Apr
 2020 16:11:27 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:802:a0:cafe::19) by VE1PR03CA0010.outlook.office365.com
 (2603:10a6:802:a0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.16 via Frontend
 Transport; Tue, 14 Apr 2020 16:11:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 14 Apr 2020 16:11:26 +0000
Received: ("Tessian outbound 1425309d4c0b:v50");
 Tue, 14 Apr 2020 16:11:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26e05b3691a9ae19
X-CR-MTA-TID: 64aa7808
Received: from 89ec91102164.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF887E83-87FF-4846-87F7-02781593BB87.1; 
 Tue, 14 Apr 2020 16:11:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89ec91102164.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Apr 2020 16:11:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsAzFIbfjFkGjp1icb26SWzM9WbH2pQ/fdTeEd4fjfZgRwy+nUTaM1nyizrLE7A7gvLkqCKmFhCXAVvSemOkcxqA00nuq9mp/eNqhJokvAxhMoz+6xHDnS39OM3SBgOtnAXwtJBhO2OVXpZuhVv3PaJ7As+HD76+pzf7MEnHNA7iXfjEmcafBtAyB/0QUTMQo2OfFVLZRJEA7QOqQRXPBQGaXnXsxvWOGinw0AQPKwupMSNxSGhtOG5Vdh241gvXI0/wkkqkIDULhful5MtMp86Oup4l/Q32nxz34M1LJQpR6ZnuTP6fG2B2Voa5BsyJOIrVIW1g0HYtjAqKtrTJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yydiogp/vpSSLH9eN5GUoWOL0zbpmAr1t2AyqgGKMk=;
 b=ABt9zGaVau9grSJ7QHP3B6uvsdTmghRuyjkmoA5IsaaCmeeJvL/6gYJYN0Mk/INjTDh0g5zNfe+FG03xLj7EkkBDqDWTXly7o824Y2uqd+vreKRSMjWOsZElMI9D5ZINf1ZRjvk1bgnsBZlI3mw6q6G7rlm5P1bL7tiARHFf/ZVfIYMsa1Mo5QSJ6YQnPGo+r25Ng487Z2epq8IZp3dqDPauZEU1s6u9B24+0S+qbFq4fB6SCfSMazHoVqOLMXVNJmPYAXuF8XESOk5lLYswrR+fYYd6oLcE04AaPzeL55Cfqu6KgjKAol7fzDQEKCnDlEE6oYgR7U4LOYOCcbZYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yydiogp/vpSSLH9eN5GUoWOL0zbpmAr1t2AyqgGKMk=;
 b=zxglla7JfSjehbSOOWBtOzmDU2lrnveS40//W28a5JG2PQHGZP81CkOQTzVRP0QUvftt1W3q1sifbOVihtYgpqJWm2A9AuzPXszMZoRrGrY4+omNxKmnNtvwXDB+j5Zd7ObuPPgCdnkr1bF8l2RMR1taD62vkOpb05x0DRMJ1Xk=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Orjan.Eide@arm.com; 
Received: from VI1PR08MB3885.eurprd08.prod.outlook.com (2603:10a6:803:c1::32)
 by VI1PR08MB3245.eurprd08.prod.outlook.com (2603:10a6:803:48::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Tue, 14 Apr
 2020 16:11:18 +0000
Received: from VI1PR08MB3885.eurprd08.prod.outlook.com
 ([fe80::c198:5f6d:b7d5:d80a]) by VI1PR08MB3885.eurprd08.prod.outlook.com
 ([fe80::c198:5f6d:b7d5:d80a%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 16:11:18 +0000
Date: Tue, 14 Apr 2020 18:11:14 +0200
From: =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200414161114.GA1949@e123356-lin.trondheim.arm.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
Content-Disposition: inline
In-Reply-To: <20200414142810.GA958163@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::23) To VI1PR08MB3885.eurprd08.prod.outlook.com
 (2603:10a6:803:c1::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123356-lin.trondheim.arm.com (217.140.106.39) by
 LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.17 via Frontend Transport; Tue, 14 Apr 2020 16:11:16 +0000
X-Originating-IP: [217.140.106.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f90bd71-3518-49fc-df10-08d7e08e7c3f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3245:|VI1PR08MB3245:|VI1PR0801MB1821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB18215E1623E8E64A4617D34C90DA0@VI1PR0801MB1821.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0373D94D15
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB3885.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(956004)(186003)(16526019)(7696005)(5660300002)(55016002)(6916009)(7416002)(4326008)(1076003)(8936002)(8676002)(66946007)(66476007)(66556008)(26005)(86362001)(81156014)(54906003)(52116002)(478600001)(316002)(33656002)(2906002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Dhv93vAQAhJb7czi4xmPXZLRqgicO3I0uOdw61eZSj3N3Dg/Ch4kSnw/7PCjKjzOcGvpoL8o3QZQ9pQ6SsOd82pEGbNC2pcRipVup+I71PHro2P0kr1gqN+RZmfyLIJFp8Cu+OSQgs+RwC/cp+A0tPufndXy57JDKh8gxwPU1CO8A19RAZ5BBA1kUJ2D4G2lJ9vuVrW1M4hf6M9xYQhn1hlvus63RbXwGf2Ccxkq54dokoE+BFuWuUmXtxIxRbU9rHavqVrnd5PYAmlc38FekQmu9enMhlpo/hr3Z1esfWw27bz1afNAwWzjJyOmzzX/bM+q/0PIQVAMzK+ftuYP5EdpjA+1fJfgNvOK8Cl2Qik2WkeOr5k13DlAm81e2H6JduBIsmp1y4dnPwTb5h3NnqiUE4o2b4Rt+s/JmtkpjbKfj2gDXN4Oy24SKOaiJfZc
X-MS-Exchange-AntiSpam-MessageData: 1uF5qULJhFHboj8XThKK5tcPpV+cUpY4PgA02oaeYrbTY1qLPiPCKiYdXi87TZHbVbsHdYd7+ekqCjLTHC1OfYJBg5/9x8RbMsJtBgultKeA/+oB0oLtbhwSNXwMGnggI+sJm1KhWUhXmwm172DPLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3245
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Orjan.Eide@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966005)(2906002)(186003)(82740400003)(16526019)(8676002)(336012)(5660300002)(47076004)(956004)(4326008)(7696005)(8936002)(54906003)(81156014)(81166007)(1076003)(86362001)(107886003)(356005)(478600001)(55016002)(70586007)(33656002)(70206006)(316002)(26005)(36906005)(6862004)(26826003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 15aa1b9e-0b0a-4c33-e3db-08d7e08e76c7
X-Forefront-PRVS: 0373D94D15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0y0KVfcj9EJkMlyBWQVpsDBbnZAiPCQOBTTEQJRDLH93loEae454oeLBWniu8M8AdINmFolMbbJh5FIk1wLfFAajfm0tOfTFSkbVQwiIJnhaTlPO4hV0LH2CfNcO8pqInyc/gOEilUraL4CduIkNF368MEYtg1JZwluUyN4PUKgk8CxD/CQ9sya6jMv482z1USr2rO218wzm+1PkrCk7Cp5cMotCLp2MgJPxdAyxs+q8U+EG9NyvRO2KiHqfzKgMr1xHzeL4F5nwrp8POBpYIVUPnG28kcYlWgPBTNjSZBz081d6pyJrGV21n3EUKJZx4xy+nd2xVgo2S++h0JNuP/sjn93BvGa65p5jUbioM60V6uHx6qmplJuLevfPVnFx69dEN86XcJ66IZjTAdUL2U2BhJHXohIG/pTmcDgO9uZx8SQglsZmkO0ik/tL62+GpgCg+4G/ZjBIt+nmgMGyyd6eVev2Lc22BX6QyDJbhHALpnlUdMU3SHRO4kFfeawmmtaZwGvo/x4M+3KOL/1Wg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 16:11:26.9692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f90bd71-3518-49fc-df10-08d7e08e7c3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1821
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: devel@driverdev.osuosl.org, nd@arm.com, Todd Kjos <tkjos@android.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, anders.pedersen@arm.com,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 04:28:10PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 04:18:47PM +0200, =EF=BF=BDrjan Eide wrote:
> > Only sync the sg-list of an Ion dma-buf attachment when the attachment
> > is actually mapped on the device.
> > =

> > dma-bufs may be synced at any time. It can be reached from user space
> > via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on when
> > syncs may be attempted, and dma_buf_end_cpu_access() and
> > dma_buf_begin_cpu_access() may not be paired.
> > =

> > Since the sg_list's dma_address isn't set up until the buffer is used
> > on the device, and dma_map_sg() is called on it, the dma_address will be
> > NULL if sync is attempted on the dma-buf before it's mapped on a device.
> > =

> > Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
> > into the dma_direct code")) this was a problem as the dma-api (at least
> > the swiotlb_dma_ops on arm64) would use the potentially invalid
> > dma_address. How that failed depended on how the device handled physical
> > address 0. If 0 was a valid address to physical ram, that page would get
> > flushed a lot, while the actual pages in the buffer would not get synced
> > correctly. While if 0 is an invalid physical address it may cause a
> > fault and trigger a crash.
> > =

> > In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-direct:
> > merge swiotlb_dma_ops into the dma_direct code"), as this moved the
> > dma-api to use the page pointer in the sg_list, and (for Ion buffers at
> > least) this will always be valid if the sg_list exists at all.
> > =

> > But, this issue is re-introduced in v5.3 with
> > commit 449fa54d6815 ("dma-direct: correct the physical addr in
> > dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
> > behaviour and picks the dma_address that may be invalid.
> > =

> > dma-buf core doesn't ensure that the buffer is mapped on the device, and
> > thus have a valid sg_list, before calling the exporter's
> > begin_cpu_access.
> > =

> > Signed-off-by: =EF=BF=BDrjan Eide <orjan.eide@arm.com>
> > ---
> >  drivers/staging/android/ion/ion.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > =

> > Resubmit without disclaimer, sorry about that.
> > =

> > This seems to be part of a bigger issue where dma-buf exporters assume
> > that their dma-buf begin_cpu_access and end_cpu_access callbacks have a
> > certain guaranteed behavior, which isn't ensured by dma-buf core.
> > =

> > This patch fixes this in ion only, but it also needs to be fixed for
> > other exporters, either handled like this in each exporter, or in
> > dma-buf core before calling into the exporters.
> > =

> > diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/androi=
d/ion/ion.c
> > index 38b51eace4f9..7b752ba0cb6d 100644
> > --- a/drivers/staging/android/ion/ion.c
> > +++ b/drivers/staging/android/ion/ion.c
> =

> Now that we have the dma-buff stuff in the tree, do we even need the
> ion code in the kernel anymore?  Can't we delete it now?

It looks like the new dma-heaps have the same issue as ion. The
heap-helpers also do dma_sync_sg_for_device() unconditionally on
end_cpu_access which may happen before dma_map_sg(), leading to use of
the 0 dma_address in the sg list of a, yet unmapped, attachment.

It could be fixed in dma-heaps just like this patch does for ion. Is
patch a valid way to fix this problem? Or, should this rather be handled
in dma-buf core by tracking the mapped state of attachments there?

-- =

=EF=BF=BDrjan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
