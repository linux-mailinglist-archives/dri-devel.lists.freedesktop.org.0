Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF556EE782
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 20:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4C10E040;
	Tue, 25 Apr 2023 18:28:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77E610E040;
 Tue, 25 Apr 2023 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682447325; x=1713983325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0jQN9uilWHylPCApLHi+PeTsBra0Abuzs8YB5xROgDw=;
 b=lH3ZuwAk357povkiSLEIkyLmVR+wAFaWHpDQB+sCokeF5CP9nx6F4FFR
 zcHuDXGrZQFl470OBW7UJzMyT7OquPUdT4Ts0VXfrDYR64pZASl5Vtc+g
 80bApaZw7o886FZtu3dszNayPzAi1KohOvl5bKqZiiQrC8MxJaff6YcV0
 YanlUn1PQDxshAndZDw6CRhv5L3aYT6NLSZKpY+Hr2pyrTF6vT1w2PWEO
 S3YeK0mQqDwWTUf0CY411sKJFo/3yl0jRe99XLRnaozvZnUGX0b5LCPmM
 LntWnHFfFvYHjJ4sZFpQ/zRp6X7lx4TxVe0DcE3Qu2c3y2ZyGa3WXHSei w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="348788283"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="348788283"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="758259384"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="758259384"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 11:28:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 11:28:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 11:28:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 11:28:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 11:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZN8gFjficlAJumzOSdlQeHiuo/f7nCQBzRcO1Yl9r3crMS5fstj77ctDmIKNWth/8ykVtxOU7TYp2fc/AB49a7ud+O4/bh17ANb2IvvvedYirlLxF5qbBUUsy2EL9r5MyXb+cZmoVOPM6Y+twVzAlejz06nUq/PW1kYkqCol3IGVUwHSEMeEH/KzDapNeZNIHhVvcuPvZIQGCFpQb8jjwUqgRWRLEpRLG1ljNoFTCOWCR8rR80+RPfcRda7lxTuxO0JWaPhTVV3UD52KsuEJKuDCuMsL+8heIAZcb/uTB9aVfUjpmIuZMq+1insRYQ7aPAHn79mqayb48tZ6F3UPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jQN9uilWHylPCApLHi+PeTsBra0Abuzs8YB5xROgDw=;
 b=ecS2rp6LVtGJcv4uh2RNZTbQzi1yGNCEYe2na0ERjwjq1Sw4RU3kFD8E3O0NZuHlRwXOsidEC70hFkuQmUdaoB9RTS3QG3j4yUNd1JFHh23uZOdmprG1pFbgocwqdFILP03rCoS4rf7Sk4akQHIlehtHI21jW7fU+WGQPwM+5R045Xw9I38IwklG3E/oz+K4otcaUKLvksfYfT8fwqV02SGTLGRwcmNhfDhepTOgx/EE0q+yDap/qqbQtfed0h3JFtSFf2wrG+fgCIeEWJJPCbBOL4vspKHc52NSBQPvOUs1YpzUgv28OKFE9k0xji9+nWQ1pr2fC/sAbfAFUmpasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB7998.namprd11.prod.outlook.com (2603:10b6:8:126::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Tue, 25 Apr 2023 18:28:41 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 18:28:41 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915/guc: Capture list clean up - 1
Thread-Topic: [Intel-gfx] [PATCH 2/5] drm/i915/guc: Capture list clean up - 1
Thread-Index: AQHZaNbtpNV9pQu6fE+PYHGdDtY41688ddSA
Date: Tue, 25 Apr 2023 18:28:41 +0000
Message-ID: <e0583b49f3dea48edc40daafea1ac03b92eab88b.camel@intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-3-John.C.Harrison@Intel.com>
In-Reply-To: <20230406222617.790484-3-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB7998:EE_
x-ms-office365-filtering-correlation-id: c72f3281-b363-4aea-4864-08db45bae514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: weN6T6+5FRNbvAJFrFIz4wGBbzdnzYFzW9f8z3igsFef9/KyRKJA0UqtWkkR9q0vZs6dfPshG4KxRjgnIoOsg1RnJ7bDPF3wEv9DTaZZNS0xuPWHyqfwKbW9JssQvhDFuDJ2AFspyrMl4A0btCvYQ80qsyI36FyRsV8FR5wwQ+FnHBIOzyFBdEIKA4bDZgwue2v7wXcwz4QRr6MDM43aD9hov7gFnPrU//i7FWuuXZDwUo9JKXtWLlbJIgQqSad62BuMiCRr0CB468W6kZxDJrGvte7aydJ/WTYquhERqtqFYO8uH25dK566TO/xCL1KXDJKsMPt4ptNDvCyX5En2Kb7nJ+NjUXLP9FWDPR4oA1srf3M62qeMG7yYC6TZhvdANfA1cAtNRjXgHT/teMsPJVWYK3kuoqdc+PcqJMIV5JsrDjwbM6fir3dbrTy1k1dut8g1h6K65MSo9BQq9HTOIhrEgMyumOswlNRiEad7srCHoKueCANh2mznDu3FtaZ7vtASbECOeNSGFUPLaNL0qeiigluFaMBy6RzL8mZ4mlQbO+Q7/saNsg8YuvLnmBHGOtwWlHWn4CcQhG5MMIe7mrZmurSxQnhAmDPAWIvb1pGB+ntmfKe/Dqu7ikCW8Ls
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199021)(76116006)(91956017)(66946007)(4744005)(2906002)(450100002)(6506007)(6512007)(26005)(316002)(64756008)(66556008)(82960400001)(66476007)(66446008)(71200400001)(4326008)(2616005)(8676002)(122000001)(38100700002)(41300700001)(5660300002)(8936002)(38070700005)(110136005)(86362001)(478600001)(36756003)(186003)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnI0Y29LNDluZU9GajdUajZLU1ZFek4zYzB1WXdEOUxQeUtienE5em8zRVlL?=
 =?utf-8?B?ekZrTlZFTGRYd0g5Rm5MOGFXWEZNbjFFRmRqM3BIa3Z0K1p3anR6Tmg0cDg1?=
 =?utf-8?B?Z21Sb3g1RkNHdnNpYWNHNjlHa3NHZmhDYXIvV3JqSjJESjEybUpKT0tyVEpE?=
 =?utf-8?B?WlE1TDJTK2c0aFRHcHIyTVJYejVXUXp3OHBWWmJnTTZGNCtVUmg1ZGVCQ1BD?=
 =?utf-8?B?dFhtR3pyRUZJRTA0ZlZIYnNYSE8yQzI3VzN0M1lBZXpEeWtrOTBiN1JLa1g5?=
 =?utf-8?B?azhGTGJORW5BR0p3UlJXNG9NZXp4V1AzTERIS2c4dHp2cWNKQ3dtUWltMnlh?=
 =?utf-8?B?OVVGK3J1SjBWZklDMThGOUxQUkRKWEsvRVUxWVBqc1VXS3JTOUJzbmFmcWVq?=
 =?utf-8?B?N2Q2WW1xTDg2alY2MlB5YXNCUjNMbkJ6VzNVNElxcTVKanJVdi83c1RaV0ZZ?=
 =?utf-8?B?TUJZOW1RN2xRYUNGbVdYTHFzcXg4aUFYdGNlSTR0T1ppWG5NUFcveFJDazEy?=
 =?utf-8?B?RXFoZnZPVFJlQm9ZQzFxeEc5U3ZTWk5YZWpITEU4V2d1NTlPVGJPTkRNVzJv?=
 =?utf-8?B?bTdIZFYrdDJzQ1AwN2laWktsTWdWbGdnR3gvVy9JaStlSHRseStLMzZTdFdO?=
 =?utf-8?B?aGRHMHI3em1ody8rbmZXdkxkQU5lbWNJMlVoa2NEb3FBb1N3NW5peTRaZFZD?=
 =?utf-8?B?OHBFVFM2WVlEUllsTVVNeUZKWjFJUDVXMUN5RzFLY2VubE9TVW95b0RqZUR5?=
 =?utf-8?B?ai9mcjFaN2kyNnIzQmNzYzFvUG1KamZIczJDTnRqSWJ1eENtb2t1SHcxUzhw?=
 =?utf-8?B?MDNZRmwrQThkY1htdTEzTlJSbFBYai92OXRQS21SVGhJeWZyWWVqd3pFUW9x?=
 =?utf-8?B?cFVuR3lvNDBWZWxqb3lsMXhPRXY2VTFCZ21neDM4OFpFaEt2SUFsWjB3SDJZ?=
 =?utf-8?B?QlkwcnhQVUh1QUorNkFxT2F5Y1RINEpLQ1ZWeFF4U2NXNnlJc3ZkM0htZkRK?=
 =?utf-8?B?VUFRNytaVnJaYVkxWGtHeHd0NWkweVdwdzA0WURHVjBMbUNraHpmS0t2cFg4?=
 =?utf-8?B?bFpTY3BOTWZBRjFYOFlkK1VRbk1nUWlZY2laK1FOaW1VUEduYTdqYTE4NDRX?=
 =?utf-8?B?T3NRd2pJRHRUckFLaTFxNGxFeFR6dEs2aS9SMDhzckdtSGl1blh6eW8zUjJt?=
 =?utf-8?B?V3pZMEEzM0hVVFB1ckdMVmhGR05sMW0zWEJrZitoSFFaY25mVXp0Y1BPaE0y?=
 =?utf-8?B?QWphUWdUODBpeStZWkRVNm80aFZTWU1iVDdWSFQycm9zSDBrK1JXQmNlcmR1?=
 =?utf-8?B?cjhyVjBjLzNWc2Rwdk9mTUFpdmVyMEtUNEVvOUtkREhuNFcxNGtCc29JaVlY?=
 =?utf-8?B?Sk1uZVB1bGMwZFozU055dmlDTDJjYk9ROXZBcEFjclZQdHB0eDhPeEQycTJI?=
 =?utf-8?B?WDNqT2JtVTVoZlFRUXpvTWd0alp3UWVHeG1KZThGSmJrbWNRU3VpbHNMNzVq?=
 =?utf-8?B?RWxmdEdua2tKb2ptZmZvOVljWnc2WDQzbnRkdFZraGNyR0ZUTi9RK2l6c3Bo?=
 =?utf-8?B?Ni9NY2xJdThyNnI1akROd2ovTnQ0Zy9YSFptRzU3bHlRRWVDQk95Mzc0ZjRX?=
 =?utf-8?B?UW5mRlZRcktPdUVIRUQ4Q3QyTCtwa2dYNHoyNXA4RXFQVThqTVdhYlpZSFhC?=
 =?utf-8?B?bDhSejBtOTNCSm1yL3UraEF1SjBteDdaNVZ1UFdQL2V4c1JrTEZEQmhTZmlF?=
 =?utf-8?B?R3pXdUpGQzYyTWtCc3Juam1nZk5iTC8zNnJuWEFGQWhCN2hCcWZUNFVQT0Fa?=
 =?utf-8?B?c2o0VjhNVVpMeXNrNW1VWlN5SlRSZkN3QW42R2xzRjBkblIxcmNNcXJHcXVs?=
 =?utf-8?B?MDY2b1dMZEFDZFI5VWFUR25RV0JtQngwd3YyWGc1QTlwamE2SGV6NkpLM2tv?=
 =?utf-8?B?dHRxL3ZIREJsbU9xMDdXL3lhUWM3NUs3c2Z1eE5TVngvaVR4R2dDUk9UOVlG?=
 =?utf-8?B?WlpJNWpHdUM4S0tqN1JxdHllWXZFY2NJQ0NvcU01VXU0aE1ocGJzYVMzTXpK?=
 =?utf-8?B?ckp6bVZSVnZrWXpoaDc1SHlJVEpWSnhTTTlBQitPQ3N2Ums2WTRzUzYyU1BS?=
 =?utf-8?B?bm9meVlvT1BKZWluZlJ4V2hmaG5RYWVSWWVXWWJLc0E1b2VsK244cTRRMUE4?=
 =?utf-8?Q?wpLGGECjG94nXukpDY9OAVg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1125D2FB450E9142B49D4019029EBB14@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72f3281-b363-4aea-4864-08db45bae514
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 18:28:41.2036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuOC5WrW2bg2mIbMFunwJAlxigfya3D606lLlv9XLmOkV+Bf03WKK4ZC/qF5hIxWpl/9VZVAzIr31EKH3X4TyG8QEWGh7gNFqfmhB+UUl5p/WHLZN6fN9vC1MRsdLzFd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7998
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTA2IGF0IDE1OjI2IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gUmVtb3ZlIDk5JSBkdXBsaWNhdGVkIHN0ZWVyZWQgcmVnaXN0ZXIgbGlzdCBj
b2RlLiBBbHNvLCBpbmNsdWRlIHRoZQ0KPiBwcmUtWGUgc3RlZXJlZCByZWdpc3RlcnMgaW4gdGhl
IHByZS1YZSBsaXN0IGdlbmVyYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJp
c29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KDQphbGFuOiBOaWNlIHdvcmsgLSBnb29k
IGNsZWFudXAuIFRoYW5rcyBzbyBtdWNoLg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFu
LnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQo=
