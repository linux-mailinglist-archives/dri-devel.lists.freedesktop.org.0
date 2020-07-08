Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34B217ECD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 07:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B707F6E855;
	Wed,  8 Jul 2020 05:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8B6E855
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 05:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=LdZVkyZHffRY3zc8d7PkEH6Er4IMXnRtIH2vKa84vfGU2JhoCHYliZPltpjD5l7/WTbbeUvornNRn3JJyNn6zTCswY9A1QCbLePCS0zoypRVMVm9Mluf4/7lbXWySIfkrbxP2If3jfxaUF1eqOqAlPqzLkGcarHkvm98Ah+ROBA=
Received: from AM5PR0601CA0062.eurprd06.prod.outlook.com (2603:10a6:206::27)
 by DB7PR08MB3916.eurprd08.prod.outlook.com (2603:10a6:10:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 8 Jul
 2020 05:08:40 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::8) by AM5PR0601CA0062.outlook.office365.com
 (2603:10a6:206::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Wed, 8 Jul 2020 05:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 05:08:40 +0000
Received: ("Tessian outbound e44de778b77e:v62");
 Wed, 08 Jul 2020 05:08:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31c59d195aa7f0dc
X-CR-MTA-TID: 64aa7808
Received: from 2e5d9e7d8353.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06FC9AB5-E7E5-4261-865C-0C530ED94E38.1; 
 Wed, 08 Jul 2020 05:08:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e5d9e7d8353.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jul 2020 05:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtUjxmWFlhOqgMKTTCk0ej+2KO2YVuvGrBQd6zpxtJ5JbtVd67CWNwutBuzVp0FRS4JY9Lu/SJOzZwGwi4PnHgNb03wgKkjohPtJUi4786G09q2tsuZbb/te7vNLas0R+qhQqI2oIwJn35Dron8NJJwa4gQo3gmLHSfim3LOOy5DqKy9oSrUFNpKSzkpZZ+GlVG6sTF/h6LmIKAaAlc9UFR3OnSnk5MI/HY/FKA0S9zKzMBFd/pYYwDNleFam4wSctNqnyoG20qpXBeeAxIaI5vGMhBATIqruTaFqmowuZbmV31lOCEISp/l5exmIvFQzSJXOcqTMcTl2/d9MT9Lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=Vo4fp2KvVUc7u7E6caIyjBGj20AuBQk1aIvjntJwAYH47rP/Jxj2R87rcj+nsyyzPmaConDnUVdWbzB7kJALGUE29LwvOtDGGvAY2QGJIvLOd3hHGQ9n+I/p8bOp0GQR8wapf2BUu3DpwBxsKap5dXhfKQwEqMQKR7cmt3Wo3dmM/m1DYKNW/MPByusFBiwEjf4jrA8ja8SflGoLSoz55GsOYtmH6xCh27KqhMdCKQLitURgCYPjK71i4GBXjeZTohLm979ywqmgNA2BeR7f0lIdAezYXjBJmsQyiGiD3+wYhKHDA4h3oFe9bcT7haEIjDV8agjcor5Us9kOCtwH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=LdZVkyZHffRY3zc8d7PkEH6Er4IMXnRtIH2vKa84vfGU2JhoCHYliZPltpjD5l7/WTbbeUvornNRn3JJyNn6zTCswY9A1QCbLePCS0zoypRVMVm9Mluf4/7lbXWySIfkrbxP2If3jfxaUF1eqOqAlPqzLkGcarHkvm98Ah+ROBA=
Authentication-Results-Original: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB8PR08MB5418.eurprd08.prod.outlook.com (2603:10a6:10:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 05:08:27 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 05:08:27 +0000
Date: Wed, 8 Jul 2020 13:08:21 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 06/20] Documentation: gpu/komeda-kms: eliminate
 duplicated word
Message-ID: <20200708050821.GA1121718@jamwan02-TSP300>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-7-rdunlap@infradead.org>
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.111) by
 SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 05:08:26 +0000
