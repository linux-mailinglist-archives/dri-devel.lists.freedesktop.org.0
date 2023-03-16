Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DE26BD6B9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 18:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A5810ED92;
	Thu, 16 Mar 2023 17:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7C610E215;
 Thu, 16 Mar 2023 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678986375; x=1710522375;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=a+EtBx9Pf2wLfnDxVxK1YjYGSxr5y+BQwJ6r2xakAnw=;
 b=NI8BZh0pugJzqaeKj7kNDGA5FyAPsrHfGeQEdtWS0xtZwZCKk0I7tc1J
 YT4wYtHGfwawpL8eJMl036A1D7VQp2Oe2SF8qwMryTuk2aoishWvKvQY9
 b1yMVCXCLPfQT7720YNjcp6g+NKXTgXapusdpTFUpQrY2YbQfp3WY+RXV
 CcZzjHFzy6oa26tbp8Ryc7gHtBRDzA1bsSjbEP53FLA2kBxocTsve0xf8
 Pk9Baqr1uRfsDh0mipVFDzOLP1er8ixoBgU/t45Qqgf5/zDMQ8t9yWGDT
 j3ba6zNyapykn4E73uAMbNvF7JepQgNV9tO293i1AGoNs7pkjVktWl6m9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338072301"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="338072301"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 10:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="769033407"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="769033407"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2023 10:04:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 10:04:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 10:04:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 10:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6mlkdhvMde8YyhoqGJxPk4cT6o0pOE5urrv1SpfZS+8LkEjZIyZg88GlGl2HUaFdZYzw69FBxgHi6tpm2518UyftWbUoDle/wHfw8E5E0ELo/RYR81rdE/SabSwDfIzjIqnWGs78MEejs4Zeila2deT5quamruRRakZvd5baT3X+sQ8SVqZCYK+RbMRFWAFZr/R3Y7ELPSgkCp+nyZWMQW0shkb2BE/iv8T4LYIIpxqYuAjQeK95c5hy0gdEUgG3C+RzmDysf1KAgnaHGk9q2MhmhADyXG39VotGOUWQxbyvP4xkzJbTaUwu1TIP/7saDlKqN6Z76njYQ8fwXo9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+EtBx9Pf2wLfnDxVxK1YjYGSxr5y+BQwJ6r2xakAnw=;
 b=JdCeB+nd5IqdRSBaGhTz8PEyxTOH5H2+xp7tM4Y5aZdSjVHG8x9fxJoc4lFW6fHk6AVxuD4dePdTVpU31gLLhyXZiaLxID6KBsRVTGCaCHoe8lEB+pUrAPx/PteZ0p2zNvk3a5PcCIQD5H9j/3xlC1AO2zinN5yMhOQN+xqgoq3HJr2mYVfu42B7iZ9xSZucM21ppOIwCVDT9rUXJw82M95bcnXYxcf6lh8pK87Rbzq7NkZ3iEfd9oDcdTREu/3B+mOw466v7v3vktnWCBRex2lAdI0aFHc12q4X3O1sF5dAep6ZO8uLSFV69UZ0X2iSi69lksHWnb0NUPOP0Pnjdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Thu, 16 Mar 2023 17:04:24 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 17:04:24 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/huc: Cancel HuC delayed load timer on reset.
