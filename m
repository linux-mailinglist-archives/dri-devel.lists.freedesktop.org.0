Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E0780FF9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 18:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A059F10E098;
	Fri, 18 Aug 2023 16:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2F310E00E;
 Fri, 18 Aug 2023 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692375117; x=1723911117;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y0aDDLePhzrujrIQHF+5liv6ZICuAoa2cbjiNqSiLts=;
 b=NQGTtX4HL25HsUJi50H4AdaGUrx613KuifoPAmhcGpFkjUaA86Os0T+3
 4sz1F3nqXubIpO0iKAiiitBjhz4QLdUlrb9ezmxdKn3gfSNDKdXLGnaml
 Quq/1l6OkIN6/Kru6PVOLk/dCp3xHlTh0PUc4gMsDGgv2y9vCuCCcV8fe
 HzMuSKfEE/t4RFH15QuoQpHkqsp/N6Tw7znFOvJL8K/HotEzhAgyPSBoW
 u/rLMEQv1wtwN1np/mbDYNYqdBR4BMFSCqK5RvT5dxcDmEml5mJ/6QCuU
 Ii1vBVBulxcIteHLyLTd6DExqG88r4SxNYdnRC6zT4owoF8BPH32dSN+7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="437044566"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="437044566"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 09:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="800519062"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="800519062"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2023 09:10:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 09:10:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 09:10:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 09:10:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 09:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTcHwh4mcnnUcfiXkx7QA75MV4ndKGMPIkToROWOVRvFJ81ELgXfcWR4DCeuLuITjfKScPo5kfCYn6Qb306t3RZ1zrlLEA0Twzdqn1JsZ0lFN8KMNucSrb8OZmeb7qWYcyCnrEdKXDZqH2OtR0apf4hlJewvKAPx0bOVn/zQz49ZXYbb4S/3Qx4CqYKCN4uk2qikk1hzGqtHEaeSXF9IYpkaW2Oy1bdqNgaLvms7Dc3w9KTRSogp3NFUYTcY/9cYKDCjEJwRN+e1OeTWOiQnW4EcgpM2uvFNCl1e2LKZqMeTeogoHlxX2V2UbDOrUQZBgECrNYYyKWwH/SMTnlzltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0aDDLePhzrujrIQHF+5liv6ZICuAoa2cbjiNqSiLts=;
 b=bG+4VLrbWlsGrf4sjgaI1tbvFj2kJ4rreiYpsFZxZNbaxAwAy7WC60OOqX2SCNXbyb72nVIUooOBG4hPfBT9rhBjSrbwWcxPGfdwwARvJKsMOqAbtXTEdaQzn1L9fgeMsNnOMDv5fWJMBe/9NXf1Rdh11Km8qFnwhMMAmRm8ytio1myveRexfYR8K52e2o2F6PAodFT7kSSyt6Osp1GfVuTSUjxpGMIpUpzHmrEHSMjt1UvhDLczf/Yv8UuAA6931wQmwz4AIVqFLT6rbsC4Sv7iT3jMocWq/6C/M/ySHkjqHuAi26iyuAk58dTGoq+P4wvjvJvKevCcIBsG6H4oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 16:10:32 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 16:10:32 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8AAlN1TAAAO9foAACdAN4AAGjR0AABKlsyAADoTWgAAB+b6AAAYiLxAAPnhUgAARWKhQ
