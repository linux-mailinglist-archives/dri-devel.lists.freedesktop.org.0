Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC3583B54
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 11:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493EA97727;
	Thu, 28 Jul 2022 09:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715D97716;
 Thu, 28 Jul 2022 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659000977; x=1690536977;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j/fbrMDINcofQpVeTfqGBqF90MBV2lew5xGvFvIJiGE=;
 b=V930hraD9YXF/Uj10XgTcJID+z3S4EHiOc0IWJhW+QHq/VttQ2jI99cf
 b/CUf03sFplPQOW70jaUWq6Bw/HAElGS/lh4WCkjjHGciEObbltbLRIRo
 IALxLdZDRPD7C8RDRr8cMRTw1PNQFQdJEBhgDwda4LkInPGEU745SaHVY
 Gj7UFzVgz1VsnqgcJfh/EbfkMzerJyzfPk7I979wMVL7Wp/c12BQl6cn2
 x6vaJvBNPqYwhNR2inKLeJWiXNWcULaCwA9M96wxqkreAVrJ8GPqEcjnn
 kTQ1bnjrCsczSjZ2bCNQkfnVrDaOJcwJ3+3Bvylj7EDlEM3x4z6gLuQXn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="289239731"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="289239731"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 02:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="576385228"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 02:36:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 02:36:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 02:36:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 02:36:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 02:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuQxWkfjZnL/QTqkiGQqHTNu3mjvyhuTV/foSnMS/1Bi7mt95fN0smSEykSxkt1jZkfobJm19jFJal/MXbvxgNSRDIqLRLybVJDIvCIirtUNAvEbsLkYJd3lkA3uaYf6Iyh/8k3G3ocdxU1nyRHGS24L4scW1INvOZTIlRPnhWbTYtMX1jDWV0bUe9RURUtN9cue9Ioa759zDJn0j0fwxSCAMByP4OTat53QHpwC/K/gyfxBm+ZB7wd8HZLVfjBtjgOVcgMrS3uMPeH6SZXuYuXurtr9gUeDHm5dywZZmcEvshouSUkiLD1dPAJJsvm82VtOdgW0ojZPS2Kv9rNKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/fbrMDINcofQpVeTfqGBqF90MBV2lew5xGvFvIJiGE=;
 b=FVTEpnKU9/frikhROF9Lk7I2SeSE65a0EopTdK5asOPmkC6XK/ADQZ+72fJEN7IRYticQ6WFhMW99rASVeFvpfv9QmIBz7lYNESpgFHUeDmdWpRyqgVlJ5+mawanThYafOWaocqbJT0LwA6EyDK/moc5Tm4qh7in0QihyzoqfR78Il71CJ8BYNLONMN1MylRaBHnxjUbiqkNo3x+DZv4xKw2z5VkveoLU+FmSuuAzcOKVb6GcGjhEzciZPiKjDrTA/hYobltCMy/1ikan2iWOMMbi58zYS4SBsmVs1FACUyAwCCQNx6tI/CVEi8+d5qyCUBH6k9dGGyTLjvHc6u+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) by
 DM6PR11MB3723.namprd11.prod.outlook.com (2603:10b6:5:13f::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.23; Thu, 28 Jul 2022 09:36:13 +0000
Received: from DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::e1ac:cd2d:342c:6b94]) by DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::e1ac:cd2d:342c:6b94%9]) with mapi id 15.20.5458.019; Thu, 28 Jul 2022
 09:36:13 +0000
From: "C, Ramalingam" <ramalingam.c@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "C, Ramalingam"
 <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/ttm: don't leak the ccs state
Thread-Topic: [PATCH] drm/i915/ttm: don't leak the ccs state
Thread-Index: AQHYodgUglQlj/9diEST93L1xSKjoK2S2JdAgACWGgCAABNmIA==
Date: Thu, 28 Jul 2022 09:36:13 +0000
Message-ID: <DM4PR11MB60438C651E5D99C6FD308B2C9D969@DM4PR11MB6043.namprd11.prod.outlook.com>
References: <20220727164346.282407-1-matthew.auld@intel.com>
 <DM4PR11MB6043DA030C0AED1295B0E6F09D979@DM4PR11MB6043.namprd11.prod.outlook.com>
 <46f484d0-4c3f-f63a-3ee2-eae1b71293f9@intel.com>
