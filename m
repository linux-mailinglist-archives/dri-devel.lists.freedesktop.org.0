Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0223F1497
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 09:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A5A6E97A;
	Thu, 19 Aug 2021 07:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D176E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 07:55:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="238619836"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="238619836"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 00:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="489197133"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 19 Aug 2021 00:55:23 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 00:55:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 19 Aug 2021 00:55:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 19 Aug 2021 00:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY5Nt3jBpDwx6B2hjOJP1gf6RbmHL4nQ8wZFPIzLjRYyzf3i62PSPvQ7flnxfyHMgMCGN9UtwKutEvKyBbOgXgWwSvrdk37qAHfLtOcWkmljlbaCnSll5DTUovgYyxkczT8ei4t828QDPXLxa3+k3jROOZG0jxLs0IQi8j7o1szJ2Y6P/TafEpJ+In+unzQfheSrmUCCARnfc8tFXZaqUystB8zNpPkS5ALYcCDM7MGXbvnRzaqZHeRWNJaUn6scdOOikvJaKOP3cdpw3PTXeAyrByolea03rjrF0xfP5Sl+1EiUaaXP9n+I70ESVEs54QrtOmWHx3JoWJ5JZ+2znA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UQWMSAJ0ix04rXHULn3jxgr1vslx8+xmah8Vw8wmRk=;
 b=cSV2AYN/xHP/qfgDRBVk5jUmi7U4AIbs7hRGsWHzOvXlbxe3KbG9DWbLvDAu9mtkQkTmive660BDVT7jOe706XYaGiEtL/TBSOTBJTzkdff+Hzi/XGhFuzFKAm9kr0latt7Iu6ssb9Y2qvErbdmyrmAwnvtyhozFtMLsEI4/I7jMJYvmEHxCJnvLE4TtVG9rJjOnoP7GnAraYxQANkL+MCduiZ5N4StEUFc0ttepFCYEaLIXA7AQvAV1ld7vwFtXsOOPcDAKssJcnZ5Y9+0AwR2XQYl/9xpsk96k/3dIjYxqfS2OFqRtddQOByGlx35oo44QrEyMMo/KXVjDDeecUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UQWMSAJ0ix04rXHULn3jxgr1vslx8+xmah8Vw8wmRk=;
 b=AmgMNfD4+U9kI9NtG/s9xS6/lVSc88aYIYZ83GBNqWfin0MhVOnamNb8QZW2a3F5MLGD4c1WwSYNHHVXAqXGUV0N/NOTrHLmMbZ6nn7KiWSV45H1l9zjggHjvRjwK3/sWtI3uutF6ABzZTBooUAhrvjoo5LGQgOre9EgyTfpVbI=
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 07:55:20 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::1188:21f3:a051:31d5]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::1188:21f3:a051:31d5%8]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 07:55:20 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "20210707153318.13903-1-shawn.c.lee@intel.com"
 <20210707153318.13903-1-shawn.c.lee@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Lyude
 Paul" <lyude@redhat.com>, Simon Ser <contact@emersion.fr>, "Chiou, Cooper"
 <cooper.chiou@intel.com>, "Tseng, William" <william.tseng@intel.com>
Subject: RE: [PATCH v2] drm/dp: follow DP link CTS spec to read link status
 back
Thread-Topic: [PATCH v2] drm/dp: follow DP link CTS spec to read link status
 back
Thread-Index: AQHXc0SBaoE5NGkpZkOpjHoA5Gm2v6s3r8yAgACxfYCABwf3wIA7TvDQ
Date: Thu, 19 Aug 2021 07:55:20 +0000
Message-ID: <CO6PR11MB56514A10D34ADDAF501612BCA3C09@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20210707150042.6376-1-shawn.c.lee@intel.com>
 <20210707153318.13903-1-shawn.c.lee@intel.com> <87pmvu6qzc.fsf@intel.com>
 <CO6PR11MB5651FB25D78B67BFD44E1D80A3199@CO6PR11MB5651.namprd11.prod.outlook.com>
 <CO6PR11MB5651EA11C5A461BC7F0617DEA3159@CO6PR11MB5651.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5651EA11C5A461BC7F0617DEA3159@CO6PR11MB5651.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: a9eeb8d9-e35a-4150-27a9-08d962e6b113
