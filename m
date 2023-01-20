Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7976761BB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BE210EB2C;
	Fri, 20 Jan 2023 23:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95ED10EB29;
 Fri, 20 Jan 2023 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674258380; x=1705794380;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ekQRI9xkPYWFjbeBrCHUwqqOZK52t4B1/gbr3mMOtoc=;
 b=QPz8mTFNr73y7tsHQGpcGtYAlDrgIGJnR4EqgIoOJDqEhTTGQKlrAMIR
 QXxp1wDAgy1zWju+KjDXpyoHJR4ooZa59rxgJQ8izDvhtmohhC4czWtoT
 G2JuvyxYKjkzx+dVYo2z+nEPE0tr9OUd78zJ3/z6PZC/LB1kr0gSRHD23
 SV/fjv2Witp0lGK4TXyzjL87Tka0ZO5rCbSy1qhSo8MYrCHjkaJCW44FR
 qQVg0CX4BNP4WD80zTatNQYk6FLs6IpLMJfUzgBKVdWNJRb8ZPml4YlxS
 dZ32enHgxxPXsrsh1WVlws0ukjVIFLyW2/8anZKenHnf5z82jPGGGW3JP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313616891"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="313616891"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749528973"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="749528973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 15:46:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 15:46:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 15:46:18 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 15:46:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqYqyjG9tXMeDRJ7zWhj8SOiXWkk3bWnSpq1ZjL4upmZZLI2YoxRr+iUiArU5Fzwk/6zJ0TI9XaJ/MM8Gr2016/DfAzTXEC/1s7WDtviJOjt7meygflvwNWi++AkpTrQDggwFPKZCuYfVZev8UwOTPSPxpCa3fH5rEw+M0HmSkR9V8n2tJmewFt7rf8ehJ4va7qeaubC1cR8f18K/LWAlI9pmvLIAQ8zvtqB5YBrm/QUFsz1itwSDoERwKPhZNocOwD/D85fXfihryv3oq7eKVEVJlDuNG2s3K/um7HKQ3K2x5KawNxvJG2Euc5Wwl65IoJJ9CxsBWWi7VR6FH7ZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekQRI9xkPYWFjbeBrCHUwqqOZK52t4B1/gbr3mMOtoc=;
 b=gW/Bvv2A8RWRg5vDkFv92yO6NTCyif3Fghl5SdBB6dUXmX54aXbrKz+acN9KD58L6kTBLqFg96VFeF1MIHnkGoHs4cPHuBIuia5cCq4e7vpToNpMRRo93yxrZ6X8ypjY9iRz4RQ73EP5rYDeiqSyds4tNdl5Nm9YidutbCA0+wwdojEMch0ZXYKYsrt+1JEiWRDjYqIOdIcVI1fXS+gfMU5+5/uUBDP10ZG+ztqS0w4HublqDbxBy8rVnAjooRrD+EQI38UPTaUcvvdQfS7YrhQ9d9i3K4Z8g2HJcY1urw7oSjnKnM8T61RBzAP5W4x89NSwEYwsrNb3bLIBDJBN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Fri, 20 Jan 2023 23:46:16 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 23:46:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/9] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Topic: [PATCH v2 5/9] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Index: AQHZJgWkB/l6OWEoC0+CwRsbOqUQZq6lAgGAgAMEtYA=
Date: Fri, 20 Jan 2023 23:46:15 +0000
Message-ID: <ab7de37fa39b8c63076fcb71f3da8c969eb33693.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-6-alan.previn.teres.alexis@intel.com>
 <2516e7ef-1766-6441-46c9-4de2a1306e79@intel.com>
