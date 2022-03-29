Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228034EA7DB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 08:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A7A10F05C;
	Tue, 29 Mar 2022 06:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094C010F05B;
 Tue, 29 Mar 2022 06:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648535273; x=1680071273;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=5/SVP8oLCAs1Q0DgToXBEKL54QByjisD9eRhlSm4WyA=;
 b=k5OmNNmgysuvpLcGkMKQXwFhyGylOhe9QHpyUgHKkk6d63cwmqqfP1FQ
 Nl3jZXTtdRkOyIeF12qauTZCc6Kdhr7eUO8xMeH7E9It7vcM0LrA7SfRL
 DbTN281nB9Y4tgTJst3+vALcpylkyjbXF65yzPOPTrg4pwWnAGWirI/U6
 CGIbGSM/DOX/hD3TN+wegdQv3of/UA9kWqxdxbYh1xKeAqhbI+Uoz3ovZ
 XX8FW/gPmdZMx8FSUVL+ER0j7go9ilkGmH1NQAGuje0Y9NM4sQuYMmAzW
 lEzwb+AcjPy3Z9gGG1haHbyy3reuDdhEbhT6Erb/Jy9xeJnTlO7mNlWqJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="258002322"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="258002322"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 23:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="564355027"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2022 23:27:52 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 23:27:51 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 23:27:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 23:27:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 23:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPC8s/OLHFH88/HWLyapKH0gVpG2zUDwmE7L+PLsPxr99xm6lOwiz7ushgL1JkNRBq5+jje36BeIfz1Daf6gGUV8Xyt67YosF95S/dk8flx2SK4bRQmYZZ+pUvNvne9J4ievlbRB/vy14Ox9Qq7ui4PC4/S3V0sM20qceE8Bc/eORtyF7OFSbNZPlWrTY3LLlu3xUeSF/dvHpLPhU5UkTl8XEATHN1GmnIvzgG2YUGD5PBmmArYgEQe4qYiZKfpig+xSVn1GuRd5u7fXa7ZK7mC8jKa3YZuksjZMvCThVwN36s9kpLwaD2iH/Yda/Mafh/NJ0glnnzxIV2DQm7FwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALe9OzjNxbZ37i4wH1d7rwFGPNjNw3tP7FsR65i+eJ4=;
 b=Bd2XoKeeOiGuPAoCrbyD4a0cfFOEWQoUzma1yBwWnd+AkTxgr2QgZ+5UXisSQP22vU/7j7moctx85Vwtq56tx3n6R1fZgZvTYOv9Kqc3ci/yV40CL4iYbnx45fNP5MBKWLAPyUE1P4ATBhh9Bf0k1FhqwXBq4ay4FdZIF3dSEfoHb2GPju32TNagPFfPNA6vqgokieT+3OY0DPJE4Cs5/m4WHYV5NgfQSI2BN6OxJFPPdcil0aeSDFySmen0I0U4KbbFD6r/yW1YFFBy66SWUlqlg94D1g6iZvscmOFqEO/rhvNtBruFjeGouZbhCtQuVdD4AJgXFiCnigVLQqYg6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BN7PR11MB2820.namprd11.prod.outlook.com (2603:10b6:406:b5::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17; Tue, 29 Mar 2022 06:27:47 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3967:4609:9c43:44a]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3967:4609:9c43:44a%4]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 06:27:47 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 1/9] drm/i915/gt: use engine instance directly for
 offset
Thread-Topic: [PATCH v7 1/9] drm/i915/gt: use engine instance directly for
 offset
Thread-Index: AQHYQtcGLn1vk4tmWUeMcm/p6GV3yKzV386A
Date: Tue, 29 Mar 2022 06:27:47 +0000
Message-ID: <4d4654e8ec63875b4bc63d517326102eb0501340.camel@intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
 <20220328190736.19697-2-ramalingam.c@intel.com>
