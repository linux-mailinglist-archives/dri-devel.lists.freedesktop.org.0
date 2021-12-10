Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4459346FCA2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E4B10E400;
	Fri, 10 Dec 2021 08:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FFB10E400;
 Fri, 10 Dec 2021 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639124458; x=1670660458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=r8PmuI0r0nt+B94Y6AZAXc2PwE/2YzdHM1A4SBXx0fI=;
 b=UnmSzsHsZVOe+wu1QZSNptGqC3iYXXxzUoZzCXLTiT24+rJIGcTjNViK
 vTpCl1zhP2Rz3OxcZQNb8+cY9wHuETEI+S+T/GFYttOdHYeI5qw/JpU8q
 vILS1ldU3xQueSSN+ssug0QnPW+EGxHmQGvkngd5YbPjfwvN0ou+XBBxC
 iED6LTGHHB6ryDbbvJ83w0iBiEGkba7TeMqi+X29noQoJn+WXJlXVyWrB
 8GX7FG9AzhR41pwD0akzMqzPCp05WhfUIXiDrtne/o6yBYcDsSLA0s0AH
 qQ0UOqw9hxBhAnCCMWxkyVkZyXt4yROVeCXia9TpNRLcE7N2d+JX0/SBL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262411994"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="262411994"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="753111744"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 10 Dec 2021 00:20:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:56 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:20:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfDHgKo4lWyNmfSHokyfeeSS2d0/REGlbpc4nNXHG6TioPPs/xWKzzFEsnFocfowsryv7GqP8GQ+dvwbeotSfoqFc3OKEIOmjkdQFt6KSgmqBs2CKP0w54gBum7MXHEkt+QCpKO1DQf33MlK8fW2SZ3+V+pLnn+XcHwRE60RX6uAYElLnkpdPQa4chm0c2rLp+E3lOA5tMbz/1MBuuLGtZmf3DvsRVsAcR5gWUPbajZjJ23U9oUwxsV7o+rjvslg1xdCtrmCMlgg2I5qsH1EVzS076rKYd1A8IflCl2lMRUwGkZayE486gjd0shugXRBR7jdQbxxVwdJdbA1dZ95SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8PmuI0r0nt+B94Y6AZAXc2PwE/2YzdHM1A4SBXx0fI=;
 b=no9UeayolZsrWWk1mV7mTmAtFnPpmV6h3LBOvDujq5C3IRqClf/I9NBZd6moXItl3RAIEqO5RG70y8yilZ7yiH5Lj3H9bd9gBEG7iA7Fi8I1H7KdswPVg/j/Ct9TLSrSTQYXF1RKL1YqbetEBhhZf3h5loDxepEFq6wehg4auwMVZMNxbMQUKv1YsQT1ydqAYVI2I5D+gak0iMC9E6s0p3ueaP+Q2L5Qv0x3bn1uWJ05L2MTvDkbaBrwq3HdJ6KwoBJPLJqdYqTq/ANTHug7o3UNSRE6n/ikHDgR/MsCgXUBxQ1PBFGvmaoQAyUMDTzBS1oe5MztHq/464kQKpysuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8PmuI0r0nt+B94Y6AZAXc2PwE/2YzdHM1A4SBXx0fI=;
 b=UzMIrch5dAc9JL/uHPResAkHcQb/VT1xISmjVQhBcICNWH6f1abx8hbdF2J9NBI1RjkJ8ACgto2YrU5KV84a5KpoO8vP6JkH46EuzUogQro5y0ZzP9WeSAJ5gXwD9PVr7FQBVanQe01eHdnBivd9pfHHQmXbSIBqkTotmgMCJYQ=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN6PR11MB4178.namprd11.prod.outlook.com (2603:10b6:405:84::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 08:20:54 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:20:54 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 9/9] drm/i915/gvt: Constify vgpu_types
