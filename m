Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969B3A9D9B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CF6E1D7;
	Wed, 16 Jun 2021 14:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60BD6E1D7;
 Wed, 16 Jun 2021 14:29:53 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id u30so2782417qke.7;
 Wed, 16 Jun 2021 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s2dm6lcMnXuyN8GaQsvpUNJ+EJn6v08TzDTNDWuGErg=;
 b=u3THyfh4TH56LlT0weSc076G011Wy3ry8CxGT2sNorwxBlSX3rGCJb4wV4CDNsuYVp
 nEF00F6qUEoAtZD9x3K6b0Q7vq5LRjofJV0XilSvHmnd4sQ5UiGfOG4lnHXP3yR4vfVG
 /3zPiz6C4P5xx5nyd9g9y4v8cZmZ1adkxAuqQyD4UJyuZPaMc31cNCeIF3K6La//8qXo
 KvrrDxpNOELSZwKR9TJquhuwKyHw54UloxmVwoAhbtzQQOz1vlzPvk+NdhrqoDueecPe
 tdm0oj6ezj8s+XaCkqjm+c4G8rhjpEX+mbfv3G1s6eUKask+LZ3qhs+EvoGOyKxHoNIP
 05WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s2dm6lcMnXuyN8GaQsvpUNJ+EJn6v08TzDTNDWuGErg=;
 b=sOdUl/mssvyarGmo2sYfnbRGsmQCtTBPsD927yEH7yYOIWlt64hysPV0n1RzqNPStH
 XBZZaehtoB9xR6br/jJ18wQJTbN5QpBDUaQG/53Xuer4fuvI9UvIRXW35jhMy7DHLV+e
 /OU81J83qnxtXBM1lKqkl6tfEnOG9QJbkq1PGZpvXlOZzXSjiYWTZq9BjT9XqEczsDBH
 xEqwsQIAc8KmgGqi6kt74QEXvQIWof8byBVobtGi/DInuWmf1y4tACtoyRKqDzF3k8T1
 Y51jatNO/dNjtwFZ7Vcm/2D+SneU5YopyXKhRrhmxOPTXzuLWe+YnVpG3nMP006Aq8iI
 AG/A==
X-Gm-Message-State: AOAM531xDThZsIbGZeNNPOAxOUaEs4Gx/c4y4WIZ9pV93XGfIWcUHxhW
 6Y4rJwLbcv9pto5wfKmKfbZ0tnATjkVLECB0i/sOTKeqTlw=
X-Google-Smtp-Source: ABdhPJwJbZnu00wNRVIfPlxcX1IRr/fA34VSBPBN1aLgsMy8cnRE0R5aUwFCfvw/Qo2ND84v9tfnr+EHKbyt9xabhds=
X-Received: by 2002:a37:b1c3:: with SMTP id a186mr316282qkf.17.1623853792996; 
 Wed, 16 Jun 2021 07:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210614092227.97421-1-matthew.auld@intel.com>
In-Reply-To: <20210614092227.97421-1-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Jun 2021 15:29:26 +0100
Message-ID: <CAM0jSHPacC6S6u1eCgaDUd6UNNJV5UgqQSBzRbtNXSzw3mdLyg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: allow DG1 autoprobe for CONFIG_BROKEN
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Jun 2021 at 10:22, Matthew Auld <matthew.auld@intel.com> wrote:
>
> Purely for CI so we can get some pre-merge results for DG1. This is
> especially useful for cross driver TTM changes where CI can hopefully
> catch regressions. This is similar to how we already handle the DG1
> specific uAPI, which are also hidden behind CONFIG_BROKEN.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>

Daniel, any objections to landing this?

> ---
>  drivers/gpu/drm/i915/i915_pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 83b500bb170c..78742157aaa3 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1040,6 +1040,9 @@ static const struct pci_device_id pciidlist[] =3D {
>         INTEL_RKL_IDS(&rkl_info),
>         INTEL_ADLS_IDS(&adl_s_info),
>         INTEL_ADLP_IDS(&adl_p_info),
> +#if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
> +       INTEL_DG1_IDS(&dg1_info),
> +#endif
>         {0, 0, 0}
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> --
> 2.26.3
>
