Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E96A12DC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 23:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A638B10E373;
	Thu, 23 Feb 2023 22:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D500210E366;
 Thu, 23 Feb 2023 22:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677191958; x=1708727958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q+fMGU4wtqoGux3Bi93jwEeHFvgRkGTfbgWQqS+OF/Q=;
 b=j3x+h1dOtFjwwc2xJcp4vJ79K5Sb04e3djatAtWuIMD32rrr1B/NoEvL
 UgWrqTeVPg/wCwCIUmXy5xd0viv4BWsSFGqtqx5OBPa928kDeZ0bwPw5K
 WSiwm6OBhpfFRzclqtHRqRm4YBwS/qwd6pQLuxGVYqEE08vpdKSyd+OPJ
 wYFVvIL9dLJxG1qxNONe3ApxE6UqeR7px5jkV6rSxhPj6It2oIWontK1+
 HoxGib7ShIukqUMjnHsrOWH2mS3r8U5KCf8qCmiCEytuFfepiBXdPHIXP
 p5fCjsnwXnT1NjKUnQ/txMH/xA98aNciWC33xPicUzi+bUKpAo904b7aH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="334756516"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="334756516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 14:39:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="650158005"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="650158005"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 23 Feb 2023 14:39:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 14:39:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 14:39:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 14:39:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 14:39:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ9LgY+dimXxq2ZQ0f+dhVtI/6Cj8piZbdw1syt6wLByvZfgc9hAfZzDm/FoCnQ9KdCyuZNIfFle24rKjkputP9Aa8Z+dm06MpPOUeTrZ6Z+PbfhqmB1CRUFSqZ1WjYPhQn8oUpxjZuLKjvbVtochPFANbs71zp+neOmoc3zKj6UcwpE1DEbnZ5BvgUz6iMVBJkD0IB+NDQpMQq48bY8yr2aftyCSBWS3ClMqA7Q2guqwkdJFcD2TM7bKOHDJoijeZHUgoJD71r3Et8n6HnvFaUFoL9vveL5FErBrwVicvs7TkjsZTNhkA0r5rQtvKAjFxXwTSNofv7o8QHaZT35gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+fMGU4wtqoGux3Bi93jwEeHFvgRkGTfbgWQqS+OF/Q=;
 b=Qn6xKUuRu57vSEUwAJ8xWEL4iP18sh0T0kKpVLRB5mkYtJ2zZfvNwVhIae0sI9bfhPs4Xno8+PAchDoB7i6Btw8nJpKGZAV4mu7qLYyW5vx8NRlzDxdwAaGGP8AxME9Vbo24nq+o2fbcbjg4W6ZA9A3yM0/dnbG+SEkbSeEutA8BQnwwxqnTfo6ZLJLjNh+g+5xPpFmM/d046Boi6zKcmQBIY3pqvo7CKy3Ef4AAlVuHQ4G1yz70fYn7zd3RyDHEtKOLyoy+bq4b/0RgSzW1UD+xehTuOsWAHlUKR77hOhZRM4wjE5pHHXmgbLnX3oDYtOtoin41yykLHdczB/KYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 22:39:11 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 22:39:11 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Topic: [PATCH v5 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Index: AQHZQLy8dSmZjfcHoEa0mqcErnEcV67dLc4A
Date: Thu, 23 Feb 2023 22:39:10 +0000
Message-ID: <ec30940b480855431cdecacdb6d4457a5ed5ee9b.camel@intel.com>
References: <20230214213844.2890382-1-alan.previn.teres.alexis@intel.com>
 <20230214213844.2890382-6-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230214213844.2890382-6-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB4975:EE_
x-ms-office365-filtering-correlation-id: bb7f3e6e-3b23-4577-9133-08db15eec83d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mr4NZxnNE30ZB5fVFgT00HRBEDCNKk/IYij3PbaqBGwrX4lhDuvW+alsVDeakUApGvbLqzXKvuYXQB71c9k/tZ3aTkTMELTASawcL/VrKnwB6jcLaODqD8Dc3I2ddeeSS7+z/Bo3J6VQSqu8mYuKqL1DfeDOJ/eiVNN6G7QYVeEP3W3tEqxPhtDx5ZG2RBvAzuGc4bm8EQzygr/FoIqd0BDBF7JXKVFvhmimFewcAAXJW+0nrPVEnq8IJlb3RVrrXRW+Smm6HTUTmBnpG/l0RHpJbx8xGGxtS0kNLqxCmSMt7i3eJmxVsDEKps8xk/jigPUZyHjTNfY73e83rlJMQhb0ERFV6lV129YqfzJMRammsTTv7RLMw9E/j+NC+yLEF4wYoVz+CjgmK40ggj93zkz4mVbulE37ONAotRiU7WBOsTeuE7FgVjRYHkiYgX8H/BOY5p9wPx2zLS5HraskMXStFnm8lh7ebNPfjPEJv6PXJV4EyJf5vTAB56ZvNGyVK+yJiZMi6B2VnzdNrkclMx8ZWCDDsfGBQ0qBVzT4ABP9UH+OGCH9ALKqYJxGmLTSS1k0uMrb+UBYdhCAy6njdeM5tTXR5XFW3dT56UsUyPVW9QKiwzoRF+NbLQ8wNpaTaDDc0dLRYWmhbONoM2SctTm3Ye2BcAesQ+rEp1iH0P3afEVrDgRgRVwY3Ti320O9xyct5JXkPljxgoGkVh9o2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199018)(2906002)(36756003)(5660300002)(83380400001)(38070700005)(26005)(186003)(6512007)(2616005)(122000001)(38100700002)(316002)(76116006)(82960400001)(8676002)(91956017)(66946007)(66556008)(4326008)(64756008)(6916009)(66446008)(8936002)(66476007)(41300700001)(6506007)(54906003)(86362001)(107886003)(478600001)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REVWOWZwckJrQjhISjJUYUVYMUpxdS80K0dEME9ETzZoN1UrRDR3WFJxRFl6?=
 =?utf-8?B?dlVvOVFoV0tYamlhWW9SMkVYcEhsYkJ0UWRYMHB6d2lmek1XZ0Z6WklZQlRx?=
 =?utf-8?B?SnhCeGZHdlZPTE1TeDd6WVNReFU0bFk1cjllWHk4R2YxL3N2aDJEaHJSZDBk?=
 =?utf-8?B?UnJkKzllblErM2pZa2dZTW0xSm5wTU5uZXpoV3hxUG1xd0JIbm83c2t3V3BM?=
 =?utf-8?B?MU9XT3hDdWRSK1piZ0lvRENJRlhHN2czdkdaTHZEOHpuTWlIS296WnJ3ZGpV?=
 =?utf-8?B?dXkwbmV0UXlzV2JFNmhIRW1JN2tBditINGk4bVQ0U2FNVk8zWERvWjg1Zmhw?=
 =?utf-8?B?NEcwTy9xVlc2dUtGd3RzYk92ZnVkVTNBVm94UWVSU2E3eWNFZ0hJZFRrMWxV?=
 =?utf-8?B?U3NGR09lUWV6MVFQZzZuOW5GQmUrd2F0M2hkdFlIbXFLYzZxZ1QwNzFDc3FQ?=
 =?utf-8?B?Yi9QQW4zbnBBYjJzZ2MvbitZUjBXakJuT1dITTVQWFVGYTZiRlRFU2l4LzVV?=
 =?utf-8?B?b3UvRy9nbi9FUWZ6RE10TWtVTlVWdEFPaURrRXBYSy9TY2MyS0FKTHNaR20w?=
 =?utf-8?B?d2dtRVUydzJGWGpMUTFvOGFlOEdyMUhTOFh1cHRzYjJ6aW5vdG94YjdDZHFs?=
 =?utf-8?B?cDluUjRPWThWWTFiZFNaSkZDUGVId2JONTBhR093RWM1WFNFVTVKNkR4czdv?=
 =?utf-8?B?KzEzUDVWVWJzMzBtWEJ4NXhlWG5kSmZ1SHV0c3hIdGViTDB6M1BZK1lBM3RF?=
 =?utf-8?B?bktoelBiZ0xXRGxycy9LUUFyTzFsdk1OT1AwaGt4ODdEOEowNDNhbjdNSWJz?=
 =?utf-8?B?SzlyV2E3aWp6c0xLNHRXK0Z2UU5qcmFVaUJHaVBiYUttN2QvZ1M4RzcrZXhS?=
 =?utf-8?B?aURIZHpwbjlUODI1OFFnTitlM2FXVkZhUkY2Yys3S25TVWNhelNLTnBjYWtT?=
 =?utf-8?B?YUk0QmYyZzRaVmxTYjMvbHM4Q2pHbUkzZENpaGE4VEhNbFlqUWVzWHY0dWxt?=
 =?utf-8?B?Y0VaRlpNOTYyU1NNZ2ZFdzJxakgyMHFyMHZmLzFYcDM4Smk4Q2thaE9IZWF6?=
 =?utf-8?B?VFFGREJOSjlKbktRTUc3VTMyYWY0NXQzam83QXhGS05UN29ud203dXNDWFJ3?=
 =?utf-8?B?aWY0KzN2N3Z4OTRERFhtQ3BuVTRMVFpkbUZLOUY4TmdKQVhkdEJnTGMySkVS?=
 =?utf-8?B?Q3RLNEg0cWVxWXZnNUVvNGNiakozNElWZEhzYTAyZGxSQTFBUTVveWN2U1l0?=
 =?utf-8?B?aFN0M2ZwRzRmMDhBRCtXT0JueVNpcnNQTW5RMkdLQUh4TlVxSURyWURDOGhv?=
 =?utf-8?B?R1JUb2hsV1BrL1BpNXpCN0s1ZEFhajU0MHhlaG5oVmNHd0dTVFBpZ2N0ZUhV?=
 =?utf-8?B?SHE2d0Y0alErN3ovQWtWSkpRUWRTRlVrbnNrdEt6S1Z4emlKNUlpNFcza3gr?=
 =?utf-8?B?eXN2SWsrb1R4YjU0MCtwdzBPMUluMjBDNG8veVVUbWxlcUlyNmc4RjRoUTRJ?=
 =?utf-8?B?Y05rYmh1ZFZ5enJiNU1mcndPT2xQU1RLaUhpc1N2T3IvZDl2YmJqQmdiZnEw?=
 =?utf-8?B?VkpVbzVGTkJxbHVTcHZVN3lTTElDbUM4RTVIeFJUSnBtbCtETGlJcFo4eHdY?=
 =?utf-8?B?Q2FzYTQ0clVLQ3pabGMrSHpuZG1TdWZ1WTRyMGNOUEx4WUlXWXRBYVc2OGVv?=
 =?utf-8?B?TnZDTnk3NjVxclFzK1dpS0x6S29UTVRBNnJrU0swTUVtVkxxVTFlYnErZzFx?=
 =?utf-8?B?UkpVNXIrOEZ6aGI4b0JNZTJFcS82N3BoV3BZNVFnOGpoSEMyMDljYlhpR3lH?=
 =?utf-8?B?RjN4eEFXdytGWUR5S0lRZzd1QUl3eHM0RzNPN0tLM2lCNlZEanVJV3V6V01r?=
 =?utf-8?B?Y3dXd1VoVlZBQi9OSExMMkNLdnpSQ21leHlHalVLZXdHcHpXcEJMVUJtWi9i?=
 =?utf-8?B?bWg1MWdJbkZVZ1l6SUlzSHU1NUtKaDVXS0c1dERZMW5RNzhxTTNzY2hvWXl1?=
 =?utf-8?B?YkFOUHZaL2liZ0cyU3VYNW9zVWtMS0k0WjNnaVcwazJvcTdiSUdBamZ1NFlu?=
 =?utf-8?B?QjdrWHJ1RXhYellUK3RXREx4aHh1eFJvU1RPZUVMWlE1SUlYMGxrazRLd0JQ?=
 =?utf-8?B?NVRsSHhJdUlRQ3BmTldxakhlL252QjV5RWJiNlc5bHFzeVFZVjdlUkNuc29p?=
 =?utf-8?Q?eS27wSgZmlOi083vAOQiDwADHEsWjYXQbLAp99U7r3dG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4817A7E59DE86B4CB03A47FE0BC12CE1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7f3e6e-3b23-4577-9133-08db15eec83d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 22:39:10.8310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udfem7GlasUoxICsXCZ9ulSvWjxLoQEk5Cc9vVRRLOlhHipD5U/uRStySMz/3+ymuflFnKUaBK04G5RjLZxjQgf/qQdLebb+NFt14JsNA/jcAnsZAD43NyZZotbbDpkt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAyLTE0IGF0IDEzOjM4IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBZGQgTVRMJ3MgZnVuY3Rpb24gZm9yIEFSQiBzZXNzaW9uIGNyZWF0aW9u
