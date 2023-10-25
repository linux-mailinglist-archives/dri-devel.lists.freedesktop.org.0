Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D507D654B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 10:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAB210E5AB;
	Wed, 25 Oct 2023 08:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7553110E590;
 Wed, 25 Oct 2023 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698223016; x=1729759016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wzp+m6ZUrieY0F/XmoCqgfTsFQiXLvZ+IGAkionwWZY=;
 b=IAFeEpm06Fx9bUxGdJ1mXBbp9AHeb/2wmXMEVjvsGD4m17fvV9xNtGHt
 qFobH/WfErXlamx77BhCnwnlv3lQHpLCaxPDwp3irHUQfkmWtToQzsKt3
 SWlyXCApVqGL72xPOJHpHUkvB+NfB/y2YD2C7SWfYb6Wo9Jw3HvzS+nVo
 bD+i0wyAkQbMM8RjhZ/XW8h0SslnbennHkYRULPbJluGug3TXXi/T6JiB
 DZBTX4ctKCBDGoypIW1tDZUp3xscbjn3dFY0RabCKxwultOQxw2NFOsUW
 ndCr9L+vautDwQs3s1o+Wf79slgJggQM8yvf1s5kwit3sV/IoR4SjONRP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="384474640"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="384474640"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 01:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="875420445"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="875420445"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 01:36:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 01:36:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 01:36:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 01:36:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 01:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fora+7VMNPJOdV25M9sHiE7xGnXLaoTEVIfzgP2+hC5MxYszzhD0FOogeAZew7o3HQxt2Y3h61DnFhoWl8k7WpOl36g/urdc5zF/dfUkdR4jP1sKgjFWCfmeGYMthm1TIsLYgFYSTVNkRvmS/v/MPY2mBsSp7IlHL07qZlivFLXRpoaEtd3hBEp/dNJ35V9GzHn4wOVpf82uJ6l2orAStIs6hDy8IOrrDfwY4sGPUAd/C8EILq2fwDtvXc6ecYJII91GNzeZg4zl7vrK8yWpoF8vnGLOh2P9OFf7204jplgupq+iqjk4udp9JfivI4KvzfVOK9U75BHFob3J8anSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzp+m6ZUrieY0F/XmoCqgfTsFQiXLvZ+IGAkionwWZY=;
 b=iPU3/swsKM+2f98mLwCDzPFpP9V3w8C5SDUMuQHf2f3nNtSb/57oklwhWhQ/0JM/t1PCF7zzudAu5RvgTewgExGAiuAO0kFCqxLhiP5YYdZI6uHtppF0pRTrku9/VNLvhNUwH+jKIlOKezJarRgUYr2JquoQB8lVJ6OIrdJvPNkmmOK7Se19cR924w+IPPyOgWbGoelp4Zyb2qb606GwjHIFtfRIk4YSu1FVK7z2f3lLV54jNxpJxEdMluXgHr0TtqWv8L9POE2McqrW0F5wc346hfN2AAasma8LPf/hQEuLTRMR31bq9LnrJ6YITH9UESXoCMPTrtO1+7teLc85GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26; Wed, 25 Oct 2023 08:36:52 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 08:36:52 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
