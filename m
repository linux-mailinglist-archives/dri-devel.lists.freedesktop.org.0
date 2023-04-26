Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B76EF7DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCA210E0F3;
	Wed, 26 Apr 2023 15:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08A710E0F3;
 Wed, 26 Apr 2023 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682523748; x=1714059748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=VwBLw5KgCznJbeZAd+z9Ut0NfDg7ooxKqrQmgdUDJQ4=;
 b=njMTqxSgnDP0OvfD7jmktLCVrdIU1UaOyNsaCuNmOugtrTCXxGFUazuw
 Y5B5yEQ7FF7mxOBPllqBKbRnjTXU3W1WySObJUU8XfdLUc1DkTU+S/83W
 Wc4CNjeyfXa6pNBCW1xFaYlzD6p7IfCngLhrNG87W9Jj1gYuw3r33eKvJ
 9UmpKucq/bF/DtVe8P/EgpzmvEBwUFjRd71D5DmUELLIwg4QggyxBOqcu
 8M8NN70borJ3PFHAV7pfBXpukNHr6gov02v5piqSJ4m+eAK7LCQyhrXv/
 75D77O3ypxsK/avW/kowZd98WYj5Ct7MTFxA7/dJVyosHiCRbwMG+4jqV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="347167540"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
 d="scan'208,217";a="347167540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 08:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868337950"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
 d="scan'208,217";a="868337950"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 08:41:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 08:41:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 08:41:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 08:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKp0p07xw1TnjeX7ZrUZ/uWwFeXSiZ64bAZ1PQBCAUod1y1AxAH9+Xj2gvcqj5FxlBEJXtc4HD+mJlm7x8fdXP7cbA6kfvZP/rSSEaEU9RPfIJuGWCN3eeK6XVsSZgl6tCBtrKU482zvbbGpE2kcKtm5vbZSTpnwETu5ZsAVfbMlhBY0zoIeLmeI3QQkMOc+wIM3TWj+eXVxETgc5hM/4+1KS731eHdTMom3rsuOSu28OyWdGJE6xtvlFf4EVo4lge2imMXzWmlEYwNrvlnnmKcP/1CA6M+UjLgbTTCrihlrUOFwCyOZe1furrmHoqmoUCVvJ8JSohz5VqFrWtrm2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LRX1wdZtrXlctEQrtKXpaIBLuyRkvOSoyvbxNE0WrA=;
 b=NWk49ciGaqkyk3iwucWlMJLqhN2zVvZtqCoD9tGNCJap8ec8ggLY1tMdMDzrsj/dP6iAf/lydElt+cK4ne/vAJ3h2Rf1jl3/jY0hJoAO5qJwLEfIJWxc8eRejImOYVE7zWWA1V1Hj8H6zfNL34UDi3j3kUdB4cdylu1BlmTOGUxwFIzCWpprYrPaMsbinlG17rHPtF6v7+ePgz4RkE4EY8WtXrVP8b56xLaB2G0+LpAWcctCC1cQtDQdgEXVCjpqr7nI0+dEcN+7dUgKHXNCnxPFLmmvSjphc8QLGeA1V5ZbXr8346JhlVIDTlf8UyAoBLcpsih7IyQxZ5CEqLhsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21; Wed, 26 Apr 2023 15:41:40 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 15:41:40 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 0/5] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v2 0/5] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZeAeZkZKypP7iykq5Xmf4cFmAea89ZlWAgABPazI=
Date: Wed, 26 Apr 2023 15:41:40 +0000
Message-ID: <BYAPR11MB2567F72C44D485E628A574069A659@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230426062423.320519-1-fei.yang@intel.com>
 <c7cb1466-e698-ff3f-0572-4693c4b0025c@linux.intel.com>
