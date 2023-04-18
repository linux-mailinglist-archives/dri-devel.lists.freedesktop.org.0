Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305916E58A6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 07:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB46D10E68F;
	Tue, 18 Apr 2023 05:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B1010E683;
 Tue, 18 Apr 2023 05:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681796264; x=1713332264;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QHe0pRn1SDtrsqoANEqEegqXMkluejfta/rUmFiYD+8=;
 b=XWcgdLO7UH6PrDpwZS3TFv9rAIeP4eLF3ol7yuG7izzSTY6cBEh+VAGC
 OMok/9kMsJ2DJ5oYqx6EZETMJnoPfHnhKLHUdrb4cb7ofElnAatXaVARC
 FCByF+/MBlawGnrqvfoMVwSUFbWAVQUvn1U+275nNWwxmAkWKa4fRi6Ce
 OBLGq6lExt7zSCeatSFpTaS/nAVCf4wi4KexDUTI1Z3JSu/1AlR5/E9NC
 7QBd+t1T4qw7kw6C5WYvz0FEvdhUO/b0obQh5Wkes0B7HMPehd6PugnoB
 slA5yINeThvi6ZRKzMFPN7VCsmcfGdS3m3qbAWa5T9RyDsInuvgiYFCeJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="342574405"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="342574405"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 22:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="684437934"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="684437934"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 22:37:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 22:37:43 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 22:37:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 22:37:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 22:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJqk1BoCGiGW0gzWBZwLbPdbUhlLGGrbUognVUH/PbSVtSYZhi9yI7JExjCWmTDNUtimmjOSwTgPhodIrhH9g/ni6e1kLI3ZTWB3OiDoxirZ+NvpkEM6btlEGyRSDaxUab8rRM1mHoseWUdbUFdJQawKMbc8W3cwSV6FMsnbmYLdQu7zfKWRRECXnu7lu0DqtTdx6aapJFFncVB7dCnsmeK2SMzejC5AbulKUkecox2mf/SUkWjgISLIfsjCItiBxtJeyjgNPpw3eTTED7p4jIQfg1g7DULSMhaxr5L+lcYKcVq+9W0hwf3uVsA1jodpXh/UHFHbsrMDvHWsmsXf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE/CTQDd+ODBJIidALbORc2r/5eQtZYelwj1vxyz3HM=;
 b=FEl89/m1qvy789JqRvm8zFyd2b4p7UJzhGe/h9cCwk97Gnms71H0KornkPY8sEOC7OdlyiEx+tBWG6KVM9brLBA3gKQkqcnD9If0ekajGX3VM58fChnznZgg1j1aJwZUcTXO11yCOSoyiZorrcQ1Nfx2Z+YX2skcsC0HgvOMO3KEYKmEp9IsepHh0NFkGoYXkGqdpKV9WkNdV18kMlRFHAyBjv9+NmwZkSTonnrjw5h+5JP+HQoIRIKoJfimNXoH1nCEjf5CD+S6GxhY5YE/zXD7Cn9fvUsquOHI/pGpqILVerSJuxqJeg2vw5ca+TdFcLtutQzcIotRq5gAWKb1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 05:37:33 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993%9]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 05:37:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: RE: [PATCH v9 02/10] drm/hdcp: Avoid changing crtc state in hdcp
 atomic check
Thread-Topic: [PATCH v9 02/10] drm/hdcp: Avoid changing crtc state in hdcp
 atomic check
Thread-Index: AQHZbKrltyq9qSpqzE28yFk5gVXHC68wlOcA
Date: Tue, 18 Apr 2023 05:37:33 +0000
Message-ID: <SN7PR11MB67504334854153E6EB3EF9ECE39D9@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230411192134.508113-1-markyacoub@google.com>
 <20230411192134.508113-3-markyacoub@google.com>
