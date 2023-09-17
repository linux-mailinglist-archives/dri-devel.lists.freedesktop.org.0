Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53B7A3DA8
	for <lists+dri-devel@lfdr.de>; Sun, 17 Sep 2023 22:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94C410E196;
	Sun, 17 Sep 2023 20:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A76E10E188;
 Sun, 17 Sep 2023 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694984038; x=1726520038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XRuSIW35D9uQNconbwzEtt9Wn+oeuO08N5pKE84fQQE=;
 b=NpzEozMwZuy8hw9NjgvfqQISIJzhjwkLzZ4d9TvlSwAfwCmT+WZnFHjI
 c/rUa70JurKOQtWB64ZjRMmkE6TOZXCxcptTHHa9BCB4iweLMF43gSkG9
 FMCmaERnvzuUqa0zaZGTj5ja54eYzAErbX8QDXdYi4ZOrKmvvLa6Lgi5C
 M/Hklb/chgmdmr+DQAsAXRxw9IlmS1xZnnM2oJQQX3rpVoS98GctIRhXv
 7VD6ErpFoSem/nvwSLI+6ZqeCwWE5/vz3BlcinGrseNHEdFX1+NGxFzpf
 nn00danMXtebIzncQqv1PgqxW4IPcjRUiiZpWqQqMndoY7dpuCzKg6Vhi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="369854509"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="369854509"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 13:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="992484859"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="992484859"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2023 13:53:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 13:53:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 17 Sep 2023 13:53:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 17 Sep 2023 13:53:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lv06FSQ9PdCMl+XHfpRLiZ1Qq3SUqn5P0yybCi2U+AmMUEILpjH76v3iphi7iuyaJMzVZ+ib7Aqkx1mR3Wg6isUU1T3RVxot+HeSEJXdY0ghvm2YVIhRUQamLzj+NXPIQ76GVocvuund0gAHEi3BHvMbabGgyKWt6Lq/eg1PGWOehm8KCJo27DqfA+zVXvISlrhqsZsaDgkzw1J3wF7ZYyj1NRhxoUHRvW1xdMcwFZr/9/kA1ilCn4aL5tZHyf7YuJNIHZuARkKG7agN8p6Ndc6WLS4gBh8lSlgH4xYK/WO0R8cB4SYKS0UdL3HhwzctRbyJu3KKffiDFT/IcFrugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRuSIW35D9uQNconbwzEtt9Wn+oeuO08N5pKE84fQQE=;
 b=Ngk/SwxBhb4clVK93om6naYMiMGxTuH4s8RA0s3NEWvQAvnmfcv3pfkmP9kT4A6XEh9pyF8iU9byikwTamcKxaV2ssImtJ2WxwC0aA344/zSJwZS2GBATt6KyxRWaup1VfUCeWviG64gC1a31eMtc8y0BL8oY701KRYNlWx952PnjZr4TIRtFxFGApHb2Jz4mAu2gYL/AKb74Z6IRV3rz7mT212gffHl6xNIuT8sV8+fpQ3IokdeW+ahzBo4Kb3e1A5HJXDspXP1TK4IXeXv6OweppoC5QOHerZ3wok+vaX/1qEEhCiBKVQwf8lMML3zOZedV63lGY4ERSjXvgb1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Sun, 17 Sep
 2023 20:53:54 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.026; Sun, 17 Sep 2023
 20:53:54 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, lkp
 <lkp@intel.com>
