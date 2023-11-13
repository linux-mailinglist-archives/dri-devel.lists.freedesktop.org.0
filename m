Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6235D7EA6F7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 00:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC6C10E22F;
	Mon, 13 Nov 2023 23:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36B610E06D;
 Mon, 13 Nov 2023 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699918343; x=1731454343;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=9QN+OEXnxMTPgWEwc1Sbbf96KfgsMU9PEW5Wp/Wa9jA=;
 b=lq9ZbKziyHQUzIshS4rHEUwQo8jKrA300Fu87t0P69dXo8saikXnG7qC
 wOB0jcdLkB2HjM/1BMLRJBI35OyaIVS9BDSZsAyzsDZiG9j5QS2Dhk1UR
 /5sD64m20UWJTXZEMvJz5I7aEkeAYBz72unpMTGh8iLImyaUwaxl2ml7h
 b5WUpPwWAb42ZnJkv98n6x3XLNJul5Kw7TVkwIjsFAa+QuO6Ia/R7znuN
 eLp4cgs/7LO8ABiVVKdzqCqYuf9j6RuGFlZaAaN23GJRy93Q5R3DuLtPt
 20FZ1zyZRI9TRhMvZPFy6T8BQAhVteZxRJAc8PwHZ2+IHp3LhEFzv6ffp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9171156"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="9171156"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 15:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937862040"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937862040"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 15:32:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 15:32:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 15:32:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 15:32:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 15:32:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3Fd8yk3cUG52TVoUnShZ4U5T5PQSx2Sxj4ujLYe1xHw+I1MvqKl+GcXcf2s6VfqfsXXD1cbPF4XAENvAqtwuSLRvZ/ajXRvwRbryxTf+ctD04pmpZlwF63ycYRST2qEQPthAt73+w2PH6PCHPYihOlv/G4oo2M6dZE2wRrrskNNFd7ql4ZzpJZswY8YUwTp7u6ZV721PaumtlKw0Ebyau4vmvu+/MwWWy6G/RURfUPTHJfbE7/OickCfG9eNxAQKZ1wmWZeSLxXQqvBX7s7T4Hc8IdN0BxjkqtPOzqjlIrZ2YP94akMGTrCXtc/J7A4rLXkueMy8/bXMQm1ryM7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QN+OEXnxMTPgWEwc1Sbbf96KfgsMU9PEW5Wp/Wa9jA=;
 b=GM7CX6w6wFcRg9myovychkRwpjoRzCnqCM0TS6V4yotvkWuyBt9WLtiGFulfjIXlBnBQxZhTuvTQen55crIaQIq6HVPNcJcZBuVFo+SYgiWWJyMx+QyvD80TJ1/xn47Q2X0a+Rwc4BK7iG1V+smxB39Q/DTWRUaAqEcRFb6uGOicY5hMawyxp718R1wDnZ71eK1HvhLxF+pothT2wlPBDePDDgqd5dcYy0exqG7no5Xr41+wnNY+H53dlzK5q4uCuHGXmUDRqt8kM1MduzM9IPFSKhkcovnos+mRNHXZLDklrzDnxoc2MPU24+sEeSVX1Hv4QSlrIH9XVCYcXB186Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Mon, 13 Nov 2023 23:32:19 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 23:32:19 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Skip pxp init if gt is wedged
