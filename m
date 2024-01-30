Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8559841BE9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 07:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49D010EB96;
	Tue, 30 Jan 2024 06:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D55E10EB96
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706595791; x=1738131791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6r3vps70y95DOO40Zgy0GYXIU4qT4CUuuWZlwpeTrxk=;
 b=iGxEznfGdR6Qv8XQ81U+O5lKdbZupIJIf4C34Bhcl9UByG1UHtfllHaf
 d2gb3f4GrO34Chzp9UzqhtFQo06OxgUE0e34zsjKlU98z15PCEn3aRhv7
 +xCf4PrGK9o9UocpKaggGIewg+MGzgmaCtVgroZL8ZE7AOrKJPMxpwGwd
 +djOQfppAq0K5qfBFHrDa7rO32tfAJjuNX0ZudYh5+7E24TYcmpO5Scov
 MKWeFqoMzguDWNuxO4lHPxZrwJWddECMXhnEy32V/D/bIk7PN+HFhYJyc
 aOyxYMLwK1FJwjaw1VmoZS9/tEa5ERsSWANfc6hf35+B3T1+Lk2Y5fMcG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10572512"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="10572512"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 22:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3559819"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 22:23:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 22:23:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 22:23:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 22:23:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMXTITR6ymPFf4L+iaviycxnuFbFHXXMgpZl+EUKl/vsmK2aJAK5k/fa5+emvHWTYoQhQunoNgGMgpvZSuQRDRJncAY1CANJNQBULQt/WvE7GxBOyxmHqrPdKMCaWd5FI/S1Fzu7TBjKRe7iWbd70QuMLDzkLul2bOMbvcb4Iile1UHdJRHvef0KAzjGwI2OttdqUt6KvnuDLEgPCr66jahn9tM+nRjx+LEqZmPxDs+QSd0iVqbP6ZP4OySllzawOPBUTZCCYf+S3vTBzx+pZ3Mfe5Q1iuriKJSH7Tk4golD6I1csy+csDrvhBw9i7vO8rfXYh7QrUoV5N8Q4l+fBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6r3vps70y95DOO40Zgy0GYXIU4qT4CUuuWZlwpeTrxk=;
 b=MAiihpnrZywQcN1WsAR1Kba5mxkbxze9anVYfGEKPBAl9HKGLQQ3lGQ+N/lF5nMJ2F5ZvsdBW1wt1DEnJHgFhvzMsPdEEk2yCcutDvLqpivmhbHU2qjirPuafB96B58iCwvTOmnhEV4Cgzwrtd3LVxnz3q85lu+hwkWcYgFhvT4GjIbQmBBvpM9CAUWdOYDZzhQ3ODzJwSL6I4R4WtGL3yHV6rFCQFaY3O6mDIQ/yX1SpIu2VRh/la5p3fWIcSD7jfzR7OYNxuYRJcK2e8QkwJAr0Xtl3/kI6Md+T0auF+z7UDYVfwvycFIC9gVWfSZsaqsvn9x4uufaZWJz7R0xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Tue, 30 Jan
 2024 06:23:01 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 06:23:01 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Paul Cercueil <paul@crapouillou.net>
Subject: RE: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Thread-Topic: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Thread-Index: AQHaTklVj+JfGoUYak+H25iUh1Y+RrDpk0JggAEbQoCAACQu4IABjkAAgAWGRCA=
Date: Tue, 30 Jan 2024 06:23:01 +0000
Message-ID: <IA0PR11MB71852491FCE05AF73C83A5D7F87D2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240123221227.868341-1-afd@ti.com>
 <20240123221227.868341-2-afd@ti.com>
 <IA0PR11MB7185DDD7A972ED546B4CEA10F87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <7872f641-8a72-424f-b345-99c27403d7c6@ti.com>
 <IA0PR11MB7185C799B08748C87F215434F8792@IA0PR11MB7185.namprd11.prod.outlook.com>
 <1fb28a2f-8f42-42b4-9019-d0fc670c291c@ti.com>
