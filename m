Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984D478687
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 09:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ACD10F6BD;
	Fri, 17 Dec 2021 08:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924C10F6BC;
 Fri, 17 Dec 2021 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639731178; x=1671267178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gb4/7BOsWqov47aO5jRvg99313tmYcNzECmgexnRVQw=;
 b=L60IMrQs3ak5EPa2WhpDcMdp3qGtDLJSefhWwirlOwKVZ+fkFsHJNaX3
 3YsO5euQ6VKV7AumFZQIjp2BLJo8V0tT7eunwa0PW+8hj5v6eakz5Ykle
 D45cvFdLRuIgetpwv/mQWOsBjY0WBUuJ9w+zsHDp98Bis/Hv/MUgO3vE2
 13WDImRYVjFLqvhGbv52SJpw4RDvfBZTxGTlINsYTNFJgJ48qqEIL9oa1
 UN9SoTf6n4XOpXa7QuLVkQAtAjGiJ1OS2LxqlosFZcGyvuM6ffNS6y2nL
 K9Spb0RbimfZpqUmjclVl89SxoKyNLp0yetrI7rIwUnFIfUHzmuO4rM/P A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300489330"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="300489330"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 00:52:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="466433709"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 17 Dec 2021 00:52:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 00:52:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 17 Dec 2021 00:52:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 17 Dec 2021 00:52:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgiquTfKuNtz84McKYqpOWMgDTUvlhaGVQm3kD4UamdMoM0sKyr9u/q7zG0F4ZYhFuJeXwJZKBkvZ+F2ZPh9Xhc0xiqHs6VNrclzFntDkF2PD7XGwTcNlocSv0Me4SuPeYSpuGpzSHPHD1fi5NxCDnt9gdwSloEeeI2yudbDzcvHM0IW9U3ASqXO3Do78RAdXR7UVrHekV8wuU7+78PH/F8BBmhcgJ1t0JdkesbY7XBPpUb2t9LZ0jgaRfOg87NbgenC0vSCM2nc8iLpjyxE/c2loPMZOtuTjvQy7e43z2h4Zmh/uL0qsyNQv+7kN1TkvATUGAoxa3rN+OzKmhDHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gb4/7BOsWqov47aO5jRvg99313tmYcNzECmgexnRVQw=;
 b=AfzorqpRvqKJAHupyHz/thg5qAnKU+P2nrVVc8M+1pP2KIOt4gSEh7TW/fGvQ9rdMyWrnFO3URDo7o1/9UKHUKUSExjlQDsWgb6goilRl/7a7cvU753BOWtxeSQOF1IcBoza2/ok5JT9nTlrALCndHkMBJM2Zs9pVON/3QsnIOA01ehQhWuJomi2GqV7x6BibiyRcPwATHi96oM3rDdjaJZSwO151Hl9bVQDNP+M/65mB8ypzKaBhnRWWx34pFlc7q4m1yskqi3bIX1TeNuPVVqjNWTyWo4NAH3aGPPhfdj2YKH2TLdnzKJ39g3l/DXrWke1ELKMvnlOpINv8C8hBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by CH0PR11MB5380.namprd11.prod.outlook.com (2603:10b6:610:bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 08:52:54 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::755d:532a:e27d:4742]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::755d:532a:e27d:4742%8]) with mapi id 15.20.4778.016; Fri, 17 Dec 2021
 08:52:53 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v4 1/2] i915/gvt: Introduce the mmio_info_table.c to
 support VFIO new mdev API
Thread-Topic: [PATCH v4 1/2] i915/gvt: Introduce the mmio_info_table.c to
 support VFIO new mdev API
Thread-Index: AQHX5R4w0hOExhz3V0WUyBbtJ8B2xawcSWAAgBozV4A=
Date: Fri, 17 Dec 2021 08:52:53 +0000
Message-ID: <e183b95f-89d1-3a2f-27e2-82aa2b10e8fc@intel.com>
References: <20211129123832.105196-1-zhi.a.wang@intel.com>
 <20211130164622.GA15150@lst.de>
