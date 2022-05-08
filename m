Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C5F51EEBC
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 17:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6267B10E1EF;
	Sun,  8 May 2022 15:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2136.outbound.protection.outlook.com [40.107.236.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601C210E1EF
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 15:58:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJPkIOktC0vKkD51dyC9cg/ETtislFkNWOTFbGhg7l3WbS4pnLqUFI0425yjVhmku/POOSJg9QSb88wR3lDIL8xeE/sVYFj6z+0/BDAEJrh/8LYcoEEti8TX3w1mt6n7Kbk89e/UjnS7t3vr6BaibWYJT91KP6kc8s8tKTPslu/zQU6BAIOREH5PBvubewj8xUZAse7T1/vLkXJVQsGzMwblnLTNPpk/TFI9qWOB84NlTFr0ZqKfpJWA3yU/LmHLAAzsTFtUGh9U2SMgUBODZ2CKQYWw7qA8ZUsm6hE+sXRIac5Z6TW16ynwxi/TfYVfoNBuYg5VEbjt8xH8yvA5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io4v1qZ4VuuDx4ZlU6GWfhMS1DUFo/uWtelqd63x/FA=;
 b=IPrp/zbx+orGY4WuHqZ6vYqlK7VAJz0L5jEN1fpRKiCvW3iC/URujx1pUSjT15G6+r4oxzC7LIcIfAt50kiwFJpbOdNFClb4MFh20HfqfYJk8haotpu1/25qrkYTeZaCHNeqNolZ6+hI7/4Equ7zc0xtOoKAUSwC7mvXklpGsNxYGiAV8kbnMuskNS+VX9Id7NfIgc42TpFxMqs/0QlpD5nWPiSniXTEKhnl+EQ2cbWNRBVJD50+GJbPiu4iR1W8PhBdiqUx7WbmViZy1txjp9TpJcdiKt3PvewgjpV4QzjFm80U6s7gn9zseBRe8NTX1vYHRCigm96FTg8k8lWo9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io4v1qZ4VuuDx4ZlU6GWfhMS1DUFo/uWtelqd63x/FA=;
 b=HuMOotT66vEJ8HZSu6dXTw2HZTCyh7em6EhJZp1pxczNTYe1phiis+dBSSYD68KQi6R5OgQKoRc/nnZxL5/TQYbVmDmCnhyRPkVVYd5NRc7mfK+YZRC5KjYsgl2gWioiWSHUxSj6xo95yCo8YZ+SsxxmEtAGlWvnku5RbDUJVek=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by PH7PR21MB3239.namprd21.prod.outlook.com (2603:10b6:510:1db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.4; Sun, 8 May
 2022 15:43:27 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::dd77:2d4d:329e:87df]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::dd77:2d4d:329e:87df%7]) with mapi id 15.20.5273.004; Sun, 8 May 2022
 15:43:26 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: RE: [PATCH 0/4] Remove support for Hyper-V 2008 and 2008R2/Win7
Thread-Topic: [PATCH 0/4] Remove support for Hyper-V 2008 and 2008R2/Win7
Thread-Index: AQHYXkLb/0Gxv7HlzkaWTmgmFwYc5a0O+reAgAYm6dA=
Date: Sun, 8 May 2022 15:43:26 +0000
Message-ID: <PH0PR21MB302590D20E95D9076FDA9C99D7C79@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
 <20220504172307.GB1623@bug>
