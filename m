Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19516761E6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 01:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5086010EB44;
	Sat, 21 Jan 2023 00:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0914A10EB42;
 Sat, 21 Jan 2023 00:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674259728; x=1705795728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yBhCPAic6JvGg/bYmE9i1MRfjSej08rw/Cnxo9cGM8E=;
 b=oB2ZtX3bcTGYPtfk73ARGYFkHElct8rrYM63Ue6HYj1QCNXTIE8SBTgI
 gX2mY5njRZZ/qEHrT1OOdaOtVZTJg+MP7hjp4CFbQTtO6+mg+w9T1NUbP
 2nRFhoHJTUn9mP1OaRzyoA5DYAvMYRcaqtE5J7eZtLr8GhNtI0yZVCfBi
 IqW/63hq/YklniAdmi9veO0RpSuDX/KVmyXHrsk23Q6HlABBepelpMVck
 XLMqcEy8P2e480XwdnGm4i4AKZCPHEAeTpa4jiKoqgrrX4EdaGxPcy6yK
 D4b2zv/OahygU68Bg9kfb37OOaO41XRivkjcE+6IjOdegEIMLcqz5mazK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327820975"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="327820975"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 16:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="906135031"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="906135031"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2023 16:08:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 16:08:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 16:08:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 16:08:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7tQRqfxq5aiT51J32acEgva2rcvPujR72xw743NxEJvJTZqQ18iUn5VUn2rdlTI+yeEcnhN7R2QF3XnJ1BymfXEBO6hZ3ZYQJku6m2Im5H8gUrzkFVQESrFDcn1Sq9AOltGpnl0s7TJaxTFhqyNRRtnioxY/F/QZ9bfzMlJbWEd8spLvxvFO1f0gCtqGogV75pRBnHoxMk2kaOJFTVcksbD8DQVZLZsCUcpXbhEMUcNWN7aGt1vzmb9wUhOVfdPpcelgj4emDekthzpkm0OSPKPjMdtj6FsdkNJrBK/ZTBDDXcA/4jneMmtLoq/G9nN9mA/u8XCP+qXL5CuNLgYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBhCPAic6JvGg/bYmE9i1MRfjSej08rw/Cnxo9cGM8E=;
 b=J3uFXIBQoVlVTJHmmwXRT3YWkzkLsnNX+q5OSPqOrVABGP6IGVlJXSurt+JmvCCVi40yumE2VaFDf295o5nIQS4Vb6Dn9iuMCn3EdT9O/+N8KW/+NjFYGXNEv4i6VkAJ/PkcoBnEFU3o3oH7/mLjC4KybXl/OfGOOPr+UQNh6SWwEPP0VhA/FH6A0FD0SQQWMoYXjVaPPWH0jJK/5D+Jhw4BlW0nDbUbnQt6hNt5vvFdMxvGMZFEBclgYrvUBJOWjxzl+Tu3Xk7ZtnyRGwP0FvFBsjN5vePMT0XO5OocAqQUnxTpmS2dbnrbIRrm9+zj4Jozd/8csiBRH0Te0QdlTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB5441.namprd11.prod.outlook.com (2603:10b6:610:d0::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Sat, 21 Jan 2023 00:08:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.027; Sat, 21 Jan 2023
 00:08:45 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 5/9] drm/i915/pxp: Add GSC-CS backend to
 send GSC fw messages
Thread-Topic: [Intel-gfx] [PATCH v2 5/9] drm/i915/pxp: Add GSC-CS backend to
 send GSC fw messages
Thread-Index: AQHZJgWkB/l6OWEoC0+CwRsbOqUQZq6lAgGAgAMEtYCAAAZKgA==
Date: Sat, 21 Jan 2023 00:08:44 +0000
Message-ID: <ebe9e56a1b28e0321f2c818a99162a5fc1408081.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-6-alan.previn.teres.alexis@intel.com>
 <2516e7ef-1766-6441-46c9-4de2a1306e79@intel.com>
 <ab7de37fa39b8c63076fcb71f3da8c969eb33693.camel@intel.com>
