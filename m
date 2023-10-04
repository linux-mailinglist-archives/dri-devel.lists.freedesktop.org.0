Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C327B7A63
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89C10E345;
	Wed,  4 Oct 2023 08:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A8B10E123;
 Wed,  4 Oct 2023 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696409004; x=1727945004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rnb5eNTmbR1yaJud2wc79eahaqRC4qN61wg13VPsjGM=;
 b=nr8C/feLjJLz+K0E1Rkuf+P6bLvCHN4HDoQQnlRph+ppweBkWvmz4KeF
 SkxlaWjPQb6hWh4wpm7UyKj0T3ljUcfokbM+enpClQkgXtPQEcaGGMSUR
 uSCuRJCvPoR37F6WDpsdlDOm4t6+XQ6wKNGzfstqKu+9oK8ApfB7ZQFaA
 hLMRtz2LGizFbgYhNYUvXp8T+N6XoBqkzzaWx3Vctgfwd3oIxIQae1N8z
 5EwDyaprPzhIoX9Z1Y/vxYXkI7aV0z+u5YKnBMc10qRkH9/MlMP/fucGe
 UdomgDMlgJgZDxN5B108DpsdZfSRFgpBMVkv4tV2kIL4+QiHNNfMcOd/S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="383007338"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="383007338"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 01:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754784127"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="754784127"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 01:43:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 01:43:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 01:43:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 01:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GV/curz03c7ZfE36UUF9KKcGDnopc+eTDDQT8Z6MypGguNFRWZvCHBHb2nPViSFvpRqMJIDZKU09FmYnCKi7GdLDQs3XvloaUnc629PHw631CWeQ2WRZ7Wz3aSyeG9JO0SJxrLLykasW4lS+KWyHIz23cbMQ0r4Zz8v/FqOR4etgHERsn9Tjer9kaJR6fWK7UTCuO43an5TB4/3GJkeaPxtx6dzwlXInlJ7MYl6pqMJVxnx4AGt9eCyoyUQCzgZRYvdf+R/mLM5fIJrwUfYkUuhv6z7RrFg2jMionSJQ40SkHBz5g5GkOQPKl05Cl7tlY9EkfFTIiJqURP7+yOcJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnb5eNTmbR1yaJud2wc79eahaqRC4qN61wg13VPsjGM=;
 b=Lt1GW9kdVAM/DiqxrV2Qcx7xsSB24M5/JvXOuXcxkFAWPQdkjJN5VoXYBFM7pObqfAbxzyzuAxh5f6KxvDXlJSCzMJxkRqFi8B7fnWbTQJZwQYvUeJJu5AzFaeTkXaEhMUTrhV/vvuGuT+jKG6JJoDXd38XJC2Q71r2ObuEckPF0wZ75LHPFKU82QxPweDPNEY/gDKkdfVK6zM8ucxHouhZNkFoLUd6lLGhC0kJ910RLWDis/Ixj2A5zLV9qkKm1rtXuCOa2LvQXFSyA8JVYX451twCS1vtWa2+hIyzvBLyfpefTN/JGTvDrfJvSioiL3hEcdKVKVfHIyvQ41SedAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Wed, 4 Oct 2023 08:43:21 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b%6]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 08:43:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Thread-Topic: [PATCH v6 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Thread-Index: AQHZ7FRgJreZtMur4k24SFH6wpJufbA5ZMLA
Date: Wed, 4 Oct 2023 08:43:20 +0000
Message-ID: <DM6PR11MB3177695B7E4BE5BC37BFF1EABACBA@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230921061335.454818-1-animesh.manna@intel.com>
 <20230921061335.454818-2-animesh.manna@intel.com>
In-Reply-To: <20230921061335.454818-2-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|DS7PR11MB7782:EE_
x-ms-office365-filtering-correlation-id: 716dfca3-69ee-456e-4d8d-08dbc4b5f6a1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ttv/zkAvLt587NgmEEj1XGu2hi9t5AnZ7mRTZu9R96wj9ZK6BRW/MsuwwsYnqomX4kk51ACY55Al0gjtSO+A2DLjGuVtboyWtnpHO+EyRIsXzvjodO8o7otvbi0GonpPX5CazEnMOT+NDYhdaZEvtcouontl137R4VH/VTr7M6bqbGzp3SQwsLeZCzvQzoKTdYbYuAGfB3eCzPhxYxhnQwHm4QAMb80Ftca9A6Lc2ItM+kBr0p0DGhBbPHbITVzXXIgkdYmjt4VXBf4yrEfVcYrWBcyH+3b/OmwXzqH9DtuNhGldSDIS6KtQ/4oM7wb6jq0v0EHO9Uqh56reeWXTRRMDq16M0J5gbYQ8cIfhfXyVQzCmqWQ5Ofdf4RN5QRGMS4SLsEKsDizSwJ4vDoD0ZCwFQK2w9yl8txylBFSI8nMpGu21tm9tgGiLwQt6rCwZCM8kQymkEsvbrb2BbeX4EK+VDHzU8LT39nePYlMRt7fUOaY2UhS4vufmu5J8rB4nQgtCBUkyjkddcYOiM3G/tHacESK6UNpwG6S61unAR/jtUwIT5oaj6LSk5LbZFCvTUuMsPUx/AE9QvHE6a9UTwMNGNcUlEqabBJxm3c9WM9fiP26IRIQNqpv8tD2In1Kl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(55016003)(7696005)(71200400001)(55236004)(66574015)(53546011)(478600001)(6506007)(122000001)(86362001)(38100700002)(38070700005)(82960400001)(41300700001)(2906002)(83380400001)(107886003)(9686003)(26005)(64756008)(33656002)(54906003)(450100002)(66556008)(66476007)(66446008)(5660300002)(76116006)(316002)(110136005)(66946007)(8936002)(4326008)(8676002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEF5L2pGQkUxV3N6bkU5UlhlVkJjUzdHNEdFU09ubENZbFB1eFBDRnNtQm4w?=
 =?utf-8?B?T25wZDMyTTZkaFp3U280Z3hrUHN6MXpQSzY2RE5ZTzdNdlg4T1hxUUM3Uk9W?=
 =?utf-8?B?Z1hFMWlmYkdzWjg1K3MvdEdwQ0F5Zk8wRWc3dmZhS2JuQ1R3UnFncERuUEls?=
 =?utf-8?B?VE9ORk44MjRhL2hYaUVrK29LVHY1QWVZZXlqYTJqRG84czdNSEEvWDVsWmpJ?=
 =?utf-8?B?MHA4K2RqeWdkcE1VWFNsclF5SFB6cHZMb3UrS25oYUhBQnFrMEtoNVJROUtW?=
 =?utf-8?B?TmlNd25wRlI1NklqNWhxWDloSjlkOGplUmhDWGtFdUE2NGVjcjI4UjErVUY0?=
 =?utf-8?B?SjJIR0tQRFpVUVVZNG1odFlZUHNVQWZVUWhBMDdqaFRGd2twS3FZamZmNmdT?=
 =?utf-8?B?OW5GRzBVS1Z6aGlZeFJuSTYxYUVoVjRVZWR6QmVuSjhacmxORWxVS3BpZGRT?=
 =?utf-8?B?OTVqZTBFWnBFZzloZWtVRjVTalBON3hWMmRNVm5VVHRFRWgrUjJFOGtyMnFt?=
 =?utf-8?B?K3dVdWFNUFduVk5HdjAxdkdXaDBvM2hlTUY1aTA4NVZMSDJaK3FLbXNXMkpj?=
 =?utf-8?B?QUhuOHpjeE5NWEVjR0pIRjN5NlV2QTZ1bzNPdVJEU2lKb3NYaENTZHBDWGhj?=
 =?utf-8?B?dXQrTzZ6c05oa2xLOUVaNWdwNkdBQ0VZL0lNREFhVmxVNlIvZVBVUUt1RHds?=
 =?utf-8?B?RVdJdGwrcm5YbnJTVkswSTkzZkVvblVTT0svWTN3WC9SbWdDaWhYUXJEMFJw?=
 =?utf-8?B?SDJVQTIxZHNJSGh1VStXTXVGdWdzanFFWmE3VG9RVHNwMXpVZ3R4NHZ6cEFI?=
 =?utf-8?B?S0U5S3Jld3A3OUt4M1pQcnJQZDVsalZBSWVUbWRXRzFQTUxFUkNCT0FzRFlO?=
 =?utf-8?B?VWpzdEhZUkFVN1VmT0FOTGJuTTZYWG1lVDRESVdQOHRKdmlsUFM1TlpZWm9m?=
 =?utf-8?B?QWNlVE1FZWk0REJ1anRnSGtMOUZDUDR1TXVITzhRckpCZE1iazVVSTU3MjVz?=
 =?utf-8?B?MFZOWXIvZ2hmNnFMUk5ncG9hNURobzJiMU1WaHBoQ2tqYmwrOTBKK0k3NW04?=
 =?utf-8?B?VnBjV3hFZXoxMTZzQjZVbkVScVl0Y1ZsYlBpQmM4RzUvUzJac1htOCtWU3Jw?=
 =?utf-8?B?anduREd1Z2dZSUdFWThWaElHMnFjV3dPL0NUNGg1Q0g1MDMyblJKT2xIK2ly?=
 =?utf-8?B?SnRmczJaOXVDMi9wTUZyeXNXdmdQSXZuQU9OeHVkQllzbWk3MFNkR2VJdFh4?=
 =?utf-8?B?R29POXZac21RajN6UG80K1QzUkd5RjNRMVdOK2U5TUk0LzQrNUJ3K2d0c0Ew?=
 =?utf-8?B?M2huTzZVNWJwZFlCSTM3ODFXZEhrRlJZNWpqVEYydkE1QTJwRUpDdXloaFIx?=
 =?utf-8?B?M3pBUXJ6cVBDNkpCQVd2WWRRU2RMbHhyK1VsQ2wrNEhNejZpWjN6ZmJHMFFR?=
 =?utf-8?B?NkdBVVN5Nk52YVZEdVpFc1dkSUwyaHRYb2ZlOHJ5ZjVrektaS1A4cXZSUWtE?=
 =?utf-8?B?K3dDOWpyMDlUUmVVVWRVVy84eVE5ZS84THZPOUJuMVh5REJpVHlYK1ZYT0Fo?=
 =?utf-8?B?cTZZYi9Lc1A3cjJhSmtLdCtUM1hmZWZuZUtLcnhJeEtKMHhZajRud1dtdG0r?=
 =?utf-8?B?bGg3d2liRWs4SklXeWlSRGhCQ2FndzJmMitvdzBZR2tkYS9uVXY1SkhkeFZD?=
 =?utf-8?B?UDlVODZjMHRYdXd4aXNMRHdNWHNNV1A3dEQyRzV0cTA5anA1eFRDOVEzSHYv?=
 =?utf-8?B?c2VpeTYzb1p1T080T053TW94Ukk5bUVSajJDVG9oVUFSenRXQzdXNDlRVjRG?=
 =?utf-8?B?RnJUTUR1ci9VVGFuVDlERnowM1JHN2ttUmYwUVhTSW1JeHowRmRyZmFHQkpT?=
 =?utf-8?B?Q2RrN3RtRWdzd3l0VTN6eSs5UW5JMzNHRXE0b1RoUXpVYnY0M0Z6ZDU5b3Vh?=
 =?utf-8?B?eUdtRGt2UVJHQldaYW04TGVhQzNDT29Nd1hZalZ2RitCMWtJd3Z4UmQ5L2xQ?=
 =?utf-8?B?eGRYMnZXVGRUZHNkbzBzcVo1UDRaQ1EvY3JCMzFFbUVJTzdIbjRraG5oN0t1?=
 =?utf-8?B?cFNuTzVmV2piai92NkxJR2JkM0g5SnBlbzRZeWJNemF4ZWJpZ1Nab3c2V0hS?=
 =?utf-8?Q?VonEqe6NwU+NUCxmS/WUmnLVo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716dfca3-69ee-456e-4d8d-08dbc4b5f6a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 08:43:20.8601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kofWHWznc/38EAP2/zOmmD9nt8Yase9O/lwzQYohtqR3PM0H5kT4WFH0/kdWS9ayPpclAfPkEVL9nsrUzX3SBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander,
 Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFubmEsIEFuaW1lc2gg
PGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDIx
LCAyMDIzIDExOjQ0IEFNDQo+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBOaWt1bGEsIEphbmkgPGphbmku
bmlrdWxhQGludGVsLmNvbT47DQo+IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJAaW50
ZWwuY29tPjsgTXVydGh5LCBBcnVuIFINCj4gPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgTWFu
bmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
djYgMS82XSBkcm0vcGFuZWxyZXBsYXk6IGRwY2QgcmVnaXN0ZXIgZGVmaW5pdGlvbiBmb3INCj4g
cGFuZWxyZXBsYXkNCj4gDQo+IEFkZCBEUENEIHJlZ2lzdGVyIGRlZmluaXRpb24gZm9yIGRpc2Nv
dmVyaW5nLCBlbmFibGluZyBhbmQgY2hlY2tpbmcgc3RhdHVzIG9mDQo+IHBhbmVsIHJlcGxheSBv
ZiB0aGUgc2luay4NCj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBp
bnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGlu
dGVsLmNvbT4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiAtLS0NCj4gIGluY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmggfCAyMyAr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIGIvaW5j
bHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiBpbmRleCBlNjljZWNlNDA0YjMuLmZjNDJiNjIy
ZWYzMiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiArKysg
Yi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+IEBAIC01NDMsNiArNTQzLDEwIEBADQo+
ICAvKiBERlAgQ2FwYWJpbGl0eSBFeHRlbnNpb24gKi8NCj4gICNkZWZpbmUgRFBfREZQX0NBUEFC
SUxJVFlfRVhURU5TSU9OX1NVUFBPUlQJMHgwYTMJLyogMi4wICovDQo+IA0KPiArI2RlZmluZSBE
UF9QQU5FTF9SRVBMQVlfQ0FQICAgICAgICAgICAgICAgICAweDBiMCAgLyogRFAgMi4wICovDQo+
ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfU1VQUE9SVCAgICAgICAgICAgICgxIDw8IDApDQo+
ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfU1VfU1VQUE9SVCAgICAgICAgICgxIDw8IDEpDQo+
ICsNCj4gIC8qIExpbmsgQ29uZmlndXJhdGlvbiAqLw0KPiAgI2RlZmluZQlEUF9MSU5LX0JXX1NF
VAkJICAgICAgICAgICAgMHgxMDANCj4gICMgZGVmaW5lIERQX0xJTktfUkFURV9UQUJMRQkJICAg
IDB4MDAgICAgLyogZURQIDEuNCAqLw0KPiBAQCAtNzE2LDYgKzcyMCwxMyBAQA0KPiAgI2RlZmlu
ZSBEUF9CUkFOQ0hfREVWSUNFX0NUUkwJCSAgICAweDFhMQ0KPiAgIyBkZWZpbmUgRFBfQlJBTkNI
X0RFVklDRV9JUlFfSFBECSAgICAoMSA8PCAwKQ0KPiANCj4gKyNkZWZpbmUgUEFORUxfUkVQTEFZ
X0NPTkZJRyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxYjAgIC8qIERQIDIuMCAqLw0K
PiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0VOQUJMRSAgICAgICAgICAgICAgICAgICAgICAg
ICAoMSA8PCAwKQ0KPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1VOUkVDT1ZFUkFCTEVfRVJS
T1JfRU4gICAgICAgICAoMSA8PCAzKQ0KPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1JGQl9T
VE9SQUdFX0VSUk9SX0VOICAgICAgICAgICAoMSA8PCA0KQ0KPiArIyBkZWZpbmUgRFBfUEFORUxf
UkVQTEFZX0FDVElWRV9GUkFNRV9DUkNfRVJST1JfRU4gICAgICAoMSA8PCA1KQ0KPiArIyBkZWZp
bmUgRFBfUEFORUxfUkVQTEFZX1NVX0VOQUJMRSAgICAgICAgICAgICAgICAgICAgICAoMSA8PCA2
KQ0KPiArDQo+ICAjZGVmaW5lIERQX1BBWUxPQURfQUxMT0NBVEVfU0VUCQkgICAgMHgxYzANCj4g
ICNkZWZpbmUgRFBfUEFZTE9BRF9BTExPQ0FURV9TVEFSVF9USU1FX1NMT1QgMHgxYzEgICNkZWZp
bmUNCj4gRFBfUEFZTE9BRF9BTExPQ0FURV9USU1FX1NMT1RfQ09VTlQgMHgxYzIgQEAgLTExMDUs
NiArMTExNiwxOA0KPiBAQA0KPiAgI2RlZmluZSBEUF9MQU5FX0FMSUdOX1NUQVRVU19VUERBVEVE
X0VTSSAgICAgICAweDIwMGUgLyogc3RhdHVzIHNhbWUgYXMNCj4gMHgyMDQgKi8NCj4gICNkZWZp
bmUgRFBfU0lOS19TVEFUVVNfRVNJICAgICAgICAgICAgICAgICAgICAgMHgyMDBmIC8qIHN0YXR1
cyBzYW1lIGFzIDB4MjA1ICovDQo+IA0KPiArI2RlZmluZSBEUF9QQU5FTF9SRVBMQVlfRVJST1Jf
U1RBVFVTICAgICAgICAgICAgICAgICAgIDB4MjAyMCAgLyogRFAgMi4xKi8NCj4gKyMgZGVmaW5l
IERQX1BBTkVMX1JFUExBWV9MSU5LX0NSQ19FUlJPUiAgICAgICAgICAgICAgICAoMSA8PCAwKQ0K
PiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1JGQl9TVE9SQUdFX0VSUk9SICAgICAgICAgICAg
ICgxIDw8IDEpDQo+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfVlNDX1NEUF9VTkNPUlJFQ1RB
QkxFX0VSUk9SICAgKDEgPDwgMikNCj4gKw0KPiArI2RlZmluZSBEUF9TSU5LX0RFVklDRV9QUl9B
TkRfRlJBTUVfTE9DS19TVEFUVVMgICAgICAgIDB4MjAyMiAgLyogRFANCj4gMi4xICovDQo+ICsj
IGRlZmluZSBEUF9TSU5LX0RFVklDRV9QQU5FTF9SRVBMQVlfU1RBVFVTX01BU0sgICAgICAgKDcg
PDwgMCkNCj4gKyMgZGVmaW5lIERQX1NJTktfRlJBTUVfTE9DS0VEX1NISUZUICAgICAgICAgICAg
ICAgICAgICAzDQo+ICsjIGRlZmluZSBEUF9TSU5LX0ZSQU1FX0xPQ0tFRF9NQVNLICAgICAgICAg
ICAgICAgICAgICAgKDMgPDwgMykNCj4gKyMgZGVmaW5lIERQX1NJTktfRlJBTUVfTE9DS0VEX1NU
QVRVU19WQUxJRF9TSElGVCAgICAgICA1DQo+ICsjIGRlZmluZSBEUF9TSU5LX0ZSQU1FX0xPQ0tF
RF9TVEFUVVNfVkFMSURfTUFTSyAgICAgICAgKDEgPDwgNSkNCj4gKw0KPiAgLyogRXh0ZW5kZWQg
UmVjZWl2ZXIgQ2FwYWJpbGl0eTogU2VlIERQX0RQQ0RfUkVWIGZvciBkZWZpbml0aW9ucyAqLw0K
PiAgI2RlZmluZSBEUF9EUDEzX0RQQ0RfUkVWICAgICAgICAgICAgICAgICAgICAweDIyMDANCj4g
DQo+IC0tDQo+IDIuMjkuMA0KDQo=