In-Reply-To: <1fb28a2f-8f42-42b4-9019-d0fc670c291c@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH3PR11MB8561:EE_
x-ms-office365-filtering-correlation-id: 954fb925-c16e-40e8-5bc2-08dc215be8d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VJeYKpUJQ0fEvFidRXVkuzXs6XEfMI8pLz3Gec2Wj6Z5QmmRk74UQ7Nkh2mQrZ/Ljkw1nbvXpiXCC+xWm5H8iyCJUNASBfxf0Q5U2m/tzk5PAk1q4cff3Ec7lQlwMAZk0cKcI7WjebZVmINqwl/37iIf0DULj7YbxL19AnpApJInbEWgDXa95ZmWY3gp9WdiWUriSwBBejbXS5/TT7+jIqjI2GUVz0QtQjLsDBYseh/INoUhRTxZLCbmSXMKvlrWiqhGFo/K57DGqoqsT1vhRGkj86KWkgaJWovoUY9OARCLNfJ3dwoR8bmj9Wv367I1Qhwr+e8sN17Rg+dRD8crxNAWK9Z28EdL0ekZhIw/ZK3DDOFa/Rj1W1w81K26rerDmIutJf5r+5Q80sDUSO+2TEjvr31uDzf2MAABgaacsCJk78AC5fXSCW6qdrPL118ol6uzlFXhPmigup34tiHdoCFQk3uDhhRj7FBsTL6UnYbjz7rwQmRG/1Lt7pN667F7OSh29DYQV+H2wO7XYrvlWP+4NjOdXdXxhBSfh66WXQwE+54UR5MQ/FsmOpw+ZKaRNYdB47QcVFtOj1//nZYOdJum3BMwe3Ule1znFS2QW1WEOZaI2alh0AbH2guq6b7NSD6BmbQWE7XvjPJX4dylQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(366004)(346002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(38070700009)(41300700001)(2906002)(5660300002)(33656002)(66476007)(6506007)(66946007)(64756008)(66556008)(66446008)(54906003)(76116006)(110136005)(86362001)(83380400001)(316002)(9686003)(26005)(55016003)(966005)(53546011)(478600001)(7696005)(71200400001)(82960400001)(4326008)(8676002)(52536014)(122000001)(38100700002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGZyNk9GM21YVzNob0NFQWNUV3hNV3RvekFTaWhZQ0ZvL05zc3VXN09EZHVr?=
 =?utf-8?B?ZCthTEpUc1d2YWljVDR5TEMrM2RBaG8xZHB3WHgwSk1PRDJHRk80dC92TmNL?=
 =?utf-8?B?UFQzazRwRVFUc0RvUHI1NXJzMWNjakNqKzJrdUY1dEZEdXdOYSt6WTA5V0Jv?=
 =?utf-8?B?QWNuTllzVHBSaTJQa0lPOE1icksvcHJ6WFdHbTZhUzZHUDNEbENNWVFxd2s1?=
 =?utf-8?B?ZDM1bXJGdmVvcEhFWk9ydWFhaXlVa0VCeVduYTdsK3pyU1Y5Q2YyOW1kVmlq?=
 =?utf-8?B?RFBRWXpybUttRllhL2tLZk9RRWMrc2ZPYjFsbTY0c3FlazJITUNYYmprV2tE?=
 =?utf-8?B?SmhNSFNPb1Q5YWJJZ2NNZXZoVWNqRnBkUzlSdU9xWVNGeEM2MU51MXRUMXV2?=
 =?utf-8?B?dFdzNWpBVzFZZlloUis1dDI1dlNXT0xEVmVhakdlRFN2NitZcUZtbmcyU3Vp?=
 =?utf-8?B?ekFCODVJZENRbUZ6NDU5ekpVWDhTU0t2QTg5RENRRUg5ZEhHR3VHVHpkcW1D?=
 =?utf-8?B?SkhkcGEvcWRmdUp1OTJ2Ti9qVU5lZTh1TXpZcTBBaitlUzZoeVBoMHlOdy9L?=
 =?utf-8?B?c2xXZXpkNXozUERzUmU1eGg1YmJzalEvSHRRVFFCR01Db3VOYVBWNno2TTZx?=
 =?utf-8?B?VGxsV2lMRm9jRStVdlZNWkpwQXRqRHFHOEtZWGVJQ2VuOFNRTGM2SlNQWTlE?=
 =?utf-8?B?bE1ONDZEei9lQzAxWlhxV25nQ1VhL0RsUXluM3MxK3k5U2NLSlBvR09NNVRP?=
 =?utf-8?B?eEtQOGFpUmZ6U3FCMjE1SW00T29MWStuUXRwemFIY1V4MFUzMGU5UlIwSkR5?=
 =?utf-8?B?amYxclcyNGpudWVYMFd4dmdCYitIOWhtTXdIaWw3NjVtSk56c05zNzZzbTk1?=
 =?utf-8?B?aFJuZ3lqQWQvR0lpdHpwWEZ4S0lvOExTZlQ5aDM2WUF4RHNZTDBkWlF6aGZB?=
 =?utf-8?B?VTFyQnJXYi9VS292MkJtVkZxc0dKdUgvZUZYMStaYnRuOFRMcUpzZ2hpY3A2?=
 =?utf-8?B?Qjhpa2w2cmM2TzR4OXZWdWhtc2t0cWczVy9WemZjQjFEV0pkWTdnMElFaWlo?=
 =?utf-8?B?WEJ3M0t5QzV0c2JTNFpTdzlkSU94S3lTL1A4aUt5Y3JvMWNkS2RkRmNqVWNy?=
 =?utf-8?B?dUZRMDM2a3Q2ZEFGWDNWNE5YMzN1S0ZrZDcrL1VKQ1JJY0s2VW5tTVZTVDJV?=
 =?utf-8?B?ekZyVW52QUoxMzdPK3kxdE8xWEtWMk5wbTFncUVNU01ybHRKbkg4ZmlXOW12?=
 =?utf-8?B?RDRGdWpKemhVNEZ1VDZUV3NxL1N1Q1Z1QTJlT3A5Nlg1dnJNMzNLQmQ0RzIv?=
 =?utf-8?B?U3N1OTlMY0R2UlVEYTdFZlN2YXFyd3lSUVVaa1V6TTNUNlVlaVNia2wvbm9P?=
 =?utf-8?B?YllmNHFaYlREU1Q0Q3cwZUlleXBDbGFibk9kcDhMaUl2VFBiMUsyeXdXU29y?=
 =?utf-8?B?NEtBTmh0THhnRmlaeWkwY1ZSaWVlUU9DRVRZTnJKZWJXSldSZFJVZ282RTh1?=
 =?utf-8?B?Y1JnUVFPdTdsUHlWNXkvZEpjQ0VHWi96YkU4MVpDc09nSG43c2k1QTBPZXgr?=
 =?utf-8?B?SkZvQS9RbU5CRXI1OElCRUU4R1l4VTNOdjlWeEFyNWV0VWNFeFFrczZ6U2hm?=
 =?utf-8?B?T0hzMWlyZW5Ua1BBdDVpV0o5K01Icno4WENySGNkRkJYYTBvcXhSdTg4REFa?=
 =?utf-8?B?QnRnZm4wQW9aOGxsZ1lmRjN2Z3E5RHFUTU02aHF3UjJEa2Yyek9PMm1CcUIv?=
 =?utf-8?B?QkxvRFBEc25YaWFOVkZQZXhVT1NwQmw0Zmo5ZHB0Y0ZjWTJjVUFXaDlqOEpn?=
 =?utf-8?B?R1l1K0dTT3pySU5vVENzRlBLeWxTYitVczNvZksvaVJPb2M4c0JTeWxJVXhD?=
 =?utf-8?B?Und2bDJIV0VMR3RBQjBmSktqQkVic3JzUENwa0hqamdrVkwzQ2FTM08vdnVp?=
 =?utf-8?B?S3M2UFAvVThCZHdEdVMxL3UwWUJxbzlzZlpiSmtUWW5pb2FpWUZoOFBzYmpK?=
 =?utf-8?B?aFNVUGIyTEtWajlZMTZNVHpKaEhEZmRnbjlOVndKdG5GNHkxWlhvNnBNSXdW?=
 =?utf-8?B?eXpKdHJBQm1mMnROcmpneHo4NjJ0YzRLcktoVFBUUW5VUW9zT0hGVmZPbXBQ?=
 =?utf-8?Q?uIV+KzY5+EOvZcD066mdH+E5m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954fb925-c16e-40e8-5bc2-08dc215be8d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 06:23:01.1838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ICkDdi3k1mYB/gEUarYfjsYh3E3QqEHYf2OAPoKq94mQfqC0wty+XYZu2BXLQ2pnr/+BLszOR/xL9dUIYqGP8Qgj/G+WQ9aOMatGUJImJ8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV3LA0KDQo+IA0KPiBPbiAxLzI2LzI0IDE6MjUgQU0sIEthc2lyZWRkeSwgVml2ZWsg