Thread-Topic: [PATCH] drm/i915/huc: Cancel HuC delayed load timer on reset.
Thread-Index: AQHZVe5BrFL2aCLuiEuKtg+mtmAc/K79pteA
Date: Thu, 16 Mar 2023 17:04:23 +0000
Message-ID: <56ba02b6d4f9b173fbddfef7946cb49f6aa450b1.camel@intel.com>
References: <20230313205556.1174503-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230313205556.1174503-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6905:EE_
x-ms-office365-filtering-correlation-id: 633cd04f-5813-42d6-b835-08db26407e3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wz0c2984Pvc1AQNI4F6aTdW9vbCPblX4Nawvps3qoafK8XFjqkBl+gzH58OmjvBNiEFi45bYyNY6l+N0G5DjkcUxKnXq4KMedSjWYOctALRjnnwHtihLySQ2vBr/DKRMP6mOBgw6xbrH/QEVmKafkJU3Pg/GMYKkH2JLqbKbX/B1REf+SNgnFcgcudaifD9CVeFp9N9ozMPhaEs75+zQdoXSDOHStGwUce5ZR01OqVkggFQBMWEcYuLD9Rqu8OI5WLDgTDwFjW8TehCSOiYD3kWJ8e+REN1SQ2Pre4lEd6SdKySZhbTTqSAWVaYkOf1nBxI7kMv3mqCzKG75mKNbGtZtH29xmyfZMCj4KgKXyiBrGJFbx1uoFNtRrZkiofgsfltjPUG7eIKUoeRRbSmjxP1T8bgJP7mZzhK9BH2FvBDmXTLOuyBkxkR8GBWBzNm8fRWwJgp2+6t6isvZ8AtenERO7coF6cNXkuYPZzZsGiaz49YQezqsny+eAGBwhA8F4nz/1IJ9rHBh6H4i2T5Gtk6SASTcEE10DZau9tVZUFGSBJx7t3V2PTMbgFyBa8j2i3DxW81YjpJfboa1AIvhAUoAumRtIopRn6/bj9WM5BZFkcMD0QAABzb+duRsp5oc7XztAZsbb0d2r0y5UhRdUTTpbe2FK/lyIi0n2Ugr8uixAU92tNaEEbP4c4hKIs07XDrFFnWXKAVxmqN64PRfVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199018)(122000001)(82960400001)(2906002)(83380400001)(5660300002)(41300700001)(36756003)(8936002)(76116006)(66946007)(66556008)(66476007)(316002)(4326008)(91956017)(450100002)(8676002)(38070700005)(66446008)(86362001)(110136005)(186003)(6512007)(38100700002)(478600001)(6486002)(64756008)(6506007)(2616005)(71200400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekhGT2ljK0R3d29nNDc2SmNvcTBLbzdsMjFEaGs0c2R6ZnArbXlpd290UHJ3?=
 =?utf-8?B?MU9ST2hFZyt4cWVWM0JzNHd2anhSRHhSV3o4dEVJOUFkakJTckZ5Y1JRUmM0?=
 =?utf-8?B?dUNxMHNlS1EwQy9LdEU5Tmd1YzlEeWp2ZTg4VDlmSm9OWHJYUWFpQU9adzFX?=
 =?utf-8?B?TG5aTEw5dHVwUzZzOTBlOFVGVWZiZ1BjV2dFNUJRY29EVkJ3YkdyMWU4eWhC?=
 =?utf-8?B?SVh1VUhwZEVKQnhZaUZXSnFzaTNvUitGRUcwQUtjdmdpeEtVd3djSVY5cXYz?=
 =?utf-8?B?ZElSajl1cjkxN2ZZWko5b0xkcFNHdnpvWDA4RHdKWitYcVFQVGhGN2JwVzFU?=
 =?utf-8?B?THRDRUx0RUs2VHIzVEtsSko4VzV4QVZjVDMzSTMyM2V3Q2dJZm5qRzdtcVBo?=
 =?utf-8?B?bVZFc2pzQTlDc25MUk0xN1JoVk1ZNWZIVEtKU3JvOG5udzVvMERFeDJNNWRC?=
 =?utf-8?B?M0Znc2U3ZXRvR1ZWNnAyTzlnUVpjd0JsbytQTkF2Y3NPbGt2cEMrZjZHQjl1?=
 =?utf-8?B?aCtKTndOUUVPZkxseGlELzNxaC9zcHozUUFPZ2hRSHI0emVINHNLazR4Znky?=
 =?utf-8?B?WGRtTUpZd2NlaFJ6M0E4aHl0N1FDb1U4aHhBUFlGTzllRjIxN1JSeEdqQmZT?=
 =?utf-8?B?MkZUeXBUUmsrcDRWZlNETEJQbUhVTzVFbWdGK2t3WTlKRjVhcS8yZ1M4b28x?=
 =?utf-8?B?K2cyaExaZDc0b2ZYZ0llNWRzdnoyc3YzUWRPY0VaSVhWbDVmaFh2VmtoVUJL?=
 =?utf-8?B?RmRldUMzdCs4MXlFKzJuZ2NHZjJaNE55ZjQrWFNxbldGY0ZHR3o2NmRXc0NV?=
 =?utf-8?B?TzNOeHZhMWRJQllYK0JlTDNURUZtaEE5QkM5MUJreTVkaVhFWFVKUDBsQWls?=
 =?utf-8?B?ZlpXRWFqT2dXWkpwbnFHU3VTa1NFL1djNzhXSjBGNjJIajNRclRBdE1IdG9q?=
 =?utf-8?B?RHNXK2QwUmNTOUk5VW5GOU9qcndWS200aUx4V3dtQ1BuV0JuK0RObmNIRkRo?=
 =?utf-8?B?blVNTHlhNDgxN1JCUmxkMlp6L25QMUpiSTMrNGRaNkRKUGl1QVlzMWVVMTRG?=
 =?utf-8?B?aklmbXA2Ylo1QkF4R0ZvQzBnU1hsbVBqN2JaQ0F5eGN0SngxVzdjYTVzQVU5?=
 =?utf-8?B?SDNyMnRUamZoY1RuMmV6ZFJBRGZwMWJkaUdVMDdINFRKNXVsWDFJRXBHeXFZ?=
 =?utf-8?B?VEVjLzRqclUxQzlzQThmcW8yRklCV0ozak5rcDlwU3ZsUkFocGNqZllYQ1gr?=
 =?utf-8?B?TEx4aEltcmVVZnVyTnZvRUtCOVFIZ3lTYW5NQ01ML210WkpYZkh6ZTJKR0JN?=
 =?utf-8?B?SHkwKzBJbkZxMWoxbzZWTWpqdTFERjlVOURYdUNwS3hIc0NMOEp2SnFUTGhS?=
 =?utf-8?B?OFRhNXozSXMxSzVmTW9rNExOajYxZjJ1WGQ4b1hTL01ZRW5FdnJGNFBVaktT?=
 =?utf-8?B?eDhLL29GNTZZbU9tblVuTzA5azlWY3FGbnNpZlgxemVDcUlyWW9MR0RJRjVD?=
 =?utf-8?B?QXFqVlBhUG5XaW5SVGpxZlZQRzdzaURSYnR0dDd4ZmVDRkZmcDZrSXFTSEdZ?=
 =?utf-8?B?aVg2SWlqQk1VaytxTktuQTE3MFBWcTZ4OStEY3BSZnhvNlAxaXB2dEdxVUNw?=
 =?utf-8?B?WEdibUlYTXgrRjJMZUdxenZia0pxSk9Mb2hLUGhiSWxpeDFKazVxSFo5WUFu?=
 =?utf-8?B?b2NuWHRTdUpBRHFKQmVHWGZmUGZoZEdHbDExZWZ3YkNQdWFpQkk0eGlINHlC?=
 =?utf-8?B?U0laMEJUQXdtYUZGZFkvMUhYcmlWaURqSjVLVFBOSUM3V0JlNElTOVdNZGFQ?=
 =?utf-8?B?SmRnSFF1Qlp0Nzc5aXdxTlY5QTBxalR2aHNHQjdtUW9wQ2VzdUVRZHZySEVH?=
 =?utf-8?B?VHREdThqOWV0SHlnQ2ZEc0tnNjhqdWJmb0tqMnM4NDR1SDl4NkpkUjBrbzZT?=
 =?utf-8?B?SVZuREpYRU9xaTU4a1NBY21leU1EL2k5SkpHRmhEeUl5MEJScDhEODNRbkhJ?=
 =?utf-8?B?aEhzeFRSQjdoZ2lIbkxDbkhXZUdJOTE3NWF5dHlXRnBZSVp2VmJvWFVMMVVN?=
 =?utf-8?B?UnpTcVJxZEF2cGRsVFRVUk10d3A2OGIramcrQ0M1aUxPYnJxcDVUd3Z1Q2Rm?=
 =?utf-8?B?V2ltVGMzN0E0aTJ5a1VwQVNUVmFlSVc4MjY1dkp4Nm5MZTRNdHJTRGxVaVE0?=
 =?utf-8?Q?ViVOU8E1wETyI7YKzzPKNBs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0542318DBA36FC4087CA7BAEACA0B8ED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633cd04f-5813-42d6-b835-08db26407e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 17:04:24.0037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HIJ/j3QtXqH91asE5OX7/WpiqFJBpZb9aDV6HJGCH3XSwhSek4fH+BTGs+/uHcRg25iuODAzBsGcy6dvPOk8t2XAgobIwFQQSB+bS2gCIjyaZWjp8MWh+C2ZTU4LbcID
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpQLlMuIHNpZGUgbm90ZSAtIHdoaWxlIHJldmlld2luZyB0aGlzLCBpIHdpc2ggd2Ug
Z290IHJpZCBvZiB0aG9zZSAib3BzX29uL29mZi0+aW50ZWxfdWNfZnVuY25hbWUiIG1hY3JvIG9i
c2Z1Y2F0aW9ucyBzaW5jZSBpIGNvdWxkbnQgZmluZCBpbnRlbF91Y19zYW5pdGl6ZSBidXQgZGlk
IGZpbmQgdGhlIGRpcmVjdA0KY2FsbCAtIHNvIGluY29uc2lzdGVudC4NCg0KT24gTW9uLCAyMDIz
LTAzLTEzIGF0IDEzOjU1IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSB3cm90ZToNCj4g
SW4gdGhlIHJhcmUgY2FzZSB3aGVyZSB3ZSBkbyBhIGZ1bGwgR1QgcmVzZXQgYWZ0ZXIgc3RhcnRp
bmcgdGhlIEh1Qw0KPiBsb2FkIGFuZCBiZWZvcmUgaXQgY29tcGxldGVzICh3aGljaCBiYXNpY2Fs
bHkgYm9pbHMgZG93biB0byBpOTE1IGhhbmdpbmcNCj4gZHVyaW5nIGluaXQpLCB3ZSBuZWVkIHRv
IGNhbmNlbCB0aGUgZGVsYXllZCBsb2FkIGZlbmNlLCBhcyBpdCB3aWxsIGJlDQo+IHJlLWluaXRp
YWxpemVkIGluIHRoZSBwb3N0LXJlc2V0IHJlY292ZXJ5Lg0KPiANCj4gRml4ZXM6IDI3NTM2ZTAz
MjcxZCAoImRybS9pOTE1L2h1YzogdHJhY2sgZGVsYXllZCBIdUMgbG9hZCB3aXRoIGEgZmVuY2Ui
KQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFv
bG9zcHVyaW9AaW50ZWwuY29tPg0KPiBDYzogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVz
LmFsZXhpc0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMv
aW50ZWxfaHVjLmMgfCA3ICsrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2lu
dGVsX2h1Yy5oIHwgNyArLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC91Yy9pbnRlbF9odWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1
Yy5jDQo+IGluZGV4IDcyODg0ZTIxNDcwYi4uYWVmZGFhNjJkYTk5IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYw0KPiBAQCAtMjQxLDYgKzI0MSwxMyBAQCBzdGF0
aWMgdm9pZCBkZWxheWVkX2h1Y19sb2FkX2Zpbmkoc3RydWN0IGludGVsX2h1YyAqaHVjKQ0KPiAg
CWk5MTVfc3dfZmVuY2VfZmluaSgmaHVjLT5kZWxheWVkX2xvYWQuZmVuY2UpOw0KPiAgfQ0KPiAg
DQo+ICtpbnQgaW50ZWxfaHVjX3Nhbml0aXplKHN0cnVjdCBpbnRlbF9odWMgKmh1YykNCj4gK3sN
Cj4gKwlkZWxheWVkX2h1Y19sb2FkX2NvbXBsZXRlKGh1Yyk7DQo+ICsJaW50ZWxfdWNfZndfc2Fu
aXRpemUoJmh1Yy0+ZncpOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgYm9v
bCB2Y3Nfc3VwcG9ydGVkKHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+ICB7DQo+ICAJaW50ZWxfZW5n
aW5lX21hc2tfdCBtYXNrID0gZ3QtPmluZm8uZW5naW5lX21hc2s7DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuaCBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3VjL2ludGVsX2h1Yy5oDQo+IGluZGV4IDUyZGIwMzYyMGM2MC4uZGI1NTViM2MxZjU2
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuaA0KPiBAQCAtNDEs
NiArNDEsNyBAQCBzdHJ1Y3QgaW50ZWxfaHVjIHsNCj4gIAl9IGRlbGF5ZWRfbG9hZDsNCj4gIH07
DQo+ICANCj4gK2ludCBpbnRlbF9odWNfc2FuaXRpemUoc3RydWN0IGludGVsX2h1YyAqaHVjKTsN
Cj4gIHZvaWQgaW50ZWxfaHVjX2luaXRfZWFybHkoc3RydWN0IGludGVsX2h1YyAqaHVjKTsNCj4g
IGludCBpbnRlbF9odWNfaW5pdChzdHJ1Y3QgaW50ZWxfaHVjICpodWMpOw0KPiAgdm9pZCBpbnRl
bF9odWNfZmluaShzdHJ1Y3QgaW50ZWxfaHVjICpodWMpOw0KPiBAQCAtNTQsMTIgKzU1LDYgQEAg
Ym9vbCBpbnRlbF9odWNfaXNfYXV0aGVudGljYXRlZChzdHJ1Y3QgaW50ZWxfaHVjICpodWMpOw0K
PiAgdm9pZCBpbnRlbF9odWNfcmVnaXN0ZXJfZ3NjX25vdGlmaWVyKHN0cnVjdCBpbnRlbF9odWMg
Kmh1Yywgc3RydWN0IGJ1c190eXBlICpidXMpOw0KPiAgdm9pZCBpbnRlbF9odWNfdW5yZWdpc3Rl
cl9nc2Nfbm90aWZpZXIoc3RydWN0IGludGVsX2h1YyAqaHVjLCBzdHJ1Y3QgYnVzX3R5cGUgKmJ1
cyk7DQo+ICANCj4gLXN0YXRpYyBpbmxpbmUgaW50IGludGVsX2h1Y19zYW5pdGl6ZShzdHJ1Y3Qg
aW50ZWxfaHVjICpodWMpDQo+IC17DQo+IC0JaW50ZWxfdWNfZndfc2FuaXRpemUoJmh1Yy0+Zncp
Ow0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgaW5saW5lIGJvb2wgaW50ZWxf
aHVjX2lzX3N1cHBvcnRlZChzdHJ1Y3QgaW50ZWxfaHVjICpodWMpDQo+ICB7DQo+ICAJcmV0dXJu
IGludGVsX3VjX2Z3X2lzX3N1cHBvcnRlZCgmaHVjLT5mdyk7DQoNCg==
