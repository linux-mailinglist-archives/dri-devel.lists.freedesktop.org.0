Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1486421F79
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7F6E314;
	Tue,  5 Oct 2021 07:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCBA6E30F;
 Tue,  5 Oct 2021 07:33:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="289185411"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="289185411"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 00:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="487916633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 05 Oct 2021 00:33:28 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 5 Oct 2021 00:33:28 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 5 Oct 2021 00:33:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 5 Oct 2021 00:33:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 5 Oct 2021 00:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEJqr2jDtyudUNhwNcYT8VVH2JEX7jw7bULEEogoH06K+naqb0X+6NOpm7lXdrsTYRU72+EYYrPADEPfBldyKqRdgj3XNUKu47gweEs1HuXGN9MgbxmglfthLRGJ76437jMq30aNsHHwTFw03Mur58j6hsRTRJWCVylG0mxtbKktWtN4Gpz08u7TwmIs0iyWxHCrO/dLJtmpABhjPo8qKGAUcA5DR8UieGge5IB8+pTPuDfyhrxV3Y81BoQoVlLO5s3sneqq6+p4Ql4LXqQoptVSgzOhdnhRhSyuu599O6Kov335yu4NqLWIXXj52SL94GB/+swxg+6DVm7D3gXrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoSAK/yBlnf1eoRFZWhUh47oJB0Mij6Btpquk8bNPBI=;
 b=JNDZWL+0iSTGVAQeadhgNzPzUiBNyYF7vXQEPJRCVQ55+HlQv5Lkq6cr1nJFW8IrpoW7fw8emBsgq71U3PeL9YDNCTemL3rjp6yWVQyibN7ZIkZfU0RTAeFwqu5BbgNHNaVmC6BDGQDVcwI9tIX49ZPhLFn9sOXp/gl99E/eATacOW5YraWfsx4jf43RYjqplEFV+XnUNDwWAjqT56nOIXAGENbddFldijomPXzMb6RsWlomc/PGmYo4SgaACq/B5Vvm9q3nPNug/PtVYpjIj0vwTVlhieR23QiUjk12eB0JIgQPXJh2d+RztoA6kGKbWcjtO6LGA2IFsd+kUWmnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoSAK/yBlnf1eoRFZWhUh47oJB0Mij6Btpquk8bNPBI=;
 b=TW0XqJc0GquO6ESuhswF8ubhn20B43bLanseIBmtLUpMJ6khyyQ7PegtBdEW4ZL8Kra/p2SKrsl09eSk3fX2EMLFXs0RtiSqS2vngZeOLmItBOHUKb72KN8SkpWr+7V+f2wa5LJdEzArXaSyTrcuaCjv9TkEEFGx47hPtN0M7cA=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM5PR11MB2059.namprd11.prod.outlook.com (2603:10b6:3:8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.20; Tue, 5 Oct 2021 07:33:25 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d%3]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 07:33:25 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Greg KH
 <gregkh@linuxfoundation.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Thread-Topic: refactor the i915 GVT support
Thread-Index: AQHXfkkPR74j3PcQBUqzVfBaHB7ETatOyPlwgAATUQCAB+h0AIABoDZQgABTFICAAN/IAIAIA5SAgABQYwCAAPoZAIATp54AgAB+0YCAAEa+gIADWQiAgAHzigCAAF7DAIAIh7KAgDP1tYCAAGooAIAACYwAgAAIY4CAAcrQAIAAB/CAgALBwQCABe2dgA==
Date: Tue, 5 Oct 2021 07:33:25 +0000
Message-ID: <c8dcbdeb-f4d9-d1ef-9083-14fca094468f@intel.com>
References: <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com> <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
 <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
 <YVMgGKk1K4gO8ls6@bombadil.infradead.org>
 <af40291a-de36-b39f-9ded-aaf4ddba641f@intel.com>
 <20210928150507.GM964074@nvidia.com>
 <24c7bbec-b425-52fb-d3f9-539a0a391dfa@intel.com>
 <20210929185541.GW964074@nvidia.com>
 <0f52ab3e-f50a-041f-f37d-4d2f3febe49b@intel.com>
