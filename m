Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5024C4D014B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 15:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F7F10E118;
	Mon,  7 Mar 2022 14:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2414310E1C3;
 Mon,  7 Mar 2022 14:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646663552; x=1678199552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=bMQ6M6C1/yf7/eL21qF4oNCmy7z6G8X49Eyt7Xp6C64=;
 b=NcpkxJQ95nqOXJg+EK6A4zaMBX5NmWxqFz3h6Kw97pEkBpT6/kI4pYIm
 Az53q4CaCBJd2ukhCfaCWZakkQiAts4sYwfAzPy4tNYRKW8/lEOwOREpz
 reOHVddTv0BDI0RCDTOnEtyfixXcp4E8mGCOf5lbtbW+ncN0MNFRDtO9R
 +yMOWkz8fvPlm8BEM/fZ5wx8I4+55CiTareZy6RQ0Pby0pckIU4jE2V30
 VoyeuwsAZIqcWAzPdvFUZEIqw2A/wMA0MsvJ3pMsql7GaER4asoZZm4Qs
 spFYcyFronlKJIlOflCTGlLZMxhx+/yBcW+dRgn/mgBix3xHArTaoWvaf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="279107778"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="279107778"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="595517478"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2022 06:32:31 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 06:32:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 06:32:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 06:32:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QI5t4c7SVNmNsuA+YNSBv+YDDguBHz3AMDpSefZZtIGGTGpbx8ZkF0xdoM4i3y0e0qnnExlYAmkwITdN6fK3KlSAXIJx1pCPfBVxU5s4tjY4a0tkV1qUkAlvguAy9nJmhOHqW4hJKRi8Wr8b7iXfS6Q5Xmi9kMChiefh+R5oxGj59u3wuoAr38zbV+07p12koytoKeasLSrZ9aLQtmL3pBPQR5wmO67EPITlYUES1JgpSWU9nuB5AkDbKyHHlngt/mCyX1pW5Pp0WgxxSyX6CRPejJVvvdq6sJ6bIsg0rrMUOdWUb3lGlnnVNftVnFu9h/rMLRhKlZLTxPhA+jT31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isnD1k2sadCxFqTzayX0E523xrFBSEVNturSfeJmpm8=;
 b=M64ZVsUNOuR5d83tXDPZbxCSS5BrtktkVAh8ofAP5XlQgS+ZRit3jlSrIW/k2l96YW3bfwUGDNEWgvLFhZuWNHOKEijYTd4QKKnnB6T0kQhChU/1Cvn35wAtyd8oS+rkDI+lDtfqOSUuW+XtwLlbRGt+M8pyQBp8eEaRN58Ja+uTZAL7PU3J/JHfveurHGLh0vVJCCYOZcu8c0jI+PihJVZMpbgcGcg7XD0rkR7YDZY9G8VFNU+WQMmv+8ZCRWCiA9iXD9E6Vt+SMetecARaP7Z9CGD0M19TZWzfmCEgVhs2gtqVDQl83pLMqmzOCjGQBKqM1AhMa73UaiADCzNOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 CH2PR11MB4390.namprd11.prod.outlook.com (2603:10b6:610:3d::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Mon, 7 Mar 2022 14:32:27 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462%5]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:32:27 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/6] drm/i915/gt: Clear compress metadata for Flat-ccs
 objects
Thread-Topic: [PATCH v3 2/6] drm/i915/gt: Clear compress metadata for Flat-ccs
 objects
Thread-Index: AQHYMijv4hERztt5oUaPQq5xhB9cOKyz+/+A
Date: Mon, 7 Mar 2022 14:32:27 +0000
Message-ID: <c989bd6040aa5a7483ec32cce44f6c34c07152be.camel@intel.com>
References: <20220307134038.30525-1-ramalingam.c@intel.com>
 <20220307134038.30525-3-ramalingam.c@intel.com>
