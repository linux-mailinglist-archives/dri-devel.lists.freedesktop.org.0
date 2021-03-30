Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572BC34E5A0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 12:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3746E8A7;
	Tue, 30 Mar 2021 10:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9596A6E8AB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 10:43:26 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id f17so5944281plr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=inEEvxoI2d27PWTByb00t7709zab101mRTK+HEEURs0=;
 b=C9+RPFkWx1dnLku0VJzXhT4WCqoHsMPAfkkwl/4KohDQakhhONCUx+woSyEwYjrpXR
 t1d16MDlzS32+twkwF9bbNrzqgVVnTIfoI0AZogYL4G1S7OgpeJg0emu3T5/HWp5kcJG
 ++epmYQmqILHMzY2hL2QmPVz7uTVYnSW6ybUpM4NE/4ka6AX9/8CrsJwa6V5+njYVIo+
 XgbVwDjQ2vtltDtglB4fNijvaQUZc0s53NH8e1EYls6/XbWYbhbOWqh0zjfmI0VBaOGj
 vhK9ArLDxUL+ZjLu/rXXyDanwAeMXX50oJ08dRer+OEiWgpVZHK0JFYQd9TBlKlb28DY
 jk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=inEEvxoI2d27PWTByb00t7709zab101mRTK+HEEURs0=;
 b=Hns8bQ6utpRnzSSwvyWeolImqGVLBNeLWQ+K4hxwjCSc9OLubtVYMuPFPIrgSa4Hvs
 fBkomVARHxfjpj+iB/IWC/m1NtHNy3VS/y71gIZtk23FSfU44OFJHuoh8mgRDPeQNmX3
 z7tXidd/eemCAjj5Kq/14O+zrbWKibN53cQNJS66CPf6QA/IDg+sIf3eJn6QNkoCIW+m
 KVfGD1EQmXe7881zsjfauS7xXjCHXWGImFnFIazK1N/cSBAmZwdHpZjjV4zw97m0euXp
 4K7uCxYgto7Ye8bmmHo5705ieaXwIzdvovLHSLn0C4D76lbzxurWWB2PD3aWdI/3XrbS
 FAFg==
X-Gm-Message-State: AOAM531MeSam7onA363/+P2a6xk9rZWyMRXjo2DyqXQ5JmY6APCVIPiV
 BvBXnySIdezVAPhwup8XtXxHEljOMzgx98leDySKnQ==
X-Google-Smtp-Source: ABdhPJxPMfsifg57CMk+e08YOVt3TzMww6aMvw5ulnMzAx23GI1ES2FVCsm8qjLz2RBA6UgJxREJNfH8cDlZ1xM4T2Y=
X-Received: by 2002:a17:902:e752:b029:e6:822c:355c with SMTP id
 p18-20020a170902e752b02900e6822c355cmr32807495plf.69.1617101006157; Tue, 30
 Mar 2021 03:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210326203807.105754-1-lyude@redhat.com>
 <20210326203807.105754-8-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-8-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Mar 2021 12:43:15 +0200
Message-ID: <CAG3jFyvK6bk5mF_Jp6w9HpN2rDAPKkdHKbQMRKiW6gGKdR9-Yw@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
To: Lyude Paul <lyude@redhat.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

I'm seeing no issues with this patch and the reasoning behind the
patch is sound to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 26 Mar 2021 at 21:39, Lyude Paul <lyude@redhat.com> wrote:
>
> Since we're about to move drm_dp_helper.c over to drm_dbg_*(), we'll want
> to make sure that we can also add ratelimited versions of these macros in
> order to retain some of the previous debugging output behavior we had.
>
> However, as I was preparing to do this I noticed that the current
> rate limited macros we have are kind of bogus. It looks like when I wrote
> these, I didn't notice that we'd always be calling __ratelimit() even if
> the debugging message we'd be printing would normally be filtered out due
> to the relevant DRM debugging category being disabled.
>
> So, let's fix this by making sure to check drm_debug_enabled() in our
> ratelimited macros before calling __ratelimit(), and start using
> drm_dev_printk() in order to print debugging messages since that will save
> us from doing a redundant drm_debug_enabled() check. And while we're at it,
> let's move the code for this into another macro that we can reuse for
> defining new ratelimited DRM debug macros more easily.
>
> v2:
> * Make sure to use tabs where possible in __DRM_DEFINE_DBG_RATELIMITED()
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> ---
>  include/drm/drm_print.h | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index f32d179e139d..a3c58c941bdc 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -524,16 +524,20 @@ void __drm_err(const char *format, ...);
>  #define DRM_DEBUG_DP(fmt, ...)                                         \
>         __drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
>
> -
> -#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)                            \
> -({                                                                     \
> -       static DEFINE_RATELIMIT_STATE(_rs,                              \
> -                                     DEFAULT_RATELIMIT_INTERVAL,       \
> -                                     DEFAULT_RATELIMIT_BURST);         \
> -       if (__ratelimit(&_rs))                                          \
> -               drm_dev_dbg(NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__);      \
> +#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)                                  \
> +({                                                                                             \
> +       static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
> +       const struct drm_device *drm_ = (drm);                                                  \
> +                                                                                               \
> +       if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))                        \
> +               drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);       \
>  })
>
> +#define drm_dbg_kms_ratelimited(drm, fmt, ...) \
> +       __DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
> +
> +#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
> +
>  /*
>   * struct drm_device based WARNs
>   *
> --
> 2.30.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
