Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E1838601
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 04:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CE510E10F;
	Tue, 23 Jan 2024 03:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jan 2024 03:28:21 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFDF10E10F;
 Tue, 23 Jan 2024 03:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705980501; x=1737516501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nmj5f4FxHliksLCT2j7b3I9qkdTxYoQp2QpzgIGaoyA=;
 b=Bq+i+CRPScCB8aMgzrcAyRP8xi0tUzatx99w3Copm/IQbpFpp0MTCzuM
 Wku3MN8FCuLnbND2pUL1xNxaXDe4asWspY/EnmBPoHqE0FHgfUzL6Db45
 Yhjal8NNy6RGzaOl+AdSucasxHUJKkkQT6bz59lOaW/IItj55QJfZ6I4S
 YBdmqiWV8SVT6A9oKur+qqqnRrEJBt6lxlkHSLAQH8gA/eHKmi0m3Eif9
 tbqAavGH07NxuyREoktOrMgXhJIW/yzrmzhjX/amHRDdto3JWF6QHUBRC
 CFOXC5osnPxUnqYMOJoohK9CoJ/4Z9n1AC6yfscTo5dfQ2NXI7+j0urUI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="297715"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="297715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 19:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="785896222"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="785896222"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 19:21:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 19:21:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 19:21:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 19:21:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhC/qA2djqtfK8LsbYWpVkrpAhS1ddOLIOi5a3A24wTr4/YJr4Nj7/bo3h9V/t/ml2Ee2tUNhNRAU5j3nxGYHE523r5Odm//ywzOSHWgmE6q96orBxJ6YTtv11LhpbZayc0SZFLqo+8MEc7Z9cpatAWdCHQXpAszKPBrnZj8lBwOk0b7UxjHQ/Y7JBPJbECuPiU0foL4pwT89Js+vwKTpw1sB7yKiShyv6Fnco0aV54Lx/klF0k6mQKfKQrL42NGP/qbPKFqJwffjANQews5Ghq2ftxhyZQDV/oyye5IwlKZq0/r8hloleEwOqMGrjf8ChmK+bfJMF4JurfajZJ9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nmj5f4FxHliksLCT2j7b3I9qkdTxYoQp2QpzgIGaoyA=;
 b=fZ811pjdckVqah5+7hNkUoR+6e2a/v+4it1xbBiCsh3EJc1t8XdPwDo4veHiX80IFDA4clgUluZlwp1uh7cJOgLnDYQgvACS+j4LM8oLREAxZ7y/c8DOsiDcgdB7qvAWM2wh8zFR5+MhmJEEU0NOAL2D0BLh4ZXf4gbgUwrNWITUVW3mFLOG495jT+2DMVBCC2qUmpVVxj3I+4XUsjyVG3YS5IxS8JBzw/a+4fekXALNNJFHBKPFelPN8zs5/H2qc0Jw22gL5nSOYRCyRT3aGMYbBd2H8LtILhZYy5YM5TaYkv5D2bduO6t0nHcFxTlb/z9TVgzJXi2EoDtVXi6E8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 by PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 03:21:11 +0000
Received: from PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::d3e8:9083:70e5:c4f4]) by PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::d3e8:9083:70e5:c4f4%7]) with mapi id 15.20.7202.028; Tue, 23 Jan 2024
 03:21:11 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Making drm_gpuvm work across gpu devices
