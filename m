Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE1698517
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 20:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBC310E297;
	Wed, 15 Feb 2023 19:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290E810E297;
 Wed, 15 Feb 2023 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676491142; x=1708027142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qFVLmcJCvnlTwIHFANY62Yki1AsxP/Rl0BPk4KYZzxo=;
 b=LlMvOqGMmuSZlJYfy3kIwOwQNX3vu199shf/+j8ZQBQjXCTkvD8S0kYQ
 GK0WYO7zpnX6QAEBjiIei9lrCeLkVo1Qkj1pjPRX5NxgkCihKXE+AWVH0
 OX7uqgzBbjHn8KFP8bpwXgC8sVbumTMcoqclx84tb84OMB6KZTV1EjezP
 p3LFYpWrPbAYs5l9Tft4eKefyLtjGQRS0DZXvjy+HgYUwXjX9DEBtO9l8
 mmlarEd8zr9UC6cBr9GZbsRCFKloOLDIg+4wHYK8X+H6CqU+Ny0wGsoum
 0VhMKAXPrppGPCYRMYB6XiHvQneIp/xXdFU7ehzNSSWHIIQNWGkM08Atg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396163358"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="396163358"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 11:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="647362525"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="647362525"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 15 Feb 2023 11:58:59 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 11:58:58 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 11:58:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 11:58:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 11:58:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RubC+otFTcWN4TOTNmR8sUPNYGA8eQ6bh5mzkv3RtLvlXHJByhztcJOnsWUdKyGEbqE8qmkg8gm2ZNbFwCXqnZ/HlroLgDL7rvbybv8LV1JPR3vcmTo0+dViId+H04lt+LCOCsMe2irSirqze3xfNhrW79b/zwB57AuucEpJ2Gr2St/J/jJ5TS6GPoTqsTIWMRBT8BD8BPzB5EhON+ZSHT38r+Zx8d2PrUfXSi9L4yNxWjvnNRzy2/Mq3HlHHwDAqHTl7qhhDj5zm+wb0bH908Iu6x7NVBiSERO3fdQs+yLJoAQ5UfEsVCGZvUpolUGWf6EOXf74xOAItcAuaLn6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFVLmcJCvnlTwIHFANY62Yki1AsxP/Rl0BPk4KYZzxo=;
 b=Xe03a1eTVq/GWsTAIdzL9OwsMI+uySoBo/GOHtB6GmqoZRwO00MjaFVUgl5AkUroPvEe2u/XC3I4vc7aniAtV91PTl5umDhhOyNnL1mUi8LLw5gdW0UQdzTC9IPWhlPQ42AHsfq39b9vGiZGSuOKkB40Groy8iaRH4eU1EUHcdlbNBc3ezDu//LW5Gdnuyh2MT9Bvuykfj0L9vE8lk4xEvHl3/F7sOXmAT/9+f9FVDd5C5vTuHyH6Hgw72W3M7eWS3rXqjrfbZiczez0zypTXEfvle060OxYYdsxfGB0lrsiABVL9ZQBTciATYpSJ5FVB5DDxCz21Jqh8aZfTf2uTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.22; Wed, 15 Feb 2023 19:58:56 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 19:58:56 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Topic: [PATCH v5 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Index: AQHZQLy8VK2j7vr05k6Pxu6OjuZuFq7QbmMA
Date: Wed, 15 Feb 2023 19:58:56 +0000
Message-ID: <e7f6b644a547b27d7f8cbab1000ef7c212e82a65.camel@intel.com>
References: <20230214213844.2890382-1-alan.previn.teres.alexis@intel.com>
 <20230214213844.2890382-5-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230214213844.2890382-5-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY5PR11MB6488:EE_
