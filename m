Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE68573F1E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8D99BE52;
	Wed, 13 Jul 2022 21:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C69BE51;
 Wed, 13 Jul 2022 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657748732; x=1689284732;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z7eblZsOUjWOnSr4IEipRXKYImNJJAc2oHKjM4OifUM=;
 b=KpTA9QLdHFpX+Wu7D9cDfylsAzelr08+npI1bVHaXcRvJjDxa61xaX0K
 63TTLmie4SzuNYKOmc368bOBcJ8sQtxvDSwyI2RO9asQvmLDBjEGSk1Q7
 IKAZEMOEdiXctWgFL72P2VJnUeuMcBEe/Kd/RdgiDMlgZZzjb1YwWHe7A
 SohcZuiUajmMeuBkvJ4BvQZAZjwzH86UXdLT/4O1YeM4fkKX+9IDo5YBV
 opqSeyXhYcoLXwDAj/AQYUJT/2im7RckEihPQvXwVk0sz04YAhGfuu2jb
 fOuTNuz2AbQakIOcMEJ86n5ZVg03EODqQ4ujm2Lhua/Xri3cSPITgLGAd g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="310997976"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="310997976"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 14:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="841918765"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2022 14:45:31 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 14:45:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 14:45:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 14:45:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 14:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmYSwgTTsdfMyiYcAYBvYE/7U16hX9hUgiuCLRNyO4oadsmzFtnZxhujyw5DO0mlwL8hVPvvmTt4or+uKrGUalTiySoKmidyUEbu/VNvLZPclDXhupcsPF1f2bJ33+2HZRV5E8cMdZjweaMCyKDdG6noatbV0Ttxx86xPHGy302IzJTCDVHmCjXrVqAcCx1gVF966v5v4l4gRK8AkKZkjatOjCKesPSUMb3e+NbYzGZ8kPTRTkkoHm8oy7NTNjA9G9NcnT9PMzAeD814EkrOWznp+L8PjYxCyUkvUPiPMw1KtMp8PIQZoY40RKk5yGShE7bqa8fL8hIxfH8StM9hPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anQUygGsMOGIjnS/4FJnz41Zslep5JOgKXfroibtJjk=;
 b=QdExksWj8uP7QvFa0H75Z3pzlEhpY9q3blEZYQyQmBKT3vtwviRjMuNH3gLj/HOCSeTubxc+LJeYjQIH1fcEvLyk2e8wL9NSRJ2UaRcikiEvo3Nx+l9dhME9sbWjf27foHS9VdOpmHulIkWqwaAH945x1jDK8AasAGZo+5dqIhX9JShA1izAnD5oMc9kmwm1j1ZgNUKKXSIj10BTrSiAEIqh8nv0VtzuhiMXdsH3a+MHf+I3gwX3QMkw0+Z//FGGDjqS/Ve0/V5ovP+xKw3ymhSANASdXX3nKneNZHBsRMHF5ew6+dgBaHUKB3rm50JuXUqBarZOIEZhMLwtO4y6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by BN6PR11MB4163.namprd11.prod.outlook.com (2603:10b6:405:7f::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 21:45:23 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::5db:b78a:3ee9:5a1b]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::5db:b78a:3ee9:5a1b%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 21:45:23 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/guc: Check for ct enabled while
 waiting for response
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/guc: Check for ct enabled while
 waiting for response