Thread-Topic: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
Thread-Index: AQHZ8S1p27EtMmEpjk6s1S3ZaAPFDLBaWnAA
Date: Wed, 25 Oct 2023 08:36:52 +0000
Message-ID: <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-6-tzimmermann@suse.de>
In-Reply-To: <20230927102808.18650-6-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB6118:EE_
x-ms-office365-filtering-correlation-id: 0af7df3b-cc2c-4e0a-d799-08dbd53589a0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbFe/9PfsKV4xRBSwnmMSkgR3Y2Es54DoNiLsLv0X2+0yrPqrN+Df5Z/oSBTjdr/4dyCJNBPMNwk8Oy1j5SnRPoCoMdonP6Dv96phmSt6q8a2larU0bmJQO4oxd0RIihqCtKyPasKqjUpAe3LuHWphgTQUC5HAoUfO5I3/SCgU07frwb+4ggfXXO+5K7hYC1aMmfrtsc7gWvhFw0PWFtBieK5WOmLShfV9igEj+QPw5kbitEp5bgKOhU5iGbFEr2KrbQDbBePrCJJazSWBHBAljbCA9y3wKTB14hx6xM4UB3m38FMntiiCW5BPekatdc5+sknK9sSanJn7mJxpgvFias6aTDenBWQTrvSH5BSqC/oXku2u/ll/ZYpoEw+41lSWrtKq8DCVmRXiRxfl811fQeOIlPGb97cfbIrXd4B3TdkY7uZNziwwIQctDb5EbG/0RpoJYgUh9tFRJ1KidNdTwvaKoM673o+9j07prIwZYCF9Y2cjyVMuYVO8y60kmVGosVajocmaDK9z0g4Wk3+GwvgyK5mt8H24ZBodQ2+27ggz91D+elSkEol0pja7bvFEvXnBYS3Sg6Gx/ICFhQ9jCTZiqdt4/OyuHd0LTjuzwhHt6lEz4pa2u6Lb5iHzIAodZhjzXPDVb6mG7dDgO5Sw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(7416002)(2906002)(41300700001)(478600001)(110136005)(66556008)(66476007)(91956017)(64756008)(66446008)(54906003)(76116006)(8936002)(71200400001)(6486002)(66946007)(316002)(8676002)(5660300002)(83380400001)(4326008)(6506007)(38100700002)(82960400001)(36756003)(2616005)(66574015)(26005)(86362001)(122000001)(6512007)(38070700009)(921008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDZmOU1DWmxDcHBsbzRYZzB2cTFiTEZBNXhtUVB6ZlE0cDlmSXdtaDYwNGFl?=
 =?utf-8?B?ZExETUl3Nm5wWm82UHlRTGlJbmQySGZSNjlvb3Q1TUR2c1hnZTcvVlNBa25G?=
 =?utf-8?B?dGZ0YW1NYlVTZEYzSHpyYW11OFFXNFFzSTBSdERWbjJkK0hmSDZIQmJ5Ym1G?=
 =?utf-8?B?ekdNVlZGUzFJWDhwai9tTTI5cDZmL1N3bUdhZG9xLzZ5QU1jT2VmN2NrMUtO?=
 =?utf-8?B?R1RxdjltTzVJTDlINHJ1eTc2cHJFYXNYaTJuTXZYa0crb1prL0hUdUpyZi9J?=
 =?utf-8?B?TGNrSmhha0lFYkVlczBwZmxXUUNyMVBMNWZhL0txTndPSGRyN2NmREoySnRp?=
 =?utf-8?B?UEFqNGRza2ZqMTMrZEZGeS9NbDM2cXZpUEhzNDBLRlFSdUVqa0JaT3FZR3RN?=
 =?utf-8?B?NjZjSVRmNmVqZENpMUE3c0xJbGZNZlBJZ2tGcGVMN1I2SjdFd0tQUGFtZ0pS?=
 =?utf-8?B?QmFxbEQySEJodmJEU1ljc291NUYrbjYwc2lqaTVpaSsvRnZGL1BBZm9QdUxC?=
 =?utf-8?B?SDZYRzJSM3F5Mk5wL3hPTFVYaXg0K3RSNTg5ZmJDdXp6LzlsbXI0VVZyQlhl?=
 =?utf-8?B?c2MyTmRmNCtaVHNqeDZpdFdIYlNMd3NDOGVnNWZoWEVCY1YzbWNWOEc1a1lv?=
 =?utf-8?B?ai81RVJIdCtVNlJURDhqcDU4cU1PYkhlNHREdUlGMktLNm80ZkMwUUl3ejhK?=
 =?utf-8?B?L0YwVU1DVmVXVDZWWUduazdpN1VrVjJaaFgwcUNZdFVZRmUxcTFISHluOUJI?=
 =?utf-8?B?UWZLSi9odjRmTkZGck9tR2lVdk4zL2ZyY1BmTG1WaWx5dVZpQTVmMk1hdWtr?=
 =?utf-8?B?ME1YVkp0c3R4Rll0RkR1aUppVVRUN0FLMERnNk9PcWNPeDBzOUVyVjU3Mkt6?=
 =?utf-8?B?a2V5cXRnWEg5d1ZJRi9hb2FWa0RFaHRnSHo3cHBTNzY0K0JaNE9rZTdiWHdU?=
 =?utf-8?B?WDZpWVdKVVU4Vlc5NURldEwyYmRDVUo3d2FiOStudVorcWEwRFJ2VThMQ3Zh?=
 =?utf-8?B?c3hhZ1IyM0NQMGl6VGMrZFhMSkdwYzM2aFhmOHEvZWg5TXFUTGoxbm1hWUdp?=
 =?utf-8?B?akhUN0VDRjhIUVBkYWo4WXVSVnBrQUpUOTZqM3NVYUcxeEJQczVLbGRNZmg2?=
 =?utf-8?B?TEtGUnk2L2JLNkh0VE0rUERqUE5tNDVPY1pzYlZrWnVaOFlCanFzNTQvNmZq?=
 =?utf-8?B?aEZsUTFCRlphTzJQRDlvYnhFZHFLQllRcEJUSU9OUXJSSGVIMnNvZXJneGhW?=
 =?utf-8?B?dDVMaFVTL1Q3OGVEeFZYbnpPNmpDSW5iT0l5NHkweEJ3OHNPTVgxUTFId1c0?=
 =?utf-8?B?Q1RNQjVFdW8zWnBkdGdmdHZpcW1ObmcwajYybzVvRkJvdTd3b2hsMStpdVZ3?=
 =?utf-8?B?MjZaRVkrL2N0V0dta2JJMlBlanRQc3VJWllGQWV6MFhZbElnemhGZUlUdTFs?=
 =?utf-8?B?bTVNOXkxNFZCL3RDUjdvVVMyZjBSNFdQZER4THJSLzVpb2FMbzdoVHpRTUVo?=
 =?utf-8?B?ZFlTbEh3Nk5zcmV2bXN6Tm9qdXFNdXZVZjMrYlV6SU5IdFdSclRTQWlWOFZJ?=
 =?utf-8?B?VHBqT3hDSWRxdENmRk56d3ZJN0NlU1hUQVJQOGh5M0MxZ1h4M3VWdUFFNWZq?=
 =?utf-8?B?cmNVYUhmSGpHUUVwZ3FYZllxUzBWNjI4cUsrYmtFV1B2Q1hkd0dwa2V3eFpW?=
 =?utf-8?B?RERtT0Ezay9UL3lEdG1JMmszQ3VHQzB2dmIxcC91NXAvV1duZTB3elM3cFVw?=
 =?utf-8?B?Y3RReUZCTTF1MW5IOHJRcU5NNTRmbWFDQnB6b3pnTDlBQWFQd21WOU1YNnpu?=
 =?utf-8?B?cnhoZW9LeGVPKzVyaDB6cTN6eWI3bFdHZ1FyVGxqaDdnbWs1RDBVQ2xKb011?=
 =?utf-8?B?ZXNCZkVIaURid1cxRjNrNlk0L3hLeDd4VEgvZFdYN09mWUxNeGpjV1ZMb2Er?=
 =?utf-8?B?Z0tEcUx5amtCOEwydVBnYmd6OEFJbDdVcmFRNE5nOGlSL2l1ZkJudEtrS09R?=
 =?utf-8?B?TkxtL2xWUzNQNmZSZzJsUC9EWnpZc3lUWTZkemZvVk5majgvek9tWmVFR1Bz?=
 =?utf-8?B?Kzh1c1NmSjdsQ1ZodlpRQm0yaWJKdU5SMm1WdTlNUW5hU3VmM0tjcndCOXVT?=
 =?utf-8?B?UCtrNGxCRUxzMDNpVjJPQWcwWVByRHNmenJrUWxHeVdCa2ZxOUhkbE8yYTV2?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DC3FA46BC329348AC550E7CAE633653@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af7df3b-cc2c-4e0a-d799-08dbd53589a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 08:36:52.1658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arvHIwI5c2wR/uO+/gcLPhr9Gj9WiI4Pw17h+XHuwz1IF2McMjqPobBf8VydXxqdiFCNj+UK40xw7NDJRCycTCqgRwlhTICxY+25Mgk2mhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLCBPbmUgbWlub3IgY29tbWVudCBpbmxpbmUgYmVsb3cuCgpPbiBXZWQsIDIwMjMt
MDktMjcgYXQgMTI6MjYgKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+IEluaXRpYWxp
emUgaTkxNSdzIGZiZGV2IGNsaWVudCBieSBnaXZpbmcgYW4gaW5zdGFuY2Ugb2Ygc3RydWN0Cj4g
ZHJtX2NsaWVudF9mdW5jcyB0byBkcm1fY2xpZW50X2luaXQoKS4gQWxzbyBjbGVhbiB1cCB3aXRo
Cj4gZHJtX2NsaWVudF9yZWxlYXNlKCkuCj4gCj4gRG9pbmcgdGhpcyBpbiBpOTE1IHByZXZlbnRz
IGZiZGV2IGhlbHBlcnMgZnJvbSBpbml0aWFsaXppbmcgYW5kCj4gcmVsZWFzaW5nIHRoZSBjbGll
bnQgaW50ZXJuYWxseSAoc2VlIGRybV9mYl9oZWxwZXJfaW5pdCgpKS4gTm8KPiBmdW5jdGlvbmFs
IGNoYW5nZSB5ZXQ7IHRoZSBjbGllbnQgY2FsbGJhY2tzIHdpbGwgYmUgZmlsbGVkIGxhdGVyLgo+
IAo+IHYyOgo+IMKgwqDCoMKgwqDCoMKgwqAqIGNhbGwgZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUo
KSBpbiBlcnJvciBoYW5kbGluZyAoSmFuaSkKPiDCoMKgwqDCoMKgwqDCoMKgKiBmaXggdHlwbyBp
biBjb21taXQgbWVzc2FnZSAoU2FtKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9mYmRldi5jIHwgNDMKPiArKysrKysrKysrKysrKysrKysrKy0tCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMKPiBpbmRleCAyNjk1YzY1
YjU1ZGRjLi5kOWU2OTQ3MWE3ODJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZmJkZXYuYwo+IEBAIC0zNzgsNiArMzc4LDcgQEAgc3RhdGljIHZvaWQgaW50ZWxf
ZmJkZXZfZGVzdHJveShzdHJ1Y3QKPiBpbnRlbF9mYmRldiAqaWZiZGV2KQo+IMKgwqDCoMKgwqDC
oMKgwqBpZiAoaWZiZGV2LT5mYikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRy
bV9mcmFtZWJ1ZmZlcl9yZW1vdmUoJmlmYmRldi0+ZmItPmJhc2UpOwo+IMKgCj4gK8KgwqDCoMKg
wqDCoMKgZHJtX2NsaWVudF9yZWxlYXNlKCZpZmJkZXYtPmhlbHBlci5jbGllbnQpOwo+IMKgwqDC
oMKgwqDCoMKgwqBkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgmaWZiZGV2LT5oZWxwZXIpOwo+IMKg
wqDCoMKgwqDCoMKgwqBrZnJlZShpZmJkZXYpOwo+IMKgfQo+IEBAIC02NzEsNiArNjcyLDMwIEBA
IHZvaWQgaW50ZWxfZmJkZXZfcmVzdG9yZV9tb2RlKHN0cnVjdAo+IGRybV9pOTE1X3ByaXZhdGUg
KmRldl9wcml2KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZf
aW52YWxpZGF0ZShpZmJkZXYpOwo+IMKgfQo+IMKgCj4gKy8qCj4gKyAqIEZiZGV2IGNsaWVudCBh
bmQgc3RydWN0IGRybV9jbGllbnRfZnVuY3MKPiArICovCj4gKwo+ICtzdGF0aWMgdm9pZCBpbnRl
bF9mYmRldl9jbGllbnRfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2NsaWVudF9kZXYKPiAqY2xpZW50
KQo+ICt7IH0KPiArCj4gK3N0YXRpYyBpbnQgaW50ZWxfZmJkZXZfY2xpZW50X3Jlc3RvcmUoc3Ry
dWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
MDsKPiArfQo+ICsKPiArc3RhdGljIGludCBpbnRlbF9mYmRldl9jbGllbnRfaG90cGx1ZyhzdHJ1
Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAw
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jbGllbnRfZnVuY3MgaW50ZWxf
ZmJkZXZfY2xpZW50X2Z1bmNzID0gewo+ICvCoMKgwqDCoMKgwqDCoC5vd25lcsKgwqDCoMKgwqDC
oMKgwqDCoMKgPSBUSElTX01PRFVMRSwKPiArwqDCoMKgwqDCoMKgwqAudW5yZWdpc3RlcsKgwqDC
oMKgwqA9IGludGVsX2ZiZGV2X2NsaWVudF91bnJlZ2lzdGVyLAo+ICvCoMKgwqDCoMKgwqDCoC5y
ZXN0b3JlwqDCoMKgwqDCoMKgwqDCoD0gaW50ZWxfZmJkZXZfY2xpZW50X3Jlc3RvcmUsCj4gK8Kg
wqDCoMKgwqDCoMKgLmhvdHBsdWfCoMKgwqDCoMKgwqDCoMKgPSBpbnRlbF9mYmRldl9jbGllbnRf
aG90cGx1ZywKPiArfTsKPiArCj4gwqBpbnQgaW50ZWxfZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2KQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7Cj4gQEAgLTY5MiwxNiArNzE3LDI2IEBAIGludCBp
bnRlbF9mYmRldl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gwqDCoMKgwqDCoMKgwqDC
oGVsc2UKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmYmRldi0+cHJlZmVycmVk
X2JwcCA9IGlmYmRldi0+aGVscGVyLnByZWZlcnJlZF9icHA7Cj4gwqAKPiArwqDCoMKgwqDCoMKg
wqByZXQgPSBkcm1fY2xpZW50X2luaXQoZGV2LCAmaWZiZGV2LT5oZWxwZXIuY2xpZW50LCAiaTkx
NS0KPiBmYmRldiIsCgpXZSBhcmUgY3VycmVudGx5IHdvcmtpbmcgb24gbmV3IGRyaXZlciBuYW1l
ZCBhcyBYZS4gRHVlIHRvIHRoaXMgaXQKbWlnaHQgYWN0dWFsbHkgbWFrZSBzZW5zZSB0byB1c2Ug
aW50ZWwtZmJkZXYgaGVyZSByYXRoZXIgdGhhbiBpOTE1LQpmYmRldi4KCkJSLAoKSm91bmkgSMO2
Z2FuZGVyCgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmaW50ZWxfZmJkZXZfY2xpZW50X2Z1bmNzKTsKPiArwqDCoMKgwqDCoMKgwqBp
ZiAocmV0KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9kcm1fZmJf
aGVscGVyX3VucHJlcGFyZTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IGRybV9mYl9oZWxw
ZXJfaW5pdChkZXYsICZpZmJkZXYtPmhlbHBlcik7Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCkg
ewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJlZShpZmJkZXYpOwo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IC3CoMKgwqDCoMKgwqDCoH0K
PiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBnb3RvIGVycl9kcm1fY2xpZW50X3JlbGVhc2U7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZGV2
X3ByaXYtPmRpc3BsYXkuZmJkZXYuZmJkZXYgPSBpZmJkZXY7Cj4gwqDCoMKgwqDCoMKgwqDCoElO
SVRfV09SSygmZGV2X3ByaXYtPmRpc3BsYXkuZmJkZXYuc3VzcGVuZF93b3JrLAo+IGludGVsX2Zi
ZGV2X3N1c3BlbmRfd29ya2VyKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiAr
Cj4gK2Vycl9kcm1fY2xpZW50X3JlbGVhc2U6Cj4gK8KgwqDCoMKgwqDCoMKgZHJtX2NsaWVudF9y
ZWxlYXNlKCZpZmJkZXYtPmhlbHBlci5jbGllbnQpOwo+ICtlcnJfZHJtX2ZiX2hlbHBlcl91bnBy
ZXBhcmU6Cj4gK8KgwqDCoMKgwqDCoMKgZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoJmlmYmRldi0+
aGVscGVyKTsKPiArwqDCoMKgwqDCoMKgwqBrZnJlZShpZmJkZXYpOwo+ICvCoMKgwqDCoMKgwqDC
oHJldHVybiByZXQ7Cj4gwqB9Cj4gwqAKPiDCoHN0YXRpYyB2b2lkIGludGVsX2ZiZGV2X2luaXRp
YWxfY29uZmlnKHZvaWQgKmRhdGEsIGFzeW5jX2Nvb2tpZV90Cj4gY29va2llKQoK
