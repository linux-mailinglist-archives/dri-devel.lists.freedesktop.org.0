Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB17FE02A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 20:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C75D10E206;
	Wed, 29 Nov 2023 19:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3490A10E206;
 Wed, 29 Nov 2023 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701285290; x=1732821290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m4rn+0njwI0c00yvjmuTRDoZEmBtkc58HquhBwsfGe8=;
 b=cW1jN/CGv2FOdO916lfYdueAAfOAVhFcmQSovekYDTLN5pxF+1Kb2acY
 ICaxh7Q12rhOSl2bGbRDkc9b/kdwg1pZq3KO60N8KdTSU2PZ19tqfon80
 3eV/Fw3kC66SHu0PVovVn7d+neI4BAMMHIrX2S7zMXUwZnBhtcKMMNDX5
 3/1OPNjq3YeQREStf8HjbEh+bW1zw01ZJlhozaR+7Oe1c1qh7Mtu3BZi/
 Hz86bcggBkXaHLOzHd4I8/ayy3PumtqDzYcBC0yLjb5zdimHjyNgIWxpI
 YCimtAvZ7Bcam7DvFM8IDACMXrBY4/lU6+RNPekNbXYbdwBClmEiqBl8W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="113141"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="113141"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:07:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892549066"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="892549066"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 11:07:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:07:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 11:07:38 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 11:07:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSs9G2AOycgFzZQYia2Jk4/50ySybdK0/C3q32KLCsEsR5l9cZd9/vJ/cplYIThm+SivCExAaLhO905oqRMZ/aam4eLjcWNU+afONT1P6UWBQIzv2FQe6rep0uYeDLOOs2ii40UuukYvhuEadWM2KregeuKpLv3D8tgNcNhxV3d0BSrsYiLuRHehAV3kabZMCM+URceGe0CuSY0KNaMAqSlXc+EE8ppvFcFzPnhDfkBLw3+J924+wv2m403XvKbr1RCTaWY/ZJmxXg28MQntevGNaj9FygY9qCQL7gYoClybrZ3PzlowWs6RsbKqxvDIQVD9NHpurLHx4f11QhuEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4rn+0njwI0c00yvjmuTRDoZEmBtkc58HquhBwsfGe8=;
 b=KYcn/lvAL7AMMhhBEAEAw2YorEVSJc2JsLpggXqJxDXNIICvPJ4el0K8qBoKNePb5Ky9fGudQB/LEyoMKbrvwPzu2dVrghYON96pUdGyeROHDVEY8w8sazOgBm1ApMFR4j09Y+uANFyxGlhlQx4F/3bDFQroROPYUIP22pTqKQwa0cUdQ6lmbX5MAgAZm15AuCvLlRizT0cd3fVFkqm5Q6MqicXWW/SO5+F1E9hjFQFFA9RixnwuYTxULOTbvRtZGrJckRUuyTT5BfE4UDPfXpwAXOtk9cJJngWmr2WMMgIB7T44fs7BnvoDQRXbtksFmrpoyzcZ2+YCYbFeB9WrhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 19:07:36 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:07:36 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v6 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHaFxKZOyPaADxCuUa8Mg8yvBTRG7COyZoAgAL23gA=
Date: Wed, 29 Nov 2023 19:07:36 +0000
Message-ID: <71bd5093c207838bfbee2fbd85d8149d4dd8575a.camel@intel.com>
References: <20231114155229.756100-1-alan.previn.teres.alexis@intel.com>
 <20231114155229.756100-3-alan.previn.teres.alexis@intel.com>
 <ZWUPYG/qG+T0Qo0D@intel.com>
