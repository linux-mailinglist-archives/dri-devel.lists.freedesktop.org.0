Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A07EB700
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 20:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E3410E4AD;
	Tue, 14 Nov 2023 19:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BA610E22E;
 Tue, 14 Nov 2023 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699991295; x=1731527295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JAt7wEgINXYvla38Fy8LL/Wmrozkb/nAexf//W8SXbo=;
 b=kBfiz0PAB1cbO0/n8JDSflMEHQXKbbXnclEkxeDfBh9YQZOwQ7D+yo4u
 t9gAzbXt+rQEPHlLf6TIMP4XHEX3anPxrWORa99mB/OFK3cBhWjt3GB6b
 k4fcMlJ8rtai7BUlsgdKsrZz0UJRXxjVbmmmVSk7jlxmJhL0JB4Jzu/qA
 bsB7+MBX9WN8e+4IoyIvXBO+fUryCi3uceTIjN6JW0BS6TSuyIBJmfiJf
 GG5CP5Pesdwi0SpE18uuim3C80crWq5xXII1mNtLuQXVGxhxoxrxpX6X7
 OB72hq/OgsGgsNApeHPRWIYjvVPGRjje7vbpdo3SQGYTGMjiyDdzedbd4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370930454"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="370930454"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 11:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096211997"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="1096211997"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 11:48:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 11:48:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 11:48:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 11:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJ5ysj4IQMSambupv38psu0vlS0JZxgLziIP4AGXzC4dqBBYJ05YMtvcuTjRuTohFBeXHAFus7V2un3jrxq6l3fKxndexpDHSu057RuVSM6W4ZsmpwJK0YFXzmfePx7SMKsbPLU1HBeiaP0j37KuczXISamU7CvmDZotvUS9DEYtPP3qGo385LpJtQEdQhjZ7U8jjJ0RmOftDKHzVcuTFWSbaOFS3Rsrzw8EhbXzX1wTNw+LqZl2DVq9v/qfZAYt3BeIZX9tDvnOykMHCqZoT5nZDJmyAyCaIs5z4Or4y+a8D5cVayFPyBKYxFdxu6Bg0MrX6+4EDsywPv9A/CxLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAt7wEgINXYvla38Fy8LL/Wmrozkb/nAexf//W8SXbo=;
 b=SgPXmrnoRwYBDtm35PSHx0tVKC3m7gAfgpJTUB/MSIYBJWlY0HTp/eEBnT4JIdy2ax+7OUX7pTehdi/cAHcrtph2qg+sxMh900SkcC1ENO3PRYfXmFngxTfqJp8IFQh5/bClVgdtQHZZB7DqErOjgmQ+/JPznPPn31Eh19sZu3fqCb++3Pjz7rnzfMDRa78nZO4CX/j832dQSAVsS/NlgPsWpX5X9IlRzu0zBWUbhWSRGwTlqBaaOH1aqlSZ55bnMl65W9dUoXzK3S/9exEBaU4Rfe9CBQzRNEe2A2cEFPIP4fdxCQd/IxxZb2/m9n5gjC0j/eJsGTQ3jD0umy6Ugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 14 Nov
 2023 19:48:04 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 19:48:03 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Topic: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Index: AQHZ8Kx2E7YYzy1lTkO6NJtn5NHgRrAuYVuAgAB+x4CAAVIIAIAJxYEAgCCs+QCAHi+1gIABifAAgAACywCAAAQqAIAAIF0A
Date: Tue, 14 Nov 2023 19:48:03 +0000
Message-ID: <b075538a522adbbb3b83934279b93bde9913b9e8.camel@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
 <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
 <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
 <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
 <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
 <246ecbb0dcbbc96d9e48f8de6798bd9d16961c8f.camel@intel.com>
 <dc97f378-c8c6-4841-95da-740f3ecca187@linux.intel.com>
