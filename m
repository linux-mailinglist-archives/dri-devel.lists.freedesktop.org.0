Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD0BB1AA71
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 23:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD7D10E454;
	Mon,  4 Aug 2025 21:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M7uxFO5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7690810E454
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 21:42:31 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3324e6a27a0so26592361fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754343750; x=1754948550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BibRjQ5YczxfcG6WRzvvUeamoebLWFnSrIxY8TQYGbc=;
 b=M7uxFO5fanHfP0pI0bNt5tIkW1CrDzqPBMHDE16jKW/qM0MZ687Vj32KekGnOo8G3v
 Om/XczyvSaeBunmXRhSuLdm1esjR5U5H8ljsv5HH7xVnWBf54cf8YcPiBH9Dx5T39cQg
 qLQpJqOlR/zI9IrtmNiAlNxPwxD+7MUNDpI3bh8bGAUjBF9/0sR3hcjNCwfzI1SB5GFV
 8qe5ryoatJESZET6q4TMcsv4sRIO9SJ6AWIId11pcs7Ilz02P53yOXVOlIQsjeB3YMGO
 n+DcOb77JLMokSCdqvYQp8Ni+nN9/HlYJWo8S+WiiAqujFNhAu/B9ZNkfTIq1OiY6W2p
 ogOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754343750; x=1754948550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BibRjQ5YczxfcG6WRzvvUeamoebLWFnSrIxY8TQYGbc=;
 b=YjJX/DxOnI9M28VYNxFq88EmdTxOPos4rRU6J+UPH5QR5L7TTRPfbSk4G7kJ4au4fu
 m6qDLTbmoPx2/GATus43TwQU8lXBAJTon2aH13t1jVY9/ybq6s7zl61J5PAAMLsmSMGP
 SH5PmP5hYZgZQXNbTRNV3LqAL49KpDiIXrkKChGpdugYXHeRDdI4ZvVdLXJ9Wz+EmcMF
 CZUxbR5HmuEs+RjXAte1z/W9gX4eGAFvo3G8Wi4Kc/ULO7GW/oPbr2Pn1NdlEhkF9b+w
 Rr0Gi44yd+dDs40gUQhW4Tu3Ki4QJZ0q8rt7zxBgniOiJW9/Mrx9NGvrVw9UT5Hon60v
 4jWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwY6HDnR+5vF/2FssPlbqWOl3bjmA4nJq/h5VLW8aPcTSe0DCuRFE5su+HeX8HzO3V5DVRgLFTah8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeaBF9AajCMZfBURcyDqyhiOlDMmFiIBkmWB+sidiAn3iSgSaZ
 lp4HXGLrL5On08qo3Yxl7+ZM8ny+ezfpOjYlQZiCGyKYT2EccvhGy+oRtgHKJb1UCWuw++3vSaE
 lZGXqOsWaeS/oFt74TEpUAlq6Qy1TqcN4QZi0pTGmnw==
X-Gm-Gg: ASbGncuEAjCZeUgpCS1v8XWs1Pj4fkWfG8ykS8olSI2Lb7CG6hO3WlvcSpcPY1/MzB+
 sMt4r74ocmwPTe5TdaqPS0qaNum2INpz8wF8r0kZUXRbCZGF3LJ9FYU5W9i84FNrmwC9483+PCz
 Y/bWAaB/YXf7+W5ZO9sj2a8roDFqsR5AYmgLs+0hwWlZ34e0BXSZBtktY3VkLrZDGgzJaxLRuyD
 ARwQ7M=
X-Google-Smtp-Source: AGHT+IFevc6Fzoz164jOxM1Z8SDPgIvXeRLhJyRdexOYSjzheOXWHaLebZQ/VtjLGFTbF7bp+XQSanAGy1RLQejd5N8=
X-Received: by 2002:a05:651c:217:b0:32c:b83d:64ab with SMTP id
 38308e7fff4ca-33256778daamr20294731fa.24.1754343749483; Mon, 04 Aug 2025
 14:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250802161309.1198855-1-hsukrut3@gmail.com>
 <20250803165611.GG4906@pendragon.ideasonboard.com>
 <CAHCkknr+w3B0NWM065Rr_d9n9QEak7YmhehByQTdfwYr30RbSQ@mail.gmail.com>
 <20250804213347.GI30355@pendragon.ideasonboard.com>
In-Reply-To: <20250804213347.GI30355@pendragon.ideasonboard.com>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Mon, 4 Aug 2025 23:42:17 +0200
X-Gm-Features: Ac12FXy0phlLWltVfBe2pxMGctR2Sx9XnCESPbNc77AqSDO-4Mu0yImStrNWMmY
Message-ID: <CAHCkknr9JOWxqjMLikJhC2bOHOW_0UbY2YrN5nAGANM3m3y2pg@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_bridge: Document 'connector' parameter in
 drm_bridge_detect()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 4, 2025 at 11:34=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Aug 04, 2025 at 11:24:58PM +0200, sukrut heroorkar wrote:
> > On Sun, Aug 3, 2025 at 6:56=E2=80=AFPM Laurent Pinchart wrote:
> > > On Sat, Aug 02, 2025 at 06:13:05PM +0200, Sukrut Heroorkar wrote:
> > > > drm: drm_bridge: fix missing parameter documentation
> > > >
> > > > The function documentation was missing description for the
> > > > parameter 'connector'.
> > > >
> > > > Add missing function parameter documentation for drm_bridge_detect(=
)
> > > > to fix kernel-doc warnings.
> > > >
> > > > Warning: drivers/gpu/drm/drm_bridge.c:1241 function parameter 'conn=
ector' not described in 'drm_bridge_detect'
> > > >
> > >
> > > A Fixes: tag would be nice.
> > >
> > > > Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_bridge.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bri=
dge.c
> > > > index dd45d9b504d8..387a3b6cda54 100644
> > > > --- a/drivers/gpu/drm/drm_bridge.c
> > > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > > @@ -1227,6 +1227,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
> > > >  /**
> > > >   * drm_bridge_detect - check if anything is attached to the bridge=
 output
> > > >   * @bridge: bridge control structure
> > > > + * @connector: connector associated with the bridge
> > >
> > > "associated with the bridge" isn't very clear.
> > >
> > > >   *
> > > >   * If the bridge supports output detection, as reported by the
> > > >   * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.de=
tect for the
> >
> > Thanks for the review.
> > I will send a V2 shortly with updated connector description and Fixes
> > tag, as suggested.
>
> It appears that a competing patch got merged in the meantime:
> https://lore.kernel.org/r/20250716125602.3166573-1-andyshrk@163.com
>
> It was submitted earlier than yours, and the usual rule in the kernel is
> that the first patch wins when there are multiple similar or identical
> submissions.
>
> --
> Regards,
>
> Laurent Pinchart

Thanks for the update.

Regards,
Sukrut.
