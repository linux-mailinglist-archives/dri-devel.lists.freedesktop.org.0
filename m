Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC27119F2
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 00:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D292D10E781;
	Thu, 25 May 2023 22:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CCA10E781;
 Thu, 25 May 2023 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685052236; x=1716588236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lcKzA3KZ5ZH8AW9idZc8o4rzSwBXSBU2ZoS32aOEiRs=;
 b=RtrGlwb+VAteR7wfrrV0Xu3xO8Poz4j+0yiYp88hdrFswLBmMB9IGRtU
 pt5qTxoahFhaWyRcZbkMIuCxqbyV/j2i32nLDvgxbc9pxxBPV/jmPU8i/
 Uc94Y88axLOEnNkhcn8kcf97cZjqG0amqEJrVX9H43fglBhsCp3lCNpJm
 Jzr0iThxi/bu8xy7JyWe04/s965/GaxHNusjnuB4Lki3L0cOP04HmQDNg
 9SF2L2Ry9LDPbEYgNo/WpM84CjM7yJQqrKrv9tE5DbJqc9El8s1TAQMtX
 fZFQOegTzfV7Ad905C3721r4iwY681W6Rlc0ChQWuQdhODazWLBJJR6re A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417522652"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="417522652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="735746070"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="735746070"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 25 May 2023 15:03:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:03:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:03:53 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:03:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIf1M/5lUSQe0d7wjfd5aG4h2Y2s6rS6rEcVjbdXpLqTtXyvwE5LvoU9CypjfQ4yvMxu/K+R4MxsElNLwwtR8HTiffkEU7b71X+7UYq71T0rI5r4u2A89nCV7VJV5yB8tCCfWXL+kh1NWVsSKAc4ewRORWA6YfGDgfIwxQGQiaW5UaADxZhEGbydDqIY9nQSgeS+vR83f2eNMWAbNlCtWvHAw6r5AML4ligngbzREj7B6p4arvL7svr/zS6xYI0ZmBxnM8dCD0523yUjYps1SuToOqiXorssOvDR7+RUJTKeNihk2j2PKs2hmNYbpZosiF/E/xnWzsL0E1uec1/u0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcKzA3KZ5ZH8AW9idZc8o4rzSwBXSBU2ZoS32aOEiRs=;
 b=CHJc+6J1i4PIMeTs7TvFzrMeOQHC2Q/Rb+c2bStBeqyvyEpdE1enj2x6qsAudkrH6fJlQ4/Cf1Ud/UoD7G42WumGzPCWc5rzEViTDyv7siprQEFM64zqn1DKVebt5Nta4HhGIuLOvE+lNdH7++9vaprPL+D9qt2DBm/v/fs6tW9Rsvod6LSkkh9yCeL401tWvisG4UjNMyFM9MX4VngD7MsMEDCG2JaBYli+1A8UT2/jRM3WeqfTd5vyalb3dRVIzfvODb0owlUPabFxq/xBiCZgd2IpLRpzpYKyNsfLOcKkeYYUOma/NCIVzZXGAVBqUMnCEL0bP4RvucDZEhYSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 22:03:49 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%7]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 22:03:49 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/i915/uc/gsc: extract release and security
 versions from the gsc binary
Thread-Topic: [PATCH 3/6] drm/i915/uc/gsc: extract release and security
 versions from the gsc binary
Thread-Index: AQHZf2tRh28FsVjDD0GOD8EX4/J13q9qkJ4AgADEMwCAAFXmAA==
Date: Thu, 25 May 2023 22:03:48 +0000
Message-ID: <69dff59d8fd61aaa6989d2645dd53a9c9a590b29.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-4-daniele.ceraolospurio@intel.com>
 <674e85c47cd29b39ad902e5445234b93b2f99883.camel@intel.com>
 <5b16ee44-3645-88e1-4c03-b46eb57ca1f4@intel.com>
