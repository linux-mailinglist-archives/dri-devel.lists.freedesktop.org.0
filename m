Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD46C133F4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F7410E047;
	Tue, 28 Oct 2025 07:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y96SfMPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C92010E047;
 Tue, 28 Oct 2025 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761635394; x=1793171394;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+1Kfvun1HVw+bDbfXIg1xT1EnSRMv3f9AxxcTy+WSQw=;
 b=Y96SfMPaWODu1pGy5iHE5uP2vME2IOdfejjTMOIF6RyjRy0wGqDpZYnB
 W0f75YIe61Zr+MJoeQor5XZ2J/r6PWKi1WAvrbwCXkJUPezw2pe3cott0
 mCKSRKY0RNjaqGHB8NQlyr5xQfMSashIgxgb9E3DLbg11ZpuHPzK1htM7
 CB8xyyB1/Z+HGXy+7y98x8xzF9p2oXWJ35/M21x7NRfFF3Ry2XTzaQ8IN
 IfroDwzsT+kyRP4T0HoOQyMW/yOcpxu+B5APya+APlHhLviPuCoijYh8c
 SSxBoRs3cDW/pAMyL5HJ3Yvpz1In4DSz2fEdwBRfz3ufkx+9oecEqhRvU w==;
X-CSE-ConnectionGUID: WttaA5HmSLqfVvxcgnnHtQ==
X-CSE-MsgGUID: g+i4m5CFSvahTKSTQujRYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74014712"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74014712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:09:54 -0700
X-CSE-ConnectionGUID: YlJ/y57yTuyb4ulhh6idPw==
X-CSE-MsgGUID: vs/FXaQtRk2K3xoLO4NTwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="186021038"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:09:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:09:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 00:09:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2nUgGAPy4AXspcD0dMh5A09w5ToB9qtwSM/F4wopAESUJ62ttaBSvPxxoG7iv3Pt1+VK++Y5OMlk+4+FsfkYwtgOMXTL8ZjM9eJuacv6cB3BW08MA6dWKCrGaPiEuqbauGR5TLoA07wFgpdp3Mg8j3/d6FHHc1tdq8MQGp4sRtNaxQnExjn5BhCIo2oqmVPfsqzF4VmR4hHZxca9PzDPILx1VgDvZrlUub7XsmEFC7hJfl8iWyn4Kzi7ZO6kM5xjwoqZZiFoeS8G0U32KgPangW7WaxZG6bEvrYTo4fe3GuZuSNt8/0Xjtw4kLli44EpsuuEXuyu+11Yaiwr4mtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1Kfvun1HVw+bDbfXIg1xT1EnSRMv3f9AxxcTy+WSQw=;
 b=DG4Vpgh/PGQGWX5k/KbRP/fVk8ZLkfRrWmKkc4XCX2Uzsi3eGHHeQ5uD72Lmj9pEsIflxgSc5WmbvfvkEJEi7zOyjwLLYXl+hO+k2vVKy5J+KJbIzQDP5BVdIsIYvw3mF6Tf8Hz2WPX2E182d7fGMDVS0d+kpELbSo94yJVG6mzFToDpXYiivs775/pAR0s/dFcPJ6hhyYdnbhwC0LT84nSib8fp0VhBLPXuPskIC43rN4JrS21YuhRlaHgIjs8WRdolZ1VIG36xCjNe4orql9inESZq1t+f9KJEUIkKFa6R67pUkdPFPDGucgmN4/eHYfIjQlTk/glMX127NvKzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 07:09:43 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 07:09:43 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Alex Williamson
 <alex.williamson@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Brett Creeley
 <brett.creeley@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, "Cabiddu, Giovanni"
 <giovanni.cabiddu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Longfang Liu
 <liulongfang@huawei.com>, Matthew Rosato <mjrosato@linux.ibm.com>, "Nikhil
 Agarwal" <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, qat-linux <qat-linux@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Mostafa Saleh
 <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi
 Wang <zhi.wang.linux@gmail.com>