In-Reply-To: <ZWUPYG/qG+T0Qo0D@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB7613:EE_
x-ms-office365-filtering-correlation-id: b3dcc9a0-8844-4f7e-2310-08dbf10e72e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zvILQAdsJCUZYj7+OK3KKOn9GzTHA24mzWCWD0js59VX/9o6RmlOhWKsIhMMkNSKMVdxQ+po9ROJR8HEcwaiJpZWf4qyMMAFXhqX5Vm5p7zqpAS6Tyufn9HR7rzh4Hk/caLJgWDulqjj9RW1CELhKUDeMz3TaNXLz+hDV9Kn8vcLq4iHTWtVpBgKWFwkm6cdpu3sNzXKfujeAkkCdlj4ywaaK/lHwQS7kPm/Fehozc06N9Yfi9kna66/QJTZpHZBRNrjpyryTjH9evIQzQP28h7RBFqJ/oX6OAG/1hgXXkBpMZJoWi3rki+p2m2B/70LkCJdeCwsNpPerKUw8RR0bBKUJ6HVoTl5IJGWgKUd6Rrig9oElykfdgmZN0wQaYRwrI23jrdDd1MzkrTcPIj1v2MUGdD0/w6n+4FDgigacL219xzhDrMXsK0Sry0Mq6UF1ZuYVBkRPdW3UiY1Hvm5SJQRQhE9+5aYWlBLe61G9Xq4ZE6jveyouywAMZO5GMThMZOpQkxbkRG9LEF+Z6nPkehHkh4H/8ftUfrnhg9hp3yScSi8Zasg5eW3xk4FqH2Y3+k3gJ6bRSqFvzlcLDy707ZOZtOBd5d300OzKCYvB8lhsvLGwd4hauhQi1rAq64H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(316002)(6636002)(2616005)(450100002)(6506007)(107886003)(6512007)(86362001)(91956017)(36756003)(26005)(76116006)(478600001)(82960400001)(38100700002)(6486002)(83380400001)(71200400001)(122000001)(66476007)(5660300002)(66556008)(66946007)(54906003)(38070700009)(66446008)(64756008)(37006003)(4001150100001)(2906002)(8936002)(41300700001)(4326008)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHIxenZtTWdZNUVxSUN5eTU2c3RhNWJYSzZzVHFaVG5vMW9ueE56aVNDaG5I?=
 =?utf-8?B?SzNmRVNSTUlkL2NDSkNOUmRJL3M3K0tFRGJ5d25pRkVXclBxVksyQ2YvNm1r?=
 =?utf-8?B?Y3ZRamlIWUxRdG9maWZ2U3I5R0NveGFEZlZaVVVTWFRTUHpSWUMvVE9GVmdW?=
 =?utf-8?B?N3UvOGtUaUlHYlk0Um5QOStyME1KemcvdjZFT3BMdFVsbTk2RHlqbU5QRDdW?=
 =?utf-8?B?QkZNUnZvUTZ2TU5WV2dXZUxpUGVCS3R4RUVkLzZnVlBVRmZEQ2tkT0E2d3hV?=
 =?utf-8?B?TklmRlpPR0R4aDlIeCtwaXJNM202SzZmUXVVaG1KSDBSWk9kTEZWVDB6R1dO?=
 =?utf-8?B?cUs0OUk0R3RGWGJReUM0LzF6SXZXdUpONHlMMEhXVkpTUUhEa2kwRTErdEEw?=
 =?utf-8?B?VkRVOXY1OFA1RkMzVDNXR3BDcW5oT01XQTV1aXdiaXVsTzhuVVZMNkJ4bUpr?=
 =?utf-8?B?dHlBTWFzdDF0WW9jVElsRklLTk45c01RMUN3SXNlVXdYeTdmU0RQcjF2aUJN?=
 =?utf-8?B?aVdIK1NDUEhZQUFrazJiM1dLbXpTNzZJNmdvclJZcklMS1RCQkRNOXYwSk1D?=
 =?utf-8?B?Q3pPVHpiQmdFeS9EOHgxWkdBeW13cGpNNFE3dDRHRVhqS2Yrbkd2WFA2UEt1?=
 =?utf-8?B?UDNWK3JlbCtwWjhGM1BOOUhMelF0aFF5bVd0Tzl1eUZlK0pKMjZiS1lHUTFB?=
 =?utf-8?B?WGpmelExSTZ3VFF6QWFVMWovOHV1dzQwdjluZDI0U2RRNXdkVElhOVhHRU0x?=
 =?utf-8?B?alNSbkFtdTRJWXZycTI2Qjg1NkhiL25lQm4wSS9OU3NhTEVHRTZrb3RsRk1M?=
 =?utf-8?B?Y1lVRmVTamRDR1h0YnpGaTFaZ2N4Q2Myem4yQXcvc2dwNEpoeFpQaTkwR3I2?=
 =?utf-8?B?RTU2UmpSNldUdFQwTVdUb3hxVmZEWHgwemlmalMrQ3NvQjlYVnNabkhrY3d2?=
 =?utf-8?B?SE1RRHpKeXdlK1Z0alVBb2JYY1JaYVl1TWdDUDRvZTNQS3NjTWlGeHJ4QmxD?=
 =?utf-8?B?VWVrUXVCK2IyeHdtcDBRSHRnN1JOQ1ZIdmJwdk9UZFR0L2VtQm4zS2xLOUlo?=
 =?utf-8?B?VlQydmJQR05rbFRaOG04UWRiRkZCSzFlNWxORFlDbjV6RVJSVzFLL1JNNkhx?=
 =?utf-8?B?bmZDVEs1UUY1YTBqai9ESkVzRlFFWnUrVnJFRzdxQWY5ZUFnWkltYW9FUEVL?=
 =?utf-8?B?eUxiWi9HU3FrSkxWRkdVN1hBVHRRTnBuY0ZqOTZSVml3VGVOemNNY2JVTWly?=
 =?utf-8?B?OW9mNU9NdExkLzdPVjRrbjFhcENnamI5M0ZjazhkbVc4RGVxRzhXR1dMQzh4?=
 =?utf-8?B?SC9qUEpVcENXTnZEbi9YWkNWRW9OaUQ4S3ZYeVFLZTFFQjc1Y3lNMm1HR0Vo?=
 =?utf-8?B?WXZlTnRnQkFFZFQwR1l0MlhJT0hlTVJVdUpyd2cwWi9jUnlpTUo2aWZMVU9w?=
 =?utf-8?B?YzBDK2V1MCs4S05LMjVmZkd3WENGczAvQ1VFbkdJbzVCSjF4VkxuelpveXR4?=
 =?utf-8?B?ajgvYjhOQnM0V1JNS2pCZ2djMkJqaUpvNHpFT3hZMmMrOFVlWGxIZFZrSEkr?=
 =?utf-8?B?Rm5UdHo4L0lJVy9FRTZlbldzOTBOOVMxTXhCTWZ0ZHUwMWprQUw2WXo1TXpa?=
 =?utf-8?B?T3JWNjU1aDRSWGNvN0pxOGt4TnEranZuNUJLVTVOQTFzS1N3NGc3SEM1YmdE?=
 =?utf-8?B?cmxtV24wR2xCa3g4cHM2SkFCUVBmTmo0OXJuUkVQMjdNOWw0eUhOUEFGTUdS?=
 =?utf-8?B?amFocCtKVWZWbFB2MXRPOTQ1MmtPT1ZXaDJxcVpQNklxZVB3dVZvTVhUMm9W?=
 =?utf-8?B?cHpIcGZwb2lnUFBoUWVCdVo5RkRSYjB3UjU5M0lNRWtUY1ZRQUFDRGpVSlIv?=
 =?utf-8?B?QjNIK28ybHhZRGtzVDc3Qy9iVUxZLzViUUNwUUZsK1dLT1RWb01sZTJPa3BY?=
 =?utf-8?B?eE8xd0RsblhPeTRkcXRvTDVWbzJxb1MydDJVOEtUeEZYUklEKzVCQVN3VGdo?=
 =?utf-8?B?ZHdFSFMvSmRoaVNwZ3lVQU83NnNqU0VmZERRQkx2dFN5VGNmbTJSZ1pXRDZB?=
 =?utf-8?B?VmR1aFRtRjJVcDI3U0Eza3FtMjRGVGxVK0c5NStQV2dNOHpnaWltL2YxMmNX?=
 =?utf-8?B?MGh1Mi9HOXc0cnR6MWRnVW50V3ZhT20waVRhVGI1YksyQ3dZOTF3ZHVNbXFo?=
 =?utf-8?Q?hTL3DkxOISv9OuRu0vhlMy0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FFE6E63CB7DC341A95D9B96BE0D9C0F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3dcc9a0-8844-4f7e-2310-08dbf10e72e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 19:07:36.2255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qN/Hee2WUtnsOU8e6gnx7uKCxLadan2/Thbu76isYrQ/3GO+08uQ6W4JIODSnMAJX5IFHApXIYyo9mgaLbhECMcyi3v0jv2L3EZSE6z7gUw0rg5w8p0JqTJyBMNB8MX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Jana,
 Mousumi" <mousumi.jana@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTExLTI3IGF0IDE2OjUxIC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