x-ms-office365-filtering-correlation-id: b102a650-4e0b-4fa1-0068-08db0f8f1221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cE9S467vJF7Fk+rxmUMz68VEOuFcQ5/1BRuo49z2NVy7i2dcpCcbwxe/LJ/RPd4MzKy9bP77aU7AO8Kv111yqBAzuYuwX6EK/AC7u3kDb6sH+EpVovnGDVTMMcj8PhgSXIl3xKTTsbNpiJgcGINkpbu0uTpsxHEvQ7H7DU4/zULbb0lo6zJeej1PsY3auZC0pTqE7rah7eW3m/+0SfcaVawEWRm2Y/aSJRuGH0+4ppK5WKsIgo16Lo8MmAzwYzzYqyp5acvX/63pmT/bVkLW/HF9nH7cBXN3BBxYmlNKR5WhGBWE+LPytwH7fjHyJz4CB7W6m+ifdRAvRMCGLNEU5mvm8N1DoAHBvUJfJvRM155vg+DumHjw+uwnEKu70oRMh3fIgZ65gz9H0oX2tsI7or8iZDylkMvcj8cHySrfBmz45XD84UP6JVfxbZrXxKZPni8M+uLejIwrHenolXlMIq1Ibt9uxyL7fxxO7q2XkArFnixgvutNcwpAMqfFA0hLLnlRFfYMNgTkM1QFJDMYzb7ewiXvyTsa5GB2K/AizmG1JHZmKjNfgmq1lJAhD+tCMSnMBn2anIaBkRBk+68FGBFoA81pgWS8UAIkL2ljJ6ju830fyERcsFBHrjSN495NCKzACXM6DCnPh3/TmsKNOemRQaNuKs37JfYLT1sao0WMrVO3pm+iecwZgskWRDZBxQHGss2HWiQPrW+aJtyV7w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199018)(36756003)(83380400001)(6916009)(122000001)(38070700005)(71200400001)(66946007)(2616005)(64756008)(4326008)(66556008)(66446008)(38100700002)(8676002)(82960400001)(76116006)(86362001)(66476007)(26005)(8936002)(6512007)(186003)(54906003)(478600001)(91956017)(316002)(6506007)(6486002)(2906002)(107886003)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWRtelhIa2R0QWdQNXcxWGZGZzJYSVZMYTJ4Q1d0TStEU1p4ajAxWjhzT1Vz?=
 =?utf-8?B?TWJVSHJJeXVJbmw3TDlhOS94dHlwRFdBMFBQQkVZMEdBMUQvT3pHNDUwM1Bo?=
 =?utf-8?B?UTFvK3RWZ1RkK3FwMWdId1BuTm1aTU45RlBER1p3RlJ2RFRHdTAyZUZHWVVq?=
 =?utf-8?B?VHdpN0pTeUs5MUNtb2oxUU1SK0cySXVyOWpXWnY5L2JQdTk3dzVXQ3NWb3h0?=
 =?utf-8?B?bU5tNkpQQXVpY2R2YnE3RE1RMmh6VlRmRGVHb1JQUFJtSnUxMWVmQ3EvQ0tM?=
 =?utf-8?B?bVY1YkFPWCtLYmZIVnlRKzMxbkJNTHNMMFdDUUVJTDk4N0xVMVJ3WUNSd0pm?=
 =?utf-8?B?RURadm9zSFZLcGdOSkJnaytkRWRyZ2xLT1FUcWZ1cmtJMW5MTHlmbkNIY3dC?=
 =?utf-8?B?RzJhR1Y2RlJ0S0h3ZjBwUXQ0MnlVNFIvSWtxazNKTFFuS1pvT1pMZmxjNGVU?=
 =?utf-8?B?Um5qSWNOLzFMMXgzc1dVZW5sRFVneERRY0hoS0l4Z0g0SGRmYUh4a1E5NDJH?=
 =?utf-8?B?elp4bmNIbk92dlhIR0dDclM5bWVRa1k3SmUwamRITVNZRVExdm1pTVd1NkFK?=
 =?utf-8?B?WjVKdXQrcHFEYWlNZmpFVE1JSDh6aXlKdkk4K290UGgva3huSGc2bmlmdno5?=
 =?utf-8?B?ZWk5blV2UGdJZVA2ckNGbThDN1A2UU00aC9VSG5VV25MRzRoN3JYM1RjcUpT?=
 =?utf-8?B?TUgxUnFXeU92dG1BbGZSLzR3d3FSb1MwQ3ViQ2pmZEJkNzJNclpuTnplNnNp?=
 =?utf-8?B?UVo1M2t3TE1BM3NVZkRKNkpLT0V6d0o3U2tYUDRDMGF0d1NFRHZUT2xWanpW?=
 =?utf-8?B?REwwZ0lIS3FlUXYvTGRsTGJLa082VnJLb1VLN0tLZFp2L2FnV2UxKzViNjNR?=
 =?utf-8?B?bUtLc3NiMFowakVvVHZRbzFxMWJIR1A2dzJ3RnA2SkhTd05za0FaRTJvbndW?=
 =?utf-8?B?cG95NFdsejhGY1hSeUp0RVRnMytXUlJrZkkzV3RmTlQ0Sm5RN09GZ0xIbjl3?=
 =?utf-8?B?MDVZRnh0N09zZnBzQXU0UGZpOHNva2hXbjdPK1VEMlRNZVgxeXZLRmJZV1kz?=
 =?utf-8?B?SldLdVhkcUlaQUsxcTZ4U3AxdWtIZS9kMmxHNFMwdjN2ZmpaWlZsK1lEMnph?=
 =?utf-8?B?elR6bnhweWlMYmNNSXpCcmlpZ0pzeGhmOWFVbmlMT1hxc1RQeGQvODU5QnZl?=
 =?utf-8?B?K0JONzZwY3pOaDZ4K2M4cDRjYnZURGZjUFdzVHZ2cEZ2Q2ZsUXJod3QwdVZJ?=
 =?utf-8?B?ZGlrK1RQTmJHV0pkaGhRdi9yeTg4V1V2ampMVzE3MmNiWDZKMDlBemZWQ05v?=
 =?utf-8?B?UHVmV0pDdndGeVpNYWkvSzRwV0E2akhBK0xkSk8waGN3dHJmL1F3Y2lEUmJa?=
 =?utf-8?B?WEljeTF1UUFVRjl0dE1OcmRJTHlwbEZ4U1VpelVrVXAzM0FmS0xjUDFWN3Bm?=
 =?utf-8?B?c3pjNHp3RFFxa0tKUzVGRmZ5S0psUG1SdEo1YXVFenRWRHRFYVpaSkJ0eW1j?=
 =?utf-8?B?bmVhcUlINXlRWlFRSi91YWVWY0xaQWttZVlld0YvL2NBN1ZjNzQvaUJBZ01J?=
 =?utf-8?B?Qm1GdE5zdjdiWTM4d0NxL094OWc2NWtYTjVWYzdoeGduZk1zZlVLUzJLNzZj?=
 =?utf-8?B?THErT2JCQktaNldSNkhoUnowbVpVT2thWEV2VVlwOFdPZkZHcUxGSm5XWHBZ?=
 =?utf-8?B?NlBFZkxXVVpqVDUyWnZORTYxUGp5SnFnSWpjSGRlQ3QyWURya25UV2kzakFN?=
 =?utf-8?B?d2dHNXo5YWhNeU9ERjRUU2N1eWhwcVBHV05vN0pQditjSWNNSHRmbmpsaTNX?=
 =?utf-8?B?V3RNOVNGMzVHOFdYaXNSd3lJRmc4ZXRmUnlLZVdDcC80dXExRnhFSjV4VFNM?=
 =?utf-8?B?bE9aemxTenJlT1hlTmNncnpqc0lnOE1tam9TTU1kVFBKZ3g0VzRPM1VPRnZk?=
 =?utf-8?B?Y2FXUnE0d29XZjJMNUJsN0lERzBwWXgwU0lJQWhQdW11L29rL0dnU0JUZE1N?=
 =?utf-8?B?WkYrczV2Nnl2M09nTVNDYlk1UUNEd21DUzJCVEVqNlp5NzVXMXRLQnRGZ0dh?=
 =?utf-8?B?Ym1GZ2NZOWxhWWxtTGlNTC9OOFFweTFaRjMwQlpGZmZUVXEzdmYzaEZ5Z29y?=
 =?utf-8?B?TitPMEZIV2E1RkQ5WFRkOEYwMk1aRllHY0NBeVNoRHlacHBMVDNnN1BpRUNu?=
 =?utf-8?Q?ZZ36/zchuBo1bV5vcmlZf8y3j3flsCgXHenU2dA76y6r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB86453D792E074C96F886D24722F299@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b102a650-4e0b-4fa1-0068-08db0f8f1221
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 19:58:56.1793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHT6b/TvBw03fEjTMgefmNM2mQlKim1XC1azXLgUsrZdNHEoFcuTnZEJgQFunRAPUJ0OmVIY6p4kU/8nJ91f7zozY97PvCmIfyGSMs6c11x6KleWxo3EkGfGN5a5Ilr3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAyLTE0IGF0IDEzOjM4IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KYWxhbjpzbmlwDQo+ICtzdGF0aWMgaW50IGdzY2NzX3NlbmRfbWVzc2FnZShz
dHJ1Y3QgaW50ZWxfcHhwICpweHAsDQo+ICsJCQkgICAgICB2b2lkICptc2dfaW4sIHNpemVfdCBt
c2dfaW5fc2l6ZSwNCj4gKwkJCSAgICAgIHZvaWQgKm1zZ19vdXQsIHNpemVfdCBtc2dfb3V0X3Np
emVfbWF4LA0KPiArCQkJICAgICAgc2l6ZV90ICptc2dfb3V0X2xlbiwNCj4gKwkJCSAgICAgIHU2
NCAqZ3NjX21zZ19oYW5kbGVfcmV0cnkpDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX2d0ICpndCA9
IHB4cC0+Y3RybF9ndDsNCj4gKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGd0LT5p
OTE1Ow0KPiArCXN0cnVjdCBnc2Njc19zZXNzaW9uX3Jlc291cmNlcyAqZXhlYyA9ICAmcHhwLT5n
c2Njc19yZXM7DQo+ICsJc3RydWN0IGludGVsX2dzY19tdGxfaGVhZGVyICpoZWFkZXIgPSBleGVj
LT5wa3RfdmFkZHI7DQo+ICsJc3RydWN0IGludGVsX2dzY19oZWNpX25vbl9wcml2X3BrdCBwa3Q7
DQo+ICsJYm9vbCBudWxsX3BrdCA9ICFtc2dfaW4gJiYgIW1zZ19vdXQ7DQo+ICsJc2l6ZV90IG1h
eF9tc2dfc2l6ZTsNCj4gKwl1MzIgcmVwbHlfc2l6ZTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJ
aWYgKCFleGVjLT5jZSkNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsNCj4gKwltYXhfbXNnX3Np
emUgPSBQWFA0M19NQVhfSEVDSV9JTl9TSVpFIC0gc2l6ZW9mKCpoZWFkZXIpOw0KPiArDQo+ICsJ
aWYgKG1zZ19pbl9zaXplID4gbWF4X21zZ19zaXplIHx8IG1zZ19vdXRfc2l6ZV9tYXggPiBtYXhf
bXNnX3NpemUpDQo+ICsJCXJldHVybiAtRU5PU1BDOw0KPiArDQo+ICsJbXV0ZXhfbG9jaygmcHhw
LT50ZWVfbXV0ZXgpOw0KPiArDQo+ICsJaWYgKCFleGVjLT5wa3Rfdm1hIHx8ICFleGVjLT5iYl92
bWEpDQo+ICsJCXJldHVybiAtRU5PRU5UOw0KPiArDQphbGFuOiBuYWNrIC0gaSBuZWVkIHRvIG1v
dmUgdGhlIHRlZV9tdXRleCB0byBhZnRlciB0aGlzIHBrdF92bWEgLyBiYl9ibWEgY2hlY2tzDQo=
