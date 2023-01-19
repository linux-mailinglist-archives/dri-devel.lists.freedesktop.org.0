Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782586731B1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 07:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D083510E8AC;
	Thu, 19 Jan 2023 06:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CBE10E8AC;
 Thu, 19 Jan 2023 06:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674109159; x=1705645159;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7kx5toGXWibuWb8z7db839CejYTBtKKdiYAUt5wpLXk=;
 b=jI5s32zGreY4Trf4A8geFhPBxl9j+V3dwWtNvjpzyZ5LHB4zs15asnaJ
 2PiY6/JdMkXFp43G6qv/SQNmUDsEiiOtD8jjbcAUq9Wk2WM8Ls1sQ255t
 MN04OHTcP3kNhBGcFbZqZkzMREQia7J0oSEOzrVw+IFUkq9lNUXBsP3eQ
 GuRap7B3sustfaXfw+CM2GMiaWahOqpZFNoj4B7xs8D60vpxV0IucbyWM
 i85LYY8Iz+9ARCWa40RU/azY8goXy7iozu8Xe3AJ7YpoEJcmwpivoM7/P
 7K9SgNnHtYgwcHyZbU5adQgheNFql105CiRAoXlbGzdsfn8RSC1n8a0Au g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304893215"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="304893215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 22:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783948906"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="783948906"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 18 Jan 2023 22:19:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 22:19:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 22:19:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 22:19:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 22:19:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buTbHDu13xoGQ/tKHWnjdeqN6CHuAuYNFR0OEVdxMTWiLJlTWzAVE5oCUcUr38SLBg+GbSMURHkjB4dBv354QwyyeN5VCf4i8vtNAzyZ3/C167gKJVPjT3w5eW0CKdZrEiW1YwNIOJZgZWx3lpMoKgXkxou6gcBVfsEZD+YPMyyOn8yJXrIf7YsLkEenNI4llzPF0pLNYhcyR4nmxHNInQDMVUzI5b/PSXeWOql7xuYZdJZOf5yDclwSC3zV6Ukq2fuS9VQHSd4XRhFrk49iKstZzXTO2w8mUNwvvma9DxebyAj8nMUooJ9GJQyXlj+qvh5zzAPIfJw5y4NT9IVsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAp+mEBbmNQo7a3zwkVLLta7pMEzSp+fkKr6prk0ReM=;
 b=QE/iUetlibFVPZNPJpUMq9j8J+GL0mitzO82pie6l5zPmth4ws85wPLh9eYH7MT6aJEiKvUPZZUw0XyPrFOC/v0/8p7q2AlvgoaVzENxCjGFkdIWBVgjsdhK+n09kTOISqLTcvxZ12Zmb0Xx9pPEicGKzAENZHibL0P7UuuJ8TmcDj17Uf+tABBJohKh6/WxRADS8rn5LT300lG2/xXlgyYMevmWp6pQ9zQ/Cs+V3xZiZJJLrrNwt335R8YjwuU6AWUlZCAAvuGA1ZH6bhOueGDrpNzdfk9awODc36Rtrj1rI3jkmsj5jfkD1/goN0+8w3eKj2fesPhbsUS2pE2FKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3170.namprd11.prod.outlook.com (2603:10b6:208:64::10)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 06:19:14 +0000
