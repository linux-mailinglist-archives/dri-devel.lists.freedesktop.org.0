Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB906675A4F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDE110E37E;
	Fri, 20 Jan 2023 16:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E842A10E370;
 Fri, 20 Jan 2023 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232964; x=1705768964;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fmehEGUoa5xIs/kPlAS3p/AAVcJz/lZVUN+X/LviCZE=;
 b=Dy65GmD5wUS99b5NNrGewyRJCBfOmATQ17dQ0rd5KuTbI5U4oCQLsAzS
 MFDnfuCeUN43Wuzu8z38LSUGQv4IEePAd7UiwD3ztJTBaZ5n7mVMnyAk1
 UVfZOJ02QMzo1INehalNYpIczMzr1XBNAJgRqzHXy6RKf1vGzPT6qUiMK
 3d1OZjjBPe5J8+hIfuytDag25RNVHF0kN+3mgAwzaKd3A2bperSJATvOz
 WHwrAI7DsxGVtbqEYnndblmH9v+5pdxn8twnx6tN/f1fEIdbNvv13lua6
 iW0eFYPot2nPN1DF91ifXzPo9UdkjyYFBrcwpTRKc6NL6DDGQvzEjLk61 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352875132"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="352875132"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="906017739"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="906017739"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2023 08:42:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 08:42:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 08:42:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 08:42:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiyeK/6ATKL9ZflEGqlcyTh8PfM7eH88ftAzTNNDw5rygsKKkqkKtA9A3VPbCc8f7cDNcW+I4E293D3yOyuUBw78Yk+MTWa+xdjpL4lx5q13Bn7UlO+BwR++rWRLEpGlGAc2sDSDxYZA6+afii0UYkzaha0xMh0j+oVblVNYvHW4UDc9l3ZC8RIIgJRtpDzkxAscgspHy8mBebvLJl9rKwoM5+Q+rZ1O2Nl6ySBZGp9aYV/Nh44OrsedT8R/LsjOroUREHK2K0aLjdp6nidNW/rzmvL6Lv8ou6jo+2KS+m88qg0FYOj5MZUUx93brTptkYbWGArr7vdj4XSTiBvPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmehEGUoa5xIs/kPlAS3p/AAVcJz/lZVUN+X/LviCZE=;
 b=dukuG2OhTUg8WyPdJUJa1+DvLSn6RYHodtm1bv1m6fD1tCKjwTtDi6O8FWtffjqxSotP815uRXD4FRfTCeiDd5QwvM9KMbZACR2nMuScYJsuLLfq4cbaW/vvYpi5MkwpFLOvI4q1Mt52lD1IbAkG2kxv9VJv/ervEr+t56cYBw0A0LgpTM3kF5mE532vq3JQLx4S/EJn9NwzAZK4DlnVO5C0Zz7cbFXIXWk+K+QvrMI5Iya/FieDEieGQpBic//IZzLvnuXxecCjOnPAtkkdaxYBfPVyOM2bxzcXbaRVX0XX5Hh/A58zG42Fu2PhGI34yaQlfZJG+0uat0q8jFHgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Fri, 20 Jan 2023 16:42:42 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 16:42:41 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Topic: [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Index: AQHZLD82JYaug2aXxkqEzlhuyeoWTK6nBsgAgAB9I4A=
Date: Fri, 20 Jan 2023 16:42:41 +0000
Message-ID: <2967ca4a27e20fe3b76cfa6f21e8b67a4053d1e0.camel@intel.com>
References: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
 <873585a7p5.fsf@intel.com>
