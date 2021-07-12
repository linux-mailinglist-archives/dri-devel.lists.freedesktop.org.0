Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68613C5E23
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515F689C1A;
	Mon, 12 Jul 2021 14:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85589C1A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:16:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="231778314"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="231778314"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 07:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="412104379"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 12 Jul 2021 07:16:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 12 Jul 2021 07:16:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 12 Jul 2021 07:16:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 12 Jul 2021 07:16:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 12 Jul 2021 07:16:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtQmjpGhS3rog0/tGhOMzWVY3ITSacaERKbqscmKIA4IxbGupxvBHbiorekBMxym4A4bZRnN9dCf0Fno+wd2lhJgPRXJLQebxcqNvn7+ccX/pK0V2zTywvA76ft9Nrj93IrgAkzy8p49qwF4rU3E/HPuDfYYXNQWDBkdYPMy089yu4UFLzp34iPxw8KV42GgZLK6I1t3b0LrhNM2zURYudeKZeSkFCuiE3S0PVpdmf6Pf+O3ohUN7VuPEedYZ9a2dxFOX7hybEHvna1s6pARw14hm+Pmh+V4uo8AfeoN5+W1vcZrjFA3T97ROqRY0V1Y1wKCpmu7e/SAOoRwTh+GvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UQWMSAJ0ix04rXHULn3jxgr1vslx8+xmah8Vw8wmRk=;
 b=PFoQ3ockgHu7dmiSLknq/jdrKwfE2OLsx58DUalhxof9wEiNTC6VvFCPBljongn4TBEue1WUfYYjTCjwTeucSd5mLrUgsmC7bmAPlsJ7ec/OoZ79ghPyaJE9xW6DUrKuFjkTGAbP+81QEJFErCtjCzjy7GXEsKUTG+DMFoVcVxkEMUrNMB+r4/O60RGdgn4ltEHt+Hgk99/f+3KaDpGROp7EEGqt9doLspK+FSft7Iv3ig9U3EnqsoAJBpXUToFmAYhioo6ZwzId0f7PStzIns9kMS+Y6Nn7tnWsCVKNz0hUOcvK42Di5wf3Wpb7Sm36BU+VeWbCN9/QSGQxJzAF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UQWMSAJ0ix04rXHULn3jxgr1vslx8+xmah8Vw8wmRk=;
 b=YAMevYMTkiOj0ylZkXFj1xXpf6OfaGyYE6QeTnEPdX+SOV5kmu+wnmxbBfcbhZKyJj1A9Yl+7OwdbfskdusbblirnDhbXfBRlDPszKIyWZVURLPkUEo6s3gs/B60xNsgetkT2gy43eAOMTMLv9q1QV2mbRDou19xvyJy6gS591M=
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 14:16:24 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7%5]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 14:16:24 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "20210707153318.13903-1-shawn.c.lee@intel.com"
 <20210707153318.13903-1-shawn.c.lee@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/dp: follow DP link CTS spec to read link status
 back
Thread-Topic: [PATCH v2] drm/dp: follow DP link CTS spec to read link status
 back
Thread-Index: AQHXc0SBaoE5NGkpZkOpjHoA5Gm2v6s3r8yAgACxfYCABwf3wA==
Date: Mon, 12 Jul 2021 14:16:23 +0000
Message-ID: <CO6PR11MB5651EA11C5A461BC7F0617DEA3159@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20210707150042.6376-1-shawn.c.lee@intel.com>
 <20210707153318.13903-1-shawn.c.lee@intel.com> <87pmvu6qzc.fsf@intel.com>
 <CO6PR11MB5651FB25D78B67BFD44E1D80A3199@CO6PR11MB5651.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5651FB25D78B67BFD44E1D80A3199@CO6PR11MB5651.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 0b354fcf-fa0f-4b19-6244-08d9453fa15a
