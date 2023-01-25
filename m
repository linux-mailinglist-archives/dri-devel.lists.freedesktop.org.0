Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345D67A981
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 05:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E4010E29B;
	Wed, 25 Jan 2023 04:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502D610E060;
 Wed, 25 Jan 2023 04:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674619836; x=1706155836;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g1vvMdenW5cKa207p9Mzzs6LbCbJMfaunSsgv7ti+jM=;
 b=YaVvEUBjQwNao/cPsJq29GnDc1Oy5SQRt8aLRCsRqd/Y6krqfxuCN/3Y
 DcXJ7FPAbZwtrxcJCBA0t/EXwRyVJ7sBNaYDh6ClW+RmkASbyUUI9vqBi
 cm7ixhdACNC373Pcmao4kasMTXGkPjjYEpIGXOZX6eXOEnm4gQhuT7mud
 SKAtdlXcLCZ3HlHv7LIFhchhtsKjvLTha12xGC9RGMbrrgQ0AfTntdEqp
 1eHeosiUonV6pOgSGjXzfcx3u5solTKDmcfYFhBBKswHl/55ua+TfuBrB
 CBDVwZDTcnYDv3hu5LPnA0/AHDTojlNxemCb34aEMmSNYqNfS5WjATGwV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="390981563"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="390981563"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 20:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="804867474"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="804867474"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 20:10:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 20:10:34 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 20:10:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 20:10:33 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 20:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUTLZqs0CK6J9tZBsAKS+vEfyPzUd6oBaw64GwSnlYqiTzFB2w2rIuxN8AtkE7tTpEtQ7QhgrzohAfjfDqafyKfvbUmL3JHHutquL9iLpux6po0iuvyMhj0wPQag0ItO0hb3golQACfrPVufL23r3sC+iHP8RrN6ZmyE3OqzxKN8yM/Aahkl79unI4B872CS+WYUMM/hmXgKSQTn+awhgW9xBbM6LrDmhDoaMedk73Fe3G3XWzlG55noxFPzpoX9OMCLuqvxu8Cr3AGM8dHx1d1ef+qf4G8wqsS2RStwcRGZm67m7t8z9xJxaL+SeoVusiFsW3QJTTdrE+LXd6lRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1vvMdenW5cKa207p9Mzzs6LbCbJMfaunSsgv7ti+jM=;
 b=IkX9AkrEBf82HEHeYsIww+oTcCUCtqfW4IiBSEG9TOMPd4DetdLleWTxxSW2SpCrRuJhKdkNkeJeT5fMYm6+j2R5qgNMfyiKcr+Hb1L2cJM1HMX8QFX2z71mE2k/Uqqusi3dRFtj0AdOInDU8iYOoAgSMNMccr2qbpJI+IW4WzbK3H6dky8MRl2ilIkDbxYABeZNxeZzgvZnkkM11LHo2gxbuTQvK5hz5vuzoiNG4C5VW9jzN1kQN3ssZHXK+wHXbNPg1WO89JPJyWrYCqXsxEasNdRf7OnbwmEE+sGvtwLr5wlYEe5x3e/l5CNa0Urs8i4TEGBWqe5UN1GVhhQzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 04:10:26 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 04:10:26 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "justonli@chromium.org"
 <justonli@chromium.org>
Subject: Re: [Intel-gfx] [PATCH v6 5/6] drm/i915/pxp: Trigger the global
 teardown for before suspending
Thread-Topic: [Intel-gfx] [PATCH v6 5/6] drm/i915/pxp: Trigger the global
 teardown for before suspending
Thread-Index: AQHZL7UyuUldcAmpRUWyMvKwALP6ja6troeAgAAv4gCAAAmogIAAnmkA
Date: Wed, 25 Jan 2023 04:10:25 +0000
Message-ID: <44a28f63939fb0d617076fc03be2c5467fd1f534.camel@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
 <20230124053150.3543928-6-alan.previn.teres.alexis@intel.com>
 <Y8/2iTQ1t3siFHKx@intel.com>
 <8fcafb5a34aba0a0080cd19a3a6c01ed8af1d3b8.camel@chromium.org>
 <Y9AmzVXhLTvPv3gC@intel.com>
