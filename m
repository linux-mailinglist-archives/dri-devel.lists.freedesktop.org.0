Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928A3BF42E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 05:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700C96E207;
	Thu,  8 Jul 2021 03:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7766E207
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 03:04:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="295071292"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="295071292"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 20:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="648180951"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jul 2021 20:04:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 7 Jul 2021 20:04:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 20:04:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 7 Jul 2021 20:04:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 7 Jul 2021 20:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQlAwf+DV/enZXaC3WMht1rWo+Eve4WEAVchIqDXRCz6oyzLIlqDYOMg4kUWrCcHs9/rQ78HNgKnY5CKjGdJDUWgxAjY1Y6iURJ7OQ7s86ziVJ+zJr9tUmrs3uz5jp7bgOx+zI+XC/hbnp3r0TJ7IN+LKM7FBpcaVSVzNSEMztnNvYnFLK2mYV0HC2eaRFkWzTDFh6ijxdfei5FmgrqHNaKQ86Wcu0iClv+mILjJ3UFjqQ5PepVmpbUEOwNuh3hRl6eWKlH2mboqlvOnbcOH4gscahkMbvikI/0uDOJwkdRzOaM0WM7pQRpFGJuVqJdVHViPUNrR7OXzxh1uNaw/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJWP2E3Prb85EyAmmNcHeL8SrsxZbBMCmjrT4tydamE=;
 b=ThG/BiKYz3ZF692f/emrEJbZiv1/bQkwoX3fAMVkMcMy+e1N5QosdubMNVn5EdEMrDcFTckmz/wrqeaOG8SK8sMSQkLdF4RJVgHCRRTaEYBDKeo6JIcFRhCve2twX6Nchb3DUS/zo5oMy1JGxmOekPtCiIZ9ZSjRSVxSG577oNPVSxX2TwHRyZFN/5eRqWI/9mlj2TRwhe9sgVCfTStEqDgKoGNVrNlFuNa8X8sHYp62SDdBqDcvnKdsAHzUlxkgfRJEPRABl9ihuhQ1AeRQjT/N2ct3m10YSKhX+N3icB68JySK8FrWikJHj6ckajpGRaSQUhyuXLba9VVT8Xvc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJWP2E3Prb85EyAmmNcHeL8SrsxZbBMCmjrT4tydamE=;
 b=k1yDw1EvYWFCVmHoWWfwDQ5aMT8VCB0xwKOkc2Qrh85e31Q9dO62SxkPcQ8L31AQiQJSSdD45PvxEVJRn35qRaYUHh+DZbbQXN4ldNuOAyLv6NFD/BM091noTQJd/GiWeWIGkM+YkVrVq1mkLzlAcIaSquqf1tN2vifAFKZLt54=
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5572.namprd11.prod.outlook.com (2603:10b6:303:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Thu, 8 Jul
 2021 03:04:34 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7%5]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 03:04:34 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/dp: follow DP link CTS spec to read link status
 back
Thread-Topic: [PATCH v2] drm/dp: follow DP link CTS spec to read link status
 back
Thread-Index: AQHXc0SBaoE5NGkpZkOpjHoA5Gm2v6s3r8yAgACxfYA=
Date: Thu, 8 Jul 2021 03:04:34 +0000
Message-ID: <CO6PR11MB5651FB25D78B67BFD44E1D80A3199@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20210707150042.6376-1-shawn.c.lee@intel.com>
 <20210707153318.13903-1-shawn.c.lee@intel.com> <87pmvu6qzc.fsf@intel.com>
