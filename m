Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFC67A982
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 05:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E97410E314;
	Wed, 25 Jan 2023 04:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5575010E314;
 Wed, 25 Jan 2023 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674619869; x=1706155869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=grmxk93hpTgRnDXC4+ftHOvSAK2uD6jzEIVaxST1XVk=;
 b=i/Jj4F9kKUmokmQGysDDDLfpIOixB5OL9GvRLSex9f9pPg7G0yYu2iIf
 1/FvZWQlUioJ6D9QVP1jQOKpGhRiKZVfRv8ylZz79TSFaLlnruoGeCcr0
 4Lttu7DPAdBj/eVqlhpZqiLIQTwaX4igUGT/s2xahIMbLld/kcNB9w9HA
 R5V/WPzjh0zHLy8/r65rBLvaforZFBVACPaq6W+a63meUqu/KqVYkMVvz
 DyFkpK4ZOqZVSv0LWM8DcTLSChWJ5IxejHOAY15WM17Xq0QWP5UHpzkfy
 G9SEhAclTVeoH0B7UAOuqxEMMva+VErmS3NmC7Zst0t30AxP0tC0w/9p7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="327732845"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="327732845"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 20:11:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="692820537"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="692820537"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 20:11:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 20:11:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 20:11:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 20:11:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEMseSdVkvEdOO2MsvibVwchwnJ0r9troV8Uh5bs+zBrk/MaPXH6BW70T18CrtF11gZlIBe0x1QiAAE6TXrb+4mbAiuPSl3mfmi8SdJjLOFhcnQ5Xx400xb5jWd0Onvwl8sAtkqSQct0CLyOcBSJ74wksxb/X4izH1dDJjc41oYF8ur9WRag8gdqB/eSX+SviMAQSUK7JiRRUu4rKdxWEHHUcAc5nyFgEL1HSttw7PbaD1z03fpkjJWzQQasBHPBMWExuqz/5Olz2C67aF0yi0P4g7ZMcppaCeB2x+XyRdJrD7tP+HP7sRICbiQg2Q6uOQFPlUCeBRi6g78m2DJ0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grmxk93hpTgRnDXC4+ftHOvSAK2uD6jzEIVaxST1XVk=;
 b=M4cfG71gOwYBbDB0UECO1bkZx6qbynDvGqIWNdrqMsjwSjmqi+OSpwIe2VDfPqNFIEvLhCRgdCqyJ+39s705Zh8xGjbmdOBhNJ3cxm43VkTi3dRtMiCI5Gyr91j3332YuHwyL24gJDyo08l4AXDgPXfkRm927zVTF/hMIuv89OTADNzCdEdTyTXNa1qKqHXQHdLMgMIrYzBEC/quBYic0VyzV3JDvmRIRJyGP3aj9tUyQOXIyfcVYw+6jNeUtMY2O93Fd5melkXIZ2UQqv/K22lSzU2WKLEk21Tgc8Khe5dgknoZsUXFcM923JZHSqe1iA5MP7lfbLpVniFa5bZslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 04:11:05 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 04:11:05 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 2/6] drm/i915/pxp: add device link between i915 and
 mei_pxp
Thread-Topic: [PATCH v6 2/6] drm/i915/pxp: add device link between i915 and
 mei_pxp
Thread-Index: AQHZL7UweZDiTsjOPEy7dh+WGwiUBa6trJWAgADaFQA=
Date: Wed, 25 Jan 2023 04:11:05 +0000
Message-ID: <a7e9475f78ac4e1ac303ce564dff112c34f20579.camel@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
 <20230124053150.3543928-3-alan.previn.teres.alexis@intel.com>
 <Y8/056lQW0dJpnYV@intel.com>
In-Reply-To: <Y8/056lQW0dJpnYV@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB5139:EE_
x-ms-office365-filtering-correlation-id: 40762ea8-33bb-4a05-3c76-08dafe8a2dfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7d4Tyil/1A71f1TzmVwuK2yHMFKWuoOSMFElG8p4KQcy3ZyLg+PjRUY62FPED2wMw0DLLHRNapjNwq/uK1G8OOCylevacbnOA1QUNxRX7VsWIIkBm6NotAGNoJqq7KwqWE++1NLEu7dlTbqBdSWoS19JCKSS0GQbz5KJmGOjppOk+ydJKdf/lHzh6cLVFYm1369YohH25l7a4Aa20U779F7jVjz370zwVfO0ucrn6Sw6Ody91uKJGDaBpnO7tTU6BvT5LfULsvFqdE0eBvZMKKvHKznePU/nNrzUEp3QIJzcnTnOszRxaLkAUBthBd+MvgszVHpslF78uwiNXH/ie8kbgys0LcJbyNuGj1g1OTRh3skrzw6mxN26bO+xKK6+72LVeJAt9TPiLu7vcMi+y4ZXvCl4/Qrt0/7lER2TzF2FO5IsnBsgc/B4Td98HrK9YFpC4ADn0KaSwXG0DIKPAjIC4j7Gq46PjHWGkjhYPfy98UxsJECizobOfi4loNvjtr9E0aC51QeLLzUE6v8pM2lPLaU+0CxXyyCk51E7SZ9tA5NwM/iFosaIbTcq5+2rzT71z2psZ/FbVLWAxSV9GahVs/bGd4uuhO26ag8mxEbFmo7oxNkhSd20rWi0Q9/SiVdHub1TfshRWQ/g3BKbAYeyCj1BUWCwNgN4biJD0m6mIKcyHjuGH7SbrZ3RN4hu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(66556008)(41300700001)(66476007)(6506007)(5660300002)(2906002)(6636002)(66946007)(8936002)(38070700005)(8676002)(38100700002)(4326008)(122000001)(82960400001)(83380400001)(64756008)(6862004)(2616005)(66446008)(91956017)(86362001)(6512007)(54906003)(107886003)(37006003)(71200400001)(76116006)(316002)(26005)(36756003)(6486002)(186003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnZFVXJ2alJQT21LS08valpHdzhnMDZBM2p6bEtXRFpxVzZndDMwWGwrZ0pn?=
 =?utf-8?B?OEd0ejdtZndPb21BNWtxQjVhTFJPZGtvZWc1Z2V6U2lSb3h0NXdGMHQrdDBn?=
 =?utf-8?B?QmFhL0hzWlhrWkc4Y3lzRWN3R3JkaTZxdWlLMGhlTENtMHc4N2hpUGJZLy9r?=
 =?utf-8?B?QjljTnorOWhnU25JZTJXYmxGd1dCd3ZZak12R0F0Z0NLSFI3YzNPR09ZRm04?=
 =?utf-8?B?bEFKSUFrMnJGTExkamMxTGFyd05qbm1FLzlxV1NRYzB3VlArY1pPbWR2Szdk?=
 =?utf-8?B?ZWtwNU0wNkpnK1IxVWJ6UHdueFhmS04zc3FUU0lITWJNK1ViTWxVOUhoRDZt?=
 =?utf-8?B?L1BXNmZOTmtLbWswTXZrME9rYXh5NVFhQzV4bzdhZG5XR011eXNZYXFZcmdH?=
 =?utf-8?B?V1p1SlM0SVk0YVA3MzQvNWFvM0dLY0R6TlV2UE13aUlNa3loZVg5cHJMckwy?=
 =?utf-8?B?ZG83d0ZLV3ZiUkF1RGYwSUZZWHh0bk0wSG1CVjJjZnJxMnRXTEg2RzdBVkJV?=
 =?utf-8?B?am5BNEpNQ2VnYk5WUWkxamphMHVrUWJUSlpXNTFQMmtkcVpHZWxwUVJaYi9O?=
 =?utf-8?B?NndGREIvaW5Fb2RqZWVrK0dZTU1XMWJQMEkza0xCSnd0cnNWMWdRYWdDU2Jm?=
 =?utf-8?B?enk5cnJDMEhEd0prRmtVV29IL0RlM25wWHhrdVgzSVJJdnRSNFlHOVk5WFlm?=
 =?utf-8?B?NjBKc1YxUWxjQktwaG9FV1lXTjRzY3FhM0I0a3NjMTlwWU1zTXViOTRteVQ5?=
 =?utf-8?B?RzhkQUxON25UbnptT1pwNHB2WVdtQlFKSU1TN1BpSzU2TDhwYlRkaFA0WXBy?=
 =?utf-8?B?aDdVbThHbDRQRkdoKzlJY015dGEva1pyWHpUclk3QkV4WW93aEsvVHhiSlVL?=
 =?utf-8?B?anBUS0RTRjM4a09zdE9RODJWUEdMN1I2MXZsSWdXYW1uR0NqUzJ4Ym1OZnlr?=
 =?utf-8?B?ZVNFSmp2b3VCTFpsSllUODErN2RtQm5STEVHQ2JGbHZWL2tjQmxLUkdKRDlS?=
 =?utf-8?B?MGZLTkZKVkZlSTdBU29kcUJsbVU1MTVrQlQ2QUF0WlpwYjdFcGJGRG1oSysz?=
 =?utf-8?B?SHpyMGwvMVFXWEpzMjlXTy8vQ2hlZElQbjk3YVRsdHF2eHAwUDJDVGRSVDNy?=
 =?utf-8?B?NU50c0hGUUpYM1g4SFNJMThKOXhNN1V6U2tWbTh3ZlV1Vi9IKzZJV2E0cVQw?=
 =?utf-8?B?cWlqQXNWNTIyQkcwVDNaTnhmdWpselhMTkozT01rMkVvM3lFZGJFcHIrVWpv?=
 =?utf-8?B?ajl1bkU2TC9qZ2tKUFkwMFBSUGZKaFVud2dMZXNSamMvTTYwU0xYanJieUxX?=
 =?utf-8?B?SThjbW95V1NuTmpXUmM1blBCd1F6UWpEMVJEa1FqZzRLRWdycFVRNzlMUEE0?=
 =?utf-8?B?dDZKdnBaOVJQVVkrRFh3dHhZL1Rwb0kwY0dCOXdIYm9FbURqaXdEWUk4Z2lL?=
 =?utf-8?B?U2hLdG5ES1RycVR4czBPMWhTcGR1WkhoV2N4U1RRVWlpa0tjSFBFaTZBaWxS?=
 =?utf-8?B?aXlXelhBblA3eWozbnZScVZxYUs1UE1FQ2FBN3h6RE55eCtuSmczNmVvc3JI?=
 =?utf-8?B?NkNoeklvSFd6VXNkYXNteDZqdEcxSjgwMEQ1NjlxeUNST29ZOFpjdm1GMitt?=
 =?utf-8?B?b3dFYnpETUJHNHdpYzErZFpNb1B0Y0wzTWpyNFcvdkcydEFBOWNsY25qVWky?=
 =?utf-8?B?eEtIaThsNkYrK1hPa1U2ZFRSanRKU1dCb0l3UXhHbWlEcmFWME1waG85aFRK?=
 =?utf-8?B?YTJ0NHRrRkU3ODljcjFFSG8rM0N3TjdkMzNjbHlzSmJyNXF6NStEVlNBbXo5?=
 =?utf-8?B?aFNXUWthc0xhYUdLSitHbGJHMTBoQTJrRFR5UGVCUnJvcy80dmRjUzA4L1lX?=
 =?utf-8?B?bDZtaDVESkFGanhCS1k3dVh6V1FycVFXcDQyRHBBTmp3OEh3aUtJSzBaYXd2?=
 =?utf-8?B?RGVNVXBoTTJSYlJYR3M4OFZib1NCSjY1bGZ3cUpLbDlSdkg0c21sOFhPUHNy?=
 =?utf-8?B?cFE5SUpuTFV2RlZaMklVYUI2MENud090UDdTMG1hQmVjbVZZVFc1ODlDYUZ1?=
 =?utf-8?B?bm9lUHBaajdTeDBxbm5rd2NvaWJaTGtqajkzK2h3QWZnb1pwSjllVnR0eWRC?=
 =?utf-8?B?SW50WnkrWnRzbkRUZjJQVkp6MWQ4aWhsWEl5aVdTRXVsVlZib29Ka3NzZ1NI?=
 =?utf-8?Q?XVSxDj5158JYSxefZiDwJcw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04699E0F25FFEB4792ECC607652015DF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40762ea8-33bb-4a05-3c76-08dafe8a2dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 04:11:05.6325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0AF1wnHHUAo50NbaS6v2x2zfADD047NfSvYez0E4iSfE6DvvGQn1t1CK5mprVfqwKG1w5rCktpZsswxGd7+F1GQ6LxAUSKZ4CTBtQ0WiA9xL455+2flSgucTLYkPEZa7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Vivi@intel.com" <Vivi@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIFJvZHJpZ28gLSB3aWxsIGRvLg0KDQpPbiBUdWUsIDIwMjMtMDEtMjQgYXQgMTA6MTAg
LTA1MDAsIFZpdmksIFJvZHJpZ28gd3JvdGU6DQo+IE9uIE1vbiwgSmFuIDIzLCAyMDIzIGF0IDA5
OjMxOjQ2UE0gLTA4MDAsIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+IEZyb206IEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gDQo+ID4gQWRkIGRldmlj
ZSBsaW5rIHdpdGggaTkxNSBhcyBjb25zdW1lciBhbmQgbWVpX3B4cCBhcyBzdXBwbGllcg0KPiA+
IHRvIGVuc3VyZSBwcm9wZXIgb3JkZXJpbmcgb2YgcG93ZXIgZmxvd3MuDQo+ID4gDQo+ID4gVjI6
IGNvbmRpdGlvbiBvbiBhYnNlbmNlIG9mIGhlY2lfcHhwIHRvIGZpbHRlciBvdXQgREcNCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5A
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF90ZWUuY8KgwqAgfCAxMSArKysrKysrKysrKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvcHhwL2ludGVsX3B4cF90eXBlcy5oIHzCoCA2ICsrKysrKw0KPiA+IMKgMiBmaWxlcyBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfdGVlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAv
aW50ZWxfcHhwX3RlZS5jDQo+ID4gaW5kZXggNzNhYTgwMTVmODI4Li5jZDViODYyMTY1MDYgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90ZWUuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfdGVlLmMNCj4gPiBA
QCAtMTI3LDYgKzEyNywxMiBAQCBzdGF0aWMgaW50IGk5MTVfcHhwX3RlZV9jb21wb25lbnRfYmlu
ZChzdHJ1Y3QgZGV2aWNlICppOTE1X2tkZXYsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3dh
a2VyZWZfdCB3YWtlcmVmOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0ID0gMDsNCj4gPiDC
oA0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghSEFTX0hFQ0lfUFhQKGk5MTUpKSB7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB4cC0+Y29tcG9uZW50X2Rldl9saW5rID0gZGV2
aWNlX2xpbmtfYWRkKGk5MTVfa2RldiwgdGVlX2tkZXYsIERMX0ZMQUdfU1RBVEVMRVNTKTsNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGRybV9XQVJOX09OKCZpOTE1LT5k
cm0sICFweHAtPmNvbXBvbmVudF9kZXZfbGluaykpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT0RFVjsNCj4gPiArwqDCoMKgwqDC
oMKgwqB9DQo+ID4gKw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZweHAtPnRlZV9t
dXRleCk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHB4cC0+cHhwX2NvbXBvbmVudCA9IGRhdGE7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoHB4cC0+cHhwX2NvbXBvbmVudC0+dGVlX2RldiA9IHRlZV9rZGV2
Ow0KPiA+IEBAIC0xNjksNiArMTc1LDExIEBAIHN0YXRpYyB2b2lkIGk5MTVfcHhwX3RlZV9jb21w
b25lbnRfdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmk5MTVfa2RldiwNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgbXV0ZXhfbG9jaygmcHhwLT50ZWVfbXV0ZXgpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBweHAt
PnB4cF9jb21wb25lbnQgPSBOVUxMOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF91bmxvY2so
JnB4cC0+dGVlX211dGV4KTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHB4cC0+Y29t
cG9uZW50X2Rldl9saW5rKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRl
dmljZV9saW5rX3JlbW92ZShpOTE1X2tkZXYsIHRlZV9rZGV2KTsNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcHhwLT5jb21wb25lbnRfZGV2X2xpbmsgPSBOVUxMOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoH0NCj4gDQo+IHVzZSB0aGUgJ2RlbCcgdmVyc2lvbiBpbnN0ZWFkIG9mIHRo
ZSAncmVtb3ZlJyBvbmUuDQo+IA0KPiBpZiAocHhwLT5kZXZfbGluaykNCj4gwqDCoMKgwqDCoMKg
wqDCoGRldmljZV9saW5rX2RlbChweHAtPmRldl9saW5rKTsNCj4gDQo+ID4gwqB9DQo+ID4gwqAN
Cj4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29tcG9uZW50X29wcyBpOTE1X3B4cF90ZWVfY29t
cG9uZW50X29wcyA9IHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhw
L2ludGVsX3B4cF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90
eXBlcy5oDQo+ID4gaW5kZXggN2RjNWYwOGQxNTgzLi5lZmQyZjM5MTVhYmUgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90eXBlcy5oDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90eXBlcy5oDQo+ID4gQEAgLTMy
LDYgKzMyLDEyIEBAIHN0cnVjdCBpbnRlbF9weHAgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiB3
aGljaCBhcmUgcHJvdGVjdGVkIGJ5ICZ0ZWVfbXV0ZXguDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAq
Lw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaTkxNV9weHBfY29tcG9uZW50ICpweHBfY29t
cG9uZW50Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAvKioNCj4gPiArwqDCoMKgwqDCoMKg
wqAgKiBAY29tcG9uZW50X2Rldl9saW5rOiBkZXZpY2UgbGluayBvZiB0aGUgcHhwLWNvbXBvbmVu
dCBlbmZvcmNpbmcgaTkxNSBhcyB0aGUNCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBjb25zdW1lci4g
VGhpcyBpcyBuZWVkZWQgZm9yIGxlZ2FjeSBwbGF0Zm9ybSAoVEdML0FETCkgZnVsbC1mZWF0dXJl
IHVzYWdlLg0KPiANCj4gTm8gbmVlZCB0byBhZGQgcGxhdGZvcm0gaW5mb3JtYXRpb24gaGVyZS4N
Cj4gDQo+IFdoYXQgYWJvdXQgc29tZXRoaW5nIHNob3J0ZXI6DQo+IA0KPiAvKiBAZGV2X2xpbms6
IEVuZm9yY2UgbW9kdWxlIHJlbGF0aW9uc2hpcCBmb3IgcG93ZXIgbWFuYWdlbWVudCBvcmRlcmlu
Zy4gKi8NCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgICovDQo+ID4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGRldmljZV9saW5rICpjb21wb25lbnRfZGV2X2xpbms7DQo+IA0KPiBXaGF0IGFib3V0DQo+
IMKgwqDCoMKgIHN0cnVjdCBkZXZpY2VfbGluayAqZGV2X2xpbms7DQo+IA0KPiAnY29tcG9uZW50
JyBpcyBhbHJlYWR5IHBhcnQgb2YgdGhlIHB4cCBzdHJ1Y3QuDQo+IA0KPiA+IMKgwqDCoMKgwqDC
oMKgwqAvKioNCj4gPiDCoMKgwqDCoMKgwqDCoMKgICogQHB4cF9jb21wb25lbnRfYWRkZWQ6IHRy
YWNrIGlmIHRoZSBweHAgY29tcG9uZW50IGhhcyBiZWVuIGFkZGVkLg0KPiA+IMKgwqDCoMKgwqDC
oMKgwqAgKiBTZXQgYW5kIGNsZWFyZWQgaW4gdGVlIGluaXQgYW5kIGZpbmkgZnVuY3Rpb25zIHJl
c3BlY3RpdmVseS4NCj4gPiAtLSANCj4gPiAyLjM5LjANCj4gPiANCg0K
