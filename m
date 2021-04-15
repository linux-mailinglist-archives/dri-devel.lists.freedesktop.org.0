Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D20360A73
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 15:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3396EA4B;
	Thu, 15 Apr 2021 13:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C26EA4E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 13:25:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a4so23324215wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WywktdEbTtzyljlORRM0CB3DNs+MqO2ZnTXlL0mv/o4=;
 b=fQWYTCh/TbjCAQTokqLEmhTY6UYkMgAtqQgyvIaoO5iJfn/4o83vQ0WPY9Fp5Vvd6P
 FZxWCUA2GYIyRZT7ZLBFE6m0f0sow1XARVuqGuS/OjaGYRttaQ3M1u0FGHzUd51T3uE4
 vp1EcF40d4BND1jY2djYa5V8Caf+d+u3NZVko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WywktdEbTtzyljlORRM0CB3DNs+MqO2ZnTXlL0mv/o4=;
 b=tqtd6VYkc6tFoZA2wDtkc5XHzzYBbT4yOjPUwqLo9i1q6ce87gjt2EGJd4aoEh10V7
 Xd47abw2QiaTbBnUWdbrRj3JsI1VeLa7CJNN7BbqwctvR1B7qeD3aYkALOKTRSYv/fK9
 CIVmi71VwQseJ61fwX3AkCsyModlI0EnuuGN9nq1YRjgJsvcTty91esKsVOISLa7ts95
 GO6T0WhcZ6rgwK8GnSP+vecDLphxzd5zInv573QB7q+SrM28U7OqEV2BoTE2eo++Lpdi
 lss/l1f2Wcz8TYEWgzL8qk1h3MhHsfjqvtkvPNHto6ZFtKQq9ZsUvJrDRtnVNfd+fvOf
 US1Q==
X-Gm-Message-State: AOAM5331CMPtLBDnE4dOH7C4A9dHmZAMunt5SN2uh8J3HRNUId42Thw0
 X80FApB17wysIR76dd5aY6gNPQ==
X-Google-Smtp-Source: ABdhPJxLMCuct5x6wsG1F35jUQ1IctQaUuhskZi4yoFI2skonqWnPs46xtoE/OTn1mdUJDcitP/2PQ==
X-Received: by 2002:a5d:590d:: with SMTP id v13mr3464142wrd.85.1618493101165; 
 Thu, 15 Apr 2021 06:25:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l9sm2643631wmq.2.2021.04.15.06.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 06:25:00 -0700 (PDT)
Date: Thu, 15 Apr 2021 15:24:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <YHg+qtZQxitl1m7g@phenom.ffwll.local>
References: <YHg4nz/ndzDRmPjd@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHg4nz/ndzDRmPjd@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 08:59:11AM -0400, Rodrigo Vivi wrote:
> Hi Dave and Daniel,
> =

> Here goes drm-intel-fixes-2021-04-15:
> =

> Display panel & power related fixes:
> =

> - Backlight fix (Lyude)
> - Display watermark fix (Ville)
> - VLV panel power fix (Hans)
> =

> Thanks,
> Rodrigo.
> =

> The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5=
ef:
> =

>   Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)
> =

> are available in the Git repository at:
> =

>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-0=
4-15
> =

> for you to fetch changes up to aee6f25e9c911323aa89a200e1bb160c1613ed3d:
> =

>   drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when disabl=
ing the panel (2021-04-12 08:00:33 -0400)

Applied to drm-fixes, thanks for the pull.
-Daniel

> =

> ----------------------------------------------------------------
> Display panel & power related fixes:
> =

> - Backlight fix (Lyude)
> - Display watermark fix (Ville)
> - VLV panel power fix (Hans)
> =

> ----------------------------------------------------------------
> Hans de Goede (1):
>       drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when di=
sabling the panel
> =

> Lyude Paul (1):
>       drm/i915/dpcd_bl: Don't try vesa interface unless specified by VBT
> =

> Ville Syrj=E4l=E4 (1):
>       drm/i915: Don't zero out the Y plane's watermarks
> =

>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 1 -
>  drivers/gpu/drm/i915/display/vlv_dsi.c                | 4 ++--
>  drivers/gpu/drm/i915/intel_pm.c                       | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