In-Reply-To: <5b16ee44-3645-88e1-4c03-b46eb57ca1f4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB8105:EE_
x-ms-office365-filtering-correlation-id: 026a5c27-0ad4-4c45-9c76-08db5d6beb06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9E9nNMHGvIrL+RU/QvEcRR4eHb+KK10uWUjkK6jnzsvOMoFROXoO+4+1bokvBUVKUKSBcZGBGYlstNstJl+sYDN5t9ZHICE72h8Wa8jBzCSzcPs1KIrmJ5OvfVpoD/ra3ibj+MXk3LJr/wo/NX+6wvgYbi+jXH9aTKuyRaqE0epmfnDfZYtPOiA4RDk5P106MSWeHk8M8Vm96JLk30KmBuVPtxMIO3XRI0PioZnv3ufk68PNdOflJc9ZWR9iTEF07tygEM4a3fxtBpPXSQfPxmW1SWQrTy+wV8sF/QDdHdJ37VqxpnmQWHY5mlNhw87iSgV2GtrZvT7iYcCYbVMcK0fjUL+pPoUny1MndTpMaekF5V7YDb6KuvEKrx7Chp+oq3w3iMx9oIqp+rZ4Jb0MkFc/Pa3QtImEja9DqZuravGJG4w7Z/JlK5Zd8923Q7zaWlSQ9MDk+Y0q+qFgXE1fhxa0H4xrt2UpRlqv0nfg+9wB1qInnd6PTSWb63LlQRwC264lZ23wYlgwK0+WG88eAQUKY8WBQmFep0UnviVrl2OlDsVvXCX3hBhheDvMHBd6g+J2odEbsHCt7CWjg8OxuHNnSBY0Sg5lTmQo8a4kohAWDILmgVKBZKO/ujFa5YHs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(478600001)(82960400001)(38100700002)(122000001)(8676002)(8936002)(5660300002)(6512007)(53546011)(91956017)(6506007)(450100002)(2616005)(26005)(64756008)(66946007)(66446008)(66556008)(76116006)(66476007)(38070700005)(36756003)(83380400001)(316002)(71200400001)(186003)(2906002)(41300700001)(86362001)(6486002)(4326008)(15650500001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXhDOXY3TXJqcXpDaHZqSFV4VnVkWTNVUngxSWFUL05xWURmNXl6eWR5RXZl?=
 =?utf-8?B?NXFGSHZ4WnBOQldaYk1YOXk0YmhvYTlYTkhUVm8ySWFPdlo5dWlBN3hIdElj?=
 =?utf-8?B?RGY5aDV4QStyS0ZJZFRlSmlRbVI3VXY4S2x6MTZQeEZuMG5WKzJETDgvUHV1?=
 =?utf-8?B?UStuYkY1RTRZSFlaV2haKzlaQ3NiUjJqNXhpYXpud1dZSFRjTVpLbCtyODZ6?=
 =?utf-8?B?U1VnWmFmZnVYd3EwSnZEM3ZJSGFMbWFmanVKRnVQcHVsVlVFdnhjKzlHN0RN?=
 =?utf-8?B?ZTBKOVkvQXdOREZWY1BzbVBjRUR5MHBzZ2diL2svcDRxZGVGcng0b2xiTjdK?=
 =?utf-8?B?NTVrRDgzWEZnMkhraEppNUtiSmN0aEtES2NwYzMrcjdraFdmZTcwZmdlczV4?=
 =?utf-8?B?ejljY1RFSFNRNElLRkZtQ0NqMlhoakIwcTEvQ2VxcU02a1AveXBPcExqMEZp?=
 =?utf-8?B?MUJxbXJSOUI4TGE2RDRucVR3WUxFM29sTmhTTEhvZExpbHdoY25kYnlhU1Fi?=
 =?utf-8?B?dkdISWh6SFY0cWpEWVdreTUzQkRHUUNlQWxyVVlVZEdEK1BHVVg3NjVtRk9v?=
 =?utf-8?B?bkd1U3VNWmptVkdmWXR2WXdJNHN0ZFF6eVVKajFqNFpqbklSaythdGw3ZWov?=
 =?utf-8?B?YVlLNVVFQTNsTHMyTER5OE9PSUhUaFpYMzJrUVo3UllwMXBLUlloSmcrOVRa?=
 =?utf-8?B?dDN2OHU3U0pVZFM2Q3JtZHVKditlMktlM2RXZFgydWJJWU54TFNnL2tySENE?=
 =?utf-8?B?Z3pBU0JHWFcvay9aa3gwNnVaRWN6b1pReVpTNmRQWExENzlYYmFiRng3SHNF?=
 =?utf-8?B?T202cHh0V3RGNkxXUHE2aVpOWTBRZjBuUlgrNVR3TGM1VDJ5ZG4rRWlUWVg1?=
 =?utf-8?B?UDlBMmJscC9XbFM0VjlXQTZoR2dJaDNOSk4yQkdnbFRmNTV3aWtQUGR2NHZQ?=
 =?utf-8?B?ZGUxTjhwZVJuQnRFSXdxdU9EVmh4RHZ0Y0hWTnBSdjhvdDdHUXV0L29xYXVa?=
 =?utf-8?B?Qmp2Uk03MHBzNUNINy91c0xML3h2Y3U2bDBjc29FS3FnbWVUWTcvRjJMTzE2?=
 =?utf-8?B?ZkJTYzY4UjZBb1dzaDB2ZDhkeGx0WURJY1gwVTNFd29tVDltbmpLL0F6MDUy?=
 =?utf-8?B?dU15ajdETHQybGlMVi9VNkZoUDZQOU5HS0Y2bHFpeUF5c2RsU29sSUtMZGxR?=
 =?utf-8?B?MlQ5RitBR0c2KzhDb1pSU0Z5U3FtZGU0NDlEU2hBVDhtc2xlNjA4cndXVzNm?=
 =?utf-8?B?VThWUjVYVVBiTnYrSHRRYTZZbjY4RmFyWHI3V2k4WTh0M1MxOSt0eTRXUXpN?=
 =?utf-8?B?Ylg5czJqYS9hSW1KNmRmbjhUWjJwOWExNFhnOVhRS1NlS0NHTk1ubEY1L0pZ?=
 =?utf-8?B?MGxFZ1ZvdEIvbWttY2F5WmNqWm1ST1YyMEpXYUJIVGtZcGhZRlRPYmgrUlph?=
 =?utf-8?B?TGlzUFQxY0NRZkNQcDcwait6bUdxMzZMblgwaDRERzVlQzVjMENhVTVuNHg2?=
 =?utf-8?B?OU1Wd01aNGtjemJRTDA2eThmSTFmVXU0em40RzdFVmdkSldmUkFDOFZITU16?=
 =?utf-8?B?R3JscVpic1FpNjFYeWFEKzcxc0QwTlk4OVQ0MWRUVG0wRlhsNlc1clpRUnNO?=
 =?utf-8?B?TmlkbllOSUtLaU84VWlkdU5PRDMycVJ2dTNQMjBKOS9BMGZKNWpXaHhDdFJC?=
 =?utf-8?B?R1JBeTJLeW9YT2pmR1p2YU0wbGNqT1lrT25CbnhsMlEzK0VySFlML1BjWG1t?=
 =?utf-8?B?WU5tNWhUR1JFYk9OSTVxOXVWWlNLMVlsQXVVTVRqbFYxOTA4YXBRWTBUR0Ny?=
 =?utf-8?B?Z1Z0T080cUMwU2l2OUwzRlM0cEdqWG5TZVh5MGx4eVFCM2NwTm1yRlJpL2Yv?=
 =?utf-8?B?ekNwcmlEeEdiSlZMNkFCUnk2VmJsZ1J3WlFNZ0w0S2M5eEx5dmtWcVdKMUZW?=
 =?utf-8?B?N3JDM3B4TnV1UWF3MGVjYUdKS21FbytvM0VORFNWWnB5MzIxT0RyRDlNelJQ?=
 =?utf-8?B?NkhXdmRVOGVXN3pGLzhyK0FLZkNNTlg5VklSbWtRU2NCMGY1ODZtL2EyemVL?=
 =?utf-8?B?WUpCNTNSQnE0RVVRU3dFMko2UlBXMzBVSkpWTm5Fdm1sR2lkNHZoajViN3Iv?=
 =?utf-8?B?OG5lTjJvZlNmOWRZTmxoYWlxM2pQL3RML2YxV0FlVkJTN2JDZXdtbGJGa0Vl?=
 =?utf-8?Q?uIpVl55+Gb/LK5ohdur+R2I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F313ED5A3243FC4CA3FF0B54C55519A3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026a5c27-0ad4-4c45-9c76-08db5d6beb06
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 22:03:48.8511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRq5cTM00/lxhZHInnI7Ho3b1EpjbKUaHLRYfItKdJHrBCiiXbLz3an+KSxmqPnFFmx3B9dZDUsV5dSCgIbdLPRgx5qhyrqDDCmOrVhoKYEX3kPKXU9r74sY40zS0sAr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
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

T24gVGh1LCAyMDIzLTA1LTI1IGF0IDA5OjU2IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gT24gNS8yNC8yMDIzIDEwOjE0IFBNLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAyMy0wNS0wNSBhdCAwOTowNCAtMDcwMCwgQ2VyYW9s
byBTcHVyaW8sIERhbmllbGUgd3JvdGU6DQphbGFuOnNuaXANCj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Yy5oDQo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuaA0KPiA+ID4gQEAgLTE3LDYgKzE3LDkgQEAg
c3RydWN0IGludGVsX2dzY191YyB7DQo+ID4gPiAgIAlzdHJ1Y3QgaW50ZWxfdWNfZncgZnc7DQo+
ID4gPiANCj4gPiA+ICAgCS8qIEdTQy1zcGVjaWZpYyBhZGRpdGlvbnMgKi8NCj4gPiA+ICsJc3Ry
dWN0IGludGVsX3VjX2Z3X3ZlciByZWxlYXNlOw0KPiA+ID4gKwl1MzIgc2VjdXJpdHlfdmVyc2lv
bjsNCj4gPiBhbGFuOiBmb3IgY29uc2lzdGVuY3kgYW5kIGxlc3MgcmVkdW5kYW5jeSwgY2FuJ3Qg
d2UgYWRkICJzZWN1cml0eV92ZXJzaW9uIg0KPiA+IGludG8gJ3N0cnVjdCBpbnRlbF91Y19md192
ZXInICh3aGljaCBpcyB6ZXJvIGZvciBmaXJtd2FyZSB0aGF0IGRvZXNuJ3QNCj4gPiBoYXZlIGl0
KS4gVGhhdCB3YXksIGludGVsX2dzY191YyBjYW4gcmUtdXNlIGludGVsX3VjX2Z3LmZpbGVfc2Vs
ZWN0ZWQNCj4gPiBqdXN0IGxpa2UgaHVjPw0KPiANCj4gSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1l
YW4gYnkgcmUtdXNpbmcgaW50ZWxfdWNfZncuZmlsZV9zZWxlY3RlZC4gSXMgDQo+IHRoYXQgZm9y
IHRoZSBjYWxsIGZyb20gaW50ZWxfdWNfZndfdmVyc2lvbl9mcm9tX21ldV9tYW5pZmVzdD8gSSdt
IA0KPiBwdXJwb3NlbHkgbm90IGRvaW5nIHRoYXQuIE5vdGUgdGhhdCB0aGUgR1NDIGhhcyAzIHZl
cnNpb25zOg0KPiANCj4gUmVsZWFzZSB2ZXJzaW9uIChpbmNyZW1lbnRlZCB3aXRoIGVhY2ggYnVp
bGQgYW5kIGVuY29kZWQgaW4gdGhlIGhlYWRlcikNCj4gU2VjdXJpdHkgdmVyc2lvbiAoYWxzbyBl
bmNvZGVkIGluIHRoZSBoZWFkZXIpDQo+IENvbXBhdGliaWxpdHkgdmVyc2lvbiAocXVlcmllZCB2
aWEgbWVzc2FnZSB0byB0aGUgR1NDKQ0KPiANCj4gVGhlIG9uZSB3ZSBjYXJlIGFib3V0IGZvciBj
b21tdW5pY2F0aW5nIHdpdGggdGhlIEdTQyBpcyB0aGUgbGFzdCBvbmUsIHNvIA0KPiB0aGF0J3Mg
dGhlIG9uZSBJIHN0b3JlZCBpbiBpbnRlbF91Y19mdy5maWxlX3NlbGVjdGVkIChpbiB0aGUgbmV4
dCANCj4gcGF0Y2gpLiBUaGUgb3RoZXIgMsKgIHZlcnNpb25zIGFyZSBub3Qgc3RyaWN0bHkgcmVx
dWlyZWQgdG8gdXNlIHRoZSBHU0MgDQo+IGFuZCB3ZSBvbmx5IGZldGNoIHRoZW0gZm9yIGRlYnVn
IHB1cnBvc2VzLCBzbyBpZiBzb21ldGhpbmcgZ29lcyB3cm9uZyB3ZSANCj4ga25vdyBleGFjdGx5
IHdoYXQgd2UndmUgbG9hZGVkLg0KPiANCj4gRGFuaWVsZQ0KYWxhbjogb2theSB0aGFua3MgLSBz
ZWVpbmcgdGhhdCBub3cgaW4gdGhlIG5leHQgcGF0Y2guLi4gKGFuZCBpIGFsc28gZm9yZ290IHRo
YXQNCnRoZSBHU0MgcmVsZWFzZSB2ZXJzaW9uIGRvZXNudCByZWZsZWN0IGludGVyZmFjZSB2ZXJz
aW9uaW5nIGluIGFueXdheSBsaWtlIEd1QyBkb2VzKS4NCkluIHRoYXQgY2FzZSwgYWJvdmUgYWRk
aXRpb25hbCB2ZXJzaW9ucyBhcmUgZmluZS4gV291bGQgZGVmaW5pdGVseSBsb3ZlIHRvIHNlZQ0K
YWRkaXRpb25hbCBjb21tZW50cyB1bmRlciAiR1NDLXNwZWNpZmljLWFkZGl0aW9ucyIgdGhhdCBl
eHBsYWluIHRob3NlIDMgdmVyc2lvbmluZw0KaXRlbXMgYW5kIHdoYXQgd2UgY2FyZSBhYm91dCBh
cyBob3cgeW91IGhhdmUgZXhwbGFpbmVkIGhlcmUuDQo=