Date: Fri, 18 Aug 2023 16:10:32 +0000
Message-ID: <SA1PR11MB6991C5F03C7F2850FE6ACF4B921BA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7e655c2b-211f-6ea0-9dc1-feb0131a90e4@linux.intel.com>
In-Reply-To: <7e655c2b-211f-6ea0-9dc1-feb0131a90e4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS0PR11MB6446:EE_
x-ms-office365-filtering-correlation-id: 2fef6fbb-267b-4701-5fa9-08dba005a5f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SFAKAkgEMot8N9QnmlJDgUUceBcAKVLlaMr39nKfH/8VBkLufqEmo8uOJnDFdhgd8B/his2e7JOVeXgaDZoAbaxoPTnlV0QchaOcBAiAol4TFEZsjTZ5OeFkVAOO2jqdoZgyDTCIFjMW8ZT/spHhvAQTQ3I9DOZ2tXHsg11FGnKTEpgmNA1mL9aR1Ij54UHcvVhUMc1vgTZw+kD9jwL2u879CSAvAg5jgbblL0kieG13wBRlkrC3Gg/vr/FWUz2dmZbAbpbuufjE1f5/15emOBaQCyJM5zf+RE/FgYjfR2XeQYeUj85eu4QoL/6xkfvsJ/atlOtc0O7dIgviFpFOz68EYd5jJbnpGp1B7rEOBDIuz3yrc7rYdGiMIWveOEAqiGqKHxnJUWmf0D0j8X28ovC37ZLSHUntYQEfbZJsvnk1bymOjlqaGSYmoxaqgnFltS+fXbmQcsfvL6pBGHTeN9ooc04L9nVW49vNaIjKYJA051OAuYNJF+LrqgncfUrVQA0iuoU/C0ZnO36Zen+c//vdUpGzNTpHd8Ykp2VySllNJoQnjM1LDBSn7cYDwsQ0Gtxj/Uf3Epo+blDymieDgUwF6aczQzDTclgSE0CSUiS0dhBRyvY7J1UknVmxNbmP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(110136005)(76116006)(5660300002)(33656002)(41300700001)(2906002)(66476007)(66446008)(66556008)(316002)(66946007)(64756008)(54906003)(8676002)(4326008)(8936002)(52536014)(478600001)(86362001)(82960400001)(71200400001)(53546011)(38070700005)(9686003)(38100700002)(6506007)(7696005)(122000001)(66574015)(83380400001)(26005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDBwTEtKSXdtODAxVEZEOFVXcnFKbGgyTkYvSUZTRmNhVHV5bzk3d3ZuWGNQ?=
 =?utf-8?B?enh5U3o4dmVtODlUSVZ4K0cvaTlmNU1vVlRtMGtVYmtSdkV6SkdZdlFqcTho?=
 =?utf-8?B?eXhHM2d3Zy9qalN0dVptckwxeGpVc1J6YlZ3aXR1NTRubzZFVWpBcUhEcjZ5?=
 =?utf-8?B?R0tSRGtQZW5JZ2g4dG0xRHJyaFJjdFNHSHZSbUNFeHFPRVQwczIzeXB2OWNT?=
 =?utf-8?B?ZnBqNnUrU2libUdSNk1LRWFTcFRKM05NTC9TbXhTTU10eCs4UTZRbjROMnlT?=
 =?utf-8?B?SDk5V3dERzF6S3A2eWtnMkdzaHBMN2d1RUdlZTBUMUhQd1FvOXRCaFdnRCtX?=
 =?utf-8?B?TWs0VW9aSEtkdTc4Y3Qvb1BMaXIxakNQTS9Hd3Rxc3RjenFtMnU0S3kyd0NX?=
 =?utf-8?B?bkgwcHNGRFpyeEx4Zi8vbCtNUWpoWFdqMmJYTHpzak0rSEhFa2Jia0pZdDZT?=
 =?utf-8?B?YXF2amlGR0hTV2c4bXlUWmZacUMvbm9hSk8rQUs1NHkzYkVpRUxIRTBFVjZT?=
 =?utf-8?B?eksrQlNKZ0N5Z3VJY01PbnZ1ZkU4ZTF2TSs2NDdWOG5zaGliY1VieDQzSVZp?=
 =?utf-8?B?QWtmbFVXSlhRc0xMSzJxY1FTU1ZWK3lHbnVacWVSNXlGSktXMENqZHpzZDdI?=
 =?utf-8?B?SXFSWGdFS0tiSC90VzJzRGwvcjRGUG83ZzlZOHdiVnVSanRDancrTWFFSVNV?=
 =?utf-8?B?NWlvSVVJT01KbS9uVU00MmR6Qkk5N3V4amJXV05sMGJjT1VvNUZQSVQwOUJ1?=
 =?utf-8?B?TWRYY3JvbVRSa2xYekhmN2ZmeGVoaVNyczdxVnV0blNFcjBQeWRkOFNCY3ZJ?=
 =?utf-8?B?anozc3k2VEpFRDdGRVl5d3l5bEE0bFlzZWVUcTAvOUdjUHRKdnZiUS9vU0dN?=
 =?utf-8?B?eUtsbmRBNXlGRk9adUxyVDVueUQvTXQ1M0VsbHk4WkVSNnU3V1BEd3dLUEM2?=
 =?utf-8?B?Ym8yZDc5cjRtMGNwUDFtV2dPTUNTcm5PbnAwZzczNU1udFJ5NkF4a2xlSDI2?=
 =?utf-8?B?NGZXR1NpVVpGNVFBTEpGeHY3K0g5VDcyNktvMWtvRU1oVWdzcGFiZDB3ZVNi?=
 =?utf-8?B?bmdoK29GaERjbHR2eHpORklZQXRZVXhwdVo2REs3WGZQcXdydHJkd2Z4TFhD?=
 =?utf-8?B?QW5FampJUlJXVlpjZjlEYnBDalBPSkU5WjJLd1dCck8yN1Z0Zk5INS9RSjZS?=
 =?utf-8?B?SU80eW05MW9tbm01VDlORU5jY2pQbndsYWJMVXAzQjFZdWZwN05rQlBSeUE1?=
 =?utf-8?B?Q2Y0V2N4K1F6RTFML09VQW8rRGRBRExTeDIvV3V4UUJ0NnNSanNmMnh4WWZD?=
 =?utf-8?B?eGNYWUZQRnFMM28xS3g1RzE2SUVVNVVkdmQ2RENUMmJranNDRktMY1gvbzlV?=
 =?utf-8?B?RC94c3Fvd0xWOWYvS00yL3BpNWhhUEloUDhtQ1MzTFFScS9UNWlXT0g5WDVq?=
 =?utf-8?B?b2hCVHB6QzRoSUt2WXAySWdoaG9VMkVxYUNYdnNycGx2NHR2eVpiNS9aQk81?=
 =?utf-8?B?RSsxOUlJQWJQL0dWa0hzNzdodVBmcjF1cjlaMWZ1Sld1S1NNbGlvUnRBMmhV?=
 =?utf-8?B?RjFFYlZlM2V6UUYrWmN6WjlKTTExbGppWDBHLzhrMENQVnNqaVFpc0VIeGVy?=
 =?utf-8?B?U3BHZHZoSE1kUGNyMnFmMno1U1k1NFNYbkllMysybFNwbmdxd0FFSC95dkoz?=
 =?utf-8?B?R29OSFhsaFc0dEViU1NzQkdHdGR6NzZkTHp6ZDByTWpZYVZBeU1md1ViUnBQ?=
 =?utf-8?B?Vm9MUGFDWGlXWWJGNmh3NWN6Tmxzd0tSWndIRWwrYldSYmZuVkpjNUo1aWZy?=
 =?utf-8?B?RHlVS0pKOTQxSnBTZWJ2M3BrWUZnNVlpYko2dzNnYmdNV09LZDBweUJNWS8w?=
 =?utf-8?B?Nk1DTnhyMHJac0x5UG5wNjRkUzhzbWdoVk1aLyt3bkwwL2VYMEw1VlhwMlda?=
 =?utf-8?B?RysxNDFXM1BIQ2lWYW1HQTVKTmdTRDUxaXN2dWxSbVRpam9aa0pXSHdXR0Z1?=
 =?utf-8?B?WExKS0J0Q0VZL3JxSEhVMmk5MVphTEZIZGFmQkR6QzJYNTV2bWFuSTM0TFor?=
 =?utf-8?B?N2lwQlhEYmFzaTlSN0tpUnRKWGc5UjFLc0wxUzAzRzlaeGQvMHduTUZKaHU4?=
 =?utf-8?Q?cyLY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fef6fbb-267b-4701-5fa9-08dba005a5f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 16:10:32.1761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STFYgHKhpfgyKnxJKgT+eC7zY+ncghQny48aRGG2LZasJDR39T9ZnvDNu7ickrFN/FK5PzT9K/UVcvJyvJdwAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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
