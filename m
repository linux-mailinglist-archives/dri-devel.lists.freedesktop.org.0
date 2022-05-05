Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC351C9A5
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 21:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411CA10F268;
	Thu,  5 May 2022 19:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B20710F262;
 Thu,  5 May 2022 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651780254; x=1683316254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=V0Lsqfd++LKg5ljIHuRZH19xXQyVE9KJGBs7X1QmuAQ=;
 b=XM9yq6euTjK/TrhPQ4pDy1hQ2PZtDdALy63RC+VsoTXDbcYzEmoMkiUM
 GYo6tFWqVFRru0O5KaeF5LZbzYW0TXFiU3XmuWWTZsT2dUm0UV736KfoW
 VsxrMfGc79aulfBW5u7LsjvsL6o6o92jhPXnTyOHlqdXctQ4wn1LPXeXf
 xSlDSYIZky5x50Z7jsTPAUFT9ApkJnCiiTkAuOj8u8oFNlyoIwEG9Mh7o
 dC99MSCTD8Kw8dMWmAT44hJtFzfDZKND3v9+NvNVF7Pv22DiEfIqxszYW
 TtJi6Dh/eLJncElhBr5G5kuVMuojYVUGkJ0PdDYc7R36Vj2qK8XeBAJ7K g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293437102"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293437102"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 12:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549507272"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2022 12:50:53 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 12:50:53 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 12:50:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 5 May 2022 12:50:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 5 May 2022 12:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVNdXzkZU+vDJ5q94OCVU3ywzMWniA1mKWrUFS7pUQNRUujD49TjRJgw29eltzq33moflwOcOdqiOpXbezXnvMAFQQboHyLLhAjIKtWfGP1E0Qr6mP5JZ73EGJn8LFum35ShxFywTDiATlMfsigWW2Eo6Jhc5J+hF6CLbywAdJd4YgIhXiA51sI3IUjtOa3izZEFmGDxbpTDCQfPxcmXIRc6eMB9u3MJ8ktCjKjYCDeeDFfVXFEbMUVokIIo5wEOxKvXnSR9xFKnFWTSXmuKV7a6CqD0bNwh14Wq8ZMxsCnVreK+xM1D0eqgf+BnRlB9eO1vZ6n+Fx0U8/xyDfIaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0Lsqfd++LKg5ljIHuRZH19xXQyVE9KJGBs7X1QmuAQ=;
 b=HckjVPgCn+Hpo6ef8gy5wB0e0D0gY9hepk9gRUmiyrdVAQZMNneqyfmoIlGCVvpacOLHLlb4llSOoYCct0U5VcWgM7r857U3P1nhCerJCAkotT7ou+0Gm/F7JyokFSG3ueBqYo3W385l364KiRP8T2/m1xKBPw6Kxb9sH7ed20RMI5Am1kMnipULbUeY6clg0FtWBVWEtDxo7/BPetZ6wIMczp4spthxcprb2teMy2FYl3EFjqnEZoCuNK9p0ejmK7g8/5sRMTBkeaNS1eHHta2QAjkbByfj5ikj6tEeWlJP2bFnj1t6ZqU4eebwek2Dlqs+QADf8i8PEVmR/TJonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Thu, 5 May 2022 19:50:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d5bc:19eb:e1a5:a6ae]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d5bc:19eb:e1a5:a6ae%8]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 19:50:45 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [v2,1/4] drm/i915/huc: drop intel_huc_is_authenticated
