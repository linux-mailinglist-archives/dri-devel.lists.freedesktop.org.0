Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27647EA279
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEB010E3ED;
	Mon, 13 Nov 2023 17:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F90710E3EB;
 Mon, 13 Nov 2023 17:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699898251; x=1731434251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CEAY+JVZIgcYgwvW7BPmoP+j09EtwAWCDorr0l/tbdE=;
 b=Gay81rDm61sPFRI+djc05NPb18eon5rHC+FqeG0PC9RXYw8Vm0BOPexe
 B0SUnNxB2BkdksWr2L999+eA6g41xFDeLT6wfmA1VEvuy0H6HGHXQqRji
 qm6RvBOdwzSMP9YUebnvTjay7VlETmBad9d/Vs2GdAk6yuEk1q+30aesb
 wjhQgkCId1RDvzDVrYCiI+WhCD8Qa1oxih9GNFkrdiMKo6a0H6EId3iDc
 ZRgBIeZtN2fdMKTNwohwqtsdD2r9kbWPtWSiIborU3Jd6VljO7PN5XwSA
 7T7sRTq+RIFuEgz/0BjMTrCl+SCyGuae8XMf0L9Ps3IzfAQmJSc9QJ6ea w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375512573"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="375512573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="12525321"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 09:57:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 09:57:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 09:57:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 09:57:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 09:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKmlCefLG69byS8meNFRKNukGCPjjZlkezcU94NlW15iMWUH4JWJikmBYzMQSErJkdTZu45tEwBflqiZxYFxo2pL54pMbNpL5JQ/e7jZAHtOVgew7iyRL3B5WTZ4uzS7pRQ7N071wjojcOxHmu72s32QAsdhc5abjrdJVkpklmTM5G7aLa4b1rMAzezvqwmUbzRam1OcMXYbPwtaPDsop40YXMa/67lPy1Lc3fiBZzoEu2gwOXBCrcYpjVbGOGubw8E/fBfS3esb7rzFUdIEb8TVPRKKytNoCzn4lncrbdgJ8thEij1kfiQ6g8jBReWo18RwsGS7vbPz5ahcZDit4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEAY+JVZIgcYgwvW7BPmoP+j09EtwAWCDorr0l/tbdE=;
 b=fJAKTMycI8V4jUNQbS+6OOLNPwxR0nZKzDWXJezNNKfhHOIY5suf6csROEDRIuR4cKf/m9e+uLiuRtQBrkYce9jpPy9fnbLrYWL4l4UUSj/Hl1ZHWUSeimLcM7uErjsQReIUHuqbFIlUgbt2jf9mQ896yZYGq/OmjGrcmvoRtbIqxLVmVpun8YbXNdq8+1nFphExGVLBR011LX6YR/m19C6hOiO2BnmTZZ/DZ2D9hH5XsyNR1cbb6Y3pcxYZcM3wXWC9AeHMlolu1fULMVx/dhadr40h+rFUKdiVIPXDod07URFiXAJJlJFvICSm/Ew5ejt9BNJogrWi8ISdmzLGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Mon, 13 Nov 2023 17:57:23 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 17:57:23 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Topic: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Index: AQHZ8Kx2E7YYzy1lTkO6NJtn5NHgRrAuYVuAgAB+x4CAAVIIAIAJxYEAgCCs+QCAHi+1gA==
Date: Mon, 13 Nov 2023 17:57:23 +0000
Message-ID: <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
 <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
 <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