CC: "patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: RE: [PATCH 18/22] vfio/ccw: Convert to get_region_info_caps
Thread-Topic: [PATCH 18/22] vfio/ccw: Convert to get_region_info_caps
Thread-Index: AQHcRHIsp+dKksSLZUqVODr+jJwHcrTXKpVQ
Date: Tue, 28 Oct 2025 07:09:43 +0000
Message-ID: <BN9PR11MB527623237373247B14BA44798CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <18-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <18-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV8PR11MB8699:EE_
x-ms-office365-filtering-correlation-id: 6432edff-cd23-4233-b8bc-08de15f0f834
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Wkt4N2EwcGNyM2l1WHU4OHN2VXRiSmtmRk04cXhPendsb0VJeVJvMFFKeWlD?=
 =?utf-8?B?M3ErSVc0K1pJVUpMMURCT1dzMGVQbTl4NzlEUzg4UTBTNEgzTXBKa2ZZY2M5?=
 =?utf-8?B?aXVoWDFlVVRUL205L2o3bE15bVJ4ckRrQmVNRmdRZ0ZpOEs3Wi9CZ1JXSXdk?=
 =?utf-8?B?NzZtWmpQMDVrS2gwNVRkanZobXJoR1BWVTUwMzd4bUNnSEVsZVBhZitQY0JY?=
 =?utf-8?B?Rkk3bWhWN1JWM0s0U0tEYnZsNldmT2ZkTlgvTWQ1YjFKaU9zOHJSVk9xRTl6?=
 =?utf-8?B?YWNNRTRhb2J1QzZFZkM5aHQ0ZkRTU3k1OG9WSVRsemQ2ZU9yVHZueVU1R1N2?=
 =?utf-8?B?eWo5a0NxU05jdzV1Q0dRZlNMY1oyVmo5Vi9tWUovMFJyY1B6LzEwTTRYVndK?=
 =?utf-8?B?ODV5S3JOZjFGVUVQMGJSOXl4aG9tbEtnMVpqdTRnTEZGS3N2VjkwL2YvYjJy?=
 =?utf-8?B?a2owekRreWtmYTFGWHlpY0ovbUp5WkNQZkhUVXM0cnJTV05mMmdxcFVRNEc5?=
 =?utf-8?B?OVY4M2JPaFcrdkVESE84RHlmVUhqWEJSNGZTbmNnaVd1Ulp1c2ZrOUNJS2t5?=
 =?utf-8?B?Y2tTV2NpTDZSTVkyaFYrTWpRUFFGNXhlRU5FQ1l6WHNKWkcvbWNDNitsQVJL?=
 =?utf-8?B?NU0wdEFob2J5NnAyWDk2UXI1OCt6MHdZRG1Fa3JpcGtlK0Z4M2lNMFRUME4x?=
 =?utf-8?B?eDR5aGZtUzdmNGhGRTIxMjVTS0grOFE3VFpFdGMvSkNDeTJ3UzZPQVVBWWpw?=
 =?utf-8?B?cVBiaFp3V0hNdXM3ZG15QjBMNmpXUkVLdnF0T1oyV1RmU2pPSzcwbzhHN09Q?=
 =?utf-8?B?RWxMQUt0RHBKRUZHQWFTaEw4YWNBZFllNkJ6ZkphYkN6Q2pXS05UMnpGZlZV?=
 =?utf-8?B?KzdmU3JlUFE0SlNtUklld0tPaENlV2xadWRVQXF6OU9ibjlrMGFEbHFaTnRh?=
 =?utf-8?B?dmNjbTZZN21YSlFLZjdueExUZUZWVzhLV09qY08yL1REdzBRWXAwd2FZQnVh?=
 =?utf-8?B?TkFEcXFxK0htcVlUSnhtR3lEM3RXRkxMYUVzcDBlZEVsRnpJdm1jUi9uNEdB?=
 =?utf-8?B?bGtSeGlrSWxVekZybld5RzBxR0NIQjNVcktReGw2dE1LaTRMSStuWlNDdzRz?=
 =?utf-8?B?UWNTUHU5b21nYzQ0czBNRXFQY2VZQmZBTVBxbWZXaTRqSDBTRmlmcmwvSEZ4?=
 =?utf-8?B?a1JVWTY0VG9nQzVVb2hWaG9SMm5Lbi83MkxVOUQ3MDNaNkJqYXUzUmJZbWxX?=
 =?utf-8?B?N0VOcUljZmJSOFlGTmQvOHRFSHo5OUpRZ3ZvOXc1YkpRc0tNcWwvQkFIejQv?=
 =?utf-8?B?RHhhWEFobVp0UTFqV0NsbGhWbUczOHhGTmdCSGRRWmtwR1RGeGplakVqZXlw?=
 =?utf-8?B?Rmp3azZvMWpWS1cyeDI1SXE3Zm91OXBZUUJDYkpHUTZsNTZMYTcxMmdQc0hL?=
 =?utf-8?B?Z1JOTDZkL2gxUXdNUHpMQkIxZjJNb01xU1RWU09PL09rMzI5WHRmeXYrVnNQ?=
 =?utf-8?B?UXVjU3AyMzNIZmtVTDg3VER5M0tvR2ZVTkFiM3haaTV0RlNCcnNTaUErQ2gx?=
 =?utf-8?B?ZkZ3cjZoMW02MDZZZ3FFY3o3bGRaWVlhMm81THFXV0ZBWEZEdE1vN2tGUGM0?=
 =?utf-8?B?N1Vickp1ZUlSNW5jeksxZDY1QW9mV1NxQkQ2Z2k5QmQvWlBZRG1wY0VVZHBv?=
 =?utf-8?B?Z0FsSnJNU3dqQmVRYW1FakUraUg1WEZjSHZ5dStISUV5NWdjQnl2d0Q2SldJ?=
 =?utf-8?B?YXdLaHNPQ2I1V0ZMcisvMFdYT3N5empqWEN3ZHlVNGxSSnFHeGorU2psc3lB?=
 =?utf-8?B?ZVUzWjNDVGJ1RnJpZ0dhN2l2cHBUMWI2UmMvK1B4cFRscGsrZXZMMHF0TG9q?=
 =?utf-8?B?NW5CMzVMMW1MZ01Hc0RQR1FjTEVJS1p0dDI2Y0xtT0IxUHp6b3EyMHNSSzdk?=
 =?utf-8?B?UEVSSjh5eE56aVhvbzd4V201ZGpqdVEzbTR5ZkhKT29YSVhRVTMrY0R1UWd3?=
 =?utf-8?B?MWpuZlR2b1FSMkl0THJQVE9hQ3hYUzl1NVFFMHpKUDlwZ0tqWEUyNmkrc24r?=
 =?utf-8?B?cmMxNEtJejB0QmlNVUh3TG05cU1DcGxRZDg3Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTYvOWc1VHYya213Mm5KSWE1N2o5UEpHWlpreGJLUHphSXFYTWdsd1FranJm?=
 =?utf-8?B?eTJDL0gxMUtxSFhzZEY5bFJycytYZTVFSmxhRXhseld6cUFpYjVxcWpaMzE5?=
 =?utf-8?B?Q0NJZ0RmaHkyL2JiZHdDMnh2WjRyamJrY2wxM2tqMkxpSU5INnFNWittZFdp?=
 =?utf-8?B?QUdUZTF4QUdZMlNhL2lURU00Ynd2dzVzYmhPT2ViR2lvRGxJTFhjTmVseGp3?=
 =?utf-8?B?b2I2QzBoNlkrZXhLTUtOWXBoNHZaVjFsMTk5RnVSekUwS1R4YmpqWU1zSGM0?=
 =?utf-8?B?VjUzaVNJSDdPa3BnRDR2ZUYwVWRDSjM2T082Y0NRcVFXVTRVVi93ekxiMmZi?=
 =?utf-8?B?Ny9lYkdyK0Vlb05Pcm83MUgwMmN0SnZlQTRlM1l0UU02VE05dmlBTU9maVEw?=
 =?utf-8?B?UEJzRmpFUitjVGk5ayttK0ZLRHI5MGx0UHpkNFVEeG9nTVVHdHlUOXdQaFRn?=
 =?utf-8?B?VmxTNWh5OVRKVEREc2lQRkFONnJKemhSb09nWlcyZmMzWmxWVzVkRjB1Z2RV?=
 =?utf-8?B?aURySW1sdFZrVXBUc0lBYWdiSUsyeW81V2daRjJqRWxWZEJrUnY5clo4UXd1?=
 =?utf-8?B?VzNRMHBJTFhZbGNOb1RlMU5PVW1tUUpTZlZXTHc3UFZVaWxlZi9KWWRWTmpV?=
 =?utf-8?B?NUJWRk9jVWViakxhVm5uaXlaMlpoUngwaVR2aGhRRC8vc3RhcDQyalZzVzAz?=
 =?utf-8?B?S203L241WHN6aXhyUmRyemxtNUF2ZWJuNUxkZDM3NHNYelg0bExyb3k4bnFt?=
 =?utf-8?B?NWpSY3RsQm1xb2Z2MlBEeXF1bnRBcTlXSGdscGUvaWx5WVZQUks2aHhVMzdX?=
 =?utf-8?B?Nzl4dzB0NkpUVUJPdFlqMmJoRjMzTE50dzcyMnFucmc5c1NpRFNHS0U0RWp4?=
 =?utf-8?B?UWJOTnkyUjQrSkVSMVlaM3cvK3grUXJmU3h0N1NiYmpYV1NuOGFMRWpjbkF6?=
 =?utf-8?B?UnpyVytyOVFRYXNYSysvdnBHaitUWG5SUUxZa0pmTktDenFZODQ0aWVMUlN3?=
 =?utf-8?B?U0M5ckVPUmlJWlBiTGdiOVJ6VnU3NHo1djQzMHpoazJ0bVo0bXlqeHF5OTFB?=
 =?utf-8?B?d3JUcmhrMHNaZUJiVndMZVJHUGhaTDUyS1hZdm9jdjZQTEYwWlBzeWdIbjVP?=
 =?utf-8?B?Y240Z2E1RzUrZTdId3VUb3R6MlVaQmhkSzJvOEVVRjdMTkpqOVkvVVdONCsr?=
 =?utf-8?B?NERjKytGdWhxeTBPRVFJNG90akc4bUVVckNqc0FwajdEMy9meWtLL1poZXYv?=
 =?utf-8?B?UHpEeVN1aC9FNTJYWnA5SXl3b2FvWkx2VjBQSFI5b1B1VjZvTDJwZ2NFTS9C?=
 =?utf-8?B?Tm1abWxPcmxTa3c0S0MyZUhLWG85SWFGY2UvUnNwZ0piNS9oYkVHOVQ0V1BC?=
 =?utf-8?B?QmR5Wm53NEFYdTZwU3ZDajhDM2daQTNlc3pPSDRoN2RUT1R6VmdwM1N6SnhT?=
 =?utf-8?B?dzZtN0xudmlMU0RRYWFJckVQNDZiMWZLU2RRVGJOLzFURU1JdDQya0IxQXNr?=
 =?utf-8?B?RTI5eVNKT3lNbGliK0t6WXJ0OTdLT2JuZkwwdFRWZDI5VTRLZ1ZIY2ZhdFFX?=
 =?utf-8?B?M0IxZWJhYndWQmFwTUp1VkYrUkQ3eTFIb1Azc2d0SmZLclliM3Nsc3lBaUgy?=
 =?utf-8?B?MG9IbHh0REE0Y3lzZjcvc2dva0ZYUjFaSHdzRHdkb3p6ZFBtK0lCaVVmVitG?=
 =?utf-8?B?WTJYZDF5bER1bHVHMDNiNE9TSWlJdFIvUWJmNlJ4SnhKdm5rcDc4bDNneTVq?=
 =?utf-8?B?eVQwVzBjMnVGdkpVenV0SUFvM2tmaWZxdEp4OGwwMzVkdzl1UERoa2d5Snc1?=
 =?utf-8?B?NDJQcmI5MzBPTU11Qk8zWHB0RXpFaER5NithcEtZbnp4ZExzaHgvSHBqeWlk?=
 =?utf-8?B?ZUNNNGdHQzArWWxSeUpHTGl6MU1OdVJMN2kydjl4Qyt5OWJBMHRycGVPNXAz?=
 =?utf-8?B?U3NqNDM0cG0vSDNvRThoM1kwV0M3aWcrYm5Ia1JyNFN1dU1heVhlSzZkdUJq?=
 =?utf-8?B?Q1M2YVdHaTA4M0UzVUVibnpoY1VsSWY5Y1lXOS9oQzhEa3AwMEVZTldZVEJN?=
 =?utf-8?B?ek1BSnh2akh0RnpQdnozSGR2UXdFOTk5b2ZtVFYvTkR3UUFZT1lFUmdYRWJr?=
 =?utf-8?Q?GT3j4b9u0wJpvQsaLe9FjpOQs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6432edff-cd23-4233-b8bc-08de15f0f834
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 07:09:43.3175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3YGCPqGNiofyqaQDlJ9oIiAn9QAYf/vN/bsfracNcNWhaD6M6QcNijThsxBVHvo1dAvqdF6KDYnOzMYQrG9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8699
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

PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPg0KPiBTZW50OiBGcmlkYXks
IE9jdG9iZXIgMjQsIDIwMjUgNzoxMCBBTQ0KPiANCj4gUmVtb3ZlIHRoZSBkdXBsaWNhdGUgY29k
ZSBhbmQgY2hhbmdlIGluZm8gdG8gYSBwb2ludGVyLg0KPiANCg0Kbml0OiBpbiB0aGlzIHNwZWNp
ZmljIHBhdGNoICdpbmZvJyBpcyBvcmlnaW5hbGx5IGEgcG9pbnRlci4g8J+Yig0K