Thread-Topic: [v2,1/4] drm/i915/huc: drop intel_huc_is_authenticated
Thread-Index: AQHYYLlp3y+vx3AshEu6DuPQ/gtMIA==
Date: Thu, 5 May 2022 19:50:45 +0000
Message-ID: <7ecc3005867e5585614ce6b974723b681b55e83e.camel@intel.com>
References: <20220504204816.2082588-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220504204816.2082588-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eec3c9a9-66e2-4833-247c-08da2ed08b89
x-ms-traffictypediagnostic: DM6PR11MB3994:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3994566914D794DFDADB7ACC8AC29@DM6PR11MB3994.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eSkVcKRnPExLoL7YnfVr0ltUB/em86xug6A6XGLSf5a4Xy69GAa0YIkZo81l8pm0TAIBjX+tAZqo/3nZE7E3xEr+fEk6OD8wht0KTouxFjlA+DeRCfFkxxcRnQiio64Y6MCPILUffPhLQjuhYZyl9xQcoH3C7va0qzTFoSKQDB+PMy3Za8wJ796C6uVFvxHMhleDtG9BWWx7UcjdUdeSUZzvdAN1PJPSnXUTa0EsSTBnGjwmgOELZVEZiEqRtJJflzrUK0xk26FY3c1z6faXzo3kO49FOSeGE+ozWMNCyVwBZygDEXYRhX2BS3uuwuecnB4yyJK1OTVp29X6mIczWu2PtpG7meYHfMFfwb60ih8dT2H/xv43BlOAthcJwcMh6ZzSzTDZYisTaUGiQlwSVweJl4ics+TqNRJOYdqDr2lZvafYuGGdSxN6KWUZumYrlWAU3KDE0wxgm3DY5/7QFkN1bpnw0BxKKe93XKPO1rQ/ASCveqLGrFjKUJEyNmOG+/sac4wws2NrJGsTDoUPoP1k0MZ8JJRnlZRtvFqEEG1QDhVJFog9y24pHKVhfotoaVv5GNQKwtv4VZzSe7eW8gsWk97lmHhnhDErnoqqjW2t/h+utZXdejAcLbI0ABWK47bjqC5mx/SW8JiOwHWnwLHt/lpXUkBVIH+vHr1fycnCid6DyOa+P5ExK2YNdWjyYdo1nOglPqHLHueWyP1kyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(8676002)(2906002)(86362001)(26005)(122000001)(38070700005)(38100700002)(8936002)(508600001)(6486002)(71200400001)(36756003)(5660300002)(82960400001)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(83380400001)(450100002)(186003)(316002)(110136005)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzZRdGEwcjRZUWtEdzM3ZlNPbXprNndjMkJNWnJvTzRmV2J2TW1RWFNqeGd3?=
 =?utf-8?B?SVhIR1JHb1dacGRpejBPd0VpRDBSUkJxZkdaSVN5UjRkZnA3WXQ2bzFmWlRr?=
 =?utf-8?B?d0pMR2t3cFcyQ2JTVGE4SmFsbWR0Y2JxRjBBdTlKSDRyQXFQUmo2M2NEeXZi?=
 =?utf-8?B?T0VVdDJlQ2pNQWFiMkZiZnR6aHhvY3k5MDFKSm5Dd2RCRklCNlNUdUZJNngx?=
 =?utf-8?B?WFNQdDgrUXJyeFI4WU5JL0pPZnBIS2d0OEY5K3dtcnlIcjVKL2JDL05KV0ZH?=
 =?utf-8?B?ZHNzbmpLMEQ2dzkxdnN0TlRaRkJLdFpXcjlXTE1sNlBSTkxTcEpURXJnUU9G?=
 =?utf-8?B?UE1vTWxEZTkxZmtBMWRMRUhIVVlaUVRta3pSSHNYbWJnSTVFUkxsVmxhVStr?=
 =?utf-8?B?VTF2OVh6UXRNOFBPclFMT2FSTzF6Q1FWMUFiYXRHcHNIM2t0c1JyYVFCQ1lU?=
 =?utf-8?B?OTRpYi9hdXJCaEEzZ3ZzYUVDVVFxSEtNNUJlMVNDaU5rR3lzWHlnam9KYzJj?=
 =?utf-8?B?OEtOMmpOOFl0TWpSc2s3SzhrT09oRVkxL2NwWHpXNlg2Ry9BRENBcDJxSWEx?=
 =?utf-8?B?WWpyVUVSbmwxUnkzam1wSkJqSWRKNFpIcjYzeXVxRTZJUnVpYjVEb3lia2dn?=
 =?utf-8?B?ZE45by91QmJTeGlaNlRzNVlRbkg5MUV2T0QxM3Y4T1V0cm9qdG11MS9jalVV?=
 =?utf-8?B?bklFWU5sdFpubGJOSmIxZXJVQ3o1WEdhQllVUEtsRXVlU28zRUdQSHNuVExT?=
 =?utf-8?B?ZjJKbHplSm9ObTBWV2RDb3U5Um8welJuRitQREplenRoNFJsZ3hTRnFPNUEy?=
 =?utf-8?B?dkN1Z0JvRDlXdTFNdVVWTWhPR0xzN2pSYU1CWTI0ZjVPWTc3QXdFeVo3VFND?=
 =?utf-8?B?Wk51RDQ0bzlibFdpamlheDU4R1NQM0Y5SXd0bGNEdCtTeHNvV09EVkgrM28v?=
 =?utf-8?B?NHFpSC9hU0ViZmIveDgwaVVIelpjc08yejVEQUZPN0Z2M3RUaEdDU2wwU203?=
 =?utf-8?B?RU9xTk00V1NyYXk1cmU4MmhhS0xKdHZhK0YrTGY0MU9yT3VZdXhpa0N0UE1x?=
 =?utf-8?B?ZzkrVmVBcnBtanBRZFkzUHo1a0RhMEp5c0xwaHJUcGN1eVk4UldkeDE5ZHB2?=
 =?utf-8?B?Z2t0ME11VVRLcnQ2U0ppWnRZbW9PTkt3UGppd29KNFUzOS9CNFlTT1lXYmJ4?=
 =?utf-8?B?Qi9WWExRbmo5WStKVVBkcmlLMkdlSHozc01QNFdLWk11UnZJeVg0OFhMb3d4?=
 =?utf-8?B?WHVrWFAyQzI0ajYrdDR6Z2F0cjVmVjFwQlVQazkvY3NQWU5FMmRWaEdLZEE1?=
 =?utf-8?B?cXdPRXRBaTQ3RkF1L3Nuam9nQ0wvZWNvNW40c3J3aGtzMERZeWQ4M1FMWWtS?=
 =?utf-8?B?c3h2N2owZi80MWZiY2VNaXhjZHBxaGhuL296bjlQVUE0Z2dMZFl6dzcyVitr?=
 =?utf-8?B?ZTIvOUluVVdianNDejlVM1dTeXFWSFVadWsxWGYzb1Q0UG1hTVJCT3AwQm9p?=
 =?utf-8?B?MGVnMDloekpJVTdiZ0VsUnY3N0VjbzVrRnRCRi9LVXpuZm84NXNJY09oRGRh?=
 =?utf-8?B?ZjJyanhoL1pETkxOOTkvUERQZ3A2QXhUMWVpc01vSGZCaFZMaHJheCtGOElu?=
 =?utf-8?B?NTBwd1RqNmNNelBFTWRtZ0dIQStzOE9QbUJEOWNoTGhnMTRiekFaUUg1U09U?=
 =?utf-8?B?ckFjRlQ3ZFdtNzBMWHpLVE5LYWVwZ1dnOWN1T3NZM3NQVE9ZMVZQSGVaV01B?=
 =?utf-8?B?ckl2Q0ZxaXVuUG1naDZKeCs2Z2JCdHZ3NFdpUHo3aWlUTlNrK2tuanlKN0hH?=
 =?utf-8?B?NlVWL3N6MnkrZFdEaWNmV2x1NXloK2FZRUFiSlowYlVPKzM0QjByeVpFQVlP?=
 =?utf-8?B?YkNpUUoxNnR0VXJwQnc0UE1jSjhlajBBNENPY000MDJkemR6Um1PRktGZ3dh?=
 =?utf-8?B?bzlrUWoxQzh3ZiszbFVrL3lWRnNtTWlyRUlqc0MxbG1KR2NZUWJpRHR6SWsz?=
 =?utf-8?B?T1d1WEZPbUFjeHlYQWlqaTZBVUpvWXlpTWVCMlQ0V2Z2Q25xdDl1SkFWV01X?=
 =?utf-8?B?end2TkZER0p5TFNiT29OTThwUnpwWEZwelA1OTUzTW14ajBHbDBYTmIzWVBN?=
 =?utf-8?B?MDJqaUJkWU83U1U5MlFQK2MwS2hTdW5zemxtM2RlRnRiQndMM3ZSNVJyNDFY?=
 =?utf-8?B?MXZtZnVPVlVDdmUyUDRmTTVQQ3g2KzNzQUNlckwyUlA4a0hFOUcxdkthR3ho?=
 =?utf-8?B?MmhiZzZFN2Ivc3B5ZElGQTU5TytIOFhDTjZhZnlqanhIRlFibzFWa2ZNT3Zv?=
 =?utf-8?B?STQ1SnMvSVo4amhzNXAzWnVlY0N6YzRoMFFtWkI2eXVGQmFwWmtFeFRsT3NH?=
 =?utf-8?Q?ROVkaxuIgn2Zee/RvopMVA3JXdinaKLrtPMGNBWr0Te4/?=
x-ms-exchange-antispam-messagedata-1: i4i2k88IWtdREw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC245E0380C6EE43B5C2AFE76FE9C53B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec3c9a9-66e2-4833-247c-08da2ed08b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 19:50:45.5287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbYVMOaOfMUDeuBIKgxpIsHxlv8m4JB5CEHzUb2rvIUcFaFwiQk+/ErWMIJi/sI76qNx850GeCSaM720W1Qxbvjru61NT7c4hVOgHHckYBuGE5HOygnl3wwnEyX0d6lA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3994
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpPbiBXZWQsIDIwMjItMDUtMDQgYXQgMTM6NDggLTA3MDAsIERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gd3JvdGU6DQo+IFRoZSBmdWN0aW9uIG5hbWUgaXMgY29uZnVzaW5nLCBiZWNhdXNl
IGl0IGRvZXNuJ3QgY2hlY2sgdGhlIGFjdHVhbCBhdXRoDQo+IHN0YXR1cyBpbiBIVyBidXQgdGhl
IFNXIHN0YXR1cy4gR2l2ZW4gdGhhdCB0aGVyZSBpcyBvbmx5IG9uZSB1c2VyICh0aGUNCj4gaHVj
X2F1dGggZnVuY3Rpb24gaXRzZWxmKSwganVzdCBnZXQgcmlkIG9mIGl0IGFuZCB1c2UgdGhlIEZX
IHN0YXR1cw0KPiBjaGVja2VyIGRpcmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
ZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYyB8IDIgKy0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5oIHwgNSAtLS0tLQ0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jDQo+IGluZGV4IDU1NjgyOWRlOWMxNzIuLjdiNzU5
Yjk5Y2YzYzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2h1Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jDQo+
IEBAIC05Niw3ICs5Niw3IEBAIGludCBpbnRlbF9odWNfYXV0aChzdHJ1Y3QgaW50ZWxfaHVjICpo
dWMpDQo+ICAJc3RydWN0IGludGVsX2d1YyAqZ3VjID0gJmd0LT51Yy5ndWM7DQo+ICAJaW50IHJl
dDsNCj4gIA0KPiAtCUdFTV9CVUdfT04oaW50ZWxfaHVjX2lzX2F1dGhlbnRpY2F0ZWQoaHVjKSk7
DQo+ICsJR0VNX0JVR19PTihpbnRlbF91Y19md19pc19ydW5uaW5nKCZodWMtPmZ3KSk7DQo+ICAN
Cj4gIAlpZiAoIWludGVsX3VjX2Z3X2lzX2xvYWRlZCgmaHVjLT5mdykpDQo+ICAJCXJldHVybiAt
RU5PRVhFQzsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2h1Yy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjLmgNCj4gaW5kZXgg
NzNlYzY3MDgwMGYyYi4uNzdkODEzODQwZDc2YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvdWMvaW50ZWxfaHVjLmgNCj4gQEAgLTUwLDExICs1MCw2IEBAIHN0YXRpYyBpbmxpbmUgYm9v
bCBpbnRlbF9odWNfaXNfdXNlZChzdHJ1Y3QgaW50ZWxfaHVjICpodWMpDQo+ICAJcmV0dXJuIGlu
dGVsX3VjX2Z3X2lzX2F2YWlsYWJsZSgmaHVjLT5mdyk7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBp
bmxpbmUgYm9vbCBpbnRlbF9odWNfaXNfYXV0aGVudGljYXRlZChzdHJ1Y3QgaW50ZWxfaHVjICpo
dWMpDQo+IC17DQo+IC0JcmV0dXJuIGludGVsX3VjX2Z3X2lzX3J1bm5pbmcoJmh1Yy0+ZncpOw0K
PiAtfQ0KPiAtDQo+ICB2b2lkIGludGVsX2h1Y19sb2FkX3N0YXR1cyhzdHJ1Y3QgaW50ZWxfaHVj
ICpodWMsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+ICANCj4gICNlbmRpZg0KDQo=
