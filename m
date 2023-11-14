Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB07EB844
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 22:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C74F10E4D0;
	Tue, 14 Nov 2023 21:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7802A10E4C9;
 Tue, 14 Nov 2023 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699996184; x=1731532184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JEHolYXD9t3ZT5WjZrP6SgdDBIS5cqFqY/8T5pfYaaY=;
 b=V/U0HXEouq21Cc44ULGu17YnwSdoIrihrNcOMa6hKIBRl0/mhr7/wQHo
 aoKPKaJ566sDP072GqbK20O4vcggzKpOggSx7V0fvfYiIuIXyBOhfSssF
 XOf/455tvBVgqb6a/7XErqfp+AwjF0804DG13r1Tfa+JAOPb48kGPfjfv
 RZTmqoM5W/tlFq2EHGz+gSwVfainWiNsuxwAWKf/nAULrktlwvvW31TRl
 Ctvpzd10Jt017m6i5sGcILJ6ZN5HwMadOKprhxHmHfD0y5MqvoyKvtBXw
 DQnSDXC2S/X47TRP4nxC9AZJd+1EYoGwP+/xmstVf5vgjWkM8rE15Ydfx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476968570"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="476968570"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 13:09:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="888384028"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="888384028"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 13:09:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:09:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:09:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 13:09:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 13:09:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3tH7K429wbBmZzW2F+EKsCYeHmJUzbQmLPzlzwsh9S8EkDSwWu4OKbkDvnh82xIeKN34TS3LbM5uT4n0BvuOjcKoyJeRgB+K9p5E+7g2sfG3yozNYGfHr8sxqNAH4qduhP8kjF5EB+tm9g4rwkOIXkqxiZ0LZn47no0grAeBIe9SkMKc4bT8fi/F7nG+M8GQh7cW56LuQA/RK2dxp/x/VwZhQsLTptbA3f0tOaUfoeFfLKQL9bhuWojjCZFIufvB0UE3/9KzBu8VsDNPTnxE65WGl8YC5t5ge84qsgyL2dIYwwzf6au9a31JoeBOyo6u2C0l0HkZL06ZNtA6uL1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEHolYXD9t3ZT5WjZrP6SgdDBIS5cqFqY/8T5pfYaaY=;
 b=cUd+5JFNKHKZ4hpzPIP9g1HfBRCWi8KSyU8hFbil0adGkHVdSOaLyk4wBzXzmJhP0T+DyzVu1DU7/22kHo67+6f0emnkHztmpILf/yAw7oLXvxVZ+fc0TepFwbB9gQbXdG63W7wPwD9SamdxXfm3WSkLI4mcfW/PuY3qypCRPq/Jr3L0M1N+sf4Ob1NP0TEebVOAFVG1kTnmiR12opLrcvNIJhtOFectgRn3GMNbwaFICIbFswfvrQ5b1RKN1IopaBVqMUBlZwdSqMPD73P9RgsfFx4kVWmOA/6iFC7q8eri/vSwe+QmbzsxCK1igGW/kaNWOI6shHbDidedTo51sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 21:09:38 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 21:09:38 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/1] drm/i915/gt: Dont wait forever when idling in
 suspend
Thread-Topic: [PATCH v1 1/1] drm/i915/gt: Dont wait forever when idling in
 suspend
