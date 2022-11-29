Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E870663CBFC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 00:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B3610E069;
	Tue, 29 Nov 2022 23:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6055E10E069;
 Tue, 29 Nov 2022 23:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669765735; x=1701301735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g/aaXeBwU8ye11amhYRFiwZmTd2Tn3+N+j+/8XdI2rM=;
 b=GYdfFLO1LC8aJY4Hqyd5Rk+KlGHF0gqGvo4Iq2FrXri+1sB4bEr77wVd
 xb+qadu2SaZBLeQfYxd9r30jm85T36mh1+sX8KIfc4+OcIcsHmY4e5j2+
 fTHPX8sDKeUkx9eBDWE0V2HNmsj2OKw513hDek4s4llifyZS66XUhfc0+
 dd2GIIrZ4CEjDQD7/PyRZMpe5KbrXCMfpUA+37MrAM9cQw81gNgUYpMGi
 8Ta7BFllnBIqxW4s/Gn5sDd+p3zAw+AEN/40EdhTL8AIIWpYRRHciKiH7
 DNc4gQhXiR0gei3z9PVdjZVqV95613sfmrFy6y87KPc+9Y1cx+5yZRo3m Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="342180838"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="342180838"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 15:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="768620696"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="768620696"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 29 Nov 2022 15:48:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 15:48:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 15:48:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 15:48:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 15:48:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSsl+lmNOL4aQmy5Wz/klJli7AxV0jW082g2IOAtgXCjHPp0Q6NhydAewgQXu91ZoTU1SBpCbiD0irmqNzD3EhB0giGRLkqIifnDgnMr/+FyTTo8rXrIX840GL1rSNEx1Czd+sGyV+5oy5ZjiowcZ/JsBRWn76Lxs1dcmvPVfWBb7bw05SMCBhv0t8LExHWPCvxIYpo2HXtAn/ftLqiwrM+IsZmwnv6j9y2BjzhuPo/DzD4dpmEOLSSu05JDG3YUXaCCkzLuGBsTPmp765qTpWS48kwaBTW7BF4bAe1nW4uiOlzH+yRecC/QCG5O/rb9Y87yuTOjuZVlqScd8Gj42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/aaXeBwU8ye11amhYRFiwZmTd2Tn3+N+j+/8XdI2rM=;
 b=Lh85JJgn6NSFrJjQwX69pkY6i0lPz9NPXbZpp8SRoSuJm+xD+wiMpt0BGuZ1FRZUWPbfgc3jQ4h1O15NIXoYBFz0jBLssQBFlwjuvsCVN8PlxVbQaHaoC/DdVkLJvyuveCRjCej9ZewidlsStaJjU7iks/T/Zu5nMr4SZTtuiGgl3RQRhKAElwlqqKJxuTefRlCC/KoO9g0XuBdvu/7nVJPqmxhkx7XX3NkLvVUS/vnq7bn/XdGAFUK3IXXZmXwttug45cgC3NTuW+CVMd8bVHfJCEiaySEuwAL9EfS9APmz53+NNjwHwz5WFXq+Mxs/RWJUCNT0P3bXx4CpgLGOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 23:48:50 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%3]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 23:48:50 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/i915/uc: Introduce GSC FW
