Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335832180B1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCC26E876;
	Wed,  8 Jul 2020 07:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10060.outbound.protection.outlook.com [40.107.1.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C46E876
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=Z7NBqvep5KuQYSyH/wF3oHrHsHWaGhtoxTqVWcgqbmGVKlYftZxS+XAXeC+uHJyf/GjIMC8YdPd8VKTP/EzNmsV3qZzE9od25fFWW5t3xf6jRZBhikORdvNAsixWI/oqWI7xRWRgSrBcw+WLArC40UdFIMS3XFuQMchUVWmD2NQ=
Received: from DB7PR05CA0067.eurprd05.prod.outlook.com (2603:10a6:10:2e::44)
 by AM5PR0801MB1699.eurprd08.prod.outlook.com (2603:10a6:203:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 8 Jul
 2020 07:19:41 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::2a) by DB7PR05CA0067.outlook.office365.com
 (2603:10a6:10:2e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 07:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Wed, 8 Jul 2020 07:19:41 +0000
Received: ("Tessian outbound 4e683f4039d5:v62");
 Wed, 08 Jul 2020 07:19:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84719459c5a0d449
X-CR-MTA-TID: 64aa7808
Received: from 0c7ca0ba8389.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16C0E0C3-FCEE-4BFB-A29B-575CDE561425.1; 
 Wed, 08 Jul 2020 07:19:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c7ca0ba8389.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jul 2020 07:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXAJnuftCYN4eLG7y5MpPp7K77lHN5T9Fw6SesFCbuQeHzG6lPzgLMMTJA1Uer1cNKd8stOHFjRaMQzurDgVJwBB6uz/iUVJHoIeZTlcWuIgE27PmZtqJ53iy1KWZZHUbRF8PeF0ntkHOIw0ol1TgwenNheXxc0FQNM2n7BbJanjvbDJCoxqheIqDMg8BPVcK00TskgbeVESEgmZVn3kIQ/1sdzxZaDy4HpPiwBpENOGdlUC5q070kSBvJ4qGsQE/taMe9MThyGV+r6Tx6GB3QvbRUNsXxGkZuoKUnr0EsGsUwdzMev+UpP5Edn4nNfzsDO01XVdyQ9U3whG8pgD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=bs8ObSbhVbu7ggwdmxh99Y4u/sMnXIGUjDjCgKcymNH+HAciicG7OE8oRQ65d3n4dZ4oYPXvqSaEEwsMdg/vpGKYlbl+802VIQDw8Sjym4Fq3cGS2JFb8MyDU9zjmzJBopxMnqajf0HDVCoGkRBreOOUpCZKBp/hTZsrAA4TGKQr3o9OE+sOEMK1pwkO/YjGNaPwl3WymSUpT88PqaCo90jCJgiYwWtAVY6nu2nVEQWpMfG39p54l/6Fl4NP9MlYvy7A49NiKwvoahSs1QcszhnJmt8zh34BEo1NB+7qLf0htnTdhPcFDY885OfCjERjvbRYdz7ncxg68qM9cyeemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPkX3o0i0vVP+ei74KFkCVT0hft2CiStdUF8qUTnRpc=;
 b=Z7NBqvep5KuQYSyH/wF3oHrHsHWaGhtoxTqVWcgqbmGVKlYftZxS+XAXeC+uHJyf/GjIMC8YdPd8VKTP/EzNmsV3qZzE9od25fFWW5t3xf6jRZBhikORdvNAsixWI/oqWI7xRWRgSrBcw+WLArC40UdFIMS3XFuQMchUVWmD2NQ=
Authentication-Results-Original: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB7PR08MB3866.eurprd08.prod.outlook.com (2603:10a6:10:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 8 Jul
 2020 07:19:30 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 07:19:30 +0000
Date: Wed, 8 Jul 2020 15:19:23 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 06/20] Documentation: gpu/komeda-kms: eliminate
 duplicated word
Message-ID: <20200708071923.GA1127463@jamwan02-TSP300>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-7-rdunlap@infradead.org>
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.111) by
 SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 07:19:28 +0000
X-Originating-IP: [203.126.0.111]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 823e4dce-6dd0-4118-a9bf-08d8230f47f1
X-MS-TrafficTypeDiagnostic: DB7PR08MB3866:|AM5PR0801MB1699:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16997AA0A2B853E393017D20B3670@AM5PR0801MB1699.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JMs8wCULxbtOsZOmUQzPrITahAzA4Io1/sdAjlgr8dJE3tHGP4GIeV1X4Vu2A7mx3XJFaxhGWIAT5hTG1FIKW3Ym1sxFbUxGh/7QSkykaRbClm+o7OVpeLyz4aYhx4XrqZx4wyUwOHXo1ewT5xq90DhW7ct8taT+VYtTEALZwnewyH/xUXEkZ54b7tx2dTbgmb3ihzt5xLhaa5Q3NACOdz+Nv0dTpfE3/fpA6xlFigyk5kmoRFefn5yPa7Qx2ssEHwDHqMaf4yNnDsLZu5g/qY8pi/c2exhw/X2uf0UqNx2y0qzMBjuc67vFvDR6qld6Efymt7VhzVK+9K17nyxvgw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(8936002)(478600001)(956004)(54906003)(7366002)(86362001)(7406005)(9686003)(8676002)(316002)(7416002)(6486002)(2906002)(33716001)(6666004)(6916009)(1076003)(66476007)(66556008)(4326008)(66946007)(33656002)(83380400001)(186003)(16526019)(26005)(52116002)(6496006)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: s28MBsKsTNwLsb9W726e+etxqE/6znWCOOivA0sQnLqpMN6EqMSmrM6eEwj1qUVHukQiovpM6XzazVXZiSwSO9vVVgp1ps+hDhPnHxKC4Kb6paqlRLn5HNV0StemiVHmy4Ze5RLtH1yUVS5S0CPqXUnn0BQE2rrAjC0IOnPB9b/BteSh/zzB07567K+zDHCOXeSNv6L1XsQIznCLeLdxarRLq2GZ0W9dyGB4X6XZNrp26pn0U8Z5rM8uU1PhfmpcjwEaLFqiUzxwmdKOUDEqsIMuqY0H4db3enXR4Dhc38e6nJINBTEZlyTTZ0BcqpJKu0343xm65IQyoqlnecLBU7djtFNMW4L8EqqAA43UZZVM0mbg+S+zXUS2I/rxeXEqaS3jIga2A3pbxP4oXHelCX0cgHrAxNhSIJMTpH4thNLJx1P47VYKAZDftLdV1VUYP/XzobqEsn4ahCCW8xGiiixtnG5s3m48t/KIOe7xtDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3866
Original-Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(346002)(136003)(376002)(396003)(39850400004)(46966005)(16526019)(1076003)(82740400003)(33656002)(6496006)(956004)(33716001)(4326008)(5660300002)(336012)(83380400001)(26005)(9686003)(2906002)(6862004)(70586007)(70206006)(478600001)(54906003)(47076004)(186003)(82310400002)(316002)(86362001)(356005)(8676002)(6666004)(81166007)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c801bed8-98ca-4271-cf60-08d8230f40e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jBA85Lc382ouxXoQ0cHgve7QZoRZvq2g/yCpOUEJTgUQgeQs2xMqcgTT0fT/Xv4wgLxHHIJ4Rr3zUFiRKtNvovmUnwdx4FouQT96fDMSQhx3I84PEavzIzw3Kk4Ly5wht9U1F+M1giNPba360CL7PkOVglkgcancBcFjgBH2NzjznQtt0jbrZA3cSAR94NjyQOjHtXZvN9hb6cIT6tKISyxbmj4N0mSXB0bwPgTrHULo59KNjSLz3BCZxPclgFrkFGfX1Mv7WgSYGfMogburEiLa/Qdky2IajICMbRDONUiOFcHENZVXbz3gEPqMH9ZqhFbP/6n8MOgxqnkVvBPMRzk4QFAXavmL1WqE1yjKcjWLheRJygv6QIM2ihQfFIqfJdVjUXFN5gOH3rw8v2eKGA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 07:19:41.1226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823e4dce-6dd0-4118-a9bf-08d8230f47f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1699
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-input@vger.kernel.org,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, nd@arm.com,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> Drop the doubled word "and".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: James (Qian) Wang <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> ---
>  Documentation/gpu/komeda-kms.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
>  frame. its output frame can be fed into post image processor for showing it on
>  the monitor or fed into wb_layer and written to memory at the same time.
>  user can also insert a scaler between compositor and wb_layer to down scale
> -the display frame first and and then write to memory.
> +the display frame first and then write to memory.
>

Thank you Randy

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

>  Writeback Layer (wb_layer)
>  --------------------------
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