X-Originating-IP: [203.126.0.111]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7cae87ad-0ba0-443c-089c-08d822fcfabd
X-MS-TrafficTypeDiagnostic: DB8PR08MB5418:|DB7PR08MB3916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB391653999D82530EB46C4EA9B3670@DB7PR08MB3916.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ugv76lIcWFzncaE8CL8NRcn6Y25zj4XaFHTLySKgaHoOkaWTWq9Qj9ZZhP0IJzeMVS1pPW9l3z9+9dwd3xUldiqi+o7oxY0AOqdkDPPHERIhDyC2SNjRnrLpm6iYobnss+uIxhuvfEryWIeZylCaITi7KP5y54tSmWIY2DME7iiFTGMCou1LWfo5Sx9h54U2HnAzztC+7i/KxuFyqyRcfH0cxR/1YKdDobyrQxHxNwVAQ5jUFJOlNXS36ebm775MNWRYWv3kdjf2/invGaF++KMpE2wNwFXFrO9cg1P8v8v1RCprlSrRLlDlNzS6KVHZRGjK0s1jpIMzdiZyoGPiNQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(7916004)(39850400004)(396003)(346002)(366004)(376002)(136003)(478600001)(186003)(7406005)(9686003)(2906002)(7416002)(7366002)(6916009)(54906003)(8936002)(6496006)(52116002)(4326008)(316002)(33716001)(956004)(1076003)(6666004)(83380400001)(8676002)(16526019)(33656002)(26005)(86362001)(6486002)(66556008)(66476007)(66946007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cbkH8aJ+VUJQNAYUsDp271bZLTF9bRsCKaYGBd3fSkjP/IVDmSUfCWoIVjMV00+V8zEh4kZ3pmIpL1u53ce11rKnQjfGIVmzmZ3GUtSRRteRb6x/qYqIW2lXJKMjl11L9YpRW0e/YLWSiU8X9Tq7dmlfMZHPOLSBn3CRoEJ5X/2jt1eF+V8EaJZFdp785bZA5B5+o9ocL5EkUAxXsDBuv2TmBgzekPUHt+NUqXeagtZMSNfnCZLf/bbvm+qrplQMutZ1irKbQLFnErk4jDNLuUX8DcJGqP8nHL/j24c89Z6FfJ42q/uN/6HFIOWBuJj2jpyYx/9dVVUidbMOT5qe7bCmyjy3C79wynuMO3rVlav6A7FjUcb2tHg+CI4PflCHdF6RfwnKnBwy+MQpm6yyzRv1s1n4sWYtBi1BH7pEuC+waX0qJVyLIFbKC2Dy8T0Bng/8w+kAIzGeNxNDHToKvpsXjxdPadN2moIcftwpV38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5418
Original-Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(396003)(39850400004)(346002)(136003)(376002)(46966005)(36906005)(26005)(478600001)(70206006)(47076004)(956004)(82310400002)(16526019)(186003)(4326008)(83380400001)(336012)(6862004)(2906002)(33716001)(70586007)(54906003)(9686003)(6666004)(316002)(1076003)(356005)(86362001)(5660300002)(8936002)(81166007)(8676002)(6486002)(82740400003)(6496006)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ffebe40-5e4a-44cc-93c2-08d822fcf283
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I91OQuX7jv+MR+A/+71gAJcFciVDAZm82ZnXkISvCY3L+mD6liy6PDGzdlnsx+EQ++nRKp5Rc2X3Yl1UQXciUdHcMoXhBoeIWsbWL98dyLYn8ATC7Dkc2ctNNFOdjXYNxsR+cc1OP9Ae5VU8cWDrP+IsvROqDsCl9n1o52Vp8Vcqz2KUcNa3WxkA5luipd/xBJ0UmxRwinBLLR+5K2yATqE8xvJM+M5ScfpvAua1EAf5I7Y9YHiTOGlizYLFu1/nOvyFkfDV0wbIn68YjdfockpFEQD6Njtx2Cy0OpyJB2Un0SGI0VRgnnko34BeZgm3/dDPWNUSpl/kLOxI5TGiigblU81/GRkXvDEwyLAmkevLC0z11jNDELqMP1sJ1NlEUGs9oSwZ1A/f9+hVTOiKqA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 05:08:40.5981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cae87ad-0ba0-443c-089c-08d822fcfabd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3916
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

Hi Randy

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

Thank you for the patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

>  Writeback Layer (wb_layer)
>  --------------------------
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
