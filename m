Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134F516A47
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 07:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BF510FEB8;
	Mon,  2 May 2022 05:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BC610FEB8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 05:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651469128; x=1683005128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KwtJKkQCoMRYn4UtAdqPsqkM6MuQBStyFjd4BTewDlk=;
 b=Br4aFgaqN6ZDnhaAZFI5C/fNtTudMGlJA3GaaD8PBxlryiby0T8MVat4
 hQvQU3COwKgDetrRryR9I5gV006d2IKNXD42PvDUD9FbZfLe0z269vfrG
 EVKyVK9smZyPWIA7sMulJy/bZ7O5cLMt/DVtzc4lVWauXOuyHQKVr2o9o
 IzyyDdjJovgy5+tTOiTXHxtUwd0gcWfcE5jC5s1YOCPGJv8d8+Yg3Hi9O
 eAL9heFJMTVaRJUBgeY5lQQF/HlS9NaG//iop4R5tWtfWCd9SlBrY9MLy
 /m0tZBHsNTZns0ijoBZLt89b1k6qMudQJlTrF+8OBZHPByLG5Qp4ZFY3r Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247037774"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="247037774"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 22:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="886091932"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 01 May 2022 22:25:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 22:25:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 22:25:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 1 May 2022 22:25:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 1 May 2022 22:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4yaUof6zni+0WVAtpWSoDXgCCKqqDs/eTNF0q3j5CFTC+/piX1ZY7uzWABfXS3MCiqzfAOODwByz5VgpKYtCidpX6embxqhOdWUVtVBD+InLwwXwun+xcJmopXaEYLub8dN/ACBENwY/MGXn+JDDNhAizAL2wrP9frhy/kzbNZO/FWlW33gzYf4/Xdgz88q8BH4+SoBjMKkGdJkwrO+4n7eM0xo7RBNVtk6VFWnDUC2n0/cmYQnONWo+Tk7ypTQZNiOUcU10FOPuS21gjqmL7hjUoLxjMbQfI2l8qPgQWzqwFGjgN4XE9JrfUY5iVAo3QUjmTGFqkbwF8SC3BbPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwtJKkQCoMRYn4UtAdqPsqkM6MuQBStyFjd4BTewDlk=;
 b=GywHPV+V8dWcnFL3Dbay6LhLFVGqbtFohM4sMc2rFpNjnuSRGytJmljTPt2CV7DyXiAi1+hc7B0MXdf9S06x3oyUmTNGQdFqfIbdZREW04unSQfiDtH5g7dfO+rXO6cOyvTre/D2z6/FDu5zkdICOHkn0AGTwMoN1JPuOT1ATGcKpQvqH0tbcsGfiE3lcUWQEUipFIi74LU/tx5bpGjZHUKuofNm1m4ruT68TU19hdMRdJMHvAJAxnNzkKP2W56c79qjXk0yT7yJVR0l/xatHb9ojbUBz/jAV7GMV5tbK/tM5ybZH2itEQM0MgHhfh8L4Mwa0DO9jygLYYIOjAGnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BL0PR11MB3203.namprd11.prod.outlook.com (2603:10b6:208:63::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.14; Mon, 2 May 2022 05:25:26 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::f57a:5607:7129:4e48]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::f57a:5607:7129:4e48%6]) with mapi id 15.20.5186.028; Mon, 2 May 2022
 05:25:25 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH 0/3] HDR aux backlight range calculation
Thread-Topic: [PATCH 0/3] HDR aux backlight range calculation
Thread-Index: AQHYWWmDGizMIc4EkE688jaDUzr+Wq0HkG6AgAOGyoA=
Date: Mon, 2 May 2022 05:25:25 +0000
Message-ID: <b5784be7c0f11d30e2b37ed3139237e05b0cf80e.camel@intel.com>
References: <20220426123044.320415-1-jouni.hogander@intel.com>
 <5615f5c31fda5e9faaa9d3e4cab7fb23271ec745.camel@redhat.com>
