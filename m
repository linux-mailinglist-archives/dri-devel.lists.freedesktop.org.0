Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850484844BC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0BB10E391;
	Tue,  4 Jan 2022 15:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1E10E390;
 Tue,  4 Jan 2022 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641310513; x=1672846513;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IkB2+EcwtfFESzddap3+4ZPwLCV84KD9vg0rVA1e8aw=;
 b=aDA9O0afZ+nN4Lk4JOkP/yLKEwdIaJxPYjgcUSRpcqxIjgauTHXy4HwE
 5dJkcXmXGIxJrnTArMAD/LA3Uewt6bH0OuCj4Fwtb8vf24Ts69L4GQ4hq
 2pEfi/7mD2T+TFRVnrFn7PNHx0vhXlQZetUaP55M2hp/eAyU8VaKWZrVa
 txHIjvBAmUVaQLd6TJXUwRzTSOz4NnOsKA7bsOj1oWrsm8X+5ryiX2rne
 LAQ0kb1E+E86DNAZ5PQR9OQhF20aPG3Iwgp/1Sp3DCa7nOrNeLheltLSr
 j0eyXe6ONYR6qjdZ9ScCLJBwfwskL4YVM9CYvRioBlokOPSFVHxALquqq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="266511322"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="266511322"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 07:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="611116187"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2022 07:35:12 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 07:35:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 4 Jan 2022 07:35:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 4 Jan 2022 07:35:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0vaJLgdRZr+AtvoRWKgS2Gzytm6hkziZuEMMPP1Wh09jbc5OLfgpPzhBYJXmafaydiOgJ6ZxaVASnsyiz0xJckNoikzsifOx8zcSXUGXnI5s4WX7liZ5OOT7QHa3bvI+b8R/0vXtkmu8IJPWSrJF0t9zLbwSlvlKMGIGpUIley2nuFN7fGlY1YSX1uFju2QZ4rlMpSfF7dgKRdt+kq32Rvw/aetDuZyXVurgUppHTaIYbKAp6wwdz0/+oNMhPlob3b/Wn+8o9N/aT4i2d8i9awmp7tv10FSJbPdm+HT2zJtr+CJxeHUQzKLTbeyKQhjB0uMr74oSQhYkvFCq8CZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkB2+EcwtfFESzddap3+4ZPwLCV84KD9vg0rVA1e8aw=;
 b=R/rPraGj4yCWLxpf13gTPlLWH/zBWzhs8Z4Gvf1CXhbWDmLW9zFwy85ZsKpFtT6HZ/pTVGPrFEW7HoIzCG7DToHMm9/Tn9OM/zVDaL+jXpf16SbkdnfGVc9jHZXA8KfIt9VfO+NqCHEfeGOXcENzWxOWl7+3+0NmlbkI99EW9UMrRIlm6A2BGpJH2aiaveW3seEWffHU2jgqU9nGDpCk5hiIyI2zzexFstQf6CUmInQPykzzDpnm1eUlF/y97zyEBEeb5mXEQrd3xbAfHvc3Gpdz6gw1EJz2FfJoylUSeUCIBBIvqOhmWMw2cC61SCkLT8bvIHlL1AX6SOA1YXIarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by BN7PR11MB2722.namprd11.prod.outlook.com (2603:10b6:406:b8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 15:35:09 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::a596:16ca:5cb5:c51d]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::a596:16ca:5cb5:c51d%4]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 15:35:09 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Bloomfield, Jon" <jon.bloomfield@intel.com>, "Vetter, Daniel"
 <daniel.vetter@intel.com>, "Wilson, Chris P" <chris.p.wilson@intel.com>
Subject: RE: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Thread-Topic: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Thread-Index: AQHYAJmRthuhDmy2bUeW15AsxzqtF6xRmrIggAALowCAAELn0IAAn/KAgABw1LA=
Date: Tue, 4 Jan 2022 15:35:09 +0000
Message-ID: <BN6PR11MB1633C76CD53EFBBCFA843C8F924A9@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220103115947.92688-1-thomas.hellstrom@linux.intel.com>
 <20220103115947.92688-3-thomas.hellstrom@linux.intel.com>
 <BN6PR11MB1633E8200E7999D439707F2392499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <c501276b-58f4-9764-30d2-5da2ae00e7e9@linux.intel.com>
 <BN6PR11MB1633BB7DDA0486B79F6B6C2492499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <f31472df-3239-5903-ea3c-60fd58b4e1d8@linux.intel.com>