Thread-Topic: [PATCH 1/6] drm/i915/uc: Introduce GSC FW
Thread-Index: AQHY/f7KLuhpPzDm/k2blOyLe6I9Ha5WnvSA
Date: Tue, 29 Nov 2022 23:48:49 +0000
Message-ID: <80c9553796505e78d56c8704be115c44bbfa1aa3.camel@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221121231617.1110329-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB7278:EE_
x-ms-office365-filtering-correlation-id: 2751e984-2b76-416e-a3b4-08dad26443b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7sPF3a3RK6T0fVHPLszQGS611TSvMzYm1rNISLY/5YBNARUSBWPjlqnmCEQHbfHh8h+ddieb8ae7Q8SxZXG0T8YCnuRfptpAMrSnQmZRJ0A9APOLOmyKr3cskZ/9tKg2MRz0lGUwZ1rqdQ98qi2tmEXr7d47W8NSNnrxV4fIRCrck6mEg5xOswszdUm3ZOvWYtKv9U9i5k8Yc/NPvS/+CGNmAwmx49jcciC2ln+5pgXQjfvU5T41HFa/Qjv/YwHqE1JgBD9b6UetIT432WvA0P5wDKCi1PWSd3mtRXnXrbqCKkRA5Q5d3f3KuxoAHcvvzVcbsoo6Ur7NUmxu9ItZMT4BKyTenkGyuOrsHu8wmEruFxD5NSEm+Emrug6O4CwwDHitc6XdKTVQlBo1bLadHDekMyloiMyEXioKHJ4TIcQbV/RbEKuin7Ud6w1VClRD5PYNMcZe9VVRU61JG/+PrNF19xKURqyE5aSQDcWktIFdEIRgf/s1+eCm8dU0eW3N2pe/jUnv9xx9yf4DSA/tFEl+/hzvEqhr/mHVzJWMuudpGN2c3FpBIA871n6XNPNiB8gWVxTCQlJwEQd1pbSvhPNz+nFiOJqcD79YwLLS/6KgHaGiCIbtsrCLy+YzDe4VxnM83EajgrQ2NXOlG9fs1r6VdLKS4qnqdE5UEwImSoeiy7qrTaM86uvzVG0hRaf1Dh4pwhYTKAaCdPanLkuz8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(6506007)(91956017)(450100002)(6486002)(107886003)(478600001)(71200400001)(66946007)(2616005)(66476007)(8936002)(4326008)(76116006)(64756008)(66446008)(66556008)(186003)(8676002)(4744005)(5660300002)(2906002)(4001150100001)(41300700001)(86362001)(38100700002)(122000001)(26005)(6512007)(38070700005)(54906003)(316002)(110136005)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2pRWG1vek9sT3VWbWgvdS94WFl0c29jRWFxL2puMGNvMjdhOWxMU3c1NE5h?=
 =?utf-8?B?L0NwcG94aGEwcXA3MGlBYjVvR1o3dTVoWmlyeVdseHNsMnJDS0ZRNjJuNFJQ?=
 =?utf-8?B?Q3RJUjVraDdrajhKM0ZrL1hrT1BKNmdnM0U2eDFYb2thcEhETDd4YmJJMWFV?=
 =?utf-8?B?T3pvSS9IQkI4dnhuVFE4cU5WQnI2QzczSUU1VXFZUDVmRFRnODhTVDYxN095?=
 =?utf-8?B?M2NidXlJWEZSbVhETUx6cDdZRWtEU1R4SERxK0JmRGJJVDRKWmRyQ0FXRnhD?=
 =?utf-8?B?WmlRckFUa1ZyMHg3TnIxUlZtbmwwbEt3M0t3bFI0TmRiQ1NPUDlXUklFKzNI?=
 =?utf-8?B?dnI0eHhIbmhVNUxFTnZTN1duaS9TTCs1Ump4SUNuT0R3dVBJVWpUcXhqcW9j?=
 =?utf-8?B?dmpRZmpVcFR4SmVsdEZpdG9BT1U5ZUtRRDJrL0pnWVhKaXJYbHl2V2lYakkr?=
 =?utf-8?B?aWd1NnlqaTNxSkdwVExTa0lidXF0ekQ4cnZzdjg2YStyVWI2d0dBcmdhTHZl?=
 =?utf-8?B?Vkhhd1dGTU5CRzNFeHdnaFZkakJnM1NWQlp1MWlBYUZ3R2RmRERka09ZTmtv?=
 =?utf-8?B?cUNGa0g1RFNZdHZyYkVLOTVwWlR2ZlF0SGlYd0xUbWJRcFlqZkg4cG9kSkpW?=
 =?utf-8?B?d0hJdURnYk93UU9sTzBsR2pncDZIWmFlSTFDOHRmS1FoRHlxYTJ2Z3U3RWFT?=
 =?utf-8?B?aGxMc2lZdzllMElUZnQ1aGRDKzZOZEdxNkdSb1JEdzdDN29JbzJDdkxSL210?=
 =?utf-8?B?bHVFRWNaeFNYdXRMNEpRczlrWVF5SzE5cHdmZDRyWXYwK200bmFRNVk1OXdO?=
 =?utf-8?B?eit5VjlnSlg4ZkZCZEdPQmc2TVFEWmFNM3c5alUrMXJ1d25rYTZSWUlFeVZj?=
 =?utf-8?B?ak5sZzRERUZNaC9lY09SYTFoL2JGenpTR2IwYXNOUm5QQ0ZRNk1nb3hqb2xs?=
 =?utf-8?B?M1hqN0RtYjVidDlhUlNCWTJaeGNVQUlmOEc4VkhmU1M1cGxtOEJZVWlwY0pK?=
 =?utf-8?B?WS9aZzRmMUgxL3ZvVlY1RGl0NWtiNm9TUmFmSmNmRDRwWG9CWlc0MWVIUUEz?=
 =?utf-8?B?SnVOSkpkdWFwbUsxdUdmcnhIQkNvT1JDeUxxTStaVXVoNWV0NXQ0SGd1YVB2?=
 =?utf-8?B?cU9UR0RFUW9UbVpWTDdRNzVKalQ2ZklTVytNVjltbWEwb0dabEd0MHBtdlZk?=
 =?utf-8?B?Z1B0YnZueGYyL3VGRFNQejVsT1ovMjBmU2FaL3NMTVBFMWdpUVg1a0xleGE1?=
 =?utf-8?B?VlUzQkt6L3lvWFF2YUJzTnR2dXliSHdXMnZPL0s4UXl4UDU2QXJaL0tzT0sv?=
 =?utf-8?B?ZlBRNTlLU29IYTMrK2podllGR1lmYktoRE1idHM2Z241Z3pjTjVVdVJCdUc4?=
 =?utf-8?B?WmFlQzZPbHdVVlFqbVoyeDVBdlhRdy9FSTdMazlyZGlMRE9ZSWppbVFWQW5v?=
 =?utf-8?B?b2RSamlkOTFTWmxvRStxQlY0WWlRczJ5V3MzL1VnT0J6SEZqdWQ0bTdkd1JB?=
 =?utf-8?B?MjdvcjQ3OUNWZ0psUElzZGZlWkNvNEdvVCtDM293OEZUMXBJSytZZUlXRjNs?=
 =?utf-8?B?bkUwQ1E1QlBwKzFPMjlwNllVV0xSZHBWbVBVM1lybXZoR2JEWWQxWk1pR2hS?=
 =?utf-8?B?a3pDbkpFOGowWEZvYXRqeFJTVTBoSVBzQnpuMUpEMDc0aVRwK05iaUR3UEN6?=
 =?utf-8?B?Vys3TU5uaVdUSkxnUkFFY3J4c0pEcG9ML2cyclJXQkw0RXZMVGd0bGphT09q?=
 =?utf-8?B?L292NGs3c1lwcWhEYUNvNDRKWXFWNmo5ZWJXS0prWTlJckZ1NGdZNDlUUHpj?=
 =?utf-8?B?N1pKZWNHUkpPUW8wcnBFNXR2d2I0Zmlqb1Q2VEthSDVDS2ZPNm9kTDBzMGtP?=
 =?utf-8?B?WjRIM3dzY0QyeXQxZHJZK2lPSGY5d3JwUEx3ZjdFWnJmTmNXeG1uQ2hxUHpV?=
 =?utf-8?B?R2NRd0h3VUVDeXN5Wnl5QXlDK3ZuY3BRM0NCekp5dFdoMGM2V1lSZlJmZnY0?=
 =?utf-8?B?ZlB2UTBnVVBhVDVQQzlLVjg1WDkyV0RoT2JqK0Z1RTNYVkRvZjhmQW9ON29y?=
 =?utf-8?B?YWxxRkdaQWt2d2djcE0rN214dlhiQndhNGtmREZYY05xUEs3TUJpYVNLR0ZV?=
 =?utf-8?B?dTVlU21mNWhvVmtyT3YyWnlkWUpsb1B3dE1Mbkc1SFdDUk5XbHRWaCsrOFdY?=
 =?utf-8?Q?2YKXbeMGZsUbfHX8O2Ej5IQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <450A0E1A58B83F4FB81106EBD17B3568@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2751e984-2b76-416e-a3b4-08dad26443b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 23:48:50.0287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pDK0YnngM8tM2tBQ0pPoprHZll9U+gZXVYuGcuOWAA9zOiolfYqtgd9zdLlQKaCl2e9bRrTAaWMFmXGmUQBQeQIBgSmYrFjAGeBs0iyQPnEfyEcH/Vz674BKC63k2EK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVzaWRlcyB0aGUgbml0IGJlbG93LCBqdXN0IHdvdWxkIGxpa2UgdG8gZWNobyB0aGUgc2FtZSB0