x-ms-traffictypediagnostic: CO6PR11MB5603:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR11MB56030A565BA189B244D66F56A3C09@CO6PR11MB5603.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2fSIkaftI6ENylmKn2jr4AL3ZpxVa6dOOOIBmlLyDPdsw/X+I/e1n5nQQTmolGtyFyP6ouhm/HcXflM+E0Lsck7Nrd+YfQw785VEDihh+kw52x4B8Hciqg8bG+MDO1CoHko4AEycsNMraXI6YKwDI66E+bRlfkbmXQt1CXcEdMJVP/MbVEqGTi6jH5zKskivDqS6AJZFZovHD9NYAZMhuHAMEodhpPth290MI7moaL7OAN3g+ni46VKiTtMaTKt3Wu+zkpaZ/ch7FF3N8erkC+FtUfHdtM0EH3195PbVVcJ553fuYyADCyYhHwCT/J6SqH9ariP2QwMIhuBEE3ny1Ffzt/S3hHup7Iiy5DIqmjSJUpOrbRRLkpzse6wAC+3IvUx/YIV/4g6iOG31l0qyLBsAsHW3xX2GRcTaCyQKKNl4xeXnyof66Z7Ovx8x7ZphXn3KIPrL6eBngF24Q/JSb5inYYBxWEtsO7fIVi8e+Vlsac+BlUgdwNQODWTeeZh4bfXz7QVhPX5yIPyzR1oRSi7yLDc4kF6YSAeqpqnu3B12sxDsSex9Ep/6k28LiolgMTkbo8V4rlreuJWHR6j1yKjGCb+8f88JDQH7Zd3E9XGSjRKqzp49ZdZT4ZgRYfdQF+bmBb7jM4y3GdxHfLh2+wVb/0fSLbhEanwDPCIid3509Op26yqHE5DTj4HfjpbCIu/vMgBRTBopq0LjlwgsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(122000001)(9686003)(4326008)(5660300002)(2906002)(8936002)(38100700002)(55016002)(6506007)(54906003)(478600001)(316002)(26005)(186003)(55236004)(8796002)(7696005)(110136005)(38070700005)(52536014)(83380400001)(64756008)(66446008)(66556008)(66476007)(66574015)(76116006)(86362001)(71200400001)(8676002)(33656002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bJd3QGfIaAaSWm52ujlwEBpqEzLoPNvjcRpDIC6z1p9gbEm4hjWYC5UGo1?=
 =?iso-8859-1?Q?PR6jcnBBJEV8iFkFpcOxgF37IGNSS05KE0tpBPVAUp/5xFsi5Sf2vU3Vya?=
 =?iso-8859-1?Q?gROFDOk24GhxxBZxX17dg1dwmIkIWl1L3P9PPL/TPpWrDU2cFKb0o/lzij?=
 =?iso-8859-1?Q?9K7uGptTREVANUFrS1GXQWXoyI0pc36KpQrNMXm+b0HvkUiB5coiguUCb8?=
 =?iso-8859-1?Q?uNPrnlxxED+kjnSKQ7bSMjCqJdj/KIGuQQ28GHFOLoaBc6oB/OaI9lYn/e?=
 =?iso-8859-1?Q?Ft5NOvJULWhT2FTzjBRAcmK+lIou2gdD0iO5xGJdycjAmh0HyJRsV9NYTE?=
 =?iso-8859-1?Q?b/qmtwMNT5a6wmZUW/WjbX3n6y9mDQn3kUheOcGalpBOuYLoyKBzAbDNwA?=
 =?iso-8859-1?Q?HNRBU4B5aNN76pHfZrc76ZOtb8kgO2OFB0Okhp54jgWaeEcJpKmv6YZ9Iv?=
 =?iso-8859-1?Q?+O+U+VkzK5AC/OXGTLvYa7tbNodLT3YYp8JLCVG0OLrNiLhoLnhGXt25Fv?=
 =?iso-8859-1?Q?EpkU5wH9tU5fL8l5ItWaK4LCSwo3er9zM9aEdg5NoY28o6m26/I3GjPNKD?=
 =?iso-8859-1?Q?dUXEDP3/9DwdZjFpKJnU6Nw/aOeiiogkkmQdvF0OKClRuqffeZDOWg3jfa?=
 =?iso-8859-1?Q?IhIDggzDGAYfybajU5NkrjEQbtHg8oE3TRoSLVb5YaXLEqXxkIoUQ4O7mH?=
 =?iso-8859-1?Q?lXieQE+U3V0wCFU1VJHxYHF+GqWYaDcfd1s4W/zE/A193yGYS4UHifKgKQ?=
 =?iso-8859-1?Q?xXH32JsiWPK+cLK9f5MoWWM+MgdKf7wvx08/OSmmA85x05ftyLthKMlhtB?=
 =?iso-8859-1?Q?/RSzAKT97s2Qd9873VJs3RP7QoreZSglGe5UgSqEI76bsb/Au9t0x06utf?=
 =?iso-8859-1?Q?/mKW8wGglLeIDlIgOBKHFINBIxyjau/b4X8kwE6JjerwUArw4KtpGqIpR+?=
 =?iso-8859-1?Q?QrV96UT5nAUvLz16+1zBYo0TecgBZ0FesxiD8CR2M898BzBlhMWBIhFoDW?=
 =?iso-8859-1?Q?UaF+jPVeuK84JCyRPp0rpOHtJP7H2yEsvGwPCiIHRnuCGL2SXBvNRvSgIv?=
 =?iso-8859-1?Q?IHT4uHjcgCvW8DL2f3U/yzJcXP4h2nZQKHY9cxr8nRumFcLNQx5JtG+K4t?=
 =?iso-8859-1?Q?yuMp94Zc/7aVW+sWj3WQCK2qPTAkBGS1MxhZTeAKXVEaudtYz3gNfRIIat?=
 =?iso-8859-1?Q?3C4DWgZOIGQPpY76/jaSl4spREttAsK+uAY8a6hukaF2tz+hK1ShZm01RU?=
 =?iso-8859-1?Q?2Yj3gP1HMSO+iCs7qjkW4XMpTHWJbkQE/zvDnUEgFv+y//pZsKvHj65IgM?=
 =?iso-8859-1?Q?Uf/vPP9nR2pX4GdW+nTEPYoZg88kzq16QDCUgQKxkCFcLcRD1uw27Kgx2/?=
 =?iso-8859-1?Q?cCvAqAAgwj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eeb8d9-e35a-4150-27a9-08d962e6b113
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 07:55:20.2050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pg10C8IWo0SlOyGJmAYLpJuynvHYprd1mXmqJFB4xGCBxGc8L8nGCqkQidO/b+cSTdzIQNJTCT2O3fG8cJ2cqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Jul 2021, Lee Shawn C <shawn.c.lee@intel.com> wrote:
>On Wed, 07 Jul 2021, 4:14 p.m, Jani Nikula <jani.nikula@intel.com> wrote:
>>On Wed, 07 Jul 2021, Lee Shawn C <shawn.c.lee@intel.com> wrote:
>>> Refer to DP link CTS 1.2/1.4 spec, the following test case request=20
>>> source read DPCD 200h - 205h to get latest link status from sink.
>>>
>>> (4.3.2.4) Handling of IRQ HPD Pulse with No Error Status Bits Set
>>> (400.3.2.1) Successful Link Re-training After IRQ HPD Pulse
>>>             Due to Loss of Symbol Lock: HBR2 Extension
>>> (400.3.2.2) Successful Link Re-training After IRQ HPD Pulse Due
>>>             to Loss of Clock Recovery Lock: HBR2 Extension
>>> (400.3.2.3) Successful Link Re-training After IRQ HPD Pulse Due
>>>             to Loss of Inter-lane Alignment Lock: HBR2 Extension
>>>
>>> So far, DRM DP driver just read back the link status from 202h to=20
>>> 207h. DPR-120 would judge source can't pass these cases and shows=20
>>> below error messages.
>>>
>>> "Test FAILED, Source DUT does not read DPCD registers 200h-205h=20
>>> within
>>> 100 ms".
>>
>>Acked-by: Jani Nikula <jani.nikula@intel.com>
>>
>>for making the test pass iff everything else seems to work.
>>
>>The underlying question is, though, should we look at 0x200-0x201 for som=
e status we don't look at?
>>
>
>Look into 200h. While doing link train with DPRX. In my opinion, sink_coun=
t and cp_ready status should be constant.
>And sink would trigger HPD to source to notify 201h value was changed. See=
ms source driver don't need this value at link training stage as well. What=
 do you think?
>
>Best regards,
>Shawn
>

Hi Simon and all,=20

Please share your recommendations for this patch to pass DP link layer comp=
liance test. Thanks!

Best regards,
Shawn

>>
>>>
>>> v2: Use sizeof() to retrieve array size.
>>>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Simon Ser <contact@emersion.fr>
>>> Cc: Cooper Chiou <cooper.chiou@intel.com>
>>> Cc: William Tseng <william.tseng@intel.com>
>>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_dp_helper.c | 10 ++++++----
>>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_dp_helper.c=20
>>> b/drivers/gpu/drm/drm_dp_helper.c index 24bbc710c825..4f03df317d62
>>> 100644
>>> --- a/drivers/gpu/drm/drm_dp_helper.c
>>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>>> @@ -410,17 +410,19 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_d=
p_aux *aux,
>>>  				     u8 link_status[DP_LINK_STATUS_SIZE])  {
>>>  	int ret;
>>> +	u8 full_link_stat[DP_LINK_STATUS_SIZE + 2];
>>> =20
>>>  	if (dp_phy =3D=3D DP_PHY_DPRX) {
>>>  		ret =3D drm_dp_dpcd_read(aux,
>>> -				       DP_LANE0_1_STATUS,
>>> -				       link_status,
>>> -				       DP_LINK_STATUS_SIZE);
>>> +				       DP_SINK_COUNT,
>>> +				       full_link_stat,
>>> +				       sizeof(full_link_stat));
>>> =20
>>>  		if (ret < 0)
>>>  			return ret;
>>> =20
>>> -		WARN_ON(ret !=3D DP_LINK_STATUS_SIZE);
>>> +		memcpy(link_status, full_link_stat + 2, DP_LINK_STATUS_SIZE);
>>> +		WARN_ON(ret !=3D DP_LINK_STATUS_SIZE + 2);
>>> =20
>>>  		return 0;
>>>  	}
>>
>>--
>>Jani Nikula, Intel Open Source Graphics Center
>
