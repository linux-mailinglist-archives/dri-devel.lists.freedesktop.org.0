Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7E6E995D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 18:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10BF10E2B2;
	Thu, 20 Apr 2023 16:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B4410E085;
 Thu, 20 Apr 2023 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682007513; x=1713543513;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=wMJn7EmI/Rv6zVBhjZBRF7eoxbc99qhLdLmY5Rc7Dfk=;
 b=ANb71xV9UJx2QDgMzFvVhqb1BJO67jm/Mn/aCeXyMy4dtEaW2hNhh/S0
 pCfaL5EZ2fTfw+qTTctV4sZlAUFAdTgSDl7/7ErRWXlKwCfMcEaPQpvqU
 gAT9/4vwJ8Wu+Xp0nAsOOvNVQ8yNNLXlmCFUsz3rVwe/WLX95PnNkr6kr
 lago01RiaKuA9DCiCa9S68rn9X0pxpn2S7vjDb3kO4/nqQObi+DisPoaz
 ett1UjzagSHPmGReyJbfSUCIHbHBeml/w1aBYMoDAOzm4ooI7iiXjY/JL
 U/DaiuT0sHZva1EYBkPqdI+9QgnkEk49Ubm0bW7mbft1yO+/aRhYouReb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326110205"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
 d="scan'208,217";a="326110205"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685386595"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
 d="scan'208,217";a="685386595"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 09:11:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 09:11:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 09:11:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 09:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlisfzK75FapGjNCn6iKEGGYGEgXj/YUf+bE5Kkr+TlKosMss+jnvlu2xw9luTXwJ5fwnDM6cOoBxl8s8RisHQ3dNgHpo7REY5A5VNH0/0qQfCYqfug1gBMWi3uwxooPShR79wjA2b6+3WVy4cukf9QtkPychYiIcflKzdldP4WRnfoVgFihUWa1dWxo7i6EBjPySP5Gfd/Oc8k48XjGELAn64sIGxo4xoTN8DqAqOfOzVisBGADIvPTSTUvEgk9srcZFdq6K9+eMTOt5t+VxwXM6uBu4BLafwxlEhqWI/r/5oheEK7K7/P1K1aL1fYNIZ4BwHh32bj3lYq2IdcuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMJn7EmI/Rv6zVBhjZBRF7eoxbc99qhLdLmY5Rc7Dfk=;
 b=JhU69taIQYcj5Plooi/xgAMsgMpbl6/btd96F7/RBjCB78cIYxnu8U+n8z426S0G7gQ9uZxCQHL/hrIBKadaHDt+ohnwn9C/mpfx8mm6RF7GwPzRFCX4irHDqt55Phn4+zcdZwjbDmGEqQMz6FuiHyOogFkfHKSZMPLlnDizh73/dhf0IBGOUKcPugwFuBh17z3jQY+VBcR3mrg2iZy54l3JlrW7bbemS7Q8DSSCaQo3muDGoKLGpFxJXC8Gy2Est6YPk3suHdmVKAfHVbCWuNPXnlMOrVI4RndGk11BHkdFR9CTL5BbTXKnhiVAcG+nCdQquLIIWnYpIlSE3Zoi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 16:11:18 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:11:18 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915: Allow user to set cache at BO
 creation
Thread-Topic: [Intel-gfx] [PATCH 8/8] drm/i915: Allow user to set cache at BO
 creation
