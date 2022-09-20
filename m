Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3BB5BDFE6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15F10E425;
	Tue, 20 Sep 2022 08:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0502310E425
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663662176; x=1695198176;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=Qn8LouPo1T2Xmc8mU1/EhVygAHSmnh4c38e4RXzE/qI=;
 b=Poumq3X2W13Npk9rRFQJ8hr/pGFMsCiCF0AqkuLSjpP+2HVhGSqlk/q9
 mth+XfoTa7WKUp/FNPp5IWU5a4s05d/Kf4MJUJtIRHw/KfB1/KVaeYpTK
 htcJnJCUymq0+I8qvC2qKKhkLBYaRTpQFFfdwVb+qBzlkkNrWXyMlfeRd
 NDnoWoDZlZzTRKbx/CtpmHtaqNPnQdItO56YxWVJCaZpx3VaQH359m3gR
 EEjvAXZ2u+c06WjEvPUpJ6n98dCtLOE4AApam7yneFpDX/4VTRhhcrW8e
 QchM6zB+Y8Lnnd3wO4WKQzbPYwPurGUnvUvIewRXREXiMEKhWwaVwNg0W Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="297225124"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="297225124"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 01:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="947569540"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2022 01:22:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 01:22:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 01:22:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 01:22:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkT2pvrutAGISQPWLK75Ffv4WieJGkaE+a687kAHZpUBAy1J62Bk+iUjujF1KOK4AjFFBPfdOW7CNPaz0SY2uVP+DKLpbHokUcW1mBhMjHG8yvixS94zoHS7OvCCnWFJEx2blC4Xrqrso6OzNPndht+exGHa4fSN+lJiQPzyeCAneHk5ZBKSWYFQds6GTf5XJzuoK3DQBx1r7Uc92jFyw5+FHpr/ChJxnliPxEAMs/x/jNTkSo3h02w5My2IWC82eWTB/hIsDLnyFSM+PZN4UyeE6zYM0+8717bBB+Z/vjl8rVwb+P67L48G1xSThGaMi8oS+iVmZlWZY9K5QFjUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+uCVdTi6cmOpH+qe9sdvWtZrA7lVcAcscook+cDExA=;
 b=TNWMpGlDRPdObuQUtDwA9Z8GgQdFNUjFP2yzR89EZ8Xda8UmnWaqRGubmWrn0ruCdDWGqjwWMdvaOnrTpUeZC8LJZZGVTOrxiLip8UT+A1X94NciE2L5kqWw6/WD0hKIz2eHsUiFWu9PIZZyZx1hcdEFyNbvFbT7nlWPsHl0ElOXQrG0zXJrwTvNM0tem6xxQaMwIYoWXTq7NQ/avrRNsGg/yiLPJ+vz2Wix3XZklV/c5v9OPMApto+nEq7wxODpbpwm0BEXNU4Jm+pls3S4ZrQ0Jh7wOqJzs6SB/IF+xPmR/4HnoTG1jUG8w+0ZSbWtrEJDQPq1VqXkNlB6k66thw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Tue, 20 Sep
 2022 08:22:40 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::d857:c8b:2a3f:6bf4]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::d857:c8b:2a3f:6bf4%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 08:22:40 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH v4] drm/edid: ignore the CEA modes not defined in
 CEA-861-D
Thread-Index: AQHYzLmBqIUrc/V7hkykjATxU0ov7a3n4M2AgAAXtpA=
Date: Tue, 20 Sep 2022 08:22:39 +0000
Message-ID: <SJ0PR11MB58944CA27943062C69693C62F14C9@SJ0PR11MB5894.namprd11.prod.outlook.com>
References: <20220613122655.12432-1-william.tseng@intel.com>
 <20220920062316.43162-1-william.tseng@intel.com> <878rmepmko.fsf@intel.com>
