Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654D73638F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB4110E0DE;
	Tue, 20 Jun 2023 06:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E024910E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687242218; x=1718778218;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=abnTcWZL6uzpomuuyoTA7//oldOfi16xVc+hAGAhSn0=;
 b=lQg5Mice19LcPTDChdDzo0oNcT9bQ+zRAi7RjdHmiHA4NrxzB4c9LUzK
 3oyyG/kSDvL2iU/OWwtHqlWZQevTUJVGf1YnWXae5m9K8IAc4Ao8bIZVN
 PeV2R7Qgm0ORA8b9zXCnQJBrpgpmklP8Amzqmw21M/vyswnE7mxWCVENl
 Ke1osqoQFEEzNi8j6MeuPRyf1WkHUHbcAt/K9ZjAyx0YqWcPaEGFmum5/
 DnL/bogyvoL/WDcydJ0aWsgqDc2B+ohHMKYb57nipGDqNMrXckJsVRmGP
 ZDa5t8xY1RDxgCSw56CWVCkAcY1dAB5wNGvtpoUcB7djM21MLUtb/xFLY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339392674"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; d="scan'208";a="339392674"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 23:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="960654159"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; d="scan'208";a="960654159"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2023 23:23:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 23:23:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 23:23:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 19 Jun 2023 23:23:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLRDsvcI0qC9/bWnQpIEUMjyvsa3WNSl31FV28Ynv3faAFvQJukJa1UanlOoMu0AYyPJm9X257ZdwIsaaqqdxzRnlKPmxaqDh8U+2D56bJjDdg6lAPyAfXf72+Ql9u90LRSwy5/Y0bodJ3ZtG234tkr3gse8zBEMaMlB0vV+uSGqZ4Xb1NWcnn4K+AwbzKvwsuWtgXb02qFYVW9fKjtYGP1G6BjdS235LGtPn2uMQmrrqHZMQsY9LE9ZWSjPlAjuySTxooVo/fuuTwW8u+ZW5oHBdecS5riHQyattXCYAt1go5Q5Jn+GVaI8ymV676jK/X2B1hv2bSmbvxJhR9Zqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abnTcWZL6uzpomuuyoTA7//oldOfi16xVc+hAGAhSn0=;
 b=k4bTrV9KT2Ds1SIYL80C6cS6WKnFnf6zGH20tTTQyoiMLGl5ta8HuihAmqCI9RxvwTPcznl4tg3IQyLUkXVFhtT2PotxxYNrvqJEfJxChpo7HJUgjSEnb6j25Dq2zQakEwzTdkbMTsFSSkpAiS7x4jIUukaFWs71ii1CpUICzCioHyS4FoNfghuWDpuC4R4i/rGggi9AEp427saVwD/CkpobVvVXE6ayRNUAekuI2l+V1O9slzeawUhu0sTIyB4Jb+NwCJX6pY10Bz/1UCa8fxWGI9HK1JA94LWgUfZ9y3YqsIxxuWdnmpdf79wfb+iL6hKvmSYchAa+H82ahm23rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 06:23:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:23:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH] mm: fix hugetlb page unmap count balance issue
Thread-Topic: [PATCH] mm: fix hugetlb page unmap count balance issue
Thread-Index: AQHZh09nBD8lK8fIhUaiYiV9/s7VAa+SRD6AgAC0eWA=
Date: Tue, 20 Jun 2023 06:23:31 +0000
Message-ID: <IA0PR11MB71851ED7AF1E49597B15F0B9F85CA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
 <rig64luafho5rflev25kwyejxwi44n7hj5kioxhogj4wpg5pch@bvxc2mfiyhyd>
In-Reply-To: <rig64luafho5rflev25kwyejxwi44n7hj5kioxhogj4wpg5pch@bvxc2mfiyhyd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB5085:EE_
x-ms-office365-filtering-correlation-id: e3c9e37f-5b25-42ee-f620-08db7156de88
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5IGF375N4dofHcp0GLijQs7tyN38ZOGTu/TqZWGhUE3M4tHaaGUrFG2XHecIDuRGfC7JAmZ92uRS0QGOmtsEXh5YGYo8Zarc7ocI8prxq0WY/l6A/p52El0NKk1E9GIZ1IIySLG93LFMcogPk+9euzZbUNTB7ViKcai/qLl5xkcFD5ykn01IOcgxTSrvooklqyr4ZdFa8Vm4eEiamVFVUPQm4K2PP/aiZp9amrXYBveMcYujkiy1YUdhmZMgIIR6isvPmVPHjMLFQEwueFq3A2LhCJwZjn+A8x1BvewgHQ2RUanrRHriksLjhIoTMZra/gyRpZQMhp/DGw5lzK/H5crWMQ9QZaUwkZUA5nNwf8KWmYeNKaZXu7oxTKd2ZHNbD1DU7oBg25oZobDbyVYMJ8hET4nHrrDeTuPOqB2F7DrEy4tYno/ga++sZD5Q5AVnIv+57cD07ZX3JrOzPTRJI65usT3o+N2+CNwuMIq0oEobQLdzzPgfVS5HhUume44h6/WzltXIetMjU/H2/Icjj9VtJ+qkzYntcbWju+Eik+Rk5qGLmeStaKtt8LKskmhvXQq8sQif6BbrlWjdwQHAk9+tq+A37wsoigXXyJ2Bqz4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(478600001)(2906002)(966005)(54906003)(7696005)(55016003)(86362001)(33656002)(71200400001)(122000001)(38070700005)(9686003)(26005)(186003)(6506007)(8676002)(66476007)(76116006)(66446008)(66556008)(64756008)(8936002)(66946007)(7416002)(53546011)(5660300002)(38100700002)(4326008)(52536014)(316002)(6916009)(83380400001)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R01VZURBWWQrQVVDVVlRUTlPYWpMeUpWTmRJK3pRRGtwRGc4Y2JXT3d2cUZ5?=
 =?utf-8?B?RThMT2dlbW1IVTJvRTBqUjltY2FrSFV2QmJPTWo3WkZwQTQ1QktnVjdTNGJk?=
 =?utf-8?B?SjRpcUpnOFBnWm4vZzA4M0dxVWhaZHdZayszUzBZTW5XdmdIeUlaandQS3hJ?=
 =?utf-8?B?Uzh6aXc4cEMzU01Od1Z5Q3RZWVR2VEQ2czBSZlowdXFmd2NManFsY3JmTXY2?=
 =?utf-8?B?QnduQ0w5TkNFNExQdXlsazJVWDdBVGFpTERROWF3c0U5MmZxaXNRUi9ZbWdV?=
 =?utf-8?B?RlJYV21LNm50V3dIaWdLME5VYmlONlRCUldGakNUYkNYcVRrK3k1TFVRVlo2?=
 =?utf-8?B?bWFVT3NsOHhvdGZweWx6QUF6R1ExS3JCU2ZBRXB1V0JXU2dYNmZxTWxkVnMr?=
 =?utf-8?B?QjVXMjZFY0pyWlJFYllWSkt0V0J3UzdXa2RZazc4eDZmbUR2bE8way95NmdS?=
 =?utf-8?B?em4rd3F3bGQ1SlluaWduU3UrS3RyajVrVkxnREJMWkJybGhwMjQzYVorWmh5?=
 =?utf-8?B?VjlaQnJqMjdpU1V2bVMveGZtdjJHaDdxNXJUVjZ0N3dIcXJ5K2V6TGRkTm9M?=
 =?utf-8?B?MDVqcW85b1FVM3g4bmxxNWRPU3NwWTI4QTN5TTMzeGE0eTR2dVFOdGJrcUx3?=
 =?utf-8?B?MzRKbHBXSDE0OXlBaFU0ODhNemhlQjloSHBnNmRSK3JqbHlYcGdqTml5K2cx?=
 =?utf-8?B?eitkN0h6Nm00dW9kRDQreVRRYXlHNkZZMFB0TWo4NmZMRnJhRlMxSFBlNEU4?=
 =?utf-8?B?YmphSllmOFJiMk9CMkk5YTIwQ2p1S1BaajVJd3pUTEFHWVJRRnNKenV3amEr?=
 =?utf-8?B?YUhUc0NoeGlZU1pOQWtSYjZ0SFd0VC9iVjkvZkExL2krM1pBUDZpQjFra0FY?=
 =?utf-8?B?VS9uV3pHRjE2Tk1VU1ByWkhvdlJtQnZUNlVSVzNlNHJEaWpxUjI1NDk2Q1R4?=
 =?utf-8?B?UzJYSVoyWDBHSTJjNFpzdDdhOHFReHlUN3g0YjlBaHFqcGwxK0pXbnhkSldY?=
 =?utf-8?B?VHpUb0NURVhDSThoM3NmWHpDNmU3OTJONzIzM21Vd2l0dDJJUXdSNERCVnlj?=
 =?utf-8?B?cTFLZndkdFgzZkNiUk0wcVBuTVhEOVNubFBRUktBRlVVNkJOakRHT0poMXlC?=
 =?utf-8?B?WmRzaTUwai9WMGFWeVU2UkJtd1FURUNwRStlWEpVaTVxS0Jsd1E1QnVJTTcz?=
 =?utf-8?B?blMwMjNDUzI1UER1Y2IvTTE2Rk9ML3VNd1QrSVl1Z0QwWGx4Qm9ERGs5K1lW?=
 =?utf-8?B?UUhWM0NncWRjcGxKSW5XUEVVazBZNXJpNWJQMG8xUlZGVkpQdWMyZFQyeTlh?=
 =?utf-8?B?WDhDaEFlRXQ5bjJ5OStwK0xmYlNub1R3SDJzVWZsbGJDWHVIR244a2EzRzBi?=
 =?utf-8?B?eUhxc05VSWhQTnVFcVlwVzNLUnJNLzE3Wm9UZ3BCUHdtRUgvd3o3UHJ4VFJ2?=
 =?utf-8?B?QmoyaitYTlkzR2lzRmVmaW02VzNKbWZNNCtaeW9DRGdjc1N5V0pYZ3A0WXJD?=
 =?utf-8?B?ZjNjK2ozeElSTVIydTBJRDlvTEJVR2FvU0cxUlljNXlyS3BmejVLVFVpREdt?=
 =?utf-8?B?azNsbkVNK3lUbld6VEtJeGFpM3NyTk9jNXFZVjhSOXd0MkVLS2lQN21TR0lO?=
 =?utf-8?B?eFB3K3Z5R01nZlFRemlxelNBT2tvcS9hc2c3TGFTaW5CVmVsWFM2RVRmVngr?=
 =?utf-8?B?VjFFT3dBdTZDNEZ4N2xBUGJFdU9jb1Buc1Q5eEZxcWpZSzY5ekE1ZmV4NG03?=
 =?utf-8?B?Sy9RNFBZcXVSUFBwZ0NaTnhmQWU0T09XZ29ZYy9Tc28zaFB0L3I3WmVoNHRK?=
 =?utf-8?B?Skt4TEg1V0dOY1BEek5kaG1KTXMrdlN0cUNabUtJR3ZCVURLa25lNkN5WFFw?=
 =?utf-8?B?bzhVSnYzQ0lLOHphblRKZlIyL1MyVXJNN2N5Z3JFRGRFOS9neGp2bkxCZk04?=
 =?utf-8?B?dkczeHd0YzJIRlFnMEJsUjRRUjN3bzRBSFYxelFmNVV2NTkvVGZmRlBMZUdO?=
 =?utf-8?B?NnNMODIwSitDRHRrNEkwMWdsZVd4RWhrWGVwKzNnQW9sUnRlV1dxOHFkUDZL?=
 =?utf-8?B?S3NEN0VtbE5YaWZQSnRrd0F5ckxVZVRieUNYK1VOQnZHNmJranZyQzF5RlZH?=
 =?utf-8?Q?PftwGBA827ncjCKJnjlm7vJ+5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c9e37f-5b25-42ee-f620-08db7156de88
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 06:23:31.7296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 138rAX/JWTxyQxaLKa3BwSscux2hfjxDm9+6/dDwd08SYsc1wd6eOYd/rH/MEHpPYk9ScQeMVb5UxMlFT5FiFQrFFS+fcSNLVoOt30B0KoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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
Cc: James Houghton <jthoughton@google.com>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, 
 Michal" <mhocko@suse.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwNCg0KPiANCj4gT24gTW9uLCBNYXkgMTUsIDIwMjMgYXQgMTA6MDQ6NDJBTSAtMDcw
MCwgTWlrZSBLcmF2ZXR6IHdyb3RlOg0KPiA+IE9uIDA1LzEyLzIzIDE2OjI5LCBNaWtlIEtyYXZl
dHogd3JvdGU6DQo+ID4gPiBPbiAwNS8xMi8yMyAxNDoyNiwgSmFtZXMgSG91Z2h0b24gd3JvdGU6
DQo+ID4gPiA+IE9uIEZyaSwgTWF5IDEyLCAyMDIzIGF0IDEyOjIw4oCvQU0gSnVueGlhbyBDaGFu
Zw0KPiA8anVueGlhby5jaGFuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBU
aGlzIGFsb25lIGRvZXNuJ3QgZml4IG1hcGNvdW50aW5nIGZvciBQVEUtbWFwcGVkIEh1Z2VUTEIg
cGFnZXMuDQo+IFlvdQ0KPiA+ID4gPiBuZWVkIHNvbWV0aGluZyBsaWtlIFsxXS4gSSBjYW4gcmVz
ZW5kIGl0IGlmIHRoYXQncyB3aGF0IHdlIHNob3VsZCBiZQ0KPiA+ID4gPiBkb2luZywgYnV0IHRo
aXMgbWFwY291bnRpbmcgc2NoZW1lIGRvZXNuJ3Qgd29yayB3aGVuIHRoZSBwYWdlDQo+IHN0cnVj
dHMNCj4gPiA+ID4gaGF2ZSBiZWVuIGZyZWVkLg0KPiA+ID4gPg0KPiA+ID4gPiBJdCBzZWVtcyBs
aWtlIGl0IHdhcyBhIG1pc3Rha2UgdG8gaW5jbHVkZSBzdXBwb3J0IGZvciBodWdldGxiIG1lbWZk
cyBpbg0KPiB1ZG1hYnVmLg0KPiA+ID4NCj4gPiA+IElJVUMsIGl0IHdhcyBhZGRlZCB3aXRoIGNv
bW1pdCAxNmMyNDNlOTlkMzMgdWRtYWJ1ZjogQWRkIHN1cHBvcnQgZm9yDQo+IG1hcHBpbmcNCj4g
PiA+IGh1Z2VwYWdlcyAodjQpLiAgTG9va3MgbGlrZSBpdCB3YXMgbmV2ZXIgc2VudCB0byBsaW51
eC1tbT8gIFRoYXQgaXMNCj4gdW5mb3J0dW5hdGUNCj4gPiA+IGFzIGh1Z2V0bGIgdm1lbW1hcCBm
cmVlaW5nIHdlbnQgaW4gYXQgYWJvdXQgdGhlIHNhbWUgdGltZS4gIEFuZCwgYXMNCj4geW91IGhh
dmUNCj4gPiA+IG5vdGVkIHVkbWFidWYgd2lsbCBub3Qgd29yayBpZiBodWdldGxiIHZtZW1tYXAg
ZnJlZWluZyBpcyBlbmFibGVkLg0KPiA+ID4NCj4gPiA+IFNpZ2ghDQo+ID4gPg0KPiA+ID4gVHJ5
aW5nIHRvIHRoaW5rIG9mIGEgd2F5IGZvcndhcmQuDQo+ID4gPiAtLQ0KPiA+ID4gTWlrZSBLcmF2
ZXR6DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW1tLzIwMjMwMzA2MjMwMDA0LjEzODcwMDctMi0NCj4ganRob3VnaHRvbkBnb29nbGUu
Y29tLw0KPiA+ID4gPg0KPiA+ID4gPiAtIEphbWVzDQo+ID4NCj4gPiBBZGRpbmcgcGVvcGxlIGFu
ZCBsaXN0IG9uIENjOiBpbnZvbHZlZCB3aXRoIGNvbW1pdCAxNmMyNDNlOTlkMzMuDQo+ID4NCj4g
PiBUaGVyZSBhcmUgc2V2ZXJhbCBpc3N1ZXMgd2l0aCB0cnlpbmcgdG8gbWFwIHRhaWwgcGFnZXMg
b2YgaHVnZXRsbGIgcGFnZXMNCj4gPiBub3QgdGFrZW4gaW50byBhY2NvdW50IHdpdGggdWRtYWJ1
Zi4gIEphbWVzIHNwZW50IHF1aXRlIGEgYml0IG9mIHRpbWUNCj4gdHJ5aW5nDQo+ID4gdG8gdW5k
ZXJzdGFuZCBhbmQgYWRkcmVzcyBhbGwgdGhlIGlzc3VlcyB3aXRoIHRoZSBIR00gY29kZS4gIFdo
aWxlIHVzaW5nDQo+ID4gdGhlIHNjaGVtZSBwcm9wb3NlZCBieSBKYW1lcywgbWF5IGJlIGFuIGFw
cHJvYWNoIHRvIHRoZSBtYXBjb3VudA0KPiBpc3N1ZSB0aGVyZQ0KPiA+IGFyZSBhbHNvIG90aGVy
IGlzc3VlcyB0aGF0IG5lZWQgYXR0ZW50aW9uLiAgRm9yIGV4YW1wbGUsIEkgZG8gbm90IHNlZSBo
b3cNCj4gPiB0aGUgZmF1bHQgY29kZSBjaGVja3MgdGhlIHN0YXRlIG9mIHRoZSBodWdldGxiIHBh
Z2UgKHN1Y2ggYXMgcG9pc29uKSBhcyBub25lDQo+ID4gb2YgdGhhdCBzdGF0ZSBpcyBjYXJyaWVk
IGluIHRhaWwgcGFnZXMuDQo+ID4NCj4gPiBUaGUgbW9yZSBJIHRoaW5rIGFib3V0IGl0LCB0aGUg
bW9yZSBJIHRoaW5rIHVkbWFidWYgc2hvdWxkIHRyZWF0IGh1Z2V0bGINCj4gPiBwYWdlcyBhcyBo
dWdldGxiIHBhZ2VzLiAgVGhleSBzaG91bGQgYmUgbWFwcGVkIGF0IHRoZSBhcHByb3ByaWF0ZSBs
ZXZlbA0KPiA+IGluIHRoZSBwYWdlIHRhYmxlLiAgT2YgY291cnNlLCB0aGlzIHdvdWxkIGltcG9z
ZSBuZXcgcmVzdHJpY3Rpb25zIG9uIHRoZQ0KPiA+IEFQSSAobW1hcCBhbmQgaW9jdGwpIHRoYXQg
bWF5IGJyZWFrIGV4aXN0aW5nIHVzZXJzLiAgSSBoYXZlIG5vIGlkZWEgaG93DQo+ID4gZXh0ZW5z
aXZlbHkgdWRtYWJ1ZiBpcyBiZWluZyB1c2VkIHdpdGggaHVnZXRsYiBtYXBwaW5ncy4NCj4gDQo+
IFVzZXIgb2YgdGhpcyBpcyBxZW11LiAgSXQgY2FuIHVzZSB0aGUgdWRtYWJ1ZiBkcml2ZXIgdG8g
Y3JlYXRlIGhvc3QNCj4gZG1hLWJ1ZnMgZm9yIGd1ZXN0IHJlc291cmNlcyAodmlydGlvLWdwdSBi
dWZmZXJzKSwgdG8gYXZvaWQgY29weWluZw0KPiBkYXRhIHdoZW4gc2hvd2luZyB0aGUgZ3Vlc3Qg
ZGlzcGxheSBpbiBhIGhvc3Qgd2luZG93Lg0KPiANCj4gaHVnZXRsYiBzdXBwb3J0IGlzIG5lZWRl
ZCBpbiBjYXNlIHFlbXUgZ3Vlc3QgbWVtb3J5IGlzIGJhY2tlZCBieQ0KPiBodWdldGxiZnMuICBU
aGF0IGRvZXMgbm90IGltcGx5IHRoZSB2aXJ0aW8tZ3B1IGJ1ZmZlcnMgYXJlIGh1Z2VwYWdlDQo+
IGFsaWduZWQgdGhvdWdoLCB1ZG1hYnVmIHdvdWxkIHN0aWxsIG5lZWQgdG8gb3BlcmF0ZSBvbiBz
bWFsbGVyIGNodW5rcw0KPiBvZiBtZW1vcnkuICBTbyB3aXRoIGFkZGl0aW9uYWwgcmVzdHJpY3Rp
b25zIHRoaXMgd2lsbCBub3Qgd29yayBhbnkNCj4gbW9yZSBmb3IgcWVtdS4gIEknZCBzdWdnZXN0
IHRvIGp1c3QgcmV2ZXJ0IGh1Z2V0bGIgc3VwcG9ydCBpbnN0ZWFkDQo+IGFuZCBnbyBiYWNrIHRv
IHRoZSBkcmF3aW5nIGJvYXJkLg0KPiANCj4gQWxzbyBub3Qgc3VyZSB3aHkgaHVnZXRsYmZzIGlz
IHVzZWQgZm9yIGd1ZXN0IG1lbW9yeSBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+IEl0IHVzZWQgdG8g
YmUgYSB0aGluZyB5ZWFycyBhZ28sIGJ1dCB3aXRoIHRoZSBhcnJpdmFsIG9mIHRyYW5zcGFyZW50
DQo+IGh1Z2VwYWdlcyB0aGVyZSBpcyBhcyBmYXIgSSBrbm93IGxpdHRsZSByZWFzb24gdG8gc3Rp
bGwgdXNlIGh1Z2V0bGJmcy4NClRoZSBtYWluIHJlYXNvbiB3aHkgd2UgYXJlIGludGVyZXN0ZWQg
aW4gdXNpbmcgaHVnZXRsYmZzIGZvciBndWVzdCBtZW1vcnkNCmlzIGJlY2F1c2Ugd2Ugb2JzZXJ2
ZWQgbm9uLXRyaXZpYWwgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgd2hpbGUgcnVubmluZw0KY2Vy
dGFpbiAzRCBoZWF2eSB3b3JrbG9hZHMgaW4gdGhlIGd1ZXN0LiBBbmQsIHdlIG5vdGljZWQgdGhp
cyBieSBvbmx5DQpzd2l0Y2hpbmcgdGhlIEd1ZXN0IG1lbW9yeSBiYWNrZW5kIHRvIGluY2x1ZGUg
aHVnZXBhZ2VzIChpLmUsIGh1Z2V0bGI9b24pDQphbmQgd2l0aCBubyBvdGhlciBjaGFuZ2VzLg0K
DQpUbyBhZGRyZXNzIHRoZSBjdXJyZW50IHNpdHVhdGlvbiwgSSBhbSByZWFkeWluZyBhIHBhdGNo
IGZvciB1ZG1hYnVmIGRyaXZlciB0aGF0DQp3b3VsZCBhZGQgYmFjayBzdXBwb3J0IGZvciBtYXBw
aW5nIGh1Z2VwYWdlcyBidXQgd2l0aG91dCBtYWtpbmcgdXNlIG9mDQp0aGUgc3VicGFnZXMgZGly
ZWN0bHkuDQoNClRoYW5rcywNClZpdmVrDQoNCj4gDQo+IFZpdmVrPyBEb25nd29uPw0KPiANCj4g
dGFrZSBjYXJlLA0KPiAgIEdlcmQNCg0K
