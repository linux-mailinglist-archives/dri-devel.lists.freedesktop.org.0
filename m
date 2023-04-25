Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46EB6EE68A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 19:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A0510E0DE;
	Tue, 25 Apr 2023 17:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639B910E0C4;
 Tue, 25 Apr 2023 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682443302; x=1713979302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wyZdPLShzm65ApvkygzmtdXHgziVOLq8vevFVPduWt8=;
 b=W5ImjOvO98onY3xrOsTs3oby3aBP59540hNf/D6J/SeN3OWrpqHYaKno
 sBxosZ8VbrBL8adTh5aXkVFaiuKxuu2V6yEWyT2X5q1pmDZ3mUH1gMMQg
 6w5O0deiDYdEaHQrzagclgncAG9b12U2uc2J6Iy3QHyISUAzQ7Nn4+6jB
 68tInxB5rFI9jUfdgBV5YyyqCouVFDfNNDYpM3BFPhob3uoHd/MsaOemF
 isgwS8LspU/S9BlJOWAxoNcZslAzWqsK0NdyL9zH+AIou8U9f1p0fejh9
 CpYjUqearT0Uh8fKnX2acTaN92KeMbE/19Tk74c7esYPTjprOQC/nl/GL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="327149361"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="327149361"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 10:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="693593240"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="693593240"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 25 Apr 2023 10:21:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 10:21:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 10:21:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 10:21:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 10:21:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcZYTag2/bneoeIdrOSnA14Mex1hVSfPgsHUqWy6q+n/Op9FCirvcPLm7Wm6fxhG86Zv/V3Bo5rt1qIPFiIaS507kVzWhUdyfzlIKnzb00rgjKHRVGIsN6tudTBqzB8B0WP1OWR72FpBj1vhzXkwT+pwqos/gpeQvjac3d3SHrECgihNH5hZJKV/3wFvgPxIn5qaoAjFG/ILzGUFjhVi8igyFXQcXLOYp/7LKSsLUCAYF3Z8NUgm3oBghnRxoNv/utYprk/Aij5f/gztOroq2sM1jZkPeOutXNBEJPnqQNuEKWlA0R58bLcD6p5vEQFOJinQxtCYcvFlukcwaw2ohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyZdPLShzm65ApvkygzmtdXHgziVOLq8vevFVPduWt8=;
 b=XhhDQsi3q3v1w5AnuXuI8CgzErjzdVv+1UqU+Zvn1HekNzz5/r8B04TOMpgpqCoXDHlygO4y5DK2bkvFbzxLhtzvt5UIruqk/rDb5iyF7vb1kdVYfG8p3PvbUOXu3PVvK/6DOuswrZ/juJPyby/67uuZ80pOqEKRPD9KnXBggYF9El6ve3fjfGAepY9IBuRvrXAyttqDAWo7kPV3XeME6BP41ZVtbt+h31PgbmC08V6rPWN2gRfali9PXerauEnzgReotCysxWNgW3EXz2rCHaX4pcE+pX/KHqlsF+5t5FPWxWj4+tRXwcefUeKNwmHI4ATXhk8laik3tM/YrLq9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB5376.namprd11.prod.outlook.com (2603:10b6:5:397::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Tue, 25 Apr 2023 17:21:32 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 17:21:32 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Justen, Jordan L" <jordan.l.justen@intel.com>, "Yang, Fei"
 <fei.yang@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "andi.shyti@linux.intel.com"
 <andi.shyti@linux.intel.com>
Subject: Re: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
Thread-Topic: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
Thread-Index: AQHZd3u8h/qAQW/4RUCvrZVJA5FVuq88RcgA
Date: Tue, 25 Apr 2023 17:21:32 +0000
Message-ID: <aa331f701a0b9e5d2418434fc3cf79562e3bf865.camel@intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
 <168235638024.392286.14697291321034695564@jljusten-skl>
 <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB5376:EE_
x-ms-office365-filtering-correlation-id: 0e5228e9-d9c0-443a-279d-08db45b18383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /4X7OvKvuYBt+YyRjzrDaqzvMLrFTjurMZFAa6d21kC0pUEk5WQIdx522EgHMldMuy3wsLUOxbIQhT5k+F9Uc3JpBn97xcvUeYxpm4qrrStCwyNnypS0Hn+9yFaZYysLcNH+WdxdHW5U/U7vq3jy3bAOphdnEL7CWOSVbI5NpKZ1qbMTY+xBr34xqYMVa1PbpbtW0sUkY7crTzpWB6061Mt88UprGWA2yDVPAl59bSqP5VEeyd0VkqFgwObKWu7TucC5yiQb0FVbf8ZBUBeVYaR6WipqWEQFYENEBWCB3j2962Xk67VPG9C712d8zeqG9ZCsTjFVbmG+MZHUo90Y+hAEDLMP2aQOr84BvNzzMoelxVJ6ih5AJB1tZOSztQ8AXRLzmnkMIkYTTfzUYwCxN81LWGEcAU9s4VLkX9rnsyxBil1lmNeXNFP79lbZqIpR/uDSI3DJeqOhyvKv0ZHJCohu4Mesc1CAZ0GcCLNGb5qrS0d6lFX/1RU16gV93/raMZu9ZXrLOVhCu3wg5KJUljYdYbOyV1ghqMQb3dUNQwN7Jd3wjvMz6nefAnU1maQCNKwi4HcycBhfyOvuxNq0Bo9iBlEnWojzZaBjzgpU+jESs4YM4fhaDo2A4wxWAFY/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(4744005)(71200400001)(6486002)(2906002)(6512007)(6506007)(2616005)(186003)(91956017)(66446008)(66946007)(76116006)(66476007)(8936002)(8676002)(66556008)(41300700001)(4326008)(316002)(26005)(64756008)(478600001)(5660300002)(54906003)(110136005)(38070700005)(122000001)(82960400001)(38100700002)(86362001)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTR2UjdxcDd3SEdkVldxM0FMZVl6L2YzcDlKUy8yZWwzZ0FoZk9VSEtHMnA5?=
 =?utf-8?B?YjhVM0JPa20xdVBONENjR3lOUHhlaGszQUNrdW1Qc2E5Wk4xM0V0QU1pWDJL?=
 =?utf-8?B?RmJST1BPV3czaXR4aWJxdlFwYjZBZ2RHNGsvT1Z0d0k5dFdjT1dCOFRDT29S?=
 =?utf-8?B?ZG0xalJNOVVqWTlsK05XakxBallnSTJ4d2M5aWRxcGR5UFdwMER1cE5zWk8y?=
 =?utf-8?B?N2tzSlBUVVlXcDZSNVgyVExFenNXQ0NNMTRBaTZZM2VtMXllYWhkMjZWcWdS?=
 =?utf-8?B?alM5WCtlY3pKY2dZUG5FZXFISDdaTkZ3RUc1WXd1TE04NGh2bW1qaTBpcG4x?=
 =?utf-8?B?OUVnTW10OFdqS2xUOHR0dEJzR3YvNlhPalFrTk5aRGZpSUpGY01sSU43VUdS?=
 =?utf-8?B?ZnBDNXlJZEViWVlxc045M09kcEUwcEZtK2NoQ3NnbWt1M2FWdXBLeThnN3U4?=
 =?utf-8?B?WTk2R1E0YU5UcWU3V3gwck9nN2I4M2pVRkVhRklFVTRsejQ2S2t6SWs2cXFI?=
 =?utf-8?B?ZmhFSERYcUdTaEJPM2FsUVF2RHk2MVhZbk01c1BjbUNsdUwrR2ZXZG84Qi9o?=
 =?utf-8?B?cy91a0pCTklIL1NtOXAxVHFiU1dIL05tRmNieE44b0xMNVphKzF3UUdONEQv?=
 =?utf-8?B?R2twM3VucUdwRVJWVXl6L2orMFFnSW5nMWU5a05BekhDbmIyVTlqL1VrOVhO?=
 =?utf-8?B?RnlQQ1gvSDlzNDhCZHVsMGtTOXZNQmFXdFNwVEhnUXJoMU9UakVRTEkvQ0Jy?=
 =?utf-8?B?Q1JIMWlNM0tsbTFaOVBZaWhNT3NHYjJtd0dkNjZHWWVZbTYwNWlwRjdSWWdD?=
 =?utf-8?B?K1cxU0dBaGsyeXR2a0sxQXRvazIwWTdlQTZxMEVtUWptWG5SVDNOM1VwdmV2?=
 =?utf-8?B?bnZ6MnZ5b2ovRFgxMFlsQ3U1aU1qNGpQWWtPY0xmTmNCRklkMlNoRW5SLzl3?=
 =?utf-8?B?eUFEL1Jyenp6bXkzaGxwbm9nRmlOSFVNT3ptOGYxYUd4UDBISGRLMWpLZW9n?=
 =?utf-8?B?TlhlVkUxOTJVeHltN0c1ajJsdWxXa0VlRDRIZm9WK1Y4eXhWZzhiUjlMMzRh?=
 =?utf-8?B?cHdsTXExMXhqZDE2T2tQU1p6OEl4d3AyaStocDBIdnNEaFFxakdxOGcrS3Vs?=
 =?utf-8?B?RlhDeldKMkYrWjVXb3lyS0o4Z1BDRTBPZ1E0cTc3cVJqczhBSXF3ZXVPaXVz?=
 =?utf-8?B?OUU4WnEvWENYYlh6c2tjZUJMREVxYnh5YjA5aW9lQmxld2YvVDVReGo0UDBs?=
 =?utf-8?B?ZC92Si9sVkZ5b0pCcUNXQnUxbVd5a2JPeXJiQ0Nady8wM1FYbXRBZFJIcFll?=
 =?utf-8?B?Z0JiV1l6RmNqNVlPR2MwR2ErU2JxeW5EdzhMZWhUaTh4dmZGWHk3RTJvTHB4?=
 =?utf-8?B?Vzg4YmtIZ0JUT1BYcGhUdFV5UkMvcGlpRklMREVFMC83d2FDOUdlVWs1MENp?=
 =?utf-8?B?clM3V25iS1NGM1BmczdHNmN4enRZUThkbEZGZ3FsbnVBcW5ZSFpYTkNGV2Fs?=
 =?utf-8?B?ZzlTZlpucW13VmkydHFSM044VGVQVEp4WnRkaWp5bGo1U056TUZ6dWgvaUx2?=
 =?utf-8?B?UTlNWmR2U0ZWcjEwL1g2YVFwalhCUU1JbFptVUF5Z2NDTGhBaThtZ0VpbUhY?=
 =?utf-8?B?THVNbnp4clNMdmZPaGxMSjJ2Mk9YOHR3ZTBNWm9LRkw4dWNQUk1kZWl2by92?=
 =?utf-8?B?bFB4bmpmaGRGQlJvdWlLcE01K2RHeGd4NjY4QUJ0SEh6YTNoWlEydWYwVG1x?=
 =?utf-8?B?ZU5HWm81dHRZUlJ3UDcyTmRSMHFsbzVQTm85aUYvaFBGVGo4WWxNZkVrZWxU?=
 =?utf-8?B?UUt2b1A5aFBFMXB0ZGJGbHI3SzN1OVNILy9XZU1RMDRISjhibU9xZWE0UVdq?=
 =?utf-8?B?eU8zMWk2cnNmOE5xa0JnWnRYRjVBSWZtdG1IQU5KVWtBUG51VnJ3UDdSTTg3?=
 =?utf-8?B?WGR0OC9iUFZsYmZRUnlRaThNOGVCN2VRSExQN3VhY1paRUR2Tk50bURFODZ6?=
 =?utf-8?B?SVUrMzV5SkttN1FDa1BNQ2x4ZlErSTJmM0R6Qnc1WDVMNXAzblpMUC9DZXpR?=
 =?utf-8?B?K0h6RHNxeEowQ0oycVRpUWM3U1V5eDIyWFVZaTV6N3BWdmU5ejZDa1NWMlh6?=
 =?utf-8?B?N0hLWTlJa05Wb1ZRbVMyc05XZjg1ZE94ZUxTL0Y3T0YxUStDcnFiL3UyN0FE?=
 =?utf-8?Q?SDpEBzxK+CiMsv/TH53d93Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAD6DE320B0E414E928156744F946784@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5228e9-d9c0-443a-279d-08db45b18383
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 17:21:32.0642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kk2Q/R+k6vx1hKsyY77Y3v+4EqnyhJBzYMz6u/Y60qubwiXECzEiFnJk1O9Ukk04u0kIc81Lje8IEXYiupuKoivmtehCqHef790dVBWdxqi/zCS1bDcm6yptzFvetvcv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5376
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
Cc: "chris.p.wilson@linux.intel.com" <chris.p.wilson@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, "Das, 
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA0LTI1IGF0IDE2OjQxICswMzAwLCBKb29uYXMgTGFodGluZW4gd3JvdGU6
DQo+ICgrIEZhaXRoIGFuZCBEYW5pZWwgYXMgdGhleSBoYXZlIGJlZW4gaW52b2x2ZWQgaW4gcHJl
dmlvdXMgZGlzY3Vzc2lvbnMpDQpBbiBvcnRob2dvbmFsIChidXQgbG9zZWx5IHJlbGF0ZWQpIHF1
ZXN0aW9uOiBJcyBQWFAgdGhlIG9ubHkgc3Vic3lzdGVtIHRoYXQgaGFzDQp0aGUgdW5pcXVlIHBy
b2JsZW0gb2Y6IFVzZXMgYSBkZWxheWVkIHdvcmtlciB0byBjb21wbGV0ZSBhbGwgZGVwZW5kZW5j
aWVzIGZvciBpbml0Li4NCmJ1dCB0aGV5IHRha2Ugc28gbG9uZyB0aGF0IGJ5IHRoZSB0aW1lIGNv
bXBvc2l0b3JzLW1lc2EtaW5pdCBjb21lcyB1cCwgY3JlYXRpb24NCm9mIFBYUCBjb250ZXh0IGJs
b2NrcyB0b28gbG9uZyBhbmQgbWF5IHN0aWxsIGxpa2VseSBmYWlsaW5nIGFuZCBpbmNvcnJlY3Rs
eQ0KYXNzdW1pbmcgUFhQIGlzIG5vdCBzdXBwb3J0ZWQuICh3aGVuIHdlIGRvbid0IGhhdmUgYSBH
RVRfUEFSQU0gZm9yIGl0KS4NCkkgYmVsaWV2ZSBIdUMgaGFzIGEgc2ltaWxpYXIgaXNzdWUgLSBi
dXQgZG9lc250IHJlZmxlY3QgaW4gdGhlIFVBUEkgYnV0IHJhdGhlciB0aGUgY21kIGJ1ZmZlcnMu
DQpXZSBkb24ndCBoYXZlIG90aGVyIHN1YnN5c3RlbXMgdGhhdCBoYXZlIHRoaXMgcHJvYmxlbT8g
KGRlcGVuZGVuY3kgb24gb3RoZXIgc3RhcnR1cHM/KQ0KDQo=