d3JvdGU6DQo+ID4+Pj4gQ3VycmVudGx5IHRoaXMgZHJpdmVyIGNyZWF0ZXMgYSBTR1QgdGFibGUg
dXNpbmcgdGhlIENQVSBhcyB0aGUNCj4gPj4+PiB0YXJnZXQgZGV2aWNlLCB0aGVuIHBlcmZvcm1z
IHRoZSBkbWFfc3luYyBvcGVyYXRpb25zIGFnYWluc3QNCj4gPj4+PiB0aGF0IFNHVC4gVGhpcyBp
cyBiYWNrd2FyZHMgdG8gaG93IERNQS1CVUZzIGFyZSBzdXBwb3NlZCB0byBiZWhhdmUuDQo+ID4+
Pj4gVGhpcyBtYXkgaGF2ZSB3b3JrZWQgZm9yIHRoZSBjYXNlIHdoZXJlIHRoZXNlIGJ1ZmZlcnMg
d2VyZSBnaXZlbg0KPiA+Pj4+IG9ubHkgYmFjayB0byB0aGUgc2FtZSBDUFUgdGhhdCBwcm9kdWNl
ZCB0aGVtIGFzIGluIHRoZSBRRU1VIGNhc2UuDQo+ID4+Pj4gQW5kIG9ubHkgdGhlbiBiZWNhdXNl
IHRoZSBvcmlnaW5hbCBhdXRob3IgaGFkIHRoZSBkbWFfc3luYw0KPiA+Pj4+IG9wZXJhdGlvbnMg
YWxzbyBiYWNrd2FyZHMsIHN5bmNpbmcgZm9yIHRoZSAiZGV2aWNlIiBvbiBiZWdpbl9jcHUuDQo+
ID4+Pj4gVGhpcyB3YXMgbm90aWNlZCBhbmQgImZpeGVkIiBpbiB0aGlzIHBhdGNoWzBdLg0KPiA+
Pj4+DQo+ID4+Pj4gVGhhdCB0aGVuIG1lYW50IHdlIHdlcmUgc3luYydpbmcgZnJvbSB0aGUgQ1BV
IHRvIHRoZSBDUFUgdXNpbmcNCj4gPj4+PiBhIHBzZXVkby1kZXZpY2UgIm1pc2NkZXZpY2UiLiBX
aGljaCB0aGVuIGNhdXNlZCBhbm90aGVyIGlzc3VlDQo+ID4+Pj4gZHVlIHRvIHRoZSBtaXNjZGV2
aWNlIG5vdCBoYXZpbmcgYSBwcm9wZXIgRE1BIG1hc2sgKGFuZCB3aHkgc2hvdWxkDQo+ID4+Pj4g
aXQsIHRoZSBDUFUgaXMgbm90IGEgRE1BIGRldmljZSkuIFRoZSBmaXggZm9yIHRoYXQgd2FzIGFu
IGV2ZW4NCj4gPj4+PiBtb3JlIGVncmVnaW91cyBoYWNrWzFdIHRoYXQgZGVjbGFyZXMgdGhlIENQ
VSBpcyBjb2hlcmVudCB3aXRoDQo+ID4+Pj4gaXRzZWxmIGFuZCBjYW4gYWNjZXNzIGl0cyBvd24g
bWVtb3J5IHNwYWNlLi4NCj4gPj4+Pg0KPiA+Pj4+IFVud2luZCBhbGwgdGhpcyBhbmQgcGVyZm9y
bSB0aGUgY29ycmVjdCBhY3Rpb24gYnkgZG9pbmcgdGhlIGRtYV9zeW5jDQo+ID4+Pj4gb3BlcmF0
aW9ucyBmb3IgZWFjaCBkZXZpY2UgY3VycmVudGx5IGF0dGFjaGVkIHRvIHRoZSBiYWNraW5nIGJ1
ZmZlci4NCj4gPj4+IE1ha2VzIHNlbnNlLg0KPiA+Pj4NCj4gPj4+Pg0KPiA+Pj4+IFswXSBjb21t
aXQgMWZmZTA5NTkwMTIxICgidWRtYWJ1ZjogZml4IGRtYS1idWYgY3B1IGFjY2VzcyIpDQo+ID4+
Pj4gWzFdIGNvbW1pdCA5ZTlmYTZhOTE5OGIgKCJ1ZG1hYnVmOiBTZXQgdGhlIERNQSBtYXNrIGZv
ciB0aGUNCj4gdWRtYWJ1Zg0KPiA+Pj4+IGRldmljZSAodjIpIikNCj4gPj4+Pg0KPiA+Pj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+
PiAgICBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIHwgNDEgKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ID4+Pj4g
aW5kZXggM2EyM2YwYTdkMTEyYS4uYWI2NzY0MzIyNTIzYyAxMDA2NDQNCj4gPj4+PiAtLS0gYS9k
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL3Vk
bWFidWYuYw0KPiA+Pj4+IEBAIC0yNiw4ICsyNiw2IEBAIE1PRFVMRV9QQVJNX0RFU0Moc2l6ZV9s
aW1pdF9tYiwgIk1heCBzaXplDQo+IG9mIGENCj4gPj4+PiBkbWFidWYsIGluIG1lZ2FieXRlcy4g
RGVmYXVsdCBpcw0KPiA+Pj4+ICAgIHN0cnVjdCB1ZG1hYnVmIHsNCj4gPj4+PiAgICAJcGdvZmZf
dCBwYWdlY291bnQ7DQo+ID4+Pj4gICAgCXN0cnVjdCBwYWdlICoqcGFnZXM7DQo+ID4+Pj4gLQlz
dHJ1Y3Qgc2dfdGFibGUgKnNnOw0KPiA+Pj4+IC0Jc3RydWN0IG1pc2NkZXZpY2UgKmRldmljZTsN
Cj4gPj4+PiAgICAJc3RydWN0IGxpc3RfaGVhZCBhdHRhY2htZW50czsNCj4gPj4+PiAgICAJc3Ry
dWN0IG11dGV4IGxvY2s7DQo+ID4+Pj4gICAgfTsNCj4gPj4+PiBAQCAtMTY5LDEyICsxNjcsOCBA
QCBzdGF0aWMgdm9pZCB1bm1hcF91ZG1hYnVmKHN0cnVjdA0KPiA+Pj4+IGRtYV9idWZfYXR0YWNo
bWVudCAqYXQsDQo+ID4+Pj4gICAgc3RhdGljIHZvaWQgcmVsZWFzZV91ZG1hYnVmKHN0cnVjdCBk
bWFfYnVmICpidWYpDQo+ID4+Pj4gICAgew0KPiA+Pj4+ICAgIAlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1
ZiA9IGJ1Zi0+cHJpdjsNCj4gPj4+PiAtCXN0cnVjdCBkZXZpY2UgKmRldiA9IHVidWYtPmRldmlj
ZS0+dGhpc19kZXZpY2U7DQo+ID4+Pj4gICAgCXBnb2ZmX3QgcGc7DQo+ID4+Pj4NCj4gPj4+PiAt
CWlmICh1YnVmLT5zZykNCj4gPj4+PiAtCQlwdXRfc2dfdGFibGUoZGV2LCB1YnVmLT5zZywgRE1B
X0JJRElSRUNUSU9OQUwpOw0KPiA+Pj4gV2hhdCBoYXBwZW5zIGlmIHRoZSBsYXN0IGltcG9ydGVy
IG1hcHMgdGhlIGRtYWJ1ZiBidXQgZXJyb25lb3VzbHkNCj4gPj4+IGNsb3NlcyBpdCBpbW1lZGlh
dGVseT8gV291bGQgdW5tYXAgc29tZWhvdyBnZXQgY2FsbGVkIGluIHRoaXMgY2FzZT8NCj4gPj4+
DQo+ID4+DQo+ID4+IEdvb2QgcXVlc3Rpb24sIGhhZCB0byBzY2FuIHRoZSBmcmFtZXdvcmsgY29k
ZSBhIGJpdCBoZXJlLiBJIHRob3VnaHQNCj4gPj4gY2xvc2luZyBhIERNQUJVRiBoYW5kbGUgd291
bGQgYXV0b21hdGljYWxseSB1bndpbmQgYW55IGN1cnJlbnQNCj4gPj4gYXR0YWNobWVudHMvbWFw
cGluZ3MsIGJ1dCBpdCBzZWVtcyBub3RoaW5nIGluIHRoZSBmcmFtZXdvcmsgZG9lcyB0aGF0Lg0K
PiA+Pg0KPiA+PiBMb29rcyBsaWtlIHRoYXQgaXMgdXAgdG8gdGhlIGltcG9ydGluZyBkcml2ZXJz
WzBdOg0KPiA+Pg0KPiA+Pj4gT25jZSBhIGRyaXZlciBpcyBkb25lIHdpdGggYSBzaGFyZWQgYnVm
ZmVyIGl0IG5lZWRzIHRvIGNhbGwNCj4gPj4+IGRtYV9idWZfZGV0YWNoKCkgKGFmdGVyIGNsZWFu
aW5nIHVwIGFueSBtYXBwaW5ncykgYW5kIHRoZW4NCj4gPj4+IHJlbGVhc2UgdGhlIHJlZmVyZW5j
ZSBhY3F1aXJlZCB3aXRoIGRtYV9idWZfZ2V0KCkgYnkNCj4gPj4+IGNhbGxpbmcgZG1hX2J1Zl9w
dXQoKS4NCj4gPj4NCj4gPj4gU28gY2xvc2luZyBhIERNQUJVRiBhZnRlciBtYXBwaW5nIHdpdGhv
dXQgZmlyc3QgdW5tYXBwaW5nIGl0IHdvdWxkDQo+ID4+IGJlIGEgYnVnIGluIHRoZSBpbXBvcnRl
ciwgaXQgaXMgbm90IHRoZSBleHBvcnRlcnMgcHJvYmxlbSB0byBjaGVjaw0KPiA+IEl0IG1heSBi
ZSBhIGJ1ZyBpbiB0aGUgaW1wb3J0ZXIgYnV0IHdvdWxkbid0IHRoZSBtZW1vcnkgYXNzb2NpYXRl
ZA0KPiA+IHdpdGggdGhlIHNnIHRhYmxlIGFuZCBhdHRhY2htZW50IGdldCBsZWFrZWQgaWYgdW5t
YXAgZG9lc24ndCBnZXQgY2FsbGVkDQo+ID4gaW4gdGhpcyBzY2VuYXJpbz8NCj4gPg0KPiANCj4g
WWVzIHRoZSBhdHRhY2htZW50IGRhdGEgd291bGQgYmUgbGVha2VkIGlmIHVuYXR0YWNoIHdhcyBu
b3QgY2FsbGVkLA0KPiBidXQgdGhhdCBpcyB0cnVlIGZvciBhbGwgRE1BQlVGIGV4cG9ydGVycy4g
VGhlIC5yZWxlYXNlKCkgY2FsbGJhY2sNCj4gaXMgbWVhbnQgdG8gYmUgdGhlIG1pcnJvciBvZiB0
aGUgZXhwb3J0IGZ1bmN0aW9uIGFuZCBpdCBvbmx5IGNsZWFucw0KPiB1cCB0aGF0LiBTYW1lIGZv
ciBhdHRhY2gvdW5hdHRhY2gsIG1hcC91bm1hcCwgZXRjLi4gSWYgdGhlc2UgY2FsbHMNCj4gYXJl
IG5vdCBiYWxhbmNlZCB0aGVuIHllcyB0aGV5IGNhbiBsZWFrIG1lbW9yeS4NCj4gDQo+IFNpbmNl
IGJhbGFuY2UgaXMgZ3VhcmFudGVlZCBieSB0aGUgQVBJLCBjaGVja2luZyB0aGUgYmFsYW5jZSBz
aG91bGQNCj4gYmUgZG9uZSBhdCB0aGF0IGxldmVsLCBub3QgaW4gZWFjaCBhbmQgZXZlcnkgZXhw
b3J0ZXIuIElmIHlvdXINCj4gY29tbWVudCBpcyB0aGF0IHdlIHNob3VsZCBhZGQgdGhvc2UgY2hl
Y2tzIGludG8gdGhlIERNQUJVRiBmcmFtZXdvcmsNCj4gbGF5ZXIgdGhlbiBJIHdvdWxkIGFncmVl
Lg0KWWVhaCwgdG8gYXZvaWQgbGVha2luZyBtZW1vcnksIGl0IHdvdWxkIGJlIGV2ZW4gYmV0dGVy
IGlmIHRoZSBmcmFtZXdvcmsNCmNhbiBjYWxsIHVubWFwIHdoZW4gdGhlIGltcG9ydGVyIGZhaWxz
IHRvIGRvIHNvLiBOb3Qgc3VyZSBpZiB0aGlzIGlzIGVhc2llcg0Kc2FpZCB0aGFuIGRvbmUuIA0K
DQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBBbmRyZXcNCj4gDQo+ID4gVGhhbmtzLA0KPiA+IFZp
dmVrDQo+ID4NCj4gPj4gZm9yIChhbHRob3VnaCBzb21lIG1vcmUgd2FybmluZ3MgaW4gdGhlIGZy
YW1ld29yayBjaGVja2luZyBmb3IgdGhhdA0KPiA+PiBtaWdodCBub3QgYmUgYSBiYWQgaWRlYS4u
KS4NCj4gPj4NCj4gPj4gQW5kcmV3DQo+ID4+DQo+ID4+IFswXSBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9odG1sL3Y2LjcvZHJpdmVyLWFwaS9kbWEtYnVmLmh0bWwNCj4gPj4NCj4gPj4+IFRo
YW5rcywNCj4gPj4+IFZpdmVrDQo+ID4+Pg0KPiA+Pj4+IC0NCj4gPj4+PiAgICAJZm9yIChwZyA9
IDA7IHBnIDwgdWJ1Zi0+cGFnZWNvdW50OyBwZysrKQ0KPiA+Pj4+ICAgIAkJcHV0X3BhZ2UodWJ1
Zi0+cGFnZXNbcGddKTsNCj4gPj4+PiAgICAJa2ZyZWUodWJ1Zi0+cGFnZXMpOw0KPiA+Pj4+IEBA
IC0xODUsMzMgKzE3OSwzMSBAQCBzdGF0aWMgaW50IGJlZ2luX2NwdV91ZG1hYnVmKHN0cnVjdA0K
PiBkbWFfYnVmDQo+ID4+Pj4gKmJ1ZiwNCj4gPj4+PiAgICAJCQkgICAgIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpcmVjdGlvbikNCj4gPj4+PiAgICB7DQo+ID4+Pj4gICAgCXN0cnVjdCB1ZG1h
YnVmICp1YnVmID0gYnVmLT5wcml2Ow0KPiA+Pj4+IC0Jc3RydWN0IGRldmljZSAqZGV2ID0gdWJ1
Zi0+ZGV2aWNlLT50aGlzX2RldmljZTsNCj4gPj4+PiAtCWludCByZXQgPSAwOw0KPiA+Pj4+IC0N
Cj4gPj4+PiAtCWlmICghdWJ1Zi0+c2cpIHsNCj4gPj4+PiAtCQl1YnVmLT5zZyA9IGdldF9zZ190
YWJsZShkZXYsIGJ1ZiwgZGlyZWN0aW9uKTsNCj4gPj4+PiAtCQlpZiAoSVNfRVJSKHVidWYtPnNn
KSkgew0KPiA+Pj4+IC0JCQlyZXQgPSBQVFJfRVJSKHVidWYtPnNnKTsNCj4gPj4+PiAtCQkJdWJ1
Zi0+c2cgPSBOVUxMOw0KPiA+Pj4+IC0JCX0NCj4gPj4+PiAtCX0gZWxzZSB7DQo+ID4+Pj4gLQkJ
ZG1hX3N5bmNfc2dfZm9yX2NwdShkZXYsIHVidWYtPnNnLT5zZ2wsIHVidWYtPnNnLT5uZW50cywN
Cj4gPj4+PiAtCQkJCSAgICBkaXJlY3Rpb24pOw0KPiA+Pj4+IC0JfQ0KPiA+Pj4+ICsJc3RydWN0
IHVkbWFidWZfYXR0YWNobWVudCAqYTsNCj4gPj4+Pg0KPiA+Pj4+IC0JcmV0dXJuIHJldDsNCj4g
Pj4+PiArCW11dGV4X2xvY2soJnVidWYtPmxvY2spOw0KPiA+Pj4+ICsNCj4gPj4+PiArCWxpc3Rf
Zm9yX2VhY2hfZW50cnkoYSwgJnVidWYtPmF0dGFjaG1lbnRzLCBsaXN0KQ0KPiA+Pj4+ICsJCWRt
YV9zeW5jX3NndGFibGVfZm9yX2NwdShhLT5kZXYsIGEtPnRhYmxlLCBkaXJlY3Rpb24pOw0KPiA+
Pj4+ICsNCj4gPj4+PiArCW11dGV4X3VubG9jaygmdWJ1Zi0+bG9jayk7DQo+ID4+Pj4gKw0KPiA+
Pj4+ICsJcmV0dXJuIDA7DQo+ID4+Pj4gICAgfQ0KPiA+Pj4+DQo+ID4+Pj4gICAgc3RhdGljIGlu
dCBlbmRfY3B1X3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwNCj4gPj4+PiAgICAJCQkgICBl
bnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pDQo+ID4+Pj4gICAgew0KPiA+Pj4+ICAg
IAlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGJ1Zi0+cHJpdjsNCj4gPj4+PiAtCXN0cnVjdCBkZXZp
Y2UgKmRldiA9IHVidWYtPmRldmljZS0+dGhpc19kZXZpY2U7DQo+ID4+Pj4gKwlzdHJ1Y3QgdWRt
YWJ1Zl9hdHRhY2htZW50ICphOw0KPiA+Pj4+DQo+ID4+Pj4gLQlpZiAoIXVidWYtPnNnKQ0KPiA+
Pj4+IC0JCXJldHVybiAtRUlOVkFMOw0KPiA+Pj4+ICsJbXV0ZXhfbG9jaygmdWJ1Zi0+bG9jayk7
DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShhLCAmdWJ1Zi0+YXR0YWNo
bWVudHMsIGxpc3QpDQo+ID4+Pj4gKwkJZG1hX3N5bmNfc2d0YWJsZV9mb3JfZGV2aWNlKGEtPmRl
diwgYS0+dGFibGUsIGRpcmVjdGlvbik7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJbXV0ZXhfdW5sb2Nr
KCZ1YnVmLT5sb2NrKTsNCj4gPj4+Pg0KPiA+Pj4+IC0JZG1hX3N5bmNfc2dfZm9yX2RldmljZShk
ZXYsIHVidWYtPnNnLT5zZ2wsIHVidWYtPnNnLT5uZW50cywNCj4gPj4+PiBkaXJlY3Rpb24pOw0K
PiA+Pj4+ICAgIAlyZXR1cm4gMDsNCj4gPj4+PiAgICB9DQo+ID4+Pj4NCj4gPj4+PiBAQCAtMzA3
LDcgKzI5OSw2IEBAIHN0YXRpYyBsb25nIHVkbWFidWZfY3JlYXRlKHN0cnVjdCBtaXNjZGV2aWNl
DQo+ID4+Pj4gKmRldmljZSwNCj4gPj4+PiAgICAJZXhwX2luZm8ucHJpdiA9IHVidWY7DQo+ID4+
Pj4gICAgCWV4cF9pbmZvLmZsYWdzID0gT19SRFdSOw0KPiA+Pj4+DQo+ID4+Pj4gLQl1YnVmLT5k
ZXZpY2UgPSBkZXZpY2U7DQo+ID4+Pj4gICAgCWJ1ZiA9IGRtYV9idWZfZXhwb3J0KCZleHBfaW5m
byk7DQo+ID4+Pj4gICAgCWlmIChJU19FUlIoYnVmKSkgew0KPiA+Pj4+ICAgIAkJcmV0ID0gUFRS
X0VSUihidWYpOw0KPiA+Pj4+IC0tDQo+ID4+Pj4gMi4zOS4yDQo+ID4+Pg0K
