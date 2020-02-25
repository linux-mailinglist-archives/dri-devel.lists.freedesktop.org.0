Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3C16BA9A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 08:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFDA6E9F0;
	Tue, 25 Feb 2020 07:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD386E9F0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 07:30:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w12so13407559wrt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQMT6lDKStyiOUIYBwkRHyQecoL65OHS2/xGbDrARdU=;
 b=vgSELXD8DgGTQSv5a9IRoU2vtK9mb9ywLlrNtNTfRByEKonxyGGQfz/bGiGZIVWhSg
 BzzgxbqaG//TC38gDoGSIy5avusNbIPE6sjoLz84rZF2c2wFoHfBQ3iwVQrMI5PauN8B
 EAyxHujlLgelVEI1uF2NJcG412aR9yLyioUc3bc4J9XUPxsxMjPPgwc5OcIaWUqLI2Q7
 93jeIzpMQ8sP011Rr83RsF8dVv7vVtfmAIMXl3AGtQRoUT8SByWxj0tGM9EvZUu+4B82
 QpmP/9+h9DlZJurP/vlC3xHOf1o+C66VkrjeuC0eaU2/2gJuU+gCwyy0uf8Rvnn/L0fp
 ZjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQMT6lDKStyiOUIYBwkRHyQecoL65OHS2/xGbDrARdU=;
 b=UY/yctHkT7lwi4wKs0vM7Ql9fpjm407uenax0zh1uKnu6pr+dQENmsEf441HDXknj3
 Bhgg/fRZLM2X5TndK3g7cNyEOB8rfP4Md1YW43wYSztQBBicvUwSYyM1ksu0m9pff0Jl
 nHEtjT43FiAQPNLmAs3A5jF9gtjdRpJg31b1fyxsp3t62ZqJlGQmUMouZ/pS6YZM07ro
 mjDz01xqc81Aj/R8AKwWTEv+he6ZXdxOrXMWhCwOyx5gLgzSxSwgY+rbVOWys3rdSFRq
 YxUz4YUsrbVBqUq9mXAlu8JEkwHP+RhHnTsaj8m7jK/usCJfJh2BFUhonqEebdkN5UYH
 i4hQ==
X-Gm-Message-State: APjAAAVFBpwqu/DU1mTHhxGGWzWSRF9CdZHqbose5nppkg1vCXGoP5Mb
 lQZIeYrJHd/mnSVu5VW319Rf0u50mLYZ6ajlk1tung==
X-Google-Smtp-Source: APXvYqxwdub7/sbabb0IU0ArscIZ++rPosDp5bcpc1f1YhP3DV42pWo8sOtcmqMfJnBEAUHeeC6p36vrruaZ75Dn9nA=
X-Received: by 2002:adf:fc12:: with SMTP id i18mr12634989wrr.354.1582615821594; 
 Mon, 24 Feb 2020 23:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225070545.4482-6-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200225070545.4482-6-pankaj.laxminarayan.bharadiya@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 25 Feb 2020 07:29:44 +0000
Message-ID: <CAPj87rPHFCntSOCx=92HitNxRBkXx3xSft0krkFLzdM2FrDSRw@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC][PATCH 5/5] drm/i915/display: Add
 Nearest-neighbor based integer scaling support
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Uma Shankar <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, mihail.atanassov@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 25 Feb 2020 at 07:17, Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
> @@ -415,18 +415,26 @@ skl_program_scaler(struct intel_plane *plane,
>         u16 y_vphase, uv_rgb_vphase;
>         int hscale, vscale;
>         const struct drm_plane_state *state = &plane_state->uapi;
> +       u32 src_w = drm_rect_width(&plane_state->uapi.src) >> 16;
> +       u32 src_h = drm_rect_height(&plane_state->uapi.src) >> 16;
>         u32 scaling_filter = PS_FILTER_MEDIUM;
> +       struct drm_rect dst;
>
>         if (state->scaling_filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
>                 scaling_filter = PS_FILTER_PROGRAMMED;
> +               skl_setup_nearest_neighbor_filter(dev_priv, pipe, scaler_id);
> +
> +               /* Make the scaling window size to integer multiple of source
> +                * TODO: Should userspace take desision to round scaling window
> +                * to integer multiple?
> +                */
> +               crtc_w = rounddown(crtc_w, src_w);
> +               crtc_h = rounddown(crtc_h, src_h);

The kernel should absolutely not be changing the co-ordinates that
userspace requested.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
