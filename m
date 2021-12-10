Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FB46FD3B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 10:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A80910E559;
	Fri, 10 Dec 2021 09:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E85410E443;
 Fri, 10 Dec 2021 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639126864; x=1670662864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wOJaRehvRCpXnGNDTUmPveOqkdP5xtX2eFEUmFZuE1A=;
 b=Y8NIXiknjFOjjU/DTbdwiKydKTVbSby0JclI2D5TLKNT1HlRhvyfUbJ8
 eHMMLYdj/ewpQridqafe5LmG6s1i4bLyF911Zn0vFpY88hAh7Xd+PGGoa
 pzmG9fTQ4U+jbCPGbyT7345BBWvLjnLEXF2hnaYPGnYjJ7Ae22oZx9mJA
 1+0v1fPCZcPo3/Tz2zO74A6Ns7YT7bW8w/ZnfsDw4EOdcg4woJyk/Vw/O
 xX2F9HMNm/KweHmGMOFD93Rq4JBI5YbcRYxWgaKHla9FG96MzLxLK9cLl
 HezzwAPxuMJFa1gB4U735ZFYvxLYy/I0GHPYFZDkayhBKvwHuw+W32E8P A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218332068"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="218332068"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 01:01:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="680678838"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 10 Dec 2021 01:00:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 01:00:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 01:00:58 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 01:00:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqMeAwUN9CK6ieeo8Nxi1M7EnZI5ua+AwU2zZePIvlal/0a1bsQdLYifI9NGxf7Xw+P37u47++6XKAQDf+Ve7L5NaRW89Pv0Tfq2HNrE0/rKHkDS7t1cvOoDFD38QBmPDzVAz61B6twSRxYpuEae76l6egZMCiVvGygU+4b9iy/Melc9H/xrsm06KuuTUgcKy4zapatmWX8WwixCxFtbsodyVUdbE18BT/ODsnjN4hYobTKneg5+LYhxud2Xy3OUmftsAcWl2PjfVzJCySBZyQctPKS59TTSivoowjTo5ZNJNuqpeg+aQjJH8IdkIAXBMP38iuY8Po4IIpxBkifrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOJaRehvRCpXnGNDTUmPveOqkdP5xtX2eFEUmFZuE1A=;
 b=CI/r3ubNKWqbINJfoEKZHxeXXLo5dy3e2T0O9i+aiVQR4CwkiCAvtlkTCtRbo+vOWzWu6jsCD2tw1fmM5QOB+U82TajFMvFgBt56+j2dErDE6ZiVXpG0H35z1t62BV01VQArWUkt79wNjcdlonFlnOfrb9cfyjYVZ66tFhq9WjE4/b9aJQkDduOerPoQ8tbj04PvEcNjXmfSjmKMMF4ZGh3A+XwgCF/W/HzQtDtSbMRSUweqCyLK+azptGTbVqWV5G1nrBEb/V6yItGMNs1a0/Y4ffCckUuOTGp+71+VO0iZQ4PX7D7oulaf1nuYQKsKE99DIz46N/SuJvWzgM3R4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOJaRehvRCpXnGNDTUmPveOqkdP5xtX2eFEUmFZuE1A=;
 b=lIo8BTZorLT2qXh8Ej7NWZJLuhTJw1rVojXBoKsGMGgTz+AXxHM/+L4t3Q+eRaqzhelILDuwve4ITisOuK0tUaFsS8L53zwkv+2hczbDdhPKahvV2xZzymYGD8WCa26RgixV04vmjHyAmDa8WOPXsgGTeaPwxGPSH7HpETy81UA=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN6PR11MB3937.namprd11.prod.outlook.com (2603:10b6:405:77::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 09:00:57 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 09:00:57 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/9] drm/i915/gvt: Constify static structs
