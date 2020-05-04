Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A761C37D5
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 13:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D21A6E358;
	Mon,  4 May 2020 11:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700B6E358
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 11:17:27 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id i27so8498438ota.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tci+aboVrvmepuke9y1xPKqV0aJlG3W09zNvD7ffmJo=;
 b=BV28fT3BzTcyGJ1hbkMQHXQx1T3Vq2f+BvTAB6FnPZ5D4/24xlQSd8YGzdxmjy7QHi
 ixWs+WX9aLlDYn36p5GTjxMXX7UKbPZ5onGUbkB55atiGEngyZ0sU3Nw2pPeK/7M15uc
 EcY2AFhm3iw7LLAij2VIYLFZKIWHFx497/m/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tci+aboVrvmepuke9y1xPKqV0aJlG3W09zNvD7ffmJo=;
 b=Ctox4yg8LfoQN8S4cdLTP3Le9qpcdeTGYfFURueVb8vzn+Bz1mlIPqCybzdMUAdAEz
 QCyqoOoMqXvAXXjESK3P1fS2uv6Od0e8FLGwr4USbut0B45mdz9OcjHd98doL+WlRqqU
 9i+ZOC2LkQTiEZx4P1WyFJThHDW9PilRZUol7AZTY+LCQBt16LxOTL0jzExpXtFHgLmr
 i9IJxeP7GpdJlv1XJNXNjTDrJwCtldixr9DSptdwxahLBLiGCcZlZLIgwrCzfKW74O7Z
 RpJKNmbDUm3V3SCqKOmN92HBXp1gxjSgVYLq+xGXGN2F1GSIdyH/u2oaTP4YebJJj142
 buhA==
X-Gm-Message-State: AGi0PuZxvHSt5hWfUIMfUU6xCfArK3GqFrWFV5Qd/C7rMiE8Fsvu66tt
 J1mtAsUt91FMgdGp53mzfXlQ57u79TAv1i4lzoKtFuUgZHg=
X-Google-Smtp-Source: APiQypLsmSb/n7Tj0AyXe710/w99NsidkZ+ioQCIHReCguIKGW7RkkRPfbpQH0s7oQs/D/4b64Ey98RwFCUQPlOC3bI=
X-Received: by 2002:a9d:7c92:: with SMTP id q18mr7884749otn.281.1588591046976; 
 Mon, 04 May 2020 04:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200504090843.27074-1-mika.kahola@intel.com>
In-Reply-To: <20200504090843.27074-1-mika.kahola@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 4 May 2020 13:17:16 +0200
Message-ID: <CAKMK7uHb-BADzBcrFgpopq0qQSB=WAQbmJJs=OdypqpSmH+X0w@mail.gmail.com>
Subject: Re: [PATCH] uapi/drm/drm_fourcc.h: Note on platform specificity for
 format modifiers
To: Mika Kahola <mika.kahola@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 4, 2020 at 11:08 AM Mika Kahola <mika.kahola@intel.com> wrote:
>
> Make an additional note on DRM format modifiers for x and y tiling. These
> format modifiers are defined for BDW+ platforms and therefore definition
> is not valid for older gens. This is due to address swizzling for tiled
> surfaces is no longer used. For newer platforms main memory controller has
> a more effective address swizzling algorithm.
>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..3e56c24cabb6 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -356,7 +356,8 @@ extern "C" {
>   *
>   * This format is highly platforms specific and not useful for cross-driver
>   * sharing. It exists since on a given platform it does uniquely identify the
> - * layout in a simple way for i915-specific userspace.
> + * layout in a simple way for i915-specific userspace.  The format is
> + * ill-defined for platforms older than BDW.

Hm this is a bit confusing, since you're just adding a new sentences
and not really clarifying the paragraph overall. Right above we have
the detailed description of the modifier on gen8+, I'd replace the
entire paragraph here with something like:

"Note that this layout is only accurate on intel gen 8+ or valleyview
chipsets. On earlier platforms the is highly platforms specific and
not useful for cross-driver
sharing. It exists since on a given platform it does uniquely identify
the layout in a simple way for i915-specific userspace, which
facilitated conversion of userspace to modifiers. Additionally the
exact format on some really old platforms is not known."

That way it's much clearer that the specification is well-defined and
where, with the old stuff as exceptions. Your patch kinda makes bdw+
the exception of the exception, and that's hard to understand.

Cheers, Daniel



>   */
>  #define I915_FORMAT_MOD_X_TILED        fourcc_mod_code(INTEL, 1)
>
> @@ -371,7 +372,8 @@ extern "C" {
>   *
>   * This format is highly platforms specific and not useful for cross-driver
>   * sharing. It exists since on a given platform it does uniquely identify the
> - * layout in a simple way for i915-specific userspace.
> + * layout in a simple way for i915-specific userspace. The format is
> + * ill-defined for platforms older than BDW.
>   */
>  #define I915_FORMAT_MOD_Y_TILED        fourcc_mod_code(INTEL, 2)
>
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
