Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4276F5B5BDE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 16:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4A110E532;
	Mon, 12 Sep 2022 14:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D12510E4BA;
 Mon, 12 Sep 2022 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662991427; x=1694527427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2uGhgHgmUs9yRBTE0iWrvEVLc+uI5eJNvGr9HOXMODE=;
 b=ZfvzaM9tHnfWu0i8ohCxw0XldBzZIbd4LSoPGJlFHC45DZ1CpxlyP6Mv
 Uvl0XllfMnOfZ18sdFfFZLLCudpZOEr9cjbhhyb4Ua0Y3OMw6xS9+egSF
 QRmF8nYxRm6FlYwokpVt8J14Vf4srVa5uFs/VNhx+jhxKaEgk6GAjvDic
 H/Ax71P5zBME9zMtyAxN4m19aSiAZgR34uKVxzBsJ/5f2AmEGbzRnUzvs
 0H1sVm1Pd7VAkRKp2BIPsw69Lwoo51axWyKvx2A4kkVn+NzXIAauUT7Us
 XUrZFAYX4QR1gR5MHaCRYlnSAjAfnjWmkjalC85iNQ3bgHl8hmvyM/C1k g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="384167252"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="384167252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 07:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="678102271"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2022 07:03:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 07:03:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 07:03:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 07:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muknyEWDVYzVMjjuSzcHD/Omnxlm9CxO3SP2cbg3E8ZOMXVcBvT3WDreKw776bVFtNIeNpMLpby8XU5JPVljeAGP7kxb/hj7fu57GwsN8OjZt6+ui/dH/5etSUfyESYizGJbk2Vm+oCe3VM+gieX8SDCz0BElebzB5JLk06O6WSgcgMcmrvQeXyLYz2ChfisedXn+c3tFV7BQAwtvBYzPsHrUadKWuhgbuFhT3uJ4QAXsoB9ygkJBwFYjag9aCqRLn1PDazJ7i9WKSIyTHhqTYxlItrh1QsNJuoIovYbkdKOpXRlWKICyG79q2bvxCKLaQfWyv9InnX05sHp/TZG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uGhgHgmUs9yRBTE0iWrvEVLc+uI5eJNvGr9HOXMODE=;
 b=QTPQPQ9zaj0Y17oLXFesSBrf7+ptQMQgTV6ioFT8HXah/kQlLXACpAmMatceShyYTscpc6PND9eraIfFZxjKfbZGhh9zwacQtdAT+QyShB7drwK7BGjsvjXMs5KEzQsX4SpYStkJGvJDjjbat9CVNlfAZ7Rbzqd4jObGhBaD9NBgweDMTinncCf8jW6jj3XIzKtJJ5Atr1hTe8oFxNodGiDH6P3nnICvqeBCZblJOsMzoZyj1ZolSOhewTZuEBxv/VA4xkWndn+jdMkHiyuFHzUedtqfT5NUuCwwAyL8PGTtrjZ5uYNcSjaVG48s1HICf9RP1w28VCTGtmLCkiIxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 14:03:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.016; Mon, 12 Sep 2022
 14:03:44 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Jason@zx2c4.com" <Jason@zx2c4.com>
