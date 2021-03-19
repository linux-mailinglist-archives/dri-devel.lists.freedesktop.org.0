Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153634267C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 20:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3C56EAA1;
	Fri, 19 Mar 2021 19:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6FA6EAA1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 19:50:42 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so9644705otk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 12:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDSQ9dO3brkYWogoL/VOOZYiL9qOPviQpFWu51SApWw=;
 b=iKi3FSDqY9FNXUKd+pBpbhfI8KJQlRWDZ2vf2MPQ9JyttTwYixP6ldAfaXOATTw5Pm
 KlEsk2xi7pHi1T2ofwisOXqn/9dxKXspbknGI4h0pJT68v/e+4cbBhYr4wCI6xXsYbKS
 qtlHMkzoM//Wmv8cjo0xNaqfIHfzYaifJm55k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDSQ9dO3brkYWogoL/VOOZYiL9qOPviQpFWu51SApWw=;
 b=h9zk5NWiSgEE+agqqO/eYm64NNpOPh5kJZXppqXIPymzmZ2G3cXEhFSuG1Dt82Pdfm
 tnTen8RlLktmCgqgATnI6i2RVm9DmKiFCohuPePTyMtVjQv35KZxjF++Ds4Nae4OPNF2
 L7IsKq9xO3OqnPWtnHNBrz4jr5IJRuErU5mPq/dxtHBehgoWQUV7a3XNsrttbahwO4vl
 3NgwxqyCVu0uuP727igGeviLm/w6dyHKXZRLiLuwbVmG+QG2wx2h9SZcRfWKOtORMm76
 q7Gq2ADYPoqg04JOoK8+cUxhQTZarGTJAfDJTWkiCDzWwB4MJQIJ++LQJhpiD3hdOoW9
 JUrw==
X-Gm-Message-State: AOAM530l/S6ZtkVSqRwGQiIhTjl7lb68hbngyFP1YW/UV25zCFIbjmAo
 QP4Fck6FmvctqCZAIdW1jKoQdxYnXGaWavgpRpiPnAg8+1KdRQ==
X-Google-Smtp-Source: ABdhPJzf/vJfjVTaeiLSzfrQMXKBBytB7g9lGUYyy9NI/t8UjDWyUp9VyZfexdLWe11yCFwuZEX0JCi9TBwD94uMHYc=
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr2353220otl.188.1616183441435; 
 Fri, 19 Mar 2021 12:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
In-Reply-To: <20210319190607.2903545-1-l.stach@pengutronix.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 19 Mar 2021 20:50:30 +0100
Message-ID: <CAKMK7uEjRSVAEXOOft1sF9-Nsr+oyhDDpN0zgMnd3UH4sYXd1g@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 8:06 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Vivante TS (tile-status) buffer modifiers. They can be combined with all of
> the Vivante color buffer tiling modifiers, so they are kind of a modifier
> modifier. If a TS modifier is present we have a additional plane for the
> TS buffer and the modifier defines the layout of this TS buffer.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  include/uapi/drm/drm_fourcc.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f76de49c768f..76df2a932637 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -623,6 +623,22 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED fourcc_mod_code(VIVANTE, 4)
>
> +/*
> + * Vivante TS (tile-status) buffer modifiers. They can be combined with all of
> + * the color buffer tiling modifiers defined above. When TS is present it's a
> + * separate buffer containing the clear/compression status of each tile. The
> + * modifiers are defined as VIVANTE_MOD_TS_c_s, where c is the color buffer tile
> + * size in bytes covered by one entry in the status buffer and s is the number
> + * of status bits per entry.

Might be worth it to go into alignment/rounding/stride requirements
here too, if you know them. Either way lgtm.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + * We reserve the top 8bits of the Vivante modifier space for TS modifiers, as
> + * future cores might add some more TS layout variations.
> + */
> +#define VIVANTE_MOD_TS_64_4               (1ULL << 48)
> +#define VIVANTE_MOD_TS_64_2               (2ULL << 48)
> +#define VIVANTE_MOD_TS_128_4              (3ULL << 48)
> +#define VIVANTE_MOD_TS_256_4              (4ULL << 48)
> +#define VIVANTE_MOD_TS_MASK               (0xffULL  << 48)
> +
>  /* NVIDIA frame buffer modifiers */
>
>  /*
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
