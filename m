Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4454FCCDB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2410FC54;
	Tue, 12 Apr 2022 03:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442A510FC54;
 Tue, 12 Apr 2022 03:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649732881; x=1681268881;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DdqiJS7CumlYMYZ7/eStM1rSBaPQ0Z4SiLCZEvuKyPM=;
 b=d9D//D7ojPLXv5qvUiVwVivP2g3ewP6/y+Tsid9pDsN8cpR/vKZ+dK2H
 x5nn/jEkmOx8Rc/BczaCtVESE5VijFNdd5QTxy7PT1cwBW3dfQHoDW+Eg
 rMPLtI7FOUW7F0mc3jLp3Qj0OlSfgATNIST/0AUYGjql8b6tskT1Vfa9Z
 iKDrYiJBGMMqUasnewCmm2JLTwABG1acEcnvG9d14YgqMoX53y3BjJ9ID
 7WMHe//ufbCkfvdrGVQNuj36TeDDbKjcAjUOmUeYQjnXfBEDFOWeL9V+I
 3ONnDyYChJyNpw5/HpVQqhNomXhCe7kt78669dNaY4G5jfUC4RdvHv2bW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261112292"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261112292"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 20:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="572528841"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 11 Apr 2022 20:08:00 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 20:07:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 20:07:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Apr 2022 20:07:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Apr 2022 20:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dASDt+HGM0q61gLJz/rzFrV84hhpRdbLNjsEq/WtbzzqFGynLKkqxTiExHIRAKNfz4JCAiivEvYWfFJFdEGYPlAyHN2fsdov0LVZb/rz6eRXyc8aQaXtB5i3MQlWQqOjXWWFD0s5pbYgeqVae7QTO6p4R/Ys3Jtyj0BzbHJsw6sWiYU7PSwYJw669Ceb+4v2r/iFBEDVUuq22dkkuafgNtO6HunYDdqkCRgXFRHVHviPAURhYlCHUKoqDgvaFwDrYMtM9hH5haN2XdUujnkZZAZv/JkdRlRUIpoapBVSNaA9shOfRPgfRRCeDeHIFHd9cTJGrOT8/JeSmr1X/v6mZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdqiJS7CumlYMYZ7/eStM1rSBaPQ0Z4SiLCZEvuKyPM=;
 b=N601XHIu/yzynRO3lylRbJ44JHWGMRxmGJ+mhHlMQ205lgrVvQDaZtzF75QRS2/idcQ7uNla9xILb8QR1NsgtUSG13Rzq7aTgRGZL1RHYD29m89AT1K+m7FGeSx2XwEaK9DmLNdCdVP4ZHBYjW/jLq3kDfQWmUt4XYr8325oh03EDk0BMFHPRXI9JBE8RydOJ+vLl0rUFeqHXbsiT/tASq04rtz9ZkZ5rEfWEMkunZWVGO1v15BETycDg9jf7ZJgnF/yAAvGIuIjafHkfC3LjrCgKgiINnkjtHA7vdoxqE8dlo1BrrXDV2Q0zAVkpfLDIqNtCBOuLd1qWCB1UeUpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Tue, 12 Apr 2022 03:07:57 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::b124:1092:57d7:516e]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::b124:1092:57d7:516e%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 03:07:57 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [Intel-gfx] [V2 1/3] drm/debug: Expose connector's max supported
 bpc via debugfs
Thread-Topic: [Intel-gfx] [V2 1/3] drm/debug: Expose connector's max supported
 bpc via debugfs
