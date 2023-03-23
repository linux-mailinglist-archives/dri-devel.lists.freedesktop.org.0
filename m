Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423D6C7047
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 19:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1FD10E10A;
	Thu, 23 Mar 2023 18:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5996910E10A;
 Thu, 23 Mar 2023 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679596419; x=1711132419;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=ZKljJUAfcQSGjqFZCN9SS7Y+ZCP640aKjSm+DKdSZtA=;
 b=nh6s+/XYZ5x0fcTbUwU42XqjsSskTjXqweqkzb5gyZ850TAHpPI55RdU
 bwkc5HqgxAEtcCjJC7QqTQkZp9piUXCES/KjXJOfKHUkFwBGFnVGboPIi
 ord3NFcHymMhfy+U93LlWCElxwHO2BWoiI6yZCyqVoK7kCLoQaRVGrXUd
 w8W8VSiWwPeJSKGVgbjKpLok2Y4K+b8GH8pxsyuM6c3m9DPHDKK6xFUC/
 FDSwmIHIvTBhnfejUpwHGq9jdKN5lroNzfl4vcHQKfzLVkjWKIzNwxS8i
 fRTXCmE11Fplr3lAlk7da0b9FKA5qaL9m9u5p2sEoV/DFb3/RvP2aOpl2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367325217"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
 d="scan'208,217";a="367325217"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 11:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="751598679"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
 d="scan'208,217";a="751598679"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2023 11:33:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 11:33:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 11:33:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 11:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h51ZgsfUV57zHhuXtEPoQPtLaNX+OhkGwthEsUQ25N9uAGyl4bw4wR57/nDu7X1xr8L5UCMfoJPrjSVig75KkYQCKcVHHNjaHPO2Mo/QZWbPfy3wtCbLCCCQ5CYnFIFr2VeA3zSSQ4/1mBGeO+2gfjJlsl70L6HOdJgJetdSJaJ9w3T7Zbf8BirL1KLDls/tsc6T7EarykFQVB8QZkE0vv2euLV/YzooPuTNnz+7bUUoXDh/w1gy5zM3LfohdhrrVLS7uF+/OpqAbm+NddOREWhJVFpCjR9StDHVfiOV7Izt9IBf6ea1+QWfB3x74Exg4W/I5QbEI61BrOtyoxmIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKljJUAfcQSGjqFZCN9SS7Y+ZCP640aKjSm+DKdSZtA=;
 b=UJGOPE2jn/WaB/zCKuLstndJSdk50Ygfa4xwgHs6z6XfvoFKC6XHuep7iEPqjB+h0tImWdoSk5eYFm/BStCDBmJlB4mE/Jy9YweJoTD7xxNdJbbBg08XNZA/DKSXJPmDzrprKZ7de/TIIzmE3WM9YbElg3U+ZU3HKAcmITSO9Y6vSTLQwj4QS9dhj4J0erDPG4+5T/P55lvi3LRMH7BB/wcKGXCHwnLx8G7/nJn3sxH/gnojmxwaghgWh80LVUQJ/jr47gr0pEe+q9uKPOrxHuh7qxI+5MRzjjzS57jrEhPJK6quzB6oIyYXVRRjcLq/dFMBQzcAX9tMi/kMN3Jx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Thu, 23 Mar 2023 18:33:24 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 18:33:24 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Tamminen, Eero T" <eero.t.tamminen@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Thread-Topic: [Intel-gfx] [PATCH v3] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Thread-Index: AQHZVp6bZUKYMA457Uqqs0Zo8fgKSa77kFkAgAGLLACAAcEGgIAIspSAgACIlQCAAKbzAA==
Date: Thu, 23 Mar 2023 18:33:23 +0000
Message-ID: <ed774e36f7130f6801d10325c65b40a5f443f48f.camel@intel.com>
References: <20230314175832.1506427-1-alan.previn.teres.alexis@intel.com>
 <6cff8c19-0ab6-4b03-d778-ad57aa207b98@intel.com>
 <cc56d923-4021-3423-bfdf-986e7b73283f@linux.intel.com>
 <3841da5b-06df-eacf-ebd1-0e7885e6c9cb@intel.com>
 <38deebc090105826da9c85172392b10b93e99801.camel@intel.com>
 <416a0d13-0013-ecbe-716e-f3bda59c9d30@linux.intel.com>
