Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55CC727399
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 02:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EBA10E578;
	Thu,  8 Jun 2023 00:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F240D10E574;
 Thu,  8 Jun 2023 00:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686183131; x=1717719131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xJrpCGmThwUvJV2TDHRxmCb+7DqPslIWo2HD8S9PgWk=;
 b=aTJ9Snt7qKU6GBSHG7Um48x/45GR3UtECqGA9MjFNm9qP7it3CC+lHF4
 SnXlNEgCuQpDsiHmpsPQAcIjpdz2Hh/qvH7S/nUywglE3InOEQPlHXE1+
 siYYg4m0M16TBAUEj+PcUqYssgpf39QBJvQavSq9Yn2UHdl6dpxDzkFMf
 6whDXs/xEUHJzYSY0/h/j9hlqKbSELWxuOOfw7qyCSSGTXkPl+O7Z5pbi
 XQdjYA2O78M2rxtYgNQ4d399UP1n0BspXdGuxYLnC6/zNeNUcEHN5OA59
 JePcV9gTqmM9vQOWgZZqZ6Ka+J9NNGuUhkXg43wpVzdLf7qCA9mD//6io A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346759883"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="346759883"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 17:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="1039884724"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="1039884724"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2023 17:12:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 17:12:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 17:12:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 17:12:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 17:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiE4r4eEqmHMvspHZfCgPJMohn/lrh7wR4kF9Oya+QUljmqmT1VARjtDmr7Ok0pkMfxd8sHDomzUNcQPzoy73Xe/+ECtjP1AL2pz7v8m4F5iLfB3H6BWoMt09gCGZjzC36HrBSNqwnMdXTVCctA0F8F1oh8Kc+L/VnbEOXPSiTwqbJLDABX9bROe7oUQXIwLylAkSMDR7MqQEaRaQE/RuwrcKghmcJ3CRfNnVBgkqpqlG7jfbuIwTS3Zam0Xg5B5LlahR87WTrOWGZT5Hu6Thw/fwvXZfr/15vOqmtNVuVMp8H7JYkuPeLsC2Rf+2nZaWl9nJQx9dJybs5Otm4SgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJrpCGmThwUvJV2TDHRxmCb+7DqPslIWo2HD8S9PgWk=;
 b=A7aHko2EvRxTzo3K9kJC3LyU8YyE+ssJOXvsKKFmI0CzfgTTmichUS/sYWCcw9oZkncE8noJH+EU1zubQFZiEKdrOfuh8jmZBPrtdYn4LyLatF6FNPjLu4o+w4fz1bs0opH1QDmpkQnRf2FaBE7ScKDwou1hG/hg/wGonr8x3YLrehoJZjbRuPhBCmQ9CMG7zY9gv0pohmhS0pWzyH+n4OWTksMwuwZXZmZGgrx8dlntqmrVZqUeMQTPe6lMhmTYIJ3Oe1AJyaVcDc/eg/zS1rRE44ggE5gP1flvHK5cwehl3ZWSa7MWhZ/eKOG+2KbDgqkIrUyosd1Zbf8ECLTYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Thu, 8 Jun 2023 00:12:07 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 00:12:07 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [v1] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Thread-Topic: [v1] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Thread-Index: AQHZmZ3c9bgLlQVOakmDZsIQZzED9Q==
