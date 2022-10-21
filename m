Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC3607446
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 11:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773B810E656;
	Fri, 21 Oct 2022 09:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7499710E656;
 Fri, 21 Oct 2022 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666345188; x=1697881188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4zHZEaMkt2TeEwQR/2YfaoWZFKAVDVksp0MfNoMB4tc=;
 b=kG8vYKVuQMUx7bqIHP2xZlGBCkb1ADZtJqaC2H9rrrVwUJ4vJJ3TqhdA
 z6qgq/WfjZJRUAlTRolyrDqamZ/q6dpk5polptBQCzXG/kOPxOJHNBABq
 SBDqMgtZOj3xv6JXr5na2oIajsJVHtE+ANWf+iv6EkHdzxMNmzuQ/gMKo
 jaGn5K1atZiEsVjJHm53pP7lRZYYCvK3wgOzlNxeSyYu2BKk8gR+ZpdsC
 c4uPZIsP0LCV6ezhNn7sLo5rMx+4QOkhvvJvaW4rxkZH8/VRpfNZ2vNGG
 DVjWTsu0yR5vsVV6ccGgOS1umCO4fvKunvBIqvHHHh8jQcDySD1kOirNR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="294358436"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="294358436"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 02:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="661514411"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="661514411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 21 Oct 2022 02:39:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 02:39:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 02:39:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 02:39:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 02:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFhJgTqXLDX4QiA/rZMf8+XYHrB61K/cY8dI6Tbs/yDVsy17fSdPBicLgU93KApx+0QsiMS40E2G3lQtOfw5wrinYE9Ud/Ey7Gop8sgo/rfi7Z8gviZN5/G01sphbPmpxMyOAzoYNFYOdghSR3uAjK2g9T0J9+qtq1on6BBbT4xgNVY2WlCa6MPa5NPnpu+kJIjKas7iBWeLryWiBLMMp4Cgif94czeWbRDpg2iH+cG1O/T3LKQPWqy6o9dtsXW/u8ZI5hmiMee5XlHLLXvlVPdVjQUN5OyZSqniqr5RGGKQ1SQQzSvnJKe5EpSh1yTtjJZiJxnE+BOJ2w95cvRFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zHZEaMkt2TeEwQR/2YfaoWZFKAVDVksp0MfNoMB4tc=;
 b=LYQSL+QABn0X5HQRtLosd1UHoiNE9Xc14vsvGV1TAdSkX4JPq/0B6+Dhp8b1O5nbzg8Ha8HmHT2atSm2O4VX/7dU+wYg+ZRGpGnocJtq6ck72CY3RN2q1AWN/9uKe7ePQxFgOnK28i+4sPuogII7GLLm87W9osjKr924bXmxrP0SVu2zcI/DrSfKEgXoK+ZduFxa8U9OrUvXG4SCJqpuyOFuMD5gNs2SvmX8YhCyRFQlGVZZGkXKIh9PbnLj2zYpGTtefaoyMdtrSF/HNgqbQzPiriPyuZ3tEPncB3unvPHMdRIeMFRVWsXYOBiakISoINzAMr5Dl1aZANW6HW7pog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 09:39:43 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::c4ac:5f10:7fa3:2aa]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::c4ac:5f10:7fa3:2aa%7]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 09:39:43 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Latvala, Petri"
 <petri.latvala@intel.com>
Subject: RE: [Intel-gfx] Random submitter change in Freedesktop Patchwork
Thread-Topic: [Intel-gfx] Random submitter change in Freedesktop Patchwork
Thread-Index: AQHY5J11Ng0frZwKgEK5n2FPbWc/764XctcAgAADywCAASIbIA==
Date: Fri, 21 Oct 2022 09:39:43 +0000
Message-ID: <DM8PR11MB5655678556E4B116E76B9116E02D9@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <878rlaqyc7.wl-ashutosh.dixit@intel.com>
 <871qr2h41x.fsf@intel.com> <Y1F1aEIbdktSYpPG@intel.com>