Thread-Topic: [PATCH 9/9] drm/i915/gvt: Constify vgpu_types
Thread-Index: AQHX6P2El24yh5WBr029zY+8oMtuhKwra7aA
Date: Fri, 10 Dec 2021 08:20:54 +0000
Message-ID: <8a7dded1-809c-1bc6-f05d-8acd017b32fd@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-10-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-10-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86999d37-1f71-4b23-e919-08d9bbb5fc1e
x-ms-traffictypediagnostic: BN6PR11MB4178:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB417803B004DE6036AA851119CA719@BN6PR11MB4178.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XHo03PQt5AGhB1Laq05SDPbJ5X+ZELU1yBjz9Fsw1VrWk0rEZGsstyzgItAigPtSZPW3zqD+lGgzsLtndMzSEmZvXyEphNQ7zG+7CfxVrgixdMWXdU/NDhbHocROrJ513McP6a/RFUVI8LZlbLgOZirk3XRFj71l3U+hEqhRYCXwmpQ6sV6cizoagweEVZjN44ZL3teRC+6Ywyum0UVIyj/pXeT8SvrXddckWtioVc1BS529h6ZzU2s6NcGHu0SoR7hGvy6AVRqVK8j0feabqu7Tjh7NyrTkhjyIWBjEGF1vUoS9a2e/XMHQWpTbx+gz0b2DCYZMvuauIloWntg1k3JjMqT/zW/X21Y4K2g6qiaR6jIx5WOZLYZ3qr4VkVssUGJdqrNt9WOvkDPJIUe1Qa3P476mhue4QsTz5OgnCDqiHJCQVfQjVctPAawbub5V8VgRqplxOKGEQSypCDHSE+wPp1RHmwqlX0dIb/SgL+vhxrUVuyFTEAcTifFiv+oHghMFcR1kuy2CVTNQxQ8xM6M54xAazTXoouwUVRvpdA2nVjqlwJ3EwudEnWZdaJn9ATZDFng0D1vbVA28ZP3Na27qsl1hE1ItHCHLrI5e0I/1Kq1rMEnZou6UQwTA/CiKHJZP1+DXVyatVvI+uRGBDUkq95bnhS5tPqBnz1Fb6egfAnFaaBMudhPCx0MQtWd6VLwYYEjy5wjyMJ+fFJK0KNVi6+JSAmU1nEp2b/5t9XwHWLd2RTOVtSYWNPBkb0EESxz0gHCOXypxG6YpSlbfiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(83380400001)(38070700005)(31686004)(2906002)(36756003)(7416002)(64756008)(186003)(54906003)(86362001)(316002)(31696002)(8676002)(66476007)(71200400001)(91956017)(76116006)(110136005)(508600001)(66946007)(66556008)(38100700002)(26005)(2616005)(82960400001)(53546011)(6512007)(6506007)(5660300002)(4326008)(122000001)(6486002)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlpCbG1Bd1pXQitabEp5THF4KzkvTmZyb0xwZ2dBbkhQbmhTYk5vRVVZQVpi?=
 =?utf-8?B?Nld4bjAvdGpPc08yc2hHUk5HWEtBa0w4dzVKaGZtM1hYdTlJMmNDREhsOGJn?=
 =?utf-8?B?WlJFdlJobkJPMGhYMzZoWHBjMURKYVVyNDVSY3g5WWprYTkvazVwQklBMmdv?=
 =?utf-8?B?UEE3cWFoOWVrNnNqK2tZVy9Kdkp2NStIU1VRQXluaUpsQmFhS0RjNnV0ZzZw?=
 =?utf-8?B?RFBRSEJvcGtVaWpGd2lMbmdMTXZVa2RBbGY2VTBmcVQ2cURsNzBIbUczeWFy?=
 =?utf-8?B?WHBLUUtpdkEwbE9NSkFOak9vYWhDbTNxN1VjT3J5WjBRb1ozbldzamptREQ4?=
 =?utf-8?B?QkV2czMxQlgvbC9LNG5kclJQZlFNVm5ZeU9mVXd4T2h2VFI0ZXFiZjYrTE9r?=
 =?utf-8?B?Vk9JcXVGZzVrV1hsYUJENENCbmhUcFJzZzNKMHBuM3IwUHZsalBHVTFpR0g5?=
 =?utf-8?B?UnZCZjJlVHFMS0MzaVJweFUxeTdMdytxSFJGSjFrQlgyRW11eTJBREgwUmxn?=
 =?utf-8?B?SU5vOGVhK2FnWmdERlVINzNjbEZYblI1ZHpOak5wcitYc1pXcURjWnZNN0V6?=
 =?utf-8?B?NHBYVDRVR3QrU0lSbzZ6Qld5RVZPL0tHZ3RaWjNySVhCMW9vNU5PbXpPZ3hW?=
 =?utf-8?B?dDFNSFVONnFwb0lEb2FaRW1ibk5BODVzblRxWEhMWDdPdmFPU2ZibkhSem16?=
 =?utf-8?B?WFdqcWlSazRTRU1hMkxkcTlmY2lBRXc4bGpabFZINjJhQndtZVJJOEl4Nzlu?=
 =?utf-8?B?RWI2c2ZoQ3BSbkw5ME9EM2FQQ1lvb1FEYW5SRGFlMFRSTHliM3IxZUZpRERD?=
 =?utf-8?B?akRZRi9YMEpBR1VDRFFoOWVQTjdhQjFkUENQQzlmOGZxUTVaNUNiMFNBUlR6?=
 =?utf-8?B?TWI5d3NVcUREUzBOL09CcjlJUHBnOFEwWEh1ZjF5cXVISGt5YytPVitNS2lO?=
 =?utf-8?B?LzhPUkQyTDVSRDk1UEYzUzFDd0wyMzRqMVVHUTJJOThIT0EyemZRYkpqTFdF?=
 =?utf-8?B?SVRCS2tPNjlLam54NXU1VCt1b3RSVHVaaGNZZjc5eXdBcDJ6Y0RzUkM3L1lL?=
 =?utf-8?B?SFNXTGY1azZEQ3lIWlVjVCtFREl5SHpFSTJoMFZlT1RnVWYwQTZUa0JIOVRn?=
 =?utf-8?B?c3RxSjZqRDBtN3hDN3Exb0NhSEJkNnFQbDRTQTNjVFQ4Y1MvM3ZJN2R4WEMx?=
 =?utf-8?B?V2I4L0srNFJ4dmlzMk5YMnpXL24xT1U0QWlNNXVKOFJJd05IWE9hZU9LODlD?=
 =?utf-8?B?WEZpYWNWVVNTK0lFaUVsWTBQOVZIWThsampyMGtVc2dOUVUwMlVQbmJ0U0pi?=
 =?utf-8?B?REVsMlB5VE44dUU0bVl4dCtsR0hrODdHR2RnVGJHRlc5d3BqQndiTy9FMG5C?=
 =?utf-8?B?aDQ5b1NSdklVNTZyOXdGS3dNL21oK2tYTzgxVHo3cFNKcWh0c3NHMWYvR29k?=
 =?utf-8?B?TGFHSDg3b1hUYVU3VVZDTW9RR3JwRUQxZXhReldXdHNUY01JaTVLVVBXNWlh?=
 =?utf-8?B?bThKSjVHTDY3MTh1SU9WRXZBNnk2endDSTlHSGY1MVRodU9JeW5iSUtjY1lC?=
 =?utf-8?B?dVR4SHNUeFcxNG9hbVhXakpkcTlHb3lCTWRnQ0JPNjR5M2ZBMHJQTlo0MlN4?=
 =?utf-8?B?aUJnTGZBRC9OQS90QUxMbFV2aUFhaWVnVmpOekpLS0xSLzVHNGsxUTMya0VP?=
 =?utf-8?B?WWNWRFNwelNuN3k0Q1BrU3IrZlhETWVuMDVoVlNwUm1uYXBCZysvVDIrYjda?=
 =?utf-8?B?cDU2TisweWFXWGw1Wk4yWDRtRHdhVk9BZXFxcThIRVhPOW1zVDhUY3NDRVZo?=
 =?utf-8?B?SWVUbkY5Mkx1N1VPTWZtaGVqb0xTM1YxYzVnRU9UNVRPNVdOR2Jhcy9vVnNJ?=
 =?utf-8?B?UmFYR0RMWEVsbWpnSDZNcndrVUhKRFQwbWtncEpqb0liUDlsLzBxTTN3M21x?=
 =?utf-8?B?b1FObTB3ZnQyb3R0ZlR3clhCeDY1M0s1RU92SGdwOUJjTlNqeEU5dDV0UVpQ?=
 =?utf-8?B?WW1WWlNCUXBEL2FiRzdKbFZxV3dCSzZlanczYWx4NHJxYTE4MDg4OXdMVkdX?=
 =?utf-8?B?VTdNOTJwck9KL3ZyZ2NyNXhlNEgvV0dpRGxzN0ZzTFVxdEt6YjgxdHZZUEVo?=
 =?utf-8?B?SDRUbkN2TW85N0pEbTNrQXdXaDNMSXlWRDVvRW9PQm43SXIzVlFBNXFsY3FG?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43AA1CE42972DF43B75C79C4B50E8E03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86999d37-1f71-4b23-e919-08d9bbb5fc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:20:54.1700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /EZXf0xjQl59WNVX9/ZQKLQyeILAw/winmt6kNEb73WtlseoUVAGDTuFcmtKFj2Dgu0erd0P9ss5rNhCUcdrgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4178
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

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBJdCBpcyBu
ZXZlciBtb2RpZmllZCwgc28gbWFrZSBpdCBjb25zdCB0byBhbGxvdyB0aGUgY29tcGlsZXIgdG8g
cHV0IGl0DQo+IGluIHJlYWQtb25seSBtZW1vcnkuIFdoaWxlIGF0IGl0LCBtYWtlIG5hbWUgYSBj
b25zdCBjaGFyKi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUmlrYXJkIEZhbGtlYm9ybiA8cmlrYXJk
LmZhbGtlYm9ybkBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC92Z3B1LmMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L3ZncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMNCj4gaW5kZXggZmE2Yjky
NjE1Nzk5Li44ZGRkZDBhOTQwYTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC92Z3B1LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYw0KPiBA
QCAtNzcsNyArNzcsNyBAQCB2b2lkIHBvcHVsYXRlX3B2aW5mb19wYWdlKHN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1KQ0KPiAgICNkZWZpbmUgVkdQVV9XRUlHSFQodmdwdV9udW0pCVwNCj4gICAJKFZH
UFVfTUFYX1dFSUdIVCAvICh2Z3B1X251bSkpDQo+ICAgDQo+IC1zdGF0aWMgc3RydWN0IHsNCj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiAgIAl1bnNpZ25lZCBpbnQgbG93X21tOw0KPiAgIAl1
bnNpZ25lZCBpbnQgaGlnaF9tbTsNCj4gICAJdW5zaWduZWQgaW50IGZlbmNlOw0KPiBAQCAtODgs
NyArODgsNyBAQCBzdGF0aWMgc3RydWN0IHsNCj4gICAJICovDQo+ICAgCXVuc2lnbmVkIGludCB3
ZWlnaHQ7DQo+ICAgCWVudW0gaW50ZWxfdmdwdV9lZGlkIGVkaWQ7DQo+IC0JY2hhciAqbmFtZTsN
Cj4gKwljb25zdCBjaGFyICpuYW1lOw0KPiAgIH0gdmdwdV90eXBlc1tdID0gew0KPiAgIC8qIEZp
eGVkIHZHUFUgdHlwZSB0YWJsZSAqLw0KPiAgIAl7IE1CX1RPX0JZVEVTKDY0KSwgTUJfVE9fQllU
RVMoMzg0KSwgNCwgVkdQVV9XRUlHSFQoOCksIEdWVF9FRElEXzEwMjRfNzY4LCAiOCIgfSwNCg0K
UmV2aWV3ZWQtYnk6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVsLmNvbT4NCg0K
