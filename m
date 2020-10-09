Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A009E288554
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D346E427;
	Fri,  9 Oct 2020 08:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96156E427;
 Fri,  9 Oct 2020 08:31:41 +0000 (UTC)
IronPort-SDR: WM+YLx1TrLh6pGUqbs1bIflrMGp/LYRlqUREOkHTaQQcbUkpOQOSopSKUJSOZfGkkVopi1x6NS
 d39RNs7Bfs/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="164669834"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="164669834"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 01:31:41 -0700
IronPort-SDR: /O2YsyOXYVIgK3Xdzl/tJjNgz76P/31GMWF7ljFNPceZM0Sp73XbwcNESb/eyjYzpciMuHTHPU
 fVUUXsuhDhtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="349763545"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2020 01:31:41 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 01:31:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 01:31:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 9 Oct 2020 01:31:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 9 Oct 2020 01:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJUPukHcZPiLH/E4SK2eW243GPC3rPZcqKfEbEcQ8p4J5fYjAYUu4zTYamzqtpgYKf7VtKL6hZS41gcIHf/6RCjpWmokfcGjVGbtYJKtE/S9o48ZVy5ajW/ADzOrfJ5jwirDK8vFuHwrh4bonCVhgcXCU/B3wVxfIQex0usxdwRkcS4Xqltpc8qxuB5kJ9optsECmjjzr8YRVze/ge4ryT4tWdYKULaImuvTutWDNkK+JI0OKFqEI+45mlifTrgyLtxwosF3iyohfZUadnyUik1V1DNmhp3Xn39ev9u0gt457uWgiFIYpAZ3v7S/Gie29fdJBncfLyqzbANCI4rkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2fR4cWzhEJacgsWtOGng9cD6A5QMioPqXN/fsoqq6g=;
 b=Q3oEnsmPcvcQqa3Q0rZXYhPPDpS0DbAzOcTSN+DTOpr2Rrz75nq3bgkqhpUCTQjAXU+I0nHppBli81rVeAFrRMMG59tnolc2jgB4a4Z15oosRh6HHN9tm3xtQab/P2TrdUC6bQLv+cBDHgC2qY94mMbftV5+Ou09AikTIuBBMKKTSUKjoo+we8qgFN1XD3WYCHLsRfXswDC++cW+2cUY6hoYAzy3VZIR5rs+k3ScFVWPA5nbhS7Uxa7CUuWEVNaSXP+zTSPKCCK6Zp5gIaV/F6sNp6ZlnvHM4oUNOoXhoJKnrguX5agn6n3H2t6nYU8jRaFrvtPZkGV2HJoI1SfWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2fR4cWzhEJacgsWtOGng9cD6A5QMioPqXN/fsoqq6g=;
 b=mnWoTJeWJ+KyAOJQKs0lUAGaRB+WPED2rwV7XWkhLkWPDhdyKniBQgaJvn+VrFKYTxxbYQI8QG2AkLFsdXwRtXW4hR2MP8qpLgyh8qkgz5VNcifG3PFILpv9RJQ2Zk63kbABP9LibuB08sEg+WpsZqmKkb6q5yyG8Rik/9d/pjc=