Date: Thu, 8 Jun 2023 00:12:07 +0000
Message-ID: <ce74d3f3e041b30f268c367de81b759037eaedd4.camel@intel.com>
References: <20230602185213.2635921-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230602185213.2635921-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CYYPR11MB8406:EE_
x-ms-office365-filtering-correlation-id: a8271f89-cea5-41cc-c85c-08db67b4ff2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xeCgNkQxgNoZzRTzY1jOr1cV36laxAF1o7EzK2LFvMb5I24G/DG5XqPLM75MqdhjlSIzRQHBvJTOJTtPRtLuxC1rtmzO0yykQEtdCvun1F9U7WQsqwsZGMrXrlJfjhms/mwoTFAglvAxwheTPZtjcRMozQobaJWORGEyLHI/Rl1G2m0RlUDA1gLICGggiwD3mVGYScs//1zVQgnjGAx7VA4qIODtqTyJhC1D4sIR9H2bj9gftHCs7R1C97AqWiRsO5NpLRZ+ip8y+heugDy8wTLz0SSebw982H7I8nDbxRT5KUfJ0Kezmu5RwgKnzRk/f1CtMOTBxyJU6joN/uzUBlBc152JgHhoHUT52UuHxgRRdlwun+GndaZdWyLc57cbJo2gf/lBDbAJAmCNNqWBoSZNDEHQrIlAoOfM2BvbkRosDoObSEauGz2aAWECkL0NUviFXKyMK47BHJB4I51d8gFaxlu8qh9dGGK6lH5co2ixgFQApPwu7tY0bJgKOpQ+WMr400RyZRUB4Qb0zaGEB0kp9tPP2mh+muwY6bd9o3elqeAmaV1EJDfHKX7gxxBhlNpTbWpsrdWcSwYtDd3SUbyiRQ4rSx1rZfWCXmZjEZPuy0HFKuAnjygKiYWKmo2q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(6512007)(38100700002)(6506007)(2616005)(41300700001)(6486002)(26005)(186003)(71200400001)(478600001)(110136005)(64756008)(66476007)(91956017)(122000001)(66446008)(4326008)(450100002)(82960400001)(316002)(66946007)(76116006)(8676002)(66556008)(6636002)(8936002)(2906002)(5660300002)(38070700005)(86362001)(4744005)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUR1NEVlMThRQkxYelU4L29NQzJEWDhYYUEyL2cyV3FIN0MvTWpKOUdianFy?=
 =?utf-8?B?Ylp6SUdyMGcxaEJkK2ZZUlJLRU12QWVCbkJCUlVrYnQwTDUyaTR1MHkveVp5?=
 =?utf-8?B?Qit5R0hzMUVyc0lSRVIzQVpGQkhWS211VnN1enJMcFNaemtZTEhWd3FEdVlL?=
 =?utf-8?B?MGtQOVRsYUlId3ZFQUhkYzkvMlF2eDlyS1hPNktsaENWbWV1QU45WkJUZHVM?=
 =?utf-8?B?d1dUMm5Ua0NNZmgvb0tmU096SkluRGVwbUZWbjhhVlJxV2JtZWVLRkJYUDBy?=
 =?utf-8?B?OEJzcTdmSUdaZEYxVkFEYlpwUjBUNDNzREowdUlpbDd3OUpFTkh6OFQxSzhC?=
 =?utf-8?B?bkVwR2Zqa202aTc5OXplRTNpL25MUEIzcFJHY291VTF3SDZyaWhjODBGRE1B?=
 =?utf-8?B?aENSYjhSdVRoUzhGcjVtenlXa1h0OHkwTmVPU0pBUUpFQXF3dFh6bFZzZTBl?=
 =?utf-8?B?RGlUa080LytmQi8xV0RRSmlwNGQyRXk4MVErR0lzc2NIWnpaK1U5TDFSVFhs?=
 =?utf-8?B?WkczY24veXBFRWdXQm41RDMrVUQ1VVNHdkpzQ2NBMnVVZWJlekszMWlranRV?=
 =?utf-8?B?MU44eXN6WHdWVllNWVhFdmMrR3FjQTg1T0tMWDNxQk5oTkc3VDFPVmJKYW5S?=
 =?utf-8?B?MGlKdGpYTWt2bStZdUF4Z1d4ZTN6Z05wSjJ3Zzd2ZXoyMUhEaDBnbnFjM3J3?=
 =?utf-8?B?cENWZ1pKOGVVUTVOU05OWk9yUjM0L3RWTnFCVTBKZWlheXF6Wm5IM05wVnpB?=
 =?utf-8?B?M3REekF2SStzRlFqcjVjaFBtSlN4M2FpdUFXRlBBdVMrazRndE9NRk5NbU9T?=
 =?utf-8?B?bUxsUjJYL0N3anNDbHhQMDM1d3VrTmM2cjdWNm52TTc3WHpjLzhZcDRsb2lD?=
 =?utf-8?B?bSs3LzZ4N2tGeEkrZGFONUF4dXZwV2o0NDVZNGdUWGlJVWV4YUt1WUxDVXp6?=
 =?utf-8?B?RmQ3UXZYK2VlSjd5SXRVQk9vSlkzcnUxTnVBeEUrd0pQeHEwL3NGSWpGa1BF?=
 =?utf-8?B?ZGJ2SWVramtqQkpBWlJZMkt3NlNvWTRJV2pTemxFNkZFZzh1OWpYd0pzK0Jw?=
 =?utf-8?B?NXRTbWpLbUZoNVVra0cvenZvcXZoaHFmZHpuZ2h0TkFDTU91TGkvR0pCSHFW?=
 =?utf-8?B?b2xhTHBTcVJxVGVlWk90ZnAzT3FNVmVwVUVrL29HOFBVSG81RWRnaHhnempF?=
 =?utf-8?B?NmtXWU14aHZ0ZW9Mb3dTV0gwRiszVnRlQXoyNDRqUHBOOGxTK2JSMzAycGZN?=
 =?utf-8?B?QSs1RUhwSGYwbEZDaUEwTDRFMXBFeDFFdlBiTmUrYy9OWS9GbFNwemJMRThV?=
 =?utf-8?B?UXowSWU5VzZuemw1Mmk5ZHJGSFZtRm9nTUM5V3Z4NzNSdjJFQTRRN3NLZzc5?=
 =?utf-8?B?c01UclJoK05QNXRQS1cyYTVZei9lcDlBL3BLUVVYTmd2aVRSTENqcGh2Qkxu?=
 =?utf-8?B?ZkUwZVpQaVFwcVNZbWdsSXlHZTRtZm9MQWo2ZG02Y2JBRmptWkVZL1hJMm5x?=
 =?utf-8?B?TFFNREU3Wi9XKytqUWkzeGpyblBMV2c1MHBlUFFqL0xXNVlmWEM5TFR3RUs2?=
 =?utf-8?B?b0dsNStDYW5mQ3hXVlJPc0ZEK2wwSVJDUEpBbWhIck94Y2ZESlNkVnFRNFNv?=
 =?utf-8?B?MXhLWVBUbkJGdFdxVTV3c3JSV3lvdTJieUdqQTE1VUdPeW01eksvekJNcTB3?=
 =?utf-8?B?b08xcVdudk9Bb3pNS2tQbGZzNXJwQWhaWlI2RFBxNVJpVUFpZVNSWnJnWUJO?=
 =?utf-8?B?SDVRYTZDZmRBeEhpZmUvSzVuTGN5cC9GNmxhQ3J2NWtRQ2pHSkF6RjhWclov?=
 =?utf-8?B?OUtQR1B0MWhKRjhobFRMUVI5U3hyN2VKOXA2dDMycndRSHVlMXQvU096Ri91?=
 =?utf-8?B?Tnp0a2haZWJOVVFRK0NKUU9XSDJCZVI3WFFqVGtpbi83bFBhYmE1K1ZpOFJ1?=
 =?utf-8?B?aHJlM29sRnNrckh6VFNVV2htU2lBS0NaM2lEVFJaU25qSllLc2VoK0FsUnNj?=
 =?utf-8?B?aXprY3p6UHpxNHdCaEJNNUoyRVBtQjJQNGZhVEdNK21mdnk4TEttKzU2OWRP?=
 =?utf-8?B?SUZQYVFsMU54Y2RLcCtTdzNaQU5QT0lBZFRoelUwaU9oM3NFNGhuZ0t1dkw0?=
 =?utf-8?B?WTgvYXZ5YUtid1pHVmw4M0tNNE5uKzhEenkyTzZvSEhZR3hZdlFIQUhGRmVt?=
 =?utf-8?Q?4QZP5tYogxvjNjHWqoAZJ5o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3ABAC029AD4D04F972E9B309811F427@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8271f89-cea5-41cc-c85c-08db67b4ff2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 00:12:07.5328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6Sb0hDYlZ5saZ9QcLtTT2xS/OBf8wG2g5n4IS7ZB8VW2mL0p0JYoBLsGQErMHQ7kWOlm3XBZ6R5FT8gNyzaRA40/DJng+0QGBUxDpYC/4U6Ris1fN9F+wVo2dsorW8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
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

