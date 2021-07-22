Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9843D224A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB786EE04;
	Thu, 22 Jul 2021 10:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78256EE1E;
 Thu, 22 Jul 2021 10:49:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="275436519"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="275436519"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 03:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="415411445"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 22 Jul 2021 03:49:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 22 Jul 2021 03:49:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 22 Jul 2021 03:49:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 22 Jul 2021 03:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCvXhlSixD3BIMwVObUJZL3EpOvn3ideMOblULbKDaJ0R6T2a3yGFRXgVp68TYwBIwiEd3B4XEpITGW+Aq3iVzk8U3BRrqVX9jXUDq6NFxkVA76O2IPUGjkc4+Iysl1svyehst0f70DGR1m7NdzRwujFSGeAfOZxl37429+g6NELsABg4fnfmOvu/gsW7VA1VrLAfoO4L9QR8NFpimh7WYosUxZHhg/OVlth+Nu4uhCSi4LKjlknF5EAmmR2bmFL9GQRoIr4lNge+pQvEm98wNMedsJ9mHCn8r37Md1Ie0lK5uYiOE6Mkuh0YsEYTffxgqUSvGS8JTcDfsw2RDaF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tez6UB3z6pf1SA7iiI5xYiAfICKJVFW4WQn1qgbflo=;
 b=IMgJBueRzt+/u1HVd+09QSY1KF7vAo4uHGeY9s2mNNgGE+1oVYQskCzc+7B19larOLLj3s6MCR4Mt5IHBtwqeR7gzIOVH/gyMED/PUNzCZyanhLUTirtRgPrqEPpXsCJxrs0BfO1uvQl8ZIAeTBZlZ+SW+h0e6a52uJWYz5+MEQH22MT/9CU73ddTxOZRq4DyPzf7fHn/KANLv9czj19FBvqWZwsz6Qe+pHOBPxpRMfMuClZYt1INZQpjuIXbhBR2RH5Xoqg1+L41dc9svbkg61CB1tMWTuSzW6sjgObQNyJ0sgDJDbDVsf/FfTsQSE54zSmpjd6eHzLqK+3ASPzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tez6UB3z6pf1SA7iiI5xYiAfICKJVFW4WQn1qgbflo=;
 b=Vq4YJE3tFvmsAwjfSAlbYyjigNfASbWsDfTsax1U8KJk949SgEx9M0o8gHnGfTdX9Ta+YIP0/JEJGcrZVy9BC9cxLpElmn5E4DxeKlmNvO/GNhVy5bfHbKpoucSvM4jEq1okS1Y5ych1lvqzi4nZTX4Z0OJgI/RSP6sd4U3ZcVk=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB2617.namprd11.prod.outlook.com (2603:10b6:5:ce::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Thu, 22 Jul 2021 10:49:48 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4bb:d75e:3801:1b2d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4bb:d75e:3801:1b2d%7]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 10:49:48 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: refactor the i915 GVT support