In-Reply-To: <416a0d13-0013-ecbe-716e-f3bda59c9d30@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY5PR11MB6510:EE_
x-ms-office365-filtering-correlation-id: c80747e8-1b9f-419f-f4c9-08db2bcd1600
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oyg9yOQSMhPARM8rH7ap3I8QFrWcfCCBHMkQ2CQfs3nJikb1iFL2NPg1i1zK4UOkUhgVg0vQEOs8S9H9v2z/70DpR6s4sZaJVFenk6NhyH0NlrhCzK5MVe4KAW86jnFzzntjlR3V55ZEAdHx9hR0RsGpkZLOTKFTRmjrjIoArY39wYwwsJznq4JaWyg/Env7XQNRLi1KcawYtAVwYNr0WBC6GOt4P6qlC98vCaPodOP7XKKIRAdk0GZ6u6pXj4rekQ4hqOIBRpyk4xM2KMWWCvpYOZKhTlRSsqmq71HHZGGAYpNiHxOuV0BeXbzbUtdmin0fMfKjxVLZq8kqgM7DYqm9KY6twK+Nb23rb2o7kYLvwY9Kk/m0WuBe1nuFjf6LMPEd96Uozmts2Tv7dOD19P2kmw3J/1/2Ex7hYhICMBMvD4ZO8LuNNXVU0fuhTHkn8gr5gVPq6uiEgrw/esY2/D/hyjIG2TJJYfgF/m/HZqd/QqN2xcIfP6NxAIFC5R8VUPdWCEbO3M0CfQzSmUAyeoWNSR9mnDHbiJrXeJfpYNlU3PQTiMCS3Fmh3tvMYCyM/ljJH0dIQ0uJ1zxibb6yNo3/lQq/h3jNnxljvHk5CAbFWyPqNj0hotQvWnjvSN7YTJuVLWe3ArJiaKj4tcWECaz0doquc/rlzzEAi+cbF/e1RaVJytJZbmIjXhmYMDvxvNXorZm0IjbrC8H2qGICVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199018)(38100700002)(38070700005)(2906002)(83380400001)(478600001)(71200400001)(2616005)(6486002)(316002)(186003)(36756003)(86362001)(110136005)(91956017)(8676002)(66446008)(66556008)(66476007)(64756008)(76116006)(66946007)(4326008)(53546011)(26005)(6512007)(6506007)(8936002)(41300700001)(5660300002)(122000001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzZkOW8wMlNVNEdzd09NbjU0bVY3UElVVWpvZk9JVVBpRHowZ0F4TEM5OGZS?=
 =?utf-8?B?bEw0MkZ0TUJRbFp3UHpRY2Npa1VGQlR4d1d5M2JEdWRxbytEZ2ZCUU04cmlC?=
 =?utf-8?B?LzBwVG9FUTlNRTdqYWtsUkJJWDlhTUNrTGNpOGxmTmIwZUhHdkZVNStneE1v?=
 =?utf-8?B?SDNPQ2EzV2s2SGdaZWltMUhzeW1ObjFtNmNLTWdDTmlzbUFZRGlDdEVNVTEy?=
 =?utf-8?B?UWlFMk55QUZudE91K2RDK21QYzF1OEdMczFKMittb3FOM3RlVW5nVDk4WUdJ?=
 =?utf-8?B?UkgvVWx1REFMMmVlSy9kUXdIZ2EzSjVzYjN2Rk5MRmxla010QjVKYkNoejVL?=
 =?utf-8?B?OUk4cGZNK296Z0dMYlZZQlhpVFIybWhkd0V4OEtXRk94bXVoTHIvN0pORVN1?=
 =?utf-8?B?WTdwMTB4SzdhVEd1WC9PaDJWRkgwN25tN3VnWVdXZnQ3V3JxN3Y0WjBKRDAz?=
 =?utf-8?B?MlBQNEx5LzNUcGcxRGtCcHAvNWhFdUFLcThXQk1WbXVDR3Bqc3lrN1pRbjRS?=
 =?utf-8?B?OElwYnFDMmNUblg1djU3Z2FNdlRseFc2cCtWWjRwdlptaThtZTdOQWtVMGZF?=
 =?utf-8?B?UnhraEF4TmtzOWRtYjgyNk9iN0xLQ0dZTUJNdTFUeTBpMm0vRHZYZEhPS3Nt?=
 =?utf-8?B?N1k5N1JqZWduZUxkNUJiRzRnYzBoS3krQXpvYnh0SmY0QlZQaStUZjA0WUty?=
 =?utf-8?B?amYydWsrVVl1SkJzL1B6M21sUkUwbnFQeXlYV2czRWxGYXZ3elBCbDd1bldJ?=
 =?utf-8?B?ejU5L1o4QjFvZTNMKzVLSXF5OThUcGFqU1BKOHRhUWFFUGYxcmFOWnlJOGdl?=
 =?utf-8?B?UDkvZUtCQUFpUEJxNG1XcnV3eG14Z244SkJXZlYrVUN0MFZCUzhVYm5tNEwr?=
 =?utf-8?B?U2hHOXN6UVRXb05SSUNxNEE5S3ZiZkpjazlmaDZCUVlpSmRnNDJobUwrR3ZT?=
 =?utf-8?B?dmpCSUtpcW83ZmFjSFNmTkFIRS90cEhlcU92d3AvOEcrcm9SemF6VnJjTW9a?=
 =?utf-8?B?cC9nNXcwc1d4NXJsT05NdmlsdW85VUgxOWpNdncyblJpcjl5VitOdDFJUXY3?=
 =?utf-8?B?emVuZ094b1BMa3ZaMFlYT09mNXBmWmZxalRxeVRZaGhoUHNQNFF5My9QbDNT?=
 =?utf-8?B?N0tnMzl3QmpkT242K3FIbWlyYlVUQ3YrOHorOWw3MUQwQThCUGRLZ2JYN0lo?=
 =?utf-8?B?QkJKNzFVVDZRK0dkUlNZcmdLa0FvdmNxRTlVR2s4QWlOQlNwOU5uTUtEbGda?=
 =?utf-8?B?Y1dJRFBrd1FpeGhDWG0rWlNVaVhiNWkxWUliZEpwcHdvcjBQYWZpbU1UeEs5?=
 =?utf-8?B?WlhGRWptZGdMa0hzN3hpdm9xekRpeFg5OERjMUFwR1orS2MrYmRyY29kS21O?=
 =?utf-8?B?d3A5c3JmVmo5bHBwdC9udi9NTU9lbVpoaTNTTkxsSlFJZDQ1N1M3QmZEa0lT?=
 =?utf-8?B?N2xwMUdxaVc4S09iN1c1bUhvNDM2L1hVS25EOXJJSjJFNWhkcFBjMm5TK1hL?=
 =?utf-8?B?NXRPNDRlR0E5ZnRncUxMZUNmNkFyaDFjU05yRVI3U0YvRkkxcVAxbzFjczZK?=
 =?utf-8?B?UDZOMkp2OUZkZnJnUDlncmJYd1EyUzVIbFlBTTJqOFpHMDJKaXlRL0Z1bzRB?=
 =?utf-8?B?dnhxQmU4UWRSODlGbHhwL2RJaWpaRTZIOVNYTkxLRUNaWU0xVUlSQ2V5WS9Z?=
 =?utf-8?B?Wng0YkdDZE9ZNFlQQlQrTjZuMkNKeXlrSnd6b20vMEMvZXhpTGVjSytuRkxs?=
 =?utf-8?B?Sk0yV0tibDMyZHp1QWJ2WXN5UHB1VDVLNTBCRWM0MUgveGtuSHNOc0luZjFM?=
 =?utf-8?B?d0d3dFV5ZG9NbDZkaHRUbEdWK0JOL0w1d3JaR3dGdHk3RDJndnBUbVNyQVRH?=
 =?utf-8?B?SC9BbW1rdjdCQ2lsb3hkcmk1T1VmL2E5NkU1dlJJWXY4RE55aDM0RVhJNFdz?=
 =?utf-8?B?T1prWU5ycFNMQ3E3cFlZYjhrM21OWks5eXVQUnNNN1NPalJ1S29uVTdOUUNF?=
 =?utf-8?B?NjNneFhPMGcxSWtNaTA5L2NUcm55QjBLNDJvQnpRaVI5YmVGTnZGb1pLTjBD?=
 =?utf-8?B?NTZMS2xFWXBDL1htM3JXOXFmU09Ib0ZnRlNpZERIY1F2NWs3TC9XaysvczE5?=
 =?utf-8?B?NmdvMEZ6WlVNckhVNEZVL1M5SUhQYUNxVjBmTjNHczhEZWEycmtocTkrY0g1?=
 =?utf-8?Q?xsgAEBzGK0cfMvYua3jDWf8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_ed774e36f7130f6801d10325c65b40a5f443f48fcamelintelcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80747e8-1b9f-419f-f4c9-08db2bcd1600
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 18:33:23.9883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ey3P1+cC6uu6jHDqImhJA6DOb68XmMs09BNwwkMqZNzKcv+o73qv6jxnloRDMA1K7sSJzr6PJ/5f0ttF1MmRZy4W5dx2ZwUIbdk9CgnCyRJnQh+WypTDXX1iQwcFWjM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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

--_000_ed774e36f7130f6801d10325c65b40a5f443f48fcamelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiBUaHUsIDIwMjMtMDMtMjMgYXQgMDg6MzUgKzAwMDAsIFR2cnRrbyBVcnN1bGluIHdyb3Rl
Og0KDQpPbiAyMy8wMy8yMDIzIDAwOjI3LCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJldmluIHdyb3Rl
Og0KDQpPbiBGcmksIDIwMjMtMDMtMTcgYXQgMTM6MzcgKzAyMDAsIFRhbW1pbmVuLCBFZXJvIFQg
d3JvdGU6DQoNCkhpLA0KDQoNCk9uIDE2LjMuMjAyMyAxMC41MCwgVHZydGtvIFVyc3VsaW4gd3Jv
dGU6DQoNClsgICAxMS42NzQxODNdIGk5MTUgMDAwMDowMDowMi4wOiBQWFAgaW5pdC1hcmItc2Vz
c2lvbi0xNSBmYWlsZWQgZHVlDQoNCnRvIEJJT1MvU09DOjB4MDAwMDEwMWE6RVJSX1BMQVRGT1JN
X0NPTkZJRw0KDQouLi4NCg0KQWxhbiAtIGlzIHRoaXMgZXhwZWN0ZWQgZHVyaW5nIG5vcm1hbCBv
cGVyYXRpb24gb24gc29tZSBwYXJ0cywgb3IgaXQncw0KDQpzb21ldGhpbmcgdHJ1bHkgdW5leHBl
Y3RlZC91bmV4cGxhaW5lZD8gSWYgdGhlIGZvcm1lciB0aGVuIEkgdGhpbmsgaXQNCg0Kd291bGQg
YmUgZ29vZCB0byBkb3duZ3JhZGUgYXdheSBmcm9tIGRybV9XQVJOIHNvIGl0IGlzIGxlc3Mgc2Nh
cnkuDQoNCg0KQ29tbWl0IG1lc3NhZ2UgdGFsa3MgYWJvdXQgIkhXL3BsYXRmb3JtIGdhcHMiIC0g
aWYgaXQgaXMgbGlrZSBhIG1pc3NpbmcNCg0KQklPUyBzdXBwb3J0IG9yIHNvIHRoZW4gSSB0aGlu
ayBXQVJOX09OIGlzIHRvbyBtdWNoLg0KDQoNCk5vdGUgdGhhdCB0aGlzIHdhcyBvbiBwcmUtcHJv
ZHVjdGlvbiBUR0wtSCBIVyB3aXRoIEJJT1MgZnJvbSBBcHJpbCAyMDIxLg0KDQoNCihJIGRvbid0
IGtub3cgd2hlcmUgdG8gZ2V0IHVwZGF0ZSwgbm9yIGludGVyZXN0ZWQgdG8gdXBkYXRlIGl0LikN
Cg0KDQoNCiAgICAgICAgLSBFZXJvDQoNCg0KQWxhbjogSGkgVHZydGtvLCB0aGFua3MgZm9yIHRo
ZSBmZWVkYmFjayAtaSBzaGFsbCBjaGFuZ2UgZnJvbSBXQVJOX09OQ0UgdG8gZHJtX2luZm9fb25j
ZS4NCg0KDQpNYXliZSBpdCBkZXNlcnZlcyB0byBiZSBhIHdhcm5pbmc/IE9yIGEgbm90aWNlPyBJ
IHdhcyBqdXN0IHRoaW5raW5nIGl0DQoNCmRvZXMgbm90IG5lZWQgYSBjYWxsIHRyYWNlIGFuZCBh
bGwgc2luY2UgaXQgaXMgbm90IGEgZHJpdmVyIGlzc3VlLiBZb3VyDQoNCmNhbGwgb24gdGhlIGxl
dmVsIGFuZCB3aGV0aGVyIG9yIG5vdCB0aGVyZSBpcyBhbnkgY2hhbmNlIGZvciBpdCB0bw0KDQpo
YXBwZW4gaW4gdGhlIGZpZWxkIHRvIG1ha2UgdGhlIGRpc2N1c3Npb24gcmVsZXZhbnQgb3Igbm90
Lg0KDQpJIGFncmVlIHdlIGRvbid0IG5lZWQgYSBjYWxsIHRyYWNlLiBJIGNhbid0IHNheSBob3cg
b2Z0ZW4gdGhpcyBjYW4gaGFwcGVuIGluIHRoZSBmaWVsZCBhcyBpdCB3b3VsZCBkZXBlbmQgb24N
CndoZW4gdGhlIHBsYXRmb3JtIHdhcyBwdXJjaGFzZWQsIHdoZXRoZXIgdGhlIG93bmVyIGhhZCBi
ZWVuIHVwZGF0aW5nIHRoZSBmaXJ3bXdhcmUgcmVsZWFzZXMgYW5kIHdoZXRoZXINCnRoZSBiaW9z
IHNldHRpbmdzIHdlcmUgY29uZmlndXJlZCBjb3JyZWN0bHkuIEknbSBva2F5IHdpdGggdGhlIGRy
bV9pbmZvX29uY2UgLSBpdCBjb3VsZCBiZSBpZ25vcmVkIHdoaWNoIGlzIGZpbmUuDQoNCklmIGN1
c3RvbWVycyBzZWVpbmcgcHJvdGVjdGVkIHJlbmRlcmluZy9kZWNvZGluZyBmYWlsIHdoZW4gdGhl
eSBhY3R1YWxseSBETyBuZWVkIGl0LCBJIGFtIGV4cGVjdGluZyB0aGV5ICB3aWxsDQpwcm92aWRl
IHRoZSBkbWVzZyB0aGF0IHNob3dzIGFib3ZlIG5ldyBtZXNzYWdlIGF0IGNvbXBvc2l0b3Igc3Rh
cnR1cCAobWVzYSBhdHRlbXB0aW5nIHRvIGVzdGFibGlzaCBjYXBzKQ0KYWxvbmcgd2l0aCBtb3Jl
IHNlcmlvdXMgY29tcGxhaW50cyBzdWNoIGFzIHRoZWlyIGFwcGxpY2F0aW9uIGdldHRpbmcgYSBm
YWlsdXJlIHdoZW4gYXR0ZW1wdGluZyB0byBjcmVhdGUgYQ0KcHJvdGVjdGVkIGNvbnRleHQgdmlh
IEk5MTUgaW9jdGwgKHdoaWNoIGFsaWducyB3aXRoIGV4aXN0aW5nIFBYUCBVQVBJIGJlaGF2aW9y
KS4NCg0KQW55IGNoYW5jZSBmb3IgYW4gci1iPyA6KQ0K

--_000_ed774e36f7130f6801d10325c65b40a5f443f48fcamelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <73B71DCD7984F14E8F9B5F4C7AB3C01E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj48YnI+DQo8
L2Rpdj4NCjxkaXY+T24gVGh1LCAyMDIzLTAzLTIzIGF0IDA4OjM1ICswMDAwLCBUdnJ0a28gVXJz
dWxpbiB3cm90ZTo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46
MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFl
eCI+DQo8cHJlPk9uIDIzLzAzLzIwMjMgMDA6MjcsIFRlcmVzIEFsZXhpcywgQWxhbiBQcmV2aW4g
d3JvdGU6PC9wcmU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAw
IC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0K
PHByZT5PbiBGcmksIDIwMjMtMDMtMTcgYXQgMTM6MzcgKzAyMDAsIFRhbW1pbmVuLCBFZXJvIFQg
d3JvdGU6PC9wcmU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAw
IC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0K
PHByZT5IaSw8L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT5PbiAxNi4zLjIwMjMgMTAuNTAs
IFR2cnRrbyBVcnN1bGluIHdyb3RlOjwvcHJlPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5
bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAw
IDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+
DQo8cHJlPlsmbmJzcDsmbmJzcDsgMTEuNjc0MTgzXSBpOTE1IDAwMDA6MDA6MDIuMDogUFhQIGlu
aXQtYXJiLXNlc3Npb24tMTUgZmFpbGVkIGR1ZTwvcHJlPg0KPHByZT50byBCSU9TL1NPQzoweDAw
MDAxMDFhOkVSUl9QTEFURk9STV9DT05GSUc8L3ByZT4NCjwvYmxvY2txdW90ZT4NCjwvYmxvY2tx
dW90ZT4NCjxwcmU+Li4uPC9wcmU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFy
Z2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPg0KPHByZT5BbGFuIC0gaXMgdGhpcyBleHBlY3RlZCBkdXJpbmcgbm9ybWFsIG9wZXJh
dGlvbiBvbiBzb21lIHBhcnRzLCBvciBpdCdzPC9wcmU+DQo8cHJlPnNvbWV0aGluZyB0cnVseSB1
bmV4cGVjdGVkL3VuZXhwbGFpbmVkPyBJZiB0aGUgZm9ybWVyIHRoZW4gSSB0aGluayBpdDwvcHJl
Pg0KPHByZT53b3VsZCBiZSBnb29kIHRvIGRvd25ncmFkZSBhd2F5IGZyb20gZHJtX1dBUk4gc28g
aXQgaXMgbGVzcyBzY2FyeS48L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT5Db21taXQgbWVz
c2FnZSB0YWxrcyBhYm91dCAmcXVvdDtIVy9wbGF0Zm9ybSBnYXBzJnF1b3Q7IC0gaWYgaXQgaXMg
bGlrZSBhIG1pc3Npbmc8L3ByZT4NCjxwcmU+QklPUyBzdXBwb3J0IG9yIHNvIHRoZW4gSSB0aGlu
ayBXQVJOX09OIGlzIHRvbyBtdWNoLjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPHByZT48YnI+PC9w
cmU+DQo8cHJlPk5vdGUgdGhhdCB0aGlzIHdhcyBvbiBwcmUtcHJvZHVjdGlvbiBUR0wtSCBIVyB3
aXRoIEJJT1MgZnJvbSBBcHJpbCAyMDIxLjwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPihJ
IGRvbid0IGtub3cgd2hlcmUgdG8gZ2V0IHVwZGF0ZSwgbm9yIGludGVyZXN0ZWQgdG8gdXBkYXRl
IGl0Lik8L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPgktIEVl
cm88L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT5BbGFuOiZuYnNw
O0hpIFR2cnRrbywgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgLWkgc2hhbGwgY2hhbmdlIGZyb20g
V0FSTl9PTkNFIHRvIGRybV9pbmZvX29uY2UuPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPjxi
cj48L3ByZT4NCjxwcmU+TWF5YmUgaXQgZGVzZXJ2ZXMgdG8gYmUgYSB3YXJuaW5nPyBPciBhIG5v
dGljZT8gSSB3YXMganVzdCB0aGlua2luZyBpdCA8L3ByZT4NCjxwcmU+ZG9lcyBub3QgbmVlZCBh
IGNhbGwgdHJhY2UgYW5kIGFsbCBzaW5jZSBpdCBpcyBub3QgYSBkcml2ZXIgaXNzdWUuIFlvdXIg
PC9wcmU+DQo8cHJlPmNhbGwgb24gdGhlIGxldmVsIGFuZCB3aGV0aGVyIG9yIG5vdCB0aGVyZSBp
cyBhbnkgY2hhbmNlIGZvciBpdCB0byA8L3ByZT4NCjxwcmU+aGFwcGVuIGluIHRoZSBmaWVsZCB0
byBtYWtlIHRoZSBkaXNjdXNzaW9uIHJlbGV2YW50IG9yIG5vdC48L3ByZT4NCjwvYmxvY2txdW90
ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkkgYWdyZWUgd2UgZG9uJ3QgbmVlZCBhIGNhbGwg
dHJhY2UuIEkgY2FuJ3Qgc2F5IGhvdyBvZnRlbiB0aGlzIGNhbiBoYXBwZW4gaW4gdGhlIGZpZWxk
IGFzIGl0IHdvdWxkIGRlcGVuZCBvbjwvZGl2Pg0KPGRpdj53aGVuIHRoZSBwbGF0Zm9ybSB3YXMg
cHVyY2hhc2VkLCB3aGV0aGVyIHRoZSBvd25lciBoYWQgYmVlbiB1cGRhdGluZyB0aGUgZmlyd213
YXJlIHJlbGVhc2VzIGFuZCB3aGV0aGVyPC9kaXY+DQo8ZGl2PnRoZSBiaW9zIHNldHRpbmdzIHdl
cmUgY29uZmlndXJlZCBjb3JyZWN0bHkuIEknbSBva2F5IHdpdGggdGhlIGRybV9pbmZvX29uY2Ug
LSBpdCBjb3VsZCBiZSBpZ25vcmVkIHdoaWNoIGlzIGZpbmUuPC9kaXY+DQo8ZGl2Pjxicj4NCjwv
ZGl2Pg0KPGRpdj5JZiBjdXN0b21lcnMgc2VlaW5nIHByb3RlY3RlZCByZW5kZXJpbmcvZGVjb2Rp
bmcgZmFpbCB3aGVuIHRoZXkgYWN0dWFsbHkgRE8gbmVlZCBpdCwgSSBhbSBleHBlY3RpbmcgdGhl
eSAmbmJzcDt3aWxsPC9kaXY+DQo8ZGl2PnByb3ZpZGUgdGhlIGRtZXNnIHRoYXQgc2hvd3MgYWJv
dmUgbmV3IG1lc3NhZ2UgYXQgY29tcG9zaXRvciBzdGFydHVwIChtZXNhIGF0dGVtcHRpbmcgdG8g
ZXN0YWJsaXNoIGNhcHMpPC9kaXY+DQo8ZGl2PmFsb25nIHdpdGggbW9yZSBzZXJpb3VzIGNvbXBs
YWludHMgc3VjaCBhcyB0aGVpciBhcHBsaWNhdGlvbiBnZXR0aW5nIGEgZmFpbHVyZSB3aGVuIGF0
dGVtcHRpbmcgdG8gY3JlYXRlIGE8L2Rpdj4NCjxkaXY+cHJvdGVjdGVkIGNvbnRleHQgdmlhIEk5
MTUgaW9jdGwgKHdoaWNoIGFsaWducyB3aXRoIGV4aXN0aW5nIFBYUCBVQVBJIGJlaGF2aW9yKS48
L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkFueSBjaGFuY2UgZm9yIGFuIHItYj8gOik8
L2Rpdj4NCjxkaXY+PHNwYW4+PC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_ed774e36f7130f6801d10325c65b40a5f443f48fcamelintelcom_--