In-Reply-To: <20220307134038.30525-3-ramalingam.c@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40612ec6-cfed-4a46-ab65-08da00474da7
x-ms-traffictypediagnostic: CH2PR11MB4390:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH2PR11MB43908A8296C13C8B8A65314C97089@CH2PR11MB4390.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2sq0qsIdxoBOuN5ecWHGNDHihmZlaCseciOgZGX88WotssDjg9jNdxbbniyyZXzG9ijXmEZayMJcshwvrDJbegsCe4pi4D7qtCQelO/4qp0ZY1YNhKNRA6L2L6cgp4fb2xF6GlPsoaD8c2lWNTZo91euhsp2sguqWxCA3buZFKlcyHDJt8Zz1AVCRB/UiwBCWkZRuVvh26m5/gZPvzl1c9H+B0G/lnIJM29jPYFmtG+mx/CjdujEy9RUAT9xAmOMV9t4M1ogiIVmRmHw4mhP0oujOG6ml/JpFDgQxHxvN1f5tWjgkQqiQSKYOXy84j6BKq+soHycboSobRBaTvRrL+iK1styL516ZJLr9Vi073iKjfC0MInsx+LbtEiN7TkVbWuQAQpFT8YDoaqynMgUBRu2NnaNSKMwEA+YB+p17oFrk4W4fICpLxTRfxgUVrnFGgPGCpiQjD4fYEDT2Xwg7qyICfT2zr9dQ6aFNzNGBIQsGGFPez4+xvkYkaocE+em+EQngAGOUMAgwfKjBHsaQEHRizIHGFU46ahu6zh6HDAdyj8waa3x01FSPKXB226PwDZQdNHPVElMsLvnUSzH2INPpLAMzP2mvI/ai0SXyOEk00bqm1wB6fRemx1g25Prsriz4/1MxdDTuL/y25blFLeehH8Dk4yFvdBWoaCoSqqo/V7Std6mQ8Dc2uS5jcJIny79R22xXV7+pJF7JYBGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(71200400001)(76116006)(6512007)(6486002)(508600001)(186003)(26005)(66574015)(36756003)(83380400001)(91956017)(54906003)(66946007)(38100700002)(8676002)(66476007)(4326008)(64756008)(66556008)(66446008)(316002)(82960400001)(122000001)(8936002)(2616005)(2906002)(5660300002)(38070700005)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVB0TGZ5OFBoeTEwQ3YvR2EyYkxRelFEbHMxTURKbyswOU8wVllnZEp0cWF1?=
 =?utf-8?B?Y2twdW5aT3BUYktoQUdETzU3UHdQaCtWMk4xMzhpUXdNc0M2dE9tZ2dzY0Y1?=
 =?utf-8?B?QnRaZDJydzdhY0VINTdnTlZEUWJ6akZwS2d6SkJxaEtrQTVBNSt4dU05K29I?=
 =?utf-8?B?NnE0MVk2eFJWYmJRbDFPaFBBQktIWUxOUUJiSUtWNWplMUM3bjF4Zk1UY1h3?=
 =?utf-8?B?WHdqWUVaRmNidzJtWmt6QSsrR0tkblFPb3JlMUZydGZvbkI2MjViYUxlVTND?=
 =?utf-8?B?YjAzbVpLMWQ0SXpieFkvQlVjeE95NzNES2dXS213eEN5SEFyWm9hc09vTkI3?=
 =?utf-8?B?cXBoY0JidDY5cngvZ2MzSWx2WDYvVlhPYnVOUE1NU3JOZ2c0WEt6Rlk4NWhy?=
 =?utf-8?B?UTEvdkhNV0JHQ0tUZnlWWVNudDZVbnRWUUlVMEljaHY5UG9lRXY3Y29odGg4?=
 =?utf-8?B?bEc5ZFl2cEZSekQ2QTI4WU5oQnIxZ0tuanBLSzY4Mml0YnVLOHNWa0MzMHB2?=
 =?utf-8?B?TUEwQkRVRytnbGw3NEtiWE1DVW1oWGRscUdYNUxoM2EyOUZUR1ZiYzl1cnZz?=
 =?utf-8?B?MjV0RVNMUFdvSGpVT2JHSEppZndnNDZkUmtCeHpTbE43a2t6TWFaVVRPZVhm?=
 =?utf-8?B?WjdMZzJCY3NqRGVnVll2NXlkTWhDckNZN05JMnc3cll0UStmdGZZVVpFdVZC?=
 =?utf-8?B?LzJFY3JhZFh1UkJORjJBTjJsOS9VQ2VHVzZVNVZ1NW5GSzB2cmF5Ujl3T2F4?=
 =?utf-8?B?dy9scWxlTmNvR1NDTUk1TE5pQ0p3ZjVLMityU0pOZ2ViNzZESUhVd1JVQ2NW?=
 =?utf-8?B?aEJiRzFoRkNOeWVpTkFWUDJ2UDkrVTg0K3p0QTVSbzV0STlvdjRTWFU5VWlG?=
 =?utf-8?B?MkZOVWFZbUxoVWp6QnFNTEcwV1FXRVN6cUZSN2t1MnJoVG5GSVJxTVI3ejZC?=
 =?utf-8?B?TkNjdFVrWG01K0VRaHR4VGEyWmh6MDdMV2xVbFRwS3BqSU5QRHRJMHdBditq?=
 =?utf-8?B?eFpBTDZWWUFnN2VCQkM2N3ZIU0ZndEQ5QnZuTzltN0VPS1pneDNJeHdweFpJ?=
 =?utf-8?B?RnlpMHRhRG1oTzU3ekttVER5WVEzeHg5SWsxWjVtM3ZKTElxaGl3b2Zrb1hk?=
 =?utf-8?B?SStncVZxcGxYRDNJbllnZzJoV0hENWNXOU0yOUZJZ0FDN3FtdFRuZmYzRWdT?=
 =?utf-8?B?RDRBaVRscit2N0NUVkJ2Mkp6aUNqSG5ZMHJxZDV0cjY1aUxNMUtDSU4wV0lj?=
 =?utf-8?B?WkpzMndoV3B2UVZET1NzMGUvdUpndTJJMERaQ0ZxZndFR3dzaWIvZUdFV2Np?=
 =?utf-8?B?TjlTaFkxbkFYbWh2aDczQXFGeE43VFkrWHd6dEhBN0taUytmODAxMldyVUlD?=
 =?utf-8?B?SWRZWm4zeWhSck9lSm8xS1E1VFhIblorUFloYU1kMHR1YU0yWXhXY2FocEYz?=
 =?utf-8?B?SUd5TGNaM0U5ekFJZzdYdG1iS05vS1VWb3NRd2JYVlBUNEY1RGY5MG9DWXYv?=
 =?utf-8?B?U3ZYWjVMR0NBUjlHTlhVWlNFYkUzdWhEZDZ3c21kQ3NDVGVid0ZndElnV1Zz?=
 =?utf-8?B?SzI0SU9DUlNxb2tocG1YTFEwMUJqdk1hOGxOVmhVNGFsOXFjMHJZb28xV3F2?=
 =?utf-8?B?aG55dzVzYnRpOE1kYzZQSEVNb29BNm9FdGpkWXE0bC9OWmxKclU1SmxQQmNy?=
 =?utf-8?B?M3RWSDBMTVdEdGg1S1ZMNDlIWFo0aXZleEF4OGRFUEM5R2xweDRvRW5LeEd2?=
 =?utf-8?B?RjdlUmFzaXRtbDBwRzMwM3VWMEROMnpXcUppWWRkbU5KY3ptMGEzSXREcFUz?=
 =?utf-8?B?MzBoeGxwUEU2YU1SS3RhRTFDZ01NVTkvcGNxWkoyQ0hPd0RMaDJJY2dJQk8x?=
 =?utf-8?B?QjhFellqTXk4ZGFndTNvWklaYjlwSEhlcmY3aTBEQS9KZCs4Z1A5dVpTT0NL?=
 =?utf-8?B?dTIrVWV5Yk8vSTlwYTM0SExNQW9iN0dmR3N0bmVHamEyaEc3SU5OOUJzSkpG?=
 =?utf-8?B?WFBCeVdXdkhZaXFTUDRpVmVyU3Y1UWkzaExqdTNnbXRTeXlhM042Q3FCb2ZG?=
 =?utf-8?B?WU9sUnlJQi84RjA0NmlFMFlVeGQ3M2tzV25hQzlvc3NmYTVhR1kzdEFYdENX?=
 =?utf-8?B?bEJXem5WaFRJWlM4WkovNlJRaXFpRW1yWUV5UnB6N2dVRWlYNmMxazRPNXRO?=
 =?utf-8?B?dG8xT0Q3OTdXZnAxMVp2V0V2a09wWmVsYzFZenFpTFBVOERDMVljQTdBWGdH?=
 =?utf-8?Q?tzUGHGny6XLj2+hEDg3ZhWO5pIQOVaODaNuAuU5FwE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1F711ADDD62D7459266264A4A6788FC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40612ec6-cfed-4a46-ab65-08da00474da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 14:32:27.0764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQMO1imTZ8PxG5NknUidH32g2UQhOgm0LticoGh8okXnZMNdoORrTHESqNnb4djPMuFBQgZgXsuKG1Rz//eBAQGhEwJM5aTxP51OD7TefAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4390
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAzLTA3IGF0IDE5OjEwICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4g
WGUtSFAgYW5kIGxhdGVzdCBkZXZpY2VzIHN1cHBvcnQgRmxhdCBDQ1Mgd2hpY2ggcmVzZXJ2ZWQg
YSBwb3J0aW9uIG9mCj4gdGhlIGRldmljZSBtZW1vcnkgdG8gc3RvcmUgY29tcHJlc3Npb24gbWV0
YWRhdGEsIGR1cmluZyB0aGUgY2xlYXJpbmcKPiBvZgo+IGRldmljZSBtZW1vcnkgYnVmZmVyIG9i
amVjdCB3ZSBhbHNvIG5lZWQgdG8gY2xlYXIgdGhlIGFzc29jaWF0ZWQKPiBDQ1MgYnVmZmVyLgo+
IAo+IFhZX0ZBU1RfQ09MT1JfQkxUIGNtZCBwcm92aWRlcyBhIG9wdGlvbiB0byBjbGVhciB0aGUg
Y2NzIG1ldGFkYXRhCj4gY29ycmVzcG9uZGluZyB0byB0aGUgbWFpbiBtZW1vcnkgdGhhdCBpcyBj
bGVhcmVkLiBTbyBvbiBGbGF0LUNDUwo+IGNhcGFibGUKPiBwbGF0Zm9ybSB3ZSB1c2UgdGhpcyBv
cHRpb24gdG8gY2xlYXIgdGhlIENDUyBtZXRhIGRhdGEgYWxvbmcgd2l0aAo+IG1haW4KPiBtZW1v
cnkuCj4gCj4gdjI6IEZpeGVkIGlzc3VlcyB3aXRoIHBsYXRmb3JtIG5hbWluZyBbTHVjYXNdCj4g
djM6IFJlYmFzZWQgW1JhbV0KPiDCoMKgwqAgVXNlZCB0aGUgcm91bmRfdXAgZnVuY3MgW0JvYl0K
PiB2NDogRml4ZWQgY2NzIGJsayBjYWxjdWxhdGlvbiBbUmFtXQo+IMKgwqDCoCBBZGRlZCBLZG9j
IG9uIGZsYXQtY2NzLgo+IHY1OiBHRU5NQVNLIGlzIHVzZWQgW01hdHRdCj4gwqDCoMKgIG1vY3Mg
Zml4IFtNYXR0XQo+IMKgwqDCoCBDb21tZW50cyBGaXggW01hdHRdCj4gwqDCoMKgIEZsdXNoIGFk
ZHJlc3MgcHJvZ3JhbW1pbmcgW1JhbV0KPiB2NjogRkxVU0hfRFcgaXMgZml4ZWQKPiDCoMKgwqAg
RmV3IGNvZGluZyBzdHlsZSBmaXgKPiB2NzogQWRvcHRpbmcgdGhlIFhZX0ZBU1RfQ09MT1JfQkxU
IChUaG9tYXNdCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNA
aW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEF5YXogQSBTaWRkaXF1aSA8YXlhei5zaWRkaXF1
aUBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ncHVf
Y29tbWFuZHMuaCB8wqAgMyArKwo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbWln
cmF0ZS5jwqDCoMKgwqDCoCB8IDM5Cj4gKysrKysrKysrKysrKysrKysrLS0KPiDCoDIgZmlsZXMg
Y2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3B1X2NvbW1hbmRzLmgKPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dwdV9jb21tYW5kcy5oCj4gaW5kZXggOTI1ZTU1YjZh
OTRmLi4zNGNlYWQ0OWYzNWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfZ3B1X2NvbW1hbmRzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF9ncHVfY29tbWFuZHMuaAo+IEBAIC0yMDcsOCArMjA3LDExIEBACj4gwqAjZGVmaW5lIFhZX0NP
TE9SX0JMVF9DTUTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMiA8PCAyOSB8IDB4NTAg
PDwgMjIpCj4gwqAjZGVmaW5lIFhZX0ZBU1RfQ09MT1JfQkxUX0NNRMKgwqDCoMKgwqDCoMKgwqDC
oMKgKDIgPDwgMjkgfCAweDQ0IDw8IDIyKQo+IMKgI2RlZmluZcKgwqAgWFlfRkFTVF9DT0xPUl9C
TFRfREVQVEhfMzLCoMKgwqAoMiA8PCAxOSkKPiArI2RlZmluZcKgwqAgRkFTVF9DTEVBUl8wwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgyIDw8IDEyKQo+IMKgI2RlZmluZcKgwqAg
WFlfRkFTVF9DT0xPUl9CTFRfRFfCoMKgwqDCoMKgwqDCoMKgwqAxNgo+IMKgI2RlZmluZcKgwqAg
WFlfRkFTVF9DT0xPUl9CTFRfTU9DU19NQVNLwqDCoEdFTk1BU0soMjcsIDIxKQo+ICsjZGVmaW5l
wqDCoCBYWV9GQVNUX0NPTE9SX0JMVF9BVVhfTUFTS8KgwqDCoEdFTk1BU0soMjAsIDE4KQo+ICsj
ZGVmaW5lwqDCoCBYWV9GQVNUX0NPTE9SX0JMVF9BVVhfQ0NTX0XCoMKgNQo+IMKgI2RlZmluZcKg
wqAgWFlfRkFTVF9DT0xPUl9CTFRfTUVNX1RZUEVfU0hJRlQgMzEKPiDCoCNkZWZpbmUgU1JDX0NP
UFlfQkxUX0NNRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgyIDw8IDI5IHwgMHg0MyA8
PCAyMikKPiDCoCNkZWZpbmUgR0VOOV9YWV9GQVNUX0NPUFlfQkxUX0NNRMKgwqDCoMKgwqDCoCgy
IDw8IDI5IHwgMHg0MiA8PCAyMikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfbWlncmF0ZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdy
YXRlLmMKPiBpbmRleCBjYjY4ZjdiZjZiMjguLjA1MjYyZjFiNDM4ZSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMKPiBAQCAtNDY5LDYgKzQ2OSwzNCBAQCBzdGF0
aWMgYm9vbCB3YV8xMjA5NjQ0NjExX2FwcGxpZXMoaW50IHZlciwgdTMyCj4gc2l6ZSkKPiDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIGhlaWdodCAlIDQgPT0gMyAmJiBoZWlnaHQgPD0gODsKPiDCoH0K
PiDCoAo+ICsvKioKPiArICogRE9DOiBGbGF0LUNDUyAtIE1lbW9yeSBjb21wcmVzc2lvbiBmb3Ig
TG9jYWwgbWVtb3J5Cj4gKyAqCj4gKyAqIE9uIFhlLUhQIGFuZCBsYXRlciBkZXZpY2VzLCB3ZSB1
c2UgZGVkaWNhdGVkIGNvbXByZXNzaW9uIGNvbnRyb2wKPiBzdGF0ZSAoQ0NTKQo+ICsgKiBzdG9y
ZWQgaW4gbG9jYWwgbWVtb3J5IGZvciBlYWNoIHN1cmZhY2UsIHRvIHN1cHBvcnQgdGhlIDNEIGFu
ZAo+IG1lZGlhCj4gKyAqIGNvbXByZXNzaW9uIGZvcm1hdHMuCj4gKyAqCj4gKyAqIFRoZSBtZW1v
cnkgcmVxdWlyZWQgZm9yIHRoZSBDQ1Mgb2YgdGhlIGVudGlyZSBsb2NhbCBtZW1vcnkgaXMKPiAx
LzI1NiBvZiB0aGUKPiArICogbG9jYWwgbWVtb3J5IHNpemUuIFNvIGJlZm9yZSB0aGUga2VybmVs
IGJvb3QsIHRoZSByZXF1aXJlZCBtZW1vcnkKPiBpcyByZXNlcnZlZAo+ICsgKiBmb3IgdGhlIEND
UyBkYXRhIGFuZCBhIHNlY3VyZSByZWdpc3RlciB3aWxsIGJlIHByb2dyYW1tZWQgd2l0aAo+IHRo
ZSBDQ1MgYmFzZQo+ICsgKiBhZGRyZXNzLgo+ICsgKgo+ICsgKiBGbGF0IENDUyBkYXRhIG5lZWRz
IHRvIGJlIGNsZWFyZWQgd2hlbiBhIGxtZW0gb2JqZWN0IGlzCj4gYWxsb2NhdGVkLgo+ICsgKiBB
bmQgQ0NTIGRhdGEgY2FuIGJlIGNvcGllZCBpbiBhbmQgb3V0IG9mIENDUyByZWdpb24gdGhyb3Vn
aAo+ICsgKiBYWV9DVFJMX1NVUkZfQ09QWV9CTFQuIENQVSBjYW4ndCBhY2Nlc3MgdGhlIENDUyBk
YXRhIGRpcmVjdGx5Lgo+ICsgKgo+ICsgKiBXaGVuIHdlIGV4aGF1c3QgdGhlIGxtZW0sIGlmIHRo
ZSBvYmplY3QncyBwbGFjZW1lbnRzIHN1cHBvcnQKPiBzbWVtLCB0aGVuIHdlIGNhbgo+ICsgKiBk
aXJlY3RseSBkZWNvbXByZXNzIHRoZSBjb21wcmVzc2VkIGxtZW0gb2JqZWN0IGludG8gc21lbSBh
bmQKPiBzdGFydCB1c2luZyBpdAo+ICsgKiBmcm9tIHNtZW0gaXRzZWxmLgo+ICsgKgo+ICsgKiBC
dXQgd2hlbiB3ZSBuZWVkIHRvIHN3YXBvdXQgdGhlIGNvbXByZXNzZWQgbG1lbSBvYmplY3QgaW50
byBhCj4gc21lbSByZWdpb24KPiArICogdGhvdWdoIG9iamVjdHMnIHBsYWNlbWVudCBkb2Vzbid0
IHN1cHBvcnQgc21lbSwgdGhlbiB3ZSBjb3B5IHRoZQo+IGxtZW0gY29udGVudAo+ICsgKiBhcyBp
dCBpcyBpbnRvIHNtZW0gcmVnaW9uIGFsb25nIHdpdGggY2NzIGRhdGEgKHVzaW5nCj4gWFlfQ1RS
TF9TVVJGX0NPUFlfQkxUKS4KPiArICogV2hlbiB0aGUgb2JqZWN0IGlzIHJlZmVycmVkLCBsbWVt
IGNvbnRlbnQgd2lsbCBiZSBzd2FwZWQgaW4gYWxvbmcKPiB3aXRoCj4gKyAqIHJlc3RvcmF0aW9u
IG9mIHRoZSBDQ1MgZGF0YSAodXNpbmcgWFlfQ1RSTF9TVVJGX0NPUFlfQkxUKSBhdAo+IGNvcnJl
c3BvbmRpbmcKPiArICogbG9jYXRpb24uCj4gKyAqLwo+ICsKPiDCoHN0YXRpYyBpbnQgZW1pdF9j
b3B5KHN0cnVjdCBpOTE1X3JlcXVlc3QgKnJxLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdTMyIGRzdF9vZmZzZXQsIHUzMiBzcmNfb2Zmc2V0LCBpbnQgc2l6ZSkK
PiDCoHsKPiBAQCAtNjIxLDggKzY0OSw4IEBAIHN0YXRpYyBpbnQgZW1pdF9jbGVhcihzdHJ1Y3Qg
aTkxNV9yZXF1ZXN0ICpycSwKPiB1NjQgb2Zmc2V0LCBpbnQgc2l6ZSwKPiDCoHsKPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBycS0+ZW5naW5lLT5pOTE1
Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgbW9jcyA9IHJxLT5lbmdpbmUtPmd0LT5tb2NzLnVjX2lu
ZGV4IDw8IDE7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyICpjcywgc3BsX21vZGUgPSAwLCBhdXggPSAw
LCBtZW1fdHlwZSA9IDA7Cj4gwqDCoMKgwqDCoMKgwqDCoGNvbnN0IGludCB2ZXIgPSBHUkFQSElD
U19WRVIoaTkxNSk7Cj4gLcKgwqDCoMKgwqDCoMKgdTMyICpjcywgbWVtX3R5cGUgPSAwOwo+IMKg
wqDCoMKgwqDCoMKgwqBpbnQgcmluZ19zejsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBHRU1fQlVH
X09OKHNpemUgPj4gUEFHRV9TSElGVCA+IFMxNl9NQVgpOwo+IEBAIC02NDQsMTAgKzY3MiwxNSBA
QCBzdGF0aWMgaW50IGVtaXRfY2xlYXIoc3RydWN0IGk5MTVfcmVxdWVzdCAqcnEsCj4gdTY0IG9m
ZnNldCwgaW50IHNpemUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
UFRSX0VSUihjcyk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHZlciA+PSAxMikgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoSEFTX0ZMQVRfQ0NTKGk5MTUpKSB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGxfbW9kZSA9
IEZBU1RfQ0xFQVJfMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGF1eCA9IEZJRUxEX1BSRVAoWFlfRkFTVF9DT0xPUl9CTFRfQVVYX01BU0ssCgpEaWQg
eW91IGhhdmUgYSBjaGFuY2UgdG8gdmVyaWZ5IHRoYXQgdGhpcyBhY3R1YWxseSB3b3JrcywgYW5k
IHdoZXRoZXIKc2V0dGluZyBhdXggd2lsbCBjbGVhciBqdXN0IHRoZSBDQ1MgZGF0YSBvciBib3Ro
IENDUyAmIG1haW4gREFUQT8KCklmIHNvLApSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0g
PHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoKCgo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAKPiBYWV9GQVNUX0NPTE9SX0JMVF9BVVhfQ0NTX0UpOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9
IFhZX0ZBU1RfQ09MT1JfQkxUX0NNRCB8Cj4gWFlfRkFTVF9DT0xPUl9CTFRfREVQVEhfMzIgfAo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKFhZX0ZBU1Rf
Q09MT1JfQkxUX0RXIC0gMik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzcGxfbW9kZSB8IChYWV9GQVNUX0NPTE9SX0JMVF9EVyAtIDIpOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSBGSUVMRF9QUkVQKFhZX0ZBU1RfQ09M
T1JfQkxUX01PQ1NfTUFTSywgbW9jcykKPiB8Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAoUEFHRV9TSVpFIC0gMSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoUEFHRV9TSVpFIC0gMSkgfCBhdXg7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IDA7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IHNpemUgPj4gUEFHRV9TSElGVCA8PCAxNiB8IFBBR0Vf
U0laRSAvIDQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IGxvd2Vy
XzMyX2JpdHMob2Zmc2V0KTsKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgU3dlZGVuIEFCClJlZ2lzdGVy
ZWQgT2ZmaWNlOiBJc2Fmam9yZHNnYXRhbiAzMEIsIDE2NCA0MCBLaXN0YSwgU3RvY2tob2xtLCBT
d2VkZW4KUmVnaXN0cmF0aW9uIE51bWJlcjogNTU2MTg5LTYwMjcKClRoaXMgZS1tYWlsIGFuZCBh
bnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUg
c29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0
cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRl
bGV0ZSBhbGwgY29waWVzLgo=

