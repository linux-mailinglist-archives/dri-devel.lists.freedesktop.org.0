Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6774DB7E2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 19:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D2E10E6FA;
	Wed, 16 Mar 2022 18:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B822410E6EC;
 Wed, 16 Mar 2022 18:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647455146; x=1678991146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=an8Lw7tdm/3CL2EKylnboOI3kRT2gbm0TitDZcLMidE=;
 b=JT0Qa4LekeOeiQjPB+xfvh/R3DrzzwXJEOcTRcuzq8yZJlIMo7PNHZzr
 pBtsYlLi2WkL9S5L0tBhLhtUAgk4fllWrdNDXv30qZMKmZlmyIn6Fi5mH
 hm9ekqmHgePFipWuAfHs+P/L3lYDor4IH5BJspSWSHZhm2hTzp+FejVBD
 0rDruMWW/KwfNTn1piVlOd90PiwsqQ3jcyUspeGWbxAXsTo3o3sOvcoSf
 Hw5ml58itlVqOpuwFWa8cw93dPmy2Z6VLKnFhaWFdJRZJiMcEWrn45SPu
 ZaUW6r5rGCc0NVL4aklA+Cingbus/IOIBBqte9zTnBhMgCRXgjT3m9LSC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256409209"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="256409209"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 11:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="635090957"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2022 11:25:43 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 11:25:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 16 Mar 2022 11:25:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 16 Mar 2022 11:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gblwGipNBHHo94Cov8YfF9q7to4vzMwL7c1eGweGU3uNARNuFnLzrQN2bImctMNPjwQB0P/yBDIMgCoJ0sILk/AN9JKl0pWP8iCoVgl3n/ONtbTcGgaiUrgrWyuqaSRJrlM3fIk0+3IghB0L4+pqN8ubqJB5cFps90z0iSACEUblBzuk0y0jiptFKx5y2L7JdrfTPUrud24IG0Zn4Z1f6PSYDhE/auX9JZ/uRKzEq4CutoTXGA8QhTtdLJ+A40GsGo9dAwujWPPK5xOgosy9n3wI3Sqx8co9JIbulUq3DSPi4w3z3r2EuJ4IcY9ywSNI52kBSbXQ0nTjarhRH6ZbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an8Lw7tdm/3CL2EKylnboOI3kRT2gbm0TitDZcLMidE=;
 b=aA8GQNeMprg9V0UBAfMOCE/EcLgbHl1oj5J5gQldvdohbGybJu9wZglJidXQICneYpB8ZLrVrGcs04/N5Q5pRgVgu+nmoRcVLVrpVleH/LrhDI8A5Wv9uL0tTJKYyY6EL1cRu1ESKdZ7szq6EsjDS//Rv9S260bWV4AURVtnkJ3qxVixQ0CrkeTKHRes5y/MOIv8JUeKV3qsZ9OVT8e+c+4OvjoOi4QWn2lu+X9TDJWSu+9mIIoIVcbZEynqnZ+e5Rv+Qfwr7+ktjWC277FYpqWS2TEGhVAgDn1QMbxnLRfqfeVVXVjFqZkF7yG0tAAIvkJFJ8A0RsUlBcLIqdqdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 18:25:36 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::2907:3e4d:a871:8161]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::2907:3e4d:a871:8161%7]) with mapi id 15.20.5061.029; Wed, 16 Mar 2022
 18:25:36 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Index: AQHYMBX99rVLU26gUU6Ga1xGmtOKgKzB2fcAgACHMKA=
Date: Wed, 16 Mar 2022 18:25:36 +0000
Message-ID: <SN6PR11MB25746536889F82B535276E2B9A119@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20220304221407.2416898-1-fei.yang@intel.com>
 <a8acf220-e125-4a2a-2549-97bc92031750@linux.intel.com>