In-Reply-To: <20220504172307.GB1623@bug>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=8b1d71e0-6984-4f3d-8c15-012dd89651d7;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-05-08T15:19:56Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4c30418-69ff-4c7c-2632-08da31097e0c
x-ms-traffictypediagnostic: PH7PR21MB3239:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <PH7PR21MB3239CB83092CA8E1A2459B38D7C79@PH7PR21MB3239.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0luIiSe8Gt3sGlai75oT3tOiz+OBwbIR7T22Ob5SOi07oTGE9EQXsdrZku4hR8YCv0IWWNEpNHf0fn6kohThwtyCXlGDXYgB7YAkSJ8IPpvrLpWzKTq0cc6pA62NFCpg0Qn1s8KbNW3C3siIGeZuLPHtrAazQNFdHFNwkwSaaBQW8dJBp/hSJoZEdJ3CoXBluPaPispKSaW456xAX/Mu46HWkiuoXgsau4DoKfQ+g0Wxb5wufkqsPCwcRQxhAt8mtnOQ4qJbnIQkJNnae0+clNRNqH/5vKIF1vK+t0MnqqPXjDRRzmLwvgwLTss8P3eZh7Co07EDaWpBNl0lsHPtyTMhD4hzwQobQLaUylQ3NCyfr1hGTmKgiV0PaOSoVk4HyNSkEf/vmCsGum5mN4VEZd0hchG8blmB8a+NWJBcYEL6aQHEMiAmeX+cTCmp10pWFI74FKMPX5Ky89lwknXIuwrs+VVCY1qg6S/ZeuS7wNW3KI8cLo4tRYj1haqm5MfA/0HlAqy43ebrIX/WVB7X8JFiLX7xDfZNbGQiisNLNlpLY/fgYLatBKfiWsGnjjL0/jBC4ujfHANKzbw5f7IeFmkWdUeKuxt8zlrWv8CR2Y7BVPxzzJgd2XyaT3tJVx97iWRs0pO3QwTI0sMQn+5+SzN4cRVmlXlY4Paa7uHJ3qITGjnzQYapqLfNbFbXkMO8KhN5wzOULWXX0ruH2l4a6+tnZ2sDjb41ycCyM/lbC38v4XRz4mYcfC/j+Yy4CmKl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(508600001)(71200400001)(6506007)(86362001)(186003)(26005)(7696005)(9686003)(2906002)(7416002)(5660300002)(83380400001)(8990500004)(55016003)(82960400001)(82950400001)(122000001)(66946007)(76116006)(66556008)(10290500003)(54906003)(316002)(6916009)(38100700002)(38070700005)(66476007)(33656002)(8936002)(52536014)(4326008)(8676002)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tapt2rRKKa54NJyQaERGxzr9DrQliRPnnuz0Z7EsGPFsQyaZjlgYUijrJibi?=
 =?us-ascii?Q?OKX8kEJBF5BRpj9UNZthvu94wz8xnJrsdBAbuEXzzhypjshDS2ZqZDkg2bOM?=
 =?us-ascii?Q?nVtx+f/5TQZlH6GH48hPML0WLT5f5ttLGG7V1AXDfMJg+xR+fHKkSdwx/vSz?=
 =?us-ascii?Q?894uAmNylQjK0wBJ5nPxGHJnpW9k9h+AbC3RpVIF6cIlKdYOp/LjaSHl5aeL?=
 =?us-ascii?Q?RLBpug4yW9GULSVJpxfeya6fEZkhSdoDEZkLou/vStm+5TDV8oJNRJDjGaRS?=
 =?us-ascii?Q?MXqb7kHemNYEnGpXmBk4YWGaZTlX460wxMMxvUkdhkK3JAc3v1Yep5j66x1d?=
 =?us-ascii?Q?XtDdoVC5mVzf+y+Dblob2mplxwkaESVYYmhMpF62R34ISwOLfhQROjNickKd?=
 =?us-ascii?Q?vnSq/GBgEQ4W/ASE72AqPrzpuxqnkRyFXfJL+Czp7/4wnlSU14c6HDqfnWI1?=
 =?us-ascii?Q?4x9iAuOtO9FuSZnkr2ImxxpcniqLEMiv2MZOuUQ7Xd2pzdo3iYuL7ulWHWxv?=
 =?us-ascii?Q?US2N8LkMFfK2v2SYwWe8VxH0BBjm3YkZVd1C6Sc0tuyapTPDwVNNcZwhV41c?=
 =?us-ascii?Q?wrHxDXyJDhg/4aq3tlqnRE3S9c08surcMxZ4Hp6ZZ8DbgTltAdsnRIXQfg3G?=
 =?us-ascii?Q?AXssk5Lbuwra05YBzk3MVukUDA5cVUOQ1JS3jWLm7hdfaB1qINWy5/GM2pkS?=
 =?us-ascii?Q?yvNV19wY5SgvaQwA68ibn27plK2r0/xVb7xZskLVeP7/4Gx5tZfogreQCUpp?=
 =?us-ascii?Q?3M4IDnB0THcnJYatgz2yOI0W77671aYx/Noa5QP0CGaK9BHwv6IqYcOxLNYK?=
 =?us-ascii?Q?27ikyB7cphzE8bh+g/Uwxoq36CRzMiHjXw28fA8lv3Av3ZmqERr5YHizocIi?=
 =?us-ascii?Q?eT2DP+OzaoBMogjFc3L9NiOo927W7gdMcAwu2pxa8Z7WMldfeKdzs4sB3Qn9?=
 =?us-ascii?Q?aRFy3xNHnyFoLd3ZIXgy93uIUVLuw3ogi4DnpNh//iu3Vum+UCP69b6u8Mtu?=
 =?us-ascii?Q?8hae4R9rva5a5/ilAtn/WPopAuYIU2iKartku82KsWGRaj7yTR3QWxjgVatK?=
 =?us-ascii?Q?6+CDQOTV+73mLPIPNU16QKgAlsa/6bKVhJYCMCj4zsTvglwVenG3ScvRR891?=
 =?us-ascii?Q?ij8HnzwQ05cVX++0eVFEi+oGpBU46aDe6ObiYWK8Tk71OmnkGLzgVwVetmzd?=
 =?us-ascii?Q?9ki6EacHiMhQqz0JCfs3Tq21jMt+ptVbwqzWWli0ADR+FyWVWLPGkFZut9ja?=
 =?us-ascii?Q?qMACnqf+txRTI7lXfLUbD4rJ/3LMK5TFxyEHmdLwRpL6MXVV818PU5proT3A?=
 =?us-ascii?Q?OTSYNwm6rjuslxQpspSmC7m0grERlD7Q3ddjR+bHZVcHerO7KjKF7A4bO17c?=
 =?us-ascii?Q?beI9e8n2KAs8wzNV4F9oU49ODRjeJjJLHYI1yiEF/Kemy1U8N4NV08iHDc5o?=
 =?us-ascii?Q?XWUnVCMlK7VQn2TxARV3stwml+enV4BAOi8OMJge+mX/T6LdsfcIlSDvKOuU?=
 =?us-ascii?Q?/+p2K9mOy6ANA53EOwX1olgqZ8fDjucv5zJbuPeEIA0VaOetZHOnmHr1Q2NX?=
 =?us-ascii?Q?2hQhLrFgBQ0xhtXL9xpRkBHeT0W4BLLQKpW6XlgUlzxjRzrSy5Pd2l7t1G+i?=
 =?us-ascii?Q?PvEVIEEHz0ThgZp1cmw3K+VBPtVa9lMtNiYHJoNch3nMmybbK1LnUHA7k0YX?=
 =?us-ascii?Q?mHA2vNM0RAwJM4QgfvePZfhWsgK1keKo+8uyF65UsDPjCtnM0aM1zwLxzAln?=
 =?us-ascii?Q?BUs5ZVeDoWeyezUA+hYWqm6rk/ww/wg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR21MB3025.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c30418-69ff-4c7c-2632-08da31097e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2022 15:43:26.5088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TO0BucS/nes4teMlv23YTecINYjeUBXD7KDETcJyW70fU5CV+LNoBImXzOJ1uwAcm6KT4NMu0oZRZ7JqI7OW+3EIu8XeHjChDcxQ50UFq2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR21MB3239
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
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "deller@gmx.de" <deller@gmx.de>, vkuznets <vkuznets@redhat.com>,
 KY Srinivasan <kys@microsoft.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pavel Machek <pavel@ucw.cz> Sent: Wednesday, May 4, 2022 10:23 AM
