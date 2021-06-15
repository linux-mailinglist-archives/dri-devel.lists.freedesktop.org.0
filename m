Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AEA3A7603
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 06:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0426E202;
	Tue, 15 Jun 2021 04:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5476E202
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 04:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awimH1hP8m0F393fe7PhJn2+s8kBuCP7V2VgJVq4xFb9dTJas7jr4ckRXLRsTnGmckcYu4Rigrp6xlXQmUXdwBr5aCnHD5SkzcGu9TjGviNtFzsaM4ewyHW738GDudB6/toaWEGK1mTtLznZl2fpuC7w6tfkiye/7hJJi4k4qgmamO78Yz1CCo9PAHgTx1xXq6i39MlX3ebPCijJt9xgmslbGMZtVt7Zqok6iyGMCm1ZLLPuG6nVDzHMaVG8evXpzXR2yFcsGg6Eost40T/unSAVhYUm3cdjtkotHmbSzUgC2qNqR+AS4+/2YVeRYJh9l03faVC7dux/yss/yXGlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWDauyNO2mkR/kpTo/2mbMHT3n/4t8gAVU3pg3b0L+I=;
 b=Shw179mAVdY/cokgTDNOndbaKv1T4woBmqpVatzdr9+oPM0KVh8oaS1uBTo/K8Tduc0qZrlAlpVUJdPphMs+48TzgHttfglLN4e78ZxE+Keo0q50buRKpu1/awtO0qye4P4FuI7yvfGr9ZYTlmpi1Sap3KkOnROZlRd40USSDrRX6vEybomgR3RPuLGfqUhfPFvRblV5UFA20DQGEU8uK5bcOdqBvcKx0dGsHsk2bqX7jd3znZiGCjUnlRFvAq192D2aqCpBHzx9rdJ+2cRqLvM5d+lDXF6CCsR4HdJRDCMUJXvCG391YlJRcOHTLphb6n/lnQVMzm51qBHf//onwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWDauyNO2mkR/kpTo/2mbMHT3n/4t8gAVU3pg3b0L+I=;
 b=v/3Mvx6KF+JlCZWDVExQl0zhe2TTSiA37VI6daipMkKyHVN+MmiGCGDMpzzcnGDQEcC2h1LkMlc9k3fHCJdiPSpM6ZfJvmuxe+gRhg/qwz3bihF/JAdjsSCAOGIza4dJPK3cL0Yem6LUWkKk8SDu0eJJ6LPHN8CKTYd4j1krPQQ=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CO6PR12MB5412.namprd12.prod.outlook.com (2603:10b6:5:35e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 04:38:12 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::704a:9f7a:1c8d:db6]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::704a:9f7a:1c8d:db6%3]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 04:38:12 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] Fix observed mst problems with StarTech hub
Thread-Topic: [PATCH 0/2] Fix observed mst problems with StarTech hub
Thread-Index: AQHXU8lhuuYmJEQIHUe7f1p1JSuZR6sPfr2AgAUTvi8=
Date: Tue, 15 Jun 2021 04:38:12 +0000
Message-ID: <CO6PR12MB5489B7754D0572CCC3CE9946FC309@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20210528135557.23248-1-Wayne.Lin@amd.com>,
 <3889e7b888241e9acf1893235f49585ae34175ba.camel@redhat.com>