In-Reply-To: <c7cb1466-e698-ff3f-0572-4693c4b0025c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DM4PR11MB6264:EE_
x-ms-office365-filtering-correlation-id: b02af727-5740-43a2-9a18-08db466cba9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+80SVnWfZMgXzsKtOLHbqL0tnUSfUrcCAR15OzpiphAi2xZTCc5XRJXzS4K7ipvTL5waJTWjjNZLI0aT3WgreAkRv2PlUnp+Fi/Nbai84YJS9vXMwupinLkTHzgvdOkuv80Wozot1MNw0TRpsV4Sa6/j3R/+m9C+IxgpZ/Dp4QCwQhfYhH2K464dPZcNMpMCTA2eY3MqWDifMNn6Vs0/5kr+ZIMmsDhkgu8jY1BiUo9mm++iPG5vYQkH/IxfM4a5G1OptK4GcobSMg5lLje0He78XwsihU7YrlTvi9pJUl03rmICWkuywrASUTUCS3ULtlVNUvf4bN1WLAyGWgUMxCmcQvzw2sJjPbdhCs8gKlN97GTk3L24KgUhqXENImGp84kdjTIcgdA3Oiae3YpLlOrbexmYMYrpp+0oum/7o12jbRHoGRlQaKMAdT0Xj+ujke6/tN6VOXyz5DFnNNwnOHp/AdjAGC2p2BuSHAkL1N7fm2MfSemCLhQWok/uQOger1iqIAPkxiS0VB/o7u/CeyvvdfGG2n/ku03+GAobMNMbHsKnJp0jl8NfWF2vD+1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(54906003)(19627405001)(7696005)(71200400001)(966005)(86362001)(55016003)(4326008)(66946007)(66556008)(66446008)(64756008)(66476007)(110136005)(76116006)(9686003)(478600001)(186003)(26005)(6506007)(53546011)(316002)(122000001)(52536014)(82960400001)(5660300002)(41300700001)(38070700005)(8936002)(8676002)(38100700002)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uTF854rGAWsoPz27/YwEDCDMASCDrpZAxN2h/EPHi0m3LjENmMOZ94cHKz?=
 =?iso-8859-1?Q?klAVyRBnv3uoiHIz/KdWWABMT04sqboeu0JLF0F/3f2O7R1rzbf9/KcobO?=
 =?iso-8859-1?Q?5kidJtecSyyumW81mgZ/griDVbm5/699veOmhfU8fDPMJ40d4/GGEouG4k?=
 =?iso-8859-1?Q?MDsemAEIyn2hvf/Ii3iYxwA1Q4Ekjrme5gKHo3xSxyx6TESl/YfmS71zyB?=
 =?iso-8859-1?Q?THpRM2EZOhw7/mPm3ypc+creJW38V8FQd9Zvr/LcfOjR3T8LPyYdrw/3vm?=
 =?iso-8859-1?Q?rMDZlrNW2jx6YtsZOVP2gqJo0wT58nzYNOAQ42mcX3F7RDaJpJwdfBzPDJ?=
 =?iso-8859-1?Q?snN3rNqNhU1qDTqvlI4DdnHCz3CBogTaKoFBRZqVEafRV1KZQxMMrL3dwh?=
 =?iso-8859-1?Q?hAG5/i3CjsdyIigVeZSiti1ariVcm2lZy8GFrjqEdn7QjIpFE39/yUA+kG?=
 =?iso-8859-1?Q?RiMXwooMQnX97jK/z3HI1Npdws6qhhPDuy6dK9SavtIYTcan5KGtCtAUII?=
 =?iso-8859-1?Q?Wrqps9nQPUKBgerXEWki/tDFzr2D1y3ZUSOdxDDhjvs+RUezpC/kH7LzYu?=
 =?iso-8859-1?Q?duomgxkOEZu37rLQMX0lTJ7aPUz/kCnadzU33yOepifZKRLaXfh8X/iDWJ?=
 =?iso-8859-1?Q?A8YtEB7fxCmCO15nrSMzyqzk0mJu6JCHr8fEwi5/s2J12bo3RIddO6Dsj+?=
 =?iso-8859-1?Q?aJqbhQ4n20EW8Xyp0Gz24vTp4q4RBaAGAsMspOV2JtsoWCAqpzRyvi8/AL?=
 =?iso-8859-1?Q?LTPyghnuGP4Hhh2Cfh266LgZddYE8umHBfhy9ROUCp3MGR0SPnxJjeMeg+?=
 =?iso-8859-1?Q?lKff6gZS0yOPsoHBnUkAayc4p+EN/wcKED8s+GECOTcXd+8Ci4loDgB2qw?=
 =?iso-8859-1?Q?nXcNmvqxR+3PJMJagSYSIaNNU6yC3Exx2uX4Uf8PAYb2dLOKizCzGGDoVE?=
 =?iso-8859-1?Q?cujZbB5O+dh3DgA9YlBhwgib+Yr9sZXAPhGb5hUDJLCNEawucKu+g0n1op?=
 =?iso-8859-1?Q?wAVKZn+MOuPYgvqEnQmZ6MeRt95t7OvRDsRjBNvDZapR9PToujeDQTrJ1q?=
 =?iso-8859-1?Q?5LIJcnMSDX/9GIfcfFIQXnK6oHjXnuWuRT2lTRzLYcoNyQbHEqhOPKFKlj?=
 =?iso-8859-1?Q?NGa7ByGq97Tqkjt3gBe2N1ao2m/5tIa6eglqLVryGhY09fjjTGiYUj1P2O?=
 =?iso-8859-1?Q?SHZyTQVId5Qqo7zOKuu843836dOnusPGmSc2V8OivtziPfWLjaeVHmnpoT?=
 =?iso-8859-1?Q?HBlOfqEi3xWuSurwLeVpDxi/cp8RvGuB6SLVQbXt4BBhFbcP1wfdPhxHdz?=
 =?iso-8859-1?Q?KZeNmJLfnrXTr6kQ66Hqs69gQTxZmIo+NIIJYZLZ7tn8vSev96FBzvwItZ?=
 =?iso-8859-1?Q?Con8yu1zeb7aC1B1TCTJ5rsOiWEhlptJoYujSSHeKm4Q6AZaBjmcaBUOO4?=
 =?iso-8859-1?Q?Svzy2kcBk+S+x/fXN8wdo88g7qFnjV6fATm8hSvu1da5toq4IhC5atWXje?=
 =?iso-8859-1?Q?rTktVkSZ0P/78/iqqMrt/orD8lA/FM3z+Y5R88QNtbAxo8P8uEGCEceCeV?=
 =?iso-8859-1?Q?bkLx1KoakAKbMr+tnrFiTKQZ+QHBwz+8KFU0r+R/E+HQ/AetojXXhsD71T?=
 =?iso-8859-1?Q?f55WXFPRANMYA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567F72C44D485E628A574069A659BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02af727-5740-43a2-9a18-08db466cba9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 15:41:40.4180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRLXJrPFcQGKZTZj2ykHuXlukpvu82i1gURECXZNS0TdaKsZdwltlPSXkLW93LWJjX338oEkwVD8GaY9WvXbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567F72C44D485E628A574069A659BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 26/04/2023 07:24, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> The first three patches in this series are taken from
