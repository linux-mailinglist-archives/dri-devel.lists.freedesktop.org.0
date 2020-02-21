Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561CF167A23
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 11:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A716E255;
	Fri, 21 Feb 2020 10:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECDD6E255
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFdUNFhnCG06ZsyrqrXagyVG1BqYfG+ODUL9wH/cA9o=;
 b=Y0ZBTNQ5Wv5kN7OUze2XclbNs3VtSZ9cApksCTkTqem5xM0xdds2sHQOMxLtR/yxwgY8Fk3MAeNvZQOiRReKP0qvM1oin+ArkqbWTZ0sgQbEUjwtM+8uRL/JYDtCbQ2WY4i7fjhIHgE3DCG6QVToLJeMvHDAK9zP2RTVGMI4M+M=
Received: from AM6PR08CA0048.eurprd08.prod.outlook.com (2603:10a6:20b:c0::36)
 by AM6PR08MB5240.eurprd08.prod.outlook.com (2603:10a6:20b:ec::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.29; Fri, 21 Feb
 2020 10:06:37 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by AM6PR08CA0048.outlook.office365.com
 (2603:10a6:20b:c0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Fri, 21 Feb 2020 10:06:37 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Fri, 21 Feb 2020 10:06:37 +0000
Received: ("Tessian outbound 3a0cbd311638:v42");
 Fri, 21 Feb 2020 10:06:36 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8115a19ce708.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56A0160B-3107-4B27-9780-99B4133BD3AB.1; 
 Fri, 21 Feb 2020 10:06:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8115a19ce708.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Feb 2020 10:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0rOSsZzepldSRuuRXFKMkYGNQYLBzFwY2p0VYTJ6AWPnqyzCj+z/iZGaoKer8hW4Ib1aWOQy/xCFbm0TTn5goMUIB4yHsnBKURrW2mo1GIQGcTmGZRtGMs+Go03qlFUcqLVFYj6G1ol862Kyf3LiOIMHS4gKYNX+ZtSHKzDKF57rL4QVrOz7xE9bhmoJwh8tCegYHFXl6UeuAsXgGvSr7SCh9EQEw8cjh805lVyczN70UoAzVf5A/d8Hf2ISJ7oJ6zcwoZ127LT8OqWacCZEfTPDgdu8OvXRJ+80tBDSQODynf1/f/yxuh7cQPHQJfIwdtKFQCEwp9uyLKQXXNKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFdUNFhnCG06ZsyrqrXagyVG1BqYfG+ODUL9wH/cA9o=;
 b=RdtDAO8Sx5xLP0p+Q3qbnGGpcnPwee7HXUcRm74DBC/xXYCGl9H8Qo7M2CAAd4L2VQJlxFa+cdHkQACfKnqo0OMfzdFEygMCzdjIFmjGiXLEofRTPmNWbQskNPnSeZk/yuVXChUN2bXyAN0q2TL8rCiKkkIkrRvYTi42YecsaSLlup4RP3lbokLTvAFGbxkT2cOUsc4IKYwgN5fXcZJBFRPf8kevSLH5xQqJBtMm0ts9CQH652UQpzHgnD4mDvjFvp7KwSDHu6P8u7a7+yMXXtC+gC0Vn8IGOfFjM/vuBHsISm8ayUXhPYsSfH6QfMFKCbemp70QIOt743mqKkndZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFdUNFhnCG06ZsyrqrXagyVG1BqYfG+ODUL9wH/cA9o=;
 b=Y0ZBTNQ5Wv5kN7OUze2XclbNs3VtSZ9cApksCTkTqem5xM0xdds2sHQOMxLtR/yxwgY8Fk3MAeNvZQOiRReKP0qvM1oin+ArkqbWTZ0sgQbEUjwtM+8uRL/JYDtCbQ2WY4i7fjhIHgE3DCG6QVToLJeMvHDAK9zP2RTVGMI4M+M=
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com (10.172.12.145) by
 VI1PR0802MB2575.eurprd08.prod.outlook.com (10.172.255.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Fri, 21 Feb 2020 10:06:29 +0000
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113]) by VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113%9]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 10:06:29 +0000
From: Guillaume Gardet <Guillaume.Gardet@arm.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Topic: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Index: AdXn61yFYQwTcGDvSs6HxocaeVOz6gAMeNQAACAl4YA=
Date: Fri, 21 Feb 2020 10:06:29 +0000
Message-ID: <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
In-Reply-To: <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: c1ff790a-f865-45d6-9ab4-0c0b93fe0dc0.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:698b:6975:2d8c:8b8f]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81f93662-080d-4e61-b018-08d7b6b5bce0
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2575:|VI1PR0802MB2575:|AM6PR08MB5240:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5240A03E32F25B0F76086EDA83120@AM6PR08MB5240.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:962;OLM:962;
x-forefront-prvs: 0320B28BE1
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(71200400001)(9686003)(186003)(5660300002)(7696005)(2906002)(4326008)(66574012)(53546011)(52536014)(966005)(66946007)(76116006)(6506007)(316002)(54906003)(64756008)(66446008)(81166006)(6916009)(81156014)(8676002)(86362001)(66556008)(478600001)(66476007)(55016002)(8936002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2575;
 H:VI1PR0802MB2237.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qPLnZrxv2eEmuz7cnrl2qf/UoXV+w4neq8WwktLQBDKDvy/SwTI4yNSI8yOn9oxRqLghKVcFaFAJBnFiCoZZnzaicPmNQIflBDZ5K4sCS38uuzJ5X2t65GeWTE2fdV9Yeim+AApevAYVBlizCLi8F+63eeAdAeV2SPKrYPXBh5xxE3Xcasxh/XFm1bsgVCbIT+uNJ6TJvosESwBRTqkQ49cnNWve7bwqOj5paomhecEGvf4aIlSimfxRGoOalg0H4AIuLpjpEc2Q2CcSCrez4ZJf6+LoQ7ImezI5I2nEWqqMNm8mVNc9XCawOoPv4gTHYIPElTd11P76QS0ZLeXaTDSUAQMl5DNgHbzIvA5O2Sf2gK0JWIH5QfXRrE03ZexGZJanSbukQbBLxrRXi3ExoIFRhCkPohXNLPsaT7K9cyn6qGVD7yRh0JjL6SgF/paHplQFJHGOmlCXf/5O4qcVPQtxrRUpCbJ9GHz1TGNAIstKsGECUZ1MpnLpugLB53Ph3MjDrog/CPRlU1QkLxe6Bmb/gTNsfNSrYbC3i5zkcd8IgG0cvdYOsCsrQCYKyZ1F/QyU38pEpstaFdJvSijfTg==
x-ms-exchange-antispam-messagedata: 3Ya3RrOLFiZYdUlJHzu1ApQRh6uUbmr+r08knt5AdcY6ws4qOraFzJCXCaa8Y0aH0L3MduO9lWHapwYLijOw+XqAvqrztBrcZP51c8Y9tRk6SMKCj0ieQkfIdLvv1jtNOv9wS4zX4V9OnPwsBU1HHqNEeDIje3jYuj+4pdvUX+NipnMg0qpGSKpU9rmQqcBboxyDe/n7Zz8NU+3apuM0/g==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2575
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(199004)(189003)(52536014)(9686003)(8936002)(5660300002)(70586007)(2906002)(55016002)(70206006)(4326008)(6862004)(26826003)(7696005)(8676002)(478600001)(53546011)(54906003)(33656002)(186003)(356004)(81166006)(316002)(81156014)(336012)(26005)(966005)(86362001)(66574012)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5240;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7e6eb68a-742c-40a5-8ac2-08d7b6b5b877
X-Forefront-PRVS: 0320B28BE1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iO+I/nq0x04FuZ4e0gtyBRFlqOj6p9tVuz6rs09jxGrv8akAuSGtItkHUU5e0E+sriHI64Yq3JOLxUC2eAnfRybmb18CCOitaDaT9WQGSAEfwEsmEkDIsaZxZRMAfSMx0NPMzWMcnsAmQ9WAsx1wDhGg2D/yMNhF9FA7fDpBs+ScWzgmb9DWm5boYnDlM80D9bq96SO5hnRbub9jAHsQccsBWQLrqKPah9qMNgbH+tV6lcKBFV4s6ELc5ow6VJYR6WRlEHGXrnkAOmFYZcPoBrPk2AWX9qPmHXeXHwUsRxY++o6Z2wvPssqNZvPCn11oz0N2mrVl4v45wmkWlfWPhOKaolNO3r8lTBFH08dgO2kWfS6zY9Ccc60Js9MxpeorxNknUPGldN4h+ZQw9DcLhtb3E5011wzFqtLooHkSkwApoeNzCBQcZUOeQDt7QJlCgUWqpXixWTGynqNrGJKnmy3jkh9AwQDwrTvjovScbb5joMTzMkCxm3618vxXdLpvQaYMZdJnc6owqUmQMBrJOJ5abUz16PfVHa20Kn8WKt2fgzhDONrm+FxEOr2vfv5TplzQfZr+yVhPTu9oFykvcA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 10:06:37.0332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f93662-080d-4e61-b018-08d7b6b5bce0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5240
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: Chia-I Wu <olvaffe@gmail.com>
> Sent: 20 February 2020 19:41
> To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> Cc: dri-devel@lists.freedesktop.org; Gerd Hoffmann <kraxel@redhat.com>;
> Daniel Vetter <daniel.vetter@ffwll.ch>; Catalin Marinas
> <Catalin.Marinas@arm.com>; nd <nd@arm.com>
> Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
> 
> On Thu, Feb 20, 2020 at 4:44 AM Guillaume Gardet <Guillaume.Gardet@arm.com>
> wrote:
> >
> > Hi,
> >
> > With (guest) kernel 5.5+ with qemu/kvm on arm64, I get lots of display
> corruptions leading to this kind of screen:
> > https://openqa.opensuse.org/tests/1174521#step/yast2_i/24
> Looking at the screenshot, it seems cacheline-related?

It could be.

> 
> There was a change of memory type
> 
>   https://lists.freedesktop.org/archives/dri-devel/2019-August/233456.html
> 
> While the guest memory type is ignored on Intel, it is honored on ARM.
> This attempt to fix it
> 
>   https://lists.freedesktop.org/archives/dri-devel/2019-December/248271.html
> 
> does not seem to land.

I applied this patch on top of 5.5.4, but it does not fix the problem.
Maybe more similar changes are required?

Regards,
Guillaume

> 
> 
> >
> > I git bisected it to commit c66df701e783bc666593e6e665f13670760883ee
> > **********
> > drm/virtio: switch from ttm to gem shmem helpers
> >
> >   virtio-gpu basically needs a sg_table for the bo, to tell the host where
> >   the backing pages for the object are.  So the gem shmem helpers are a
> >   perfect fit.  Some drm_gem_object_funcs need thin wrappers to update the
> >   host state, but otherwise the helpers handle everything just fine.
> >
> >   Once the fencing was sorted the switch was surprisingly easy and for the
> >   most part just removing the ttm code.
> >
> >   v4: fix drm_gem_object_funcs name.
> >
> >   Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >   Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >   Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> >   Link:
> > http://patchwork.freedesktop.org/patch/msgid/20190829103301.3539-15-kr
> > axel@redhat.com
> > **********
> >
> > I also tested kernel 5.6-rc2 which has the same bug.
> > Without kvm, the display is fine.
> >
> > Regards,
> > Guillaume
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
