Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E646EF9F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D0510E634;
	Thu,  9 Dec 2021 16:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128410E116;
 Thu,  9 Dec 2021 16:23:05 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id u16so5560042qvk.4;
 Thu, 09 Dec 2021 08:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H5gMk/Ll3lKHidyq5YhvRSlIyK9BJM0aB84Iyd3NPRA=;
 b=fHfqMwJ8P2ySuZkcCMm093Db0SEkQtUsCIJGANCsX7WewIsWR7lAFnc63d8RGtcSMa
 suVJnB64LChfjkmCE/Ntj5a56ePCBbu3XyEzugHT/0mO7Np17bqtwY5m0lq+QyhGE56S
 LezoCti1eKqfOO5bzutWNj30dy+ILf46yifkh/Tu6a7XDWJ724xNNelhVA8XQm4Xy7zP
 MxGM35UDEfjUYj3mj8oUVkW66F/0QgyN4aT6uDC0t3AGRp0jplENY87MWk/IqyfPW5+w
 P4Khsq4nxKee0LtUqsT45RrHy/phBIlutAlFktb8OMdDJEQHTtryDCxWcgJ2sn3HE1+7
 oPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H5gMk/Ll3lKHidyq5YhvRSlIyK9BJM0aB84Iyd3NPRA=;
 b=5+j5zeTLwyxhk14xhum7IEfbI8hhPboTELTcOWCvfUNz0DG1ZAicZMUxI45UHPvxuS
 YJl9HdzC8yNoPK+OVM6AZKg6ZwfJP59EZMMudKrjJbYfC0AYQfwfCK3rW+IjI1SjlwNE
 h1Wk/PRXj7VoJqOnXmB3rD0u9QRA1kSQGKyPS1SMylmIk0EJ1rObfUHMaBYatPeO5CE7
 omaDfY0EhHjhFdQQ4OqxPNgum85T4SHixPkJ8AcGAbTujHA4exKOBN/el13ruYXKO5qJ
 +65mWz6OH/Dgg3eFUx8GhWDAvRUDnBJ3A5HkhOWJxfCd7SPyq74Gs2+24I51uoABJleZ
 7seA==
X-Gm-Message-State: AOAM530DaaFg1M8i6D7g3c6IZb2cbALNvF7GZ5x4y2Uf0y6T0CXjU5vz
 Z3yHpRhCC2xqd7XA6cB/35jC+bmrhufQ1EHMJVI=
X-Google-Smtp-Source: ABdhPJxYBIY4X70LxpObOx5KRVG+1Az603IzbMeJDMkmG+1kvPHX6Pd5coYnaDWUU+HK5CTioiLPM23A6BKU0k7/tFk=
X-Received: by 2002:a05:6214:18c7:: with SMTP id
 cy7mr16521470qvb.0.1639066984303; 
 Thu, 09 Dec 2021 08:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-17-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-17-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Dec 2021 16:22:38 +0000
Message-ID: <CAM0jSHM2w81HASG2TWKWdQPyJr3=m9WBB5t_V8C6gJPwrF5ouw@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] drm/i915: Remove short-term pins from execbuf,
 v5.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Add a flag PIN_VALIDATE, to indicate we don't need to pin and only
> protected by the object lock.
>
> This removes the need to unpin, which is done by just releasing the
> lock.
>
> eb_reserve is slightly reworked for readability, but the same steps
> are still done:
> - First pass pins with NONBLOCK.
> - Second pass unbinds all objects first, then pins.
> - Third pass is only called when not all objects are softpinned, and
>   unbinds all objects, then calls i915_gem_evict_vm(), then pins.
>
> When evicting the entire vm in eb_reserve() we do temporarily pin objects
> that are marked with EXEC_OBJECT_PINNED. This is because they are already
> at their destination, and i915_gem_evict_vm() would otherwise unbind them.
>
> However, we reduce the visibility of those pins by limiting the pin
> to our call to i915_gem_evict_vm() only, and pin with vm->mutex held,
> instead of the entire duration of the execbuf.
>
> Not sure the latter matters, one can hope..
> In theory we could kill the pinning by adding an extra flag to the vma
> to temporarily prevent unbinding for gtt for i915_gem_evict_vm only, but
> I think that might be overkill. We're still holding the object lock, and
> we don't have blocking eviction yet. It's likely sufficient to simply
> enforce EXEC_OBJECT_PINNED for all objects on >= gen12.
>
> Changes since v1:
> - Split out eb_reserve() into separate functions for readability.
> Changes since v2:
> - Make batch buffer mappable on platforms where only GGTT is available,
>   to prevent moving the batch buffer during relocations.
> Changes since v3:
> - Preserve current behavior for batch buffer, instead be cautious when
>   calling i915_gem_object_ggtt_pin_ww, and re-use the current batch vma
>   if it's inside ggtt and map-and-fenceable.
> - Remove impossible condition check from eb_reserve. (Matt)
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
