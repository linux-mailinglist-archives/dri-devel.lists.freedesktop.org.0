Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152A46FC78
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A565A10E22C;
	Fri, 10 Dec 2021 08:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BBD10E22C;
 Fri, 10 Dec 2021 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639123957; x=1670659957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=y+UkoDfH++8LvScfQQyFP0eDdb0jrfpLioBALziWpGI=;
 b=UwjjDWwLNJBxRqe4hpLorSRbMyiv8dA6aoDZq1xsjLgyE636tsrih52V
 9LDU/KwblFuoqEIauGmgRrBR6dUPLBkBItlRXed5MRijawJJOLcmO2jxF
 PWw6KIe3DpnA+B8P2fXwMdO7dfccnTGJHjw8W/7Wnm90pztxpDXFQefHc
 o95+ggIVb6QAv944TsLDWo0WffTLczZ/EJJdEGVXmW4+afZP0NnQxdk9y
 1JCOUJFG3VIOFzpnAjGua/tceKebRrPPkAX9EGGigvTB5i/MhbA4seq06
 dYZNWrrvPkngxYgiDHKBSAIxq3J1oZoqlE3rnFGT2E3RHZInsS9OnTc6I g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262410568"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="262410568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="462460379"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 10 Dec 2021 00:12:36 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:12:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:12:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnYJ3QPHVLJK3C+/F3EOuVT5EGuqA62o0WzYfk5/ijMT2FCkq+qFXYYieURN92oiujVRxYneyXRRbYsp7dhsE/MITDDRArDiq/DthVIf2KEEzBvswty7EWFvbLMjt0GOgpvJEKrpXdLjwmg2DBJzq0eB2/ZLaDklj14uy1JQvbQEe/FFBcFajyZ/7Hv+ygHnSq4VezJAdWGo5LSaSqcnQx0XO0TuX6syiooRtaoVyLvUUi4LZdexheAk8FLSskEA+dJP42DzY41MJGbIi3tD6mMjFckf/Y8s2p3lRGgOdCscv5h7JKOYtg2AOCoG7KOg5uClGP2s2PSAcaciscgbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+UkoDfH++8LvScfQQyFP0eDdb0jrfpLioBALziWpGI=;
 b=n5lRFdAbZSAXuI5xtQLlOCKvlUadasVU/TlBuv8B0+ZOJYDNJAXNoqMH0pOeNLPu+FNAuYw7275CBUeWDvFh8VqohkU69qUQvZ3DiB7g/Jp/b3HMD+c0dmsDo74CUb9zSny7VZ0C56a9eQLx8ATxsRRE5ze3+j372qYYGLthW4EbNUwdWpUSbJS4+WwHRYfolHRR1naeQeFpuXdWfi7wvr3vPYZlIjXxogfty/cKiSR0xPLhJm1JUDSA7+5nvs5gDjO6fRkYO2zXLejBVYRXNIGSQoDyHsEwjeuBsLkXpyVYZkhQ6GJEOOmZg+4fYaaTyP6I3C2NhedsFkXZ1rSUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+UkoDfH++8LvScfQQyFP0eDdb0jrfpLioBALziWpGI=;
 b=ugZosnuEF7ZVN2Hw20AE+HsV63yZ/XljqSxUAsgF3NLNzuER9rzHbPN9wW07OA46i6XbQ0M95r4dm3SHFIixVMtGzIRFcl5pZ0VZKTro++Z+o/xR37/koDJfr8124dQCGBt+7aqdMoVLjkVbZNYYy0OFzvfcJtOG2MaZ2rJ8hGA=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.15; Fri, 10 Dec
 2021 08:12:34 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:12:34 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 6/9] drm/i915/gvt: Constify cmd_interrupt_events
