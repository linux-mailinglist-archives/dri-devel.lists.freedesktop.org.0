Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5F55BBAC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 20:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD0C11AE28;
	Mon, 27 Jun 2022 18:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5226F11AE29;
 Mon, 27 Jun 2022 18:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656356327; x=1687892327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nG5TsZ/KnbnP71jxjx9eD0Muw81OG/Qvfh7Cz79msEo=;
 b=LBzBMhwqdSR3EN+i3HbcE6WU3Oh4OhMQnTOTJdVqv91HxvsWdlFpS1pq
 6CecO2/qiTTpMKRU8SLIQkt9+fb9gUQNZVkT2LrpCuE8XpTWheRa6J7L/
 0sBoOUOfDRIzlUSnYbmT9ZYok/BYNuPUAqN3U/BSXil7EDOx1m52o1Ocf
 xvHmCeiVCPnNqoYYwTL8BsBLP7iCbUspRnLKbRZHmV5NXvpBR6lG7IdHv
 +PZ72lCPyt1asAhs5GpzoJ1bkXajMHjOMlei+8gT6UTY2v04VcPjlou7d
 1qbMKbIMSAV0zdurMa/83hLJ2MYhW8vl9UymZRm5M/cCijYU6NEXqlNV+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="307013007"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="307013007"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 11:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="587556404"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 27 Jun 2022 11:58:46 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 11:58:46 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 11:58:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 11:58:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 11:58:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvHfpRzouTzS920HNELm8n4j4yj62KYfXugrdYpuCrNi+WHjpF8kiLJ5lA4Nt4j2QcPa1xJNV7ngaWGqYmZv5F/N/ZQOgvbrxpPP/Q1RznseSFm5azxpKDOPUoAF68pW8TaF/CVNbN0LyX2KeM82gdRdWPVZrxO/17Ex6sq8uRWIY35y5a0sqXoKWaxIR6/OjO0k9B2G2262H5SI84YwoSSpezVKdJLJPou0zvhAaN+Cr+HqJOdviHXsFnHqgCtr0NCGTqGXdmd8mmDj6OjJ/2kk95PKzUc4wT5fZmajArwHqfx1KtXbD+tj+emFrQsJcpjSBAsDKBOxYuKeZifaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG5TsZ/KnbnP71jxjx9eD0Muw81OG/Qvfh7Cz79msEo=;
 b=OeWRuhunr1jM8ISMsjC2G94tSNyvYGPJ9bxbYzY07zy/JuPItIE166zHu1eRGeberiAhDGZsZQnyTAYcaXwkmUyGo7EKO+s3GrWHvBfuNkEBffpkWhU9fstqQHY69V+5cib6YKnymYUYm0JTb38hfQQpxb0LpoeBMuhsQpWdPydJthsAQym+rHCIm8CiI5jZqXKyjFy6ajwd0pm1u9Xl+nwuaqKxydW5QXFO9geYvuX8VdofXBspXRy/pg2Bk3/mxwx5rqyZRSSAYYqtlGNNy+ou+ZPm+B7xBMk+rqOQNHFXWdL500KVBiPFfKZ2MJ6kNnsFwwFG9elWR5kB5urdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by MN2PR11MB3582.namprd11.prod.outlook.com (2603:10b6:208:ec::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 18:58:42 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639%8]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 18:58:42 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Topic: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Index: AQHYhewtASI2jWfgB0G497ALZvi+T61bEx+AgAB2AwCAAAyDgIAADUaAgAEHWwCAAAh5AIAAI9AAgACkqeCAAMK1AIAAv6qAgAP2vgCAAKdA0A==
Date: Mon, 27 Jun 2022 18:58:42 +0000
Message-ID: <BN6PR11MB1633B73631737329161B289A92B99@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
 <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
 <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
 <BN6PR11MB1633C90D1B2E40359F1F168F92B59@BN6PR11MB1633.namprd11.prod.outlook.com>
 <1d36da1a-9224-5750-d103-60e7cdfdf8df@linux.intel.com>
 <BN6PR11MB1633F819E6DF445769061CF092B49@BN6PR11MB1633.namprd11.prod.outlook.com>
 <1f2ce51e-4b45-c654-954a-a71899309fb5@linux.intel.com>
