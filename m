Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB9A971548
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 12:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967AC10E36F;
	Mon,  9 Sep 2024 10:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXdez4ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFB510E36F;
 Mon,  9 Sep 2024 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725877586; x=1757413586;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Nj5s+BvqWQ9EFri70zcttg74VCc/LRJiO8rLJo0cypI=;
 b=OXdez4ulnGCGdwtOZYV6utVRNneNA8MLRKCsU+FuERfAPCfFJlpiOfe/
 iOuAxnz02X4LGgPo6OjkQWALt5Xw49coF0ifHjM6ZQrTqZ3goYmoQWg5o
 v57dB7x1Y/ghS3F6Mpegt8QXVgBZNsro/HHbuYSXSNw/68yh4mxTXH+w6
 vNX8GwfuGFUcPYwBpGySXzDhD4uuVPZit+C0uzuzB4T9a2EcQaLjMkeP4
 g2d9oMijQ5efh42qhro9SL0utotrDqh29YE5HVSsKugq4QscgQ2NkQ4Sw
 ZUsq7tKqNJRYokT8g6L/ddZlUPGfIiVjdYFnzpSHil5I0dAE90jiztKWs A==;
X-CSE-ConnectionGUID: ivYcV9QNQJ6qf2SsNDSr7Q==
X-CSE-MsgGUID: e03Hy4B9SySipvpsCt6q8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35141474"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="35141474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 03:26:25 -0700
X-CSE-ConnectionGUID: /bM6jr6/Tw+WHRBgNqmqgA==
X-CSE-MsgGUID: Aqidc17gQ4mMEUA1EhaZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="71410609"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 03:26:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 03:26:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 03:26:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 03:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFNKwcziHO/qAWMedL/QlMWqRtLx7XKFvtFzqm/kYwf5j9O3R7wMWtvwZSqXshFvVC75yufxTLoRtPHZb3yekIakDFPPQ+opMygBb9Y39nBEajRwXeD1STtsUPrhv2i9oS6/XIBHGqY45oiQZyR2kstIjvzipKMKNqZlRABgoUM0Ud1ghvfy+8MuKaebSTfSlFtTGOeGmJKwMWDuv5LkDk8YF4+8XYJK2IUeslGYAcdV4r75mx5yvNyZpSaFAb1kcB3K/5bOspLDys7Q7xLiLBPvYsTe2XfVyWSkR1WEBPPLql60IOYLiwTvlLvCdkN5ixtokV6JUa/lDX7l1m61ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+FXT+ukCJ/lXDwQKyMj9tkTgH3gtiYDrBFR0TNf2HI=;
 b=xt0lxU7wg2bjxFYcN458WgSH6r7hv4tBW4OMMjaLkIQr3tXB68KvAFqbco2xuj/SAiqX3xNys7EfhGgX7RYNdND6cT6+i1pdka047I1pN2DM4fNztNq7iEscr3KPIBql+ujqDQTaNxEA/IHPZiTgC1P2o3KlxZ9Fg2tYiBK+93gIJf1BSRSWS8J3C0BQPBn+2JlIsC2cetIGbBmtky/G1ofxYCTMMu+HTzfF2wqTzW2hYYi9eO3Ie01hfzwfKElDkq8n9/gIQW9zI8PP6JauLODsuYwXrvpUiS+uR1ZvGcci2H2UqhzeYj5bpzc/cKAKh0X1zunbIL8mxCE6dNyNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 9 Sep
 2024 10:26:19 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 10:26:19 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [4/5] drm/i915/display: Add registers and compute the strength
Thread-Topic: [4/5] drm/i915/display: Add registers and compute the strength
Thread-Index: AQHa0Q5G76mbRKDXt0SsDnA5H19w1LI/xDoAgAAIR4CAD9Z0IA==
Date: Mon, 9 Sep 2024 10:26:19 +0000
Message-ID: <IA1PR11MB64671EA9FCA7927783A1040AE3992@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-5-nemesa.garg@intel.com>
 <IA0PR11MB7307DCA59F0772375397FCD0BA972@IA0PR11MB7307.namprd11.prod.outlook.com>
 <87wmjyv28u.fsf@intel.com>
