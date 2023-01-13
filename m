Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8D668818
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 01:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5D710E4D8;
	Fri, 13 Jan 2023 00:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964AA10E0F0;
 Fri, 13 Jan 2023 00:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673568405; x=1705104405;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jYxQsSKuz2X7i3kKEKm66n7Zb80vOBDJx2GAn9Lpgns=;
 b=WGA3RmXXk9plRR0yjoM5An/9xbe8+XE8Xlrmcv5F2dShRPs2kBWLnuIT
 U0ZrzQUt8VMjnN6scv0hLqSK/fZ6bYH5bdXIfaaMb9xk+1sq/QtE2y16+
 I6xVC95nSUVBHBLczuoAdPJbYtY+qhEn0IbOaby7FKqCFSigAMyw6VnJ6
 xa2WtW6Ae58+LRGpXGTpoRG1ab20tug9qt3FarqYYM95ARSuDSuZA74df
 dD9ZAehCm5LPRf1goJA0ncc0lpMSVAM5g2wEyKwfpZHYmyXq1p8Uq/FKT
 zZKj2czWAfLl/0a3q7q3RrtYtdjLIB92WcWeQMizBr4xY8PI8sHi+5u6c g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="303562384"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="303562384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 16:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="688556883"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="688556883"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 12 Jan 2023 16:06:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 16:06:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 16:06:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 16:06:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 16:06:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RETgWpRcEAFUaE9AX/UnSalfQC1oNhnNPTW3Zb+cA6KzQ+wwxQJwC9fNuwru3YQCB3PtSlw9umS15r8zDUL6XsLFC00Di2ssepQ+R8O9R2TcdXImNSz5wEbqY1lTFDnaAKgF+Ddj1o9wvLBheki+4BYZSvDtrJUKiO9ecriiPEKco6hEV2ZGHOb3mPyZjRU+JrUCNAF01UY0oZIf6k/eLZ7miGm1j7kNbTk2x4XnYe96D8VkwH3dd/X0Q5XZGVoEwUQcO2O+R5p9+/dESWIkcyH0J0AGvFGsswLL/ciHwrEvZSlkUup9DbEGKeX/vb02XjMqfsh+4sNVFyPquArt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYxQsSKuz2X7i3kKEKm66n7Zb80vOBDJx2GAn9Lpgns=;
 b=hJnBqlcTwsMnjI8yGZS7L529sI6x9egKgWyHovwSK3XJMK5/BjtNrfYNX59lk3K+Ewr0H2itu3hN/hXgUpf1siz/6IlLVfgg/1CnIi34bID728En8oCttbrURqqiteHufeDm2MjOFG4TIOO+F7GB7bBxIQSN4tQo7HRWhVqTyR1YoJcuE0tn6bkCkjn/t2jyJYflonMV1MkeInB1xOogvDcOeBRl7y8Ib5gN/kqRX8r3CziKbW8t4R9In3FLDdgbmmq3Sc8r6kQur6Nj4RkV8VXgFYCy4lxtlXCfrFDvf4UdFph6i5UTqim6a1o3qA7qathWcJQ8mrAvrkCNznFkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB5345.namprd11.prod.outlook.com (2603:10b6:610:b8::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12; Fri, 13 Jan 2023 00:06:41 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 00:06:41 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 6/6] drm/i915/pxp: Pxp hw init should be in
 resume_complete
Thread-Topic: [PATCH v4 6/6] drm/i915/pxp: Pxp hw init should be in
 resume_complete
Thread-Index: AQHZJh4IOz/DiX4SUkKG0a4qIz7QGq6bClGAgABvRIA=
Date: Fri, 13 Jan 2023 00:06:41 +0000
Message-ID: <7bde3f150df27a90ff50a92401a58541370a2cf4.camel@intel.com>
References: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
 <20230112003706.950931-7-alan.previn.teres.alexis@intel.com>
 <e4ff93f1-25ed-5476-e147-d70c93261615@intel.com>
In-Reply-To: <e4ff93f1-25ed-5476-e147-d70c93261615@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB5345:EE_
x-ms-office365-filtering-correlation-id: cc77477b-1eba-4785-e1e8-08daf4fa0c68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VMyXuUPjgn1A7Q76vpeUC3aKJKLJntsHnmoFao7t5HDUFcgpyCsNoBxOa18BwBHqvO2N5YKY2uNZJqzRYma6q4Kb4jqCMnf5VTd+XI6N9E210OKnJYVV5nKyGAFUhQGDYbP1OUJcabkbkdtyjoz7RSVPkhpHUzmUaqfyOwA81Pv/6EbOdgKUa6qxPMNixfmDnnNJ7YMOtqPVJ8pmFkYblZoXCOLoE0k8IbjbXl7gQaFsp9/a+7qZvadVW2mPM+LQbaqF4vBbw9XvW3n4/pf3LW/r8zcHrxdSS624Ka1G/kLFssVKqGFx/e8Tewvg9H8CqT65X07QnUiuNtvNyj1efmb1Gbpt2fWjFdbCm+Wux2qSR9V7ZUvci1LNWwcr6sALqmfmCfQhPat9M7gQLYxp+dmJSuGNS+t57Te+yECKe3TMfJlwUe0fD4x/IRDpX6a/7ugsRXSHJMk6zcO3hldW6ptxaPr7Z5saDXOoVISvjDn4lt/G9C91ZJjvcNX9t1jZvKOUcOLeHVTtSfXGaUegqDRM1A4Ag4kE9aq+g5Pq4eqrfZefb+BwKE2xsa8VBnlOms0zVoTkHfxfaWzrak8LBKY4RhQc49K/1AyUk8Dd7jeGxWDsEozhRy3hKzAB/u8hN/XtpWRKDGxGsPXBzAb9FjPbhiUVnob8IBamx/UmYMrFgRpNyucXKJUxGk+gP4Dln7YYiJ5M/+PnffclfyqZPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(38070700005)(26005)(41300700001)(66446008)(4326008)(66556008)(76116006)(5660300002)(91956017)(64756008)(8676002)(66476007)(66946007)(122000001)(2906002)(478600001)(8936002)(83380400001)(36756003)(6512007)(186003)(6506007)(53546011)(6486002)(110136005)(2616005)(316002)(86362001)(54906003)(82960400001)(38100700002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm5XbjRGRTgvR0MvbGxPcDUzQ2d4Wi81Q3ZpV3YrK0hGOCtrRFdSNnNJd3BO?=
 =?utf-8?B?alIzejdJbHF6aFllQy80S2w2WGdkSXBZRFFFWFkrWkNEeDlwcjg1WTBnallx?=
 =?utf-8?B?Y0cwK20xUVJHcTF0ZnhEUzVaR09NV3p3N1ZkbUJFT2QxZlBpb3d5dGptbmJo?=
 =?utf-8?B?QXN6L3FWMTQ5NDlaRWJUakY5b1NnY1ZZSjJTaEp0ZU9TYXV3RG9BRWtPdUN3?=
 =?utf-8?B?Zi9TVXM5YXI0RUxLajBpcHZudzdIa29mVGxYZlMxM1VzcVdCVlJ6N3lhNnY3?=
 =?utf-8?B?a1JPaVJTTkVwd1ZtbXdJb0cwazl3R1pid0tHekZnc1JoZUx6TU9ORHJWL2Jv?=
 =?utf-8?B?N2liUFJ3VkdKU2VnMjUwSEtXbGw1NUY5dDhYVklPR09lTTE3VHZVQU55NVdq?=
 =?utf-8?B?Y3hCWlFlS0grMlBGZFZQV1dWT2JQN1IxMFZRdnhGR1hQNXhLUWE4WUI2MWh2?=
 =?utf-8?B?YmhQbHpRVHVYdytmaG51TnNVWHpSWkhnRllKQ1JsYWRNaXUxNTZjT3FnV3U4?=
 =?utf-8?B?WFlMZzltOHVxN3hWZ0wrOWxkWndtbW5GTWc0QTJCTUE3YkhzMkNIM2ROazV0?=
 =?utf-8?B?U2txVmVTa044bmpmZXlWbDFlVFM1aWVKbXVUQXFMNU5wTzhobk96OGthVDM5?=
 =?utf-8?B?dTBGWFFYUEpEcnRKcnd0TFdQamFvbDFBTnh5RjIrQzBBWDRWWmg5Y3hYYy9n?=
 =?utf-8?B?L3JabU00TTVsR294a1hqei9yaGQvSUt5b25Zbm42b1ZYQ1l6Yy9mMWRUNXBs?=
 =?utf-8?B?NzBCLy9SVUdkMGk1TGFLdDlRcXkzUEQ2amwzSzNCcTVqVGhkR3Q5NWgxcWI2?=
 =?utf-8?B?aSt2NWtmcnRJU0RQS3hrVXJtZzdacDZQVHpPNks2TEVnZ04xeUlNVnR4NnlN?=
 =?utf-8?B?ZTV1Wm9XUE5lSTJoVTZnM1RWMjlhYlQxSGw0RGFjblhQaVZHRjE2QUUvZy9F?=
 =?utf-8?B?dHpLM2pYMVhkM2VsdnI0cWhPNm1RWFdrejVtc3RycjFGemQrT3Y3Z1J6Q1FE?=
 =?utf-8?B?Y3hpcGtjYjZzeGp5ZGVRVWFGZmgwTDZURklON1lHaWZscUo3ODF4Q0VESWdu?=
 =?utf-8?B?b2VyTU5LSzdhaFRGcW8rQWp3Y1huME0xck9xQVJmaUNkSkoraEY3UEVVanc5?=
 =?utf-8?B?VzhKUXBWaEgzRlpvNSsrKzJjNlFkRklZMDM5RWdCZ2Vmb24wbGhDZzdBU3lV?=
 =?utf-8?B?VHVBR3Y3anZCTHlFdzVVUWc4MUFLUC9CYnIyMmkxNllHNDM1eTRVYmlwdll4?=
 =?utf-8?B?MzMwRFVuY0c1OFNKdnAwQkJkVkdwMWJ6Z3FNRW5mYXdqejhGODJZYU1FK3Nn?=
 =?utf-8?B?eWNORXBSL0xXT1pSL0ZQcjBIWW1BOTN5QVV4UERlMVVDWEQ4TFhUamFGdHMw?=
 =?utf-8?B?L3JweVZGN1RzYzRYaE5UdFpWOUxwcHFlNzlPNWpIVDVSRS83VmVYNWdnSzJS?=
 =?utf-8?B?SDZmcWN3RkxsbVhUZHZkM2l6S0ZORXh3SlFPR0JJNWE5OUp2eWgyODlsU0RG?=
 =?utf-8?B?eVBpWkRndWhmdEc0a2IzSVdDdCtVMXNRSjFXbEZnTE8vd0Q2cHJrdkV1ZThO?=
 =?utf-8?B?UEdZY0RYdmZjWkk2Ny9QVDVBOTFhN2hqNERCRzZlWUtDdld2RkRTejZzYnlE?=
 =?utf-8?B?aFl2NkZFeU0wTCtQa1lIRnFNU2tnYVZlQ3lZM2p4bC9Yby9qL20xVEM0dDUw?=
 =?utf-8?B?K0VKYkpWWkxHL1V5SFhCVVphR1FkRXpFU2RDaDdmdkVZczRiQlg4Z3J3SnVS?=
 =?utf-8?B?UW5TS092OUFyMEkwaC9Sc3B3a0xYakhmWTNsclVzWnZJRlBoKzdyWXlTODFy?=
 =?utf-8?B?akwwblhnWFJsN3J5U2RZMHRKSzZkZXVHQWhWK2FweHd3bWh1QWYxVVNYNmxa?=
 =?utf-8?B?eVFXdDJjS1h0Q1hPSnZYV0RiUDBYSnlHUE1rZzRobVR4dDlxVXE1TkJLRW92?=
 =?utf-8?B?NUUxb013WHB4dlB4UnExcHlJbG9TeGhyaUd0bnV6OHp0NUZXcWUvcThZZHRN?=
 =?utf-8?B?cG5yRUpEVXp6Wk4vc2F3RmlsVGFRbTlKMHB2U1B5NWJKMmdZYnJ5dFZ5U0lw?=
 =?utf-8?B?MHhOK1FPMk1acTJrcSsxQzZwSmJGd2pucURNWE1uNDh0NzRZaDlOeE9yOTZu?=
 =?utf-8?B?TEtvOGdKRzNvNlFOZkM3MXVrVzdDbXhUQWZlRGMyU05aWTRiSzBMbm5QUEpN?=
 =?utf-8?Q?fKPlZOAxwGyCKKn8XpogfBLXy6a18xYba2zQIAZbS+B5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEF5F154F8F1B94BBBD1FE7A62ADA929@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc77477b-1eba-4785-e1e8-08daf4fa0c68
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 00:06:41.3391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvBP2a+PbkK24mr0eCjWqx+1C1Qj5XC7j+pg6FjbXRpbWjVvol7UwnSk3QOFFA7Q4GQqKAnYQFY2UpegJD+Dt55fHZpgc+K/5fc6T/X0WnWoIG4RSvJp/UAbNqMTCrWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5345
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZXZpZXdpbmcuIFdpbGwgZml4IGFsbCBhbmQgcmUtcmV2Lg0KDQpPbiBUaHUs
IDIwMjMtMDEtMTIgYXQgMDk6MjggLTA4MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3Rl
Og0KPiANCj4gT24gMS8xMS8yMDIzIDQ6MzcgUE0sIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+IER1
cmluZyBzdXNwZW5kIGZsb3csIGk5MTUgY3VycmVudGx5IGFjaG9ycycgb24gdGhlDQo+ID4gcG1f
c3VzcGVuZF9wcmVwYXJlDQo+ID4gY2FsbGJhY2sgYXMgdGhlIGxvY2F0aW9uIHdoZXJlIHdlIHF1
aWVzY2UgdGhlIGVudGlyZSBHUFUgYW5kDQo+ID4gcGVyZm9ybQ0KPiA+IGFsbCBuZWNlc3Nhcnkg
Y2xlYW51cCBpbiBvcmRlciB0byBnbyBpbnRvIHN1c3BlbmQuIFBYUCBpcyBhbHNvDQo+ID4gY2Fs
bGVkDQo+ID4gZHVyaW5nIHRoaXMgdGltZSB0byBwZXJmb3JtIHRoZSBhcmJpdHJhdGlvbiBzZXNz
aW9uIHRlYXJkb3duICh3aXRoDQo+ID4gdGhlIGFzc3VyYW5jZSBubyBhZGRpdGlvbmFsIEdFTSBJ
T0NUTHMgd2lsbCBjb21lIGFmdGVyIHRoYXQgY291bGQNCj4gPiByZXN0YXJ0IHRoZSBzZXNzaW9u
KS4NCj4gPiANCj4gPiBIb3dldmVyLCBpZiBvdGhlciBkZXZpY2VzIG9yIGRyaXZlcnMgZmFpbCB0
aGVpciBzdXNwZW5kX3ByZXBhcmUsDQo+ID4gdGhlDQo+ID4gc3lzdGVtIHdpbGwgbm90IGdvIGlu
dG8gc3VzcGVuZCBhbmQgaTkxNSB3aWxsIGJlIGV4cGVjdGVkIHRvIHJlc3VtZQ0KPiA+IG9wZXJh
dGlvbi4gSW4gdGhpcyBjYXNlLCB3ZSBuZWVkIHRvIHJlLWluaXRpYWxpemUgdGhlIFBYUCBoYXJk
d2FyZQ0KPiA+IGFuZCB0aGlzIHJlYWxseSBzaG91bGQgYmUgZG9uZSB3aXRoaW4gdGhlIHBtX3Jl
c3VtZV9jb21wbGV0ZQ0KPiA+IGNhbGxiYWNrDQo+ID4gd2hpY2ggaXMgdGhlIGNvcnJlY3Qgb3Bw
b3NpbmcgZnVuY3Rpb24gaW4gdGhlIHJlc3VtZSBzZXF1ZW5jZSB0bw0KPiA+IG1hdGNoIHBtX3N1
c3BlbmRfcHJlcGFyZSBvZiB0aGUgc3VzcGVuZCBzZXF1ZW5jZS4NCj4gPiANCkFsYW46W3NuaXBd
DQo+ID4gwqAgDQo+ID4gK3N0YXRpYyB2b2lkIGk5MTVfcG1fY29tcGxldGUoc3RydWN0IGRldmlj
ZSAqa2RldikNCj4gDQo+IG5pdDogdGhpcyBmdW5jdGlvbiBzaG91bGQgcHJvYmFibHkgYmUgbW92
ZWQgdG8gYWZ0ZXIgcG1fcmVzdW1lIHRvDQo+IGtlZXAgDQo+IHRoZSBvcmRlciBvZiB0aGUgUE0g
ZnVuY3Rpb25zIChjdXJyZW50bHkgdGhleSdyZSBpbiB0aGUgb3JkZXIgdGhleSdyZQ0KPiBjYWxs
ZWQgaW4gYSBmdWxsIHN1c3BlbmQgZmxvdykNCj4gDQpBbGFuOiBXaWxsIGRvLg0KDQo+ID4gK3sN
Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGtkZXZf
dG9faTkxNShrZGV2KTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFpOTE1KQ0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKGtkZXYsICJEUk0gbm90IGlu
aXRpYWxpemVkLCBhYm9ydGluZw0KPiA+IHN1c3BlbmQuXG4iKTsNCj4gDQo+IFRoaXMgaXMgYSBy
ZXN1bWUgY2FsbCwgc28geW91J3JlIG5vdCBhYm9ydGluZyBzdXNwZW5kLiBUaGUgb3RoZXIgMiAN
Cj4gcmVzdW1lIGNhbGxzIGRvbid0IGNoZWNrIGZvciBpOTE1LCBhbnkgcmVhc29uIHlvdSBoYXZl
IHRvIGRvIHNvIGhlcmU/DQo+IEFsc28sIGFueSByZWFzb24gbm90IHRvIGNoZWNrIGZvciBEUk1f
U1dJVENIX1BPV0VSX09GRiA/DQo+IA0KQWxhbjogV2lsbCBjb3JyZWN0IGJvdGggYWJvdmU6IHJl
bW92ZSB0aGUgY2hlY2sgYW5kIGFkZCB0aGUgUE9XRVJfT0ZGKQ0KYXMgY2hlY2suDQo+IERhbmll
bGUNCj4gDQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGk5MTVfZHJtX2NvbXBsZXRlKCZpOTE1
LT5kcm0pOw0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgIHN0YXRpYyBpbnQgaTkxNV9wbV9wcmVwYXJl
KHN0cnVjdCBkZXZpY2UgKmtkZXYpDQo+ID4gwqAgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGtkZXZfdG9faTkxNShrZGV2KTsNCj4gPiBAQCAt
MTc3OSw2ICsxNzk0LDcgQEAgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgaTkxNV9wbV9vcHMgPSB7
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIFBNU0dfUkVTVU1FXQ0KPiA+IMKgwqDCoMKgwqDCoMKg
wqAgKi8NCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnByZXBhcmUgPSBpOTE1X3BtX3ByZXBhcmUsDQo+
ID4gK8KgwqDCoMKgwqDCoMKgLmNvbXBsZXRlID0gaTkxNV9wbV9jb21wbGV0ZSwNCj4gDQo+IFNh
bWUgYXMgYWJvdmUsIEknZCBtb3ZlIHRoaXMgdG8gYWZ0ZXIgLnJlc3VtZSB0byBrZWVwIHRoZSBj
YWxsIG9yZGVyLg0KPiANCkFsYW46IFdpbGwgZG8uDQo+IERhbmllbGUNCj4gDQoNCg==
