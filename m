Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C327B711905
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 23:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7529710E77D;
	Thu, 25 May 2023 21:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456A810E77B;
 Thu, 25 May 2023 21:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685049950; x=1716585950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9TStN/K58C62krme6DsfoLiz0BEu+IURP4/4yVcql5U=;
 b=V55TI3+LBhkQSSbjrGqxF67kf7U6E1NsQuoXmpvTegyf6Y35NjsdjIn0
 vbhwqI5eMt5TEZo7RNZfiwMOxk0drhAalphUfLCc3YFIOGwmMgsSHvlsp
 re+jJEDXc57EpBER4KkY/KxoDSKVJR2N4pSzbhsPha7BtNR73SGoK5Mgz
 SguC87MmvP2j1zcfuNGbyilcyfLmaUT+dzW31Wlv8mg9rECxPFVRG+OLi
 i2SACFc/rn/VBtm7AgkHMKCDE1xRUZXgnwrJhI5qo5zA9HjRWEZ83kA3A
 w6ifK1Z6eFPAX42p+rFqKc0BLv+eBi+GeBZza0ZMfR6Q2WefGlJkWyAhw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343524441"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="343524441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774823346"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="774823346"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 25 May 2023 14:25:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 14:25:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 14:25:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 14:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6dkCcrcy7oydPRkURuQNhe2A7o6ddyOAN6DusnHVAM51jPe8f6opGUkxobwgeZj5Qe6sMeuN9UkPkywz+GZ1BwtKrnPn++7gQK/Nyvy2QOWFg/AMDU+LiaB/SGv2fpP08qdwEwsbhC9TS9w7GmONK1alo/6TI5xMd8gXhMfqb6kKbVADbS/yohDRNDvmBYD2Ipizb7jJjl1A5inQdy48EAI+9i4Pe186z7aVvIbNBIoh9A29vZG6zQ9MOH3HG+FE71oAMCjQvKYFa8ELnRrPrKJNLjT7T+O/2Ja1/afJta2YpesqLqCwtvB0bn6Gn+75d87DU6hVrGI12LjvPGQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TStN/K58C62krme6DsfoLiz0BEu+IURP4/4yVcql5U=;
 b=BcbNQAXedRMf444KVQ+hRNnVbhz/dqj1FkVhHVhWXvtnTvzZQv33yL0pceVk4743d1VsHAk9YSP0t3V1VbVub1ZsAemFqOMG6yZdB3pmyHDmIIzQeel9Drx+gLnOqsijCNHTdb86Of8fWD6iI0nc4u3ScbyUVDGfUhJTuAHAHQJt6FM9cj7DDiNhdFfEI8zKQXbZKWA1ESVkDkQPm/tOSgJdzu5gEh4mMQCRLgoo31D1AoSzqSdZE90ql5dr+aDoxOlCI8sDl59gO/kE159xrp3cCeFBVjP91s8gvfKdiXJzE9TUQ5RVaPol5RgcY2k+ITBv/uhtZmXgVjmnpfY28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.17; Thu, 25 May 2023 21:25:46 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284%5]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 21:25:46 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 6/7] drm/i915: No 10bit gamma on desktop
 gen3 parts
Thread-Topic: [Intel-gfx] [PATCH v2 6/7] drm/i915: No 10bit gamma on desktop
 gen3 parts
