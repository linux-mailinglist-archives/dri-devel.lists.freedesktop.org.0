Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6B5AF1F7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5B410E700;
	Tue,  6 Sep 2022 17:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27EB10E0C3;
 Tue,  6 Sep 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662484218; x=1694020218;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ebFGUSRCebH3mHzS76tt78YkqnbNP3OSSkbVcYrGzTo=;
 b=GDnS3YxWDGdunk4+S96i9bMncYtbiL0QsND4P4CqUOXKbnL94Y/whf92
 DtP8P2FXIO7nlstoXD8uz6cSKUSdaAeY5RpfmlAEXvFcwIF6WmTZ8SfXl
 qs+THHceWWQXA+txPV1Az62rjMUXR6rvBzqjrMqPderogUCwHXM3S8a4q
 OREjB77FzkTcyEOlSexwZxzYp3u4TvnWxFAACXiwmERRaMYdzVIwBQyXd
 z6GGapaStsGsGlfKqV8NNNiaI+Kmh5B0koOJYPmv5zB3TwWONzXyQkYki
 BRQkJZtESvk5dj+ljrhRYmy2Jpd00/rkPZJ9asNYqsG3JKcZMSW1rPq1E Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="358369293"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="358369293"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 10:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="675783459"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 06 Sep 2022 10:10:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 10:10:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 10:10:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 10:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STXdqvFCVwUP7Fye6m3wThLgeHi4Egd1SxKjx558zAviHp805tFMGWWoCc+WaXN84ITU0V+vIfkE2J79yKx5EoCfE1iqpdipKMB7RFRAxV8qHTtj00JWsjScqmWKfjaX7m0OHtGMQUBPukV3SNJ7kh2gzf4OuIfpLLg/59WmE4rYO7qjoaL2MA2sKPXCJEvgrekoZ6AmIU9OOGwpPF21X3dbsDEH2SguvWsIAyT8U6eQ5/9UlNNH1HkBk/9lh0+F8FCcfAi1ShX68snxOfzyUO/08J0tLH6d0gJdHXxJQUpjuK6eNaSjvArhkkACOex17+CL8iv3ODSjdCqN/CqnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geeN5nZYwxK84LlDnEfhPkRMoATXzC1wimWu3oRmfok=;
 b=KBpi8jGWHLIPa3T2dQBspj+PXlGP3J0N2ZY6H76X2OVkbETXftqDuZy2Vy5mZ9p9J/hjUD73BTacRhCoEqYDA//a4VaKqUO/u9I3suhxnzF3fGFZEMdt4kVEPYgSr744LgmETS/DGDQmVU8shUFLMLH4jUXelu8C3N/QRC7vVyTVIcmTxojW2lYEjK8n1zEc7U50kCDgLChgOquNDeUuIJIRunMRSUXEZQeaDpSKXaGCj0BgUvUtiz38+u5CrhIdFKb6Nnq0JSiqOstRdQBPKpCr1IUfHepAawwkCbYkb2bhBmvr3e1sXaix/froRhKUBJzsDTMSL1nQenhVq6djLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 CH0PR11MB5458.namprd11.prod.outlook.com (2603:10b6:610:d1::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Tue, 6 Sep 2022 17:10:15 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756%3]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 17:10:15 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend, resume}
Thread-Topic: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend, resume}
Thread-Index: AQHYvySGA+xYIMn3Ok2452RCUsf/pq3SbV/QgAA684CAAAA/4A==
Date: Tue, 6 Sep 2022 17:10:15 +0000
Message-ID: <DM5PR11MB1324588232E0BE714F8D8323C17E9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
 <20220902233257.3088492-2-matthew.d.roper@intel.com>
 <DM5PR11MB13245A45A7277B9548CADFB5C17E9@DM5PR11MB1324.namprd11.prod.outlook.com>
 <Yxd+lQRGriwsyJjX@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <Yxd+lQRGriwsyJjX@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a99fd237-d0bc-4add-6ae1-08da902aaade