Thread-Index: AQHaFxbMMlN4UpDaNE69oqlIRp/wE7B6T5AA
Date: Tue, 14 Nov 2023 21:09:38 +0000
Message-ID: <35416e1f61d0ca296d6a8ca5bfe860a1f9802ab2.camel@intel.com>
References: <20231114162227.756974-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20231114162227.756974-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5018:EE_
x-ms-office365-filtering-correlation-id: e3a47030-895f-42ac-00db-08dbe556031c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fo3SJl9ufoGQ+LKAWRHI6yaAl0BxbAGCtN51RfHgh5wClEVjSZgWkltWzlelWmo0CUL+xI1d52oblMeMcwEti8vkN4RO8gFCcvz33QhbTaFeC8abylWNB67Fgrp28pNFGGoEZGiyKYyuw3cK2NhCnpO+xs9qLf+flOVEk+HOP+ZZYLIMjgKL1j2S39Ro4OATm7bopXDU0krgndO9uIyKp21TaMWMgAiMzn4wMhyA8Ca6btVL5mt4u6ZrpnycEsQtfUsdBgxfy+dW/MsBgTHdzBMlmeVGPfjh07LydQJP6HxxMknYF6FApWtzeKbF7eR5J/aMfdhakxEp1mjA8LCzBjmv5YCdqWhlLYXs24u3aP9f/1TMP9GgYd7DL1sbAmgaaZ+h6mNCGmu8hO8LjW8jCcVS+xCR52J/50h+FyEBS7ljouLl5sQFEzvb+5GgF3gfhCVtv0gXakUcajkilldmMy7X/JRM5BBGVl5r/4/Y9AqxfZp6iUCNJepBvetkwTkJmjsCmksmU9yvGxaTlnUNYK/XmET0z2xtL3V5Wxrl8zxKEAp8oMpZ0ZjfYbFhmEOJJwiFwnGfa/5coiPfb0mLRSmbwAqrGQjwmDAh2QXNSPwZc6SLWBT++hCjsvR0GBun
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(83380400001)(6512007)(82960400001)(122000001)(2616005)(26005)(107886003)(38070700009)(966005)(6486002)(478600001)(6916009)(66556008)(36756003)(450100002)(8676002)(8936002)(41300700001)(4326008)(4001150100001)(86362001)(5660300002)(15650500001)(54906003)(66476007)(66946007)(66446008)(91956017)(316002)(76116006)(2906002)(64756008)(6506007)(71200400001)(38100700002)(192303002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEcwRXBHam4rdC9TN3pVU2xidFVCc2V6amRnUUtGaHlrQ2t1UVlPNTNHc0pF?=
 =?utf-8?B?WVZLa29mZjJyTUVVbmE5RnRLNlVScEloVjBmZkI4Mmdmdm1XeFk2SHZXb09V?=
 =?utf-8?B?eUJzbXBNL1REdCtaYWludFBCVnBvRVlGQ1RFWEplM3RnRkh2S0x0SmpZVXNs?=
 =?utf-8?B?OG1LM211L0U2ZGNlUThqbE9BclRVZXhHdGxkU2t4WkhxUTYxMFduMmdycU5v?=
 =?utf-8?B?YzM2b0NkcFVhTEtHTmtqL3kxQXhnb1NHMlZBZWRZUzZBYnkrMWZ1UnNWRnVJ?=
 =?utf-8?B?T1doY0pRc3p6MGxCVGpSZjBkM1JnNjcxTi9nYWtKT3N3Qi91MFRVV3RTbzg3?=
 =?utf-8?B?alBWN3NYUUZLaHlLZ1U0eG1Sb0RFQVNka1dvTWdxYzVaV1UvMjFhL1dlYVFP?=
 =?utf-8?B?Q2sraS9YZjA5MEFpZ2lsVlFGVlVuMFRUVjFpeWpHSjV5NHRnSjFqd3dVcnF0?=
 =?utf-8?B?cFJGc2FRL01rQkIxbHNDa1ZTMFp5NGxDVmJ0Z1A2WkZGNzdSZnh5U0FlaDZY?=
 =?utf-8?B?Y2xyYXpLOEhnT09ITVVzS1grdDJlakFYOTZPY2gzcXkzM3FvQ1h3NU9tYWFM?=
 =?utf-8?B?UUtkekV3eGlGK2lFbXR6cmJLeE1YM3h6MUQvVndDaUhhQWVIN1lrRWlHRkNp?=
 =?utf-8?B?bER4dG5Ec3dmTEp2eVJrd24wR0lRNmt0RHIvOEY0SW0vcklsZnRQaXZ5bngr?=
 =?utf-8?B?UXFXS2szbDhFUjB5Y1VjSm92TWJXTW5TUnVXL0RoTFJ6bzVpclhWc1l3Qmp6?=
 =?utf-8?B?Zk40TzM2U2lVZ0drSXRWam8xdXpKeENQM1lrQ2x3a0R2M1oxajNFMFZTS282?=
 =?utf-8?B?azZEeVVvWDNhZDMxdjRRTU1iTmg0dGtGVFFjck9DUnB5RGRCNDl3UUJBcWty?=
 =?utf-8?B?YkduM0FwQ2JPaTdZb0pKT3lReEtld1F5OWVUbHJ4ZG5QWFNLeDh1VXZURlpF?=
 =?utf-8?B?eFFONUU3SFlRRGZYQ2g1RDV4bTJiYW1MVlp4QW1YU3NoclVhOS9jbVF5NmxY?=
 =?utf-8?B?U3BKOVZ5akRqektZTkJGYTk1ME5YdHlFKzF1WXlySjljbGU2Zkk5SER6cnNm?=
 =?utf-8?B?cWN3eXR3N3FZazBPUnFqRFFUUGxsNThhT1FOSk4xVmVEV3EzVzNmbnJUK0NC?=
 =?utf-8?B?TTZUV3dtRDVXREpYK042WWZWZTk0aVZ2bkZwNVRBRzd6VVByRUhTL3hOVWdp?=
 =?utf-8?B?TGkxNnNkaEJZVjNydnN6bTZFdDB4akExY1haRFBPVW5iS2RqbGRqK3MzTGRh?=
 =?utf-8?B?dk5Xa2x2NHJWcnQrSEtvYWtkcHdXT2hHdEx3Z3RSUnpvamlrMnladVpOaHdr?=
 =?utf-8?B?K0U1NmtSTnV6R210d3RlOTU4OVA1ZkRFUENBZElsMmhjdXRpd0hoTDZnUzZB?=
 =?utf-8?B?THM0Wm9jNVA0MzhzYTZ0elJKUTZvSlAwdU1qVE93bjAyY1FpWHhVc285VStS?=
 =?utf-8?B?ZndpOGQ2NDFOVjhRNHNOMHNPUytMRmFmenFvNllVeVJ6bnhHWklYem9UR0p6?=
 =?utf-8?B?REl6TWNHNzdqRHpvVEFFN3JtYUJmMmlwWEhnR0RVS210WlZQNWM5eFRXS2lJ?=
 =?utf-8?B?QmVkbVU0d0FqYXJEc2NpYjRRRzRSa3A1SmhJM0Zqbm5lMU5kUGxhekFwU0E0?=
 =?utf-8?B?VlVZU2cxWWRGUktVeW56ZXdrWEVmSGMzdGE0eEYxSkhZYmtxcmJSNS9rN2J6?=
 =?utf-8?B?N2czbVZDWURCRnBqekMya3ZhYVMyQTJNQjhTa2hPUllSVHUzdXpuSEhIc1pl?=
 =?utf-8?B?MnJ4WjM2S1dLY2VTOFZrbms4MG5DZWo4bWlDSkNyR0dkUlpWdlliNFRkUFdt?=
 =?utf-8?B?K2o2c3ZXd296Z3JmTkRPczBJRzE5M05vam01TUMyck9VUi9qZHZKTWpJVWpu?=
 =?utf-8?B?a3huTGdJQ0twQkJPbXFBdzJmeUVOOFR0b2dTdTlBTnVENWlIekVKcklINnJx?=
 =?utf-8?B?Q2cvakVQQy9ZQnZCaWo0TTk0WUROZTVrc2lvN2gxNURhMlB4TkhGcGtvN0k0?=
 =?utf-8?B?bjd4TzY2U0llY0RHM2cyeVlieEZxbWFUdURNYzdSZllwZXNDeVZieTZDQVl0?=
 =?utf-8?B?bnNWeFhOeEM4MGgzNTdLbnliNkVPWGZzSjNKMVlnTUFkQ0ZLMVEvRmdXekRF?=
 =?utf-8?B?bUJLMk5XcktBNFRqSUtuNGZpM3B5N0VnUEtZK3JtQUxLR1IvWlFiY0RvbVZG?=
 =?utf-8?Q?T34b2pVSlZIeAnZ/YIGBdLg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEC31D4F73D5694AA9B2C64A60B25C06@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a47030-895f-42ac-00db-08dbe556031c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 21:09:38.4869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJ8NAyOe9i7DGQFt0JkgcT9fvcicnMorrxuw9QBPgO+waBCkzWIFdX9V4ez46RCumqyjf9cMl0hx8Zin+ow0b+sWgwTgXxdEwh3lQQiQeUUGGS5RmgTUTad9txUxJT3Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, "Jana, Mousumi" <mousumi.jana@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTE0IGF0IDA4OjIyIC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBXaGVuIHN1c3BlbmRpbmcsIGFkZCBhIHRpbWVvdXQgd2hlbiBjYWxsaW5n
DQo+IGludGVsX2d0X3BtX3dhaXRfZm9yX2lkbGUgZWxzZSBpZiB3ZSBoYXZlIGEgbGVha2VkDQo+
IHdha2VyZWYgKHdoaWNoIHdvdWxkIGJlIGluZGljYXRpdmUgb2YgYSBidWcgZWxzZXdoZXJlDQo+
IGluIHRoZSBkcml2ZXIpLCBkcml2ZXIgd2lsbCBhdCBleGl0IHRoZSBzdXNwZW5kLXJlc3VtZQ0K
PiBjeWNsZSwgYWZ0ZXIgdGhlIGtlcm5lbCBkZXRlY3RzIHRoZSBoZWxkIHJlZmVyZW5jZSBhbmQN
Cj4gcHJpbnRzIGEgbWVzc2FnZSB0byBhYm9ydCBzdXNwZW5kaW5nIGluc3RlYWQgb2YgaGFuZ2lu
Zw0KPiBpbiB0aGUga2VybmVsIGZvcmV2ZXIgd2hpY2ggdGhlbiByZXF1aXJlcyBzZXJpYWwgY29u
bmVjdGlvbg0KPiBvciByYW1vb3BzIGR1bXAgdG8gZGVidWcgZnVydGhlci4NCk5PVEU6IHRoaXMg
cGF0Y2ggb3JpZ2luYXRlcyBmcm9tIFBhdGNoIzMgb2YgdGhpcyBvdGhlciBzZXJpZXMNCmh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTIxOTE2LyAocmV2IDUgYW5kIHBy
aW9yKQ0KYW5kIHdhcyBkZWNpZGVkIHRvIGJlIG1vdmVkIG91dCBhcyBpdHMgb3duIHBhdGNoIHNp
bmNlIHRoaXMNCnBhdGNoIGlzIHRyeWluZyB0byBpbXByb3ZlIGdlbmVyYWwgZGVidWdnYWJpbGl0
eSBhcyBvcHBvc2VkDQp0byByZXNvbHZpbmcgdGhhdCBidWcgYmVpbmcgcmVzb2x2ZWQgaW4gYWJv
dmUgc2VyaWVzLg0KYWxhbjpzbmlwDQoNCj4gK2ludCBpbnRlbF93YWtlcmVmX3dhaXRfZm9yX2lk
bGUoc3RydWN0IGludGVsX3dha2VyZWYgKndmLCBpbnQgdGltZW91dF9tcykNCj4gIHsNCj4gLQlp
bnQgZXJyOw0KPiArCWludCBlcnIgPSAwOw0KPiAgDQo+ICAJbWlnaHRfc2xlZXAoKTsNCj4gIA0K
PiAtCWVyciA9IHdhaXRfdmFyX2V2ZW50X2tpbGxhYmxlKCZ3Zi0+d2FrZXJlZiwNCj4gLQkJCQkg
ICAgICAhaW50ZWxfd2FrZXJlZl9pc19hY3RpdmUod2YpKTsNCj4gKwlpZiAoIXRpbWVvdXRfbXMp
DQo+ICsJCWVyciA9IHdhaXRfdmFyX2V2ZW50X2tpbGxhYmxlKCZ3Zi0+d2FrZXJlZiwNCj4gKwkJ
CQkJICAgICAgIWludGVsX3dha2VyZWZfaXNfYWN0aXZlKHdmKSk7DQo+ICsJZWxzZSBpZiAod2Fp
dF92YXJfZXZlbnRfdGltZW91dCgmd2YtPndha2VyZWYsDQo+ICsJCQkJCSFpbnRlbF93YWtlcmVm
X2lzX2FjdGl2ZSh3ZiksDQo+ICsJCQkJCW1zZWNzX3RvX2ppZmZpZXModGltZW91dF9tcykpIDwg
MSkNCj4gKwkJZXJyID0gLUVUSU1FRE9VVDsNCj4gKw0KYWxhbjogcGFyYXBocmFzaW5nIGZlZWRi
YWNrIGZyb20gVHZydGtvIG9uIHRoZSBvcmlnaW5hdGluZyBzZXJpZXMgdGhpcyBwYXRjaDoNCml0
IHdvdWxkIGJlIGdvb2QgaWRlYSB0byBhZGQgZXJyb3ItaW5qZWN0aW9uIGludG8gdGhpcyB0aW1l
b3V0IHRvIGVuc3VyZQ0Kd2UgZG9udCBoYXZlIGFueSBvdGhlciBzdWJzeXRlbSB0aGF0IGNvdWxk
IGluYWR2ZXJ0ZW50bHkgbGVhayBhbiBycG0NCndha2VyZWYgKGFuZCBjYXRjaCBzdWNoIGJ1Z3Mg
aW4gZnV0dXJlIHByZS1tZXJnZSkuDQoNCg0K