Thread-Topic: [PATCH 0/9] drm/i915/gvt: Constify static structs
Thread-Index: AQHX6P177WLLAi2p2UGSSEW6IGD+p6wrducA
Date: Fri, 10 Dec 2021 09:00:56 +0000
Message-ID: <d612055c-e433-4bd0-b819-82e866619b23@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b074c6b-6bcf-419f-03d4-08d9bbbb944f
x-ms-traffictypediagnostic: BN6PR11MB3937:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB39370AF43B48942B4CD884BBCA719@BN6PR11MB3937.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvVcQFbEtmiw4nyMSMuPFwMItqPJXBgrfgB9x9BYpBj08FVwXjjqGV6Acewl5mmD2klz2qc2fUyyTXkYDH9j+cCKi9m5CYFCPMi2tod3IK1GsY6v9Mnz1b23xzqHIL9XQOCfFXlT843oYvrBXfha8T2qZHdwMH8Vmo37RssJ3ZszVIRmzycgJuciWjxZGlhkUI4x0MSoRkzDttOFpQTkvxgFfap9PzLKwSuPvtQIyHSrd97sSbD7Ci/I/TvHcS4QCNcDOPbG1anop6zLDuEoKusC6gnVSq/gD2SkfIumvN077tszPFYYuoZ0u9qsLW165HOcqEDHiZPmSD9En7Bd5if3YC5m34AKjleeDSC/lguULbanmEcEkYzU4UwvaNynPx7CmP/+TCxc3YLx+lOy/JSvX2fIXo9q1FSAQD+a/YXd9p5Z4ImIbkDXoA4oGOvnZuEOeVa2ZaQ5Sb8QWg8Ty6hS89T/sJFeWVeLY4iALL7GwQMtqIGI7dTvJ07b6v6ItDu4RuaZxPDdpuQW0tbhfS69pIY3M5oIjFYVxyBhgEg7TockMy0lJ9VCKCW6V5i8lLyHrnCT3xjXAFtxxowCwvoRHAH8WXtIw6J/vBjftvpjJ0dSU1d6+mljO5TMxZCS6Lm5E813ev2RJ12VmhhKQMrBt4u3E4ACZf91eesD46HOpTr3viF6DllwmxRD66FJGo2s2LdYjHKv6bNj5Oo2DpiZdVFZhzLAr8LvEAsjfSBFh9SYwBNhsOyZkt+Ue8y5bXv1YXx/bhF49PAIehvttA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(31686004)(6506007)(38100700002)(8936002)(53546011)(36756003)(91956017)(5660300002)(76116006)(66476007)(66556008)(31696002)(64756008)(66946007)(66446008)(83380400001)(82960400001)(86362001)(2616005)(6486002)(38070700005)(8676002)(186003)(2906002)(54906003)(110136005)(316002)(26005)(122000001)(7416002)(4326008)(508600001)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGNNRUdUVm1FNkVWZ2ZOdVhQY2RzL2pJbm9xRjAzOXZUZ0RCenNyWklFakwv?=
 =?utf-8?B?SVQ4N2lZR3Z5ZFFxWUczM3lESkluZE1VNzRFNytRZVE3MHc5WHRaZ2wxOVdZ?=
 =?utf-8?B?QjJJSnFpVmhmWlo5b2VPSVl3dE5ta0Y1aWR3azdjSnBwRU9Db29zVG83Tm1w?=
 =?utf-8?B?emVuOGFBV3Q1T1Q1a3ZpTzdzbzA4RDNvK1JEMEptRDhpV21hVDc3WTAySnRO?=
 =?utf-8?B?ZFhjdEZRbTJTWEZITkhnaHp0c3M3WHRLMXJ4L0VtR3dlaVh4UWptY1crNDE0?=
 =?utf-8?B?VzUvTWVGMGlTTnVwbkhhckMvUjRQK2JTQ0xyb0QrT0xIM29LdVpiUnc0Mnhp?=
 =?utf-8?B?RlN5OUFWQ21jNHAxZy9Wc0szMFJ2R2gzMU1XYXRIOW1MdjJ3QjdaRnJxS0R1?=
 =?utf-8?B?QTlncmkzczBQYVFQQ1dnanlpc0ErcWQxMmlIYWJ3THNVTWpqaDlRUXJJd0Qr?=
 =?utf-8?B?dkNNeVZ3ZHBqY1FWZVQwQjA4bUVIUXJsMVU1eSt5Rmlhcm13a3haWkhJbFJ1?=
 =?utf-8?B?RjZuTTN5QkZlejQzRjd4ODBFL3oxMnJwYjlJdER5aTNQNWdhaHJ0dTdZaFUz?=
 =?utf-8?B?VDAzNHhJTHptNmlsL2NSdzlsUWc3eUdBejNiSTRxdkxHSXFFM0VYcUpuTURm?=
 =?utf-8?B?YkhnUUM0eEpEWi9UZmRoVDZFKzlHdys3bWJKVU9PVGFpSkk2b1JGOVd3VFNw?=
 =?utf-8?B?WlQ3MDNQdE0zU3NhUUpYVmg2VE93Q3NaK1MrS0Z2RE1YTUFnc0hrczYzTTZT?=
 =?utf-8?B?MHdBdXRRQmdJRHM4bDVkMkk4dmdNc25Zcjd5VjEydzExU3FVbFI4a3cxeVJ3?=
 =?utf-8?B?LzluQ1RkRmplbWhDdksybkRsTzkxTndOR0sxTDhVdllkSmd3ZkdFS3B3WEVz?=
 =?utf-8?B?V2hUQmV6ZWRWQlZsbFZZNXB1azZBZG1BSVFPQWw1bWxSUGcvN0dwbkxOcXFF?=
 =?utf-8?B?MUFVRkp1ckR0TnM3cVBTdnoxcXRyem5LOU5WN0hPZ0MwYWlsRHlNSDBwdjJD?=
 =?utf-8?B?YkJudVF0WHVuRS80RC9Rci9ydzk1Z05WYVEvZllMN2p5SFdTdC9DQWtZRERZ?=
 =?utf-8?B?a2gzTmdwbEVlcEZxQ2QwaUZLc0t3ZDlFQWFGRld1RnkwOXFNMnF2c05IcVN0?=
 =?utf-8?B?c3lsRG5kS2wwNERIdi9zRW1wWnZMcnl3T2w0Ty8rdVNwNHljSENNbEJ2OVFQ?=
 =?utf-8?B?UjJYcUt5bXRRR1VyR3Q3c1Y0UDRQQ0pGaEZSS2RBNUN0Y1ZDOHQ5Y3IwVnpq?=
 =?utf-8?B?QnFSdzlEaTB0WnFMdkY3UFhhVm1kcHYxelVJbDVEVHZCVFNycVhkZ2dualVB?=
 =?utf-8?B?TVJsN3BBZHFoR0RjOVZRUklmb0Y0aWNYV1BBZEQ1aVdrL09DMVdvbjJQUFFp?=
 =?utf-8?B?ZktmcTAxZFQ0UzRLbXVtRGQ3UmEwMUVCU0NnNVJLUkcxYStuUUliRklDNmcv?=
 =?utf-8?B?b2o4MlpDT2xhZ0NKQUVWZDZWRE5nYldESUhCbHZUcVFBYStrNVVaaDEySWV3?=
 =?utf-8?B?QjJuS2o5Wm02N3dmYVZENHBRZWNDZ0dsdk1LSFZUSllhUWF0a1Z4REZUQTZT?=
 =?utf-8?B?bTZpUE1YMFM4aDhmS0RxVFJDRHBKeVNMeUNjL3VVbjgrUFhiYVdLVnRMSE9s?=
 =?utf-8?B?Y1phMjA1bEVsWWxmRUxWRnRWOUtBdjB1MVZLcEl3VnY3bHkvU3dEbTNITjVC?=
 =?utf-8?B?RU1IV0pzRHV0UDZtWVI4WVMwV3hKNitvWXhqU3JKSGtPL04ydGlxMzBIZ0pw?=
 =?utf-8?B?aWJVRW1BYnVXanp5anI0ZUJiOWpUWFR4M2xYUm9pbis2Wm5nVmpMbkNxVzN4?=
 =?utf-8?B?ekF1bWZjaXgrTlBrc0U0MC9ZVUZQZEc1Ni9zVTlkaVZuTUNNYTc1VlhWSlVL?=
 =?utf-8?B?OURWSVgrWXpGTjM2YUtzU2Q2QjJHUWt2eHB2ZXduaGFEVUoveTViaVE4ZlNU?=
 =?utf-8?B?SE9jakdZVnZaNHpvRXdpRGRoeFZXMjdRaE5jZ0Y5YWlCcTJXWlpPY2RLWXIr?=
 =?utf-8?B?elJueThHbDVLVS9CYldvU1ZDbFA5dDJhU09VRGNDWmtMRnhKeUErM3hsM3JO?=
 =?utf-8?B?blJEK3ZDK1BiaGhOdHBkMjd3ZVFXY3BBQ0Q4U2VSbFAxSE5iSEJXRmU0bm1H?=
 =?utf-8?B?Y0lYcFBIdGUxQStpVllnRzF6QUtkdzVUbUo3Z0tuNVNlWVRqaGIxRWhEWXRa?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7651C2803489DF49A855C28618753311@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b074c6b-6bcf-419f-03d4-08d9bbbb944f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 09:00:56.9975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5b3mq4DiHmyFE/aogxgGPtlSxVgPoBYHmwwPmrrLKtHbNPDeD8SDq1F/Fe8U0uca5KhFpQZsgZHxqaeW5UF7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3937
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBDb25zdGlm
eSBhIG51bWJlciBvZiBzdGF0aWMgc3RydWN0cyB0aGF0IGFyZSBuZXZlciBtb2RpZmllZCB0byBh
bGxvdyB0aGUNCj4gY29tcGlsZXIgdG8gcHV0IHRoZW0gaW4gcmVhZC1vbmx5IG1lbW9yeS4gSW4g
b3JkZXIgdG8gZG8gdGhpcywgY29uc3RpZnkgYQ0KPiBudW1iZXIgb2YgbG9jYWwgdmFyaWFibGVz
IGFuZCBwb2ludGVycyBpbiBzdHJ1Y3RzLg0KPg0KPiBUaGlzIGlzIG1vc3QgaW1wb3J0YW50IGZv
ciBzdHJ1Y3RzIHRoYXQgY29udGFpbiBmdW5jdGlvbiBwb2ludGVycywgYW5kDQo+IHRoZSBwYXRj
aGVzIGZvciB0aG9zZSBzdHJ1Y3RzIGFyZSBwbGFjZWQgZmlyc3QgaW4gdGhlIHNlcmllcy4NCj4N
Cj4gUmlrYXJkIEZhbGtlYm9ybiAoOSk6DQo+ICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgaW50
ZWxfZ3Z0X2d0dF9wdGVfb3BzDQo+ICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgaW50ZWxfZ3Z0
X2d0dF9wdGVfb3BzDQo+ICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgaW50ZWxfZ3Z0X2lycV9v
cHMNCj4gICAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBpbnRlbF9ndnRfc2NoZWRfcG9saWN5X29w
cw0KPiAgICBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGd2dF9tbWlvX2Jsb2NrDQo+ICAgIGRybS9p
OTE1L2d2dDogQ29uc3RpZnkgY21kX2ludGVycnVwdF9ldmVudHMNCj4gICAgZHJtL2k5MTUvZ3Z0
OiBDb25zdGlmeSBmb3JtYXRzDQo+ICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgZ3R0X3R5cGVf
dGFibGVfZW50cnkNCj4gICAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSB2Z3B1X3R5cGVzDQo+DQo+
ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyAgIHwgIDIgKy0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jICAgfCAyNCArKysrLS0tLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgICAgICAgfCA2OCArKysrKysrKysr
KystLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oICAgICAg
ICAgIHwgIDQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgICAg
fCAgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgICB8IDEy
ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jICAgIHwgMTAg
KystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQuaCAgICB8ICAyICst
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkX3BvbGljeS5jIHwgIDIgKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmggICAgfCAgMiArLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgICAgICAgICB8ICA0ICstDQo+ICAgMTEgZmls
ZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pDQo+DQpUaGFua3Mg
c28gbXVjaCBmb3IgdGhlIGNvbnRyaWJ1aXRpb24uIFlvdSBvbmx5IG5lZWQgdG8gcmVmaW5lIHRo
ZSBQQVRDSCANCjIgYSBsaXR0bGUgYml0IGFuZCByZS1zZW5kIGl0Lg0KDQo=