In-Reply-To: <1f2ce51e-4b45-c654-954a-a71899309fb5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 064e367b-752e-4cfa-61ef-08da586f0db8
x-ms-traffictypediagnostic: MN2PR11MB3582:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yO4m3GNtV0qqRUBf0u78cjgLIXLdM2WOGCuix0A0eJXS7XjnBRBA5ziqGyHbNpR8P+2Q+bm+NawBijQnMJxEAnqK3fOz7ebknyJL7LsgzbTl0bS4Q3hebYBAixb2b3QyOr+lXdGKe3eH1wKvGpPUNuETzSvcM/KYQ/PjM2nuM8Kzh4d9kZefSMecDZE0SQZA+MCPrO7c9VvbLE6EMWjcuiQFfV4J+IsTf7WsH8Nr/WFD5j9e5PKKhqqo+YLyPdStDG9zx8a+HkGcG9g0lDAgSet6dwze87qTF6Y1Pd6/t4lUo9G09bb08GYXwcEz+Prb4zqPF0e1PgeX2ZoBLw8r4zN34I8iglpVY8zsWcfp08ZbaxIwRrlJpm2Q+xTMJBAtgOb/LxOV9QCB2BWITnibTC6YAw2L3TZQCjGeqZC69Wm5K8Bej3OW7pkRZRRlytmfiNlbt18tVBvAxFnY4vwnZpGETLeqqjY7eGO1AXnO7oeJlZ7c2aehwbtLRaBbNYDR8V8MOJl1hSuSKLzLKsAQo8u//23inGwwybZoxpBqu5/Kpfd4o89UJMj8MxyRWAH2UQq8czRJjFJycfdA15qbU7fBignLByl2woiNM77fAO/vhuj3CHjVRB27CEe2GrekoNXyeJUnLC/bs1epdEhsdEwcvMqPr11DzwnIaPEOFW703l8p03OOrRbC6KYYX6nRMsfg+WxhOwufe2mZ/69xgFZum37jlF+Gsc/R8eWujKJwoFbEnuhneF0/BhrzjtnA/lx0163lkn9bt/SLd0ZM1NyA1cJNewi15F32nOa07Vo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(376002)(39860400002)(136003)(366004)(53546011)(8936002)(86362001)(5660300002)(38100700002)(52536014)(2906002)(9686003)(54906003)(110136005)(122000001)(6636002)(26005)(76116006)(66446008)(55016003)(33656002)(41300700001)(316002)(83380400001)(186003)(6506007)(64756008)(8676002)(7696005)(66556008)(38070700005)(66476007)(478600001)(4326008)(82960400001)(71200400001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWN4T2JjazVnNm1ReTdmazJNdk9sdUhOeG81NHdaRkRtWEpOSjVxTDVvN2NC?=
 =?utf-8?B?L3JwWUgreC9zbjZZUEc0ZDNUWWF5ZndyRjdXcGNSK0V1QzIwRitranNDTDVv?=
 =?utf-8?B?SW9la3FPVGFuS0FUMmJCR3gzL0hzU3JwRUxzaU1tL0sza1d0MloxRWpYQzZY?=
 =?utf-8?B?aVlyMlBQdGNqQXNrdE1qendHTmpsUzh2T3dWZWpjc292ZU5EV3E1TFUvcWc0?=
 =?utf-8?B?Z2NsbW1ZN1gxdGVNVDFWWGN5NVZhazc3bm4ramh6TXRqYmhaVFVTaUF4cFRy?=
 =?utf-8?B?bDBHM1hLRVJHM3BtZVByeG9OckhzMjRDeGViem5Qdk9iUmp2T3k2VldjaEFW?=
 =?utf-8?B?OHEvTUlhdDJiWVc2aWh4cEdWZTlnNWxEQlBwVHFVMzhHbWZSNmVUZVJHaUxY?=
 =?utf-8?B?akR4YnV1YS8vY1lNOHdzVzB2eVdlbG1KMXFPZC9lSzhreWlTdjNQS0tRdmNL?=
 =?utf-8?B?UUtoa2JFRVltQ0RjUDFVZFl1dGdGS3l2cktHTVlpeGhOLzdVUUVLWDE0cHM5?=
 =?utf-8?B?WnlNRDdtTHkvU21tY1k5MTI5QnA1SktZZXMrZWhqbEwxU1Z0ZEVFeGpDb3Mw?=
 =?utf-8?B?VFFkVXBVSlQ1UUpKL3Q5Q3VZelEzaDg2amtzRlB3OWpuUDBvdmNYbTB5SWRV?=
 =?utf-8?B?dlJCMDM1WStuam1WSUlrbjN1VFlDa1BkajJSSGgwbXFXNjF0Nk01Q0doTVYv?=
 =?utf-8?B?eDZpZGJSbzdQODhLUEtpNERUSTBCQ3ZaNWpXendIaFNBNkVMdU5pN0l1NTZi?=
 =?utf-8?B?L3dQeUdBTTBFeTlqSnBQZDQ2cWRIWERDM0RCMXhoM0hsdk1qODBFMkdwYk9X?=
 =?utf-8?B?ODBiOE5DRVN4d3dJUXA1V0hKYkZLenZBeWNCcmZYZ0k5eFc1MVBlU1Z2TUNI?=
 =?utf-8?B?OElEN3NrWXU3MUlsZitUcnJWU0JFb1RTWm5jZGtIVUdyNVNBdXpTakhCREtr?=
 =?utf-8?B?NUlxektycGY4RHZxNXo3R1JqaTBESkJFY3hFckUxOUdMMmNaTkorYmxrbEUr?=
 =?utf-8?B?cURqNG53Nk9oVFZtc3lNY2tzQkxYMmd4aC9wS2MzVkVseHhsdUdKTlNtSEJs?=
 =?utf-8?B?eVpXQjhqUmJBN3RPUG5pSlk1UGU0RCs5TmdaREgvMER3UHBrbTJNcmkrVXlH?=
 =?utf-8?B?WDRHYmR3Q05yZHAwZjJkbXc5cGRZRk9OVGtBQldRd1N0UFRJUW1LeXNCOTQz?=
 =?utf-8?B?RWZWUXZWUHJjSXJiSHVpeXJMd2RNWklWUDR1NG1MRlVrQUMwUlRod0ltWVJy?=
 =?utf-8?B?SHVJUFpTSUQ2SVVtbldzY21DZkcyOEo0MFZCKzBNNXNGMWp3aG12VGZmMHpu?=
 =?utf-8?B?MjFVQVplMS8xU2ZRZjgzRG9YVW4vdDlRVFRJNVNOYVhtTmJMU1kyTmR2RzJ1?=
 =?utf-8?B?c1JjUjdabFpuQlVPeWlNQ05lUU04NVhYak5LTFNpWTBlWTgyekdxMmNNRjVi?=
 =?utf-8?B?eUU1U2JDWVpLUHBTVlptYWpTMjZRZkNwQzhBRTdWZzNsaEdQRDlOelRXU29Q?=
 =?utf-8?B?QnRYZis4aVNiZjFLL1VlL1U0eldxMkw2Z2FKRzIvcWc0anptQ1dtUUZsWFBt?=
 =?utf-8?B?V0NCYjJxSDBSR1hEYVVJTDBwa3dhdmd6aFlXakp4QWVwZVNUcjA3c0ZyQnA3?=
 =?utf-8?B?cmRyUlNJVzNMd2R4V3hPakpGK2NaRlk2RWhveVpFc2J2R0FjalRNblZ6VW5T?=
 =?utf-8?B?QW5za3MvV3JzYmk0OWpFcllaU3lZbXQvZG45dWNEeXNwbVNlSy83alpyUlRk?=
 =?utf-8?B?SjAxZTVnaUhJRzkrYUdPL2thaHpmQ21ORytRNG82aU5qZiszNFZodWJaN2la?=
 =?utf-8?B?b0xTNXE3MUFKSDRneXhscWxRckhSZTQ1bG5vSDlucnYyRVlXT3duK1ZlcWY4?=
 =?utf-8?B?YXpVcHdVSVB6MmVJd2dyUlY1OHRhNmh2QUY2R1JmQzNBbEJzemdRT0FXcDRB?=
 =?utf-8?B?eElyZEdJWERlTlJyYzVSVU45RmVIc1JOZkNYUVEwM25wOEdqb1ZwQ2hYWEVs?=
 =?utf-8?B?ZkNzUGF0UTcrT2wyZE1iMndBcENrT0VmeHMxdDVReFJSNmFBcFIwSk5OQjla?=
 =?utf-8?B?R1kyL1N5Ny9sVVQzRVV0dW5VR0RqN1htU0NDbDM5NXBJZHIrckUweGdFNkhI?=
 =?utf-8?Q?Jaty0BKh82WtDNHWQzvhmGBhe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064e367b-752e-4cfa-61ef-08da586f0db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 18:58:42.0991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rYqzL5CM3cDDFysRyTxhkSKvkteb9edQXcEK+HRGn6lh33stBICx2XPFN8PuClCfgURWPOp1XeYKgpPw/WJ2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3582
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClRoYW5rcywNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6
IEp1bmUgMjcsIDIwMjIgNDozMCBBTQ0KPiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5j
b20+OyBMYW5kd2VybGluLCBMaW9uZWwgRw0KPiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5j
b20+OyBWaXNod2FuYXRoYXB1cmEsIE5pcmFuamFuYQ0KPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhh
cHVyYUBpbnRlbC5jb20+DQo+IENjOiBaYW5vbmksIFBhdWxvIFIgPHBhdWxvLnIuemFub25pQGlu
dGVsLmNvbT47IGludGVsLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBIZWxsc3Ryb20sDQo+IFRob21hcyA8dGhvbWFzLmhlbGxz
dHJvbUBpbnRlbC5jb20+OyBXaWxzb24sIENocmlzIFANCj4gPGNocmlzLnAud2lsc29uQGludGVs
LmNvbT47IFZldHRlciwgRGFuaWVsIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT47DQo+IGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbTsgQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCB2MyAzLzNdIGRybS9kb2MvcmZj
OiBWTV9CSU5EIHVhcGkgZGVmaW5pdGlvbg0KPiANCj4gDQo+IE9uIDI0LzA2LzIwMjIgMjE6MjMs
IFplbmcsIE9hayB3cm90ZToNCj4gPiBMZXQncyBjb21wYXJlICJ0bGIgaW52YWxpZGF0ZSBhdCB2
bSB1bmJpbmQiIHZzICJ0bGIgaW52YWxpZGF0ZSBhdCBiYWNraW5nDQo+IHN0b3JhZ2UiOg0KPiA+
DQo+ID4gQ29ycmVjdG5lc3M6DQo+ID4gY29uc2lkZXIgdGhpcyBzZXF1ZW5jZSBvZjoNCj4gPiAx
LiB1bmJpbmQgdmExIGZyb20gcGExLA0KPiA+IDIuIHRoZW4gYmluZCB2YTEgdG8gcGEyLiAvL3Vz
ZXIgc3BhY2UgaGFzIHRoZSBmcmVlZG9tIHRvIGRvIHRoaXMgYXMgaXQNCj4gPiBtYW5hZ2VzIHZp
cnR1YWwgYWRkcmVzcyBzcGFjZSAzLiBTdWJtaXQgc2hhZGVyIGNvZGUgdXNpbmcgdmExLCA0LiBU
aGVuDQo+ID4gcmV0aXJlIHBhMS4NCj4gPg0KPiA+IElmIHlvdSBkb24ndCBwZXJmb3JtIHRsYiBp
bnZhbGlkYXRlIGF0IHN0ZXAgIzEsIGluIHN0ZXAgIzMsIHNoYWRlciB3aWxsIHVzZQ0KPiBzdGFs
ZSBlbnRyaWVzIGluIHRsYiBhbmQgcGExIHdpbGwgYmUgdXNlZCBmb3IgdGhlIHNoYWRlci4gVXNl
ciB3YW50IHRvIHVzZSBwYTIuDQo+IFNvIEkgZG9uJ3QgdGhpbmsgaW52YWxpZGF0ZSB0bGIgYXQg
c3RlcCAjNCBtYWtlIGNvcnJlY3RuZXNzLg0KPiANCj4gRGVmaW5lIHN0ZXAgMy4gSXMgaXQgYSBu
ZXcgZXhlY2J1Zj8gSWYgc28gdGhlbiB0aGVyZSB3aWxsIGJlIGEgVExCIGZsdXNoIHRoZXJlLg0K
PiBVbmxlc3MgdGhlIHBsYW4gaXMgdG8gc3RvcCBkb2luZyB0aGF0IHdpdGggZWIzIGJ1dCBJIGhh
dmVuJ3QgcGlja2VkIHVwIG9uIHRoYXQNCj4gYW55d2hlcmUgc28gZmFyLg0KDQpJbiBOaXJhbmph
bmEncyBsYXRlc3QgcGF0Y2ggc2VyaWVzLCBoZSByZW1vdmVkIHRoZSBUTEIgZmx1c2hpbmcgZnJv
bSB2bV91bmJpbmQuIEhlIGFsc28gc2FpZCBleHBsaWNpdGx5IFRMQiBpbnZhbGlkYXRpb24gd2ls
bCBiZSBwZXJmb3JtZWQgYXQgam9iIHN1Ym1pc3Npb24gYW5kIGJhY2tpbmcgc3RvcmFnZSByZWxl
YXNpbmcgdGltZSwgd2hpY2ggaXMgdGhlIGV4aXN0aW5nIGJlaGF2aW9yIG9mIHRoZSBjdXJyZW50
IGk5MTUgZHJpdmVyLg0KDQpJIHRoaW5rIGlmIHdlIGludmFsaWRhdGUgVExCIG9uIGVhY2ggdm1f
dW5iaW5kLCB0aGVuIHdlIGRvbid0IG5lZWQgdG8gaW52YWxpZGF0ZSBhdCBzdWJtaXNzaW9uIGFu
ZCBiYWNraW5nIHN0b3JhZ2UgcmVsZWFzaW5nLiBJdCBkb2Vzbid0IG1ha2UgYSBsb3Qgb2Ygc2Vu
c2UgdG8gbWUgdG8gcGVyZm9ybSBhIHRsYiBpbnZhbGlkYXRpb24gYXQgZXhlY2J1ZiB0aW1lLiBN
YXliZSBpdCBpcyBhIGJlaGF2aW9yIGZvciB0aGUgb2xkIGltcGxpY2l0IGJpbmRpbmcgcHJvZ3Jh
bW1pbmcgbW9kZWwuIEZvciB2bV9iaW5kIGFuZCBlYjMsIHdlIHNlcGFyYXRlIHRoZSBiaW5kaW5n
IGFuZCBqb2Igc3VibWlzc2lvbiBpbnRvIHR3byBBUElzLiBJdCBpcyBtb3JlIG5hdHVyYWwgdGhl
IFRMQiBpbnZhbGlkYXRpb24gYmUgY291cGxlZCB3aXRoIHRoZSB2bSBiaW5kL3VuYmluZCwgbm90
IGpvYiBzdWJtaXNzaW9uLiBTbyBpbiBteSBvcGluaW9uIHdlIHNob3VsZCByZW1vdmUgdGxiIGlu
dmFsaWRhdGlvbiBmcm9tIHN1Ym1pc3Npb24gYW5kIGJhY2tpbmcgc3RvcmFnZSByZWxlYXNpbmcg
YW5kIGFkZCBpdCB0byB2bSB1bmJpbmQuIFRoaXMgaXMgbWV0aG9kIGlzIGNsZWFuZXIgdG8gbWUu
DQoNClJlZ2FyZGluZyBwZXJmb3JtYW5jZSwgd2UgZG9uJ3QgaGF2ZSBkYXRhLiBJbiBteSBvcGlu
aW9uLCB3ZSBzaG91bGQgbWFrZSB0aGluZ3Mgd29yayBpbiBhIG1vc3Qgc3RyYWlnaHQgZm9yd2Fy
ZCB3YXkgYXMgdGhlIGZpcnN0IHN0ZXAuIFRoZW4gY29uc2lkZXIgcGVyZm9ybWFuY2UgaW1wcm92
ZW1lbnQgaWYgbmVjZXNzYXJ5LiBDb25zaWRlciBzb21lIGRlbGF5ZWQgdGxiIGludmFsaWRhdGlv
biBhdCBzdWJtaXNzaW9uIGFuZCBiYWNraW5nIHJlbGVhc2UgdGltZSB3aXRob3V0IHBlcmZvcm1h
bmNlIGRhdGEgc3VwcG9ydCB3YXNuJ3QgYSBnb29kIGRlY2lzaW9uLg0KDQpSZWdhcmRzLA0KT2Fr
DQoNCj4gDQo+ID4gUGVyZm9ybWFuY2U6DQo+ID4gSXQgaXMgc3RyYWlnaHQgZm9yd2FyZCB0byBp
bnZhbGlkYXRlIHRsYiBhdCBzdGVwIDEuIElmIHBsYXRmb3JtIHN1cHBvcnQgcmFuZ2UNCj4gYmFz
ZWQgdGxiIGludmFsaWRhdGlvbiwgd2UgY2FuIHBlcmZvcm0gcmFuZ2UgYmFzZWQgaW52YWxpZGF0
aW9uIGVhc2lseSBhdA0KPiBzdGVwMS4NCj4gDQo+IElmIHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBy
YW5nZSBiYXNlIHllcy4gSWYgaXQgZG9lc24ndCBfYW5kXyB0aGUgZmx1c2ggYXQNCj4gdW5iaW5k
IGlzIG5vdCBuZWVkZWQgZm9yIDk5JSBvZiB1c2UgY2FzZXMgdGhlbiBpdCBpcyBzaW1wbHkgYSB3
YXN0ZS4NCj4gDQo+ID4gSWYgeW91IGRvIGl0IGF0IHN0ZXAgNCwgeW91IGVpdGhlciBuZWVkIHRv
IHBlcmZvcm0gYSB3aG9sZSBndCB0bGIgaW52YWxpZGF0aW9uDQo+ICh3b3JzZSBwZXJmb3JtYW5j
ZSksIG9yIHlvdSBuZWVkIHRvIHJlY29yZCBhbGwgdGhlIFZBcyB0aGF0IHRoaXMgcGEgaGFzIGJl
ZW4NCj4gYm91bmQgdG8gYW5kIGludmFsaWRhdGUgYWxsIHRoZSBWQSByYW5nZXMgLSB1Z2x5IHBy
b2dyYW0uDQo+IA0KPiBTb21lb25lIGNhbiBzZXR1cCBzb21lIGJlbmNobWFya2luZz8gOikNCj4g
DQo+IFJlZ2FyZHMsDQo+IA0KPiBUdnJ0a28NCj4gDQo+ID4NCj4gPg0KPiA+IFRoYW5rcywNCj4g
PiBPYWsNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPg0KPiA+PiBTZW50
OiBKdW5lIDI0LCAyMDIyIDQ6MzIgQU0NCj4gPj4gVG86IFplbmcsIE9hayA8b2FrLnplbmdAaW50
ZWwuY29tPjsgTGFuZHdlcmxpbiwgTGlvbmVsIEcNCj4gPj4gPGxpb25lbC5nLmxhbmR3ZXJsaW5A
aW50ZWwuY29tPjsgVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmENCj4gPj4gPG5pcmFuamFuYS52
aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPg0KPiA+PiBDYzogWmFub25pLCBQYXVsbyBSIDxwYXVs
by5yLnphbm9uaUBpbnRlbC5jb20+OyBpbnRlbC0NCj4gPj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4gSGVsbHN0cm9tLCBU
aG9tYXMgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPjsgV2lsc29uLCBDaHJpcyBQDQo+ID4+
IDxjaHJpcy5wLndpbHNvbkBpbnRlbC5jb20+OyBWZXR0ZXIsIERhbmllbCA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Ow0KPiA+PiBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb207IEF1bGQsIE1hdHRo
ZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4
XSBbUEFUQ0ggdjMgMy8zXSBkcm0vZG9jL3JmYzogVk1fQklORCB1YXBpDQo+ID4+IGRlZmluaXRp
b24NCj4gPj4NCj4gPj4NCj4gPj4gT24gMjMvMDYvMjAyMiAyMjowNSwgWmVuZywgT2FrIHdyb3Rl
Og0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogSW50ZWwt
Z2Z4IDxpbnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0K
PiA+Pj4+IE9mIFR2cnRrbyBVcnN1bGluDQo+ID4+Pj4gU2VudDogSnVuZSAyMywgMjAyMiA3OjA2
IEFNDQo+ID4+Pj4gVG86IExhbmR3ZXJsaW4sIExpb25lbCBHIDxsaW9uZWwuZy5sYW5kd2VybGlu
QGludGVsLmNvbT47DQo+ID4+Pj4gVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFu
YS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPg0KPiA+Pj4+IENjOiBaYW5vbmksIFBhdWxvIFIg
PHBhdWxvLnIuemFub25pQGludGVsLmNvbT47DQo+ID4+Pj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4+PiBIZWxs
c3Ryb20sIFRob21hcyA8dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+OyBXaWxzb24sIENocmlz
IFANCj4gPj4+PiA8Y2hyaXMucC53aWxzb25AaW50ZWwuY29tPjsgVmV0dGVyLCBEYW5pZWwNCj4g
Pj4+PiA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+OyBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb207
IEF1bGQsDQo+IE1hdHRoZXcNCj4gPj4+PiA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPj4+
PiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIHYzIDMvM10gZHJtL2RvYy9yZmM6IFZN
X0JJTkQgdWFwaQ0KPiA+Pj4+IGRlZmluaXRpb24NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gT24g
MjMvMDYvMjAyMiAwOTo1NywgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6DQo+ID4+Pj4+IE9uIDIz
LzA2LzIwMjIgMTE6MjcsIFR2cnRrbyBVcnN1bGluIHdyb3RlOg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+
Pj4gQWZ0ZXIgYSB2bV91bmJpbmQsIFVNRCBjYW4gcmUtYmluZCB0byBzYW1lIFZBIHJhbmdlIGFn
YWluc3QgYW4NCj4gPj4+Pj4+PiBhY3RpdmUgVk0uDQo+ID4+Pj4+Pj4gVGhvdWdoIEkgYW0gbm90
IHN1ZSB3aXRoIE1lc2EgdXNlY2FzZSBpZiB0aGF0IG5ldyBtYXBwaW5nIGlzDQo+ID4+Pj4+Pj4g
cmVxdWlyZWQgZm9yIHJ1bm5pbmcgR1BVIGpvYiBvciBpdCB3aWxsIGJlIGZvciB0aGUgbmV4dA0K
PiA+Pj4+Pj4+IHN1Ym1pc3Npb24uIEJ1dCBlbnN1cmluZyB0aGUgdGxiIGZsdXNoIHVwb24gdW5i
aW5kLCBLTUQgY2FuDQo+ID4+Pj4+Pj4gZW5zdXJlIGNvcnJlY3RuZXNzLg0KPiA+Pj4+Pj4NCj4g
Pj4+Pj4+IElzbid0IHRoYXQgdGhlaXIgcHJvYmxlbT8gSWYgdGhleSByZS1iaW5kIGZvciBzdWJt
aXR0aW5nIF9uZXdfDQo+ID4+Pj4+PiB3b3JrIHRoZW4gdGhleSBnZXQgdGhlIGZsdXNoIGFzIHBh
cnQgb2YgYmF0Y2ggYnVmZmVyIHByZS1hbWJsZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gSW4gdGhlIG5v
biBzcGFyc2UgY2FzZSwgaWYgYSBWQSByYW5nZSBpcyB1bmJvdW5kLCBpdCBpcyBpbnZhbGlkIHRv
DQo+ID4+Pj4+IHVzZSB0aGF0IHJhbmdlIGZvciBhbnl0aGluZyB1bnRpbCBpdCBoYXMgYmVlbiBy
ZWJvdW5kIGJ5IHNvbWV0aGluZw0KPiBlbHNlLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBXZSdsbCB0YWtl
IHRoZSBmZW5jZSBwcm92aWRlZCBieSB2bV9iaW5kIGFuZCBwdXQgaXQgYXMgYSB3YWl0DQo+ID4+
Pj4+IGZlbmNlIG9uIHRoZSBuZXh0IGV4ZWNidWZmZXIuDQo+ID4+Pj4+DQo+ID4+Pj4+IEl0IG1p
Z2h0IGJlIHNhZmVyIGluIGNhc2Ugb2YgbWVtb3J5IG92ZXIgZmV0Y2hpbmc/DQo+ID4+Pj4+DQo+
ID4+Pj4+DQo+ID4+Pj4+IFRMQiBmbHVzaCB3aWxsIGhhdmUgdG8gaGFwcGVuIGF0IHNvbWUgcG9p
bnQgcmlnaHQ/DQo+ID4+Pj4+DQo+ID4+Pj4+IFdoYXQncyB0aGUgYWx0ZXJuYXRpdmUgdG8gZG8g
aXQgaW4gdW5iaW5kPw0KPiA+Pj4+DQo+ID4+Pj4gQ3VycmVudGx5IFRMQiBmbHVzaCBoYXBwZW5z
IGZyb20gdGhlIHJpbmcgYmVmb3JlIGV2ZXJ5IEJCX1NUQVJUIGFuZA0KPiA+Pj4+IGFsc28gd2hl
biBpOTE1IHJldHVybnMgdGhlIGJhY2tpbmcgc3RvcmUgcGFnZXMgdG8gdGhlIHN5c3RlbS4NCj4g
Pj4+DQo+ID4+Pg0KPiA+Pj4gQ2FuIHlvdSBleHBsYWluIG1vcmUgd2h5IHRsYiBmbHVzaCB3aGVu
IGk5MTUgcmV0aXJlIHRoZSBiYWNraW5nDQo+ID4+PiBzdG9yYWdlPyBJDQo+ID4+IG5ldmVyIGZp
Z3VyZWQgdGhhdCBvdXQgd2hlbiBJIGxvb2tlZCBhdCB0aGUgY29kZXMuIEFzIEkgdW5kZXJzdGFu
ZA0KPiA+PiBpdCwgdGxiIGNhY2hlcyB0aGUgZ3B1IHBhZ2UgdGFibGVzIHdoaWNoIG1hcCBhIHZh
IHRvIGEgcGEuIFNvIGl0IGlzDQo+ID4+IHN0cmFpZ2h0IGZvcndhcmQgdG8gbWUgdGhhdCB3ZSBw
ZXJmb3JtIGEgdGxiIGZsdXNoIHdoZW4gd2UgY2hhbmdlIHRoZQ0KPiA+PiBwYWdlIHRhYmxlIChl
aXRoZXIgYXQgdm0gYmluZCB0aW1lIG9yIHVuYmluZCB0aW1lLiBCZXR0ZXIgYXQgdW5iaW5kIHRp
bWUNCj4gZm9yIHBlcmZvcm1hbmNlIHJlYXNvbikuDQo+ID4+DQo+ID4+IEkgZG9uJ3Qga25vdyB3
aGF0IHBlcmZvcm1zIGJldHRlciAtIHNvbWVvbmUgY2FuIG1lYXN1cmUgdGhlIHR3bw0KPiA+PiBh
cHByb2FjaGVzPyBDZXJ0YWlubHkgb24gcGxhdGZvcm1zIHdoZXJlIHdlIG9ubHkgaGF2ZSBnbG9i
YWwgVExCDQo+ID4+IGZsdXNoaW5nIHRoZSBjb3N0IGlzIHF1aXRlIGhpZ2ggc28gbXkgdGhpbmtp
bmcgd2FzIHRvIGFsbG93IGk5MTUgdG8NCj4gPj4gY29udHJvbCB3aGVuIGl0IHdpbGwgYmUgZG9u
ZSBhbmQgbm90IGd1YXJhbnRlZSBpdCBpbiB0aGUgdWFwaSBpZiBpdCBpc24ndA0KPiBuZWVkZWQg
Zm9yIHNlY3VyaXR5IHJlYXNvbnMuDQo+ID4+DQo+ID4+PiBCdXQgaXQgaXMgcmF0aGVyIHRyaWNr
eSB0byBtZSB0byBmbHVzaCB0bGIgd2hlbiB3ZSByZXRpcmUgYSBiYWNraW5nDQo+ID4+PiBzdG9y
YWdlLiBJDQo+ID4+IGRvbid0IHNlZSBob3cgYmFja2luZyBzdG9yYWdlIGNhbiBiZSBjb25uZWN0
ZWQgdG8gcGFnZSB0YWJsZS4gTGV0J3MNCj4gPj4gc2F5IHVzZXIgdW5iaW5kIHZhMSBmcm9tIHBh
MSwgdGhlbiBiaW5kIHZhMSB0byBwYTIuIFRoZW4gcmV0aXJlIHBhMS4NCj4gPj4gU3VibWl0IHNo
YWRlciBjb2RlIHVzaW5nIHZhMS4gSWYgd2UgZG9uJ3QgdGxiIGZsdXNoIGFmdGVyIHVuYmluZCB2
YTEsDQo+ID4+IHRoZSBuZXcgc2hhZGVyIGNvZGUgd2hpY2ggaXMgc3VwcG9zZWQgdG8gdXNlIHBh
MiB3aWxsIHN0aWxsIHVzZSBwYTENCj4gPj4gZHVlIHRvIHRoZSBzdGFsZSBlbnRyaWVzIGluIHRs
YiwgcmlnaHQ/IFRoZSBwb2ludCBpcywgdGxiIGNhY2hlZCBpcw0KPiA+PiB0YWdnZWQgd2l0aCB2
aXJ0dWFsIGFkZHJlc3MsIG5vdCBwaHlzaWNhbCBhZGRyZXNzLiBzbyBhZnRlciB3ZSB1bmJpbmQN
Cj4gPj4gdmExIGZyb20gcGExLCByZWdhcmRsZXNzIHdlIHJldGlyZSBwYTEgb3Igbm90LA0KPiA+
PiB2YTEgY2FuIGJlIGJvdW5kIHRvIGFub3RoZXIgcGEyLg0KPiA+Pg0KPiA+PiBXaGVuIHlvdSBz
YXkgInJldGlyZSBwYTEiIEkgd2lsbCBhc3N1bWUgeW91IG1lYW50IHJlbGVhc2UgYmFja2luZw0K
PiA+PiBzdG9yYWdlIGZvciBwYTEuIEF0IHRoaXMgcG9pbnQgaTkxNSBjdXJyZW50bHkgZG9lcyBk
byB0aGUgVExCIGZsdXNoDQo+ID4+IGFuZCB0aGF0IGVuc3VyZXMgbm8gUFRFIGNhbiBwb2ludCB0
byBwYTEuDQo+ID4+DQo+ID4+IFRoaXMgYXBwcm9hY2ggZGVhbHMgd2l0aCBzZWN1cml0eSBvZiB0
aGUgc3lzdGVtIGFzIGEgd2hvbGUuIENsaWVudA0KPiA+PiBtYXkgc3RpbGwgY2F1c2UgcmVuZGVy
aW5nIGNvcnJ1cHRpb24gb3IgYSBHUFUgaGFuZyBmb3IgaXRzZWxmIGJ1dA0KPiA+PiB0aGF0IHNo
b3VsZCBiZSBjb21wbGV0ZWx5IGlzb2xhdGVkLiAoVGhpcyBpcyB0aGUgcGFydCB3aGVyZSB5b3Ug
c2F5DQo+ID4+ICJyZWdhcmRsZXNzIGlmIHdlIHJldGlyZQ0KPiA+PiBwYTEgb3Igbm90IiBJIHRo
aW5rLikNCj4gPj4NCj4gPj4gQnV0IEkgdGhpbmsgdGhvc2UgYXJlIGFkdmFuY2VkIHVzZSBjYXNl
cyB3aGVyZSB1c2Vyc3BhY2Ugd2FudHMgdG8NCj4gPj4gbWFuaXB1bGF0ZSBQVEVzIHdoaWxlIHNv
bWV0aGluZyBpcyBydW5uaW5nIG9uIHRoZSBHUFUgaW4gcGFyYWxsZWwuDQo+ID4+IEFGQUlLIGxp
bWl0ZWQgdG8gY29tcHV0ZSAiaW5maW5pdGUgYmF0Y2giIHNvIG15IHRoaW5raW5nIGlzIHRvIGF2
b2lkDQo+ID4+IGFkZGluZyBhIHBlcmZvcm1hbmNlIHBlbmFsdHkgdG8gdGhlIGNvbW1vbiBjYXNl
LiBFc3BlY2lhbGx5IG9uDQo+ID4+IHBsYXRmb3JtcyB3aGljaCBvbmx5IGhhdmUgZ2xvYmFsIGZs
dXNoLg0KPiA+Pg0KPiA+PiBCdXQuLiB0byBjaXJjbGUgYmFjayBvbiB0aGUgbWVhc3VyaW5nIGFu
Z2xlLiBVbnRpbCBzb21lb25lIGludmVzdHMNCj4gPj4gdGltZSBhbmQgZWZmb3J0IHRvIGJlbmNo
bWFyayB0aGUgdHdvIGFwcHJvYWNoZXMgKGZsdXNoIG9uIHVuYmluZCB2cw0KPiA+PiBmbHVzaCBv
biBiYWNraW5nIHN0b3JlIHJlbGVhc2UpIHdlIGRvbid0IHJlYWxseSBrbm93LiBBbGwgSSBrbm93
IGlzDQo+ID4+IHRoZSBwZXJmIGhpdCB3aXRoIHRoZSBjdXJyZW50IHNvbHV0aW9uIHdhcyBzaWdu
aWZpY2FudCwgQUZBSVIgdXAgdG8NCj4gPj4gdGVlbiBkaWdpdHMgb24gc29tZSBnYW1lcy4gQW5k
IGNvbnNpZGVyaW5nIHRoZSBmbHVzaGVzIHdlcmUgZHJpdmVuDQo+ID4+IG9ubHkgYnkgdGhlIHNo
cmlua2VyIGFjdGl2aXR5LCBteSB0aGlua2luZyB3YXMgdGhleSB3b3VsZCBiZSBsZXNzDQo+ID4+
IGZyZXF1ZW50IHRoYW4gdGhlIHVuYmluZHMsIHRoZXJlZm9yZSBoYXZlIHRoZSBwb3RlbnRpYWwg
Zm9yIGEgc21hbGxlciBwZXJmDQo+IGhpdC4NCj4gPj4NCj4gPj4gUmVnYXJkcywNCj4gPj4NCj4g
Pj4gVHZydGtvDQo=
