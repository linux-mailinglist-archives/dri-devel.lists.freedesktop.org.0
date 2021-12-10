Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9CE46FC63
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D087610E253;
	Fri, 10 Dec 2021 08:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF5010E22C;
 Fri, 10 Dec 2021 08:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639123909; x=1670659909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AZOHBoxF6MnB9CnKyodFZs+g76ZNOMdqHNqlX9YQg9s=;
 b=hJuPSESEYgoPsdSsHkZ+JiMm+M+OL7PfNobTNu+W3CSI7y0LlkvCoVJ8
 mefzWeJehDVOjmGuKHPPPn5ZYsTRF0bU8MGCCSLC2rrj/d0s/pc6qWEv7
 VG/8gmHVD3fpjvvg1FyMEDSThPbeVzZj+/eGr352yU4N9XmkU4s83SEe7
 /b1wq646uUtGfDtOnt6LInHiHSdq6r0GnavxirctPF0Q3dCIJiABl+uwT
 S10T66pGMzPZb07lfK2uuVWPf3+gsOl0r9iUwgK5WOir0Z5p4GO9ftsmm
 cx6cCmj0ZVrHAB6zYF6ugB2ArC/wWudB0iIyXZelWEx1hcNS5syVuEzTF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225574016"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="225574016"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="503841302"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 10 Dec 2021 00:11:47 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:11:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:11:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llfy+ezpkH27+TLjibcP1uI8Mj4jH1apyRbOulSgW/nMSfWeyz/RV4hrIwaJCJccL5wGCg/teSljYOuJGJmZ6flOPGLCojTpj+9bnyBg+mnx3DBDCxiBKF8cKSlhq9o4IJy8jjd1T8FqWcaIZ2OGEcUDPDra6ITRX2Vk94KOSU155L+J9U359RSjlerLpo9ap+Y4wSENMV2VY7I8kiYaID/fY0FuXjFClLpZihZdThFFK8UOyX+9KUwhp4cFaOotS3zU0CuTXcCpkgr4wNokBXm6BCj3JBCNVDc2MfiSORvrNJKij6Gvw4UxmmibbBibrBQiMP5ehE3BTOOKxMhoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZOHBoxF6MnB9CnKyodFZs+g76ZNOMdqHNqlX9YQg9s=;
 b=M3XwxR2QYhxu/LN4icUyj+LA3erevdTR3tkSdYnmQYf/ZgcrAdveqBkVDSjEnNtyotckjvLNDkt1Lw+eF3uWS0As3eRYALs2H78yqv7O+EDnOIEcVti8VYZEex6nuGqfpMu+t7Vm5V5bom93R708H5bqt5fJ1bJTAzL33R41c01MNvaUozmZ9dhJZdceA4iKB3Yn9dXK4zFdxMAzqvdmhQVir+jZf5kuvi5cfQiO9BeSqSY7Lk8nUPSuTXsmhg8AAInePenQ2Fz/k+Jauq99bNEjQAETUdC0WpQYEd7TiONJ6FkJrZYKN0kKjDB2dwOCHjz35zfZsRWBrci4ystmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZOHBoxF6MnB9CnKyodFZs+g76ZNOMdqHNqlX9YQg9s=;
 b=Yb9n2w8VgEY86E3IB39aaQTnRqJ4TR9Mg4FXweBB9PIoI+6VmGyfJ0I3/mW+lQLiWMgS6SUOOpuRwhQPqAU/Pj8LIDeqC/Uk9AbfkaR+MITwHAdDuDkcOtNAh8LAGXTTQ0rrFeKUB8pJfsKuser82sAYcM5d95/SfacZtW9O6z8=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.15; Fri, 10 Dec
 2021 08:11:37 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:11:37 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/9] drm/i915/gvt: Constify intel_gvt_irq_ops