Received: from BYAPR11MB3014.namprd11.prod.outlook.com (2603:10b6:a03:91::17)
 by BYAPR11MB3847.namprd11.prod.outlook.com (2603:10b6:a03:b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 9 Oct
 2020 08:31:34 +0000
Received: from BYAPR11MB3014.namprd11.prod.outlook.com
 ([fe80::64d4:f49d:bb3a:689d]) by BYAPR11MB3014.namprd11.prod.outlook.com
 ([fe80::64d4:f49d:bb3a:689d%6]) with mapi id 15.20.3433.045; Fri, 9 Oct 2020
 08:31:34 +0000
From: "K, SrinivasX" <srinivasx.k@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/En69MkClzmQ0ObvZWAiNjahamK2W6AgAAAfICAAAIGAIAAAfcAgAQV2sA=
Date: Fri, 9 Oct 2020 08:31:34 +0000
Message-ID: <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
In-Reply-To: <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [49.205.250.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27e247e3-9dd9-42cd-ca31-08d86c2dbb72
x-ms-traffictypediagnostic: BYAPR11MB3847:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB38474BE51F2E16FBC607213CF9080@BYAPR11MB3847.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vC9A8lmaW56n5rR4aT2yCjEQjK0eWAUE14rzOPOns+fVXVjiUA9GcMjgBZB0sZQoTct6pxkM0HgrV3g7Oeq1apiTtKvmXT4gcdlgB8u1AsmoH8MtiudWoeHxEvEPzueE1+Rs81/9Q92fsIWwkMGX9MzRdNgyqCzFmutDBWUDNXxNRPkFMyUFiiFzIq+6uS1o30cyI4dORA4MGE6JSlfkegSx+7uuXRU1pXnb43a0y1V11OfgPIIpBnfxLx95c4h93ubVQPqwltKdkYDN4/Jy0+3VzLHW6Dqa0np3IT8pEGM2eqM+DgVwE9JqPuP2ukdPmaAYANQct32LVTNGkNYFC9m6KYH9GB/G0K+IUZ5pt+FjWaJv7Hm7YzWIvitpc+CMGOyVMJQVIcFvoqOjReVyKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(66446008)(53546011)(55016002)(86362001)(76116006)(52536014)(8936002)(66556008)(5660300002)(66946007)(64756008)(4326008)(66476007)(186003)(2906002)(83080400001)(26005)(7696005)(110136005)(83380400001)(8676002)(71200400001)(6506007)(478600001)(54906003)(966005)(316002)(9686003)(107886003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WYCpU5QAlXvopujSJsdutdQiP0dWfwP/eZdQHoKhF8kcKbnGI2yJwytLt5cRpKrJa7kBEPwc8AuraUC3FUAIcvY2u0Oj5nyF38oOT7K7d7wlrtLUv9cjr2Or1Gal4VsfzOh0YxqhQRANlUI0aFWpE3nA5XIfQnX5/D2Q8nhTxbYvHWPegI5Os0tCf9gmKgKyDi52rQVSMJrAdoUhzi5j/sKtkEM2oO/6AbSbqkYw3424TKyApkg5vdUk8xtgHjbG0vYTDe+LoiO8sSOUCRg2PZNSYpHUI2FmrnWGTx3C0S7L/k66+EY94AnKx1JPiLtUwaEY6V5nV4vC+zfSsPUzOYQZwlfyj8bWRhgupvkKDGOA44QXG706Ppy9Wyq+2be8UBq1GgJZQYPU2KamCnT6rjCAEWegaJyWwJIthlcF9VDPeBIT29fr4/P54dAoUwMyLACZtV4QtpnXOhBPr9OTOO8g+AP6ra1Qq8CVG0hs+R3uRzanzb6dvYWwW7bUNaroQiP8z9cSXbrlrcRo0GkiEMbyUOjy7S34RofO8TtfXSVNi+ZRuQmmGDInHIzeAMjGKNXqJMyiZxWWOipBL2NWKG8sgvaFagq102W72jF1DwTb/E2LbUf+NI6BOstwj9VeONRGMBzsj55+iSF++kqy6Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e247e3-9dd9-42cd-ca31-08d86c2dbb72
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 08:31:34.5166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6z9nZ4eVEctQ6tMtOdezd1yzkU9dD9eZPUSPSU7laiLlc9fl8POaZSALqgG7WO3hxZQaCPevp/MuK0/1Vamhcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3847
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

How do we get W/A and rc6 changes in, do you have any details? 

Thanks,
Srinivas

-----Original Message-----
From: Souza, Jose <jose.souza@intel.com> 
Sent: 06 October 2020 23:33
To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; chris@chris-wilson.co.uk
Cc: Ausmus, James <james.ausmus@intel.com>; Nikula, Jani <jani.nikula@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; K, SrinivasX <srinivasx.k@intel.com>; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe protection

On Tue, 2020-10-06 at 10:55 -0700, Vivi, Rodrigo wrote:
> 
> > On Oct 6, 2020, at 10:48 AM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > 
> > Quoting Souza, Jose (2020-10-06 18:46:45)
> > > +Rodrigo and Jani
> > > 
> > > On Tue, 2020-10-06 at 14:56 +0000, Kamati Srinivas wrote:
> > > > Removing force probe protection from EHL platform. Did not 
> > > > observe warnings, errors, flickering or any visual defects while 
> > > > doing ordinary tasks like browsing and editing documents in a 
> > > > two monitor setup.
> > > 
> > > One of the requirements was also to have CI BAT all green and 
> > > shards as green is possible but EHL don't show up in CI results, we actually have one single EHL machine in CI but I guess it is not able to run all tests that shards do:
> > > https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9097/filelist.html
> > 
> > https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html
> 
> we are really close to that point. We just need to fix some w/a and 
> rc6 issues before applying this change.
> 
> > -Chris
> 

Huum okay we have drm-tip results for EHL but if someone sends a patch that breaks EHL it will not be caught in pre-merge testing.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
