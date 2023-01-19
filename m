Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F242674494
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 22:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B410E25F;
	Thu, 19 Jan 2023 21:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F7D10E25F;
 Thu, 19 Jan 2023 21:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674164073; x=1705700073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fSZ/YQx8pjEH8GCCp/4Q/g8RJFej/0n8TEhkXEsmWQM=;
 b=bbb5Yo1X+S6C4Sa3UmHP0iwr4DfJrEw2xL1ry1bytLNKIsioKFphBjWj
 OGT17RrrIg7Vk+EF6whbKqcSk+1O76+qBUj4pjJAuoHVLhIZoTzD2gGSA
 +DHdO/GN7GzCHTr4q5Cucnq81bKNGKnHGiYFGTSubpwY2ygPA+BIG0yrJ
 R1rBCy8XITAJfeQPMKoX1XztNQ/Jior53ikPvcUVcp73tTjJHKW1o4YF4
 L5GFg6lurBptdi1CyPgbG9qddho/Xk0BfwjVjCIbgacXK5Om8lYOkab1E
 UtA8vfOAIynNicoI6/kNuabMYc3QsXQGXb5r3Jiiy4g3HNd7RVN5cuvWG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305799200"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="305799200"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 13:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690788457"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="690788457"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 13:34:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 13:34:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 13:34:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 13:34:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbzY9Rs09p6U+0+xzthP1YzI/u46496SAvW3mS8G3B78lze8TIAf8Lo64teSZZa4vpYMjA7InqTsjjMFJb9QF9z8lJjcDiUZAD8TZYloJtOGlwy0bsl/xT+4YW5cQKrXWa2IzjBHon0+A1f/HTox+ZE6b+uNt+Mehvj3Dw9yFxKoHj3nvri4yC7RKs/OuAkyYzjrjwOjwcHBrlc4BicAoaGCEZghDJoexSRzhP65wof+XBKnTZNjpPDSrC9YJoUJjDxaa1qbYGIoUgbscbD+nyvYxpLaVHZhLEZkrpf5coz+RdoMZf9qmvxvidMJEIOvE3cG8cjU6zHmFOiLuntn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSZ/YQx8pjEH8GCCp/4Q/g8RJFej/0n8TEhkXEsmWQM=;
 b=M60Xnxz/YPzyJa5ls4GJmNTBeqGjaVtWKWVcHALs1lb53PvxAM2amx+vtOGZHPV6Pk0/vAQhfePRnq5VL2Lq/IFrLxqxcRAiZU/P8cvVI9kevqwGVwit9ZKktS3AFOAXlCBu0/udXtmWsgO9679Ed//qokrxQNLk1ZHCk9fR2Kmon/SWb5WYW/Xy4IRg6MlDb6zgAqIeoxEcG28ARiD/OVGPbtNYdwDktigqp+OA3aY/hie3q3Na8PXAOB5YIADbMRACSqRg9u/JT0YGkhOMmSqodxR8bgpI8Tx23zG/dJYCFV2k3TzcFMGsltKvxVi49kNKVTP1EFuKvkcrmTweTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 21:34:28 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 21:34:27 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Topic: [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Index: AQHZLD82JYaug2aXxkqEzlhuyeoWTK6mKCqAgAAa8YA=
Date: Thu, 19 Jan 2023 21:34:27 +0000
Message-ID: <b0b6316701a2fa9fd47ea63a98eaeaa1e024a43f.camel@intel.com>
References: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
 <Y8mgx1uank7lzPDL@intel.com>