Thread-Topic: [PATCH 3/9] drm/i915/gvt: Constify intel_gvt_irq_ops
Thread-Index: AQHX6P187Ped6GlXbEiFFlrycq/qgqwraR+A
Date: Fri, 10 Dec 2021 08:11:37 +0000
Message-ID: <fa39dbb5-3e88-3536-d22d-f748861a8268@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-4-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-4-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 548e1857-e28b-47b9-4bac-08d9bbb4b03e
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5276E3CB45222997595DABA5CA719@BN9PR11MB5276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tvslbHR3G2B7HqeGpiaCy91cbyEe72LAdfTav4lMKvuSfSLXN1wcab3dlkOq7gJkWOEE/Uaoja7bjV9b+Eg6I8VL3hH75Rm1cO2om/hllqNpwE1js9/iPoMKOi2mzHbKTeWAXsU1xmsT3M5BGcc5PmSwtAisJYPvvCLYz388HTL/fnIyA8/xCLlyhaG33Z7IVjdhx/pV3MJAVuf6KHxUOSrGl/Y08G+XkTE7yjDxpLbAXJlintxFVWdQZ7SuUveNgJEpG4CAR5acAm1AR7x2KhbgOGQJHifxRbNPIPcHWB2cQRjI6p5ZKkM2VE1zblH1kvcc9bxzbkWcLkHdcXiWK+kKkrD9n2cJ4lvzm5nTZokeO1yLs2+ExYFIWywl3MEbeHtllizAIuljJkijSqrj6nG0iK60zFHYypU3zaaw+KAUPbHEAREF6GPvzEDtJ6Gt3qQvOD7sCxyuwNd3jtbMOYRFThvJ/fgonzlx97UJu8lgfNjiXHaawGs0DkjgaCV2MbGQ89SO8KzkNYKTOB7XBoEvbH8lsYKUFCof4lKKVTjQ4IaqHS0P5YEC0J+ZXlCfgCMiYKTeSOHp/BhWbbaIit3xSXRHLsIG2CxrhOp7WQxoj8HT9nYM424hSmkwIzWcIbr5+u+zIrjCfPbZ3zy8EvP41TxqPXIFpuaT+b03x/BUzRt0bwAZhNjHLZ1pUzn9xxrM6s6oACLl79eG8BQ2FNmO+IsMQiZl+z/+N+CjNNxilHntL4Urs5LgTNuM897RsR7uYGi3beY0h7e8/rd/xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(66946007)(2616005)(31686004)(36756003)(66556008)(64756008)(91956017)(76116006)(66476007)(6512007)(31696002)(83380400001)(7416002)(5660300002)(508600001)(8676002)(8936002)(53546011)(71200400001)(6506007)(38100700002)(186003)(6486002)(38070700005)(4326008)(26005)(122000001)(110136005)(86362001)(82960400001)(316002)(2906002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGJVeHpEMXFXMk9OMWNZRkQ0QzNnWTJKbWhFWU1uNkdtR0hqaEdXbTFQcjFm?=
 =?utf-8?B?NFRSd05tc0UyWVpLUHhXN1JtcGdLb2lmRHpCM1Q1UjB6OFVwV2IwMitraXJM?=
 =?utf-8?B?NC9rMDFFR1JldFQ3MWxCeHZrS01KeXhzbEZwaWsvYmYvOUZ0ZHJJNlhrQVNa?=
 =?utf-8?B?VTRHYlVQTVFKcm5qdWpzS2ZTdms3UFBsT1d3KzgzM2ZuY2RNWE9DbFVMdVdB?=
 =?utf-8?B?MVU4SjJOeFRUeTlKV2FRREdCK2h6Q003KzBSeEtSNGxWZ2o4NHlFdmJVWDNI?=
 =?utf-8?B?WngzN1FIa0ZjTTJIMW45RU0zY25ldVJNYmJXMWhodm5TQUp5a1ZDOXpFZ211?=
 =?utf-8?B?a3YrZmpvMFZEOGgvOWcreURmUms4cktkV3Z3ZzZJSE1IQlBneUg3S2VGazNP?=
 =?utf-8?B?YittSW50Q05KNkQvczhqRzg0OW9jeHZnbDQxTjJzd3A0YlZKakRwYWtpSUtD?=
 =?utf-8?B?STlGUUpsUjljcWpSa0lraVlpaFBOYjl0bTRmcUlQRzdXdnJyZDM1WVpoK3NI?=
 =?utf-8?B?Y25CbmNFUlF4YldxNkNPdENFbUduT3dCSkwrRm1GWnMrS3JwcXFwRWJWZ29Z?=
 =?utf-8?B?VmtOWFdoV0YyK0Z3YVZlZnJ4elFHdndFWkFrZUc2YW1hYmIzUDNmU0lybEFo?=
 =?utf-8?B?SVo4RzVvUTl1VmViYXY4V2ZpaGx3alYrYUJLT2RkTkVTaFBidytsZFF1bWRi?=
 =?utf-8?B?UW9DMEtMeHdMYXZBK2tiVHBuQVNrWUxpWkZOamdMcGtTalNyeDhLcWlWbFQ3?=
 =?utf-8?B?RWhaNUl4KzRKc2JXV1ljamxWVkNZekNDbEVLM29mcDFTem1pREZlaG9Gc3RF?=
 =?utf-8?B?czlQZm5keThlMXBxT0ZvSHBLOWtBdHcyUHNJSSs1NEJPV015c2hDVlNEVlRp?=
 =?utf-8?B?WlhEZnQ2cVdsYitOTGk4Nks4TmNGd0JoMHFTeit4U1ZlY0JvWlJNRkhlR0xF?=
 =?utf-8?B?QXhWbFM2eVRXZlpzNWh3bDRUa01FRE53ZWpodE5nM1I1RUs0REYyYUg3RmZK?=
 =?utf-8?B?NE5CTjZtYlk5SE1jdFNMVnhvdkNoTzJDR0lZaVJKWlE2bkN5eW5sQzIrUkYx?=
 =?utf-8?B?Y0JENGxFbXEzWWdDR3R2U2k3Y1ZLMHh5UnhnYVdsL1dtTmlucmhlT01HUEVv?=
 =?utf-8?B?TzEwWTZnQml1c1BWSUFhYWNFV1Fia0ZkTTdOQlZEZTdkYzBubFJ3NGpQVHY3?=
 =?utf-8?B?VkNHTXpXQkdjRXBubEgyVWVwUldLbVhMV2JJbm5RSXdkQ2VyQnFKMXlyZWpD?=
 =?utf-8?B?andYQmZQelE5Yy9vUjhVeUJlUmJ4dTZBU0RMTDI4MUNSM3N1RXE3ZmdyeEZq?=
 =?utf-8?B?WGVZM3VwWXM2QTlBR2dzN0NZa2x2TkFRU1d3VGthdTNKb0N1bXc2SDVNL2pv?=
 =?utf-8?B?c1J0ZGZ4TkhWNTRVVnRzc1M0V2RYZWdjTURNMFpzcTJSTkkzZkFacjBaaVZR?=
 =?utf-8?B?cHg5aUQyajFibCs2NzhxVGN6c3d6M1VqQ0F1TUJtYXBlZ0kxbjFzdEpzU3dj?=
 =?utf-8?B?T1Z5VFZaNTBlSG1NV0QxZzF1VlJuWXMxcEZGU0E1R0kxQkY3S0FjQ1RYSldz?=
 =?utf-8?B?RTJyU244MEI3dWNHbmlVNXlGMzJ1bkxvVmdjN3VLR1Z2MlFINUR5REZOVW42?=
 =?utf-8?B?R2V4RldkODQxYmh4akxBRG95RnZjRkQranphdUpEUUZ3eGRjb3d1NkhYSlZr?=
 =?utf-8?B?UktZZmIwOWp5d1htSWU5cHFNRnc3ellWSjFKUFVrRkhWbE1Jc2kyNlp0bFAv?=
 =?utf-8?B?dTIyejZ0SUxjYkhpdWNoRzJKL1JvM1U3dFFRVTJSdFF1T0lmWEc0ajZVdG55?=
 =?utf-8?B?eitJUDRZcHNiRmpqVVFhYUNuRU5POS90RjNMeDhvZTBXcGRwanBpTGhmUlZD?=
 =?utf-8?B?REZ5bE1CcG1WbVJNV0RYYzZjcmZpNStjdmwvLzEzTS9kS2J2ZTJOcHlUeVFw?=
 =?utf-8?B?R0Rxcy9oTG5WOE1SUks2TmlzMXpXd3lrelJBbDBRZFpaZ3A5ZTRUTS8yZ2hV?=
 =?utf-8?B?ZDJxcGJuZ0tWTkE1Ungyakw5R2xtckcwWEhqTUcxUDZrMWlSbVBRcUhRTkti?=
 =?utf-8?B?WlNsTXA3akxiZUYzY3d2eEx6TmhKakZud21GSTI4YURVdlJiaXJKYnh1eEZR?=
 =?utf-8?B?dWQ3ZDBmbWRMYW41RFJVb2cxWlc3N3J3Nld4V1FFcXhMbVQwVmcxamVoWEVp?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A73670757EFEF45B3AD42B30A45BA55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548e1857-e28b-47b9-4bac-08d9bbb4b03e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:11:37.3761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbohqRGceQLrq8ZXD50qjTi9euS7+QjFPZx5kS0lmo94ghot+wFthLT27wHYp1/x7j4RgbBCP/pofL2wCpKY4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
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
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBUaGVzZSBh
cmUgbmV2ZXIgbW9kaWZpZWQsIHNvIG1ha2UgdGhlbSBjb25zdCB0byBhbGxvdyB0aGUgY29tcGls
ZXIgdG8NCj4gcHV0IHRoZW0gaW4gcmVhZC1vbmx5IG1lbW9yeS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogUmlrYXJkIEZhbGtlYm9ybiA8cmlrYXJkLmZhbGtlYm9ybkBnbWFpbC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQuYyB8IDEwICsrKysrLS0tLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmggfCAgMiArLQ0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jDQo+IGluZGV4IDYxNGI5NTFkOTE5Zi4uOWNjYzZi
MWVjYzI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jDQo+IEBAIC0x
NzYsNyArMTc2LDcgQEAgaW50IGludGVsX3ZncHVfcmVnX2ltcl9oYW5kbGVyKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LA0KPiAgIAl1bnNpZ25lZCBpbnQgcmVnLCB2b2lkICpwX2RhdGEsIHVuc2ln
bmVkIGludCBieXRlcykNCj4gICB7DQo+ICAgCXN0cnVjdCBpbnRlbF9ndnQgKmd2dCA9IHZncHUt
Pmd2dDsNCj4gLQlzdHJ1Y3QgaW50ZWxfZ3Z0X2lycV9vcHMgKm9wcyA9IGd2dC0+aXJxLm9wczsN
Cj4gKwljb25zdCBzdHJ1Y3QgaW50ZWxfZ3Z0X2lycV9vcHMgKm9wcyA9IGd2dC0+aXJxLm9wczsN
Cj4gICAJdTMyIGltciA9ICoodTMyICopcF9kYXRhOw0KPiAgIA0KPiAgIAl0cmFjZV93cml0ZV9p
cih2Z3B1LT5pZCwgIklNUiIsIHJlZywgaW1yLCB2Z3B1X3ZyZWcodmdwdSwgcmVnKSwNCj4gQEAg
LTIwNiw3ICsyMDYsNyBAQCBpbnQgaW50ZWxfdmdwdV9yZWdfbWFzdGVyX2lycV9oYW5kbGVyKHN0
cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAgIAl1bnNpZ25lZCBpbnQgcmVnLCB2b2lkICpwX2Rh
dGEsIHVuc2lnbmVkIGludCBieXRlcykNCj4gICB7DQo+ICAgCXN0cnVjdCBpbnRlbF9ndnQgKmd2
dCA9IHZncHUtPmd2dDsNCj4gLQlzdHJ1Y3QgaW50ZWxfZ3Z0X2lycV9vcHMgKm9wcyA9IGd2dC0+
aXJxLm9wczsNCj4gKwljb25zdCBzdHJ1Y3QgaW50ZWxfZ3Z0X2lycV9vcHMgKm9wcyA9IGd2dC0+
aXJxLm9wczsNCj4gICAJdTMyIGllciA9ICoodTMyICopcF9kYXRhOw0KPiAgIAl1MzIgdmlydHVh
bF9pZXIgPSB2Z3B1X3ZyZWcodmdwdSwgcmVnKTsNCj4gICANCj4gQEAgLTI0Niw3ICsyNDYsNyBA
QCBpbnQgaW50ZWxfdmdwdV9yZWdfaWVyX2hhbmRsZXIoc3RydWN0IGludGVsX3ZncHUgKnZncHUs
DQo+ICAgew0KPiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQgPSB2Z3B1LT5ndnQ7DQo+ICAgCXN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gZ3Z0LT5ndC0+aTkxNTsNCj4gLQlzdHJ1Y3Qg
aW50ZWxfZ3Z0X2lycV9vcHMgKm9wcyA9IGd2dC0+aXJxLm9wczsNCj4gKwljb25zdCBzdHJ1Y3Qg
aW50ZWxfZ3Z0X2lycV9vcHMgKm9wcyA9IGd2dC0+aXJxLm9wczsNCj4gICAJc3RydWN0IGludGVs
X2d2dF9pcnFfaW5mbyAqaW5mbzsNCj4gICAJdTMyIGllciA9ICoodTMyICopcF9kYXRhOw0KPiAg
IA0KPiBAQCAtNjA0LDcgKzYwNCw3IEBAIHN0YXRpYyB2b2lkIGdlbjhfaW5pdF9pcnEoDQo+ICAg
CVNFVF9CSVRfSU5GTyhpcnEsIDI1LCBQQ1VfUENPREUyRFJJVkVSX01BSUxCT1gsIElOVEVMX0dW
VF9JUlFfSU5GT19QQ1UpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBzdHJ1Y3QgaW50ZWxfZ3Z0
X2lycV9vcHMgZ2VuOF9pcnFfb3BzID0gew0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9n
dnRfaXJxX29wcyBnZW44X2lycV9vcHMgPSB7DQo+ICAgCS5pbml0X2lycSA9IGdlbjhfaW5pdF9p
cnEsDQo+ICAgCS5jaGVja19wZW5kaW5nX2lycSA9IGdlbjhfY2hlY2tfcGVuZGluZ19pcnEsDQo+
ICAgfTsNCj4gQEAgLTYyNiw3ICs2MjYsNyBAQCB2b2lkIGludGVsX3ZncHVfdHJpZ2dlcl92aXJ0
dWFsX2V2ZW50KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0
ICpndnQgPSB2Z3B1LT5ndnQ7DQo+ICAgCXN0cnVjdCBpbnRlbF9ndnRfaXJxICppcnEgPSAmZ3Z0
LT5pcnE7DQo+ICAgCWd2dF9ldmVudF92aXJ0X2hhbmRsZXJfdCBoYW5kbGVyOw0KPiAtCXN0cnVj
dCBpbnRlbF9ndnRfaXJxX29wcyAqb3BzID0gZ3Z0LT5pcnEub3BzOw0KPiArCWNvbnN0IHN0cnVj
dCBpbnRlbF9ndnRfaXJxX29wcyAqb3BzID0gZ3Z0LT5pcnEub3BzOw0KPiAgIA0KPiAgIAloYW5k
bGVyID0gZ2V0X2V2ZW50X3ZpcnRfaGFuZGxlcihpcnEsIGV2ZW50KTsNCj4gICAJZHJtX1dBUk5f
T04oJmk5MTUtPmRybSwgIWhhbmRsZXIpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2ludGVycnVwdC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVw
dC5oDQo+IGluZGV4IDZjNDdkM2UzMzE2MS4uMDk4OWUxODBlZDU0IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5oDQo+IEBAIC0yMDMsNyArMjAzLDcgQEAgc3RydWN0IGlu
dGVsX2d2dF9pcnFfbWFwIHsNCj4gICANCj4gICAvKiBzdHJ1Y3R1cmUgY29udGFpbmluZyBkZXZp
Y2Ugc3BlY2lmaWMgSVJRIHN0YXRlICovDQo+ICAgc3RydWN0IGludGVsX2d2dF9pcnEgew0KPiAt
CXN0cnVjdCBpbnRlbF9ndnRfaXJxX29wcyAqb3BzOw0KPiArCWNvbnN0IHN0cnVjdCBpbnRlbF9n
dnRfaXJxX29wcyAqb3BzOw0KPiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0X2lycV9pbmZvICppbmZvW0lO
VEVMX0dWVF9JUlFfSU5GT19NQVhdOw0KPiAgIAlERUNMQVJFX0JJVE1BUChpcnFfaW5mb19iaXRt
YXAsIElOVEVMX0dWVF9JUlFfSU5GT19NQVgpOw0KPiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0X2V2ZW50
X2luZm8gZXZlbnRzW0lOVEVMX0dWVF9FVkVOVF9NQVhdOw0KDQpSZXZpZXdlZC1ieTogWmhpIFdh
bmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPg0KDQo=
