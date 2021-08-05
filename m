Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E960B3E1FA2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 02:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EB46E8C7;
	Thu,  5 Aug 2021 23:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712356E0A1;
 Thu,  5 Aug 2021 23:59:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="278028969"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="278028969"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 16:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="671959149"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2021 16:59:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 5 Aug 2021 16:59:54 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 5 Aug 2021 16:59:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 5 Aug 2021 16:59:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 5 Aug 2021 16:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKgNt2gOx+hHzPFFYdL/OV7cJ68xusPng1fEv7GU+oFKkXvJzqYPYDeKhHE3SCeVgr8uuQWh3sw0lPIJLq9j0OG9jDdPCltqL/SJQNLfaty0JP4Nytv+d9d+vw20k0Tw+NZ/I+WB89LVltB/xPVdJRFKnJTa2rnaH92onhoki/ydrTSBviexFMQWrVtnVZ3pblJ+bYyf+F0gCP5LJwGf9Ads5TFsbaQhXpgiJfKziNh3o5w5lHoTp0/8gDKWhV8hFKbHZFDnIaVHfj1YQZ9QavIix2H3p4b1H/+xFfXnw2emWfcW44XdL3GIPgAUfoLpIc0oTU4GH2Cv7CraE9LqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I5VsgX//hwxb2dMwkdIgHhg5J9ApBlEGIY14CDzpOU=;
 b=Xeyk97znievjdwugD6l5s8W1U+ENFzSJrCGP2N22w7JEJlWlAjm6i0hHm/4HcwKnE+PpqITRQ/6rsDXi5fjwVPUA12cEeZRTtbwA8fFh/uhQp2KA0s4DuNVaQBuXcjco83hyKMOqbtUUvJWWA2n4s9I8XwxtTPrR1b5byW4Xek1PqVR+qAPSYSA7ICEsM3EnmRfEqZTtComh14/HCYtgfmDeiD837GSnFx1yHDjpF/RGe26yKBzU1x264foO2Ojv2eFY3XMDjI7Ry93YZESQsoflvMIo8gfsandTCqBFOf0Wr7lezAdCwm54Ru7+BXqvy4Sze1LzTN6Hs7xDVX68pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I5VsgX//hwxb2dMwkdIgHhg5J9ApBlEGIY14CDzpOU=;
 b=ebLrAKYcMCN/IY21PyokTipwuzUqZ2RRRq0pxI/IHGpd7qge1Zu1IQbYW6ujckW2jJc9Ms+TSFOrlevptYySg/VpiedYWFk4UBcJeU/XO2khRPA8VBMoeuKXggapqvxjDRy2xSH8l6zJcts5uFCEWKfRYkt1SS7/2B+dl8QnAIY=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB4321.namprd11.prod.outlook.com (2603:10b6:a03:1bf::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Thu, 5 Aug
 2021 23:59:50 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c%7]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 23:59:50 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
CC: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "liviu.dudau@arm.com"
 <liviu.dudau@arm.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "stefan@agner.ch"
 <stefan@agner.ch>, "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>, "sean@poorly.run" <sean@poorly.run>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>, "tomba@kernel.org"
 <tomba@kernel.org>, "Dan.Sneddon@microchip.com" <Dan.Sneddon@microchip.com>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>
Subject: RE: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
Thread-Topic: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
Thread-Index: AQHXiEb1AFPCZWr2Z0Sou03cU4voIKth4UYAgAA3trCAANYjgIACqukQ
Date: Thu, 5 Aug 2021 23:59:50 +0000
Message-ID: <BY5PR11MB4182FBA1D240321F7D9BEC7D8CF29@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <YQlbFjbrnyeWv7QP@ravnborg.org>
 <BY5PR11MB41822706053ADEE927E34E628CF09@BY5PR11MB4182.namprd11.prod.outlook.com>
 <4dbc29d7-5f88-e3ac-5dab-e2dc5c6a703e@suse.de>
