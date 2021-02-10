Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413BE316378
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 11:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70326E1BE;
	Wed, 10 Feb 2021 10:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BA86E1BE;
 Wed, 10 Feb 2021 10:16:19 +0000 (UTC)
IronPort-SDR: XA1VhAYH4ED15OMdnGFFuyS6UeZh2Xxjq0lfQSkwB93rqKXizX21wLPJKa3d+9T2jFPps15Eas
 sZfEZCOjn2XA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="179490834"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="179490834"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 02:16:19 -0800
IronPort-SDR: VQT0qvvm571fIofvlR/bP7wu9YB6Nk668M/nWpRC6Gw6bSWjFQPNRS7fLuqq1r7DdK1nUQx/Ml
 4n7+RmZhbeWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="578370037"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 10 Feb 2021 02:16:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Feb 2021 02:16:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 10 Feb 2021 02:16:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 10 Feb 2021 02:16:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTK/RKDh8p2jZ2XdF50IDHl0V3MS0a5QQDbZgoB3bC6smAGWQpTKr0Dsyr46AxZ7uMDvAkhyGqm//s/YW6k4u2jmVzSjf4ZGXVYCBW+xIjY+T57SgEydhaxmdRhwpltapw6Thne0osiAbJx8c833EqeZ56sgj2GH0Zlh9m+nHxEVrAaOfn6zifWCPaxz7pF3HOtK/Cab+PDhjT4phJOUuFXIVOGKOPbN71auQxDwdnKS7LpGoGg4ikiZZbQq4iPgWTB4nIq77ylMg60WhFI6ULbEkjbIXmJ+uEEq/j2rsvNG0TBfLDNCKCPNDnys+ZzOzvXbrUmk/vGWP5w2xk7RIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2YbYIY6sbAwMOpssbBKZ7kw2HzEg/6VwD5gkxC8MLw=;
 b=V3PDqebFXjxYY5BSMN91EIjnIS2RgEWQAFjES4i47mmZ+3jQgBXNOwvP89qKyIRprHDDDuei8zGt25KQo0arGREDUR5RA0Bf677595HYa3IYyGNN1ZlVyuUW4eL7i3fXTT4Mr9rP2m9omLjjy9j2TrlN8+xGoKJ//gkYEkCtKoMRE4n1T4BJHYqoQtoBGFQaWmrU97/biVCUxvECQ/e/oJJQJHC1hbMuUcBz7Yr7jQ6ig5bug25NAKvr3wyMc6zFG0ZvQt6aGmbXPKF4Ix2S8U+FrQkG5aTg/jkc+MzcIf1U/BRyVNJ0tFNvd/3KXZFDbQtkq5oEP5k6x/RljKcmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2YbYIY6sbAwMOpssbBKZ7kw2HzEg/6VwD5gkxC8MLw=;
 b=g6/zgWIBQ9VVGOVX1HTfN8QHGOcqUJOwhxBzkhDZRElChtq+/vG9h7TnKSuL+qCR4LdBQqLzkkil02dbHOB2RgHDn41cD9zm54qo8l/wjtqwJRhnXTw+trvwBtWs6lA7pHnOkRqwRoEcMzq346jdJ1nTPYY7umyGSYZRgnFEMvw=
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29; Wed, 10 Feb
 2021 10:16:16 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::94eb:c915:5a57:e7bc]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::94eb:c915:5a57:e7bc%6]) with mapi id 15.20.3846.026; Wed, 10 Feb 2021
 10:16:16 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable
 by display drivers.
Thread-Topic: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable
 by display drivers.
Thread-Index: AQHW/4cpKxF7JQIDHUqjHvmYD8/ADqpRFfUAgAAWhwA=
Date: Wed, 10 Feb 2021 10:16:15 +0000
Message-ID: <a24dffd636a8999fd2eeedb04ceb813906d711e3.camel@intel.com>
References: <20210210083338.100068-1-khaled.almahallawy@intel.com>
 <9c290abd-7770-e386-76a4-c821ab33752b@suse.de>