In-Reply-To: <87wmjyv28u.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA3PR11MB7434:EE_
x-ms-office365-filtering-correlation-id: 3ed5b60e-3f35-47bd-d1a4-08dcd0b9d85f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?c5kR5QN2cKyfj1FR0stzcrsK/CPQ3E4fgZia7kw1FqTqhfbVqbKp61DuZoJd?=
 =?us-ascii?Q?eXx9ZQmWcLe8tPifBs7r2VHwDbyWZ1OgRRIBl8iPnviWAQrTSU/1yU8fHA8A?=
 =?us-ascii?Q?UxemDroj0uCwCWb8jNi56Iwn95WXn44RMCIrlnvIwUdqlq6rJf3xtHQx7ygL?=
 =?us-ascii?Q?xF7H6v+PMPJN7ayrvA0vB6lE2lhWz/4e3+FcCvY9U1niu5adiIE0utNTbTn+?=
 =?us-ascii?Q?3cL+eE4u76Y4hZlMruWhscktCRf8GplyR9VT9hEqrCAOXSDO6ygC5RDMlW6q?=
 =?us-ascii?Q?7T7mpTs9VZHD2tZ7Rq4i+wbuERJ1gfbOxY+rNExahPmEbcnBXofTjGIWhrzB?=
 =?us-ascii?Q?kSCsIpCdyzfEwNEd/6yN0XWwFa6Hn+Wf7QP2s59+XnBs0YSAcYN/m7aIsqkJ?=
 =?us-ascii?Q?iMHky1EPILeO9aJ0o0DGat1Zk5ap56agUaIaerouzipIt3seFX5hTPMQ99uu?=
 =?us-ascii?Q?yfUFAU114HDLS0XSA0yQ7IAecAycEjpMQlfE6xCrL0rICfDJwkq7OXw14GeJ?=
 =?us-ascii?Q?m8ieM8RWbTaYdRWhP8iChMVvUQ66fOX2uKHWF0QcslWRSJo25VdwXAnDF0+f?=
 =?us-ascii?Q?zR9x+d2FoVEt85Pi7lZ9GWD+CKlaf+22sw0RTwdSPXFHxAXUT+mFezl1pkE6?=
 =?us-ascii?Q?tCIXsMFpcvLx+xFsrCHl2flBSvvjgGNcbh828O7cs7jwXibdg5I1CVcgtpxN?=
 =?us-ascii?Q?Q00gIVd5HK8SfTkiZ2xJXiSCDf2meL7qL2lPzSXU3Kr9zsTP1MnmaR4wTYCd?=
 =?us-ascii?Q?uOonoCjpXNepbbOOjYlwI79vBoBxyPCE+jMz2fBWS+DlPqkFs6FFW6NVQZxN?=
 =?us-ascii?Q?73vKjkSYvRK8MxFcfesJfoDFZKXU8IJuxEVDKKlJVM0c0OMvn8zQNMa4oZgx?=
 =?us-ascii?Q?fAOILC7QWVz72pwagsjVy2qOiUUAVVhHTlw2Xm4CF7mZvJe9V5DXJmlSRjaM?=
 =?us-ascii?Q?UXIUvNtqUASHufm1AnaUg2ELS61FMoM3181Pp1McDI/m9eMuCPIGpnWSrDrZ?=
 =?us-ascii?Q?QNCzeyT3csOwVLkRon8ViPxFE2B7GCJig9j0FEM6NpBwaZ95DPZxCmneXR1S?=
 =?us-ascii?Q?eOZaoBzTZn6QOQQKQJOVK7UuSx4FPo6d4IZqIkNBvzKo5HB12riJ6kmeFUy5?=
 =?us-ascii?Q?tK7UsD31KjmY24PBfUqZm2Ls50BiBuXvQ35JoUFzl8V3+E1xb/G0jPDNWal4?=
 =?us-ascii?Q?KcRWg0CZcfn8xP3H2IZKeuLiGkryJN7m09txQvSXd+k40EkZCM3nxJa4qWWZ?=
 =?us-ascii?Q?j71osqUrYXVU4vVlx4ZfhURdJOTHjgxg4k8B9TyFZoQXNg2uYQhCzJSWGqHZ?=
 =?us-ascii?Q?WCyjEaOK3xjjJZrED4CF8aWEOqhRVS22Wkw/4Yk/lnc64uzdSjJ2hvTvGtxd?=
 =?us-ascii?Q?BMIyvoCeJXTxuwWKdDDhY1kQIjfEQu50MkypwECXYksS2C/0Fg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZxGiKyCYi5HIa7Hlh9fFVGr/CQrSjfY0CerWoQbha0YR+P1271h0MIFrTtIA?=
 =?us-ascii?Q?qhFt8jYzxV/FUjO2fD3kP3WJnkt7re8k8UtZOFQKpTlS93JX7KeZgOIRxOdU?=
 =?us-ascii?Q?H9vvOlqfIDB3k6ay7+8csfkgyzcQtbBKydowFu3/Beg7ajhwcf8kcA/0+r8R?=
 =?us-ascii?Q?HAHpj9LMVpc+fstSfVIcVnsyOpGMoGEhPd6MMEI0kINkP7OjD3MyJ/xnMckY?=
 =?us-ascii?Q?+N/zq6Lou8eTJ1NCaopY+LfyrOZJv+lgZiqJi+WLFuJQTp9ojK7GStZTextn?=
 =?us-ascii?Q?uSHqtZisdSJz/Q/ZlzmdwZXNvJtsgRodsmKkuVEamVGAhkQJb7i47KhNGMaY?=
 =?us-ascii?Q?A4Q/xKomj8J362887lxcOwr/Y9guwn0N0SMYBUhLWjp/CMjSnS30THbl4GXk?=
 =?us-ascii?Q?3EEssnU+4OiWpFFmbkPli+iRt7rrzdnnpGB8LMK6nuCb5ET8QGDafSQyaJEe?=
 =?us-ascii?Q?Euo0Ik44RLq0KUMEoia+N9eaOihA17cXJsvFNW/bLNt6YHOzuIJyqCXPF+Fs?=
 =?us-ascii?Q?hdLlUoKN9HZbh/5e7N/CspyPyngCLvsRSUvkVk2ONvWZlEq82yVBn690JELf?=
 =?us-ascii?Q?vr2TsemRWWZ6d24qf9wWHaYec4XowMSnQ+8dqa/cAI5RgAPTHl0sqIZ9QufZ?=
 =?us-ascii?Q?Y8upZSfAi4uemPC4XHYVKLwIlEzlujKufFwYNF4DqHCId9JPnMfcZvmCzFte?=
 =?us-ascii?Q?ui8pfWUUos0BAvJ0O9hjPW7lzkoGfcg3OifsUKNb7JjDubpY4zHEIaHozHSu?=
 =?us-ascii?Q?iRzXv5pK7qfFS+xWOP8GUnNOcoE/XBLH2kOuTN7Zdqppt0OQO4b597yKgjvW?=
 =?us-ascii?Q?2363MIvc/cx/k0qIL0JxEXXnZqupKOIZ76644cbCLjPlpFrRjN9rbd/K3hNU?=
 =?us-ascii?Q?RpTie/KpUS2vxWBvHNlwDVPwZHq0QSUhCHxRvX+W0Vpq6xgP6XUA/YIjJYfh?=
 =?us-ascii?Q?CpkVjJ0ObDaOTBocsNZI9QxMG1NB7c/eIQ/StVxbcd3om0Hlr+rGsHWaypJu?=
 =?us-ascii?Q?5xJO7yjritcBoZlGdM8dhX7ipFf5KynztarGjmefH17mbTPg5UwHUXeFpwK0?=
 =?us-ascii?Q?Pyq7hjdjEE+NtTVa3Oivs0RH5pihlOmJTFwWnWGSpGbAs80TzqFWjNVGmAYy?=
 =?us-ascii?Q?Ijtoqw4i+R5IZmZBM+Futi2WGh/+hVyqHQ5KH56GeXUde/ysay5cDDP8DIK0?=
 =?us-ascii?Q?3Ff2toKpwuwCpImL0EMXyCtRuIyzGd/rK+j/31uIpgoLiXu0QQNxqDbb00FR?=
 =?us-ascii?Q?g/fPZudWFEnUItztC1rXWsY2dPi/34bBqgK6KFYnFb9vZpIVV6aNVzWVDxW5?=
 =?us-ascii?Q?bZL0SyXrlc0sPFnXMJLC5om4G6KhPoubGzsiAQopRjPJWvfwQtuSYzbJndt2?=
 =?us-ascii?Q?lPBFfgriYKR15SZFPTskZacnHz0x5aDbYi6b6GA9pmeqi6oIFpIAT64yXfN/?=
 =?us-ascii?Q?mbX7FXINiIlGIwEQGoq/PtuX4LV07jAeP9KukomAQb1qiewvXbGSVdkF9AO2?=
 =?us-ascii?Q?65IJx/eN4CGf4zNMAfWephy5OscwBdZWYh0ZM3sX8Bvn/C/si8fWFdbhD247?=
 =?us-ascii?Q?mfcVE4rEWXKWyJ/6MR1nW2fkXkKZz3b2iQI1150a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed5b60e-3f35-47bd-d1a4-08dcd0b9d85f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 10:26:19.7146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8uBbfHeWZnfi+mI3mqSL93v5jgAtb6mxKym1UUtR8OmW5Cn/laAHlTf/bdo7UzB1CZ+FxzOnl5xMsK75IMrNzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, August 30, 2024 2:04 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; Garg, Nemesa