Thread-Topic: [PATCH 6/9] drm/i915/gvt: Constify cmd_interrupt_events
Thread-Index: AQHX6P1/nr1Yr7jFgkeB18KlkYt/KqwraWKA
Date: Fri, 10 Dec 2021 08:12:33 +0000
Message-ID: <cf2911d7-dbd0-e38b-4c7d-c197bc4af306@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-7-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-7-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf609f71-d71b-4f64-ca4b-08d9bbb4d1fa
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB52761EF6A050633F94A30ACECA719@BN9PR11MB5276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wZgyVa5uhJzQaM2mSnBkPgzbRFFuLAYnwWmzj6vZbnBJ5tG8mrGNga0FJhnwWLTvaDtnDau9CJPtudBN+d0/jSk5Vu4CiKcMfk0qXxRSXcQQ+e59vCj09pV2aforxF5k8Q1kjkXqQmgQr1srqnmstZXZX40mXDAGOle5mXgKOH+I+h9gv1B6bxO5vg5rIQci5WcfPt4L4fVRG9oIecSXi1YOWg13jk0F3XTNF8wSWm0k5ZAVpC0IVPXarXS4weI1VGWm4YBjFkP4OeICw3EE4oErUS9mxy4CTA+KYLbXhq17YArhxk9BtCeGao7jnnajVJTGf3r8wBhm1Z73IajEVIUFY9r/le50jRRdrYEfleYplUcnmJqFjFIrrS98RkJDbcHEnIz2GKlDTxGEiUApFVMYrOVZGfBFXU/OXEV0fkU4slCzOJZ9WoZf2WGTRUSQrX4W+ay475yQ8O9lBRRgOfD/LIInqgXdQxQbiHR/maKESKqjSrQdlpLp6jcwb1esv5+ExFAau4TAW2fGiLVIvP/n4cTVB0J+82HBDs6Wg2FIrLeG+THKZd8QYlxDGH6rqUuAHD18j9N5aVSkFKxGe6aDuBB/Tbf2gbg1LtvU7MQW5CYB+5o1erJmRuc6qpzecQz0exAsWym6CfYdoKCzmK3lMZthd+p4uiwwUFWRYzwIm0s+KxzeIfZ0KJ/5kkA7ywWSM7P2fDmcMeLTNpFUdtcZdRIepE5LWxHm9JddOaWbaWZLsPrio23SPnWGOmxrLgqyCITv5FyCRdFTjPrCcg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(66946007)(2616005)(31686004)(36756003)(66556008)(64756008)(91956017)(76116006)(66476007)(6512007)(31696002)(4744005)(83380400001)(7416002)(5660300002)(508600001)(8676002)(8936002)(53546011)(71200400001)(6506007)(38100700002)(186003)(6486002)(38070700005)(4326008)(26005)(122000001)(110136005)(86362001)(82960400001)(316002)(2906002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFNNM2Z4Y3Zwa0tJalZ0c2NEOG14eTVJWjNHQ3NPVVhncmtJYUczY2FSRlUr?=
 =?utf-8?B?OW5Tb2NWaUNQOFZKcnZIU1JDaUVlR2JxYmI2YXhsVFlINnpOSnY1RHdNQ3lu?=
 =?utf-8?B?WkZJTk91YkRxRlRtTGNEUzcwWGZlM0FnaEVabitiKzV2L3BpUDNtMHFqWlRw?=
 =?utf-8?B?VzB5eElMNnhzT25TZUpQR1NlV0VTYnYzZUdId245QkhMcU1PUVJwdFlqQzYx?=
 =?utf-8?B?b01JMFVVb3IxK1I1ZXBsdTdTZFhDaTFKWWl0N0RwMXR1bFZjc2lBK3hrbERq?=
 =?utf-8?B?SWRlODgvTzMxbW5aekM2QWNFTGJaOWJqb2xkUVNlTFg3cEg1WUVLT055ajdF?=
 =?utf-8?B?YzFTWTRiRGh0NmdSYkozaklzT1VIZ205VnlNWjF1T3lwZ1FDcktmOUpHZFdF?=
 =?utf-8?B?dU9yMy9wb2daczBaWlR1aFdrbVFQejl4VGh0VkdSZXVJcnVOazQzMVlKL2Rq?=
 =?utf-8?B?eWRGMURNd1dzaUs4dEZ6M3hFVlF2M1A3TVdOTTFhRE8vOE8xYkZEcmJXRE9W?=
 =?utf-8?B?RXE5Z0Q4L0JhbFJsU2V3Z0dWSTBvV2I0WlU1WUl1WTR3UFR3aWJ0bVE4bjl2?=
 =?utf-8?B?SHZvSGZvS2F2UmRCMU9JbDVGV3htalk0OWhIdW5vcWVzQmE5b0EycWtTSVUr?=
 =?utf-8?B?S3oveEswWW5SMEM3ZlB4djZMZUVUQm4xQkcrdDN6SE9UeW1rc3lnQ1pVYWtk?=
 =?utf-8?B?M0g0V0UvVzFCRUgyR09HVWJRcGx1aXdFODFEWFd1QVVTYkVwMmpNbTYzeS9G?=
 =?utf-8?B?dU0zL2k5MFlkZ0paYmVvaVV3TGs4N2R2YmhheG1mOVo0MnlUcGZDYWgzTTU1?=
 =?utf-8?B?QUdKZ1diMWJOVFc2bmpHQy9kSzlVRHJLRDVKY1c0ek1JR1JqalFVeWtmQ0xa?=
 =?utf-8?B?TmxKdzhaR0F4MFJ4OUhoZjk3a1pGNGZJbnRyN29MVlc5RXB0a3FWcWNlS1ds?=
 =?utf-8?B?TjNmWE5KV1ZodWNTUEFNRFRsT0Z0OTBIT2xCU2I3a1hrMmpkTmp4cjV1N29S?=
 =?utf-8?B?OHFQVnhIdnFkSGhwNkE1SUdxN0VFRmJyTTlDOWFuY0luMGprSG50bjN5Z1RM?=
 =?utf-8?B?NmhCQU9xbkhUcTdJWDQ2TzYyc1JCZFU1ZUVablowV3BHLzFBTHU5bEd6cEVC?=
 =?utf-8?B?ZDNQZUtYT2Vtc2wyd0JweXl4ODFRTURudU8xR3ZVdGlwY3JNWFovMnZGOCtB?=
 =?utf-8?B?R3Y2MTZMelZYbTJPUzFjYk1VSFhMNWw3WThlWFl0WktmR2lUM0JQclpmMkF0?=
 =?utf-8?B?Q3FxRzlxRWNUSGtxdnNaZjhCN3hZcDBLY0xNVDlZUGljZnI4TTM4ZEVKTldv?=
 =?utf-8?B?RVZWWU9acGlZRnRkdUoycWphRnBTK1ZlTGhoR0l2aTlOdWJYSWpTZkFTUVRQ?=
 =?utf-8?B?cDdyY3RrK2hmdWpmSFhQRGlVbW5FQjhmc1dqMzgzRzZWSElHR1VobVQxaXly?=
 =?utf-8?B?MFVONjdYTzhFaXFhOWVEQW9kRS8wNndBN21Wa3ZpQURDcTR1N2VVTGpXSFhq?=
 =?utf-8?B?czZVb3M3ZHA5RjVDdERUa3JXeDdyZHFUZkREejBjSWlMRFdNa281MSsreWY4?=
 =?utf-8?B?ak9yTjY0VVJsZWpqUlBMWlhPMnlkZHJ4NGZyOHY5Z1U2NUlPS0RrRlliSU1T?=
 =?utf-8?B?Z29uNExEVWpkV05TZHIxTEFGTHRNcnhIL2F0cTlaa0tMdk1KVTJtV1piUDNw?=
 =?utf-8?B?MEx2RGtlRFZWT3NZZmJhTjFYalRLWGUrOGF6ZXprZGw4VkxsYU5kTllMbE5u?=
 =?utf-8?B?NnB2eWcyc21mL0NpTE5OY29KZkwvRU56aEZBZzd3dmM4SjlEU0M0WTh4dUlR?=
 =?utf-8?B?SlhTcEEvM1hadGZWYkhrRkxhWjhtblFaZ0xPcjVFVmJHSEI2TnJrWGVaL2lI?=
 =?utf-8?B?QTB4R1FGOXAvWmhFaDRaUVgrc1lMbmRKSUlsbGpxTjZxTURzdGNxZXB6U2RZ?=
 =?utf-8?B?eXF5MkJnR0wzN3VjbGlHYWowaDZ5ZXRSaTErM0RRUlFEeVVYaGQvRTFTYy93?=
 =?utf-8?B?WjRvMkVPWVFLYmxpeVdObjVrd2Y5akQxT1RGSldvVzBGMFJCRnZSNnA2Tjhh?=
 =?utf-8?B?TFhEQmRuQU90eVkvQm8veDhHZGhTL0JjTk90NkJFUmhFTGxxMXA5dW11blE3?=
 =?utf-8?B?M1FtQUlXZ29jT3krK2VSUStMQVpnaXlVTVd3NmJGRzV3VGg2cGZsaGdlMVZN?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A3BAD8F3B73A14B8354AA96061DE510@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf609f71-d71b-4f64-ca4b-08d9bbb4d1fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:12:34.0131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hIY6RWCo36MPw4B7YHMWZUHrQXmMdvzaLv96s6GSv9q5RjhNdBvLFbj+pqi9YpNWecHGjOOuVGnhdU0HnM59ZQ==
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

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBJdCBpcyBu
ZXZlciBtb2RpZmllZCwgc28gbWFrZSBpdCBjb25zdCB0byBhbGxvdyB0aGUgY29tcGlsZXIgdG8g
cHV0IGl0DQo+IGluIHJlYWQtb25seSBtZW1vcnkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFJpa2Fy
ZCBGYWxrZWJvcm4gPHJpa2FyZC5mYWxrZWJvcm5AZ21haWwuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9jbWRfcGFyc2VyLmMNCj4gaW5kZXggYzQxMThiODA4MjY4Li5jZTkzMDc1NDZlN2YgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYw0KPiBAQCAtMTE0NCw3ICsx
MTQ0LDcgQEAgc3RydWN0IGNtZF9pbnRlcnJ1cHRfZXZlbnQgew0KPiAgIAlpbnQgbWlfdXNlcl9p
bnRlcnJ1cHQ7DQo+ICAgfTsNCj4gICANCj4gLXN0YXRpYyBzdHJ1Y3QgY21kX2ludGVycnVwdF9l
dmVudCBjbWRfaW50ZXJydXB0X2V2ZW50c1tdID0gew0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBj
bWRfaW50ZXJydXB0X2V2ZW50IGNtZF9pbnRlcnJ1cHRfZXZlbnRzW10gPSB7DQo+ICAgCVtSQ1Mw
XSA9IHsNCj4gICAJCS5waXBlX2NvbnRyb2xfbm90aWZ5ID0gUkNTX1BJUEVfQ09OVFJPTCwNCj4g
ICAJCS5taV9mbHVzaF9kdyA9IElOVEVMX0dWVF9FVkVOVF9SRVNFUlZFRCwNCg0KUmV2aWV3ZWQt
Ynk6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVsLmNvbT4NCg0K
