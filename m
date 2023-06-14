Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E0072F6E7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068CC10E40C;
	Wed, 14 Jun 2023 07:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CCB10E40C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686729117; x=1718265117;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fwoV5ppaMgyHqqJqDUARpp+ikqNuTycqg7DpFR0Tihc=;
 b=iz0WftQDBGpnbvNQMlNoO6q5vgbuMH33tLza5mK8WPQYoDTcc4BjYU+W
 WpdbgdTg4CxC4rtZRf+ToapASRr+I1HWRHdlNWqew+JQocBYDym2b5CZd
 LxzxDKsBsOCJ0MI+T1yCEdc9m6ZJU1Zn7SUJkk6WfH3hfJaCtXaX/jAK8
 FCBTx/B0yE159etFGMaKOUMhuK3UPtaDfhJpX1UQWKPChfCKunaU+dykk
 iqAVxgaIy6N+3Nh3vqvloDduzztYycBpXJ+IzVISIbfDMfgehdCIIXh0z
 cRDzXI58A3DBNnwaGJfoVaFDAAKJNeRslJQ+BeaQy+69fqUKZiTcwJyPO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386956326"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="386956326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 00:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="856409769"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="856409769"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2023 00:51:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 00:51:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 00:51:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 00:51:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 00:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qcj07TnrNOR7PJayN837XgXlV6LIpDtlZRXYbauYPqyGAAB5WMHkAI2tHi7o9Kxux+bRyvCkMcy0aCHCvHDiKVzlfD0hFF4ZGlZ1yEIbsCSw5csj6wjVQ1EYp9eEzqpf4QoJo1ZVPE1LWwuSqtBvAeROX9TCealgHgbdr55GCscaos/5hUlo/vJLp1Mdgbl4KLqfGAANO8ptsTTHNUFEvjcl989+88lAkHdugQvQMcT7VFq21XP8Z6BcpqS/vznVoG0BDkVhmTMYoJ6PXi+9ssX51YtTyJVHMPOOkwyCj+sQCrkjz1sV4giGtYZaaPcVA+9HE0YDrHAP6EVw7qdScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwoV5ppaMgyHqqJqDUARpp+ikqNuTycqg7DpFR0Tihc=;
 b=J+XrW2YP1hQ97mWRqSC/f2hQU2a4e2LrD55Cf7Iaf/LYxsfXyJ/djtcl8i84OUrwjUgOCfRNB0+BkeMoxJJSm9h+S+TfFwc7I7NrbRiBEbCm0AMnAUbUDSpSEuDVPYr3cqyLBWPJNouVVU3TUcLomJAo0lc+BX0fIwcrQeQ0bjBcPtoEUksf30veke6DzlzMPgt6nzTB+S8dPTybhKxMHs1JoaWKDVSyuiqROx84GXA7N47BTBNwSJErquJ1MDvLRpa5xx4Li+aerP1bNRAyY3FG1FfWd0Xnu0/SQoPZX3jfaHVDf1HEnBaWZ5sUtQwedPmsLCMOQBGOJ6ebjqfatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 07:51:51 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a%5]) with mapi id 15.20.6455.043; Wed, 14 Jun 2023
 07:51:51 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, Mike Kravetz
 <mike.kravetz@oracle.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Hugh Dickins
 <hughd@google.com>
Subject: RE: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Topic: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Index: AQHZmkrTMFwnMH2R1EGnnRur83Hw9a+FyCfggAEHOQCAAT7FoIAA/IWAgACVgRA=
Date: Wed, 14 Jun 2023 07:51:50 +0000
Message-ID: <IA0PR11MB71850D8A446FE1342B428EA1F85AA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
 <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <281caf4f-25da-3a73-554b-4fb252963035@redhat.com>
 <IA0PR11MB71852D6B27C83658670CBFBDF855A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <676ee47d-8ca0-94c4-7454-46e9915ea36a@redhat.com>
In-Reply-To: <676ee47d-8ca0-94c4-7454-46e9915ea36a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SN7PR11MB6601:EE_
x-ms-office365-filtering-correlation-id: 532a2dc2-eac5-41be-923d-08db6cac368e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X4gQ77FJGjZ8XwP349JUE0BISvQ5/WPGKZc4J4pACypwG4xxOElAzfsfzsdChTxLvbfm3a20oL3AFn3+MD0wylCJ3cZ533/QdIXc2tsAGVuIg7IJUyUWmkpjRyavfbqlumEZMpCEemLONFDdLTaDObBN5d/AlMJMP1GkvSuGeAHcZlQGMYGjlOu000EuxJRfXPQO/OpB6H+qL/iN7Nsa8is1IHvEF678JQdnZ9bwBqXx3CTBpJ0YbbxQYNIJZdvzCb2JZqEU8v2plcEgs7i3QF1VxPBgZO3NDd/bBJx43e1pZKB11QAhHF8wgJ3zZNpA3P/G0O+usDCUMEhF780pw/tpKR8Vhx5xtbBTzJU6RaZ42B67QCiecmHZPUCDgMX1tC9FxvlkpZv1xSTN55QuJBDx52Nc+sfeC3wu9tJTTglU3kI0bRKAtdNwY9TDqjp98p2Rl0tz60yhKJT2/WTjTi1BRVi3yIAxGuO/4ds8UVyEViuNJtzxHF6KZXXoD2GJaVutRoEbehc1AStQMqWyxv28KiRAJQWNDT4IYlUMdZjSnC68cSU04NRaHaTAcnMI3IRwIi2dSrn0dw5Mu3qYLXvQt3af+JWkIU8IoPP4jw8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(186003)(38070700005)(38100700002)(2906002)(33656002)(86362001)(7416002)(53546011)(9686003)(6506007)(26005)(83380400001)(55016003)(82960400001)(122000001)(316002)(7696005)(4326008)(71200400001)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(478600001)(966005)(41300700001)(54906003)(5660300002)(110136005)(52536014)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDN5L3RJZEdscWtJVUNrcmlXR2dMWml0QjNUdE1NREpSQjhtKytOUFA2KzJS?=
 =?utf-8?B?Mkc3QVNESzhIVVNqTkMycTcrWHR0SFhvVXFjZDJuWlhicXdUSWZKT0NBZzI5?=
 =?utf-8?B?ckgyWHZnNW04UUk1c0F2MlRoZmlqS0hCNUIvMnJ1WWhTaXRLamFoVXVkdlk1?=
 =?utf-8?B?K2txUm5nOUpMM0dWYVpXdXRvRHdlTUlrOExrV2hYVEJBbnN2NUlhNHpSZzBL?=
 =?utf-8?B?YS9iMjZSTVhEZVl3aHR0VlFMQzN5V0FGMHlMOVNkR1dXNmJ1NUViYmJ2ZFhs?=
 =?utf-8?B?cERmS3JlS1pXNldTYmMzTXMyUHYzVEdJcFRQeDBOZmM1YkU1WXlwYStkMDBy?=
 =?utf-8?B?VlI0TkhWa2RXN2Y2QWtoY2hOeWEvVEIvWHpSTk00MURhNnBKblp0Z0ZWRDJQ?=
 =?utf-8?B?czNnK0hRUlAzZnJHTGlJK2E3NHQ1cTJmVzdDZi9DL0VlaEdWek5tNjNHTkdG?=
 =?utf-8?B?MHNWYmpsbHdxVXlQZDNNU28walQ3dkhnaUNLaDE2cGVKSjBpekZkSmpiQk81?=
 =?utf-8?B?cXRUM1FETyttNXVDMXBURktFTGdlWmV0dTBKbVl6ZVhHUTZEemc4eDlhb2Fp?=
 =?utf-8?B?WFBaazUwb2pLU04zb0hiS3BxcVZtZ3I3dTZZWWxNUmpnWTV4S1RadnFiUWRB?=
 =?utf-8?B?OXExMWtOMHFnaWQvMGJjN3kwRTJ1T3FmV3JsSi9FTnZONlAxT21hazlDejFS?=
 =?utf-8?B?S3NMc0F0RkIrZ2QrTnRyQ0FIam8wUUNSN1FZT0x2NDN0eXhUa2laWGRRbkF4?=
 =?utf-8?B?akdvYWNESnlQaUE3SVcrTU5aT1JlL3ErUVBNbmhDVXdKajF6SCtMTjR0WGtu?=
 =?utf-8?B?bytGVlltclFEY3pJMzlqZnAzMjFLUzVxT05SRjdyUG03MXBaMlExdGwxZU4z?=
 =?utf-8?B?YXFuUnhveW04bnFrYzkvWHZiWFlUWWN4TEU2YlZVV3ozV3RBbzVTNmZ4L1Yv?=
 =?utf-8?B?d2F5RCs3Mjh6RGNaaCt6MDhrQjFEUC82OWcxRzFCS1N0eUZYaWpqWVlyRmpZ?=
 =?utf-8?B?NmVBRXEvVUYwQlowNEg2QlU1OHdBVE8yMEsyNEJuOFBxNjhESjNlSWkva1lL?=
 =?utf-8?B?VnFLQUxFQ21VTGhuNHliZlh5YjdvRmgwL0I3S3BOUllXQ2g3Y1c1RFpMbG9p?=
 =?utf-8?B?WVFzV2FZc0xrL0lydGE1SmVYdUlYRXpMeHdaRmlTUi9VdS9RSW1INmxCUDdu?=
 =?utf-8?B?OWE0S2lmMTBBMW81UzRaK2dlNUl0OXhkcEE2UC9QenFNNnh4eEltcUpyRUFn?=
 =?utf-8?B?SFZQdmpoMWJHdmJsT24wTDRKSVlFWnVCS01vSHVQNllEbFlsQzFpZC9hcC9l?=
 =?utf-8?B?MUc4bDQvOC93Z0lKS0p2cThJQzRFMzgrdXJ5RWVUU2hoM1c1THczN2RBV2R4?=
 =?utf-8?B?NE9MNkNpSnpvQUNMMUM1Z3hxS1BNZFVVOHlqRVY1S0U5SHFlSk1hVlg3QnRy?=
 =?utf-8?B?QTZUTStEaGluR2E3TVNDcWZGZTVtLzlUdlUySjcycWtDTktBNEJQb2ZVNWZD?=
 =?utf-8?B?TlcxSUhFWXR2SGNXRDRseCtHRlhubFdYQnhFM0EwdzA1azNSSEF2NzZyekdI?=
 =?utf-8?B?S2FPWjlTVWlVN3F5dmlhSEZWWmJCRW1SYVFUNElBNFRrckY0UEs2RDBPcTg4?=
 =?utf-8?B?bEF0TGZ4UU56cUlEeXlJS3pFVmtkekN6TnJnaUFXaE9Ub3ZDZkx2dldkUTBz?=
 =?utf-8?B?bWgwbUNZY3NTUWk0bjF6M1B5NTMzeU8wb3p2TUhIZE5xNCtlT0Npc1NVZWND?=
 =?utf-8?B?b01OMkVMKzBtZFgxaUpYY0hpTHZUZWwwaWZkRjhtQmNaOW5BTlltWTNtdndV?=
 =?utf-8?B?Q1FEZSs2eDkrRzRuRHdpZmdtZ011OHRwWVFaVG9QRWQ2L0xkeGQ4T3hvS1FY?=
 =?utf-8?B?Mjk0MTVDY1h4QzRmQnlSME1NcFdySm9NczdyWFBGdUZldkhrOUNKcnFKNkxw?=
 =?utf-8?B?aXpSMVpaYjB6bjRCR01KcnZJOGhGYVVZTUh4RkpoQmNvdDlzcDNPRE9oY0VH?=
 =?utf-8?B?aURTQ3ZVNlRkQ2NRMU1NaHBsRWd4dmZZS1hTOEJVY0xWM1daUmI1TmFQNll4?=
 =?utf-8?B?R1E1dUZhajRsZWJ0dmliZHp6cnhEcWZvZk9FUDZPMG0zN0JKN2ZSNG93U2Rx?=
 =?utf-8?Q?hE/Vu2DzmlY1K2U93vthaJatE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532a2dc2-eac5-41be-923d-08db6cac368e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 07:51:50.8529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFVsl0q8H55d8TdC0L5EDW8nizPx+3M2gHs48jDbU6V3uRQI//S+2kxq/2b5vd7RDMdEGrZmSlJvx27lQXBWAgjq254te4h3ZNDvwKsPFo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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
Cc: "Hocko, Michal" <mhocko@suse.com>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Chang, 
 Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gDQo+IE9uIDEzLjA2LjIzIDEwOjI2LCBLYXNpcmVkZHksIFZpdmVrIHdy
b3RlOg0KPiA+IEhpIERhdmlkLA0KPiA+DQo+ID4+DQo+ID4+IE9uIDEyLjA2LjIzIDA5OjEwLCBL
YXNpcmVkZHksIFZpdmVrIHdyb3RlOg0KPiA+Pj4gSGkgTWlrZSwNCj4gPj4NCj4gPj4gSGkgVml2
ZWssDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5OyBJIGp1c3Qg
Z290IGJhY2sgZnJvbSB2YWNhdGlvbi4NCj4gPj4+IElmIGl0IGlzIHVuc2FmZSB0byBkaXJlY3Rs
eSB1c2UgdGhlIHN1YnBhZ2VzIG9mIGEgaHVnZXRsYiBwYWdlLCB0aGVuDQo+IHJldmVydGluZw0K
PiA+Pj4gdGhpcyBwYXRjaCBzZWVtcyBsaWtlIHRoZSBvbmx5IG9wdGlvbiBmb3IgYWRkcmVzc2lu
ZyB0aGlzIGlzc3VlDQo+IGltbWVkaWF0ZWx5Lg0KPiA+Pj4gU28sIHRoaXMgcGF0Y2ggaXMNCj4g
Pj4+IEFja2VkLWJ5OiBWaXZlayBLYXNpcmVkZHkgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+
DQo+ID4+Pg0KPiA+Pj4gQXMgZmFyIGFzIHRoZSB1c2UtY2FzZSBpcyBjb25jZXJuZWQsIHRoZXJl
IGFyZSB0d28gbWFpbiB1c2VycyBvZiB0aGUNCj4gPj4gdWRtYWJ1Zg0KPiA+Pj4gZHJpdmVyOiBR
ZW11IGFuZCBDcm9zVk0gVk1Ncy4gSG93ZXZlciwgaXQgYXBwZWFycyBRZW11IGlzIHRoZSBvbmx5
DQo+ID4+IG9uZQ0KPiA+Pj4gdGhhdCB1c2VzIGh1Z2V0bGIgcGFnZXMgKHdoZW4gaHVnZXRsYj1v
biBpcyBzZXQpIGFzIHRoZSBiYWNraW5nIHN0b3JlIGZvcg0KPiA+Pj4gR3Vlc3QgKExpbnV4LCBB
bmRyb2lkIGFuZCBXaW5kb3dzKSBzeXN0ZW0gbWVtb3J5LiBUaGUgbWFpbiBnb2FsIGlzDQo+IHRv
DQo+ID4+PiBzaGFyZSB0aGUgcGFnZXMgYXNzb2NpYXRlZCB3aXRoIHRoZSBHdWVzdCBhbGxvY2F0
ZWQgZnJhbWVidWZmZXIgKEZCKQ0KPiB3aXRoDQo+ID4+PiB0aGUgSG9zdCBHUFUgZHJpdmVyIGFu
ZCBvdGhlciBjb21wb25lbnRzIGluIGEgemVyby1jb3B5IHdheS4gVG8gdGhhdA0KPiA+PiBlbmQs
DQo+ID4+PiB0aGUgZ3Vlc3QgR1BVIGRyaXZlciAodmlydGlvLWdwdSkgYWxsb2NhdGVzIDRrIHNp
emUgcGFnZXMgKGFzc29jaWF0ZWQgd2l0aA0KPiA+Pj4gdGhlIEZCKSBhbmQgcGlucyB0aGVtIGJl
Zm9yZSBzaGFyaW5nIHRoZSAoZ3Vlc3QpIHBoeXNpY2FsIChvciBkbWEpDQo+ID4+IGFkZHJlc3Nl
cw0KPiA+Pj4gKGFuZCBsZW5ndGhzKSB3aXRoIFFlbXUuIFFlbXUgdGhlbiB0cmFuc2xhdGVzIHRo
ZSBhZGRyZXNzZXMgaW50byBmaWxlDQo+ID4+PiBvZmZzZXRzIGFuZCBzaGFyZXMgdGhlc2Ugb2Zm
c2V0cyB3aXRoIHVkbWFidWYuDQo+ID4+DQo+ID4+IElzIG15IHVuZGVyc3RhbmRpbmcgY29ycmVj
dCwgdGhhdCB3ZSBjYW4gZWZmZWN0aXZlbHkgbG9uZy10ZXJtIHBpbg0KPiA+PiAod29yc2UgdGhh
biBtbG9jaykgNjQgTWlCIHBlciBVRE1BQlVGX0NSRUFURSwgYWxsb3dpbmcgZXZlbnR1YWxseQ0K
PiAhcm9vdA0KPiA+IFRoZSA2NCBNaUIgbGltaXQgaXMgdGhlIHRoZW9yZXRpY2FsIHVwcGVyIGJv
dW5kIHRoYXQgd2UgaGF2ZSBub3Qgc2VlbiBoaXQgaW4NCj4gPiBwcmFjdGljZS4gVHlwaWNhbGx5
LCBmb3IgYSAxOTIweDEwODAgcmVzb2x1dGlvbiAoY29tbW9ubHkgdXNlZCBpbiBHdWVzdHMpLA0K
PiA+IHRoZSBzaXplIG9mIHRoZSBGQiBpcyB+OCBNQiAoMTkyMHgxMDgweDQpLiBBbmQsIG1vc3Qg
bW9kZXJuIEdyYXBoaWNzDQo+ID4gY29tcG9zaXRvcnMgZmxpcCBiZXR3ZWVuIHR3byBGQnMuDQo+
ID4NCj4gDQo+IE9rYXksIGJ1dCB1c2VycyB3aXRoIHByaXZpbGVnZXMgdG8gb3BlbiB0aGF0IGZp
bGUgY2FuIGp1c3QgY3JlYXRlIGFzDQo+IG1hbnkgYXMgdGhleSB3YW50PyBJIHRoaW5rIEknbGwg
aGF2ZSB0byBwbGF5IHdpdGggaXQuDQpZZWFoLCB1bmZvcnR1bmF0ZWx5LCB3ZSBhcmUgbm90IHJl
c3RyaWN0aW5nIHRoZSB0b3RhbCBudW1iZXIgb2YgRkJzIG9yIG90aGVyDQpidWZmZXJzIHRoYXQg
YXJlIG1hcHBlZCBieSB1ZGFtYnVmIHBlciB1c2VyLiBXZSdsbCBkZWZpbml0ZWx5IHRyeSB0byBh
ZGQgYQ0KcGF0Y2ggdG8gYWxpZ24gaXQgd2l0aCBtbG9jayBsaW1pdHMuDQoNCj4gDQo+ID4+IHVz
ZXJzDQo+ID4+DQo+ID4+IGxsIC9kZXYvdWRtYWJ1Zg0KPiA+PiBjcnctcnctLS0tIDEgcm9vdCBr
dm0gMTAsIDEyNSAxMi4gSnVuIDA4OjEyIC9kZXYvdWRtYWJ1Zg0KPiA+Pg0KPiA+PiB0byBieXBh
c3MgdGhlcmUgZWZmZWN0aXZlIE1FTUxPQ0sgbGltaXQsIGZyYWdtZW50aW5nIHBoeXNpY2FsIG1l
bW9yeQ0KPiBhbmQNCj4gPj4gYnJlYWtpbmcgc3dhcD8NCj4gPiBSaWdodCwgaXQgZG9lcyBub3Qg
bG9vayBsaWtlIHRoZSBtbG9jayBsaW1pdHMgYXJlIGhvbm9yZWQuDQo+ID4NCj4gDQo+IFRoYXQg
c2hvdWxkIGJlIGFkZGVkLg0KPiANCj4gPj4NCj4gPj4gUmVnYXJkaW5nIHRoZSB1ZG1hYnVmX3Zt
X2ZhdWx0KCksIEkgYXNzdW1lIHdlJ3JlIG1hcHBpbmcgcGFnZXMgd2UNCj4gPj4gb2J0YWluZWQg
ZnJvbSB0aGUgbWVtZmQgb3Vyc2VsdmVzIGludG8gYSBzcGVjaWFsIFZNQSAobW1hcCgpIG9mIHRo
ZQ0KPiA+IG1tYXAgb3BlcmF0aW9uIGlzIHJlYWxseSBuZWVkZWQgb25seSBpZiBhbnkgY29tcG9u
ZW50IG9uIHRoZSBIb3N0IG5lZWRzDQo+ID4gQ1BVIGFjY2VzcyB0byB0aGUgYnVmZmVyLiBCdXQg
aW4gbW9zdCBzY2VuYXJpb3MsIHdlIHRyeSB0byBlbnN1cmUgZGlyZWN0IEdQVQ0KPiA+IGFjY2Vz
cyAoaC93IGFjY2VsZXJhdGlvbiB2aWEgZ2wpIHRvIHRoZXNlIHBhZ2VzLg0KPiA+DQo+ID4+IHVk
bWFidWYpLiBJJ20gbm90IHN1cmUgaG93IHdlbGwgc2htZW0gcGFnZXMgYXJlIHByZXBhcmVkIGZv
ciBnZXR0aW5nDQo+ID4+IG1hcHBlZCBieSBzb21lb25lIGVsc2UgaW50byBhbiBhcmJpdHJhcnkg
Vk1BIChwYWdlLT5pbmRleD8pLg0KPiA+IE1vc3QgZHJtL2dwdSBkcml2ZXJzIHVzZSBzaG1lbSBw
YWdlcyBhcyB0aGUgYmFja2luZyBzdG9yZSBmb3IgRkJzIGFuZA0KPiA+IG90aGVyIGJ1ZmZlcnMg
YW5kIGFsc28gcHJvdmlkZSBtbWFwIGNhcGFiaWxpdHkuIFdoYXQgY29uY2VybnMgZG8geW91IHNl
ZQ0KPiA+IHdpdGggdGhpcyBhcHByb2FjaD8NCj4gDQo+IEFyZSB0aGVzZSBtbWFwaW5nIHRoZSBw
YWdlcyB0aGUgd2F5IHVkbWFidWYgbWFwcyB0aGVzZSBwYWdlcyAoSU9XLA0KPiBvbi1kZW1hbmQg
ZmF1bHQgd2hlcmUgd2UgY29yZS1tbSB3aWxsIGFkanVzdCB0aGUgbWFwY291bnQgZXRjKT8NCj4g
DQo+IFNraW1taW5nIG92ZXIgYXQgc2htZW1fcmVhZF9tYXBwaW5nX3BhZ2UoKSB1c2VycywgSSBh
c3N1bWUgbW9zdCBvZg0KPiB0aGVtDQo+IHVzZSBhIFZNX1BGTk1BUCBtYXBwaW5nIChvciBkb24n
dCBtbWFwIHRoZW0gYXQgYWxsKSwgd2hlcmUgd2Ugd29uJ3QgYmUNCj4gbWVzc2luZyB3aXRoIHRo
ZSBzdHJ1Y3QgcGFnZSBhdCBhbGwuDQo+IA0KPiAoVGhhdCBtaWdodCBldmVuIGFsbG93IHlvdSB0
byBtbWFwIGh1Z2V0bGIgc3ViLXBhZ2VzLCBiZWNhdXNlIHRoZSBzdHJ1Y3QNCj4gcGFnZSAtLSBh
bmQgbWFwY291bnQgLS0gd2lsbCBiZSBpZ25vcmVkIGNvbXBsZXRlbHkgYW5kIG5vdCB0b3VjaGVk
LikNCk9oLCBhcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCBpZiB3ZSBkbyB2bWEtPnZtX2ZsYWdzIHw9
IFZNX1BGTk1BUA0KaW4gdGhlIG1tYXAgaGFuZGxlciAobW1hcF91ZG1hYnVmKSBhbmQgYWxzbyBk
bw0Kdm1mX2luc2VydF9wZm4odm1hLCB2bWYtPmFkZHJlc3MsIHBhZ2VfdG9fcGZuKHBhZ2UpKQ0K
aW5zdGVhZCBvZg0Kdm1mLT5wYWdlID0gdWJ1Zi0+cGFnZXNbcGdvZmZdOw0KZ2V0X3BhZ2Uodm1m
LT5wYWdlKTsNCg0KaW4gdGhlIHZtYSBmYXVsdCBoYW5kbGVyICh1ZG1hYnVmX3ZtX2ZhdWx0KSwg
d2UgY2FuIGF2b2lkIG1vc3Qgb2YgdGhlDQpwaXRmYWxscyB5b3UgaGF2ZSBpZGVudGlmaWVkIC0t
IGluY2x1ZGluZyB3aXRoIHRoZSB1c2FnZSBvZiBodWdldGxiIHN1YnBhZ2VzPyANCg0KPiANCj4g
Pg0KPiA+Pg0KPiA+PiAuLi4gYWxzbywganVzdCBpbWFnaW5lIHNvbWVvbmUgZG9pbmcgRkFMTE9D
X0ZMX1BVTkNIX0hPTEUgLw0KPiBmdHJ1bmNhdGUoKQ0KPiA+PiBvbiB0aGUgbWVtZmQuIFdoYXQn
cyBtYXBwZWQgaW50byB0aGUgbWVtZmQgbm8gbG9uZ2VyIGNvcnJlc3BvbmRzIHRvDQo+ID4+IHdo
YXQncyBwaW5uZWQgLyBtYXBwZWQgaW50byB0aGUgVk1BLg0KPiA+IElJVUMsIG1ha2luZyB1c2Ug
b2YgdGhlIERNQV9CVUZfSU9DVExfU1lOQyBpb2N0bCB3b3VsZCBoZWxwIHdpdGggYW55DQo+ID4g
Y29oZXJlbmN5IGlzc3VlczoNCj4gPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y2
LjIvZHJpdmVyLWFwaS9kbWEtDQo+IGJ1Zi5odG1sI2MuZG1hX2J1Zl9zeW5jDQo+ID4NCj4gDQo+
IFdvdWxkIGl0IGFzIG9mIG5vdz8gdWRtYWJ1Zl9jcmVhdGUoKSBwdWxscyB0aGUgc2htZW0gcGFn
ZXMgb3V0IG9mIHRoZQ0KPiBtZW1mZCwgbm90IHN1cmUgaG93IERNQV9CVUZfSU9DVExfU1lOQyB3
b3VsZCBoZWxwIHRvIHVwZGF0ZSB0aGF0DQo+IHdoZW5ldmVyIHRoZSBwYWdlcyBpbnNpZGUgdGhl
IG1lbWZkIHdvdWxkIGNoYW5nZSAoZS5nLiwNCj4gRkFMTE9DX0ZMX1BVTkNIX0hPTEUgKyByZWFs
bG9jKS4NCkFGQUlVLCBRZW11IG93bnMgdGhlIG1lbWZkIGFuZCBpZiBpdCB3ZXJlIHRvIHNvbWVo
b3cgcHVuY2ggYSBob2xlIGluIA0KaXRzIG1lbWZkLCBpdCBpcyBub3QgY2xlYXIgdG8gbWUgaWYg
dGhhdCB3b3VsZCBhZmZlY3QgdGhlIEd1ZXN0IHBpbm5lZCBGQg0KcGFnZXMgYXMgd2VsbC4gUmVn
YXJkbGVzcywgd2hhdCBkbyB5b3Ugc3VnZ2VzdCBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaW4N
CnRoaXMgY2FzZSBvbiB0aGUgdWRtYWJ1ZiBzaWRlPw0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0K
PiBCdXQgdGhhdCdzIG1vc3QgcHJvYmFibHkgc2ltcGx5ICJub3Qgc3VwcG9ydGVkIi4NCj4gDQo+
ID4+DQo+ID4+DQo+ID4+IFdhcyBsaW51eC1tbSAoYW5kIGVzcGVjaWFsbHkgc2htZW0gbWFpbnRh
aW5lcnMsIGNjaW5nIEh1Z2gpIGludm9sdmVkDQo+IGluDQo+ID4+IHRoZSB1cHN0cmVhbWluZyBv
ZiB1ZG1hYnVmPw0KPiA+IEl0IGRvZXMgbm90IGFwcGVhciBzbyBmcm9tIHRoZSBsaW5rIGJlbG93
IGFsdGhvdWdoIG90aGVyIGtleSBsaXN0cyB3ZXJlDQo+IGNjJ2Q6DQo+ID4gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI0NjEwMC8/c2VyaWVzPTM5ODc5JnJldj03DQo+
IA0KPiBUaGF0J3MgdW5mb3J0dW5hdGUgOigNCj4gDQo+IC0tDQo+IENoZWVycywNCj4gDQo+IERh
dmlkIC8gZGhpbGRlbmINCg0K