T24gRnJpLCAyMDIzLTA2LTAyIGF0IDExOjUyIC0wNzAwLCBBbGFuIFByZXZpbiB3cm90ZToNCj4g
SW4gdGhlIEFCSSBoZWFkZXIsIEdVQ19DVEJfTVNHX01JTl9MRU4gaXMgJzEnIGJlY2F1c2UNCj4g
R1VDX0NUQl9IRFJfTEVOIGlzIDEuIFRoaXMgYWxpZ25zIHdpdGggSDJHL0cySCBDVEIgc3BlY2lm
aWNhdGlvbg0KPiB3aGVyZSBhbGwgY29tbWFuZCBmb3JtYXRzIGFyZSBkZWZpbmVkIGluIHVuaXRz
IG9mIGR3b3JkcyBzbyB0aGF0ICcxJw0KPiBpcyBhIGR3b3JkLiBBY2NvcmRpbmdseSwgR1VDX0NU
Ql9NU0dfTUFYX0xFTiBpcyAyNTYtMSAoaS5lLiAyNTUNCj4gZHdvcmRzKS4gSG93ZXZlciwgaDJn
X3dyaXRlIHdhcyBpbmNvcnJlY3RseSBhc3N1bWluZyB0aGF0DQo+IEdVQ19DVEJfTVNHX01BWF9M
RU4gd2FzIGluIGJ5dGVzLiBGaXggdGhpcy4NCj4gDQo+IA0KYWxhbjpzbmlwDQoNCj4gVGhlIHBh
dGNoIGl0c2VsZiBtYWtlIHNlbnNlIGJ1dCBjb25jZXJuZWQgYWJvdXQgdGhlIHZhbHVlIG9mDQo+
IEdVQ19DVEJfTVNHX01BWF9MRU4uIElzIHRoZSBtYXggc2l6ZSBvZiBDVEIgcmVhbGx5IDI1NiBE
V3M/IFRoYXQgc2VlbXMNCj4gd2F5IHRvIGxhcmdlLiBBbHNvIEkgdGhpbmsgc29tZSB0b29scyBh
cmUgZ29pbmcgdG8gY29tcGxhaW4gd2l0aCB0aGUNCj4gc3RhY2sgYmVpbmcgdGhpcyBsYXJnZSB0
b28uDQo+IA0KPiBNYXR0DQoNCmFsYW46IGdvb2QgcG9pbnQgLSBpIHdpbGwgZ28gYmFjayBhbmQg
ZmluZCBpZiB3ZSBoYXZlIHRoaXMgdmFsdWUgaW50ZXJuYWxseSBzcGVjJ2QgYmVmb3JlIHdlIGNv
bnRpbnVlLg0K
