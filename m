Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1750F51B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB6A10E554;
	Tue, 26 Apr 2022 08:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339D910E554;
 Tue, 26 Apr 2022 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650962548; x=1682498548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+234ri5IcoC2JUxZp3So6/rPgIDgiroRJP8/LkPcUx4=;
 b=GYcZ5tb0BOY7SXzYVNErlP6FWvQfwAG0JTL5b3oMWGfGLBq9vtO345BJ
 ov/IX48h0u8SsjUPYIl1o6gVHkQjZVwPE6BUp3ayiBtGDHymvUWUcnciF
 kpzo008swtAaFfScgBG4stzSBqlDm4msTXnqI7t6Rvz8i5hZJvpblh1dq
 EDwXzRiTbzgnuNMa4/Pq6sjwpsk4CDUMAEkt9zqN+OZmgN8wdREpQUwK+
 ntPzQ6Eo5nfdmwhpH5TfPyIwxbD0EsBMs8HwVFqicB8ZonpjldwLTeAaJ
 ihsCUez7MBvWDrzajDOGpHVfE1qGCAp1mVbuvetFqdV3RMGcUJ33nnxgk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="351944935"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="351944935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 01:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="538431996"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 26 Apr 2022 01:42:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 01:42:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 01:42:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 01:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+tBW/mv/KWITs6OcA3yW7+OW3l95DHr/f2wdRlgQqRHWWW3FERT7TPdMyrCfN1pqBkzq9JSHCWwK6l3/tZgFnkQLDdeTFFCJy/gWw10cL9R2PknSxlLxeWoK8/mYb9vIfLT/TI//14yDEe07cxa4Q3ajWSEPuzcNHcFj8NdvnCGkZbni0/LjINRvVF/guG2+mDBclZVhuOMvCWFHjc8ZDOGReaPN83Tc9ozrvWScLDCC5r1T3OdFrq0Hibeyc22HyUPCAfXYZ6mpvD8CQT7r4fGOpy7u+4MXv1MlQ9CuC/n2JgXRkdK5bT/NsE0Go80UptqIjY51J1u36ej/IKzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC2yEebsrTan+GdGygJOjiZb9PVYmMY1y2DL351sO24=;
 b=eV+pKMOTd66+6Z9onKVG3496aNZCUmAuCws5DAAsXxLt7vQ0hjUfKdaRou8wJRljJ9sImVDKhDYUSzCklEp2eA1aj1ChJ9IUlrgHt96p7vLzxCJPNLFRyu3+assqbOYqaIORo5S1QY2zhET37yIo9rvnioK9iZfhkLoPow5g7XJnCxrDIASkO4QczAjSy07YTyhrIGgQVmUZPCO1OVQNN5/zC0dr5CdfVBOSGC/GDH8P3wtr+EInid+hQZUzlNuYICeY95CuLroEmf5mLxnbXy3v/SryJQ6fHzyyTy19tzCv85H4F36QE1rPcoVoJTmzPy4EGUNVIEhKJ5pIcVrxmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CH2PR11MB4198.namprd11.prod.outlook.com (2603:10b6:610:3b::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Tue, 26 Apr 2022 08:42:25 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:42:25 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHYWUN8Agog0QB2HUW+VGhdlmLDqK0B3zkAgAABWQA=
Date: Tue, 26 Apr 2022 08:42:25 +0000
Message-ID: <a0800c9b-71da-1cad-1dd4-78c0910ac266@intel.com>
References: <c5cf6773-e7a2-8ba8-4cde-0bb14007bc6b@intel.com>
 <87zgk8tf3l.fsf@intel.com>
In-Reply-To: <87zgk8tf3l.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b956e9ed-dde0-4556-4612-08da2760b032
x-ms-traffictypediagnostic: CH2PR11MB4198:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH2PR11MB419876FC261A4C85C7E6818ACAFB9@CH2PR11MB4198.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uYRnphEY6IhtExEvzvps0XN0ocQvMH0b/PA0v7+fJhsNfLOFiK8pbLyw9cc3vRvhJyCyoeDk0ApaU2QBhRmEn/i5JIsBPrLOFWv69OQCtTAc8XYuTLUw/P6nRgYkIdD+jVcCKX/YnFdVGUfmFD8a8qMD3cgnHhSS5CXcPtpDnRD8dJP9FnrIbJz4wOpBpungL0PiXrS8bW47slDNyrm3oLPumoevlUQITzGRFaU7ikT9uYhrZOtaSMONxnpi6ITWwlyxN0RnuMCaFS9yRduX1qHFslA+Ot4OeoVTXJjuu1smBMYZozpMUevjIO+DQWPTFiUXyAKaIQPyxl4BUDJ+WIKgdRZ3v+18ZCQZFcUUlN0W4PHxk9ot1X4OOzQo22SUsDnKqF/WVYj94BaJSVCyiZHDzyxLSFv/zsX/Fa5iujGgsU9D3xfu9tG6IkaMrbWPGkPTsNKJMTNTQ5fMxKAMYvGiRLo22ty6Fe0jN9YEdlUGUnZCU+N4xAsfbqsZcvEgCpFT7rFD6N/9hityn4pxw0uZXuJ48Jmlwly6IbVEQAjG/UIAulPwpFCfhMRJZY4Y6Djps/NvSq9dCeSuSeNWPXEFTVbTxBLPAh4GQ0PHwZJk+2Bkv5DBlj1M9IEbyGuJDXWJstV8J8MK6Mwp447HasnDNX8U+GcHmSXBwA/lB8Z5SJNtLS7o34nzLDM6qezlN2N+7uJc/xmY/PGviQdIl7m9wWnmqZezX9ul9cIs/bw1mhJ9wVUiRdrxz9pVZC/dOXRgye23Mc6nY8QaYBNQuRDn4VwfKGl3hR9IdiTFCSyNJcC6rE+8NO92X7YaEhNjYO6O5nK9FrrPzHB+UTjrFJhOuohlu001RrPn7Xhv6EQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(2906002)(53546011)(64756008)(122000001)(82960400001)(38070700005)(7416002)(38100700002)(71200400001)(6486002)(966005)(110136005)(54906003)(8936002)(8676002)(4326008)(66446008)(66476007)(76116006)(66556008)(91956017)(316002)(2616005)(31686004)(36756003)(186003)(31696002)(86362001)(6506007)(26005)(6512007)(508600001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?BYL+vthVE0jDR5tDtKtoTV9wmaPjpbmDu6qh/P7N5YWcqU109IYAkZAw?=
 =?Windows-1252?Q?fU3KFMWukIGUVsEJ2g44tidcbrkpiPLtYGY1o+PCmI3wTuFsSoatvcUw?=
 =?Windows-1252?Q?ml6TiXynXOcWYeLBi0fHlcVU61galevvE1cWUiZ94F5AOYW6oK1We376?=
 =?Windows-1252?Q?ZIA6aqcGLvCeW0EVge86c1nyNfFF80oPZ65jqQ5DyG+RMGBjd07nOXOS?=
 =?Windows-1252?Q?GSmHfjBk25nug1sq702Gl33BWikS9PorWGBK/RlDO/B1ecII8iplup7o?=
 =?Windows-1252?Q?WJgVRV+NM3SXLSGoT7+y5ZYvksqPtHgCoiVpvwd0i3rWCIMWO0lAN3i1?=
 =?Windows-1252?Q?8VxJ4Vy3zaj0Se5dDEqsib78pH2fuW8gAoJkiGJL6afwWezUrn4yKrGX?=
 =?Windows-1252?Q?3LSxqHkEeFIESXqkXmlZtW5rnCFbgi6pUT6e//XPxMcOosvWgiM6iP/9?=
 =?Windows-1252?Q?2FJqlUpK0jqG9mDIdvwFZpVG4/7peCYbesBqhNKQQ+z4hIY1OQjoZcPG?=
 =?Windows-1252?Q?sUSa9tYvsJYIRd4kkgc4lRiW0VYJ6n8kNPJ56TViTqM2/LzN6BYLbU5c?=
 =?Windows-1252?Q?M2wi3ApSQS+rvPdhIT+6K7038mWGcmIxZPfwjVMGbwxlToYzYM9gtN+X?=
 =?Windows-1252?Q?gw9V1vs87d1WgXCam4kj39xfUkzttuSeu9CqN+BPYIey4jWlD55OIppJ?=
 =?Windows-1252?Q?YyQSL3z7rM6IwFZtf9Kr5QFNYgedzNpetz2/9xwaAvQrTdeJSiyzDxOX?=
 =?Windows-1252?Q?6KFp7+UcJqtWmO8Z4T5ifOYQ+F+UDKEU2nbSIMREtYF3Qtacnyjw8NYy?=
 =?Windows-1252?Q?vh+Mur97LWdafDSdO6sUqWMEnkIJ/7ov+LkDq/49ccpVDNutDWVeJqlG?=
 =?Windows-1252?Q?XViGMDr/DWRp48pej5R21vbBU+/XpgKj+FiZ8mikLsUPMGBvwFPVRvnX?=
 =?Windows-1252?Q?6n7mH4ZWQBwKDPGdX2BTBb1sZaB5azQTdwXuxNJsUk7tW6CAE+MWitBF?=
 =?Windows-1252?Q?KDXLPyVNncVsAoYchgP7jk/6M0NY5Z79Nmq/IbvhJhn0Us05xwwAbKpJ?=
 =?Windows-1252?Q?EJ5TFoO0qxpYrxp6Ta7hZh58vG2aF8yuxcMWiHWb7vWJ/rsPpMqbNDge?=
 =?Windows-1252?Q?hYeS8S7bvrIMbsYqzwA5RvWtdOFnE5qgSwImZqf4gR5NUFFAjkAxwjyB?=
 =?Windows-1252?Q?Rw1XRyBW11V7X9skJIbvWh9X+nI3c5CQ3dL54pI5T+CZY5/4q7KqZn/S?=
 =?Windows-1252?Q?5sfShjtiqXmZMIOby5acnzkPAai92sVY7EMQ1xJxEU9r6/m1A13VL+Av?=
 =?Windows-1252?Q?Mgum1+vv0zuYIXfFPNl7AeFt+mpiSljzdLqHbXBBu1CZoc7eaIq64GuO?=
 =?Windows-1252?Q?7P2MJL/oq9oErvzW5g8Wki0rg4bSYZDe3nHt2G4VpRf6XqbG8ep4SaRU?=
 =?Windows-1252?Q?nPgJiT/tnNZrM0IVePTav5F/C49At9jROf/7anpMOM0ORokcJPFtcKZn?=
 =?Windows-1252?Q?ANPwcN7lf91yL+Y3r8STaa5gj8F7w1uaN6Pb33LFQkUBA9MvLLZzc05D?=
 =?Windows-1252?Q?au6J90E3UWOWWk9sCtZueBfrRTZeIYTCNJyXpcOOl12BugIwhObwS3UB?=
 =?Windows-1252?Q?y+l5gxyNmwA5YlQ4wiILiKBsyiuPf3F2hfiVaGSKfZ/I7s634miTBP/N?=
 =?Windows-1252?Q?qlgXFSzmvZjTk4c8VAjv9J2ZTNvb8ktx/pz7xKNXazBJTLmLC2SAjlVJ?=
 =?Windows-1252?Q?//u3NvtnhT/G5smcIvpVhmjSuBBZbiojCrjwn36n6LmI6BIE5tu4gXpc?=
 =?Windows-1252?Q?IIZcryRehQT1GF6DVWms2cK7qtsmNrKk8NsrMRupCtB7vpAVVcdUchBI?=
 =?Windows-1252?Q?CTbQVVoRwDsL4w=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <5AE5225C5562AC42AF37944332AD0A12@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b956e9ed-dde0-4556-4612-08da2760b032
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 08:42:25.2306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Gf73tMSa1scO731ymb7IKwxFa/HJdvTShf8Yxv3Bn54PxKoNcumRMSMWTZkzX1z4EvT2FE8N5EF+bppORx0MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4198
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
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/22 8:37 AM, Jani Nikula wrote:
> On Tue, 26 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>> Hi folks:
>>
>> Here is the pull of gvt-next which fixs the compilation error when i915 =
debug
>> is open after the GVT-g refactor patches.
>>
>> Thanks so much for the efforts.
>=20
> Pulled, thanks.
>=20
> BR,
> Jani.
>=20
Thanks, looks good now. :)

thanks,
Zhi.
>>
>> Thanks,
>> Zhi.
>>
>> The following changes since commit 2917f53113be3b7a0f374e02cebe6d6b74936=
6b5:
>>
>>   vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-26
>>
>> for you to fetch changes up to 2da299cee780ea797b3f72558687868072cf5eb5:
>>
>>   drm/i915/gvt: Add missing export of symbols. (2022-04-25 18:03:04 -040=
0)
>>
>> ----------------------------------------------------------------
>> gvt-next-2022-04-26
>>
>> - Add two missing exports of symbols when i915 debug is enabled.
>>
>> ----------------------------------------------------------------
>> Zhi Wang (1):
>>       drm/i915/gvt: Add missing export of symbols.
>>
>>  drivers/gpu/drm/i915/intel_gvt.c | 2 ++
>>  1 file changed, 2 insertions(+)
>=20

