Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832184BEA2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97889112DED;
	Tue,  6 Feb 2024 20:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CX0g4rCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4C110F9BE;
 Tue,  6 Feb 2024 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707251060; x=1738787060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mmz5KLQ3u645NNwdi0jigwkX0XFoRnCnGoNCBxYKXdY=;
 b=CX0g4rCZPjaiAMmoDBD1BkafVbPTSH9s1Bp21N7b7UtfZUirM9EjkAnw
 Iw3mKnwJg8AnCA/NaJwHj1clkM/dpM52BekyXJs9r6X/aYOh5jXVfY3Pp
 Azv7x8ZQsDHBsQo5xdDW8Unv6jUnefUtwPSLD3OH0Cgwu6vqcmY0DYUN4
 Vw2UlZfGdq7sLfOMO/skYFBtKQ5QLm/q4R6TT6gsOyQOb1w/vbMnRrm7X
 CqMaRQLmpT4THqgbRif2oj0nm2oMjqKPRYDGMAjKCMlNmwcuD1sPd5cYL
 dP3TIEqqUa+w2/CxtsQKoRFoZrBXQrQWjqN4mI8vy8DHKItYkM9DtrN+d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="722299"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="722299"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1111945"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:24:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:24:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:24:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:24:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXU/yBJBoXPUsc3QJQ1yFsA/elQwKYWm4JZnFzffBANVjB4VSsjBUthaY5BNu/boHXOKppZULP+O16mxBmXT+GELUoj2r+IYkkyt4xl+LO7g7ObB+HKxz/y69tPuRM62y4b+MSp4rizFNIRyHfwaA0hhPytTByJ1ji9N7f53oeD0omcZS5EDCxjHz3H+g6hC2UsEUZkLl3aqkMY+2S0c57/bM4F9Kox3yCP8tMTy6zBHGl1f7N+9vsXdHy3Ohw40DoW67Nf1NFn5Tkccjcl+mntO2lXd/blIYyVausmDC40qUCYXRj7+4RhDjg8DdHtN6UqQBsznI8LX0yR1NO3jYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggUB2LcaekCiCBBCXuax1GQ4nuhDvsB/j4/JRSt8dXk=;
 b=cAPCIjTi0f9MQ4ESVAb/6zmpmK0VYKeSM0ep6L9aiXOqIH24OtB03VE5oz4FINdIKRx7fA4399w7+Rff9rCoDuXjuIlTWKRgfvpxpchFoxwFUpTJLupk10yfJMRabquc+oYuAqp0TSipEiPEx+RqFvj7AlZXoeAjFObCmM9pmBzj6sITo3HMXIPJV6HDk2ByQ74uHotiqehUMIHBBUVvCbN9DI9ANKqeeLaCi4rg/E8ixXxSyJpkq83fDFBcl4pbkcn5pAP/JBwbUH6jkWeuCDRv4Pz3LR//jvPSegL0J84K8XKVo22QY6ofpwIp+OqTAyY/gG//4vsSQYoiZIB+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.36; Tue, 6 Feb 2024 20:24:00 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:24:00 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 01/19] drm/dp: Add drm_dp_max_dprx_data_rate()
Thread-Topic: [PATCH 01/19] drm/dp: Add drm_dp_max_dprx_data_rate()
Thread-Index: AQHaTeb9q9cmQywQJ0ubcQ/u17K+87Dr+98AgAAfSwCAEb1dkA==
Date: Tue, 6 Feb 2024 20:23:59 +0000
Message-ID: <DM4PR11MB6360CD1061FA0E07659E9598F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-2-imre.deak@intel.com> <ZbOZIpuIpf18KlM0@intel.com>
 <ZbOzQQ7y4OdKAnYY@ideak-desk.fi.intel.com>
In-Reply-To: <ZbOzQQ7y4OdKAnYY@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY5PR11MB6414:EE_
x-ms-office365-filtering-correlation-id: ea14e519-a587-4a31-0374-08dc27518d86
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: balqW0AG6TNvNlr6SXX6gleFG/HCG3ZZsovXW3nXyneGwGcqFN6CfHdzYLlQ8Sc3XnBpRPbe9hvdrL1poLOO8gOpk6/LLUagG/ZbBEhcnmmth8fhahEJ3hRJWcoe/fIsU/19CuQIdYez6FJ+9v8DzKtHB4cbmlcwJbnYhvMJFNFJDRZ85bOFGFg3+VTVjDH+D27yyngzd5HQX6s6ayJ/PN1zMxmDcLGJZX60irUPNL4lFVDUIqKRB3ygU0gNHKehnGjiYeiimbXc7lgIYOQPURaud1rl1Ez0HMpeBxXMQXKW4mWg+/nDbYsWDdmGuwJXB1m5Qkla/cY5P6h6cJVERA6BA35sotaRgLTDwArIoRUjasZ1lgKg8pFk0HECYX0EYKM1Chu+YuZflWnTU5iGo/hwztWWLTqugFcer8sTFqNCPo47JKjjylFGtdaaDpcGX2K37GwdA+++9oJLrJCQkdOfgy3PQ+iAXmZHVTwntLF/V3GLQQosi2cEB1LAjmknbr8+fz3pLDRRWzLNYXiasaU0PVBStLBJFr8eQhkOEOlP+43Jh0W6r6eBgL9JY9f7lXThCJGcoI3KvdAF/zb1gt1YgDsHiwCPhvx2d2D4CjVV/0qt5BosUnfS2TykmPdP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(122000001)(38100700002)(82960400001)(55016003)(83380400001)(26005)(86362001)(66574015)(6506007)(33656002)(7696005)(71200400001)(478600001)(9686003)(53546011)(76116006)(316002)(38070700009)(41300700001)(66556008)(66946007)(64756008)(54906003)(66446008)(110136005)(66476007)(8676002)(2906002)(4326008)(52536014)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KEBBnZ8xj8b3DQMYmyxUmg6s3m4zPhGkY9XFgwxhtgUa3NdHLjM7H14Agk?=
 =?iso-8859-1?Q?XRTcPlsC96wMBdPm0siZkLKQSmp319ajjs67udQNz7Ks2CpQCW4yE8M0o1?=
 =?iso-8859-1?Q?ZmAz1XmiwDCHeHB7seIJ8OMp8R5m2jic3Kk06IWPn31tgvJvN3wHW+pO8n?=
 =?iso-8859-1?Q?OOfyPfsDB1sqRQ+Zxn5YuZJeaVAbQuBVX/aTxa2b+FlITHtAsc+IFum8HP?=
 =?iso-8859-1?Q?VdZLSx91OFdv9Ra+oJ75H9UTFodliQKYb9BPvcWbjL3sSpQHcaejoWbjqp?=
 =?iso-8859-1?Q?Na++L5wkcQGjZehuweihRE35oarwX+8d5oTrdh2+6whjLT4BLvXx1vLqEQ?=
 =?iso-8859-1?Q?hSW6cl8NbK0cY5eiRyO4gRN8Cw6h2Zid03F/IuMTfcK7TxGPd9iu2I30PB?=
 =?iso-8859-1?Q?ktH+gSiN3RrAebSblGGFOkaA8PLqQ2jHic2V/X8Cl9qvytHp8PigSgc6MG?=
 =?iso-8859-1?Q?p3ygH993ToTPtfiqqCUdAQokT5wLBzH3I2+IqqLgHeV2CMvo1U5SMR0bel?=
 =?iso-8859-1?Q?b1tBh6UuRCGRWUCLmrmQUGYWRy7lUDrPchYC9DFOyJp1Xd/nVUKIu9LeWC?=
 =?iso-8859-1?Q?zfLKLIc9wWz76LribW09BKGa0wc8P+u4RYubUP+b/WjPPBMnXPknz7yCdY?=
 =?iso-8859-1?Q?zaebiWQPL6JkcuVqKoyV+BMfhyT+eyhqQE+F1Jb8cCPclGgj6L48gLjOwB?=
 =?iso-8859-1?Q?BJW9jajDxPTOWdA0fYxwp7l99+aa8y/FcT3WjQSfgocVZ8O41YIyxTRUq5?=
 =?iso-8859-1?Q?3cp57o3ZPfQQlxroJYbyc7dROCNaZsrnu37VCEfug5sg1zMuayea4nGxap?=
 =?iso-8859-1?Q?oOGthDA7WyvV+GdCjB3MFpxwLHLKNe8pLKC1L61TvSCF1mfGKV7NXHGasz?=
 =?iso-8859-1?Q?iq2FOWlwGRy1f2aEDmUS977zL5VWZBJ66aHiNrbfoB9Ik18et65yg1JXGl?=
 =?iso-8859-1?Q?foJVkCNkh6jPqrBNsVB7O30maiI11HmDlmcO6cA5Ow2qDp9ViJT9ABFaGU?=
 =?iso-8859-1?Q?34TQAV+tsKOkTjGFb6nynVNxy+VeRDSiYVfuYjnc0U0jwFL28MYEJCNZJP?=
 =?iso-8859-1?Q?tYm0ULC/pJyNw6kLBfflcRtnLygcijow9pjFu0+tgZAwurGH4y3gWDiRhb?=
 =?iso-8859-1?Q?eLoOaXEo9Xzjx20jhpo9ywHissOM+JnejD09NNbgOycEHR/tdz4anugCWk?=
 =?iso-8859-1?Q?t65uvpscGHBkJPlD6VcgsMy4mq2yEgIGC7L4vKgiQoFVYScGJFSqUXJDKk?=
 =?iso-8859-1?Q?7VOT1+gfCGJDXC8wKypxC1nMIQVQNqfS0pb9sCDq0QySl8Djaaamsvhm4F?=
 =?iso-8859-1?Q?1jK3OOos7AHCmNpZURUv16tGu80pyG3T00v9jhTf6tNyTT89V0cD3Q7S9U?=
 =?iso-8859-1?Q?j2qAiEgZr9crupkItKAtwm/Go+Cu1MIDZMe9PjE1WTqLNNxKpHKZTpIJEZ?=
 =?iso-8859-1?Q?sJs+vpyKYZsMsNhZ1XhimzEVRHf7TiuqykbvaSXLxhy6GWzusJxZyjTSlp?=
 =?iso-8859-1?Q?653b1D32yf+WwvtK4rp8AxJIab0PjI4BDNoQOY9yhYRe4VkVhqKkleC3c9?=
 =?iso-8859-1?Q?TjmfP5diCa4XxIFdSVEAsN78X5vZsEh9ABmr5lEgMSKQN2jTyMLYtwO+Q2?=
 =?iso-8859-1?Q?vkM8pDebiwbEAjSuuQedtrOHl9IJunZEVv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea14e519-a587-4a31-0374-08dc27518d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:23:59.9759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waNfxE55Np97WMeeC41olI55fDtBo+ZuPpLbTrsOEaQ2S7SW/dW44mBcGtJ8nEGYAkM2TmXb56EI+5V/OKxrWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Friday, January 26, 2024 6:58 PM
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH 01/19] drm/dp: Add drm_dp_max_dprx_data_rate()
>=20
> On Fri, Jan 26, 2024 at 01:36:02PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Jan 23, 2024 at 12:28:32PM +0200, Imre Deak wrote:
> > > Copy intel_dp_max_data_rate() to DRM core. It will be needed by a
> > > follow-up DP tunnel patch, checking the maximum rate the DPRX (sink)
> > > supports. Accordingly use the drm_dp_max_dprx_data_rate() name for
> > > clarity. This patchset will also switch calling the new DRM function
> > > in i915 instead of intel_dp_max_data_rate().
> > >
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c | 58
> +++++++++++++++++++++++++
> > >  include/drm/display/drm_dp_helper.h     |  2 +
> > >  2 files changed, 60 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index b1ca3a1100dab..24911243d4d3a 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -4058,3 +4058,61 @@ int drm_dp_bw_channel_coding_efficiency(bool
> is_uhbr)
> > >  		return 800000;
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_bw_channel_coding_efficiency);
> > > +
> > > +/*
> > > + * Given a link rate and lanes, get the data bandwidth.
> > > + *
> > > + * Data bandwidth is the actual payload rate, which depends on the
> > > +data
> > > + * bandwidth efficiency and the link rate.
> > > + *
> > > + * For 8b/10b channel encoding, SST and non-FEC, the data bandwidth
> > > +efficiency
> > > + * is 80%. For example, for a 1.62 Gbps link, 1.62*10^9 bps * 0.80
> > > +* (1/8) =3D
> > > + * 162000 kBps. With 8-bit symbols, we have 162000 kHz symbol
> > > +clock. Just by
> > > + * coincidence, the port clock in kHz matches the data bandwidth in
> > > +kBps, and
> > > + * they equal the link bit rate in Gbps multiplied by 100000. (Note
> > > +that this no
> > > + * longer holds for data bandwidth as soon as FEC or MST is taken
> > > +into account!)
> > > + *
> > > + * For 128b/132b channel encoding, the data bandwidth efficiency is
> > > +96.71%. For
> > > + * example, for a 10 Gbps link, 10*10^9 bps * 0.9671 * (1/8) =3D
> > > +1208875
> > > + * kBps. With 32-bit symbols, we have 312500 kHz symbol clock. The
> > > +value 1000000
> > > + * does not match the symbol clock, the port clock (not even if you
> > > +think in
> > > + * terms of a byte clock), nor the data bandwidth. It only matches
> > > +the link bit
> > > + * rate in units of 10000 bps.
> > > + *
> > > + * Note that protocol layers above the DPRX link level considered
> > > +here can
> > > + * further limit the maximum data rate. Such layers are the MST
> > > +topology (with
> > > + * limits on the link between the source and first branch device as
> > > +well as on
> > > + * the whole MST path until the DPRX link) and (Thunderbolt) DP
> > > +tunnels -
> > > + * which in turn can encapsulate an MST link with its own limit -
> > > +with each
> > > + * SST or MST encapsulated tunnel sharing the BW of a tunnel group.
> > > + *
> > > + * TODO: Add support for querying the max data rate with the above
> > > +limits as
> > > + * well.
> > > + *
> > > + * Returns the maximum data rate in kBps units.
> > > + */
> > > +int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes) {
> > > +	int ch_coding_efficiency =3D
> > > +
> 	drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(max_link_
> rate));
> > > +	int max_link_rate_kbps =3D max_link_rate * 10;
> >
> > That x10 value seems rather pointless.
>=20
> I suppose the point was to make the units clearer, but it could be clarif=
ied instead
> in max_link_rates' documentation, which is missing atm.
>=20
> > > +
> > > +	/*
> > > +	 * UHBR rates always use 128b/132b channel encoding, and have
> > > +	 * 97.71% data bandwidth efficiency. Consider max_link_rate the
> > > +	 * link bit rate in units of 10000 bps.
> > > +	 */
> > > +	/*
> > > +	 * Lower than UHBR rates always use 8b/10b channel encoding, and ha=
ve
> > > +	 * 80% data bandwidth efficiency for SST non-FEC. However, this tur=
ns
> > > +	 * out to be a nop by coincidence:
> > > +	 *
> > > +	 *	int max_link_rate_kbps =3D max_link_rate * 10;
> > > +	 *	max_link_rate_kbps =3D
> DIV_ROUND_DOWN_ULL(max_link_rate_kbps * 8, 10);
> > > +	 *	max_link_rate =3D max_link_rate_kbps / 8;
> > > +	 */
> >
> > Not sure why we are repeating the nuts and bolts detils in the
> > comments so much? Doesn't drm_dp_bw_channel_coding_efficiency()
> > explain all this already?
>=20
> I simply copied the function, but yes in this context there is duplicatio=
n, thanks for
> reading through all that. Will consolidate both the above and the bigger =
comment
> before the function with the existing docs here.

Changes look good to me. With above addressed:
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> >
> > > +	return DIV_ROUND_DOWN_ULL(mul_u32_u32(max_link_rate_kbps *
> max_lanes,
> > > +					      ch_coding_efficiency),
> > > +				  1000000 * 8);
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_max_dprx_data_rate);
> > > diff --git a/include/drm/display/drm_dp_helper.h
> > > b/include/drm/display/drm_dp_helper.h
> > > index 863b2e7add29e..454ae7517419a 100644
> > > --- a/include/drm/display/drm_dp_helper.h
> > > +++ b/include/drm/display/drm_dp_helper.h
> > > @@ -813,4 +813,6 @@ int drm_dp_bw_overhead(int lane_count, int hactiv=
e,
> > >  		       int bpp_x16, unsigned long flags);  int
> > > drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
> > >
> > > +int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
> > > +
> > >  #endif /* _DRM_DP_HELPER_H_ */
> > > --
> > > 2.39.2
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel
