Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3364DA5C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A887010E53C;
	Thu, 15 Dec 2022 11:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F6810E538;
 Thu, 15 Dec 2022 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671103987; x=1702639987;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9KfcExjaa8TSuzURM5QPuAO8mQl3fsRMN1c7ignYPSI=;
 b=P+SHitXqZEDhYI4JAsBDqf5ApxPwYX8Q8qVtFAO+PpRFWDZEQ+JT69il
 WPfbUErPlHU93TNgqtRIvhTEE6iSYhrZRT04iSiWD6d5jKLOlwzUX3/QO
 6oK1kH6R+bZNOpYJVEhe6dSy6rFPovXeBiXT+8ZdfVy2G3m8esdTwtYBz
 KOPp1aTq/14Fh8On471svS2tL36YltlZuIfu8VS6VQJBgNCCVn651+zE5
 zGL10ZwLqtwujgMIYZOz9mc0/SJubQYgA50bVxWSWfVyy9YA6xb44br1i
 +xrE7EIvAIBiA7NbQl/QTIfe1+5lZIcmq6McraAanqGwnPebG6JryH1Q9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="298332198"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; d="scan'208";a="298332198"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 03:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="823660640"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; d="scan'208";a="823660640"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 15 Dec 2022 03:33:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 03:33:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 15 Dec 2022 03:33:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 15 Dec 2022 03:33:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5sHiBCzVh3FMKtr3O3v3U6gd/FNCZKcVDcC7YhbDYBfLA18K9+s2/eNWNbPt+wU7JHuz0y7xNLUfdHHQcfgK1cu2kkcYUrZlXxDroP7/BsebeJP+FjHdeJnK5DnFALmoTkkRBQ/QQkkXReIKQ2527dMDrOewbr5WA1tpQbheUkfJbNJoUxirLV6PQJJocCcfTeVWNDfsSOMNKTOI1FZlOB3PMn1YIOMialYMAurSpgFanOVrcrvIMyLHTlBn4/Mk1nQrhLoWZAAuKkwql8lqzcGPBQFzsB+50HQ2zKZY+Xe0yyyNqEegzwJjdk46EMNV7CI3x9TSokSOOJwFslbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KfcExjaa8TSuzURM5QPuAO8mQl3fsRMN1c7ignYPSI=;
 b=aWqXu6LbVqbO9+Z+RppLu7Pcdyb1jVOxkf8Ea+CgrQCjUpfY13jQXylDErM+u2a0GgbGBRqVaDyeD9reQoal3DvG72q67ZucnYanilgbqK+Qtsl7i6NPIkZ4mGKQgguvl5vP8zVMSjOy20f0ToGeXKYEGSORLOWGAcKQYjoxxeXMYo3M26dgOaxTIXK0rWu3p+HgqkXYoshlnglky1tiA66B2GI7t5ZIIdkRKKnonRfMklniowGV3BWkFEcCc3gt632J4Fs2zjewvDn6i720EvbWBvOk4JadyeJiUM0HkG7rHTh7co/zQK3TsWj+6bp3rA7hORvZFpMdZJUf/7Ta7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.12; Thu, 15 Dec 2022 11:33:03 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::4cb1:2965:376:8bda]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::4cb1:2965:376:8bda%6]) with mapi id 15.20.5924.015; Thu, 15 Dec 2022
 11:33:03 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Dave Airlie
 <airlied@gmail.com>, Zheng Hacker <hackerzheng666@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Thread-Topic: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Thread-Index: AQHY6cLGBXkP1Tf3okih35bsJFVnIK5vEcgAgAAMroA=
Date: Thu, 15 Dec 2022 11:33:03 +0000
Message-ID: <da557524-02ff-2ac7-7960-6f710c2d41d6@intel.com>
References: <Yz8rIxV7bVCcfZb0@kroah.com>
 <20221007013708.1946061-1-zyytlz.wz@163.com>
 <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
 <CAJedcCwxioxr+4TBTdrEjAZh97J3oroSHSgax+bxSNRXCBvkRg@mail.gmail.com>
 <CAPM=9twhAL+c8mOLmidY_tEhEKwCh-CTjfs5yryOk8oGjMxuug@mail.gmail.com>
 <167110126066.5360.11413014428644610672@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <167110126066.5360.11413014428644610672@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5549:EE_|CO1PR11MB4897:EE_
x-ms-office365-filtering-correlation-id: 3ae92d50-05ab-4cf2-ccab-08dade902101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZDwM+oj5u36DKDPyV6sqI3p9WaRxaQebGMifc/B5+npUdcTHkyQ4mxAjjTJbX/ByDXd3x/ypWmt3LiNW8zVtYROZ5na7NUpKGC1lLns7L+wSTz9+kdgeR6nxqm/G8sf7V1vRAfHqiFCQVVwS15uFlseROvTKdA1nz/8hpB5KQWRqKkAE/8J/+3ysVsnmK/p7yo56br1lp+o3kks4Sb5y07dkaKocvc/+SCKrhVhCTMEo/I3jozKnuY4VsuXnGLp77Y4H7J0LbwrftVH9afiNISgcnkSuhsyUerUw5dwAPAVOXBqv3p4vbFMnaG49nF8IoNUBmYS531j5b6c/y0xtqN2m8SCNYIBSIYjPmkgktM4JFdp7Q6KuT6CY/VmDgXKxhP/Qd16PNp9kXLOFS49twiPh4y7hH1S8BGlGgFEq+xEA3bUCCi+iVZOpnyow3n2txq7XJ8w6EY46pi29L4QoAhoYiOmXa3YXUf1Q/X5dkoJKMwPDYVGdRfQVl0wBPBkYFiiHj/PGCVwi7HZdsn0mopZSj9A8VVfLb5IOGhFtWpkTK2mY2IibS5MgoIiUU6EREm3KZyAyRhwN9S47sxZhP78+N8Ds3xlPzncS3IEr38aFohsT/EoCXx558F1pcxCPuL7I1RAxT0aykZYtxVhUldP2sItyhzg/7kbK+qz5altTb1kZOwG2ZJqNa1Li43uEFdQ0w+KHgLS/7WynmckvQ9qHYO8Gq8vUrwoPdNjoTvhufMLPiJq+3AElTuoDUexS0T50ihdyII/r1toxegGg1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(31686004)(36756003)(66946007)(4326008)(66446008)(66556008)(8676002)(186003)(6512007)(26005)(91956017)(76116006)(478600001)(71200400001)(6486002)(2616005)(66476007)(41300700001)(31696002)(86362001)(64756008)(5660300002)(8936002)(2906002)(4001150100001)(122000001)(54906003)(53546011)(7416002)(110136005)(316002)(6506007)(83380400001)(38100700002)(82960400001)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zy9URXY2M2cycjdWS0dremZDUmRuem9nd0hHUGMwUDJqZk5jM25RUUdtT3pO?=
 =?utf-8?B?em9WR1k2Z2ZzK2x1VXdKcWVCbkZhRVQ2Z2lFY1hobHhQcGl6Vnd1cTZGMlRY?=
 =?utf-8?B?ZXpNUkgwVEFRbWV6Q3YwOWtPQkxCSHJqZ1lMd29vdktqRllWbVEwaG5jYXVt?=
 =?utf-8?B?NFlLU3Q2VjJpZFhlS0p1cm9ucXBXL0xwbzZEeTFvRmYrc1kvYmNSckhvZHpj?=
 =?utf-8?B?MWMzdDQ0MzZDdE94ZUFWeE1LMlpkc0NDcllyazl3b2x0bkpkSnlIZjIvelht?=
 =?utf-8?B?c1pZZVlDMEpNK0RneGtWbHczaFpqR1hJUkFxTnpRYnB1NHBBRTJIUUJuVjFq?=
 =?utf-8?B?R1F1Wm50d0FuZmhqT3FZa0dVa1RqTHFqWnVFUm5ldzlzQnQ2Q3R3SlI5S3V1?=
 =?utf-8?B?TGRDQVM5QjFhdTBQK0FPOXRnYWhVYmFlWkYwUmIyZjhJRmJhNVBrQnpzU0lD?=
 =?utf-8?B?bVo0Ym11VVNxN3M3R280TDJzTXZWL0R6cU9LbDlFaGp4SVF6REtlbm51WEp6?=
 =?utf-8?B?NTRmaU9PVmdqZ1lMMHk0RUlOMzA0UmtNbnNoMFdmcytIZElWcTYxcnRraVdC?=
 =?utf-8?B?T2Nnb3ZYQy9UR0V5VHllQ0c3ZjZZaEtGbWJqVXI5RHJhNEZmeUc4VGJvLzR4?=
 =?utf-8?B?Ti9PcTg1aWhLOHFmSmU4SUlLalppc3U5QitjcjJKSi9sZjdRMW5jb0kzcWN5?=
 =?utf-8?B?QXFIQ0ZkR2IvNk9iOG12aHlReW02b1ZsUWtqU1dwNWFlc1RBZFI2Mkx0czFT?=
 =?utf-8?B?VVVEeG9STjE4d2NvSVJkQzR0c1pBUGVKZnhPdTFzclR5b0pDSkFKSGpVdG1T?=
 =?utf-8?B?OGpPMldtRElDZjF4bU9kK29LdXNQVFplOGVPeTA3OXJxYllYTDFtQWhLVGQ4?=
 =?utf-8?B?K2pvSnNKaUV1RXVFYW5xc05LcVRJQm1QQlVPMG9vaHpHUXhKcEpjaXJvczFm?=
 =?utf-8?B?SUUrZjlvUjZxcFpmb0RqWGtKcnF6ZkZ4akRjamNsUVdUdEFqaWhNZlVuZW1l?=
 =?utf-8?B?Skp5RDN2ZWJvTDdZa2pYM0o5Rk9LbHhDblJvWnd2K2hvUTdweWQ2QWFoVkNq?=
 =?utf-8?B?S015QUQ3ZllybEcvSDdLN0E2YXdGdXp3aTBYUWtyS0ZIbzVwVzU4bFRWUXFD?=
 =?utf-8?B?N0lPd1V5WUFkTUI0aUlkQStEbVk0dmRxVDFoQTE4NFZEZW1CdEV2T3cxYlBC?=
 =?utf-8?B?M0RLTm1mQXZQa2hRRlNTNlpMN1IzV2JEUG1VNjlhYng0TzFrQldBbk5vRCt5?=
 =?utf-8?B?U1J0ZlU4OGFoYXFHWWdVZVJGbVVFZlVXMVVTM0dzTWZqUEJOdFc5Rm5mQThU?=
 =?utf-8?B?K2s4QTRuRnhwZC83RU9WMVkzRVFKRlk3Q3lvaVhKSEhmUVpaK0xLTytlOGh3?=
 =?utf-8?B?L0VVUEUrWnVhZm03S25XWC95R1FaNURZTUhwakVJQzZhamNSK3hyVTNWZkpU?=
 =?utf-8?B?UnJUTHVHVE5JYWR2U0YzVHMvZU9zMFdhenBlR2UwVm5yc0YySk91MHpOMlFF?=
 =?utf-8?B?UHp0QmpkdENyUHVlN0lUQ3BzV0RhL3lUSHIwMEtmS2pjQ25HZUlGK3p0Sndy?=
 =?utf-8?B?eVAvZ1I0ZTlqeGxoTDhCR2xHc3JXN2ZtWFVjWS9hU1NGVVFDbHB1WFowQmY5?=
 =?utf-8?B?a05nS2kyYnp0b1NQc1ZpdlREWW1zMXRhZDF2NytCclZxbjFodUI3Um9PcmtU?=
 =?utf-8?B?MkZpUmZlbkZCWTZkVmZpeFpqNEZ5Y1UxVm8xNjJOb0VPTmduRk40YkZ6empH?=
 =?utf-8?B?UjBIZm92VUNFcmpXV3llNDlXVm1mZ3gxbG9TLys5U1FGeEZXRWpSVjZuYzF3?=
 =?utf-8?B?RzE3QisydmhOOWpjN25lcjFrY3RQWjJpQXF2dGpOd3RGaWFlMUdBWXg1eUM0?=
 =?utf-8?B?NTRrdG9ibXNlVVJsdmlDU0ZIVEt5elRrbWRtT3Q4bjFLeWcyOFZOdnMzbGti?=
 =?utf-8?B?YyswZzJPTys0Rlc3SndJOGVrR3kzclhlNnZRdEIyeXdETUpHdk5JdEh2dkVZ?=
 =?utf-8?B?VU5FK3pmTlNHeFkycHYwUlV4U1FYQXVaNWJ5S2h1VTVnenNKcDlNazB0RFRu?=
 =?utf-8?B?T2dvUTh1MnRUSUlXYXM5SGpZVjB5OFBrcHhlcFVpdnVsUTdjZ1Z5amEvQXh4?=
 =?utf-8?Q?2SJM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7520FEDEEB1EC94798736A002F58EE81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae92d50-05ab-4cf2-ccab-08dade902101
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 11:33:03.6144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3g4p0u0oyQkpgzd7aZU72KaMdLyepUw5dViKKUqIBeFST66JNODCVF7p25nnLvSysDyeCxMdJlQcRUMZJjwT8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4897
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
Cc: "alex000young@gmail.com" <alex000young@gmail.com>,
 "security@kernel.org" <security@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "1002992920@qq.com" <1002992920@qq.com>, Zheng Wang <zyytlz.wz@163.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMTUvMjAyMiAxMjo0NyBQTSwgSm9vbmFzIExhaHRpbmVuIHdyb3RlOg0KPiAoKyBUdnJ0
a28gYXMgRllJKQ0KPg0KPiBaaGVueXUsIGNhbiB5b3UgdGFrZSBhIGxvb2sgYXQgdGhlIHBhdGNo
IEFTQVAuDQo+DQo+IFJlZ2FyZHMsIEpvb25hcw0KDQpUaGFua3Mgc28gbXVjaCBmb3IgdGhlIHJl
bWluZGluZyBhbmQgcGF0Y2guDQoNCg0KQWN0dWFsbHkgSSBkb24ndCB0aGluayBpdCBpcyBwcm9w
ZXIgZml4IGFzOg0KDQpzcGxpdF8yTUJfZ3R0X2VudHJ5KCkgaXMgZ29pbmcgdG8gYWxsb2NhdGUg
YSBuZXcgc3B0IHN0cnVjdHVyZSwgd2hpY2ggaXMgDQphIFBURSBwYWdlIHRvIGhvbGQNCg0KdGhl
IG1hcHBpbmcgb2YgdGhlIDJNQi4gSXQgd2lsbCBtYXAgdGhlIHN1YiA0ayBwYWdlcyBmb3IgRE1B
IGFkZHJzLCBmb3JtIA0KdGhlbSBhcyBQVEUNCg0KZW50cmllcywgd3JpdGUgdGhlIGVudHJpZXMg
aW50byB0aGUgbmV3IFBURSBwYWdlLMKgIGFuZCB0aGVuIGxpbmsgdGhlIA0KcGFnZSB0byB0aGUg
cGFyZW50DQoNCnRhYmxlIGVudHJ5IHNvIHRoYXQgdGhlIEdQVSBjYW4gcmVhY2ggaXQuDQoNCg0K
Tm93IHNvbWV0aGluZyB3cm9uZyBoYXBwZW5zIHdoZW4gbWFwcGluZyB0aGUgc3ViIDRLIHBhZ2Vz
LiBXaGF0IHdlIG5lZWQgDQphcmUgMSkgVGhlDQoNCmV4aXN0aW5nIG1hcHBpbmdzIG9mIERNQSBh
ZGRyIG5lZWQgdG8gYmUgdW4tZG9uZSBhbmQgMikgdGhlIG5ld2x5IA0KYWxsb2NhdGVkIHNwdCBz
dHJ1Y3R1cmUNCg0KbmVlZHMgdG8gYmUgZnJlZWQuwqAgVGhlc2UgY2FuIGJlIGhhbmRsZSBieSBw
cGd0dF9pbnZhbGlkYXRlX3NwdCgpIHdoaWNoIA0Kd2lsbCBoYW5kbGUgdGhlIDEpDQoNCmFuZCAy
KSBiYXNlZCBvbiB0aGUgdHlwZSBvZiBzaGFkb3cgcGFnZSB0YWJsZSwgZWl0aGVyIHJlY3Vyc2l2
ZWx5IG9yIA0Kbm90LiBpLmUuIGluIHRoaXMgY2FzZSwNCg0KaXQncyBhIFBURSBwYWdlLg0KDQoN
CkkgZ3Vlc3MgdGhlIGNvZGUgd3JvbmdseSBkb2VzIDEpIDIpIG9uIHRoZSBwYXJlbnQgcGFnZSB0
YWJsZSB3aGVuIA0Kc29tZXRoaW5nIGVycm9yIGhhcHBlbnMgaW4NCg0KRE1BIG1hcHBpbmcgLiBZ
b3UgY2FuIGZpeCBpdCBieSByZWxlYXNpbmcgdGhlIG5ld2x5IGFsbG9jYXRlZCBzcHQgaW4gdGhl
IA0KZXJyb3IgY2FzZSBhbmQgcHV0IGENCg0KRml4ZXM6IGI5MDFiMjUyYjZjZiAoImRybS9pOTE1
L2d2dDogQWRkIDJNIGh1Z2UgZ3R0IHN1cHBvcnQiKSBpbiB0aGUgDQpwYXRjaCBjb21tZW50Lg0K
DQoNCkJUVzogRm9yIHNlbmRpbmcgdGhlIHBhdGNoZXMsIHlvdSBjYW4gdGFrZSBhIGxvb2sgb24g
ImdpdCBzZW5kLWVtYWlsIi4gDQpJdCB3aWxsIHByb21pc2UgdGhlIGNvcnJlY3QNCg0KZm9ybWF0
IGFuZCBwcmV2ZW50IHF1aXRlIHNvbWUgYnVtcHMuIEZvciBlbWFpbCBjbGllbnRzLCBpZiB5b3Ug
ZmVlbCBtdXR0IA0KaXMgaGFyZCB0byByYW1wIHVwLA0KDQp5b3UgY2FuIHRyeSB0aGUgQ2xhd3Mg
TWFpbC4gTW9yZSBpbmZvcm1hdGlvbiBjYW4gYmUgZm91bmQgaW4gDQpEb2N1bWVudGF0aW9uL3By
b2Nlc3MvZW1haWwtY2xpZW50cy5yc3QNCg0KDQpUaGFua3MsDQoNClpoaS4NCg0KPg0KPiBRdW90
aW5nIERhdmUgQWlybGllICgyMDIyLTEwLTI3IDA4OjEyOjMxKQ0KPj4gT24gVGh1LCAyNyBPY3Qg
MjAyMiBhdCAxMzoyNiwgWmhlbmcgSGFja2VyIDxoYWNrZXJ6aGVuZzY2NkBnbWFpbC5jb20+IHdy
b3RlOg0KPj4+IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4g5LqOMjAyMuW5tDEw5pyI
Mjfml6Xlkajlm5sgMDg6MDHlhpnpgZPvvJoNCj4+Pj4gT24gRnJpLCA3IE9jdCAyMDIyIGF0IDEx
OjM4LCBaaGVuZyBXYW5nIDx6eXl0bHoud3pAMTYzLmNvbT4gd3JvdGU6DQo+Pj4+PiBJZiBpbnRl
bF9ndnRfZG1hX21hcF9ndWVzdF9wYWdlIGZhaWxlZCwgaXQgd2lsbCBjYWxsDQo+Pj4+PiBwcGd0
dF9pbnZhbGlkYXRlX3NwdCwgd2hpY2ggd2lsbCBmaW5hbGx5IGZyZWUgdGhlIHNwdC4NCj4+Pj4+
IEJ1dCB0aGUgY2FsbGVyIGRvZXMgbm90IG5vdGljZSB0aGF0LCBpdCB3aWxsIGZyZWUgc3B0IGFn
YWluIGluIGVycm9yIHBhdGguDQo+Pj4+Pg0KPj4+Pj4gRml4IHRoaXMgYnkgc3BsaXRpbmcgaW52
YWxpZGF0ZSBhbmQgZnJlZSBpbiBwcGd0dF9pbnZhbGlkYXRlX3NwdC4NCj4+Pj4+IE9ubHkgZnJl
ZSBzcHQgd2hlbiBpbiBnb29kIGNhc2UuDQo+Pj4+Pg0KPj4+Pj4gUmVwb3J0ZWQtYnk6IFpoZW5n
IFdhbmcgPGhhY2tlcnpoZW5nNjY2QGdtYWlsLmNvbT4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpo
ZW5nIFdhbmcgPHp5eXRsei53ekAxNjMuY29tPg0KPj4+PiBIYXMgdGhpcyBsYW5kZWQgaW4gYSB0
cmVlIHlldCwgc2luY2UgaXQncyBhIHBvc3NpYmxlIENWRSwgbWlnaHQgYmUNCj4+Pj4gZ29vZCB0
byBtZXJnZSBpdCBzb21ld2hlcmUuDQo+Pj4+DQo+Pj4+IERhdmUuDQo+Pj4+DQo+Pj4gSGkgRGF2
ZSwNCj4+Pg0KPj4+IFRoaXMgcGF0Y2hlZCBoYXNuJ3QgYmVlbiBtZXJnZWQgeWV0LiBDb3VsZCB5
b3UgcGxlYXNlIGhlbHAgd2l0aCB0aGlzPw0KPj4gSSdsbCBhZGQgc29tZSBtb3JlIHBlb3BsZSB3
aG8gY2FuIHByb2JhYmx5IGxvb2sgYXQgaXQuDQo+Pg0KPj4gRGF2ZS4NCg0KDQo=