Thread-Topic: [Intel-gfx] [PATCH v3] drm/i915: Skip pxp init if gt is wedged
Thread-Index: AQHaFoPYOs4fL4LVu0Sur7SJNmv2sLB45j+A
Date: Mon, 13 Nov 2023 23:32:19 +0000
Message-ID: <73afe0410ddf26b0eb74f873da9acaab251317ed.camel@intel.com>
References: <20231113224953.378534-1-zhanjun.dong@intel.com>
In-Reply-To: <20231113224953.378534-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: a84b5f22-b63f-4d91-a62f-08dbe4a0c74f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SHuiuqQdS5FfQpOo5S9/JKmsaaE/N1tKhidZG01lleQioEsiYdBqcGVr6DR+XWF87Znpq4o9XJxW3ka0YnoUzB7uppUBSw1u6YCty5iWJwySgkIhPshcw18nhCI/G4D3ZKfMUK3BOPi6dD0D46zUdlJOX3O5jRfBtb58MZLM/EmMa1kuLHhP/xYoT0Rq7id9TeaEt1ou+R3OA1zBRdvBshfwF/9ETa1WkZQlu3m3hpinTKd4pibzpIuuh3KMfVFd+dZV3L0Z2P9EWwvOA/DUoZc2ZCuj7NFCnCuBfmPvt+S5PFkKWq8ZMfMv27S8D72TeQHmgj0hC3rpYAEzOTpItvRF1OfKahkwoA5qC/SkExEdtammrIFF30x/MgUtZj8EMM5rf/YUqzqx0FPcbqkp8MAlEs7aqIzgQANtDnUIOub7almSiRVSj3ZfYBOBc8kLwz/oR2O7fTgqNVsrebnS6SDK5iovh7hlOk0RUNa6iYM4qGQMiNcUsQc5nv1W+dilszdk/EVFp0zGJeAPqczRSjzozpABhLFJcAJyAP6bmVCpnapmOiYDsUnQdlVBqSa11dr2eirWCA34YGL3nnzAMiyaLx234VKBTL6vdGdlwR1CKXHTATpMhJBerVtb9nzXdqk6+1f8hTXV1raIpBt6lMeX/lCizKttGAHBHu81Fng=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(1800799009)(451199024)(66446008)(66556008)(66476007)(76116006)(66946007)(91956017)(110136005)(64756008)(38100700002)(38070700009)(36756003)(82960400001)(86362001)(316002)(6512007)(450100002)(83380400001)(71200400001)(122000001)(26005)(2616005)(6506007)(4001150100001)(4744005)(2906002)(478600001)(6486002)(5660300002)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2EydjhsKzZvMy9YRGFJeEhRZlNQd2oyaEFZM3E1SnlReFcrZ0tYZXJGcnpv?=
 =?utf-8?B?YkJOOEUzM0tXY2Z1VHNqcldaS3ZxRzRVVlM0YnBodE93bUxUWTVWdmswTmVS?=
 =?utf-8?B?SkRJODZNYW54VWR0MDJLRlprUHQ1dE4xaEtySDUySTBaaE0zSTNWREFuUnR6?=
 =?utf-8?B?TTFMT1NJVWR0VkFEbkdieWc4T3dsZmwrWVN0dGZFREkvLzNicHoxSVFjc0RK?=
 =?utf-8?B?cVp5MzZHcllFamR5cS9GUS9lR045UTlHT1p0Z2hLaXVMVzROcnY5cTQ4OEtt?=
 =?utf-8?B?M2NKVkRqQitoZmJQbWxlMWo1ZWh1Z1J4dXVWZWpvekJzOVpvc1FXdEtEVHZ0?=
 =?utf-8?B?NDlUTjdzeW5CZDUvWnNsanBGekRIbU9USENTR1d2dXNIR0NMK0E2T1F5TEl3?=
 =?utf-8?B?WlFQbmQ2WTlwRm1URStET2xQajJMbVU4TFhFTlM1OUd4R0VNTm5WdVlsZ1lk?=
 =?utf-8?B?R1VmOHFxd25EbGxNMEl0dUxwYkVna1pmeUQxN1RFclRzc0tYZUF6ZStvTE8x?=
 =?utf-8?B?eXVILzhuazZoZUNJTDM2OEkrbVBwZVQzNDVyTmJlY29keFdUQzJuVkNBQ3Jn?=
 =?utf-8?B?TzhRdWxzSmU5d1RoVEJVMXlXcWtkbUxGS2RxQ1REV2RSSmppakVYZC9VOVds?=
 =?utf-8?B?NFYyZzNTS2VHeVRzV3g5Q1hTYU1JVk0vTFZNVW1rYThpdUpwbDJxaGI1Rnp6?=
 =?utf-8?B?dUMzVE53Y05oUFJxWWdueFNqaDQrSWxuMklYTkx3MzlCUmhsUXllQ3krUnFB?=
 =?utf-8?B?MDRhV1B0Um9jSG9tY0dqS1RtK3BnKzl2YU41bVhzNndRVVU1S2o3TTl0T21U?=
 =?utf-8?B?MDB1SGFUSTdvcnpZK0wvNnkvdzExcVJYaXdxMVBOdEs4OXRRd1ExeWpKall3?=
 =?utf-8?B?bVlmNlRZMEZmallpbTVCUEsrNjFMU3VVeXZDRUhsaU0zTlVIb3dDOHJqS0Vx?=
 =?utf-8?B?TURycUhIMG9Oc3NsVDE0b3RhQ0l0NGpCdC9EYjU1N3IwR2t0dGVtWlVOS2Rv?=
 =?utf-8?B?Q2NWT21rMVlJUjhnNEQzQVlTSUJZTWZ5UDdkZGlFMnErenlNMkRsczFrbWk1?=
 =?utf-8?B?NTd3aUhYUnZYZVFkODVoRXRrQ1VVRW9LUG1FcmNvWFRyL0toM2lINkg4Y21N?=
 =?utf-8?B?YjZBeWJsVWRzVlAwaDQwOUNyZDJmbzdoby93YjY0L0Y4NVJKY1N4ZzgrNTU3?=
 =?utf-8?B?OGdpODVWUjZHWkc1bjVkVzA2cGxxZTlLM05mNVB2OHdKbm9FNldQSTJsZkRJ?=
 =?utf-8?B?a3FySmZXbURYY1lyUzZXVWdlR0Q1QWgvZzl6KzBSMitXeS9zOTg2UEN5dFEx?=
 =?utf-8?B?YmpFZkRWTkRDUjRoNVFCR2pZVmJyQ1Fuc2pDNUtxQnhpL3oyTUU4anNsR3Js?=
 =?utf-8?B?d2hRQ2NSdFQxV2MyLzdNRFpDM0hWWnBodFJjQkhLSjczVktsWUFQOHVPeFNY?=
 =?utf-8?B?WEhMWTNKNnB3aFJ4L0FkbUc4cGc3MmRIenJhZHdnd3NZNnR4bkxNcWRmSFRj?=
 =?utf-8?B?Y0QyTTBoaHVWejJhNkxwQXhlbldld3NsRGFjT2t1Y25iTFh1UG8wK0JOSEkw?=
 =?utf-8?B?WFF2ZE1DeVFQMjVPZkVzWjBIbW12ZEZhZ290cmZXb3FSU05kdVRES0prL0RG?=
 =?utf-8?B?K2ZqaHUzUDhXd1UrbXIrY2h2OFJTVjhRL1dWMkZRR09sNGFkcGo4blJwYmhB?=
 =?utf-8?B?TG9sS21QRXkrSUkwenZ5bEx2Tk5Ib1puWmtvbXprcjdkTXg5T2lYQTZFdnNF?=
 =?utf-8?B?YlBZajZEbXZzWGRZMjQ4TWRaMHNPc3dMZkh3NVdrUE1PY09CMjlnV09YN3Ar?=
 =?utf-8?B?MXZBSHpNa2E2dEI0T3ZRcmcvWFZRUDJFR0F1a3FMOTdJbVZXRjZON05aN3lM?=
 =?utf-8?B?eDdzczZvM1ljVkh5RytBQkh3UHNvQzdvbUpDVjc2UnBScXVQMmVhWFpDZER6?=
 =?utf-8?B?WDNNL0ViNlo3azRmcDBwK0xNczVudUVQTldEck9sbnhva1kvdWUwMmxjMUlI?=
 =?utf-8?B?alhLSXY0ajc3NFJHYk45QU5ZZWdSaHpqYlFxcHFmV3d4MGxaS1JQaVRMa0dY?=
 =?utf-8?B?WE5OUVBGRnJDamtHd1MrenpCVFhCYjgrVk56S0dwMUFrYW9ReHQrVGZneGdh?=
 =?utf-8?B?YU9Nb09Dbi9kazlDeFVnVFo2RmlFb3RCc1hJQVVBd2lUWDRoQlgzWE94ekIz?=
 =?utf-8?Q?fwd3UKSEcDnzoge+pTEcwn0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BC3A1FEB17C0241BC2905B9CFF862E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84b5f22-b63f-4d91-a62f-08dbe4a0c74f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 23:32:19.2288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EhbgX+JBpAjC6HpBpwqcyuJuweFsfrj5WnuhNUynPHxwvBVGbzvBReZF78JHANlbq7GFjYAzpXsACuyhETwhWEqxtbQ6fi6NhduUa8Wuay33uYITUVF51JFgcDTgsalE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTExLTEzIGF0IDE0OjQ5IC0wODAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IFRoZSBndCB3ZWRnZWQgY291bGQgYmUgdHJpZ2dlcmVkIGJ5IG1pc3NpbmcgZ3VjIGZpcm13YXJl
