Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D80D4FF90B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 16:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D6910FD1F;
	Wed, 13 Apr 2022 14:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348B010FD1F;
 Wed, 13 Apr 2022 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649860540; x=1681396540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OOnLqTLDkxCmgOTdNgsm1CzZ/iQdTAwWFJ0n3OcCG5A=;
 b=T6qtWsMY+8wX+4Ttz5/vjLDCMM+lLHQus3cAEWZdw/R2a+efWEIZtVn6
 hHQHjzLXNq7da9HJIN2vWfQtLSVn5yuxSTJwyYws3DyhI0eltIApIu0JC
 WQBC2lNE+8Zl6Q/l4Asnz2hGhkyCSv9uzJOXKebg34Bz9+cVM3bb6SaaS
 c1iyKhn/ecPQiPCFMl4r4RxIAEvgX8yZH+mff5DnGVlVxVK4V+ve8NxTT
 AwROM490a7mwnLMnIrdt/JPxLhLSOON4HUlnebFkuTYdmRwZ4dy8YUZ51
 orCCNKkrpgIptDlGsZuMdWB0MTeNwPQw5NOHcVNfaCtxy6JjWWBSrCnWw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="287710187"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="287710187"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 07:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="611904866"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2022 07:26:26 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 07:26:25 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 07:26:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 07:26:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 07:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxvQDulT6fmZts8bYJAI8j+n5ii/Bnh73yZ3BdSH4JkqgUxDQ+fjJBamKSmiAsVzN5jJZ3JoDBBemLrXdKP4dSVe5xFjG7crIg3hxXOHramzM4oafP4JuVPir2IFC06LctwW6hGxys7JjAJv9rhEOG6fJh9z5ODwtKy2IonHrgdTCYMExYDCYzzz7SVW8dK8/Eozepxw98FGgognRxrVTqM2rp9yYuSrbrwBut1+/FVZMa1xaBTVdLhUg1DIYtbmalWvXzAdadOjUUMjtxHqc2IMwQlTXy5rNZN6TQJmD6a6Jv+sgc1sNJNFjyPWDYc/Bfzanz77UBMC2TgmxrWSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOnLqTLDkxCmgOTdNgsm1CzZ/iQdTAwWFJ0n3OcCG5A=;
 b=Ud8hGJpqrDxO0ev75vj4TYoQItOMPIObAZWWcLXREvepy/MIB002VvsxYktUTbY3NRuB7mTQHOZOaxwmqjA7YLOlioXq1bQOHfo1RC174vQdnX2Kkwspcb9CFXktpfBcbMTycv/KWZM3BHtlw+XcfUZFVgLoACekHws88v2yrP+KxRhlgapRjvbJiRvSUMjDLmTFe7rdzYVyJlxFKmsLhGKJOZLNzXOK9QeLtF5WnvaGrAzlvIQfauo3hGbQdsDuH7dTWxEy+1w6UeKBCQwjtd/zIX8D5ChG7cQ5syuKfQitcx7aMo/X0AUcET3ETkaew3ItGj4NLexuUTf5tQmQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Wed, 13 Apr 2022 14:26:23 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 14:26:23 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
Thread-Topic: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
Thread-Index: AQHYTa57MrQvrkmHQUyclnfpNoW96Kzq1UoAgAAM1ICAAAtDgIAC3JIAgAASg4CAAAD9gIAADBUA
Date: Wed, 13 Apr 2022 14:26:23 +0000
Message-ID: <86ee8fcc-e021-bb9f-fda6-a8e85cb1d9b4@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-6-hch@lst.de> <20220411152508.GH2120790@nvidia.com>
 <87zgkrha7c.fsf@intel.com> <20220411165121.GA26801@lst.de>
 <877d7tgo33.fsf@intel.com> <e8cdc103-f683-0b73-70a7-807f6fee0280@intel.com>
 <20220413134307.GC368031@nvidia.com>
