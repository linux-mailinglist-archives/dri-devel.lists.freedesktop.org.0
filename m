Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646D558A78
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 23:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E851110E364;
	Thu, 23 Jun 2022 21:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA1D10E364;
 Thu, 23 Jun 2022 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656018379; x=1687554379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=grWU+eC36VuWJH7gkj4OIhMnVfqijTiiFAE525e8ns8=;
 b=eWgNKYgV2pES6pTwXDmc7ViSxdpY1FlzXBH7EHb96er7kDb1wuKYiQGz
 kZ0uhezOiFpUCOw63k9Kx/VEPDNL1mcFPhOn+KzZ1RJXtcLItt0vaUSic
 kACDlbH44dh7aUZBjHF0bg3bRgjiN0W11n14jDdhLhu0FFKixiVRJvRHB
 gPt+toUs+41Rb+Sc5p1tCA0eHfDB0w9ll3H4lOxpb5284/2kVfrCQel3N
 vbd7jDXdc24d+jlfizvecdbm09kUcJF84inbk1DuXjl6QZk98m9nZlQ0q
 sWrheyBbpLLEwVgd3rnGoBHQZOeMWP0TTN0m36zsRgX6R/u/SOuIikkM7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="367160590"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="367160590"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 14:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="691210569"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2022 14:05:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 14:05:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 14:05:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 14:05:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 14:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt5lIANZUa/C9gEWXeI27aES+Tul+WU72t3cs4IoN22bUJP0W9I7BQjXpYOF3gcjbdtpVvoefYjpmeI1UEll8jXtf0+b0yiKk9jqutngxPDKFeu7HSBO4pYwmt1C9hoQlAZS1X3iA8yWsc5vGDuVk0qmU8T2f1VJtya4IKioyu5xRNQFQvKp6rivPRvobGM6uQLGH6J19sjE6+jKZg1nPCM1wi2qgMd2uDjCqIy1J0cguuUZRr9F/7nFV3e6Wd2qDtrMadN+MP3gvsNqJJkWblTlqzo+U63R1IEjkORbJZUhKEzuy52vj3jUA2alvbcHXxyJePkBPK6fedVV0WdG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grWU+eC36VuWJH7gkj4OIhMnVfqijTiiFAE525e8ns8=;
 b=c6oq0VBnIfySYOqXv3CFjN53ZVOYv3n0zFSMy8yVwVkotYCGPxyUlfAD/m7D+OnE4elUNVeVPEgLFOCCau/8N05tA5UViPjiGULd7GjF6lncamXfeh1crJPTJ5Y3O+v+rPbRI9wA6P+lFjyd9QGBqgYayUo36nlwRdRfWSdYPC0P/G+Gn2UJ5OfVr7Xx22BfZMdlGX/U6g881y38q/Nhjt27NCeR5waxghrmepph1h6k1wslQ1k77s2kvz9YBpuNpRCNTsIJqEnGzW2rcpsqF/OaXqiL22I0AdU3I3u923N3WeRfHd0Y55Ga370dagKOZFXMoyCVY+eZMwiZwgKRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by DM6PR11MB3081.namprd11.prod.outlook.com (2603:10b6:5:6a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 21:05:47 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639%8]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 21:05:47 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Topic: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Index: AQHYhewtASI2jWfgB0G497ALZvi+T61bEx+AgAB2AwCAAAyDgIAADUaAgAEHWwCAAAh5AIAAI9AAgACkqeA=
Date: Thu, 23 Jun 2022 21:05:47 +0000
Message-ID: <BN6PR11MB1633C90D1B2E40359F1F168F92B59@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
 <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
 <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