Subject: Re: [PULL] drm-intel-fixes
Thread-Topic: [PULL] drm-intel-fixes
Thread-Index: AQHYw4tJp2Vg5RX+106lKI3HY0HSGK3afuwAgAFa7IA=
Date: Mon, 12 Sep 2022 14:03:44 +0000
Message-ID: <d12fd0bb85b1ac5c4016bee314d94eeb52d9bb02.camel@intel.com>
References: <Yxn1WpmUJnJpqq23@intel.com> <Yx4ZOprT+BAsI2sj@zx2c4.com>
In-Reply-To: <Yx4ZOprT+BAsI2sj@zx2c4.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fda373a-f4fb-4aab-9b2b-08da94c79ae4
x-ms-traffictypediagnostic: PH7PR11MB5818:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x8V2/fxJob3atHOBeVfzdjkWi4sxjALB+qvalSSfBYQv7S2G9SvZ7gw6LyPVLaHQ4Pif4tzDORehGyFeAFqYuY1WgVUsPl7wy+Fwjw4j2U5ur2fhxtiKBiDPsspOfsSnZIlLyrOM+TpvXhEC3d9HYIZhOHB3tU56KDrY6Sk2IBCHmL5oVKx9E4HdWBwZbgbCoWv8nHKI1smZd+ZgnoZlaE30s+/rVLY6SQOX5eYbC9WAjGTgkRyQEQb9DckVaKfz477ke6T15Hq4/7Gvr27FpZ5S2PQR44KMjubHv4Gd7MJ8pM0NNrPvxxRF33sr2iw+jYVY+S8a8EByxP0wsah4NbEmUUuh/pCCpwZoi2xVE5XHtRtl53UcuQG7W9QW8JW1aCo4glp0eY3rwtla1/CJFbZNa2bR1bm5Hns53kb9o5CqycG/fna6sMFVADt5ohCFz/YPYcYLF7AONQ7HYhUEM9IKyS2zh0ze8f8D1KNnAG3p6mxoZCgOYzSS16rDiXJNspVUuBZCaMFWB9MXhtZBHq/keh64OiRv3TfsbdGjIBG0vOIRr3z7bFOaa7QJo7PPk8TBYJ1JApJobH0SukW9YelfX+lO1tXKCBESEdvSZOwQ4uZI91veEV/DJm9Nxn+wNRkcdm0mCZ2ePKgtBFK1o49wbfZL8ksfK+BKqVAcxVznrQktD/Cz9djyG25YMFhvq0GF+HTbBbnm7TXcZiiRGvtdV98QanbntGftXq3GW75ZSwaO7RB0KZL6yeEcQy5kuu0v4Rh4u0FD2yuFeGSFAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(136003)(376002)(366004)(396003)(54906003)(6916009)(38100700002)(122000001)(316002)(71200400001)(8936002)(66556008)(66446008)(66574015)(4744005)(64756008)(5660300002)(76116006)(66476007)(66946007)(91956017)(38070700005)(2616005)(4326008)(2906002)(41300700001)(186003)(478600001)(83380400001)(82960400001)(6506007)(6486002)(8676002)(86362001)(26005)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUZVY0JsMEc5VTZBRThmUWFjK0Y4ZitObjRxQVN4a0tvUjEvWVlJTXRwS0NN?=
 =?utf-8?B?dnk5aW9LT1BGSDZTZ0FYeGpFT0NVYi9lTjhrZlltQ3FVNUl3Q2pleGVjdkVL?=
 =?utf-8?B?S2VrMVBDd2F4NnZNanBheXpLbGFXQlg5NjJLem4xZ0FmaWIzRUFJTFlhRmdC?=
 =?utf-8?B?YVJMTmx5bHNCUHFubXpaUHFWM3FDbW1GYkp6Sy9vSHBmTXVieXdnUVhPUURR?=
 =?utf-8?B?dkNRTFQzZ1Izdm5JdG5uZjVGS05DZlNOejlKaXNnNnlxZVE1Y2JoVHRIcDRa?=
 =?utf-8?B?WVVEVE1DYVhqeXBMYk90TTdadVNjUDlvZUdFZmtLNExhS2lCKy9WY2c0QXZD?=
 =?utf-8?B?WHYxYTYvODdFRi92eTUxQ1YvaENZU0tFa0s3MUxqQTJ6dEJuUGNjZ0phMUd1?=
 =?utf-8?B?NktkSmE5SFFMbktuRTd3WFBoeVJUR0FTVlRlUWErRURHL0ljbjFyUFZKUmVK?=
 =?utf-8?B?ZVg2V0NxeCtHWExCWEJ4SFJsMW9oaXVEWXB1K252L0wyK0RCbHdYcVd6ZlNr?=
 =?utf-8?B?d29mWFhsVnI1djlJd2ZacWJWM0lhUi9CdnNBRmV2L3pYZXRPeGpFMFNLQ0dS?=
 =?utf-8?B?MHNmOThueGwvQ3c1cXJnTzdwcytldHViNTFUODlHK1JpN1NnUzNjQ0k3YnZl?=
 =?utf-8?B?WFlZbTFsdWdiSWpNRmJCbGYvU1llQllyYWJQQmx5SlpXK2Nrbi9ZUk03SjRH?=
 =?utf-8?B?cFRSOXVHMTE2TjdxNXNhTDFla29LN2YrNnVHMTVVbisxVSs0bU5Id1NHVHM1?=
 =?utf-8?B?QUZnUmpoM1RDTzVUemZQV3FzQ1hFcnh1ckRUWGlJSWlkMFhQbzMycEI2b1Rn?=
 =?utf-8?B?eW4zZU9KK2RTMTVNNmVrdzluUWlwV0Y5NllyNzA5bWpCT0hnaFNmZGV2dStB?=
 =?utf-8?B?YUhKZ1pYZlArb3V3a2hMQm8vVXdCMWZ5bGZ6T3BPdzVZcVNucUVNZGxaNjhB?=
 =?utf-8?B?RGtiQ2EyVjd2eEFZaWJlbDhxMW1uL1JTZXdwdit5Z2xrcmdXMm9yb25SVXVz?=
 =?utf-8?B?UFBPS2pqQ3ZFaXIrM0UxajZGTzMzR2dpWEJPam8xYmRaenllRDhSYWl2NnRN?=
 =?utf-8?B?dm9HcER6bk90eU1QS3h6WUE1ZWxxZzU1RExlQmF5MU9UTDJ3Mm5XSitRVFJS?=
 =?utf-8?B?a1FRMjluc0I3dnBKVmNlbXZ5YVFybUVPamRmdWJONEI2cGhaOXFEblFUK3RE?=
 =?utf-8?B?UGt3cHRuOGhrdENTYnVKZC9mcENYMXhnUmJkZTl6Y3YvVWd5alFvSmltUWFN?=
 =?utf-8?B?ZW5Ud1RTcEd4TkMyL0gwS040MGthbUtPSS9pYnhBYzkwSDY3cUJmZjg0c0lU?=
 =?utf-8?B?amNxZFhpZWFWNkRWNjVvZHZzbEhDODE1Q0EwZE0yN05wTnBZS01ENldoMmxN?=
 =?utf-8?B?YmZUbm1WckVRZXBkMG5YQ1BiQUpkR2c2QnY3VlkzTmZxYTFmaU5lVWlIbjlQ?=
 =?utf-8?B?MHByS1JSUXdtaWZSRjNwZTZMOXdudGpqUXJmUFJ2QXhpSXUzdDIrdE9McmY2?=
 =?utf-8?B?QzJJaWM1MlFwUjRuYmJPdzJkUVB3OS9IbzhCeGxFYkU3Ui9TSlN4YTJibVJX?=
 =?utf-8?B?WDdMWS9NZXlSMThoZW11NVF0RnRneEY0cXV6d0NxUDRJVVZ5cS9PZWEwZlpr?=
 =?utf-8?B?S1BYRUZHUHh6T2dtT1FwZVpDS280aXVEdWtzSVEyU205MWo5TXRmYVkxMGxR?=
 =?utf-8?B?MVBTd0FscUtqVlpISDYxRktHZWhBdUl0aUxsZ0poMUc2UzN5cEFvcEpGRVla?=
 =?utf-8?B?bG91S0drOWV5Nkx0cTZ5QWtqOEloVEM3RHV1QittWVV5ZVRCWlNucEZwWkY0?=
 =?utf-8?B?S3VoZ3pVTGs0MFNZTks3QVlkcFBJL1RWbTNSSTBoYkFZdVdvL0s5UjAwckpI?=
 =?utf-8?B?RHJ6RWluVmZRNHNram5lR0Qxd0xKS0NSNk9nOUNyWE92cVV6M3RLcFQ1RnR2?=
 =?utf-8?B?ZnNLeXFsdXFFNmZqK1B1V0ZrZTV4bHJHMFY4QW41QmRKdzFRZWZTS1JyMGZo?=
 =?utf-8?B?YnR5dHFQaVRQbGsrS2p4M0F4N3BxSjNhMnpsNU5QOUQ5Z20vRjFSYVNDS1dD?=
 =?utf-8?B?Yi9NdGFwUFdpMnU0cmZrUFFkbkd4TTJGTU1vdThBNlB6WHptWVZ2a3VVSGZM?=
 =?utf-8?B?Z1gwRjdUeHJFbUtzS2xXRXBrL3lYNzRDOG1ZbkszTUZZVmVJTFp2cFg4RzJa?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCC975BF9A536341A06B9B4AB8D5AEF7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fda373a-f4fb-4aab-9b2b-08da94c79ae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 14:03:44.3797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XsHckDOFqYESTvu2LDNJQcPL09tElVr79Rwu1QhrbdB999I8t2lqYkpW9OqMy4kLeyKwW9vzcZMU0OYuXjOHRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIyLTA5LTExIGF0IDE5OjIyICswMjAwLCBKYXNvbiBBLiBEb25lbmZlbGQgd3Jv