In-Reply-To: <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6784:EE_
x-ms-office365-filtering-correlation-id: 35396536-0bcd-425f-36f6-08dbe471fd1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 48Yt3mk4zSh1eZf2aCTx+o2uXiW3xV59b4ju4yhSR24I8QnxWNt4Yo9XSNPUHbb3cCbZEfaD+5hQtKa24WFZEE5GrIy+LIMsW34EEux5D4pXvqkSC8ej2GjRG9yCNVuwwhyBRWovPBNnbk/wMjGMC/zljRFwDov0vaA3qfzqHvarLLpo46Zf1Xa5NsTOnvWYzdjjdUguZsbB2KOX6X/dSRashV7ZgR+bG6iXGwnW7KqVT284zhgg1RT+KA7sIuOdKSqwVqmYuc0NhY+G4r8xzhHo8K1DwK7nqt1YXaS0fes6PRh0FcU7YPTxnkMpaEDZGhVfOqCZ5JVIAy8JsN8NZ2cNKALNG3wVXNtclXtqwn2jNI2bFlF0fTMeQ2UIXSWR+aevEvirpDTmOaNXD0lhL7KGWV/PjMjjQ56WFZbnuWOGMeslLHrNor8tkUeALgoOe85e6A2+xbAGHCtEJLIq2jx4/5mS9kVKAqEQkm+mMg96Erg9/3LXV/sFwOD0dfVYyH1Er9sJTNouXgQ3wAcBCb5Vz2vAgMJG5QKcwzxsri2omJc7E3Wn8tF3M/9C1cEDs+v7NohE5USQtRpP8CzIiell195mZmNacQ3D/Mg42527VXwnEVT/CmY+RrLVeI+G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(91956017)(110136005)(41300700001)(4001150100001)(15650500001)(6506007)(71200400001)(2906002)(83380400001)(5660300002)(8676002)(36756003)(4326008)(8936002)(38070700009)(66556008)(66476007)(316002)(66446008)(76116006)(66946007)(6486002)(86362001)(53546011)(478600001)(6512007)(54906003)(64756008)(26005)(2616005)(122000001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzJIN1BGU1Y3eUJiYThvajdOcW51Y3RqZVJTYVNpc2hyakJmK0FSTjdqUlFj?=
 =?utf-8?B?UlJBYi9TUTFZZzc5YnVaUTlnb1NZZmEwZkM1Q0x0eE5NZ3BoNkRwVTFQbTdO?=
 =?utf-8?B?N3h2TXFLS3RSYXdWRUhXQ0tFSUJqSkFWdnkwOENvenRSL0RCclMzU3hrRlEx?=
 =?utf-8?B?Y2lkamF2NGZLWHZpaHJGN1FPYytzRWRhSkkyeitGUXFYUW9QMHE3Zkt0RElJ?=
 =?utf-8?B?SkVGeHZ4QTkyOUFYWStrTHdVQktRYUVUbWtVdjNQOVEvM05uSVE1WGMyYzAr?=
 =?utf-8?B?OVpHWmZwQ3NDOVc4cDVxVzNBTHBySDE3SkRqd1pRNVdsSzllcld3TjBTaDY0?=
 =?utf-8?B?dWVrb1JwS2RYNEZSWXVQUVBwYXQrUXRmZlA1RmcrU0tZQmVscjh5VGJtYVVJ?=
 =?utf-8?B?UnpaSmtBUWVyUlo3SnRBamUrS3A5WHZJMVMwQnliZ2daRTVVb1kxVFRkSGsx?=
 =?utf-8?B?OXhxNVFtTTJoRjhQcFZ4ZEhaLzBuM3lYSTFKRisrQTVWUHBBRzFydE5mNVgz?=
 =?utf-8?B?eFBrc3pJbGJrOEp1MUFnYkRnZGRxalQyNnZFaW90TVBOUWs5TmlxVlZQdnRB?=
 =?utf-8?B?Q3d0NkFTLzVCQ3MvUlIrYkVwSWRvTUVTd2s1OHdWa1g1RUs4TGo1QXE3b0hW?=
 =?utf-8?B?eTk5ak13bTZTTVJIU2NWVG41NTMwdytpQUU0S3FqOEd4d2hWSXMwWlhkMitj?=
 =?utf-8?B?VTNkM2lUUlRKT0VYWlhjQStncTV2VzdhVDY3emNYZFJScDQ5cldqdWVqblU0?=
 =?utf-8?B?bXRsdGI0Y1MyVlFJbFFiYThDOWZkUzF4L2FtM2RWdmFqYjl5K1hOSkFVbHNE?=
 =?utf-8?B?eTNBdnNkQWw0VFo2bEJkRE9jN0o5VXNiSTJrc3VvTTJZaUZIMjdMT05VOGN3?=
 =?utf-8?B?UmF0MmpaRk9UeFBZUVBzQ1luSEVTT2E2UHl4eFVadzQvang4QWx4dmlaQ2tz?=
 =?utf-8?B?cDRqa2pwc25sOEJ5eWFhYXVFS21HR3BOa1k1NDh1cTlrelo0R1dPL0VWb2k0?=
 =?utf-8?B?SEtxVEpmdHdZRTFhVGhxUVFPakhtK2gvUUpSTEtBQlkvYkJobnFPcjNYTDk5?=
 =?utf-8?B?WmdKZFhpNy9DcVZDMFZwNEgzbFAzT0V3N1NTMThvNHY0YUorNkRtaVZnUWxI?=
 =?utf-8?B?L0ljWDE3Z2UvV0srN2tnZmlCQjNXY3lvZ01QdW1lYzhHSVYxNEZyYUhST1Nj?=
 =?utf-8?B?ZWRUTHl5T1kxc0Yya2F1Vjd2dEF0c0Ura1dHcWRHc1NGY0E4ZjdYZEFNS3I4?=
 =?utf-8?B?MC9ib0hGc2lVdkRuSHlLeDJvN3Mwd2pjclVrVWx4NHRidnlFM2xCcTIvSDBu?=
 =?utf-8?B?VVVpcXBXU2VwN2Z6K0JEcTRjdWQxeHI2aEJJZVV4b2d3Nk55bDliNWNRT28y?=
 =?utf-8?B?eGRJeWllN2ZEWHpxRFdvbnR1dFd4L2hJY3FTb0V6cy83b3BoMXltZ01lNWRL?=
 =?utf-8?B?QlNBYWpXN2l1bmJJbGhtZWdwSy9ZYm5CRW1qZjkwMGVVTHUremZaa1NPT3Ri?=
 =?utf-8?B?T2tLM0JWbDdBK1NlV1RNOUJQd0g2RUpEdDhYT0wwTzhQTnhNQjVlN3BFenNa?=
 =?utf-8?B?ZkFldTZOb3NkaXpWSS90bk9jZkZWbHhVR1NNQUZyQ1Nqci92RVF0eXd1MmNp?=
 =?utf-8?B?OGpLRE5WVWxEeTRXMFhVTHRDWGFPd1hESzk5L3JUMXR2RjUyQ2tMb291Q3lW?=
 =?utf-8?B?R0Q0MnV2R3JEUnJDc2gyVjRnM2tWNW9VRmR2REJxMExBL3F1TjhJa29OT2RS?=
 =?utf-8?B?ZHJGdUJrbmFsdUM0dElCc2JYa3JYMkR1UjV0RlpiWG1ObUNKbHhHZE54NnBJ?=
 =?utf-8?B?S0RvNngraDhqLzZZOWo0RDdDZ1FacGxjRHdqa0VheFZBMUdZMm1HZFFhaG90?=
 =?utf-8?B?b2VrT1BrWUl4ZGxQb3d0ZjdFYmVpSjh4UDFLcXdTaWpiS0pNRCs4c2ZOTGpq?=
 =?utf-8?B?aHpLS3FLbDJ3VTRxS1ZYa1BZRWRYdmdheU5wejJkdlRLNUFJMnpWdmdEMHZX?=
 =?utf-8?B?VmNZaERyd0hpbC9SSWp4aGVybXhIei9TUit0WnFFWFEwMDNXTFFmbzhoTWQ3?=
 =?utf-8?B?cHFxME5qbUYxdmxwODB5L3dualpDTlU5eWwvS1lVMWNRZHFYR01zalJRVUJY?=
 =?utf-8?B?RGZyOHFJZWxoTjU0S3RwNE8zR254SU1JazFYN3cyRmxyNlVURy9aK2ZXeVBu?=
 =?utf-8?Q?qaXyL2Pxu2Eb07Dvxu5az8M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F20E0DD06D28DC46B73A2122B657BEBD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35396536-0bcd-425f-36f6-08dbe471fd1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 17:57:23.1667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J16dwqHJEghwPbU3alGyEG2n3N2joxItC+zWK2hYKUx52FHAKKU/EmXBD2r/GghCAsiE+MoEO6+GX00JBu4bMIADita4pRjZeGNUEVyeEGiOYGGlcB42xWnDrUeFVGXZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
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

T24gV2VkLCAyMDIzLTEwLTI1IGF0IDEzOjU4ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMDQvMTAvMjAyMyAxODo1OSwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gPiBPbiBUaHUsIDIwMjMtMDktMjggYXQgMTM6NDYgKzAxMDAsIFR2cnRrbyBVcnN1bGluIHdy
b3RlOg0KPiA+ID4gT24gMjcvMDkvMjAyMyAxNzozNiwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZp
biB3cm90ZToNCmFsYW46c25pcA0KPiA+ID4gSXQgaXMgbm90IHBvc3NpYmxlIHRvIHdhaXQgZm9y
IGxvc3QgRzJIIGluIHNvbWV0aGluZyBsaWtlDQo+ID4gPiBpbnRlbF91Y19zdXNwZW5kKCkgYW5k
IHNpbXBseSBkZWNsYXJlICJiYWQgdGhpbmdzIGhhcHBlbmVkIiBpZiBpdCB0aW1lcw0KPiA+ID4g
b3V0IHRoZXJlLCBhbmQgZm9yY2libHkgY2xlYW4gaXQgYWxsIHVwPyAoV2hpY2ggd291bGQgaW5j
bHVkZSByZWxlYXNpbmcNCj4gPiA+IGFsbCB0aGUgYWJhbmRvbmVkIHBtIHJlZnMsIHNvIHRoaXMg
cGF0Y2ggd291bGRuJ3QgYmUgbmVlZGVkLikNCj4gPiA+IA0KPiA+IGFsYW46IEknbSBub3Qgc3Vy
ZSBpZiBpbnRlbF91Y19zdXNwZW5kIHNob3VsZCBiZSBoZWxkIHVwIGJ5IGd0LWxldmVsIHdha2Vy
ZWYNCj4gPiBjaGVjayB1bmxlc3MgaHVjL2d1Yy9nc2MtdWMgYXJlIHRoZSBvbmx5IG9uZXMgZXZl
ciB0YWtpbmcgYSBndCB3YWtlcmVmLg0KPiA+IA0KPiA+IEFzIHdlIGFscmVhZHkga25vdywgd2hh
dCB3ZSBkbyBrbm93IGZyb20gYSB1Yy1wZXJzcGVjdGl2ZToNCj4gPiAtICBlbnN1cmUgdGhlIG91
dHN0YW5kaW5nIGd1YyByZWxhdGVkIHdvcmtlcnMgaXMgZmx1c2hlZCB3aGljaCB3ZSBkaWRudCBi
ZWZvcmUNCj4gPiAoYWRkcmVzc2VkIGJ5IHBhdGNoICMxKS4NCj4gPiAtIGFueSBmdXJ0aGVyIGxh
dGUgSDJHLVNjaGVkRGlzYWJsZSBpcyBub3QgbGVha2luZyB3YWtlcmVmcyB3aGVuIGNhbGxpbmcg
SDJHDQo+ID4gYW5kIG5vdCByZWFsaXppbmcgaXQgZmFpbGVkIChhZGRyZXNzZWQgYnkgcGF0Y2gg
IzIpLg0KPiA+IC0gKHdlIGFscmVhZHkpLCAiZm9yY2libHkgY2xlYW4gaXQgYWxsIHVwIiBhdCB0
aGUgZW5kIG9mIHRoZSBpbnRlbF91Y19zdXNwZW5kDQo+ID4gd2hlbiB3ZSBkbyB0aGUgZ3VjIHJl
c2V0IGFuZCBjbGVhbnVwIGFsbCBndWMtaWRzLiAocHJlLWV4aXN0aW5nIHVwc3RyZWFtIGNvZGUp
DQo+ID4gLSB3ZSBwcmV2aW91c2x5IGRpZG50IGhhdmUgYSBjb2hlcnJlbnQgZ3VhcmFudGVlIHRo
YXQgInRoaXMgaXMgdGhlIGVuZCIgaS5lLiBubw0KPiA+IG1vcmUgbmV3IHJlcXVlc3QgYWZ0ZXIg
aW50ZWxfdWNfc3VzcGVuZC4gSSBtZWFuIGJ5IGNvZGUgbG9naWMsIHdlIHRob3VnaHQgd2UgZGlk
DQo+ID4gKHRoYXRzIHdoeSBpbnRlbF91Y19zdXNwZW5kIGVuZHMgd3RoIGEgZ3VjIHJlc2V0KSwg
YnV0IHdlIG5vdyBrbm93IG90aGVyd2lzZS4NCj4gPiBTbyB3ZSB0aGF0IGZpeCBieSBhZGRpbmcg
dGhlIGFkZGl0aW9uYWwgcmN1X2JhcnJpZXIgKGFsc28gcGFydCBvZiBwYXRjaCAjMikuDQo+IA0K
PiBJdCBpcyBub3QgY2xlYXIgdG8gbWUgZnJvbSB0aGUgYWJvdmUgaWYgdGhhdCBpbmNsdWRlcyBj
bGVhbmluZyB1cCB0aGUgDQo+IG91dHN0YW5kaW5nIENUIHJlcGxpZXMgb3Igbm8uIEJ1dCBhbnl3
YXkuLg0KYWxhbjogQXBvbG9naWVzLCBpIHNob3VsZCBoYXZlIG1hZGUgaXQgY2xlYXJlciBieSBj
aXRpbmcgdGhlIGFjdHVhbCBmdW5jdGlvbg0KbmFtZSBjYWxsaW5nIG91dCB0aGUgc3RlcHMgb2Yg
aW50ZXJlc3Q6IFNvIGlmIHlvdSBsb29rIGF0IHRoZSBmdW5jdGlvbg0KImludGVsX2d0X3N1c3Bl
bmRfbGF0ZSIsIGl0IGNhbGxzICJpbnRlbF91Y19zdXNwZW5kIiB3aGljaCBpbiB0dXJuIGNhbGxz
IA0KImludGVsX2d1Y19zdXNwZW5kIiB3aGljaCBkb2VzIGEgc29mdCByZXNldCBvbnRvIGd1YyBm
aXJtd2FyZSAtIHNvIGFmdGVyIHRoYXQNCndlIGNhbiBhc3N1bWUgYWxsIG91dHN0YW5kaW5nIEcy
SHMgYXJlIGRvbmUuIEdvaW5nIGJhY2sgdXAgdGhlIHN0YWNrLA0KaW50ZWxfZ3Rfc3VzcGVuZF9s
YXRlIGZpbmFsbHkgY2FsbHMgZ3Rfc2FuaXRpemUgd2hpY2ggY2FsbHMgImludGVsX3VjX3Jlc2V0
X3ByZXBhcmUiDQp3aGljaCBjYWxscyAiaW50ZWxfZ3VjX3N1Ym1pc3Npb25fcmVzZXRfcHJlcGFy
ZSIgd2hpY2ggY2FsbHMNCiJzY3J1Yl9ndWNfZGVzY19mb3Jfb3V0c3RhbmRpbmdfZzJoIiB3aGlj
aCBkb2VzIHdoYXQgd2UgYXJlIGxvb2tpbmcgZm9yIGZvciBhbGwNCnR5cGVzIG9mIG91dHN0YW5k
aW5nIEcySC4gQXMgcGVyIHByaW9yIHJldmlldyBjb21tZW50cywgYmVzaWRlcyBjbG9zaW5nIHRo
ZSByYWNlDQpjb25kaXRpb24sIHdlIHdlcmUgbWlzc2luZyBhbiByY3VfYmFycmllciAod2hpY2gg
Y2F1c2VkIG5ldyByZXF1ZXN0cyB0byBjb21lIGluIHdheQ0KbGF0ZSkuIFNvIHdlIGhhdmUgcmVz
b2x2ZWQgYm90aCBpbiBQYXRjaCAjMi4NCg0KPiA+IFRoYXQgc2FpZCwgcGF0Y2gtMyBpcyBOT1Qg
Zml4aW5nIGEgYnVnIGluIGd1YyAtaXRzIGFib3V0ICJpZiB3ZSBldmVyIGhhdmUNCj4gPiBhIGZ1
dHVyZSByYWN5IGd0LXdha2VyZWYgbGF0ZS1sZWFrIHNvbWV3aGVyZSAtIG5vIG1hdHRlciB3aGlj
aCBzdWJzeXN0ZW0NCj4gPiB0b29rIGl0IChndWMgaXMgbm90IHRoZSBvbmx5IHN1YnN5c3RlbSB0
YWtpbmcgZ3Qgd2FrZXJlZnMpLCB3ZSBhdA0KPiA+IGxlYXN0IGRvbid0IGhhbmcgZm9yZXZlciBp
biB0aGlzIGNvZGUuIE9mYywgYmFzZWQgb24gdGhhdCwgZXZlbiB3aXRob3V0DQo+ID4gcGF0Y2gt
MyBpIGFtIGNvbmZpZGVudCB0aGUgaXNzdWUgaXMgcmVzb2x2ZWQgYW55d2F5Lg0KPiA+IFNvIHdl
IGNvdWxkIGp1c3QgZHJvcCBwYXRjaC0zIGlzIHlvdSBwcmVmZXI/DQo+IA0KPiAuLiBnaXZlbiB0
aGlzIGl0IGRvZXMgc291bmQgdG8gbWUgdGhhdCBpZiB5b3UgYXJlIGNvbmZpZGVudCBwYXRjaCAz
IA0KPiBpc24ndCBmaXhpbmcgYW55dGhpbmcgdG9kYXkgdGhhdCBpdCBzaG91bGQgYmUgZHJvcHBl
ZC4NCmFsYW46IEkgd29uJ3Qgc2F5IGl0cyBOT1QgZml4aW5nIGFueXRoaW5nIC0gaSBhbSBzYXlp
bmcgaXQncyBub3QgZml4aW5nDQp0aGlzIHNwZWNpZmljIGJ1ZyB3aGVyZSB3ZSBoYXZlIHRoZSBv
dXRzdGFuZGluZyBHMkggZnJvbSBhIGNvbnRleHQgZGVzdHJ1Y3Rpb24NCm9wZXJhdGlvbiB0aGF0
IGdvdCBkcm9wcGVkLiBJIGFtIG9rYXkgd2l0aCBkcm9wcGluZyB0aGlzIHBhdGNoIGluIHRoZSBu
ZXh0IHJldg0KYnV0IHNoYWxsIHBvc3QgYSBzZXBhcmF0ZSBzdGFuZCBhbG9uZSB2ZXJzaW9uIG9m
IFBhdGNoMyAtIGJlY2F1c2UgSSBiZWxpZXZlDQphbGwgb3RoZXIgaTkxNSBzdWJzeXN0ZW1zIHRo
YXQgdGFrZSBydW50aW1lLXBtJ3MgRE8gTk9UIHdhaXQgZm9yZXZlciB3aGVuIGVudGVyaW5nDQpz
dXNwZW5kIC0gYnV0IEdUIGlzIGRvaW5nIHRoaXMuIFRoaXMgbWVhbnMgaWYgdGhlcmUgZXZlciB3
YXMgYSBidWcgaW50cm9kdWNlZCwNCml0IHdvdWxkIHJlcXVpcmUgc2VyaWFsIHBvcnQgb3IgcmFt
b29wcyBjb2xsZWN0aW9uIHRvIGRlYnVnLiBTbyBpIHRoaW5rIHN1Y2ggYQ0KcGF0Y2gsIGRlc3Bp
dGUgbm90IGZpeGluZyB0aGlzIHNwZWNpZmljIGJ1ZyB3aWxsIGJlIHZlcnkgaGVscGZ1bCBmb3Ig
ZGVidWdnYWJpbGl0eQ0Kb2YgZnV0dXJlIGlzc3Vlcy4gQWZ0ZXIgYWxsLCBpdHMgYmV0dGVyIHRv
IGZhaWwgb3VyIHN1c3BlbmQgd2hlbiB3ZSBoYXZlIGEgYnVnDQpyYXRoZXIgdGhhbiB0byBoYW5n
IHRoZSBrZXJuZWwgZm9yZXZlci4NCg0KDQoNCg==