In-Reply-To: <dc97f378-c8c6-4841-95da-740f3ecca187@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|LV8PR11MB8462:EE_
x-ms-office365-filtering-correlation-id: fb30fe24-c29d-4aac-d73e-08dbe54a9daa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JOwojxwy6UKZpMLc8qJLCweSY7YAyvIFsyN5Uk0stW35LyYzt96m13r0NM9DJypOYDDshuXV5omLlKYYq45n1bcutQnhD2YuFC5ZcmfdbGAchu7uzbNzFR3wtXeawxkmAkXKn5lPr9WhvWIRZkOhLGdH8UeJz58R59l98lYvieyt4IwIjl/+fHWk6ZwiRS2X2yruXnCmAvUreIiYIsMzub23W0XM3kVDzRXSaV9bqQYMXP3rFR1AqRMPJRejzoQh+BnTIJyrp0URGv+c+YYJF/qF0z3/d1nykytXZF++hZ/yZBFN69SsdjtFMOIPiyAh+3mxtjDYn5J80/pwsafp00sV9N7jMlDl7e8zjV0T6PkAfmvK7QHVPxyB+uEYgMxLNpBNyrBiYErPluOZ3l1pX4m9XXRuceCvoXO0DLLLVLdI3SqUTT+JrAAareuSWpl3vqjgtCYFEwTOB9f8KcpMggiY64N1TYWF0/FIHph/i9A1vgbQrNS62UHeZbVNPGvnMiD5/dnkobktZcNJPf0nHdU2ajs204tDeV51HwbzLlC8vQkanAr22PqGKGjPNfcp2sFYsNFi/47V9f/I6vI0Bc9MvGBxE4ybZL47sOb1sfE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6506007)(478600001)(6486002)(4001150100001)(966005)(26005)(2906002)(66446008)(91956017)(41300700001)(2616005)(53546011)(71200400001)(316002)(8936002)(4326008)(66556008)(15650500001)(8676002)(54906003)(5660300002)(76116006)(38070700009)(66946007)(36756003)(82960400001)(83380400001)(38100700002)(86362001)(110136005)(64756008)(66476007)(122000001)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEZRQSswYzhXejZ5Y0JTWVBhQm1GVU82d0xWVzZqYmJqbTE4MjhvT2VQMHNy?=
 =?utf-8?B?cFZWQ0hSQjVSTmdXVU54QXFKUE5DQlI5OWVaQml0ODFRbnZ5YmltYlFuR0gw?=
 =?utf-8?B?NlpWcUR5dEl0UG9XM28rNFlHaG1zVENzQ3BCdis4V0tKb2NUL3E0alZaUzl0?=
 =?utf-8?B?OXdoZ3VtMm9uN0phRTVpVzR4eXAvS0pJSUhpV2hUVTAzdU5KNWMrdlJaZUEv?=
 =?utf-8?B?VEtVM0cxemZoUUdFUmhmb3VlTzVDYXpHd2V0NVdiM2pEWXhYd0xoYjRPbVhJ?=
 =?utf-8?B?M0xJSTM2eENyV3pvRHBCQytVV1VacjlmL1V4VkhNZitLUWRGUUZ4YTBUSm5U?=
 =?utf-8?B?eGhSL0ZZSnBNc1VuUlBvaFBjUFlqN1lQSEJPbk9sSjMxNllhU2czMWx1a3ZG?=
 =?utf-8?B?dkFLcnloVkhXR3pIOHNSWEdmQ251MmZpUEFEb0d5REVuSXdVYjNKS0tzSWNG?=
 =?utf-8?B?N3lXSmFQWGJLMUdPVkV2NGoxdzhyT0FqdUJWTUVQaTlUZ2I1djA5WlVneUgz?=
 =?utf-8?B?WXpORUluVlFMd3FraHNha3dETnVOU1J3ZVdIVHVCN1dNSlNrcnhUM2htWkRN?=
 =?utf-8?B?WEh0eVlhVVBuSHFEUW1vSHVyVEpUWWhpNWxMWXlhZ0RwVFphUHU4bVhVeTJj?=
 =?utf-8?B?NjlDWTVJaFZYRWxPWXFQUnRhZitCVDRHSzJNWExtZmRqSzdDSThtbHFuMmY5?=
 =?utf-8?B?ZERiWHZTTFJVRlNSY2IzNm9xekZSSnNNUkdkaGtzc0J3RnhnaUlrcnRqekRX?=
 =?utf-8?B?cVU0WVdKTittbG5YTlhkZmxCZGFha1RoUVEvV3ZyaVN3R3BLK0o1WUlZb0NC?=
 =?utf-8?B?QjlhMENra2Jjc3VmYWJmeGRCbDBSZXUwQ3ZlcUgxNUJ1WGNJUmJLQ2M2d056?=
 =?utf-8?B?b3RoWC9LRUo0ZjByb3MyMGYyRTUwZ0FERHU2b1RRWkVDQ0o5NG80eGFxSjN2?=
 =?utf-8?B?ZnRxNHAyVWRGckk2U1p3RjFsbWRyaHpvRzBGKzRGaFRrRUtPR1duZ3BvVzZ1?=
 =?utf-8?B?MmN0L1NSUS9kSkFkY2I1Y0lCS25RT0hKcEhwTVhNNXhzRU91YVFkdExpdEN0?=
 =?utf-8?B?cDJjbEpBWFlXS2Yvd3d6NXhZVUFjNHRmcGdDdXpaRithMVIyeWQ5bnM3Z3JQ?=
 =?utf-8?B?VHVQSDBobFhjOHNnQ0J1Nk0wSjhmcW1BWStJcEdhdGtZRDEyM0ZEK2NNWlhR?=
 =?utf-8?B?dVRNOVZpUEFGcWVua0lZN09BVmV3Y1ptMUJiZWVZMTJQZC93aVh2ekpsdXVa?=
 =?utf-8?B?UUFYS0VFdW9DT1lRYTU4YUtONUNybUtCUlpkOER5NzUvYWdEZ3pFeEIweTBL?=
 =?utf-8?B?UHdyK2ZlUXhOdGJVa2ovMjJOamM3Qi9WQmQxbFpJYTdKT3pGM3RqaGlzcjNw?=
 =?utf-8?B?NjFHazlQT0cxNyticnlsRG1JaVpMYkRYQ1NzQW5qY3NMaXVGRGphcFYzZnIy?=
 =?utf-8?B?bllHRk96eWZBaU9KbDFCQVJ2QllGQ21ENUwxcTFpbnoyMVVvckp4QStvdEFw?=
 =?utf-8?B?TlJXZnk5U01hVzh6TmEybDhZK1ZOZ3lSdjBIZmRQTVBNYWxXeG9VSkdOKzlp?=
 =?utf-8?B?aGttZ1J6dXZtc0haRk0yU0l2dFpJWklUeVN1aU9XaVlNbnh6azlvbXNPdVpM?=
 =?utf-8?B?ckFCVHpxeDg3OVlscTdqTUhZY01CazgzVFR5TE9VS0xoUitoYVVlMjVuVmE1?=
 =?utf-8?B?WFp5SDhXTVNsRG9CV2tlcUorN3ZNS3lGdDFiUHNVeXh4M0UzUllQRU9SaHpG?=
 =?utf-8?B?Y2RveDRMdk9MQnE0OUZhem5DWkpxN2Y5TmwxaXlwTUQrbEJQNVk4SXArQlNR?=
 =?utf-8?B?T2VTYUYyVytCZEZFTkdxTXhVVFYvc2tPYTNvUVJjQWF4RlJRbURodTd1Y2k2?=
 =?utf-8?B?TURyTXJ0WVZjWDlnNzBtMVlGQVpZUUpkNTMwTC9PbSt1ajhzK3JNNVd1VFR4?=
 =?utf-8?B?Zm1hYlBmWmZ5dzlhVklwMWN3QVRaaDJwb1pjb1A2Nk5XMlhudG0rdTlxQ25n?=
 =?utf-8?B?bGpkV3V2UWdpZ2pydTFkSlpuYmVBQ1REVTFnWmU4V1lLNGpSQk9JYWdSc3Qz?=
 =?utf-8?B?M3BWb1BPUG9xK000czk5NFJ6TGJjZmRiRlZYMGhWQUt4M1E1ZmlwREdhSXZy?=
 =?utf-8?B?UTh4U3VxQjFsSHlXakpFVHgzUEd6K3dqT040ZS9yaWNkdy9USFIwdzdhM3Vx?=
 =?utf-8?Q?MmYQtplYmK7CBWlBjJNrsZM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E38E7332929BB445A26F39CF4551F1F6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb30fe24-c29d-4aac-d73e-08dbe54a9daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 19:48:03.8241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5q2K7txeyGbsoe8G71CH8V8CzVQ3lO+lMf8mSWyGSXBFmtRP6TJEKR9oJS2B58Tk6iT16lqXz7T3d4f3sSy+QOwEQvEwllDNBql8W9E5exZqsoOEk5tqtbCOWK0tK2K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
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
Cc: "Jana, Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTE0IGF0IDE3OjUyICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMTQvMTEvMjAyMyAxNzozNywgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gPiBPbiBUdWUsIDIwMjMtMTEtMTQgYXQgMTc6MjcgKzAwMDAsIFR2cnRrbyBVcnN1bGluIHdy
b3RlOg0KPiA+ID4gT24gMTMvMTEvMjAyMyAxNzo1NywgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZp
biB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCAyMDIzLTEwLTI1IGF0IDEzOjU4ICswMTAwLCBUdnJ0
a28gVXJzdWxpbiB3cm90ZToNCj4gPiA+ID4gPiBPbiAwNC8xMC8yMDIzIDE4OjU5LCBUZXJlcyBB
bGV4aXMsIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gVGh1LCAyMDIzLTA5LTI4
IGF0IDEzOjQ2ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24g
MjcvMDkvMjAyMyAxNzozNiwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gDQph
bGFuOnNuaXANCg0KPiA+IGFsYW46IFNvIGkgZGlkIHRyYWNlIGJhY2sgdGhlIGd0LT53YWtlcmVm
IGJlZm9yZSBpIHBvc3RlZCB0aGVzZSBwYXRjaGVzIGFuZA0KPiA+IHNlZSB0aGF0IHdpdGhpbiB0
aGVzZSBydW50aW1lIGdldC9wdXQgY2FsbHMsIGkgYmVsaWV2ZSB0aGUgZmlyc3QgJ2dldCcgbGVh
ZHMNCj4gPiB0byBfX2ludGVsX3dha2VyZWZfZ2V0X2ZpcnN0IHdoaWNoIGNhbGxzIGludGVsX3J1
bnRpbWVfcG1fZ2V0IHZpYSBycG1fZ2V0DQo+ID4gaGVscGVyIGFuZCBldmVudHVhbGx5IGV4ZWN1
dGVzIGEgcG1fcnVudGltZV9nZXRfc3luYyhycG0tPmtkZXYpOyAoaGFuZ2luZyBvZmYNCj4gPiBp
OTE1X2RldmljZSkuIChuYXR1cmFsbHkgdGhlcmUgaXMgYSBjb3JyZXNwb25kaW5nIG1pcnJvcyBm
b3IgdGhlICdfcHV0X2xhc3QnKS4NCj4gPiBTbyB0aGlzIG1lYW5zIHRoZSBmaXJzdC1nZXQgYW5k
IGxhc3QtcHV0IGxldHMgdGhlIGtlcm5lbCBrbm93LiBUaGF0cyB3aHkgd2hlbg0KPiA+IGkgdGVz
dGVkIHRoaXMgcGF0Y2gsIGl0IGRpZCBhY3R1YWxseSBjYXVzZSB0aGUgc3VzcGVuZCB0byBhYm9y
dCBmcm9tIGtlcm5lbCBzaWRlDQo+ID4gYW5kIHRoZSBrZXJuZWwgd291bGQgcHJpbnQgYSBtZXNz
YWdlIGluZGljYXRpbmcgaTkxNSB3YXMgdGhlIG9uZSB0aGF0IGRpZG50DQo+ID4gcmVsZWFzZSBh
bGwgcmVmcy4NCj4gDQo+IEFoIHRoYXQgd291bGQgYmUgbXVjaCBiZXR0ZXIgdGhlbi4NCj4gDQo+
IERvIHlvdSBrbm93IGlmIGV2ZXJ5dGhpbmcgZ2V0cyByZXN1bWVkL3Jlc3RvcmVkIGNvcnJlY3Rs
eSBpbiB0aGF0IGNhc2UgDQo+IG9yIHdlIHdvdWxkIG5lZWQgc29tZSBhZGRpdGlvbmFsIHdvcmsg
dG8gbWF5YmUgZWFybHkgZXhpdCBmcm9tIGNhbGxlcnMgDQo+IG9mIHdhaXRfZm9yX3N1c3BlbmQo
KT8NCmFsYW46IFNvIGFzc3VtaW5nIHdlIGFyZSBzdGlsbCBkaXNjdXNzaW5nIGFib3V0IGEgInBv
dGVudGlhbGx5IG5ldw0KZnV0dXJlIGxlYWtlZC13YWtlcmVmIGJ1ZyIgKGkuZS4gcHV0dGluZyBh
c2lkZSB0aGUgZmFjdCB0aGF0DQpQYXRjaCAjMSArICMyIHJlc29sdmVzIHRoaXMgc3BlY2lmaWMg
c2VyaWVzJyBidWcpLCBiYXNlZCBvbiB0aGUNCnByZXZpb3VzIHRlc3Rpbmcgd2UgZGlkLCBhZnRl
ciB0aGlzIHRpbWVvdXQtYmFpbCB0cmlnZ2VyLA0KdGhlIHN1c3BlbmQgZmxvdyBiYWlscyBhbmQg
Z3QvZ3VjIG9wZXJhdGlvbiBkb2VzIGFjdHVhbGx5IGNvbnRpbnVlDQphcyBub3JtYWwuIEhvd2V2
ZXIsIGl0cyBiZWVuIGEgbG9uZyB0aW1lIHNpbmNlIHdlIHRlc3RlZCB0aGlzIHNvDQppIGFtIG5v
dCBzdXJlIG9mIGhvdyBhY2NpZGVudGFsLW5ldy1mdXR1cmUgYnVncyBtaWdodCBwbGF5IHRvIHRo
aXMNCmFzc3VtcHRpb24gZXNwZWNpYWxseSBpZiBzb21lIG90aGVyIHN1YnN5c3RlbSB0aGF0IGxl
YWtlZCB0aGUgcnBtDQp3YWtyZWYgYnV0IHRoYXQgc3Vic3lzdGVtIGRpZCBOT1QgZ2V0IHJlc2V0
IGxpa2UgaG93IEd1QyBpcyByZXNldA0KYXQgdGhlIGVuZCBvZiBzdXNwZW5kLg0KDQo+IA0KPiBX
aGF0IEkgd291bGQgYWxzbyBhc2sgaXMgdG8gc2VlIGlmIHNvbWV0aGluZyBsaWtlIGluamVjdGlu
ZyBhIHByb2JpbmcgDQo+IGZhaWx1cmUgaXMgZmVhc2libGUsIHNvIHdlIGNhbiBoYXZlIHRoaXMg
bmV3IHRpbWVvdXQgZXhpdCBwYXRoIA0KPiBjb25zdGFudGx5L3JlZ3VsYXJseSB0ZXN0ZWQgaW4g
Q0kuDQphbGFuOiBUaGF0cyBhIGdvb2QgaWRlYS4gSW4gbGluZSB3aXRoIHRoaXMsIGkgd291bGQg
bGlrZSB0byBwb2ludCBvdXQgdGhhdA0KcmV2NiBvZiB0aGlzIHNlcmllcyBoYXMgYmVlbiBwb3N0
ZWQgYnV0IGkgcmVtb3ZlZCB0aGlzIFBhdGNoICMzLiBIb3dldmVyIGkgZGlkDQpwb3N0IHRoaXMg
UGF0Y2ggIzMgYXMgYSBzdGFuZGFsb25lIHBhdGNoIGhlcmU6IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI2NDE0Lw0KYXMgaSBhbnRpY2lwYXRlIHRoaXMgcGF0Y2gg
d2lsbCB0cnVseSBoZWxwIHdpdGggZnV0dXJlIGlzc3VlIGRlYnVnZ2FiaWxpdHkuDQoNClRoYXQg
c2FpZCwgaSBzaGFsbCBwb3N0IGEgcmV2aWV3IG9uIHRoYXQgcGF0Y2ggd2l0aCB5b3VyIHN1Z2dl
c3Rpb24gdG8gYWRkDQphbiBpbmplY3RlZCBwcm9iZSBlcnJvciBmb3IgdGhlIHN1c3BlbmQtcmVz
dW1lIGZsb3cgYW5kIGZvbGxvdyB1cCBvbiB0aGF0IG9uZQ0Kc2VwYXJhdGVseS4NCg0KPiANCj4g
UmVnYXJkcywNCj4gDQo+IFR2cnRrbw0KPiANCj4gPiBhbGFuOiBBbnl3YXlzLCBpIGhhdmUgcHVs
bGVkIHRoaXMgcGF0Y2ggb3V0IG9mIHJldjYgb2YgdGhpcyBzZXJpZXMgYW5kIGNyZWF0ZWQgYQ0K
PiA+IHNlcGFyYXRlIHN0YW5kYWxvbmUgcGF0Y2ggZm9yIHRoaXMgcGF0Y2ggIzMgdGhhdCB3ZSBy
ZXZpZXcgaW5kZXBlbmRlbnRseS4NCj4gPiANCg0K
