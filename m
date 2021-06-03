Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEB39AB0A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845216E214;
	Thu,  3 Jun 2021 19:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2D66E214
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 19:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622749538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdL3iApBcvg4MiGgoxpQ3CucoVrg58zMkJEldwLiid8=;
 b=Ci1FzwwpztNh9XtBnQVh8u8UYOVFIPhXXrUNplhO1c443tpZjyqnZ0X9Y5RYcDvfsM5yU2
 HF+pSUNmxbCcDLUA8/xSgL9LaQbveHa4r2E5i3J7QZo3bWKsBI6iR0TuZA8t7x2OxFbxuS
 TAyT+kSJygwPbX4vjBszzZOyKHsplwE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-BIPcqJG0NBK_wAUbHQ4a8g-1; Thu, 03 Jun 2021 15:45:37 -0400
X-MC-Unique: BIPcqJG0NBK_wAUbHQ4a8g-1
Received: by mail-ot1-f72.google.com with SMTP id
 c19-20020a0568303153b0290315c1232768so3785501ots.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 12:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DdL3iApBcvg4MiGgoxpQ3CucoVrg58zMkJEldwLiid8=;
 b=QNEL46WoaSxTdUNCL+S/UwiilffdO8hg8DAkeeJOSqJcT0+/4zR/OZavofqhAha6Yr
 vDMU2ZWykg6KK9FNgOjiaxs8n6cbrlz1qPMB8cHIQS8iLkUmBFV4spq3r1ajv6lQ48p2
 tNdw5tfQt89AS5uF9UT7DyEfd9VaBzeviMMbunDM8aP5kV39uvPMuzIJOijw4xXYwFAu
 Rep8OUje6ZogNmUlC2UKPdqHpgXe5fni3cFHhe5Xf8YkJ1rEUOnX91/Xvu7R3lX4a3MC
 CWmkpt9zJHe2gE98G3jezvQmuhtfxJ2crcB5oS/1rwtk1U3FH9YWmk2cBkQ5yJa2+8MI
 2pJw==
X-Gm-Message-State: AOAM5314PmPCPqsPWl2aYb7UcqH4P8Oea+UgdL7x/x1LDoIZf6zotpXJ
 E3XMDz9BJz8WuzQvzGzoZm7hhUf3OJtRt1/jtxqbZMiYL1ziKsMI8Tmb2vqGrTv2D2DL4iWico0
 HytwkjDfG4K1FxpYcaCRsAPiMhovNS72mcJ0UKY2/WUjJ
X-Received: by 2002:a05:6808:193:: with SMTP id
 w19mr583351oic.152.1622749536175; 
 Thu, 03 Jun 2021 12:45:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUVIaTI8SDTCkQukARPu8i7TT95bPWOCz5FxSQMInH26W1TksWTZihrYr9pzIZKTsjGAbkDIOIGegCFLXmvDE=
X-Received: by 2002:a05:6808:193:: with SMTP id
 w19mr583337oic.152.1622749536024; 
 Thu, 03 Jun 2021 12:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210601142442.100754-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210601142442.100754-1-zbigniew.kempczynski@intel.com>
From: David Airlie <airlied@redhat.com>
Date: Fri, 4 Jun 2021 05:45:24 +1000
Message-ID: <CAMwc25px1ZkCbThbpTtL+Dv+6b9aeXR4igpfC41pTDDFq6Uehg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Add relocation exceptions for two other
 platforms
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, "Development,
 Intel" <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 12:25 AM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> We have established previously we stop using relocations starting
> from gen12 platforms with Tigerlake as an exception. We keep this
> statement but we want to enable relocations conditionally for
> Rocketlake and Alderlake under require_force_probe flag set.
>
> Keeping relocations under require_force_probe flag is interim solution
> until IGTs will be rewritten to use softpin.
>
> v2: - remove inline from function definition (Jani)
>     - fix indentation
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>

Acked-by: Dave Airlie <airlied@redhat.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 24 +++++++++++++++----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99..78b86a7bc39a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -491,16 +491,30 @@ eb_unreserve_vma(struct eb_vma *ev)
>         ev->flags &=3D ~__EXEC_OBJECT_RESERVED;
>  }
>
> +static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb=
)
> +{
> +       /*
> +        * Relocations are disallowed starting from gen12 with Tigerlake
> +        * as an exception. We allow temporarily use relocations for Rock=
etlake
> +        * and Alderlake when require_force_probe flag is set.
> +        */
> +       if (INTEL_GEN(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
> +               return true;
> +
> +       if (INTEL_INFO(eb->i915)->require_force_probe &&
> +           (IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
> +            IS_ALDERLAKE_P(eb->i915)))
> +               return true;
> +
> +       return false;
> +}
> +
>  static int
>  eb_validate_vma(struct i915_execbuffer *eb,
>                 struct drm_i915_gem_exec_object2 *entry,
>                 struct i915_vma *vma)
>  {
> -       /* Relocations are disallowed for all platforms after TGL-LP.  Th=
is
> -        * also covers all platforms with local memory.
> -        */
> -       if (entry->relocation_count &&
> -           INTEL_GEN(eb->i915) >=3D 12 && !IS_TIGERLAKE(eb->i915))
> +       if (entry->relocation_count && !platform_has_relocs_enabled(eb))
>                 return -EINVAL;
>
>         if (unlikely(entry->flags & eb->invalid_flags))
> --
> 2.26.0
>