In-Reply-To: <20211130164622.GA15150@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f4fc14e-9feb-47b6-6c85-08d9c13a9d39
x-ms-traffictypediagnostic: CH0PR11MB5380:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR11MB538028488A01F7944FE85AFECA789@CH0PR11MB5380.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0EtCm4nJqZAXkxvnJEgO01D+z7aSBFej8m6mgYzxgBT0UQY/vZWeZmqqNI9boGen6kGR1LLcDmVcm9e7PV8mvHKNBjIOCfuXY9hRfP/J0S70G1KEP0rU2DFFJhVM9GfLuA+k4PBSLXBMv3+F5ocmbfYBAjwA4RPvWcJNGUwJKdEF0IzPWBfasaNsPd4TRYFKOUZBV38VzTxWo/TqpBr0ZWI9RntXIzLnx2cC60I5Ye13Dxp3FIviaU41GKCaYlNbCR6njBzQa7WqzeoD7xQayBJbQQEkNp7QEJE4lnCWRF8XvRuWeWmZRSShyc3RsPyAPg2WLPX0QHvePUYT9eLC07QbWZjEyY+gnCzUqZK2Co4D+Ik/QeCX1PRHuEPBJRHxuM/VvY2k/CyUxtC5eskH9isJTw1QxN2ENcafqRCwtBHQVLiN1K6viECeV02WwZJ1GA3uvrcMQ1ErT5t+qsQwdFpJ60bfAahdYBxTN/SAoUyKou5Ygw9ODgXTOP6okhvhmpI/21L6UZzB5+h0TEVRSMlmwJ7CwZWkffNoM8H6jjZJ5akCzv7mp9GoYHBM5AZwMWJMUtASZW800zjXi9evTePMNI49D0LUd9bj+u0b4UW8/HUG1JRIEXTKH6GA1FgjbCZ5DcJ3vUTGu6ixeXFdCel0WyutZ8hr0ZPq4K16K3ZJzuBuOV5PpWYFjQzpTtCHJaFI7xSno33motWWwbIAn4Iac2HW3HuusZSHpFbrnXMFTNkiB56zDSEjnruglfM/FX9Uwxo1+R5FQNLXHc4kQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(26005)(2906002)(7416002)(82960400001)(76116006)(2616005)(64756008)(66476007)(66556008)(66446008)(66946007)(6486002)(110136005)(6512007)(316002)(38100700002)(186003)(508600001)(91956017)(36756003)(4326008)(5660300002)(54906003)(53546011)(6506007)(38070700005)(4744005)(31686004)(86362001)(83380400001)(71200400001)(31696002)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUlCWExUOXpJOG52RWxQUzJTQWZDNW5FYnhGNW1vU09jTWN0TlJZWmRxdXYw?=
 =?utf-8?B?RnlZanNyM3I3UW92alBhTzdOanJCUE9RcDMxSDl4TkZSVUF0Z1MzQ3gwQ3J4?=
 =?utf-8?B?dStMckZoWExRYWQ1UXFkU2ZvYkRDdi8xUGZRVGRRQlo3Sm9xdmtaVnBMTyt4?=
 =?utf-8?B?TEI1U2J1V2JSczIxZEZQNENjTngyS1VTTnM3cGRtVDBHVzVRU3NleS9NL3Fr?=
 =?utf-8?B?Yndzbkk0SjdJOENOMjhIUTk3aFUvK1BoTTlxQTgxajMwMkhZQ1hJN3ozQ2lB?=
 =?utf-8?B?N3doTHA1czZxNHN5SzIxSnJvNEk4RW14WHlqZnJKRHVnVWlkdGRtc0w2UEVv?=
 =?utf-8?B?ME5QZFN1dEVtZzBzTGl3a2xoUXFYUW1ZNG1sQ3ZjM0ZBZEtTQVE1QW0wVW9s?=
 =?utf-8?B?QldqVnpnZXI5NHUySXJmM2tGZ1E3Z2hoeWNHYVlRQ1hlVlFEb2NheVArSytp?=
 =?utf-8?B?aVYya2ltY3NqaVFMb1hscVdsVHM2eWNSSzJRR0I5SFRSbjNBZS9VVnhlVVcy?=
 =?utf-8?B?cWN2T25hTjlpRW40bFcvZ1lkQVNxeXp6Ty9YUE5JSkhwS1BSMGVHK3BKZGhG?=
 =?utf-8?B?amIyMnQwc3huNGVjUE1ESC9nMnJHaERobzFLWHpYWUpmSStrMXBRT2NPU1cx?=
 =?utf-8?B?UmpZZ3FQSnNmMmY4S05va0FkMXh4Q01WRmU2ZFp2bHlMcXUxZDFrWUQ0bTA3?=
 =?utf-8?B?cTF1ZXVlN0NEbjcxLzFzcTlvNm9WWlk0TGpJb0VFb3BXTjlsVmZMYW93Tmty?=
 =?utf-8?B?dzU5TFViZEp3aUYybm9Nd2djWkJGN3JNMDdBcGRZeFFJUmNsTFcxM0VndDNl?=
 =?utf-8?B?Q2Q5TUYzdmdLcUJTMlB6ZEc1aUtQb2FSMHFKbGtnbEptZENoSjZabkk2LzFa?=
 =?utf-8?B?U1dSVVZScHZGeWdmSG5yR2gvalM5ZnhnUE00dkRXUXZhai9sekVUWDZ1RW02?=
 =?utf-8?B?aTFjS1RlR2tlQ29VRWVNRjd0MC82S0JLdStVdkdqVm9iRG5PNWhJV1ZRbE5z?=
 =?utf-8?B?Q0g5dkxYdFMwb0RQYVJmeVNCVkJhK2xLT0k0ZHBXOGFzSm5sdmFiRWd0N0hu?=
 =?utf-8?B?OXhkdURrb2ExMzhRcGR4OG9tdEFYcVJwUDFaY1oyaVpqVmhUbzhJc2t2OEhF?=
 =?utf-8?B?OGttanVLbThOZTlSdi9VUDJEdFN6dzZSVU52c3JrSjRKWnppc2RvcjFCRCtO?=
 =?utf-8?B?eEVOOFdVWUU3cDgzaXBNcHR0a2dPbXdZcDhvSWdzdDliL2Ixa3NMOEpNa0o5?=
 =?utf-8?B?WHpCQWpSbjh2eVRZVEhoY2pDOE5kTWk2Rzh4MWxGd0t6K2x3YlpRN0ppTG1V?=
 =?utf-8?B?amhBeWxpaGJuYjgvRDljV0tHVXdac3ZROXROWVRKL1FDVnM3Z1FYQWlqS2FU?=
 =?utf-8?B?M0dPZ2JoMmxpa0JyZEw4OU9KN2hGUStTaHV2aDh0ZkFLOEM2emNCakRDUDlX?=
 =?utf-8?B?MENHYnFXUTFxbm1NanVYMk51dlR6dDhYSUx0SHVzejFZUVFSeFljM0JQc2o5?=
 =?utf-8?B?ck1DRWxFRWhINzFMeXpJR3hrcHVzK2pOOTh6TFZjN2s4dUFZZGZFYng2Mm05?=
 =?utf-8?B?SnFTaHl1RC9FQkdocXkzc1YyUVJtK1dzdHZPa2JjZ2xlK3BaV0pZOVRnbzli?=
 =?utf-8?B?VHpNQXZyZUQvMnZpNUxhY3p3eHNROHRWZ2NiQ3I2MUZDQ3lJcVU5dVdGVXdN?=
 =?utf-8?B?bzRZMzF4S00vaVFxZlhHbTV3emFBWjFBMkkzNHE0YVNMQ1VRYmNCZi82Smdw?=
 =?utf-8?B?NnQ4cXBwOHJoOUsycG15dXM5MXJmek5TYzJONitSK3h3YVJkMGZsUXN3bHNE?=
 =?utf-8?B?bm9mT3UzcTFoZE5EaG84cFlBRHJuSmZLa2ZBK1cvZFR3SGF0K0RwUG1yTnc0?=
 =?utf-8?B?Rm9nMy8zY2JRMVExRGpSdXF3SG95a1JhZWNndHZ6d3lsWldTaXNheWxtNHZO?=
 =?utf-8?B?K1MzNU1ZZkx4TWtQRVNHVXd1VkNFOWpacnc5cmFZcHdGT0VONnQ4QUJNblNt?=
 =?utf-8?B?b0FCbVNPWEZpTDBoVzVFS3ZLS1dmaU1IUzZzZTZPcHA3eUhsVFBiQ0VFUlNX?=
 =?utf-8?B?WFVRc0g1SHFoQWFaUVdzZjNiUnRYR3dXQ1RRVmo0Y253MllLaEFFb3dvQmQ5?=
 =?utf-8?B?N25OZVZLQ0xwelRISjJDd29vMTBLaks3M0tNeFZWdXBuT1JOK0VXb0pEMTl1?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBADFBA02F3E0547B9D0BF8E05CD29C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4fc14e-9feb-47b6-6c85-08d9c13a9d39
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 08:52:53.8904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RCxRIVbNFXjAfMKfYC+N54058U0EMOe7v6f50rgA6sogdMJe3vQ9th8PXLAoDmjoAOJOJ9COF+cGNBKRvEmOnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5380
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Jason
 Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMzAvMjAyMSA2OjQ2IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gSSBzdGls
