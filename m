Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23846AC47E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 16:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B77010E246;
	Mon,  6 Mar 2023 15:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA71410E262;
 Mon,  6 Mar 2023 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678115433; x=1709651433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J5HhqyOJ92jOaHfEuCU3G2Y2sdBX3KNKjEKyJ4WHTZQ=;
 b=eYv27Yb5ecLiXDodPtsWADc4JX+ClL+MSnSrzHyy9jgZgvDL8BWhdmss
 2gUJiu9T4AdW2+xlH6VXeFGoXDqgLheYl9Ef4zqIi6HCePgfwqh91DMJA
 4aRTM871cSGLZWvozDDFvs1zDX6/MpfyGne7XDJIOwMrwEpcM4P/jGG8w
 ncdhp7O3MsXe8NDrIGn+n+yzBfo5FN1y3ioOSitd8oCxv5KrlWSaW7Q0j
 G4C1+8SnDEmBoRGWcNuTG2FWSmjnRu/SKAjX23A99+OoRVxyPAg1SD5qx
 sUCDRxzKE2wCRSyg2RswY/lHlW+/3uz+cVhwBvbYsrm0AIgm/rw3/q5vK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337095032"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="337095032"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 07:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800022136"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="800022136"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 06 Mar 2023 07:10:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 07:10:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 07:10:32 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 07:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9lACaPxeNv97LGNrIpbJ9/6c854CNigTd1B0nEIEAOEArEQX3nGBDVNA++aFT/BIiTzd6tCdoAjb7nNTTvANbfkTu4T8KgfwZJ8FUznqDJBQyh2Tn8NMJ/NBuzf8o2oJawqDv+Ztx91qFFhcamDH08PuE8IAhU5m4Gv9mp7x3ATolr2GOcIHLDDFk/RXJ/DS++zNf4eTheNL3bUuF5lyrVCCGndC8Ss/Ue3ngJB6tEJPz/NirwQtdeiwhutSGD5bN1Z/xdEQQrUSmZ39eUB2xyGNg1o040WL+x3jOiAYM5hF8ed30blvCWDRCdNTntR0go4O/pQcx+vOENXIsk0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5HhqyOJ92jOaHfEuCU3G2Y2sdBX3KNKjEKyJ4WHTZQ=;
 b=g27RplfjWMDx4yp5tSoeEyEsDSELtd03FRigprI4FG5Q4h7pAYwRFPMiIxQseBEht5luYUkgOzb3xgno+nsjjRkQTmuZ4EzmiEYNKOm3PVr4+ecwslJe+aF3ZOAfCLI834cLoutwPY16xOhR8iTddPnEL6Rd63xFELnDGlblhG0HqB94vZWNZFFVZUXN5yaPyG1mvExPUVPpXBdkDqNTRrDg/U4qUVyeET4cE9givTR8Ei/vw/jQsw1YqntNWhbCKPBQi2lKEWkDM1aOSuJnnlIY6q9WN4kaPXnBh4+u1Gkw5fgrW9ROwL9EMQBICBeJ5bOX571JSIjybdhNlHILZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 15:10:30 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::d95d:e1ce:3fe2:c810]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::d95d:e1ce:3fe2:c810%3]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 15:10:30 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: RE: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Thread-Topic: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Thread-Index: AQHZTC1/WnLqn6sXAU+dslUEAfQ7j67mcmyAgAOG3QCAA+jOoA==
Date: Mon, 6 Mar 2023 15:10:30 +0000
Message-ID: <DM4PR11MB5971D04C95E3DF75BB0FBCF387B69@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
 <20230301110258.2140955-2-andi.shyti@linux.intel.com>
 <DM4PR11MB5971C15BE57E870387F7C1EA87AD9@DM4PR11MB5971.namprd11.prod.outlook.com>
 <ZAK56o+LEixn/zlt@ashyti-mobl2.lan>