In-Reply-To: <0f52ab3e-f50a-041f-f37d-4d2f3febe49b@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f1cc11c-d277-4680-bb0a-08d987d26b1a
x-ms-traffictypediagnostic: DM5PR11MB2059:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB2059887F927CCF9FE36E9B30CAAF9@DM5PR11MB2059.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1Wz6XplCW3ROOT57KHLmV2yZ7jtRyTZYlG+sgK8Z11HNfRexB39r1U8IeIMflV5MCl5RBEzl7DR4xoSG0n/av73f2rudtKlmTC+GTStAQptroTBB0jTylzOMp4qpdGpt7NHVq4FXw8HiqVCg3gYy5wFB/f5ywpFlwf1bjZyc8KgLE3Udg7hzjR8D4Jj0uWOeORFity+rhLF9WvxhyrK0LrV4F5Vf5vOiY555wDGk18T2Ev39JgtMYPIdfLxNcQMOXukX80BvsZwvSWJH36oYNllYxcft04yUACNbAkHuB5gIMNRGpXTO0G/DZKZOSiZuCsmXx4m7/RU0qpCFxqu1+YOe3WS4YLykU8ViCcsdyj/KZTDXqAYmP/mVkd0BP9koCYN6ZljSiQSUl3Di0YxmY3GxyGed98ksj3uqtGp8ynxftdjk+uPXh7ooGQ6/qirjTTxNf3OlkQDCF5UZHoGfnto/bOj+wamNR4XVMj9X6p9B9O2sxZxE2GCkX4k6dKub4EYx7Rw9XScz5eZflIz4mhuaJO9TRF8E4/UdyBGzsqoHLEa7pMRUJY51423jdW9S0eyOqRdlQyX/SBBADT11Tq0BkPLhULuuDpeVfDXgUPVn8hLYAkZR9emQieDyFEvecnml+WQaBlYzjF2+sqEpwWRLlPWV8hnyM9w32PsV0W1CTPbAnjQJcrM4RfG8TodViGTBB8KkkRhSVuAODCxta+/k9GqJrLb867myEILUxCoJ2+CQXkft8A2++gGGDasM1odFyGCOdKdSqoCMP2zyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(64756008)(66556008)(66476007)(5660300002)(31686004)(66446008)(8936002)(6486002)(2616005)(76116006)(38100700002)(122000001)(8676002)(66946007)(316002)(54906003)(91956017)(6512007)(6506007)(36756003)(7416002)(86362001)(508600001)(2906002)(83380400001)(31696002)(53546011)(71200400001)(38070700005)(186003)(26005)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmhvaW4vUXVsSFZFWnhjZUVjK3gzZ1VIOFpmaW1ldE80Wk5RVFdsa3J1ckpV?=
 =?utf-8?B?TWd1Z0xSR1V2VDJLQkUxNDMyQjV2Z28xa0RNU2hnK1lHczNPVEF1djlqajZE?=
 =?utf-8?B?RVQ4RUduMFNINHUrV09EdFNxay9xNVptN2RqZm1rVWJEOFF2dm91bndzRkw4?=
 =?utf-8?B?NU14TFdDQlB3TWZ4Y2xpdExPK0krSnRSY3hJOEtySGR0Y0tJYXI3Z01ZMjdq?=
 =?utf-8?B?NEc0R2hQWGM4UkxqMU1rU3hxWUpzRGJ0Q24zU21nV09NemJ3REIvUXhTazBu?=
 =?utf-8?B?ZFNCbXA5dnJxSVFYeWJuWmJicysvS1hiUU14NFN0OFIzY1NjODhrUkVDUzVu?=
 =?utf-8?B?UjVyWDdRZkNQNFVYeGZaY1djQUdlYXlnb3Npb0l1bmFrQUV3cHlRa0VxVWF3?=
 =?utf-8?B?T0xBSVJHNndESXp0YS9xdithZitaRkkzdStZT0h1eEVNb0hMVlhoRWZvQ25y?=
 =?utf-8?B?UG1qbmpSZDVhZWQ1dmcrTDVxUGFPWjl4Q0J1N0F0YmhJYnJNQ0d0QWJZNVps?=
 =?utf-8?B?Z3B4c1FEUlN6WC9nb21wazM0UnU5Mlh1bk5iemJCcEo4dTB0aHZndUhVaXk2?=
 =?utf-8?B?dkNwYzFleGF2bTRycnR4R1lUMVVSZFFENDl4amRzM0Npdk8yRVlpd0t1TjNF?=
 =?utf-8?B?YXVUSXVzWFNNSStKUXQ0cXlxUUJaOWxjTmVlREpGYnRwZFZsT0dpQWVKQ3ZG?=
 =?utf-8?B?N2d3bDBDOFZDZVpFK1JSOGE4dXN6eCt2bDRaQzUzWFp1WlJ5MTEvMTlMQ3ZL?=
 =?utf-8?B?MFl3T01CRXZCREpCZllibWRSL1VJaW9IUlRGR21zeW0zRTNsckNtZWx3Mzda?=
 =?utf-8?B?UjZEcXdQN0VnYm9aQ0dZTzJOZzVHUFJOdkFIRG1WeG5BVGdqNVpZRkYyT3Jn?=
 =?utf-8?B?eDBPcFRHMTR2U1ArU1hpS3lEZ1JtUzBaMnlBRnNPSGFvbUdSdnhGY2lkZ1lZ?=
 =?utf-8?B?NktsVTVKMlk1Y0lRcUFvSDIxMndkOUpoaXVhd1d1RFdseEdPbiszanBDTlNu?=
 =?utf-8?B?Z1ZKTVlHVEpNNGFJS2JIOEl6WklnVGVoTVNQOVNHL00rbHRianVGZGljaGNp?=
 =?utf-8?B?QkdUV2hrMHJkd3lKL25ZVmVCdnpUcnRyZmluQmFFU2Y4dEpVT3d5V3dablNZ?=
 =?utf-8?B?aWI4MFMvclNyMnY5YVVyekxEckh5T3Y0SW96ZkR0UGMvVE5OOVFwbno3Z2lz?=
 =?utf-8?B?MHpwa2VCS2krdVBYcWI2ODEwd2N0Vm15VzU2bGRrM1dUYlZUbm1qOHZVWEx5?=
 =?utf-8?B?NnJZUkJQajVZSEhmUGcrTzJYelhZaHIyYkhzQjVOVndNTklTejQ5eE5ZRjA3?=
 =?utf-8?B?MVVTU29ON3ducjM2ZmNkSFZueklpMXhWMmkrVmZyZXJ3SDVWZ1FRdWJYcEdR?=
 =?utf-8?B?cU5GZWtIT2hBeDBENXpSTFhrWmhoOUJuNGRPeUhIWnRJM1RoN1llNW0zby9O?=
 =?utf-8?B?N0g2cGpHbWRPMk5pU2JLbnNzcS92TXQ4WTdHa21LaXo4UXlSNDkvMkx6clNC?=
 =?utf-8?B?UDBZSllhOHJqdFpvMElvSVZWMTNrYk03V3d2aDdqS0kvaWdIa0luaUc4VUZW?=
 =?utf-8?B?dk0xVEE5ckJBSnFDRUJpdkMzMHhuRzhkUndCWmNUVHU4TTREd1JrdzNvU1Zk?=
 =?utf-8?B?OU8ySnl5cE5lV01RVWRZKy9yY2dBZE02RHNaUGhEajlDb3dkcmJUSFFhWEZ0?=
 =?utf-8?B?aC90VCtHVFVFeGdUdXdRdEhZNnhiSkd6TVV0S0ZaM2VqditsQnJybStOaTZH?=
 =?utf-8?Q?it+1k3LPp1s9o4HyGRMPQKZSeMgOQuayFnmuzj9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E7E87E23B7F1A4389C9682782CE61DA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1cc11c-d277-4680-bb0a-08d987d26b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 07:33:25.8734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPRXNyn74qo52Rr7OKgmRMF6z+GcHIbbfKRPvlcinFFQk9Vw6sxpL7WJCiDaROVMHg7tAL9yv491frdhwIfrDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2059
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

