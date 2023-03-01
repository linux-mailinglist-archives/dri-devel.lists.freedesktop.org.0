Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35366A7636
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 22:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0592210E23C;
	Wed,  1 Mar 2023 21:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B63110E09C;
 Wed,  1 Mar 2023 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677706536; x=1709242536;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u5RtVqROg8VUkaWfNzV/h81vcVl7NssM3UHmRnXhwqM=;
 b=Pk4Gql/O5n8bmwhO4I9r8svoFBHjDUNULzY8ylmU3Tb9IkzFX0F5wfdF
 7gcx9mn0/uv+GHNIi2m4EpCvmMBQtH3iBkpPsV9u+kSs8Z0t5G2O2eGu5
 QB890kOvvSXjZYJGcETsGX8UP0ipu0sUgLdLWYQ1ZTmTsnrHaikA4M1o+
 eDd7uDl+TE0gbR0cJDEBVWwBLUa2ewbLqMIua+t8gm0Y1Ag0xN8DdNMyH
 K3TZp3vKX+32EwxiIeQCU7hHYbvWpr22Pk7yu50wepdsmnOQ7U2uTCODZ
 vbsOiQUMTsC+S3+291pHAofAxYXNBN78T0ZZUyxswBVkOa6u5uN9NA/rN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332008500"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="332008500"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 13:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="668014990"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="668014990"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 01 Mar 2023 13:35:35 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 13:35:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 13:35:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 13:35:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqFxzYTSE12haxUR1dLCYZkB3MAq+xxfixSTK5ZTjkC0TAR4zcRa+Lk4tFHjYBArpmDSjUDQSCy39md+QtR2KlKn55RdXM9N93XSlgx1Y3cvwi5SrVFwxDipXd02+ISL0U7d0SJ2uahDwq1hTq+M3FT3kzUz9AtPx3G8iHbmtqDYvwlVIA9k3S6X3zfeWJHi0mAl7q40qu3+7QBj38isCLHGNYlEyxRl5rHTINC4k+BJiDTdmXBErNPcpoNwVQ+/I2Z7v45BaUS8yWyX4KOpzfj3eFn299ZHfCd1eP7nv2XD+BJE5dj2wVzHFxYob4tTUgepwPJwGmoUn95JHZgfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5RtVqROg8VUkaWfNzV/h81vcVl7NssM3UHmRnXhwqM=;
 b=lmyK+AdDEcnrYuxG49zj93lpE0bRUvK+rWh/EVgDiyrpHwQbbm9sFwLW6bv/8AgQui1HkbH4ymtwe5SD+4K/byaXBlPjRGvWo5qUdfbjWttk7J8QoZ3cpNdPA8z6eEoELGhO3VevlymD0P88SDz7X5r4x42vsEu0roQBYbeGYJeI40ty8FZaCRX6IyV3/77RsT5JJCmjuFHgRCdP/6e3cPGDVwHWdS7QTKOi1enF8eobABTJODmyLQABMJh/6q9ytIZ3C6179HgME/44hYFIDxaSp3DJU8fIAjn2vQ3PE4GHTiDVkvDJQ/Y8DK4spYEzbQmQ+aFX/uOM+HuiVKFjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 DM4PR11MB5440.namprd11.prod.outlook.com (2603:10b6:5:39c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18; Wed, 1 Mar 2023 21:35:33 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::37fb:4480:3ea:b4f]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::37fb:4480:3ea:b4f%8]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 21:35:33 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Thread-Topic: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Thread-Index: AQHZTC1/WnLqn6sXAU+dslUEAfQ7j67mcmyA
Date: Wed, 1 Mar 2023 21:35:33 +0000
Message-ID: <DM4PR11MB5971C15BE57E870387F7C1EA87AD9@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
 <20230301110258.2140955-2-andi.shyti@linux.intel.com>