In-Reply-To: <2516e7ef-1766-6441-46c9-4de2a1306e79@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4916:EE_
x-ms-office365-filtering-correlation-id: 448e95f6-a1b4-4949-5a79-08dafb40855f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 772BbNj2GtaEWvDQHIVFLePwSIIFUinFbzWWyignH44tpnw0RUlQpgFQXSVklsaH/JalMOdaq2ZuCHK+R5Pbfsm6GYjgbsWZukxsoM4PTgBRwMlby9CabWmJK6+I5+xzbMdCVzIiwzWDwp4RFa4xPvYaQk+Ii26N5QV6V57C9ir1JzON9/7N6w3euy0ARMJgM28plx3HSiTdMmj0HQNpDfmQ/8x6HfzfpuO411bImb0yex805LrdaG5EoNof3K+mgnGIeaEnz/dFWA4B/KKYfgQG7msb4kysyWyArF7KJx6bRsXj25U5cdla14KWRxVsmQ2RID6K5QhaUH1cnZEQTooEGf6LgzizfVq+L1eQv+KcHa2QhDpoPDeKFbbY8qAznrmy79yz/AQe4KlIbTBCZ5zyodnNpUcy+S+Erf5zIpu9Xptu5mb0eUrq5jlSSBlHnz0mWO3qThxH50AGyn3k8IFqtY3YzC6XLrJgpZ6uWfBR9eJxBGg6PuDIwGGPjZ0tfvSVjB+ICfM1k7Gtd7t1+BAu4459dQppT5mWHiTxh/lrTfvdjPGsSqtVSxpILwc1cuDy+sXbfoqun6WWbU5aJL3fVuISJ4RF2PWvQom1SkwP6i6yY9w5oKxpy4V5EWaBf1rri5eKxMo3olqSeRU6XVLaHy4CZYARUhJ+7+0Zg+73ChLuQ57aEG0hneBP0byngcTbkG/4SFHavzr8wDdQtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199015)(36756003)(83380400001)(478600001)(110136005)(6486002)(71200400001)(26005)(82960400001)(86362001)(122000001)(186003)(38070700005)(38100700002)(6506007)(41300700001)(2906002)(53546011)(6512007)(15650500001)(66446008)(8936002)(64756008)(8676002)(66556008)(66476007)(4326008)(76116006)(66946007)(91956017)(2616005)(54906003)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDdhZjNxVHNqdEdaeG1JUEtTeFBGaUlNV3ozZzNJYmltN0lqcldGK2R3U3pk?=
 =?utf-8?B?YWZNVWczNUkzU0FzKzNvZ2VJbDhUQnhFYUk3WTlBM2YrNTJnYVJ1Z2h5Uis2?=
 =?utf-8?B?eWZFMzIxQUNjaWVsYldQWGpEZkpBcDJiOFdSY2VLOFdjbjBhZ21TcE1vUm5h?=
 =?utf-8?B?K2ZxRmFWeU9iYnVMSTNUblkrdWtGamZUWDB2bEpXdEdvWEdkc2NOUm1rUDBU?=
 =?utf-8?B?VlE4T1NEbjR2Rzk5UFdZUkVTdVRUYjl4ZlRYSElZaDV5aEIyR2hBRG9Ba24x?=
 =?utf-8?B?Z2Rha2ZVNWtPSVZ1S212RlJ6YWRZSU10UWJyQjZDNjdGMTdpSG1GTjJBMW9W?=
 =?utf-8?B?cHBnY2pnU2FnNTdRbDlLKzEvNWd5cnVNRVJrRHN6ZTBJdnNEOFhGOXBmQklt?=
 =?utf-8?B?d0djeWx4MGRwcFRwZE1XWDFEdHJDYVFLR1p2VmVvdUlPak9hU09RLzBxVjBs?=
 =?utf-8?B?c3lxZllHWnV4dkgrSUI3YzNOaGFEM2ZKOHVYbFV6OTZkVkNQT0dMRG1iYjZy?=
 =?utf-8?B?a2Z1RTlCRlc4Ym5STDlhNnozcHlVTzNuTXFPSU1Jd21TeGprY1hnRzk1V2M3?=
 =?utf-8?B?ci8vUzZ6OThrZmVGdUlxR014M2FKS3UzajBRcFl6Q2JiYlFRUG5ORHIvMWxr?=
 =?utf-8?B?d0ZjUWV2K2ZwUGRRYlN0cmFlQnYxMHpsdkJ0cjFQZCsyTXUyUTRPakkvemVE?=
 =?utf-8?B?cUtkU3JzekkyOThPS0VvY1VhRlRrUHRVcVl0ZXJCaGlydVc1ZVVIbnRMN2o5?=
 =?utf-8?B?a0FhT0dOUzdyb1ZWNHYzZm5oSE8zVnNDcS9JS0gzWGpleGlHaWVYZ2VqbzZH?=
 =?utf-8?B?SVk3dFNvdE9zR2FuWlIybkYzOGRmdjcrUzBrN0tYd091eVZJQXpGWnBueURn?=
 =?utf-8?B?cUZ1L2sxKzVtc2s0QjFKRE0vYTVvakZaWHRTNWJ5MzMzM1NBby9PQmllaGFI?=
 =?utf-8?B?a1RmQUtPVk5KWmpYWENZWlduNEVCN2hveU5CdEhPdEY3ZFhoZUJXbzFPMXdK?=
 =?utf-8?B?bnlhWFQzV2NVakRFSSt3RTdrczg5WHBjeDhEajQxS052ZHpJRUx0RkQ5Y1BH?=
 =?utf-8?B?cnBzNFBaTGV3ekVWNDFCZ0JqU25HbUJYR1VTU3J1Z0sxbUgyYlZGRjNwd00w?=
 =?utf-8?B?d2ZOb2M4T0doTE84MHNwNTBqTWx6WjRMWXZzRUc1L0srMWIrVFFvLzJ2Zjd6?=
 =?utf-8?B?aEM0THpaR3pXRWgrQ3V4ZlFEMGdyUXlKQkZtUmpOZW9zWTJ5R3BTMkQySTVO?=
 =?utf-8?B?ZUhFRmk0cndMTTFCNGltY3YrcXBZU1dzOHFiMU1lMldXdk5nSlNwTys0bllo?=
 =?utf-8?B?VXpBMjZNY3VqOVR4REkzSmpRMjBVa0ovTks5NzEzdCtCZW1ibUpOWUFjOE5K?=
 =?utf-8?B?NTNNbDl0SWVLbE5hVytuMUppNDBPOS95S3pGZi9TS1hQZmkxYkJBdmFwYVpm?=
 =?utf-8?B?ZkdhS0l6RmFsdkFDejlESE9DOFE0aUxyRHBodWZTZ0VaT3JSS2JzSDFmVHV6?=
 =?utf-8?B?eXlpb04veGN3QzQxcDNnMEM2SHNlSFFPS1k0eG16MWZDa25jYzRKdEVqc2Ir?=
 =?utf-8?B?Y3BLVFRTYkhhM2FDOUJvVmpMaUxjcWRXSkZoR3lXRENrNElzeGpwRnROZ1ky?=
 =?utf-8?B?TURSazBHdWlxN2kxeGVLRG5TNjJVNDdTRXdhWnBaUGNlZ0NhZklLbHRHT2p0?=
 =?utf-8?B?a0lyWXZsNENEZTZ3RXl1NDh2L09ncU5tWU1JR3ZjaUVrOHJhZVB0QzE4anZS?=
 =?utf-8?B?SEdOMUsvWHFQNWFYL29jaFpyOHJhZVh0OGFxZjlhdUE3ZjAxK0NOeU5WYklj?=
 =?utf-8?B?NVluK3ZNQlo0VG5Zb1RWbzNLNmRaZUlNL2FWeUNnb1h6OWhzditVelRSWmpE?=
 =?utf-8?B?OVNEYlhiNXh2N2VUNVVaWXlCclVTWDR2aU82R0dNVEIwWUpJSGtocURSYmVa?=
 =?utf-8?B?OVdrdkxDSmhUVjROR1FQK3k4VUFVdUNzc0dwN0lLSE9zMlRkOExSTUo0TzhF?=
 =?utf-8?B?TVY0Wm8yeDl4enpvdTJXWTRkSmJFVm9nZFdOTDMvemZrK2t6dEh1YUhZbjBr?=
 =?utf-8?B?MjB1YXRnNzNtSENZc0JoY1daOHlFQTJ4MHQ2bmwySTFnNWZVUDJoQy83ZkI4?=
 =?utf-8?B?SWtmQ1NaK1Y3Q1Brc0Ira3ViZUVzK21zNTlvSXZMZVpsY3ZmOVR4aCtqNnpT?=
 =?utf-8?Q?XBA7Hk3sn0ySh4D1/zw227J9+Tl7q1PNGVwZh0Cvm3lq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <037FAAA05FC96D459E500177333FCA21@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448e95f6-a1b4-4949-5a79-08dafb40855f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 23:46:15.9819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FAPX79qLjDoQ6N9G9EY+3vRGy3eSsDEeuPS8R8FOk0P6aqqoPjj4XpdGrp9hMCd1Ny7PG/CtmBlV7zgmZwTkLo0DaNl4p1P+Fxoxpa8PIk+zcI7k9zSUlHfxNa7bsPN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgcmV2aWV3IGNvbW1lbnQuLi4gCgpPbiBXZWQsIDIwMjMtMDEtMTggYXQg