In-Reply-To: <873585a7p5.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB7318:EE_
x-ms-office365-filtering-correlation-id: b64ced2d-a13f-4cf4-531a-08dafb05594b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EMYoFmOVowPsUcrQYLeRvFgmFdTL7KcwTCXU438GNZPpCf+XBbjp7iZ8j9Sf3F9CGFQA4uSpJLewysxtV2WkypX3P48/opsCZf3krFXMOO6h0yVKbdW6cIhrCKMeBil+LSSBflfkS2zvprA74seHQBxttXrGpto1p3SV8V2eV56hRDXyRO3c8ewzSzlGbH3nPyzpmEaYG4hXAGDznOkE8snwQXAx7Q6yNDSFiVa07r+hary99ABjLv3xcbttrYkj16J+0qN8pceSVyDysW0N2aPF9Rnz6n3pVpj66rDobKM+Mpsa/mvTevuSSiTXaT6QpuERACSWEkLBbq4wky6nLh22cLXszDlU42IibLaFS0NTk/ODHU1TTdkujGxL1eKR7tbMgvYwS08t48sz4cD57yq5n9y8psWPY97KIzZIs8ZXCsiEjwTezRuFepveMr6XI2dl+jZjsjOh3xp6iri7VhKB/qPNurtPBOgDoLGQXRjNrPvS17lkeUbvK3DUwdliqiSIDLO2cwreZ+HZvVNiYhuxcjPl3RY/jpuZiW23OB+kHoMo/n4z9rGY5NPM1qinM12TdVE1FNmSDNT8yvXQxNg3+UiQwCMRTlvQsa7SO30HvFdln/ob6XoleOWoSJ9bC+26mqr3i3UXb+BOIZrT7J8Hab/Q1DP6yp4mKlsvVzJVFAl0jwR946210qLVqFqFNSVsEyz/uW2l2Ef/U9m7IA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199015)(71200400001)(8936002)(36756003)(6486002)(110136005)(2906002)(478600001)(38070700005)(2616005)(5660300002)(122000001)(41300700001)(316002)(6506007)(26005)(4326008)(186003)(8676002)(76116006)(6512007)(66946007)(66556008)(66446008)(66476007)(91956017)(64756008)(86362001)(38100700002)(54906003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDBrb01rWXMvbzdhaE9Yb3FLampVMCtJRE8rVDFHTkdPcG5IaHhtWDlaUEs2?=
 =?utf-8?B?dk4rSHhuYVA1eVRiTkdCVndXOTdERVgreXBvbkJ0eVIyTnZLZWkwSEorN0N6?=
 =?utf-8?B?K056OWdpNElGNnNoWnpTL2NvdHFSV2t4V1lSRDluWDN0M09DR0NXRXBlZ2JI?=
 =?utf-8?B?cW1ld291MGFabjJKTWF3REtlbVkrOVFzL29zZGdlckZGVHhSbmlISmQvTmY4?=
 =?utf-8?B?VXh1K1RLNVNxNTFqb0oxblF4K2ladlNQQ3R4ZjZhb2c0d3lxQTY2THA1LzdE?=
 =?utf-8?B?YTNhMnFrQXhDWFpYYVlMMTdHTUFOTERURFYrVk45ZUx3OUFYWmlZU3UrVEZo?=
 =?utf-8?B?Vkg4VWM0OXhVSlJXejRPUHpPeUVtWGRCNkdSSVRNbnQ3NVpmVmZqWU5OMEJ3?=
 =?utf-8?B?dkRIazZnSVZUQ1NWNGpKTEM4VDc5TS9udkhLNFZXQ21BWm5ueTJMeHdtd0Jh?=
 =?utf-8?B?ck9JV2VuVXM5dTFFVDh6YzVwM3BWWkdtZWlxOXdjWjdrTmZvZXlmNS9nVUk3?=
 =?utf-8?B?TVRUMGw2djZQc1NqRnlQTUI0TGtLcG9PRlBJeUVySXNhUHgvei9QN1BVZXo3?=
 =?utf-8?B?YWRIclo5MWFxWXNoTkYraDd1cEtFQTNONTBJTTgyVlVBMHVaTkE1MWlIYlZy?=
 =?utf-8?B?LzFLVTY4Y3JHME5tZmFncU5pSUxVTzZTOEpqdU9JQ1hFem0vTEN3QmUvam5Y?=
 =?utf-8?B?dGUra0U3aC9NTjZBMHl5S1E2QkI4bGJzSFV6RS9oeGVDeHIyS1dkOFMvWTcv?=
 =?utf-8?B?N0NtMFlBcnVvQXpHR1pnSUtKc2UvZWxHQVNteWtwK2ZJbFQrWEEzQzdMVTlt?=
 =?utf-8?B?Y2xuTUFDdlcrTVBuZUloYVI5Vi9pT2NHT3pVUTloeEt3aU5EZlRCRVg0K2RG?=
 =?utf-8?B?Z2VPR2p0Wno1SGtOL3JCaERWdFV4cjBMZ2tpa0JxZDV2YitFb3EwcVVaYU4y?=
 =?utf-8?B?N2lKMzhEMm93eVo0clNsUmt5OTkyWE8xN09yOHVTYi9uNEhtYUNndmVCaUsz?=
 =?utf-8?B?TS80RExFZEg2TUNuWHhZY2h1WE42dTJEcGc1cEVtL2FUQ3E4RUd0S1dKZnF6?=
 =?utf-8?B?clc0bDI5T2RsUXJmeW4wS1pwSW5ldFdmeldBQU80QmtNSjlpa3lUbk9nOVVZ?=
 =?utf-8?B?eDA4Y0VRbzJkZGwyRTcveklZL1VmaG45M1F2bGFMOGY4cnh6eTllSHpWcUJI?=
 =?utf-8?B?dDJJbTYyeXhSSXNmbjZld2h3a1Qvd0J3dDFuTFN2N21pS0hYb0VkVDYvZndX?=
 =?utf-8?B?aTdMck95MUo0Tk9MTmgrTWF6VEo5WC9nRCt6Q1pyemwxM0kvSmN1R1pUZHlt?=
 =?utf-8?B?dkNhM3JGZE1RNmxtRnFvaFNVM05KOFNZY3dOSzBBUW1TSmMvWE90MGE0V0ky?=
 =?utf-8?B?cTByc3hmRmROYmJLemlRMVRQdmwrcmRaL05ORXNudFBENnBYbnpWcE9kN1I5?=
 =?utf-8?B?UU12Wnc2TXdxQjRRRVZ2UHJWT2tjTTdja0gzT3o1T09WZWQzVXUrajMwZFEz?=
 =?utf-8?B?REczak1id1FFN1BvZ2JUZUZFSDdGQ0o3WGpXakZsR2JtZXRpRjNBUjJlOHYy?=
 =?utf-8?B?ZWJsUFkrZmUyejBqZ3k1NFJnUjdxR2pDUzNkbU9IQXkxQXM0M2pVMU5tOTV3?=
 =?utf-8?B?M3Y3RHRtaEtuWFEyRExzQmgrUjRoalFsUDJOTGEwYkNva1I4dStjMWdCS3Y2?=
 =?utf-8?B?L0xYK1BCN3V4KzU4STdXZEJLUlpBbkZ5azJBUzJvYSs2Ym9COXgyZmVFTUd3?=
 =?utf-8?B?QSswVWsrY29GR1IvcVZ6VHZSRTZLK0luMjNyT3lEOVAzb1MzYXdyZDd3a1lv?=
 =?utf-8?B?QjQxTW9KTjVUYXBXYkhpU3RjZnNOeHBkM3dncnY2RzI1eWM4TDZ5M0czRE9G?=
 =?utf-8?B?Y1ViSCs4NGtvT0FxcjdKQTBZY240Y0tmM1I3NkEyYzUvL1FmMHVvOUJFOUE0?=
 =?utf-8?B?V2xKMmpHdnM3dmRjdU9xd3BVRjVLT0tPSlUzc3VramxBL3RSczVGTWt1YTRJ?=
 =?utf-8?B?Q3hjSnVFWVVrNTFYT2lHa2ZXYU8yK01QcWx5R0VTR2hSQm12VTc1YmZVUXhx?=
 =?utf-8?B?c2NIU1VaQmRRcWNIVnVPWmN1R2ZpQXRGT1J4T2ZVVmpXWHBzNkZZRlRxY2tR?=
 =?utf-8?B?S21yeTIxeGRGMWwzNEFRR3FJTHM0M3k2Q2ttaFlmVThpUyszZEg5QUhyTkE4?=
 =?utf-8?Q?idqewVwQn+1Uxc+mmm/pexTF9LtYuQ1VDUoP6bnOYpiy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52957ED1B22EE447A79FA2295851732F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64ced2d-a13f-4cf4-531a-08dafb05594b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 16:42:41.7394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlL+Nu6oq3XDIpd4wfYUFjvAJQZiUO5MV6LQlbj9Ccae5+rGXtKnWySPCJfSFGDk9ezItxu814wxnWHcL3hgei/sUAhN4+0Shqe30Dnie0VtmM+8XZ8NnXzV6J12ZRB4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
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
Cc: "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZXZpZXdpbmcgLSBzb3VuZHMgZ29vZCAtIHdpbGwgZml4IHRob3NlIGNvbW1l
bnRzIHVwIGFzIHBlciB5b3VyIHJlY29tbWVuZGF0aW9uLgoKT24gRnJpLCAyMDIzLTAxLTIwIGF0
IDExOjE0ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiBPbiBUaHUsIDE5IEphbiAyMDIzLCBB
bGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4gd3JvdGU6Cj4g
PiBUaGUgRHJpdmVyLUZMUiBmbG93IG1heSBpbmFkdmVydGVudGx5IGV4aXQgZWFybHkgYmVmb3Jl
IHRoZSBmdWxsCj4gPiBjb21wbGV0aW9uIG9mIHRoZSByZS1pbml0IG9mIHRoZSBpbnRlcm5hbCBI
VyBzdGF0ZSBpZiB3ZSBvbmx5IHBvbGwKPiA+IEdVX0RFQlVHIEJpdDMxIChwb2xsaW5nIGZvciBp
dCB0byB0b2dnbGUgZnJvbSAwIC0+IDEpLiBJbnN0ZWFkCj4gPiB3ZSBuZWVkIGEgdHdvLXN0ZXAg
Y29tcGxldGlvbiB3YWl0LWZvci1jb21wbGV0aW9uIGZsb3cgdGhhdCBhbHNvCj4gPiBpbnZvbHZl
cyBHVV9DTlRMLiBTZWUgdGhlIHBhdGNoIGFuZCBuZXcgY29kZSBjb21tZW50cyBmb3IgZGV0YWls
Lgo+ID4gVGhpcyBpcyBuZXcgZGlyZWN0aW9uIGZyb20gSFcgYXJjaGl0ZWN0dXJlIGZvbGtzLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxl
eGlzQGludGVsLmNvbT4KPiA+IEZpeGVzOiA1YTQ0ZmNkNzM0OTggKCJkcm0vaTkxNS9nc2M6IERv
IGEgZHJpdmVyLUZMUiBvbiB1bmxvYWQgaWYgR1NDIHdhcyBsb2FkZWQiKQo+ID4gLS0tCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jIHwgNyArKysrKysrCj4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfdW5jb3JlLmMKPiA+IGluZGV4IDhkZWU5ZTYyYTczZS4uOTU5ODY5ZTJmZjA1IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfdW5jb3JlLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jCj4gPiBAQCAtMjc0OCw2ICsyNzQ4LDEy
IEBAIHN0YXRpYyB2b2lkIGRyaXZlcl9pbml0aWF0ZWRfZmxyKHN0cnVjdCBpbnRlbF91bmNvcmUg
KnVuY29yZSkKPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBUcmlnZ2VyIHRoZSBhY3R1YWwgRHJpdmVy
LUZMUiAqLwo+ID4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3VuY29yZV9ybXdfZncodW5jb3JlLCBH
VV9DTlRMLCAwLCBEUklWRVJGTFIpOwo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIENvbXBs
ZXRpb24gU3RlcCAxIC0gcG9sbCBmb3IgJ0NOVEwtQklUMzEgPSAwJyB3YWl0IGZvciBodyB0ZWFy
ZG93biB0byBjb21wbGV0ZSAqLwo+IAo+IFBsZWFzZSBkb24ndCB1c2UgY29tbWVudHMgdG8gcmVw
ZWF0IHdoYXQgdGhlIGNvZGUgYWxyZWFkeSBzYXlzLgo+IAo+IEhlcmUsIHlvdSBjb3VsZCBqdXN0
IHNheSwgIldhaXQgZm9yIGhhcmR3YXJlIHRlYXJkb3duIHRvIGNvbXBsZXRlIiwKPiB3aGljaCBk
ZXNjcmliZXMgd2hhdCB0aGUgY29kZSBkb2VzIGF0IGEgaGlnaGVyIGxldmVsLCBidXQgZG9lcyBu
b3QKPiBkdXBsaWNhdGUgYW55IG9mIGl0Lgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gaW50
ZWxfd2FpdF9mb3JfcmVnaXN0ZXJfZncodW5jb3JlLCBHVV9DTlRMLAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBEUklWRVJGTFJfU1RBVFVTLCAwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmbHJfdGltZW91dF9tcyk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBDb21wbGV0aW9u
OiBTdGVwIDIgLSBwb2xsIGZvciAnREVCVUctQklUMzEgPSAxJyBmb3IgaHcvZncgcmUtaW5pdCB0
byBjb21wbGV0ZSAqLwo+IAo+ICJXYWl0IGZvciBoYXJkd2FyZS9maXJtd2FyZSByZS1pbml0IHRv
IGNvbXBsZXRlIgo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IGludGVsX3dhaXRfZm9yX3Jl
Z2lzdGVyX2Z3KHVuY29yZSwgR1VfREVCVUcsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBE
UklWRVJGTFJfU1RBVFVTLCBEUklWRVJGTFJfU1RBVFVTLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZmxyX3RpbWVvdXRfbXMpOwo+ID4gQEAgLTI3NTYsNiArMjc2Miw3IEBAIHN0YXRpYyB2
b2lkIGRyaXZlcl9pbml0aWF0ZWRfZmxyKHN0cnVjdCBpbnRlbF91bmNvcmUgKnVuY29yZSkKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ID4gwqDCoMKgwqDCoMKg
wqDCoH0KPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBXcml0ZSAxIHRvIGNsZWFyIEdVX0RF
QlVHJ3Mgc3RpY2t5IGNvbXBsZXRpb24gc3RhdHVzIGJpdCAqLwo+IAo+ICJDbGVhciBzdGlja3kg
Y29tcGxldGlvbiBzdGF0dXMiIG1heWJlPwo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3Vu
Y29yZV93cml0ZV9mdyh1bmNvcmUsIEdVX0RFQlVHLCBEUklWRVJGTFJfU1RBVFVTKTsKPiA+IMKg
fQo+ID4gwqAKPiA+IAo+ID4gYmFzZS1jb21taXQ6IDBhMGVlNjE3ODRkZjAxYWMwOThhOTJiZDQz
NjczZWUzMGM2MjlmMTMKPiAKCg==