In-Reply-To: <20230411192134.508113-3-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA1PR11MB8351:EE_
x-ms-office365-filtering-correlation-id: 1d510794-fd0b-491f-76a1-08db3fcf0262
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDTtVfduNNqdxXR1I941o6OekZN7PZO0NnhfMTe+sV2kBuDgHUwkIt8ai2sMrGkjwgK+V0fOdInyjtaHSe8wRnQ1SJjXXMFizz5nJe5M0VmGQcEbsf7JVSNqquRXIf4f9CK+0d5iS1QQZ+he8jiZ+0tvsEVfdhz8FglSMoyJ5L1jGCk16WMR3yhtDaBypdEtxWWzVIzfFr9gxxQyk0vpAQwpx7A/EiFdY2ZWnN+r/H7XWcO6k2/7PikTU7wWYnDxbcTBt2BguHBHv14bCylaLb943QYYaYlBSKgRsXE+mbVoVhx2nrBK2LtJSJp9e8+VFKp9EXd//y/K7hOKD5pFUcyMO9/pbNb9nuOnsYgqn/XSZ/47QVAkRU++c28nEgbVFP/4syHtqC8uxzuBxWNZJ1kEUmJZRCKEEn6RChnYRH4VWEZIHccKiO0pgS4/hH5BQaywf5RRjLBY4i23uPC1krPxfOWANAduks9hzjO0pyhgq19M2vkcxgIEpsiy1MbmOYrE+t/sFsCDVao26qVy1bow17qLcUAJ3KT1DERgJxMoPsmxdPt++yXMZw11rHzyqNpZzb78n1+Z2ZWhn2h3C51iCn9ACus92kEQt9pe8bHwsOZib5JbT+xCLdc3fYgL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(5660300002)(71200400001)(7696005)(76116006)(66556008)(66476007)(2906002)(66946007)(64756008)(66446008)(4326008)(7416002)(33656002)(86362001)(8936002)(38070700005)(122000001)(41300700001)(38100700002)(478600001)(316002)(52536014)(8676002)(82960400001)(55016003)(54906003)(9686003)(110136005)(26005)(6506007)(66899021)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1OqiVZLGz7RkYqFVsEw/q8E8+fIwIZibuZUGfe7dqnqZHj+FZsZgU5tzyr0q?=
 =?us-ascii?Q?2DoG8rA2dIox9Axc7+zX/JSjVlL/LQPZUQxsczRhqoS98Q5X3qDaNST4+lUB?=
 =?us-ascii?Q?4SnWm49LOQPeoHORiM9+ieL6bF8FAXcPEHr/+L60tbzWQC6SiayFRkAgBSOm?=
 =?us-ascii?Q?OcuTlHOQ157vHvUqUb8S4LRzVwhEUwVzbezOrYMShMavJHIVIw2iPIbbJJ6L?=
 =?us-ascii?Q?uHoBCpvphDlJJpHGoRmYwGBS8nBQdXbvtoGZq2ohgGalspvzz6Yuq4HXlMzJ?=
 =?us-ascii?Q?8h87wQWOyNGYhwu/EJYRQs5snfItbwrAgcKHdWR4U131jL2GcM11XIc1Qsjk?=
 =?us-ascii?Q?mos6pWT6+FAXVEM8bGHdHRjmC0+BEXCJAXSRLHmGv3nEaAnSLnsdEHhT4IHl?=
 =?us-ascii?Q?OcKW3aq4JsYw/Ibh9bV7GspepTptvczzzVDQkYCFlrB6f8IA/z9fC8bvypL9?=
 =?us-ascii?Q?2HM84/Xh0Avz4mTZosq52ofzwKW9vtBx/vn9En1dPha3cls8RCCmXLlaI2lG?=
 =?us-ascii?Q?7Fb9EctPSEzS3tPv9DobzPBlzOwJ1FSjKiqtneoOH4HgR0mfYglV22K1f6+Z?=
 =?us-ascii?Q?x6epIY/KVLCgy4GJs5r46vSWLCHVc9EdQRNMWAeVmEC5uljCw0ozxH3SeaB5?=
 =?us-ascii?Q?BeBHSdlV0/PE9QjBfxzm7ls3zEj6MSnuVOBKPRjyw2ChODsX4ISW69UkhOSy?=
 =?us-ascii?Q?vRCOALgyI47PWEiTVv4vNDNL7RtuVQF9erTKno4QW7tUOWbt7T52sdLNbCEt?=
 =?us-ascii?Q?B2gNQjON+NqNe4+yD0GI8xYhIWZAMtZCmUdQec8uRNfYmJVPpYnm4WUAc175?=
 =?us-ascii?Q?IDKAij0ZZ+TAOA5A4BZUcedQ3tRTz1D9Ao55h0R+gWiATS5C6rOlMba/SlYq?=
 =?us-ascii?Q?ElYDsbfEObTV1/2+IMlLUASmx4CZLcFz6qYLhmBGru2Kb5Qsefwj5cYHnEno?=
 =?us-ascii?Q?px/+eUQrQNPsmRBoC0VadB6lQaN1dsSrcg0a8tSZ5WoUZYaojogOP9NAuj9+?=
 =?us-ascii?Q?fxaUnzNYjZgh2RYxuycrWqwSMNJ0YWbyu8O9xXnf5r/0h6huruLTQplI9qO2?=
 =?us-ascii?Q?E7BPmQDvY2qzC1n8A4CGXoaoKDmkV3dotIHnt4uKpIP0zLvBhNzLc5sNmrvh?=
 =?us-ascii?Q?gnIoQNkGOp9SRF7cjP5S8mtQZFHBxBo9htFD4pJw7PRIb+6paop/KKs1nIHo?=
 =?us-ascii?Q?Hs/6mpMSUajTyzXcjjxIWxuU82cMGY+eBTH5xotmViluaxTLnonLd9web6mv?=
 =?us-ascii?Q?So4kNY9moyrEaSkJomOqhZKXN1OqzNB0sv+omT7qDoCk/smG8+DTzVJhmqtY?=
 =?us-ascii?Q?z0P8wFzhckVZYtW8PzBALcQxflIoDOGzkB2jSo5quFMVgArD9yYHHDSRYf8A?=
 =?us-ascii?Q?5fZNhfsd3AmypWwnEsOV9Dnp/0rhbqWWAQ1tU9QvMOH4DTcmP4GpJi2ji5se?=
 =?us-ascii?Q?05sq008qVbj8RsxImFMmqlolfDe6YKLCnaOqb89Zn0xHTEIhD1k9pdyJvn+x?=
 =?us-ascii?Q?oAJA7wM5DghYaLQuVbh5KjVlsEw3fKhypVers79kbRjJL/YCM+sHZgm/SMDG?=
 =?us-ascii?Q?YZLpbuLsgIpohh5SQhXXhTUcdN5Qm1Try4HiMUkS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d510794-fd0b-491f-76a1-08db3fcf0262
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 05:37:33.3615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atc+uX9/GeUv8LRl8T991A+HQZPqXP+X2rQhS2AnZg1hD8Y+2sGlfiLTcljeOfDI12r2tAiMkD5yB6iimsfwpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>=20
> From: Sean Paul <seanpaul@chromium.org>
>=20
> Instead of forcing a modeset in the hdcp atomic check, rename to
> drm_hdcp_has_changed and return true if the content protection value is
> changing and let the driver decide whether a modeset is required or not.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>=20
> ---
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in v6:
> -Rebase: modifications in drm_hdcp_helper.c instead of drm_hdcp.c
> Changes in v7:
> -Renamed the function from drm_hdcp_atomic_check to
> drm_hdcp_has_changed (Dmitry Baryshkov)
>=20
>  drivers/gpu/drm/display/drm_hdcp_helper.c   | 39 ++++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_atomic.c |  6 ++--
>  include/drm/display/drm_hdcp_helper.h       |  2 +-
>  3 files changed, 30 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c
> b/drivers/gpu/drm/display/drm_hdcp_helper.c
> index 7ca390b3ea106..34baf2b97cd87 100644
> --- a/drivers/gpu/drm/display/drm_hdcp_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
> @@ -422,18 +422,21 @@ void drm_hdcp_update_content_protection(struct
> drm_connector *connector,
> EXPORT_SYMBOL(drm_hdcp_update_content_protection);
>=20
>  /**
> - * drm_hdcp_atomic_check - Helper for drivers to call during connector-
> >atomic_check
> + * drm_hdcp_has_changed - Helper for drivers to call during
> + connector->atomic_check
>   *
>   * @state: pointer to the atomic state being checked
>   * @connector: drm_connector on which content protection state needs an
> update
>   *
>   * This function can be used by display drivers to perform an atomic che=
ck
> on the
> - * hdcp state elements. If hdcp state has changed, this function will se=
t
> - * mode_changed on the crtc driving the connector so it can update its
> hardware
> - * to match the hdcp state.
> + * hdcp state elements. If hdcp state has changed in a manner which
> + requires the
> + * driver to enable or disable content protection, this function will
> + return
> + * true.
> + *
> + * Returns:
> + * true if the driver must enable/disable hdcp, false otherwise
>   */
> -void drm_hdcp_atomic_check(struct drm_connector *connector,
> -			   struct drm_atomic_state *state)
> +bool drm_hdcp_has_changed(struct drm_connector *connector,
> +			  struct drm_atomic_state *state)
>  {
>  	struct drm_connector_state *new_conn_state, *old_conn_state;
>  	struct drm_crtc_state *new_crtc_state; @@ -450,19 +453,31 @@
> void drm_hdcp_atomic_check(struct drm_connector *connector,
>  		 * If the connector is being disabled with CP enabled, mark it
>  		 * desired so it's re-enabled when the connector is brought
> back
>  		 */
> -		if (old_hdcp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +		if (old_hdcp =3D=3D
> DRM_MODE_CONTENT_PROTECTION_ENABLED) {
>  			new_conn_state->content_protection =3D
>=20
> 	DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return;
> +			return true;
> +		}
> +		return false;
>  	}
>=20
>  	new_crtc_state =3D
>  		drm_atomic_get_new_crtc_state(state, new_conn_state-
> >crtc);
>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
>  	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	     new_hdcp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> +	     new_hdcp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> {
>  		new_conn_state->content_protection =3D
>  			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return true;
> +	}
> +
> +	/*
> +	 * Coming back from UNDESIRED state, CRTC change or re-
> enablement requires
> +	 * the driver to try CP enable.
> +	 */
> +	if (new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	    new_conn_state->crtc !=3D old_conn_state->crtc)
> +		return true;
>=20
>  	/*
>  	 * Nothing to do if content type is unchanged and one of:
> @@ -477,9 +492,9 @@ void drm_hdcp_atomic_check(struct drm_connector
> *connector,
>  	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
>  		if (old_conn_state->hdcp_content_type =3D=3D
>  		    new_conn_state->hdcp_content_type)
> -			return;
> +			return false;
>  	}
>=20
> -	new_crtc_state->mode_changed =3D true;
> +	return true;
>  }

So previously in hdcp_atomic_check we decided if a mode change was required=
 only after going through two different checks
if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
 (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
     new_hdcp !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED))

and=20

if (old_hdcp =3D=3D new_hdcp ||
	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED &&
	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
	    (old_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED &&
	     new_hdcp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED))

then we decided if mode needs to change or not but now we are returning mod=
e_changed
as true if either of the conditions are met
maybe we can have a bool variable that gets assigned true or false and is r=
eturned only at the end
of the function where we previously changed mode_changed to true

Regards,
Suraj Kandpal

> -EXPORT_SYMBOL(drm_hdcp_atomic_check);
> +EXPORT_SYMBOL(drm_hdcp_has_changed);
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index e9d00b6a63d39..23a6ba315a22e 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -124,8 +124,6 @@ int intel_digital_connector_atomic_check(struct
> drm_connector *conn,
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
>=20
> -	drm_hdcp_atomic_check(conn, state);
> -
>  	if (!new_state->crtc)
>  		return 0;
>=20
> @@ -141,8 +139,8 @@ int intel_digital_connector_atomic_check(struct
> drm_connector *conn,
>  	    new_conn_state->base.picture_aspect_ratio !=3D old_conn_state-
> >base.picture_aspect_ratio ||
>  	    new_conn_state->base.content_type !=3D old_conn_state-
> >base.content_type ||
>  	    new_conn_state->base.scaling_mode !=3D old_conn_state-
> >base.scaling_mode ||
> -	    new_conn_state->base.privacy_screen_sw_state !=3D
> old_conn_state->base.privacy_screen_sw_state ||
> -	    !drm_connector_atomic_hdr_metadata_equal(old_state,
> new_state))
> +	    !drm_connector_atomic_hdr_metadata_equal(old_state,
> new_state) ||
> +	    drm_hdcp_has_changed(conn, state))
>  		crtc_state->mode_changed =3D true;
>=20
>  	return 0;
> diff --git a/include/drm/display/drm_hdcp_helper.h
> b/include/drm/display/drm_hdcp_helper.h
> index dd02b2e72a502..703421fcdf96c 100644
> --- a/include/drm/display/drm_hdcp_helper.h
> +++ b/include/drm/display/drm_hdcp_helper.h
> @@ -19,7 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device
> *dev, u8 *ksvs, u32 ksv_count)  int
> drm_connector_attach_content_protection_property(struct drm_connector
> *connector,
>  						     bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector
> *connector, u64 val); -void drm_hdcp_atomic_check(struct drm_connector
> *connector,
> +bool drm_hdcp_has_changed(struct drm_connector *connector,
>  			   struct drm_atomic_state *state);
>=20
>  #endif
> --
> 2.40.0.577.gac1e443424-goog