x-ms-traffictypediagnostic: CH0PR11MB5458:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /mlrGfqa4K/rPJfuX4IAPp1GIOrHNZ509GkrmGH6AV4+1bPmUiTYJtxcDPR2BQVmekA8C4yXTlTAUHUzLXxzyYNKLwjKoA2HJBk1t3sL6Ow4vYfg7qDgAXLkJRK3rfqlhkU5kFg/SDCV8agqZRZMcRb2wEn9e2gUJCcjrVUO01p2wwk8/V1XJRxV5C0hHXrdJUvxA2JLqh1fhJjbPvbHFAu26h+MXbP4+5IqPeNn2rD+x8vKI4hhWum15W6EyTTreLfVtwhS2bVd9nLcsJhhywVognwXpvk2iAq6FhGSBuGZzBBrjp6MHs7xuXFoDOUP8qkFYAjP1HKm9u79NLwh/QFpJe6U8Yy/FK15NhH9zE4G+V571HdKWMpnvUmEVYaMS7EcGjmrleCCzRZVFqiKa3aCeFN3CCbQ5SkyVHmxNaUYanMiPPRzxohblTFc0b8t9MasMSd9dFBsccNqE1ObdcOoT/32qrjDfUgC5tzyuhBe3ZBAmincd91mfzb2fXaFAm8lbrWsasgP6YXewy9xExGEi/Bhvqedl2un/Y8oMsZ1xUMRSDa7dPw4LgBf+oZXWUCqCKyvqnWdWw9eIAr/cLMMVDTjj/Qpwyzsd0C0AHEZb2V0yMte6lXJe4wsmHHV5R7vQrXziK8ruprO/oAt35OKYf1JjFIb9r+ke+LInnKkFeAGHT6Ju+d0A7WTyI7WB7hcx9bTDI3V6X9nxPy/eCLA61eOfuAJdpZI5cFDRSx4pW1uo0r7zbTd/FjXPsXLOmwUipK2A1yr8hqeqAEnTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(346002)(136003)(366004)(33656002)(38100700002)(83380400001)(5660300002)(122000001)(41300700001)(6506007)(186003)(26005)(7696005)(107886003)(86362001)(54906003)(4326008)(66446008)(71200400001)(55016003)(450100002)(66556008)(478600001)(76116006)(316002)(64756008)(66946007)(6636002)(82960400001)(9686003)(2906002)(66476007)(38070700005)(8936002)(8676002)(52536014)(6862004)(15650500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9W08twY2Yz5jsqFM75YeHh+/I4od+QqhObs3M+S6EITSJUOZZTUXwOaF8ve/?=
 =?us-ascii?Q?Ko3OL5svlhYXcPZsM6rJeKRXabMNvrBlC3MdL3UVz+8+SNiDAFz5Rc3GjHUp?=
 =?us-ascii?Q?i70Jl57tolpcwqspi7/e9zF8cSzdrcydDsNPIMjurnk8tfkEVSlFQDlO0swv?=
 =?us-ascii?Q?OqqtibOP/mzK4u/8nxoKj4+ZAzqZWxC0wJJtMc+WTupG5Gk4iyJINFVcnfWs?=
 =?us-ascii?Q?i/6xUXeRuK9mLE6OBJvFDJrq2kPYsF2/CfIWKVGSki2ZAFXDFcMJNjq9q33A?=
 =?us-ascii?Q?SBvmVTTbj9hWl2hmVgssJOPMZ7GR4Iwdq2JkbVoowe/MyidoaGujpJo2MUqQ?=
 =?us-ascii?Q?GfjRT40g6V1zm/hL5m/3qyRDn77Pj84up1HkjL7IcgTiAwMjsMbiuF0vKwsU?=
 =?us-ascii?Q?n0SkNqTg9UqEovdwxvR8NUxKiIagw3/++09VFJGKV1mN9+a3LWBQb8fpLK8q?=
 =?us-ascii?Q?Dv+sKoJECg8j6czRNYY/e5PvoU9l8Hr2cvRF6/y/TLZEouv+TQGTGVePJMLA?=
 =?us-ascii?Q?IEN/DPGwHVKU+bcLpGHBbCBmd2xzAkkPAzN6oyChSVsiiMSnX7TFq/ZO4nzW?=
 =?us-ascii?Q?9h1e+Woj/ifAg2XirUJCd7p9WaHujH9Rvm2+8ee5FZ89LODNSx94LVD4fAQn?=
 =?us-ascii?Q?Cf7xNr45GknzW7aevYCpBNMt2jkIRnfFP1IbaZWYyJmx7OWAIHsPeh36o+3U?=
 =?us-ascii?Q?KA2Vt1AAdFHHEVmGsbMkgKxyg+l1N34Lk1+heco6LJfx6SrPtYXbX4gwe1WE?=
 =?us-ascii?Q?HZEafkbRSeXUr3NYwjaMZDv4Q9cBGlb5GuGbNrT0ODjpim2l00tXXE26XdQh?=
 =?us-ascii?Q?WhjMnZCnlwTTPMe0VKS+XUoZaJW7LlrCW69R8WG3I3Z3PAT0VRYEaqIeZ0Cx?=
 =?us-ascii?Q?+hCQ2wTYndsfbzKT4byH52BVmTym0Elj6UVFXCSmLDiD4SiEfNeQ//gwhNf5?=
 =?us-ascii?Q?t3PoaQMOfCwXFdSE0Z2gRZkiGxF++YwlE4FlX1a0P+sv7oLiyrzBCcG9rgGC?=
 =?us-ascii?Q?QnsnUZTC31z37TpPLdhNBDW/9SB6wasVDxdjiiIvrv652QclGOYqRXABJ1pD?=
 =?us-ascii?Q?iKWCofFXiawBXoEbdR1K22xPSaKAirvoMllOdOK1+BoKNYWvDa14aAvNGdgR?=
 =?us-ascii?Q?z4EmTPQYxNgMR5CxE0piTIGUP5K9dK3HXAL/Dj2C3sSyjnJRmidH5nuijStn?=
 =?us-ascii?Q?AwS9SMwVgVYVzH5iB3ZPZ/e/ZK3FxAcbXvun+nENKUSE7kx23Q1likiApxoB?=
 =?us-ascii?Q?PLA3cIe9Mh1EgMnTJ1wqLOuPhChOGhmfqhR+k2vRxzk5CYkkM4CSYeAjVedE?=
 =?us-ascii?Q?2na3GABl1F5UmUYSHNwcLYZUVbEih2HQR1pSxxloGBpznWUd2RmM3B2ozVjE?=
 =?us-ascii?Q?+uYNRi9A6wikZZxffakcftMGYSpaKWI7OAJCoFk4WWD67u1QSf95xN4dG1K/?=
 =?us-ascii?Q?D+anqwuJXCKAoLF1ZD4rqgT5v2bXqJ+Eq3nVR1cGh+zDCCS2hntSW7BoSPoa?=
 =?us-ascii?Q?a9vUvD8zKtOEpR6zDhVRQAx2vEbl8S475y2mOXY+ogkOr+/Ze4qFAw81Ph3J?=
 =?us-ascii?Q?4J19uX7e7e0lL2UueFkCeeoWaJvhIShkSqd79duV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99fd237-d0bc-4add-6ae1-08da902aaade
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 17:10:15.5919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5VnWJx6/g8k+cgnVJAKuA6q3N3P+ry1dCCr/fjjbq9VSQxTNyjwzhgqXiIa85w4q2KW9KecStksPKRTcxiEJfLCCBQ1YDY2CPjgLaTJrRU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5458
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sripada,
 Radhakrishna" <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Roper, Matthew D <matthew.d.roper@intel.com>
>Sent: Tuesday, September 6, 2022 1:09 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Srip=
ada,
>Radhakrishna <radhakrishna.sripada@intel.com>
>Subject: Re: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check
>into mmio_debug_{suspend, resume}
>
>On Tue, Sep 06, 2022 at 06:39:14AM -0700, Ruhl, Michael J wrote:
>> >-----Original Message-----
>> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> >Matt Roper
>> >Sent: Friday, September 2, 2022 7:33 PM
>> >To: intel-gfx@lists.freedesktop.org
>> >Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
>> ><radhakrishna.sripada@intel.com>
>> >Subject: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check
>into
>> >mmio_debug_{suspend, resume}
>> >
>> >Moving the locking for MMIO debug (and the final check for unclaimed
>> >accesses when resuming debug after a userspace-initiated forcewake) wil=
l
>> >make it simpler to completely skip MMIO debug handling on uncores that
>> >don't support it in future patches.
>> >
>> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> >Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> >---
>> > drivers/gpu/drm/i915/intel_uncore.c | 41 +++++++++++++++--------------
>> > 1 file changed, 21 insertions(+), 20 deletions(-)
>> >
>> >diff --git a/drivers/gpu/drm/i915/intel_uncore.c
>> >b/drivers/gpu/drm/i915/intel_uncore.c
>> >index 9b81b2543ce2..e717ea55484a 100644
>> >--- a/drivers/gpu/drm/i915/intel_uncore.c
>> >+++ b/drivers/gpu/drm/i915/intel_uncore.c
>> >@@ -50,23 +50,33 @@ intel_uncore_mmio_debug_init_early(struct
>> >intel_uncore_mmio_debug *mmio_debug)
>> > 	mmio_debug->unclaimed_mmio_check =3D 1;
>> > }
>> >
>> >-static void mmio_debug_suspend(struct intel_uncore_mmio_debug
>> >*mmio_debug)
>> >+static void mmio_debug_suspend(struct intel_uncore *uncore)
>>
>> /bike-shedding...
>>
>> It seems like there has been a tend to name functions with the
>>
>> _unlocked
>>
>> postfix when the lock is being taken within the function.
>>
>> Would this be a reasonable name update for these changes?
>
>I think foo_unlocked() naming is usually used when there's also a
>separate foo() that can be called if/when locks are already held (or
>sometimes it's foo() and foo_locked() if the situation is the other way
>around).  In this case we still only have one version of the function,
>and it's only called from a single place in the code
>(intel_uncore_forcewake_user_get) so I don't think the special naming is
>necessary.  It might actually add confusion here since there's a
>different lock (the general uncore lock) that is still held by the
>caller.  It's just the mmio_debug-specific lock that's been moved into
>the mmio-debug specific function here.