SGkgZm9sa3M6DQoNCkl0IHNlZW1zIHdlIGhhdmVuJ3QgcmVhY2hlZCBhIHBvc3NpYmxlIHNvbHV0
aW9uIG9mIHRoaXMgcmVmYWN0b3IgcGF0Y2ggDQpzZXJpZXMuIFRoZSBjdXJyZW50IHBhdGNoIHNl
cmllcyBuZWVkcyB0byBiZSByZS13b3JrZWQgYmVjYXVzZSBvZiB0aGUgDQptb2R1bGUvc3ltYm9s
IGRlcGVuZGVuY3koVGhlIHJvb3QgY2F1c2UgaGFzIGJlZW4gZGlzY3Vzc2VkIGluIGFub3RoZXIg
DQplbWFpbCkuIEkgaGF2ZSB0byBnZXQgdGhlbSBvZmYgZnJvbSBvdXIgZ3Z0LW5leHQgcmVwbyBz
byB0aGF0IHdlIGNhbiANCmNvbnRpbnVlIG91ciBkZXZlbG9wbWVudCBhbmQgcHVsbC1yZXF1ZXN0
IHRvIHVwc3RyZWFtLiBUaGFua3Mgc28gbXVjaCANCmZvciB0aGUgcGF0Y2ggYW5kIHRoZSBkaXNj
dXNzaW9uLg0KDQpUaGFua3MsDQpaaGkuDQoNCk9uIDEwLzEvMjEgMTowMSBQTSwgV2FuZywgWmhp
IEEgd3JvdGU6DQo+IE9uIDkvMjkvMjEgNjo1NSBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0K
Pj4gT24gV2VkLCBTZXAgMjksIDIwMjEgYXQgMDY6Mjc6MTZQTSArMDAwMCwgV2FuZywgWmhpIEEg
d3JvdGU6DQo+Pj4gT24gOS8yOC8yMSAzOjA1IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+
Pj4+IE9uIFR1ZSwgU2VwIDI4LCAyMDIxIGF0IDAyOjM1OjA2UE0gKzAwMDAsIFdhbmcsIFpoaSBB
IHdyb3RlOg0KPj4+Pg0KPj4+Pj4gWWVzLiBJIHdhcyB0aGlua2luZyBvZiB0aGUgcG9zc2liaWxp
dHkgb2YgcHV0dGluZyBvZmYgc29tZSB3b3JrIA0KPj4+Pj4gbGF0ZXIgc28NCj4+Pj4+IHRoYXQg
d2UgZG9uJ3QgbmVlZCB0byBtYWtlIGEgbG90IG9mIGNoYW5nZXMuIEdWVC1nIG5lZWRzIHRvIHRh
a2UgYQ0KPj4+Pj4gc25hcHNob3Qgb2YgR1BVIHJlZ2lzdGVycyBhcyB0aGUgaW5pdGlhbCB2aXJ0
dWFsIHN0YXRlcyBmb3Igb3RoZXIgDQo+Pj4+PiB2R1BVcywNCj4+Pj4+IHdoaWNoIHJlcXVpcmVz
IHRoZSBpbml0aWFsaXphdGlvbiBoYXBwZW5zIGF0IGEgY2VydGFpbiBlYXJseSB0aW1lIG9mDQo+
Pj4+PiBpbml0aWFsaXphdGlvbiBvZiBpOTE1LiBJIHdhcyB0aGlua2luZyBtYXliZSB3ZSBjYW4g
dGFrZSBvdGhlciANCj4+Pj4+IHBhdGNoZXMNCj4+Pj4+IGZyb20gQ2hyaXN0b3BoIGxpa2UgImRl
LXZpcnR1YWxpemUqIiBleGNlcHQgdGhpcyBvbmUgYmVjYXVzZSANCj4+Pj4+IGN1cnJlbnRseQ0K
Pj4+Pj4gd2UgaGF2ZSB0byBtYWludGFpbiBhIFRFU1QtT05MWSBwYXRjaCBvbiBvdXIgdHJlZSB0
byBwcmV2ZW50IGk5MTUgDQo+Pj4+PiBidWlsdA0KPj4+Pj4gYXMga2VybmVsIG1vZHVsZS4NCj4+
Pj4gSG93IGFib3V0IGp1c3QgY2FwdHVyZSB0aGVzZSByZWdpc3RlcnMgaW4gdGhlIG1haW4gbW9k
dWxlL2RldmljZSBhbmQNCj4+Pj4gbm90IHRyeSBzbyBoYXJkIHRvIGlzb2xhdGUgaXQgdG8gdGhl
IGd2dCBzdHVmZj8NCj4+PiBIaSBKYXNvbjoNCj4+Pg0KPj4+IFRoYW5rcyBmb3IgdGhlIGlkZWEu
IEkgYW0gbm90IHN1cmUgaTkxNSBndXlzIHdvdWxkIHRha2UgdGhpcyBpZGVhIHNpbmNlDQo+Pj4g
dGhhdCBpdCdzIG9ubHkgZm9yIEdWVC1nLCBpOTE1IGRvZXNuJ3QgdXNlIHRoaXMgYXQgYWxsLiBX
ZSBuZWVkIHRvIHRha2UNCj4+PiBhIHNuYXBzaG90IG9mIGJvdGggUENJIGNvbmZpZ3VyYXRpb24g
c3BhY2UgYW5kIE1NSU8gcmVnaXN0ZXJzIGJlZm9yZQ0KPj4+IGk5MTUgZHJpdmVyIHN0YXJ0cyB0
byB0b3VjaCB0aGUgSFcuDQo+PiBHaXZlbiB0aGUgY29kZSBpcyBhbHJlYWR5IGxpbmtlZCBpbnRv
IGk5MTUgSSBkb24ndCBzZWUgdGhlcmUgaXMgbXVjaA0KPj4gdG8gb2JqZWN0IHRvIGhlcmUuIEl0
IGNhbiByZW1haW4gY29uZGl0aW9uYWwgb24gdGhlIGtlcm5lbCBwYXJhbWV0ZXINCj4+IGFzIHRv
ZGF5Lg0KPj4NCj4+IEFzIGEgZ2VuZXJhbCBwaGlsb3NvcGh5IHRoaXMgd291bGQgYWxsIGJlIG11
Y2ggbGVzcyBzdHJhbmdlIGlmIHRoZQ0KPj4gbWRldiAua28gaXMgdHJ1ZWx5IG9wdGlvbmFsLiBJ
dCBzaG91bGQgYmUgY2xlYW5seSBzZXBlcmF0ZSBmcm9tIGl0cw0KPj4gYmFzZSBkZXZpY2UgYW5k
IG5ldmVyIHJlcXVlc3RfbW9kdWxlJ2QuLg0KPj4NCj4+IEluIHRoaXMgY2FzZSBhdXhpbGlhcnkg
ZGV2aWNlIG1pZ2h0IGJlIGEgZ29vZCBvcHRpb24sIGhhdmUgaTkxNSBjcmVhdGUNCj4+IG9uZSBh
bmQgdGhlIG1kZXYgbW9kdWxlIGJlIGxvYWRlZCBhZ2FpbnN0IGl0Lg0KPj4NCj4+IEluIHRoZSBt
ZWFuIHRpbWUgaXMgdGhlcmUgc29tZSBzaG9ydGN1dCB0byBnZXQgdGhpcyBzZXJpZXMgdG8gbW92
ZQ0KPj4gYWhlYWQ/IElzIHBhdGNoIDQgZXNzZW50aWFsIHRvIHRoZSByZXN0IG9mIHRoZSBzZXJp
ZXM/DQo+Pg0KPj4gQSByZWFsbHkgYXdmdWwgaGFjayB3b3VsZCBiZSB0byBwdXNoIHRoZSBwY2lf
ZHJpdmVyX3JlZ2lzdGVyIGludG8gYQ0KPj4gV1Egc28gdGhhdCB0aGUgcmVxdWVzdF9tb2R1bGUg
aXMgZ3VhcmVudGVlZCB0byBub3QgYmUgcGFydCBvZiB0aGUNCj4+IG1vZHVsZV9pbml0IGNhbGxj
aGFpbi4NCj4NCj4gSGkgSmFzb24gYW5kIGZvbGtzOg0KPg0KPiBUaGFua3Mgc28gbXVjaCBmb3Ig
dGhlIGlkZWFzLiBUaGF0IHNvdW5kcyBncmVhdCBhbmQgSSB3YXMga2VlcGluZyANCj4gdGhpbmtp
bmcgaG93IHRvIG1ha2UgcHJvZ3Jlc3Mgb24gdGhpcy4gSG93IGFib3V0IHdlIGRvIGxpa2UgdGhp
czogV2UgDQo+IGRvbid0IGRvIHJlcXVlc3RfbW9kdWxlKCJrdm1ndCIpIGluIGk5MTUua28sIHdo
aWNoIHJlc29sdmVzIHRoZSANCj4gY2lyY3VsYXIgbW9kdWxlIGRlcGVuZGVuY3kuIFdlIGtlZXAg
dGhlIGNvZGUgb2YgZG9pbmcgc25hcHNob3Qgb2YgDQo+IHJlZ2lzdGVycyBpbiBpbnRlbF9ndnQu
Yy4gV2hlbiBpOTE1LmVuYWJsZV9ndnQ9MSwgd2UgZG8gdGhlIHNuYXBzaG90LiANCj4gVGhlbiB3
ZSBleHBvcnQgZnVuY3Rpb25zIGZvciBrdm1ndC5rbyBpbiBpbnRlbF9ndnQuYyB0byBjaGVjayBp
ZiBndnQgDQo+IGluIGk5MTUgaXMgZW5hYmxlZCBvciBub3QgYW5kIGdldCB0aGUgc25hcHNob3Rz
Lg0KPg0KPiBIb3cgZG9lcyB0aGF0IHNvdW5kcz8gSSBqdXN0IG5lZWQgdG8gd3JpdGUgYW5vdGhl
ciBwYXRjaCBhbmQgcHV0IGl0IG9uIA0KPiB0b3Agb2YgQ2hyaXN0b3BoJ3Mgc2VyaWVzLg0KPg0K
PiBUaGFua3MsDQo+DQo+IFpoaS4NCj4NCj4+PiBBbHNvIEkgd2FzIHRoaW5raW5nIGlmIG1vdmlu
ZyBndnQgaW50byBrdm1ndC5rbyBpcyB0aGUgcmlnaHQgZGlyZWN0aW9uLg0KPj4+IEl0IHNlZW1z
IHRoZSBtb2R1bGUgbG9hZGluZyBzeXN0ZW0gaW4ga2VybmVsIGlzIG5vdCBkZXNpZ25lZCBmb3Ig
DQo+Pj4gIm1vZHVsZQ0KPj4+IEEgbG9hZGluZyBtb2R1bGUgQiwgd2hpY2ggbmVlZHMgc3ltYm9s
cyBmcm9tIG1vZHVsZSBBLCBpbiB0aGUNCj4+PiBpbml0aWFsaXphdGlvbiBwYXRoIG9mIG1vZHVs
ZSBBIi4NCj4+IE9mIGNvdXJzZSBub3QsIHRoYXQgaXMgYSBjaXJjdWxhciBtb2R1bGUgZGVwZW5k
ZW5jeSwgaXQgc2hvdWxkIG5vdCBiZQ0KPj4gdGhhdCB3YXkuIFRoZSBTVyBsYXllcnMgbmVlZCB0
byBiZSBjbGVhbiBhbmQgb3JkZXJseSAtIG1lYW5pbmcgdGhlDQo+PiBpOTE1IG1vZHVsZSBuZWVk
cyB0byBoYXZlIHRoZSBtaW5pbWFsIGFtb3VudCBvZiBjb2RlIHRvIHN1cHBvcnQgdGhlDQo+PiBt
ZGV2IG1vZHVsZS4NCj4+DQo+PiBKYXNvbg0KPg0KPg0KDQo=