>> https://patchwork.freedesktop.org/series/116868/
>> These patches are included here because the last patch
>> has dependency on the pat_index refactor.
>>
>> This series is focusing on uAPI changes,
>> 1. end support for set caching ioctl [PATCH 4/5]
>> 2. add set_pat extension for gem_create [PATCH 5/5]
>>
>> v2: drop one patch that was merged separately
>>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
>
> Are the re-sends for stabilizing the series, or focusing on merge?

v2 was sent just to drop one of patches that has already been merged.

> If the latter then opens are:
>
> 1) Link to Mesa MR reviewed and ready to merge.
>
> 2) IGT reviewed.
>
> 3) I raised an open that get/set_caching should not "lie" but return an
> error if set pat extension has been used. I don't see a good reason not
> to do that.

I don't think it's "lying" to the userspace. the comparison is only valid
for objects created by KMD because only such object uses the pat_index
from the cachelevel_to_pat table.

> + Joonas on this one.
>
> 4) Refactoring as done is not very pretty and I proposed an idea for a
> nicer approach. Feasible or not, open for discussion.

Still digesting your proposal. but not sure how would you define things
like PAT_UC as that is platform dependent, not a constant.
- Fei

> At a push I can look past that and someone can attempt to tidy the
> driver later.
>
> But without 1-3 we cannot merge this.
>
> Regards,
>
> Tvrtko


--_000_BYAPR11MB2567F72C44D485E628A574069A659BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&gt; On 26/04/2023 07:24, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; The first three patches in this seri=
es are taken from</div>
<div class=3D"ContentPasted0">&gt;&gt; https://patchwork.freedesktop.org/se=
ries/116868/</div>
<div class=3D"ContentPasted0">&gt;&gt; These patches are included here beca=
use the last patch</div>
<div class=3D"ContentPasted0">&gt;&gt; has dependency on the pat_index refa=
ctor.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; This series is focusing on uAPI chan=
ges,</div>
<div class=3D"ContentPasted0">&gt;&gt; 1. end support for set caching ioctl=
 [PATCH 4/5]</div>
<div class=3D"ContentPasted0">&gt;&gt; 2. add set_pat extension for gem_cre=
ate [PATCH 5/5]</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; v2: drop one patch that was merged s=
eparately</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp;341ad0e8e254 drm=
/i915/mtl: Add PTE encode function</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Are the re-sends for stabilizing the ser=
ies, or focusing on merge?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">v2 was sent just to drop one of patches that =
has already been merged.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; If the latter then opens are:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; 1) Link to Mesa MR reviewed and ready to=
 merge.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; 2) IGT reviewed.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; 3) I raised an open that get/set_caching=
 should not &quot;lie&quot; but return an</div>
<div class=3D"ContentPasted0">&gt; error if set pat extension has been used=
. I don't see a good reason not</div>
<div class=3D"ContentPasted0">&gt; to do that.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I don't think it's &quot;lying&quot; to the u=
serspace. the comparison is only valid</div>
<div class=3D"ContentPasted0">for objects created by KMD because only such =
object uses the pat_index</div>
<div class=3D"ContentPasted0">from the cachelevel_to_pat table.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; + Joonas on this one.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; 4) Refactoring as done is not very prett=
y and I proposed an idea for a</div>
<div class=3D"ContentPasted0">&gt; nicer approach. Feasible or not, open fo=
r discussion.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Still digesting your proposal. but not sure h=
ow would you define things</div>
<div class=3D"ContentPasted0">like PAT_UC as that is platform dependent, no=
t a constant.</div>
<div class=3D"ContentPasted1">- Fei</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt; At a push I can look past that and someo=
ne can attempt to tidy the</div>
<div class=3D"ContentPasted1">&gt; driver later.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; But without 1-3 we cannot merge this.</d=
iv>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Regards,</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567F72C44D485E628A574069A659BYAPR11MB2567namp_--