In-Reply-To: <87pmvu6qzc.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e15fd76b-b98e-41d4-a9b2-08d941bd1d65
x-ms-traffictypediagnostic: CO6PR11MB5572:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR11MB5572B28235A69A6D760B1F45A3199@CO6PR11MB5572.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uqn6yROsYmANMdpBFZfh7q9xHY2CXnQHtbLcGrGyD4NEmxfKsDJTv2R4A17LBqF6E1gVPpT7P5YLsmkYyBRwboPTYvMDWDbgTBGTTUwETTRXB+d/dUIrBBx7OQCPJtX8ovQ6R0NX184bfl0osxAPDBmr+/J50W0nmnAAmd8eoxob2pm2PF2lg22296DkE4OZKwyZtTYV5U6Wc2cEWQX8WdNd9f+eNOCSmbguiM1s78hzaWRpZkRqSa/x9OVKna6FUvAmEftkY/FRkwbgoov1J4KHU6joWpGe09oBPhkvp2fQ0IQv32Ye0MUo+65AioKFyu7IMqAt5v5MlfWawA2YuNJynL9x4BGTIS0Fkux5htIlQhGOscVQD4iqc6Nop7xUg31F+01nd6QpWwq/AJcefcg90gt9lS0NweaMWgduGw7enqIytl8mU1HPGecrOQi09LIKqsc0FPT8oMLFqfIAG6FaAv9QaHiMhn5hWp2+Bit693Q+LA/plqaCjLaX+p5wE/joDxY6biPesHs9CvGhvdNxm7EWbe/EIIFOmcsn1DgCX3bzqKgdwQfCyIyW63mF2uB9ghSPzx2isjcpm/BToInOqSnTdna21Jg1LwjSEuXOccedgPvKgs2D05LQIWM6wwwMcIyj38J1vIhp+gthZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(376002)(346002)(136003)(71200400001)(83380400001)(66574015)(478600001)(122000001)(110136005)(64756008)(55236004)(66476007)(7696005)(6506007)(54906003)(316002)(8796002)(8676002)(2906002)(33656002)(66946007)(186003)(52536014)(86362001)(76116006)(55016002)(4326008)(38100700002)(8936002)(26005)(5660300002)(66446008)(9686003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1myL73escXwpftOKmbh3sPxqtexhxkipFOdUFP0+wU6gInEzjN1OrH/LOZ?=
 =?iso-8859-1?Q?EWj2kottZt9GBjHueWE3uigwVwLa7fpe33HO6ihAVXREKeVNqwVdBLRaf6?=
 =?iso-8859-1?Q?IhUX7v07vtVxqcXd8sHbI11Kj7SveB925seYOXciqjWeh8zJl5ukQtHCvy?=
 =?iso-8859-1?Q?f0bxk3tllITe+IE5WvnH7QgnRSRxaO2MCXpZ9umBmpWWLXgzn8hjBskgB2?=
 =?iso-8859-1?Q?OWWfZRI3/jU5NRXX49o+zm0MUlyYquMsYZqyE0A8rjg0tsKE17mVXbmlEm?=
 =?iso-8859-1?Q?tVNvRBIWqyJfVp/NiSx9aUCc6ogR1nXn7BUL6Djf/dT5xmuXk++n/glVAh?=
 =?iso-8859-1?Q?KzDQujGyw5DhNjL3TinsjRv2u2wxNTUOKpbKkkw+Xv7NlVPQO/LdyAQewM?=
 =?iso-8859-1?Q?x9wL2+96JT6t49NdjUcJFehwjJJiQt6XG5fy2ux+HVxCrbR2lOLLEC7/um?=
 =?iso-8859-1?Q?GKdXFdeTaAwUIy56BTn+bzRosaQqSSjrmuE/InHhylBRBwEJd9B9eycIv3?=
 =?iso-8859-1?Q?EYRWpkSaAtgxIPzt9FSrhL+ZD4LbXNyXHPWRCVhBXbWZAH5pqb9jpWcozh?=
 =?iso-8859-1?Q?spC4zz1o0h98QQebDUCxMswExj3hdtTk+34sRsO/2I/ZB/7zs68vyxIsJ8?=
 =?iso-8859-1?Q?iiLssnAZ59ebHbKiWycPj7xaioVxXgt5dcih2LdNRwWVKg9NXSdqsM1Ee0?=
 =?iso-8859-1?Q?MmVQ7zg15F/7BHikR9rRpOrEWtVNmxY0/rRH60tGimKH/sHYIDbiDjDJ6L?=
 =?iso-8859-1?Q?4CEwwzrDrZZ5Wsmi6tDvFNqbdgsh4dqlvw0UunWDI7NvY9IqDW1oSkvCQY?=
 =?iso-8859-1?Q?wQ1JS7esMEdEI1FH9NB8nrVru9macpZ4N+DtmumRzHNWxZ43b9L5wotC4e?=
 =?iso-8859-1?Q?pWGRtWyNO+FVfGR45KwjN9eCRYRBczPHzBzjWQRHvXwneDS5hjJGlKugrk?=
 =?iso-8859-1?Q?fXrLYVN03Mft1DIYdemtr+mdgv25LusqnNfxWA4Z2Y2Q5atgdY6LRME5eM?=
 =?iso-8859-1?Q?QdqFHOf2n0HawmK6UdexV1ySnFTouYwl3YFfwXR79ivEGrikstvHyFsDEM?=
 =?iso-8859-1?Q?/HEMyJhNyyk22BslqJ8JaDOTU/CDZOLCz3fERDM+kTH2fTngaFt+OKuYEP?=
 =?iso-8859-1?Q?8r97lu23Th76a5qU1vJcfivCn8bhllB0wc05R3eYgdKqSst31y2tVn6TjQ?=
 =?iso-8859-1?Q?PFlN+QXcPyRFDhPjNOWMIoU3v5AFxXeraCW5A9oFBsd2q3fF6BiQHlizwM?=
 =?iso-8859-1?Q?Ch3TrwNkKUfC06QvwoX2euTEOktHK1z8+EERv7tu8hv449O6Tmyhb1maJ1?=
 =?iso-8859-1?Q?kw1u7FXsWFBVN/PjeH8NRqBtIQPxACrivSk2RIC6LYthN09X3hkvdF8Ubm?=
 =?iso-8859-1?Q?iN/SY3oT8P?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15fd76b-b98e-41d4-a9b2-08d941bd1d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 03:04:34.6695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9WffPFyAAq6JgGADXF+2ECwnT0jY9/zbjphTQNfjBJpUhygHJcGcsnCsBHFuCrQVaXymlUgmkoHQn06nFolLZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5572
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
Reply-To: "20210707153318.13903-1-shawn.c.lee@intel.com"
 <20210707153318.13903-1-shawn.c.lee@intel.com>
Cc: "Tseng, William" <william.tseng@intel.com>, "Chiou,
 Cooper" <cooper.chiou@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Jul 2021, 4:14 p.m, Jani Nikula <jani.nikula@intel.com> wrote:
>On Wed, 07 Jul 2021, Lee Shawn C <shawn.c.lee@intel.com> wrote:
>> Refer to DP link CTS 1.2/1.4 spec, the following test case request=20
>> source read DPCD 200h - 205h to get latest link status from sink.
>>
>> (4.3.2.4) Handling of IRQ HPD Pulse with No Error Status Bits Set
>> (400.3.2.1) Successful Link Re-training After IRQ HPD Pulse
>>             Due to Loss of Symbol Lock: HBR2 Extension
>> (400.3.2.2) Successful Link Re-training After IRQ HPD Pulse Due
>>             to Loss of Clock Recovery Lock: HBR2 Extension
>> (400.3.2.3) Successful Link Re-training After IRQ HPD Pulse Due
>>             to Loss of Inter-lane Alignment Lock: HBR2 Extension
>>
>> So far, DRM DP driver just read back the link status from 202h to=20
>> 207h. DPR-120 would judge source can't pass these cases and shows=20
>> below error messages.
>>
>> "Test FAILED, Source DUT does not read DPCD registers 200h-205h within=20
>> 100 ms".
>
>Acked-by: Jani Nikula <jani.nikula@intel.com>
>
>for making the test pass iff everything else seems to work.
>
>The underlying question is, though, should we look at 0x200-0x201 for some=
 status we don't look at?
>

Look into 200h. While doing link train with DPRX. In my opinion, sink_count=
 and cp_ready status should be constant.
And sink would trigger HPD to source to notify 201h value was changed. Seem=
s source driver don't need this value
at link training stage as well. What do you think?

Best regards,
Shawn

>
>>
>> v2: Use sizeof() to retrieve array size.
>>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Cooper Chiou <cooper.chiou@intel.com>
>> Cc: William Tseng <william.tseng@intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_dp_helper.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c=20
>> b/drivers/gpu/drm/drm_dp_helper.c index 24bbc710c825..4f03df317d62=20
>> 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -410,17 +410,19 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp=
_aux *aux,
>>  				     u8 link_status[DP_LINK_STATUS_SIZE])  {
>>  	int ret;
>> +	u8 full_link_stat[DP_LINK_STATUS_SIZE + 2];
>> =20
>>  	if (dp_phy =3D=3D DP_PHY_DPRX) {
>>  		ret =3D drm_dp_dpcd_read(aux,
>> -				       DP_LANE0_1_STATUS,
>> -				       link_status,
>> -				       DP_LINK_STATUS_SIZE);
>> +				       DP_SINK_COUNT,
>> +				       full_link_stat,
>> +				       sizeof(full_link_stat));
>> =20
>>  		if (ret < 0)
>>  			return ret;
>> =20
>> -		WARN_ON(ret !=3D DP_LINK_STATUS_SIZE);
>> +		memcpy(link_status, full_link_stat + 2, DP_LINK_STATUS_SIZE);
>> +		WARN_ON(ret !=3D DP_LINK_STATUS_SIZE + 2);
>> =20
>>  		return 0;
>>  	}
>
>--
>Jani Nikula, Intel Open Source Graphics Center