In-Reply-To: <20230301110258.2140955-2-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|DM4PR11MB5440:EE_
x-ms-office365-filtering-correlation-id: a623c367-129b-47fc-7812-08db1a9ce323
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7XAc/rPQYb/wJBD8Fg3JA9YapMpXQBFRdmKWZ941x3TN0EeJJVI6zTyVp+Z52GP6u5bFgM6+2k/uct/66CxCFcznSHkcsktHkpbCLCJoc+neyqNRi55TokV+v+/gFKyfrmAEyuTwnAQuJ434gHxIppJUN+PxL4mKkO8gigUetO8FlUdjS5Vy2cRI4CHLJk02hjQUrihtV5CYyA0gg1g2gta6Ek7MXeqYjVp0x4xfzpVZD7n+fj0qco8PeTMyPOSyrnrRi0CbKtZ5vo6LNGcyyNe9qbX0MrEJcE5N6JYnz/qhGobNFicCA/mpMXAw6r8G8G4/nzlrsuoQ+YrskSevLr5gVwPH8D0/tnpamQCMbefvujGR1DfBL+BXrkNOvEflgmZWdFImYho065fgwqtG5HZR2pUIVUwVsGc3PQvATB6jrkPjLqIHDbFoSOgd8YYdywGnrHzFq8H8JyIFU/Wn3lcqR30w7BCDsKdknlZ4VFrA1KtzvgHmmmbXq3Yo06sE9aB8TZk1tjLOhr13a8kulKrDuNMbH/escAKBnRLwzTHt4xOGtVuf8zR7rKcx3KuIS88sWWCQ2afkbDG3NV9VbilcWI8z7aWeJhOrVI32Kkarhn4n1eAXGtvUXZB68hfvhLgwzA2kEUnmrj//Y+fmqtj/mT+T3sLIRpYEukrSdKad6AUGZks6a/hhX1bmE+wnEsrRP//WxGDlHviZP5YOcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199018)(5660300002)(8936002)(83380400001)(41300700001)(186003)(9686003)(26005)(6506007)(8676002)(4326008)(66556008)(66476007)(53546011)(64756008)(66446008)(82960400001)(66946007)(76116006)(38070700005)(71200400001)(54906003)(38100700002)(110136005)(122000001)(2906002)(316002)(55016003)(33656002)(478600001)(7696005)(86362001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDZKVWtmVUdmazY4a3dXaStNc1VwTnNGMGhQRmNzWjZrTjg5ZXdrOFhDZC9Z?=
 =?utf-8?B?cnVEQXBhcVRBMXZvNHd1RjA2TkU4ejdlTExnM3JueEZqUnhxM3NEZnJTWU15?=
 =?utf-8?B?SHZ3aHYxWkFFcis2U2k4dWNYUm5oMGVkaGNFck14b1VudFAzR05iV1NyK3dH?=
 =?utf-8?B?aEE2RnN3T3ZMT0s4QkFFRnlZT0FrOTkzNTA0bkFoWXd2TlZzWGc3T2NxUXpv?=
 =?utf-8?B?WVNEVGhQYk5KQWR1RzNYTkIxS2JmQ1Irc3pZOWdKcGJLMnpydWswNDU5MnhZ?=
 =?utf-8?B?RG5OQVhoNlpUbkxFYldON1NySmgyTTc3ZEs1ZE9NNVAzRktaTldXWEVpaFhy?=
 =?utf-8?B?M2lMcXhhNUFjWjV1VFEyQkw0MUY3amo1d0VVYkxSamY3SW96VE1SbVZnRngz?=
 =?utf-8?B?NlFmUmxXbVk5RnlFaURXeUJwa2tmMS9pMmR2UjJWSm9RTDlJeGFSUmlCVW16?=
 =?utf-8?B?U1lnU01pOGhEb0pkNjIvekgyWVF2OS9ITE0wemVpNWUwOHYxVTNCWWRJemhx?=
 =?utf-8?B?QlM3Z2FEbXBITEpLQXZpMTRITEw4RWNDZG9BdTMzUVdCVUR5VXQ1b2ZSTzM2?=
 =?utf-8?B?cmdaakVtaU4ycFRWeGpGRUhFSDJQRXlDMUtkWks3dTBoNUE3QnZKMElnWmZk?=
 =?utf-8?B?YUhFV3lZaEtxRkNsVEFvYTZHSjMxR0RVMU9iRkpsVTdlZlpqdVcwN3I1c3Vk?=
 =?utf-8?B?cVpIeHZqM2tOUnJnUGVmTkQzZjduaENkc3B3blA5YVk5Mk1BTlhBUEhYRitG?=
 =?utf-8?B?RE9TSkFlQXkzcTRyT01YTm91RDRzWm9QOFhzRkt5eXE4SnNJeDZJam0yTHRt?=
 =?utf-8?B?aDFxSWlzQklkZFlESjd2dW5KeXJTSVVUMWJER1pQYSs4TzA0U1JOZ095LzRO?=
 =?utf-8?B?NkRNeHpnRTdMMHU3TEZnaEp1VlByRVRIbzl3MENwWStENWdOMlNvT3laYXJR?=
 =?utf-8?B?QmRKRkJZc3gxZmQzbTVzZHNka0kxYzNnbmpoOGtsTGlSM3hoYy9OVTNwd2tH?=
 =?utf-8?B?UHJ4VEkwbEthK2JTU2xwdlVDUURKamR5Z2dZbzdBbk9qQTM5ZDljTzJENDhY?=
 =?utf-8?B?L2NQQUNBeXpIWEd3ZXVETUdDQVNKYlgvVkh5RE1nT1lkVXZrU0F1MHI2aWJ3?=
 =?utf-8?B?MkQ3Q3NLL1JIZ3pQTWxrQU04TDR0M3pQQWRENVZjeEFBWVcvT3JZSnRlUmU2?=
 =?utf-8?B?TUlvamQ2dEozSFJncWtmUFBJQS8vMzhyVWI4SnovcENRYlN0a1E1S1hnNk9s?=
 =?utf-8?B?bm42NmNoNG03MkRCc1ZNZ0ZEYlVKdmpsRzJzM21UUTg2RlNudHhYdUtlRDQw?=
 =?utf-8?B?R2hMWjRQcXhoWE53a3paSWdscStjQXBQQkZheGlNMngwcExaYnU0eUptOC9K?=
 =?utf-8?B?OTZoN2pxSnNoWUJSV1FRekV4ZFZFNXU2eW9BdGI3SW1oZk4vZ3RUNVRxQ0I4?=
 =?utf-8?B?MFlUTEl5aFJGbE1UVzVXWnNZejJoS2tLOWg2M2JGU3R0QW12Wi9MelFpMy9w?=
 =?utf-8?B?YlpmZkFTNjA4d1RCcnp5MXRFUW01aXFyakYwRVVyY0EvZXl2bTRnc3NtYzNo?=
 =?utf-8?B?Ym0zdTg2U1hBdmxUNkszOW5MZjhNQ203MFRzOWdFUVNHMmpzeHBMZW1sUFhT?=
 =?utf-8?B?K3Nqd0QzMU9jZUovTmFTMDFYNG4wQVpvQ1dsVDNlUHhEZmMwZ2xSVGZTbDhx?=
 =?utf-8?B?a2FhWTh6M0dVaTVXMnJBbW9qdXMrNGRYUlJrbzFENE5Qc1dYQVNwcTRndkNB?=
 =?utf-8?B?blFtbHFROW1zY3p1aFNzOVcxNjBRZTJ2UDdiMG1uTVJkK1RLaWt1SnFwaURJ?=
 =?utf-8?B?aXB2SGYrZXpHTlV5cnNuQjJ3aDM0SFQvd2NlLzZNNmdHYTgyTEhpNmZIdHE5?=
 =?utf-8?B?dDNRSzU3MHhXZ01jQXVSZnl4T2thYUo0eUFYK3NFNUVRdXNRUnBtQ1o5Wlls?=
 =?utf-8?B?ZXNDV3QvQ1BWYlVWN2JYZU9TRVY3R0lJQW9ObnZYYXMyQXRWUFFpLy9VN3du?=
 =?utf-8?B?RVJwaGdnMEhzWVU5czVzUExFeGFxdlhLMHFLbXZjeXBnYU1lQWl1aDM0Z1lm?=
 =?utf-8?B?M0dGWGd6dTFWZE9lRnMxYXhBZEJPNEdkaVAzTGZHRW5XTEFoM09PTUdDc0do?=
 =?utf-8?B?cEUxeFA3Ty95TUQwQStwTHFKSHNvOElBbGhNN0llaStwY0k1SWkvWFlEdkxw?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a623c367-129b-47fc-7812-08db1a9ce323
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 21:35:33.0873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzEpRp5Ovjuul+rU39xEQgf30EpcpKgT509o7vycg714xSIT9yw7s6ioDdyA1kDoJhaX8gFxAwDAbKZ89OUPDuXOsATi1hvfBxtli6YOfCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5440
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>, Andi Shyti <andi@etezian.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBhbSBub3Qgc3VyZSBpZiBUaWxlcyBpcyBhcHByb3ByaWF0ZSB1c2FnZSBoZXJlLiBTaW5jZSBN
VEwgZG9lcyBub3QgaGF2ZSB0aGUgY29uY2VwdCBvZiB0aWxlcy4NClNob3VsZG4ndCB3ZSBiZSB1
c2luZyBndCBpbnN0ZWFkIG9mIHRpbGUgaW4gb3VyIHVzYWdlPw0KDQpXaXRoIHMvdGlsZS9ndC9n
LA0KUmV2aWV3ZWQtYnk6IFJhZGhha3Jpc2huYSBTcmlwYWRhIDxyYWRoYWtyaXNobmEuc3JpcGFk
YUBpbnRlbC5jb20+IA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRy
aS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgQW5kaQ0KPiBTaHl0aQ0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDEsIDIwMjMgMzow
MyBBTQ0KPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGlu
QGxpbnV4LmludGVsLmNvbT47IEFuZGkgU2h5dGkNCj4gPGFuZGlAZXRlemlhbi5vcmc+OyBQYXRl
bGN6eWssIE1hY2llaiA8bWFjaWVqLnBhdGVsY3p5a0BpbnRlbC5jb20+OyBBbmRpDQo+IFNoeXRp
IDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFsDQo+IDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDEvMl0gZHJtL2k5
MTUvZ3Q6IENyZWF0ZSBwZXItdGlsZSBkZWJ1Z2ZzIGZpbGVzDQo+IA0KPiBUbyBzdXBwb3J0IG11
bHRpLUdUIGNvbmZpZ3VyYXRpb25zLCB3ZSBuZWVkIHRvIGdlbmVyYXRlDQo+IGluZGVwZW5kZW50
IGRlYnVnIGZpbGVzIGZvciBlYWNoIEdULg0KPiANCj4gVG8gYWNoaWV2ZSB0aGlzIGNyZWF0ZSBh
IHNlcGFyYXRlIGRpcmVjdG9yeSBmb3IgZWFjaCBHVCB1bmRlciB0aGUNCj4gZGVidWdmcyBkaXJl
Y3RvcnkuIEZvciBpbnN0YW5jZSwgaW4gYSBzeXN0ZW0gd2l0aCB0d28gdGlsZXMsIHRoZQ0KPiBk
ZWJ1Z2ZzIHN0cnVjdHVyZSB3b3VsZCBsb29rIGxpa2UgdGhpczoNCj4gDQo+IC9zeXMva2VybmVs
L2RlYnVnL2RyaQ0KPiAgICAgICAgICAgICAgICAgICDilJTilIDilIAgMA0KPiAgICAgICAgICAg
ICAgICAgICAgwqDCoCDilJzilIDilIAgZ3QwDQo+ICAgICAgICAgICAgICAgICAgICDCoMKgIOKU
gsKgwqAg4pSc4pSA4pSAIGRycGMNCj4gICAgICAgICAgICAgICAgICAgIMKgwqAg4pSCwqDCoCDi
lJzilIDilIAgZW5naW5lcw0KPiAgICAgICAgICAgICAgICAgICAgwqDCoCDilILCoMKgIOKUnOKU
gOKUgCBmb3JjZXdha2UNCj4gICAgICAgICAgICAgICAgICAgIMKgwqAg4pSCwqDCoCDilJzilIDi
lIAgZnJlcXVlbmN5DQo+ICAgICAgICAgICAgICAgICAgICDCoMKgIOKUgsKgwqAg4pSU4pSA4pSA
IHJwc19ib29zdA0KPiAgICAgICAgICAgICAgICAgICAgwqDCoCDilJTilIDilIAgZ3QxDQo+ICAg
ICAgICAgICAgICAgICAgICDCoMKgIDrCoMKgIOKUnOKUgOKUgCBkcnBjDQo+ICAgICAgICAgICAg
ICAgICAgICDCoMKgIDrCoMKgIOKUnOKUgOKUgCBlbmdpbmVzDQo+ICAgICAgICAgICAgICAgICAg
ICDCoMKgIDrCoMKgIOKUnOKUgOKUgCBmb3JjZXdha2UNCj4gICAgICAgICAgICAgICAgICAgIMKg
wqAgIMKgwqAg4pSc4pSA4pSAIGZyZXF1ZW5jeQ0KPiAgICAgICAgICAgICAgICAgICAgwqDCoCAg
wqDCoCDilJTilIDilIAgcnBzX2Jvb3N0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRp
IDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfZ3RfZGVidWdmcy5jICAgIHwgNCArKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC91Yy9pbnRlbF9ndWMuaCAgICAgICAgfCAyICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC91Yy9pbnRlbF9ndWNfbG9nLmMgICAgfCA1ICsrKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC91Yy9pbnRlbF91Y19kZWJ1Z2ZzLmMgfCAyICsrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfZGVidWdmcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvaW50ZWxfZ3RfZGVidWdmcy5jDQo+IGluZGV4IDVmYzJkZjAxYWEwZGYuLjRkYzIz
YjhkM2FhMmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0
X2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9kZWJ1
Z2ZzLmMNCj4gQEAgLTgzLDExICs4MywxMyBAQCBzdGF0aWMgdm9pZCBndF9kZWJ1Z2ZzX3JlZ2lz
dGVyKHN0cnVjdCBpbnRlbF9ndCAqZ3QsDQo+IHN0cnVjdCBkZW50cnkgKnJvb3QpDQo+ICB2b2lk
IGludGVsX2d0X2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IGludGVsX2d0ICpndCkNCj4gIHsNCj4g
IAlzdHJ1Y3QgZGVudHJ5ICpyb290Ow0KPiArCWNoYXIgZ3RuYW1lWzRdOw0KPiANCj4gIAlpZiAo
IWd0LT5pOTE1LT5kcm0ucHJpbWFyeS0+ZGVidWdmc19yb290KQ0KPiAgCQlyZXR1cm47DQo+IA0K
PiAtCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImd0IiwgZ3QtPmk5MTUtPmRybS5wcmltYXJ5
LT5kZWJ1Z2ZzX3Jvb3QpOw0KPiArCXNucHJpbnRmKGd0bmFtZSwgc2l6ZW9mKGd0bmFtZSksICJn
dCV1IiwgZ3QtPmluZm8uaWQpOw0KPiArCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZ3RuYW1l
LCBndC0+aTkxNS0+ZHJtLnByaW1hcnktDQo+ID5kZWJ1Z2ZzX3Jvb3QpOw0KPiAgCWlmIChJU19F
UlIocm9vdCkpDQo+ICAJCXJldHVybjsNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC91Yy9pbnRlbF9ndWMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX2d1Yy5oDQo+IGluZGV4IGJiNGRmZTcwN2E3ZDAuLmU0NmFhYzFhNDFlNmQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Yy5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Yy5oDQo+IEBAIC00Miw2ICs0Miw4
IEBAIHN0cnVjdCBpbnRlbF9ndWMgew0KPiAgCS8qKiBAY2FwdHVyZTogdGhlIGVycm9yLXN0YXRl
LWNhcHR1cmUgbW9kdWxlJ3MgZGF0YSBhbmQgb2JqZWN0cyAqLw0KPiAgCXN0cnVjdCBpbnRlbF9n
dWNfc3RhdGVfY2FwdHVyZSAqY2FwdHVyZTsNCj4gDQo+ICsJc3RydWN0IGRlbnRyeSAqZGJnZnNf
bm9kZTsNCj4gKw0KPiAgCS8qKiBAc2NoZWRfZW5naW5lOiBHbG9iYWwgZW5naW5lIHVzZWQgdG8g
c3VibWl0IHJlcXVlc3RzIHRvIEd1QyAqLw0KPiAgCXN0cnVjdCBpOTE1X3NjaGVkX2VuZ2luZSAq
c2NoZWRfZW5naW5lOw0KPiAgCS8qKg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMv
aW50ZWxfZ3VjX2xvZy5jDQo+IGluZGV4IDE5NWRiOGM5ZDQyMDAuLjU1YmM4YjU1ZmJjMDUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfbG9nLmMNCj4gQEAg
LTU0Miw4ICs1NDIsMTEgQEAgc3RhdGljIGludCBndWNfbG9nX3JlbGF5X2NyZWF0ZShzdHJ1Y3Qg
aW50ZWxfZ3VjX2xvZw0KPiAqbG9nKQ0KPiAgCSAqLw0KPiAgCW5fc3ViYnVmcyA9IDg7DQo+IA0K
PiArCWlmICghZ3VjLT5kYmdmc19ub2RlKQ0KPiArCQlyZXR1cm4gLUVOT0VOVDsNCj4gKw0KPiAg
CWd1Y19sb2dfcmVsYXlfY2hhbiA9IHJlbGF5X29wZW4oImd1Y19sb2ciLA0KPiAtCQkJCQlpOTE1
LT5kcm0ucHJpbWFyeS0+ZGVidWdmc19yb290LA0KPiArCQkJCQlndWMtPmRiZ2ZzX25vZGUsDQo+
ICAJCQkJCXN1YmJ1Zl9zaXplLCBuX3N1YmJ1ZnMsDQo+ICAJCQkJCSZyZWxheV9jYWxsYmFja3Ms
IGk5MTUpOw0KPiAgCWlmICghZ3VjX2xvZ19yZWxheV9jaGFuKSB7DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19kZWJ1Z2ZzLmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19kZWJ1Z2ZzLmMNCj4gaW5kZXggMjg0ZDZmYmMy
ZDA4Yy4uMmY5M2NjNGU0MDhhOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvdWMvaW50ZWxfdWNfZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3VjL2ludGVsX3VjX2RlYnVnZnMuYw0KPiBAQCAtNTQsNiArNTQsOCBAQCB2b2lkIGludGVsX3Vj
X2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IGludGVsX3VjICp1Yywgc3RydWN0DQo+IGRlbnRyeSAq
Z3Rfcm9vdCkNCj4gIAlpZiAoSVNfRVJSKHJvb3QpKQ0KPiAgCQlyZXR1cm47DQo+IA0KPiArCXVj
LT5ndWMuZGJnZnNfbm9kZSA9IHJvb3Q7DQo+ICsNCj4gIAlpbnRlbF9ndF9kZWJ1Z2ZzX3JlZ2lz
dGVyX2ZpbGVzKHJvb3QsIGZpbGVzLCBBUlJBWV9TSVpFKGZpbGVzKSwgdWMpOw0KPiANCj4gIAlp
bnRlbF9ndWNfZGVidWdmc19yZWdpc3RlcigmdWMtPmd1Yywgcm9vdCk7DQo+IC0tDQo+IDIuMzku
MQ0KDQo=