In-Reply-To: <ab7de37fa39b8c63076fcb71f3da8c969eb33693.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB5441:EE_
x-ms-office365-filtering-correlation-id: 17c08415-6a0e-4d32-6069-08dafb43a969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8KeKrvQYbLDnxGt00ZVhqjoOTwFRW5x0rL4qgU++r3TSYKmvNqxMn7i9VmLN5YVTE4w0oWzCp9HEgkZjevcfs3XuByz4T2cxcVfyAvZWVZnsPCjRWP4D21biJrOrPlUw5Qj7k6cNvNQQSA0fVuZ6Jbggqv7rGC+IKCDLuIzoubHggABQq2Yy9+6uyiMf90wkQ01BlUxH6+//1A0FMJ2WQcJasWA4uiqLjUf0AEqMTy7/9Y/HqzgvWDTsbzN6nmHVY6TivogTha+H1jNaPx4V9e5pQSh7ldkAdT7Fs0rPe0TJaskMYJXBgw0lQcnWrybbhKrZ4C74U0hkPNKdmj1ZPURUm+L94embKcUQraApyLQrzkvgAsqzmwkMF06dMo2M+9U9NuJ8UADSaxhfJLQraRdlMVOAnZ7v/c0NnYULUXeUDElEwuI61sjxxCbvUIwND6nBLqTvKt/vIo8TQgFqeE1mmT3riWBYOZrVwdhMXl3aJbgW72UJp/p9Yw6j7KVSTozvuE55tAkFz+UD0zPozWMa2xflvtIGXpfgyobz5JWVxHnCvfQwL1f01wyw9ygtKXkQ2uQAvM+5X0cia5SBXevhVs5XKGMjWlW3PJR5M6K3e+3yn9p6c6hGMkpEcRY9pzQ6L8bZnoLO8SB6m2kUmvsg/HLYKZQTPCPT5EFrqUllq87WljAekun0KaSh5+VtyP3/+dGZee22TJrzo8u8kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6506007)(478600001)(71200400001)(110136005)(6486002)(4326008)(186003)(66476007)(76116006)(8676002)(66556008)(316002)(66946007)(26005)(6512007)(91956017)(38100700002)(450100002)(5660300002)(8936002)(2616005)(36756003)(41300700001)(4744005)(2906002)(83380400001)(86362001)(15650500001)(64756008)(82960400001)(66446008)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEdlRVFNYWhSWUFKdDNhMjhBZ0RCNDJzL1pKZzl3Q2dYWUxmNnduYVpjcE16?=
 =?utf-8?B?Z3FHUlR6L0VIRWRsb0FtQmI3UG9uVmUwWWtJUnN5YUM3b1VJdklBWFk0U1RG?=
 =?utf-8?B?VVo4VUp4QVExL3hjcGRhTnByOFdSUDFDODBtK0NRcW80dDFWdE5GSHV3VHJu?=
 =?utf-8?B?dnJHZzNqWFgxV2pGNG1CMkZXLy9hdkNnNjZjZnhZUU10ei94SExUam5zdWxY?=
 =?utf-8?B?eGhjM0tMTXNtbjg5RkxFZEpuNTBRZTJTQm92Y1pPVzdOdlNHaW9PTFRRQnJY?=
 =?utf-8?B?WFIybXpkVTNCeDQ2RWFhWU02dkMrelQ1WDNTQ3gvZDdZbXpqYktvWENFUVd1?=
 =?utf-8?B?WTd2K2tJanF5TWM4MHVWUGE5YjVkWENGRVJrZTRrL1dkSWRoQ0szMHZiSlNE?=
 =?utf-8?B?RWFVVFdRL3BwQTBFZkZkMFpIVlB2SHovMGdWbUJId1hPbjd5ZFNwZzBDcG9x?=
 =?utf-8?B?RHFBclJWRlZDSGZHcGtHdzREaHFkN01xWWNkV3hVL1VKQ1VraXA0OUlNZnRo?=
 =?utf-8?B?MHpGQm9xbXlhYk9OU1JVU2xoRitiVm03STAwdWVEZUNNQytrMWxma09FVjMr?=
 =?utf-8?B?UVFXUmdaMThJcUU1QnV0NHJXb0VncmxQdmd0cW5ya0ovMEl4V2V6cE9EaEN2?=
 =?utf-8?B?UGd0aVQ3ZFNhaktuSG11SmtHSk4vMXorOFovV3pra1A3aEpoTUt1MnRna0k3?=
 =?utf-8?B?M09yMmZzQ0lOZHdQUnhsRUpKSGxQMDFIZHRGREtEWEdNU1QyeGdTZWJEc1gv?=
 =?utf-8?B?c1RDcFkxR0U2bFVRb1hkSzhGMy9nTnNkcW9mNnQvenEvR3A1K3VxQWxURFQ2?=
 =?utf-8?B?MVdvdW9qRWZSZE10WGw4TEJOSlhpN3huZ1gyY1hJbXFvdkZTNU9qblppODZP?=
 =?utf-8?B?Yko4N1BkanZLVjBZa09PYnA0NnlHVktwVmtUbWZ3NVdjaHRPdVphMG5Fa2Jv?=
 =?utf-8?B?Y2dKUllWbnhQZzF3WW9RbVN1aVFuTW0zci9na1d0ZTFyY0NLQVZUZzhVOXF4?=
 =?utf-8?B?SERvMS82eGx5NU9hMlQyVGMwckU1NzhqOHdtOUlwQ0FrTmtSQkpWVmx6ekw2?=
 =?utf-8?B?OU0vd1h0SVUzWURuQW1QdThEWnp0K3QrYjEwUktITHFaRXYwSk5XUE9qYTNM?=
 =?utf-8?B?RnkzYWkvY1BhdGhEdjczRHBIU2Jya1NTVW9acXFWYUVYWUhLUm03aUdOWWlJ?=
 =?utf-8?B?RzVVQTlnWGI0M2h0bGNMWjFMS2grVzl3NjJaVitrUkpGRGFVVThscjJhdW82?=
 =?utf-8?B?NXZVOTJvbDRVeG1XbTBhVGh4Zll3aklKVG8yaFFQM1pjS3ZsdnExbzRaMmhz?=
 =?utf-8?B?OUVrMU0xNERKRTlSZkJURmRXeDFpZmVjRWFmVDFKelNxNXpQTUdTVkt1NkJR?=
 =?utf-8?B?U3draURVcmdZS3lQdk9kN2VucjMzOUxCVzJtSWZzdUQ1Zjc1MVMzM1huN3Br?=
 =?utf-8?B?M3hHS3BGYTRzUEpwVzN3cWxaZFRaZStKaTdGd2xRYW9EUTFDeVEzKzhlR0l6?=
 =?utf-8?B?KzZ3VjZxblVlRjdubVhJd2RNdHJwMWJLK09qSzJDNURHaXA4TFFiZFZaYjl3?=
 =?utf-8?B?TGN6UzBPUTRKSE1XTmUvc1pNM2paU2lzQ0p4Z3ZmcW9sWlR4d29EWWFSTXI2?=
 =?utf-8?B?eDU1aEl5OHFKVWljSjRFWmxXZE00d01yN1N3dDZEd1I2NEFMZ29xQWhnSE0w?=
 =?utf-8?B?blQ0QXJkR0pmMDZCQlU2Y2Q4dktIbWx3a0ZtanQwR2JueTB0MTlnbENkaXJG?=
 =?utf-8?B?TWxzbDNJYUFoNW9oL1I5dyt6NDhPT01kOUd2WHFqbU15NFVMK2k3ek9VZEF2?=
 =?utf-8?B?Z3NOalVXSGJoZ3AzTUNXWHRFVzdFeUpVU0FzOG5nellQcFNabVZrbUFqWWJn?=
 =?utf-8?B?TDQ3QzhZVk02aU9DbTcwRjczVjM0Q1lybmlxVFA2L3VuV1UwSE1JTXNFSDdu?=
 =?utf-8?B?TkhFc1JSZVh0L3JIeHpNcU1EY2M5anBGSERhRFRTTmxyMHpaU0pIK2xsU1J2?=
 =?utf-8?B?M0gxYkU4UmFCRG1BRGp4V0JLanFhQzQ2NXQ0V2EwOVZ5V2JRbm1FTzRHNGE4?=
 =?utf-8?B?cWMyY1JST3FBY3lLWWNYa0YyanMzNWJmR3ZZdUJRUW9UTXQxSm9CODFVYUtD?=
 =?utf-8?B?RW82b2ZWZk9UdmpPWmJvVmgwV24vK3luZHlTb1JJcVlsS1l3SExRdHYvdzFh?=
 =?utf-8?Q?v9Ff7uY6H5aXKQVhBXIujE0d1B6+c0uZSUQ9Zaloxuwl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <953C28FE2F458740BA744B51BB24C343@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c08415-6a0e-4d32-6069-08dafb43a969
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2023 00:08:44.9826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKIMhixARXpjRpcQffD7ygiocqGx0VfFzQnbCXPmUtCr7zsaUJdDHDLhLfzRe6NG5BnIvGuHgEl+Ne49D4coQc+w2k2wbKSQTiWvny52Z1R2pNVt8AUOZZWK0hEOTK+l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5441
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

