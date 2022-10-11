Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6EE5FBADA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 20:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CED10E84B;
	Tue, 11 Oct 2022 18:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498C110E66E;
 Tue, 11 Oct 2022 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665514664; x=1697050664;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G/eCaeYPEZyJlDjBpRe4K1I/mrau5iD6ScFevX6kZTo=;
 b=k7qiFLOHXkXDbSZAv7xctDbmsNmRUd9+8g9kd3BRYM5RxgImPRTBUAYM
 +nMnzaBk4TceBvqxT7sp0YxXZnwFECVVMYXHW57ztirRPXcf0kedFvlDJ
 jMxv16rtDfMBvR+KWjtS2vbABER63TsJsAYosEwVukmsTCFTsnBpClC8f
 IYvYpBPaOclffdFl2PlKTKeGoaqv5KU3lVCwliK9fZBHuRtIxPtoWeY7U
 rbKzKQmbCJPJa4J1gjO5P1TV1anuX/m1emIeydtJ/l6vcIzib9+Wx3dmo
 +VUwoFyHmCQOOgBToe6GK4OXxPQjzpsxHVkAS9svYJg5/dt9lQWt3QJ4p Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="366596758"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; d="scan'208";a="366596758"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 11:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="731108211"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; d="scan'208";a="731108211"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2022 11:57:43 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 11:57:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 11:57:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 11 Oct 2022 11:57:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 11 Oct 2022 11:57:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6i2L1cbJ4y9RdEG0XuXYy7TMFSL2D6hxu9qlCpUeFBNZSEgMJ49d3gYqhx6S6o95YI+OJQI3JW98FBqgwe3BWjvVaxPnz2bH1GIQEQKvA8o+pj9X2Je8DOMk+Q2m1kHPdGDK3/g2aQaZx8eh/VeiNrXVkOfc/HvnqaOoy3+HKoRwJNTNRT11uy0cdAXJyOSECLdzr7mhacX+ORlMn979QeI0Vr/H01sZahEMCLaiYo05ZhswQ+0J7/+y8yIr6VQkx+Bf66LDemTtxQ5iBYX8SY1Hg1QKCyVLU0/c0q+WSYA/+DX+n+4dm90pkMDV+SAPBD6zVdIdL1uLWzqxTcQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSsvmIzO1oTO2Bdxasb6SN4Qvm8E2xBhKeiQsoyjGTQ=;
 b=S/5ZE1D+k2a9buWE2NoBJZDIYWh3uTgGwx2b0AD8KdFjtupQs+HmY3tO5Zo6PjdutMXMkDon1bFKpEiYhhOslYuHvQd18vtIapUXLjD/fAptRFRl0dp/0CNr2AZzJCi0IFZ6ToscrpTLJREAtdHlbrVXwEFaCPLzkGeideA6UEPcWD4OohhOVWbMUHTmJzME3lBd4FDtSWI1N7wlbt4YVAVfgKWDaFq9JDKPYzVSHcTvYf5oRDu0Rtx/zgRlgeV2u94DbDNxHwmu1TO0oyNOJCh2XE21dYWgsXTN3l/hE22Atvx0bxNJd1Rpmzc2fM/VHknV4Y4gsa7SLwi/WGhSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.32; Tue, 11 Oct 2022 18:57:40 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::6405:c026:bd12:85d4]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::6405:c026:bd12:85d4%8]) with mapi id 15.20.5676.036; Tue, 11 Oct 2022
 18:57:40 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: Use graphics ver, rel info for
 media on old platforms
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Use graphics ver, rel info for
 media on old platforms
Thread-Index: AQHY3P6MVfk8MIPQ50+mtw2OYRJK8K4Iy/kAgAAOXsCAAB8JAIAABjCAgACMpeA=
Date: Tue, 11 Oct 2022 18:57:40 +0000
Message-ID: <DM4PR11MB59710E32ADB63286A48419A087239@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20221010231720.3730568-1-radhakrishna.sripada@intel.com>
 <87pmeyyg3n.fsf@intel.com>
 <DM4PR11MB59714D6C8D496B5538DA27AB87239@DM4PR11MB5971.namprd11.prod.outlook.com>
 <87k056y8kt.fsf@intel.com> <Y0VGQ3jFguGOlh2w@intel.com>
In-Reply-To: <Y0VGQ3jFguGOlh2w@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|MW5PR11MB5929:EE_
x-ms-office365-filtering-correlation-id: 8a4bf0d9-f679-4fb3-bf4e-08daabba788f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lU1Vi1iF7Zg1tcAnvLZmSxljzcPz6aXY7b2xHzD4Bs/qSU8jbiIOBlUaUleH/8FMrF5713m+dls+TpJeWSt7sUUb25ULQyvlHzqZ/Af+jxx8Y7J6W8X0Dch08I1PB1OChUFiDiyLm1dfsTOWSLn/aC+NcQE6jq7UMXj9yS/6I6n4CS3ut/VbW760qly7KjBSfDn+ZnLbyYMKv2dQPz8GpCc1JoGlT10ioVrzzrsVRkKkeN56Zdq95TIvl5mZSO8pUGbT+36piH5446zhOu7rEEkMSGCtJNVsx+8xngpYVe2E6hzCOrhJjwATy4xelE3d62cP4Ruyp132wSEsF+fapYVowRAROws2seKLwKN/J1g8Q7HlhO4t6gNvOK29B6JnVKJiyX0pKOqlqGtP6XyQut3TRjDSIIfYdRo9fr2HecC08A6M81yI+SrlZqMY2zp6T8BmdtkJozPubI1lwHQUAqh3aMrVC+GAAUHB7cfyRwQsv2gEBQN0w6oHrCM9JRXHtQkdGN6OZHAolxilXSB+efr5CQyTwoEFD2TkBZ8vzDd2gtzs50VVuRpLxscB2uwB0YaNKqAqFk4h/EBudJBFeEWyGpFFXeKs29c2NqgOFjFHS27NcvajsVpNfnQV+G4KQELczcN0ctTPMYMdqNAUDjsy9V8s2MJhLsbCaOSkd0ES1JPu/rMGQ+5Y2TY0u9FpqR2Z8+gMPZKWKH1kU0OPoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(54906003)(316002)(8676002)(66946007)(4326008)(66556008)(76116006)(64756008)(66446008)(110136005)(5660300002)(38100700002)(82960400001)(71200400001)(9686003)(966005)(66476007)(53546011)(2906002)(41300700001)(26005)(33656002)(478600001)(8936002)(55016003)(66574015)(86362001)(6506007)(7696005)(122000001)(52536014)(38070700005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Qg/dvhYtH0wiY18/fLQk/oHr3d5Nb6I05Mg31UNdP50KMUa2fIiMWBItMY?=
 =?iso-8859-1?Q?dlY57WmXjnHiGOOdoPWW5o8JqE6+U0L8hTaQexfrytdeAOO2dnF3p+uiUh?=
 =?iso-8859-1?Q?84KOXXPObFKAq2rz1B0/dqmIEr9Lif89LjVaJzVwVswmt3Bz/fgK/v4zPj?=
 =?iso-8859-1?Q?AjqSSnQAO/IY1W2EcDYhfg7WAbhf23Yy3gSfIE4hnY93xywC9AyFP5h5tN?=
 =?iso-8859-1?Q?e2qGCqjmTV1hgBHJbpE+mjiIjdym7YMWbwbwgMtf+NcqHKi4tQM16ojRbh?=
 =?iso-8859-1?Q?kTFWKNeRhtBsktibLt3B1P4cvZ3Fe9sGupSLOYaJbzhLemm2gqodc2A0WN?=
 =?iso-8859-1?Q?tjWSX12KptGzK9HOea8kdavzQQfwzmTtF3j0vsu8le/P6nR1u5BpuXc0X2?=
 =?iso-8859-1?Q?Go4D22qmy7HkW3NnYilgvXwhgebcOYgigiwl1by5ZdM2xaxKt7lUcoRzoN?=
 =?iso-8859-1?Q?NxgLt41tbG6Dr9G71AF8FUMHm2AkUkv2ZVZjPYVfHkU8e37dpv43ue6Wwg?=
 =?iso-8859-1?Q?2ZdgowaQQcgU7IexWIgHjSzsFkKRIt9lyIFARO8lwqgN2IvB10OE8lu3v4?=
 =?iso-8859-1?Q?SF4kVZkWB+CC+Kq6mZWn71/zx0z3w6aThUlNGU2by4QXNi+A0IJCjQxtuS?=
 =?iso-8859-1?Q?Z1W6Gucil7WqqSCuloPnCLI7nDf7z1JMHagsAfHECfWEZRahAr/k9X+1SE?=
 =?iso-8859-1?Q?wjo/epEowZoDiaNCGaJkzxgZ9y33T8HlZl8F1LvwedftYBzj9z/w9Q2Bj6?=
 =?iso-8859-1?Q?oVccOhUn/Pu8y/UJqVJkg5NHZGA4NKz6aKyK/DG/iIIaiC+qETBZfMvI2Y?=
 =?iso-8859-1?Q?5l+kCVdI3f+Ol5RPC28tbv/Hup2W6qirv0qh9WUgzUT9VhYP2GSZhzifa9?=
 =?iso-8859-1?Q?erHvRR8RJ0omnmWl98BzodnNXI0iYzu4Uxmh5KHRavFiiJH3xfLJNeVNXF?=
 =?iso-8859-1?Q?blgqZ5FTVmV63gEQpsT4wPYyG4bYnttMk1dUTvI2TjGZ0okXDg4XrhplwQ?=
 =?iso-8859-1?Q?SBmoF4rlFkScsWoaDX9XqJ2ku2/ZjG9uXNAHQP+GFR6esn5BxP5w1yvtcw?=
 =?iso-8859-1?Q?7cRTTngw7RuuVChz/HVRVoHXD/b7c5sUwLVimE1cBEiViL2pgXGs9Xq+Ym?=
 =?iso-8859-1?Q?q5uRJogOPk6Cp58+qJQIGpJnKv4JE9uYi0Fkl2ESOFXDmf6X5Xe0F6pay5?=
 =?iso-8859-1?Q?4Bu7LaC/rDSRyDpQ4N88CHd0BT4hwaAW9I80cZ9jD5hOH0m+Ca/7Banbzw?=
 =?iso-8859-1?Q?/We+3BATTYR/+qTjHMxWZW5TFZBkaWHyNxJZ9OA9lD5ATpHMGElQ3e8oah?=
 =?iso-8859-1?Q?0GqnetqmwSJ32xVvGrZ5UGhqmRj5Ddz+xXXSXOCBbQE8SbG3PEsxdFMIgi?=
 =?iso-8859-1?Q?+l55jL1RuembwzjURXz/DnD0C69AHk85VZl8Jv29bJFMPUOucdX+DMSngi?=
 =?iso-8859-1?Q?FnOrZNa4AO1Kk59zoWx/dVu0DpMv3OwAZNLpR7SqAw4R0RIxHeWgB+Gy7T?=
 =?iso-8859-1?Q?ZkEv9i0qGk3eTMTU+r/iiIg+YVxcXkgsOwYpb4SHUjtnPfzrOb73foicov?=
 =?iso-8859-1?Q?du2GNd8LYp7fl42k2FK1HAausKMC8BfIUonmneIjIe00J0TszDcVOgZvOu?=
 =?iso-8859-1?Q?SfqvRLQFgwHdDnj6MpZeNjlnKIg+tQPjVqVJm+Pt0n9Han/ICdZ1xvhQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4bf0d9-f679-4fb3-bf4e-08daabba788f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 18:57:40.0674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBi/cQ2i1VOGTwWl9ihm2IuvD0ZJ7P1N0UFoOSpIcmdiPqb4oBupKTEmX0QSPBfBw/BDLaCBem5Pqg1P/GjyFrTESb6SliGiZrRSlCxBFT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for the feedback. Incorporated the review and posted new patches =
here [1].

Thanks,
Radhakrishna(RK) Sripada

[1] https://patchwork.freedesktop.org/series/109588/

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Tuesday, October 11, 2022 3:33 AM
> To: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> gfx@lists.freedesktop.org; De Marchi, Lucas <lucas.demarchi@intel.com>; d=
ri-
> devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use graphics ver, rel info for=
 media on
> old platforms
>=20
> On Tue, Oct 11, 2022 at 01:10:26PM +0300, Jani Nikula wrote:
> > On Tue, 11 Oct 2022, "Sripada, Radhakrishna"
> <radhakrishna.sripada@intel.com> wrote:
> > > Hi Jani,
> > >
> > >> -----Original Message-----
> > >> From: Jani Nikula <jani.nikula@linux.intel.com>
> > >> Sent: Tuesday, October 11, 2022 12:28 AM
> > >> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> > >> gfx@lists.freedesktop.org
> > >> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> > >> <radhakrishna.sripada@intel.com>; De Marchi, Lucas
> > >> <lucas.demarchi@intel.com>; Roper, Matthew D
> > >> <matthew.d.roper@intel.com>
> > >> Subject: Re: [PATCH] drm/i915: Use graphics ver, rel info for media =
on old
> > >> platforms
> > >>
> > >> On Mon, 10 Oct 2022, Radhakrishna Sripada
> <radhakrishna.sripada@intel.com>
> > >> wrote:
> > >> > Platforms prior to MTL do not have a separate media and graphics
> version.
> > >> > On platforms where GMD id is not supported, reuse the graphics ip
> version,
> > >> > release info for media.
> > >> >
> > >> > The rest of the IP graphics, display versions would be copied duri=
ng driver
> > >> > creation.
> > >> >
> > >> > While at it warn if GMD is not used for platforms greater than gen=
12.
> > >> >
> > >> > Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch
> version
> > >> from hw")
> > >> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > >> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > >> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > >> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.co=
m>
> > >> > ---
> > >> >  drivers/gpu/drm/i915/intel_device_info.c | 12 +++++++++++-
> > >> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c
> > >> b/drivers/gpu/drm/i915/intel_device_info.c
> > >> > index 090097bb3c0a..ba178b61bceb 100644
> > >> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > >> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > >> > @@ -329,8 +329,18 @@ static void intel_ipver_early_init(struct
> > >> drm_i915_private *i915)
> > >> >  {
> > >> >  	struct intel_runtime_info *runtime =3D RUNTIME_INFO(i915);
> > >> >
> > >> > -	if (!HAS_GMD_ID(i915))
> > >> > +	if (!HAS_GMD_ID(i915)) {
> > >> > +		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)-
> > >> >graphics.ip.ver > 12);
> > >> > +		/*
> > >> > +		 * On older platforms, graphics and media share the same ip
> > >> > +		 * version and release.
> > >> > +		 */
> > >> > +		RUNTIME_INFO(i915)->media.ip.ver =3D
> > >> > +			RUNTIME_INFO(i915)->graphics.ip.ver;
> > >> > +		RUNTIME_INFO(i915)->media.ip.rel =3D
> > >> > +			RUNTIME_INFO(i915)->graphics.ip.rel;
> > >>
> > >> You could assign the whole struct ip_version (*) at once, or is ther=
e a
> > >> reason you're intentionally not assigning step?
> > > Step info would anyways be determined later in the function intel_ste=
p_init.
> > > We already have macros in place to handle common gt and media steps
> there.
> > >
> > > Do you suggest we memcpy(&RUNTIME_INFO(i915)->media.ip,
> &RUNTIME_INFO->graphics.ip, sizeof(struct ip_version)) here?
> >
> > Simple assign should do it for such a small struct.
>=20
> IMO for any struct. Only use memcpy() when copying arrays and such.
>=20
> --
> Ville Syrj=E4l=E4
> Intel