dGU6DQo+IEhpIFJvZHJpZ28sDQo+IA0KPiBPbiBUaHUsIFNlcCAwOCwgMjAyMiBhdCAwOTo1OTo1
NEFNIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gSGkgRGF2ZSBhbmQgRGFuaWVsLA0K
PiA+IA0KPiA+IEEgZmV3IGZpeGVzLCBidXQgbW9zdCB0YXJnZXRpbmcgc3RhYmxlLg0KPiA+IA0K
PiA+IFsuLi5dDQo+ID4gDQo+ID4gVmlsbGUgU3lyasOkbMOkICgyKToNCj4gPiDCoMKgwqDCoMKg
IGRybS9pOTE1OiBJbXBsZW1lbnQgV2FFZHBMaW5rUmF0ZURhdGFSZWxvYWQNCj4gDQo+IERvbid0
IHlvdSBuZWVkIHRvIHJldmVydCBkNTkyOTgzNTA4MGE2MGY5MTE5ZDAyNGZhNDJmMzE1OTEzOTQy
Zjc2IGluDQo+IG9yZGVyIGZvciAiZHJtL2k5MTU6IEltcGxlbWVudCBXYUVkcExpbmtSYXRlRGF0
YVJlbG9hZCIgdG8gYWN0dWFsbHkNCj4gYmUNCj4gdXNlZnVsL2ludGVyZXN0aW5nPyBPdGhlcndp
c2UsIHdoYXQncyB0aGUgcG9pbnQ/DQoNClVuZm9ydHVuYXRlbHkgdGhlcmUgd2FzIG5vIGNsZWFy
IGluZGljYXRpb24gb24gdGhlIHJldmVydCBwYXRjaCBmb3INCnRoZSB0b29sIHRvIHBpY2ssIGFu
ZCBJIGhhZG4ndCBmb2xsb3dlZCB0aGF0IGZyb250IG15c2VsZiBjbG9zZWx5Lg0KDQpTaG91bGTC
oA0KNDgzZTNkODdhMzdlICgiUmV2ZXJ0ICJkcm0vaTkxNS9kaXNwbGF5OiBSZS1hZGQgY2hlY2sg
Zm9yIGxvdyB2b2x0YWdlDQpza3UgZm9yIG1heCBkcCBzb3VyY2UgcmF0ZSIiKQ0KaGF2ZSBhIEZp
eGVzIHRhZz8NCg0KT3Igc2hvdWxkIGRpbSBjb25zaWRlciBhbGwgcmV2ZXJ0cyBhcyBGaXhlcz8N
Cg0KQW55d2F5LCBJIHdpbGwgY2hlcnJ5IHBpY2sgdGhpcyB0byBvdXIgZml4ZXMgYnJhbmNoIGZv
ciBwcm9wYWdhdGlvbg0KdGhpcyB3ZWVrLg0KDQpUaGFua3MgZm9yIHRoZSBoZWFkcyB1cCwNClJv
ZHJpZ28uDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEphc29uDQoNCg==