In-Reply-To: <878rmepmko.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5894:EE_|PH7PR11MB6953:EE_
x-ms-office365-filtering-correlation-id: e3be7e50-e41b-4436-5b75-08da9ae1486b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rO03q4tm1X+fQgr5SCZmLIqRrvdaXsjmUzEnMjAlG3KrHNJ1K17oBFbY8/oJa7zpBGfQ34gipSy8boduLqjUJ0WlLl8umy35ZOuvVIgfMRidHYuUHLc7PU7wDnD2yzbrxHy2ne94QNUi8T3YujC2pi15c4QuNumlcNlIP452WptAagvaE6hry5YVxY7TtStA+WN3uYjvLOX3+ldjD91/N8TjaXYp3bUvUKa18oZo6v5AgAAWLLnlOQu1h2o/NpsKL7JhwFr9qi8Plb9S4lSaeh9yC+TycjXOxirjqksuXTs9KUtCqfwCNbpMgfI3s65aMnJjChZPmtkh4tAamSsCufh3dEExfy5oQt5YrG5tl0hWOHD28vvqbc4T8y/w88ZbskNyoLED2thCLEi83sbXQNAX0E57McxOWcN1p2at2BCwrXi1z5eohWfog/iJQHPPU1vrLXtTMBFmBaNinRZiHw+/c8iDQjhsTK5qjciTH5i4SJ5uqxxZSLV8t60s+2Ip8XU2ZewYw7cJBzlUwDvlgekhTIP1hCQZhcalhqO2xSInZNDBXu/p9AQc4CHxwKsksOpwfLkYB23niVMvD3YStdpse4DoZUfeJMBcJr1gOIongbWfDsG2WC3dTGOwZiBqUpDOmIrFVl37FMHCFFKTnwLUt0ekqS078jvpI8kvOaU8LkVPyJeSoLfSW46ar2BBFF4xCpCPDPWwD8Rhzt4SSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(66476007)(478600001)(38100700002)(122000001)(86362001)(38070700005)(71200400001)(82960400001)(5660300002)(7696005)(64756008)(8676002)(4326008)(66446008)(186003)(66556008)(66946007)(76116006)(110136005)(2906002)(54906003)(316002)(8796002)(8936002)(41300700001)(52536014)(83380400001)(66574015)(966005)(6506007)(53546011)(9686003)(26005)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i2vF4v3bdEHJjnGNS/fowaJxMm9rCVVfhCHQbZmnMPDkyQf+s482DyNRPt?=
 =?iso-8859-1?Q?Hmn02KXVoUphcNCtP9SxiA2GXMfl6EKszHBk65WWW1IK2lfeew5heNfP3W?=
 =?iso-8859-1?Q?Szu5vb/hnCUcohwEtZ/vxOCCknL/UeWc0iqGQ7+yzrHUWm9Zl5eBR+/89+?=
 =?iso-8859-1?Q?527jl9e3b3raG3Samoui/A3RTQ75/PXGWHcv9vVHsk5qe3LottszOa4Rio?=
 =?iso-8859-1?Q?Kl1zILVokAIJsNiRxLtd76s3CWNUuZ9ncizfRdAQygki1u3Pl1eKp+1Drl?=
 =?iso-8859-1?Q?rz6+hmhGbeFpWp6EV3sVhBXQZoRS53Rr9A9zwj5D8xn+XdP7knMVNm8YHp?=
 =?iso-8859-1?Q?GPwYjvWXu7YoqQPtC7ww008RYjCTnngQZ3jXDAHvurIzihOwiuzQ38iBle?=
 =?iso-8859-1?Q?QU4sE8IrsTNf2tWJbov7lI00wTBTIiFn+W/z/opwOpewiE4TMMIuBPVwzY?=
 =?iso-8859-1?Q?Gk8d09OMyRrJHKdehJCY/XAMGFrTZbSftfZ2/FBKtKSb55UIFB2G1aC0qm?=
 =?iso-8859-1?Q?bi6noEfcQQQTKSFTfjQH+7fRx3UmE73Hce60XDGnwyFlTmzUCmBQna+WR0?=
 =?iso-8859-1?Q?f8YgFwPX6HzIWALRh41ga85sOVMBTybRpLkub+hGl0d4MJz8FKeHStShKi?=
 =?iso-8859-1?Q?E/WI15Mw6V2ehIiRJ4hqzIIv/WoqrSi07sJRrvFyfjAdZy/i2zr0oB0wR0?=
 =?iso-8859-1?Q?V0YveQEfPRs6bbOvUT/y3yZdoIv1VOsQeo1TiyqbPhNYaxnOOTaYmc+FAg?=
 =?iso-8859-1?Q?xVIIxARPDpiXNvJ19/dnAqye3dHuebs0dx6cCWYxdkHUgOn0L20Nkgx7WK?=
 =?iso-8859-1?Q?QiyGz2WP55EeUD1xG6TC2if03Xcp58p6t7DrM+wgYjl3Lzj6ypyhBMiT80?=
 =?iso-8859-1?Q?2/tQxYah6F6+4DUhoDmQx34oOTRC7Sp0qFE4g94eRL9IMMjzDOpRQYPBkd?=
 =?iso-8859-1?Q?WfGeUknhLfFrd71SgSN2Y6NaoaBIzCKzEOrw2xe0g0NpQRpwEFiO9zbMq6?=
 =?iso-8859-1?Q?P7JjkBBAtobgQ3icfot0Okn/ET2YBkxb0rdKoSF2JsQ4JY822ab1tVRmKE?=
 =?iso-8859-1?Q?JwrZ2z2qqKNAcrdDD+x4iO2ochxekILvO3f7KkOjuV2dN5/QaXLm89BJyO?=
 =?iso-8859-1?Q?7lhFzaHUZYh1GoOtHZXnNOHwOVwJZ2pVPgmCE9FVPp3cMsRgS9nymtxnjE?=
 =?iso-8859-1?Q?a8v2kdRtDSwDBWDhYO7y51IfEQuNULZpNk5iyxGxGzBldeYMXGX2jk3JmE?=
 =?iso-8859-1?Q?0kZW8uToSDrZIp5TTwI2ohkh8DgO40KrfvTNm2vh4VOJnEdbh3IhEiYT8L?=
 =?iso-8859-1?Q?lU1A2WnuQbdxacXuUjqMF1aubXsnzgEbcuf+vcYokSK+Taju9DwQHuwE7A?=
 =?iso-8859-1?Q?k0/Jd0kAKMwx7j68GjQ3zf4rvu7kyAqAqE25+DkNvnTQzikZO6Hfe5STaM?=
 =?iso-8859-1?Q?ZbSQB5P0wi0Fx5qPot0Ppj3dC8UHQu8bsL4BahPNaGSUvbBC7/l1QEheIA?=
 =?iso-8859-1?Q?4TxEiWYTM8eUhYMrv8axPdqAQ1Cn+MvqtSEWn4mp7LMaIXbbSPsYaB9Co8?=
 =?iso-8859-1?Q?X5faAd+zYLC3T/0c4sR+l/CocJ+41dyoccHiHt+uqNIcWavUfGkgLtgsDW?=
 =?iso-8859-1?Q?t7zgxCKEzwcf84a4UVMlCkmTqXgLIcJBMa?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3be7e50-e41b-4436-5b75-08da9ae1486b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 08:22:39.9504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PszovxVrB3kl5EzveT9RaH7T1K6K4t72z/sa0FNO8ub4H93KAo8jOu/sktsIYUMfvL/hdusSMsmOeXeft+1Vjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
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
Reply-To: "20220920062316.43162-1-william.tseng@intel.com"
 <20220920062316.43162-1-william.tseng@intel.com>
Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>, Wayne
 Lin <waynelin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For EDID, please refer to the attachment on the link.
