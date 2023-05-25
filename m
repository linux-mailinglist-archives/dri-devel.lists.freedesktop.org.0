Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC6711AD9
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 01:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5B610E792;
	Thu, 25 May 2023 23:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DB210E789;
 Thu, 25 May 2023 23:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685058498; x=1716594498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B9GXjpGGLMC7xm/LEk18nCysUvp3gvAoH8QNyo5hKXo=;
 b=Rro+owk0A6AYU/TceqV2vf8gdCnEoRysunde7kI791r5RZ/FfhlCdfFc
 uPPuEAolnRtNVJ6qWjL1jUKXucJn8KQoI6icrtvv7B7bX3RshFKgh8vXC
 OCGYLPmD2uvrc8GCSU1azRXKkUxHr++/xvpGhOQ3n9iehPa8Z3xUpOvvV
 bpX7n+RFMfhg8yUacjipatgmCzifrWEAn6HaMFpWi8HBDNDgNGfj+g70H
 vdilpKc49G/MW7auoX6mhC/h90/rpTgorALiR+mLC37HxI6FC+aLKQob8
 20vfzHukqRCrV7F5LBpaj/MH+ep/cM8EoalYgjfnEeXnY2vcqASzjk0gG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="351571028"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="351571028"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682524073"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="682524073"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 25 May 2023 16:48:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:48:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:48:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:48:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h81E6b+SEGvzY68d+lO6pBOAd/jc2YP9fS4k99G+CjVf7fvqZ7StN4ecIKJePoY2yf8DcMZQ9KTz1FttqkvxpoDkQi3y2zoY4kCxlGzsU3mSStyHmAJGAog3YJJI/6G4d0jzbJEX/o/8maRy1RwwGA8BiJ/x+MUmBVvtqpObNL+jA18/cENs8FDZpEBj3fqat/nsGnK3ygE5mVF6DVT+2E+Nh70TgTW0YU3cJkODVfNNqT668a9xq8yvh0nzCc2CvZBEGPq/rgiO+g4aLo+Hc1B0JGd5hnJTOZfJNbxrEPjPEPXTO4L+LIw/unwPfM5jOThv2GRp/LczmpIZ9difMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9GXjpGGLMC7xm/LEk18nCysUvp3gvAoH8QNyo5hKXo=;
 b=gs+5fW/eJpduv1gUe6ioWCO0Zz/MEgFm4eFF3A9UPaGHQfrYX9v7xkgWXdqhAbqqvqgPyQ3YdhYTLpmBbaQAfOkle24sCGdIW3S9kugK6FYJ4pKN3fje/mpmPSqnXD9w9EZytG/lidLyFVKIfTVXg5K+Tfz0KqvYPbSBSoTB1dEiWpwzpvjWGHMlMGVikokF/oCi9fWxfdpit5F/gQVPYpwKPcdTgMLraTOitOFDo9gi4GT+hHFSZOvQYgHC4+BpKhyy2/9zIdDt4JNaq94G1fYquLKI1xWGsm/cLz/cMFfyd1Vm7+OtRZ0ma8ycoyH7ARA/YA2fRxj6+Bo723ABiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 23:48:13 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::b62f:36b0:a11e:cc76]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::b62f:36b0:a11e:cc76%3]) with mapi id 15.20.6433.013; Thu, 25 May 2023
 23:48:13 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/i915/uc/gsc: define gsc fw