Got it.  That makes sense.

Thanks,

Mike

>
>Matt
>
>>
>> M
>>
>> > {
>> >-	lockdep_assert_held(&mmio_debug->lock);
>> >+	spin_lock(&uncore->debug->lock);
>> >
>> > 	/* Save and disable mmio debugging for the user bypass */
>> >-	if (!mmio_debug->suspend_count++) {
>> >-		mmio_debug->saved_mmio_check =3D mmio_debug-
>> >>unclaimed_mmio_check;
>> >-		mmio_debug->unclaimed_mmio_check =3D 0;
>> >+	if (!uncore->debug->suspend_count++) {
>> >+		uncore->debug->saved_mmio_check =3D uncore->debug-
>> >>unclaimed_mmio_check;
>> >+		uncore->debug->unclaimed_mmio_check =3D 0;
>> > 	}
>> >+
>> >+	spin_unlock(&uncore->debug->lock);
>> > }
>> >
>> >-static void mmio_debug_resume(struct intel_uncore_mmio_debug
>> >*mmio_debug)
>> >+static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
>> >+
>> >+static void mmio_debug_resume(struct intel_uncore *uncore)
>> > {
>> >-	lockdep_assert_held(&mmio_debug->lock);
>> >+	spin_lock(&uncore->debug->lock);
>> >+
>> >+	if (!--uncore->debug->suspend_count)
>> >+		uncore->debug->unclaimed_mmio_check =3D uncore->debug-
>> >>saved_mmio_check;
>> >
>> >-	if (!--mmio_debug->suspend_count)
>> >-		mmio_debug->unclaimed_mmio_check =3D mmio_debug-
>> >>saved_mmio_check;
>> >+	if (check_for_unclaimed_mmio(uncore))
>> >+		drm_info(&uncore->i915->drm,
>> >+			 "Invalid mmio detected during user access\n");
>> >+
>> >+	spin_unlock(&uncore->debug->lock);
>> > }
>> >
>> > static const char * const forcewake_domain_names[] =3D {
>> >@@ -677,9 +687,7 @@ void intel_uncore_forcewake_user_get(struct
>> >intel_uncore *uncore)
>> > 	spin_lock_irq(&uncore->lock);
>> > 	if (!uncore->user_forcewake_count++) {
>> > 		intel_uncore_forcewake_get__locked(uncore,
>> >FORCEWAKE_ALL);
>> >-		spin_lock(&uncore->debug->lock);
>> >-		mmio_debug_suspend(uncore->debug);
>> >-		spin_unlock(&uncore->debug->lock);
>> >+		mmio_debug_suspend(uncore);
>> > 	}
>> > 	spin_unlock_irq(&uncore->lock);
>> > }
>> >@@ -695,14 +703,7 @@ void intel_uncore_forcewake_user_put(struct
>> >intel_uncore *uncore)
>> > {
>> > 	spin_lock_irq(&uncore->lock);
>> > 	if (!--uncore->user_forcewake_count) {
>> >-		spin_lock(&uncore->debug->lock);
>> >-		mmio_debug_resume(uncore->debug);
>> >-
>> >-		if (check_for_unclaimed_mmio(uncore))
>> >-			drm_info(&uncore->i915->drm,
>> >-				 "Invalid mmio detected during user
>> >access\n");
>> >-		spin_unlock(&uncore->debug->lock);
>> >-
>> >+		mmio_debug_resume(uncore);
>> > 		intel_uncore_forcewake_put__locked(uncore,
>> >FORCEWAKE_ALL);
>> > 	}
>> > 	spin_unlock_irq(&uncore->lock);
>> >--
>> >2.37.2
>>
>
>--
>Matt Roper
>Graphics Software Engineer
>VTT-OSGC Platform Enablement
>Intel Corporation
