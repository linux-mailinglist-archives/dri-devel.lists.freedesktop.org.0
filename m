Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA923069C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD2189DBA;
	Tue, 28 Jul 2020 09:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C13F89DBA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:34:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so10565003wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Kpaxa27tvA7gAmK8vNONei66g8vEYnvaZGZiq12ka0Q=;
 b=W8DEwawVBbV+taJZMYmflb0Xau5No+QnbcNe1ynL7wRVJdhpGj97/mO2p8qhkB5OGK
 VgeLeWOoimtxNjy5uxDGI6Iz2HWj2NPoNfsxUrQ1Pc3DgqeWzp+mzO1ybPeiU5zI1qqx
 W4eETuZiCyHlgpMWkdT9lP0OJFRR7nEIsw4yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Kpaxa27tvA7gAmK8vNONei66g8vEYnvaZGZiq12ka0Q=;
 b=kMNpgaFMn25jZ8bM+GM+P6OGZMeZXDAkwJhL3WeeG0rsgW0vw92GsIyY9S0TygWNkT
 wUpE+aIDpoJ55xaOzDqO8X33W+ZWzD5fyJH2joad1x3YdOSPuEzCWOxy+cND/8nOyChP
 8SrKZ3NQ75SIjdsciPjdmjgKKpoo4UoaPTHWZoldopEZuyTEQX36BgQZOlWDDSaJUbpc
 q2dQowDhTzoI9eiwUjm3jfCSkLJIkqHYgMp29k2PxuW5Y+5TJ9miLpK/0sRYlzQpMXj9
 7mF4V+Nsp6SFELHWeN4ouufnalIF373hPpXR6WH9x402XCvt3MY3xG/Ruj3N5vKppNmC
 VucQ==
X-Gm-Message-State: AOAM532sORqlu5v39LzUAKPPifKknk8fZFUJMaTo1Ll/0PquNR74B1If
 xLpVfFxoD4zHherh8NzXl1I2qw==
X-Google-Smtp-Source: ABdhPJwdAWhcjv3soArz55h30rXjMTkmopL8vvg9I9cdZFaBg8G1xRooTNbf88MHaxGlcHPVSltWIg==
X-Received: by 2002:a1c:1bce:: with SMTP id b197mr3215041wmb.32.1595928851794; 
 Tue, 28 Jul 2020 02:34:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p8sm17658936wrq.9.2020.07.28.02.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 02:34:11 -0700 (PDT)
Date: Tue, 28 Jul 2020 11:34:09 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 11/13] drm/ast: Managed release of ast firmware
Message-ID: <20200728093409.GF6419@phenom.ffwll.local>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-12-tzimmermann@suse.de>
 <20200728091711.GB6419@phenom.ffwll.local>
 <9105824f-2d8c-e234-510b-e2da7d7d1ace@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9105824f-2d8c-e234-510b-e2da7d7d1ace@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 11:32:04AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 28.07.20 um 11:17 schrieb daniel@ffwll.ch:
> > On Tue, Jul 28, 2020 at 09:44:23AM +0200, Thomas Zimmermann wrote:
> >> The ast driver loads firmware for the DP501 display encoder. The
> >> patch replaces the removal code with a managed release function.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > Hm a devm_request_firmware which does exactly this would be nice I thin=
k.
> > Maybe as a follow-up refactor?
> =

> There are so many ideas for follow-up patches wrt. devres and drmres, we
> should add a todo item to collect them. Especially, devres is much more
> over head in terms of reviews and kernel building/testing tha tit makes
> sense to collect ideas and address them in larger chunks.

Yeah maybe a section with wanted devres functions in todo.rst makes sense.
For devres it depends which subsystem you're dealing with I guess, and how
much they want to see before it lands.
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
> > =

> >> ---
> >>  drivers/gpu/drm/ast/ast_dp501.c | 23 ++++++++++++++---------
> >>  drivers/gpu/drm/ast/ast_drv.h   |  1 -
> >>  drivers/gpu/drm/ast/ast_main.c  |  3 ---
> >>  3 files changed, 14 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast=
_dp501.c
> >> index 4b85a504825a..88121c0e0d05 100644
> >> --- a/drivers/gpu/drm/ast/ast_dp501.c
> >> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> >> @@ -8,11 +8,24 @@
> >>  =

> >>  MODULE_FIRMWARE("ast_dp501_fw.bin");
> >>  =

> >> +static void ast_release_firmware(void *data)
> >> +{
> >> +	struct ast_private *ast =3D data;
> >> +
> >> +	release_firmware(ast->dp501_fw);
> >> +	ast->dp501_fw =3D NULL;
> >> +}
> >> +
> >>  static int ast_load_dp501_microcode(struct drm_device *dev)
> >>  {
> >>  	struct ast_private *ast =3D to_ast_private(dev);
> >> +	int ret;
> >> +
> >> +	ret =3D request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->de=
v);
> >> +	if (ret)
> >> +		return ret;
> >>  =

> >> -	return request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev=
);
> >> +	return devm_add_action_or_reset(dev->dev, ast_release_firmware, ast);
> >>  }
> >>  =

> >>  static void send_ack(struct ast_private *ast)
> >> @@ -435,11 +448,3 @@ void ast_init_3rdtx(struct drm_device *dev)
> >>  		}
> >>  	}
> >>  }
> >> -
> >> -void ast_release_firmware(struct drm_device *dev)
> >> -{
> >> -	struct ast_private *ast =3D to_ast_private(dev);
> >> -
> >> -	release_firmware(ast->dp501_fw);
> >> -	ast->dp501_fw =3D NULL;
> >> -}
> >> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_d=
rv.h
> >> index 86c9a7ac712b..02908d005b99 100644
> >> --- a/drivers/gpu/drm/ast/ast_drv.h
> >> +++ b/drivers/gpu/drm/ast/ast_drv.h
> >> @@ -312,7 +312,6 @@ bool ast_backup_fw(struct drm_device *dev, u8 *add=
r, u32 size);
> >>  bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
> >>  u8 ast_get_dp501_max_clk(struct drm_device *dev);
> >>  void ast_init_3rdtx(struct drm_device *dev);
> >> -void ast_release_firmware(struct drm_device *dev);
> >>  =

> >>  /* ast_cursor.c */
> >>  int ast_cursor_init(struct ast_private *ast);
> >> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_=
main.c
> >> index 792fb7f616ec..e3b7748335a3 100644
> >> --- a/drivers/gpu/drm/ast/ast_main.c
> >> +++ b/drivers/gpu/drm/ast/ast_main.c
> >> @@ -442,11 +442,8 @@ struct ast_private *ast_device_create(struct drm_=
driver *drv,
> >>  =

> >>  void ast_device_destroy(struct ast_private *ast)
> >>  {
> >> -	struct drm_device *dev =3D &ast->base;
> >> -
> >>  	/* enable standard VGA decode */
> >>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
> >>  =

> >> -	ast_release_firmware(dev);
> >>  	kfree(ast->dp501_fw_addr);
> >>  }
> >> -- =

> >> 2.27.0
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
