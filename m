Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D7546FD2A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD5710E3C8;
	Fri, 10 Dec 2021 08:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7908110E3D3;
 Fri, 10 Dec 2021 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639126776; x=1670662776;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dON2CwsJtFnwRBiT5WrQ7LaZlhzv7HMCjdmj1qbKpKA=;
 b=Kcw4e/IsAEfoQ1rLhpyyQLwvYRPqj3MrPV0qbXXvTA0cUX7tvJg78Z3N
 sofCf/D0wXvkqUA28hQkV3KeYAZdgPIt63bfNcw4C181A0gEEZsmqy7U8
 QwHWyYyDRK3eDv5sMn5aKjvnKZAlyR9vmEtIlMhxFwFhxNPCABEN5VPJ+
 tKl6y6ignWjdeZyI9GUDEdiMnVof/ZEItQl53hHB2jvRNBOkoxBMXKhB/
 m+8n6ziLG+1W3NmnLbtUZjyEbPCdaamqyDEP2vwJqSeO3A+Bl8dhEpikH
 nvjBVYo2BXWjFa/4kHHFK1X4czzCQswnRIYn0R6B6eG/2iYee4P5N8CBf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="237044842"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="237044842"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="602055558"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2021 00:59:30 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:59:29 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:59:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:59:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:59:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnyrOz55wli52XNwWoIeK/GQ7eoO40zCSGt+G5x7YLkrW6HI7q+e4f5r8efP5xIELrXQ0Ve3X/HSLLiVzrE+nfDldyDbVqwCIgC+ir+LOdzB/8wL3Vy+v0uuW+NWVQxHQhBzJm0rKRMV7VubUNPfVciscP4IzdkzT03MU1stRyBk/hxf/BfepgUG5k/74d0hhIZ4jEg7mUeViZczBcBcdNiOdptea7ELECpYklCHqd1EdYgByJIJzoZd8KVvM3Xbcu3zUyi0kQJMYVSkrBhdhOB6qHcXkt7kP0UTmkeUYbQa8lgETiSV7rlgbo173H+0XX4v9twQeXBWH6RqzN2riQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dON2CwsJtFnwRBiT5WrQ7LaZlhzv7HMCjdmj1qbKpKA=;
 b=URP5iKRvii3wdA9hp9C/ekHHZQ4rmAlIf+DJSWDdeCOE5hZDMQUyPVP0IqnVLlNWud5d/96JGT+dJw8Tooja2M268uyopr1tTwRKjhQ1Yem5V2UU/dqXBYGCS+7iL9b+il4ybCCQDMqBqAzVaFYmP1E1oIoySPg+EXSHMCQfwVS2C5aVEFvLeq0N3KguSisf9ceW6HrtNE8AAJZzzS+c58Uw01eVKYILqYW2+adez8sZpBcnEG06lw99B5KeubdDQ4k6L48fps2GNElOMquzUD3lhIAOSX4rLK89m8J29o/GKexWAw/GIZHJ6d90uTQcHFxFfXluWROR7nKXdmUcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dON2CwsJtFnwRBiT5WrQ7LaZlhzv7HMCjdmj1qbKpKA=;
 b=LxcC2kRoK2DiG5H0h7A0HsAH4GARtWXqTU1zarHG/9awfuhPQOKwc6+ageVa0CCG2bPT/1XQXVfMuhySU35XDHdeZ0SFL7WF3l6ECFh6RGtj0Zly7EMatKyLvUoI5JqiJ9sTi/82H0ohS0lHSq6RyavOhiacdsuxPNqDXoEEikI=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN6PR11MB3937.namprd11.prod.outlook.com (2603:10b6:405:77::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 08:59:22 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:59:22 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/9] drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