IGZpbGUsIEhXIG5vdA0KPiB3b3JraW5nLCBldGMuIE9uY2UgdHJpZ2dlcmVkLCBpdCBtZWFucyBh
bGwgZ3QgdXNhZ2UgaXMgZGVhZCwgdGhlcmVmb3JlIHdlDQo+IGNhbid0IGVuYWJsZSBweHAgdW5k
ZXIgdGhpcyBmYXRhbCBlcnJvciBjb25kaXRpb24uDQo+IA0KPiANCmFsYW46c2tpcA0KYWxhbjog
dGhpcyBsb29rcyBnb29kIChhcyBwZXIgb3VyIG9mZmxpbmUgcmV2aWV3L2Rpc2N1c3Npb24pLA0K
d2UgZG9udCBtZXNzIHdpdGggdGhlIGN1cnJlbnQgZHJpdmVyIHN0YXJ0dXAgc2VxdWVuY2UgKGku
ZS4gcHhwDQpmYWlsdXJlcyBjYW4gbmV2ZXIgcHVsbCBkb3duIHRoZSBkcml2ZXIgcHJvYmluZyBh
bmQgd2lsbCBub3QNCmdlbmVyYXRlIHdhcm5pbmdzIG9yIGVycm9ycykuIEFsc28sIGlmIHNvbWV0
aGluZyBkb2VzIGJyZWFrIGZvciBQWFAsDQp3ZSBvbmx5IGRvIGEgZHJtX2RlYnVnIGlmIHRoZSBm
YWlsdXJlIHJldHVybmVkIGlzIG5vdCAtRU5PREVWDQooc2luY2UgLUVOT0RFViBjYW4gaGFwcGVu
IG9uIHRoZSBtYWpvcml0eSBvZiBjYXNlcyB3aXRoDQpsZWdhY3kgcHJvZHVjdHMgb3Igd2l0aCBu
b24tUFhQIGtlcm5lbCBjb25maWdzKToNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFu
LnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