> <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: RE: [4/5] drm/i915/display: Add registers and compute the streng=
th
>=20
> On Fri, 30 Aug 2024, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> >> -----Original Message-----
> >> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf
> >> Of Nemesa Garg
> >> Sent: Monday, July 8, 2024 1:39 PM
> >> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> >> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> >> Subject: [4/5] drm/i915/display: Add registers and compute the
> >> strength
> >>
> >> Add new registers and related bits. Compute the strength value and
> >> tap value based on display mode.
> >>
> >> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
> >>  .../drm/i915/display/intel_display_types.h    |   1 +
> >>  .../drm/i915/display/intel_sharpen_filter.c   | 105 +++++++++++++++++=
+
> >>  .../drm/i915/display/intel_sharpen_filter.h   |   5 +
> >>  drivers/gpu/drm/i915/i915_reg.h               |  17 +++
> >>  5 files changed, 132 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> >> b/drivers/gpu/drm/i915/display/intel_display.c
> >> index 385a254528f9..e0a82ab46d29 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >> @@ -5910,7 +5910,10 @@ static int intel_atomic_check_planes(struct
> >> intel_atomic_state *state)
> >>  		if (ret)
> >>  			return ret;
> >>
> >> -		intel_sharpness_scaler_compute_config(new_crtc_state);
> >> +		if (sharp_compute(new_crtc_state)) {
> >> +
> >> 	intel_sharpness_scaler_compute_config(new_crtc_state);
> >> +			intel_filter_compute_config(new_crtc_state);
> >> +		}
> >>
> >>  		/*
> >>  		 * On some platforms the number of active planes affects diff --
> >> git a/drivers/gpu/drm/i915/display/intel_display_types.h
> >> b/drivers/gpu/drm/i915/display/intel_display_types.h
> >> index 130740aaaa21..782192f2b9ae 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> >> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> >> @@ -835,6 +835,7 @@ struct intel_sharpness_filter {
> >>  	bool strength_changed;
> >>  	u8 win_size;
> >>  	bool need_scaler;
> >> +	u8 strength;
> >>  };
> >>
> >>  struct intel_crtc_scaler_state {
> >> diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> >> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> >> index 627a0dbd3dfd..6600a66d3960 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> >> @@ -18,11 +18,87 @@
> >>  #define FILTER_COEFF_1_0 1000
> >>  #define FILTER_COEFF_0_0 0
> >>
> >> +/*
> >> + * Default LUT values to be loaded one time.
> >> + */
> > Single line comment style  /*  */
> >Sure.
> >> +static const u16 lut_data[] =3D {
> >> +	4095, 2047, 1364, 1022, 816, 678, 579,
> >> +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> >> +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> >> +	73, 60, 48, 36, 24, 12, 0
> >> +};
> >> +
> >> +void intel_filter_lut_load(struct intel_crtc *crtc,
> >> +			   const struct intel_crtc_state *crtc_state) {
> >> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> >
> > dev_priv =3D> i915
>=20
> Actually,
>=20
> 	struct intel_display *display =3D to_intel_display(crtc);
>=20
> everywhere instead of dev_priv or i915.
> Will replace dev_priv or i915 with intel_display *display in series.

Thanks and Regards,
Nemesa
> >
> >> +	int i;
> >> +
> >> +	intel_de_write(dev_priv, SHRPLUT_INDEX(crtc->pipe),
> >> INDEX_AUTO_INCR |
> >> +INDEX_VALUE(0));
> >> +
> >> +	for (i =3D 0; i < ARRAY_SIZE(lut_data); i++)
> >> +		intel_de_write(dev_priv, SHRPLUT_DATA(crtc->pipe),
> >> lut_data[i]); }
> > Sharpness LUT is from bit[0:11] and lut_data is u16.
> >
> >> +
> >> +static void intel_filter_size_compute(struct intel_crtc_state
> > Can the same function naming convention be used
> > intel_filter_size_compute =3D> intel_sharpness_filter_size_compute
> >
> >> +*crtc_state) {
> >> +	const struct drm_display_mode *mode =3D &crtc_state-
> >> >hw.adjusted_mode;
> >> +
> >> +	if (mode->hdisplay <=3D 1920 && mode->vdisplay <=3D 1080)
> >> +		crtc_state->hw.casf_params.win_size =3D 0;
> >> +	else if (mode->hdisplay <=3D 3840 && mode->vdisplay <=3D 2160)
> >> +		crtc_state->hw.casf_params.win_size =3D 1;
> >> +	else
> >> +		crtc_state->hw.casf_params.win_size =3D 2; }
> >> +
> >> +bool intel_sharpness_strength_changed(struct intel_atomic_state
> >> +*state) {
> >> +	int i;
> >> +	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
> >> +	struct intel_crtc *crtc;
> >> +
> >> +	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> >> +					    new_crtc_state, i) {
> >> +		if (new_crtc_state->uapi.sharpness_strength !=3D
> >> +				old_crtc_state->uapi.sharpness_strength)
> >> +			return true;
> >> +	}
> >> +
> >> +	return false;
> >> +}
> >> +
> >>  void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_stat=
e)  {
> >>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> >>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> >>  	int id =3D crtc_state->scaler_state.scaler_id;
> >> +	u32 sharpness_ctl;
> >> +	u8 val;
> >> +
> >> +	if (crtc_state->uapi.sharpness_strength =3D=3D 0) {
> >> +		intel_sharpness_disable(crtc_state);
> >> +
> >> +		return;
> >> +	}
> >> +
> >> +	/*
> >> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> >> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> >> +	 * User can give value from 0-255 but is clamped to 239.
> >> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> >> +	 * 6.3125 in 4.4 format is 01100101 which is equal to 101.
> >> +	 * Also 85 + 16 =3D 101.
> >> +	 */
> >> +	val =3D min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> >> +
> >> +	drm_dbg(&dev_priv->drm, "Filter strength value: %d\n", val);
> >> +
> >> +	sharpness_ctl =3D	FILTER_EN | FILTER_STRENGTH(val) |
> >> +		FILTER_SIZE(crtc_state->hw.casf_params.win_size);
> >> +
> >> +	intel_de_write(dev_priv, SHARPNESS_CTL(crtc->pipe),
> >> +		       sharpness_ctl);
> >>
> >>  	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id,
> >> 0),
> >>  			  PS_COEF_INDEX_AUTO_INC);
> >> @@ -42,9 +118,21 @@ void intel_sharpness_filter_enable(struct
> >> intel_crtc_state *crtc_state)
> >>
> >>  int intel_filter_compute_config(struct intel_crtc_state *crtc_state)
> >> {
> >> +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc_state->uapi.crt=
c);
> >> +	struct drm_i915_private *dev_priv =3D to_i915(intel_crtc->base.dev);
> >> +
> >> +	if (crtc_state->uapi.sharpness_strength =3D=3D 0) {
> >> +		crtc_state->hw.casf_params.need_scaler =3D false;
> >> +		return 0;
> >> +	}
> >> +
> >>  	if (!crtc_state->pch_pfit.enabled)
> >>  		crtc_state->hw.casf_params.need_scaler =3D true;
> >>
> >> +	intel_filter_size_compute(crtc_state);
> >> +	drm_dbg(&dev_priv->drm, "Tap Size: %d\n",
> >> +		crtc_state->hw.casf_params.win_size);
> >> +
> >>  	return 0;
> >>  }
> >>
> >> @@ -129,3 +217,20 @@ void
> >> intel_sharpness_scaler_compute_config(struct
> >> intel_crtc_state *crtc_state)
> >>  		}
> >>  	}
> >>  }
> >> +
> >> +void intel_sharpness_disable(struct intel_crtc_state *crtc_state) {
> >> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> >> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> >> +
> >> +	intel_de_write(dev_priv, SHARPNESS_CTL(crtc->pipe), 0);
> >> +	drm_dbg(&dev_priv->drm, "Filter strength value: %d\n", 0); }
> >> +
> >> +bool sharp_compute(struct intel_crtc_state *crtc_state) {
> >> +	if (!(FILTER_EN & 1) && crtc_state->uapi.sharpness_strength !=3D 0)
> >> +		return true;
> >> +
> >> +	return false;
> >> +}
> >> diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> >> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> >> index d20e65971a55..4fffdd99d0fb 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> >> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> >> @@ -24,5 +24,10 @@ struct scaler_filter_coeff {  void
> >> intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state);
> >> void intel_sharpness_scaler_compute_config(struct intel_crtc_state
> >> *crtc_state);  int intel_filter_compute_config(struct
> >> intel_crtc_state *crtc_state);
> >> +void intel_filter_lut_load(struct intel_crtc *crtc,
> >> +			   const struct intel_crtc_state *crtc_state); bool
> >> +intel_sharpness_strength_changed(struct intel_atomic_state *state);
> >> +void intel_sharpness_disable(struct intel_crtc_state *crtc_state);
> >> +bool sharp_compute(struct intel_crtc_state *crtc_state);
> >>
> >>  #endif /* __INTEL_SHARPEN_FILTER_H__ */ diff --git
> >> a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> >> index
> >> 9492fda15627..2fa42e10bb63 100644
> >> --- a/drivers/gpu/drm/i915/i915_reg.h
> >> +++ b/drivers/gpu/drm/i915/i915_reg.h
> >> @@ -2396,6 +2396,23 @@
> >>  			_ID(id, _PS_COEF_SET0_DATA_1A,
> >> _PS_COEF_SET0_DATA_2A) + (set) * 8, \
> >>  			_ID(id, _PS_COEF_SET0_DATA_1B,
> >> _PS_COEF_SET0_DATA_2B) + (set) * 8)
> >>
> >> +#define _SHARPNESS_CTL_A               0x682B0
> >> +#define SHARPNESS_CTL(trans)           _MMIO_PIPE2(dev_priv, trans,
> >> _SHARPNESS_CTL_A)
> >> +#define  FILTER_EN                      REG_BIT(31)
> >> +#define  FILTER_STRENGTH_MASK           REG_GENMASK(15, 8)
> >> +#define  FILTER_STRENGTH(x)
> >> REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> >> +#define  FILTER_SIZE_MASK               REG_GENMASK(1, 0)
> >> +#define  FILTER_SIZE(x)                 REG_FIELD_PREP(FILTER_SIZE_MA=
SK, (x))
> >> +
> >> +#define _SHRPLUT_DATA_A			0x682B8
> >> +#define SHRPLUT_DATA(trans)		_MMIO_PIPE2(dev_priv, trans,
> >> _SHRPLUT_DATA_A)
> >> +
> >> +#define _SHRPLUT_INDEX_A		0x682B4
> >> +#define SHRPLUT_INDEX(trans)		_MMIO_PIPE2(dev_priv, trans,
> >> _SHRPLUT_INDEX_A)
> >> +#define  INDEX_AUTO_INCR		REG_BIT(10)
> >> +#define  INDEX_VALUE_MASK		REG_GENMASK(4, 0)
> >> +#define  INDEX_VALUE(x)
> >> 	REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
> >> +
> >>  /* Display Internal Timeout Register */
> >>  #define RM_TIMEOUT		_MMIO(0x42060)
> >>  #define  MMIO_TIMEOUT_US(us)	((us) << 0)
> >> --
> >> 2.25.1
> >
> > Thanks and Regards,
> > Arun R Murthy
> > --------------------
>=20
> --
> Jani Nikula, Intel