In-Reply-To: <20220413134307.GC368031@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9db205c6-d10f-441b-6d5e-08da1d599657
x-ms-traffictypediagnostic: CO1PR11MB4946:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB494659231E8085C675889DF9CAEC9@CO1PR11MB4946.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ITm4TH9abAWjHKZQNjoegOL7CvpJ+68PuRGfrZnrbrWHn0Ui9cZ6pEpexShVcCyItv8ar4m21iDnRqzcI/J4KQZu6UTWuB3oy+e/pOB5JmKQ5EJuZ2Y438/wj87K2pMfewrBs1NjLWMFGjGL+dR/1WHwUB3MsVdtShLVHkRRClIKn0pd/WipU1pa10VnRAV1Lfzpmzl4W7aGs5CUcU0MXDatrF+lgrZtd9EZenTWc7PZy+UayUjxbM37o622dFkub4zzNKS6xq4n2tUq0QTcuPg/Xdu3G7BgmfzZEmP/S+Y0PemfPlHIOcdKKBtEwNzyBJNSur+/6pdG+BoN1byu+E06YK5wv9727tQxGDnC9Ymj7urD6EdBYKXZQNCTbJCVN9+7grJO8uuewbQatrRM+vLmOAjabBh3GFgwMfzQP/tu4/a08jp/M+fPhjZHOAZwDgdkFx6RPhyTaOfcUo3LVuNrOTWaMe3Q0Ca304CI0qaUamMtyXutZb2uMPCUIzjHRT/p0j0ISvAHWLFc8lq+PnQhhdH3oVQz7rEEwc87n0B55MCUAvl83TP7tdquRyT2R//C6xA62U2KvufTjn/0IP3PhykQ2pMcQhKB6tvCvDioVzK+xRyRlzgsr8147BlfppMf56fSNipMKvToZpK6sWKDOBgp4P1HE7vUyPBqOdZyOIN54LoGwWWrjppU426G8djI+o7CvPHpu5Fl0q2Gow5mXoJpEnuLVlp/QRpMUZeGwfel7jlXAWtrnoDAIOep7WsR5cKfa9jjLFLSFdP3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(508600001)(31696002)(6486002)(2616005)(186003)(8936002)(6512007)(6506007)(122000001)(82960400001)(38100700002)(86362001)(53546011)(5660300002)(83380400001)(38070700005)(66556008)(66946007)(8676002)(76116006)(4326008)(31686004)(66476007)(316002)(64756008)(66446008)(71200400001)(54906003)(6916009)(36756003)(91956017)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?M6gYNyMFaK2OJK3EKWpYPwmxBFu/fFnl03UxX08gr/kzndg1sb9M975M?=
 =?Windows-1252?Q?5ZHBzzcVBQLkjQy5mqN+vh0mXj8EV0H4WKne8CIWyiMyG+Y7c6753n3M?=
 =?Windows-1252?Q?CJIVbWHAGP+hiu0M/+8sNs5fxJMLpoMoemt5JvHs4WGEZ/2Y36Kzor54?=
 =?Windows-1252?Q?QJY7DM0TCpasvPfGrP7f1KR+kuN6nN1Eg0vLMmjKBtE7x+DvXPbgwlz1?=
 =?Windows-1252?Q?E25QUZTg6cKh1eywUPSVKvrguwMF+4kRMkKHUK0ijf70cxWOK4dpslrL?=
 =?Windows-1252?Q?loKzcVf72301pu3/ZoK/OuCSMj0VH3KrtRA79gDFsCICaLGjXOtNCpEM?=
 =?Windows-1252?Q?20jQoTDL3haWGKr41suCKbu8rJ/cmVHo19ksnSGFgNbUIs2LIwE7vbGS?=
 =?Windows-1252?Q?3oMGSuVBw4S5fTt0eh40Z69lHLubLy8FvKbRNB4yEk+Hk3/PhtOzcSpM?=
 =?Windows-1252?Q?qFGjEGnEhGL42kvRfTOz7rYOfQQbDgcLuknIxsiH8LxATPiMG8bPSisD?=
 =?Windows-1252?Q?r2vr5xtxFroNfzEmULdLAuTolGIDS9SPd3OhI4nQQdKMYtoP9QHT34qw?=
 =?Windows-1252?Q?pFxWyiloMbwPu4gVpV8XjV6TnTHI+kCWYVf3PLUb75tKKJgEX7RjTAsH?=
 =?Windows-1252?Q?i4ZaMSyKfokig2SUbsO3XP0Y3LWXXBmkru5/s4it1TvIyGMbeZLxVKdD?=
 =?Windows-1252?Q?JuzqYT5zIQo20xGOzUAagWu53BOGi/XtabnricJqIhH6Q4xt8TSYP0GA?=
 =?Windows-1252?Q?E/3OqVI0OHIIrkI70H6ANrKDRzkMygSJnbCvHvkkKJUSsGb8P4VXuVC+?=
 =?Windows-1252?Q?TFBUwkktG2/f9QftDw+TEm9PXDg9APAdwTZCdoYo0zT03tvnoJcfreLK?=
 =?Windows-1252?Q?CJRpi6Ood1G06EBeTDpCgHCVo7iRG86mmZl/3Yl0c26Z629rMy3eYdh3?=
 =?Windows-1252?Q?Zw8mPX0c99VyVUFXArvL8kr9C4EM0nSEPZalWME6T7CHJ/JI6Vb+geps?=
 =?Windows-1252?Q?szHISzgKwkH249RqF+RwxQm9hRlGVviqeMpNq1nR4vd5pCJY6O5vlxGh?=
 =?Windows-1252?Q?TTNjQ6EdUOlWG5TeTF6yRnHYqnsJCSszfnVy+BkD3aZO3oLx+/CpHkm+?=
 =?Windows-1252?Q?BDI8kt9xX5YCGMPqgJ846/I5/FqDEgrrW+ZU+Y1QhDrcOXzZQMNuKt6e?=
 =?Windows-1252?Q?/tXIKcx9zQ4BM2qWVfzymHh5fhrVJo3x8tSS8e3V1LY4+BjwEtnyAj8N?=
 =?Windows-1252?Q?jeBt7C9ljO99JGCqKl1Z1OR8FQMdni6GCafD7Znetcp3krRIKwqw3b/h?=
 =?Windows-1252?Q?ejZRYZNcMIam0jKpRDzr2ZGGfssBy5WiK6tjV9xDBSWeU9H6S5xCHfky?=
 =?Windows-1252?Q?UIwCM40DMNqrQQfVq/LWtlaKWAMhfbLt8AGNvDPfGJENmvP1cE2wt5AL?=
 =?Windows-1252?Q?NE/sXcdMpYGJujhAWgQPc0Bf8E8U0Yh0nPIwNWtHLZFBQR5/fARWKJGJ?=
 =?Windows-1252?Q?X3CCEF3M9RpvQ6sKW1kZmxKdujVUpqrH7BrxaKyKgSQd0PonQuZqARD8?=
 =?Windows-1252?Q?2FmhkYDYQr/ibXMIfxUeoB/7R2Q4WRFV0LPOuCNC7X/u+soW+iryfISP?=
 =?Windows-1252?Q?kyOk581M51u4+jg6X2a8/uU+6mXQnTQt1nwJCLj/Pbi3T+QdXQKUVQla?=
 =?Windows-1252?Q?Fwud0togDn73bWBUeCGBfLSTRCIHk/M+D1T4UVUiLervmqk5lhB887Ld?=
 =?Windows-1252?Q?sGKwZGpv4TWMrUMXoL3KmTgOWGoMNbF0bHHEgpKQIzsGoGZnSTZ0OhsJ?=
 =?Windows-1252?Q?GxipBEQsHyFqRQ8r33fZcEWkgk0ln1zs5iDq+YfNZXyv7FDOBhvjEImZ?=
 =?Windows-1252?Q?0DJi2bZOeCzSTw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <0FAF46D230F6AC4FB5A1C739A69CDB09@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db205c6-d10f-441b-6d5e-08da1d599657
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 14:26:23.6859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EiZIQq10DZSldmPlukn2wtx8HcVNRW+C8eb5a6Bg4wAWASnUbUzfyqgTTQGzQSC9L92N8W6rtZPiSmqQmNdGDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 1:43 PM, Jason Gunthorpe wrote:
> On Wed, Apr 13, 2022 at 01:39:35PM +0000, Wang, Zhi A wrote:
>=20
>> It seems Jani's makefile clean patch has already included this one, I ca=
n
>> just simply drop this one so that Christoph won't need to re-send everyt=
hing.
>>
>> For the branch to move on, I am merging the patches and will re-generate=
 the
>> gvt-staging branch, which combines the newest drm-tip vfio-upstream and =
other
>> gvt branches.
>>
>> If you are in a rush of re-basing the patches of non-GVT-g stuff, you ca=
n use
>> gvt-staging branch until my pull request landed in drm-intel-next.
>>
>> Also our QA will test gvt-staging-branch before the pull request. I supp=
ose
>> it will take one or two days.
>=20
> When you are wrangling the branches it would be great if Christoph's
> series and it's minimal dependencies could be on a single branch that
> could reasonably be pulled to the VFIO tree too, thanks
>=20
> Jason
>=20

Hi Jason:

I am thinking about the process of merging process. Here are the dependence=
:

1) My patches depend on one patch in drm-intel/drm-intel-next. So it has to
go through drm.
My patches of GVT-g will go through drm-intel-next -> drm -> upstream.=20

2) Christoph's patches depends on my patches, but part of them are for VFIO=
.

a. If they are fully going through VFIO repo, they might have to wait my
patches to get landed first.

b. If only the GVT-g parts goes through GVT repo, and rest of them goes
through VFIO, the rest part still needs to wait.

What would be a better process?

Thanks,
Zhi.