DQphbGFuOiBGaXJzdGx5LCB0aGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcgdGhp
cywga25vd2luZyB5b3UgaGF2ZSBhIGxvdCBvbiB5b3VyIHBsYXRlIHJpZ2h0IG5vdy4NCj4gDQph
bGFuOnNuaXANCj4gPiBAQCAtMzMwMSwxOSArMzMxNSwzOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
Z3VjX2xyY19kZXNjX3VucGluKHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSkNCj4gPiAgCS8qIFNl
YWwgcmFjZSB3aXRoIFJlc2V0ICovDQo+ID4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmY2UtPmd1Y19z
dGF0ZS5sb2NrLCBmbGFncyk7DQo+ID4gIAlkaXNhYmxlZCA9IHN1Ym1pc3Npb25fZGlzYWJsZWQo
Z3VjKTsNCj4gPiAtCWlmIChsaWtlbHkoIWRpc2FibGVkKSkgew0KPiA+IC0JCV9faW50ZWxfZ3Rf
cG1fZ2V0KGd0KTsNCj4gPiAtCQlzZXRfY29udGV4dF9kZXN0cm95ZWQoY2UpOw0KPiA+IC0JCWNs
cl9jb250ZXh0X3JlZ2lzdGVyZWQoY2UpOw0KPiA+IC0JfQ0KPiA+IC0Jc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmY2UtPmd1Y19zdGF0ZS5sb2NrLCBmbGFncyk7DQo+IA0KPiB5b3UgYXJlIG5vdyBo
b2xkaW5nIHRoaXMgc3BpbiBsb2NrIGZvciB0b28gbG9uZy4uLg0KYWxhbjogbXkgaW50ZW50aW9u
IHdhcyB0byBlbnN1cmUgdGhhdCBhbiBhc3luYyBIMkcgcmVxdWVzdCB0byBjaGFuZ2UgdGhpcw0K
Z3VjaWQtY29udGV4dCBzdGF0ZSB3b3VsZG50IGNvbWUgaW4gd2hpbGUgd2UgYXJlIGluIHRoZSBt
aWRkbGUgb2YgYXR0ZW1wdGluZw0KdG8gc2VuZCB0aGUgY29udGV4dC1kZXN0cnVjdGlvbiBIMkcg
YW5kIGxhdGVyIHJlYWxpemUgaXQgbmVlZGVkIHRvIGJlDQp1bnJvbGxlZCAoY29ybmVyIGNhc2Ug
cmFjZSB3ZSBhcmUgc29sdmluZyBoZXJlIGFzIGRpc2NvdmVyZWQgb24NCmN1c3RvbWVyIHBsYXRm
b3JtKS4gQnV0IGFmdGVyIGRpc2N1c3Npbmcgd2l0aCBEYW5pZWxlIGFuZCBKb2huLCB0aGV5DQph
Z3JlZWQgdGhhdCB3ZSBzaG91bGQgbW92ZSB0aGUgdW5sb2NrIGJhY2sgdG8gYmVmb3JlIHRoZSBk
ZXJlZ2lzdGVyIGFuZCB0aGVuDQp0YWtlIHRoZSBsb2NrIGFnYWluIGluc2lkZSBvZiB0aGUgdW5y
b2xsaW5nIGNvZGUgKGlmIGRlcmVnaXN0ZXJfY29udGV4dCANCmZhaWxzKS4NCmFsYW46c25pcA0K
PiANCj4gPiAtCWRlcmVnaXN0ZXJfY29udGV4dChjZSwgY2UtPmd1Y19pZC5pZCk7DQo+ID4gKwkv
KiBHdUMgaXMgYWN0aXZlLCBsZXRzIGRlc3Ryb3kgdGhpcyBjb250ZXh0LA0KPiANCj4gZm9yIG11
bHRpLWxpbmUgY29tbWVudHMgeW91IG5lZWQgdG8gc3RhcnQgd2l0aCAnLyonIG9ubHkNCj4gYW5k
IHN0YXJ0IHRoZSByZWFsIGNvbW1lbnQgYmVsb3csIGxpa2U6DQphbGFuOm15IGJhZC4gd2lsbCBm
aXguDQo+ICoNCj4gICogR3VDIGlzIGFjdGl2ZSwgLi4uDQo+ID4gKwkgKiBidXQgYXQgdGhpcyBw
b2ludCB3ZSBjYW4gc3RpbGwgYmUgcmFjaW5nIHdpdGgNCj4gPiArCSAqIHN1c3BlbmQsIHNvIHdl
IHVuZG8gZXZlcnl0aGluZyBpZiB0aGUgSDJHIGZhaWxzDQo+ID4gKwkgKi8NCj4gPiArDQo+ID4g
KwkvKiBDaGFuZ2UgY29udGV4dCBzdGF0ZSB0byBkZXN0cm95ZWQgYW5kIGdldCBndC1wbSAqLw0K
PiA+ICsJX19pbnRlbF9ndF9wbV9nZXQoZ3QpOw0KPiA+ICsJc2V0X2NvbnRleHRfZGVzdHJveWVk
KGNlKTsNCj4gPiArCWNscl9jb250ZXh0X3JlZ2lzdGVyZWQoY2UpOw0KPiA+ICsNCj4gPiArCXJl
dCA9IGRlcmVnaXN0ZXJfY29udGV4dChjZSwgY2UtPmd1Y19pZC5pZCk7DQo+ID4gKwlpZiAocmV0
KSB7DQo+ID4gKwkJLyogVW5kbyB0aGUgc3RhdGUgY2hhbmdlIGFuZCBwdXQgZ3QtcG0gaWYgdGhh
dCBmYWlsZWQgKi8NCj4gPiArCQlzZXRfY29udGV4dF9yZWdpc3RlcmVkKGNlKTsNCj4gPiArCQlj
bHJfY29udGV4dF9kZXN0cm95ZWQoY2UpOw0KPiA+ICsJCS8qDQo+ID4gKwkJICogRG9udCB1c2Ug
bWlnaHRfc2xlZXAgLyBBU1lOQyB2ZXJpb24gb2YgcHV0IGJlY2F1c2UNCj4gPiArCQkgKiBDVCBs
b3NzIGluIGRlcmVnaXN0ZXJfY29udGV4dCBjb3VsZCBtZWFuIGFuIG9uZ29pbmcNCj4gPiArCQkg
KiByZXNldCBvciBzdXNwZW5kIGZsb3cuIEltbWVkaWF0ZWx5IHB1dCBiZWZvcmUgdGhlIHVubG9j
aw0KPiA+ICsJCSAqLw0KPiA+ICsJCV9faW50ZWxfd2FrZXJlZl9wdXQoJmd0LT53YWtlcmVmLCAw
KTsNCj4gDQo+IGludGVyZXN0aW5nIGVub3VnaCB5b3UgdXNlIHRoZSAnX18nIHZlcnNpb24gdG8g
YnlwYXNzIHRoZSBtaWdodF9zbGVlcCgpLA0KPiBidXQgYWxzbyBzZW5kaW5nIDAgYXMgYXJndW1l
bnQgd2hhdCBtaWdodCBsZWFkIHlvdSBpbiB0aGUgbXV0ZXhfbG9jayBpbnNpZGUNCj4gdGhlIHNw
aW4gbG9jayBhcmVhLCB3aGF0IGlzIG5vdCBhbGxvd2VkLg0KYWxhbjogc28gb25lIHRoaW5nIHRv
IG5vdGUsIHRoZSBtb3RpdmF0aW9uIGZvciBhbiBhbHRlcm5hdGl2ZSB1bmxvY2sgd2FzIG9ubHkN
CmRyaXZlbiBieSB0aGUgZmFjdCB3ZSB3ZXJlIGhvbGRpbmcgdGhhdCBzcGlubG9jay4gSG93ZXZl
ciwgYXMgcGVyIHRoZSByZXZpZXcNCmNvbW1lbnQgYW5kIHJlc3BvbnNlIG9uIHRoZSBzcGluIGxv
Y2sgYWJvdmUsIGlmIHdlIG1vdmUgdGhlIHBtLXB1dA0Kb3V0c2lkZSB0aGUgc3BpbiBsb2NrLCB3
ZSBjYW4gY2FsbCB0aGUgaW50ZWxfd2FrZXJlZl9wdXRfYXN5bmMgKHdoaWNoIHdpbGwgbm90DQph
Y3R1YWxseSB0cmlnZ2VyIGEgZGVsYXllZCB0YXNrIGJlY2FzZSB0aGlzIGZ1bmN0aW9uIChndWNf
bHJjX2Rlc2NfdW5waW4pIHN0YXJ0cw0Kd2l0aCBHRU1fQlVHX09OKCFpbnRlbF9ndF9wbV9pc19h
d2FrZShndCkpOyB3aGljaCBtZWFucyBpdCB3b3VsZCBvbmx5IGRlY3JlbWVudA0KdGhlIHJlZiBj
b3VudC4NCmFsYW46c25pcA0KPiA+ICsJCQlzcGluX2xvY2tfaXJxc2F2ZSgmZ3VjLT5zdWJtaXNz
aW9uX3N0YXRlLmxvY2ssIGZsYWdzKTsNCj4gPiArCQkJbGlzdF9hZGRfdGFpbCgmY2UtPmRlc3Ry
b3llZF9saW5rLA0KPiA+ICsJCQkJICAgICAgJmd1Yy0+c3VibWlzc2lvbl9zdGF0ZS5kZXN0cm95
ZWRfY29udGV4dHMpOw0KPiA+ICsJCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZndWMtPnN1Ym1p
c3Npb25fc3RhdGUubG9jaywgZmxhZ3MpOw0KPiA+ICsJCQkvKiBCYWlsIG5vdyBzaW5jZSB0aGUg
bGlzdCBtaWdodCBuZXZlciBiZSBlbXB0aWVkIGlmIGgyZ3MgZmFpbCAqLw0KPiANCj4gRm9yIHRo
aXMgR3VDIGludGVyYWN0aW9uIHBhcnQgSSdkIGxpa2UgdG8gZ2V0IGFuIGFjayBmcm9tIEpvaG4g
SGFycmlzb24gcGxlYXNlLg0KYWxhbjpva2F5IC0gd2lsbCBkby4gSSBtaWdodCBhbHRlcm5hdGl2
ZWx5IHRhcCBvbiBEYW5pZWxlIHNpbmNlIGhlIGtub3dzIHRoZSBndWMganVzdCBhcyB3ZWxsLg0K
PiANCmFsYW46c25pcA0KDQo+ID4gQEAgLTMzOTIsNiArMzQ0MCwxNyBAQCBzdGF0aWMgdm9pZCBk
ZXN0cm95ZWRfd29ya2VyX2Z1bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3KQ0KPiA+ICAJc3RydWN0
IGludGVsX2d0ICpndCA9IGd1Y190b19ndChndWMpOw0KPiA+ICAJaW50IHRtcDsNCj4gPiAgDQo+
ID4gKwkvKg0KPiA+ICsJICogSW4gcmFyZSBjYXNlcyB3ZSBjYW4gZ2V0IGhlcmUgdmlhIGFzeW5j
IGNvbnRleHQtZnJlZSBmZW5jZS1zaWduYWxzIHRoYXQNCj4gPiArCSAqIGNvbWUgdmVyeSBsYXRl
IGluIHN1c3BlbmQgZmxvdyBvciB2ZXJ5IGVhcmx5IGluIHJlc3VtZSBmbG93cy4gSW4gdGhlc2UN
Cj4gPiArCSAqIGNhc2VzLCBHdUMgd29uJ3QgYmUgcmVhZHkgYnV0IGp1c3Qgc2tpcHBpbmcgaXQg
aGVyZSBpcyBmaW5lIGFzIHRoZXNlDQo+ID4gKwkgKiBwZW5kaW5nLWRlc3Ryb3ktY29udGV4dHMg
Z2V0IGRlc3Ryb3llZCB0b3RhbGx5IGF0IEd1QyByZXNldCB0aW1lIGF0IHRoZQ0KPiA+ICsJICog
ZW5kIG9mIHN1c3BlbmQuLiBPUi4uIHRoaXMgd29ya2VyIGNhbiBiZSBwaWNrZWQgdXAgbGF0ZXIg
b24gdGhlIG5leHQNCj4gPiArCSAqIGNvbnRleHQgZGVzdHJ1Y3Rpb24gdHJpZ2dlciBhZnRlciBy
ZXN1bWUtY29tcGxldGVzDQo+ID4gKwkgKi8NCj4gPiArCWlmICghaW50ZWxfZ3VjX2lzX3JlYWR5
KGd1YykpDQo+ID4gKwkJcmV0dXJuOw0KPiANCj4gaXMgdGhpcyByYWN5Pw0KYWxhbjogdGhpcyBp
cyB0byByZWR1Y2UgcmFjaW5lc3MuIFRoaXMgd29ya2VyIGZ1bmN0aW9uIGV2ZW50dWFsbHkgY2Fs
bHMNCmRlcmVnaXN0ZXJfZGVzdHJveWVkX2NvbnRleHQgd2hpY2ggY2FsbHMgdGhlIGd1Y19scmNf
ZGVzY191bnBpbiB0aGF0IGRvZXMNCmFsbCB0aGUgd29yayB3ZSBkaXNjdXNzZWQgYWJvdmUgKHRh
a2luZyBsb2NrcywgdGFraW5nIHJlZnMsIHNlbmRpbmcgaDJnLA0KcG90ZW50aWFsbHkgdW5yb2xs
aW5nKS4gU28gdGhpcyBjaGVjayBhbiBvcHRpbWl6YXRpb24gdG8gc2tpcCB0aGF0IHdpdGhvdXQN
CmdvaW5nIHRocm91Z2ggdGhlIGxvY2tpbmcuIFNvIHllcyBpdHMgYSBiaXQgcmFjeSBidXQgaXRz
IHRyeWluZyB0byByZWR1Y2UNCnJhY2luZXNzLiBOT1RFMTogV2l0aG91dCB0aGlzIGxpbmUgb2Yg
Y29kZSwgaW4gdGhlb3J5IGV2ZXJ5dGhpbmcgd291bGQgc3RpbGwNCndvcmsgZmluZSwgd2l0aCB0
aGUgZHJpdmVyIHBvdGVudGlhbGx5IGV4cGVyaWVuY2luZyBtb3JlIHVucm9sbCBjYXNlcw0KaW4g
dGhvc2UgdGhvdXNhbmRzIG9mIGN5Y2xlcy4gTk9URTI6IFRoaXMgY2hlY2sgdXNpbmcgaW50ZWxf
Z3VjX2lzX3JlYWR5DQppcyBkb25lIGluIG1hbnkgcGxhY2VzIGluIHRoZSBkcml2ZXIga25vd2lu
ZyB0aGF0IGl0IGRvZXNudCB0YWtlIGFueSBsb2Nrcy4NCk9mIGNvdXJzZSB3aWxsIGdldCBKb2hu
IG9yIERhbmllbGUgdG8gY2hpbWUgaW4uDQoNCj4gDQo+ID4gKw0KPiA+ICAJd2l0aF9pbnRlbF9n
dF9wbShndCwgdG1wKQ0KPiA+ICAJCWRlcmVnaXN0ZXJfZGVzdHJveWVkX2NvbnRleHRzKGd1Yyk7
DQo+ID4gIH0NCj4gPiAtLSANCj4gPiAyLjM5LjANCj4gPiANCg0K
