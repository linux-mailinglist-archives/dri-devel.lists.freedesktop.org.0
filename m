Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BFA753157
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 07:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299610E194;
	Fri, 14 Jul 2023 05:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DE810E11D;
 Fri, 14 Jul 2023 05:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689312978; x=1720848978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n0NCw7QSUs7d6jkfrNoh2FwvGgQjCPjJl9o2KVczu0U=;
 b=SNbC0M/hBXEHqHT/9I7W11/y7xYrHKd/MjXLfdJWElOnf2nqFvq2VrI9
 1DdQNI+kMo5aUpIm1VnvZ6mRfoWWpt/GvRZvi8xM+gp5p2ICalYAVN7Zw
 0SxYHFp0ay0jFKQ2nYC4JVQZKnBjtgGg5vKWnMNnbe2MMQ9dBSJf8NgDa
 uy0KOFmnBYKaXa1WDtbDNLMPTNvJqxCbjQtOEheGFQzv6yR7+maQXI7tt
 GUMUA4+M0VxpBe2WKn1iOQAFA9Ju/LZT4EgvU8A2kvqIzCowilSIVmXFl
 IXjuofs9Yv+o5+gP/c7hrIXTiF+3nE1YJwRdR8XHLLnmKczGN3iCHQG19 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345712735"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="345712735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 22:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="896289168"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="896289168"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 13 Jul 2023 22:36:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 22:36:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 22:36:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 22:36:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBzfy2tqokrvj4KlZIc2F/mCs9uI7ywOSn1E4AOm/uD237WQdTcPn7+OdkH/qNVePoepJM+dMHyNYPJBRQTsuyTLRet1s30eI1ASZUKXuqsqKsSe+7klsKlp/2u52dTB3FiheHOZts3OusYiXS8KERzonSkqyFPNEFf7mC5xANG5Mn4FBbxRRw7MmeLVBP6kV3lYHttNtsnpenGYf8ag53KQFy3jAewSaifKBtni09mnDJGFCn6ZjdrFu+CLaXxuU4PgpvmG++727s9JZup7lN20HiFzZOJ1jqBtJmHKQG3Uh2wMaEEODMxlCEd5hdFLIRxdKG2gITSERixU5QpGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0NCw7QSUs7d6jkfrNoh2FwvGgQjCPjJl9o2KVczu0U=;
 b=c59A+3ng85XzNdlxqO5D2UhEr4j2qp61n2LtPN4sEsKs2zp2hY7+Qv/ef68VV4Bm5+Gzss3nFV77HLmZJYumalKM1w8FjqjIb5f7kvNwLMr8zfWpQYtn00B5mk4Bu28dKM+t2suwCNXLWpFSu5qxi+mTCT2t3K6rFyuJeVBtOTIKClsRBv4B0IBDKgk0xbfZYVY/mE9Vgmj5QJ4rrIJysJt6ng3RV95Wr0HDcyTva3rNwaKHp6FbB7ev6c++pGdWi8dAKPjA/Xm9xVBmSNEA638vTSRtUbjt2tgkGaX+TF5ZvT8pcDZLONqUCV4CLkbqUfTvcRQGix0p2YpCsR4kuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Fri, 14 Jul
 2023 05:36:13 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 05:36:13 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC 1/2] drm/i915: Refactor PAT/object cache handling