Thread-Topic: refactor the i915 GVT support
Thread-Index: AQHXfkkPR74j3PcQBUqzVfBaHB7ETatOyPlw
Date: Thu, 22 Jul 2021 10:49:47 +0000
Message-ID: <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <20210721155355.173183-1-hch@lst.de>
In-Reply-To: <20210721155355.173183-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a2c6df2-dc23-4ef3-0be0-08d94cfe6cd0
x-ms-traffictypediagnostic: DM6PR11MB2617:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2617D7CBB30E930AB4BFB78ECAE49@DM6PR11MB2617.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d2st0T2rhKEQo6GIc8l+NmqQLEdzBHjlMLG97jP5JY3phvM1y9soKD9s4rMHaYscfO+lz9uCjxn8nrs6nAU4hroGO26Rt9SZmc1WtIUFLlfzynn2rznSkv//SSO4j94WzGGpu4kwO4MEeMrdcchn9ZFJJ3qHc5tNB7hodVc4oWX7RjFb9CKmqsCLUFDodfNzIj2PRuFn4U0YaL+Qr0jvEY4EKoR7HPG9iC9rbzcKD9/drJrqK6QgEQB1xg02lbS/Ixi//eMZWj692L//PIGP5pMxlUQ5FI0f6oBjhPnZY1b/OHEy7mJ9y87MX6TaUnB21UYcjalsxsk5otaph4qHE2AjJ18whgv4rIxN3X6JR3nJClUsdovGLe902zH2wzbVJgi2JyyMNGUAeIemX5IB+mgzwJVPP96fH5IRc3EYSaUwuv6/kLLmjnc0np5aXGOBMhIi91HwmMpFh40mJx95fvM9tarENzB9PB1YwkmTzccxsvAE85GTcmRKdqH9X14ptjii1dRbdknG47Aho/GosVG9EA+5U15ej+xWTsK/liM74cM+5hwKXx6sdS+UYNM9cl+610BTQQR54/gkrkhpzkvADikNS1tPV+VD1M+imF7gr7p2oLEMuzVR1Jjnrxcr9cV17htqipNwymcSkci/NUn9kwBdFJ3mIpVe7keFn0glhbqCgDXjIu444BxEb3xps98kQaYP3NZBoBdYjb3rRssvZZpZhoF/sUI2SXKGsgI873Wsr5MK8jiqm3qfKd4d+X7ONgO9hXCMmU+LpQvMMvWlhLx6RgxUY3QuVQg00cnPJnly5cvvpCBm+tqfrU7C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(508600001)(2906002)(7696005)(71200400001)(83380400001)(55016002)(52536014)(5660300002)(33656002)(966005)(8676002)(122000001)(8936002)(86362001)(6506007)(54906003)(66946007)(66476007)(64756008)(66556008)(66446008)(110136005)(9686003)(53546011)(186003)(26005)(38100700002)(76116006)(4326008)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkZqdEVYMVlldElSMGFBWTB5YVZSTUpvdnJjb3M2SXNjQkZnTit0aE8yYTEv?=
 =?utf-8?B?RWlXUWFaQit0NGhNbHo3dTdSNjFzZWdZOUpnTVBnUHdnNkV5SitwTEhYdUlQ?=
 =?utf-8?B?TnJsY1lZSlg4WXZLOElKWFJCYUg2ZEVmcnhXR2pTamJqckdBdGhHWVJDMGNr?=
 =?utf-8?B?OG1RaUJ2UmowOEpCMzg2clFxS1Y5eGtoOTBKUDZMN3NXOW9zTzdJMVB4LzBQ?=
 =?utf-8?B?aXRvZXFmeHAvQmJaVlltT0FSME41YnlYR1UvbEJ2c1kvSDJjMXF0aFNaU3lS?=
 =?utf-8?B?Z0RhR0FnTXYxalZ1ZDJ3Tk12N1pLcFBiYTlWYkIwSTI2ZHBYUllHM3JQdzFa?=
 =?utf-8?B?U21vYTZIWVNXdWdFYytldXhSODN6aVRUVENScXE0Qmw0bUl6M1NPTkExckdF?=
 =?utf-8?B?Mm0vZ1NYVC9yb2FWZDhzbzJtUWdtYzNrd0ZoZVhJRTg3bkFRZmlNbUEvOFor?=
 =?utf-8?B?VDlwL01sbEU3ZzQxZzlUZ1N4d1N1VXlJOUNmNFVnOEdpZXByRW1YZEx3R255?=
 =?utf-8?B?dGcwWnZ0bCtKVXFtTEJSOFE0SnFldlliSElBVXI3eGg3QmplYjVrYURoODdH?=
 =?utf-8?B?eDdmV3hOTTBrZmVkbzBpS0ZDRTBTcWdqRm81cUtwUGFjKy9XaFR1V3dZRUVa?=
 =?utf-8?B?Z3ZsdDlEVnJ5WjVWNzdxazR5eEIwTTNlKysxeXF5bkZRNmNhamlkTlJxbnpS?=
 =?utf-8?B?bE1DblQ2WDl5Q1pXSkUyYmFhbXZpMGZadEoreVhJN2tST3l1Z0Z3N2VtbWpR?=
 =?utf-8?B?R1haVSszbVBJdko2a0NPcGMyYUljakhqci9senNmdjhqUGtPVDVoQlN1K21H?=
 =?utf-8?B?aXNvazJlbVF3UWlJZWF0Nmc1ZjhtaWNaUWZhbWJtbGJ3bGRRZWlaREdaYXcx?=
 =?utf-8?B?STcwODVHdWg4T0hiQytRWERUM0EybEl5Zmo2WEsrS3YwaHNyZWhzcEpRMXpJ?=
 =?utf-8?B?RERXdWJ4WHBQZE9xSytlUzg0eXRiRFdvcVhCQ3MrN1B5UkdKVExTUzYzdU02?=
 =?utf-8?B?SjF5RFdlNkM2UjNTRFZIcFNMdHRYdm1QMEFDVVdSanlSZnFQa09QYTNwNDRw?=
 =?utf-8?B?cStidHhxT1Z1ZXpEazkvSWIxQW9RVFVBWUFZSEVNMXVkUHh5Mjd5U01qM3c3?=
 =?utf-8?B?V25VUmdJd1dHYTl6Q1NCT0ZPVUVUUVcrVk5lMGw0NjRQclExQldBbXlXbjdL?=
 =?utf-8?B?NmM2YUgyYVRSZU43MEk5S05KKzRlaS9oSGE0aThHejJYb1NqNzF2dU1wUGEz?=
 =?utf-8?B?VzJjUk5FT1ZZenRzWGFmMFRnY2dZWDBnMkwrSDBKSyttQmYvNnFsUC9LSUlT?=
 =?utf-8?B?RW1nVmlQRExBazRVeVVKdUtrL2FOaTBjVXRoWTNqdGtkYkk0TnZtamVDSHU4?=
 =?utf-8?B?RUxXb2pta3lRdEtQbjVSNVUzbnpuOGVpM2NBNGtabFZhS1ZDaWJoSVpkY1Jm?=
 =?utf-8?B?WTJrL0hkQ1VnT0ZrdzlSVmswV0Y4SzY5YWMzMWhsYU8zZU1MYldVUEtYaFN3?=
 =?utf-8?B?Rm1EcnFmQ1hoMGFXc2dPakhTUjNEU0pWSmhRTThIVndyQmRkbUFqS3NNYUtN?=
 =?utf-8?B?ZjBEUmQ4T2VZRmR3MmFGQWF1dVQ4K1JIY1lVY1JpWFNNZnQrYXpYNktjd3BE?=
 =?utf-8?Q?y1dQyFJQyZBPDYvhr9lLKO7FI+ukPTJUx2KNkGDEbkdk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2c6df2-dc23-4ef3-0be0-08d94cfe6cd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 10:49:48.0046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JxKiCcuCbetibAixzg1KPN5Mbrm14+P33w7ztK2cFb4w/wYKP+KWx+/6C4UmKxQ2uMmiJpHe7Kg9+pWh+nOCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2617
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
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0b3BoOg0KDQpUaGFua3Mgc28gbXVjaCBmb3IgdGhlIHBhdGNoZXMgYW5kIHRoZSB0
ZXN0aW5nLg0KDQpUaGUgYWJzdHJhY3Rpb24gYmV0d2VlbiBpOTE1IGFuZCBLVk1HVCBtb2R1bGUg
aXMgZm9yIG91ciBjdXN0b21lcnMgd2hvIGNhbiBlYXNpbHkgcG9ydCBHVlQtZyBpbnRvIHRoZWly
IG93biBoeXBlcnZpc29ycy4gQXMgeW91IGNhbiBzZWUsIGFsbCB0aGUgaHlwZXJ2aXNvciByZWxh
dGVkIGZ1bmN0aW9ucyB3ZXJlIHB1dCBpbiAiaHlwZXJ2aXNvciIgbW9kdWxlLiBUaGUgR1ZULWcg
bW9kdWxlIHRhbGtzIHdpdGggdGhlICJoeXBlcnZpc29yIiBtb2R1bGUgdGhyb3VnaCB0aGUgTVBU
IGxheWVyLiBUaGUgY3VzdG9tZXJzIGp1c3QgbmVlZCB0byBmb2N1cyBvbiB0aGVpciAiaHlwZXJ2
aXNvciIgbW9kdWxlLCBpbXBsZW1lbnQgYW5kIGF0dGFjaCB0aGVpciBvd24gImh5cGVydmlzb3Ii
IG1vZHVsZXMgdG8gdGhlIE1QVCBsYXllciB3aXRob3V0IHRvdWNoaW5nIHRoZSBHVlQtZyBjb3Jl
IGxvZ2ljLCB3aGljaCByZWR1Y2UgZ3JlYXQgZWZmb3J0cyBkdXJpbmcgdGhlIHBvcnRpbmcgYXMg
dGhlIGNvcmUgbG9naWMgb2YgR1ZULWcgaW4gaTkxNSBpcyBwcmV0dHkgdmVuZG9yLXNwZWNpZmlj
IGFuZCBjdXN0b21lcnMgYXJlbid0IG1vdGl2YXRlZCB0byB0b3VjaCBpdCB1bmxlc3MgdGhleSBo
YXZlIHRvLg0KDQpUaGUgYm91bmRhcnkgYmV0d2VlbiBHVlQtZyBjb3JlIGxvZ2ljIGFuZCAiaHlw
ZXJ2aXNvciIgbW9kdWxlIGFsc28gaGVscHMgYSBsb3Qgb24gbmFycm93aW5nIGRvd24gdGhlIHBy
b2JsZW1zIHdoZW4gc3VwcG9ydGluZyBvdXIgY3VzdG9tZXJzLiBBY2NvcmRpbmcgdG8gb3VyIGV4
cGVyaWVuY2UgZHVyaW5nIHRoZSBzdXBwb3J0LCB0aGUgbGVzcyBhIGN1c3RvbWVyIHRvdWNoZXMg
dGhlIGNvcmUgbG9naWMsIHRoZSBsZXNzIHByb2JsZW0gd2lsbCBiZSBpbnRyb2R1Y2VkLg0KDQpX
ZSBnZXQgbWFueSBjdXN0b21lcnMgd2hvIGFyZSB1c2luZyBjb21tZXJjaWFsIGh5cGVydmlzb3Jz
IGxpa2UgUU5YIG9yIHRoZWlyIHByaXZhdGUgaHlwZXJ2aXNvcnMgaW4gbWFueSBhcmVhcyBpbiB0
aGUgaW5kdXN0cnkuIEFuIHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBvZiAiWGVuIGh5cGVydmlz
b3IiIG1vZHVsZSB0byBkZW1vbnN0cmF0ZSBvdXIgY3VzdG9tZXIgaG93IHRvIHBvcnQgR1ZULWcg
dG8gYSB0eXBlLTEgaHlwZXJ2aXNvciBpbnN0ZWFkIG9mIEtWTSBjYW4gYmUgZm91bmQgaGVyZToN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXgvYmxvYi90b3BpYy9ndnQteGVuZ3Qv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3hlbmd0LmMNCg0KQnV0IGl0J3MgaGFyZCBmb3Igc29t
ZSBjdXN0b21lcnMgdG8gY29udHJpYnV0ZSB0aGVpciBvd24gImh5cGVydmlzb3IiIG1vZHVsZSB0
byB0aGUgdXBzdHJlYW0gTGludXgga2VybmVsLiBJIGFtIHRoaW5raW5nIHdoYXQgd291bGQgYmUg
YSBiZXR0ZXIgc29sdXRpb24gaGVyZT8gVGhlIE1QVCBsYXllciBpbiB0aGUga2VybmVsIGhlbHBz
IGEgbG90IGZvciBjdXN0b21lcnMsIGJ1dCBvbmx5IG9uZSBvcGVuLXNvdXJjZSAiaHlwZXJ2aXNv
ciIgbW9kdWxlIGlzIHRoZXJlIGluIHRoZSBrZXJuZWwuIFRoYXQgY2FuIGNvbmZ1c2UgcGVvcGxl
IHdoaWNoIGRvbid0IGtub3cgdGhlIHN0b3J5LiBPbmUgdGhpbmcgSSB3YXMgdGhpbmtpbmcgaXMg
dG8gcHV0IGEgZG9jdW1lbnQgYWJvdXQgdGhlIGJhY2tncm91bmQgYW5kIG1vcmUgZGVzY3JpcHRp
b24gaW4gdGhlIE1QVCBoZWFkZXJzLiBTbyBpdCB3b24ndCBjb25mdXNlIG1vcmUgcGVvcGxlLiAN
Cg0KRmVlbCBmcmVlIHRvIGRyb3AgbW9yZSBjb21tZW50cy4g8J+Yig0KDQpUaGFua3MsDQpaaGku
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4gDQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMjEsIDIwMjEgNjo1NCBQTQ0KVG86
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBKb29uYXMgTGFodGlu
ZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPjsgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PjsgV2FuZywgWmhpIEEgPHpoaS5hLndhbmdAaW50ZWwuY29tPg0KQ2M6IGludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQpTdWJqZWN0OiByZWZhY3RvciB0aGUgaTkxNSBHVlQgc3VwcG9ydA0KDQpIaSBhbGwsDQoN
CnRoZSBHVlQgY29kZSBpbiB0aGUgaTkxNSBpcyBhIGJpdCBvZiBhIG1lc3MgcmlnaHQgbm93IGR1
ZSB0byBzdHJhbmdlIGFic3RyYWN0aW9ucyBhbmQgbG90cyBvZiBpbmRpcmVjdCBjYWxscy4gIFRo
aXMgc2VyaWVzIHJlZmFjdG9ycyB2YXJpb3VzIGJpdHMgdG8gY2xlYW4gdGhhdCB1cC4gIFRoZSBt
YWluIHVzZXIgdmlzaWJsZSBjaGFuZ2UgaXMgdGhhdCBhbG1vc3QgYWxsIG9mIHRoZSBHVlQgY29k
ZSBtb3ZlcyBvdXQgb2YgdGhlIG1haW4gaTkxNSBkcml2ZXIgYW5kIGludG8gdGhlIGt2bWd0IG1v
ZHVsZS4NCg0KVGVzdGVkIG9uIG15IFRoaW5rcGFkIHdpdGggYSBLYWJ5IExha2UgQ1BVIGFuZCBp
bnRlZ3JhdGVkIGdyYXBoaWNzLg0KDQpHaXQgdHJlZToNCg0KICAgIGdpdDovL2dpdC5pbmZyYWRl
YWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdCBpOTE1LWd2dA0KDQpHaXR3ZWI6DQoNCiAgICBodHRw
Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3JlZnMvaGVh
ZHMvaTkxNS1ndnQNCg0KRGlmZnN0YXQ6DQogYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzMSANCiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMwIA0KIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfZXhlY2xpc3RzX3N1Ym1pc3Npb24uYyB8ICAgIDQgDQogYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY2ZnX3NwYWNlLmMgICAgICAgICAgICAgICAgIHwgICA4OSAt
LQ0KIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyAgICAgICAgICAgICAg
ICB8ICAgIDQgDQogYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgICAgICAgICAg
ICAgICAgICAgIHwgICAzNiANCiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9leGVjbGlzdC5j
ICAgICAgICAgICAgICAgICAgfCAgIDEyIA0KIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNTUgLQ0KIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d2dC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMDAgLS0NCiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMTMyICsrLQ0K
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jICAgICAgICAgICAgICAgICB8
ICAgMzggLQ0KIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAg
ICAgICAgICB8ICA2MzQgKysrKy0tLS0tLS0tLS0tLS0NCiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9tbWlvLmMgICAgICAgICAgICAgICAgICAgICAgfCAgICA0IA0KIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L29wcmVnaW9uLmMgICAgICAgICAgICAgICAgICB8ICAxNDggLS0tDQogYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcGFnZV90cmFjay5jICAgICAgICAgICAgICAgIHwgICAg
OCANCiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyAgICAgICAgICAgICAg
ICAgfCAgIDM3IA0KIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlLmggICAgICAgICAg
ICAgICAgICAgICB8ICAgIDIgDQogYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyMiANCiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
ZHJ2LmggICAgICAgICAgICAgICAgICAgICAgfCAgICA3IA0KIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9wYXJhbXMuYyAgICAgICAgICAgICAgICAgICB8ICAgIDIgDQogYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9ndnQuYyAgICAgICAgICAgICAgICAgICAgIHwgICA2NCArDQogYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnQuaCAgICAgICAgICAgICAgICAgICAgIHwgICAg
NCANCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgfCAgICA5IA0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaCAgICAgICAg
ICAgICAgICAgICB8ICAgODIgLS0NCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmggICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNDAwIC0tLS0tLS0tLS0NCiAyNSBmaWxlcyBjaGFuZ2Vk
LCA1NDEgaW5zZXJ0aW9ucygrKSwgMTQxMyBkZWxldGlvbnMoLSkNCg==
