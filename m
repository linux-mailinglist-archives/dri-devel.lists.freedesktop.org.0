Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AFA4D6061
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 12:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136C710E91A;
	Fri, 11 Mar 2022 11:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C798910E91A;
 Fri, 11 Mar 2022 11:07:15 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id 11so6960395qtt.9;
 Fri, 11 Mar 2022 03:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1g8yRSeSmM0WxoX0hhQeQIncoLkwBju3aRuAOzsfjlM=;
 b=mnKb/A56ZsBsmYytSo9eaa0ZMHVtBf0GDuJ62smY0YJauEHGROKSHa+ySxRArUjEkD
 dpdi6rKvuz7Kyjh3Las3+hvdXuRMsZsdCP9gukCJcbqpa56j+711Djy+App5rDK4dG+V
 jeXlMRMiTl07/zaY1hIXmvEE620Tn59HyHPkWoNKVK4DItBBpn+tG3puHMcWwDlFqRdu
 l0m0Oiyx+bdLHLgBEnILaAeyWlpNV8t4uAY/KQmObSr/VJ8wxeQvAuxtrB7lPy8aVdzW
 gLzPPNbAYP7oryyL3lRoPyn6V0fBP7H4r1BSYDaqZsvR73diTNXN754+foMyROnS8aQg
 x+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1g8yRSeSmM0WxoX0hhQeQIncoLkwBju3aRuAOzsfjlM=;
 b=PZWOwhniNY+oemn5b/LAHyruB6uCWWp5vz7qz06wJPFMMf0vsN5lec5JyBobZT6gmY
 N5qM+Ae+vc5WKhQWQ2YnBJJlBxVTMld4P/gVw2COkDwRkXuVSgbaXwfb9CONHMpS9CBX
 n4noBnurIKJBnUdA5BJD9W5wsGZOf8Ro8N+jd3CpXZmWt72yHxwLDh9b8v2gTZxmXE7j
 L1gU7fCH2t5ikqE3sy++lnp8iq3AcyorNh9VJsXZYeZ67D88+WUX/rqtmf8l55Cx/Pt7
 3q5ywyq7nYyzyaXM9vlQ5ltpfEYzYQv9EI/3Fo/ztsE3NxJEFEH9Am+M9AgYKiE+qTcK
 HXpQ==
X-Gm-Message-State: AOAM530erDd2S6YFSYrs0jeVl4cYhXfnkCldGwGgmP/9pQesL2cbt+68
 N9Ffe1fefPo/XRhoJFk4ngkFuctVxLkVOTobNDw=
X-Google-Smtp-Source: ABdhPJzrbnfd9WQt6Bq0pZLQSZdWgEzVmyEUvbe5t7FUUY9AM16QZZWIn/ElkKzsiqprDrlay5J1TOcsFzqSN/hgRj4=
X-Received: by 2002:ac8:570c:0:b0:2e0:29f:4fc2 with SMTP id
 12-20020ac8570c000000b002e0029f4fc2mr7796415qtw.645.1646996834742; Fri, 11
 Mar 2022 03:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20220310122751.89693-1-matthew.auld@intel.com>
 <20220310122751.89693-7-matthew.auld@intel.com>
In-Reply-To: <20220310122751.89693-7-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Mar 2022 11:06:48 +0000
Message-ID: <CAM0jSHOUNcUX98h=qCohi1xL7TAM3xqyRWH6HPLanmdTLorFww@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 6/8] drm/i915/display: Check mappable
 aperture when pinning preallocated vma
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
 Ap Kamal <kamal.ap@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, CQ Tang <cq.tang@intel.com>,
 Chris P Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Mar 2022 at 12:28, Matthew Auld <matthew.auld@intel.com> wrote:
>
> From: CQ Tang <cq.tang@intel.com>
>
> When system does not have mappable aperture, ggtt->mappable_end=3D0. In
> this case if we pass PIN_MAPPABLE when pinning vma, the pinning code
> will return -ENOSPC. So conditionally set PIN_MAPPABLE if HAS_GMCH().
>
> Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: Ap Kamal <kamal.ap@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

This at least prevents incorrectly using PIN_MAPPABLE on discrete,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_plane_initial.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers=
/gpu/drm/i915/display/intel_plane_initial.c
> index 5227e5b35206..f797fcef18fc 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -51,6 +51,7 @@ initial_plane_vma(struct drm_i915_private *i915,
>         struct drm_i915_gem_object *obj;
>         struct i915_vma *vma;
>         u32 base, size;
> +       u64 pinctl;
>
>         if (!mem || plane_config->size =3D=3D 0)
>                 return NULL;
> @@ -101,7 +102,10 @@ initial_plane_vma(struct drm_i915_private *i915,
>         if (IS_ERR(vma))
>                 goto err_obj;
>
> -       if (i915_ggtt_pin(vma, NULL, 0, PIN_MAPPABLE | PIN_OFFSET_FIXED |=
 base))
> +       pinctl =3D PIN_GLOBAL | PIN_OFFSET_FIXED | base;
> +       if (HAS_GMCH(i915))
> +               pinctl |=3D PIN_MAPPABLE;
> +       if (i915_vma_pin(vma, 0, 0, pinctl))
>                 goto err_obj;
>
>         if (i915_gem_object_is_tiled(obj) &&
> --
> 2.34.1
>