Cc: "Brost,
 Matthew" <matthew.brost@intel.com>, Philip Yang <Philip.Yang@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIFRob21hcy4gSSB3aWxsIHRoZW4gbG9vayBpbnRvIG1vcmUgZGV0YWlscyBvZiBvcHRp
b24gMzoNCg0KICAgKiBjcmVhdGUgYSBsZWFuIGRybSBsYXllciB2cmFtIG1hbmFnZXIsIGEgY2Vu
dHJhbCBjb250cm9sIHBsYWNlIGZvciB2cmFtIGV2aWN0aW9uIGFuZCBjZ3JvdXAgYWNjb3VudGlu
Zy4gU2luZ2xlIExSVSBmb3IgZXZpY3Rpb24gZmFpcm5lc3MuDQogICAqIHByZXR0eSBtdWNoIG1v
dmUgdGhlIGN1cnJlbnQgdHRtX3Jlc291cmNlIGV2aWN0aW9uL2Nncm91cHMgbG9naWMgdG8gZHJt
IGxheWVyDQogICAqIHRoZSBldmljdGlvbi9hbGxvY2F0aW9uIGdyYW51bGFyaXR5IHNob3VsZCBi
ZSBmbGV4aWJsZSBzbyBzdm0gY2FuIGRvIDJNIHdoaWxlIHR0bSBjYW4gZG8gYXJiaXRyYXJ5IHNp
emUNCiAgICogYm90aCB0dG1fcmVzb3VyY2UgYW5kIHN2bSBjb2RlIHNob3VsZCBjYWxsIHRoZSBu
ZXcgZHJtX3ZyYW1fbWFuYWdlciBmb3IgZXZpY3Rpb24vYWNjb3VudGluZw0KDQpJIHdpbGwgY29t
ZSBiYWNrIHdpdGggc29tZSBSRkMgcHJvb2Ygb2YgY29uY2VwdCBjb2RlcyBsYXRlci4NCg0KQ2hl
ZXJzLA0KT2FrDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFz
IEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBB
dWd1c3QgMTgsIDIwMjMgMzozNiBBTQ0KPiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5j
b20+OyBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBGZWxpeA0KPiBLdWVobGluZyA8
ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsNCj4gVmlzaHdhbmF0aGFw
dXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsgV2Vs
dHksDQo+IEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+OyBQaGlsaXAgWWFuZyA8UGhpbGlw
LllhbmdAYW1kLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IEltcGxlbWVudCBzdm0g
d2l0aG91dCBCTyBjb25jZXB0IGluIHhlIGRyaXZlcg0KPiANCj4gDQo+IE9uIDgvMTcvMjMgMDQ6
MTIsIFplbmcsIE9hayB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPg0KPiA+PiBTZW50OiBBdWd1
c3QgMTYsIDIwMjMgNjo1MiBQTQ0KPiA+PiBUbzogRmVsaXggS3VlaGxpbmcgPGZlbGl4Lmt1ZWhs
aW5nQGFtZC5jb20+DQo+ID4+IENjOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IENo
cmlzdGlhbiBLw7ZuaWcNCj4gPj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IFRob21hcyBI
ZWxsc3Ryw7ZtDQo+ID4+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47IEJyb3N0
LCBNYXR0aGV3DQo+ID4+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbTsNCj4gPj4gVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmEgPG5p
cmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsgV2VsdHksDQo+ID4+IEJyaWFuIDxi
cmlhbi53ZWx0eUBpbnRlbC5jb20+OyBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT47
IGludGVsLQ0KPiA+PiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IEltcGxlbWVudCBzdm0gd2l0aG91dCBC
TyBjb25jZXB0IGluIHhlIGRyaXZlcg0KPiA+Pg0KPiA+PiBPbiBUaHUsIDE3IEF1ZyAyMDIzIGF0
IDA4OjE1LCBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6DQo+
ID4+PiBPbiAyMDIzLTA4LTE2IDEzOjMwLCBaZW5nLCBPYWsgd3JvdGU6DQo+ID4+Pj4gSSBzcG9r
ZSB3aXRoIFRob21hcy4gV2UgZGlzY3Vzc2VkIHR3byBhcHByb2FjaGVzOg0KPiA+Pj4+DQo+ID4+
Pj4gMSkgbWFrZSB0dG1fcmVzb3VyY2UgYSBjZW50cmFsIHBsYWNlIGZvciB2cmFtIG1hbmFnZW1l
bnQgZnVuY3Rpb25zIHN1Y2gNCj4gYXMNCj4gPj4gZXZpY3Rpb24sIGNncm91cCBtZW1vcnkgYWNj
b3VudGluZy4gQm90aCB0aGUgQk8tYmFzZWQgZHJpdmVyIGFuZCBCTy1sZXNzDQo+IFNWTQ0KPiA+
PiBjb2RlcyBjYWxsIGludG8gdHRtX3Jlc291cmNlX2FsbG9jL2ZyZWUgZnVuY3Rpb25zIGZvciB2
cmFtIGFsbG9jYXRpb24vZnJlZS4NCj4gPj4+PiAgICAgICAqVGhpcyB3YXkgQk8gZHJpdmVyIGFu
ZCBTVk0gZHJpdmVyIHNoYXJlcyB0aGUgZXZpY3Rpb24vY2dyb3VwIGxvZ2ljLCBubw0KPiA+PiBu
ZWVkIHRvIHJlaW1wbG1lbnQgTFJVIGV2aWN0aW9uIGxpc3QgaW4gU1ZNIGRyaXZlci4gQ2dyb3Vw
IGxvZ2ljIHNob3VsZCBiZSBpbg0KPiA+PiB0dG1fcmVzb3VyY2UgbGF5ZXIuICtNYWFydGVuLg0K
PiA+Pj4+ICAgICAgICp0dG1fcmVzb3VyY2UgaXMgbm90IGEgcGVyZmVjdCBtYXRjaCBmb3IgU1ZN
IHRvIGFsbG9jYXRlIHZyYW0uIEl0IGlzIHN0aWxsIGENCj4gPj4gYmlnIG92ZXJoZWFkLiBUaGUg
KmJvKiBtZW1iZXIgb2YgdHRtX3Jlc291cmNlIGlzIG5vdCBuZWVkZWQgZm9yIFNWTSAtIHRoaXMN
Cj4gPj4gbWlnaHQgZW5kIHVwIHdpdGggaW52YXNpdmUgY2hhbmdlcyB0byB0dG0uLi5uZWVkIHRv
IGxvb2sgaW50byBtb3JlIGRldGFpbHMNCj4gPj4+IE92ZXJoZWFkIGlzIGEgcHJvYmxlbS4gV2Un
ZCB3YW50IHRvIGJlIGFibGUgdG8gYWxsb2NhdGUsIGZyZWUgYW5kIGV2aWN0DQo+ID4+PiBtZW1v
cnkgYXQgYSBzaW1pbGFyIGdyYW51bGFyaXR5IGFzIG91ciBwcmVmZXJyZWQgbWlncmF0aW9uIGFu
ZCBwYWdlDQo+ID4+PiBmYXVsdCBncmFudWxhcml0eSwgd2hpY2ggZGVmYXVsdHMgdG8gMk1CIGlu
IG91ciBTVk0gaW1wbGVtZW50YXRpb24uDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+PiAyKSBzdm0gY29k
ZSBhbGxvY2F0ZSBtZW1vcnkgZGlyZWN0bHkgZnJvbSBkcm0tYnVkZHkgYWxsb2NhdG9yLCBhbmQN
Cj4gZXhwb3NlDQo+ID4+IG1lbW9yeSBldmljdGlvbiBmdW5jdGlvbnMgZnJvbSBib3RoIHR0bSBh
bmQgc3ZtIHNvIHRoZXkgY2FuIGV2aWN0IG1lbW9yeQ0KPiA+PiBmcm9tIGVhY2ggb3RoZXIuIEZv
ciBleGFtcGxlLCBleHBvc2UgdGhlIHR0bV9tZW1fZXZpY3RfZmlyc3QgZnVuY3Rpb24NCj4gZnJv
bQ0KPiA+PiB0dG0gc2lkZSBzbyBobW0vc3ZtIGNvZGUgY2FuIGNhbGwgaXQ7IGV4cG9zZSBhIHNp
bWlsYXIgZnVuY3Rpb24gZnJvbSBzdm0gc2lkZQ0KPiBzbw0KPiA+PiB0dG0gY2FuIGV2aWN0IGht
bSBtZW1vcnkuDQo+ID4+PiBJIGxpa2UgdGhpcyBvcHRpb24uIE9uZSB0aGluZyB0aGF0IG5lZWRz
IHNvbWUgdGhvdWdodCB3aXRoIHRoaXMgaXMgaG93DQo+ID4+PiB0byBnZXQgc29tZSBzZW1ibGFu
Y2Ugb2YgZmFpcm5lc3MgYmV0d2VlbiB0aGUgdHdvIHR5cGVzIG9mIGNsaWVudHMuDQo+ID4+PiBC
YXNpY2FsbHkgaG93IHRvIGNob29zZSB3aGF0IHRvIGV2aWN0LiBBbmQgd2hhdCBzaGFyZSBvZiB0
aGUgYXZhaWxhYmxlDQo+ID4+PiBtZW1vcnkgZG9lcyBlYWNoIHNpZGUgZ2V0IHRvIHVzZSBvbiBh
dmVyYWdlLiBFLmcuIGFuIGlkbGUgY2xpZW50IG1heSBnZXQNCj4gPj4+IGFsbCBpdHMgbWVtb3J5
IGV2aWN0ZWQgd2hpbGUgYSBidXN5IGNsaWVudCBtYXkgZ2V0IGEgYmlnZ2VyIHNoYXJlIG9mIHRo
ZQ0KPiA+Pj4gYXZhaWxhYmxlIG1lbW9yeS4NCj4gPj4gSSdkIGFsc28gbGlrZSB0byBzdWdnZXN0
IHdlIHRyeSB0byB3cml0ZSBhbnkgbWFuYWdlbWVudC9nZW5lcmljIGNvZGUNCj4gPj4gaW4gZHJp
dmVyIGFnbm9zdGljIHdheSBhcyBtdWNoIGFzIHBvc3NpYmxlIGhlcmUuIEkgZG9uJ3QgcmVhbGx5
IHNlZQ0KPiA+PiBtdWNoIGh3IGRpZmZlcmVuY2Ugc2hvdWxkIGJlIGluZmx1ZW5jaW5nIGl0Lg0K
PiA+Pg0KPiA+PiBJIGRvIHdvcnJ5IGFib3V0IGhhdmluZyBlZmZlY3RpdmVseSAyIExSVXMgaGVy
ZSwgeW91IGNhbid0IHJlYWxseSBoYXZlDQo+ID4+IHR3byAibGVhc3RzIi4NCj4gPj4NCj4gPj4g
TGlrZSBpZiB3ZSBoaXQgdGhlIHNocmlua2VyIHBhdGhzIHdobyBnb2VzIGZpcnN0PyBkbyB3ZSBz
aHJpbmsgb25lDQo+ID4+IG9iamVjdCBmcm9tIGVhY2ggc2lkZSBpbiB0dXJuPw0KPiA+IE9uZSB3
YXkgdG8gc29sdmUgdGhpcyBmYWlybmVzcyBwcm9ibGVtIGlzIHRvIGNyZWF0ZSBhIGRyaXZlciBh
Z25vc3RpYw0KPiBkcm1fdnJhbV9tZ3IuIE1haW50YWluIGEgc2luZ2xlIExSVSBpbiBkcm1fdnJh
bV9tZ3IuIE1vdmUgdGhlIG1lbW9yeQ0KPiBldmljdGlvbi9jZ3JvdXBzIG1lbW9yeSBhY2NvdW50
aW5nIGxvZ2ljIGZyb20gdHRtX3Jlc291cmNlIG1hbmFnZXIgdG8NCj4gZHJtX3ZyYW1fbWdyLiBC
b3RoIEJPLWJhc2VkIGRyaXZlciBhbmQgU1ZNIGRyaXZlciBjYWxscyB0byBkcm1fdnJhbV9tZ3Ig
dG8NCj4gYWxsb2NhdGUvZnJlZSBtZW1vcnkuDQo+ID4NCj4gPiBJIGFtIG5vdCBzdXJlIHdoZXRo
ZXIgdGhpcyBtZWV0cyB0aGUgMk0gYWxsb2NhdGUvZnJlZS9ldmljdCBncmFudWxhcml0eQ0KPiBy
ZXF1aXJlbWVudCBGZWxpeCBtZW50aW9uZWQgYWJvdmUuIFNWTSBjYW4gYWxsb2NhdGUgMk0gc2l6
ZSBibG9ja3MuIEJ1dCBCTw0KPiBkcml2ZXIgc2hvdWxkIGJlIGFibGUgdG8gYWxsb2NhdGUgYW55
IGFyYml0cmFyeSBzaXplZCBibG9ja3MgLSBTbyB0aGUgZXZpY3Rpb24gaXMgYWxzbw0KPiBhcmJp
dHJhcnkgc2l6ZS4NCj4gDQo+IFRoaXMgaXMgbm90IGZhciBmcm9tIHdoYXQgYSBUVE0gcmVzb3Vy
Y2UgbWFuYWdlciBkb2VzIHdpdGggVFRNDQo+IHJlc291cmNlcywgb25seSBtYWRlIGdlbmVyaWMg
YXQgdGhlIGRybSBsZXZlbCwgYW5kIG1ha2luZyB0aGUgInJlc291cmNlIg0KPiBhcyBsZWFuIGFz
IHBvc3NpYmxlLiBXaXRoIDJNIGdyYW51bGFyaXR5IHRoaXMgc2VlbXMgcGxhdXNpYmxlLg0KPiAN
Cj4gPg0KPiA+PiBBbHNvIHdpbGwgd2UgaGF2ZSBzeXN0ZW1zIHdoZXJlIHdlIGNhbiBleHBvc2Ug
c3lzdGVtIFNWTSBidXQgdXNlcnNwYWNlDQo+ID4+IG1heSBjaG9vc2UgdG8gbm90IHVzZSB0aGUg
ZmluZSBncmFpbmVkIFNWTSBhbmQgdXNlIG9uZSBvZiB0aGUgb2xkZXINCj4gPj4gbW9kZXMsIHdp
bGwgdGhhdCBwYXRoIGdldCBlbXVsYXRlZCBvbiB0b3Agb2YgU1ZNIG9yIHVzZSB0aGUgQk8gcGF0
aHM/DQo+ID4NCj4gPiBJZiBieSAib2xkZXIgbW9kZXMiIHlvdSBtZWFudCB0aGUgZ2VtX2JvX2Ny
ZWF0ZSAoc3VjaCBhcyB4ZV9nZW1fY3JlYXRlIG9yDQo+IGFtZGdwdV9nZW1fY3JlYXRlKSwgdGhl
biB0b2RheSBib3RoIGFtZCBhbmQgaW50ZWwgaW1wbGVtZW50IHRob3NlDQo+IGludGVyZmFjZXMg
dXNpbmcgQk8gcGF0aC4gV2UgZG9uJ3QgaGF2ZSBhIHBsYW4gdG8gZW11bGF0ZSB0aGF0IG9sZCBt
b2RlIG9uIHRvcGUNCj4gb2YgU1ZNLCBhZmFpY3QuDQo+IA0KPiBJIHRoaW5rIHdlIG1pZ2h0IGVu
ZCB1cCBlbXVsYXRpbmcgIm9sZGVyIG1vZGVzIiBvbiB0b3Agb2YgU1ZNIGF0IHNvbWUNCj4gcG9p
bnQsIG5vdCB0byBmYXIgb3V0LCBhbHRob3VnaCB3aGF0IGltbWVkaWF0ZWx5IGNvbWVzIHRvIG1p
bmQgd291bGQgYmUNCj4gZXZpY3Rpb24gYmFzZWQgb24gc29tZXRoaW5nIGxvb2tpbmcgbGlrZSBO
VU1BLSBhbmQgQ0dST1VQIGF3YXJlDQo+IHNocmlua2VycyBmb3IgaW50ZWdyYXRlZCBibyBkcml2
ZXJzIGlmIHRoYXQgdHVybnMgb3V0IHRvIGJlIHN1ZmZpY2llbnQNCj4gZnJvbSBhIG1lbW9yeSB1
c2FnZSBzdGFydmF0aW9uIFBPVy4gVGhpcyBpcyBJTUhPIGluZGVlZCBzb21ldGhpbmcgdG8NCj4g
c3RhcnQgdGhpbmtpbmcgYWJvdXQsIGJ1dCBmb3IgdGhlIGN1cnJlbnQgc2l0dWF0aW9uIHRyeWlu
ZyB0byBzb2x2ZSBhDQo+IG11dHVhbCBTVk0tVFRNIGZhaXIgZXZpY3Rpb24gcHJvYmxlbSB3b3Vs
ZCBiZSBhIHJlYXNvbmFibGUgc2NvcGUuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBUaG9tYXMNCj4g
DQo+IA0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IE9haw0KPiA+DQo+ID4+IERhdmUuDQo=