In-Reply-To: <20220328190736.19697-2-ramalingam.c@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-3.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 363d9c58-a339-439c-4af0-08da114d3dd4
x-ms-traffictypediagnostic: BN7PR11MB2820:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB2820987FCD2852C074FFE172971E9@BN7PR11MB2820.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mnZJTlzQuyB+B4nZr9ZAREzAO2kwDjcpeCcoRnujU2yiYADYkUb0pkIODCq2BrtdvUwUnicrU5ZCj4upDCVAhU3yLHl0tL2DQCUStwmWlA4LOIiqpucdrvD+5cUaLX2AwXEK+N5/GNbyWue6CsGYb9s+IgE280SxUWZ1ZxZlqE0iUpH9s/w85Xn+u1UA3AfQHNLSApGemcDancsL2GG39opjd1DC1lhy2b8pOV2hWFuR4VydC55HE2mqA9ApQiZUwcxBFIjWW+mxhJoX1NamlC5/hTwEdJKlJBOFqc316to/ilqQGineYm6ZPFJtxKf29FNzTA8UkPvspnA+Kywz1Ao1d5PgOewuEgpc7VQx7Og9g92wCwFOllEtkX2jnPnQfAO4Uwo3DswkYWiRexbtOw5I2TTQrkhH8OFD5ibOnM0PsX88Wzptd2WX28hSd9q8N984qORZm5818eMlbbKj9poRzO6hqxAKAgy6up4EA4Gi7Uj51IQhOWdOCeiyi0YZLmurKA3Qjc6tDj3mz6LErstTuHXiF20JnhcYhy+SHSn2q6sHrPl69M6Z/hZ7OdZTtDy1D3wzmxhACqyfBsx8MzzH5p+xxSI93jWJHmCgfWSJCG9IcStb84A/iTSMagC07+bxpH8ebJV1tKWZZn7lMA256mv1PkK4MPRDiEOaP09nNdDe4/0KRZ5PoiKYdbB8V60QHGY2P7Wl+EiQrvlmkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(26005)(66574015)(508600001)(2616005)(71200400001)(186003)(6512007)(6506007)(83380400001)(86362001)(6486002)(450100002)(8676002)(316002)(66946007)(91956017)(64756008)(66476007)(38100700002)(4326008)(5660300002)(82960400001)(66556008)(2906002)(76116006)(36756003)(8936002)(38070700005)(66446008)(122000001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWtrTVYreHN6RDNuZHloV01CaEk0a2RUMWlKNDYwajNnbVBDUHNIcHZlMXY3?=
 =?utf-8?B?aDM1Y0RnN0g5Y05aTWkyd3ArT3hmeUZaVjc1ZGIvTW5ZTnlVaFNpdUJwbExv?=
 =?utf-8?B?c0Y3bnJoSG9KV3VLVjNTbzhIaXErSXVCOW1ockNhMjRNellqVE1vN3Y5VUoy?=
 =?utf-8?B?eGlIb2lvR3hzOHAvY2NaVzFlY1BIek9BRXBnbmFPajA2ekVLQnFibDgwTk55?=
 =?utf-8?B?QXFNU0wzdWw4bk1wZFc1SnFxeGhsSmphaXlwbnFISmp1VVZvRDVPQldxeHNS?=
 =?utf-8?B?eEg1dTB2T0V3VWwwQzFtWlczZVFwWHc3cFJjWkE1NFc1UFRsVWt0OUFZek9o?=
 =?utf-8?B?akxxcFVsUVhBLzNxd3JjUklpNjlVRlZyRTdvVldwdmtWemxkRnRvWU5HcWVn?=
 =?utf-8?B?c28xMWJqUXZlL1dxSHRaQ0JYNEhYNGhuZHRQQ2dQOXhXL3ZEdWQzQjFieDlF?=
 =?utf-8?B?dDJaT1RvUDUyeVBrcWZVMkdhaUF0emZiUHlnYUZBMldPS01wcE8zZHora0pC?=
 =?utf-8?B?QVBHRFBFK3A1MXR3MEhzazVVNTFIZnM3bk43ZXJsY1BhVytmR3VKVjMyYXBT?=
 =?utf-8?B?MXFnbk1NYmxsdVNTMjVzSzRZSEZGakluMkJNalR3SXhPRUswZ3FWR21LUXNi?=
 =?utf-8?B?QjdsRHU2eExFNytIN3dhVFF6UC9JM1NveDNrdEpSQXQyN3MxSFplbzlMTnQ4?=
 =?utf-8?B?Vk9CQUpZY2VlTFgra0RUeEd4NFRKanFuMUxacEJ0U2tDUzZvaXZtVmhiUzdD?=
 =?utf-8?B?RUV3cmVRcE5hbHMyQm91K0JsUGp1c3VlQWJzbGJpblpremNrbVdaYkMzc0oz?=
 =?utf-8?B?RW56d0ZHMEUwdmhSYWoxNkpBRmhWcUV2TGQ0UGt2aFlZa3JRb1ozcS92Qm9k?=
 =?utf-8?B?L1hDL29UWVJhd0k0YXlubGJTVGMrZExkRFZxajUwOGlEZmFoSy96SXdCTG1L?=
 =?utf-8?B?b0phT0JLREpoZkhidjFWY29VUFRseGRDb2cwUUk1SGNnSmRXTXB1ZEJIeHBQ?=
 =?utf-8?B?em5tVDBDdW1kVjJaZDVvWG5pZENIbUtwWENQMm5qRFFjWDEvOHV2U29PcWpQ?=
 =?utf-8?B?d2ptWUl0VGZ6c0FYYXBmZ2JQZnR5SUtpVXBIb2kzc0Y3ckMvaXZWVUptMmhj?=
 =?utf-8?B?MWNReDVvK3pncHU5QkdaNmJPeVFTK0UrYVpTemV3MFlxd2lsTVhZM3J6cE45?=
 =?utf-8?B?WWx6K3d1bGZZdHVJM2h4S0xpYnc2a3NIajd6MEVPclpaaTVwUkFkaFh4Qnp0?=
 =?utf-8?B?eGJrRlYzaXlaeUlzdGhFS3NCTHByaWJtSDJlUGZWOG1KRkxJeVllRGpWbzFI?=
 =?utf-8?B?b0I2UVp1Um9UdldTdjM4VDVvQndNeWYzOG9OUmJCdWc0RTJucFFvWUxMSWly?=
 =?utf-8?B?RHVDOHovbk5BOGkvYngyejF5MjUzWTZlNnRIUlFEenlPQVRxMkJDQk1HM2p3?=
 =?utf-8?B?Vk0yekp0ekNqTHhGNjA0czFNUkUwWElXZHF6eE1STnRaN1YzMzNRQlVlOFh3?=
 =?utf-8?B?SUhwNW5QMkVBM242VWgrVmdsQ2wzdjI3Ni82MlZoMlFMc2w1b3ZYTVl4SXVH?=
 =?utf-8?B?RlJzQjVUVGVncTlCeGV0Tjh4MW4zOEtsMlhDd1hWUUxDTEdFNnRpZjIvZmI2?=
 =?utf-8?B?RU9KU0FPRU8rRGN0dzVKai9vV1UxVC9yLzMwUEV5c01RZUZPSmlBalRlNklX?=
 =?utf-8?B?bFlGL3E2Mm8zeE11RzZaTlRqQzUzQ0ZWdWpXdmxOOThkZkN6Y2tPbWo3d1Zq?=
 =?utf-8?B?WHRoR0x5bGdJZlBMVlBISTBhREYwTVhwc2orajZ5TFI3bGV6RkVQUGE0a2lV?=
 =?utf-8?B?WXBmUVB0YXR2OGxycktlZW9Bd0lrb0VrYlRoaDQrRHY3TzVrSHlZS0l0Rnlu?=
 =?utf-8?B?TVVGbzRiNkJsRm42Rng2Y2lValVEVVVNNGtZNnhuYUsxUkYveXNTZitDekpT?=
 =?utf-8?B?WjByKzdHNFlwbFE3UFJXS0x6OTZCZzV5NnZQR3NlRlYvRW5TUkJsWDVwN3lm?=
 =?utf-8?B?OGJDMEZyS1dTV0ZNVkJVc2VhMWRqM1czbUhXbWlPOHE5eC9mVUxLM0JEQkMz?=
 =?utf-8?B?bTlZc1l5NnlMc05MclBXRTZKeGZOQXdkRkhuM0pxTGJ3Z3lZNXFtRHBid253?=
 =?utf-8?B?WlBVa1E1REQ1WUhuMFhBVXQ0eFBDVVBlbit4WHZDYkxXT1Naakt2d1VNVVFQ?=
 =?utf-8?B?dkZnVHpNRUlIU3VrZzVNZDFlaEQxWjV1OXpuZWtlVU5GV1o5QU1hYjhvSnB3?=
 =?utf-8?B?SkJTb1RyTFc1dENSQWN0R1RrWmp5eUxOL0xqeXZuYlhwWE50U1NyNzh1a3hP?=
 =?utf-8?B?S3kzTVMyTXJFd3hFdEZwcUlRdlFBWWJ2R2ZoS3NraEIxSmhncitXSVI2WG5Q?=
 =?utf-8?Q?9RGxN1AXKn8Yyq6s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19F64BD40C5EA5449522FB7F15DC3AD1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363d9c58-a339-439c-4af0-08da114d3dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 06:27:47.0542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RljQW4pcwKc/Go8ns0H612ionyWIyc2sWSk/9JrMMMKomxm/EAQR+irU/x6aIzPXR3fFUU4CCEm54G/xj3LXlMhL1uAQ1BPs+XkESfrSkbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2820
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTAzLTI5IGF0IDAwOjM3ICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4g
VG8gbWFrZSBpdCB1bmlmb3JtIGFjcm9zcyBjb3B5IGFuZCBjbGVhciwgdXNlIHRoZSBlbmdpbmUg
b2Zmc2V0Cj4gZGlyZWN0bHkKPiB0byBjYWxjdWxhdGUgdGhlIG9mZnNldCBpbiB0aGUgY21kIGZv
cm1pbmcgZm9yIGVtaXRfY2xlYXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxy
YW1hbGluZ2FtLmNAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfbWlncmF0ZS5jIHwgMTEgKysrKy0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfbWlncmF0ZS5jCj4gaW5kZXggMjA0NDRkNmNlYjNjLi45ZTZjOThhMTc0NDEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbWlncmF0ZS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbWlncmF0ZS5jCj4gQEAgLTYxNCwxNSArNjE0
LDEzIEBAIGludGVsX2NvbnRleHRfbWlncmF0ZV9jb3B5KHN0cnVjdCBpbnRlbF9jb250ZXh0Cj4g
KmNlLAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBp
bnQgZW1pdF9jbGVhcihzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycSwgdTY0IG9mZnNldCwgaW50IHNp
emUsCj4gdTMyIHZhbHVlKQo+ICtzdGF0aWMgaW50IGVtaXRfY2xlYXIoc3RydWN0IGk5MTVfcmVx
dWVzdCAqcnEsIHUzMiBvZmZzZXQsIGludCBzaXplLAo+IHUzMiB2YWx1ZSkKPiDCoHsKPiDCoMKg
wqDCoMKgwqDCoMKgY29uc3QgaW50IHZlciA9IEdSQVBISUNTX1ZFUihycS0+ZW5naW5lLT5pOTE1
KTsKPiDCoMKgwqDCoMKgwqDCoMKgdTMyICpjczsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBHRU1f
QlVHX09OKHNpemUgPj4gUEFHRV9TSElGVCA+IFMxNl9NQVgpOwo+IMKgCj4gLcKgwqDCoMKgwqDC
oMKgb2Zmc2V0ICs9ICh1NjQpcnEtPmVuZ2luZS0+aW5zdGFuY2UgPDwgMzI7Cj4gLQo+IMKgwqDC
oMKgwqDCoMKgwqBjcyA9IGludGVsX3JpbmdfYmVnaW4ocnEsIHZlciA+PSA4ID8gOCA6IDYpOwo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGNzKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiBQVFJfRVJSKGNzKTsKPiBAQCAtNjMyLDE3ICs2MzAsMTYgQEAgc3Rh
dGljIGludCBlbWl0X2NsZWFyKHN0cnVjdCBpOTE1X3JlcXVlc3QgKnJxLAo+IHU2NCBvZmZzZXQs
IGludCBzaXplLCB1MzIgdmFsdWUpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAq
Y3MrKyA9IEJMVF9ERVBUSF8zMiB8IEJMVF9ST1BfQ09MT1JfQ09QWSB8Cj4gUEFHRV9TSVpFOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSAwOwo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSBzaXplID4+IFBBR0VfU0hJRlQgPDwgMTYgfCBQ
QUdFX1NJWkUgLyA0Owo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IGxv
d2VyXzMyX2JpdHMob2Zmc2V0KTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNz
KysgPSB1cHBlcl8zMl9iaXRzKG9mZnNldCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCpjcysrID0gb2Zmc2V0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3Mr
KyA9IHJxLT5lbmdpbmUtPmluc3RhbmNlOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgKmNzKysgPSB2YWx1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysr
ID0gTUlfTk9PUDsKPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgR0VNX0JVR19PTih1cHBlcl8zMl9iaXRzKG9mZnNldCkpOwoKR0VNX0JV
R19PTihycS0+ZW5naW5lLT5pbnN0YW5jZSk7ID8KCldpdGggdGhhdCBmaXhlZCwKUmV2aWV3ZWQt
Ynk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4K
CgoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysrID0gWFlfQ09MT1JfQkxU
X0NNRCB8IEJMVF9XUklURV9SR0JBIHwgKDYgLSAyKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCpjcysrID0gQkxUX0RFUFRIXzMyIHwgQkxUX1JPUF9DT0xPUl9DT1BZIHwKPiBQ
QUdFX1NJWkU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IDA7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IHNpemUgPj4gUEFHRV9TSElG
VCA8PCAxNiB8IFBBR0VfU0laRSAvIDQ7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCpjcysrID0gbG93ZXJfMzJfYml0cyhvZmZzZXQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAqY3MrKyA9IG9mZnNldDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCpjcysrID0gdmFsdWU7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJ
bnRlbCBTd2VkZW4gQUIKUmVnaXN0ZXJlZCBPZmZpY2U6IElzYWZqb3Jkc2dhdGFuIDMwQiwgMTY0
IDQwIEtpc3RhLCBTdG9ja2hvbG0sIFN3ZWRlbgpSZWdpc3RyYXRpb24gTnVtYmVyOiA1NTYxODkt
NjAyNwoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRl
bnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNv
bnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==