Thread-Topic: [RFC 1/2] drm/i915: Refactor PAT/object cache handling
Thread-Index: AQHZtZ6O89GwDBLip0u4lCO4LzWuBq+4unJQ
Date: Fri, 14 Jul 2023 05:36:13 +0000
Message-ID: <BYAPR11MB25677FCEE39C65B1FED423799A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CO6PR11MB5633:EE_
x-ms-office365-filtering-correlation-id: 824d5085-3cc8-4854-5ca3-08db842c3ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W6VcFhXdwKp3KaYTi/NsL/d66fB/QN+a7rY5SYLKBPoZc8H4REYpmxrNUKsiPIhsPCi82dVVpFbT2pdqKenMPJOlqhUXymAJGN6yhfPRqyXqU/dRRTb4obK8Y/iuF6VQvZHFBffkE5eX3pk/afWGSgYtp5JQkkSCyrs6ur6rBCfB1WT+yNt7TkjimyPyhBdTFWZK1DMsJMMzFu7Gg5BQttEUV55Xgga0eZYP7/bdOjemCo9vDqijxSfPbJIHumgzUptWu3l56s1rpsgZOZt39DPkfdzygvnuFsA3VfSFGGiXWFT5w05XQknlBQeCNpn8IA924EdHn/X9aFzCIubIhZGiWJSJSV5y/dbRAseEmRMszgZqPolkhFocylwqIxeSPP3NEH/eWtVS5CTwoYHS63U5B9cqpvLef0GpckVJHDbNHifyTk8QUB9/XDJodL5RUmz+C5sHkuFwhjpz1yctXss9sXp5yrCa2gqXOPZQOMxxB+x7r2UH6VEH2ITfkhLyq63Hp6Mv2h5N4QHMidbDSdvamjQP0KDwqM0gWebBcLqx7VxLvidRuCRirqgereF+TVDjRAsv2H1h+ORRu86V+zExUiT37jjFBrtJZabiqTN+BjzqCK2X0tShpB6mgnwh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199021)(54906003)(6506007)(478600001)(122000001)(41300700001)(26005)(186003)(110136005)(7696005)(71200400001)(86362001)(66446008)(66556008)(76116006)(33656002)(4326008)(64756008)(66946007)(316002)(66476007)(9686003)(38070700005)(55016003)(82960400001)(5660300002)(38100700002)(83380400001)(8936002)(8676002)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEd3MEZPUXdVRkRNS0ZrcHYvVnNOaS9GOGM4U3dOQUVhVmVJZkdXV1QxMHJB?=
 =?utf-8?B?SGNHWWQ4VllqTFk4VkNMdVBEZlBjQVJFdDRWTjdCZGNMcml2ejkyMzFMckJz?=
 =?utf-8?B?YTl5STBiaWQrSlFlOU1nT2lWaDh4SllvUzdJQmZXVTdYUCtGRzJUdUNZSzc4?=
 =?utf-8?B?QXF6cUovZmV2QkNCbHJBMUFVZGViZEpRVkQrZGJvQTRzT280SnlzOFZLUkph?=
 =?utf-8?B?dUNDVGdadXFBdS9vWS9VbHY4QlQ5R2RDa0t2OVZZTnJiZVVHd0Y1d0VIRWg5?=
 =?utf-8?B?emczSSt0OGtWZ1NMMFpRSHZtcEV3ZjR3Y0o4emRYWWJMQk1PMXRiVTE3YlZq?=
 =?utf-8?B?L2pEajJvbGdXQVFUSElkQ0tFdlV5WWhzQlJrYjhHWG1HS2RJSTJubzVEZ2pT?=
 =?utf-8?B?VDEySXBNYXdhQ0NUOURINlg0ODBvMGtSMDhjakxEL3hQbStockNlUk9IL296?=
 =?utf-8?B?NEJNa1diMnlEUG4wS1pmMWJDdkUzSHRlRkFOVUZ6NXZMUStxR0Fxa3VFamJE?=
 =?utf-8?B?b2pJekQwWG5CR0FVQnJYaHNwZi82UGxCUGtvbW1vSXFKc0VETy9mN3RoeERN?=
 =?utf-8?B?ZTZta3FxTVRuVnI0eE1EejVUKzhmWnVDMCtuL2dYNnJ2L2xmMHBSNCtYUXR4?=
 =?utf-8?B?R1NMd01JNWY4RGRyOVdzT0crK25JbE9qVjh6M3dCdWhwMUEvMU85clFiK0Jt?=
 =?utf-8?B?eVdTU2NMWVlRZnR5eFVYajZsQzh4K0R2UTl1WVNrS1lPMVloUUZBN2hwc3Fs?=
 =?utf-8?B?L0VtWk5SM3FvQ0VLN2xzanNBTFRFZGNNb2JZMVNFQXd5SEV6QmZpZGkreUNs?=
 =?utf-8?B?d3hNZDN2ZWlsN1pTaDBrQ0tGckNuc29rVnNmZXlQR3VDTnhiQkdEMkJCUTdE?=
 =?utf-8?B?UmRMU29GMHh3MFFDcnNVVzlCUFY5WVd5Q0xENHN4SzNGODRwZlBISlR2V202?=
 =?utf-8?B?S1doTk9VRGE1VCt0TWljYThneWFWL1RuUDZ1RHhiSkt0eW4yMkZjWGNZSEJ4?=
 =?utf-8?B?UWE0eWY2MENLdUFteHhuaG1QcTVoaG1GTkQvK3B3Q0lBVDVvSDFJV2VBSWsx?=
 =?utf-8?B?cUkrUTZwU3RmcGtucFJOL2phRkFPVlVWM1A2dkVMcFFJTFlrOTlETGtES0pG?=
 =?utf-8?B?SFdCaFcyZzdHMGVoNnZYcTVYM3BqN2FqYUROUzEvWDFGR3h0OEtXWWplQXZl?=
 =?utf-8?B?QjlNaVdFVHI4SzNqc3gzU3VTVTExd0xCSHllVGpPZ05FaGN4YXNRQjhrT1pB?=
 =?utf-8?B?Zkt6czRhQlp2eDBxbmtEdVZ6N3JiclpQMXpkSkQ3NGJxUVRRZHd1SDNvZm5G?=
 =?utf-8?B?UFk1Wks1MG9INnFuaUt6SlBGRXdnb1l0Yko3aXVwSWxkaWVxZ1BwRWRSbWo2?=
 =?utf-8?B?Zm9oRTVDSjBpaG5EZW5aZDZ4TFVZVUNua29iZWY3dXRJcy9XeDQ2UGdjMTcv?=
 =?utf-8?B?dWI4NkhsZVBiYjBMZUVMNS90cU0wU2J4bEp5aUkwOTZwbElZWkxCTTIvdHdt?=
 =?utf-8?B?MkZQVWxTVlBsTms1clpvd2xSb29ubUVvV3hiSzZWcXYrQ3FTRU5hZWdaRmk3?=
 =?utf-8?B?aC83SUV3a2l3MEtIUWdhWU1nRFRsOEovcVp3SVp3OVdVUTBYbWcxa1MwVEE3?=
 =?utf-8?B?azlIbktrNXVkWWF5WjY1bWk5WEloMUFiWlFXWUJiSmxETXY5RDNiTk1JU0R6?=
 =?utf-8?B?ZUwzSWpBSjd6SW04UEZ1c1Q3YVhmeUpDRmNhSDlMWWZLKy9HMlV4N3lvdHQ4?=
 =?utf-8?B?RzFLcTdvT3psb1pQdDBFUDg2VURKOU9VbDZic055ejZpY0ZqeG5MNzlYSnpx?=
 =?utf-8?B?WnVXa0RMZzNEeDVaMHZCWU85UzRNb3lLVEZqMGlkV3pVbXlWajJNU0F5T1dJ?=
 =?utf-8?B?OStnN2RoVys0bjBqZDZ4WDFHNFRMUVhBV29MaTZDaTh1Qk9jM1p2QmhGbncw?=
 =?utf-8?B?ZWVCY2p1aUdldVUwSm5YcEJNdGVLNkFNYXpsZzUzeGJtU1FpekJTWnZ1Y1Fa?=
 =?utf-8?B?cjRhN2R1c0FQaFF5SzBNb01WaG8ydi94MkIweis3anR0NjNvUmx0ajdvMEdo?=
 =?utf-8?B?dGV3VlJRaTJObDRkKzdoM3hvOGd3dXdzd01NWEE2bjJINmVSZnowOFIrQ000?=
 =?utf-8?Q?Kw6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824d5085-3cc8-4854-5ca3-08db842c3ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 05:36:13.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8hewbaKScRUAlGeHtgmWBJR7E+Bo5oKqAST3vA94LN6UUWFFAoCm1DtVDH1gdfnNFMAXRUhWPg4GgN1vnBLx0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5633
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W3NuaXBdDQo+IEBAIC0zMjYsMTAgKzMzMCwxMCBAQCBpbnQgaTkxNV9nZW1fZ2V0X2NhY2hpbmdf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gICAgICAgICAgICAg
ICBnb3RvIG91dDsNCj4gICAgICAgfQ0KPg0KPiAtICAgICBpZiAoaTkxNV9nZW1fb2JqZWN0X2hh
c19jYWNoZV9sZXZlbChvYmosIEk5MTVfQ0FDSEVfTExDKSB8fA0KPiAtICAgICAgICAgaTkxNV9n
ZW1fb2JqZWN0X2hhc19jYWNoZV9sZXZlbChvYmosIEk5MTVfQ0FDSEVfTDNfTExDKSkNCj4gKyAg
ICAgaWYgKGk5MTVfZ2VtX29iamVjdF9oYXNfY2FjaGVfbW9kZShvYmosIEk5MTVfQ0FDSEVfTU9E
RV9XQikgJiYNCj4gKyAgICAgICAgIGk5MTVfZ2VtX29iamVjdF9oYXNfY2FjaGVfZmxhZyhvYmos
IEk5MTVfQ0FDSEVfRkxBR19DT0gxVykgPT0gMSkNCg0KTmVlZCB0byBjaGVjayBMMyBmbGFnIGFz
IHdlbGw/IFRoZSBvcmlnaW5hbCBjb2RlIGhhcyBMM19MTEMuDQppZiAoaTkxNV9nZW1fb2JqZWN0
X2hhc19jYWNoZV9tb2RlKG9iaiwgSTkxNV9DQUNIRV9NT0RFX1dCKSAmJg0KICAgIChpOTE1X2dl
bV9vYmplY3RfaGFzX2NhY2hlX2ZsYWcob2JqLCBJOTE1X0NBQ0hFX0ZMQUdfQ09IMVcpID09IDEg
fHwNCiAgICAgaTkxNV9nZW1fb2JqZWN0X2hhc19jYWNoZV9mbGFnKG9iaiwgSTkxNV9DQUNIRV9G
TEFHX0wzKSA9PSAxKSkNCg0KPiAgICAgICAgICAgICAgIGFyZ3MtPmNhY2hpbmcgPSBJOTE1X0NB
Q0hJTkdfQ0FDSEVEOw0KDQpbc25pcF0NCj4gK2ludCBpOTE1X2NhY2hlX2luaXQoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+ICt7DQo+ICsgICAgIHN0cnVjdCBkcm1fcHJpbnRlciBw
ID0gZHJtX2luZm9fcHJpbnRlcihpOTE1LT5kcm0uZGV2KTsNCj4gKyAgICAgY2hhciBidWZbSTkx
NV9DQUNIRV9OQU1FX0xFTl07DQo+ICsgICAgIGludCByZXQ7DQo+ICsNCj4gKyAgICAgaTkxNS0+
Y2FjaGUgPSBIQVNfTExDKGk5MTUpID8gSTkxNV9DQUNIRV9DQUNIRUQgOiBJOTE1X0NBQ0hFX05P
TkU7DQo+ICsgICAgIGk5MTVfY2FjaGVfcHJpbnQoYnVmLCBzaXplb2YoYnVmKSwgIiIsIGk5MTUt
PmNhY2hlKTsNCj4gKyAgICAgZHJtX3ByaW50ZigmcCwgIkNvaGVyZW50IGNhY2hlIG1vZGUgJXMi
LCBidWYpOw0KPiArDQo+ICsgICAgIHJldCA9IGk5MTVfY2FjaGVfZmluZF9wYXQoaTkxNSwgSTkx
NV9DQUNIRV9OT05FKTsNCj4gKyAgICAgaWYgKHJldCA8IDApDQo+ICsgICAgICAgICAgICAgcmV0
dXJuIC1FTk9ERVY7DQo+ICsgICAgIGRybV9pbmZvKCZpOTE1LT5kcm0sICJVc2luZyBQQVQgaW5k
ZXggJXUgZm9yIHVuY2FjaGVkIGFjY2Vzc1xuIiwgcmV0KTsNCj4gKyAgICAgaTkxNS0+cGF0X3Vj
ID0gcmV0Ow0KPiArDQo+ICsgICAgIHJldCA9IGk5MTVfY2FjaGVfZmluZF9wYXQoaTkxNSwgSTkx
NV9DQUNIRV9DQUNIRUQpOw0KPiArICAgICBpZiAocmV0IDwgMCkNCj4gKyAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0RFVjsNCj4gKyAgICAgZHJtX2luZm8oJmk5MTUtPmRybSwgIlVzaW5nIFBBVCBp
bmRleCAldSBmb3Igd3JpdGUtYmFjayBhY2Nlc3NcbiIsIHJldCk7DQo+ICsgICAgIGk5MTUtPnBh
dF93YiA9IHJldDsNCg0KSSB0aGluayBpOTE1LT5wYXRfd3QgaXMgbmVlZGVkIGFzIHdlbGwsIGJl
Y2F1c2UgZGlzcGxheSBkcml2ZXIgaGFzIGNvZGUgbGlrZSB0aGlzLA0KSEFTX1dUKGk5MTUpID8g
STkxNV9DQUNIRV9XVCA6IEk5MTVfQ0FDSEVfTk9ORQ0KDQpIb3cgZGlkIHlvdSBoYW5kbGUgZnVu
Y3Rpb25zIGxpa2UgaW5pdGlhbF9wbGFuZV92bWEoKSBhbmQgaTkxNV9nZW1fb2JqZWN0X3Bpbl90
b19kaXNwbGF5X3BsYW5lKCk/DQoNCj4gKyAgICAgcmV0dXJuIDA7DQo+ICt9DQoNCltzbmlwXQ0K
PiAtI2RlZmluZSBUR0xfQ0FDSEVMRVZFTCBcDQo+IC0gICAgIC5jYWNoZWxldmVsX3RvX3BhdCA9
IHsgXA0KPiAtICAgICAgICAgICAgIFtJOTE1X0NBQ0hFX05PTkVdICAgPSAzLCBcDQo+IC0gICAg
ICAgICAgICAgW0k5MTVfQ0FDSEVfTExDXSAgICA9IDAsIFwNCj4gLSAgICAgICAgICAgICBbSTkx
NV9DQUNIRV9MM19MTENdID0gMCwgXA0KPiAtICAgICAgICAgICAgIFtJOTE1X0NBQ0hFX1dUXSAg
ICAgPSAyLCBcDQo+ICsvKg0KPiArICogVE9ETy9RUVENCj4gKyAqDQo+ICsgKiBQQVQgMCAtIGlz
IGl0IDEtd2F5IG9yIDItd2F5Pw0KDQoxLXdheQ0KDQo+ICsgKi8NCj4gKyNkZWZpbmUgR0VOMTJf
Q0FDSEVfTU9ERVMgXA0KPiArICAgICAuY2FjaGVfbW9kZXMgPSB7IFwNCj4gKyAgICAgICAgICAg
ICBbMF0gPSBfSTkxNV9DQUNIRShXQiwgQ09IMVcpLCBcDQo+ICsgICAgICAgICAgICAgWzFdID0g
STkxNV9DQUNIRShXQyksIFwNCj4gKyAgICAgICAgICAgICBbMl0gPSBJOTE1X0NBQ0hFKFdUKSwg
XA0KPiArICAgICAgICAgICAgIFszXSA9IEk5MTVfQ0FDSEUoVUMpLCBcDQo+ICAgICAgIH0NCg0K
W3NuaXBdDQo+IC0jZGVmaW5lIFBWQ19DQUNIRUxFVkVMIFwNCj4gLSAgICAgLmNhY2hlbGV2ZWxf
dG9fcGF0ID0geyBcDQo+IC0gICAgICAgICAgICAgW0k5MTVfQ0FDSEVfTk9ORV0gICA9IDAsIFwN
Cj4gLSAgICAgICAgICAgICBbSTkxNV9DQUNIRV9MTENdICAgID0gMywgXA0KPiAtICAgICAgICAg
ICAgIFtJOTE1X0NBQ0hFX0wzX0xMQ10gPSAzLCBcDQo+IC0gICAgICAgICAgICAgW0k5MTVfQ0FD
SEVfV1RdICAgICA9IDIsIFwNCj4gKy8qDQo+ICsgKiBUT0RPL1FRUQ0KPiArICoNCj4gKyAqIFBB
VCAzIC0gaXMgaXQgMS13YXkgb3IgMi13YXk/DQoNCjEtd2F5DQoNClBWQyBhY2Nlc3MgaXMgYWx3
YXlzIGNvaGVyZW50LCBpdCBzaG91bGQgaGF2ZSAxLXdheSBmb3IgWzVdIGFuZCBbN10gYXMgd2Vs
bC4NCg0KPiArICovDQo+ICsjZGVmaW5lIFBWQ19DQUNIRV9NT0RFUyBcDQo+ICsgICAgIC5jYWNo
ZV9tb2RlcyA9IHsgXA0KPiArICAgICAgICAgICAgIFswXSA9IEk5MTVfQ0FDSEUoVUMpLCBcDQo+
ICsgICAgICAgICAgICAgWzFdID0gSTkxNV9DQUNIRShXQyksIFwNCj4gKyAgICAgICAgICAgICBb
Ml0gPSBJOTE1X0NBQ0hFKFdUKSwgXA0KPiArICAgICAgICAgICAgIFszXSA9IF9JOTE1X0NBQ0hF
KFdCLCBDT0gxVyksIFwNCj4gKyAgICAgICAgICAgICBbNF0gPSBfSTkxNV9DQUNIRShXVCwgQ0xP
UzEpLCBcDQo+ICsgICAgICAgICAgICAgWzVdID0gX0k5MTVfQ0FDSEUoV0IsIENMT1MxKSwgXA0K
PiArICAgICAgICAgICAgIFs2XSA9IF9JOTE1X0NBQ0hFKFdULCBDTE9TMiksIFwNCj4gKyAgICAg
ICAgICAgICBbN10gPSBfSTkxNV9DQUNIRShXQiwgQ0xPUzIpLCBcDQo+ICAgICAgIH0NCg==