In-Reply-To: <9c290abd-7770-e386-76a4-c821ab33752b@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb14ea83-acd8-4a00-8dab-08d8cdace6a9
x-ms-traffictypediagnostic: MW3PR11MB4553:
x-microsoft-antispam-prvs: <MW3PR11MB45539E36C6EFDB2B9E2CB91A898D9@MW3PR11MB4553.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IDEdK5M4m5MV1/0JraQuHkkCXO8/Y9WO94doPsXL+dk+Rmyq9N/EfDXxj6crdoOkkYSFVOasaKmMazwW99dBR1PmRPt8aRJIUa/pnWq5huMwmNwo2nXtY+s3zo/PTIt/2FmIfNUjFcQFNwJyocy1ogHmVAojXjkKB8PAHw9qgWKd8z4vU6dNa12yIZ/RWXWmbcFSIyE6Xy58SFd3WZuoL6nUetsHVLrL3M0xo9IoY6uA6tCT8n2w1GC9HMEPKVc6hVi2u1VFI6dle9++8ifacXXuy/119Z3Im+p2CN4OHAYagSNkeCfQZfe+RYJqXYtlhTiAbu9jj1r+5hYgDm5XlW5tnKfNlNFMDdB2bIgXLBgqfvrKzTwhQgxAQIW1aJ46mCdqMgFUWHTmKCqPrqpspOORCQLAqGrriFcPTviAxczlMCdElLbMxR9dHcmCIT0LxxFmX3PQcvmru+PIma6Jwi4SokjRS/mxsT3Vw4+csZMKdm4BvZvVnKncD8WWc1fg136eVGoGvtuX7eJTmLo6iQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(316002)(6486002)(2906002)(66476007)(71200400001)(6506007)(6512007)(478600001)(66446008)(66946007)(86362001)(83380400001)(8676002)(110136005)(26005)(2616005)(36756003)(66556008)(4326008)(8936002)(76116006)(64756008)(5660300002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z1Ewd3pqZSt0YW5VellVNktyaWdvMUpBK3JobDU2Ujh4MlY0aXlmU3VEV1FJ?=
 =?utf-8?B?UWZ5c2pBMGZ3YkhZUVEvOGlzTWYybloxZUh2c1FaTEgrOHF1VnFOU2N6d0VM?=
 =?utf-8?B?UmVuYzlTeXFKSW05UnVGbDVxYnVaT0hWSVhRVTZXTmVNVzdudStGVm5lRkVG?=
 =?utf-8?B?Mk03Z09BK0poUXdmK21qcHlRczRGTktjc0NCSlV5OHB6SDg2WkZYYnNKc3g5?=
 =?utf-8?B?S2RNNXh5NWlyWlhTT0VpTWNhU3NObGkyeVd4NmczUzB5aFY4cTQ3WFBoVUk3?=
 =?utf-8?B?ZlJnL3dKNlplRzBKTDAwUFQ3ZHpoRDFYVmxqQUhFRlZTc3hINHFOVWpTK0Mx?=
 =?utf-8?B?Zlh4QThCT1IrMGx3TXdlbm10Q1lDWEphNWFoNGd0Mm53SlE2WE9lelhUcis2?=
 =?utf-8?B?VlhWVy9oeGM4NjhwMlk1Z1l6cXBCRURSeVEyNWRqQzdoa3M4MldTQUloS0hz?=
 =?utf-8?B?anZ3T1hRSWViWHZaeWRPRDRWRVluNW9aWjdHc1VQV0FjY0w5TEd0Q1dCN01N?=
 =?utf-8?B?VDhnTE5jNlpQdm1Yd25nZ0VOL0JVUGR0Rmg4TGhYODZxaE5uQmt5aGFCVWxw?=
 =?utf-8?B?ZWpBQlRvT0J1TEppQjV4SnUzRTNWZFQxeFRldlkxR0Z5WW1BVlRYa2JscDFR?=
 =?utf-8?B?VkFWKzR3cEtXWExRb1orTjdNcUtlLyt3Ui8yTnI1elRqaVJqWG53cnQrellB?=
 =?utf-8?B?WU9ZZlgwcFlXNHhJV3dMQWhTMFlndzRURyt6Tm9aRW9rTWxpeUVJTzRZRG9D?=
 =?utf-8?B?OXpnRG9WNG1zQ0dGdVdpaUJ5WFdhR3c3SGhlcWRLdXpVajlDUlE3cm5zRHRY?=
 =?utf-8?B?QXpwUGVPbkw0bmg2OGQrempxZ091VkJybmNqUWRDbjJWMVZ0WjhvRHY2cTNG?=
 =?utf-8?B?WDFHSituQjdDL3JId1ZLUGNRY1hZVXNjMitKZi81cE9BWXhwb09FZXFGRkYw?=
 =?utf-8?B?NllqeCsyelNwK0tqT1l0N0J1Q1Evc1dqeTJEaWJKSlJoWVVrcWZxZC8zblpD?=
 =?utf-8?B?T2RxZWNMY3R5U0VBSjE5WXhrZjNyKzB5OHhObGFUdElXNURNZ2dLb3FxVjNr?=
 =?utf-8?B?SHVSMTl6dDN1S0RobjZRcFV6VVRHcEpVUU5jZXhxNlpROGJNSklmSFlrSEVp?=
 =?utf-8?B?SnVxcHZXZ2RSVnF2dUt5RG1pVS9TVnZISGNXWkdsb1NWUlIwOFF1a0ZIZWg4?=
 =?utf-8?B?RXF5Mk5MMWp5RlIvb1BJNDVrMVl6Z0hRMnBXaFR6T2VYTFBWMTZNYTRzNmM5?=
 =?utf-8?B?MXhnWkE2VFM4bUZHektUYzR5WkhhdFdpcTJTS3h2UXdQWnRHYWRuN25WN3RT?=
 =?utf-8?B?TGNLSk00MG5VM0wxQTdzM0hSRlE1QmJybzlDR1ZpUmk0MTh6WW5QQ3BTNXpQ?=
 =?utf-8?B?WnN1VURrb25pQ2hYZmQ3RXZJRUtZcUlVdHZYUkhEUERsWUZPSk9JMjgwa3lr?=
 =?utf-8?B?Nlowanl4ZWVQdzd0eHJiV1d5aHpBeGdKemlIclZjN1pibmIrcHpQN2d4VnMy?=
 =?utf-8?B?UkFyKzFlbElMb0ttQy9ZN2cyamZNT3VBNWtObUxYN3VOQU92UlViL1I5Zi9h?=
 =?utf-8?B?VGJsalNjQVdEOFVDV291bmpVMHVHTVhON3BYVDQrR3pXWWJFbDl4Q0dEcCt3?=
 =?utf-8?B?dnJRQ2tBc3pVaUFTSXh1MnNKWlVZLzFDcWRRT3pUTE9tQ21Gd1lqQ1FSVlBS?=
 =?utf-8?B?amJmTGIzUitreU53eksxSGI3QkZkRlJRSjdwcEx2Z2JMdlg1Y3BzSmVmUHZ4?=
 =?utf-8?B?eSt5YnVJNjZEeEZrUXFsYjlUY0htVFQ5LzEzd2YrQWc0S2xWc3Z6R1Z5dWtC?=
 =?utf-8?B?MXNzYXhBWFpYNndWUzJadz09?=
x-ms-exchange-transport-forked: True
Content-ID: <85DEC8E77FA8B14F8C9C6EA0CCB46846@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb14ea83-acd8-4a00-8dab-08d8cdace6a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 10:16:15.9322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1wkHxUpm328wKJTEjNo+8XP7OqNUNfRh4mhQA4dCgGoETtmP6fjctD9yl+B3ot9niWbT3fgKeV8OsnKN9XB0r29wmfcpTIfo/eAwk+tg8rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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
Cc: "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-02-10 at 09:55 +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.02.21 um 09:33 schrieb Khaled Almahallawy:
> > The number of AUX retries specified in the DP specs is 7.
> > Currently, to make Dell 4k monitors happier, the number of retries
> > are 32.
> > i915 also retries 5 times (intel_dp_aux_xfer) which means in the
> > case of AUX timeout we actually retries 32 * 5 = 160 times.
> > 
> > So making the number of aux retires a variable to allow for fine
> > tuning and optimization of aux timing.
> > 
> > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > ---
> >   drivers/gpu/drm/drm_dp_helper.c | 10 +++-------
> >   include/drm/drm_dp_helper.h     |  1 +
> >   2 files changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index eedbb48815b7..8fdf57b4a06c 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -249,13 +249,7 @@ static int drm_dp_dpcd_access(struct
> > drm_dp_aux *aux, u8 request,
> >   
> >   	mutex_lock(&aux->hw_mutex);
> >   
> > -	/*
> > -	 * The specification doesn't give any recommendation on how
> > often to
> > -	 * retry native transactions. We used to retry 7 times like for
> > -	 * aux i2c transactions but real world devices this wasn't
> > -	 * sufficient, bump to 32 which makes Dell 4k monitors happier.
> > -	 */
> > -	for (retry = 0; retry < 32; retry++) {
> > +	for (retry = 0; retry < aux->num_retries; retry++) {
> >   		if (ret != 0 && ret != -ETIMEDOUT) {
> >   			usleep_range(AUX_RETRY_INTERVAL,
> >   				     AUX_RETRY_INTERVAL + 100);
> > @@ -1744,6 +1738,8 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
> >   	aux->ddc.retries = 3;
> >   
> >   	aux->ddc.lock_ops = &drm_dp_i2c_lock_ops;
> > +	/*Still making the Dell 4k monitors happier*/
> 
> The original comment was helpful; this one isn't.

Noted and I apologize for the comment. Was just copy/past original
comment. 
> 

> Besides that, what problem does this patchset address? Too much
> probing? 

The problem mainly with disconnect. When disconnecting, AUX read will
fail because of timing out. The 32 retries cause the disconnect flow
especially for Type-C/TBT Docks with MST hubs taking a long time.
Just trying to reduce this disconnect time. In addition as I noted,
i915 does retry in addition to retries by this function. 

Currently this function retry for 4 AUX situations:
AUX_NAK, AUX_DEFER, I/O error reported by driver and AUX timeout.

> If I connect a Dell monitor to an Intel card, how often does it have
> to 
> probe?

I guess it depends on how you connect (direct, behind MST hub, behind DOCK with MST). But I believe the most time consuming is the disconnect flow. 

Thanks
Khaled
> 
> Best regards
> Thomas
> 
> > +	aux->num_retries = 32;
> >   }
> >   EXPORT_SYMBOL(drm_dp_aux_init);
> >   
> > diff --git a/include/drm/drm_dp_helper.h
> > b/include/drm/drm_dp_helper.h
> > index edffd1dcca3e..16cbfc8f5e66 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1876,6 +1876,7 @@ struct drm_dp_aux {
> >   	struct mutex hw_mutex;
> >   	struct work_struct crc_work;
> >   	u8 crc_count;
> > +	int num_retries;
> >   	ssize_t (*transfer)(struct drm_dp_aux *aux,
> >   			    struct drm_dp_aux_msg *msg);
> >   	/**
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
