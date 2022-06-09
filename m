Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F59E5446FF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317FF1122B6;
	Thu,  9 Jun 2022 09:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABCF10FE69;
 Thu,  9 Jun 2022 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654766041; x=1686302041;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IA+lfZS9esitZ+nR6nhBeVz1xLjOgqyn5gAF168/Uao=;
 b=Pa7l04lvbppm5dio1vxA0ukMwP7+YpVUm61IXc5ZIyZ84o6Zij4JFe2h
 kekdH9nBFH+3/2fF5xn/RJAT641VXODvKoB+Fwaph0dQd4Llj9kyIt0d1
 47pQNWUHbW/zA01w/ey7X4IbJADPh+OntFoEtAIy3CF7duTgTN12jkog/
 KVGhwgjTJ1g0HYTecN+ee4C4O0FN0G+dup/UwYgyd2j1PSQPjYzKCE3ZS
 Qz+HLLEab33EGJuE7CH1Fk0TdkO0lygIywc+IYxRKaJrksRvgaWt/gXAE
 KQ5nedIoF6pX41CeNvJ7KdvNN5SF/2uUXGM6vLfBb9xpgM9CvJxLpgTod A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="278364803"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="278364803"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 02:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="710341418"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga004.jf.intel.com with ESMTP; 09 Jun 2022 02:14:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 02:14:00 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 02:14:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 9 Jun 2022 02:14:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 9 Jun 2022 02:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9XbaZzEQZ61SKUAJrdTuJU60RyvSYSUOEPn+hLnGgnCO5dnyuQQu6VSjj6mWNdGGHNARlJuvmlL+ixaW3iIeO0Ss9/QXlhHOVnU2muFN3QkSqgZuKleE3AI180ELd1smPn/EFEErjDvObaQF1zaH9iD5azEq7cU4vW3U4H0DydGjfPvKLERwd4NH8GnbrsysioAauhicMhP3NsCRqB9Kn6zO3YXacKX2UFUMk+Ca//mzC6mPpyC9R9p5fBBgo3+RoL52j4L6t4e/CiwMf2UKQO7357BXUxrVYgJcgyeToG+Pgp0KSKqU8VaUPk15OALPCW50/kiQIsPhkBjUSdddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IA+lfZS9esitZ+nR6nhBeVz1xLjOgqyn5gAF168/Uao=;
 b=BLozCisnmvt++7Xy6uEp+nBYPsyyaRz/mxv6YGWh4uU8U7FBlXxCPVxmcZ+NbRX54GWwz5ZbB/rOPwqhZjfURG92sboL00/F7zGwHVwv3ZSvAXeRdsRe7Yc6AA1VDyRW5XQqWZ1gHHDz9zBXzEnLYpB8wcgGjhgimHPNEhlZyetMwv85wN+8m7urSdagE68NkM9PsrHMOz2Dosq93NOc4rQMIiMAF4xKkP8jI98/wOsUirM5G5r59hVdAYN0UghBZbGa2lLsSZrmNLEq3oI+8PaFrT/UlrhyPtqss2iaF2OCMd14YZ10U/OweLEioH0ipOpfXOdIU/4lpA2ZtfpFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 BL0PR11MB3443.namprd11.prod.outlook.com (2603:10b6:208:6c::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.15; Thu, 9 Jun 2022 09:13:56 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::7028:2edf:6406:ea04]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::7028:2edf:6406:ea04%4]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 09:13:56 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] i915 w/5.19: wild flickering glitching technicolor
 pyrotechnics on resumption from suspend
Thread-Topic: [Intel-gfx] i915 w/5.19: wild flickering glitching technicolor
 pyrotechnics on resumption from suspend
Thread-Index: AQHYe388DGCe/SQJfUOPCRl/k/g19K1GyzpQ
Date: Thu, 9 Jun 2022 09:13:56 +0000
Message-ID: <DM8PR11MB5655E231601FD2195816F017E0A79@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <CAHmME9oyjj2cHjyqUrDQHQ1+YBafhBvj0utpU4kox6YK0gcT6w@mail.gmail.com>
In-Reply-To: <CAHmME9oyjj2cHjyqUrDQHQ1+YBafhBvj0utpU4kox6YK0gcT6w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 658f2e75-e192-4fae-3f0e-08da49f8615d
x-ms-traffictypediagnostic: BL0PR11MB3443:EE_
x-microsoft-antispam-prvs: <BL0PR11MB34437A44F7A62EE47F3A0608E0A79@BL0PR11MB3443.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Q0jRr2Pt2oKt/xUa7dtvkcGFXk+RYbHbNsTjr5sislPC96p7PPD5zOZtLDyPw2GetO0js4tDlQ1OjpPb3iv1ZYE2RjiKOdduNjzNtq48Oa5I1RxeM+TyYgU3+vRqnzIQ15EjKmhaDQafZkH05aI+3MJi2RUUe548hFn4CP3SQOgOWdBkmaEsDIQMrN3TGx+p7/1zI7TuYEPjxgMWUvnAs2E6KRym+dFFkgIHvogF63yMxL1RS4xj+G1VHYiLQVI6IV2k+H799YnFP23V4YM+skUSLOP7qAt3gEBkcVSepvhAGsjiE3pizFdYZiqKraki+coVguZi/ftl1mEOMOY7OAbc3nLI4mx3dHGnfAhJ3Sq6fooom/TXWDIExIcynmvEXIjPTqGBc3Eu4s2kUljRISfLXtWHWwQ7dOexlSAjEkpQFWPKSRauHyEFaDeEjs/5ptK7Oz7i6UCu/OwPo8wiNIPY1xiF33BbbzeuvDh2dQlPf147HZTum2kVKXkUkvBKsef2vRZKYxU1ZaQbMgnYpwOXFQRTDL8Vcf1pdNfmhLJN9LrihRwR8S4JrfHHZEAAQgOPgel4ZTsv+1yyL2tQsbP08MrzyV01pCZ3bg1srYPeUPZ28UTpiKGhA21dmXdGacJrzzWo2HXwrzNNccGv7arQwrshUhIiaklRGqpjOMeZtULImTOwzROs/tu9+XvbF0pHSDvTXPFXbOQKILJOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(64756008)(76116006)(66556008)(26005)(38100700002)(86362001)(2906002)(38070700005)(82960400001)(66446008)(8936002)(508600001)(5660300002)(122000001)(52536014)(15650500001)(966005)(316002)(66574015)(66476007)(71200400001)(66946007)(186003)(55016003)(83380400001)(7696005)(33656002)(6506007)(9686003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGpCdDNrV05uZEYwTUtjTzNzQUIxV1kxdlFCQUdqdzRraEtPRVcvbUp0SkZr?=
 =?utf-8?B?N0FScVR3OHhxSzZjdEdBSkpIUXoxVHpmVUdrZ2RaM25zUzBmcS9LSXE4WFhq?=
 =?utf-8?B?SGY5MmRZYU1MUXJubmhLS2NjT25DM1FtVUZ4UERLeHF3ZDFMSU9XMVhUTmdD?=
 =?utf-8?B?bzR0VllzS3lZcFdMNXVxQmQ1NzFNR2QrV0U4RXpsdWhLckw2aG9zeVhzZDNq?=
 =?utf-8?B?enlTRHJCWVRZc2s1N0FGNkViUTVHM2FudmphRkd1WHo2bWxvSGc1ZmZuOXI5?=
 =?utf-8?B?OHBMaFpYeE5taEhNSlpMRGpUMzVSNDc2SUlPWkN1MlQwQTlEeWU4aVplR2Q0?=
 =?utf-8?B?MUJTWkJabjlMQjk5djhKUzJjZzVKUytNQmxpUWdYWTg2WDNhdGF1UVJBVFRk?=
 =?utf-8?B?S0txZnU2dUJCKzdyZWd2YzM0Q2hIRlcrRUZ6amt6RDhtaGZmYkxRVmx3dlUz?=
 =?utf-8?B?eGlTRWNjc2xKZVllK2J4RTVqNnA3Tk5GbTFrdHhKRWlORXRrbmJuL2kwejhI?=
 =?utf-8?B?V2wwVlU4MlR6bEdOK0xZbVo3dnkra0tNaFNXT2hmQW1qRTlUMVg2RDNpcXdE?=
 =?utf-8?B?K3g2eVpINTU1dThVUDBzQ1hraU9KZ2Q0VzlzRmVQMDRZSjdOZnBCM05hUjNi?=
 =?utf-8?B?OTIwVmxEMzhQTzJQZ1k1aTZ5YThsU0JGY1hnL2JQYlNQUlZHUjQ2SkRWL1F3?=
 =?utf-8?B?K240WEVqQlE2SllBbWk3WmFSVEQ5U2V4MmxlNnZhZUo4SmlJMVQrVGVVSzZM?=
 =?utf-8?B?RnNQdXpoeVk1cnpjaUQwUXRvZGtJVG1SUFpoNmxNQzFzbmlyUDhlMVlmMWFp?=
 =?utf-8?B?NW1xVnlLcXlsdzRlR3huNUJNZXhzaFNlRTdxRHppN1pCYUVHdGFkVG1ydjI1?=
 =?utf-8?B?R2VIaTYvY3ZQY2VrdC9jR2d3TUlNUG8yc3pSYmZkQVd4bWJZK3d4M2pZeis4?=
 =?utf-8?B?Wm5qRFZ4SmRUcWJYazRSQ0lRMGNUMUVrRkFyNHZTMEw0b2FMOGpSUmNxZ1p6?=
 =?utf-8?B?aUxuRmlSRXRBdTA1STlIRFkwMVZxSUdDNlNnYUFsZ2lyQXBoS01WSW5hS212?=
 =?utf-8?B?MXQxRnc4UjVYMndXS29IbktFdjFvRWFRdnRxVTRKaWM5d0V0QzJtdUtZN2Zk?=
 =?utf-8?B?aW1TamJPVUxBZGFzSUlFUDh2NUpDcmh6K1ErUlJwL1JzbllwY2syWGNSOW5K?=
 =?utf-8?B?bGE4MEQ4VDloQzBQTG5yT2xFWVZIclFEVG5Sam5XR3E5dkhtUlcyZ2sxb1Ry?=
 =?utf-8?B?VTNvbzFYc2F1bHF0djY5endzVGtqRWx6M00wRzl4WWppYnN3WGxTTmpCcjcy?=
 =?utf-8?B?UFFEZHhzaE9oZ2RjdzR5QXhodkY4R29YbHF5MEJIdmhJOTVzTVRDNXJEYnFr?=
 =?utf-8?B?RjZoL2lPd00rMnRnL1FwODNSUHY2NCtNNmw4Q0pmemh4dkpyb01Ud0k5WUFM?=
 =?utf-8?B?T3MwSE01M3FaMEsvUmhOZlpmZXNMZUdxeHVBcVJhekxHM0kxSkdqRGt2dTFl?=
 =?utf-8?B?ZVFpYVhxeFdrV2lxM3dyL0Rady9NY1dlTGtLK2QzZ1pSR0dUZkY3Z3pEWlZn?=
 =?utf-8?B?MGUvazlWaGcwTC9zRWVEY0R2OVoveE5oUDJmQ3MzV3RiOFFSR0EwVmZLd1lY?=
 =?utf-8?B?VlFEcllCSkRwM1dVRzloa2UyYVorSnAxWFkwb25Lc3ZpNmczQUtuUGFuamox?=
 =?utf-8?B?OTJMbmxqY2IwNzBaK2oyMklmRDk2VFNtOWtFbEFKY3huQzMrOENPRjdDcGV1?=
 =?utf-8?B?ZFlEdTQ5Ykw3QzJ6bHowalhRTlUwY2FDelVCSTlBakxOYUZpb1ZGRURmNjNU?=
 =?utf-8?B?dUZaYXg0YStQdTRoSlg3cktPd0Y1KzkrVExSOVEzN0VwTEh6U2xPd2tFek1O?=
 =?utf-8?B?QlI4WE9LU0tDVktkQXNwR01xcGNtUXVsNDljc0MxMENMZDdKb0c2V3Z5aUth?=
 =?utf-8?B?UXdtaUtkQ1NJSW9uZUJGSXJnb2s3SFQ5TmVzdU1KUGdDTzEwSHhqNExmRkVK?=
 =?utf-8?B?cktvWm13eUhzOG4waDRoZ2FmMSt6d09xSDVDYXNod2d1U05nanRCeGZ5ZEtC?=
 =?utf-8?B?SlVucmpYUHpsK3VVTnhHVXBJVGNOVng1OTA5MnQ4c21HMXB1SklVcUtvcEcr?=
 =?utf-8?B?cWJWdnlMWThicWRvUEJmMDRVei8wSmZXb0FNZG9MdnR4NmI1MFRtYkZHcnVU?=
 =?utf-8?B?ak1RWFovZS9jakwzdEY5NTJkMitLSnhDWW9BaEE3QU1yMmtsVStwV3pkSnYw?=
 =?utf-8?B?U1NhRHBzOXR6TSsyclNRSzVVNnlWS1p5WWp2WWc0YWJ1dUc4dWZXRmtqTU5V?=
 =?utf-8?B?SVRqYS81TWZqMGRDd3laYVUvYm9DTHBOMDZEVUNGRndNU0NhWGtFdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658f2e75-e192-4fae-3f0e-08da49f8615d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 09:13:56.0252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MCHQ/egXczU2zOsoGSmpwjbdyHGvvTnDW9I5TLlHZ3hBewyHpP0xTNx4o5EM00WbGtQVGbnZSh6rkWESWJnuxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3443
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

SGksIA0KUGxlYXNlIGZpbGUgaXNzdWUgYXQ6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaW50ZWwvLS93aWtpcy9Ib3ctdG8tZmlsZS1pOTE1LWJ1Z3MgDQoNCkJyLA0KDQpKYW5p
IFNhYXJpbmVuDQpJbnRlbCBGaW5sYW5kIE95IC0gQklDIDAzNTc2MDYtNCAtIFdlc3RlbmRpbmth
dHUgNywgMDIxNjAgRXNwb28NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+
IE9uIEJlaGFsZiBPZiBKYXNvbiBBLg0KPiBEb25lbmZlbGQNCj4gU2VudDogdG9yc3RhaSA5LiBr
ZXPDpGt1dXRhIDIwMjIgMC4zMg0KPiBUbzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBbSW50ZWwtZ2Z4XSBpOTE1IHcvNS4xOTogd2lsZCBmbGlja2VyaW5nIGdsaXRjaGluZyB0ZWNo
bmljb2xvciBweXJvdGVjaG5pY3MNCj4gb24gcmVzdW1wdGlvbiBmcm9tIHN1c3BlbmQNCj4gDQo+
IEhpLA0KPiANCj4gVXNpbmcgdGhlIGk3LTExODUwSCdzIGlHUFUsIHdoZW4gSSB3YWtlIG15IFRo
aW5rcGFkIFgxIEV4dHJlbWUgR2VuIDQgZnJvbQ0KPiBzdXNwZW5kIG9uIDUuMTktcmMxLCB0aGUg
ZGlzcGxheSBzaG93cyB3aWxkIGZsaWNrZXJpbmcgd2l0aCBzdHJvYmluZyBjb2xvcnMgYW5kDQo+
IG1vcmUgYXJ0aWZhY3RzIHRoYW4gcmVhbCBwaXhlbHMgaW4gYW4gdXR0ZXIgZGlzYXN0ZXIgZXhw
bG9zaW9uIG9mIHBhbnRvbmUsIGFzDQo+IHRob3VnaCBib21icyB3ZXJlIGRyb3BwZWQgb24gdGhl
IGxlcHJlY2hhdW5zIGF0IHRoZSBiYXNlIG9mIHRoZSByYWluYm93Lg0KPiBUaGF0IHNvdW5kcyBy
aWRpY3Vsb3VzLCBidXQgdGhlIHN0cm9iaW5nIHBhdHRlcm4gcmVhbGx5IGlzIGEgc2lnaHQgdG8g
YmUgc2Vlbi4NCj4gDQo+IEkgY2FuIG9ubHkgc3RvcCBpdCBieSByZWJvb3RpbmcuDQo+IA0KPiBJ
IHRvb2sgYSB2aWRlbywgYnV0IEkgd29ycnkgYWJvdXQgaGF2aW5nIHByaXZhdGUgaW5mbyBpbiBt
eSB2aWRlbyBidWZmZXIsIHNvIGlmDQo+IHlvdSdkIGxpa2UgdG8gc2VlIGl0LCBlbWFpbCBtZSBw
cml2YXRlbHkuDQo+IA0KPiBUaGUgc3lzdGVtIGlzIG90aGVyd2lzZSBvcGVyYXRpb25hbCBhbmQg
ZmluZS4gTm90aGluZyBpbiBkbWVzZywgZXZlbiB3aXRoIGk5MTUNCj4gZGVidWdnaW5nIGVuYWJs
ZWQsIGFuZCBpZiBpdCB3ZXJlbid0IGZvciB0aGUgZGlzcGxheSBhcnRpZmFjdHMsIEkgYmVsaWV2
ZSB0aGUgYWN0dWFsDQo+IHJlbmRlcmluZyBpbiB2aWRlbyBtZW1vcnkgd291bGQgYmUgZmluZS4g
U28gdGhpcyBzb3J0IG9mIGxvb2tzIGxpa2UgYSBkaXNwbGF5DQo+IGRyaXZlciBvciBzb21lIHNv
cnQgb2YgcHNyIHByb2JsZW0uDQo+IA0KPiBMZXQgbWUga25vdyBpZiB0aGVyZSdzIGFueXRoaW5n
IGVsc2UgSSBjYW4gZG8gdG8gcHJvdmlkZSBtb3JlIGRlYnVnIGluZm8uIEl0J3MNCj4gcHJldHR5
IHRyaXZpYWwgdG8gcmVwcm9kdWNlOiBJIGp1c3QgcHV0IG15IGxhcHRvcCB0byBzbGVlcCBhbmQg
d2FrZSBpdCBiYWNrIHVwLg0KPiANCj4gSmFzb24NCg==
