Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9E6D4851
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 16:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832AA10E4CF;
	Mon,  3 Apr 2023 14:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFAE10E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 14:27:33 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5416698e889so555265517b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680532052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1vBBEr7OgRo9Y8HhJLVrRt9hDNDNU5ikub2oPe1GSjw=;
 b=begP8O72IXiINSLuM/2ZQKLSG1pGTqbKCioMbX0qa9/ihoojoLFAFTQnRF5R7sp27K
 zhD5NLJjSFCF7pRc6CfSn8JXOdQHr4CjWnwAgbCrFONfodbRfbMNkQeY5tk5SGoo0s5V
 kTFMt2dThY31UBlWqQ/YD1r+KnW1x481JTFVpzGx7vqK6R33Q5mmtWMynSWmjtvM31xj
 csewUqd7GbBM/LaUESgLQiK6yQCYRmoym2oC634CzojxbVAuXQvtB8j6lTO0b4VyTB7+
 yDLqMUJNqiSzagutvd/c1734bm8jQd9UYEw0zFcA/X66sEWy+CH4eTyA4pQDV6tww5yv
 f1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680532052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1vBBEr7OgRo9Y8HhJLVrRt9hDNDNU5ikub2oPe1GSjw=;
 b=7DOnC86fjGUwOlytaHaWWkvgtpcMArMQOzAvuSGnBLL/8lESctBSJeIdGYfBHvhJcf
 FNuuuAZ7jEmp8M6aEQrF+GiAAxCZsbrayAXdeQL56SvPyQTmbxJ9C77S9ipwXqOIkGXc
 xM8hV59fEe54tFGObPcB/yNVqfWGq4Nt2Ts4folvjXeeP2+kU/VliBJUY/JqxOJW7Gfx
 pCEjXw8tc8TkJs3p+ONdx8MZjVDnteMG63VpU4A+wHBF0yFCChQ5RuPyLR79S3HhvDEV
 J0NGxazpMFpf2QHGHqKVSre/ZRVSM+qak2IoRQeaPUZrpz2g3qnW0oV5O0r5G+L6nJPC
 q1wA==
X-Gm-Message-State: AAQBX9cRRYVpLRs6d2v1ygJfV62k7HqJd8bhp/nvQkJ094Q6c0mUkeoT
 jbu9MwJexn3gtHOWBfofgLlOXVa36hE21ar84SfJ1CKum+w=
X-Google-Smtp-Source: AKy350Y8luZq/dWdC2hEcZTm3PjSNUtkWmJH1jvN1DkiF6bpas2fc7ypfEI/1gl5SLmwjAGLLdbjGgko3+HgOuAQEsw=
X-Received: by 2002:a81:b645:0:b0:545:6e22:ea34 with SMTP id
 h5-20020a81b645000000b005456e22ea34mr17363733ywk.1.1680532052631; Mon, 03 Apr
 2023 07:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230403104035.15288-1-tzimmermann@suse.de>
 <20230403104035.15288-6-tzimmermann@suse.de>
In-Reply-To: <20230403104035.15288-6-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 3 Apr 2023 15:27:21 +0100
Message-ID: <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/omapdrm: Implement fbdev emulation as
 in-kernel client
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: tomba@kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Apr 2023 at 11:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move code from ad-hoc fbdev callbacks into DRM client functions
> and remove the old callbacks. The functions instruct the client
> to poll for changed output or restore the display. The DRM core
> calls both, the old callbacks and the new client helpers, from
> the same places. The new functions perform the same operation as
> before, so there's no change in functionality.
>
> Replace all code that initializes or releases fbdev emulation
> throughout the driver. Instead initialize the fbdev client by a
> single call to omapdrm_fbdev_setup() after omapdrm has registered
> its DRM device. As in most drivers, omapdrm's fbdev emulation now
> acts like a regular DRM client.
>
> The fbdev client setup consists of the initial preparation and the
> hot-plugging of the display. The latter creates the fbdev device
> and sets up the fbdev framebuffer. The setup performs display
> hot-plugging once. If no display can be detected, DRM probe helpers
> re-run the detection on each hotplug event.
>
> A call to drm_dev_unregister() releases the client automatically.
> No further action is required within omapdrm. If the fbdev
> framebuffer has been fully set up, struct fb_ops.fb_destroy
> implements the release. For partially initialized emulation, the
> fbdev client reverts the initial setup.
>
> v2:
>         * init drm_client in this patch (Tomi)
>         * don't handle non-atomic modesetting (Tomi)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c   |  11 +--
>  drivers/gpu/drm/omapdrm/omap_fbdev.c | 132 +++++++++++++++++----------
>  drivers/gpu/drm/omapdrm/omap_fbdev.h |   9 +-
>  3 files changed, 90 insertions(+), 62 deletions(-)
>

> +static void omap_fbdev_fb_destroy(struct fb_info *info)
> +{
> +       struct drm_fb_helper *helper = info->par;
> +       struct drm_framebuffer *fb = helper->fb;
> +       struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
> +       struct omap_fbdev *fbdev = to_omap_fbdev(helper);
> +
> +       DBG();
> +

What a lovely little surprise. It's a pre-existing "feature", so let's
ignore that for now ;-)

> +       drm_fb_helper_fini(helper);
> +
> +       omap_gem_unpin(bo);
> +       drm_framebuffer_remove(fb);
> +
> +       drm_client_release(&helper->client);
> +       drm_fb_helper_unprepare(helper);
> +       kfree(fbdev);
> +}


> -void omap_fbdev_fini(struct drm_device *dev)
> +static const struct drm_client_funcs omap_fbdev_client_funcs = {
> +       .owner          = THIS_MODULE,
> +       .unregister     = omap_fbdev_client_unregister,
> +       .restore        = omap_fbdev_client_restore,
> +       .hotplug        = omap_fbdev_client_hotplug,

AFAICT the fbdev client helpers above are identical to the generic
ones in drm_fbdev_generic.c. Why aren't we reusing those but
copy/pasting them in the driver?

Thanks
Emil