In-Reply-To: <f31472df-3239-5903-ea3c-60fd58b4e1d8@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jon.bloomfield@intel.com, daniel.vetter@intel.com,
 Chris.P.Wilson@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79383f44-cede-427a-b928-08d9cf97caa6
x-ms-traffictypediagnostic: BN7PR11MB2722:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB2722A2766FEDD09936293621924A9@BN7PR11MB2722.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yLJ0DXHsQ1tyJRwfxB/6oP3Qv5e1BFt5SnXWOT1ST1r3Ek+/evHVdVui9TIaX6u09XGEf5/ZwzJIjMf1lz1f3f2/tuy9W3vQOAPpNaR6Eh6F/blGJ2OzK+u/kA+iubNO3ZN7XtLsLQaklW9lsT/I5dyMwd93HvE+ftxSiul/oQgm3yq5910FjKuB/SJ0prKG6SC5SLqEYqYrXnC2RU6Jx5krshozvRxnxAoe7YY08EywGCaH4UTmcQTXiglLR+jULjgZhwaEv/dNCUOlzspZZQgNBRzX1DrCzNsyaSQ03+qsaRNrtHcnz3K3QNNxgIccC8bjdzf1yptTVBlxAwrjGfvCWUhTEdX9gb7qV/iUs4qBdGWyppXAwHe2dLTbi8e2rJzrN0mVo1LVfv+G/lhIpqFUuMw/YnRHvk7m9OTwoCka/yVBGNhLuFexC7i5/ltscyBA3Y5C9/Jjw3u6BuzctxVNS+bYcBvjd/jpuqvpCu+6/NOZIoDGiEN41O8Z3ReGsZmufnchQe0I5VpxqGtNCWadWYR5iEo/cWfiHeCIUAGGmtbEoXKuAd4SaGtCyPV5Er0+cGGzfqhXAV2tqOehdfw4T2oe9I5L+j3wcjHxPKg5NSrmTqqAu9ca0XgRsfmEg3AA4gbWzZnYOncGD2HwBrFyV4+b08pyXII5iWX+c6ww3xqZANpB9g80DWct49HhBvo5ExiiUE7G+ZA3NaKXcg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(53546011)(38070700005)(83380400001)(122000001)(316002)(2906002)(33656002)(55016003)(38100700002)(6506007)(7696005)(6636002)(66476007)(45080400002)(4326008)(186003)(66946007)(66446008)(8676002)(86362001)(82960400001)(110136005)(64756008)(76116006)(508600001)(9686003)(52536014)(5660300002)(26005)(8936002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3VGMGl1WTRBVkpXSTEzbmUyMXpRbk9XYkplZXBpdms3L01hNzNHczR2OWdz?=
 =?utf-8?B?TWtFdlIwRXlpdkQ2d3pHY29LTUJCS0tLQm9iQUt2R0F6UnNIMnhqR3R6eTBV?=
 =?utf-8?B?S3RETjFTcmtLc09BZzlnYUVUakRZS2hCWEVFcTFmZ1VsR3FSTTVLUDZXMEti?=
 =?utf-8?B?Wm9rWW1CcU1uc3owVWllTXJZZGFlZVVPT0xmMk41eGdoSVc1eHFidXIyNUJX?=
 =?utf-8?B?cmxXbm1sVGtmcGJ0WS9nUzVMbExvZ1crWEFOTEhkcHlvc1pNS1dGMjEwZGU0?=
 =?utf-8?B?UTlOaitTay9oekdPTUJ1cWwxRDIvWTBEYTNRUHRGa1hNWjh1VWJaZ1YrUEVW?=
 =?utf-8?B?blZna0h6Q3kwSEZMUE9NeHhnbm8vTVd4bzdoN0NmYk4zUEZLdTF3aVprUWMy?=
 =?utf-8?B?NExuVEJOOFhFQTJUa3RzSHVUdEM5TEtxMkM3ZjVjL1JMbHM4QUxub05MWmdP?=
 =?utf-8?B?T2dWbmh5UHZ5TkhzUG1KeGtLWWVUcm8wbTMrdUZBZkE3OXJTS1ZCZ21xRlB1?=
 =?utf-8?B?dml2R2hDN0N4VjNpb2h5bkFPRWozWjNTUTNVSVZRSFdPZjltL3lIWFZ3WWd2?=
 =?utf-8?B?Z21lS3dMRmlWeXVFbGdpWUJwU1dDZlgzQlFLNlJVK3B2ZGhuMlZuZUVGK3RJ?=
 =?utf-8?B?bU9HSG1aK1o5RjM4SkpBbHJGWGQyZHo2MFZkYWRrbTZuK0l2RTlDVFM2NnlV?=
 =?utf-8?B?NThlaGMwdXpVWjRGci9UMUVNN1Y1UFNNV2M5L2FIdng1ek1hcjNJdVkzUWw0?=
 =?utf-8?B?UThBazJHdzlRU2xHVnUzanFId2NsZmJ2dk8rTkwxd1g0TnFRU1FPRmhJRThY?=
 =?utf-8?B?TmlzcmwrQ0t4eGR1c2dnVXhxK1lpQWNCNU10ellpaFltaE5hTEZtTFdDSk8w?=
 =?utf-8?B?K0RVUEpKdVp6UmNxQVY0MGxYZEhOZmt6RHFxcjNKQmE2aXNuNUpGL002RVhW?=
 =?utf-8?B?Y1I2aG9qRWlGSWZjdjlPK0FjaytwdHAwc1FUaVlaR2FteE9KSFMraW9lKzJS?=
 =?utf-8?B?eit4WWVIYWt4ckhuM2dTMlRodFNDeXhZOTBaTkpDZlF2MGtBL2ZTWGJ1SE1z?=
 =?utf-8?B?QmYxaStZUDZpM1JyUSs2eDhJcnVEVW0yUW1abEtHcjZSZC9YVUVySkxINUpZ?=
 =?utf-8?B?UVhHaEJJQ1pTNU8zZ0pzWG53SUtEeEFoRmo1cjk0QXBKRzl4WGNjaEtxblY5?=
 =?utf-8?B?Z0hPSkV4TThGRjdhT2sxbEpnak5IV1N5OUM1NnVyaldvaDlBZkZpSExXVGI3?=
 =?utf-8?B?KzZ2NGpZT1BxbVBWWnloTzJmVVZtM0k0dkc5VVN4bTVMU0RtRlF3UWhpNEFE?=
 =?utf-8?B?ZUpiRjVINlZtSFcxdjI1d3dtcVVBc3VQNDZCRW5nd3ZWSklmQmlVSVRoSU1Q?=
 =?utf-8?B?RVozYm50WVhaTG5CNVhQM2IrTXBWZlh2dVdRQjNWV1lBb2hkMTVzVG1YQVpp?=
 =?utf-8?B?TWdjalVTY3VVdHdHcGRBUEphUFlWQWl4b0pYN2lha3NlZE5NSEM3Vkx3QXgy?=
 =?utf-8?B?bExrT1hSYmNGbDU1NllzMm9tZ3lDdS92TnBRd1I3WUYrdjNVcnhZckJlQS81?=
 =?utf-8?B?WUFnRU01QTM0ZGlWek1YQkhLQ3NwUmFMMXl2dDV4OUk5cG02Mnl5UnhHWXNq?=
 =?utf-8?B?R3FvODZjTkFzdGp2TWQ5dnFlWDFCMjQ2UlIvMmlPWThlQU5BbnQ2bXVVZUZG?=
 =?utf-8?B?eFdPR0I1Znc2SmJtTm5nUDNHdDRZdWNGQzFWZzFqelJPaXo1K0JiNzRuT0U4?=
 =?utf-8?B?dWxlREZ0a0crWGZqUFdleEdqa1Q1bys4UlVYRTRaU0wvVGxDcmVSU2FDWFFo?=
 =?utf-8?B?cDVUWkxoUzlaZUlQSzVpNzhRRkhiOHg2Q3BSdlhqS0lZNFU4NTlJTXdkNzJQ?=
 =?utf-8?B?QW94b3EwMUxMZWZ1elFmRjRkcTlmbVd0Ni9ocU5vdWp1WTlFSFFVM1lpYWJX?=
 =?utf-8?B?cU1vb3kvMXdDR0oxaFpZUzdHVGFoUnFaOW5wSkRkUEM0U3AxWEdYcFhhd2Q3?=
 =?utf-8?B?Wk9TZFJWN1kzWW4xYVBzdEdUMFFuTmdLK3RFRFVDT0pPRUQ1ZTNuRWpYbnht?=
 =?utf-8?B?ZE5pZStyYXZrVlVqSTFOdE9QL2ozQ2Zsd0V6bUh5MC9TQkxJVEpUc0tzQkxK?=
 =?utf-8?B?Ny9OdGJ2VmkvMGJ2NnNacmJDMjhkOVNjeE1lSjVETWNQaDVoNDZWNnVFQVln?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79383f44-cede-427a-b928-08d9cf97caa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 15:35:09.5008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qx0/c4e3m01CiWxVRwPseDsK3ewH9x0S830yBSNEhiV3MSxiRWzchhNHYtoDERjA5GnwoRGBbUzi9EtLnha3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2722
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClJlZ2FyZHMsDQpPYWsNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+
IFNlbnQ6IEphbnVhcnkgNCwgMjAyMiAzOjI5IEFNDQo+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5n
QGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjQgMi80XSBkcm0v
aTkxNTogVXNlIHRoZSB2bWEgcmVzb3VyY2UgYXMgYXJndW1lbnQgZm9yIGd0dCBiaW5kaW5nIC8g
dW5iaW5kaW5nDQo+IA0KPiBIaSwgT2FrLg0KPiANCj4gT24gMS80LzIyIDAwOjA4LCBaZW5nLCBP
YWsgd3JvdGU6DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IE9haw0KPiANCj4gTG9va3MgbGlrZSB5
b3VyIGVtYWlscyBhbHdheXMgc3RhcnQgd2l0aCAiUmVnYXJkcywgT2FrIi4gYSBtaXNjb25maWd1
cmF0aW9uPw0KDQpNeSBtYWlsIGNsaWVudCAob3V0bG9vaykgaXMgc2V0IHRvIGF1dG9tYXRpY2Fs
bHkgYWRkIGEgcmVnYXJkcywgd2hlbiBJIGNvbXBvc2UgbmV3IG1haWwgb3IgcmVwbHkgZW1haWwu
IE5vdCBhIGJpZyBwcm9ibGVtIPCfmIoNCg0KPiANCj4gDQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9t
QGxpbnV4LmludGVsLmNvbT4NCj4gPj4gU2VudDogSmFudWFyeSAzLCAyMDIyIDE6NTggUE0NCj4g
Pj4gVG86IFplbmcsIE9hayA8b2FrLnplbmdAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzog
QXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6
IFtJbnRlbC1nZnhdIFtQQVRDSCB2NCAyLzRdIGRybS9pOTE1OiBVc2UgdGhlIHZtYSByZXNvdXJj
ZSBhcyBhcmd1bWVudCBmb3IgZ3R0IGJpbmRpbmcgLyB1bmJpbmRpbmcNCj4gPj4NCj4gPj4gSGks
IE9hay4NCj4gPj4NCj4gPj4gT24gMS8zLzIyIDE5OjE3LCBaZW5nLCBPYWsgd3JvdGU6DQo+ID4+
PiBSZWdhcmRzLA0KPiA+Pj4gT2FrDQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+Pj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBUaG9tYXMgSGVsbHN0csO2bQ0KPiA+Pj4+IFNl
bnQ6IEphbnVhcnkgMywgMjAyMiA3OjAwIEFNDQo+ID4+Pj4gVG86IGludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+PiBD
YzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsg
QXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBb
SW50ZWwtZ2Z4XSBbUEFUQ0ggdjQgMi80XSBkcm0vaTkxNTogVXNlIHRoZSB2bWEgcmVzb3VyY2Ug
YXMgYXJndW1lbnQgZm9yIGd0dCBiaW5kaW5nIC8gdW5iaW5kaW5nDQo+ID4+Pj4NCj4gPj4+PiBX
aGVuIGludHJvZHVjaW5nIGFzeW5jaHJvbm91cyB1bmJpbmRpbmcsIHRoZSB2bWEgaXRzZWxmIG1h
eSBubyBsb25nZXINCj4gPj4+PiBiZSBhbGl2ZSB3aGVuIHRoZSBhY3R1YWwgYmluZGluZyBvciB1
bmJpbmRpbmcgdGFrZXMgcGxhY2UuDQo+ID4+PiBDYW4gd2UgdGFrZSBhbiBleHRyYSByZWZlcmVu
Y2UgY291bnRlciBvZiB0aGUgdm1hIHRvIGtlZXAgdGhlIHZtYSBhbGl2ZSwgdW50aWwgdGhlIGFj
dHVhbCBiaW5kaW5nL3VuYmluZGluZyB0YWtlcyBwbGFjZT8NCj4gPj4gVGhlIHBvaW50IGhlcmUg
aXMgdGhhdCB0aGF0J3Mgbm90IG5lZWRlZCwgYW5kIHNob3VsZCBiZSBhdm9pZGVkLg0KPiA+IENh
biB5b3UgZXhwbGFpbiBtb3JlIHdoeSAia2VlcGluZyB2bWEgYWxpdmUgdW50aWwgdW5iaW5kaW5n
IHRha2VzIHBsYWNlIiBzaG91bGQgYmUgYXZvaWRlZD8NCj4gPg0KPiA+IEFzIEkgdW5kZXJzdGFu
ZCBpdCwgeW91ciBzZXJpZXMgaW50cm9kdWNlIGFzeW5jaHJvbml6ZWQgdW5iaW5kaW5nLiBCdXQg
c2luY2Ugdm1hIG1pZ2h0IGJlIG5vIGxvbmdlciBhbGl2ZSBhdCB0aGUgdGltZSBvZiB1bmJpbmRp
bmcuDQo+IFRvIG92ZXJjb21lIHRoaXMgZGlmZmljdWx0eSwgeW91IGludHJvZHVjZSBhIHZtYSBy
ZXNvdXJjZSBzdHJ1Y3R1cmUgYW5kIHlvdSBndWFyYW50ZWUgdm1hIHJlc291cmNlIGlzIGFsaXZl
IGF0IGJpbmQvdW5iaW5kIHRpbWUuIFNvDQo+IHlvdSBjYW4gdXNlIHZtYSByZXNvdXJjZSBmb3Ig
dGhlIGJpbmQvdW5iaW5kIG9wZXJhdGlvbi4gTXkgcXVlc3Rpb24gaXMsIGNhbiB3ZSBhY2hpZXZl
IHRoZSBhc3luY2hyb25pemVkIHVuYmluZGluZyBzdGlsbCB1c2luZyB2bWENCj4gc3RydWN0dXJl
IGJ5IGtlZXBpbmcgdm1hIHN0cnVjdHVyZSBhbGl2ZSAoIGJ5IHJlZiBjb3VudCBpdCkuIFRoaXMg
d2F5IHRoZSBjaGFuZ2Ugc2hvdWxkIGJlIG11Y2ggc21hbGxlciAoY29tcGFyZWQgdG8gdGhpcyBz
ZXJpZXMpLiBXaHkNCj4gaXQgaXMgaGFybWZ1bCB0byBrZWVwIHRoZSB2bWEgYWxpdmU/IE1heWJl
IHlvdSBoYXZlIG90aGVyIHJlYXNvbnMgdG8gaW50cm9kdWNlIHZtYSByZXNvdXJjZSB0aGF0IEkg
ZG9uJ3Qgc2VlLg0KPiANCj4gV2hlbiB3ZSBhbGxvdyBhc3luY2hyb25vdXMgdW5iaW5kaW5nLCBp
dCdzIGFsbG93ZWQgdG8gaW1tZWRpYXRlbHkgcmViaW5kDQo+IHRoZSB2bWEsIHBvc3NpYmx5IGlu
dG8gdGhlIHNhbWUgZ3B1IHZpcnR1YWwgYWRkcmVzcywgYnV0IHdpdGggZGlmZmVyZW50DQo+IHBh
Z2VzLiBBbmQgd2hlbiBkb2luZyB0aGF0IHdlIGRvbid0IHdhbnQgdG8gYmxvY2sgd2FpdGluZyBm
b3IgdGhlIHVuYmluZA0KPiB0byBleGVjdXRlLiANCg0KSW1hZ2luZSB0aGlzIHNlcXVlbmNlOg0K
DQoxLiBWaXJ0dWFsIGFkZHJlc3MgYTEgaXMgYm91bmQgdG8gcGh5c2ljYWwgcGFnZSBwMQ0KMi4g
VW5iaW5kIGExIGZyb20gcDEsIGFzeW5jaHJvbm91cyBzbyBhY3R1YWwgdW5iaW5kIG5vdCBoYXBw
ZW4geWV0DQozLiBiaW5kIGExIHRvIHBoeXNpY2FsIHBhZ2UgcDIsIHBhZ2UgdGFibGUgaXMgY2hh
bmdlZCwgbm93IGExIHBvaW50aW5nIHRvIHAyIGluIHBhZ2UgdGFibGUuDQo0LiAjMiBub3cgdGFr
ZSBwbGFjZSBub3cgLSBzaW5jZSBpbiBwYWdlIHRhYmxlLCBhMSBwb2ludHMgdG8gcDIgbm93LCBk
b2VzIGExIHBvaW50IHRvIHNjcmF0Y2ggcGFnZSBhZnRlciAjND8NCg0KSW4gZmFjdCwgd2UgY291
bGQgYWxsb3cgYSBsYXJnZSBudW1iZXIgb2Ygb3V0c3RhbmRpbmcgYmluZHMNCj4gYW5kIHVuYmlu
ZHMgZm9yIGEgdm1hLCB3aGljaCBtYWtlcyB0aGUgdm1hIHN0cnVjdHVyZSB1bnN1aXRhYmxlIHRv
IHRyYWNrDQo+IHRoaXMsIHNpbmNlIHRoZXJlIHdpbGwgbm8gbG9uZ2VyIGJlIGEgc2luZ2xlIG1h
cHBpbmcgYmV0d2VlbiBhIHNldCBvZg0KPiBhY3RpdmUgcGFnZXMgYW5kIGEgdm1hLCBvciBhIHZp
cnR1YWwgZ3B1IHJhbmdlIGFuZCBhIHZtYS4NCg0KSSBhZ3JlZSB0aGF0IGlmIHBhZ2VzIC0gdm1h
IC0gdmlydHVhbCBncHUgcmFuZ2UgaXMgbm90IDE6MToxIG1hcHBpbmcsIHdlIG5lZWQgaW50cm9k
dWNlIGEgZmluZXItZ3JhaW5lZCB2bWEgcmVzb3VyY2UgdG8gZm9yIHRoZSBub24tMToxIG1hcHBp
bmcuIEkgYWxzbyB1bmRlcnN0YW5kIHRoZSBhc3luY2hyb25vdXMgdW5iaW5kaW5nIHV0aWxpemUg
dGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBtb3JlIGVmZmVjdGl2ZWx5LiBCdXQgbXkgZmVlbGlu
ZyBpcyB0aGF0IHRoaXMgbm9uLTE6MSBtYXBwaW5nIG1ha2VzIG91ciBwcm9ncmFtIGhhcmQgdG8g
dW5kZXJzdGFuZCBhbmQgbWFpbnRhaW4uIFNpbmNlIHRoaXMgbm9uLSAxOjEgbWFwcGluZyBpcyBp
bnRyb2R1Y2VkIGJ5IGFzeW5jaHJvbm91cyBiaW5kaW5nL3VuYmluZGluZywgbWF5YmUgdGhlIHJl
YWwgcXVlc3Rpb24gaGVyZSBpcywgaXMgaXQgcmVhbGx5IGJlbmVmaXQgdG8gaW50cm9kdWNlIGFz
eW5jaHJvbm91cyB1bmJpbmRpbmc/DQoNCkkgYW0gc3RpbGwgbm90IGZhbWlsaWFyIGVub3VnaCB0
byB0aGUgY29kZXMuIEkgc3VnZ2VzdCBvdGhlciBleHBlcnRzIHRvIHRha2UgYSBsb29rIGFsc28u
IEBCbG9vbWZpZWxkLCBKb24gQFZldHRlciwgRGFuaWVsIEBXaWxzb24sIENocmlzIFAuDQoNClJl
Z2FyZHMsDQpPYWsNCj4gDQo+IFRoYW5rcywNCj4gDQo+IC9UaG9tYXMNCj4gDQo+ID4NCj4gPiBS
ZWdhcmRzLA0KPiA+IE9haw0KPiA+DQo+ID4gICBJZiB0aGUNCj4gPj4gdm1hIGlzIG5vIGxvbmdl
ciBhbGl2ZSwgdGhhdCBtZWFucyBub2JvZHkgdXNlcyBpdCBhbnltb3JlLCBidXQgdGhlIEdQVQ0K
PiA+PiBtYXkgc3RpbGwgaGF2ZSB3b3JrIGluIHRoZSBwaXBlIHRoYXQgcmVmZXJlbmNlcyB0aGUg
R1BVIHZpcnR1YWwgYWRkcmVzcy4NCj4gPj4NCj4gPj4gL1Rob21hcy4NCj4gPj4NCg==
