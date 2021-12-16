Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F26477C5A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 20:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B6C10EB83;
	Thu, 16 Dec 2021 19:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342D410EB70;
 Thu, 16 Dec 2021 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639682504; x=1671218504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C4fQMyl6Ayip+HY9NdAE7fXSL/qvntnxpSRa458yH8U=;
 b=JjpyyzpOAF65EUc5hnlrrGP94o8HTG5oyJ0zLN6dJzNI3ldVO/VzK5/q
 PbGUaYhMzGg38K3xyAIirgii9exNKidjwAVwBe6oZ+S+GxUnRc7kO0pBk
 /GXvtlufF4vkRd58sSAsZzzmDHgI/D8rEZlbeTOmRdBNKubrVCDkgrjwM
 1EkpIRbWUY9WWqnBq2d281YoelxiXQrxhdNqULK7S5Z/O6heTcH0ybppe
 i+CpohtHLc37Z6b3qXofTyxE3zSYG8mmjDfd9iH6BFS1YUaNgpl0KQC5u
 3ZRj73IA2LE2nBhs8R51sxzP2wZVUi7zDOElPyUB1YZrZHuiIYvo7h9lV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239800400"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239800400"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 11:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="605635810"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2021 11:21:20 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 11:21:19 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 11:21:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 11:21:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 11:21:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKpzQGrsxlfam3uZJkCqZ5r95vth+TMGN1Dqj65JPBZkuHChPtldH5z2NiGI0+Hz5Jy9/05maU/JB19FCF6b+tnocaTJd08dNX5psdegc4+5usSt4/BR71fK9U+8N7Ki90rTvTmVodVo6XAa7YwNyi8XX5zfv90dAZmoBaJT9nTYG+2TgDEUTBt9E3hNz61nPI3fTeI/tPcXJa3pzLx38DGEB4AVztTMTXzcDOr+Ux484WHEGEG+DuNstSL3iTbG/Hvllz9baagqRwbtOtBui5fgm4aAKuibCquJacOSHkbtXSi2Zyn4pUzE2jcVRB9R8uuogh+uF4+Fky2z2YI3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4fQMyl6Ayip+HY9NdAE7fXSL/qvntnxpSRa458yH8U=;
 b=OM+DaOwCkf515XbhWNMRUNtIh38EyAOsjNmlnzMg+poxW51uhA7/O8iO1Adyxet7Mq461gpamG0aLe0VF4EBFWlJfCcfUJQdwr1VAbpS3UibZwbdSgzmhSi4UxkeI0VIRloNM1tolxsjID0HEtSGTPtnvDUneTjk3GQdbZM7fF/RkZqno8pG0m0IF98NsOMnDd0eyELrwRR5QzgwinJAaB2R5AwRIUTblDUPA7bgIcs9jNuc53hL22smLi2lcnggDqZg7Z8jhyaN2Mgnvekde0v6ivbS5Duxb7bNQqNXJUj3P0f8/5VOJ0H/Geez0blSAL4U/SH4R7ZaXahzBtVJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by CH2PR11MB4358.namprd11.prod.outlook.com (2603:10b6:610:39::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 19:21:00 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::755d:532a:e27d:4742]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::755d:532a:e27d:4742%8]) with mapi id 15.20.4778.016; Thu, 16 Dec 2021
 19:21:00 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 0/9] drm/i915/gvt: Constify static structs
