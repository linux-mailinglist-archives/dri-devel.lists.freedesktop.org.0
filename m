Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0B6D0059
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A1D10ED7E;
	Thu, 30 Mar 2023 09:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D080310ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:58:10 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id b18so22749455ybp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680170290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lM1clLMyFkv8RnfmeF0BvNOKffXMAeEtVBe3ANIN4rM=;
 b=B1SyhkzVdWGwXx5MQnwXKgJUgmsgRElhiJ/ccK5nN7O55gclBTHvjJWMbYZTrgXuY/
 XVrrY8RAOzgU33TFT+PaPJeCl9WJqhucaHVvj74vo3DjyyiaXkTudXmw+Qsc8Sd2/0hT
 VxybRcBl29YhCkdjWKPhJCkO9u3kiy3HTRzjfGmzPuoXeTAE1HOb4r4ovsXyfygfqrfw
 4d1xFf5XLXHNF17GJZE1zohRW7j6r3/fmXtzvj6VwbuPw7GldOJ74qLEQ5hn3GKDHiqw
 av3ejpM/gGs+58O37qRqnTnCRetC5oGklJR6g0D5CqTP1TaX6KKH7MPHu9scLSxpfg8T
 DqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lM1clLMyFkv8RnfmeF0BvNOKffXMAeEtVBe3ANIN4rM=;
 b=uA6EkPHudo00SuEciIrbXIjIuOPyAweTrzmAAmX8yAy5/l0E6LA7pFAFhwaeVEyT88
 jyZ8GPeXgHlNdLc6RjMDR0gJmmgYooJc7o1b2TWLDST6QcqpfY4SlKw6DMICXeO5oO94
 oRsPUtlUx8SfIMfgeAbHTp1mhRbJKLzCAP/36WoxFwF2ZlFOJTl2p0n6tH20Iap50v7Q
 Vr3G0vsU6WXlI/tyeAbDXBQShsJS6Hqt6/27hwi6KKXxW8TVbBPBjKvlLzewCYHDKwxO
 oWu7nwC1l5gcvrjfb0jcpbgMXy+mZUoSeo1/fh7VzxPbzL6eO0jC4jJDV/wERtlt08ua
 fpXw==
X-Gm-Message-State: AAQBX9dfAzHDPbHLyzjV/ZQMPi4kqceiaqGdEvhiNeVi/aDha/LWLoCa
 M++n/9siO6PlgtU8DMlclfF0f/qAH1zfYuJlWELjEQ==
X-Google-Smtp-Source: AKy350ZvlWGvCwpr4//KI4810BMNOvHxy1rAcxCPE12M/gjQgM0PKbZ9M+wilo3JKUUgVMPf3zydkfCeJP2rPtarqxo=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr15577834ybu.9.1680170289973; Thu, 30 Mar
 2023 02:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-4-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-4-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 12:57:59 +0300
Message-ID: <CAA8EJpqa+simnPi6w-hj4J5AJaWajRUvKS=azVvi2OA1tG_zoA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm: Remove struct msm_fbdev
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Remove struct msm_fbdev, which is an empty wrapper around struct
> drm_fb_helper. Use the latter directly. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 323a79d9ef83..0985486d194b 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -18,12 +18,6 @@
>   * fbdev funcs, to implement legacy fbdev interface on top of drm driver
>   */
>
> -#define to_msm_fbdev(x) container_of(x, struct msm_fbdev, base)
> -
> -struct msm_fbdev {
> -       struct drm_fb_helper base;
> -};
> -
>  static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  {
>         struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
> @@ -129,16 +123,13 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>  struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
> -       struct msm_fbdev *fbdev;
>         struct drm_fb_helper *helper;
>         int ret;
>
> -       fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
> -       if (!fbdev)
> +       helper = kzalloc(sizeof(*helper), GFP_KERNEL);
> +       if (!helper)
>                 return NULL;
>
> -       helper = &fbdev->base;
> -
>         drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
>
>         ret = drm_fb_helper_init(dev, helper);
> @@ -159,7 +150,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>         drm_fb_helper_fini(helper);
>  fail:
>         drm_fb_helper_unprepare(helper);
> -       kfree(fbdev);

I think this will leak the newly created helper instance.

>         return NULL;
>  }
>
> @@ -168,7 +158,6 @@ void msm_fbdev_free(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct drm_fb_helper *helper = priv->fbdev;
>         struct drm_framebuffer *fb = helper->fb;
> -       struct msm_fbdev *fbdev;
>
>         DBG();
>
> @@ -176,8 +165,6 @@ void msm_fbdev_free(struct drm_device *dev)
>
>         drm_fb_helper_fini(helper);
>
> -       fbdev = to_msm_fbdev(priv->fbdev);
> -
>         /* this will free the backing object */
>         if (fb) {
>                 struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
> @@ -186,7 +173,7 @@ void msm_fbdev_free(struct drm_device *dev)
>         }
>
>         drm_fb_helper_unprepare(helper);
> -       kfree(fbdev);
> +       kfree(helper);
>
>         priv->fbdev = NULL;
>  }
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