In-Reply-To: <Y9AmzVXhLTvPv3gC@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB5139:EE_
x-ms-office365-filtering-correlation-id: 6e3c04a2-2e1e-4729-eb81-08dafe8a164e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wdH8FjlUiU33BPIxwtAPjViZAkpA7Me8zKROnmmr+n154ONLX/j/a+nhzaB/BEDCXt8xchC0p0fik5Rulj/PluSjewFp388Ltr0AerVRjHBvOzvOD6S7nqd8UUu9PM96sOqGy+nvY1kEqvrcQgylEkdKL7LS6UVWlbZRbmin4Av0FIWK+i+SA3lx8zHkjbuGLab3aNLNNDWck4Z3CuDsC2QRno9noND8StxjmC0A6DmbHv5OmacNPtCNrJMLwnqKhiL6wqGIvwbyEpQ80eUD699v8tmxiE+sneGGbShhXjGf7c0sijZ23o2x3e5aBNkaEFD1+lw3Z8cXtm3bDMbdJAhlb7gKjybnXjrAR4L6GSGXkodK0GKwr8vl9gfwRG66zcVCT8OrjmAADBJTQ9B0L76JUzgXHkqMcp5T6PzFWl8FyGvYP9X96EtFiyRF8dRyzTCSi340JCPFFFWoUsAuzfPyUI39Cfw3vqysL6keP+gYUQxLS/9IC5I3l4XsVwnVxLe7UtHd43cv8GLzn4EnBhP0EIJCWxp+J3ZMH0QlsKLuoNyrICgQKdvbiYwIHQ98vEnt5elGLVkvbRKZjffKRet5/8UY/U8nswbwolmolbUlHM1qYh5SWOKscsBbWcoWcWadM2Vaivm3+zRv2EWyfL1sIBriACEJ9WEE5lEym4ZB51FocPsRzVpeNkKhWITdc4icghXDabXGAAf1Jkz0rw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(66556008)(41300700001)(66476007)(6506007)(5660300002)(15650500001)(2906002)(66946007)(8936002)(38070700005)(8676002)(38100700002)(4326008)(122000001)(82960400001)(83380400001)(64756008)(2616005)(66446008)(91956017)(86362001)(6512007)(54906003)(107886003)(71200400001)(76116006)(316002)(110136005)(26005)(36756003)(6486002)(186003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFM3bVVVMmZUcGNjRXhTSTAwbjBIaUwyWE5iT2NkK0E4WE9uMURZcThOYVkw?=
 =?utf-8?B?azN6UUxqQzh6RHpOTGI1OHBnblIyc2VnbVpCZjF6ajZ5Q21mc2hVMHpjUFlh?=
 =?utf-8?B?OWZqaXRvcERtQ1RZS1ZGck5DRHd2eVM3ZHVybVpjczM2L25tc1lKVkJuRG83?=
 =?utf-8?B?S282bzR2Z2FMWjNNK2JHb1gwTTc5amFYL2tGK0lGTEN2YlJ0Q05iUUJ2elg1?=
 =?utf-8?B?SHJiWWZGaEp3VHgvQWFQNFZOOW00WFhPTGs5VHBud0YxTkNzc0l3bVRyLzJC?=
 =?utf-8?B?Y3p0T052RmNFS0tXckp1eWJJdDNIcEhxRjRPandkN0Q5SlZMbHRoUjFQcVNV?=
 =?utf-8?B?MnRvcHNJOUx2WU9RaW9aR2FJaWRIVFZmVGlnQ2t4ZEt6RU1FdVJ6VElWSVhW?=
 =?utf-8?B?RGNISFl3UHBZRXVpa1c0MFNpdm1GeG43NHRBcmt4b1NtUlVnZEhhT2g5VU9i?=
 =?utf-8?B?N1BZR2xzQkc5RGRCeWppdnFSekZjTE9TWEp0czNXMngzcEhLejlGUXhzYVJN?=
 =?utf-8?B?VjNSTUhGUFdLcXpxTE1raVdTdWpzMHAwY0E3a2hGSS9VSmNlamNId1F2THA1?=
 =?utf-8?B?cEo3TjRGV25Ud01Hc0VDR0drOTVZSGJNeWd5c3NUUVdHTUw0ckhjZ0NwRCtn?=
 =?utf-8?B?Q09FaVduR0UwU3J4aEpxN0dTY3FNTkY4KzhzckpTQlFwTjV5T1FuNCtjdjZF?=
 =?utf-8?B?YU9ldmVoa3FtWUR0emlqcU5IMWFaLzFxMVM1RHFEbStLRFZkOU1JRWVMUjlI?=
 =?utf-8?B?YktEaEpCcWFxNHZHOGZSWk02OWM1dFB5S0hGZm9nMG9WVDVSZWtweTJubFZI?=
 =?utf-8?B?eUdoQXpuRG1OMDgweDRTU2dwR1JqMnlFU1lFbkNERjRIQ1F1NnFDVWJWdkR5?=
 =?utf-8?B?dlpuNi90U09nTjNYYklRUW04TjlmdTh5WC91bWIrMi9JNGpYSmFkY2EvT05r?=
 =?utf-8?B?cWE4bHRteEhmVEpOS01pSmxIMDFNMW5XT3NhVlk0amtKVGlUaW8yVWRxV01H?=
 =?utf-8?B?cmgrY1Znc09YOVQvck9iZWxlVFRUM0hDVzRPOTFWMWlpdEszNThMOE5IRHgr?=
 =?utf-8?B?cWRLZWtnMzBpQnJiSVhLTUcwem4wQm4zK1M4ZFNBbzdDZG9rT0t2ZXFPY2Ro?=
 =?utf-8?B?dmhKdUsxSFdOUDdPR2kyciswQ0dGVjE5UjVjVUpVeldjUEw0RS9RaU0zTkVQ?=
 =?utf-8?B?cjkxREQ5RWhkM2RCTkZWMENVZmxhaEw1VGQzRWQ1Q3pRVGozb1kxaG5yOFhU?=
 =?utf-8?B?cjcyWm1NcGNsWmFyUkZPa0JhZUlxeDI0a3BZM2ROaW5ockRTRGxjbG1lYlpE?=
 =?utf-8?B?NDVNc282YTBEQitkZjZVaEZXalJTNnZMQzMrUENEeDNudmRDRUQveHF2MzFQ?=
 =?utf-8?B?MWgrMVhxd0pSZk5CK3IyMnovUXBYT1dOZE1XRkhIVEZHcUZFQ1VsWHRVQW5p?=
 =?utf-8?B?MWtMN2laMzFHLysySXlMK3hSRzBEb1p6VWVZUXk4dytpREZ6VkN0d0M4dzh6?=
 =?utf-8?B?OTdtNks4aHNSTWNvdllVMFdTY2pDWVB0bE1lRlJJK254VE1UUTZVQmIvOHZH?=
 =?utf-8?B?akZnclVxYU94L09PbjRkV3BkMXBRSTRaTFJMUVRtWmFYM0NKcEI1cVJ6WnNZ?=
 =?utf-8?B?SjJBbkEyVGFQTWI4UEdnTEUrRndNZFRoZ0tuL3VaZVBCTlRBb04xQ1dZTnI2?=
 =?utf-8?B?WTBaa0MwaFIyMXdtL2pWR29HeER2VUFGZnI5R20yZW9OQ3piRlV0ZU9MdHRq?=
 =?utf-8?B?NlBrNklWcUhwdmdpVCtQeTBRamdBcXBnditDM0l1V0c0dWFya3VNT1hBS1lq?=
 =?utf-8?B?dmtpeTh2YWdpN05POW9FVDE2blU5UzdCZTd5SUM0cnFMY2NwWm5sUllGYVN4?=
 =?utf-8?B?M1B3UWVaYUpCdHVQYVBHRzEvSjN3ak03SjIwMFRmbWRzS2xUQmhNVkgrTE15?=
 =?utf-8?B?UXloT3ZWZ0hxWEljbkFwTUV1UHJZZjltS0RqY1dMRXR0Tld1cVI5KzRERmlw?=
 =?utf-8?B?NVN4cE1hUXBwOUtJRURQMU5KS0MrZlZ3RmlaQXUwOWpBTkUxdUo1eUVJY2xn?=
 =?utf-8?B?VmhidFV6Vm5LenlTanAwVjRGWWFLQzc2Z0Y0RlFxN3g1dEtNVUVlQ1F5c2Ji?=
 =?utf-8?B?V3FrV0RScFdUdlRpQ1JsQW95MEJlV2dXSFJUUXZJdkhTRWxZYk1lQzlIdEdH?=
 =?utf-8?Q?DxanGMHlYc0VFz25+VCpDcE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50B20FF52D7EB146BEC1DC62642095F7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3c04a2-2e1e-4729-eb81-08dafe8a164e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 04:10:25.9246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tU587cqdIYplAx/KpCnf3JxXmn++uduPsx8yaSC1RM0yzftVPgQeYK8lUiyvxkR9oUwSSnc9eVrrPotv/S3QUQjnK9hRgjzImu68IKS8LlVA3Nlyn7ngSL8Vya+eA6Je
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAxLTI0IGF0IDEzOjQzIC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAyNCwgMjAyMyBhdCAxMDowODo1MkFNIC0wODAwLCBKdXN0b24gTGkgd3Jv
dGU6DQo+ID4gT24gVHVlLCAyMDIzLTAxLTI0IGF0IDEwOjE3IC0wNTAwLCBSb2RyaWdvIFZpdmkg
d3JvdGU6DQo+ID4gPiBPbiBNb24sIEphbiAyMywgMjAyMyBhdCAwOTozMTo0OVBNIC0wODAwLCBB
bGFuIFByZXZpbiB3cm90ZToNCj4gPiA+ID4gQSBkcml2ZXIgYnVnIHdhcyByZWNlbnRseSBkaXNj
b3ZlcmVkIHdoZXJlIHRoZSBzZWN1cml0eSBmaXJtd2FyZQ0KPiA+ID4gPiB3YXMNCj4gPiA+ID4g
cmVjZWl2aW5nIGludGVybmFsIEhXIHNpZ25hbHMgaW5kaWNhdGluZyB0aGF0IHNlc3Npb24ga2V5
DQo+ID4gPiA+IGV4cGlyYXRpb25zDQo+ID4gPiA+IGhhZCBvY2N1cnJlZC4gQXJjaGl0ZWN0dXJh
bGx5LCB0aGUgZmlybXdhcmUgd2FzIGV4cGVjdGluZyBhDQo+ID4gPiA+IHJlc3BvbnNlDQo+ID4g
PiA+IGZyb20gdGhlIEd1QyB0byBhY2tub3dsZWRnZSB0aGUgZXZlbnQgd2l0aCB0aGUgZmlybXdh
cmUgc2lkZS4NCj4gPiA+ID4gSG93ZXZlciB0aGUgT1Mgd2FzIGluIGEgc3VzcGVuZGVkIHN0YXRl
IGFuZCBHdUMgaGFkIGJlZW4gcmVzZXQuDQo+ID4gPiA+IA0KPiA+ID4gPiBJbnRlcm5hbCBzcGVj
aWZpY2F0aW9ucyBhY3R1YWxseSByZXF1aXJlZCB0aGUgZHJpdmVyIHRvIGVuc3VyZQ0KPiA+ID4g
PiB0aGF0IGFsbCBhY3RpdmUgc2Vzc2lvbnMgYmUgcHJvcGVybHkgY2xlYW5lZCB1cCBpbiBzdWNo
IGNhc2VzIHdoZXJlDQo+ID4gPiA+IHRoZSBzeXN0ZW0gaXMgc3VzcGVuZGVkIGFuZCB0aGUgR3VD
IHBvdGVudGlhbGx5IHVuYWJsZSB0byByZXNwb25kLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhpcyBw
YXRjaCBhZGRzIHRoZSBnbG9iYWwgdGVhcmRvd24gY29kZSBpbiBpOTE1J3Mgc3VzcGVuZF9wcmVw
YXJlDQo+ID4gPiA+IGNvZGUgcGF0aC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiA+ID4g
PiBSZXZpZXdlZC1ieTogSnVzdG9uIExpIDxqdXN0b25saUBjaHJvbWl1bS5vcmc+DQo+ID4gPiAN
Cj4gPiA+IGl0IHNob3VsZCBwcm9iYWJseSBjb250YWluIHNvbWUgcmV2aXNpb24gaGlzdG9yeSBh
Ym92ZSBzbyB0aGUNCj4gPiA+IHJldmlld2VyIGNhbiBrbm93IHdoYXQgY2hhbmdlZCBmcm9tIHRo
ZSB0aW1lIGhlIHJldmlld2VkIGFuZCBub3cuDQo+ID4gPiANCj4gPiA+IGl0IGxvb2tzIHdlIGhh
dmUgYW5vdGhlciBmdW5jdGlvbiB0aGF0IEkgZG9uJ3QgcmVtZW1iZXIuLi4NCj4gPiA+IEp1c3Rv
biwgY291bGQgeW91IHBsZWFzZSBjb25maXJtIHlvdXIgcmV2aWV3IHN0YW5kcyBpbiB0aGlzIHZl
cnNpb24/DQo+ID4gPiBpZiBzbyBmZWVsIGZyZWUgdG8gYWRkIG15IGFjayB3aXRoIHRoYXQuDQo+
ID4gDQo+ID4gU3VyZSwgdjYgaXM6DQo+ID4gUmV2aWV3ZWQtYnk6IEp1c3RvbiBMaSA8anVzdG9u
bGlAY2hyb21pdW0ub3JnPg0KPiANCj4gDQo+IEFja2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJp
Z28udml2aUBpbnRlbC5jb20+DQo+IA0KPiANCj4gDQpUaGFua3MgZ3V5cyAtIHdpbGwgcmVzcGlu
IHRoZSBmaW5hbCBvbmUgKGkgaG9wZSkgd2l0aCB0d2Vha3Mgb24gcGF0Y2ggIzIuDQouLi5hbGFu
DQo=