Thread-Topic: [PATCH 1/9] drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
Thread-Index: AQHX6P17uHWIzkcWU0aXnk1MHyZxGKwrdncA
Date: Fri, 10 Dec 2021 08:59:22 +0000
Message-ID: <5d5fa8a3-8c93-d0de-1428-9bda1f847102@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-2-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-2-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 526269fc-4602-4f9f-68cf-08d9bbbb5c01
x-ms-traffictypediagnostic: BN6PR11MB3937:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB3937FED1157F27AFC4742BBDCA719@BN6PR11MB3937.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DVPHANUhmmDWtPekok6eMvv0wSGfbxmAvdck+8C9s0xMs7pQpP7tfjRiAKI9v1WyRg3RdR+n7shy7+fa4Zo8C4CY6bJEi7eEesnL89EPyRd5r1hWQd9QeHybmor9t0autAHwrOyUwwk/wteGBpZEK94dZ67I0KaRr3wkZug6yiPCR9/iWPxzY8Zm0J02Yh+cpCnrAVVlf+cHGOeo0f6jKCMtE4cu9SkmoRXetBkx1lomj5RoqAQGdudn8Q7f0X9xJmvMK2XUgKXf7lrjEgl3SVdvlbN/ua9QI7kQmhqOxmyKo5Mm48cldXXakGIz9uji2ihzuZiZdDHGXKbiSUj7HaxKAxPjx27f7o2k4RDx4DVltPjK2EYFAwgmegw6SNkY4Y4L/2KQquE24zp5USvM7DSaOXr5j12MgBXba3L4vpojVZlukNAV9ElwCX4XrjYBwfd1aRmlIB/6bBzUSBEPSeHlAtlZg/rUIAttutGaOd9NpZB0l4vvJcxTk1zukbz2Dhe7zzPZrIJ330Ak2G9EIsZ+WWNrN8eVFLVMHzN6gfrbmG/vIb4ZezW19h4BAYMZ+yPeNDhNFdqUzvNUk4V88IDUN7xjaPHpKmQ8KDOSDje77K5fUl/QBK+/LfDW6jtlRczK4+tvF042ugzNuW8CTFPlEK9ARCIrMO4zYJTyhw6L607hVN4qRL9g5Vi6hAOOChtBsDlCrtWv0bCGi4TFWyXoQhk7Tva3oFzf2zqiHT+KpeL9xfK+kSaHgyijBoDHX9ova0UypckB2B6JOE0mJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(31686004)(6506007)(38100700002)(8936002)(53546011)(36756003)(91956017)(5660300002)(76116006)(66476007)(66556008)(31696002)(64756008)(66946007)(66446008)(83380400001)(82960400001)(86362001)(2616005)(6486002)(38070700005)(8676002)(186003)(2906002)(54906003)(110136005)(316002)(26005)(122000001)(7416002)(4326008)(508600001)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXdqWFBQcGdvSkVWMHdWMkxsVUNQM2pvQnAwMXpOQWRWWVVNRW1XYXUxSnlU?=
 =?utf-8?B?MzYxaFM5SHZxY1NNUmVjSXFRTmpoV24rQVBpVHhzcDJwSVp2WGxURzdDTzBI?=
 =?utf-8?B?VzJGZTRXcTBSbmFsbkVQdDhON0JxRkxBcnMrT0RDVDZlM3Z5Ukh0YWxRVUNy?=
 =?utf-8?B?dGR4RnlkUEhxM2haQk1pb2VNRzFrQ1plVWxNQjRiTzNRODJZN3o1aU94dFdy?=
 =?utf-8?B?ODdGMkxwR04vbndNSlNrVDZsNFQ2R3FJU29mSWRGZkRwZFZkSjNpaEtRRHpC?=
 =?utf-8?B?QldTOVF1QVVPRWNWR0tDR1dUbjAwVnBIOVVDZHQzb3I2Qkk2SlNDdnNMQzhs?=
 =?utf-8?B?MXpWUUVUbDZ2QzVzaWRiUVdIWnRycDlVNG14QjZsdDZIbStYdDVCZjJZOUhZ?=
 =?utf-8?B?enl1MkFuMTVWdFByRjc2ZDNLMGF0eER5Yk4wSmkwdmRwa0dSVVpBRlZNVzIw?=
 =?utf-8?B?STVrd2V2Z0VyQlJYQ0NUR1NqOSs5dTM0aU1ScFZ3OFV0WG5VYXVjdzN4d3Zi?=
 =?utf-8?B?Zm1WZXpmWitqT1RmWXZHc2tSNWxEbllqb1VUOCtJSW51Q0VyZjhENitnY0hL?=
 =?utf-8?B?WXlMQjNNOUY2STZMTm4wUm4xVW9WNFNod05WM3ZoMXFaNXVkek1jb3dWWkN5?=
 =?utf-8?B?UUIvUmlMVkYzMnlOYnpWMW9jZTlnZktkZ3o0d013M3k0Z1NWMmVVVEs3T0R2?=
 =?utf-8?B?MUZJQkY0VXYzNllPbXlpR21OYzZaWWoxb1k4UlVJekU2Rjg5N3RqSDU2WXZw?=
 =?utf-8?B?ZTBKbkN4OXFKN2JoL1hGWFozTkExQmxpMjMzcjZLVStDUWlKUjIwb05IUE00?=
 =?utf-8?B?bXB2K0RzeTZtdW1KaDF2cG1MMG53eC83WTRyeUN6SFNQRGN6ajJHQkJHbDkx?=
 =?utf-8?B?QWl4SUZIdTdJWnBBUWptVWYwK05jc2w4ZWxsWjQvaWRaNTFKMXJVQkRFbXI4?=
 =?utf-8?B?WVBDaXpBdWRTQ203NlFzbTRETUZCUTRBNW5CZk1INThnRnY0UVRqOWo4S1Zk?=
 =?utf-8?B?YzMxcWM2VXJIQ3lKSWl4Z3JUaHZlVktVcUNidDViTFBOcHhBMUNnU1VpVTQ3?=
 =?utf-8?B?NjJmZW84K3RqejRwRXQvWUpoMnVMU0V4M01qYnNmOW8vRGdlckJFYkFGbm0v?=
 =?utf-8?B?OXF1SXJxY0N3aTh4S0hlWENsRytDb1lWVFcyVTc3MEZTM09VcXVZdzNOc0h2?=
 =?utf-8?B?TTdxWng0UGp4VGdrSTBlblRvb052c1MrYVkxVUlzUHllL21zVVdTSHlkdmlE?=
 =?utf-8?B?elZmQlNGQU1ZNEFFSis5WFNqSXRGUGdQcG55RzB4L0x4YzNmTnJhNndWZVR5?=
 =?utf-8?B?bTllK3pXbkQveFhCM084NURnZjNRZStNRTdxd2NXU3NZR3Z2VFlQdTZ0Q0RY?=
 =?utf-8?B?VHA2Nit2RHNHVWVzbE1yZjdybkRHZFAwR0dnQytPSmJKaVlXWnZNcFF5ajZR?=
 =?utf-8?B?VGNubnNOZVZzeXoza3hXUlIvZElxRUIyYndQdmZydktWZlpzeFNOc1hkNCtp?=
 =?utf-8?B?S3lSc2QzMmFNRGs3eHpsbWpla0NxV2hEaWxML1FXa0h2ekxrSXJ4OWpuKzhQ?=
 =?utf-8?B?RWVha1UrV2VQeXhFUjJSdVJSM2F5SWk0QS9TVjBodlhsNWxVTjMzWmdqT3Ny?=
 =?utf-8?B?ZWQ5MEwxTXZBUHZSVVA0VUNkb28xMXYyalo5SDlyQ0ZjZnNCVGU2UFBXMzI3?=
 =?utf-8?B?M1hmalhieDdQMmM3QUIwK1V6UWdWL2M2cXRtZkl5T1JQMDhnWE5zbE9JbUJi?=
 =?utf-8?B?R1ROM2xBUDhPUGxDN3poVmljMDdVamtSeDdjWVVuRGllQkhnZEdUUHdjQTJn?=
 =?utf-8?B?WWo5Qi9hbWVzQVBKcUgwbUYzY1BvUkY2emNLeVFHOW5tN3F5R0owbEk1S0tB?=
 =?utf-8?B?eG9sYjk0UlBpRHg4amw4NWVvcWhZcTc1TmxoaXZzOW9JOE9iRUQ4Mkw2UnBI?=
 =?utf-8?B?NFVFckJicXFYMUtUc1RreTJLV2ptNSt5ZGNkZWNwVVA4V2Eya2J1RlMwZ1E2?=
 =?utf-8?B?YWwwYnhuTWFHUHo3ODNzTk9SMGpWcHJVODVVZkpTUEdmRFFIek5NbHExMU9i?=
 =?utf-8?B?S0d4ZmpWQ0RhbTFSN09qVGxOaFBuT2ZmeE1ocW4vOVBFZFh3cUFDWGtWSHZJ?=
 =?utf-8?B?UzQ4bE5UN0w3MnJWelBlZjhONFNIUU4xWnBRU0JEd0F0SnhmbnVDaDRyKzFr?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD3ACBAE451C854083145A0497C13DD4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526269fc-4602-4f9f-68cf-08d9bbbb5c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:59:22.5425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keaz6ngoHK5ObeJuYkXyZ7bXa8XqBMoR2k4SOFJsCrH+W6CZM8BlsmmUkQHsuTAQuLHNYEoJuF6cYKCago05uQ==
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

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBUaGVzZSBh
cmUgbmV2ZXIgbW9kaWZpZWQsIHNvIG1ha2UgdGhlbSBjb25zdCB0byBhbGxvdyB0aGUgY29tcGls
ZXIgdG8NCj4gcHV0IHRoZW0gaW4gcmVhZC1vbmx5IG1lbW9yeS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogUmlrYXJkIEZhbGtlYm9ybiA8cmlrYXJkLmZhbGtlYm9ybkBnbWFpbC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDQgKystLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuaCB8IDIgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0KPiBp
bmRleCA1M2QwY2IzMjc1MzkuLjZlZmE0ODcyNzA1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dHQuYw0KPiBAQCAtNTE2LDcgKzUxNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dF9w
dGVfb3BzIGdlbjhfZ3R0X3B0ZV9vcHMgPSB7DQo+ICAgCS5zZXRfcGZuID0gZ2VuOF9ndHRfc2V0
X3BmbiwNCj4gICB9Ow0KPiAgIA0KPiAtc3RhdGljIHN0cnVjdCBpbnRlbF9ndnRfZ3R0X2dtYV9v
cHMgZ2VuOF9ndHRfZ21hX29wcyA9IHsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZ3Z0
X2d0dF9nbWFfb3BzIGdlbjhfZ3R0X2dtYV9vcHMgPSB7DQo+ICAgCS5nbWFfdG9fZ2d0dF9wdGVf
aW5kZXggPSBnbWFfdG9fZ2d0dF9wdGVfaW5kZXgsDQo+ICAgCS5nbWFfdG9fcHRlX2luZGV4ID0g
Z2VuOF9nbWFfdG9fcHRlX2luZGV4LA0KPiAgIAkuZ21hX3RvX3BkZV9pbmRleCA9IGdlbjhfZ21h
X3RvX3BkZV9pbmRleCwNCj4gQEAgLTIwOTcsNyArMjA5Nyw3IEBAIHVuc2lnbmVkIGxvbmcgaW50
ZWxfdmdwdV9nbWFfdG9fZ3BhKHN0cnVjdCBpbnRlbF92Z3B1X21tICptbSwgdW5zaWduZWQgbG9u
ZyBnbWEpDQo+ICAgCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1ID0gbW0tPnZncHU7DQo+ICAgCXN0
cnVjdCBpbnRlbF9ndnQgKmd2dCA9IHZncHUtPmd2dDsNCj4gICAJc3RydWN0IGludGVsX2d2dF9n
dHRfcHRlX29wcyAqcHRlX29wcyA9IGd2dC0+Z3R0LnB0ZV9vcHM7DQo+IC0Jc3RydWN0IGludGVs
X2d2dF9ndHRfZ21hX29wcyAqZ21hX29wcyA9IGd2dC0+Z3R0LmdtYV9vcHM7DQo+ICsJY29uc3Qg
c3RydWN0IGludGVsX2d2dF9ndHRfZ21hX29wcyAqZ21hX29wcyA9IGd2dC0+Z3R0LmdtYV9vcHM7
DQo+ICAgCXVuc2lnbmVkIGxvbmcgZ3BhID0gSU5URUxfR1ZUX0lOVkFMSURfQUREUjsNCj4gICAJ
dW5zaWduZWQgbG9uZyBnbWFfaW5kZXhbNF07DQo+ICAgCXN0cnVjdCBpbnRlbF9ndnRfZ3R0X2Vu
dHJ5IGU7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgNCj4gaW5kZXggM2JmNDU2NzJlZjk4Li5kMGQ1
OTgzMjI0MDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgNCj4gQEAgLTkyLDcgKzkyLDcg
QEAgc3RydWN0IGludGVsX2d2dF9ndHRfZ21hX29wcyB7DQo+ICAgDQo+ICAgc3RydWN0IGludGVs
X2d2dF9ndHQgew0KPiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dF9wdGVfb3BzICpwdGVfb3BzOw0K
PiAtCXN0cnVjdCBpbnRlbF9ndnRfZ3R0X2dtYV9vcHMgKmdtYV9vcHM7DQo+ICsJY29uc3Qgc3Ry
dWN0IGludGVsX2d2dF9ndHRfZ21hX29wcyAqZ21hX29wczsNCj4gICAJaW50ICgqbW1fYWxsb2Nf
cGFnZV90YWJsZSkoc3RydWN0IGludGVsX3ZncHVfbW0gKm1tKTsNCj4gICAJdm9pZCAoKm1tX2Zy
ZWVfcGFnZV90YWJsZSkoc3RydWN0IGludGVsX3ZncHVfbW0gKm1tKTsNCj4gICAJc3RydWN0IGxp
c3RfaGVhZCBvb3NfcGFnZV91c2VfbGlzdF9oZWFkOw0KDQpJdCBzZWVtcyBsaWtlIHRoZSB0aXR0
bGUgZG9lc24ndCBtYXRjaCB3aXRoIHRoZSBtb2RpZmljYXRpb24uIEkgZ3Vlc3MgaXQgDQpzaG91
bGQgYmUgQ29uc3RpZnkgaW50ZWxfZ3Z0X2d0dF9nbWFfb3BzLiBJIGNhbiBmaXggdGhhdCBmb3Ig
eW91IHdoZW4gDQphcHBsaWVkLg0KDQpSZXZpZXdlZC1ieTogWmhpIFdhbmcgPHpoaS5hLndhbmdA
aW50ZWwuY29tPg0KDQo=