x-ms-traffictypediagnostic: CO6PR11MB5620:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR11MB5620666EB8839EBFD20933A5A3159@CO6PR11MB5620.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ujyRjFcu2U2yxVJHvvcGEwfXkPYVEFsugplU3gH7s48ZYAVA2S5limU8aqX0MouAsQS+UHbFF5A+PzDZUtTBHEb71BDRNkO3sG6FFDu/SjD/I7bqCm9rw8K2vxeqOd32gb7uktRPsq6rRPCrgHMW/pRFDbCpulLPJk9tV/yF7u8ycVvwLIObJywH1Xq+6uM3NnfgwqM/KcAFTepdmyZcLbvvs1vPnmaBXLF9yHWcQa0cINrw+dEUar+BDLW6mMyiH6UvqCWZuyrdT6m8T9iMJAzMe+8jZs4T8vRfgZQ2dqlt8D36N9tnb55e+yVjxJ+MuvyJXowSWEAUOjGAsdnm5bQwJ4qJ5tKF9FcG51CBOkCN59B7LR1fSY7Y80+suKvrSGDniDSjeF1UcE+da3ILXMxPdfIjP7a7wtZm3GT4cIW5GUdSD55DllsXJfOL2sSyPRVCrGI+0hs6qHV0W1jO5ziGNrGOpRLm/7V8BD/fGaIw7u0gehWmlsMDtx1FoezVhZMj7p5kMDlmDWhGNv312DtFlJNkSJO292V278n/+ho7p1rq9QC+qygveCWGphZN5ymDOIE4H5F2XBoxs7LPh+IemOwC9wwsBxGt2df6JvtVHMM+qjoUIW84OGjQi8BmDU8d0bnGiV4+mQssRslvXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(110136005)(71200400001)(54906003)(316002)(52536014)(55016002)(7696005)(66476007)(66556008)(4326008)(66946007)(83380400001)(5660300002)(86362001)(64756008)(66446008)(38100700002)(6506007)(33656002)(66574015)(26005)(8796002)(8676002)(8936002)(122000001)(2906002)(9686003)(76116006)(186003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?17z6xn1inBOs2EJsSIhdztq45oDQex/Ui0A5xPU7u6QUxsKkx6dpIN1NSF?=
 =?iso-8859-1?Q?0IxE5jwPc+3hyDw+89L8OJo8ro9Mf4TxKYSXgXE8HecNRvvjFTEusoNsyx?=
 =?iso-8859-1?Q?GnLlIks0jiaCujAXc7TUwvjmKCFs5/czbhXzQ7OwbkrQ1Af6WR+qNNZNHn?=
 =?iso-8859-1?Q?iD0iRp0qV5Gil4zo9iH3NSSXWb5YtyW++QWwvy9NSJatbAHRNFv+YXpLhB?=
 =?iso-8859-1?Q?DqvwP4x3rBSCfgK2hWAs0m3yioyyZQryA248iBQkedRNKF/57tukdggVep?=
 =?iso-8859-1?Q?4IjLlDQKywQtRA3J6M92fFsZBaUcm1eps5Kk0bAS8KTAPAWnZerULuUirl?=
 =?iso-8859-1?Q?VUtNZPWySP+RP9xT7ZZZFiyUYVdRPX6Vxhprp/tXJfIlNXNdTwLa81w560?=
 =?iso-8859-1?Q?90VYGae5ZRpKf2oYr+b2UOP7V5vd/lMSFJKB9DPplyI0r5NnSVkRgdMnPB?=
 =?iso-8859-1?Q?YexrVliPycNQAr7c19STrGQnHi1aSDmnKHgQg67+hO+8MDH7B+DWHjIfuA?=
 =?iso-8859-1?Q?JKK/HIE8EVezMlcLLBcKEUHdrELt4tCc7qKrJlWr/tas4px+0NFRc5TI6V?=
 =?iso-8859-1?Q?TDPZNvstoj1Qc4YOjMqdccT9EEW7QpLxTDMrjYqVNCZtoAQf3IFaWuA//B?=
 =?iso-8859-1?Q?gxB2BrE7DqQgr4y7pllWL+3sK4o8TQFRrKGZwdSLXsav1i+PvR1pqUIm7e?=
 =?iso-8859-1?Q?n2eF8zgfwYedbc2MNUmTi9e4K7esOOSy1YephEqbwxC9YgV12VVCf8v59I?=
 =?iso-8859-1?Q?1fFkUiPs3fAPazhl8R2NXIk0Q6SVeza3aacJObUe8gfMe3Yc5h+VnXSlPO?=
 =?iso-8859-1?Q?32lSeIZeEjh79sMMTegy7SqATLZ7w/0Z3SeYhLRpVlq+l72HAFi0LM3skl?=
 =?iso-8859-1?Q?Bdf0ZcVmsNvfo7+Uxe2BNFvkYbmw7AEJ/ZXN0lCMLj1C5ZQARycuTsd299?=
 =?iso-8859-1?Q?99nxZAO9dQBQdyzDxD4HOtCaMX107tgWqyAGR44h50PuQsZsF4fnX3TXWq?=
 =?iso-8859-1?Q?VelFr2TWD8CMUqDQCjLUv/aVHXkfEGAfheEQl3YADLOJMxw8tqnq+PASCp?=
 =?iso-8859-1?Q?OnT7091eWi1LNrBIweTfHdF3by+Vz4yEmsf474IIZAhkGP4WC0uXOn3Bmc?=
 =?iso-8859-1?Q?Z5h5xQuuZVAPmTJ+rkMKnfOe9rDJCc8YEPzwDB3De0NMKQLTLgvvP2bMKY?=
 =?iso-8859-1?Q?cC7AAHRvj8wpawraTyakOoIO9rk3fIfwd8McT/dNi8WgFAVmaH7KCZUi0E?=
 =?iso-8859-1?Q?uljeKRrTgprCP+r4psruZ5ckAaF/9XRCzko416woRM6Vc4Z1IqWhsEL5uT?=
 =?iso-8859-1?Q?6X6UjE26KWXijvTrt7FfP1g819YWnbi7kBdaktcJXQEb4mmltsZ29RT4vi?=
 =?iso-8859-1?Q?/jRCssH7S8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b354fcf-fa0f-4b19-6244-08d9453fa15a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 14:16:24.0563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOMg8SuXKOmx20PIjXNW+kjZFbMYdnnFLMFwkBDRUxX7zvtgVvOFhvYxO977d2a55euo+nQzX85wa/MO6wwyXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5620
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