IHVzaW5nIFBYUCBmaXJtd2FyZQ0KPiB2ZXJzaW9uIDQuMyBBQkkgc3RydWN0dXJlIGZvcm1hdC4N
Cj4gDQphbGFuOnNuaXANCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9w
eHAvaW50ZWxfcHhwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwLmMNCj4g
aW5kZXggYWVjYzY1YjVkYTcwLi5jMjVlOWZmMTZiNTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9weHAvaW50ZWxfcHhwLmMNCj4gQEAgLTM1Myw4ICszNTMsMTMgQEAgaW50IGludGVsX3B4cF9z
dGFydChzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ICAJaWYgKCFpbnRlbF9weHBfaXNfZW5hYmxl
ZChweHApKQ0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gIA0KPiAtCWlmICh3YWl0X2ZvcihweHBf
Y29tcG9uZW50X2JvdW5kKHB4cCksIDI1MCkpDQo+IC0JCXJldHVybiAtRU5YSU87DQo+ICsJaWYg
KEhBU19FTkdJTkUocHhwLT5jdHJsX2d0LCBHU0MwKSkgew0KPiArCQlpZiAod2FpdF9mb3IoaW50
ZWxfdWNfZndfaXNfcnVubmluZygmcHhwLT5jdHJsX2d0LT51Yy5nc2MuZncpLCAyNTApKQ0KPiAr
CQkJcmV0dXJuIC1FTlhJTzsNCmFsYW46IEFzIHBlciBvZmZsaW5lIGNvbnZlcnNhdGlvbiB3aXRo
IERhbmllbGUsIGF0IGEgc3lzdGVtIGxldmVsLCB3ZSBzaG91bGQgYWN0dWFsbHkgbmVlZCB0bw0K
Y2hlY2sgaWYgdGhlIGh1Yy1maXJtd2FyZSBoYXMgYmVlbiBhdXRoZW50aWNhdGVkIHZpYSB0aGUg
ZnVuY3Rpb24gaW50ZWxfaHVjX2lzX2F1dGhlbnRpY2F0ZWQNCihhcyBvcHBvc2VkIHRvIGlmIGdz
YyBmdyBpcyBydW5uaW5nIGFzIHBlciB0aGlzIHBhdGNoKS4gV2UgYm90aCByZWFsaXplIHRoYXQg
aHVjLWF1dGhlbnRpY2F0aW9uDQppcyBub3QgYXZhaWxhYmxlIHlldCBmb3IgTVRMIG9uIHVwc3Ry
ZWFtIChidXQgdGhhdCBmdW5jdGlvbiBpcyBhbHJlYWR5IHVzZWQgb24gQURML0RHMikuDQpFdmVu
dHVhbGx5IHdoZW4gaHVjLWF1dGhlbnRpY2F0aW9uIGlzIHBvc3RlZCBmb3IgTVRMLCB0aGlzIHNl
cmllcyAoaG9wZWZ1bGx5IG1lcmdlZCBieSB0aGVuKQ0Kd291bGQgYmUgYWxpZ25lZCB3aXRoIHRo
YXQgdXBjb21pbmcgc2VyaWVzLiBUaHVzIHdpbGwgYWxzbyBtYWtlIHRoaXMgY2hhbmdlIGluIHVw
Y29taW5nDQpzZXJpZXMuDQoNCj4gKwl9IGVsc2Ugew0KPiArCQlpZiAod2FpdF9mb3IocHhwX2Nv
bXBvbmVudF9ib3VuZChweHApLCAyNTApKQ0KPiArCQkJcmV0dXJuIC1FTlhJTzsNCg0KDQo=