bCB0aGluayB0aGlzIGdvZXMgaW50byB0aGUgd3JvbmcgZGlyZWN0aW9uLg0KPg0KPiBTb21ldGhp
bmcgY2xvc2VyIHRvIHlvdXIgZmlyc3QgdmVyc2lvbiB0aGF0IGFsc28gc2F2ZXMgYXdheSB0aGUN
Cj4gZ3Z0LT5tbWlvLm1taW9fYXR0cmlidXRlIGZsYWdzIGluIHRoZSBjb3JlIGk5MTUgbW9kdWxl
LCBhbmQgd2hpY2gNCj4gc3BsaXRzIHRoZSBNTUlPIHRhYmxlIGludG8gb25lIHRoYXQgY29udGFp
bnMganVzdCB0aGUgb2Zmc2V0LCBzaXplDQo+IGFuZCBmbGFncyAoY29yZSBpOTE1KSBhbmQgb25l
IHRoYXQgaGFzIHRoZSByZWFkLW9ubHkgbWFzayBhbmQgaGFuZGxlcnMNCj4gKGd2dCkgd291bGQg
YmUgbXVjaCBzaW1wbGVyIGFuZCBub3QgY3JlYXRlIHRoaXMgc3VwZXItdGlnaHQgY291cGxpbmcN
Cj4gYmV0d2VlbiBjb3JlIGk5MTUgYW5kIGd2dC4NCj4NCj4gQm9udXMgcG9pbnRzIGZvciBtb3Zp
bmcgeW91ciBuZXcgaW50ZWxfZ3Z0X2h3X3N0YXRlIHN0cnVjdHVyZSBvdXQNCj4gb2Ygc3RydWN0
IGludGVsX2d2dCBhbmQgaW50byBzdHJ1Y3QgaTkxNV92aXJ0dWFsX2dwdS4NCg0KSGkgQ2hyaXN0
b3BoOg0KDQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkgYXMgSSBhbSBzdXBwb3J0aW5nIHRoZSBj
dXN0b21lcnMgcmVjZW50bHkuIEkgDQp3aWxsIHJlZnJlc2ggdGhpcyBhZnRlciB0aGUgY2hyaXN0
bWFzLg0KDQpUaGFua3MsDQoNClpoaS4NCg0K