Thread-Index: AQHZbigPgpd7J3ISsEKHpPESb5nO1q9rwlaA
Date: Thu, 25 May 2023 21:25:46 +0000
Message-ID: <DM4PR11MB636079BEDB4092FAC1E8D776F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20230413164916.4221-7-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM6PR11MB4514:EE_
x-ms-office365-filtering-correlation-id: bfa3716c-5d6b-423f-6b46-08db5d669a86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SsX0ZLbjKzNBycTceLkikITaz1OWX1Q13Nhs64bF3B3E7Z+v7EARBSCURQrO5eGitJpvkfOHPm8q/KM9EZ+3x6on1AO5jinxpTZejcyKSOjbparRkLgpLqSKmS7ITBsRKpNCeVgFmYHw7BeOzHFeZDCBKVG0p0GTNaYXONmsX4bC5gJh3HD6Rc0AO+DqYVw8ZR8mJGHX3Vc9jm6cQHrSCnkSR4ho8dL+YFbCxyFfqhHU1/HrBeKBtjHpPmr0qNIHKNTTtAmCQBoxRcPCk51op9Ybs4D+Qu+F0ONpEZLI4v6mchQ806/MX2JO6/CPY8+cUVl6+BSslo7NVdDWOq/We3mDCF/M5x1dFElGfkcc6YHwzJ5Zam8xDC6JfelSyr2IqZnWG4H5zwKj4j6RIyzhjhYDHDhlpquDrvbWz1LSipQulgd+gefJluHOHuxAr17JgRJ9NDPHZHt6Kf1axurMftvzJyeTYjk4oTD1un3tpN2mVMJIM/jHHD/owQYPOkUtvvXYkpyq0JYDyLJB5IaDUSRxe8co1yh8Nm1+Zqx1OMTuDmCnp9bnhx+O7isY6IveN19qCHtCSbXe9MKo7pTUPW/J6cLTO8uf3xP+Izax5bQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(5660300002)(52536014)(478600001)(110136005)(41300700001)(8676002)(7696005)(6506007)(66556008)(66946007)(64756008)(66476007)(4326008)(66446008)(53546011)(316002)(71200400001)(9686003)(26005)(76116006)(8936002)(186003)(83380400001)(2906002)(66574015)(82960400001)(122000001)(38100700002)(55016003)(38070700005)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHBMcmJIdFN5Nk9RUHRzdy9ScFB6RVV4SmxsZnZlVjdaaTNzVHdERWhJcVg3?=
 =?utf-8?B?NlJGcDk5MkRlNldrdThMMDQ2MFFyWnpEejlQNU5vZVhYY1pUdHhmSE5tWHRG?=
 =?utf-8?B?L0dqVXR2MHpLMUNsa3lrZktld2d1VGVJUjVFU1pqMmRyK05VRU4xT0lLeUEy?=
 =?utf-8?B?am5KcnI5VUhnVUszRTBIanJ3cGhNNlFwSGh6NU5SdnBrUlRjL21QWUhZbUNo?=
 =?utf-8?B?a3BLOVB1RzI4eWx6d0JWL1VZOVhSVnkzTUlnUFBJMnh2U0lKbDlKSFlaSURP?=
 =?utf-8?B?MHpQaU9WYXp6YTdXR1hOcE1DeHFVTE9kdVR6TXpCcEFvRkZuZDA4R2tvbjVM?=
 =?utf-8?B?cDM4OXlHb3R1TFFYZ1JqRXRBUVprcXEzUU01VFFaMTZVVjd4RU5KQU5iQWN0?=
 =?utf-8?B?b0dHSnZ0QWZPSVhWMDA4Z0UyMDdKRXFXM2phcWR1bVc0bUZ0ck94aDZtWnow?=
 =?utf-8?B?MVRhTkhUNmlsbEswTXdqenA3SDQ4UVFMVWNzRmxaVHVkcDM0blZucC9ibmRJ?=
 =?utf-8?B?NFU4cCtlTStHTVEzbmZ6K2pFT250djhNQ3FwQXg4cytsWmd4U2R0RDQyOG56?=
 =?utf-8?B?aXJsTHNqOFE1dHRLQ2hkN0tjV3VmRENBZ2tNYjg1eit4ZWVvVkt6aERvSURK?=
 =?utf-8?B?Y1plWkp1djMyWkJKdGN0UUNNckRDdkN1WkRVNVAwSy96UDFERVh6TGk3Smts?=
 =?utf-8?B?Y2JLZlI1ZzIrSkU5S2hZZkdJMnQwbHlubnJHcVVLc2xwNVNxWXpORHJIU3F6?=
 =?utf-8?B?d2c1bnpVanBQeCtRY1p5MnYvcEQrV2JJY2dibE51a28reDJYRDNkellGYzZN?=
 =?utf-8?B?Mk9NNTY3cVRQbzdheXZkbDJ4OG52M2krVmVWZHNuQ1RRcHRkS2lKQ3F6S1NZ?=
 =?utf-8?B?TUVaOXh4YWdKaklGV3d5blpNQWc4bzJjb3dOQVc5UEcwZmsyYUJ1MTBwNjlk?=
 =?utf-8?B?MGZMOEFub1ZjMENDM0hUSGNHOGlSaHprdGUwVHB0ZWtpUTNEM25MUXJFWkJi?=
 =?utf-8?B?ZXp2TFoxMVl1U3RmUCtXOUR6OWxHZGl6U093dXprNWFRcUI1SHdXMjFrQnlj?=
 =?utf-8?B?WDg1UDVMdXV6a2xiMm1ZMzFGWlpYMlBtZE8vQStTR2pwcFk0cE1oMTZpUWhL?=
 =?utf-8?B?TzRrVnIxdHJPeWFRU3A3T3RZZjNRUVhTVllzcGZDOW5laVFCSnBhbllWbDZI?=
 =?utf-8?B?SGtwMFRJdzQxZDZXbEtJV09iSEZ0UHlsMDY4RnhwRUlHcitxMmpFUjNXcUt6?=
 =?utf-8?B?Q2JHUjNxdkF1MytJOVgvQ3dkQ1VmRUphc3hqcjFtWlo3REJ6amZqR0JBSjVS?=
 =?utf-8?B?aytGVXQ3Si8vUitzTnowQ2RJellZMDk0NmhPT1lFZ1lrZ29kMEtwV1h0TmtX?=
 =?utf-8?B?d0tzRk4xUDdPV1FoQlIxZkNXdTJ6QTlGRWR3RmhXS2tqeWszU2JnNW5paU9C?=
 =?utf-8?B?MFp4RXlvSkQ4KzhGZ1prYXVQTlJPakZPOW1iZ0E4V203MzBLanF3TzhWaklE?=
 =?utf-8?B?RTdiZnQrWjdRcXFFcjJia3RXV0s0MmlOM0JMeDFpNFU5ZWoyRWFXY1NZSVYy?=
 =?utf-8?B?SWJ3c2UyZkN0ZEIzTTN6VTNjZ21CMEJGQm45TmY0eFlBbHNkQndRVVlxd3Vv?=
 =?utf-8?B?WUQ2Q0tDdS9US2hnRHZ2UHR5ekc1ejZhWGhZZFBqL2dqZUxHaFBlVmM1VFNP?=
 =?utf-8?B?TEpnQ2ZiR3YwSlpJOXJ3cWF4TlNBUFpHdWJjQUtJU2hNcC9tT3o1TS9iRmpW?=
 =?utf-8?B?TmEvbXUvckNmMFlhL0oxSTIrUEZSOG1uWHJSaXpZTEFsNjIxRnZqQ1M5NkE4?=
 =?utf-8?B?UlR3aGp3OElNMEFhWEFHUEg0WG45MkRLRURSQkllRlBEMC83dVlobW1UUWZt?=
 =?utf-8?B?QUF0cUFQZ0lXWmxrUFVuTUN5NFhaVVZtQXVJTTBWbVJsZHVRNnc2SExnbmkx?=
 =?utf-8?B?VFFQNXBKRHU1NHFmSlV3L3dvZFgzQm5YaCtMWDV4S09wTjFET25JU2pIbmta?=
 =?utf-8?B?eVM5YnI0YW1TeEJ2eHNlRVVESjg4WGc4TDdoMmVDWmc5VUVlK2UyWFNzcWNU?=
 =?utf-8?B?RWxoaTcraWNBdnJ2OE5PMDFrMGdvSU1NK1RPUGZkSUdmM0Zocm1TVElhNXJ5?=
 =?utf-8?Q?EpvLoC4HSaDdQFHISxVorzh6s?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa3716c-5d6b-423f-6b46-08db5d669a86
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 21:25:46.3443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: je2wh5z5rAqJLPmOXuR2lgGF2u/twlumGdg3N78Vsn8l80asHiuEi6eDZikUwjerNFbH4zrijZuAUksd+4CeOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZSBT
eXJqYWxhDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMywgMjAyMyAxMDoxOSBQTQ0KPiBUbzog
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjIgNi83XSBkcm0v
aTkxNTogTm8gMTBiaXQgZ2FtbWEgb24gZGVza3RvcCBnZW4zIHBhcnRzDQo+IA0KPiBGcm9tOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiANCj4gQXBw
YXJlbnRseSBkZXNrdG9wIGdlbjMgcGFydHMgZG9uJ3Qgc3VwcG9ydCB0aGUgMTBiaXQgZ2FtbWEg
bW9kZSBhdCBhbGwuIFN0b3ANCj4gY2xhaW1pbmcgb3RoZXJ3aXNlLg0KPiANCj4gQXMgaXMgdGhl
IGNhc2Ugd2l0aCBwaXBlIEEgb24gZ2VuMyBtb2JpbGUgcGFydHMsIHRoZSBQSVBFQ09ORiBnYW1t
YSBtb2RlIGJpdCBjYW4NCj4gYmUgc2V0IGJ1dCBpdCBoYXMgbm8gZWZmZWN0IG9uIHRoZSBvdXRw
dXQuDQo+IA0KPiBQTlYgc2VlbXMgdG8gYmUgdGhlIG9ubHkgc2xpZ2h0IGV4Y2VwdGlvbiwgYnV0
IGdlbmVyYWxseSB0aGUgZGVza3RvcCBQTlYgdmFyaWFudA0KPiBsb29rcyBtb3JlIGxpa2UgYSBt
b2JpbGUgcGFydCBzbyB0aGlzIGlzIG5vdCBlbnRpcmVseSBzdXJwcmlzaW5nLg0KDQpDb3VsZG4n
dCBjaGVjayB0aGUgcmVsZXZhbnQgc3BlYyB0byByZS1jb25maXJtLCB0cnVzdGluZyB5b3VyIGp1
ZGdtZW50IGhlcmUuDQpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVs
LmNvbT4NCg0KPiBGaXhlczogNjc2MzBiYWNhZTIzICgiZHJtL2k5MTU6IEFkZCAxMGJpdCBnYW1t
YSBtb2RlIGZvciBnZW4yLzMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfcGNpLmMgfCA4ICsrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGNpLmMgaW5kZXgN
Cj4gY2RkYjZlMTk3OTcyLi4zMDVjMDVjM2Y5M2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcGNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9w
Y2kuYw0KPiBAQCAtMjUwLDEzICsyNTAsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9k
ZXZpY2VfaW5mbyBpODY1Z19pbmZvID0gew0KPiAgCS5kbWFfbWFza19zaXplID0gMzIsIFwNCj4g
IAlJOVhYX1BJUEVfT0ZGU0VUUywgXA0KPiAgCUk5WFhfQ1VSU09SX09GRlNFVFMsIFwNCj4gLQlJ
OVhYX0NPTE9SUywgXA0KPiAgCUdFTl9ERUZBVUxUX1BBR0VfU0laRVMsIFwNCj4gIAlHRU5fREVG
QVVMVF9SRUdJT05TDQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5m
byBpOTE1Z19pbmZvID0gew0KPiAgCUdFTjNfRkVBVFVSRVMsDQo+ICAJUExBVEZPUk0oSU5URUxf
STkxNUcpLA0KPiArCUk4NDVfQ09MT1JTLA0KPiAgCS5oYXNfY29oZXJlbnRfZ2d0dCA9IGZhbHNl
LA0KPiAgCS5kaXNwbGF5LmN1cnNvcl9uZWVkc19waHlzaWNhbCA9IDEsDQo+ICAJLmRpc3BsYXku
aGFzX292ZXJsYXkgPSAxLA0KPiBAQCAtMjY4LDYgKzI2OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaW50ZWxfZGV2aWNlX2luZm8gaTkxNWdfaW5mbyA9IHsgIHN0YXRpYw0KPiBjb25zdCBzdHJ1
Y3QgaW50ZWxfZGV2aWNlX2luZm8gaTkxNWdtX2luZm8gPSB7DQo+ICAJR0VOM19GRUFUVVJFUywN
Cj4gIAlQTEFURk9STShJTlRFTF9JOTE1R00pLA0KPiArCUk5WFhfQ09MT1JTLA0KPiAgCS5pc19t
b2JpbGUgPSAxLA0KPiAgCS5kaXNwbGF5LmN1cnNvcl9uZWVkc19waHlzaWNhbCA9IDEsDQo+ICAJ
LmRpc3BsYXkuaGFzX292ZXJsYXkgPSAxLA0KPiBAQCAtMjgxLDYgKzI4Miw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaTkxNWdtX2luZm8gPSB7ICBzdGF0aWMNCj4g
Y29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvIGk5NDVnX2luZm8gPSB7DQo+ICAJR0VOM19G
RUFUVVJFUywNCj4gIAlQTEFURk9STShJTlRFTF9JOTQ1RyksDQo+ICsJSTg0NV9DT0xPUlMsDQo+
ICAJLmRpc3BsYXkuaGFzX2hvdHBsdWcgPSAxLA0KPiAgCS5kaXNwbGF5LmN1cnNvcl9uZWVkc19w
aHlzaWNhbCA9IDEsDQo+ICAJLmRpc3BsYXkuaGFzX292ZXJsYXkgPSAxLA0KPiBAQCAtMjkyLDYg
KzI5NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaTk0NWdfaW5m
byA9IHsgIHN0YXRpYw0KPiBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaTk0NWdtX2lu
Zm8gPSB7DQo+ICAJR0VOM19GRUFUVVJFUywNCj4gIAlQTEFURk9STShJTlRFTF9JOTQ1R00pLA0K
PiArCUk5WFhfQ09MT1JTLA0KPiAgCS5pc19tb2JpbGUgPSAxLA0KPiAgCS5kaXNwbGF5Lmhhc19o
b3RwbHVnID0gMSwNCj4gIAkuZGlzcGxheS5jdXJzb3JfbmVlZHNfcGh5c2ljYWwgPSAxLA0KPiBA
QCAtMzA2LDYgKzMwOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8g
aTk0NWdtX2luZm8gPSB7ICBzdGF0aWMNCj4gY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZv
IGczM19pbmZvID0gew0KPiAgCUdFTjNfRkVBVFVSRVMsDQo+ICAJUExBVEZPUk0oSU5URUxfRzMz
KSwNCj4gKwlJODQ1X0NPTE9SUywNCj4gIAkuZGlzcGxheS5oYXNfaG90cGx1ZyA9IDEsDQo+ICAJ
LmRpc3BsYXkuaGFzX292ZXJsYXkgPSAxLA0KPiAgCS5kbWFfbWFza19zaXplID0gMzYsDQo+IEBA
IC0zMTQsNiArMzE4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyBn
MzNfaW5mbyA9IHsgIHN0YXRpYw0KPiBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gcG52
X2dfaW5mbyA9IHsNCj4gIAlHRU4zX0ZFQVRVUkVTLA0KPiAgCVBMQVRGT1JNKElOVEVMX1BJTkVW
SUVXKSwNCj4gKwlJOVhYX0NPTE9SUywNCj4gIAkuZGlzcGxheS5oYXNfaG90cGx1ZyA9IDEsDQo+
ICAJLmRpc3BsYXkuaGFzX292ZXJsYXkgPSAxLA0KPiAgCS5kbWFfbWFza19zaXplID0gMzYsDQo+
IEBAIC0zMjIsNiArMzI3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5m
byBwbnZfZ19pbmZvID0geyAgc3RhdGljDQo+IGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5m
byBwbnZfbV9pbmZvID0gew0KPiAgCUdFTjNfRkVBVFVSRVMsDQo+ICAJUExBVEZPUk0oSU5URUxf
UElORVZJRVcpLA0KPiArCUk5WFhfQ09MT1JTLA0KPiAgCS5pc19tb2JpbGUgPSAxLA0KPiAgCS5k
aXNwbGF5Lmhhc19ob3RwbHVnID0gMSwNCj4gIAkuZGlzcGxheS5oYXNfb3ZlcmxheSA9IDEsDQo+
IC0tDQo+IDIuMzkuMg0KDQo=