In-Reply-To: <Y1F1aEIbdktSYpPG@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: petri.latvala@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SN7PR11MB6774:EE_
x-ms-office365-filtering-correlation-id: 6e520f14-3f94-4bad-3304-08dab3482ee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1hgOUYWqlf+DRfNZd1kfUR+bRRkLDKSpF/dDxVvX79F+2zEj/PkgMDx3UBzV35SR5DU3VYyPk8Wy7cvCcyAgYR+kmDzRL4e6OYxkt/Pyb8sR0nXw8j7EQunzn5SO8Awk/5D8JkjnU1TRd7Z88ehZegOjCfXBHfwsYZ+vCO/FNarmrbRFwtS/w2Y5keeETzfb2FG4h/kF3BOzIEqJpeDcmeo4rhw3dNFH7Xfn1Ra2ZvJDiRgz5Aia7UdsgbSyGmqNP64lnZK2ptomh4DtlkJtjNH1zo233vx1zKkTB8YaulYkkcDspNJQoXkEn+25zURSv8ii/GOz9TdlivXTIe314TiIJUlCgg9Qrgl8X/OKydI+iywNHD9qysPd7sJLV3LllQH/gpoXRGYP/u3k8KYscr/eI/01E85PmKPBY4pUetPZVrGeweLyTUsq516rUQKs6YFKRmr1JFxP+JNyO2yhWQoAaBtWyScNIMEYpLSlqJzstAKSU4+FWT26mEKeEGMiIHJdmERBFe6thP2z/75QHLXt2/Sfs51IxG+djXs2x7I7Y60tlKQ8GlV+x3e+ZTqFqztRNlC4/Oywc6zWeSzTAozRCIrXC7L3kR1gjVNo+mDSPze7qBXB325meCCg323+Ay/4jddkmNy9tr/9je1k7xVHRz63nwvz/DfhKSf/KhYdXu1jXTBBWcAb6iBoX6fxgDA7ORgrDQfOAiZXW6zZjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(2906002)(186003)(7696005)(6506007)(5660300002)(26005)(9686003)(52536014)(8936002)(41300700001)(33656002)(38070700005)(82960400001)(55016003)(86362001)(83380400001)(122000001)(38100700002)(110136005)(478600001)(54906003)(6636002)(316002)(71200400001)(966005)(4326008)(66476007)(66946007)(66446008)(66556008)(8676002)(64756008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kfDCVDoXup/UA9J1nkyD4PxdKyIBTSdCrtpdiiqELUir7tL3vSXcfW3HF3?=
 =?iso-8859-1?Q?8VS/MiH2ZSj7Ltk7e2t3AScYzDBwQMnztbFRLk1sbDf0yeNAAwBve/+dPb?=
 =?iso-8859-1?Q?SUliSuCMWi1Cord2zu0IgY8zfsvTfkFfxDYYj1OE3LwcGxk/EY39E9b3I9?=
 =?iso-8859-1?Q?ReJNd1trSVKixTIt5/uCKAD9YHfEQ+TzVVK0VPIuK4qWpZQvsxLxOfLPH9?=
 =?iso-8859-1?Q?ns06jpI+ZhZbFMpczqaf/LC/TxXZNg0df7RXyZ7MSU/dE02xMDoAHOaYCu?=
 =?iso-8859-1?Q?8u6ZgdbgaLh8roIdQZZ27kWltTQYIdnPElbbqLAZkV/hbN2U5uLWXyRKFg?=
 =?iso-8859-1?Q?vjQB+DAnLFHfmhZO1GXxmooz5V7d576qAZ0iKUbfBJ7NN6Ssgae3XUseA0?=
 =?iso-8859-1?Q?JivJYl/MAsPbtC6hlxgs6EGUkA3E1UtfDsZMmec/B/fbhHHr42XcZMVbbs?=
 =?iso-8859-1?Q?8A5lpqQDC9f81Yb5OcY+dokIllSnlH7VLTjVN1c7DtyOweWuzh+64QmfU0?=
 =?iso-8859-1?Q?XQCTU9Tq6IeRjZ8XsDhWOeRNwQlI1S3Bog+4y28OqBMBFTuuw9SR2X/2jt?=
 =?iso-8859-1?Q?qgXsedpeE5nd6+biAE0enwka1qq0v0YLe3+0WIE3269Hk6O6gAi2xLGma1?=
 =?iso-8859-1?Q?ln5IECaT2hhw3XgdpaZ/25dc01fJExwDE1RxXsNwRdGgGsRiKp/A/te646?=
 =?iso-8859-1?Q?rbKEGcq/GGgGP5jKo1F4W7skr4Cn9VwB5eS97TtBUrgTx/2cbOtJFt6alk?=
 =?iso-8859-1?Q?3SaJ38Qe6FfF3ABsEDBc6aVZPHNluQk7BEvKo/TxUygK0CprA4b4AJhCbb?=
 =?iso-8859-1?Q?IxSbeu0UysyaUm2dv7/JiFPlFuqhx4K/QOz+5mDoHIhCUeH5plXPLOhSpk?=
 =?iso-8859-1?Q?U91WbYJChmrlse3F1UePQBawlXARlIKdBt29J8hV5Ya71z5IKheI9T9QEA?=
 =?iso-8859-1?Q?7LdVcL/1gjIwlsXq6aDOxLTwpfiRMXCnaW32P30Oi4ELmDs3idsSjshP+7?=
 =?iso-8859-1?Q?m6gUSt7EZ0Gd+KCPrzorxBL1m6eQ2YJt8WwL26Jc2CsZs1+3bJL5XGy60H?=
 =?iso-8859-1?Q?QFgLHhwz4oiGa2YbrbV9uWzoVveInb2CQxEPJKbIIHChc9wDykH43mAvzX?=
 =?iso-8859-1?Q?odaclHOK2yVqIRQRmeyUALnq9lRdz+uoFx90rHfxhME2apajcrCatH43vb?=
 =?iso-8859-1?Q?OJz9HqoSzjN3+exxl4wFuUO9k0pM6SLTaJm+cP+otsldVySbhVYU8K35Yw?=
 =?iso-8859-1?Q?ws4t8Kcq4IPJAG8gVHAfDT3pkNfWixEwsk6Yy1akjeo2jUAmzSzBtrALrI?=
 =?iso-8859-1?Q?/mjHgzK0N9I7RYkZ62vgjgbr0/QYo7hzd9FOq6MMOHoR0o6UKK/n73MGHa?=
 =?iso-8859-1?Q?V0DmDt1cbbljqsMEGhLhNJh0hpGAKDwy7crcVj2+nu6ahbMdpDRG9858za?=
 =?iso-8859-1?Q?wL+JrT52KQ7sGD4MEq3W2i2IbmYrdHs3bXsYFAahFfixAtgLO8E1kuYaAB?=
 =?iso-8859-1?Q?Pqg+XFBvCouobmWI98wJrRu4WjktqHQTmHhfWbrvvajGswY5kNWS5WuTKK?=
 =?iso-8859-1?Q?6u0x2lytEFHyr8h30bGBcshQ+1L92EUv2oLO/XBKV8uNWeYeU5bOVvx8LY?=
 =?iso-8859-1?Q?JkQDNE3KUKQy4SJ+s1JBbQjedql1uNlFia?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e520f14-3f94-4bad-3304-08dab3482ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 09:39:43.2045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MR/ceQnV5S9jC6qQ2z04N5QOfTUdh31AfnSgAmwbjSxNxgysItNyxdNd6aCRBbzwbVdPqkMOgsyvEIhFjoX5Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
X-OriginatorOrg: intel.com
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
Cc: "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=20
> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Vi=
lle Syrj=E4l=E4
> Sent: torstai 20. lokakuuta 2022 19.21
> To: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Sarvela, Tomi P <tomi.p.sarvela@intel.com>; intel-gfx@lists.freedeskt=
op.org;
> dri-devel@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-gfx] Random submitter change in Freedesktop Patchwork
>=20
> On Thu, Oct 20, 2022 at 07:07:22PM +0300, Jani Nikula wrote:
> > On Thu, 20 Oct 2022, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote=
:
> > > The freedesktop Patchwork seems to have a "feature" where in some
> > > cases the submitter for a series changes randomly to a person who
> > > did not actually submit a version of the series.
> > >
> > > Not sure but this changed submitter seems to be a maintainer:
> > >
> > > ------------------------------------------------
> > > https://patchwork.freedesktop.org/series/108156/
> > >
> > > Original submission by badal.nilawar@intel.com and subsequent
> > > submissions by me (ashutosh.dixit@intel.com) but current submitter
> > > is jani.nikula@linux.intel.com.
> > >
> > > For the above series I believe the submitter changed at v7 where
> > > perhaps a rebuild or a retest was scheduled (not sure if Jani did it
> > > and that changed
> > > something) but the build failed at v7. Also note root msg-id's for
> > > v6 and
> > > v7 are the same.
> > > ------------------------------------------------
> > > https://patchwork.freedesktop.org/series/108091/
> > >
> > > Original submission by me (ashutosh.dixit@intel.com) but current
> > > submitter is rodrigo.vivi@intel.com.
> > >
> > > Similarly here submitter seems to have changed at v3 where again the
> > > build failed. Also note root msg-id's for v2 and v3 are the same.
> > > ------------------------------------------------
> > >
> > > The problem this change of submitter causes is that if the actual
> > > original submitter wants to schedule a retest they cannot do it
> > > using the retest button.
> >
> > I presume it's caused by me responding with a review comment that
> > patchwork interpreted as a new patch in the series [1], and changed
> > the series submitter too.
> >
> > Sorry about that. It's a known issue that I sometimes forget to work
> > around when replying with diffs.
Yes, known issue. +@Latvala, Petri too.=20

>=20
> I just permenently stuck a 'my_hdr X-Patchwork-Hint: comment'
> into my .muttrc to avoid that.
>=20
> --
> Ville Syrj=E4l=E4
> Intel