In-Reply-To: <4dbc29d7-5f88-e3ac-5dab-e2dc5c6a703e@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da03a8ed-94d3-41a6-06ec-08d9586d1cbd
x-ms-traffictypediagnostic: BY5PR11MB4321:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB43210C56D29940F21904417D8CF29@BY5PR11MB4321.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gqPQgbIIJLNU09fcMxaDGqfYX00xY3KVwotHj5Q2FENskeu6Q0Fo1OIZxOjDqdU9A2cqfE0DPqPykllamHjNt/ZHCfZ499s7WwGaRi/sjEzbUNHbGc1YCB0pbKGa23gXaFRmM3jTPcMIV9kooUe/GSC08Oj5IWPGgHq1OJAtn47fZUhEaF0oA5jiL4Lwq1iEYKPh6ljyOp/cuo3l9d90UMkVkttJ7lhWRkHgE3eMn41byTDMRS+8YFck7BJziIcCY2m7KWAwEniPsKfRgOj4kXHkErXSTZkW8RDCdekUOV629zgB3VogkJZdDWx0GrpTljV+7rbdKSgeBstdfHINldOfC6VmMnW+UeqXZiWENZqiMDzWzeL2FjCGlCbo5nyqwg71N79TECRuOFE2AAY+nUAiesvS17GLn0tEtA9OOCCM8ImBKVadQ0PkKuJn7mv442GbqnrZlcRycnkZHSlNDhvmYqMDZBDUHf8GwFrG20xpoL/kOIeQ5S7h7GgFmO0iMgJLxbfbhGtB9GcRcGsTa21eLcs06M4esX2LqTYwh9zIp/x1lRVbifha8m0PeFYUMG1WRBWl4mec7RdW7ABaXsYXYGkwLQTBUMjj0JNNLwC/YHaaBiZ8DdUDw1TUpJP/KrNmVKzA6xaU7DTPOnIa7nnp7bSL3T+SncdQgx1jayVzUgmoOty6jEOhU+/BryWDXh1GNDN7kxqCY1XvVk4roA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(66946007)(66446008)(76116006)(52536014)(8676002)(478600001)(5660300002)(66476007)(64756008)(66556008)(966005)(186003)(83380400001)(122000001)(6506007)(4326008)(2906002)(71200400001)(33656002)(86362001)(7696005)(53546011)(38100700002)(66574015)(7416002)(9686003)(26005)(316002)(55016002)(54906003)(38070700005)(110136005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Umdyc04wVHVWT010eFkvSzBnYmFkR1VzRGxrOWVIenN0cDQyZHR2bHNGVkV3?=
 =?utf-8?B?YkVQbk9jRVdpWU5DMUFmVzlxREVLM2xFcnMrbWoyVmtjVTUxZlFheDhnaUlS?=
 =?utf-8?B?cXAyL1RkRVY4ek9QdFFoVlZNS21hS0Zta2g5QUE0U3loQXRjOFJCTVRHempx?=
 =?utf-8?B?Tk44UjhubmlvTkVZL3JrTzRrd2RIcEp2ZjN6b3BjKzBobDdCdDQyMmxaYlFM?=
 =?utf-8?B?TVJLR0hYQU5SVDdIU203VTcyekJ2elJqMzlRcHh1NXZLUVZxaE5hUkQxdzFL?=
 =?utf-8?B?eFVGZE1uVm5rUmhTM0J3TTZ0YkkzUGdhbFNhZWMrM3FXUDRDVUx1LzAxMFgy?=
 =?utf-8?B?RUNrYm5Ra0YvdU5FMzY1UTN4OURiQnhjL1JENTVyL01xR085VkxWNmdNMW9Z?=
 =?utf-8?B?WG5KZGU0SURBWkNBdXJqVlV3cjFOZXRxL3VSY3M5M0NMdU40THhyT21CaHVK?=
 =?utf-8?B?ZnFIQXpvYnNyS2VqRU83Y0RwaENEQUxORzh4VDB2Q1NNY0UxckNPWWpyUGJF?=
 =?utf-8?B?M2tlYWtiUVNvbmdVYVBOQ1dhWDJxMEx5YklOZDZ3dE5IWEoweUlZTlNQWEpB?=
 =?utf-8?B?bUtBV3JDdSsvKzBpQnZkdW5VT0cwUUFtcnBOSmxFOEdpVncydTErRS8zSzdn?=
 =?utf-8?B?Y2h0Q2RyZzJlREhUamE4Y0FZZWVtcEgvcWM3VXJkdlRiS2c1NUZEK1JVMDc0?=
 =?utf-8?B?U1NERGZOeE4zMGVYblJSVWVZVE0ydjJFcGE2Vnd5MlBjSjZteU0rMU9kNWI4?=
 =?utf-8?B?elNmYWFGQUg5VnNjRC83ZEVqanU4aEtYeVJpdDlSVkMzT2VxR0VrZmhkWFNR?=
 =?utf-8?B?Q2o0VFMwZXdsR3dOdjJqRlgrRGlITDJkQ2xsMis5Rnp3aDdLemo5YXY1OVl5?=
 =?utf-8?B?NWFpemxUVDlncW5iNmVaTnlnQjdJQnBqd3QxS2kzaHEzbE9pVDNXR3RYMXJv?=
 =?utf-8?B?RmRna05uUEpMWEJlaE1CWERlbnlQdjhScE0rUmlvOGVSQm8zNGN4UlpuNmxJ?=
 =?utf-8?B?UnFwNVJSaVhaWlFnZFJoUGFZaVdHais0RlpjRWZ6OVVPNEE5d0gxTUVNcWhI?=
 =?utf-8?B?Y2xGaFQ3VExacE5sS0lKSmZPeFBYVHozMHVETW1NUmtETkVLaGI1ZG4rTnps?=
 =?utf-8?B?MzdyRmxPdUt2TS9wSWZpWlpJcHN4UEdZcnlQK2xsVHprNFV3WVNzczkzczBs?=
 =?utf-8?B?WjdXQW9yQlg4aEV6QmlXUkRJYk9RNVdwWkJFM2xzYVdCOVlLNy9EcXJTakp5?=
 =?utf-8?B?Y0duM2F6NHM1VVBTV1JRaEEvTjJtcHJGNktCQWFoVExPc3BnME1xTTdCd3Ar?=
 =?utf-8?B?MWUwMlVrL0J3TitneG14L0o5cm5FTU9mYVBmV2c3NEhTQmN3UVY0ZVU2NTF5?=
 =?utf-8?B?ZTVZL1RDd014Q3l5b0JwTnpMUzdKS0FvU240clNoemZ6LzluR1U5cHNLZWdk?=
 =?utf-8?B?U1NwOTNCb0lwYkNSdS9rMXFCczh0blVFdXJ5R2xuK2kvb3dzeWZIcm1vZVhv?=
 =?utf-8?B?aUFzT0FjdGhXVFJTWUNsWm8rQjU0VWJpeHBia0RKdm9jUHU5YjVtSUZqa01r?=
 =?utf-8?B?V2RwVmxEOWQzaFF6NGZnTWNGWjd2Tk1FdkxFSGdvNFFBUlBYdFFsVUFMRjlx?=
 =?utf-8?B?ZHZhQmZGY3NpQ1Z5WVErcTVpVitTekE0VFhUUUVoSGJiOUc4dDFMWXBtem4w?=
 =?utf-8?B?WWo5cU5VYjIyS2djeTNrS3Q3bGE2Y2Y5Q3pXR1pTWkxVN0dBM2JsRWNTWmNW?=
 =?utf-8?Q?miTFFCAqN5bp2EnOQM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da03a8ed-94d3-41a6-06ec-08d9586d1cbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 23:59:50.5116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yHJ0kbUMaSvFhOt6y9VV6l4jomi/uBogL3nZJQqHO7eAC5BZMfo4C6w9GhPmtOIB4mxj3OlO/ZCAeQhPzBK7puLIPz3iSF9wXD9QiWktOhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4321
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1
Z3VzdCA0LCAyMDIxIDEyOjExIEFNDQo+IFRvOiBDaHJpc2FudGh1cywgQW5pdGhhIDxhbml0aGEu
Y2hyaXNhbnRodXNAaW50ZWwuY29tPjsgU2FtIFJhdm5ib3JnDQo+IDxzYW1AcmF2bmJvcmcub3Jn
Pg0KPiBDYzogZGFuaWVsQGZmd2xsLmNoOyBhaXJsaWVkQGxpbnV4LmllOyBhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tOw0KPiBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb207IGxpdml1LmR1ZGF1QGFy
bS5jb207IGJyaWFuLnN0YXJrZXlAYXJtLmNvbTsNCj4gYmJyZXppbGxvbkBrZXJuZWwub3JnOyBu
aWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb207DQo+IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3JnOyBzdGVmYW5AYWduZXIuY2g7DQo+IGFsaXNvbi53
YW5nQG54cC5jb207IHBhdHJpay5yLmpha29ic3NvbkBnbWFpbC5jb207IHJvYmRjbGFya0BnbWFp
bC5jb207DQo+IERlYSwgRWRtdW5kIEogPGVkbXVuZC5qLmRlYUBpbnRlbC5jb20+OyBzZWFuQHBv
b3JseS5ydW47DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7
IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4ganlyaS5zYXJoYUBpa2kuZmk7IHRvbWJhQGtlcm5l
bC5vcmc7IERhbi5TbmVkZG9uQG1pY3JvY2hpcC5jb207DQo+IHRvbWkudmFsa2VpbmVuQGlkZWFz
b25ib2FyZC5jb207IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1hcm0tDQo+IG1zbUB2Z2VyLmtlcm5lbC5vcmc7IGZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMC8xNF0gZHJtOiBNYWtl
IERSTSdzIElSUSBoZWxwZXJzIGxlZ2FjeQ0KPiANCj4gSGkNCj4gDQo+IEFtIDAzLjA4LjIxIHVt
IDIwOjM2IHNjaHJpZWIgQ2hyaXNhbnRodXMsIEFuaXRoYToNCj4gPiBIaSBUaG9tYXMsDQo+ID4g
Q2FuIHlvdSBwbGVhc2UgaG9sZCBvZmYgb24gYXBwbHlpbmcgdGhlIGttYiBwYXRjaCwgSSBhbSBz
ZWVpbmcgc29tZSBpc3N1ZXMNCj4gd2hpbGUgdGVzdGluZy4gTW9kZXRlc3Qgd29ya3MsIGJ1dCB2
aWRlbyBwbGF5YmFjayBvbmx5IHBsYXlzIG9uY2UsIGFuZCBpdCBmYWlscw0KPiB0aGUgc2Vjb25k
IHRpbWUgd2l0aCB0aGlzIHBhdGNoLg0KPiANCj4gU291bmRzIGEgYml0IGxpa2UgdGhlIHRlc3Rp
bmcgaXNzdWUgYXQgWzFdLiBGb3IgdGVzdGluZywgeW91IG5lZWQgdGhlDQo+IGxhdGVzdCBkcm0t
bWlzYy1uZXh0IG9yIGRybS10aXAuIFNwZWNpZmljYWxseSwgeW91IG5lZWQgY29tbWl0DQo+IDFl
NGNkNzhlZDQ5MyAoImRybTogRG9uJ3QgdGVzdCBmb3IgSVJRIHN1cHBvcnQgaW4gVkJMQU5LIGlv
Y3RscyIpLg0KDQoNCllvdSBhcmUgcmlnaHQsIHdpdGggdGhlIGFib3ZlIHBhdGNoIHZpZGVvIHBs
YXlzIGZpbmUuIEl0J3MgYWxsIGdvb2Qgbm93ISBTb3JyeSBhYm91dCB0aGUgY29uZnVzaW9uLg0K
PiANCj4gTGV0IG1lIGtub3cgd2hldGhlciB0aGlzIHdvcmtzIGZvciB5b3UuDQo+IA0KPiBCZXN0
IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoLzQ0NzA1Ny8/c2VyaWVzPTkzMDc4JnJldj0xDQo+IA0KPiA+DQo+ID4gVGhh
bmtzLA0KPiA+IEFuaXRoYQ0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiA+PiBTZW50
OiBUdWVzZGF5LCBBdWd1c3QgMywgMjAyMSA4OjA1IEFNDQo+ID4+IFRvOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gPj4gQ2M6IGRhbmllbEBmZndsbC5jaDsgYWly
bGllZEBsaW51eC5pZTsgYWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbTsNCj4gPj4gY2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tOyBsaXZpdS5kdWRhdUBhcm0uY29tOw0KPiBicmlhbi5zdGFya2V5QGFy
bS5jb207DQo+ID4+IGJicmV6aWxsb25Aa2VybmVsLm9yZzsgbmljb2xhcy5mZXJyZUBtaWNyb2No
aXAuY29tOw0KPiA+PiBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb207IG1yaXBhcmRA
a2VybmVsLm9yZzsNCj4gc3RlZmFuQGFnbmVyLmNoOw0KPiA+PiBhbGlzb24ud2FuZ0BueHAuY29t
OyBwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tOyBDaHJpc2FudGh1cywgQW5pdGhhDQo+ID4+
IDxhbml0aGEuY2hyaXNhbnRodXNAaW50ZWwuY29tPjsgcm9iZGNsYXJrQGdtYWlsLmNvbTsgRGVh
LCBFZG11bmQgSg0KPiA+PiA8ZWRtdW5kLmouZGVhQGludGVsLmNvbT47IHNlYW5AcG9vcmx5LnJ1
bjsgc2hhd25ndW9Aa2VybmVsLm9yZzsNCj4gPj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2Vy
bmVsQHBlbmd1dHJvbml4LmRlOyBqeXJpLnNhcmhhQGlraS5maTsNCj4gPj4gdG9tYmFAa2VybmVs
Lm9yZzsgRGFuLlNuZWRkb25AbWljcm9jaGlwLmNvbTsNCj4gPj4gdG9taS52YWxrZWluZW5AaWRl
YXNvbmJvYXJkLmNvbTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0NCj4gPj4g
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4LQ0KPiBhcm0tDQo+ID4+IG1zbUB2Z2VyLmtlcm5lbC5vcmc7IGZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAw
MC8xNF0gZHJtOiBNYWtlIERSTSdzIElSUSBoZWxwZXJzIGxlZ2FjeQ0KPiA+Pg0KPiA+PiBIaSBU
aG9tYXMsDQo+ID4+DQo+ID4+IE9uIFR1ZSwgQXVnIDAzLCAyMDIxIGF0IDExOjA2OjUwQU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPiA+Pj4gRFJNJ3MgSVJRIGhlbHBlcnMgYXJl
IG9ubHkgaGVscGZ1bCBmb3Igb2xkLCBub24tS01TIGRyaXZlcnMuIE1vdmUNCj4gPj4+IHRoZSBj
b2RlIGJlaGluZCBDT05GSUdfRFJNX0xFR0FDWS4gQ29udmVydCBLTVMgZHJpdmVycyB0byBMaW51
eA0KPiA+Pj4gSVJRIGludGVyZmFjZXMuDQo+ID4+Pg0KPiA+Pj4gRFJNIHByb3ZpZGVzIElSUSBo
ZWxwZXJzIGZvciBzZXR0aW5nIHVwLCByZWNlaXZpbmcgYW5kIHJlbW92aW5nIElSUQ0KPiA+Pj4g
aGFuZGxlcnMuIEl0J3MgYW4gYWJzdHJhY3Rpb24gb3ZlciBwbGFpbiBMaW51eCBmdW5jdGlvbnMu
IFRoZSBjb2RlDQo+ID4+PiBpcyBtaWQtbGF5ZXJpc2ggd2l0aCBzZXZlcmFsIGNhbGxiYWNrcyB0
byBob29rIGludG8gdGhlIHJzcCBkcml2ZXJzLg0KPiA+Pj4gT2xkIFVNUyBkcml2ZXIgaGF2ZSB0
aGVpciBpbnRlcnJ1cHRzIGVuYWJsZWQgdmlhIGlvY3RsLCBzbyB0aGVzZQ0KPiA+Pj4gYWJzdHJh
Y3Rpb25zIG1ha2VzIHNvbWUgc2Vuc2UuIE1vZGVybiBLTVMgbWFuYWdlIGFsbCB0aGVpciBpbnRl
cnJ1cHRzDQo+ID4+PiBpbnRlcm5hbGx5LiBVc2luZyB0aGUgRFJNIGhlbHBlcnMgYWRkcyBpbmRp
cmVjdGlvbiB3aXRob3V0IGJlbmVmaXRzLg0KPiA+Pj4NCj4gPj4+IE1vc3QgS01TIGRyaXZlcnMg
YWxyZWFkeSB1c2UgTGludXggSVJRIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIERSTSdzDQo+ID4+PiBh
YnN0cmFjdGlvbiBsYXllci4gUGF0Y2hlcyAxIHRvIDEyIGNvbnZlcnQgdGhlIHJlbWFpbmluZyBv
bmVzLg0KPiA+Pj4gVGhlIHBhdGNoZXMgYWxzbyByZXNvbHZlIGEgYnVnIGZvciBkZXZpY2VzIHdp
dGhvdXQgYXNzaWduZWQgaW50ZXJydXB0DQo+ID4+PiBudW1iZXIuIERSTSBoZWxwZXJzIGRvbid0
IHRlc3QgZm9yIElSUV9OT1RDT05ORUNURUQsIHNvIGRyaXZlcnMgZG8NCj4gPj4+IG5vdCBkZXRl
Y3QgaWYgdGhlIGRldmljZSBoYXMgbm8gaW50ZXJydXB0IGFzc2lnbmVkLg0KPiA+Pj4NCj4gPj4+
IFBhdGNoIDEzIHJlbW92ZXMgYW4gdW51c2VkIGZ1bmN0aW9uLg0KPiA+Pj4NCj4gPj4+IFBhdGNo
IDE0IG1vdmVzIHRoZSBEUk0gSVJRIGhlbHBlcnMgYmVoaW5kIENPTkZJR19EUk1fTEVHQUNZLiBP
bmx5DQo+ID4+PiB0aGUgb2xkIG5vbi1LTVMgZHJpdmVycyBzdGlsbCB1c2UgdGhlIGZ1bmN0aW9u
YWxpdHkuDQo+ID4+Pg0KPiA+Pj4gdjI6DQo+ID4+PiAJKiBkcm9wIElSUV9OT1RDT05ORUNURUQg
dGVzdCBmcm9tIGF0bWVsLWhsY2RjIChTYW0pDQo+ID4+PiAJKiB1c2UgZGV2bV9yZXF1ZXN0X2ly
cSgpIGluIGF0bWVsLWhsY2RjIChTYW0pDQo+ID4+PiAJKiB1bmlmeSB2YXJpYWJsZSBuYW1lcyBp
biBhcm0vaGxjZGMgKFNhbSkNCj4gPj4+DQo+ID4+PiBUaG9tYXMgWmltbWVybWFubiAoMTQpOg0K
PiA+Pg0KPiA+PiBUaGUgZm9sbG93aW5nIHBhdGNoZXMgYXJlIGFsbDoNCj4gPj4gQWNrZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gPj4NCj4gPj4+ICAgIGRybS9mc2wt
ZGN1OiBDb252ZXJ0IHRvIExpbnV4IElSUSBpbnRlcmZhY2VzDQo+ID4+PiAgICBkcm0vZ21hNTAw
OiBDb252ZXJ0IHRvIExpbnV4IElSUSBpbnRlcmZhY2VzDQo+ID4+PiAgICBkcm0va21iOiBDb252
ZXJ0IHRvIExpbnV4IElSUSBpbnRlcmZhY2VzDQo+ID4+PiAgICBkcm0vbXNtOiBDb252ZXJ0IHRv
IExpbnV4IElSUSBpbnRlcmZhY2VzDQo+ID4+PiAgICBkcm0vbXhzZmI6IENvbnZlcnQgdG8gTGlu
dXggSVJRIGludGVyZmFjZXMNCj4gPj4+ICAgIGRybS90aWRzczogQ29udmVydCB0byBMaW51eCBJ
UlEgaW50ZXJmYWNlcw0KPiA+Pj4gICAgZHJtL3ZjNDogQ29udmVydCB0byBMaW51eCBJUlEgaW50
ZXJmYWNlcw0KPiA+Pj4gICAgZHJtOiBSZW1vdmUgdW51c2VkIGRldm1fZHJtX2lycV9pbnN0YWxs
KCkNCj4gPj4NCj4gPj4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIEkgZWl0aGVyIHNraXBwZWQgb3Ig
YWxyZWFkeSBoYWQgYSBmZWVkYmFjayBmcm9tDQo+ID4+IG1lIG9yIEkgYXNrZWQgYSBxdWVzdGlv
bi4NCj4gPj4NCj4gPj4gCVNhbQ0KPiANCj4gLS0NCj4gVGhvbWFzIFppbW1lcm1hbm4NCj4gR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+IChIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7Zy
ZmZlcg0KDQo=