Thread-Topic: [PATCH 0/9] drm/i915/gvt: Constify static structs
Thread-Index: AQHX6P177WLLAi2p2UGSSEW6IGD+p6wrducAgANumICABqyigA==
Date: Thu, 16 Dec 2021 19:21:00 +0000
Message-ID: <42a55314-c29d-f83d-add5-d6c0932f360d@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <d612055c-e433-4bd0-b819-82e866619b23@intel.com> <YbX4TYifpiUJ4txx@rikard>
In-Reply-To: <YbX4TYifpiUJ4txx@rikard>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24cf0ab5-e7ff-4ebf-f544-08d9c0c931d4
x-ms-traffictypediagnostic: CH2PR11MB4358:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH2PR11MB43585E6CD3E8C30406EAF7EECA779@CH2PR11MB4358.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UhOoR+SFutkGj+oxBJNa2aXQDvQT/IjDYVnPvHXcbbXh8Qk9csJKaBgcvbDETMDkET397UEoUgq2LEpraZftMYzzNyO2JyB9lLJm4JJrfEudoYhMS6iB4QgA2/FFvRNM+WlLWi8JKZDDZXQqCiyR4JuuuLJQVzoSgk3Nd/JhQJIy9qEZzUV5KtcwCpOCX/F/enj34cnbhmCsvVAin2eM/S1rXZb37cAvLaH+1pP84JB/Bf7KT7w5iPTg8Krs3Kmtluk39AE/RZgCDnrOpbvQ6s+mQ+OHserI266qMOa5Wu9AlUsQcjSW5iRGRVoSJ1uivexnUy8yEM6yWc3AE8dY6NnBi5vbmd7ugdLomM4UJzpUjqpYIqoMdJy1ykm2mKOvMpshv2bE1kLH1nlvyS1gs3jmDVxfh8l51sEoAH4q5cXPQxVl2jZbGYSxPA6QsX/Uwgyxf/RIRYb19w5E2/BwJLxjsK2upOvtTPUIPZhzReR/nBzK2eSyRpeX2r+jW52FgvGY2Z9caPO6g0FJBiktvhhYISmtBepqLOLH4gygj2NPv3Qpk2NFHt/FqzNa2iBeXUhrxTukLr95NegVjw4w0lbPvv/HmtiehXpP7Uyq7UFuzyjqVVahOSZib/Pv7spPH3c6hvzWO+QOMmQZohFwgXS9ypdL6chu28/AOhfaIdkvLPNdVLMCPxjmPGqg4reqi6XWricpU0mTWeEcX6AmtvdEu/vrzqUWAuz0jN6IWDD22UNYVI9hnn5cmAxOUiRO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(91956017)(6916009)(66476007)(66446008)(64756008)(82960400001)(7416002)(83380400001)(6486002)(186003)(122000001)(71200400001)(66556008)(36756003)(2616005)(66946007)(31696002)(316002)(508600001)(38100700002)(76116006)(86362001)(6506007)(26005)(5660300002)(6512007)(53546011)(4326008)(8676002)(31686004)(2906002)(38070700005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1J4Q1F2OXRVUnBJcWhYb2pwcno5MDVpRGJVczJhTzU1TUR3SU5HQlRuVnda?=
 =?utf-8?B?a1BuMjRWOFU1M04zaXB1ZjE3VHQrTWNQbVFYTUpMdk5LMHlkMHV5cWNuV1l3?=
 =?utf-8?B?ZWZJU0pLQ2Q4OENha0FQUzNnK1VDYWZmUWNzc2p2enFRZ1N3OVZ5bytWL3cy?=
 =?utf-8?B?YVJEejFJZkVXZi9RWW8xSWZJZkNwYkh1ODdpUVdNWktFVDZUQzc0bFJ2dm5w?=
 =?utf-8?B?Y0tBM1BwZThqdVZpYkpnQVArVXpNVGFDR1A3KzIwSDI5NFpnYmxrcEpQbUJS?=
 =?utf-8?B?aEJZeURzdG9WQWJuVVBkVTcwdmxWaFBla0J2a0tENVhIZ1VSdVhadlNlT0JI?=
 =?utf-8?B?TCtmUjJSZjZBVlRUaWhlQWxEQy9VN3ozeVFqaThHQm1xdHo3M2NUSWhocnNH?=
 =?utf-8?B?OEV1d01UTEFGclQwZ2VDSUczWHMyY3U3ZjBUbkhjYnAxZ2pKZWRHam10ZlV4?=
 =?utf-8?B?TGRFSE5lTVhxRUExdXRtT0V3Y0V3TTJ0S1gwYndXQ1o2SHJuRURKQnVZei9t?=
 =?utf-8?B?WUxKQ1JTN1pBeUgrT0l6Ri9oSnRUVm9xZkloN0MvV210SzIvazU2OWpTdGM3?=
 =?utf-8?B?NVR3ZWpLbFpEbmdLWGx5bjRSU0xlVXhOQ3E2ZVNid0grZzR4YXFrSytMVTRm?=
 =?utf-8?B?czVLSWJtN3cxK2pMUXc0VkxDQkpIU3lOVExCd3NsdGFNKzJLK3hobDhLZDFk?=
 =?utf-8?B?UGwyTUNzVU1UbnRJNnRkOU5lQkZkNW9lUzFmUGw1OVZ6NzUvU3JSWXl0Ykxn?=
 =?utf-8?B?bUZlMzVTdy84ZndPaDgrVHhaeXR6L1Q2ZERxM2MwMHY3ck9OeGR6RFUrbUgw?=
 =?utf-8?B?MTM1ajk2ODQ4THBoOWUvUldDTitYZ2gvZW9HYUNrSy9yRWU0eDlHMjRRWFZP?=
 =?utf-8?B?bmxVYzlhWmdnc291M1l4YzdkbnA5b3FFeksyUGhURGtlbS9wQWx4VkYvRmdu?=
 =?utf-8?B?MkU3RklDNU03dHZmSllsZXhyaFdldmxzMFhsM3BXNEtPSmpMS1ozci9aZlB1?=
 =?utf-8?B?L0ptbUhrLzVDbWozZlAyMElSRE81d254UkVyYzRqZ082U3g0Y0FycWlkTE9G?=
 =?utf-8?B?K1ladHNHWE5aWjFiZ2lzVGw1MnorVVFJK1RPcW10WVNZR0NyQ3RldTFoZytE?=
 =?utf-8?B?U0ptNVZzcFBsSGQvSTI3blNvNklMenMrL0djd2h4VlNESlBqRTBldm40Tmt3?=
 =?utf-8?B?Y1h0eEVJM3hEZTFkMXlPSHpqOXJEdzJwSW5kVWtQV0FaTWlkNW42R0QzcU1v?=
 =?utf-8?B?bTlyZ2UzZmVuL1Bzd1Z5aWtiKzlkYW9DeEdQYk9TTE1zL1U2YnNESzEwQisy?=
 =?utf-8?B?TDB0eTY0N09kd1luYUQyUm10eXRSN2hZRGpadjdlWHVuL0FUR0s1anlnZmpy?=
 =?utf-8?B?SW02OW9QTjdTZHBMU2lkT0t6Z0pKd0N3dzQrODZsbUtQQm5CZkVmZHhIOXJD?=
 =?utf-8?B?MGJQYjltdXFvNjBrV0NOTVdOaWhtV2JnNHVtZFZjQnhneGl0VVV2eE5JaGE1?=
 =?utf-8?B?NTQza2Y0dklCK3d2RUhJZVRwNzFxb1VLM2JvK2FuYjdCNlQ5MHZSY2E3K1g2?=
 =?utf-8?B?QnBmaXFrZzNtS1pQR2dQcDdzd0licWJMd0VVRXpxNS95NTRuTGl1Q1RDTFBa?=
 =?utf-8?B?Ump4dHM0MnF2MlUyVXEvNS91MTIrN1UvOVFxbUE5YlozSVlUSzB0ZWR2cDlS?=
 =?utf-8?B?MkoybzRqQnplTThIOG5lSXhwMnQyZmlLTStiWVZWcExUbVVyTnVvYlRBUW9m?=
 =?utf-8?B?SFlsblBFU1FoNzlJTndoYm14SVpLQzN6MWloSVFrQk1xUlc1Um5LTU5ER2Zu?=
 =?utf-8?B?NkRHN3JTUmR2dFpJeVljeEtLcTZMOFF0K25sdkZhT3FCWTg1aHcxUHRYUmx0?=
 =?utf-8?B?WStWaExHMXQxSXRJTDV2RU5QcEVxOEFacUtnZFhxaHZiRUpoREZya2ZCZGQy?=
 =?utf-8?B?TVpYeUJIYlBWaWxBWW1ORFdFQzJwRytBYWVuUkpTYVRZNldld2dwRmlQRWRn?=
 =?utf-8?B?enVjZXF6Wmp6N1NNbGZ4L1pKcjc5c01YL2psZmJUckFQYzVKOFJ3WmpkWDJj?=
 =?utf-8?B?YTFCZlZhK3I2bCt4NDZUNzFXVEQ0MS9ZWnIxU0ZUdGZQQlp4UUxJbkZDZ2R2?=
 =?utf-8?B?Wm9ldTI1WVA0NW5rOFdkOGVvOUdKUUUwNE5mV1hRaDZhaURCTkZaVStLa1FB?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A9E517E70DF8748B41FD5D9A7EED2B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cf0ab5-e7ff-4ebf-f544-08d9c0c931d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 19:21:00.6010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyZ0p4broANDMtgIKv0Nd47Fqp28/rtxkA8brnfpm+MHbCMNHJZOyuKRQ0G7eTCKnV20nQZLV2D/tZSrmEHx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4358
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMTIvMjAyMSAzOjI1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdvcnRlOg0KPiBPbiBGcmks
IERlYyAxMCwgMjAyMSBhdCAwOTowMDo1NkFNICswMDAwLCBXYW5nLCBaaGkgQSB3cm90ZToNCj4+
IE9uIDEyLzQvMjAyMSAxMjo1NSBQTSwgUmlrYXJkIEZhbGtlYm9ybiB3cm90ZToNCj4+PiBDb25z
dGlmeSBhIG51bWJlciBvZiBzdGF0aWMgc3RydWN0cyB0aGF0IGFyZSBuZXZlciBtb2RpZmllZCB0
byBhbGxvdyB0aGUNCj4+PiBjb21waWxlciB0byBwdXQgdGhlbSBpbiByZWFkLW9ubHkgbWVtb3J5
LiBJbiBvcmRlciB0byBkbyB0aGlzLCBjb25zdGlmeSBhDQo+Pj4gbnVtYmVyIG9mIGxvY2FsIHZh
cmlhYmxlcyBhbmQgcG9pbnRlcnMgaW4gc3RydWN0cy4NCj4+Pg0KPj4+IFRoaXMgaXMgbW9zdCBp
bXBvcnRhbnQgZm9yIHN0cnVjdHMgdGhhdCBjb250YWluIGZ1bmN0aW9uIHBvaW50ZXJzLCBhbmQN
Cj4+PiB0aGUgcGF0Y2hlcyBmb3IgdGhvc2Ugc3RydWN0cyBhcmUgcGxhY2VkIGZpcnN0IGluIHRo
ZSBzZXJpZXMuDQo+Pj4NCj4+PiBSaWthcmQgRmFsa2Vib3JuICg5KToNCj4+PiAgICAgZHJtL2k5
MTUvZ3Z0OiBDb25zdGlmeSBpbnRlbF9ndnRfZ3R0X3B0ZV9vcHMNCj4+PiAgICAgZHJtL2k5MTUv
Z3Z0OiBDb25zdGlmeSBpbnRlbF9ndnRfZ3R0X3B0ZV9vcHMNCj4+PiAgICAgZHJtL2k5MTUvZ3Z0
OiBDb25zdGlmeSBpbnRlbF9ndnRfaXJxX29wcw0KPj4+ICAgICBkcm0vaTkxNS9ndnQ6IENvbnN0
aWZ5IGludGVsX2d2dF9zY2hlZF9wb2xpY3lfb3BzDQo+Pj4gICAgIGRybS9pOTE1L2d2dDogQ29u
c3RpZnkgZ3Z0X21taW9fYmxvY2sNCj4+PiAgICAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBjbWRf
aW50ZXJydXB0X2V2ZW50cw0KPj4+ICAgICBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGZvcm1hdHMN
Cj4+PiAgICAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBndHRfdHlwZV90YWJsZV9lbnRyeQ0KPj4+
ICAgICBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IHZncHVfdHlwZXMNCj4+Pg0KPj4+ICAgIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgICB8ICAyICstDQo+Pj4gICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIuYyAgIHwgMjQgKysrKy0tLS0tDQo+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jICAgICAgICAgIHwgNjggKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaCAgICAg
ICAgICB8ICA0ICstDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAg
ICAgIHwgIDIgKy0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyAg
ICAgfCAxMiArKy0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQu
YyAgICB8IDEwICsrLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0
LmggICAgfCAgMiArLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZF9wb2xp
Y3kuYyB8ICAyICstDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5o
ICAgIHwgIDIgKy0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jICAgICAg
ICAgfCAgNCArLQ0KPj4+ICAgIDExIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDY2
IGRlbGV0aW9ucygtKQ0KPj4+DQo+PiBUaGFua3Mgc28gbXVjaCBmb3IgdGhlIGNvbnRyaWJ1aXRp
b24uIFlvdSBvbmx5IG5lZWQgdG8gcmVmaW5lIHRoZSBQQVRDSA0KPj4gMiBhIGxpdHRsZSBiaXQg
YW5kIHJlLXNlbmQgaXQuDQo+Pg0KPiBUaGFua3MgZm9yIHJldmlld2luZy4gSnVzdCB0byBjbGFy
aWZ5LCBkaWQgeW91IG1lYW4gcGF0Y2ggNyAoc2luY2UNCj4gdGhhdCdzIHRoZSBvbmUgeW91IGNv
bW1lbnRlZCBvbik/IEFuZCBpcyBpdCBlbm91Z2ggdG8gc2VuZCBqdXN0IHRoYXQNCj4gcGF0Y2gg
b3IgZG8geW91IHdhbnQgdGhlIGVudGlyZSBzZXJpZXMgcmVzZW50Pw0KPg0KPiBSaWthcmQNCg0K
SGkgUmlrYXJkLMKgIG5vIHdvcnJpZXMgdGhlbi4gSSBoYXZlIGFscmVhZHkgY29ycmVjdGVkIHRo
ZW0gYW5kIHF1ZXVlIA0KdGhlbSBpbiB0aGUgZ3Z0LW5leHQgYnJhbmNoLCB5b3UgY2FuIGRvdWJs
ZSBjaGVjayB0aGVtIGlmIHlvdSBsaWtlLiBUaGV5IA0KYXJlIGdvaW5nIHRocm91Z2ggYSBRQSB0
ZXN0IGN5Y2xlIGZpcnN0IGFuZCBsYXRlciBzdGFydCB0aGVpciBqb3VybmV5IHRvIA0KdGhlIHVw
c3RyZWFtLiBBbGwgZ29vZC4gOikgVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSBjb250cmlidXRpb24g
YWdhaW4uDQoNClpoaS4NCg0K