In-Reply-To: <Y8mgx1uank7lzPDL@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB7548:EE_
x-ms-office365-filtering-correlation-id: a7d601bd-31e7-481d-e312-08dafa64f152
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hCzCBu9k7YIMEHx44KmYpaj1qeZUN16ySZbn7oXCY+qKvHkuM5sa2+neTfaATJHH7K6y1uMbK4AHFCm2uR3hbZmCStV91XxVARvo5z7i4wL2ZpgCBH2CcEoGiwHXHc3es7tKr0fDK9iO3rtm/4dh09jHjOIS+CGj3+8GsrwPeDPfTpfMVXetiIc676NXfvHQIqBuEAW/ox6d3fpAUqFQQ/XG8ETczf3WxGgeyM1L5HVc7LDWtWZxP/mFf+VAmKM5u5UgpZLR1sNF1GTp5CuK7px3Df23HDJKmNQOtFhOB9ZCrb4aDn5KTiky9dvcGwz2dMXOfxtYs4ZQIY2xGhiyggUJLoRXEtb9QUPBUL9Eqes207kIBGVSCry3PKiwOTiRb3jCVMAwa0M3BMAhoZjSjulj95a8U08AzZWaUisVqh5ivjmBwh6DlMu8Cn0WGeemYTRkGCq3At+NlvwfKPM/UrrivF46RuKnhYYnRfHiHKu6Bd6XQAAvEyaGN6LxUwpTAHUS/9zGkkxu3BLNEU+7iHkPWhZPpeSKb1faD5G1/y4sILvmXr0FENbViBiZJV/hQxjAs5QaGFcV3t2fhSCtvtlAe7hqWpvlM6/EUhTcFQZwdlW5OtZn0smMl/lzlfEBE45ktvLXsTll/Bh7Jf7bGjyAbbmijxOGXBAXy3CbE+Gu1WkK2dNtwLPSxu5dGT7LOvFZxcbmHsE5JKdTNPGCtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(107886003)(6512007)(478600001)(38100700002)(26005)(82960400001)(186003)(71200400001)(6506007)(86362001)(6486002)(122000001)(38070700005)(41300700001)(2906002)(6862004)(8936002)(2616005)(54906003)(6636002)(316002)(37006003)(5660300002)(8676002)(66556008)(66446008)(4326008)(66476007)(64756008)(66946007)(76116006)(83380400001)(91956017)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajJOMTJNWW9vN3ZiTkR2cEx0U3VmaEJNNDNKTEs0ZkRFN2ZpZ3paMnNuc3Rz?=
 =?utf-8?B?SlBGcjIzTDIwK05TVUlDUmNlZVpHM0U4cjd2VDZYemMrVlJ4S3YraVRGNllV?=
 =?utf-8?B?YTBWT1dKaWdiREkwM05ralNMNm1qYzh6VHppSWVQTzgydnhrRVVUcVREd0JX?=
 =?utf-8?B?Y3ZwcXhjMFdTR1hkRjhVOHpCOUdqVzU0SnJyc2ZKNXlNZWFGTGt0T0VEbnRZ?=
 =?utf-8?B?NVpDVitrOFl1VjhLV0F0V2ROaDAyd0Z4SHg5SWg2RUEvaU50T3pJQkMzUTFi?=
 =?utf-8?B?a3U3TGFKYUJEQm9sTXZwMHpmZ1RsbEZubGF3V0JXS0t2QlZHbXAwMCtQMjJK?=
 =?utf-8?B?ODYyaFZ5N3VyU3BjMVFaUmtpeHJjK3FuKzk5c1NrV3N6UUlKSit4M2hYNkV5?=
 =?utf-8?B?b1B6Tjl4WTJKaGJIWTdFcGE3K2hySjk1RlcvWVVnZTdVMTZlMFJRY2JSbE1w?=
 =?utf-8?B?YU9ERVk5NmVheVQvSWpKOGZ2ZHJJNFNuMk9PTktBc0RFWXN1bFZIUGZaWGJx?=
 =?utf-8?B?bkdXOGEvSGpiM00zODY5TDIrN0xLMlJ6bUxodWJrUFVpazFWYTYzQ1hkaHhl?=
 =?utf-8?B?c2NUVkNRV2dVL0hueTNmTWJRVFoyR054RTJadjRIUVlhZzdzbytJS1JZb044?=
 =?utf-8?B?Y3VZV0xxSlYrUFhNVmVESEFVQmV1Q3pNTkJtRE1pdW5aMmkwL3ZIbDkrVklx?=
 =?utf-8?B?bHpNSjZoUERCS1cxQzg2bjRwUVVKY0VlcE5QdFp5TW9WRlFVeWRseHFyaVd4?=
 =?utf-8?B?U1RCZHR3d0ljTlpHOWMxVXJIQ3dhZU90Z0QzU0JKTW1weEUvM0tuZ3htbEt6?=
 =?utf-8?B?czhuYitLbnB5L2NhVElvY1J6WWlTUUhNVmlOQWNJVXlCZEUyalR5TlBQQzdV?=
 =?utf-8?B?VWVPNWhid0VuT3JoZ0wrYW1OejZjU0RBVkNpYy9ieHowZkN5Y0N5dGwwSWNv?=
 =?utf-8?B?dmpLREVZVU9hWFdZYTMvV3hoVVA4R3Z5Zk5mMjdBT2tmRDk1a1I3Skl3akdQ?=
 =?utf-8?B?eUtYbHU2a296TE43Zm5heU1veE5Hd0R4dWxUSXRyWDU2cUZRV2ltSFZLeGVj?=
 =?utf-8?B?d0NCamdKL2MrRlFJOE9ETFVXMmxFWTNzbjNBMXZpVUFzTkc1ZXZ3bHMwL3Jp?=
 =?utf-8?B?d2VhTGR4dVdOMVFNQ0pnOVYraWh3UXoxMWFVUk5HUXhsczIyU1UrWWFqQVpX?=
 =?utf-8?B?VWFVbjBRUkQzUFBjckpNU09sQzJ5cThpOXVON1dKbVZxSmlCcFVEREhWWjZ6?=
 =?utf-8?B?UTRyVnduN3FvRkVPc1ZHZjE1MFMycDYyMkNJVGp4NjVGTVExMjFuRklNdW43?=
 =?utf-8?B?S0ZrcEd6SDV6blBaeHN4Y25NZnJwdGUwcnQ2RnZING9DTW9yenBXbTM5TUtP?=
 =?utf-8?B?bS9mUURkc3I2NkxJVGhlbXNJdVY5RkJ2aFl5T0JOSHRRWXJyNHpFcmwxTjFJ?=
 =?utf-8?B?NENrMFBhYlZmaXRKM2JxbEVwZ3dIcTRJREIxNE9zOFowdnBxRkEzNGJRRHdu?=
 =?utf-8?B?K1ZWZUd3QXY2WGdUNGIvSlZxMUc0dk1SYlM4VnZHQS8zd21zaHFyTXZDQzZT?=
 =?utf-8?B?VGRDVUlJREFEU0ZpVVQ0ZldBNlpDRVE4TXpYSWZxQm5RbkZyWWFtMEFjNFBQ?=
 =?utf-8?B?VEtLaDc0TEFBY0ZrVFRLdzFhWjZLMnJYakZEUTVPNFFVVGpjd2c2TkJ4NlVM?=
 =?utf-8?B?VjNUS05qK1QvSGpCTHpqTC8ydzF4NnJoVk96TGQ0R2U0czJ4emRad3lsc05N?=
 =?utf-8?B?SjQzUVIweGpQQ0JHbElQbHJBUkgxVklmK3R3blF3ZlBXcmNGLzhQU0dvNDVR?=
 =?utf-8?B?SllodzdKUUlFYW1HK3JUZUZsdlBDYUFXMFNxM0d5TlFtUmtMMVIwcTF0WUt5?=
 =?utf-8?B?MlQvT0FkVnhQRkRvNnlpRnNKa2RZVVpPM0hVWTZvdms1VUZPcGdjYUVOK2ZB?=
 =?utf-8?B?b1VEQzlxay9vNTFZczlseG1BYjZEZXBsNFFMRDlCb3ArMU5aOEJEQTcxQmha?=
 =?utf-8?B?SCtzU3NGU2lEejJhZ05CdG5GQ0JESmNHR256anVxaXBoS0ZrZDZ1dGI5VVFF?=
 =?utf-8?B?dG54UTIzMnRjMUxLZGpVZTByKzFiK3owaGdNTFZia0R0ZWEvL1BEZTdxWnU0?=
 =?utf-8?B?aVFORE1BN1JENHM5eTI1THdWZkR0cHpTdXJMdzlHaE5CSE9KdW9wUnJZQmxw?=
 =?utf-8?Q?e40aMIEhe6S458HbMhNTILmo2EHEjUfaHy4IO+V1WBmk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ECAC8120309904B9DC3BFEBA6D83BC8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d601bd-31e7-481d-e312-08dafa64f152
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 21:34:27.8292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+ahkEoFZDCbUtX1u8krilwGYRmihr7hUcAtgUJrNQzjSYgoAC9oWqOTkhqbT5termmPCNc2Pw2VfHFC61fZdlYj2QButToNGwBsOg5fJrxa8AY6fk3hlhA3M9Afkj1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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
Cc: "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yd2FyZGVkIG9mZmxpbmUuIExldCdzIGhvbGQgb2ZmIFItQiBvciBtZXJnaW5nIHVudGlsIEkg
dmVyaWZ5IHRoYXQgaHcgc3BlYyB1cGRhdGUgaXMgZmluYWxpemVkIHRvIGJlIGV4YWN0bHkgYXMg
d2hhdCB0aGlzIHBhdGNoIGlzIChwcm9iYWJseSBhIG1pbm9yIGRlbGF5KS4KCk9uIFRodSwgMjAy
My0wMS0xOSBhdCAxNDo1NyAtMDUwMCwgVml2aSwgUm9kcmlnbyB3cm90ZToKPiBPbiBUaHUsIEph
biAxOSwgMjAyMyBhdCAxMTo0OTo1NUFNIC0wODAwLCBBbGFuIFByZXZpbiB3cm90ZToKPiA+IFRo
ZSBEcml2ZXItRkxSIGZsb3cgbWF5IGluYWR2ZXJ0ZW50bHkgZXhpdCBlYXJseSBiZWZvcmUgdGhl
IGZ1bGwKPiA+IGNvbXBsZXRpb24gb2YgdGhlIHJlLWluaXQgb2YgdGhlIGludGVybmFsIEhXIHN0
YXRlIGlmIHdlIG9ubHkgcG9sbAo+ID4gR1VfREVCVUcgQml0MzEgKHBvbGxpbmcgZm9yIGl0IHRv
IHRvZ2dsZSBmcm9tIDAgLT4gMSkuIEluc3RlYWQKPiA+IHdlIG5lZWQgYSB0d28tc3RlcCBjb21w
bGV0aW9uIHdhaXQtZm9yLWNvbXBsZXRpb24gZmxvdyB0aGF0IGFsc28KPiA+IGludm9sdmVzIEdV
X0NOVEwuIFNlZSB0aGUgcGF0Y2ggYW5kIG5ldyBjb2RlIGNvbW1lbnRzIGZvciBkZXRhaWwuCj4g
PiBUaGlzIGlzIG5ldyBkaXJlY3Rpb24gZnJvbSBIVyBhcmNoaXRlY3R1cmUgZm9sa3MuCj4gCj4g
RG8gd2UgaGF2ZSB0aGlzIGRvY3VtZW50ZWQgYW55d2hlcmU/Cj4gCj4gYnV0IHRoZSBwYXRjaCBs
b29rcyBnb29kIHRvIG1lLi4uCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsYW4gUHJldmlu
IDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPgo+ID4gRml4ZXM6IDVhNDRmY2Q3
MzQ5OCAoImRybS9pOTE1L2dzYzogRG8gYSBkcml2ZXItRkxSIG9uIHVubG9hZCBpZiBHU0Mgd2Fz
IGxvYWRlZCIpCj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfdW5jb3Jl
LmMgfCA3ICsrKysrKysKPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfdW5jb3JlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF91bmNvcmUuYwo+ID4gaW5kZXggOGRlZTllNjJhNzNl
Li45NTk4NjllMmZmMDUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRl
bF91bmNvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfdW5jb3JlLmMK
PiA+IEBAIC0yNzQ4LDYgKzI3NDgsMTIgQEAgc3RhdGljIHZvaWQgZHJpdmVyX2luaXRpYXRlZF9m
bHIoc3RydWN0IGludGVsX3VuY29yZSAqdW5jb3JlKQo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIFRy
aWdnZXIgdGhlIGFjdHVhbCBEcml2ZXItRkxSICovCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxf
dW5jb3JlX3Jtd19mdyh1bmNvcmUsIEdVX0NOVEwsIDAsIERSSVZFUkZMUik7Cj4gPiDCoAo+ID4g
K8KgwqDCoMKgwqDCoMKgLyogQ29tcGxldGlvbiBTdGVwIDEgLSBwb2xsIGZvciAnQ05UTC1CSVQz
MSA9IDAnIHdhaXQgZm9yIGh3IHRlYXJkb3duIHRvIGNvbXBsZXRlICovCj4gPiArwqDCoMKgwqDC
oMKgwqByZXQgPSBpbnRlbF93YWl0X2Zvcl9yZWdpc3Rlcl9mdyh1bmNvcmUsIEdVX0NOVEwsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERSSVZFUkZMUl9TVEFUVVMsIDAsCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZscl90aW1lb3V0X21zKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oC8qIENvbXBsZXRpb246IFN0ZXAgMiAtIHBvbGwgZm9yICdERUJVRy1CSVQzMSA9IDEnIGZvciBo
dy9mdyByZS1pbml0IHRvIGNvbXBsZXRlICovCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gaW50
ZWxfd2FpdF9mb3JfcmVnaXN0ZXJfZncodW5jb3JlLCBHVV9ERUJVRywKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIERSSVZFUkZMUl9TVEFUVVMsIERSSVZFUkZMUl9TVEFUVVMsCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmbHJfdGltZW91dF9tcyk7Cj4gPiBAQCAtMjc1Niw2ICsyNzYy
LDcgQEAgc3RhdGljIHZvaWQgZHJpdmVyX2luaXRpYXRlZF9mbHIoc3RydWN0IGludGVsX3VuY29y
ZSAqdW5jb3JlKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIFdyaXRlIDEg
dG8gY2xlYXIgR1VfREVCVUcncyBzdGlja3kgY29tcGxldGlvbiBzdGF0dXMgYml0ICovCj4gPiDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfdW5jb3JlX3dyaXRlX2Z3KHVuY29yZSwgR1VfREVCVUcsIERS
SVZFUkZMUl9TVEFUVVMpOwo+ID4gwqB9Cj4gPiDCoAo+ID4gCj4gPiBiYXNlLWNvbW1pdDogMGEw
ZWU2MTc4NGRmMDFhYzA5OGE5MmJkNDM2NzNlZTMwYzYyOWYxMwo+ID4gLS0gCj4gPiAyLjM5LjAK
PiA+IAoK