Subject: Re: [PATCH v6 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Topic: [PATCH v6 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Index: AQHZ6ALIuJhHeVsmdkOEq8l/ioovG7Acug+AgALIDYA=
Date: Sun, 17 Sep 2023 20:53:54 +0000
Message-ID: <98024732b665132524cc22fa5791cc0391c4f46c.camel@intel.com>
References: <20230915183051.1232026-2-alan.previn.teres.alexis@intel.com>
 <202309161030.TcQkW66y-lkp@intel.com>
In-Reply-To: <202309161030.TcQkW66y-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SN7PR11MB6827:EE_
x-ms-office365-filtering-correlation-id: 82c363db-5189-42bc-0451-08dbb7c034a1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: elUOA7a92H4he0qmVYgc219CREo2mGkpIaDYQQosX9auHrm3SYGentBLVj0iq8Z4Q2L2VvMaZ7C4gilK1ar2gBscNa+i3y7SmvhocpnKCw/1akcQJ5tCGlIjfBRdNdConFFSSJqLE60GMiPyu9qBeMdSQ9ZaPiTqGER+mz2d5xtdw5IVQh9zwMnmmbb4Fs7yJ9sMdfZgF+L3o2IVd3nUmkijk7L74opHoAb9uA+qIsnsHMj6Tt1rzIfd8RoONkRgpTuz57i6C/LF8jBj1AFTxPDvD3Vj1mMwos/yvuCg15cvRRgCOEzQwTW4NSYNPXb13l5HGKqKs14n0QqiOtCgeEogSeVMVottR2xPIypvVDSQAEs1WCNb4kRaFltFvTg6XsSnqgSrgjFJH9SbIbED1umZF9tbR4bhCt/YLKiqxFkSeHFh7EoxPKAT20+yE/6+TMo3TkoBNLM6pEOT4XY2BHFmIyDv/XZ64jD0RajuffhLLdUgtCbSA0O3E3mqpRXrBwQq9/G3bS3ZWhgyVzYU4gWc4XoXWKjB4kzT2iJrS0zoiGbuckJGK8vhCrErOX+Umjo3PlyCQaSNXvhsei6KbRpNDZHf3dTsuSNDN0aYe6RQ8Q0m+/ZH2slhF3Cc/1pQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(1800799009)(451199024)(186009)(316002)(4326008)(41300700001)(8676002)(8936002)(107886003)(26005)(2616005)(6512007)(83380400001)(478600001)(6486002)(6506007)(36756003)(71200400001)(82960400001)(122000001)(38100700002)(86362001)(38070700005)(64756008)(66446008)(66556008)(66946007)(66476007)(54906003)(110136005)(76116006)(6636002)(91956017)(2906002)(15650500001)(4744005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXpCeXhmekJPY25CZTlnMUI2bW85ai9NRDVxSnRhZFoyS2g4bXcwY0c3NmQv?=
 =?utf-8?B?R2ZoNmIyOXZTZXBacnBYd2lObm4yWk5CUmtzb3R0bVBZZml2dncyV1A2Mjha?=
 =?utf-8?B?NGs0ZUt2TlJIM3RkaDJXeWcxTXlFN3Q3TzJoVFdkenA0bytCbnVRV3QwQnlw?=
 =?utf-8?B?eEovS0FqSHVRYjluTm9Vci9aTThPVVZIMm9VeldSSWd4TXhucWpBZjA3QnVL?=
 =?utf-8?B?TFpzN1RuNnFJMkxwMUJEaGdXUW5tU01LeVpKc04zd29BbVFreTFNaWhuZWZH?=
 =?utf-8?B?RHhMVE82M3JQTFpHK3owMk0vUVkzM3hjY0U0YkxjRjh2SmJMaFlPQXphaDlJ?=
 =?utf-8?B?bzJZNU5IOTM1VGJrVnV5cjRyU3NFZjE3S3AwT3BPaW8zS3Vxb1FXcjVqUGdV?=
 =?utf-8?B?dCtHaFV6aVJYdVNhWEdPa05JMkQyUlFFQlFyK3ViTjJMd0pTTzBoakhaanlw?=
 =?utf-8?B?amxrYkZ6cHFpMWZXNitaWXNsQzk5ellOaXZLaEg3Qmtpd0VDNUNJR2RzaGYw?=
 =?utf-8?B?SUVCSXlMcU1zUmJIbk5lRno4bHVyZ2tsMGh2aVRsamo5b3phbnBFY1AvRHg2?=
 =?utf-8?B?MTViMHVzamk0eWw3RGRRMFJUb21QdGdYNzlQNnlTdW11YUhWV2hyVVp1Y3F6?=
 =?utf-8?B?amkxQjdOOXpsTVlYNXQrV3ZmTnJPTVl0ZFNZVGp1cTIwQ0Q0NTl3R0FwdW4z?=
 =?utf-8?B?cGNwR05OMGxZWkY1ckJGWko2c05wNXBiTHJIV1Nqa3d6QTVONFRlTUlzdmt0?=
 =?utf-8?B?VDVZTUYxd09TWmpRM25JaWVqTDNMNXVZb25xSUVoQktuUnQrRG5ydFU5cGRB?=
 =?utf-8?B?OFpiRThRWXdNRUZOQzAzdnNUMGI2emtIS2dnQWRlQVdobXZrNi94VVFvME9p?=
 =?utf-8?B?MDNNK3o0SUNlTG5pWS82b1FXUnJEdFNzUXArdU9BYTZlci9Ga0dhclF6K3VG?=
 =?utf-8?B?cXV3V3F0eXhwOVpwZDRrS1RJMWdRTXRsSElzNmR1eFpxY3pQK09QcDNNR3h6?=
 =?utf-8?B?Ym80NmdDRXBSUy83NWlWVm90YTJPVnBlVGR0Y2xyNmxlUUd5UW51OVBHNWxu?=
 =?utf-8?B?UE13ajFBWE5UY01OUkd6T0pZMDdHMEFKb0cwbVJDamJ5T0lmcWJaVUl4SFF5?=
 =?utf-8?B?bkZaSFE3K2RTc3FIN2hFUm9IZFBwUUdRQVpMaktGUkM0bW85aG0zQ1RrYnNq?=
 =?utf-8?B?YXduSmZaeUE5MWtncHhvL0pBQU5xUytTektXOTJ2alpOczlickw3RGR3ckZI?=
 =?utf-8?B?S2NtN3R6RkJHMDZpYm5NR241cjRXREo3VmxlUU5FRG8yQzF1NC9relQreDJU?=
 =?utf-8?B?Um9mcXNhOXd5WGZjaEpPRzZJbmxxbnIrdnFqOEo0bVFEdm9CNDROb2VSZ0tn?=
 =?utf-8?B?Z1pveDRINUE0NThWWWxNRGVXTTFZSkZFQ2JBTllTZ21iWVJFQ1k1S1k2TUU2?=
 =?utf-8?B?MUhKMnFVTG8rc1VBSTQzMzdqT08vd1ozOUNWWVhiT2V3ck15WXdTTUV4Vi9i?=
 =?utf-8?B?eE9JTFh4SkowcWJ4NTRzbGE4SDJ6T2pPenZZSU4ra1Q3ZmJYR0ZqWXQzQit2?=
 =?utf-8?B?YUpSNDVlcHVOdTllV0xGWjBtSWJmWWZwWUNCOXlCZkxFekZiL0sxaExvOXAz?=
 =?utf-8?B?TjBkenhvRkVJN2MxUXVHOFFJcE5zek5aWFJFWkpmMU5OQkJNK2NOT1BjTE5z?=
 =?utf-8?B?bzhuSHF4bTBob2ZJdzRNbmMzaXRES0JoOTA0eDVLT0syR1hvRm9yT2VDUjd1?=
 =?utf-8?B?K1JFLzB1eTFZWDl2d3FEd3lKU2hORlR3SlMwVnU4Z0pvUmYrWkh3UFlkczhM?=
 =?utf-8?B?dHhWNUd1aVpWbzlHYWdXTDcvTnh2K1J3Y0JMYll6QzZsSStrODMrakNtQjB4?=
 =?utf-8?B?aUVVNytRUms4MHlpWGtHVkFWeEFiMll1OGNFMENSTUUycWU5b1dEekdLOHFD?=
 =?utf-8?B?MExMNEN4K0tkR09RdmJxbnZtYmVjS2ltRlQ3M3FuTG95UTJCaEpXTlVrNmk1?=
 =?utf-8?B?cFhLUTg4MUplMUI4alN1Ym5wSWdyNkRwM1lacnNvU1NSeXRhUlpRVm94YU5x?=
 =?utf-8?B?YnNtNWVUeVRJQklMd3VXc1dKL2NaNGQ0SlRabFB5TnpBdVM3RFZNOFhMQTJL?=
 =?utf-8?B?UlJ1R1VZY0QyUkJZTEt4ejFVRGRDbU4wSlhIVTBBRFB0SDBmSWh6UE1OckVR?=
 =?utf-8?Q?q+Sr4xKFlF4/DBPW6N3VG50=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46C4FA15F3CEFC4196228A90B798CBF9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c363db-5189-42bc-0451-08dbb7c034a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2023 20:53:54.7522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGNKyrGEja8tJ6dy7JYi1ce2IDNcLxnC+8/mltsHHOMGpgsbqoXWoz9LJeLc19EGhPBlMh3mh/8Jv70wZr1IKtqpnL/z8wDr/4lkDVJROH1xOAENUw545H/up6zIB4ZL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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
Cc: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTE2IGF0IDEwOjI1ICswODAwLCBsa3Agd3JvdGU6DQo+IEhpIEFsYW4s
DQo+IA0KPiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJy
b3JzOg0KPiANCj4gW2F1dG8gYnVpbGQgdGVzdCBFUlJPUiBvbiBjZjFlOTFlODg0YmIxMTEzYzY1
M2U2NTRlOWRlMTc1NGZjMWQ0NDg4XQ0KPiANCj4gYUFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZp
eGVkIGJ5ID4+KToNCj4gDQo+IA0KYWxhbjpzbmlwDQphbGFuOiBtaXNzZWQgYnVpbGRpbmcgd2l0
aCBQWFAgY29uZmlnIGFmdGVyIHRoYXQgbGFzdCBjaGFuZ2UgYmVsb3cgLSB3aWxsIHJlLXJldiB0
aGlzLg0KDQo+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfZ3NjY3MuYzog
SW4gZnVuY3Rpb24gJ2dzY2NzX3NlbmRfbWVzc2FnZSc6DQo+ID4gPiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9weHAvaW50ZWxfcHhwX2dzY2NzLmM6MTE1OjUyOiBlcnJvcjogJ0dTQ19SRVBMWV9MQVRF
TkNZX01TJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3Ug
bWVhbiAnR1NDX0hFQ0lfUkVQTFlfTEFURU5DWV9NUyc/DQo+ICAgICAgMTE1IHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1NDX1JFUExZX0xBVEVO
Q1lfTVMpOw0KPiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1NDX0hFQ0lfUkVQ
TFlfTEFURU5DWV9NUw0KPiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2dz
Y2NzLmM6MTE1OjUyOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRl
ZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KPiANCg0KDQo=