In-Reply-To: <a8acf220-e125-4a2a-2549-97bc92031750@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1407644-7521-459e-149c-08da077a5dbb
x-ms-traffictypediagnostic: PH0PR11MB5205:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB52050857CA884FF64D2877B19A119@PH0PR11MB5205.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zkfvMVxhrEJTRVrQE2EiH0lU1c1ppTqBbMOxxS0+ztDk4ydhlNp9GWqk/oaMmwm/g2VIilg6PU+A/PE6ywmGGJsy8/cso3K/DzOKa143uznaGCZMSX5KDF+00WUg6Dv11/ChcveQvJCBH+Q8xqRHtgxrafdRuBTXYNzvBDnMdhT91vTGOBw4wmA7cJF85SNcsmf09cw1cWn6Belg57YPlWK52TIeBrCStBPUJRg3UhRsHCrXLISuWtqWinKTKtMYxrqKWhkNln5TGb4UyNcgJW52v0Nx4VT7PZVuC+dxBptRNZL+5g8l+RQEKMQ8tYlv4hiAs9i/qGuljQRubz4CX2OhBWJsDi1zXE3GxP1R+oCRye1o6xQquxx7epqhVZfD+AZFecy17x++Z3jkhBZCKob5KoihK+Dd5TkLaDk5CyA8h0lQFnK+f222t0wdISjLVQCW1bN5rhGfhNvcVgeQhpeElImBhJMLizrGba4RAhSUYoYYCut4wRRoM2Bi/tio+lTm7y6U603Iugnt7ncK3j+Q5vHH2ZA2/lwGV3fczeBJJpb9hund9RBl7MUjHDp+iY3mPw8RYaC51IrtXLrm1hHBb7jHfHXlJyOYGoJqg/QZyL6RrUZTWtaiim1bZaMvfjigFRIwtySbqRqfVxr+JKpA5jTCuSdE8nT8Z2o+dTHGa4XonQroCnmAXduRLIncZizQt+p0HJXQemC0I6QhVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(122000001)(52536014)(5660300002)(38100700002)(83380400001)(8936002)(26005)(55016003)(71200400001)(86362001)(76116006)(186003)(9686003)(8676002)(66476007)(66446008)(64756008)(4326008)(66556008)(508600001)(110136005)(66946007)(316002)(6506007)(7696005)(33656002)(38070700005)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3ZQaVNqcU4wV0FSQ3hINHBtajhCcm13OFJRS1piYVRQZzk5bEFzdmRBb05C?=
 =?utf-8?B?Smo0ejhTK2V4V3IxcmI2ZlR0K2d1QStQbWdrSVE5cmQ2MFpNUlZMNllCaldV?=
 =?utf-8?B?YXdwVTJtOVNnUjBIbkI0ZzkzVmdlTzVrZGNBWUlOMnladE44U3o4VTIvdUNS?=
 =?utf-8?B?S0xZVVhzL3NGVlpMYU9FdHNGVkVOSE0vNWtZVDJrTUIzUnpCN3hTRWlqdm1E?=
 =?utf-8?B?RGJGZ3BEVkFSdnB3TzNraTJPbVhRYWRRUStwaFJyQkR2SFNtM2c0V1h6aGpW?=
 =?utf-8?B?UGhiRHNxSmFhV0FtYml5OW13WWwxRmtDTmU2SDdpbG52c3RWWVkrblZPd3cr?=
 =?utf-8?B?ZmJmUVlqOUFSRnM3NzJISFZRU2dpVjg3Y1JqbEJjU1BwL09oLzB2bm50ZWh1?=
 =?utf-8?B?VVc4d3NzTENKWjFsRWFSNi9Majlyd2w1ZHBSdjJVVkJaUis2WkkxdmNmTysw?=
 =?utf-8?B?UHF0U1RXV2pwRUsrNGJDa09sbEFReUEydmhyT045TjRpeGoyRG9pRzk1VWdu?=
 =?utf-8?B?Qnp1UnhCRnNEbFhKQ29CSit6VU5uU3A0V3NvRGI3RW9FN01RSDhYS2Q3M1ps?=
 =?utf-8?B?c1Z4WjJHUWV3d01uTHg3enBBdW9ReTdMOXlYdHlhNnZkQzc2WDJJSHZtRzVv?=
 =?utf-8?B?YWdqcGQwSm9YVmlMek1vdU5iaW0xTGNkYkxkaGY5aWZzTEdDNTFyNm8vbjF3?=
 =?utf-8?B?ZXFqaTB2VHErVnl4RGxMeTdCNnUxRVVzT0d0b1A0STdHcURiS0I4S25ndHdz?=
 =?utf-8?B?UEpZNmhoV2xybjNKRnJXK1krOHJkcUJrbVg2VzB0QnRvSzFaYW5iY3EzZmFy?=
 =?utf-8?B?dHZDSmNzVDZQRmk5OW9IS1BPdlh6R2VoTWh4Y3o1TkRkTVdQK0tNeldNTVZQ?=
 =?utf-8?B?OGE1R2lsNFB5MWhneGtPQ1pNV1FGZkJvcCt4Tyt4NGdWOUtlMmxadTBQWWg4?=
 =?utf-8?B?NFNFZFJpSFVyTFJKS1RaRkFFWEhNaWtLZWNCWlNybnY3WWxRRjNkcTdBMUNU?=
 =?utf-8?B?WUZ3cmE4dnNCb0wzQnNmMzgrL1paUHlOUFBuclJKaHdTeThMMDBTL0I2d05p?=
 =?utf-8?B?MTdTOWNOYnd0S0Z1cm9XZGRqZGNqWllseEVyMkJGWXE5L1JybXFlUXZlTndE?=
 =?utf-8?B?b1UyMTNSR3R5RS9xY2VzYm82SGwxZnVoNUFOb3NtSWpjeTdHNkQ4YVJKTS82?=
 =?utf-8?B?d2ZTam03UGZZL1ZzYzYzdm0vdkVkRE9IQWRnWm80SkRiQXpCNjE1ZC9aZlI4?=
 =?utf-8?B?ZXlKelVTalVmNTd1alZxbDd0VnBHSUJtOHRrcjE1ZEJRV2Q0ZzNxeXIvdjEv?=
 =?utf-8?B?ZW9ITUZpbWoxZUdpY3VaZVRIQ2wwOHNia1VITnFJYlNFdG1vQ3IxOEozVHJ6?=
 =?utf-8?B?MU8vQjFCejZkbUw4a1Y1K0Y2UWV5NERiZlpaRkRndHVNMkFOYlIvcUNhbWNs?=
 =?utf-8?B?TjBoZXpzNWM3eVNQVnJMY2prdUZyTXV6YnNRcXhSOFNwdWJKdzVxUDV1Unpm?=
 =?utf-8?B?ZkYxSFVZcVdNVHRRZGgxMGx6SWY0RStwU0tqb0hSU3FxZkFkdHlKVVV2S1VX?=
 =?utf-8?B?VTdlR2p2OTF5emxCcmIzQ3lmK2duOWVUYUZYeVNIY2JSOGhFbWkyUGZpeGhy?=
 =?utf-8?B?cndIVDdFSUF1S0tXbFJKZmNlKzJHdWhWNFhBM3lva0NJeXJkL2tkdFM1Z25V?=
 =?utf-8?B?Q1FveW9YS3QxZDIyVWw5VzkvZzcybGJTZUY0NWdaNU5sWDlQb1hGL3NSdW9o?=
 =?utf-8?B?eEZ5L0F4WjVHQWpGRDdVbVZYNDl1ZDRQN0pqMUl5Rk9OcWFEZjI2SlMvTGQ2?=
 =?utf-8?B?SzN1V1FIT0JJdnAxNDlWNlFRdklBQlpxdjAySmlVNm43OVpTdWtPMW5qa0pk?=
 =?utf-8?B?cG8vQklQOWpSdDhQaDhaUXVvNlVoNEVmRmYrU3h1bTZXOW42MndGMkpoc29Y?=
 =?utf-8?Q?lGiadcsg7odvLiLRUMfqFiulwqmToGhe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1407644-7521-459e-149c-08da077a5dbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 18:25:36.5355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgwI/iPcg3L8xRZ2JPAWas3BCZLwd8liB5J1UCDo9PccEpeu3WnWAwF4dQTH0X3c81C+AyWYsDJNzq2CspfXkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
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
Cc: "Wilson, Chris P" <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjJfZW5naW5lX2NzLmMg
DQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjJfZW5naW5lX2NzLmMNCj4+IGluZGV4
IDFjODJjYWY1MjVjMy4uMGVjNDk4NmU0ODA1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvZ2VuMl9lbmdpbmVfY3MuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvZ2VuMl9lbmdpbmVfY3MuYw0KPj4gQEAgLTM3LDYgKzM3LDkgQEAgaW50IGdlbjJfZW1p
dF9mbHVzaChzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycSwgdTMyIA0KPj4gbW9kZSkNCj4+ICAgDQo+
PiAgIAlpbnRlbF9yaW5nX2FkdmFuY2UocnEsIGNzKTsNCj4+ICAgDQo+PiArCS8qIGhzZGVzOiAx
ODA5MTc1NzkwLiBObyBmaXh1cCBuZWVkZWQgZm9yIGdlbjIgKi8NCj4+ICsJcnEtPmF1eF9pbnZf
Zml4dXAgPSBOVUxMOw0KPg0KPiBTYW1lIHRoaW5nIHRoYXQgU3R1YXJ0IG1lbnRpb25lZCAtIHdv
dWxkIGl0IG5vdCB3b3JrIGZvciBpbnN0YW5jZSB0byBpbml0aWFsaXplIHRoaXMgaW4gX19pOTE1
X3JlcXVlc3RfY3JlYXRlPw0KDQpJIGRpZG4ndCB0cnkgX19pOTE1X3JlcXVlc3RfY3JlYXRlIGJl
Y2F1c2UgdGhlcmUgaXMgY29kZSBsaWtlIHRoZSBmb2xsb3dpbmcgaW4gdGhlIGRyaXZlciwgYW5k
IEknbSBub3Qgc3VyZSBob3cgbWFueSBzdWNoIGFsbG9jYXRpb24gaXMgdGhlcmUuIEkgd2lsbCBn
aXZlIGl0IGEgc2hvdC4NCnN0cnVjdCBtZWFzdXJlX2JyZWFkY3J1bWIgew0KICAgICAgICBzdHJ1
Y3QgaTkxNV9yZXF1ZXN0IHJxOw0KICAgICAgICBzdHJ1Y3QgaW50ZWxfcmluZyByaW5nOw0KICAg
ICAgICB1MzIgY3NbMjA0OF07DQp9Ow0KDQpzdGF0aWMgaW50IG1lYXN1cmVfYnJlYWRjcnVtYl9k
dyhzdHJ1Y3QgaW50ZWxfY29udGV4dCAqY2UpDQp7DQogICAgICAgIHN0cnVjdCBpbnRlbF9lbmdp
bmVfY3MgKmVuZ2luZSA9IGNlLT5lbmdpbmU7DQogICAgICAgIHN0cnVjdCBtZWFzdXJlX2JyZWFk
Y3J1bWIgKmZyYW1lOw0KICAgICAgICBpbnQgZHc7DQoNCiAgICAgICAgR0VNX0JVR19PTighZW5n
aW5lLT5ndC0+c2NyYXRjaCk7DQoNCiAgICAgICAgZnJhbWUgPSBremFsbG9jKHNpemVvZigqZnJh
bWUpLCBHRlBfS0VSTkVMKTsNCiAgICAgICAgaWYgKCFmcmFtZSkNCiAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsNCg0KICAgICAgICBmcmFtZS0+cnEuZW5naW5lID0gZW5naW5lOw0KICAg
ICAgICBmcmFtZS0+cnEuY29udGV4dCA9IGNlOw0KICAgICAgICAuLi4NCn0NCj4+ICsNCj4+ICAg
CXJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0K