Thread-Topic: [PATCH 5/6] drm/i915/uc/gsc: define gsc fw
Thread-Index: AQHZf2tLlx0JYJAG0Ual5BYHwTM7ZK9rx+OA
Date: Thu, 25 May 2023 23:48:13 +0000
Message-ID: <9d42920feebb8cd7f244ddf42239b63eb2630ac4.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230505160415.889525-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|CH3PR11MB8364:EE_
x-ms-office365-filtering-correlation-id: 3aac093e-d492-40a2-f483-08db5d7a811a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YiwXDc6A+20vQpeJe7wYegOIvqTYhDMeOAt4J53izSa4N3tBSSqEvbic28KG8lNpgbsxKhasMOKYsCc4l1KPPrB99S2sruHKGyiel41v6zxLgBhB3IpmpNESiNYT6vpqhcnF0pYZoUk6I7k+e7bxZyMlvTYayyyS8f2libpUA1quhSp1JzmhuS7dSLNozK1hfIlBKR5tWP+kfKWEZ0q0FHWWDfwxqAe4AQtREXh4CD9TbVKJtXm3gmQI9l5oob0B6kIXe9sFZjNHVzwEBm1goiXwSYl+p8GWkYzZAnTlxm1eoqMd6seGYe9Uo3s4XskdjX0RrUZ+hQ0q1ku+LY55m1mNYy4gNDCKmtBr9ynaa8JgQmk0L8ELkamP4BRjTlBQLDZXfgJVLyAKf/ZoqUoa9j0/2O9DwYvLowLk+2wSSU8q6wPSvN7LzxvLu9vH9hojp7koAhuz1WnzX/WSYpBtA37ODQgf08/re7VXABGRkDcDn/oFORYHcccZxBbcMxClCsZEInvoEaxftLcP9VEEleiwx3rVAulVLFvUEkIgkul4VMENmdDlOW/jDjIey7i6bGMCi6Wvhj5TetG/gJs3QW2lKdsCRhrOZZJnPTmTAD54NXL4VKXK87C6R/QNx5ux
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(110136005)(38070700005)(82960400001)(122000001)(38100700002)(54906003)(76116006)(91956017)(66476007)(66556008)(66946007)(66446008)(478600001)(86362001)(450100002)(4326008)(64756008)(71200400001)(83380400001)(6486002)(316002)(41300700001)(2616005)(36756003)(186003)(2906002)(26005)(6512007)(6506007)(5660300002)(107886003)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzlESmxQKzNHSWYvdFFMamV3LzJqdng3ZFA3R0pKSjcrQ1FpKzNwTG1JWUtk?=
 =?utf-8?B?ZWtEeSs2dHdtRXY4eUZnMUQrcnBxc1p0Q1g4ZEtsT1Y5WUhhQ3gwZDNoOWFY?=
 =?utf-8?B?bmZBTHp4QVRsUkRQQUFiQm0xYXBHQi9sWDN1NllWRzdLUHMwaGpQYzNhd0Yv?=
 =?utf-8?B?U040YXk4Y1BzWlJtSllmbXF1eXJoTCtRWXVHZXF1U09TNjJJTFJsUmZnVjQ3?=
 =?utf-8?B?Q214cGRNeFlsc2VsaEUxZnQyUG9hZkdiNng2OEVMNitSQ1ZCUVRTQmdRWERt?=
 =?utf-8?B?MmRidEhORjlwcWJzdFU3QzRnejZNL1hHNWRpem1yeHQyNHBUazQvUWpXempC?=
 =?utf-8?B?NmZ1ZUNVT2g5VUNSL1NJa1ZROCtPdzJJOWwwek1FTHFvNlYvSUp4TUdpS1Jk?=
 =?utf-8?B?eTZhQklyaU9ybS9tekFhcjhqdkZKUjY4Vkd2bmdPQzVmSGkwZDYvS1lrRlJq?=
 =?utf-8?B?Wi9pMkpWSHRVMERVZEFnc3JVT0tBeUhJOXhNQW9sWVh1MTdYbFZBdytha3RP?=
 =?utf-8?B?KytneTB0UkZKWS85Z2M0OWRyWWtGSkh6YURUNy9FdDA2dExpb3dxNmVYYUZG?=
 =?utf-8?B?QkZIQ08zUGtCemY2WHNpeDAweXBqUlB0Q2pOM3ZvK1FadmFRQjd6ZXhmbUJJ?=
 =?utf-8?B?SzBWcWZ4TFpBTGt0Znd2Mk9mMFRpdTgzVUNQZElUUStBeVhpTnI5aVBzeVBp?=
 =?utf-8?B?YW5HUFova3BZblRoejA2M0pOOXZ1RnN1UGZ6ZFF4TVZTeVJVbGt5Nld1b2p4?=
 =?utf-8?B?Q0d5TnJnWUt1S3FFU204czZhN0ZnU1VCSFRVUkx6TVoxODN0dnJmRTIzS3hF?=
 =?utf-8?B?NjBNd3JwYmxqREV1ZE1nZ2szeGxLVzZobFY1b05kRW9LdmwrZ0d1TzBrdmFX?=
 =?utf-8?B?SFZ0bnczZWQzWVZSNW1CSEJzUUdnUlJCQU5weGJvU29BdHg1TjNmNUtWSEta?=
 =?utf-8?B?Nmttczc4WFdPZ20wSHBjTUhQUkRzaDRQUWF2MVpJejF1ZlZMSnZVOWpTMVR4?=
 =?utf-8?B?QzcwNWxEek9wTU1zOThVM0NwZUpTU05oL3pYa1RBOHpPbnZTNkE0UEkyNGIv?=
 =?utf-8?B?VlJBZnlMUGdDbjNIdG1wbHQrdzhQNldhTVFjVEhQMzEyT1AxRThDREN3bXNm?=
 =?utf-8?B?TnZMcER6OE5PUzFtcURaNDVMaU9mREY5NzgwVS9VU2F3ZlhjM204T1FlcTR6?=
 =?utf-8?B?VFJVb1o5UXRoY0tWU0g0citaMitvWERNOGNmakJvTWZhU3p1T3U1dkI3VVZz?=
 =?utf-8?B?aWpIcnFPcWhTMDBlcHlFbTJNK0x5L2pxUm5VZnJMalhpVkZ0RzdwdnR5VFBP?=
 =?utf-8?B?Y3M5WnkzYlZGMXVRcEdvb1R6cHZxR2xUbDFqbGJBenEydWNDVkRsMTZZRXI2?=
 =?utf-8?B?WUlkWDkyTmEyNkY1djdFQUpmVUgxSDVqR2lydDNvVnZpKzVQd21hQkxFUEMr?=
 =?utf-8?B?WVhHcDhwSWRJdVNKV0dSaS9VZm90VElST0poYlUzd2FUeU9MVzNldXVRVThv?=
 =?utf-8?B?dFZxTEJWeWNXTW03K29NMTUxSVZsOUZPdW5LYVdqeVdXdkovRTh1dm5qRERL?=
 =?utf-8?B?K3N1QkZBR3lvTFh3UmVoZ2Q1MVZYSUhmWjFzYzdaVTBPM2IwSTdsQ05TSDcz?=
 =?utf-8?B?ZEdCbFZvd0ZsVnA5LzN4a2p4ZW5lTzgva1ZoTTBBRStIZUxwM1N1RCtBbVV2?=
 =?utf-8?B?Q3J1dmtXSmlXTXJSREdzdXNGWTVQMnZYbWNrMHMwYldYenNBeUJXczliL0pI?=
 =?utf-8?B?V1RybjI1TFFxZndIOW9WdDJtQkdTZE51dlgxMG44bmZqTnN2b01lVXJBaGV4?=
 =?utf-8?B?Z0ZsazNLT2tyMVJpSlZqVmJaL2poMG9xTXZmVDdUd3BMUUtja2lDWloxSU1T?=
 =?utf-8?B?YlZqUXNCdU5xd04zOStjSW9jN1hiUzVhRVc5cmFuMHJQOWpBKzAwRUJmL1R3?=
 =?utf-8?B?S1E4TG01MEdUN29UM2dBL2FFcWxudkNWTXhkK0FwMExSWWJ1Vk1uaEl5dWhw?=
 =?utf-8?B?bU9KNVVQVU03VUVBREhVYUY3S2JaR29mUkhXaytXSHFsZ050Ny9GS3pGeEFy?=
 =?utf-8?B?R2FFWEpDampENlA5eVdkQXVvR0FzaVBYQkdyK1ZXOFBwaHo4SkdvbStiYnVO?=
 =?utf-8?B?NmdmeGQ5RVBBS0dQRVh6aVdYWkZQQUJHZXJEbXN1OTNaSTNGTyt6WE40enI5?=
 =?utf-8?Q?hsj5LlC7rt9gD0nhZaBIraI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C963642768BD724E919A18B835EEF651@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aac093e-d492-40a2-f483-08db5d7a811a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 23:48:13.5969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9biMneA6GSbd2c3cU6fIY/1uYOAG5VXLrCaRftlz030R/u1nEuZCqypzSkBnhN3iUOIZvfKs8HHap3dqBGstpJKYsYrR+NvAWSckm3l2m2DQW9xAD/JT0Ov6b7AsdrS9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29uc2lkZXJpbmcgdGhlIG9ubHkgcmVxdWVzdCBpIGhhdmUgYmVsb3cgaXMgdG91Y2hpbmcgdXAg