Thread-Index: AQHZcxKozEQLwwv4WkSTm8NvcyYfx680E0SAgAAYToCAADHdJQ==
Date: Thu, 20 Apr 2023 16:11:18 +0000
Message-ID: <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
In-Reply-To: <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DS7PR11MB5966:EE_
x-ms-office365-filtering-correlation-id: 244e2588-3124-4b21-0c76-08db41b9dff4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWeqq2NjN0Fj96UgSZJe/zPtlW9Ecr/dmqL7a31m1XaBzyQWcddibEcxMwEfpcZ/S1qcIan0LYVi5fpaBUTZqTM47btcMGw7gQsziHL8YaiXOQnOtBa+aziOsHPMLF5KMrZn7riOfjxlcKBmMEXeuz0Hbjrm5oRUtu9Z14leqZIKp8ujqxOZeTqj1vMdGm00uBuNAnAg1DlIjcsqIZNM1jkOzJc/GzVNRI3X2bRsK+cSwT1ncfI98tWErqMknS7HCcG4dU7tz2YBE/pJ7HupH0uuG1iGum8L3mOprnuWsCN+gMEH+Tl+CoHpoK8w+PUzE+RBh1942ACvNZgD5ORHaPlR/BwOVqHL/Wcv5SepZT7bol1vQVoElYjBRDQO9Gd+0RabLpFXtxRKU3BmifrGVID7g2imbGQ7oMfaM16EhEJmAZPEIQ+zA+KgtaOMSLE0xjhyeIM4d6bjIVJPi1POX9kIgBW/BDJTOxRV2pkNCTJzCQ0PrWplFmXMsYudTOjQeZtxZaCMjMDu5eNeK3I0504AeeW7mjScx36P5aSkiR71k1WR1j2Q5PdhaugGohsgtyz1u3pMcGGGW+wYx9eS6JYPoOuZLtzvNX0pMfBN601ke88uzt8ysxyobU0OmFf/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199021)(8676002)(41300700001)(8936002)(55016003)(2906002)(38070700005)(5660300002)(52536014)(83380400001)(54906003)(122000001)(86362001)(110136005)(478600001)(26005)(6506007)(53546011)(9686003)(7696005)(38100700002)(19627405001)(33656002)(186003)(82960400001)(71200400001)(316002)(4326008)(66946007)(66556008)(66446008)(66476007)(76116006)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?G5cdql1EGGevJ749jKANBtWM2TToeN+OJ9kM3qmpJ5Gz8UZTf6TwfHmVSf?=
 =?iso-8859-1?Q?CCjYfQuRNXk3hbhfX40Or1UUNVqJp+AG62fqGzVsrXGSxNoNKPrR+qQEqk?=
 =?iso-8859-1?Q?DixmNFv5usoR4FGZj6zb9eCxIxvVHTe+sXRAIJ6YU6BlJ3yodKXiOXHxor?=
 =?iso-8859-1?Q?WRcX56X3FDx2tTpn4av9unVAT9989eQkfKoBfCT2jpXSQtqLN68NJlqPqd?=
 =?iso-8859-1?Q?gtWxVEO8nxF5vgryH/oWOwp+7rY4732YJDbuE9zbbQK93dzmX2/zku4YPW?=
 =?iso-8859-1?Q?NgVxHyZdd1HRwlVpaVetIM7wncvxuVxza4advYZFTktYF5ygs6zHYlIksV?=
 =?iso-8859-1?Q?qXaZB0sgQ04rUs0I9yWLmjqqbJ8CdXZo5PdMQ/UvhN/0XIlkkguuVXHtQx?=
 =?iso-8859-1?Q?Qwp/efw2SZhCYE6D0vDtn0PdsIy+0QPJWtV5DsbJzGuAcDxebTDVX0ezHl?=
 =?iso-8859-1?Q?tdOSqTUk9qKLMWS/FqN+OU2MS3XsMBjz9LNE71oBHCl9nsN+xrD2XqKzqq?=
 =?iso-8859-1?Q?tq4zvoDHrM1N/0FBCvxR8vvcbAlPNAUOGs0o3GFbwQqe7GMPqGJHWh8+tt?=
 =?iso-8859-1?Q?y+uTJE+lMg6/tEfWQEn8rzwb3cCGrTOvT/QUhkDX75F6M04ahGDnkAYhgt?=
 =?iso-8859-1?Q?Y7zZvAHKYN7DIygKMPfNYQ1PQnGxT9Q14g08dUruaH/li/9bFrdCJffSzg?=
 =?iso-8859-1?Q?AKJJc19Ce4qVzO4h04bk/dJajMA32AiP5Bmip7Q5wH10hx36RldBqP1+Uq?=
 =?iso-8859-1?Q?ftrwsT1pwaC4SjjGYUtB8WAncc6ZWjqfgMJiNXVZx6I1cc0DsMiQdK6Qqf?=
 =?iso-8859-1?Q?Kg6YoF5DOOEQc3XVCAgQ+hEeEFnyn40ZJp7qTJWho4AX74eQNgh8iRloxp?=
 =?iso-8859-1?Q?ELLgDahC9znkfawC8WirArEAM3wBRtgEMG2Xi3BfAJmXl9P0v12DGDr8BL?=
 =?iso-8859-1?Q?hq+cu4qvEIwqphbI1OPZhtHu55L26LeQADwAWv0kcGfF4swCzcVwzujn2J?=
 =?iso-8859-1?Q?80XocW221DLUUYWhHwHUkKkQ+tcJXOAqZ2SKntx5whPWyOjLWnLqnD93k1?=
 =?iso-8859-1?Q?fRurE+IQcMTnbVTh8ZhKp0YET5WD76NxaNSJ69qqP/BX5Yjdba7GrY+2xS?=
 =?iso-8859-1?Q?mWGvosOBBDP5kKQ+6ueIXXOgLU3OFf6nDNU7W7mnLFab7VKq2rpfDcy3bq?=
 =?iso-8859-1?Q?TR3rGZGuV8cMlcK+0co6GkoJGvpmp8091ST/SKG0EsNbqMlenAWIGQOiP+?=
 =?iso-8859-1?Q?01ZHgtFE3l14ghkY4KVZL8KhpDo2Zt9x7WrNqXyOCHUMZi8oex7pIJZ24w?=
 =?iso-8859-1?Q?odQtgWJNqkWeIl32vhWUAuHD8lstSxvhYhg7a8POtr9Y4Lgb0pPSQzDARL?=
 =?iso-8859-1?Q?HZu+E4Zuis29FRCY3IAoRVqYpmIjtZGNJI7GHdyZRPl6SojcwhKj5E2ISI?=
 =?iso-8859-1?Q?hXdIA3q9emrznfOFtgqy8yGooOxrraa1sFim/3KTxlAzNy1dCY9OOsig/J?=
 =?iso-8859-1?Q?tiDGweMzKbmEl7lhH9q2D3LexKhO+/jKncRqYfF2SsQ+tJ4Enw9WxCgjOD?=
 =?iso-8859-1?Q?pyf3zlE0rlPuZxhkx1Q3EY1R0PKF5MHs2cT/C6+nfCcqtOSX8gPPOVKFSa?=
 =?iso-8859-1?Q?n2CMBu6W70jhk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567A1A450448AE17B38ED1C9A639BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244e2588-3124-4b21-0c76-08db41b9dff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:11:18.4665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o7zqX2HBcjBabmpY2AY9eMQifjIeY4j62vFiriaMSK21A7tZiVaHLuh5TxoNDdEYRK0EXZH0pWlDxHjnBFR4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567A1A450448AE17B38ED1C9A639BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 20/04/2023 12:39, Andi Shyti wrote:
>> Hi Fei,
>>
>>> To comply with the design that buffer objects shall have immutable
>>> cache setting through out their life cycle, {set, get}_caching ioctl's
>>> are no longer supported from MTL onward. With that change caching
>>> policy can only be set at object creation time. The current code
>>> applies a default (platform dependent) cache setting for all objects.
>>> However this is not optimal for performance tuning. The patch extends
>>> the existing gem_create uAPI to let user set PAT index for the object
>>> at creation time.
>>> The new extension is platform independent, so UMD's can switch to using
>>> this extension for older platforms as well, while {set, get}_caching ar=
e
>>> still supported on these legacy paltforms for compatibility reason.
>>>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> because this is an API change, we need some more information
>> here.
>>
>> First of all you need to CC the userspace guys that have been
>> working on top of your series and get their ack's.
>
> Yes, and a link to a Mesa merge request which uses the uapi should be
> included.

Working with Mesa team on this, stay tuned.

> IGTs should be ready to before we can merge. I glanced over igt-dev but
> did not spot anything.

There is a IGT patch posted to gfx-internal-devel, titled "test/gem_create:=
 exercise gem_create_ext_set_pat"

> Regards,
>
> Tvrtko
>
>>
>> I also believe that this series has also been tested on a
>> separate repository, would you link it in the commit message?
>>
>> Thanks,
>> Andi


--_000_BYAPR11MB2567A1A450448AE17B38ED1C9A639BYAPR11MB2567namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1">
&gt; On 20/04/2023 12:39, Andi Shyti wrote:
<div class=3D"ContentPasted0">&gt;&gt; Hi Fei,</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; To comply with the design that b=
uffer objects shall have immutable</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; cache setting through out their =
life cycle, {set, get}_caching ioctl's</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; are no longer supported from MTL=
 onward. With that change caching</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; policy can only be set at object=
 creation time. The current code</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; applies a default (platform depe=
ndent) cache setting for all objects.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; However this is not optimal for =
performance tuning. The patch extends</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; the existing gem_create uAPI to =
let user set PAT index for the object</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; The new extension is platform in=
dependent, so UMD's can switch to using</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; this extension for older platfor=
ms as well, while {set, get}_caching are</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; still supported on these legacy =
paltforms for compatibility reason.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Chris Wilson &lt;chris.p.wil=
son@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Matt Roper &lt;matthew.d.rop=
er@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Andi Shyti &lt;andi.shyti@li=
nux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Signed-off-by: Fei Yang &lt;fei.=
yang@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Reviewed-by: Andi Shyti &lt;andi=
.shyti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; because this is an API change, we ne=
ed some more information</div>
<div class=3D"ContentPasted0">&gt;&gt; here.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; First of all you need to CC the user=
space guys that have been</div>
<div class=3D"ContentPasted0">&gt;&gt; working on top of your series and ge=
t their ack's.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Yes, and a link to a Mesa merge request =
which uses the uapi should be</div>
<div class=3D"ContentPasted0">&gt; included.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Working with Mesa team on this, stay tuned.</=
div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; IGTs should be ready to before we can me=
rge. I glanced over igt-dev but</div>
<div class=3D"ContentPasted0">&gt; did not spot anything.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">There is a IGT patch posted to gfx-internal-d=
evel, titled &quot;test/gem_create: exercise gem_create_ext_set_pat&quot;</=
div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Tvrtko</div>
<div class=3D"ContentPasted0">&gt;</div>
&gt;&gt;
<div class=3D"ContentPasted1">&gt;&gt; I also believe that this series has =
also been tested on a</div>
<div class=3D"ContentPasted1">&gt;&gt; separate repository, would you link =
it in the commit message?</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Thanks,</div>
<div class=3D"ContentPasted1">&gt;&gt; Andi</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567A1A450448AE17B38ED1C9A639BYAPR11MB2567namp_--