>=20
> Hi!
>=20
> > Linux code for running as a Hyper-V guest includes special cases for th=
e
> > first released versions of Hyper-V: 2008 and 2008R2/Windows 7. These
> > versions were very thinly used for running Linux guests when first
> > released more than 12 years ago, and they are now out of support
> > (except for extended security updates). As initial versions, they
> > lack the performance features needed for effective production usage
> > of Linux guests. In total, there's no need to continue to support
> > the latest Linux kernels on these versions of Hyper-V.
> >
> > Simplify the code for running on Hyper-V by removing the special
> > cases. This includes removing the negotiation of the VMbus protocol
> > versions for 2008 and 2008R2, and the special case code based on
> > those VMbus protocol versions. Changes are in the core VMbus code and
> > several drivers for synthetic VMbus devices.
>=20
> > 2008 and 2008R2, so if the broader Linux kernel community surfaces
> > a reason why this clean-up should not be done now, we can wait.
> > But I think we want to eventually stop carrying around this extra
> > baggage, and based on discussions with the Hyper-V team within
> > Microsoft, we're already past the point that it has any value.
>=20
> Normal way to do such deprecations is to put printks in first, then hide =
it
> under config option noone sets, and wait for year or so if anyone complai=
ns.
>=20

Are there any examples of doing these deprecation steps that you can
point me to?  I did not see anything in the Documentation directory
covering the deprecation process you describe.

I'd also make the case that we are already well down the deprecation
path.  For at least the last 5 years, the public Microsoft documentation
for Linux guests has listed Hyper-V 2012 R2 as the earliest supported
Hyper-V version.  Other current and new Microsoft products aren't
supported on Hyper-V 2008/Win7 either -- the usual Word/Excel/
PowerPoint, etc. fall into this category as well as Windows 10 and Windows
11 as guests.  So for a rare user who might still be using Hyper-V
2008/Win7, there's no reasonable expectation of being able to run
the latest upstream Linux kernel on Hyper-V 2008/Win7.  Other
current software doesn't.

Given that running Linux guests on Hyper-V sort of implicitly
combines Microsoft commercial thinking and Linux open source
thinking about version support, I could see putting the old Hyper-V
version support under a config option that defaults to "no", with a=20
deprecation comment, and seeing if that garners any complaints.
But given the broader situation with Hyper-V 2008/Win7, in my
judgment even that is more cautious than we need to be.

Michael

> We can't really remove code that is in use.
>=20
> Best regards,
> 									Pavel
