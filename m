Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051FA6A16BA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 07:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9587510E09F;
	Fri, 24 Feb 2023 06:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061CE10E081;
 Fri, 24 Feb 2023 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677221160; x=1708757160;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=1/c+z2zpQ2pMKUmZqNBxLk+ai57o+g234KX5LLiyako=;
 b=JKTdewUoRHu1secsNcp8wG23JqpT9OSnNc9iHDKQ38nT61kfX+mOfMF+
 KVC9QR6yxw/0DHshHcDTaurXMbv3E5TyzsMP0fzKRZCpLrijVN2M0FAGs
 4raj4MDpCVfF4ajTEFiEFvTbU+chntjVa3+GWwtSryK6V3RKo2+Q+PCWG
 ARINczQDQKycBIBpgeUu9pklw0tyddYcRoVnoiY7gRrDFfnzX2tK2XGhM
 5q47UGlZABzp9SqHZqa5ejCwdFWt/YPCeARwEtki2hZhgI/3cOBa+YfVE
 X7uguq2ssuWPRSXOUSz6AUYxlRZ9Da3pL/lr5gNzbqEMNqskA8L1bnqYS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360914807"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360914807"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 22:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="705166135"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="705166135"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 23 Feb 2023 22:45:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 22:45:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 22:45:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 22:45:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoJCuLdJdjJkJrR/QqpafMh0414U0ydIZPUcqmKR5HzhhKY6KFo2Xb8yUgvOmxzhBJQQC5DCMK9Yr/AmynV5Yth3vG5W3q8uiAoLfV16ApWKOg5GN8n+nM1Pvtv8dyS9MhnjAev6KkZwKMhlk09VksjOrsvxycxyP3OSTn7kUMIU84B0BqVTD5+4B34IyfuUFv7Iyejl2iSsziOtFtSo+u8YtCX+vuSmSybHP6k8eNdd5wwARx0+SAaDRxua6ShaRzkBSH/4TlARxddVuNjtJMYI204svvFtdwI4n6YKluO2xp+rlQ/D7UF7GtmCd6rjf5B+vSfgxc3zvCAXs/BU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/c+z2zpQ2pMKUmZqNBxLk+ai57o+g234KX5LLiyako=;
 b=hVKxLSgPxepej7PQTjyyJs+UmlBkqA3CHk0FCPQOgGdTv8r39xcP8P1zh1wglj7IC9hD8VbZY4anpL0tXwETwxPHLDiLbvbr5M/nOGuYlF2go6YSt6XBfhsbqVF73zyVUUq22+a1WwhXkiip4iLSX74cgO+rXfAYo9jeT5iTNE3WoQjSJsHb+/l+SeQacDARhtbO+s7Qv0txietcmLG1BER3qaVAxJ2E2qwYAAoAScBOUG28oDy9Ens3B6LIvTWQGRwO5+g0v2n349ij3vfgP4+ptHTLbfZ9R1ZJsBBrJt+54oooIUODHoxaorypD60Ho70WiyENmZkq5Zs9RAxITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ1PR11MB6250.namprd11.prod.outlook.com (2603:10b6:a03:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 06:45:54 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569%6]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 06:45:54 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "Santa Cruz, Diego"
 <Diego.SantaCruz@spinetix.com>, "wse@tuxedocomputers.com"
 <wse@tuxedocomputers.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Kahola, 
 Mika" <mika.kahola@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 0/2] Add quirk to disable PSR 2 on Tongfang PHxTxX1 and
 PHxTQx1
Thread-Topic: [PATCH 0/2] Add quirk to disable PSR 2 on Tongfang PHxTxX1 and
 PHxTQx1
Thread-Index: AQHZRsiGwvLWWDCoJkWpIPlEmnkqqq7c2wiAgAAIZQCAAAHiAIAAxGUA
Date: Fri, 24 Feb 2023 06:45:53 +0000
Message-ID: <940ff4ecb66fe43d5f267f317b1e84ac18aafb94.camel@intel.com>
References: <20230222141755.1060162-1-wse@tuxedocomputers.com>
 <9b0e29f15f3e8799256c425f06b36a70ec04522f.camel@intel.com>
 <52f48cb2-ce54-854f-3bec-44c40c6ad07f@tuxedocomputers.com>
 <edafaf88-cf58-8cc0-8466-aa14794e8673@tuxedocomputers.com>
In-Reply-To: <edafaf88-cf58-8cc0-8466-aa14794e8673@tuxedocomputers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ1PR11MB6250:EE_
x-ms-office365-filtering-correlation-id: 8909e141-77a5-46f3-32f4-08db1632c69a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WpjQFzZ713RIyRasgppb+4lfOSN3QMKsqaznFJNCydpI3uDld/AEO1d+b5OiEBmjPf3yFdx4JHRadRkpBujsVuwItJ2gMXPDv8dIl34GQDDfbHKtGf8PAHIEpr/Cbc/MvX8TfsTUwLPMPVXfTHWUB6bqgTPRZDAQ+Yfd9TEt8UvJaVSXs7WyjY80eon+R+Zoq8yA9NFyWjTuLaPgGKQ3e0hwldDmzGdhBOoONGRn+ykeOcn4HQmoXWTuNFgrnkpsv1v4tCemUGuFJtBObg/gxMFgVcquXhNfmozH9oElzEwxCAyDBldI7dBj/qbu9J2g2uDvecOLXGm5WZAxS02MyzFCFSMk9g7p2iA9l4HjcbmnSMozrF3OhEOt+pQ41R7Wr+EBKYA5onWYm3vKnM+Jq61alHXSZWkT4fOVFK3+myAaivZAnLKbqccVQpF748cKv2KnN2OtQq1wIzIbMH1cLOtY2x1FNoBirVoVjLbXrJ8mK04257d3MyImRGs3M9KXrAfpqLagykj+Pplj6rKmUbVq0qD0r5FFLkV/zPJAaiStS6KooiCWj9kF6tx/yBn52b9EjEd0luU1BTIUr3x9bZ/Ox44FZUBwlVD0S9IDb03OpwsaJMLjAv0mjknbzsKHiQKpBPg1DOczn6lAGz+VvqmiTKPiqReRNjp2KGq/nQ4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(6029001)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(921005)(38070700005)(83380400001)(82960400001)(38100700002)(5660300002)(122000001)(86362001)(36756003)(2906002)(41300700001)(8936002)(7416002)(2616005)(186003)(26005)(6512007)(6506007)(6636002)(110136005)(316002)(91956017)(66446008)(66476007)(66946007)(6486002)(966005)(66556008)(76116006)(478600001)(71200400001)(8676002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czRzbE9uQWFJc0FadVdBSWo3bGh3Vk5vZ1ZSNUYzb0h0TUNZTnE3S2JJNXB2?=
 =?utf-8?B?U3pUN1E3QXlHdEZ1T21YY0RJRGI2RHdkbXhTbTNjVFZWWnIzMGRkeXVJRzlM?=
 =?utf-8?B?TmJwNzQxQWViZ3BZSFQ0ejlGRTdLQ2hGczU2VDB1QTVVaDhVaDRXeE5aWHRy?=
 =?utf-8?B?ZDVhRG1lTUQrMmsxWmpPcWw0Mkp6TFVhR0x5U0IraTA2Z3VyUUtORjR1cWtv?=
 =?utf-8?B?cXNhQkRGSnUyNnVkS2wySkd0T041OGJRQTc1OURZYjlRdWVyUXdLZjdTT2FT?=
 =?utf-8?B?aFN0MjllZEt3MUFpKzF1Sm5KOUZHWVhKTHM0Vm9uNU5QL3Z3VEk2M2lJaStu?=
 =?utf-8?B?NUhIK3gyc2RxZmM5NTA4RU9oOEVweHJrMFdWT1FiZFRDYzVETk9OaDlpQm1C?=
 =?utf-8?B?REM1MmdOZlpZMi9wTEpNRFZtcEJOY3dpc3gwcGYwbVRKbVVrdDFMeTF2WHdT?=
 =?utf-8?B?K2JoTDVOdkYwbDRHeFhmRDhONkxKSStlTVgrRWl5WXZKOSsxM3FkUzdvK3Ir?=
 =?utf-8?B?aWs5c1FkQzFoSHc1akhBdHhHNGRSSzVDT3hDWjk1RFhSR2kwVWtQMXBxOHd2?=
 =?utf-8?B?cmo4RmtSRFZ3b2VBVlFtVFRZRWh1RHV1NDY3WXVtd09ocGtXOWRBTDNjcXRz?=
 =?utf-8?B?ZERMSTNZajVRamdidU9QQlc4SUY5NXhsNVR4by9PVXBFeUhxWEo2dEdTSWRU?=
 =?utf-8?B?SGdZcnltbWRmZHhpVEQ4SGpxakYyUXdqR3JRZjZWLytWM1NxQ0hqM3RHd2Ex?=
 =?utf-8?B?K3VyVmVONklINm5ZdnVLRng0VjNMcmx2QXZiS1djaGVEQlBsTW9QVDV3VnhX?=
 =?utf-8?B?ajNMUElXYUNBZmVpalBmRDZKMVlzZWtJK3g5NmdKb25EbTNzWkNqSzNTZnFO?=
 =?utf-8?B?Q0RTV1NzYkkyL1N2Zk5mb1FGb0JIdEUvUHA1Kytoc3NFYXhRTVl0clpQaExi?=
 =?utf-8?B?azloSlpDRFlCeGxLMjNWdnpZeTc5YnlDbE1sbDRjVy9uUTRqTnE1L2tEcFFv?=
 =?utf-8?B?aU1YY2tVRDZjMWswMU54c2p6MWtKcjRVdjJPSTBlTklYazlHakhoMzlSMXpL?=
 =?utf-8?B?SXdZVWlKeTRqVFdsM1dna3l0Tnl2UjUvelFOM3lvVWpDMForMWZiTExhWFp5?=
 =?utf-8?B?V3hKbnNYSzNkdkMrNmFwNnRHZVlsejRqZS90NHIxMUhyNGI4WGlhdjRLTWNM?=
 =?utf-8?B?RzI4cWd1cjc3dTlzeHhtQU1SYXpQNHp1SkVPbUFseExHSEZlZUZFK2xJd0Fs?=
 =?utf-8?B?d1NrQ2tKWU9kYkNLWjFGZU1UU09XOHJJeGRNNVoyRkMxbHdSU0NaN0ZBSHhn?=
 =?utf-8?B?MWoybW9ocFgyeHFBL0VIZ0liNXRMQ1ZablYwZ21nZWl3MDAvK2s4cmxucW1o?=
 =?utf-8?B?QzlJZFl6RHIzcCs1QXlYeEp6ZHk4L3p3V29aQmVuQXpZU3IyNURsUTVyN3Ev?=
 =?utf-8?B?bVZITVNobVVNUGFJQ09rN1hHb2JSSS9abTNaeFowMHg2L3NZd3VtWWI3Wlor?=
 =?utf-8?B?KzAvQ0pLQUhzRHc0ZTZZdU44TktUcks5OFhMdFp0Z3lpZmtmSWZHay80eU5W?=
 =?utf-8?B?ZU9Kb005dEZUdUEwTk0zNG5TK29CMFYvaGozVFNSY0N0RG9wUUIrdVFQd25u?=
 =?utf-8?B?b0VReW5IU0tCOU4wSGJCOTBGZzlVY2JmSktqQjNSY05ZaUptNjk4QjNxeEVX?=
 =?utf-8?B?QzIxVyszVURXM3BSM1pmTk10eTFKTHVRY2lHazZOUlVnRTkzNFphWXEwS3Vo?=
 =?utf-8?B?c3JLeDJ1TlB6UkE2SnVwWGJnclM3MUxrUG1xbzN1TU9mdDVtZzd0SWF5SWhy?=
 =?utf-8?B?UkJNOW8xL0doL0k0Zm42UWl3RFNmOXdGSXhVY0RTMnBjWGxMbXBMTW1FMzdp?=
 =?utf-8?B?WjRISnFUQU1XOGxRclliVGZDR1RSRGtLaEw1OFRTRzErZGlvVGI0ME1MUWJs?=
 =?utf-8?B?OHhYTDhDdDBQQUQvZHFkRTB4WmhqWnRBL05ubXJjK095bTRVR2xwbThLL0Ur?=
 =?utf-8?B?NjIzUDlVWExDSEUrREJrRllrWDdpTkxDMVpXSWlJWCtqMG5HQ2FMcXJUMWtU?=
 =?utf-8?B?OUxxVkY2V3ExVTQxWm15V2d6OWczMzdwb3poMWNxR01BZnNKd1pmTFg4Q1lG?=
 =?utf-8?B?ZXVpUE1QcCtnMVg0RHJPMkd5SDZvenk4U1pORytnT2tqcFJ2ckFvZndaLy9m?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <681DCB55524A6E4EB359B03CC886FA4D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8909e141-77a5-46f3-32f4-08db1632c69a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 06:45:53.8743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vILRsU67hc2T5mHani/EIgZs20zfil2MWe2kv4UnAV7BeEc/MwtsmxbNSh8fLAmar7XUN7fNztATRiVgeoE5Hz/fuxFJF8C1NAbIyktKTxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6250
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

T24gVGh1LCAyMDIzLTAyLTIzIGF0IDIwOjAyICswMTAwLCBXZXJuZXIgU2VtYmFjaCB3cm90ZToN
Cj4gDQo+IEFtIDIzLjAyLjIzIHVtIDE5OjU2IHNjaHJpZWIgV2VybmVyIFNlbWJhY2g6DQo+ID4g
DQo+ID4gQW0gMjMuMDIuMjMgdW0gMTk6MjYgc2NocmllYiBIb2dhbmRlciwgSm91bmk6DQo+ID4g
PiBPbiBXZWQsIDIwMjMtMDItMjIgYXQgMTU6MTcgKzAxMDAsIFdlcm5lciBTZW1iYWNoIHdyb3Rl
Og0KPiA+ID4gPiBPbiB0aGVzZSBCYXJlYm9uZXMgUFNSIDIgaXMgcmVjb2duaXplZCBhcyBzdXBw
b3J0ZWQgYnV0IGlzIHZlcnkNCj4gPiA+ID4gYnVnZ3k6DQo+ID4gPiA+IC0gVXBwZXIgdGhpcmQg
b2Ygc2NyZWVuIGRvZXMgc29tZXRpbWVzIG5vdCB1cGRhdGVkLCByZXN1bHRpbmcNCj4gPiA+ID4g
aW4NCj4gPiA+ID4gZGlzYXBwZWFyaW5nIGN1cnNvcnMgb3IgZ2hvc3RzIG9mIGFscmVhZHkgY2xv
c2VkIFdpbmRvd3Mgc2F5aW5nDQo+ID4gPiA+IGJlaGluZC4NCj4gPiA+ID4gLSBBcHByb3hpbWF0
ZWx5IDQwIHB4IGZyb20gdGhlIGJvdHRvbSBlZGdlIGEgMyBwaXhlbCB3aWRlIHN0cmlwDQo+ID4g
PiA+IG9mDQo+ID4gPiA+IHJhbmRvbWx5DQo+ID4gPiA+IGNvbG9yZWQgcGl4ZWxzIGlzIGZsaWNr
ZXJpbmcuDQo+ID4gPiA+IA0KPiA+ID4gPiBQU1IgMSBpcyB3b3JraW5nIGZpbmUgaG93ZXZlci4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgcGF0Y2hzZXQgaW50cm9kdWNlcyBhIG5ldyBxdWlyayB0
byBkaXNhYmxlIFBTUiAyDQo+ID4gPiA+IHNwZWNpZmljYWxseSBvbg0KPiA+ID4gPiBrbm93bg0K
PiA+ID4gPiBidWdneSBkZXZpY2VzIGFuZCBhcHBsaWVzIGl0IHRvIHRoZSBUb25nZmFuZyBQSHhU
eFgxIGFuZA0KPiA+ID4gPiBQSHhUUXgxDQo+ID4gPiA+IGJhcmVib25lcy4NCj4gPiA+IEkndmUg
YmVlbiB0aGlua2luZyBzb21ldGhpbmcgc2ltaWxhciBhcyB0aGVyZSBpcyBzdGlsbCBhdCBsZWFz
dA0KPiA+ID4gb25lDQo+ID4gPiBpc3N1ZSB3aGljaCBzZWVtcyB0byBiZSBsaWtlIHBhbmVsIHNp
ZGUgaXNzdWU6DQo+ID4gPiANCj4gPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9k
cm0vaW50ZWwvLS9pc3N1ZXMvNzgzNg0KPiA+ID4gDQo+ID4gPiBEaWQgeW91IGNvbnNpZGVyZWQg
ZHBjZF9xdWlya19saXN0IGluDQo+ID4gPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
Pw0KPiA+ID4gDQo+ID4gPiBJJ20gbm90IHN1cmUgd2hpY2ggb25lIGlzIG1vcmUgY29ycmVjdCB0
aG91Z2guLi4NCj4gPiBJbWhvLCBzaW5jZSB0aGUgcHJvcGVyIGZpeCBsaWVzIHdpdGhpbiB0aGUg
SW50ZWwgZHJpdmVyIHRoZSBxdWlyaw0KPiA+IHNob3VsZCBhbHNvIA0KPiA+IGxpZSB3aXRoaW4g
dGhlIEludGVsIGRyaXZlciwgYmVjYXVzZSBldmVuIGlmIHRoZSBwYW5lbCBoYXMgdGhlIHNhbWUN
Cj4gPiBwcm9ibGVtIA0KPiA+IGNvbWJpbmVkIHdpdGggYW4gQU1EIG9yIE5WSURJQSBjYXJkIHRo
ZSBwcm9wZXIgZml4IGZvciB0aGVtIHdpbGwNCj4gPiBtb3N0IGxpa2VseSANCj4gPiBiZSBsYW5k
IGluIHRoZSBzYW1lIGtlcm5lbCB2ZXJzaW9uLiBTbyB0aGVyZSBjb3VsZCBiZSBhIHBlcmlvZA0K
PiA+IHdoZXJlIHlvdSBubyANCj4gPiBsb25nZXIgd2FudCB0aGUgcXVpcmsgZm9yIGRldmljZXMg
Y29tYmluaW5nIHRoZSBwYW5lbCB3aXRoIGFuIEludGVsDQo+ID4gZ3B1IGJ1dCANCj4gPiBzdGls
bCB3aXRoIGFuIEFNRCBHUFUgb3IgdmljZSB2ZXJzYS4NCj4gKnRoZSBwcm9wZXIgZml4IGZvciB0
aGVtIHdpbGwgbW9zdCBsaWtlbHkgbm90IGJlIGluIHRoZSBzYW1lIGtlcm5lbA0KPiB2ZXJzaW9u
Lg0KDQpZZWFoLCB5b3UgYXJlIHJpZ2h0IGhlcmUuIExldCdzIHRhcmdldCBmaXhpbmcgcm9vdGNh
dXNlIGZvciB5b3VyIHNldHVwLg0KRmlyc3QgcGF0Y2ggZnJvbSB5b3VyIHNldCBjb3VsZCBiZSBh
bnl3YXlzIHVzZWQgZm9yIGlzc3VlIG1lbnRpb25lZA0KYWJvdmUuDQoNCj4gPiA+IA0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBXZXJuZXIgU2VtYmFjaCA8d3NlQHR1eGVkb2NvbXB1dGVycy5jb20+
DQo+ID4gPiA+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4NCj4gPiA+ID4gDQo+ID4gPiA+
IA0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQo=