Thread-Topic: Making drm_gpuvm work across gpu devices
Thread-Index: AQHaTas285rAdrskSkySwbywxZaZPw==
Date: Tue, 23 Jan 2024 03:21:10 +0000
Message-ID: <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7004:EE_|PH7PR11MB7962:EE_
x-ms-office365-filtering-correlation-id: 27849070-e5bc-4df4-8e91-08dc1bc258ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /UO4pGtHVfKUwjXAK3YO7oEvP30LvHQC91Ja+QQusctQqiZcdCUgvd50utzg1CPiIRlu0LDUTKmtemcQRkt+5ZUWJPtRTp9m5VsPuhFUMwO4TmqY95M5SyU6PiAdoVKQNrroGvaZ+JJxstE48GgvGsoDbkh13V4c9epuPAfF38X1/bhe6mVUBzvqCE55zIBaXB5I94xlqMn7CCqqYt7wwYJr8FpuiYWoZDh6steyfPeM4RtoalSU4LDF9nWblmOjaxPWSbXJot32TxqFbYBSqtKF1Q4/EfHKmG5HvHT6V7dqfnh5IS0Jc4NLaRdpYoWfZ6qN9rk0CMpYIxO1D65fuUSDODVE1CYbuYDoGHnR3IFEIxYkucBO65zwPkhRHu9PKh1xUS3eFMQItm1VAjTJ2YNrSOb5Z/RlrXPnvB25WML5IYm4WoqmPnGKjDgyHqTzyW3f3WA7qkyibOxyzwqH4ty9IrfPIGvKPK9gELIbv69Wz7UiWYjusie8DxcWG63QJJsOyCb9DYYLYrNAvaPT1nvk+DET2c9mNc3/LIpiLd78oC8B6fewzd+luuuy8Z17PQqguASUzcmtu7ptrzowcWkH17UkG0oEU68PJntuUUf8/PlGqqgQmSiTbvSqB721kZ2shwGH13Wh75+dnikhFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7004.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799012)(64100799003)(451199024)(33656002)(8936002)(38070700009)(83380400001)(45080400002)(4326008)(64756008)(8676002)(52536014)(478600001)(86362001)(54906003)(316002)(110136005)(66476007)(66446008)(66556008)(71200400001)(66946007)(76116006)(966005)(26005)(4744005)(7696005)(6506007)(5660300002)(2906002)(2940100002)(9686003)(41300700001)(122000001)(82960400001)(55016003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THZuRS9PMFh5R0pFQjMvdWJ5eWtpUzRZeDdkalJDVmFKb2RKS01vVzNnQzRH?=
 =?utf-8?B?c0Iwa0NseDlGdndxQ09wQ3hjd0hhOEU4VFVnd1VLUDlSVnJEeTRCbHh6Rmcy?=
 =?utf-8?B?aTdkM3Rrd1c4MDRzeFlmL0xHOXBZR2NsZHpucWsxd2tsNjdqRXFYeUFpVlhz?=
 =?utf-8?B?TlFoS21VVVBCSEw0NUZKZ2t3c1RveVA3TGEyZ2VEK1RTWCtZYkx3aGFyMDVH?=
 =?utf-8?B?dWFDcGphc056VGlCZU9abDlaUVR6aHlaakpoVHJCK0h6ZkJhMkRvUkhKRU83?=
 =?utf-8?B?OEU5OUt4UTl4eFhML0tuYUlmZ2FxaXNvTStRaXNVK0hFQXRUN3JyY3g0WHNF?=
 =?utf-8?B?NnBDNXRhdk5ZMCtmL3VvZTNoNHBsSWdSa1R3RnUwSzV6clBBaDZSNVpHTWQ1?=
 =?utf-8?B?RmIyQ3FNK3pMY0xuV0FCZjFTcGYyNFlIWk5YQk96VVdyaHE3MEVUcVhCcUIx?=
 =?utf-8?B?L0dkOFlCanRkR1p6dnJORzVwTU9yenRRQUpDcVhJYlplbzBRWkR4dUQzdWtC?=
 =?utf-8?B?L3c5emZEcmdBQ2ovenBWUk9kQ0FzYnVoWjRVVnlNZHcxRjVobEdSRFE1NGx0?=
 =?utf-8?B?alhULzBGQUNZUTkzaGdaOFFxM2FWVHhTSTZRdEwvVGVKVmQyc1BCbXV1QUt2?=
 =?utf-8?B?V0dRdDRnUW96bFh5L2FtRFEyWEg0amJXTi9BSit5ZmhXUmxMMkFTeXUvUUVx?=
 =?utf-8?B?a1dld1RSKzJrWWcxdXA3VnRuZXRaaVNBTy9JMXdnd2lobkZzRThxbGNRWTJD?=
 =?utf-8?B?aG03NVV5VnRVMnk0NXVMRlJJTUdRR1cwek1YcFNsbVlqYldwaXBEZjBock14?=
 =?utf-8?B?RndNWHlEOXJyR29FVkh4cFdLNC9ONVZSV1JwczN1b2YySDgzbElkQVJBeXdD?=
 =?utf-8?B?ZnJIVkQ2SGJOZHVoTGZNN0owQmxVc2hiU3VQV1U4U3dhU3REOUE4UFdEWEM2?=
 =?utf-8?B?TjZOUmlTcWhwT0Y5ck1nckdGQnpyTC96S1FVM2FpdkhnaDB1SnEydGNFaEtp?=
 =?utf-8?B?MXlKaC9lRXI5SGllUmlLRlRwQ2wzZktnbXYySTkwQjE5RVRzL1FZdkFoMXEx?=
 =?utf-8?B?ZVRseUpIWDM4YThhalNzbzhBdmYvSFNwMjg1RmRDWWdCSE9mZXFBQXBlQnVM?=
 =?utf-8?B?RlB2dmtUU1RtM0F0OEFZMXZUc3J4emFnaXdXdVRZazhGd2dMSGg1NDV0Q3JJ?=
 =?utf-8?B?M3RhcktVNHNqZ1RVbnVXaFlGTHBoWWhSL0x1VmxwWlNWeFFoSFl2VVdtVzNq?=
 =?utf-8?B?aGdhaU9Ob2czeVN3c3orYnVPMng0QjZLcUhERWxCV1VXd0lMUXZ2TGt2RXFD?=
 =?utf-8?B?d2xyRVo4K2RpOE0rcHl3aU1HU2xPNXduVnY2VGk5d09MandSNXVMeVNVN0Nk?=
 =?utf-8?B?VzRac3JhZmN0d3pUT2FXbUNIU3ltbHQ5RWFYeWFWcFhkV3lVNkx2QUFkQ3Zo?=
 =?utf-8?B?RDZ0N1duaUp5TGxMVWVscHVyRkFnMXJaVk5iZHRuNTVaZnlsNmJKWVhDYUZ1?=
 =?utf-8?B?TFlHUHluY1VRQVpyUTFvQUltOFFyblk5VzRvZlRab1ZuMnVUeVBrTDRPOTBW?=
 =?utf-8?B?WGV4K1FqTzFza0lNOGhjK3JleHRzOVRHSXZZYmxtQytUMDBCMHNQa3pJNkIw?=
 =?utf-8?B?YmNucUpEWjducHhOUjEwNm9vY3FRRDNKYVl3S3VKS01ySmdEUFdnQUFCT1FD?=
 =?utf-8?B?Y0djYTJYOXd2S1dqWis1b09iZUsrVE1peHBjTEE3aTFQSXQxdS85ZmhBQjVC?=
 =?utf-8?B?YjNkTGFROCtnVitkM1djamM4RUVRMFFJVVZYcXFIU29WZUUzdTBjalJVakZH?=
 =?utf-8?B?TFkrd3V2dTU5YkRnRWZNSm8xbzhhdkxtTjlwQ0M0bWc4NWxFWFI3M2duQUFk?=
 =?utf-8?B?c1JuT1pSZ2d6SzFvN0R1ZXc2UW1UbGFVWXRiVlh2Tm1lQTZvcldXbldOUnA5?=
 =?utf-8?B?b3pmbEp5NlNBMXArdk9ZTXJhcDFSeldZdGpuWmNSUU9Zc3lWb0VQWnRpM1lF?=
 =?utf-8?B?SGR6cXpqOW1ZQjJtVFMrQjJwbUhvanIxNFJySERyLzZOeUp5aXFWaUdEZTdR?=
 =?utf-8?B?MXF3QXpIbzhyNGtxUkJUdWFZUmYxRmEyRnpvMTRYNnc4aFdjU2xIM3BUVXRr?=
 =?utf-8?Q?o6RI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27849070-e5bc-4df4-8e91-08dc1bc258ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 03:21:10.8993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rCDPzNsR5BVzGn66QH9l51PxvjKaKhNfCKx7X8zMprBS3Tc9kfboLx9drgFJ0qg/+FORa63fmQtBuko6/Msi0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWxvIGFuZCBhbGwsDQoNCkR1cmluZyB0aGUgd29yayBvZiBJbnRlbCdzIFNWTSBjb2Rl
LCB3ZSBjYW1lIHVwIHRoZSBpZGVhIG9mIG1ha2luZyBkcm1fZ3B1dm0gdG8gd29yayBhY3Jvc3Mg
bXVsdGlwbGUgZ3B1IGRldmljZXMuIFNlZSBzb21lIGRpc2N1c3Npb24gaGVyZTogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsL1BIN1BSMTFNQjcwMDQ5RTdFNkEyRjQwQkY2MjgyRUND
MjkyNzQyQFBIN1BSMTFNQjcwMDQubmFtcHJkMTEucHJvZC5vdXRsb29rLmNvbS8NCg0KVGhlIHJl
YXNvbiB3ZSB0cnkgdG8gZG8gdGhpcyBpcywgZm9yIGEgU1ZNIChzaGFyZWQgdmlydHVhbCBtZW1v
cnkgYWNyb3NzIGNwdSBwcm9ncmFtIGFuZCBhbGwgZ3B1IHByb2dyYW0gb24gYWxsIGdwdSBkZXZp
Y2VzKSBwcm9jZXNzLCB0aGUgYWRkcmVzcyBzcGFjZSBoYXMgdG8gYmUgYWNyb3NzIGFsbCBncHUg
ZGV2aWNlcy4gU28gaWYgd2UgbWFrZSBkcm1fZ3B1dm0gdG8gd29yayBhY3Jvc3MgZGV2aWNlcywg
dGhlbiBvdXIgU1ZNIGNvZGUgY2FuIGxldmVyYWdlIGRybV9ncHV2bSBhcyB3ZWxsLg0KDQpBdCBh
IGZpcnN0IGxvb2ssIGl0IHNlZW1zIGZlYXNpYmxlIGJlY2F1c2UgZHJtX2dwdXZtIGRvZXNuJ3Qg
cmVhbGx5IHVzZSB0aGUgZHJtX2RldmljZSAqZHJtIHBvaW50ZXIgYSBsb3QuIFRoaXMgcGFyYW0g
aXMgdXNlZCBvbmx5IGZvciBwcmludGluZy93YXJuaW5nLiBTbyBJIHRoaW5rIG1heWJlIHdlIGNh
biBkZWxldGUgdGhpcyBkcm0gZmllbGQgZnJvbSBkcm1fZ3B1dm0uDQoNClRoaXMgd2F5LCBvbiBh
IG11bHRpcGxlIGdwdSBkZXZpY2Ugc3lzdGVtLCBmb3Igb25lIHByb2Nlc3MsIHdlIGNhbiBoYXZl
IG9ubHkgb25lIGRybV9ncHV2bSBpbnN0YW5jZSwgaW5zdGVhZCBvZiBtdWx0aXBsZSBkcm1fZ3B1
dm0gaW5zdGFuY2VzIChvbmUgZm9yIGVhY2ggZ3B1IGRldmljZSkuDQoNCldoYXQgZG8geW91IHRo
aW5rPw0KDQpUaGFua3MsDQpPYWsNCg==