In-Reply-To: <5615f5c31fda5e9faaa9d3e4cab7fb23271ec745.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6306902-f8ad-4999-f865-08da2bfc29a9
x-ms-traffictypediagnostic: BL0PR11MB3203:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB32039FFA9A11085448E146E68AC19@BL0PR11MB3203.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yL8/x0W8aPPbg+oQCDlZ4geVKgMwPcFg9HUt0dXUAqLK+pao6K6WVuVFRQzGYRgtbbsPVZPLB8t1DAavN9MjXLO5Nq+sCI6AS6V6v5cEnHxLIB0/3cIEACBQs+2tnuWqs/rJiiIjy457dHDDAvrbN9INx63QHNVFHmSf4BeGJ3KvK6trA5igO+o7twvaeqhQwy5kVgougUfpbSmACunGZ3DOfOs6Blb/kv5y4GBeWRJ9w/8+DawEJiL5PqFWybob4MrLL5vm42nyHLDzC0/0LmGRjuU8qVC8l2mwAFIHvgrFKjENdjKllkhUoq+aA+H0yh3K1GTxfnj9rFHvmsF1Mw0DOUF367aBkBJ2t4tctDkUCk6J+HGWCHiXYTpSJnvvggpdoeGvFgrTR6MTD+LXELzPzPokadh3i9XzFJNpPBB/zR6IBKwhK0U1CHaqnYQti7vzz6suKc4MDV3cB58g1vp6vbfU7tXb8T2AJRJF7d27asiBX1eQtwcsd3x9AlyhaZy/KNLIgibW0Xc84fbyjglNRRJfuBhzSIlCMM7kNB17kzrPEltfWF5YDOB0C+ywTeD18FBjItNmYTaU0/5IeXJaCc2xivLkyr1e4JgMrTGfs75a8YNn6dOPls3X8fxHVRqXeYeuFFyhquKex7F8hf19f9LXgTkUYGd3a12RSdR8up5UhreBwZTaDD5POCNcF86b8ZcFpQgw6mka6Q57+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(5660300002)(54906003)(110136005)(71200400001)(8936002)(6506007)(83380400001)(26005)(2616005)(66574015)(36756003)(6512007)(122000001)(6486002)(82960400001)(2906002)(86362001)(508600001)(316002)(66476007)(64756008)(8676002)(4326008)(66446008)(66556008)(38070700005)(38100700002)(66946007)(76116006)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0VCOEtNVkRLTXFOOFZ6Qk1GNjJ1eXZTUElXQ1ZrVGE1aUIrMzVqL2hpWGtR?=
 =?utf-8?B?U3J5aXVMbGJHN1RBYmhtM0xPMWMvUUR5VEdMMER1MUFtWGFDU1RCdFZoSis4?=
 =?utf-8?B?dm1vSnRjSzlwUjdHL0NTZmNFbUk5Y3J6ZGYxblJwZE4wbHJsNmN2djM3UERG?=
 =?utf-8?B?b2xzUGszbEhzYmFRc0t4UlRRdDNFNjdDcnFuVHQzMk9vSWwvdnc5M3hSUHRp?=
 =?utf-8?B?LytrU2w1SlNycU93N1lmQUZ0Yk1ZbGZqd2hLemRjZHVFMjFNVW44aWlKeHJr?=
 =?utf-8?B?Q0wzVGVubFYvUHVOZTNRYndpRXNZdUhzMmNvZTVEa0xOYlpQa3VGRWRySVJN?=
 =?utf-8?B?RkxjbldmWk9kcHJwUnFUTnUzWUs5ODJ3REk0Y2VlOThMVFo0Yk1rTWpkdExn?=
 =?utf-8?B?cnZjZDJ5S1l0UjBHbm1DZmsxQU12Um13UVU2YnpBR0JpcmJ2ckhBeVliTnlM?=
 =?utf-8?B?Sld6N01OTDlWLzFKNDNLTVZuNWRSVzFnaDNVNFdUd2VackVSa3c5elV4N1lP?=
 =?utf-8?B?NjZPZDVEVzlrS2dRN1MwaWU4SVphL0l6UmFuLzUyR2Vndmc5ZzVjN1NzNTkw?=
 =?utf-8?B?RXdkWUV4cERid0FaVHNnNC83VkxDR3czSnVEVVk1Sk1oQUh1U2xFVzhWZHFW?=
 =?utf-8?B?WnNkSUR3K05VNzVvcGlHb2ZrZCtndGZXeWdjOVVsM1hodnEzU2l4VFViV3JY?=
 =?utf-8?B?Y3NseHE2WHVxODBaNXZxd2Zuc3JCZ0xHcHhybHNHQVAwenJPTlA3NUFVU0Z1?=
 =?utf-8?B?OGFTc0NlQThidE1lWkQ4RmlxYkFDUnd4MzNReVlNOVVOL2k4ZEd0TC9mb09u?=
 =?utf-8?B?ZlNxcVFaUWJlaVhGTGVMR3VtWUdJeG5hdTBhRkhOTGtFLzh0cjc2NTZMVUN5?=
 =?utf-8?B?eUZCRXd6M3g1UUZUU2YvaGlkMVVPSk0wUzhuS0VaUURZWWlNRXBJQ3VBNkNh?=
 =?utf-8?B?R1lJbEtWSmV2V1VtYzl4dXNLbkpHTWRUTlBZQzFJd2ZDMjFhMzQ4bUZWd3NB?=
 =?utf-8?B?dTI3UWtjMXFTZEhuSXZjV2w3SW1NOFpQTHRCMW83eU9tVEJsODhOV004SE9x?=
 =?utf-8?B?L2lWa3BkSEU4di8rdUZPNGFMaTU4Q1JySHNGRnc2ZEJtUXZvNy9FUTJRdCtS?=
 =?utf-8?B?S0FRd2VIUU9xSCtBdlhQYVNHZ0QvaVlOQmQxZGdUZCtPVHgyTFp6dTNicFBO?=
 =?utf-8?B?WE04NXdyS0pPSEZ2Z3dESjN6dTIzRmhBaVJSck9FRXhtNjRTMndVaE1XUzdI?=
 =?utf-8?B?WklsaTQybjFCd2xuV3lhMmI4L0lWcjZ5UzJWeTRvMjB3UzhFa1NaTG1mdytz?=
 =?utf-8?B?WW9mTlVvNy9CQXY1Qkh5RnVUMTAvVTFGNUtEZE1Tem9RWjAvTXpLQTAyMUNi?=
 =?utf-8?B?SjJvdE5uVHJtTVgrakppeTkrdzBkRFdLMko0S0dKa1lBek9MSkl3M1BJRlZD?=
 =?utf-8?B?cVVBdllWNnIzS2htSjZ4MEpJWlQ5MDUxRERBcUJwL3Voc2VvRnE0OUNSc3hR?=
 =?utf-8?B?ZzgxUjRqZi9mSEFUbkF6TmtxTGNRczRGWExuQUFRQlBKZXJZSnlZODBveE5l?=
 =?utf-8?B?MmRwd3JwUFhXUWJUUkhDYi9wazAyamdPM2YvTHgxbFdrdGV1K2NYYzZ0Wlli?=
 =?utf-8?B?TkJYKzFpZHNsdU9CODN3RGQzN0xUVFF6L0NZaWt5VU5abk43Z3A5bHYrTHBk?=
 =?utf-8?B?N01aa2tsbFlZRG0wSmVEOFkvNGlwYlEvZUhoZ3FMMWNsc2Rxa2NiOGxHdUhw?=
 =?utf-8?B?ZHJxblhkZmJVcWkwbmRWK1RYOU12ZHZXSDVBOWdIZTRMVi95ZEt2LzdCTDF4?=
 =?utf-8?B?dWlYRlZQUU1DSCtIMUJqVVRWSjFGVmhvRlU4ZmNTbHN4ODVLN0pOSHBaNE1w?=
 =?utf-8?B?QmRCRENXS09PNlB2Y2wzcGw1ZFNTbWxnb1ZEU21vbEV3YmJhNDVTQXNncjdk?=
 =?utf-8?B?UzVIalFUaURvK2ZTR1RSaEZhYTY2OUgyMnZ1TFRWUVYyMnBtWDloVlFBT1FX?=
 =?utf-8?B?YTUyNHlkNWlGWG4xQkVhKzl0Q1VVaU5uUmxDYlBkcEpJSm9KT20zVmpuUTM4?=
 =?utf-8?B?TlpDWTFBc3FsUysvK0cyMUxCVW1YckU0ZzlEdmxGNjgwSTdEbEpRdSsybUxt?=
 =?utf-8?B?bVNNRll5TlJLcTVmU2dPY09TVER1Z3ZtMEJKanpVRmlhSUJUN2tWVVQzT1Q3?=
 =?utf-8?B?dTkvRXd2YUtGQ29pZXJWNjNDeExvT2Jpc29XZ1RHZStEdWlKeWs1V3k4MG1n?=
 =?utf-8?B?OWFmZVpVSlE3dWdjTkswMG0vb0YzSnVsRWZiY1gybDlPOVorTnlmVjZmcktN?=
 =?utf-8?B?Tmk3ZHhOYjE3NjgzSTdwMi9YNTdWbmNzVE1LdjJ2QnU5T1JIank2VENUV0xU?=
 =?utf-8?Q?MITWtqBfozljHXyftMcoUwGFX/cTdfi0vhPVi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <222ED8D4E6A66842AA022D30A67A674C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6306902-f8ad-4999-f865-08da2bfc29a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 05:25:25.6635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fxWTtiok/Df6AyRFYLuHhxOsGhqMMeZJXtivqCgqngk6fe2mMrvoyvtBaD79grHN744731zs6VF6zDr9XQ0QP30ajaez9AlXSBpyE/cUywg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3203
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>, "Kahola,
 Mika" <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA0LTI5IGF0IDE5OjM0IC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBD
b29sISBUZXN0ZWQgdGhpcyBvbiB0aHJlZSBkaWZmZXJlbnQgbGFwdG9wcywgYW5kIGl0IHNlZW1z
IHRvIHdvcmsNCj4gZ3JlYXQgb24NCj4gYWxsIG9mIHRoZW0uIHNvLCB0aGlzIHNlcmllcyBpczoN
Cj4gDQo+IFRlc3RlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCg0KVGhhbmsg
eW91IGFsbCBmb3IgcmV2aWV3L3Rlc3Rpbmcgc3VwcG9ydC4gSSB3aWxsIGNvbWUgYmFjayB3aXRo
IHVwZGF0ZWQNCnBhdGNoIHNldCBsYXRlci4NCg0KPiANCj4gV291bGQgcmV2aWV3LCBidXQgSSBi
YXNpY2FsbHkgaGF2ZSB0aGUgc2FtZSBjb21tZW50cyBhcyBqYW5pDQo+IA0KPiBPbiBUdWUsIDIw
MjItMDQtMjYgYXQgMTU6MzAgKzAzMDAsIEpvdW5pIEjDtmdhbmRlciB3cm90ZToNCj4gPiBUaGlz
IHBhdGNoIHNldCBzcGxpdHMgb3V0IHN0YXRpYyBoZHIgbWV0YWRhdGEgYmFja2xpZ2h0IHJhbmdl
DQo+ID4gcGFyc2luZw0KPiA+IGZyb20gZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgaW50byBncHUvZHJtL2RybS0NCj4gPiBlZGlkLmMgYXMNCj4gPiBhIG5ldyBmdW5j
dGlvbi4gVGhpcyBuZXcgZnVuY3Rpb24gaXMgdGhlbiB1c2VkIGluIGFkbWdwdV9kbS5jIGFuZA0K
PiA+IGludGVsX2RwX2F1eF9iYWNrbGlnaHQuYw0KPiA+IA0KPiA+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBSb2RyaWdv
IFNpcXVlaXJhIDxSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20+DQo+ID4gQ2M6IEhhcnJ5IFdlbnRs
YW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KPiA+IENjOiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPg0KPiA+IENjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0K
PiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IA0KPiA+IEpv
dW5pIEjDtmdhbmRlciAoMyk6DQo+ID4gICBkcm06IE5ldyBmdW5jdGlvbiB0byBnZXQgbHVtaW5h
bmNlIHJhbmdlIGJhc2VkIG9uIHN0YXRpYyBoZHINCj4gPiBtZXRhZGF0YQ0KPiA+ICAgZHJtL2Ft
ZGdwdV9kbTogVXNlIHNwbGl0IG91dCBsdW1pbmFuY2UgY2FsY3VsYXRpb24gZnVuY3Rpb24NCj4g
PiAgIGRybS9pOTE1OiBVc2UgbHVtaW5hbmNlIHJhbmdlIGZyb20gc3RhdGljIGhkciBtZXRhZGF0
YQ0KPiA+IA0KPiA+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMgfCAzNSArKy0tLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAg
ICAgICAgICAgICAgICAgIHwgNTUNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQuYyB8ICA5ICsrLQ0KPiA+ICBp
bmNsdWRlL2RybS9kcm1fZWRpZC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKw0KPiA+
ICA0IGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KPiA+
IA0KDQo=