Received: from BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::e573:309f:67c9:29fa]) by BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::e573:309f:67c9:29fa%4]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 06:19:14 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Thread-Topic: [PATCH 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Thread-Index: AQHZJwl1supyNcNYy0ifJ1b8cnACQq6cAV4AgAlKRbA=
Date: Thu, 19 Jan 2023 06:19:13 +0000
Message-ID: <BL0PR11MB31707335E09322583282401BBAC49@BL0PR11MB3170.namprd11.prod.outlook.com>
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
 <20230113043653.795183-2-arun.r.murthy@intel.com> <87mt6mg83h.fsf@intel.com>
In-Reply-To: <87mt6mg83h.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3170:EE_|DM6PR11MB4673:EE_
x-ms-office365-filtering-correlation-id: 5d020090-d7e7-4023-43b4-08daf9e515ef
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jTOzKVh2PrT3eXzTfGRevSPl6XZMN5PeF5KZ6d8Lpfj2twfImwZB/aqQDotY2NKF7A7L4ByhohdNj1/ZRgfEYq3H9vhthYUSxotUSunasjRDuXt+DEY6KwaI5huT43O8H55F2V1HyYcvF5oqnTc6QrZNL3MqWmsMMZWmwNZ86gLHX1TF+BMoSVRC5KK+9go7NfY9zaehw2uTmyb40UcKteJ+1MTLGrOKthMGcVBLKRRbjCENPCJYFNjsr7m84Iw0S2cQJlPnPbhufF4byX7nVlWXIWzYv3dZJhKhAA6P9UptWaSuxksv4Z/n/0a4y44OienU/4Q1QomLZVsORpfBIiOi/j4Fqw5JlswcpBpvpao7/XAy3FBD7iJYlGmsdOu3quuPMje5sbW5tHka+va1jrqIRHgfS5rfVLslco3U28MSkHs6ijCXPwUC/Ezfa57S0Qf1o+jgrdS4QlaYpts5peAgdODqs7zhxxNwo2PDUDbTi4Z+ZmVLzi9BQQK20OO1LbL+euYj6PTLdqOC22MKKqpHnFC/KgiPw0/d0rY+OSPDvxb9F+K36USqUllJiU9AFOuI2ni9TQJ6GpKIFiWAZOeGWX2zg7yBDtIISmYMURSt/0fFKBcw5y5pepZGyWup1e4K3k/3H3huv2uqFrCVPTEFRP04hNrT7o4IQP2OKCO24JMIZFNZFff6pFZ/l8AsUda1NcJT2mTI7r73KgbnaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3170.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(38070700005)(33656002)(66946007)(2906002)(55016003)(450100002)(66556008)(52536014)(8936002)(76116006)(5660300002)(66476007)(82960400001)(38100700002)(122000001)(71200400001)(110136005)(55236004)(53546011)(7696005)(316002)(6506007)(86362001)(478600001)(41300700001)(64756008)(8676002)(186003)(66446008)(83380400001)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WfUebNxSKMJuxoMvIITU7ItymcmAaj/Jou1yhm/SjraQfBlHP9CLFDCEXDrQ?=
 =?us-ascii?Q?kuny6WNpR85x8ipxm51IQ4xjliNLQTcll9DAuirMz9BSnclKkwbHeKzkbW2C?=
 =?us-ascii?Q?NRjM8RKqGjW+QBlzY+19e7ClgAW7TiNo0SGkFO0InfontCzg6XM3NvmmeD5s?=
 =?us-ascii?Q?KCBBz6xFAHiQAiAvUk3DqXNfXvuOTAd55I8PhIFKxzeiZdTQdPArZsAekXi5?=
 =?us-ascii?Q?wJCRdgiYorBNRWyWcVF0yxZCD0qCOBQ/r7mOfvIfGoE2tJZoyr4sZj39qyX9?=
 =?us-ascii?Q?Z8N610UXCYtpPy82tA3xKlfI+YIFBPN2pNBhcAbqC8iWMYtROEVHONHhsV74?=
 =?us-ascii?Q?LqKrfuYfDUtgxVhQgtswsR24kbjVMIWJRy656LR2ALKD0vI9cguoE6UIe+7N?=
 =?us-ascii?Q?wPHwSfJN/ESDVK6xaG174DDlfJdOVDYryBdk8/2BtVQRCMhBRV9RymFNUMkR?=
 =?us-ascii?Q?AMj/+MwhgP31g7PeHVi5M/B0iouAjEQTCf0dEN5kJvWn459w7cEvL77Xx8qv?=
 =?us-ascii?Q?YXj+U5L8rfxEOPJNR08bIgcJTMCjXnlYy/CTaOyv1G4E98UAerk9C35Wxinl?=
 =?us-ascii?Q?fS79Cqk2LkOugbuVX0bZtKYeiXd9aOnPC1dHeZkeGHVwm/1QhITjY7pZ0uIj?=
 =?us-ascii?Q?gFzlu/Cdxs6SA2YuchlH6cOx5TogA5HIqzBCs4s2WLU11GzNbNUJyr5Un22w?=
 =?us-ascii?Q?ClVeqKza2cPNwX53lpObNTo5rIwyCIjDnocUryE+tELkNiC8r9x8lwhmQyHi?=
 =?us-ascii?Q?0k9FumPSnG+oRaS/+pdrxrwVwQgOT+z646jLAeWP8tKnLyAduFYiZ/94680C?=
 =?us-ascii?Q?9D6qH5Hqq1Xp6jLZ+/c67FC5bXDKHoWjL9vnSaEyw5s1EAuPwbWXFviLMmsR?=
 =?us-ascii?Q?o0HCJWgIGSdfrLF0TFtFxbN9973WJAvySkwUnJuj5/X8M7GF8QyIdB7NXQfX?=
 =?us-ascii?Q?x84bdh0O0xd+HBWnOR2qjSii0LktfflYNwGwJucirP5mmC0nD+Fjo/xGJT/c?=
 =?us-ascii?Q?MxyLI8Jr11wYEQmRkk1/mILwGeYlKg+oC5yci3FbRp8RtfN16L5G6UEK0cf8?=
 =?us-ascii?Q?wfc+EBHuh8nM34rUI7rdM5EqhzQ5oCTbR0dVHTVqPMS+J7aK1MTaMfGpbxjg?=
 =?us-ascii?Q?LVbfqAy15oZNAM+tDP85TR64diccpUHvHUm40QilFen8am2pAoK+rZmzT1y1?=
 =?us-ascii?Q?9n5jxWtN1x7Qa998BvHpgU3kvdNDRh3mdgz7yRzzDt/yIxr/AK3qHp/mV+LC?=
 =?us-ascii?Q?RLNHDslCynYenREuLzFv2E9S3Xgr/158UDCNVWhBWqBkq/GqxGtDf1ZEsVmT?=
 =?us-ascii?Q?uHI+KlXUmzXlKf7R23cvTL3VsycekSgKtJaPmSLTNztt8EyCe+nSraxDrtqZ?=
 =?us-ascii?Q?nho0rAtC3+4C+lFR1UCy4nggOokhwmQjnuG/N1mkN3bhLBnr3kdXDJqsvReu?=
 =?us-ascii?Q?aSL358rRzpAM6kEfSmTGcTSr3qjHdA/AnZtyokfuPVhCDghusUdZS/dwTDLP?=
 =?us-ascii?Q?8s8wuqmINWaKMKuOpOVBYapUSgTOB1S0FpJsozm4bhd4xE11hQ6woPcjEIvn?=
 =?us-ascii?Q?JoeA/1NtRohusS7ksNb/zH2NwrcDinEqDmHh6jW3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3170.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d020090-d7e7-4023-43b4-08daf9e515ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 06:19:13.6550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VaFX+9np/7vPKckgiydYYMRvVq20V8byg4pqb87PonoI5+us9EZzofknYaOl3BG2qgWp0vLrgr+39TFZkUdR8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Friday, January 13, 2023 1:49 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH 2/2] i915/display/dp: SDP CRC16 for 128b132b link lay=