MTc6NDAgLTA4MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3RlOgo+IAo+IAo+IE9uIDEv
MTEvMjAyMyAxOjQyIFBNLCBBbGFuIFByZXZpbiB3cm90ZToKPiA+IEFkZCBHU0MgZW5naW5lIGJh
c2VkIG1ldGhvZCBmb3Igc2VuZGluZyBQWFAgZmlybXdhcmUgcGFja2V0cwo+ID4gdG8gdGhlIEdT
QyBmaXJtd2FyZSBmb3IgTVRMIChhbmQgZnV0dXJlKSBwcm9kdWN0cy4gVXNlIHRoZSBuZXdseQo+
ID4gYWRkZWQgaGVscGVycyB0byBwb3B1bGF0ZSB0aGUgR1NDLUNTIG1lbW9yeSBoZWFkZXIgYW5k
IHNlbmQgdGhlCj4gPiBtZXNzYWdlIHBhY2tldCB0byB0aGUgRlcgYnkgZGlzcGF0Y2hpbmcgdGhl
IEdTQ19IRUNJX0NNRF9QS1QKPiA+IGluc3RydWN0aW9uIG9uIHRoZSBHU0MgZW5naW5lLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlz
QGludGVsLmNvbT4KPiAKYWxhbjpzbmlwLi4KCj4gVGhpcyBpcyB1bnVzZWQgaW4gdGhpcyBwYXRj
aCwgc28gaXQgd291bGQgY2F1c2UgYSBjb21waWxlciB3YXJuaW5nIAo+IHVubGVzcyB5b3UgYWRk
wqAgdGhlIG1heWJlX3VudXNlZCB0YWcgKHdoaWNoIG5lZWRzIHRvIGJlIHJlbW92ZWQgd2hlbiB0
aGUgCj4gZnVuY3Rpb24gZ2V0cyB1c2VkKS4gSXQgbWlnaHQgYWxzbyBiZSB3b3J0aCBzcXVhc2hp
bmcgdGhpcyBwYXRjaCB3aXRoIAo+IHRoZSBuZXh0IG9uZSB0byBub3QgaGF2ZSBhbiB1bnVzZWQg
ZnVuY3Rpb24gYXMgdGhleSdyZSBib3RoIHJlbGF0aXZlbHkgCj4gc21hbGwuCj4gCmFsYW46IFNv
IGlmIGkgY29tYmluZSB0aGUgYnVmZmVyL3ZtYSBhbGxvY2F0aW9ucyBmcm9tIGVhcmxpZXIgdG8g
aGVyZQphbmQgc3F1YXNoIHRoaXMgdG9nZXRoZXIgd2l0aCB0aGUgY3JlYXRlLXNlc3Npb24sIHRo
ZW4gaXQgd2lsbCBiZWNvbWUKb25lIHZlcnkgbGFyZ2UgcGF0Y2guIEFsc28sIHdlIGtub3cgdGhh
dCB0ZXJtaW5hdGUtc2Vzc2lvbiBtaWdodApiZSBjb21pbmcgYWxvbmcgc29vbiAtIHdoaWNoIGkg
dGhpbmsgbmVlZHMgdG8gZ28gdG9nZXRoZXIgd2l0aCBjcmVhdGUtCnNlc3Npb24gKGFzc3VtaW5n
IHRoYXQgc2VyaWVzIGdldHMgc3VmZmljaWVudCByYidzLi4uIG5lYXJseSB0aGVyZSkuClRoYXQg
c2FpZCBpIHdpbGwga2VlcCB0aGlzIGFzIGl0cyBvd24gcGF0Y2ggKHB1bGxpbmcgaW4gdGhlIGJ1
ZmZlci92bWEKYWxsb2NhdGlvbnMgYW5kIGZyZWVpbmdzKSB3aXRoIHRoZSBtYXliZV91bnVzZWQg
dGFnLgpBcmUgeW91IG9rYXkgd2l0aCB0aGlzIGluc3RlYWQ/CgoKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICptc2dfaW4s
IHNpemVfdCBtc2dfaW5fc2l6ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICptc2dfb3V0LCBzaXplX3QgbXNnX291dF9z
aXplX21heCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzaXplX3QgKm1zZ19vdXRfbGVuKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKg
wqDCoHN0cnVjdCBpbnRlbF9ndCAqZ3QgPSBweHAtPmN0cmxfZ3Q7Cj4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGd0LT5pOTE1Owo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGdzY2NzX3Nlc3Npb25fcmVzb3VyY2VzICpleGVjID0gJnB4cF90b19nc2Nj
c19wcml2KHB4cCktPmFyYl9leGVjX3JlczsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRl
bF9nc2NfbXRsX2hlYWRlciAqaGVhZGVyID0gZXhlYy0+cGt0X3ZhZGRyOwo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGludGVsX2dzY19oZWNpX25vbl9wcml2X3BrdCBwa3Q7Cj4gPiArwqDCoMKg
wqDCoMKgwqBzaXplX3QgbWF4X21zZ19zaXplOwo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHJlcGx5
X3NpemU7Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgaWYgKCFpbnRlbF91Y191c2VzX2dzY191YygmZ3QtPnVjKSkKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT0RFVjsKPiAKPiBUaGlzIGFsc28gbmVlZHMgYSBj
aGVjayB0aGF0IHRoZSBHU0MgRlcgaXMgbG9hZGVkIChjb3VsZCBhbHNvIGJlIAo+IHBlcmZvcm1l
ZCBhdCBhIGhpZ2hlciBsZXZlbCkuCj4gCmFsYW46IG9oIHllYWggLSB3aWxsIGFkZCB0aGF0IGNo
ZWNrLgoKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghZXhlYy0+Y2UpCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9ERVY7Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqBtYXhfbXNnX3NpemUgPSBQWFA0M19NQVhfSEVDSV9JTl9TSVpFIC0gc2l6ZW9mKCpo
ZWFkZXIpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKG1zZ19pbl9zaXplID4gbWF4X21z
Z19zaXplIHx8IG1zZ19vdXRfc2l6ZV9tYXggPiBtYXhfbXNnX3NpemUpCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9TUEM7Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqBtdXRleF9sb2NrKCZleGVjLT5jbWRfbXV0ZXgpOwo+IAo+IFRoaXMgc2VlbXMgdG8gcGVy
Zm9ybSB0aGUgc2FtZSByb2xlIGFzIHB4cC0+dGVlX211dGV4LCB3aGljaCBpcyB1bnVzZWQgCj4g
d2hlbiB3ZSdyZSBpbiBnc2NjcyBtb2RlLiBJJ20gd29uZGVyaW5nIGlmIHRoZXJlIGlzIGEgd2F5
IHRvIGhhdmUgb25seSAKPiBvbmUgbXV0ZXggYW5kIHVzZSBpdCBpbiBib3RoIHNjZW5hcmlvcy4g
Tm90IGEgYmxvY2tlci4KCmFsYW46IEknbGwgdGFrZSBhIGxvb2sgYXQuCj4gCj4gRGFuaWVsZQo+
IAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFleGVjLT5wa3Rfdm1hIHx8ICFleGVjLT5i
Yl92bWEpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9FTlQ7
Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBtZW1zZXQoaGVhZGVyLCAwLCBzaXplb2YoKmhlYWRl
cikpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfZ3NjX3VjX2hlY2lfY21kX2VtaXRfbXRsX2hl
YWRlcihoZWFkZXIsIEdTQ19IRUNJX01FQUREUkVTU19QWFAsCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtc2dfaW5fc2l6ZSArIHNpemVvZigqaGVhZGVyKSwKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4ZWMtPmhvc3Rfc2Vzc2lvbl9oYW5kbGUpOwo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgbWVtY3B5KGV4ZWMtPnBrdF92YWRkciArIHNpemVvZigq
aGVhZGVyKSwgbXNnX2luLCBtc2dfaW5fc2l6ZSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBw
a3QuYWRkcl9pbiA9IGk5MTVfdm1hX29mZnNldChleGVjLT5wa3Rfdm1hKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoHBrdC5zaXplX2luID0gaGVhZGVyLT5tZXNzYWdlX3NpemU7Cj4gPiArwqDCoMKgwqDC
oMKgwqBwa3QuYWRkcl9vdXQgPSBwa3QuYWRkcl9pbiArIFBYUDQzX01BWF9IRUNJX0lOX1NJWkU7
Cj4gPiArwqDCoMKgwqDCoMKgwqBwa3Quc2l6ZV9vdXQgPSBtc2dfb3V0X3NpemVfbWF4ICsgc2l6
ZW9mKCpoZWFkZXIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgcGt0LmhlY2lfcGt0X3ZtYSA9IGV4ZWMt
PnBrdF92bWE7Cj4gPiArwqDCoMKgwqDCoMKgwqBwa3QuYmJfdm1hID0gZXhlYy0+YmJfdm1hOwo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1p
dF9ub25wcml2KCZweHAtPmN0cmxfZ3QtPnVjLmdzYywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGVjLT5jZSwgJnBrdCwgZXhlYy0+YmJfdmFkZHIsIDUw
MCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZHJtX2VycigmaTkxNS0+ZHJtLCAiZmFpbGVkIHRvIHNlbmQgZ3NjIFBYUCBt
c2cgKCVkKVxuIiwgcmV0KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3Rv
IHVubG9jazsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8q
IHdlIGtlZXAgc2VwYXJhdGUgbG9jYXRpb24gZm9yIHJlcGx5LCBzbyBnZXQgdGhlIHJlc3BvbnNl
IGhlYWRlciBsb2MgZmlyc3QgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoGhlYWRlciA9IGV4ZWMtPnBr
dF92YWRkciArIFBYUDQzX01BWF9IRUNJX0lOX1NJWkU7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqAvKiBSZXNwb25zZSB2YWxpZGl0eSBtYXJrZXIsIHN0YXR1cyBhbmQgYnVzeW5lc3MgKi8KPiA+
ICvCoMKgwqDCoMKgwqDCoGlmIChoZWFkZXItPnZhbGlkaXR5X21hcmtlciAhPSBHU0NfSEVDSV9W
QUxJRElUWV9NQVJLRVIpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1f
ZXJyKCZpOTE1LT5kcm0sICJnc2MgUFhQIHJlcGx5IHdpdGggaW52YWxpZCB2YWxpZGl0eSBtYXJr
ZXJcbiIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1FSU5WQUw7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byB1bmxvY2s7Cj4gPiArwqDC
oMKgwqDCoMKgwqB9Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoaGVhZGVyLT5zdGF0dXMgIT0gMCkg
ewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kYmcoJmk5MTUtPmRybSwg
ImdzYyBQWFAgcmVwbHkgc3RhdHVzIGhhcyBlcnJvciA9IDB4JTA4eFxuIiwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaGVhZGVyLT5zdGF0dXMpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1FSU5WQUw7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byB1bmxvY2s7Cj4gPiArwqDCoMKgwqDCoMKg
wqB9Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoaGVhZGVyLT5mbGFncyAmIEdTQ19IRUNJX0ZMQUdf
TVNHX1BFTkRJTkcpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZGJn
KCZpOTE1LT5kcm0sICJnc2MgUFhQIHJlcGx5IGlzIGJ1c3lcbiIpOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1FQUdBSU47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byB1bmxvY2s7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4gPiAr
wqDCoMKgwqDCoMKgwqByZXBseV9zaXplID0gaGVhZGVyLT5tZXNzYWdlX3NpemUgLSBzaXplb2Yo
KmhlYWRlcik7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmVwbHlfc2l6ZSA+IG1zZ19vdXRfc2l6
ZV9tYXgpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fd2FybigmaTkx
NS0+ZHJtLCAiY2FsbGVyIHdpdGggaW5zdWZmaWNpZW50IFBYUCByZXBseSBzaXplICV1ICglbGQp
XG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVwbHlfc2l6ZSwgbXNnX291dF9zaXplX21heCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmVwbHlfc2l6ZSA9IG1zZ19vdXRfc2l6ZV9tYXg7Cj4gPiArwqDCoMKgwqDCoMKg
wqB9IGVsc2UgaWYgKHJlcGx5X3NpemUgIT0gbXNnX291dF9zaXplX21heCkgewo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kYmcoJmk5MTUtPmRybSwgImNhbGxlciB1bmV4
cGVjdGVkIFBYUCByZXBseSBzaXplICV1ICglbGQpXG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXBseV9zaXplLCBtc2dfb3V0X3NpemVfbWF4
KTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoG1lbWNweSht
c2dfb3V0LCBleGVjLT5wa3RfdmFkZHIgKyBQWFA0M19NQVhfSEVDSV9JTl9TSVpFICsgc2l6ZW9m
KCpoZWFkZXIpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcGx5X3NpemUpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKG1zZ19vdXRfbGVuKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCptc2dfb3V0X2xlbiA9IHJlcGx5X3NpemU7Cj4gPiArCj4gPiArdW5sb2Nr
Ogo+ID4gK8KgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZleGVjLT5jbWRfbXV0ZXgpOwo+ID4g
K8KgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiA+ICt9Cj4gPiArCj4gPiDCoCBpbnQgaW50ZWxf
cHhwX2dzY2NzX2NyZWF0ZV9zZXNzaW9uKHN0cnVjdCBpbnRlbF9weHAgKnB4cCwKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGludCBhcmJfc2Vzc2lvbl9pZCkKPiA+IMKgIHsKPiAKCg==