In-Reply-To: <46f484d0-4c3f-f63a-3ee2-eae1b71293f9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42e737eb-711f-4928-5789-08da707c9ce7
x-ms-traffictypediagnostic: DM6PR11MB3723:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tq2b1LwPfRHTISq+4y4ZiZHwbJoA9MU3O+HxaD2VqrlD/pkJrMG4qRvLBPpykcISG5di9Jfi8BPBbSJ8hb2aLAjm3lie9Dphms4UZuHYzXImWCXwrmi3Y1Gk+65wN2C3376EZCZ67vTSLUv0WJcWiaGUgx0zMPodsha6wWXBcFT0FCJye9xGBGHxCHWZx5MB4psilxQdHKnBUXO+6s2EG6cwkF87Lppceb/6p00im2Q6p5HmZJqIuSO0HqcotX7jaGYhJH1jwz6CjCrZTIv62AXnU2rlHAJFgfd0B+N3y0C3PyeccbOR+DuRB+NPK+KbGJ5o8Uh6LnmC8cS9XihMtmLg3k9eiXuyR3yaK7GdBNrftK6MGQYUrptAphQ5lCyXFYZAIue9am2TBqnPJZYRO95DJSJmvmLjyapDhEOyKQXL6d6mBiNNyHFls6oTPptKZbBnSNEDBRRQe+XMevPqQrP4gBZLKuGchfa4NZnBAw9Y6XF/0w2toQpm86P83yO6UdoZnDeYWpf3IQnA9A0mp9nJdzfrYudGlVXE+wEN71ZQnwUK31hA+siGWmxu79lM0md7yjIjoCUZb3P7Cp2NmREKQjcHPqos9XaeszG2kJa1b+wZQfWrNHGGwCNdBHpOTk5nxzweyZwiOMUp0wwR7LYndeXH1eB6ZMYNDHFu/gRPmvg17A7Mf0F2KXIh9nuHVUXDRZnEBhI9aorrOAgMclGUJlc06apiD1088X7fadV0otq6hW/wiJl+0qiDkzgxre01HTDaE1tefoToaxmylYPUna2MizFuapwkI66t7UV4baMlQ/D0f/8uK+pFYKec
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6043.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(66574015)(8936002)(66446008)(64756008)(8676002)(53546011)(2906002)(5660300002)(86362001)(4326008)(66476007)(66556008)(122000001)(71200400001)(26005)(76116006)(186003)(478600001)(66946007)(55016003)(9686003)(38100700002)(83380400001)(54906003)(33656002)(110136005)(316002)(6506007)(7696005)(52536014)(41300700001)(38070700005)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmxVQktmU2lMWndMT0dYUkV0SHBoQUM3MnVHdXFEUEF4b2gwS2VkZE5jUlU3?=
 =?utf-8?B?YWRRUG5vNkZGYXVrLzJaSyswamlwMkRoS1o2MURxOGNmbFRoQUdkN3VVUFZn?=
 =?utf-8?B?dGUrNnhQU0xWOWs1OVVXOWhkY1l3eXF5WVV0RzFUS29raUpTU0ppVGorSVdO?=
 =?utf-8?B?MS92S3RQWFlQSXU3VmR0eXhuTjFhb3c4ekR0QTVBZERSL2U2UjNGV3FIajZr?=
 =?utf-8?B?cUVIVG5ueDRoMEVxOU1Iekc5bGRpcURTMnJnRy9IaFNQSURlNmR0VHA3emV2?=
 =?utf-8?B?UnZZcjljQjNQTVdHSUlKNk1MaWEyUFBLZ1hpWjdkV2JTUC9peURXSDU2VEYz?=
 =?utf-8?B?M1Bic2hnRWZJYklldVQvajRsejdVa2JhYnRHN3E5K0ZXdk40ZWdYVU9QZE5L?=
 =?utf-8?B?VVYvNnl1bUFEcnRnN1dTSFRnSnFVNVpIaFhzUnFDeDdwZWlRdjFiN3ZMYnB2?=
 =?utf-8?B?eStEWHFqdmFqUm9ub294bWo0YlhkeDNOczBNWXRrQjVTcU5oT0M5VnpPZmda?=
 =?utf-8?B?bWNjYVErdmNrQVRqRlVvSXJyRWZLQmdHbVBDU1UwM3phdTdPTTVLZVhhcU4w?=
 =?utf-8?B?RjczMjNsVE5XcmJ0RlNmbEZjdjdmRW92RytXT0Q0YUhTOUJ6SEFuTCtaRmVp?=
 =?utf-8?B?bG9pd3dGV1dvWlFBMkRwYVlWN3I2Qldnd0s1L293WHcwNzYzL1FDTnh1VVlh?=
 =?utf-8?B?azBzNE5tODlwRHlYd1NWNVd6L01MV1JTTFdRK1lzMjlaTFR3dTcyVkNRczgz?=
 =?utf-8?B?RTlrWFNScVZzNkhTZlkxaFNVMnRaNk1QOUZRa2xMTzg3UTcwK25lYUtvekYr?=
 =?utf-8?B?KzFLUW1rZG1EQVFxWjBCb0NIalcvWXVWTlFqM05ORElYWGNrU1g0cWVnRTVG?=
 =?utf-8?B?UFdWRDEwT09BRHBRS1A1MS9zcWJGQ0NCS0lJMnBudCtLSjRXbXcrNFQ3cVpF?=
 =?utf-8?B?YlZUcEM1VVJnZDFRSU50c05DTnJkZDJaMDlSR1VCb0EyeVNNYkFENWg1Smpx?=
 =?utf-8?B?TE9wbGxHVmluVHgrYXRRM0xaZ1BJQkZuWE1RenNSa0dEbWRCRU82Nndzbi9q?=
 =?utf-8?B?SGxOaDdNZlEzNkpaTUpiaGozeS9SbzNZYVdOZlkyY2hLc1dvSTFnTGU0TzBp?=
 =?utf-8?B?cGdIbllsWjM4Z1VlTTJSY0U2RGlwOHg4cGdTdHA1cSttQXFnUG9XK0JTSjZn?=
 =?utf-8?B?dW94eWlmR0JxZVArMzF6V1RkWGprQWpOVmk2VUJRTUY0T2ZNRG1reEtFZ1ll?=
 =?utf-8?B?T3ozdUJHeXFlSldVd092OTRCSVJ1VnY2V0lsamZodnpZWmZjUkQyN3Jpa25O?=
 =?utf-8?B?c2xYUVZQdGdoMnVVOFN2dVpMNXZqWk9OUXNZSERKQmZHcjhlWWZNdURldnlK?=
 =?utf-8?B?eWlUMUlNY2Y2YjZBYmZiUUxNRlBVSWVYR1U2ajJ4b1lhTG1wSzNLRUtQSXp3?=
 =?utf-8?B?ck1ha0lBOUwxeW5xVHZFd0NQRWRrNWtQRW12L1A3bDZXaTBZckpOZzBMUDNy?=
 =?utf-8?B?VHZlbzY1TEtrTTRtY1E3OUoyVmtoalhCWEZoc1gvUmcwb0pOVGxXc1Z4UHFx?=
 =?utf-8?B?MVdqTGg4dGZDaVhTeEx0VXhndndQNTBuNHRkTWRGcm1qZVJSMUZUaEtyWFNJ?=
 =?utf-8?B?TlRiSGZRVGNFS2lPc2FlbVI4bmRsRkVlZWN2em9MRDdkU3dESU5DZ09QYUdh?=
 =?utf-8?B?RTFYNVVBSUYyOFRMbnlIL3JkL0VCb3ovT2lTNzk5QXh0UWxwVXYyZ0pjUWYv?=
 =?utf-8?B?ZVlHVnhNUWVhenhIeFZPaXFaOXcrNWpLK1FTZXlaQmN1d3JFeU5MVW1nWWsw?=
 =?utf-8?B?TFV5cUNpMUVmUWdEQm9ZWndkZEsxeFU2UVVYSW16NE9uU3lYWEJxQmZyYXFp?=
 =?utf-8?B?OTNEVW10dE1MTEtDanBaYzVabVk2dDBtMGRnR1BtV3BvcS9jcVJjTGdVSUps?=
 =?utf-8?B?bW1qS2ZCUWsrUWgvRjIxQWIrbCtqakxBc2dhWWxlTHlnejVUR2wrQW9iMFB1?=
 =?utf-8?B?eUJvdFFXR2pTMmlHOTFmV0k5MlVqU0w1aGR5dWdTTXJaTmR0NGd3dDZkdkN6?=
 =?utf-8?B?VDA1V3Y5WEU3LytaSmNSU1lVQmljRHhwQnBkb1BaY3dOUitWSTY4MkVHMlJi?=
 =?utf-8?Q?QlBgreBLaPO0yFO3oLNsAZAvo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6043.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e737eb-711f-4928-5789-08da707c9ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 09:36:13.6852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8PU/LJdgElkIIk1Ej5C/wxkzz3MSWHUZ9s1rbrjVxHdAumTXeotF6jb0KM9JhfLK7lp36I2ki3q3eh3njibgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3723
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
Cc: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0
aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAyOCwgMjAyMiAxOjM4
IFBNDQo+IFRvOiBDLCBSYW1hbGluZ2FtIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPjsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkxNS90dG06IGRvbid0IGxlYWsgdGhl
IGNjcyBzdGF0ZQ0KPiANCj4gT24gMjgvMDcvMjAyMiAwMDoxNiwgQywgUmFtYWxpbmdhbSB3cm90
ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQXVsZCwgTWF0
dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBKdWx5
IDI3LCAyMDIyIDEwOjE0IFBNDQo+ID4+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBUaG9tYXMgSGVs
bHN0csO2bQ0KPiA+PiA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+OyBDLCBSYW1h
bGluZ2FtDQo+ID4+IDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFU
Q0hdIGRybS9pOTE1L3R0bTogZG9uJ3QgbGVhayB0aGUgY2NzIHN0YXRlDQo+ID4+DQo+ID4+IFRo
ZSBrZXJuZWwgb25seSBtYW5hZ2VzIHRoZSBjY3Mgc3RhdGUgd2l0aCBsbWVtLW9ubHkgb2JqZWN0
cywgaG93ZXZlcg0KPiA+PiB0aGUga2VybmVsIHNob3VsZCBzdGlsbCB0YWtlIGNhcmUgbm90IHRv
IGxlYWsgdGhlIENDUyBzdGF0ZSBmcm9tIHRoZSBwcmV2aW91cyB1c2VyLg0KPiA+Pg0KPiA+PiBG
aXhlczogNDg3NjBmZmU5MjNhICgiZHJtL2k5MTUvZ3Q6IENsZWFyIGNvbXByZXNzIG1ldGFkYXRh
IGZvcg0KPiA+PiBGbGF0LWNjcyBvYmplY3RzIikNCj4gPj4gU2lnbmVkLW9mZi1ieTogTWF0dGhl
dyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+PiBDYzogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiA+PiBDYzogUmFtYWxpbmdh
bSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysr
LQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9t
aWdyYXRlLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMN
Cj4gPj4gaW5kZXggYTY5YjI0NGYxNGQwLi45YTA4MTQ0MjJiYTQgMTAwNjQ0DQo+ID4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYw0KPiA+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMNCj4gPj4gQEAgLTcwOCw3ICs3MDgs
NyBAQCBpbnRlbF9jb250ZXh0X21pZ3JhdGVfY29weShzdHJ1Y3QgaW50ZWxfY29udGV4dCAqY2Us
DQo+ID4+ICAgCXU4IHNyY19hY2Nlc3MsIGRzdF9hY2Nlc3M7DQo+ID4+ICAgCXN0cnVjdCBpOTE1
X3JlcXVlc3QgKnJxOw0KPiA+PiAgIAlpbnQgc3JjX3N6LCBkc3Rfc3o7DQo+ID4+IC0JYm9vbCBj
Y3NfaXNfc3JjOw0KPiA+PiArCWJvb2wgY2NzX2lzX3NyYywgb3ZlcndyaXRlX2NjczsNCj4gPj4g
ICAJaW50IGVycjsNCj4gPj4NCj4gPj4gICAJR0VNX0JVR19PTihjZS0+dm0gIT0gY2UtPmVuZ2lu
ZS0+Z3QtPm1pZ3JhdGUuY29udGV4dC0+dm0pOw0KPiA+PiBAQCAtNzQ5LDYgKzc0OSw4IEBAIGlu
dGVsX2NvbnRleHRfbWlncmF0ZV9jb3B5KHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSwNCj4gPj4g
ICAJCQlnZXRfY2NzX3NnX3NndCgmaXRfY2NzLCBieXRlc190b19jcHkpOw0KPiA+PiAgIAl9DQo+
ID4+DQo+ID4+ICsJb3ZlcndyaXRlX2NjcyA9IEhBU19GTEFUX0NDUyhpOTE1KSAmJiAhY2NzX2J5
dGVzX3RvX2NweSAmJg0KPiA+PiArZHN0X2lzX2xtZW07DQo+ID4+ICsNCj4gPj4gICAJc3JjX29m
ZnNldCA9IDA7DQo+ID4+ICAgCWRzdF9vZmZzZXQgPSBDSFVOS19TWjsNCj4gPj4gICAJaWYgKEhB
U182NEtfUEFHRVMoY2UtPmVuZ2luZS0+aTkxNSkpIHsgQEAgLTg1Miw2ICs4NTQsMjUgQEANCj4g
Pj4gaW50ZWxfY29udGV4dF9taWdyYXRlX2NvcHkoc3RydWN0IGludGVsX2NvbnRleHQgKmNlLA0K
PiA+PiAgIAkJCWlmIChlcnIpDQo+ID4+ICAgCQkJCWdvdG8gb3V0X3JxOw0KPiA+PiAgIAkJCWNj
c19ieXRlc190b19jcHkgLT0gY2NzX3N6Ow0KPiA+PiArCQl9IGVsc2UgaWYgKG92ZXJ3cml0ZV9j
Y3MpIHsNCj4gPj4gKwkJCWVyciA9IHJxLT5lbmdpbmUtPmVtaXRfZmx1c2gocnEsIEVNSVRfSU5W
QUxJREFURSk7DQo+ID4+ICsJCQlpZiAoZXJyKQ0KPiA+PiArCQkJCWdvdG8gb3V0X3JxOw0KPiA+
PiArDQo+ID4+ICsJCQkvKg0KPiA+PiArCQkJICogV2hpbGUgd2UgY2FuJ3QgYWx3YXlzIHJlc3Rv
cmUvbWFuYWdlIHRoZSBDQ1Mgc3RhdGUsDQo+ID4+ICsJCQkgKiB3ZSBzdGlsbCBuZWVkIHRvIGVu
c3VyZSB3ZSBkb24ndCBsZWFrIHRoZSBDQ1Mgc3RhdGUNCj4gPj4gKwkJCSAqIGZyb20gdGhlIHBy
ZXZpb3VzIHVzZXIsIHNvIG1ha2Ugc3VyZSB3ZSBvdmVyd3JpdGUgaXQNCj4gPj4gKwkJCSAqIHdp
dGggc29tZXRoaW5nLg0KPiA+PiArCQkJICovDQo+ID4+ICsJCQllcnIgPSBlbWl0X2NvcHlfY2Nz
KHJxLCBkc3Rfb2Zmc2V0LCBJTkRJUkVDVF9BQ0NFU1MsDQo+ID4+ICsJCQkJCSAgICBkc3Rfb2Zm
c2V0LCBESVJFQ1RfQUNDRVNTLCBsZW4pOw0KPiA+PiArCQkJaWYgKGVycikNCj4gPj4gKwkJCQln
b3RvIG91dF9ycTsNCj4gPj4gKw0KPiA+PiArCQkJZXJyID0gcnEtPmVuZ2luZS0+ZW1pdF9mbHVz
aChycSwgRU1JVF9JTlZBTElEQVRFKTsNCj4gPj4gKwkJCWlmIChlcnIpDQo+ID4+ICsJCQkJZ290
byBvdXRfcnE7DQo+ID4gVGhlIGNoYW5nZSBpcyBsb29raW5nIGdvb2QgdG8gdGhlIHB1cnBvc2Uu
IEJ1dCBzaG91bGRuJ3QgdGhpcyBiZSB0aGUgcGFydCBvZiBsbWVtIGFsbG9jYXRpb24gaXRzZWxm
Pw0KPiANCj4gSG1tLCB3aGF0IGRvIHlvdSBtZWFuIGJ5IHRoZSBsbWVtIGFsbG9jYXRpb24gaXRz
ZWxmPyBUaGUgc2NlbmFyaW9zIEkgaGFkIGluIG1pbmQgaGVyZSB3ZXJlOg0KPiANCj4gLSB7IGxt
ZW0sIHNtZW0gfSBidWZmZXIsIG9iamVjdCBpcyBhbGxvY2F0ZWQgaW4gc21lbSAobGlrZSB3aXRo
IGluaXRpYWwNCj4gbW1hcCkgYW5kIHRoZW4gbW92ZWQgdG8gbG1lbSAoc21lbSAtPiBsbWVtKS4N
Cj4gDQo+IC0geyBsbWVtLCBzbWVtIH0gYnVmZmVyLCBvYmplY3QgaXMgYWxsb2NhdGVkIGluIGxt
ZW0sIGJ1dCB0aGVuIGV2aWN0ZWQgdG8gc21lbS4gT2JqZWN0IHRoZW4gbW92ZWQNCj4gYmFjayB0
byBsbWVtIChzbWVtIC0+IGxtZW0pLg0KPiANCj4gLSB7IGxtZW0sIHNtZW19IGJ1ZmZlciB3aXRo
IENQVV9BQ0NFU1MgZmxhZyBvbiBzbWFsbC1iYXIgc3lzdGVtLCBvYmplY3QgaXMgYWxsb2NhdGVk
IGluIG5vbi0NCj4gbWFwcGFibGUgbG1lbSwgYW5kIHRoZW0gbW92ZWQgdG8gdGhlIG1hcHBhYmxl
IHBhcnQgb2YgbG1lbSBvbiBmYXVsdCAobG1lbSAtPiBsbWVtKS4NCj4gDQo+IEluIGFsbCB0aGUg
YWJvdmUgY2FzZXMgdGhlIENDUyBzdGF0ZSBpcyBsZWZ0IHVuaW5pdGlhbGlzZWQsIEFGQUlDVC4N
Cg0KQXMgd2UgZGlzY3Vzc2VkIG9mZmxpbmUsIHRoaXMgd2lsbCBjbGVhciB0aGUgY2NzIHN0YXRl
KG9sZCkgb2YgdGhlIGRzdCBsbWVtIGluIGNhc2Ugb2YgbWlncmF0aW9uDQpmcm9tIHNtZW0gdG8g
bG1lbSBvZiBzbWVtK2xtZW0gb2JqLiB0aGlzIHNlZW1zIHRvIGJlIHJpZ2h0IHBsYWNlIHRvIGZp
eCB0aGUgaW5mbyBsZWFrIG9mDQpwcmV2aW91cyBjY3Mgc3RhdGUuDQoNClJldmlld2VkLWJ5OiBS
YW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+DQoNCj4gDQo+ID4NCj4gPiBSYW0u
DQo+ID4+ICAgCQl9DQo+ID4+DQo+ID4+ICAgCQkvKiBBcmJpdHJhdGlvbiBpcyByZS1lbmFibGVk
IGJldHdlZW4gcmVxdWVzdHMuICovDQo+ID4+IC0tDQo+ID4+IDIuMzcuMQ0KPiA+DQo=
