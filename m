Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C067B1AA57
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 23:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635510E02C;
	Mon,  4 Aug 2025 21:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fp98xHVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19E10E02C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 21:25:12 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-55b8a0f36fcso4872737e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754342711; x=1754947511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWDD9vBYiM22iTKsOOWVvregqhqtXuA5Yr6oy6IbiPU=;
 b=Fp98xHVxcJJN06HhVYlec08lrO8gbdVDIQPb1NfTCmD5ldm5c8OcUYFLdzOH0roQwJ
 xFcnggt6pR/EtRi3/AqkRkF21itdV77SHDEm4XpbIkW94h5Ds9EIhll1qkky7eey8/u2
 fnLr0UdyWIUn/Obl1YY9CiMW5diXivPY6sxiGX2DFIq5bnIChmEOJC/sjgsLQ80OehKn
 1RfxOQX6jEXcwNivpKRwBA06FeG3LInavi5BubTcARUJF1WuRrF+0PKZ6THaDAGB7UmD
 t+SEaT+N+aS0SXpYW9B/TVPeKSPEWrgxxZMlFziJv94Rg99CrRJMa+BxD0nZ+5UiMRqj
 85UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754342711; x=1754947511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWDD9vBYiM22iTKsOOWVvregqhqtXuA5Yr6oy6IbiPU=;
 b=K9u296GbrsEf3FDLYg2X9WoWoc0A8YRTzJlA2C4TQC98533btWoiKY7tQae/H83lvc
 5QA0/5p8iiDq6K8tD+WBQadMg+YsbAttWHpKcGDRhmZyX0sDatNu0iAU3shnqMouSep1
 uAAwa3yQNnofrkcZGnHFPwwy81cFyYvwj7un+HmwXOzSk3oLyRHNDQ5TXgz9d1tTUUvk
 qRXuTa+NKdtvBpzjnNBldtAwhaizyXB8I3+rkkmhspF7bduGECRFOXAJgJxrpHlVX6q1
 1cqh3tZjOpFLrX8ig8ZPbRFe6hftIyAhmhpa1jBD+l84y/U+VwGFEJCpQpyq0L5D9/wy
 Zg7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxKG0Pgb/jxmIFcNJg2ozNk/yTCypOOe6cjE76lMlsKhjCl3zL1w1cacsHF24Du3qaRGcJuHWk70U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCxDAI0+Kv3FjaS8t82Xf6GX4/kL8eiu+yydUG3kAnPHJwie3v
 XQojQ4jUDsjSRetz73w5+s8U4FcBRUaIWqcS32oXoLMFarPybK0YA952mU9fUJzLQkUrSPoj5OZ
 Ayf/HNyedidSkG6febP+6tY5RLenNx2A=
X-Gm-Gg: ASbGnctgEAo6Xs5Hb47LMv/TONK+TIvySTWSylCXDU9MA9JM3Z3LlO6XCO0d7ruD4bB
 EkgkCw9Z6XEYuzHPVyNYtyjtsfCqvVcTMEX1pAUCTgrIBL8KnjBYd1w6CVflXxBagw7x2Gbnp0p
 i0XZyaOIbqQYY2F1JIjWZ84mUzSfSLULUY4bcCZnMJPyfcUc/3UokFTrOBuDWywe9ekpXwBbL1V
 fMNjro=
X-Google-Smtp-Source: AGHT+IHwhWuEn1GGHxiRWfbccegSPealqqij9ke+m0NTUfNX+oLlQL7Eg/yMlxItUPZ+g1I2s43Ndj3jMnV9fZ3MNUQ=
X-Received: by 2002:a05:6512:1111:b0:55b:8bf6:5178 with SMTP id
 2adb3069b0e04-55b97afb6camr2328900e87.14.1754342710383; Mon, 04 Aug 2025
 14:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250802161309.1198855-1-hsukrut3@gmail.com>
 <20250803165611.GG4906@pendragon.ideasonboard.com>
In-Reply-To: <20250803165611.GG4906@pendragon.ideasonboard.com>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Mon, 4 Aug 2025 23:24:58 +0200
X-Gm-Features: Ac12FXwL9NH3bGAR7a55WkKenISlJy_mKF87GgDLFxcsdxAffltp7qpduSbCMsw
Message-ID: <CAHCkknr+w3B0NWM065Rr_d9n9QEak7YmhehByQTdfwYr30RbSQ@mail.gmail.com>
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

Hi Laurent,

On Sun, Aug 3, 2025 at 6:56=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sat, Aug 02, 2025 at 06:13:05PM +0200, Sukrut Heroorkar wrote:
> > drm: drm_bridge: fix missing parameter documentation
> >
> > The function documentation was missing description for the
> > parameter 'connector'.
> >
> > Add missing function parameter documentation for drm_bridge_detect()
> > to fix kernel-doc warnings.
> >
> > Warning: drivers/gpu/drm/drm_bridge.c:1241 function parameter 'connecto=
r' not described in 'drm_bridge_detect'
> >
>
> A Fixes: tag would be nice.
>
> > Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.=
c
> > index dd45d9b504d8..387a3b6cda54 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1227,6 +1227,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
> >  /**
> >   * drm_bridge_detect - check if anything is attached to the bridge out=
put
> >   * @bridge: bridge control structure
> > + * @connector: connector associated with the bridge
>
> "associated with the bridge" isn't very clear.
>
> >   *
> >   * If the bridge supports output detection, as reported by the
> >   * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect=
 for the
>
> --
> Regards,
>
> Laurent Pinchart


Thanks for the review.
I will send a V2 shortly with updated connector description and Fixes
tag, as suggested.
