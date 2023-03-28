Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8EB6CC8BE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C3A10E0A6;
	Tue, 28 Mar 2023 17:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868CC10E0A6;
 Tue, 28 Mar 2023 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680022980; x=1711558980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=es8IsF4ZlmqPSkurb/pj+EpveSaoGe0muquf7tEhONU=;
 b=eqhZvucwOQy+3PKX22+tfafYRwBPWUje1mvVGR42kqY/GMiDJR//D+Hk
 +Oa9c6tr2CLA2LwZrrhQ1AVahQv7mDCAgVxNhShkXpxkP7e7ntgumdwRo
 5nQ0jYjuu1UpYWKy1aqTGZ2LVokp71DAkVU4hLuESeuXL0czPOQg1ToiT
 27cQjriDkQhyNBZ3FiDY8ya0mGfQP64NGzNb6Nt8gQvlqmOkJ0vKFd31C
 8EEPWruUCduYsAwFTEViwRZPtDl3ZBczscnjnl6Je3byFS4QhIG4qKNxl
 cPUERlqWV459Dx0XTrsVxmW1O27IpcsUqeJ6L6sZqkZRgiRYwwjsvIWG+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339354130"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="339354130"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 10:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="683964151"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="683964151"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 28 Mar 2023 10:01:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 10:01:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 10:01:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 10:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlQjnIGTgESZAV2qPQ5uTbm73AXllh6mooyYAtO3t8hFvw/TC/xd61qmmYWsgeCYfFVjQJXQy+QHp7llxIc/8i+S06T2F9f5aM2m8ELI7N8bqwFgmI832PPTmy1MLg+sn+uWVO2+Yop0wZ0YYRqp2f8mDevvWHKcLarnkuJkp76DlT3yjmxCHs2suOib/zARDW9ikZjXBDQ9jK+MExa7R8zJyVTgu1laLnHbCm6okY77A0ow0mb3UoD7SPvJf/ZMMdTHZk27iK4PdeSF7WwHK0ef1UAvQfRpL96UL9dMSqTORsnTPqIOCxMbhcFW4Yjarc5F3qAJcLvERJ/0Hfl7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es8IsF4ZlmqPSkurb/pj+EpveSaoGe0muquf7tEhONU=;
 b=aLf2ORz4E9q7qtidcJCXxm+5XVT1jT+bXry14SM737sq+RohG7NugUZSZZdCR3xSM36HuMUukXgQkGSq5b8y+1C9ut2d6qN/r67sP0zV5LIMY5uUZ+bLHYWK6hUDXfcithxZoC5bqLH6nZYGdqgzTvAeycCJVQXUJwkj5I4tPDDUYBtVPpJq51fo6DS/UQY8i6bFS1dLf5p7lCRB1XN2GgQj34xYpn/2DZ35qxnEUYYasSAUlV6/WLnXNV3vSXtkBujPyhJqGHlmmkO7KbS0Yjh/jpPxbPO9SSBXFBgvvxPD8RLzX4kJMK9trXyLqlfYyTfF9utZ3Np0f+LPoRsqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.28; Tue, 28 Mar 2023 17:01:36 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%4]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 17:01:36 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Thread-Topic: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session
 creation and cleanup
Thread-Index: AQHZSxtxSfUqWny+hUmFCBmRtOC0Wq7p3LIAgCFQjwCAAeX0AIABTCEAgACZHYCAAZ87gA==
Date: Tue, 28 Mar 2023 17:01:36 +0000
Message-ID: <3359c9d371a25710891352061693637b37679734.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com>
 <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
 <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
