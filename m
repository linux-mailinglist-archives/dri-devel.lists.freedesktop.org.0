Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5527B98CD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 01:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2C810E0F7;
	Wed,  4 Oct 2023 23:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7850C10E0F7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 23:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696463107; x=1727999107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1g3pseqXBa7E8kEuoJPTzOpkrSUyK7F51ChTFYWFVKk=;
 b=lhusfleGtVB1Yb6ycHKFHRFFVhf/OAg438Elyvpx0mAaS5ypQQKCxGbd
 0EtIkjn1301RJa5OaFHFm3qJ1CoxMDWpjpNBWLoqX+8ZJRptfkEbuNA+i
 ZKxS/1qXCANLKKuqyTYGWrHnC7B4gRX2I7UmeQWUO796WC7U60dKV0Swe
 ggVOwg+SQood8MMFLaX4zzj+cql5319NSk1Ca9pOVaPwemIkLPacdeioE
 fuu98/PjLb7HDGxksybwCVtYNlln3WOyK2osx+0Aa9PWZYzPkd8imfhl8
 N9N9qLlF6BwT4y+rrJQW0qbf/ykUazV9g+0yTPyKorhv5vnWkydZXiaMJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382214730"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="382214730"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 16:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867640427"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="867640427"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 16:45:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 16:45:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 16:45:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 16:45:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 16:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6PY8Q8wxd9EklMv7fy9h3cyPcsptEdREJoUmXbt6W+fnDQD0d/YfSN9qSs86NDbwilLg4vixgVxvjuuMVUusgps+uH79VjvNBTTnBd9xuAU2J9SV3R82Zl0TKgooUyComJzOHuSZ3qvy0Vd2DUH+AKNlFFs3xXvCB144qbZcrpuAh5zyorTzUJDSf68+E73yrijRaznedPxTdfp00Dd0YiSLxZW8MdRRUNdQJuzEZsDi7cOqU2BmtjMy7+0vLFT/yhqmUf8D67/jhink4gpX3sWMBYrCyYB08yLb1t0hS1skA0lUZn8xrrhwZO+Uj+CKvYdFf7W1gqGSVPbnyY9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g3pseqXBa7E8kEuoJPTzOpkrSUyK7F51ChTFYWFVKk=;
 b=XCthoGYYp1WVCc1yM1R1YWky8H0PlkxC4WVEb4rF82SvQ1hl+wF3Ac5cD+wrMXf4o6UjZDnH0fOWkIZDPrslZFw4uiASL1Flrt1ODdWWp7gEa44yTGD6ceDH4YI8naz6YUCYEYB4OgNkXnv8gw7PshxdAoSXxJxKhHE3ZvuONSaA5ZCN79O1kJ74uUWMPENG+KAaiqmPzDOThvT/BcynMhTTXpfl435Ze4+Wi8bGf57KvugpdFr7uRGMmMNrYpDH//NVTAOK16cIRy63Z6juaMocA1F0/Yk5V/2p8ZkzLLDsI/vuPzC6Jutxoksb2NYcZTMkt9g+vavfg5HBslJCCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 23:44:58 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::ba75:66fd:81d7:8ead]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::ba75:66fd:81d7:8ead%7]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 23:44:58 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
Thread-Topic: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
Thread-Index: AQHZtRWY1ZA68Xqv9ku0ba/iVhJtFq/vjqUAgARZWICABSquAIAA7FMAgAtSUgCAB77VAIAtu4QAgAACEWA=
Date: Wed, 4 Oct 2023 23:44:57 +0000
Message-ID: <PH8PR11MB68798CC76BCC58017F4EB5A6FACBA@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-4-dongwon.kim@intel.com>
 <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
 <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
 <535626da-0958-7c42-7bc1-6f7c0f805634@collabora.com>
 <a07fc333-3481-6ab3-f22c-f64054b49beb@intel.com>
 <2d93796d-c9b6-51ed-2a93-fa1e64f9e2ea@collabora.com>
 <d86d43a4-3bb4-e0fe-a944-94cd30a18800@intel.com>
 <abc2513b-98a0-3963-4be8-9f307051c7cb@collabora.com>