aGluZyBOaWt1bGEgc2FpZCBhYm91dCBub3QgaW5jbHVkaW5nIHRoZSB0eXBlIGRlZmluaXRpb24g
aW4gdGhlDQptYWluIHVjIGhlYWRlciAod2hpY2ggaSBrbm93IGNhbiBiZSBhIGJpdCBtb3JlIHdv
cmsgZXNwZWNpYWxseSBpZiB3ZSBnbyB3aXRoIGFsbG9jYXRpb24gb2YgdGhlIHN0cnVjdHVyZSBh
dCBpbml0IHRpbWUNCmFuZCB1c2luZyBhIHB0ciBpbiB0aGUgdWMgc3RydWN0dXJlKS4gDQoNClRo
YXQgc2FpZCwNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxl
eGlzQGludGVsLmNvbT4NCg0KT24gTW9uLCAyMDIyLTExLTIxIGF0IDE1OjE2IC0wODAwLCBDZXJh
b2xvIFNwdXJpbywgRGFuaWVsZSB3cm90ZToNCj4gT24gTVRMIHRoZSBHU0MgRlcgbmVlZHMgdG8g
YmUgbG9hZGVkIG9uIHRoZSBtZWRpYSBHVCBieSB0aGUgZ3JhcGhpY3MNCj4gDQo+IA0KPiBAQCAt
MjQ2LDYgKzI1MywxMCBAQCBfX3VjX2Z3X2F1dG9fc2VsZWN0KHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICppOTE1LCBzdHJ1Y3QgaW50ZWxfdWNfZncgKnVjX2Z3KQ0KPiAgCWludCBpOw0KPiAgCWJv
b2wgZm91bmQ7DQo+ICANCj4gKwkvKiBGVyBpcyBub3QgZGVmaW5lZCB1bnRpbCBhbGwgdGhlIHN1
cHBvcnQgaXMgaW4gcGxhY2UgKi8NCk5pdDogcGVyaGFwcyBhIGxpdHRsZSBiaXQgbW9yZSBleHBs
YW5hdGlvbiB3b3VsZCBiZSBiZXR0ZXIgaGVyZSBmb3IgZm9sa3MgcmVhZGluZyB0aHJ1IHRoZSBj
b2Rlcw0KPiArCWlmICh1Y19mdy0+dHlwZSA9PSBJTlRFTF9VQ19GV19UWVBFX0dTQykNCj4gKwkJ
cmV0dXJuOw0KPiArDQoNCg0K