In-Reply-To: <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92a6b336-9b86-474c-2617-08da555c24f3
x-ms-traffictypediagnostic: DM6PR11MB3081:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 40Sq9hLeeDwb2NFVD4U5x8RLDGHOyUENIzqarjBtzkKZYjVbJ1tv5kZWVueWbh6lir0T9a0SGwqlPsxcngbBQhrqaUj48vq6rlRf1vxY5rBw4c67IE0WmzUkJuaRmF57oDikrIHV/vD1hIkg1CM8t99LbHxTsuKVgg6gbFIxxdbS6X29KSncY9acZFfeoKEt57wdpovxTfg8QIcsmi45OPbytB9E25M0CRz/sFQE/rATlYjzyPDMsWAXazOy8D/8O4hT52wnn1DisINCAjf7Ity9hlazl1jczb4nMfBals+QyOadYZlJ0lV8AWnex8OLONdP2e+VpazpOghgsty5egWZWr3gWv6hSERU8Mk4XgsXi7Rd8aOp14BMreDxdNvJL2Lx4RQa8OquoU6TQkKeVxFEePlZxb8E2u8RkYxha1tvshEx84wTmpLUlSryma9gAJW7kUxL2nE2KOQwTlC/xTPBBGP3CgTvq18RiLFGs1cPFWdbUlpazfB5soIPX3czmz0UuloZ5imRJ1zRDY+KH9FaMXsC4rSGzojzPqBMLOzQVdd4Jyz+YSTLttXrWXa/02mFDgzHz4cz0hwJmMyLIQ72dTX8XmJMTQh8kbnZRVlgr9H4XoZwOQ/ElHECKAgPllzA265HeStBVsMe5ju8dycFBgGc0sN3sgUgfE2qcfg8Awktr05z5iLDA/0zrW8LiU+VkqoN+6UuuHjYmdYWDuYUe8bOA61kjxW89/wygSHkq7sCJ0jYbhimDDD9AveI4ueJhW9G+NjsohuwUg3pFHiOl98W2LYePyX6ZxQTwNA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(71200400001)(9686003)(52536014)(4326008)(38070700005)(53546011)(38100700002)(5660300002)(33656002)(8936002)(6506007)(7696005)(478600001)(64756008)(66946007)(6636002)(55016003)(186003)(76116006)(54906003)(122000001)(41300700001)(316002)(110136005)(26005)(83380400001)(66476007)(86362001)(2906002)(66556008)(66446008)(8676002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmgvd1pVbFNCd29RRENsalEzZUtSYTUxUU4yZHdobDY5ZXVUdWdWYmthMzhy?=
 =?utf-8?B?TGd6WlEzRkZrcHhrR2lreGZ4czhMK0xiWmFEMEtCeGlmeEpWZHNscWIvT1hF?=
 =?utf-8?B?cEIvUStvZnF0b0RwY01nMWlQUjJ1ejdGZlJtTjY4MTd4TlFtZEtGaE1kbVhG?=
 =?utf-8?B?QVBubnNMTGhZSngrRzFUSW84bjFHdVRZMlRnb0xQVEJYUVh0YVVSUE05Nzkw?=
 =?utf-8?B?aDV0MDF0N0wyNWE4VGVrMGJhMHF3bHRNVXMwYUhMWEpOcFdpWjhFdy9TekY3?=
 =?utf-8?B?aEF3dys2cXhNV2VDcEFGdWV0MWRwUWxETEFZL0tpNVRnM3czUStFOHNZMGJE?=
 =?utf-8?B?aXdpV1lBVEdwdkJoUEQ1NUc0a1hsc0VJRHFhNDQ0M05FQWs3L3RlVExuczNq?=
 =?utf-8?B?UGRxdVBnUXpKUmMydGZENmRYS3Y2TzMvbC8xU3JXMEtLWE94eCtsWi8vQmha?=
 =?utf-8?B?bnZuTEhjMWNVYUFCc1VIZStxNWdSWmxsNitJVGVxSmRVNXg4c0dWWDFleXA4?=
 =?utf-8?B?aWJXQUR6ZFlvMk1BWEJQZWlWUUwrajB2NERwWnEwM2VLZDNBMFpGVk5tQzhE?=
 =?utf-8?B?ZHJlRGlXNGtnemx0RjRKUFVFMklVR3NKeWtCblVGQWt4RlBFRXFSRzhQQU1a?=
 =?utf-8?B?NzlrVTFlTzRCNDNBSWRFT2JwM0dqMnd1bm5IR3I1RVhHWWcwR3dXenQwVmVr?=
 =?utf-8?B?dEVlWVVLalhpNGlucHA2TUwzVFcwTzJFV0VpWEM5ZGhtRWdVOGQvUmUycEpi?=
 =?utf-8?B?L240Zkx2djlWdEw3L0crak96TFBOcnV4SjZ5bWNnMHFQQmlFdEY1ZFo2TEMx?=
 =?utf-8?B?QURVUml3ZTJnbkFRSWJpVmpJeEVBcEpPR0E3LzV2dkxNb2x5S2VWMFdzZC9i?=
 =?utf-8?B?NW5TT2V3U2xyeERNOXhFUXpPWG45YzVFaC9RWStNQkt5cFUzVko5NENPbmRx?=
 =?utf-8?B?ZU40Y0VXQkdoUytiRlRwRnAyUU52dmZBMXlMZGE2eHZwY3lpT2NXdElOMHRk?=
 =?utf-8?B?Rzd6Sm8zc0NiY25FNFZiaDlkRGRTNVh0WU9xMVR1ZXpJdTNTbHlWQzI1Q1hh?=
 =?utf-8?B?bFdnWk93cjlROEN5TGdNK3FTVU9jWkVYbU9nZlpjZnBxNTJpeWtJVllzYS93?=
 =?utf-8?B?MFo4U09ERlpvU3pPdmRVa1czMDBzRHpRSCtpTTA4ME0xVHN4ZURnNzk1eXBp?=
 =?utf-8?B?Yy8vN01rVlc2UlBpM0I4OTRienQ4VWtpcGxENmFycDZXRCswY01pSmxNY3JD?=
 =?utf-8?B?d2JjS1d5YThEKzFDdGtPU3NSaysxcGdYYUY5V1VWY1MyUFlNL2IwL25rTUVM?=
 =?utf-8?B?NS80YWtyUXo2R1hhK1oyZUZPcjIzRWRHby9FaUZJbzBpMHdIbFZOekd3STU5?=
 =?utf-8?B?VFpEblVsZkVkUTBQb2RONUI3M2hIL3ZDK2dXYlNSTy81N1dWMk9jWlFXQVhj?=
 =?utf-8?B?dlhDc3loTVV1SUxyQ3drVy83ekdmUkFkVS9LVHRvK2lSZWE0MDlRU3l6OE1q?=
 =?utf-8?B?eTJ1OUdjblJBeGREMjdnR0VVNG5xdjJ5SGpqOWUxSzA2cEVSZnRjbVU0L0U1?=
 =?utf-8?B?NndPRlJuZWtRZ2RxMll6WFZFbEZUeUFMRUU1RkVWa1hKTjc2emJVcGRYdmc4?=
 =?utf-8?B?UEFiTUNnc0lRb2ZwUE1tbVlZLy9GQjRNT1lTL0Y1V05uc2txMVdsbXBENXQ2?=
 =?utf-8?B?TmNUM0hHNzE4ZDNuT3o5a3B2bWlMc29PcEFRcFNjS1JKR1YvUjNOZXdkVUoz?=
 =?utf-8?B?em9PTldMb01jUnVoamw1SnF3ZFBJeTBqaTI0bVNDWFRKbXhMdUFwdFlBemtX?=
 =?utf-8?B?ZWFRSTRHcXBiMk1yaVdhSENkdG1HOHNnME1rL290citRckN3S0wwakd6eXVR?=
 =?utf-8?B?dmdJNytKN0IrSi9Pem5sNHdRY3IvTU91dld0dFVUT3lGMmN6TFhpR1ZheFhC?=
 =?utf-8?B?ZTkwL01TNEI5MHdYMGk0bVpuZ1lKMjZTRTlwMXRNVk9zRnJyMlpjV2ZUUEJj?=
 =?utf-8?B?RDJSQU1mWkxnb2JaMnBzV0VCTTl1OW1aWjRuU2RvaHFaUW9XaCtNa3dnTERP?=
 =?utf-8?B?eHZ5N2RQU1RoRDNmSlFxRHdTTEN6Mmg0cFA1VS9CMm1UVTRoSEFkYlIrWWpK?=
 =?utf-8?Q?uR+lRLHhNJrKmyeHha+ZZAoj+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a6b336-9b86-474c-2617-08da555c24f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 21:05:47.1300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHE4Iv6dmD0ZxVmyAY7mS0mKM0sp+899vBw6DOJ1pLQPhiA9cmyrjXi3abUd9dB5d+CNe41Y/6T33v2MLP4f5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3081
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClJlZ2FyZHMsDQpPYWsNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBJbnRlbC1nZnggPGludGVsLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIFR2cnRrbw0KPiBVcnN1bGluDQo+IFNlbnQ6IEp1bmUgMjMsIDIwMjIgNzowNiBB
TQ0KPiBUbzogTGFuZHdlcmxpbiwgTGlvbmVsIEcgPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwu
Y29tPjsgVmlzaHdhbmF0aGFwdXJhLA0KPiBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRo
YXB1cmFAaW50ZWwuY29tPg0KPiBDYzogWmFub25pLCBQYXVsbyBSIDxwYXVsby5yLnphbm9uaUBp
bnRlbC5jb20+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBIZWxsc3Ryb20sIFRob21hcyA8dGhvbWFzLmhlbGxzdHJv
bUBpbnRlbC5jb20+Ow0KPiBXaWxzb24sIENocmlzIFAgPGNocmlzLnAud2lsc29uQGludGVsLmNv
bT47IFZldHRlciwgRGFuaWVsDQo+IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT47IGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbTsgQXVsZCwgTWF0dGhldw0KPiA8bWF0dGhldy5hdWxkQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCB2MyAzLzNdIGRybS9kb2MvcmZj
OiBWTV9CSU5EIHVhcGkgZGVmaW5pdGlvbg0KPiANCj4gDQo+IE9uIDIzLzA2LzIwMjIgMDk6NTcs
IExpb25lbCBMYW5kd2VybGluIHdyb3RlOg0KPiA+IE9uIDIzLzA2LzIwMjIgMTE6MjcsIFR2cnRr
byBVcnN1bGluIHdyb3RlOg0KPiA+Pj4NCj4gPj4+IEFmdGVyIGEgdm1fdW5iaW5kLCBVTUQgY2Fu
IHJlLWJpbmQgdG8gc2FtZSBWQSByYW5nZSBhZ2FpbnN0IGFuIGFjdGl2ZQ0KPiA+Pj4gVk0uDQo+
ID4+PiBUaG91Z2ggSSBhbSBub3Qgc3VlIHdpdGggTWVzYSB1c2VjYXNlIGlmIHRoYXQgbmV3IG1h
cHBpbmcgaXMgcmVxdWlyZWQNCj4gPj4+IGZvcg0KPiA+Pj4gcnVubmluZyBHUFUgam9iIG9yIGl0
IHdpbGwgYmUgZm9yIHRoZSBuZXh0IHN1Ym1pc3Npb24uIEJ1dCBlbnN1cmluZyB0aGUNCj4gPj4+
IHRsYiBmbHVzaCB1cG9uIHVuYmluZCwgS01EIGNhbiBlbnN1cmUgY29ycmVjdG5lc3MuDQo+ID4+
DQo+ID4+IElzbid0IHRoYXQgdGhlaXIgcHJvYmxlbT8gSWYgdGhleSByZS1iaW5kIGZvciBzdWJt
aXR0aW5nIF9uZXdfIHdvcmsNCj4gPj4gdGhlbiB0aGV5IGdldCB0aGUgZmx1c2ggYXMgcGFydCBv
ZiBiYXRjaCBidWZmZXIgcHJlLWFtYmxlLg0KPiA+DQo+ID4gSW4gdGhlIG5vbiBzcGFyc2UgY2Fz
ZSwgaWYgYSBWQSByYW5nZSBpcyB1bmJvdW5kLCBpdCBpcyBpbnZhbGlkIHRvIHVzZQ0KPiA+IHRo
YXQgcmFuZ2UgZm9yIGFueXRoaW5nIHVudGlsIGl0IGhhcyBiZWVuIHJlYm91bmQgYnkgc29tZXRo
aW5nIGVsc2UuDQo+ID4NCj4gPiBXZSdsbCB0YWtlIHRoZSBmZW5jZSBwcm92aWRlZCBieSB2bV9i
aW5kIGFuZCBwdXQgaXQgYXMgYSB3YWl0IGZlbmNlIG9uDQo+ID4gdGhlIG5leHQgZXhlY2J1ZmZl
ci4NCj4gPg0KPiA+IEl0IG1pZ2h0IGJlIHNhZmVyIGluIGNhc2Ugb2YgbWVtb3J5IG92ZXIgZmV0
Y2hpbmc/DQo+ID4NCj4gPg0KPiA+IFRMQiBmbHVzaCB3aWxsIGhhdmUgdG8gaGFwcGVuIGF0IHNv
bWUgcG9pbnQgcmlnaHQ/DQo+ID4NCj4gPiBXaGF0J3MgdGhlIGFsdGVybmF0aXZlIHRvIGRvIGl0
IGluIHVuYmluZD8NCj4gDQo+IEN1cnJlbnRseSBUTEIgZmx1c2ggaGFwcGVucyBmcm9tIHRoZSBy
aW5nIGJlZm9yZSBldmVyeSBCQl9TVEFSVCBhbmQgYWxzbw0KPiB3aGVuIGk5MTUgcmV0dXJucyB0
aGUgYmFja2luZyBzdG9yZSBwYWdlcyB0byB0aGUgc3lzdGVtLg0KDQoNCkNhbiB5b3UgZXhwbGFp
biBtb3JlIHdoeSB0bGIgZmx1c2ggd2hlbiBpOTE1IHJldGlyZSB0aGUgYmFja2luZyBzdG9yYWdl
PyBJIG5ldmVyIGZpZ3VyZWQgdGhhdCBvdXQgd2hlbiBJIGxvb2tlZCBhdCB0aGUgY29kZXMuIEFz
IEkgdW5kZXJzdGFuZCBpdCwgdGxiIGNhY2hlcyB0aGUgZ3B1IHBhZ2UgdGFibGVzIHdoaWNoIG1h
cCBhIHZhIHRvIGEgcGEuIFNvIGl0IGlzIHN0cmFpZ2h0IGZvcndhcmQgdG8gbWUgdGhhdCB3ZSBw
ZXJmb3JtIGEgdGxiIGZsdXNoIHdoZW4gd2UgY2hhbmdlIHRoZSBwYWdlIHRhYmxlIChlaXRoZXIg
YXQgdm0gYmluZCB0aW1lIG9yIHVuYmluZCB0aW1lLiBCZXR0ZXIgYXQgdW5iaW5kIHRpbWUgZm9y
IHBlcmZvcm1hbmNlIHJlYXNvbikuDQoNCkJ1dCBpdCBpcyByYXRoZXIgdHJpY2t5IHRvIG1lIHRv
IGZsdXNoIHRsYiB3aGVuIHdlIHJldGlyZSBhIGJhY2tpbmcgc3RvcmFnZS4gSSBkb24ndCBzZWUg
aG93IGJhY2tpbmcgc3RvcmFnZSBjYW4gYmUgY29ubmVjdGVkIHRvIHBhZ2UgdGFibGUuIExldCdz
IHNheSB1c2VyIHVuYmluZCB2YTEgZnJvbSBwYTEsIHRoZW4gYmluZCB2YTEgdG8gcGEyLiBUaGVu
IHJldGlyZSBwYTEuIFN1Ym1pdCBzaGFkZXIgY29kZSB1c2luZyB2YTEuIElmIHdlIGRvbid0IHRs
YiBmbHVzaCBhZnRlciB1bmJpbmQgdmExLCB0aGUgbmV3IHNoYWRlciBjb2RlIHdoaWNoIGlzIHN1
cHBvc2VkIHRvIHVzZSBwYTIgd2lsbCBzdGlsbCB1c2UgcGExIGR1ZSB0byB0aGUgc3RhbGUgZW50
cmllcyBpbiB0bGIsIHJpZ2h0PyBUaGUgcG9pbnQgaXMsIHRsYiBjYWNoZWQgaXMgdGFnZ2VkIHdp
dGggdmlydHVhbCBhZGRyZXNzLCBub3QgcGh5c2ljYWwgYWRkcmVzcy4gc28gYWZ0ZXIgd2UgdW5i
aW5kIHZhMSBmcm9tIHBhMSwgcmVnYXJkbGVzcyB3ZSByZXRpcmUgcGExIG9yIG5vdCwgdmExIGNh
biBiZSBib3VuZCB0byBhbm90aGVyIHBhMi4NCg0KVGhhbmtzLA0KT2FrIA0KDQoNCj4gDQo+IEZv
ciB0aGUgZm9ybWVyLCBJIGhhdmVuJ3Qgc2VlbiBhbnkgbWVudGlvbiB0aGF0IGZvciBleGVjYnVm
MyB0aGVyZSBhcmUNCj4gcGxhbnMgdG8gc3RvcCBkb2luZyBpdD8gQW55d2F5LCBhcyBsb25nIGFz
IHRoaXMgaXMga2VwdCBhbmQgc2VxdWVuY2Ugb2YNCj4gYmluZFsxLi5OXStleGVjYnVmIGlzIHNh
ZmUgYW5kIGNvcnJlY3RseSBzZWVzIGFsbCB0aGUgcHJlY2VkaW5nIGJpbmRzLg0KPiBIZW5jZSBh
Ym91dCB0aGUgYWx0ZXJuYXRpdmUgdG8gZG9pbmcgaXQgaW4gdW5iaW5kIC0gZmlyc3QgSSB0aGlu
ayBsZXRzDQo+IHN0YXRlIHRoZSBwcm9ibGVtIHRoYXQgaXMgdHJ5aW5nIHRvIHNvbHZlLg0KPiAN
Cj4gRm9yIGluc3RhbmNlIGlzIGl0IGp1c3QgZm9yIHRoZSBjb21wdXRlICJhcHBlbmQgd29yayB0
byB0aGUgcnVubmluZw0KPiBiYXRjaCIgdXNlIGNhc2U/IEkgaG9uZXN0bHkgZG9uJ3QgcmVtZW1i
ZXIgaG93IHdhcyB0aGF0IHN1cHBvc2VkIHRvIHdvcmsNCj4gc28gbWF5YmUgdGhlIHRsYiBmbHVz
aCBvbiBiaW5kIHdhcyBzdXBwb3NlZCB0byBkZWFsIHdpdGggdGhhdCBzY2VuYXJpbz8NCj4gDQo+
IE9yIHlvdSBzZWUgYSBwcm9ibGVtIGV2ZW4gZm9yIE1lc2Egd2l0aCB0aGUgY3VycmVudCBtb2Rl
bD8NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBUdnJ0a28NCg==
