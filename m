Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E959265C2F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F276E3BC;
	Fri, 11 Sep 2020 09:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32C6E3A8;
 Fri, 11 Sep 2020 09:08:55 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id j185so5010521vsc.3;
 Fri, 11 Sep 2020 02:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ekCnXKKIp0mXUS3WlLUKLLpN9dA9fjVb2vpUKKIdlfM=;
 b=tiBUogJHaA7qBv4glkvKTbaV+Up8nq5gquWp8vpzOXfE2U1CMa9v+k5XyZKctPF83Q
 lHMASantC4EdzocM4EtSu1nWRjTLbsbV132yQ5fT8rY97hJO4Ss4UihqdB0gmMXr4jUr
 8rg7SKzFv9ItF90qatvsec5xTPDzCZsdsYnXGbNIH3VA4woTg/2XL9rZlAPefbZ0kLBS
 JdRXODSkPIHBglFD7phYA4km8SS/QA0QIiXK8MTqKCz56hNz9RUIVg5KVum1Vm40fMBC
 QzBvxroRTRz8eRT6thRVcdyH/qIS6lpEISeQGMYWsRCVoTQDF+CQRidE3roBUoICNI2T
 961g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ekCnXKKIp0mXUS3WlLUKLLpN9dA9fjVb2vpUKKIdlfM=;
 b=PNE2Tx3evs34H2Z5MMJfyYzAvvkIO/gIvHEJDsky5Ow0a0XSbbakGV0DZEKArnSchh
 6nJL2b9eLFcPT+DctDf6SqTJ/f1pAEhp+2o3VAiojz+oPcfRMucS4PA+9duu2AW6DvNg
 rQU87IuiqKtmCZGhKfyQPYh9ZuToP9M6FGmPGKIMwyOoxyD+ogrsKsnT4paggjnPbSCO
 ouuxWUhJ8SyMNMP46nX97Y8rMKvuboCl4Gjv/zJEC2mALTth6j6pBDTk6BW6w7N/5BcG
 gXgZF7eMDdgh297rnjBtJyJXHSuWpr7oMU+pVnzuwv4e9tmS1pdbvNU9P7dreglE5t+d
 LpXQ==
X-Gm-Message-State: AOAM532DxM8zaKxYUoEA7Gx2riCPjUKVb0BuVpzzupw4pTFy3A1r8W5a
 b+b8QJAPXusjTy2rqTyQSj3bQY0tLC7DKca6OV8=
X-Google-Smtp-Source: ABdhPJxoYIV3CX9f7cy2IOE6VDrv8a2GSVNKJIua9gBLXhdDvXc3q4fk17FkIjbbTepKuzSpTXuNam23v4KSdjFeiZo=
X-Received: by 2002:a67:e3a2:: with SMTP id j2mr510932vsm.104.1599815334543;
 Fri, 11 Sep 2020 02:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-9-daniel.vetter@ffwll.ch>
In-Reply-To: <20200904143941.110665-9-daniel.vetter@ffwll.ch>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Sep 2020 10:08:28 +0100
Message-ID: <CAM0jSHNpNfb3soFXWa6JCWUT5ayEOpJO-tp3sLp3PnQ8Oh5bTw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 08/24] drm/i915/selftests: align more to real
 device lifetimes
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Sep 2020 at 15:40, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> The big change is device_add so that device_del can auto-cleanup
> devres resources. This allows us to use devm_drm_dev_alloc, which
> removes the last user of drm_dev_init.
>
> v2: Rebased
>
> v3: use devres_open/release_group so we can use devm without real
> hacks in the driver core or having to create an entire fake bus for
> testing drivers. Might want to extract this into helpers eventually,
> maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  .../gpu/drm/i915/selftests/mock_gem_device.c  | 42 +++++++++++--------
>  1 file changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index fbb403edb7a0..164ad1746da9 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -128,12 +128,6 @@ struct drm_i915_private *mock_gem_device(void)
>         pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
>         if (!pdev)
>                 return NULL;
> -       i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
> -       if (!i915) {
> -               kfree(pdev);
> -               return NULL;
> -       }
> -
>         device_initialize(&pdev->dev);
>         pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
>         pdev->dev.release = release_dev;
> @@ -146,8 +140,29 @@ struct drm_i915_private *mock_gem_device(void)
>         iommu.priv = (void *)-1;
>         pdev->dev.iommu = &iommu;
>  #endif
> +       err = device_add(&pdev->dev);
> +       if (err) {
> +               kfree(pdev);
> +               return NULL;
> +       }
> +
> +       if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> +               device_del(&pdev->dev);
> +               return NULL;
> +       }
> +
> +       i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
> +                                 struct drm_i915_private, drm);
> +       if (err) {

if (IS_ERR(i915))

?

> +               pr_err("Failed to allocate mock GEM device: err=%d\n", err);
> +               devres_release_group(&pdev->dev, NULL);
> +               device_del(&pdev->dev);
> +
> +               return NULL;
> +       }
>
>         pci_set_drvdata(pdev, i915);
> +       i915->drm.pdev = pdev;
>
>         dev_pm_domain_set(&pdev->dev, &pm_domain);
>         pm_runtime_enable(&pdev->dev);
> @@ -155,16 +170,6 @@ struct drm_i915_private *mock_gem_device(void)
>         if (pm_runtime_enabled(&pdev->dev))
>                 WARN_ON(pm_runtime_get_sync(&pdev->dev));
>
> -       err = drm_dev_init(&i915->drm, &mock_driver, &pdev->dev);
> -       if (err) {
> -               pr_err("Failed to initialise mock GEM device: err=%d\n", err);
> -               put_device(&pdev->dev);
> -               kfree(i915);
> -
> -               return NULL;
> -       }
> -       i915->drm.pdev = pdev;
> -       drmm_add_final_kfree(&i915->drm, i915);
>
>         i915_params_copy(&i915->params, &i915_modparams);
>
> @@ -231,5 +236,8 @@ struct drm_i915_private *mock_gem_device(void)
>
>  void mock_destroy_device(struct drm_i915_private *i915)
>  {
> -       drm_dev_put(&i915->drm);
> +       struct device *dev = i915->drm.dev;
> +
> +       devres_release_group(dev, NULL);
> +       device_del(dev);
>  }
> --
> 2.28.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