In-Reply-To: <3889e7b888241e9acf1893235f49585ae34175ba.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-06-15T04:37:39.573Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [36.234.120.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90cc7102-e705-4da5-b66b-08d92fb7628e
x-ms-traffictypediagnostic: CO6PR12MB5412:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR12MB54121C2B037185FC7C2B309AFC309@CO6PR12MB5412.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GhFev5AIFlwr7bz3ZrlSvO7m4ETm4b8SxmzIYhKXvg8QVbUb3Kcl8K+Mc0yRvURx6NWav2V8mjmq9k36XmSJeqbkCxjhkXGQwnJNs6QFtfCSQutM+i3nDg8CAQyJ3z8NcPqEo3GG+CUNE5PediM1eYeRezdEHR4bvw9pzQqBJ/B4fCtRZirybXbXppHEojanjrHD3gItW7PA9ojJAD5hqChW5qzyRKHYZcKMeISS+6403At03Z49FUpMz0xvmwHEJWnAHNjmqNHD25KZl0WpOqVxYZbfXI9z3gFs3rq5hwXW0oviiaW+LFn/ZMRKBAqgat4s5P3tn+AH1+TX9x5j2ARzau7CDCYYh3GM2GxCZUQYmsy75J41TCDJkABUlUVMqfrZ3JZcEPKxVDfJ268rxPRc/KziMre22nxHqfyaGS0ZYO/8MMf0Ad6PvCsiHXoS5tH9rZCwKm6YHjtmcsH1eGWU3l6D2xuskZ7lVEapRhoxefTNKkqJTKWDjjBCeyA2pA5NmZOdcbxxQ/EKvj8K3mPQILv6BE3DcMkDvwR1N7jBP/t/aDlZQq2AuS41pT7dnuKKnUB7zs9c1Bo0Opdhly7m/lchWN4B8UsHSClJ5Qk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(4326008)(9686003)(54906003)(33656002)(64756008)(110136005)(8676002)(76116006)(66946007)(91956017)(66556008)(66476007)(2906002)(66446008)(71200400001)(316002)(55016002)(186003)(478600001)(83380400001)(38100700002)(8936002)(53546011)(5660300002)(7696005)(52536014)(122000001)(26005)(6506007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YMnJDk49ptwK/DzYiSctC6nLLQ3wPdzuhObc36pV9Je2GLr2dtXqoXA5kh?=
 =?iso-8859-1?Q?L7yZ/snL+Buq4pNgYuL/KckAp+dUvMAavWEUZ470gIPc4mwOGC3iRc92RH?=
 =?iso-8859-1?Q?7KypeA8E8x8Fb3i0ymgS1VHoa2qxK7/U8prEwmVTwuNgzxd8+bzK1/MjTF?=
 =?iso-8859-1?Q?tRwXIaBoMNf92syhSX0rtXzwz+MFWDeE2vCO1jZ1awT4dqqrsbUYJw76Sv?=
 =?iso-8859-1?Q?bX7DUpdFw1ut52pB2Te0k0Azl+1nbbYBsvTajZtrrrw0SBrNVJpa6lFYlg?=
 =?iso-8859-1?Q?pHHbwbeDmwAnf+uJD5OHHPHyKLuWa/bnf3lfUu1pxjTngwgy5c6fkEDMin?=
 =?iso-8859-1?Q?s4rDZy4BbZcCGrS/Qy1L1x160GrcIoOgxSuOtOkcuvmd3BQ6dbhNjIUQEw?=
 =?iso-8859-1?Q?T5ADRpKHksYB0zM7p47g4qGiIjtNwEIrJcRHIVeXqplq0JJUAmg88rJ+Ey?=
 =?iso-8859-1?Q?lfm5rWCSTEeQN0Bftd7n8YsWS4BuGArYovgcTfvSASd6hqFMsvKWxWkj4N?=
 =?iso-8859-1?Q?p/aVoxFyngdrvHIUmF6eAkBHAptl2wUEZSLDFr9wQeyQeumO6nPc3g9JUI?=
 =?iso-8859-1?Q?/7ntfYMhFBDNUVYIaDlnul66upnyJnKpODmDSTW/V+sM8S5+P3VlzrbwmH?=
 =?iso-8859-1?Q?hoI66IO25TWPBu90Saw8Xu1fvjqkJz1QU2RX/f1GWSFpRzF/NFbSJcJSXi?=
 =?iso-8859-1?Q?hb7DkgjMXJ3CjbAtcshD/rYWqQMsGfEvdt7WX7n7gB5gpFVY4x0+F0YuGl?=
 =?iso-8859-1?Q?5eRT0/4yOC1m3q/Se+Y9WIchfBrdhb1HahYLBjUlHHhwtoU7prlWK/Np8S?=
 =?iso-8859-1?Q?h1G69qJ1g6+tJpISKTTWyN5CIUgu3CG4c/35ZAc5/o3yOBJuhR4E/ZuVkS?=
 =?iso-8859-1?Q?sNiaLPfDX23Nt5wIAis2fofWGiU7FyV2Z3SlHkaJFTgmQRf1bpk4RIwpy0?=
 =?iso-8859-1?Q?eOgm1o3MuGBUbeXgJpaSzhoF7BJmjhCehOzN0CUT2TROW+bKJiuh2l/e6d?=
 =?iso-8859-1?Q?JXLkM1FHdQViEohQlxxgFPOOyUmjq52svtK8/uCIA9+AfMFDkLBmPOF2V/?=
 =?iso-8859-1?Q?KiPxNhkd+b/4F5wKSzTso+F6pIK++PgZH54pv67m7GyvQzH6ZIqcfSBLBp?=
 =?iso-8859-1?Q?Sk/0cYsnj1y7WCNfzHu3A+VWuPv9+IYjfIHm737raCPTFuZiCwTO3tctQw?=
 =?iso-8859-1?Q?ie1nNJLW5yFLApdXNUu7kJohdvTN1meFrZZ6liqHjCofnHqvUDLdeFIgII?=
 =?iso-8859-1?Q?ZKIPpzwrXXnNqVJbFNKrn+ByBjST1yBqTWbhyBn9CobBL3hE3PwY5kLDd3?=
 =?iso-8859-1?Q?Tg91mOhzVxHulXGug2CZ22MCblLRSFTxzSUeyHvEPlQ0pxo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cc7102-e705-4da5-b66b-08d92fb7628e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 04:38:12.5709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+ZzXOI1I0jhGwWRX6XZ1wqpuY7Wj/SAgraohnuIAsGj1JaV+e6TfJWTg/MyFfMKpEkGKtC2W2sm0SQk/Jxbgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5412
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Thanks Lyude for the review!

For the 1st patch, it's trying to fix the patch
7617e9621bf2 ("drm/dp_mst: clear time slots for ports invalid").

As for the 2nd one, it's my first time to test on this hub and I not
yet know the exact regression point. I'm also not quite sure if this
regression is caused by driver or just behavior changes from upper layer.
I was thinking that this patch is just an enhancement for our mst
helper functions and should be applicable for older kernel versions.

Thanks for your time!

Regards,
Wayne
________________________________________
> From: Lyude Paul <lyude@redhat.com>
> Sent: Saturday, June 12, 2021 06:43
> To: Lin, Wayne; dri-devel@lists.freedesktop.org
> Cc: Kazlauskas, Nicholas; Wentland, Harry; Zuo, Jerry; Pillai, Aurabindo
> Subject: Re: [PATCH 0/2] Fix observed mst problems with StarTech hub
>
> haha. turns out it actually was a good thing I was busy with work today,
> because I ended up testing some backports and running into the exact same=
 MST
> bug these patches appear to fix. How convienent :)
>
> anyway-I looked over this and this looks good to me (and IMO, I like thes=
e
> fixes more then the workarounds they replace!). The one thing we do need =
to
> fix here though is this appears to definitely fix a regression, so we nee=
d to
> make sure we actually bisect the issue that this patch is fixing so we ca=
n add
> the appropriate Fixes: and Cc: tags so that these fixes get backported to
> earlier stable kernel versions.
>
> I definitely need this fix in asap though for my own work, so I am going =
to
> see if I can start bisecting this. If I manage to figure out what's break=
ing
> it before my workday ends today I'll just add my R-b and push this upstre=
am,
> otherwise I'll probably just push this first thing on monday. If you see =
this
> message beforethen and know what kernel version introduced this issue, fe=
el
> free to respond ;)
>
> On Fri, 2021-05-28 at 21:55 +0800, Wayne Lin wrote:
> > Use Startech 1to3 DP hub to do some mst hotplug tests and find some
> > light up issues.
> >
> > 1. ACT polling timeout:
> >    Which is due to we didn't update DPCD payload table but still try
> >    to send ACT and polling for "ACT Handled" bit
> > 2. Not all monitors light up:
> >    Due to we wrongly set unavailable VCP ID for new streams
> >
> > Wayne Lin (2):
> >   drm/dp_mst: Do not set proposed vcpi directly
> >   drm/dp_mst: Avoid to mess up payload table by ports in stale topology
> >
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 65 ++++++++++++++++-----------
> >  1 file changed, 39 insertions(+), 26 deletions(-)
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat

