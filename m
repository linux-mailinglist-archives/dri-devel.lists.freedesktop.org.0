Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50F6FE6C2
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 00:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C18510E558;
	Wed, 10 May 2023 22:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7518810E558;
 Wed, 10 May 2023 22:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683756007; x=1715292007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LXpmUoPx7RiTsb14s4k7Ptmu/vb9xo6snzp6TuJqya8=;
 b=gl6ZEzPmYglfAWlj8fwRaoI198s0Uy85Y+bKu+I2qFDdlN+m2lLH3FYf
 O9jfj36gQj+IQvMrxtTwMmikWXaxRHVrfiZKkTvHM82OwlLFz8dL4L8CW
 3SxHGi0brjWN8+y9/eQtzbCQkvqMzcvvMsqhpTI+72kuGYDifWbW8NOl6
 PS8NdwgElYfCxqaPEnYFJy8Rj5yiaP6HwuwAmVD6x5vsgX5eiaGmg2qT0
 33FgQmsfLX5QPOIxaYx/nSC+438USrrKPyK3u0Sf5wxPGOaox99At0a9U
 6hqfXZOH4Rz+ayzzDU+c7tf/lb6KTYHdZ/8JLXteCaoik0osPFi1+qhWB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347798914"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="347798914"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 15:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649889781"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="649889781"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2023 15:00:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 15:00:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 15:00:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 15:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgHM2iZdUIYE+E1X8Iu4ozFBnd5cSYSIUCKxOfm/Xl3eSIyCn/YG5XEQpi5It1M2cxtkeL9D/+BkuMPpjZC/QFuCW+uUmPe4GIwBNw2GfKs5Kb/eq6IJITMZHtDvr5EgRXEeKP8XpOhsHSguaPpMbpiCxhgKgydrYCmxS4rAWSSgVs16J3oROETjqsP2pvxBO0IYnb/Q6JgnyyzINngRyiUi3QsDj6E/Xus1uznFr68WeRmu6LVWgChKH6/SyFNOwm8F0F1vpphj6E08V9iXCg2SKV+SLXrm7Ld9aMjHusW6X1rGxQfv/3l/TSbwVDfEPSohaBQWsLQe/+cfEtNflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXpmUoPx7RiTsb14s4k7Ptmu/vb9xo6snzp6TuJqya8=;
 b=HZJ9oR5+xURX8tox7p7tnjPWDNOlW5SI+7zpz3tILA+TdQeiGpJMMdzIAw7jeWF2AxhDOmAzu5zoq0gCZkyGlsK3xT38SZoHCs9nZ8wABdywkaIB/fnJmdrc7NIUvCNQqFuMUhS1b7t7Xd268Cicck5ZJ80zDfH6O05L16i18VS9u/3oEFkItuNVMfV0FIyZ20WE8+oaFYgWKpKRBXA1A2opU5eOA9fNbRf2mV9/MudH1r3tieHbGAO93MrRI3bTXLPshz4Ps4TBlNoLUYHZEDbHi1jSPzZQjk5QmpKi3IZPJ5KYhXekG+fTPg3pffcgNIBA9bJhQQo5VEiYtB3AlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 22:00:03 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6387.020; Wed, 10 May 2023
 22:00:03 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Justen, Jordan L" <jordan.l.justen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for
 PXP
Thread-Topic: [Intel-gfx] [PATCH v9 6/8] drm/i915/uapi/pxp: Add a GET_PARAM
 for PXP
Thread-Index: AQHZeWLWx68i9/8KnU+Unxd6GaMLfq9LMoYAgAAkQACABWFXAIADQ4+AgAAhMwCAAANTAIAAApGA
Date: Wed, 10 May 2023 22:00:03 +0000
Message-ID: <642c1a52bbcc4369c69ec2dbbfd7723c60c1dcb2.camel@intel.com>
References: <20230427234843.2886921-1-alan.previn.teres.alexis@intel.com>
 <20230427234843.2886921-7-alan.previn.teres.alexis@intel.com>
 <8888e3dff8c1c4fd1702ded911850da30330fbfa.camel@intel.com>
 <168327239043.1096084.14316886882692698230@jljusten-skl>
 <e40f2b8750b39facd98f72cda63bc733ca0319d5.camel@intel.com>
 <0a23ff5be69e3d6b6e3b457c2599bc2f018fc71a.camel@intel.com>
 <168375473641.1096084.7149697040639389794@jljusten-skl>
 <168375545081.1096084.10046830335154502443@jljusten-skl>