In-Reply-To: <ZAK56o+LEixn/zlt@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|SA1PR11MB7109:EE_
x-ms-office365-filtering-correlation-id: e711ab6f-519e-4d40-aef9-08db1e54ecd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CNuTI8Otk8Ybb1B63Pc1We2TW3sCHvgCBNV+zb/z4U4nVGvBOKukMfTT+WVKFYaun8Oc8EpZPCyDBWHh854ICMmnx4imqHKk7wmkgrT1YtJkHbvMrjRkjlR9eDBWoyBWAk+WveG/OtROwFoxcz8roM9c93jDcclfFZMFH1dSqM4cuIN7tsr3NI7mKZS99P5I42Aotc3mBca+H02KLtU3PBD/G1qHaWJGF/rdya9GK0yikTrtgywcfX4tDOy3EVLZMVZycEn6iK/BtDwlq6uIaoexC8sz1TrFuUjniDbOWgmKIbCw608AeA52d+T4WukbzpY/fP0LM57X/PNko/dP/aWP2dPB0E5yLUHY8lZzj9z5+/zugH5+ZxF+e+zQLB5P42JUkZvL7m94oQOxd1QCoymhUKAbcypaR225H/mhUbpj9FQovG5+q/RVtYkz4oLS7/mcJREOlwIk8llQO0796lwrwK5OSbfUDaBjg212MeKC85ljsY73UcGojjNND1jAM8RZ3D4f7Mu1cunL9SmOZ7bDuLyHOlsjUAQnbQtbJnP9VOaOR6AvnfTCbW339UIKBXs3HM/5c/D+WAX0FlH0wzJONuJj5npqpsXwvdVSx+bHEsyfoD1LBhBqasWhYqC4JrkS9uzac3QrkgxfFuYDZHS81gKJ7TQhIMbtzlh0fDLZYZ9BIwdethBvOVoR7Xg+XUv+Qcrprs0/Bdq5e2JgQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199018)(6506007)(53546011)(38070700005)(83380400001)(33656002)(122000001)(55016003)(86362001)(82960400001)(38100700002)(9686003)(186003)(26005)(41300700001)(66946007)(66446008)(76116006)(64756008)(8676002)(4326008)(6916009)(66476007)(2906002)(66556008)(8936002)(52536014)(5660300002)(478600001)(71200400001)(7696005)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlhnNWNxZ0l3NXRqWGIvOTJZM3pLS0NSUFFhRWROVUJKSDlLZVlENVpRQm9l?=
 =?utf-8?B?TkVkWE1XbkRxUDdxTlJLVjFuRGhPclljREhtY1BzZE1SWnZhUDI1bWR1anVO?=
 =?utf-8?B?WGcydkNtcFUrR3NMaWRwNjNYMEQ1QVZKZURuelMwOUtCVngzN3UwNG8weHBV?=
 =?utf-8?B?SEgrTnlvSlB2bU9OR0FaUkRXcEoxNVBEU0JnQWdLNW1lM3pOWkxmM3pmOVVX?=
 =?utf-8?B?V0N5R0RWemd5dDROY013NmhQWjlEaGJYQnJSVHBOVWJBZnFhVHdqeFNVeWhH?=
 =?utf-8?B?d0hhcWhKRzRiK3U0dDRvcGZYS2JCUWl1aG4yVTZnUkUyWitPQk9sRGFPdnl3?=
 =?utf-8?B?Sks4cHc0Z0lqOGJ1V3Y5Rk9JaktobVN6TGQwbXFqckFqYUtnTitrbERLczF5?=
 =?utf-8?B?a3QxL3Q0R3BwT1N2QTEyL3J4REhBenMySUszSGFiS0YrVktYT1pVY0FXeExO?=
 =?utf-8?B?ajNMWEF0aElxTUVXdURBaFBoQXFYS2ZFbnlzOXZtSXhyNS96YytTNU1VcERh?=
 =?utf-8?B?cmVCeEZ4dllkK01ZREdQV2tubks2YmJ0c2VHSFptcnE5QzdnWTJpTXBGTlNS?=
 =?utf-8?B?OVUreFRFdVFtdFRuTFR5d2FRTC9aRlVJMGpPSDg4UXJPQXNUMklBZ3FXVm5j?=
 =?utf-8?B?YVkweWRUK0d3eWRSNlA4UVJGZmdJMEtBbWZOSSsyYkdyV1NxWlpSVUM4TEh2?=
 =?utf-8?B?aXB2cjJBb0JNdlV1UmcrOE1ad0Y5bEhLYXpsaTVDT2hhWHo2SVZuWlAzVHpt?=
 =?utf-8?B?dTZ0WU85SXpZOTNWaWI4ckNYdEhibFVNUGdvQ201eklWL3JtVDEvZ1VXZHJr?=
 =?utf-8?B?MTh0TGJQQWljU0JlZ2dLbW1sdnc3bEdEN3RUMjN0dzM2T2tFeFdJSnpXRWUx?=
 =?utf-8?B?WGpmeTlSY3A0WDgzZCtuT3pNOUluamRTdVZDT0NMcFhLM043QytxMWhmSG9Q?=
 =?utf-8?B?d1djY3phWVovTnhkY1V2Q1Z5Ly9QN3QyS0orbFU0a2FoV1dXRGE2OGtOSU9l?=
 =?utf-8?B?OU4zM2hzMDFiZzZ0ZU55YVA5cFNhUE5lMWdPNUkzd3V2NEZVL3JydmlYRzJm?=
 =?utf-8?B?OURGZVk1OVhTeWliNUhuNkNLVDlCNkhNdEtLK2pIRnh1TTB6ejdyU3lXSnkx?=
 =?utf-8?B?Um9mbE9VKzBScWUrc2RoNVlXSXBZZ2J4QXVzN2JlR2U3ekhmZHltMFE5dmw2?=
 =?utf-8?B?cXdxdXc5QUNRNHVaZXZvM21Qb09wK2pBTzhoMkh1RGluL0RLR0hUTVl6cXpx?=
 =?utf-8?B?UmZOZkErUEpHSi9VemNjUm5jRmRXTjFwbSs3N0VWYU9DQjR6eGowM3JMVWJF?=
 =?utf-8?B?WFBGN3R3YS9FZ0syTWNIQ3AyaitCWVR0S0FlM2ZCOFRORUZ4Y2tXbUxJVDlG?=
 =?utf-8?B?NWhzb0RzRWVxS0ZQK3R1aXBoMzR2NVhFQTlSSW9WLzJBZGFvUUhwTTBOZitw?=
 =?utf-8?B?dVJIZXBySDM4eWFYdGpBdHpZcWgvUnpYNDZjelk1SkxBMEhsK0tkVUR3dHQ2?=
 =?utf-8?B?WEZ3dXczSHk4Slc2NktHRUR2OU83Ykw1SHpEbTJEbjI4NGR3UnVqdS9yODBH?=
 =?utf-8?B?WnZ1elpPNjU0NlRsdWdrZXI5NXUwcnNpeXU0N1FyampFck5WUndrVXVXSHMw?=
 =?utf-8?B?QkhuZ1EzcjVCeVRnekZQWVNkNTAyR2VpdG0xUUp4bi95VEJRRFBuWlJNS0ZZ?=
 =?utf-8?B?UVA1dEw1UGpBTmxPa1RDWEUyS3BRRXZUVW41aGUrMDFYcHpUUnFya2tCSUtL?=
 =?utf-8?B?OTQ4a2hIaVFMZjFDSUlLZGZDK1d4Z3piaEY4Y1Z4dEI3OTZEcUFyam92dHZw?=
 =?utf-8?B?ejdQc3NtSDFnWlNJSDdRSW5xOTQzR0g4bmFwTXBVLzI2VXJibzExVGwwVnFG?=
 =?utf-8?B?aVRscm0rTlA1aVNRVXV2dHpubWdjMFArTUZYcjltM1dJaGhCSmY2REJRalFN?=
 =?utf-8?B?MCtMSmFVTEVWSWp4ZnA4MkErNDIvRXlJTnAxRXl1ajY5bWRaNWhFcmNRdXJG?=
 =?utf-8?B?SjdCTjIvOEd0ZGJ6bXdqWVhWdDRXQjBpS2tCQ2VQdER0NFJQM21HVzRTaHlQ?=
 =?utf-8?B?SGRJaTQ2V3V0ZWVvL3VUd0htcEVsRkxmdW1Ud21rQU9ud29WK3I3eUZ4Yndy?=
 =?utf-8?B?Z3U0dzBqNDh4Zm5sT0NDdC9oUllycmplT2lKbkcySUp2a3RhQ3VoNVFOdEo3?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e711ab6f-519e-4d40-aef9-08db1e54ecd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 15:10:30.1584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9XR+HTHebNZKkueMmr6Y/YT+ncVkLHjAeH6to8XtbrmkVHcoxMSZafepIMo/mgpRa8WmoXc53Fa8k29SQT1lxzcJcAMaoXXAmU/nnVVrRfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi@etezian.org>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kaSBTaHl0aSA8YW5k