b2YgZXhpc3RpbmcgY29tbWVudHMgKGFzDQpmYXIgYXMgdGhpcyBwYXRjaCBpcyBjb25jZXJuZWQp
LCBhbmQgc2luY2UgdGhlIHJlc3Qgb2YgdGhlIGNvZGUgbG9va3MgZ29vZCwgaGVyZSBpcw0KbXkg
Ui1iIC0gYnV0IGkgaG9wZSB5b3UgY2FuIGFud3NlciBteSBuZXdiaWUgcXVlc3Rpb24gYXQgdGhl
IGJvdHRvbToNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5h
bGV4aXNAaW50ZWwuY29tPg0KDQpPbiBGcmksIDIwMjMtMDUtMDUgYXQgMDk6MDQgLTA3MDAsIENl
cmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiBBZGQgRlcgZGVmaW5pdGlvbiBhbmQgdGhl
IG1hdGNoaW5nIG92ZXJyaWRlIG1vZHBhcmFtLg0KPiANCj4gVGhlIEdTQyBGVyBoYXMgYm90aCBh
IHJlbGVhc2UgdmVyc2lvbiwgYmFzZWQgb24gcGxhdGZvcm0gYW5kIGEgcm9sbGluZw0KPiBjb3Vu
dGVyLCBhbmQgYSBjb21wYXRpYmlsaXR5IHZlcnNpb24sIHdoaWNoIGlzIHRoZSBvbmUgdHJhY2tp
bmcNCj4gaW50ZXJmYWNlIGNoYW5nZXMuIFNpbmNlIHdoYXQgd2UgY2FyZSBhYm91dCBpcyB0aGUg
aW50ZXJmYWNlLCB3ZSB1c2UNCj4gdGhlIGNvbXBhdGliaWxpdHkgdmVyc2lvbiBpbiB0aGUgYnVp
bmFyeSBuYW1lcy4NCmFsYW4gOnMvYnVpbmFyeS9iaW5hcnkNCg0KPiANCj4gU2FtZSBhcyB3aXRo
IHRoZSBHdUMsIGEgbWFqb3IgdmVyc2lvbiBidW1wIGluZGljYXRlIGENCj4gYmFja3dhcmQtaW5j
b21wYXRpYmxlIGNoYW5nZSwgd2hpbGUgYSBtaW5vciB2ZXJzaW9uIGJ1bXAgaW5kaWNhdGVzIGEN
Cj4gYmFja3dhcmQtY29tcGF0aWJsZSBvbmUsIHNvIHdlIHVzZSBvbmx5IHRoZSBmb3JtZXIgaW4g
dGhlIGZpbGUgbmFtZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVy
aW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENjOiBBbGFuIFByZXZpbiA8
YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gQ2M6IEpvaG4gSGFycmlzb24g
PEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfdWNfZncuYyB8IDMyICsrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZncuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMNCj4gaW5kZXggMzZlZTk2YzAy
ZDc0Li41MzFjZDE3MjE1MWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3VjL2ludGVsX3VjX2Z3LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50
ZWxfdWNfZncuYw0KPiBAQCAtMTI0LDYgKzEyNCwxOCBAQCB2b2lkIGludGVsX3VjX2Z3X2NoYW5n
ZV9zdGF0dXMoc3RydWN0IGludGVsX3VjX2Z3ICp1Y19mdywNCj4gIAlmd19kZWYoQlJPWFRPTiwg
ICAgICAwLCBodWNfbW1wKGJ4dCwgIDIsIDAsIDApKSBcDQo+ICAJZndfZGVmKFNLWUxBS0UsICAg
ICAgMCwgaHVjX21tcChza2wsICAyLCAwLCAwKSkNCj4gIA0KPiArLyoNCj4gKyAqIFRoZSBHU0Mg
RlcgaGFzIGJvdGggYSByZWxlYXNlIHZlcnNpb24sIGJhc2VkIG9uIHBsYXRmb3JtIGFuZCBhIHJv
bGxpbmcNCj4gKyAqIGNvdW50ZXIsIGFuZCBhIGNvbXBhdGliaWxpdHkgdmVyc2lvbiwgd2hpY2gg
aXMgdGhlIG9uZSB0cmFja2luZw0KPiArICogaW50ZXJmYWNlIGNoYW5nZXMuIFNpbmNlIHdoYXQg
d2UgY2FyZSBhYm91dCBpcyB0aGUgaW50ZXJmYWNlLCB3ZSB1c2UNCj4gKyAqIHRoZSBjb21wYXRp
YmlsaXR5IHZlcnNpb24gaW4gdGhlIGJ1aW5hcnkgbmFtZXMuDQphbGFuOnMvYnVpbmFyeS9iaW5h
cnkNCmFsc28sIHNpbmNlIHdlIHdpbGwgKGkgaG9wZSkgYmUgYWRkaW5nIHNldmVyYWwgY29tbWVu
dHMgKGFsb25nc2lkZSB0aGUgbmV3DQp2ZXJzaW9uIG9iamVjdHMgdW5kZXIgaW50ZWxfZ3NjX3Vj
IHN0cnVjdHVyZSkgaW4gdGhlIHBhdGNoICMzIGFib3V0IHdoYXQNCnRoZWlyIGRpZmZlcmVuY2Vz
IGFyZSBhbmQgd2hpY2ggb25lIHdlIGNhcmUgYWJvdXQgYW5kIHdoZW4gdGhleSBnZXQgcG9wdWxh
dGVkLA0KcGVyaGFwcyB3ZSBjYW4gbWluaW1pemUgdGhlIGluZm9ybWF0aW9uIGhlcmUgYW5kIHJl
ZGlyZWN0IHRvIHRoYXQgb3RoZXINCmNvbW1lbnQuLi4gT1IgLi4uIHdlIGNhbiBtaW5pbWl6ZSB0
aGUgY29tbWVudHMgaW4gcGF0Y2ggIzMgYW5kIHJlZGlyZWN0IGhlcmUNCih3aWxsIGJlIGdvb2Qg
dG8gaGF2ZSBhIHNpbmdsZSBsb2NhdGlvbiB3aXRoIGRldGFpbGVkIGV4cGxhaW5hdGlvbiBpbiB0
aGUNCmNvbW1lbnRzIGFuZCBhIHJlZGlyZWN0LXB0ciBmcm9tIHRoZSBvdGhlciBsb2NhdGlvbiBz
aW5jZSBhIHJlYWRlciB3b3VsZA0KbW9zdCBsaWtlbHkgc3R1bWJsZSBvbnRvIHRob3NlIHF1ZXN0
aW9ucyBmcm9tIGVpdGhlciBvZiB0aGVzZSBsb2NhdGlvbnMpLg0KDQo+ICsgKiBTYW1lIGFzIHdp
dGggdGhlIEd1QywgYSBtYWpvciB2ZXJzaW9uIGJ1bXAgaW5kaWNhdGUgYQ0KPiArICogYmFja3dh
cmQtaW5jb21wYXRpYmxlIGNoYW5nZSwgd2hpbGUgYSBtaW5vciB2ZXJzaW9uIGJ1bXAgaW5kaWNh
dGVzIGENCj4gKyAqIGJhY2t3YXJkLWNvbXBhdGlibGUgb25lLCBzbyB3ZSB1c2Ugb25seSB0aGUg
Zm9ybWVyIGluIHRoZSBmaWxlIG5hbWUuDQo+ICsgKi8NCj4gKyNkZWZpbmUgSU5URUxfR1NDX0ZJ
Uk1XQVJFX0RFRlMoZndfZGVmLCBnc2NfZGVmKSBcDQo+ICsJZndfZGVmKE1FVEVPUkxBS0UsICAg
MCwgZ3NjX2RlZihtdGwsIDEsIDApKQ0KPiArDQo+ICAvKg0KPiDCoA0KPiANCmFsYW46c25pcA0K
DQo+IEBAIC0yNTcsMTQgKzI4MSw2IEBAIF9fdWNfZndfYXV0b19zZWxlY3Qoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUsIHN0cnVjdCBpbnRlbF91Y19mdyAqdWNfZncpDQo+ICAJaW50IGk7
DQo+ICAJYm9vbCBmb3VuZDsNCj4gIA0KPiAtCS8qDQo+IC0JICogR1NDIEZXIHN1cHBvcnQgaXMg
c3RpbGwgbm90IGZ1bGx5IGluIHBsYWNlLCBzbyB3ZSdyZSBub3QgZGVmaW5pbmcNCj4gLQkgKiB0
aGUgRlcgYmxvYiB5ZXQgYmVjYXVzZSB3ZSBkb24ndCB3YW50IHRoZSBkcml2ZXIgdG8gYXR0ZW1w
dCB0byBsb2FkDQo+IC0JICogaXQgdW50aWwgd2UncmUgcmVhZHkgZm9yIGl0Lg0KPiAtCSAqLw0K
PiAtCWlmICh1Y19mdy0+dHlwZSA9PSBJTlRFTF9VQ19GV19UWVBFX0dTQykNCj4gLQkJcmV0dXJu
Ow0KPiAtDQphbGFuOiBtb3JlIG9mIGEgbmV3YmllIHF1ZXN0aW9uIGZyb20gbXlzZWxmOiBjb25z
aWRlcmluZyB0aGlzIGlzIGEgbmV3IGZpcm13YXJlDQp3ZSBhcmUgYWRkaW5nLCBpcyB0aGVyZSBz
b21lIGtpbmQgb2YgcmVxdWlyZW1lbnQgdG8gcHJvdmlkZSBhIGxpbmsgdG8gdGhlIHBhdGNoDQp0
YXJnZXR0aW5nIHRoZSBsaW51eCBmaXJtd2FyZSByZXBvIHRoYXQgaXMgYSBkZXBlbmRlbmN5IG9m
IHRoaXMgc2VyaWVzPw0Kb3IgcGVyaGFwcyB3ZSBzaG91bGQgbWVudGlvbiBpbiB0aGUgc2VyaWVz
IHRoYXQgbWVyZ2Ugd2lsbCBvbmx5IGhhcHBlbiBhZnRlcg0KdGhhdCBwYXRjaCBnZXRzIG1lcmdl
ZCAod2l0aCBhIGZpbmFsIHJldiB0aGF0IGluY2x1ZGVzIHRoZSBwYXRjaCBvbg0KdGhlIGZ3LXJl
cG8gc2lkZT8pLiBKdXN0IHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSBwcm9jZXNzLg0KDQoNCj4g
IAkvKg0KPiAgCSAqIFRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgQURMIEd1QyBGV3Mg
aXMgdGhlIEhXQ29uZmlnIHN1cHBvcnQuDQo+ICAJICogQURMLU4gZG9lcyBub3Qgc3VwcG9ydCBI
V0NvbmZpZywgc28gd2Ugc2hvdWxkIHVzZSB0aGUgc2FtZSBiaW5hcnkgYXMNCg0K
