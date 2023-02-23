Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C714D6A0F6E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 19:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E410E00E;
	Thu, 23 Feb 2023 18:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BDA10E00E;
 Thu, 23 Feb 2023 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677176791; x=1708712791;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=empzvGXBMuR5D/271aec41miS8FV0/1pHER/BUKh0MA=;
 b=dFMb0p1rfW0T+DVy7QxRwnfM+ByXJTDGmxOmvjOaQcUyfLlNORC/geVP
 rDpTaK1re9qN1S/45DEFN3bVhxvxei52KLKiBUQ5QqIHLRFTSwpkayFAI
 wgU86ZhbmZrO2AT0xVoGS65yhUA4g4JarJ1ZtIzQMlcUFSTAOJH9WshaV
 NAvWSR0kt8CJuocgO+FG1vkn947U/RdUyRwCBcsrcmzXjT5VsA0h48MN3
 p0LOG4ca2KRcIaNjDJRdYRqV4u/+IeYJ7bpPKTyc6OfOp3m6VpVbooftD
 UUZYZDr7lZnEUkrPjcHr4vam1h/h2ecMrZy6xFW271P/N6zZGg3wbNEIe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317041108"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="317041108"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="702882303"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="702882303"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 23 Feb 2023 10:26:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 10:26:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 10:26:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 10:26:15 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 10:26:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlQ+6ADWeW72stu99k9QvhaeAb6SgmJ14eDGNsQg7W6gphy9neXjN5C5QDP4Gt2buICcgzdwHAxRf+d0SdfGOVeJkz1Y3SqcPCliRXNu9eb2ws4nMbni6asu7UnakE55ske0720aEMtL0S25CcgXnScmczZsbhMzB6ubO8Xak/kglWoC0BoPlDClvtQSoLU+QRI1/jrm4c7mR24MjrThQOlA2VZfhQHh96tVOMpwcXGB0g7HjTktftkLlh9e6klG2+WSZp0p1WBGoTNOcHegvnAo9crQ6pO8Exuk+RzCsZz3LxDmvhmVtTZrag8oSSFOteRZrbsQIHIDL174zD+4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=empzvGXBMuR5D/271aec41miS8FV0/1pHER/BUKh0MA=;
 b=FAQ5vo3jHeJPJuHCrR9cJmujCSaKWvSllqPYvcKLH/4gRWrdQ0bGozhQk2kboSJ9FfwFCa7gyNECE94eganCl6OSxM21CNR2RoivAsOU10tmTXEnxiewkbEYl5XaioeF1FEEU/rjhJ2JKTPAfH4j3vHcYUau8WDygdIdd1MPg/0UjSOyMrzzD9Iq/OgaclzlE/+1hwgs3/7GogfAiQs0gTmqc/AHIiModsXmbzgRom+xRoIDQS2Lga2zNtnxw9/HocFOV/8uQa+Q7REoNSFN+x1dAm30XPmLmOCr9b4JZbB34MtMUqHwUrX9gXNXGfeWR1KYjILkXwJaLlS21LuUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH0PR11MB5492.namprd11.prod.outlook.com (2603:10b6:610:d7::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Thu, 23 Feb 2023 18:26:11 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 18:26:11 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "Santa Cruz, Diego"
 <Diego.SantaCruz@spinetix.com>, "wse@tuxedocomputers.com"
 <wse@tuxedocomputers.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Kahola, 
 Mika" <mika.kahola@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 0/2] Add quirk to disable PSR 2 on Tongfang PHxTxX1 and
 PHxTQx1
Thread-Topic: [PATCH 0/2] Add quirk to disable PSR 2 on Tongfang PHxTxX1 and
 PHxTQx1
Thread-Index: AQHZRsiGwvLWWDCoJkWpIPlEmnkqqq7c2wiA
Date: Thu, 23 Feb 2023 18:26:11 +0000
Message-ID: <9b0e29f15f3e8799256c425f06b36a70ec04522f.camel@intel.com>
References: <20230222141755.1060162-1-wse@tuxedocomputers.com>
In-Reply-To: <20230222141755.1060162-1-wse@tuxedocomputers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH0PR11MB5492:EE_
x-ms-office365-filtering-correlation-id: 11e4c2fa-06be-465d-8a04-08db15cb7072
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0GOSM/5F/aXG3XAOd8bScD5LwL5QRzKSM+mj9tse+pOdFtYKdbm0UCnG2b8kw6cdR8vR/wKXM9KPFEErd1sdBWuRENf7d6FOIgUocMr4gp0mWb2ScfXG4h3TTickWItxBr6FPFAR+w6dNqv8yMQKFPewvbLvWbfszrWZZ6i5x0+RGuQb3TcEkY4VXSHKeLNTV8aOFMAneWI3Ofiu959XoJnQ7Ko7QFsqIjS2A5008gVwBfKBoDetYrHapMm4nMgMwlAbrPzaOCICy9KVCKFqo0cynVMnIIy0lVQJkXYtLdMTUeL45v4sCNIO1xMJxeJ1ZP7w7BzLdWtZ9m5aj+vo1JsGwUx7SP2+5LyQMaBOQEyt9tNCFTp0QirzKcW+tSzOoPeEAwGuSuXmscf32ZYTP7COMoiu6AvGN4WD2nrxa59QpOCdncvFNoVPavVFcul1vlBC93qmQsCFsy0vXpk6j15Ds9OWxJ2HO9KisAfUzim8lftIYWpBmdeZeq3MiT1SNPAtxJ8NDr5dFWy1tCM6tr2sX3p/eMrgRgaWYdLA6jO3CR23Njj7QWwfYtxrleDLWi5cwSXlMSXnCH8zSGGqaefwtPkReeTybIXO14M8rz0yZdLHwbWVUpNsxWeFUEW7A0fuFokBj1SQP5x6fBNNNDJy7epZZzBB61EDnMw8kFA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(6029001)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199018)(4744005)(2906002)(7416002)(8936002)(5660300002)(41300700001)(76116006)(66446008)(8676002)(83380400001)(66946007)(66476007)(91956017)(316002)(66556008)(478600001)(6486002)(36756003)(966005)(26005)(186003)(71200400001)(6506007)(82960400001)(2616005)(38100700002)(86362001)(64756008)(122000001)(38070700005)(110136005)(6636002)(6512007)(921005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2sxUGY3clJ6K0RReWN6YXBsUEdjcUZyaEdBMDljRkV0UFhuSzZkSmJ6VWM4?=
 =?utf-8?B?ODE5Q3IvZFRDdWZrbWhzdlNueWU2NXJvREluTm40SWt5Y3ZZWndYa01mR3BR?=
 =?utf-8?B?TEd3QjlWYVdWb1JkbVVuS3Q3TCs0N21KbUhaRDJxYUJSOENhUE5lNUpXMzlH?=
 =?utf-8?B?THdWRUxTMVg4SEVkelhlQmVwZ3ViVm8yclA5Rnp0NkdLL3dEUHhrV3ZhZTR6?=
 =?utf-8?B?emhOVldULzRJK05TQStiaVJoL29ueFQ2M3FtZHB6K2NBNU5kSlM2SlVTVXZY?=
 =?utf-8?B?VTlybjRIa2tWTTNheityRFZNNjJTSXZDZS92dXJQYlpvMHNZSTdacUxWbjlz?=
 =?utf-8?B?eWNRVTZITktxaUNKTS9EQUUycXJkU3pwMXpMREpsbTBEMHBSUTNjVFIzS1dL?=
 =?utf-8?B?QXpXQ1lXRC8xWERBRVhUR250Yk5Ba0NFKzl6c1hMcTZja2pDZzlBTGg1d0xp?=
 =?utf-8?B?dnFZMG96SzBIMmN6Z3U5eWZCd2ZpYlBnY01vU2VjQWsyeS9aTzVySktPcEJl?=
 =?utf-8?B?YW8wTTJHS3R1dVQrNFdPdGFUV1FndkN0Y3pkUy9uWVZwT3ROUVh3c2xwM2NM?=
 =?utf-8?B?NDFOM3UxSGxrWUsybmtpMHQ3dXZHcFBMUk84R0hFckNJN29rS3M5UzFJQzB4?=
 =?utf-8?B?U2FRVHUwVkRUdGJMWFFNYjdjaGh1WUNsdVl3MmRrSkVrZGtOaWNTOVJkQTdR?=
 =?utf-8?B?Z2RkbXBGVHVaT0hoZzA3RDF4NzE5VzNxN1hFYUo4dURleEtid1k1d0pWOEhi?=
 =?utf-8?B?VmhyMGNKU0JHL1g1SHJzKzdGc1VmTXdlclBFeWF0N3hsRzlVTllJbWZQb0gr?=
 =?utf-8?B?ZG0zaFdDQmVWbGdIajAyQUoxbUJTR3R3Qm9ZQ0lJbmIwWFkzWW1jNmEwV2k0?=
 =?utf-8?B?Yi90OWthOFByYWkvcFR0dzBkYmd6S1EwdGxiQ2pmRnIxY2htQnVnQU9PWmw4?=
 =?utf-8?B?RGRPRWhINWxsSk1pVnhGRThydUJZbkRHQ2NTcm9tMk4yRmZtcWJBcjIvNjZR?=
 =?utf-8?B?bEFPeVF0WXBFNk5hbG5pb1hGSFg2ZGFmVTBVdnh1MGdMZW96L1p6em1TVnls?=
 =?utf-8?B?ZmZMblFSYldBcnp2aSs3akw1SzM1RkZ6ZHAyVGg3bklFR1ZDajRCSnUyU0d0?=
 =?utf-8?B?dTZoMEZGcXd2S0Ura3c4L0piMGgwR3BHT0RNZkNVU1B5ZEhTRTFNMEhtS1dC?=
 =?utf-8?B?bk1TeDg5T0kxbURmMFRPMStFVlBXc2hueUg1Sm9ua2lJRU1XV3lhbks5K2dZ?=
 =?utf-8?B?RVlJN1FjWDFuSWgyeWgzazlORGtnZ0krMTNyODA0Tm5mMzMrZmZmbU9DZ29P?=
 =?utf-8?B?TVFxR3huMExVbE10WEhTVittL2VEanp6WVYzWktvVDd1b1dHQXlncXVQYWd3?=
 =?utf-8?B?M3dTODhrNVB6WHYwWXBXR0JjS01TRVk1NVE1Znp6V1NwakhZdCt4TVJ1QzVZ?=
 =?utf-8?B?R1NYSEhUallPNTZqMXB0NjY2YW9aZkl5dWFWU3FoWWtUQnU4ZlkzaDdCYk81?=
 =?utf-8?B?Uktqa0RlYVdkQzMrRDhVQ2ppOWdPclFFTGRBcmpQQWpydytMMURUc2QzcFFF?=
 =?utf-8?B?WllTU0Jlbnd0WVBXWkMxSGdhMGw5cXEwUFRUU2JROVVqRnJCa3J6WDQ5eTBr?=
 =?utf-8?B?ZklLTUxxL0ZMTXBWaW5wSmxKU2tjM3lic2ZGK09NWEdpbnRJQ2h6M0h5Z0h2?=
 =?utf-8?B?cGpwLzBsNEREL0ZIYmVRU2F5anI2U0dFZXRZZlowMWJCRmVpTTQ5Q1lmcTFj?=
 =?utf-8?B?eWN2MVdtMkRrSXpEb1JiMXIyN3pSbnpuNWMxcHQ3NTlGN3hTR21vc1FhbjFs?=
 =?utf-8?B?eGV2bkNlSy9TekZaSVZsRktiQ3BiRWVoM0lMRkxsVFA2VXpGM2dvQm5oak5l?=
 =?utf-8?B?dDBCV1ZtbmRVeGZ3S3NKTHVXejY2RDVUR21GZFdPR1JSOUNnZENkWTlpNnZy?=
 =?utf-8?B?ejNKR25EendpN1lyMzd4b3ROL2w4UlJPbDRjbXpFaFEvaTEyWnUybHJYb29D?=
 =?utf-8?B?L01KTzhnQzRjOVZ6QjNub2J6VkNWMUZOeTU2NkFFMElBSVdjYTRlRVgxQmNF?=
 =?utf-8?B?WGNha2xtSDZnbkRrK3llU1ZNNU9KbzFCTnlwQ0tOazNHSTl0YUt1NXNXM2dn?=
 =?utf-8?B?R2lmR2dtVU1oSWJ1dy90L05NNWRlTjdwQkdRaktkbEw2ZGI1dEZEU0t4SHN6?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBBFDAE268231B4BA0F0E77F82B8BA03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e4c2fa-06be-465d-8a04-08db15cb7072
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 18:26:11.1999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRxmJ8jZJwGAHpJdra3ZGm9kxciLuKzyjvpCBOPRaJqxJ9Qgb8PqHuCxMi4LEk2a5YVlWyFD6+s68DPB0GZGivFGv4/iCLqMzU/Z40ussLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5492
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAyLTIyIGF0IDE1OjE3ICswMTAwLCBXZXJuZXIgU2VtYmFjaCB3cm90ZToN
Cj4gT24gdGhlc2UgQmFyZWJvbmVzIFBTUiAyIGlzIHJlY29nbml6ZWQgYXMgc3VwcG9ydGVkIGJ1
dCBpcyB2ZXJ5DQo+IGJ1Z2d5Og0KPiAtIFVwcGVyIHRoaXJkIG9mIHNjcmVlbiBkb2VzIHNvbWV0
aW1lcyBub3QgdXBkYXRlZCwgcmVzdWx0aW5nIGluDQo+IGRpc2FwcGVhcmluZyBjdXJzb3JzIG9y
IGdob3N0cyBvZiBhbHJlYWR5IGNsb3NlZCBXaW5kb3dzIHNheWluZw0KPiBiZWhpbmQuDQo+IC0g
QXBwcm94aW1hdGVseSA0MCBweCBmcm9tIHRoZSBib3R0b20gZWRnZSBhIDMgcGl4ZWwgd2lkZSBz
dHJpcCBvZg0KPiByYW5kb21seQ0KPiBjb2xvcmVkIHBpeGVscyBpcyBmbGlja2VyaW5nLg0KPiAN
Cj4gUFNSIDEgaXMgd29ya2luZyBmaW5lIGhvd2V2ZXIuDQo+IA0KPiBUaGlzIHBhdGNoc2V0IGlu
dHJvZHVjZXMgYSBuZXcgcXVpcmsgdG8gZGlzYWJsZSBQU1IgMiBzcGVjaWZpY2FsbHkgb24NCj4g
a25vd24NCj4gYnVnZ3kgZGV2aWNlcyBhbmQgYXBwbGllcyBpdCB0byB0aGUgVG9uZ2ZhbmcgUEh4
VHhYMSBhbmQgUEh4VFF4MQ0KPiBiYXJlYm9uZXMuDQoNCkkndmUgYmVlbiB0aGlua2luZyBzb21l
dGhpbmcgc2ltaWxhciBhcyB0aGVyZSBpcyBzdGlsbCBhdCBsZWFzdCBvbmUNCmlzc3VlIHdoaWNo
IHNlZW1zIHRvIGJlIGxpa2UgcGFuZWwgc2lkZSBpc3N1ZToNCg0KaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy83ODM2DQoNCkRpZCB5b3UgY29uc2lkZXJl
ZCBkcGNkX3F1aXJrX2xpc3QgaW4gZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYz8NCg0K
SSdtIG5vdCBzdXJlIHdoaWNoIG9uZSBpcyBtb3JlIGNvcnJlY3QgdGhvdWdoLi4uDQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFdlcm5lciBTZW1iYWNoIDx3c2VAdHV4ZWRvY29tcHV0ZXJzLmNvbT4N
Cj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiANCj4gDQoNCg==