In-Reply-To: <abc2513b-98a0-3963-4be8-9f307051c7cb@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|MW3PR11MB4665:EE_
x-ms-office365-filtering-correlation-id: 036076e3-b099-4dbe-a9ce-08dbc533eb03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: URzrFMhLDt7kMSuYfGtT+M6csXvQOvxF8sgaBXZoPnN+KlYAvny9cusIZQuycmLLH/MU/nMUNjujayORYQ4zxtY7p2lyRBFn/jRHd+YO+P8GW8JX/nCcFmANtIO+Zp/8mRr0haLwzVWgCe3LW3Ig1Q0ulNci4RYX+eBUmx3iZHjPn6+0j71dce1/oEcqweUYHH7F1Rg/FYPaVr6BNSxbRtzzXLlHEIY4jdGl6Tyln/irumRdufbQTNWRZ/RHmHAXvqn4F/iWzJF/bir46jaYDjqKbTQ9NF77wJRA6IgZMixUCemcMtcpxgYaf2CxVpFxM9S5EGenTaKh7SotqqhigYrePLBfdpOXdC+t9mhFsgMA7Utfap8/gcTbvICfUXu+2AW9jn+k+8v7geDwd3KHJaADso/+tPz8ZaaD8VgmyALOO2KpbMio3STbMDIKl93FVDdZM5GxIeM3ZTzzVYPSiIQN+VcHdR7n5aGJmxk60YkfURUVPJYpljqKar+eQ7A5gsjJmg0GHNPiWKVvGCMRngNoBBHQT9yySyHmGDswn2eM+HWsSfQpoolLD6l9sr1rgk+vCGk+v4aHwVKrnOsQyvCKqeXnZ+QCUsaC+7k2LmebeHh0eSfonm93Idn+KKeM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(110136005)(38100700002)(54906003)(66476007)(66446008)(66556008)(55016003)(66946007)(316002)(64756008)(41300700001)(2906002)(9686003)(53546011)(38070700005)(83380400001)(33656002)(7696005)(6506007)(26005)(5660300002)(52536014)(4326008)(71200400001)(8936002)(8676002)(76116006)(122000001)(82960400001)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDJHMk1aaFg1amppaTdlU3BBRHlnQitRandBc3NQOXNIYmc1b1JIcUtUS3hl?=
 =?utf-8?B?MmZsUkx5blNFRmdCdFdENVY0bjZ1U2tiejRCWDQyTFB3U0g0L1ZpTktQLzgx?=
 =?utf-8?B?OTNWb3MrSnNMVkg3LzJucitDWHZXcDkwbCszQ2tnVUJkSG9QQmRZWnlSMzBF?=
 =?utf-8?B?azNyakc4RlorTVpkWTNjTStRZFIyejNsdVN6akxZcVY5QlRjbnlVZlJmQTJN?=
 =?utf-8?B?a3lQOE5DakVVSkJXa0JDZnBzR0tsUkhJcmhxa3NWR1FSOTVscDJJVCtTVEtr?=
 =?utf-8?B?TmdDZG5yWUE1OEQ3dmFxQm43ZFVDY3dFdlJ4cjl3UkV4WDhrRDBnaGZZTEl3?=
 =?utf-8?B?VzQyZkcydCtBelMxSUNGSm5XOHpGZWc5OUhLSnlkelpxMjFtUFNmbWhrZ0tJ?=
 =?utf-8?B?SG8vS0hEdWF0RC9oY0xQMXVwUlpLNXNIanJFWEFwWXJZNTYreTgra3VKZGhI?=
 =?utf-8?B?TjJJWi9sdWh5U3VRNWh3U29YeFN2cU5aRVFkMmJIbDI5R3U0Yzh5eWZrOUt5?=
 =?utf-8?B?dGMyZ3lSbUZxYXBtV1J4Q3lrTGxUbTJuQ2FwVnMxMytPZC85MUpBYzQwOG95?=
 =?utf-8?B?akVzZkFucW5LcWUxR25TbGxVSjdTa1lWK2hCQWd5UlI1YUFrNUxsb2t5MUJk?=
 =?utf-8?B?V05kSmxVbUh6UUIvUlFidkNvSC9ETHBSVG5SNEFQMnRSd09LZXYyRVVPanBs?=
 =?utf-8?B?L2lSZ1VNMmZIZUx6MTNwMzlPbEtIZUFCdEF3Nk5GUlJHS2hpNyt4ak13MUVa?=
 =?utf-8?B?QnJyV0g3T1JnQXIrNExUYVFsaVM3Q2p1cTk1M1phaVozYmpHbndYU05TVEZX?=
 =?utf-8?B?aGFKQ3hCSnQwZ2tkRlRid3pwV295b3FuQ1k1c2hnbDlTaVJTV093VjJYUGZE?=
 =?utf-8?B?c2VVcVVWVlpFTk5IUU1tbW1YbTNZSkpBQkFjUkwwbUhUL0dWd2d1aVJXaWMx?=
 =?utf-8?B?ODRkOEp5VURIdjNTYStqYXRrM2tpVlRTQTF3cTJLVjFOV0QwZU9tOS9iOVJP?=
 =?utf-8?B?WFZZNUt5NkI3VnFuTWRlRHdITjJGWlcrSVFXU3lTVHlYNnI3ckpBakk4OXhG?=
 =?utf-8?B?ZnUrT211VUF2THc0bDFyWC9WRzQ0eXdHR0ZrOWFOZEYxRjdDdFdNMHBNTVk3?=
 =?utf-8?B?bDFxbHJzMU1tb015dUpHdUFhd2NWbkFOWGlRNlRuRXNlcXI4Nk01Mzg3MXdG?=
 =?utf-8?B?RGRkTGF3SEJDdnNTa0V6WXFSS0NCT1RMcUY4Z1BlNWJhVGpnTHFoMktsa0c0?=
 =?utf-8?B?ZVNPVlhvUm9IR2ZUT08yRlVDOFRmWS9jb3dqaUl6alhiZndyeXkweUhRNGpV?=
 =?utf-8?B?ZUNCSzBvV1pUNE80UzJBdlF6RkJvbHNvdWZBQkp5QlVtTFpUb1NZVCt1bkN4?=
 =?utf-8?B?RERWeTJkZys2Z2VNTVVmdDNzOGJIajhWemNxaVg4RDlqUkExYnVtRGEvcFJC?=
 =?utf-8?B?NXEwRkQ2M0k1U0hveW1ob0FUNE5SQU1Jc3NkbzROc0NRU2xlbTBDcnBGOUd5?=
 =?utf-8?B?aHpIN3c1TU9CL2s4VFNWSG1tTEdpOTgrRklIL2xYQlBLd1ZLaGtJTnRlWEFw?=
 =?utf-8?B?Y0E2ME11YkkreGVkcXU0Q0MxM0lURjYzWm5IVlBnTGRHbzVsazRqZFk3RVh0?=
 =?utf-8?B?U3NtbFlwRnJoeEk0Qmt0Z00vY0I0ci9ONEFjVVEvTjRKejBXc3docGlySFp3?=
 =?utf-8?B?M1ArK0VaVVo1RzJBMWhtYy8yZnR2aFFXQWVuOFluNjNZTzljMXBXbjNtd1g2?=
 =?utf-8?B?bTFhelgzYmZ0UjhVQnFpWXpGZHZlR0tlNFNHbUEyak1tRThPaTc0NCtjMjR5?=
 =?utf-8?B?NFFIdzBtZlZTVEZnRndCOTJqMXFaK3RiWmF2NkhMd1JLQmVtMnlpVzVRZ0tu?=
 =?utf-8?B?VVhSTHhCOTdxMlRPNS9TREo1bEsxdlRWZ3JnMFlWdU1FUXNLcytidk9QTGVF?=
 =?utf-8?B?ZGh3eGpacU9WMEFtWlYrUForNFlsMVVYcnc1Zk1zLy9MU0lDYmlLT2lzeXFH?=
 =?utf-8?B?ZStJdjRiS2RhMjVHRXMxbWZUS1h3eFNiV1NiTDBLYWdtUFFMdk93TG9VZnNw?=
 =?utf-8?B?UGlTWmJ6U2ZxU3BIM0p5b1p2QTRjRG9oZ1FSZjYrdThGVnIzc3FiNmVOWlR4?=
 =?utf-8?Q?DnaUnifdwYktVJJUDTqmyGffw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036076e3-b099-4dbe-a9ce-08dbc533eb03
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 23:44:57.9386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQueoqpNFs0Z2znKtXM3OQdl3kZMAlBEs7j7cDHJrJp3vUHd5V+LgJV0oeg78W4B6otaC83eAR9XIaRUWqm40g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4665
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
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQpSZXNvdXJjZSBmbHVzaCBpcyB3aGF0IGlzIHdhaXRpbmcgZm9yIHRoZSBm
ZW5jZSB0byBiZSBzaWduYWxlZC4gDQoNCihpbiBjdXJyZW50IGNvZGUgYmVmb3JlIG15IHBhdGNo
ZXMgYXJlIGFwcGxpZWQpDQpzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3Jlc291cmNlX2ZsdXNoKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50MzJfdCB4LCB1aW50MzJfdCB5LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCB3aWR0aCwgdWludDMyX3QgaGVpZ2h0KQ0KLi4uLi4uDQogICAg
ICAgICAgICAgICAgdmlydGlvX2dwdV9ub3RpZnkodmdkZXYpOw0KDQogICAgICAgICAgICAgICAg
ZG1hX2ZlbmNlX3dhaXRfdGltZW91dCgmdmdmYi0+ZmVuY2UtPmYsIHRydWUsDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2Vjc190b19qaWZmaWVzKDUwKSk7DQouLi4u
Li4uDQoNCldlIHVzZSBndGsgb24gdGhlIGhvc3QuDQoNClRoYW5rcyENCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNv
bGxhYm9yYS5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDQsIDIwMjMgNDozMiBQTQ0K
VG86IEtpbSwgRG9uZ3dvbiA8ZG9uZ3dvbi5raW1AaW50ZWwuY29tPjsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEthc2lyZWRkeSwgVml2ZWsgPHZpdmVrLmthc2lyZWRkeUBp
bnRlbC5jb20+OyBrcmF4ZWxAcmVkaGF0LmNvbQ0KU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMy8z
XSBkcm0vdmlydGlvOiBkcm1fZ2VtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiIGZvciBvYmogc3lu
Y2hyb25pemF0aW9uDQoNCk9uIDkvNi8yMyAwMDowOCwgS2ltLCBEb25nd29uIHdyb3RlOg0KPiAN
Cj4gSSBkb24ndCBiZWxpZXZlIHRoZSBndWVzdCB3aWxsIHN0YXJ0IHJlbmRlcmluZyBvbiB0aGUg
c2FtZSBGQiB3aGlsZSANCj4gaG9zdCBpcyBjb25zdW1pbmcgaXQgYmVjYXVzZSB0aGUgdmlydGlv
LWdwdSBkcml2ZXIgb24gdGhlIGd1ZXN0IHdvbid0IA0KPiByZWxlYXNlIHRoZSBGQiBmb3IgdGhl
IG5leHQgZnJhbWUgYmVmb3JlIGl0IGdldHMgdGhlIHZpcnRpbyByZXNwIGZvciANCj4gdGhlIHJl
c291cmNlIGZsdXNoIGNvbW1hbmQgYW5kIHRoZSBob3N0IChRRU1VKSB3aWxsIGhvbGQgdGhlIHJl
c3BvbnNlIA0KPiB1bnRpbCB0aGUgcmVuZGVyaW5nIGlzIGZpbmlzaGVkLg0KDQpUaGUgdmlyZ2xf
Y21kX3NldF9zY2Fub3V0KCkgc2hvdWxkbid0IGhvbGQgdGhlIHJlc3BvbnNlIGlmIHlvdSdyZSB1
c2luZyBTREwgYmVjYXVzZSBmcmFtZSBzd2FwcGluZyB3b24ndCBiZSB2c3luY2VkLiBJdCBtYXkg
aG9sZCB0aGUgcmVzcG9uc2UgaW1wbGljaXRseSBpZiB5b3UncmUgdXNpbmcgR1RLIGZvciB0aGUg
UWVtdSdzIGRpc3BsYXkuIEFyZSB5b3UgdXNpbmcgU0RMPw0KDQotLQ0KQmVzdCByZWdhcmRzLA0K
RG1pdHJ5DQoNCg==