In-Reply-To: <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7083:EE_
x-ms-office365-filtering-correlation-id: 07027149-ef10-4bb6-b278-08db2fae1768
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RgL1uR+MZ9bCnWxNFkheI70dn8yv0LCOW3WbOwM0yrqAKeONIo2fhOA5E4/TzDMWraG3791kl64lhubTI0x+gjwVALT9eNOpuBUKk2Z+S5as3+vOUIWcbUKOxqaLBij+pNlmuJfz3szA64cwA3+JC9dYkPKIYUCsPh09QLuMm5cFVvAoVbaC1eQ+0WjikAw/2biG/cdkAjPjsKx23l1mBn2tfSBTlpUFBWcKnwByh+rMu+MU33ivGsoBt+WllGcnY6KRVgR+B9qE/XtQQ1QZUQC6mgr8stAfnIk6qz2TqFD20DRPYim0Zzl1dwSaJdWoE6tM8ML1IypHPvx/Tr/uXd7PpTF0LkfhNnnwkANoNjC+VtsOaSUT/ONuVajfFsavISZ+BmuLDQJJwKMfFhobdP0Zr8TiXWn16lPSx89bgNlUUtaXuPfa9ArxYJ0wJ3v4Alrapoyi4nfFpKBEz/WkJSfvXJH2R/g8VUTAhFS6bZU7EhH7Zu7NlBeR4yy3QuqMRH68QaBX8BdAS4q2Obe28pfJTFDc7h0cLfdvfcSOi/mLrPLaSV1Dd+HqtevSqN+ixo8oj6UwgWDqS1aSVx8jEJL3KaBqBNfDnz45U7vO4+Z0BMZQQZUJZ160WOLyQzpg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199021)(8936002)(91956017)(83380400001)(2616005)(41300700001)(36756003)(86362001)(38100700002)(66446008)(5660300002)(122000001)(6486002)(82960400001)(6636002)(478600001)(71200400001)(76116006)(54906003)(66946007)(66556008)(2906002)(8676002)(64756008)(66476007)(6512007)(4326008)(186003)(6506007)(316002)(110136005)(38070700005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTVuRXN4Q29WTzhIaWpjbzIzdTBSV2NhVkJJNitYeXAyZlhtU0RQRzVtU2c0?=
 =?utf-8?B?ZUs4RCtlRlJYaFRQdFhvZG8ybjlHbkg4RDNsc09DWHZQQTdtckgwREphVUpB?=
 =?utf-8?B?ejFOVm12OEFqVmVhRHlSRStWUmVOT05Wei85aGdxSGZIUFZwSjhCUUg2cExu?=
 =?utf-8?B?RmYxV3lvWmtNQUVBSnEyZWlsTTBRVHQ1eGNVUFR5OXpnZU5ERm51REZIMHlR?=
 =?utf-8?B?WllpOTBzaXBRSklPS3V3VlBMWTlTZWsrbVFmZGJHdU1NZjBxYUlZWDB1MldR?=
 =?utf-8?B?WjIxdThYQitsNjk4Nlp3RlRvMkZWaFJ0VDB2WHpnait0NVlYUWNzNzNmU3lQ?=
 =?utf-8?B?cXpmVGpOdlk1eEFOQU85enMwM2ZuS1VwT1pjTjNvTVRnQ1VKZ0NTb0hzbjh3?=
 =?utf-8?B?Y09HYzRkY0NBSjdNUllpSGhVbG1hOFBnQ1Rwc3Z6aW41S0FnOTRqcEtmYy9s?=
 =?utf-8?B?UFBIMjZJQzFROWtTWXJna1orRDVsZXpFWDA5dDRpM1JZWk1KZVZxbDNCQmFh?=
 =?utf-8?B?SUgxWjZ1UU5Sek1sTk1palpIeTNLc0Zmd3NGemg1TnlBOFBiaiszV3oreU1l?=
 =?utf-8?B?a0tHZ1ZnUHZrSUhKWXBVQ1FTdjhBbVNkUXhlNHhxbHJ2RTBuL1M3TUQ1dTdK?=
 =?utf-8?B?dWRYMXBjdjdhQ3czRTVwQUZPVHFUenVTZmphem1xNnBaZG5WZFdra0VNWFJi?=
 =?utf-8?B?eEZIYXpZeTkxc1I4QzhUTDA2RjRNa3Rwc3JwRzlQYzBmVmM5OVlyREg0cmVU?=
 =?utf-8?B?Q3psTHNXTkVwS0JmMUNlL0FqVXJsK2l6cGlMUVpkaitYRlEyZ1lXcXlNTGZT?=
 =?utf-8?B?UHZFc01mSUZsK2Q0dFJaNDF4eWFFZ28rbFJYZWxod0lQMktCNW1VTS9OaHJ5?=
 =?utf-8?B?TzZBTElwVEdvdGpHbi9mcW8xelRoTWwxK1BNejd1TjIxRkZKNmlkdGl5RlRI?=
 =?utf-8?B?UnZpOTJQR0E0L3Z2Ylh1R05wMmExV0p0U2NINEI0bFJyU2xpK1R3SDB3TlZw?=
 =?utf-8?B?b3VPejFaTUNTbWZVdXdMWDhKelFMc0g3THZnVUkwcFQ4QUFTY05JbWtxWkV3?=
 =?utf-8?B?MGxFci9MS1dPWXk5TXRyZ1RuL09HckNCNVVjODRRQXU1dk4xdTBTS1Z3S2E4?=
 =?utf-8?B?OVMvY2JEZit6cEFNMVhTKytQZzBYQnA1KytabnZBcHVGRUNvdEFkQytheU9n?=
 =?utf-8?B?NnRwTTFzQzZKOC9RMytucVpQZGEzYkdhNDdOLzdjaW1LRHZZWkRuSjJxSUJt?=
 =?utf-8?B?K05NZnFmUlUvRkJTYlNDY0t5VFhVZElhODB4MkRNdytWWFFYdjBnWUtKeVY0?=
 =?utf-8?B?VWJOeUJPRlZLZStJQ3lTd0x3NExFR3NZaDZhZkFVL1VFcjV0YlZEKzVpU0pE?=
 =?utf-8?B?aVM4akY3eGliaTB6UHdDN0ZoNEFDYmhBVUJPN1FIejN4eTEzS1c4QzJxclpY?=
 =?utf-8?B?eVA5bDVXb3pRNVdXYzFvSThXSlluQmVxNHdJV1lhN0xEZXIzN285YXR1ekZQ?=
 =?utf-8?B?ajllcDRxVTFwam1ITmtGMzFicEEzb0Jiak9PYjZkUE9paTQrQjYyM0lhbERp?=
 =?utf-8?B?dTg5OVBHZ1dVUmhMRTgxQ1dDWmEwTGZXRUxsSjdrdC8yRTNmS1FLR2haMXpQ?=
 =?utf-8?B?dTFweFM0WjY1NHYzSzNmTmtZaGlQcW5HZjZ4VGFMOGtTQllFZFlOU1M4SjBK?=
 =?utf-8?B?VHVkWjkzU2RWZlhadUJldEpDWXU3TEVDek5wc0tuMkdkVmVVVEp1Zkx5bTFw?=
 =?utf-8?B?MjNJWGZPMXRyV0k5VkVCLzRkbVNwOG9ET2g5UmxyaHYycmZ1MGJpM21GZStv?=
 =?utf-8?B?Ky9DL0Rlb0hNSUJ5ODZST0x3MkRnV04rN3J3aFlJOE5ZeklQWnZtcW5CMEZh?=
 =?utf-8?B?cnBEY0tWa0RENGNrZzZab2wwODBTVFA5Y0pvR0p1Y2M4SUUvUU5kTHZnQnV4?=
 =?utf-8?B?UkJITE16eDQvUlpPVEc1U29QQW1rSUlmQTNEVEdzbHJjaUhPQXhSNEM2bVJJ?=
 =?utf-8?B?VXJib3lUVFIyR1p3amFTRU9vWlFldm5TNW93cGM4UEtwaVJjclQ0VGJmR1JV?=
 =?utf-8?B?MStJMWFSZFRiNVh6Nnd1UmlhUit2SmR0RFJQcnNpYmtlYTZhMkZaQldLMlNE?=
 =?utf-8?B?NkdTdHB6YmVySHo5cW1iRUVnNExHSCszb3JKR085dWc5clp3NXhxUC92T1RN?=
 =?utf-8?Q?FL/Zr/gFGLqx9CoqD+Qz22k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D0758A42E3696458E916BF06276A968@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07027149-ef10-4bb6-b278-08db2fae1768
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 17:01:36.6439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eG29Wd9TcCLYJmWPrGwrqz0UvXioM0Sh+ekWyk6EfY2QEJztc5KlOS2KZSUYHyQWdTIbh5AbHZHrkRxMjppdYHKM05Gd0//waq6q001sDFqrJImcnDtNb4nDJ3d6nkM3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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
Cc: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTAzLTI3IGF0IDE3OjE1ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gVGhlc2UgdHdvOg0KPiBlNjE3N2VjNTg2ZDEgKCJkcm0vaTkxNS9odWM6IHN0YWxsIG1lZGlh
IHN1Ym1pc3Npb24gdW50aWwgSHVDIGlzIGxvYWRlZCIpDQo+IGI3NmMxNGM4ZmIyYSAoImRybS9p
OTE1L2h1YzogYmV0dGVyIGRlZmluZSBIdUMgc3RhdHVzIGdldHBhcmFtIHBvc3NpYmxlIHJldHVy
biB2YWx1ZXMuIikNCj4gVGhleSBkbyBub3QgaGVscCBoZXJlPyBJdCBpcyBub3QgcG9zc2libGUg
dG8gdXNlIG9yIGV4dGVuZCB0aGUgcmVmaW5lZCBJOTE1X1BBUkFNX0hVQ19TVEFUVVMgcmV0dXJu
IHZhbHVlcyBjb21iaW5lZCB3aXRoIGh1YyBsb2FkIGZlbmNlIGZvciB0aGlzIGFsbCB0byBrZWVw
IHdvcmtpbmc/DQpDaGVja2luZyBpcy1odWMtbG9hZGVkIHdvbid0IHJlZmxlY3QgaXMtcHhwLWF2
YWlsYWJsZSAoaW4gY2FzZSBmdy9mdXNpbmcgaXNuJ3QgYWxsb3dpbmcgaXQpLiBCdXQgdGhlIGNv
bm5lY3Rpb24gYmV0d2VlbiB0aGVtIGlzIGh3LWludGVybmFsIHNvIGk5MTUgYXNraW5nIFBYUC1m
dyB0byBhdHRlbXB0IGEgUFhQDQpzZXNzaW9uIGRlcGVuZHMgb24gSHVDIChhbmQgdGhlIDMgb3Ro
ZXIgdGhpbmdzIGkgbWVudGlvbmVkKS4gSG93ZXZlciwgVHZydGtvJ3MgcG9pbnQgb24gdXNpbmcg
ZmVuY2VzLW9yLWVxdWl2YWxlbnQgaXMgdGhlIHNhbWUgdGhpbmcgSm9obiBIYXJyaXNvbiBicm91
Z2h0IHVwIG9mZmxpbmUgd2l0aCBEYW5pZWxlDQphcyB0aGUgcHJvcGVyIGtlcm5lbCB3YXkgdG8g
ZG8gdGhpcyB0eXBlIG9mIGRlcGVuZGVuY3kgY2hlY2tpbmcuIEhvd2V2ZXIsIGFueSBmb3JtIG9m
IGRlcGVuZGVuY3ktY2hlY2tpbmcgd29uJ3QgaW1wcm92ZSBVTUQncyBleHBlcmllbmNlLiBXZSBz
dGlsbCBuZWVkIHRvIGRlY2lkZSBpZiBpOTE1LVBYUCBzaG91bGQNCndhaXQtaW4ta2VybmVsIG9y
IHJldHVybiBzb21lLW5ldy1zcGVjLWVycm9yLiBBIHVzZWZ1bCBkYXRhIHBvaW50OiB3ZSBhcmUg
ZGVidWdnaW5nIGEgcmVsYXRlZCBpc3N1ZSBvbiBhY3R1YWwgY3VzdG9tZXIgc3RhY2suIFRoZSBj
b21wb3NpdG9yIHVzaW5nIG1lc2EgaXMgaGl0dGluZyB0aGlzIGNvZGUgcGF0aA0KdmVyeSBlYXJs
eS4uIGV2ZW4gYmVmb3JlIGdzYy1wcm94eSBjb21wb25lbnQgaXMgbG9hZGVkIGFuZCB3ZSBhcmUg
dHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2h5IGRlbGF5aW5nIGluc2lkZSBpbnRlbF9weHBfc3RhcnQg
aXMgbm90IGhlbHBpbmcgKG1vcmUgZGVsYXlzIGNhdXNlcyB0aGUgZ3NjLXByb3h5DQpjb21wb25l
bnQgdG8gYWxzbyBnZXQgZGVsYXllZCkgYnV0IHRoYXQgaXMgYSBkaWZmZXJlbnQgY29udmVyc2F0
aW9uLiBJJ20gb25seSBtZW50aW9uaW5nIHRoaXMgYmVjYXVzZSB3ZSBoYXZlIGEgc3RyaWN0IHJl
cXVpcmVtZW50IHRvIGdldCB0aGUgZGVza3RvcCBsb2dpbiB3aW5kb3cgdXAgd2l0aGluIDEtMg0K
c2Vjb25kcyBvZiBib290bG9hZGVyLT5rZXJuZWwgaGFuZG9mZi4gVGhhdCBzYWlkLCBpZiB1c2Ug
LUVBR0FJTiwgSSdtIG5vdCBzdXJlIGlmIHRoYXQgd291bGQgd29yayBhcyBpdCB3b3VsZCBkZWxh
eSB0aGUgY29tcG9zaXRvciBzdGFydHVwIGJleW9uZCB0aGUgdHlwaWNhbCBlbmQgdXNlciBleHBl
cmllbmNlDQp1bmxlc3MgTUVTQSBoYXMgYSB0aW1lb3V0IHRvIGdpdmUgdXAgb24gYSBjYXAtdGVz
dGluZyB3aGVuIHNlZWluZyByZXBlYXRlZCAtRUFHQUlOIChkb3VidCBtZXNhIGZvbGtzIGxpa2Ug
dGhpcz8pLiBQZXJoYXBzIHdlIGNvdWxkIGp1c3QgaW1tZWRpYXRlbHkgcmV0dXJuIHdpdGggYSBk
aWZmZXJlbnQgZXJyb3INCihpbnN0ZWFkIG9mIGN1cnJlbnQgUFhQLVVBUEkgc3BlYyBvZiAtRUlO
VkFMIG9yIC1FTk9ERVYpLi4uIHBlcmhhcHMgdXNlIC1FTlhJTyB3aGljaCBhcHBhcmVudGx5IGlz
IGFscmVhZHkgcGFydCBvZiB0aGUgb3JpZ2luYWwgcHhwIGNvZGUgYnV0IHdhcyBuZXZlciBtZW50
aW9uZWQgaW4gVUFQSSAtIGJ1dCB3ZQ0KcmV0dXJuIHRoaXMgaW1tZWRpYXRlbHkgYW5kIGRvY3Vt
ZW50IGl0IGluIFVBUEkgYXMgImh3L2Z3IGluc2ZyYXRydWN0dXJlIGlzIG5vdCB5ZXQgcmVhZHkg
dG8gY3JlYXRlIHB4cCBhcmIgc2Vzc2lvbiwgdXNlciBzcGFjZSBjYW4gcmV0cnkgYnV0IG1heSBu
ZWVkIGRlbGF5cyBvZiB1cCB0byB4LXNlY29uZHMgb24NCkFEbC9UR0wgb3IgeS1zZWNvbmRzIG9u
IE1UTCwgYmVmb3JlIGdldHRpbmcgYSBTVUNDRVNTIG9yIG9uZSBvZiB0aGUgb3RoZXIgZXJyb3Jz
KS4NCg==
