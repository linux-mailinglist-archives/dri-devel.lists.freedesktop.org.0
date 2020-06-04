Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73D1EE19A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 11:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5ED6E2D8;
	Thu,  4 Jun 2020 09:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AC96E2D8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 09:42:35 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id u23so4254136otq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IrquIvSYxDXtPrFboauKAUbfKlOii676WBJQ9mnpJCE=;
 b=Nj5Z7GMk9WkybrPzX6nGffSTf5OGRTMAA4Q3bGvQcy3oQwWA80YTvABcw4o1Wm8DL+
 TrsaoRtFuAhWjes6b2Y8DEFym1RbOojCp85UF7RTbyBKMg6BpNGrNLY9DGAjbL2V5ThK
 v6E17Qm2d/Ctsa/UBJuWLQL5f+D9ZkDVSIIyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IrquIvSYxDXtPrFboauKAUbfKlOii676WBJQ9mnpJCE=;
 b=MFI0pVc7rI51Qaq9+b03zvzwRqPX1Bq7UThi6vxZsmBMmOWMwJ17e6Fb1T3FAfAahU
 luGwsM7pM+zfvdIv8TFn2E9A/a2FYUSbUj0ez4d1YrERli/5G97df5VMLUDjakyuTPR+
 hnYfYudjBPG6xooVirV0PHeiY9Xr5KRNT0gczf8zQLhS1eM1KkDDVxckccNG4sc6204s
 PKF+dtO2IH3poLoHO4j5Yu+IaIm/+3QrbOnsynAcokNlRtDVO7CYSWQUg78K4/zvaAhl
 yVG6urLB+l2RtnS+BAOZDYQg4O4XNfrfmf2ZqQushUsX8uHjD5uZnYjyWT57QEM16Jw4
 5EHA==
X-Gm-Message-State: AOAM533/guJL73E0Jy4x8v5JjczewYFwSGsT2v4eyKHetPpZwVp3WmKP
 KcY0qeEEe+tjS31ZS0sMIHzBJPIG3dAihkvZbi3cBw==
X-Google-Smtp-Source: ABdhPJya+fXryG0MLhE28ucctmVWIBRDc+7Dctp4RLBIStP6zEfgf+n21g6Lu0UdBEfoUU+mLon8ivrCO29mM4ivIns=
X-Received: by 2002:a05:6830:54:: with SMTP id
 d20mr3183328otp.281.1591263754981; 
 Thu, 04 Jun 2020 02:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <kFylMmeRMGJk-oi8f-Td8A7GNa1C-GsK23-vjKg77VhWfwpkLJg7QxFlQ_g9KdVxZiyWl9eJWpUGa5PYasR9YcyvIbuBmHVfKeHb4rH0yTM=@emersion.fr>
In-Reply-To: <kFylMmeRMGJk-oi8f-Td8A7GNa1C-GsK23-vjKg77VhWfwpkLJg7QxFlQ_g9KdVxZiyWl9eJWpUGa5PYasR9YcyvIbuBmHVfKeHb4rH0yTM=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 4 Jun 2020 11:42:22 +0200
Message-ID: <CAKMK7uH9EhEpyogAzt=XKR9T3zjFgPXrr_aED+rF=5tpLkZdpg@mail.gmail.com>
Subject: Re: [PATCH v3] drm: document how user-space should use link-status
To: Simon Ser <contact@emersion.fr>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 11:20 AM Simon Ser <contact@emersion.fr> wrote:
>
> Describe what a "BAD" link-status means for user-space and how it should
> handle it. The logic described has been implemented in igt [1].
>
> v2:
>
> - Change wording to avoid "enabled" (Daniel)
> - Add paragraph about multiple connectors sharing the same CRTC (Pekka)
> - Add paragraph about performing an atomic commit on a connector without
>   updating the link-status property (Daniel)
>
> v3:
>
> - Fix description of what happens when link-status isn't reset to
>   "GOOD", and when link-status is reset without ALLOW_MODESET (Daniel,
>   Ville)
> - Changing link-status to "BAD" is a no-op
> - Clearly state that "BAD" means black screen (Manasi)
>
> [1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f529737191d0920521946a575bd55f00fbe
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>
> I'm not 100% sure the paragraph about not resetting link-status or not
> using ALLOW_MODESET is accurate. Just like the previous version, this
> is just an attempt at documenting the current kernel behaviour.
>
>  drivers/gpu/drm/drm_connector.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index f2b20fd66319..1df036b3353b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -994,6 +994,26 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *      after modeset, the kernel driver may set this to "BAD" and issue a
>   *      hotplug uevent. Drivers should update this value using
>   *      drm_connector_set_link_status_property().
> + *
> + *      When user-space receives the hotplug uevent and detects a "BAD"
> + *      link-status, the sink doesn't receive pixels anymore (e.g. the screen
> + *      becomes completely black). The list of available modes may have
> + *      changed. User-space is expected to pick a new mode if the current one
> + *      has disappeared and perform a new modeset with link-status set to
> + *      "GOOD" to re-enable the connector.
> + *
> + *      If multiple connectors share the same CRTC and one of them gets a "BAD"
> + *      link-status, the other are unaffected (ie. the sinks still continue to
> + *      receive pixels).
> + *
> + *      When user-space performs an atomic commit on a connector with a "BAD"
> + *      link-status without resetting the property to "GOOD", the sink may
> + *      still not receive pixels. When user-space performs an atomic commit
> + *      which resets the link-status property to "GOOD" without the
> + *      ALLOW_MODESET flag set, it might fail because a modeset is required.
> + *
> + *      User-space can only change link-status to "GOOD", changing it to "BAD"
> + *      is a no-op.

Above reads well and is accurate I think. I think we should add
another paragraph about the backwards compatibility hack in SETCRTC
ioctl:

"For backwards compatibility with non-atomic userspace the kernel
tries to automatically set the link-status back to "GOOD" in the
SETCRTC IOCTL. This might fail if the mode is no longer valid, similar
to how it might fail if a different screen has been connected in the
interim."

With that or similar this has my r-b.
-Daniel

>   * non_desktop:
>   *     Indicates the output should be ignored for purposes of displaying a
>   *     standard desktop environment or console. This is most likely because
> --
> 2.26.2
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