er
>=20
> On Fri, 13 Jan 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > Enable SDP error detection configuration, this will set CRC16 in
> > 128b/132b link layer.
> > For DISPLAY13 a hardware bit31 in register VIDEO_DIP_CTL is added to
> > enable/disable SDP CRC applicable for DP2.0 only, but the default
> > value of this bit will enable CRC16 in 128b/132b hence skipping this wr=
ite.
> > Corrective actions on SDP corruption is yet to be defined.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 13 +++++++++++++
> >  drivers/gpu/drm/i915/i915_reg.h         |  1 +
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 30c55f980014..6096825a27ca 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -133,6 +133,7 @@ static void intel_dp_set_default_sink_rates(struct
> > intel_dp *intel_dp)
> >  /* update sink rates from dpcd */
> >  static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
>=20
> Based on the function name and comment, this function updates the driver'=
s
> idea of what rates the sink supports. A quick look at the code confirms t=
his.
>=20
> It should be clear that this is not the place to add unrelated DPCD write=
s.
>=20
> >  {
> > +	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> >  	static const int dp_rates[] =3D {
> >  		162000, 270000, 540000, 810000
> >  	};
> > @@ -196,6 +197,18 @@ static void intel_dp_set_dpcd_sink_rates(struct
> intel_dp *intel_dp)
> >  			intel_dp->sink_rates[i++] =3D 1350000;
> >  		if (uhbr_rates & DP_UHBR20)
> >  			intel_dp->sink_rates[i++] =3D 2000000;
> > +
> > +		/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
> > +		if (HAS_DP20(i915))
> > +			drm_dp_dpcd_writeb(&intel_dp->aux,
> > +					   DP_SDP_ERROR_DETECTION,
> > +					   DP_SDP_CRC16_128B132B_EN);
>=20
> HAS_DP20() means the source has DP 2.0 support.
>=20
> We're in a branch where we can assume the sink also has DP 2.0 support.
> But at this point we're not sure we'll be using 128b/132b at all.
>=20
> I did not look this up in the spec, but I assume this bit is only suppose=
d to be
> set when we're actually using a 128b/132b link?
Yes.

>=20
> In which case, this should probably be enabled at some point when we're
> enabling a 128b/132b link, and at that time the check to use is
> intel_dp_is_uhbr(). UHBR and 128b/132b go hand-in-hand, and we won't use
> UHBR unless both source and sink support it.
Updated and also moved this part under link training init.

>=20
> > +		/*
> > +		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
> > +		 * disable SDP CRC. This is applicable for DISPLAY 13. Default
> > +		 * value of bit 31 is '0' hence discarging the write
> > +		 */
> > +		/* TODO: Corrective actions on SDP corruption yet to be
> defined */
>=20
> The above might belong in the commit message, but I'm not sure about thei=
r
> usefulness as comments.
This comment is just to ensure we keep track on what has to be done on erro=
r.

>=20
> >  	}
> >
> >  	intel_dp->num_sink_rates =3D i;
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h index 8b2cf980f323..77e265f59978
> > 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -2674,6 +2674,7 @@
> >  #define   VIDEO_DIP_FREQ_2VSYNC		(2 << 16)
> >  #define   VIDEO_DIP_FREQ_MASK		(3 << 16)
> >  /* HSW and later: */
> > +#define	  VIDEO_DISABLE_SDP_CRC		(1 << 31)
>=20
> Please read the comment at the top of the file.

Will remove this, as for now we are not using this and will add this once t=
he corrective actions are added.

Thanks and Regards,
Arun R Murthy
--------------------

>=20
> >  #define   VIDEO_DIP_ENABLE_DRM_GLK	(1 << 28)
> >  #define   PSR_VSC_BIT_7_SET		(1 << 27)
> >  #define   VSC_SELECT_MASK		(0x3 << 25)
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
