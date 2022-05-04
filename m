Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF9151A5CB
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8684B10E542;
	Wed,  4 May 2022 16:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020018.outbound.protection.outlook.com [52.101.61.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838F310E542
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3kVbMCjckZb/GO2rKXkekMKykljcOw/vH/lSakEmrP3K0S59WoXmF63rCaiFQI+FQq0/Mzp3Odq7kaLunh6EkRyYujiqfyYhhkPTWDAyggBUPuY+BpGFMiOW0gulu11eoIAJmeN2M23oFbRaR3QSX263Em+pEFFZbN7SOKqxT0uwhKQMSdbaYacgAoJu6pdGNXaUQEfMjqtg5bgan0rIuYOtMr1UMyKE+W19CH1fqAFgbV0sT7b2uhGL+8vtse9Q/RZsn3czmVz0zIECO5XaqfpIpccajCKR8cpE9HUJ7iLFIz8EaVqwmfACg3Ykw2xExbKYcDzuKfHPNl1OtAFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbadKU2ja4QhdqHNENqqNrvpNboQ2IhA9jknKuNRtV0=;
 b=lbvhihjSuTRs3HLNK6qc/nXPvxbsZ4Axw9hzOTse6BGD+PPCu0+1IpYEAkmqYK2nst3L/WSq+rYDxtDr2rJ6zXOd+VpX9QeXXuNpGuZkSd6TeIsX6cjGY/uMeH1P7YHvJfDHeC59GjscOmu8odkrIjO6VZVhB1Z52w4EhMBAK8Ouug4hovduc2ASWjsn+ImNTklkARfFcpjo0RC2tj8My/vBNcx4ItEEbO8nqsTGl62PoyFsQCc/DT/F3K3slj/IlSiLkSN5nHrlEo3BMfw1GfiR8ryEv4bYQBY1BjJ3+Nvbfv9swWYlLl75iZjKkHZRuZH5FgoCMG4s2b9YwGLC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbadKU2ja4QhdqHNENqqNrvpNboQ2IhA9jknKuNRtV0=;
 b=hWeWbXdZ66uXc97hTzN85obTxMi3vWQ9UygktMOe9CfBdpKy8Vm1lZYEaiCREGb96mt58B1geSQzdaedxWOMN1X0TXa4qx7mIMu5Ro2d6x4OmleJtQiBngVN+jXgyXBuySOt88W2mRtgKB/V6/+aBD28Gahljz+k0rtmRVTiES4=
Received: from DM5PR21MB1749.namprd21.prod.outlook.com (2603:10b6:4:9f::21) by
 BY5PR21MB1457.namprd21.prod.outlook.com (2603:10b6:a03:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.7; Wed, 4 May
 2022 16:43:24 +0000
Received: from DM5PR21MB1749.namprd21.prod.outlook.com
 ([fe80::6d4a:ca20:4584:49f]) by DM5PR21MB1749.namprd21.prod.outlook.com
 ([fe80::6d4a:ca20:4584:49f%5]) with mapi id 15.20.5250.006; Wed, 4 May 2022
 16:43:24 +0000
From: Haiyang Zhang <haiyangz@microsoft.com>
To: Wei Liu <wei.liu@kernel.org>, Saurabh Sengar
 <ssengar@linux.microsoft.com>, Dexuan Cui <decui@microsoft.com>, "Michael
 Kelley (LINUX)" <mikelley@microsoft.com>
Subject: RE: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB for
 Gen1
Thread-Topic: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB
 for Gen1
Thread-Index: AQHYWj1qgbQXzG7yeUuG8g2gPWY4Wa0FZpIAgAmPjZA=
Date: Wed, 4 May 2022 16:43:24 +0000
Message-ID: <DM5PR21MB1749EE7458996FF22AAA9AF8CAC39@DM5PR21MB1749.namprd21.prod.outlook.com>
References: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
 <20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2>
In-Reply-To: <20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: decui@microsoft.com,mikelley@microsoft.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ea6efad5-303e-4efd-b054-9cb15ed3afe4;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-05-04T16:37:53Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d7664d1-3fe8-4291-4841-08da2ded351c
x-ms-traffictypediagnostic: BY5PR21MB1457:EE_
x-microsoft-antispam-prvs: <BY5PR21MB1457BA31FA97B22C7DC19AF4CAC39@BY5PR21MB1457.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nOVi5VlB+KwXGtbfh9dBdFGNrjD24UGAmqRdbCCxDat4erlPD/qWxxQ9BhF0fLtLWXEfxI+YsYmT+9OZtBilNcQKqp25fP9Yd0c8yrZA7ft94TAcrIngiHnLc7f4+sOr6RWkNiLT7w1hFUamBt7OD2chrbh6lB9pqzTF6U2rHBhY+ret7yaggGfEjENzjwOD9XtLL69qyDJSEr2Rj2AQGQudT7mEodTFRVpLj94OqRHo7PNNSBO1HRIqOBADrfQJYKDwsnIIGRHecovywY47HPCMwc5wyuGa/TPEDObW3P8HhYqefSuRRJe+rd+oZBmBmXhymWZNVGhthfzTLXsVxHexG2E1liyb+beBPpNwl2J5A8cd8dYbz74ZMNh5f+n2cVnr4CDo3hMJIF44HC29zL5O2ZYBDfeWRGRMFd+ut6XnkFArT15ghF27GcSPrH6yKpPsggVz1XzCJD2cevYsu79U20MZ83oTWXY2ibZ6NaBatjHytOELAylF/KUbFt8tspqnlC7xrDwg4AJqjDeP2av/D6TSXQkr0D/b3tGgGan3U31pLA9A4Et6krtAE+s6PcjQpB5FZll4jDt3spwuttXXVspKQi+kKu3LNDldQ9C1TcjpACbf4CnIiMx8uZhJ0oDWSZ+ulsFY6aXeVyqhcFw+ZD1BwIMDdDbyk98coom0m3gYPru/u/2LSeXKvnsqiis3ldXZYf+eVnOIxE3VfDFXfX1JU8J6eDy6rwExcKfCil7v8MsgG2tRrK7ZUnhU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR21MB1749.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(71200400001)(86362001)(52536014)(8990500004)(33656002)(38100700002)(8936002)(83380400001)(4326008)(8676002)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(2906002)(38070700005)(110136005)(122000001)(6506007)(10290500003)(9686003)(55016003)(7696005)(508600001)(26005)(82950400001)(53546011)(54906003)(82960400001)(6636002)(316002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pDDtLISk+QTUEkLC1Lya5i1HDARXCIgcu30Q2k2kegQJHOAWOyUVYOswBP0h?=
 =?us-ascii?Q?h9CcpsG9VIGWQ7zPdUFFbLi9mOlMpZ1LJJ/557Undg+PVR3C7vu/4hH2ygbV?=
 =?us-ascii?Q?hU7l/NRWO0Li8GFPN8f1J0lDJXJ+iHUeVG1odfUWmwnaFk3jak3qoT1ZZ/kb?=
 =?us-ascii?Q?92moFyAiH+HKiZ5KOrIOZ53F3WaBy5YrD8p83VdsWIVZLYKR+ZEH0XMZi+hJ?=
 =?us-ascii?Q?eqdk5ypg3wZMslcyLEOdoZOnoWgrxyV0r7NMS+LGdr9evVsLk5jXys/DcAMZ?=
 =?us-ascii?Q?xEcImdOiA8ohh8AX8Pt7LGEmUluX+vzRjW1xM06Ir0jZl76ult6AGTXClmc0?=
 =?us-ascii?Q?cnTL/jaJ6r24Mz6bItvyZGKs25g+iAy8gj/kDLp1wKbuQ+T1iY+gE7J4QSjq?=
 =?us-ascii?Q?1FeYrRAAhOR4XWzIEzVMLmDXXYA6yGxYizzYXBiUYlbWfken86WosdpAmgBb?=
 =?us-ascii?Q?sfIH6pE7UuU37gHSp511Wm2UtPjY3tN3+i8qfhIzNS3NuU+Zm+C9IYD+7RBp?=
 =?us-ascii?Q?zuL5T+ABY01uP9wJjdh2q0VpMH7ZCN+eBEbI4e3D3SC+OXaVD70Qu/4LpLmE?=
 =?us-ascii?Q?bXPWF8liuV7eM3YXhsZw7HHetJhNmvePYYxUIeG78UQFtlUtkYgEfpX10+ig?=
 =?us-ascii?Q?3gSVcyElT7GWQuAUnWMTW6hQ6d5ZSKE3h6KKm3ODVGHej/ai0HW1z8OKCdzA?=
 =?us-ascii?Q?mJSmZzVGE+QMHjYbB39L2zQO9R8VXlwegYL0gk1Y207t8ov+9E68+d6W52LV?=
 =?us-ascii?Q?bdlu0C7i+6UYZ8i+AqpByUs+gazXV8B1JJEDyvmDb6MkXhMQUmQE4LcSCYto?=
 =?us-ascii?Q?fcwm8STDfBlaW29WLKf8EA4x9zttjyaLC7J4egd+w4Fw82JiZGb0eZn8pfim?=
 =?us-ascii?Q?qNmlmXJTt16rn3OAzwzSMlRuKiArsiTLLXO4jVrlU+E1mDxvsfcarvyXJfA+?=
 =?us-ascii?Q?SIyoN/+FhGYqe43nfL8J/THoHYuIv4sAfj5LQ64gu6re1rHxgIqQcnEGUn62?=
 =?us-ascii?Q?XVqT++Whw4PKj5zGI1XPn8T3aF/PUrP5LYX3kMsdtFiqZsIlmc01UuqDmLAc?=
 =?us-ascii?Q?8FFNhiRlMy5TsFaMJYyEtBHON6tOp2V/M7EU2s3qwyIv/hFdm+bqbkzNOxBP?=
 =?us-ascii?Q?YZIkUCBDW8aNO7kH9M65vdOwTYlYif0Qu0gE901zly0uBMuRjNIh856PthjR?=
 =?us-ascii?Q?oD1YGzZMMxUINzucul5IDD+vHvpc7wzzcN5Cp3qzgqNAQfFBfzcnnTcqPllg?=
 =?us-ascii?Q?Yhmd1FMT7QX8CVquUmEsnzC9TeHQJ6k09acYoBBpCYNO52NIHKeSy6AClWVA?=
 =?us-ascii?Q?Yqjw+DfN7K42NZF4VsLds+f0+uPMmNVnFJenhRl6lJYMu8XhgkaJcvgdYRa2?=
 =?us-ascii?Q?ABGbOdoXNrpqIyp34clMYAKdXF2kryasJEVKOs7b2XXsLKJDd340XwZqekLb?=
 =?us-ascii?Q?XSigSwbjH+JPiyi24x/wqjqrLGm90HcKNKKmR+Kn/y/J3ZpUnZqKxWifJ4w+?=
 =?us-ascii?Q?9EEh/R1E8a6VJetsl/evoljrHJGrnZWObrGt1kIlDPUCLEA1dxb92b9Hfh0Z?=
 =?us-ascii?Q?yBrQkl9pWagpAlSmfP+yTjndU0wcEa39Z9D3EE9zd5dkYNQIDSpBc8e2Y/8o?=
 =?us-ascii?Q?lXPZ3XT1uRNpEQukMr5xySHdQDt2MTOa8Pr3IouqpMbQeGt6gYjVNmRABC3k?=
 =?us-ascii?Q?JN0tgkBCpJosWlRulbW4IgvEHo8TueLzip9VrkJnHcTuFG8/1lmthxn8b3QP?=
 =?us-ascii?Q?jIV0hCS88Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR21MB1749.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7664d1-3fe8-4291-4841-08da2ded351c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 16:43:24.7641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWc2Lzx23dOu+zxLkuYNXfpdWhfjBZ9eb/zkiChTurSVpqqlFelu+jcG+ZHo948H/rnvp1Q948c1zYa0JlySDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR21MB1457
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, "deller@gmx.de" <deller@gmx.de>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Wei Liu <wei.liu@kernel.org>
> Sent: Thursday, April 28, 2022 10:38 AM
> To: Saurabh Sengar <ssengar@linux.microsoft.com>
> Cc: Saurabh Singh Sengar <ssengar@microsoft.com>; KY Srinivasan
> <kys@microsoft.com>; Haiyang Zhang <haiyangz@microsoft.com>; Stephen
> Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Dexuan Cui
> <decui@microsoft.com>; deller@gmx.de; linux-hyperv@vger.kernel.org; linux=
-
> fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 M=
B for
> Gen1
>=20
> On Wed, Apr 27, 2022 at 06:47:53AM -0700, Saurabh Sengar wrote:
> > This patch fixes a bug where GEN1 VMs doesn't allow resolutions greater
> > than 64 MB size (eg 7680x4320). Unnecessary PCI check limits Gen1 VRAM
> > to legacy PCI BAR size only (ie 64MB). Thus any, resolution requesting
> > greater then 64MB (eg 7680x4320) would fail. MMIO region assigning this
> > memory shouldn't be limited by PCI bar size.
> >
> > Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> > ---
> >  drivers/video/fbdev/hyperv_fb.c | 19 +------------------
> >  1 file changed, 1 insertion(+), 18 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/hyperv_fb.c
> b/drivers/video/fbdev/hyperv_fb.c
> > index c8e0ea2..58c304a 100644
> > --- a/drivers/video/fbdev/hyperv_fb.c
> > +++ b/drivers/video/fbdev/hyperv_fb.c
> > @@ -1009,7 +1009,6 @@ static int hvfb_getmem(struct hv_device *hdev,
> struct fb_info *info)
> >  	struct pci_dev *pdev  =3D NULL;
> >  	void __iomem *fb_virt;
> >  	int gen2vm =3D efi_enabled(EFI_BOOT);
> > -	resource_size_t pot_start, pot_end;
> >  	phys_addr_t paddr;
> >  	int ret;
> >
> > @@ -1060,23 +1059,7 @@ static int hvfb_getmem(struct hv_device *hdev,
> struct fb_info *info)
> >  	dio_fb_size =3D
> >  		screen_width * screen_height * screen_depth / 8;
> >
> > -	if (gen2vm) {
> > -		pot_start =3D 0;
> > -		pot_end =3D -1;
> > -	} else {
> > -		if (!(pci_resource_flags(pdev, 0) & IORESOURCE_MEM) ||
> > -		    pci_resource_len(pdev, 0) < screen_fb_size) {
> > -			pr_err("Resource not available or (0x%lx < 0x%lx)\n",
> > -			       (unsigned long) pci_resource_len(pdev, 0),
> > -			       (unsigned long) screen_fb_size);
> > -			goto err1;
>=20
> This restriction has been in place since day 1. Haiyang, you wrote this
> driver. Can you comment on whether this change here is sensible?

When I initially implemented this driver 10 years ago, I believe there=20
was smaller limit for the fb... But I think this patch is good for the=20
newer MMIO alloc scheme. I hope to see reviews also from
 @Dexuan Cui @Michael Kelley (LINUX) who are more familiar with=20
the PCI/BAR/MMIO area.

Thanks,
- Haiyang