Thread-Index: AQHYgczcRkeTRIc9kUWKjvVRJh0nJK1TCA6AgChE0ACAAbDAsA==
Date: Wed, 13 Jul 2022 21:45:23 +0000
Message-ID: <SN6PR11MB2622FCF3E7EDD0268B29AE1F8F899@SN6PR11MB2622.namprd11.prod.outlook.com>
References: <20220616220158.15778-1-zhanjun.dong@intel.com>
 <87letvx58w.wl-ashutosh.dixit@intel.com>
 <87pmiam7tz.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87pmiam7tz.wl-ashutosh.dixit@intel.com>
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
x-ms-office365-filtering-correlation-id: 03c531fd-1a62-4567-06e7-08da6518fda6
x-ms-traffictypediagnostic: BN6PR11MB4163:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fy7GUCt4CIzp4jPUg12QTm5p6FfNbwC1RCkrAmc2iJi9s0JrUY2bU7WW6Xsjo278mRR0LcDirGnYTM079fugwJ54ko0ENChV18yY1Tcpc/Dh/9K8QyKSDs45JsbxqYnU2DHVysocrf4eWs4CQxcky6rX51/TYGOmgX3XXsNMHKjOShvALyDepNixsAWZ2BgvkJ9l9pgRX8hhQTjFOBwZVmE0MLwy2pX1fgSmk96JQSCDpZ3XXoTZc3XfoiveknSRqexvXOGSm23x+cmRHwsiXGCDAc6bjhyqaMxZACbvqABC5JrYRUkWrSfz7cTOXAU91Rqto3V6k2OwXpqLUYH/KGz4UpYtg2dDidsmgeLPdYFM1d3ThcZ7kT3tFfV2RNhMO24MNsvsJNispuTz424UO1ddcbmFjNYZcTj+i4vXh+dxUOTNp7Gi9o8ORDNVjLACEs1BtxNIKI/PzeGTAQBRDolM4StAAnT4b2WLB+keew5lR8hUssNgD9sJ0vzPqUIFT7qvmd2vs0r70T7v8wTswzP3urdSqHf24F8VcJZo07bKyfxCtmimJ/nFx/vAdVXf/M8OtIRp4DrAhomwuOtx4+IfnpRQ6xg5+Ke6VOhHvAEAq8e6EbVbfJ1Fn5FKmY41W/zI/nTherBhb3JWR8Hce4H1b9suB5Tk1OPIFs+J9H8rOkEr66as8WDHuV3k6HcD5/JASfTHV7w7zX3J2CMt1HQI8KzGe313sH9wctjWsEg4NcGgVN8YIAvKfDmiY+qMSHgxh0O6m/q8efTG/VIPLMYVawEXfnGpR8fzqS4czCk4MlYA7uKvntUDdZVBAlmFGMV/m+8Jf18ud9Ukm5Ka2n6aKh3QkouL5xPlmnnt7sc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(346002)(136003)(39860400002)(82960400001)(26005)(7696005)(450100002)(9686003)(53546011)(8936002)(33656002)(186003)(55016003)(122000001)(2906002)(86362001)(38070700005)(38100700002)(6506007)(52536014)(478600001)(316002)(6636002)(83380400001)(54906003)(4326008)(71200400001)(66446008)(66946007)(8676002)(64756008)(5660300002)(41300700001)(66556008)(76116006)(66476007)(6862004)(69900200002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yCEWlw+proQ+eQW4q0xL/lHuPBfYqYksspPqG/pnz4uvLExyLBmcT/+ACy7/?=
 =?us-ascii?Q?6G5LKz/Aj1/JO0itFc4vz2a/Wc4D/XAi+yYHxNUh88OP2rkwsC/rHMHWeKgH?=
 =?us-ascii?Q?WuSKf7tgqKnyVFSQArwV27D+TaV6xh2ndgKk4bE4HpDL3ib+QpczVQu6BkZB?=
 =?us-ascii?Q?UHpVZtHXnlqe+PibG5vLlAdYHwKB5Gd5CMV2M0ocGl20b1ABCwNKfJSF9Sj3?=
 =?us-ascii?Q?KQwq+0FXFEJuR4Hxf5cHAcCftiBRK1++CmMV8dloOhjdsXF7kPo/npx3BGl7?=
 =?us-ascii?Q?Sn+7ugow5CRsSsH0xgV/8bhffvkZeYPJoMBFOjwkxLmUb8njTcNtCyS82drY?=
 =?us-ascii?Q?OXdEjuFmKO9efB8mW240myZ9uIHwCxMqnHKsqGuwDSMVSOtYioxnkr5l32QR?=
 =?us-ascii?Q?61Qu0Y9rH7f3v/hCe9XN707J5yeKniZg1NADmlEwPOqUzy1xFauobiBTjVMV?=
 =?us-ascii?Q?z289xAwS/HJuGV7iidpaR10J/5jqXqs9UDmTiJk5OCprPoq4l7nOD3iZB85U?=
 =?us-ascii?Q?L748gMeZSyw4eKzUcZOaIjOsSYu4jh2bxnOS+T4JxnEqV9soP4041zLCHbxU?=
 =?us-ascii?Q?dFUvKxxx2PUYhfMSmyuoxkGkUyds7NJWf2RvcQghUEJ3Kbnw5Ase+yvH+nDO?=
 =?us-ascii?Q?3mJhAck28ASuO/byh7z6ap3UyJhZN7Fv9+pyoGRoV6i4NNTskf3nkurh9I8n?=
 =?us-ascii?Q?QACD3tcq92X1n9SWOtLTzw1T7i4Tb2HsP1e8i8szBIacG0TXsdzGrOCm1PwG?=
 =?us-ascii?Q?G7miHRqfNt9N3F4+5CnjldILmLzhj7frS6z55dRfTbRLekU33ByYsAj1pjGP?=
 =?us-ascii?Q?ZhmJMGkkbfx9SdTfv1Ep8Ow7NXecqmxVUDdjS8kroM0azgFZF5vBaRN1eLlX?=
 =?us-ascii?Q?D5etp1PqzPmvE5JPPWHsI6La9LYsJR0uJOa/oDuDY+G1u5884BGpwZS57ut+?=
 =?us-ascii?Q?WaQ5+gJN4d2lQVNWvea4xT/bAmB3P4sLkiF1lg8sUTTx/D4XkaGoIh7YcCiA?=
 =?us-ascii?Q?PTJ5RMBYR4jLWK519KKICtmrbbsAQ6mLrhR1tRAVqnj35pphQZq3K/5HpHr6?=
 =?us-ascii?Q?uf0i6Euh75hjE1IZzZlQw2lyAJqrsg1eOY/Z7CmV4LDIdi9jwkaAAbH62XQT?=
 =?us-ascii?Q?NtJu2fGCNicDknY7+i1iSEgXcBvJ4t9dFdJNQl54EiGzFDa8HYXvJUi9kLkF?=
 =?us-ascii?Q?0ZBIORVOjBToEYPpyGQl3z5AMzBZFctgG4hcC4Lvs6KTEedyp+JzW5X/rJYG?=
 =?us-ascii?Q?PkWP3Llraz2/a9wCaKiYBQF28l1f0+ADB0MBqMAVmbM+SJP5lGjDzRqXkpgg?=
 =?us-ascii?Q?5rTEYip8sTKp9ExirZVSfy6nazPqEh0Kc1j/vwPT4VyWX5VqR41GFwcd8XU7?=
 =?us-ascii?Q?Dtfl9WMyR7h89LF3MsBNte6l//1ndsk7A9UrBNhnZXJkf7W8PsVxtMxof/Ab?=
 =?us-ascii?Q?x90uKIq4sG3r/slH1bsnPtGOP9gpPGSllkRMRhev3FiPoZWb0ZFiYgqaZVYL?=
 =?us-ascii?Q?q8bxsFzKsESSN8R97J8DQ/3u3lwcWgUf6F7LKfQugPEpQSHX07GOO4LOuBV+?=
 =?us-ascii?Q?0r8ocyQGZFJmmnC8S1F8qcwAq3NOgTOZZwzicEFU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c531fd-1a62-4567-06e7-08da6518fda6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 21:45:23.5327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o72I7lKI6+DM5BZuFElnh3+CnSMypVsUM5fcZ3VMB/MOxNrNuguw4OKFg6vmWzXh5356mwkKL62QDoLDyRFDnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4163
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: July 12, 2022 3:48 PM
> To: Dong, Zhanjun <zhanjun.dong@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check for ct enabled while
> waiting for response
>=20
> On Thu, 16 Jun 2022 21:50:55 -0700, Dixit, Ashutosh wrote:
> >
> > On Thu, 16 Jun 2022 15:01:59 -0700, Zhanjun Dong wrote:
> > >
> > > We are seeing error message of "No response for request". Some cases
> > > happened while waiting for response and reset/suspend action was
> triggered.
> > > In this case, no response is not an error, active requests will be
> > > cancelled.
> > >
> > > This patch will handle this condition and change the error message
> > > into debug message.
> > >
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 24
> > > ++++++++++++++++-------
> > >  1 file changed, 17 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > index f01325cd1b62..f07a7666b1ad 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > @@ -455,6 +455,7 @@ static int ct_write(struct intel_guc_ct *ct,
> > >
> > >  /**
> > >   * wait_for_ct_request_update - Wait for CT request state update.
> > > + * @ct:		pointer to CT
> > >   * @req:	pointer to pending request
> > >   * @status:	placeholder for status
> > >   *
> > > @@ -467,9 +468,10 @@ static int ct_write(struct intel_guc_ct *ct,
> > >   * *	0 response received (status is valid)
> > >   * *	-ETIMEDOUT no response within hardcoded timeout
> > >   */
> > > -static int wait_for_ct_request_update(struct ct_request *req, u32
> > > *status)
> > > +static int wait_for_ct_request_update(struct intel_guc_ct *ct,
> > > +struct ct_request *req, u32 *status)
> > >  {
> > >	int err;
> > > +	bool ct_enabled;
> > >
> > >	/*
> > >	 * Fast commands should complete in less than 10us, so sample
> > >quickly  @@ -481,12 +483,15 @@ static int
> > >wait_for_ct_request_update(struct ct_request *req, u32 *status)
> > >  #define GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10
> > >  #define GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000
> > >  #define done \
> > > -	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) =3D=3D
> \
> > > +	(!(ct_enabled =3D intel_guc_ct_enabled(ct)) || \
> > > +	 FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) =3D=3D
> \
> > >	 GUC_HXG_ORIGIN_GUC)
> > >	err =3D wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
> > >	if (err)
> > >		err =3D wait_for(done,
> GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
> > >  #undef done
> > > +	if (!ct_enabled)
> > > +		err =3D -ECANCELED;
> >
> > Actually here's an even simpler suggestion. We could just do:
> >
> >	if (!ct_enabled)
> >		CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is
> disabled\n",
> >...);
> >
> > And return 0 as before. This way we won't have to make any changes in
> > either ct_send() or intel_guc_ct_send(). So intel_guc_ct_enabled()
> > just serves to get us out of the wait early and prevent the -ETIMEDOUT
> > return (and 0 return avoids all the error messages we are trying to
> eliminate).
>=20
> Actually will need to unlink the request too, so it will be something lik=
e:
>=20
> 	if (!ct_enabled) {
> 		CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is
> disabled\n", ...);
>=20
> 		spin_lock_irqsave(&ct->requests.lock, flags);
> 		list_del(&request.link);
> 		spin_unlock_irqrestore(&ct->requests.lock, flags);
> 	}

I agree, the caller function need the err is non-zero to know the request i=
s not success, and unlink the request.
The caller function ct_send will do the unlink.

For the err code ECANCELED, while in intel_guc_ct_send, it returns ENODEV i=
f ct is disabled. This patch will be changed to ENODEV to match it.
