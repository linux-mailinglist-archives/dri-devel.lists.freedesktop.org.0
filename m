Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04832170138
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 15:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCC96E2BE;
	Wed, 26 Feb 2020 14:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FF16E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpxs2CgJBSyQHifWfLPYXBG9X6rCwIxiLAmckyDZ4cY=;
 b=Spjx0i4AFpcnAkX92uWCRiW3fD/npyeVEBeJf/ysMVC2ETaXxk9z0z86ZcaofGh4ykJurm4F3QnWmUYgz3CKtQdN8ww85lYllp4eQQ4RGUHgySEquygQqpQH1u3HqtsCDf0xRMoR/e5snK8ZZ/Qy517TWlKt1h+q8j1BKRwB6/w=
Received: from AM6PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:20b:c0::17)
 by HE1PR0802MB2378.eurprd08.prod.outlook.com (2603:10a6:3:c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 14:33:04 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by AM6PR08CA0029.outlook.office365.com
 (2603:10a6:20b:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Wed, 26 Feb 2020 14:33:04 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Wed, 26 Feb 2020 14:33:03 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42");
 Wed, 26 Feb 2020 14:33:03 +0000
X-CR-MTA-TID: 64aa7808
Received: from 215c02a82014.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2B75D8F-4C6F-4AFC-BAA7-48830FC096DA.1; 
 Wed, 26 Feb 2020 14:32:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 215c02a82014.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Feb 2020 14:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFZHoG/etMQah3+7Tv+YoHGuEdQH0kI0wSEQGAa79coWUeqF5erySPRKj42Lv3BQf3096zWpXiP5R5RiKoJ/yBjyHV5GqRmgDqpkW4egs8r5B4qdOJ1JwV/uNFmxLkH0HxGIq8jKl0vlPaPIvicOj5HS0n00+nbNm/ftocMw64UZ85mp5sfe+COTPxWILJWBr6v7a7yzpSz+L28Gl/1b9HrI7DZH6dektwzWhC4YfxsWb0/QOaQZjmlQoMwGcuWkaPtkSofi+ce7dyFddkSw62iIz8CAGKe5HNYMLUzO7JoolFFB8T0YfwH513o6bme9z/H1kUakLsXzDCEDX/AUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpxs2CgJBSyQHifWfLPYXBG9X6rCwIxiLAmckyDZ4cY=;
 b=PK3g16qHWfLyNSkcuJoQkHiKGPl38sr4n1+b4GoSy6mtted76B/CdPE0nqDbgVJe/Gz8uK7DIXwPYt9w34QHFNcMOmp9IYlhiGKcmw4LS2FuJ4utlXRL7mnlhnNZBDnezplA+0bxBrvl4ceFW5xHUxqfegK5IdG5ilbDuD6doGuCMqzVtdg7MFMVfZOUvmAiZfoS5EiFkJ7gg04BEXsMxrDsELLtC508n2uCMLKswJCy8F/au1S6ojKa5PLstTLGRLcngIqidac7+PWLXjv4vk9zxh0XpK7KRj24OzJSivR91V0X09hMdR7Zp9HZBTsMQI1wCjpdW8kOUPV5pk7vtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpxs2CgJBSyQHifWfLPYXBG9X6rCwIxiLAmckyDZ4cY=;
 b=Spjx0i4AFpcnAkX92uWCRiW3fD/npyeVEBeJf/ysMVC2ETaXxk9z0z86ZcaofGh4ykJurm4F3QnWmUYgz3CKtQdN8ww85lYllp4eQQ4RGUHgySEquygQqpQH1u3HqtsCDf0xRMoR/e5snK8ZZ/Qy517TWlKt1h+q8j1BKRwB6/w=
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com (10.172.12.145) by
 VI1PR0802MB2496.eurprd08.prod.outlook.com (10.175.24.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Wed, 26 Feb 2020 14:32:57 +0000
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113]) by VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113%9]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 14:32:57 +0000
From: Guillaume Gardet <Guillaume.Gardet@arm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Topic: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Index: AdXn61yFYQwTcGDvSs6HxocaeVOz6gAMeNQAACAl4YAAEibPAAAMzTeAAH2qipAAWASEgAAIS4xA
Date: Wed, 26 Feb 2020 14:32:57 +0000
Message-ID: <VI1PR0802MB2237ADEAD23FE50C9604656383EA0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
 <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Snxz=AwRMeDPokuHmZyQrptmySS9tUtsW4f7GwgJ06Tw@mail.gmail.com>
 <CAAfnVBnsXW7sdOp=b6gxSczntBOa5O9JUaxMHqUE_CKN9kQe9Q@mail.gmail.com>
 <VI1PR0802MB2237E9434683CE980CA7163B83EC0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <20200226064553.nesmadr3p5nerdjm@sirius.home.kraxel.org>
In-Reply-To: <20200226064553.nesmadr3p5nerdjm@sirius.home.kraxel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 502532b2-5745-4fc7-af8b-55e22b325309.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:d09c:e29d:cc48:6fa]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3cf1ad80-8297-4473-4b11-08d7bac8ca0d
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2496:|VI1PR0802MB2496:|HE1PR0802MB2378:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB23783D08C15EADA06CD838E183EA0@HE1PR0802MB2378.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0325F6C77B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(199004)(189003)(33656002)(81166006)(81156014)(2906002)(54906003)(6916009)(86362001)(9686003)(186003)(66446008)(66476007)(66556008)(64756008)(66946007)(55016002)(8676002)(76116006)(52536014)(316002)(5660300002)(8936002)(7696005)(53546011)(6506007)(478600001)(4326008)(71200400001)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2496;
 H:VI1PR0802MB2237.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: E7r8B93bbItzIi2FJKkaBW3lyhxwH8puag88Itouse/xOPaezD606bK3Vi8H/yuHhXxoWo+Bxl7D/wF4MGCnvq1WljY87vUKimMrmPVn/+krrqAIxmTbY4cDnJHdc0pnUdUXYIk3+PzoItjrdEIMNvJ9wtlOO0W55VKc+8xHm9Y+YFYyrPc/Olem4jJ7I+WW0Yd3byLOYMm6pvDlfN9X4cbtV25zj8BVHIPZhFc7ebOQOkwmQ+SoTBEb17O7VF9ICYmxBCZgI1y5q9Gl4c6QAygurth2f0NJ0YfghPk57SNENparFJ7E4cEgJykc4QsdVyXXrMJGVqkKY/OPlSCvq73nR3vlZIPcyc8LEU68Qp+6V1bPk04KNiLFS5j0zzCLnPoertqyLzo0R52r3mAyHWPkXBwxLV3xKHgrAfncG8JTYkBO2mGjAxynDaGVhqatxwRVDSaVclZqcplsV3+aRXczTil7guALy1I6P4KvQAFsuiHZtjAG2xggRYna6sRtT+8FVB/zo7SSu/+/o0XNng==
x-ms-exchange-antispam-messagedata: 67CYWDZiz1UO3pkwCC7X2e+qj8WkhweMWc4rqFstg/d3+VsCQNQghR3bO8+ja5P4B6Wmfp9sU34TqEqOhi9TkM/BGzkzclny+zQsz3vpm//FQ73ylkBLjp4Kc7A398iy2Ho62tPHiP2z3lF+AKUZduc4kD78okQ+dbR4b0LqxTWpPN3oXes4b2vR3RQ+9VD86qrm3b0RaJa0YRxxgQiBHQ==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2496
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(189003)(199004)(186003)(33656002)(55016002)(107886003)(26005)(6506007)(53546011)(316002)(54906003)(9686003)(6862004)(70206006)(966005)(5660300002)(70586007)(81166006)(336012)(356004)(81156014)(7696005)(4326008)(36906005)(2906002)(86362001)(8676002)(8936002)(478600001)(52536014)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2378;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6b944e99-dc78-4cc2-d8ca-08d7bac8c5e6
X-Forefront-PRVS: 0325F6C77B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+Vj8VjTl/YUGenJRP2+q2f5XcVtcc4fCX51+g4+SQsRV++WjAGnAN94Ajj1ofdfk/Bi4eDTfTxRrsP/uvUHyJuBjgi3JJhKZ+2kJfVyIbHyuCcJFMoQrpeZNMn+1L8EZZe0xnB4UWyk8sPPG54HliZDCR9HlUL+6FGLtDv/KEnVSWpdOz5rokbsFxNudfAOP+BYIBp3VL58RsfdL38wrB1D2OKG9pHSTqT+yX4LMnhyq7/sp6f/ihowUlI7iNU2LVCm4b/6qQYEoCcWGej5QP9JqS2irQmWSluqLd9wCXuDCZU+reClvMSbPsqTF5ybayr56vNGDL2bgs7ktQ81sKMJdW4Z75BfxAwDS6zNv3SI7Vt7p6GzfW+v1N9yKtieoIkLfy5ZqxPr6Vlt5pgwKG/jj/JejNjKHmHMN4zg92aVrE24qfZm9GRl6aPbJITO6vTcpD6fLytd5cjHpNl/0Vzu1+MYKkJ4fQYzZtvmEImGFmLkC0KjCYau0vC2qOqN6U2UrZ+q/eNNZQeLXrWEKw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 14:33:03.9956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf1ad80-8297-4473-4b11-08d7bac8ca0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2378
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: Gerd Hoffmann <kraxel@redhat.com>
> Sent: 26 February 2020 07:46
> To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>; dri-
> devel@lists.freedesktop.org; Daniel Vetter <daniel.vetter@ffwll.ch>; Catalin
> Marinas <Catalin.Marinas@arm.com>; nd <nd@arm.com>; Chia-I Wu
> <olvaffe@gmail.com>
> Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
> 
>   Hi,
> 
> > > Perhaps try the entire series?
> > >
> > > https://patchwork.kernel.org/cover/11300619/
> 
> Latest version is at:
>    https://git.kraxel.org/cgit/linux/log/?h=drm-virtio-no-wc
> 
> > Applied entire series on top of 5.5.6, but still the same problem.
> 
> Can you double-check?  Cherry-picking the shmem + virtio patches ...
> 
>   694c824491f1 drm/shmem: add support for per object caching flags.
>   3f4d10f853fb drm/virtio: fix mmap page attributes
> 
> ... into 5.6-rc3 fixes the corruption for me.

I tried those 2 patches on top of kernel 5.6-rc3 and they indeed fix the problem.

I applied them on top of 5.5.6 and they also fix the problem!
Could we get those 2 patches applied to stable 5.5, please?

Thanks,
Guillaume

> 
> cheers,
>   Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