T24gRnJpLCAyMDIzLTAxLTIwIGF0IDIzOjQ2ICswMDAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudC4uLiANCj4gDQoNClJl
cGx5aW5nIGhlcmUgd2l0aCB0aGUgc3VtbWFyeSBvZiBvdXIgb2ZmbGluZSBjaGF0Og0KU28gd2Ug
Y29uY2x1ZGVkIHRoYXQgZm9yIHRoZSBuZXh0IHJldiwgbGV0cyBtb3ZlIHRoZQ0KYnVmZmVyL3Zt
YSBhbGxvY2F0aW9ucyBmcm9tIHBhdGNoICMyIGludG8gdGhpcyBwYXRjaCANCiM1LXNlbmQtbWVz
c2FnZS4gQnV0IGZvciBub3cgd2Ugc2hhbGwga2VlcCBwYXRjaA0KIzYtY3JlYXRlLXNlc3Npb24g
YXMgc2VwYXJhdGUgYmVjYXVzZSB3aGVuIGZ1dHVyZQ0KdGVybWluYXRlLXNlc3Npb24gam9pbnMg
dGhpcyBzZXJpZXMsIGl0IHdpbGwgam9pbg0KIzYuIFRoYXQgc2FpZCwgIzUgYW5kICM2IHRvZ3Ro
ZXIgd291bGQgdGhlbiBhcHBlYXINCnJhdGhlciBsYXJnZS4gSG93ZXZlciwgd2UgYm90aCBhZ3Jl
ZWQgdGhhdCB3ZSBjYW4NCmFsd2F5cyBtYWtlIHRoZSBmaW5hbCBjYWxsIHRvIHNxdWFzaCBhbGwg
b2YgdGhvc2UNCnRvZ2V0aGVyIChhbGxvYy9mcmVlICsgc2VuZC1tZXNzYWdlICsgY3JlYXRlLXNl
c3Npb24gKw0KdGVybWluYXRlLXNlc3Npb24pIGF0IHRoZSBlbmQgd2hlbiB3ZSBhcmUgbWVyZ2lu
ZyBpZg0Kd2Ugc2VlIGZpdC4gVGhhdCB3b3VsZCBiZSBlYXN5IGFuZCBwYWlubGVzcyAoYXMgb3Bw
b3NlZCB0bw0Kc3F1YXNoaW5nIG5vdyBhbmQgdGhlbiBnZXR0aW5nIGEgcmVxdWVzdCB0byByZS1z
cGxpdA0KbGF0ZXIpLiBOT1RFOiBhbGwgbnVtYmVyaW5nIGFib3ZlIHdpbGwgYXBwZWFyIGFzIG4t
bWludXMtMQ0Kb24gbmV4dCByZXYgYmVjYXVzZSBQYXRjaC0jMSBpcyBnb2luZyBhd2F5ICh0aGUg
c3R1YnMpLg0KDQp0aGFua3MgYWdhaW4uLi5hbGFuDQo=