aS5zaHl0aUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMywgMjAyMyA3
OjI0IFBNDQo+IFRvOiBTcmlwYWRhLCBSYWRoYWtyaXNobmEgPHJhZGhha3Jpc2huYS5zcmlwYWRh
QGludGVsLmNvbT4NCj4gQ2M6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGludXguaW50ZWwuY29t
PjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRl
bC5jb20+Ow0KPiBBbmRpIFNoeXRpIDxhbmRpQGV0ZXppYW4ub3JnPjsgUGF0ZWxjenlrLCBNYWNp
ZWoNCj4gPG1hY2llai5wYXRlbGN6eWtAaW50ZWwuY29tPjsgV2FqZGVjemtvLCBNaWNoYWwNCj4g
PE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEv
Ml0gZHJtL2k5MTUvZ3Q6IENyZWF0ZSBwZXItdGlsZSBkZWJ1Z2ZzIGZpbGVzDQo+IA0KPiBPbiBX
ZWQsIE1hciAwMSwgMjAyMyBhdCAwOTozNTozM1BNICswMDAwLCBTcmlwYWRhLCBSYWRoYWtyaXNo
bmEgd3JvdGU6DQo+ID4gSSBhbSBub3Qgc3VyZSBpZiBUaWxlcyBpcyBhcHByb3ByaWF0ZSB1c2Fn
ZSBoZXJlLiBTaW5jZSBNVEwgZG9lcyBub3QgaGF2ZSB0aGUNCj4gY29uY2VwdCBvZiB0aWxlcy4N
Cj4gPiBTaG91bGRuJ3Qgd2UgYmUgdXNpbmcgZ3QgaW5zdGVhZCBvZiB0aWxlIGluIG91ciB1c2Fn
ZT8NCj4gPg0KPiA+IFdpdGggcy90aWxlL2d0L2csDQo+ID4gUmV2aWV3ZWQtYnk6IFJhZGhha3Jp
c2huYSBTcmlwYWRhIDxyYWRoYWtyaXNobmEuc3JpcGFkYUBpbnRlbC5jb20+DQo+IA0KPiBKdXN0
IG9uZSBxdWVzdGlvbi4uLiB5b3UgcmV2aWV3ZWQgdHdpY2UgUGF0Y2ggbnVtYmVyIDEuIERpZCB5
b3UNCj4gbWVhbiB0byByZXZpZXcgcGF0Y2ggMSBhbmQgcGF0Y2ggMj8NCg0KVGhpcyB3YXMgZm9y
IFBhdGNoMSBpdHNlbGYuIEkgZGlkIG5vdCBpbmNsdWRlIHMvdGlsZS9ndC9nIGR1cmluZyB0aGUg
Zmlyc3QgdGltZSBJIGdhdmUgci1iDQpoZW5jZSBhZGRlZCB0aGF0IHdpdGggbmV3IHItYi4NCg0K
LVJLDQo+IA0KPiBUaGFua3MsDQo+IEFuZGkNCj4gDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEFuZGkNCj4gPiA+IFNoeXRpDQo+
ID4gPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDEsIDIwMjMgMzowMyBBTQ0KPiA+ID4gVG86IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gPiA+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50
ZWwuY29tPjsgQW5kaSBTaHl0aQ0KPiA+ID4gPGFuZGlAZXRlemlhbi5vcmc+OyBQYXRlbGN6eWss
IE1hY2llaiA8bWFjaWVqLnBhdGVsY3p5a0BpbnRlbC5jb20+OyBBbmRpDQo+ID4gPiBTaHl0aSA8
YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5jb20+OyBXYWpkZWN6a28sIE1pY2hhbA0KPiA+ID4gPE1p
Y2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDEvMl0g
ZHJtL2k5MTUvZ3Q6IENyZWF0ZSBwZXItdGlsZSBkZWJ1Z2ZzIGZpbGVzDQo+ID4gPg0KPiA+ID4g
VG8gc3VwcG9ydCBtdWx0aS1HVCBjb25maWd1cmF0aW9ucywgd2UgbmVlZCB0byBnZW5lcmF0ZQ0K
PiA+ID4gaW5kZXBlbmRlbnQgZGVidWcgZmlsZXMgZm9yIGVhY2ggR1QuDQo+ID4gPg0KPiA+ID4g
VG8gYWNoaWV2ZSB0aGlzIGNyZWF0ZSBhIHNlcGFyYXRlIGRpcmVjdG9yeSBmb3IgZWFjaCBHVCB1
bmRlciB0aGUNCj4gPiA+IGRlYnVnZnMgZGlyZWN0b3J5LiBGb3IgaW5zdGFuY2UsIGluIGEgc3lz
dGVtIHdpdGggdHdvIHRpbGVzLCB0aGUNCj4gPiA+IGRlYnVnZnMgc3RydWN0dXJlIHdvdWxkIGxv
b2sgbGlrZSB0aGlzOg0KPiA+ID4NCj4gPiA+IC9zeXMva2VybmVsL2RlYnVnL2RyaQ0KPiA+ID4g
ICAgICAgICAgICAgICAgICAg4pSU4pSA4pSAIDANCj4gPiA+ICAgICAgICAgICAgICAgICAgICDC
oMKgIOKUnOKUgOKUgCBndDANCj4gPiA+ICAgICAgICAgICAgICAgICAgICDCoMKgIOKUgsKgwqAg
4pSc4pSA4pSAIGRycGMNCj4gPiA+ICAgICAgICAgICAgICAgICAgICDCoMKgIOKUgsKgwqAg4pSc
4pSA4pSAIGVuZ2luZXMNCj4gPiA+ICAgICAgICAgICAgICAgICAgICDCoMKgIOKUgsKgwqAg4pSc
4pSA4pSAIGZvcmNld2FrZQ0KPiA+ID4gICAgICAgICAgICAgICAgICAgIMKgwqAg4pSCwqDCoCDi
lJzilIDilIAgZnJlcXVlbmN5DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgwqDCoCDilILCoMKg
IOKUlOKUgOKUgCBycHNfYm9vc3QNCj4gPiA+ICAgICAgICAgICAgICAgICAgICDCoMKgIOKUlOKU
gOKUgCBndDENCj4gPiA+ICAgICAgICAgICAgICAgICAgICDCoMKgIDrCoMKgIOKUnOKUgOKUgCBk
cnBjDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgwqDCoCA6wqDCoCDilJzilIDilIAgZW5naW5l
cw0KPiA+ID4gICAgICAgICAgICAgICAgICAgIMKgwqAgOsKgwqAg4pSc4pSA4pSAIGZvcmNld2Fr
ZQ0KPiA+ID4gICAgICAgICAgICAgICAgICAgIMKgwqAgIMKgwqAg4pSc4pSA4pSAIGZyZXF1ZW5j
eQ0KPiA+ID4gICAgICAgICAgICAgICAgICAgIMKgwqAgIMKgwqAg4pSU4pSA4pSAIHJwc19ib29z
dA0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGlu
dXguaW50ZWwuY29tPg0KPiA+ID4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBp
bnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF9ndF9kZWJ1Z2ZzLmMgICAgfCA0ICsrKy0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC91Yy9pbnRlbF9ndWMuaCAgICAgICAgfCAyICsrDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jICAgIHwgNSArKysrLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2RlYnVnZnMuYyB8IDIgKysNCj4gPiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0K
PiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9kZWJ1Z2ZzLmMNCj4gPiA+
IGluZGV4IDVmYzJkZjAxYWEwZGYuLjRkYzIzYjhkM2FhMmQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9kZWJ1Z2ZzLmMNCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiA+ID4gQEAgLTgzLDEx
ICs4MywxMyBAQCBzdGF0aWMgdm9pZCBndF9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCBpbnRlbF9n
dCAqZ3QsDQo+ID4gPiBzdHJ1Y3QgZGVudHJ5ICpyb290KQ0KPiA+ID4gIHZvaWQgaW50ZWxfZ3Rf
ZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQ0KPiA+ID4gIHsNCj4gPiA+ICAJ
c3RydWN0IGRlbnRyeSAqcm9vdDsNCj4gPiA+ICsJY2hhciBndG5hbWVbNF07DQo+ID4gPg0KPiA+
ID4gIAlpZiAoIWd0LT5pOTE1LT5kcm0ucHJpbWFyeS0+ZGVidWdmc19yb290KQ0KPiA+ID4gIAkJ
cmV0dXJuOw0KPiA+ID4NCj4gPiA+IC0Jcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcigiZ3QiLCBn
dC0+aTkxNS0+ZHJtLnByaW1hcnktPmRlYnVnZnNfcm9vdCk7DQo+ID4gPiArCXNucHJpbnRmKGd0
bmFtZSwgc2l6ZW9mKGd0bmFtZSksICJndCV1IiwgZ3QtPmluZm8uaWQpOw0KPiA+ID4gKwlyb290
ID0gZGVidWdmc19jcmVhdGVfZGlyKGd0bmFtZSwgZ3QtPmk5MTUtPmRybS5wcmltYXJ5LQ0KPiA+
ID4gPmRlYnVnZnNfcm9vdCk7DQo+ID4gPiAgCWlmIChJU19FUlIocm9vdCkpDQo+ID4gPiAgCQly
ZXR1cm47DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3VjL2ludGVsX2d1Yy5oDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2d1Yy5oDQo+ID4gPiBpbmRleCBiYjRkZmU3MDdhN2QwLi5lNDZhYWMxYTQxZTZkIDEwMDY0NA0K
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjLmgNCj4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Yy5oDQo+ID4gPiBAQCAt
NDIsNiArNDIsOCBAQCBzdHJ1Y3QgaW50ZWxfZ3VjIHsNCj4gPiA+ICAJLyoqIEBjYXB0dXJlOiB0
aGUgZXJyb3Itc3RhdGUtY2FwdHVyZSBtb2R1bGUncyBkYXRhIGFuZCBvYmplY3RzICovDQo+ID4g
PiAgCXN0cnVjdCBpbnRlbF9ndWNfc3RhdGVfY2FwdHVyZSAqY2FwdHVyZTsNCj4gPiA+DQo+ID4g
PiArCXN0cnVjdCBkZW50cnkgKmRiZ2ZzX25vZGU7DQo+ID4gPiArDQo+ID4gPiAgCS8qKiBAc2No
ZWRfZW5naW5lOiBHbG9iYWwgZW5naW5lIHVzZWQgdG8gc3VibWl0IHJlcXVlc3RzIHRvIEd1QyAq
Lw0KPiA+ID4gIAlzdHJ1Y3QgaTkxNV9zY2hlZF9lbmdpbmUgKnNjaGVkX2VuZ2luZTsNCj4gPiA+
ICAJLyoqDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50
ZWxfZ3VjX2xvZy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1
Y19sb2cuYw0KPiA+ID4gaW5kZXggMTk1ZGI4YzlkNDIwMC4uNTViYzhiNTVmYmMwNSAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuYw0K
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jDQo+
ID4gPiBAQCAtNTQyLDggKzU0MiwxMSBAQCBzdGF0aWMgaW50IGd1Y19sb2dfcmVsYXlfY3JlYXRl
KHN0cnVjdCBpbnRlbF9ndWNfbG9nDQo+ID4gPiAqbG9nKQ0KPiA+ID4gIAkgKi8NCj4gPiA+ICAJ
bl9zdWJidWZzID0gODsNCj4gPiA+DQo+ID4gPiArCWlmICghZ3VjLT5kYmdmc19ub2RlKQ0KPiA+
ID4gKwkJcmV0dXJuIC1FTk9FTlQ7DQo+ID4gPiArDQo+ID4gPiAgCWd1Y19sb2dfcmVsYXlfY2hh
biA9IHJlbGF5X29wZW4oImd1Y19sb2ciLA0KPiA+ID4gLQkJCQkJaTkxNS0+ZHJtLnByaW1hcnkt
PmRlYnVnZnNfcm9vdCwNCj4gPiA+ICsJCQkJCWd1Yy0+ZGJnZnNfbm9kZSwNCj4gPiA+ICAJCQkJ
CXN1YmJ1Zl9zaXplLCBuX3N1YmJ1ZnMsDQo+ID4gPiAgCQkJCQkmcmVsYXlfY2FsbGJhY2tzLCBp
OTE1KTsNCj4gPiA+ICAJaWYgKCFndWNfbG9nX3JlbGF5X2NoYW4pIHsNCj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19kZWJ1Z2ZzLmMNCj4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZGVidWdmcy5jDQo+ID4gPiBp
bmRleCAyODRkNmZiYzJkMDhjLi4yZjkzY2M0ZTQwOGE4IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZGVidWdmcy5jDQo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19kZWJ1Z2ZzLmMNCj4gPiA+IEBAIC01
NCw2ICs1NCw4IEBAIHZvaWQgaW50ZWxfdWNfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgaW50ZWxf
dWMgKnVjLA0KPiBzdHJ1Y3QNCj4gPiA+IGRlbnRyeSAqZ3Rfcm9vdCkNCj4gPiA+ICAJaWYgKElT
X0VSUihyb290KSkNCj4gPiA+ICAJCXJldHVybjsNCj4gPiA+DQo+ID4gPiArCXVjLT5ndWMuZGJn
ZnNfbm9kZSA9IHJvb3Q7DQo+ID4gPiArDQo+ID4gPiAgCWludGVsX2d0X2RlYnVnZnNfcmVnaXN0
ZXJfZmlsZXMocm9vdCwgZmlsZXMsIEFSUkFZX1NJWkUoZmlsZXMpLCB1Yyk7DQo+ID4gPg0KPiA+
ID4gIAlpbnRlbF9ndWNfZGVidWdmc19yZWdpc3RlcigmdWMtPmd1Yywgcm9vdCk7DQo+ID4gPiAt
LQ0KPiA+ID4gMi4zOS4xDQo+ID4NCg==