https://gitlab.freedesktop.org/drm/intel/-/issues/6153#note_1558419


Regards
William

-----Original Message-----
From: Jani Nikula <jani.nikula@linux.intel.com>=20
Sent: Tuesday, September 20, 2022 2:49 PM
To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop.o=
rg
Cc: Tseng, William <william.tseng@intel.com>; Ville Syrj=E4l=E4 <ville.syrj=
ala@linux.intel.com>; Wayne Lin <waynelin@amd.com>; Lee, Shawn C <shawn.c.l=
ee@intel.com>
Subject: Re: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-8=
61-D

On Tue, 20 Sep 2022, William Tseng <william.tseng@intel.com> wrote:
> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
> higher vic than what is defined in CEA-861-D.
>
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
> displayed and the video format is indicated by both SVD (with vic 90=20
> and picture aspect ratio 64:27) and DTD.  When connecting to such=20
> sink, source can't output the video format in SVD because an error is=20
> returned by drm_hdmi_avi_infoframe_from_display_mode(), which can't=20
> fill the infoframe with picture aspect ratio 64:27 and the vic, which=20
> is originally 90 and is changed to 0 by drm_mode_cea_vic().
>
> To work around it, do not set the vic 0 so the corresponding mode may=20
> be accepted in drm_hdmi_avi_infoframe_from_display_mode() and be dispalye=
d.
>
> v1: initial version.
> v2: change the logic in drm_hdmi_avi_infoframe_from_display_mode().
> v3: fix typo.
> v4: add revision history.
>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: William Tseng <william.tseng@intel.com>

Please attach the offending EDID to the bug [1]. I won't ack this before we=
 see the EDID in question.


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/6153

> ---
>  drivers/gpu/drm/drm_edid.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
> index eaa819381281..3c6a4e09b2d6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6640,7 +6640,8 @@ static u8 drm_mode_hdmi_vic(const struct=20
> drm_connector *connector,  }
> =20
>  static u8 drm_mode_cea_vic(const struct drm_connector *connector,
> -			   const struct drm_display_mode *mode)
> +			   const struct drm_display_mode *mode,
> +			   bool is_hdmi2_sink)
>  {
>  	u8 vic;
> =20
> @@ -6660,7 +6661,7 @@ static u8 drm_mode_cea_vic(const struct drm_connect=
or *connector,
>  	 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>  	 * have to make sure we dont break HDMI 1.4 sinks.
>  	 */
> -	if (!is_hdmi2_sink(connector) && vic > 64)
> +	if (!is_hdmi2_sink && vic > 64)
>  		return 0;
> =20
>  	return vic;
> @@ -6691,7 +6692,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdm=
i_avi_infoframe *frame,
>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		frame->pixel_repeat =3D 1;
> =20
> -	vic =3D drm_mode_cea_vic(connector, mode);
> +	vic =3D drm_mode_cea_vic(connector, mode, true);
>  	hdmi_vic =3D drm_mode_hdmi_vic(connector, mode);
> =20
>  	frame->picture_aspect =3D HDMI_PICTURE_ASPECT_NONE; @@ -6735,7 +6736,8=
=20
> @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *fr=
ame,
>  		picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
>  	}
> =20
> -	frame->video_code =3D vic;
> +	frame->video_code =3D drm_mode_cea_vic(connector, mode,
> +						is_hdmi2_sink(connector));
>  	frame->picture_aspect =3D picture_aspect;
>  	frame->active_aspect =3D HDMI_ACTIVE_ASPECT_PICTURE;
>  	frame->scan_mode =3D HDMI_SCAN_MODE_UNDERSCAN;

--
Jani Nikula, Intel Open Source Graphics Center
