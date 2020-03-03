Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C1178BB9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6013E6EAD2;
	Wed,  4 Mar 2020 07:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 889 seconds by postgrey-1.36 at gabe;
 Tue, 03 Mar 2020 13:07:19 UTC
Received: from mail.theobroma-systems.com (vegas.theobroma-systems.com
 [144.76.126.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D966E8A3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 13:07:19 +0000 (UTC)
Received: from ip5f5a5d2f.dynamic.kabel-deutschland.de ([95.90.93.47]:40860
 helo=diego.localnet) by mail.theobroma-systems.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
 (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1j972C-0005YJ-82; Tue, 03 Mar 2020 13:52:28 +0100
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 05/33] drm/panel-leadtek-ltk500hd1829: Fix dotclock
Date: Tue, 03 Mar 2020 13:52:27 +0100
Message-ID: <175919560.moPVmXkzvO@diego>
Organization: Theobroma Systems
In-Reply-To: <20200302203452.17977-6-ville.syrjala@linux.intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 2. M=E4rz 2020, 21:34:24 CET schrieb Ville Syrjala:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> The currently listed dotclock disagrees with the currently
> listed vrefresh rate. Change the dotclock to match the vrefresh.
> =

> Someone tell me which (if either) of the dotclock or vreresh is
> correct?

The values came that way from the vendor .
And lookin at other Leadtek display datasheets, 60Hz should be the
correct refresh rate.

The display is also running happily at the 69MHz of
your patch, so

Tested-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>


Heiko

> =

> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers=
/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> index 76ecf2de9c44..113ab9c0396b 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> @@ -377,7 +377,7 @@ static const struct drm_display_mode default_mode =3D=
 {
>  	.vsync_end	=3D 1280 + 30 + 4,
>  	.vtotal		=3D 1280 + 30 + 4 + 12,
>  	.vrefresh	=3D 60,
> -	.clock		=3D 41600,
> +	.clock		=3D 69217,
>  	.width_mm	=3D 62,
>  	.height_mm	=3D 110,
>  };
> =





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