In-Reply-To: <168375545081.1096084.10046830335154502443@jljusten-skl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ1PR11MB6156:EE_
x-ms-office365-filtering-correlation-id: abbb19ea-2990-4a3b-3c97-08db51a1e87a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ePlwNm5BrFIJHF8gasthduNJPnU8DZapM5BmFVSUCAx3H0rpDYocofQ1j7/bDqTj01aO3LBplmqdaHbsPT5xW3el8szKNEIpSq+2VZAmTEJJkAVypbDLgJAsV3UekeiIquAYQKi1hd/cFmQmOQndNfhWWX2g4WtCAFRT+iJUqnl8B7wCrgf/Gd2iV+scUyjkRSZxfYsuxCYVtjUUDHk3zDLxAhZStaLtkcWK6Y5cPCN20Rl4JIVwG5PpuZ97xQ8No8ho6hWcHQQhsOmEpWGt7I8wfM9piw46uISQUp+P/13irtl87MYqQdEP67xgTxIvU1LbyotsIl6+89ljpemv1dQGPYo1Ir2FudsN43CxvMWDX7XHm04ymtHtgG3JAHtkJNZLeDzYeepWWQgb9qcFQCGCsOBlfA12TcmVpqkdycgiMDrs7p/txKvQAqm4FHnkN2n8fVimjdzptsNEzM9GeqXJZsq2V9CDe9RgIDL99ltvDCCCC2U6MO0OKfJCAwQ0GH7jT2fRvfuABlzvlSCJMy6DbYVK6x9MlN+gjpYmXeAhec67ToNMM5DKISxE5c//eRkZePkT+/0xObVhlp7M8DfxXj5LNLvhCNKdm2FIglZrwurzF0yedmQbV6UvC5Qe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(64756008)(478600001)(66556008)(66476007)(76116006)(6636002)(110136005)(6486002)(4326008)(66946007)(91956017)(316002)(54906003)(66446008)(36756003)(107886003)(6506007)(86362001)(6512007)(26005)(2616005)(8676002)(41300700001)(8936002)(4744005)(82960400001)(2906002)(5660300002)(186003)(38100700002)(38070700005)(122000001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVprWmxsbUY5WmorSFVnMkVDeFpBUTI2b1o0M3hBUmE4VmYyR3FoK0s0Y0Y0?=
 =?utf-8?B?VUVBSENZb0hSRWRRMXYzZ3BGSldyNVZta0gzRE94UUdlNlY0dFYySmVWTmti?=
 =?utf-8?B?ZjNFdzNwL2pTV2c5NXpJQk5yVzRaS3ZsNnZKbWV1UUptSkw5YmZrWXFVVDJI?=
 =?utf-8?B?U1RRWUdMTmNCc0tzeEQ1SDdrNFhDUEF1ZkE1eEFDdHYyYlBmb3RLZG1zdEdq?=
 =?utf-8?B?UklUZWVkbUdET2RjUVd3aExuWGpkd0tLeWVkM2RoQ3pqVzZjaHdvU3FXTkNZ?=
 =?utf-8?B?dVhVVGhRQmxxNnphUWp5a2lISzFVdXMvRHYvMmh4RXVQYkt3VnY0Ykw1bXRB?=
 =?utf-8?B?ZHdpVWR3SVg4b1A2V05aeXYxRFBQSkJZUUxrTFBFVTVYRDdwOUJqRUQyaDYy?=
 =?utf-8?B?dW1vOEllbi92ZitlbGU1RFU2WHhLNFFhcW9tbm10dGRNeVphSzYvUXVTVzgz?=
 =?utf-8?B?a0orMEZkNjVEL2lReC9oUk5TT2JPRFIwblh3Um0wZ2xnYjZ3eThlMGlzaXRS?=
 =?utf-8?B?eGgrU2dkcVV0SkVQUjYwYVFxdHljZHpTTFBrUERON2VrbG9BdkZ1MG5iRHdo?=
 =?utf-8?B?Nk1iVVFLZUhOUlNPQm9LQzRDcEFqcTRLOVNOSDJLOVduSGNSQ0hnaUVzcys2?=
 =?utf-8?B?UGJ0WDZTUjh1aUtCUmE5NDhNUzluVUIzUnN3dW8wa1d4bURVQzRTYUdPNG41?=
 =?utf-8?B?aUhKRWtJMHVSNUxCWWIzUUhoME9KNGZDTGhMVG1rL2o3VmRwZm1jU1daL3Yy?=
 =?utf-8?B?TkIzZ1hRT2xmbjJEVUJUMXREdThQUHZ0aGt1V0Z6VUJOMUdWeWx0S2d5dEYy?=
 =?utf-8?B?Mk1MT0JtOCttQTIyQ0tLZUxEcll2dWNscmh6SHFVdEU1OVVFVUEyQ1dmWWlL?=
 =?utf-8?B?ZzBvSEU3TWZGR0hhK1JtZmZuRE8rRmk5dkZJcmM4QUdLRytONHVaMGxyREhK?=
 =?utf-8?B?QktjbkZYRzBBdTB4alVBZ3V6cGJ0L3V6citQWENZamdzaUVyRDZkbi9tNExw?=
 =?utf-8?B?NlVNVUpJeXc5c3NkVWhhTm5RYWp3L3oyZTBWZ29iTlhWSmU4a0RTaDVoN1h6?=
 =?utf-8?B?NW9YRjU3dnl0S3dtcXVoUUJsdHRQZ0lLUGpQc2xxWW4weHBmWnM5ZnFla3RC?=
 =?utf-8?B?Mk81Z09YMGFEMEgyZUhmV0pGK245aHk0R2p2Q1pWWWtsQmt3SnFteTQ3WmJi?=
 =?utf-8?B?VnlESndYbGlEb09DWmlKQk5pekdtSUJlT2pJdmZrN3NBeDJYa3ZQcjk4Ulh2?=
 =?utf-8?B?a0FRZnNMdGJZZHZ6ZU55aUJFL3FDZkkvMkkya2lwcmlNUjViQUZvTEtwdzcy?=
 =?utf-8?B?dDF6OVVEZkR1ZlUzRzEremYzc2o3UTIvaVl0SDY3U21IMVEzUGVHTW1CVFU2?=
 =?utf-8?B?SzhSUDgvWCs3TE83NUNQWVJsU1cwL0l2Z3FXa2lkTUZFR3ozbmpkbkUybXFy?=
 =?utf-8?B?NmZ6Z05LdS9QMHM1WW9sVHRCU1RUckUrNHlMaWZ6WmVrd1VYdGppbDZKN3hu?=
 =?utf-8?B?bEtvaEg5YVpTOVhkRmM5QVN1YjJ6VXZaQ0FxejV0RGxNdExHSXk0WUNNeEs4?=
 =?utf-8?B?QVZ0RXlCYTBYZlFvS0pMcFY5cXFJaUJhQkhEVDdzdHBCdVVQNm5DblRhelFa?=
 =?utf-8?B?a2xtTkJ4K21FcVpvVHhLeWxlSE1KU05oVHJ1aFRyNzJETnplL2JzRWk3MHls?=
 =?utf-8?B?U0hubkFWUnpRUXdvQjNVNTJ4TytlQURjWXR5R0J5RWxjczZJcHhjNG42TkEr?=
 =?utf-8?B?MGFrZHRSb2FoSVh4eXJMUVRkeFh3SFZJb2xDOEZoQmdTdG1OeFRNa2g0bTdr?=
 =?utf-8?B?cCtwbUZUNGJpWlJUQ2VnVjN0U2hzR1pvUzRQN3B3c3JLeGJ4K01QOVM3Ull6?=
 =?utf-8?B?bGt6M1d6YXdSNHJ4aU1uSG1jcXkrMFJKMmZVbjIxcHdkcGg3b05ndjNHTFNs?=
 =?utf-8?B?TmdDTXVPN1NZdU0raWZlSkZwQU5rcDBnSlBmL2J0ZUhpS3NRQ0Q0anNzV3Fk?=
 =?utf-8?B?Q294d3NVUWplUitKVTJTRzNNOVd1Q0ZzUTBGQUdmOE1GbVZzVHNDQjJia3M1?=
 =?utf-8?B?ODdBZng4ZEo4a0UramxWaHBZZzVRTHVqeFl1eGozdnlrS0JEaGpqZmQ4Nk9X?=
 =?utf-8?B?TWtQWGRmYWVweEhTdDlnNXNmOWNIblFmKzEza2FwV2l2bEpSdEFzd3BVYVg4?=
 =?utf-8?Q?hX+6nmsgLpTyeJHJAS0F1t4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01F1CD8BD3854F4B886B59E2C3AFD36C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbb19ea-2990-4a3b-3c97-08db51a1e87a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 22:00:03.4961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osfHTasysE4DxLQ0NAWqTPi6EZJOZLCiNudxBB41L6ykgp9wXpX+P6w3kiK9agED9I8VdOF0glrbNY66V/xcylpZ0M7idRloK8xaZK5SIqlRwEyIArigt6RX/GIHsouX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "justonli@chromium.org" <justonli@chromium.org>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQphbGFuOnNuaXANCg0KPiBUaGlzIGlzIHdoeSBJIGFza2VkIGlmIGl0IHdhcyBpdCB3YXMgImJh
c2ljYWxseSBjZXJ0YWluIHRoYXQgaW4gYQ0KPiBwcm9kdWN0aW9uIGVudmlyb25tZW50LCB0aGVu
IGl0IHdpbGwgZXZlbnR1YWxseSByZXR1cm4gMSBtZWFuaW5nIGl0J3MNCj4gcmVhZHkiLiBBbGFu
J3MgcmVzcG9uc2Ugd2FzIGEgbGl0dGxlIGFtYmlndW91cyBvbiB0aGlzIHBvaW50Lg0KYWxhbjog
aWYgd2UgZ2V0IGEgJzInIGFuZCBuZXZlciB0cmFuc2l0aW9uIHRvICcxJyAtIHRoYXRzIGEga2Vy
bmVsIGJ1ZyBvcg0KZmlybXdhcmUgLyBzeXN0ZW0gaXNzdWUuDQoNCj4gQXJndWFibHkgYSB0cmFu
c2l0aW9uIGZyb20gMiB0byAtRU5PREVWIGNvdWxkIGJlIGNvbnNpZGVyZWQgYSBrZXJuZWwNCj4g
YnVnLCBidXQgaXQgZG9lc24ndCBzb3VuZCBsaWtlIEFsYW4gd291bGQgYWdyZWUuIDopIE1heWJl
IEFsYW4gd291bGQNCj4gYWdyZWUgdG8gc2F5aW5nIGl0J3MgZWl0aGVyIGEga2VybmVsLCBvciBz
eXN0ZW0gaW50ZWdyYXRpb24gYnVnLg0KYWxhbjogYWdyZWVkIC0gdGhhdCB3b3VsZCBiZSBhIGtl
cm5lbCBidWcgb3IgYSBzeXN0ZW0gaW50ZWdyYXRpb24gYnVnLg0KDQpJIGFsc28gYWdyZWVkIG9u
IHRoZSBpbml0LWZsb3cgdnMgYXBwLXVzYWdlIHRob3VnaHRzIEpvcmRhbiBoYWQuDQpUaGF0IHNh
aWQgTUVTQSBoYXMgbWFueSB3YXlzIGl0IGNhbiB1c2UgdGhpcyBVQVBJIGFuZCB3ZSBjYW4gZGlz
Y3Vzcw0KdGhhdCBvbiB0aGUgTUVTQSBwYXRjaC4NCg0KDQpobW1tLi4gc28uLi4gYWNrIGFueW9u
ZT8gW2luc2VydCBiaWcgaG9wZWZ1bCBzbWlsZXkgaGVyZV0NCmFwb2xvZ2llcyBpZiBJIGFtIGFz
a2luZyB0b28gb2Z0ZW4uDQo=