Thread-Index: AQHYTYoPTD0ImcdaekemoKoQ7l19razrmSYA
Date: Tue, 12 Apr 2022 03:07:57 +0000
Message-ID: <DM6PR11MB31775291823E7A58E16096D7BAED9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220411095129.1652096-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65ff1609-7419-427d-145f-08da1c31a527
x-ms-traffictypediagnostic: DM4PR11MB5328:EE_
x-microsoft-antispam-prvs: <DM4PR11MB532874EE7C96DB3FE244238BBAED9@DM4PR11MB5328.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UpbdP8eCQid3a5poIXuB+MwUu7LOtMSrmm7hKa+N1XgeJ4rtN91M/u+SLOSaScmUxT3nmcSOQ7Vb9pPJQCUL5fpiAC9Wo2QZElnl1is5vIiDkb3CwR7xcrIYd3H+t3Clt3mWQGnjaT8z6vqiaIWzAWAXImhzzpe2u/s2KvklEi7tK+SId4x8GmX/PfUtPYd+IK0SZWdJ8uZRlr4Y5aVGntJIbIAAFLAoSpMgvwOzbA0r/4SYsDcDLVuXwav0bf3atqguHhn1VpxvuTfOOOOen7m/W2cHYAfau7ShsNf+GYJN9DC+zPkLR1/0xx3RZrOY3n2CZukk2vga78RYDHtn/50g+DHw/TxbpKE/1yzOOWmlN1EHGdZglECrCrvbYkjPHzlc4SKy8rbCxygfgv/Ng3+WP8fxgIK1hFANgrgajFEhGZHBtA4FBJdgZLWsSUJOxbzWc/sx6ZRndPmUTkltNOnjozjyaf9rDX9ihp5PoUFnVCqNFrvRTLFwNKFTfnBV6l01k0ys1od7Pizrgm/AgRF4VWYmHZl67A5weB7nOF1wSjhc6O5vCBapIyR7Vhxpg5LxCcTnAwUgzp03TRFz4XdOPlsuhPBHVlfC2G/0B5FdGCRx8gzWgFgdfCDkF/uVeS4nB8zvD70Xnzr4Qf8m8oj8BSjCGF8oiC45TR7eHsMuZ55rg5ouM7GUn4sINKuMmkWY955AE4sOncjBBwUrpTQFXY70zYFwAqcGDP9kxQM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6506007)(316002)(55236004)(110136005)(71200400001)(26005)(186003)(6636002)(38100700002)(52536014)(38070700005)(7696005)(9686003)(64756008)(8676002)(55016003)(33656002)(66556008)(66446008)(66946007)(76116006)(66476007)(921005)(2906002)(122000001)(82960400001)(558084003)(508600001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2VJZWIvcU9uM2ltall5TXNveHlZcGttSWR6aVd0a3UyQ2dKSG51Y2NzcnEx?=
 =?utf-8?B?eDQxb2FtYlJWSkQzL0dHWGQ1OGcveU90ZEdySk1PZ2pDUTA3Ni9UaHFZSXNH?=
 =?utf-8?B?ek83U2hVTTJjK2xKUVcyY0hCN0VYby9JWElvUDhadjV3ckN2SlQ0aUI4cHBa?=
 =?utf-8?B?UFJoRExtUmV5d2tuQXRQYXZRUmhDV1JLVmhvV1k1czZaVTkyZk52eEdOTHpE?=
 =?utf-8?B?TFhIUmVSOGZrcWZucHNoZkIrSFBaNmpadW5OUTMyOWdlamZTL2xsWFRSZXI3?=
 =?utf-8?B?QTg0MG1xaTJUa1R2K0dLYVpvT28xaStJVFRuZjB1VjBVYlZxd3d5d0dkSFJI?=
 =?utf-8?B?RGJZSDJ3Q3dOUnpSMWEzZXAyMHBMQXowYkxMK0IzNUpCNDdCb0g5TFBjVStq?=
 =?utf-8?B?MDJJQkwwRUJSR2pCbnVGQi9RTEVDMCtlY04yL0xYUTZ2aFNuRXQzM0wwbFdC?=
 =?utf-8?B?dTF2UkdSZmgvR2pLUm1qakxWaXJvUGJGNWNnbFNMSk53YXBNdE1Ld3VMWjU4?=
 =?utf-8?B?a3JjQ1RleWFLamRmYkNUQnpJTlB0VFNwVzMyKzZ6M0Jab3NKdm9lbExVTzYy?=
 =?utf-8?B?cnBKN29LdXZCT3RHblQwS1ZiTml2NGZrWjFaaDFJZ2UvVkJIWGpqQ1o0c2tv?=
 =?utf-8?B?ZVpmK0NnQk4yYmRSb29uaWM4UE1EK2JpUEp0alk5ZzBwb1JiQmF3dlkyWUVF?=
 =?utf-8?B?MldURytRSy96NXBWYk9FK3VtNnNlMEtIWk9SVldzeHE2OHRuc1pwaXJvTGkz?=
 =?utf-8?B?TDhlV1g0Q1JibjlVSDEwdFBaT1Z6dUxSR0lvVEc1bnVmRGd4Nk44Z05LQVNi?=
 =?utf-8?B?OVFZczliNGtUWjRneDZHUDV6aGFLeXpwNHFQNnViZDBmQWdRNDFJaCtsUVcy?=
 =?utf-8?B?Yzl4bjlmaHhXSU1BSXNJU0NTV2FXejN5S1d3Lys0TG9IYWRJMTZGVHFwRFpL?=
 =?utf-8?B?a3lNaXhJOGxzdkV5dm9wY2xNNnRyMVlqbWdZUldxR3hTc2svNGFXSHNlOUpR?=
 =?utf-8?B?TEtnM3hjb3JtK3hYd0c4VGxIM2lRVWRJMDlxSTdtZHloODFxTW9IK0xyZGlG?=
 =?utf-8?B?cHR6bnBEcEVDemRPQXJNTTRVTXBkYk1yQ0xjaW5aKzdrQWJZbUoxN1JtaTBW?=
 =?utf-8?B?dFg4YmpJYUpWUFAxZUNsTm1NME9WWnRsKzk2NEZyV21MQnVESEJtOERucnVT?=
 =?utf-8?B?NitQeCtZdjJPMWc4M2lvcWlteitadGpGK0ZVc0hOb1BVZGgxUkVyeFFOTU4z?=
 =?utf-8?B?T1UraTFpZ3dieTJxL0kzaUk2azdZVWxnU1R1UDR2NkZnUUFhWnpBTWJ0Nng1?=
 =?utf-8?B?TWlvV3c0b0RVVnowSUNXTFNVMUxqS01BMzNxZWEwQVpWMEtaMDVUU0F0VW53?=
 =?utf-8?B?ZWVFeXIvczNFcWxuTUlYWjE5MFozTm9ROUFRV2g0NXZ1VzRWSGFvVWZpTEs3?=
 =?utf-8?B?Nm5DRzZOcGxsb1VzcTNGOFAvbjVZRklqUzJ0ejJQVFJUL1liYlRmczlMeWwv?=
 =?utf-8?B?U05UejRudVZWRnowR2pJMndZc2tiU2laZVhyUHFiYzBxQmloWkx0LzRUMTFE?=
 =?utf-8?B?UFBJZ0ltWUlrZFlEckx1OGdDV1RCcVdpeGhyOFpJZGtxdXpMSXRYSHJSM2Qz?=
 =?utf-8?B?Q01lZ1ozZHFhV3N2a3JGaXc3YkNqb1N1ZUpvY0xHbHNWamZmYThKTitLUzk1?=
 =?utf-8?B?VXozcXJhMGZIME5WWitiZHFyQ1FHRS9zbVdjTWVreHBLc3JLWWZvMDQ3elNt?=
 =?utf-8?B?ejI3Y0ZaTWxFeENIZ09TZ25QQVlKNkcyWkU5YmJmYzlYWFBGRWpYajZvYzZP?=
 =?utf-8?B?T3EyZWtJNlRFWjBmQ2t1M2NTS0I0Y0tZVUJnQmphbzRmYklQRys2QnhSMXQy?=
 =?utf-8?B?NEdtVGZJUHZkaEFNN2I2YWhhci9yMFJtK2Q3SGZjUUJGa01SS1pPSXpXcUth?=
 =?utf-8?B?STY5S3M5THpuZ0szYS90Z0M3ajZtYitBaTdsc2hvZXpLZGtuWWRhaGR6Q2tD?=
 =?utf-8?B?d3phOGwrVTc4SEMza0I5L2tXcE9IOG5pSlVhL25Vamd0VDYrK2FGa1A5eU1h?=
 =?utf-8?B?bTNzaEVDVGtReVBrUlBudmU2bUpvNSs0SXh2VzJKVFNRcTgwemoyc2Rud3dQ?=
 =?utf-8?B?YjhpMjRROTdzSGcrUllySlpDY2NLdEJTenhKbUhMci96TllzMytqNk8zZVBx?=
 =?utf-8?B?N3RGcU5zeWFKL3BGa1N0eXF0ejlMa0FaQk9HdzNRN0lPNldBTlIxbXJYclhi?=
 =?utf-8?B?WDdKd29QM1VnVTRPcHFwazdybnBLanZEUVdnVXBTL1k3TEVkeWV0OWtQNXNk?=
 =?utf-8?B?eHdVVWJPbzNKMWdBUkxmSzcwZG1yU2hjWlFxK3o4eVA5TWhQNmxEQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ff1609-7419-427d-145f-08da1c31a527
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 03:07:57.5186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ycsORdPsZcmeEDO9P18awWoKVCt5sOOaYXdBSmYy6LQSk3m07PUjx1U2ipVeXRkRnFis+TGO3ZG4ZQQiIzMNog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
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

PiArc3RhdGljIGludCBvdXRwdXRfYnBjX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpk
YXRhKSB7DQoNCldvdWxkIGl0IGJlIGJldHRlciB0byBoYXZlIHRoaXMgZnVuY3Rpb24gbmFtZSBh
cyBkcm1fb3V0cHV0X2JwY19zaG93KCkNCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11
cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
