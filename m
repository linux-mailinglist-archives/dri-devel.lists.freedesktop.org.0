Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4026BA7E2BA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FF510E4C1;
	Mon,  7 Apr 2025 14:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V7A8vYJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858E10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:55:26 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2c77a5747e0so2458482fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744037726; x=1744642526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4xn9cimfDHTXs5TpUGv6N7Mowttz4ZTLbCFX2kVKqw=;
 b=V7A8vYJv//XJN7vyaYeiWTI2j1v3/4iUxIwvMRy32UxFq4b7wRDo80oHC6BVPLfTsB
 /FpNH7/cs6hMq8TBk5R3f0M084VIk6bpYgcoTXA+MIbTmyodIjzcmCxcJvFjMihGqyXp
 hHCwllrJMg1XvCios9rwn8Q4QfKmyDlE3R1xGsDD/ccnK2iUuxSjS3zH/S02KkRpTnaJ
 NiEkdAUwOS3qpXGpUoFl0ypyHWidCohoC20FS3E9hMtlC7H62QfcongPXec9akwAZqyO
 bpAo8oYmxRUspGXbC9mijdUJDw26u8/omZYqGcgIcnkg4yY64e6bmteC/wQf7YufHdKf
 Y5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744037726; x=1744642526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4xn9cimfDHTXs5TpUGv6N7Mowttz4ZTLbCFX2kVKqw=;
 b=iEjmc0N3yFJ2j0SGUISGp5jUUpH4HioKVqE+lNG6iBjk1xwXbVX+IARvt4yYfmEn6c
 bwFKKba4c6kaTmwz3+eChgn0iUY+oaX1E0r5C+zEjlhqVNzH1SAgtBwXwGm5BV/8TXcK
 mgBnHc1qqIMNUZS5I4JbubyzJtix3zNEv/EXGgSL9FgbNOuWzr9f9rtGKGKJR0DwxUL/
 M1rJNzcl6jAqvOmI9MwLlbm0Xp9/ekSfVbjIndC9d+XllqUpLrdGM1LdXOHLR2MHubDt
 je35fWtOxwRzg+RUSE+HzBfR3k6AnHuZ7VsFQ6ZTlaUH9sEX3DPSJ1964X/Uqaro21a5
 fgag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiV75ByGDQ49xVJwIE52YmTJPPZpHgri1gpiNK+M8AElHHl4XgAhdzNlinV/7ZTXK7j2V9L/UbgFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkEfByrBg8bPGvHitHODt+WBL9258bQejbbCFYr4mANr16yUUx
 pCaBVuo5Lb1ZLHisLi4aCPPIQtUEAcRCTTIKGmCkoCTragv6mzEfZY9aanQaJf3vhMBEpeH90P1
 yEv1SOvIppS2o0F6lQWCamviyOGD/RDPlTA6vLg==
X-Gm-Gg: ASbGncsZQGWtz9vMdAFQwF03+kjbmPkVqMKatyH6rEpETP3qjK0ien0KyDTYLNeGUDe
 C6ru9vYJPHcNu8KrS92MDLzmON4m4rbyPvgUeFTR+mLtzqMBX3iuzjvZF++Jbqd5B02U36xMzZN
 xapDenaUZ6gveidfKg34e6vovHMNY=
X-Google-Smtp-Source: AGHT+IE6txomzGGAbwFADFCUywgbtkEgGT6GCg3c/ibtTiN62bLYpeINpXvDIoclViQ8oopGWCfxq+knFtQaTlHdqqI=
X-Received: by 2002:a05:6870:de17:b0:2c2:5b08:8e42 with SMTP id
 586e51a60fabf-2cd3311870dmr5281511fac.27.1744037725617; Mon, 07 Apr 2025
 07:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-2-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-2-7f457073282d@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 7 Apr 2025 16:55:13 +0200
X-Gm-Features: ATxdqUFUAjG5BhSKb_2PfAi1V3_18wUctOFmQdGMnywulnQl545FYuZXFXM_jpk
Message-ID: <CAHUa44G+Z9LjxqqqvKRRHrfN_6QPweF_5df2uOqtRuBfa5j3pw@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] tee: add close_context to TEE driver operation
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Amir,

On Fri, Mar 28, 2025 at 3:48=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> The tee_context can be used to manage TEE user resources, including
> those allocated by the driver for the TEE on behalf of the user.
> The release() callback is invoked only when all resources, such as
> tee_shm, are released and there are no references to the tee_context.
>
> When a user closes the device file, the driver should notify the
> TEE to release any resources it may hold and drop the context
> references. To achieve this, a close_context() callback is
> introduced to initiate resource release in the TEE driver when
> the device file is closed.
>
> Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
> tee_device_get functions to tee_drv.h to make them accessible
> outside the TEE subsystem.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/tee/tee_private.h |  6 ------
>  include/linux/tee_core.h  | 11 +++++++++--
>  include/linux/tee_drv.h   | 40 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 24edce4cdbaa..22cc7d624b0c 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -72,6 +72,20 @@ struct tee_context *teedev_open(struct tee_device *tee=
dev)
>  }
>  EXPORT_SYMBOL_GPL(teedev_open);
>
> +/**
> + * teedev_ctx_get() - Increment the reference count of a context
> + *
> + * This function increases the refcount of the context, which is tied to
> + * resources shared by the same tee_device. During the unregistration pr=
ocess,
> + * the context may remain valid even after tee_device_unregister() has r=
eturned.
> + *
> + * Users should ensure that the context's refcount is properly decreased=
 before
> + * calling tee_device_put(), typically within the context's release() fu=
nction.
> + * Alternatively, users can call tee_device_get() and teedev_ctx_get() t=
ogether
> + * and release them simultaneously (see shm_alloc_helper()).
> + *
> + * @ctx: Pointer to the context

Please move this @ctx line to before the verbose description of the functio=
n.

Cheers,
Jens

> + */
>  void teedev_ctx_get(struct tee_context *ctx)
>  {
>         if (ctx->releasing)
> @@ -79,6 +93,7 @@ void teedev_ctx_get(struct tee_context *ctx)
>
>         kref_get(&ctx->refcount);
>  }
> +EXPORT_SYMBOL_GPL(teedev_ctx_get);
>
>  static void teedev_ctx_release(struct kref *ref)
>  {
> @@ -89,6 +104,10 @@ static void teedev_ctx_release(struct kref *ref)
>         kfree(ctx);
>  }
>
> +/**
> + * teedev_ctx_put() - Decrease reference count on a context
> + * @ctx: pointer to the context
> + */
>  void teedev_ctx_put(struct tee_context *ctx)
>  {
>         if (ctx->releasing)
> @@ -96,11 +115,15 @@ void teedev_ctx_put(struct tee_context *ctx)
>
>         kref_put(&ctx->refcount, teedev_ctx_release);
>  }
> +EXPORT_SYMBOL_GPL(teedev_ctx_put);
>
>  void teedev_close_context(struct tee_context *ctx)
>  {
>         struct tee_device *teedev =3D ctx->teedev;
>
> +       if (teedev->desc->ops->close_context)
> +               teedev->desc->ops->close_context(ctx);
> +
>         teedev_ctx_put(ctx);
>         tee_device_put(teedev);
>  }
> @@ -1024,6 +1047,10 @@ int tee_device_register(struct tee_device *teedev)
>  }
>  EXPORT_SYMBOL_GPL(tee_device_register);
>
> +/**
> + * tee_device_put() - Decrease the user count for a tee_device
> + * @teedev: pointer to the tee_device
> + */
>  void tee_device_put(struct tee_device *teedev)
>  {
>         mutex_lock(&teedev->mutex);
> @@ -1037,7 +1064,18 @@ void tee_device_put(struct tee_device *teedev)
>         }
>         mutex_unlock(&teedev->mutex);
>  }
> +EXPORT_SYMBOL_GPL(tee_device_put);
>
> +/**
> + * tee_device_get() - Increment the user count for a tee_device
> + * @teedev: Pointer to the tee_device
> + *
> + * If tee_device_unregister() has been called and the final user of @tee=
dev
> + * has already released the device, this function will fail to prevent n=
ew users
> + * from accessing the device during the unregistration process.
> + *
> + * Returns: true if @teedev remains valid, otherwise false
> + */
>  bool tee_device_get(struct tee_device *teedev)
>  {
>         mutex_lock(&teedev->mutex);
> @@ -1049,6 +1087,7 @@ bool tee_device_get(struct tee_device *teedev)
>         mutex_unlock(&teedev->mutex);
>         return true;
>  }
> +EXPORT_SYMBOL_GPL(tee_device_get);
>
>  /**
>   * tee_device_unregister() - Removes a TEE device
> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> index 9bc50605227c..d3f40a03de36 100644
> --- a/drivers/tee/tee_private.h
> +++ b/drivers/tee/tee_private.h
> @@ -14,12 +14,6 @@
>
>  int tee_shm_get_fd(struct tee_shm *shm);
>
> -bool tee_device_get(struct tee_device *teedev);
> -void tee_device_put(struct tee_device *teedev);
> -
> -void teedev_ctx_get(struct tee_context *ctx);
> -void teedev_ctx_put(struct tee_context *ctx);
> -
>  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t s=
ize);
>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
>                                           unsigned long addr, size_t leng=
th);
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index a38494d6b5f4..8a4c9e30b652 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -65,8 +65,9 @@ struct tee_device {
>  /**
>   * struct tee_driver_ops - driver operations vtable
>   * @get_version:       returns version of driver
> - * @open:              called when the device file is opened
> - * @release:           release this open file
> + * @open:              called for a context when the device file is open=
ed
> + * @close_context:     called when the device file is closed
> + * @release:           called to release the context
>   * @open_session:      open a new session
>   * @close_session:     close a session
>   * @system_session:    declare session as a system session
> @@ -76,11 +77,17 @@ struct tee_device {
>   * @supp_send:         called for supplicant to send a response
>   * @shm_register:      register shared memory buffer in TEE
>   * @shm_unregister:    unregister shared memory buffer in TEE
> + *
> + * The context given to @open might last longer than the device file if =
it is
> + * tied to other resources in the TEE driver. @close_context is called w=
hen the
> + * client closes the device file, even if there are existing references =
to the
> + * context. The TEE driver can use @close_context to start cleaning up.
>   */
>  struct tee_driver_ops {
>         void (*get_version)(struct tee_device *teedev,
>                             struct tee_ioctl_version_data *vers);
>         int (*open)(struct tee_context *ctx);
> +       void (*close_context)(struct tee_context *ctx);
>         void (*release)(struct tee_context *ctx);
>         int (*open_session)(struct tee_context *ctx,
>                             struct tee_ioctl_open_session_arg *arg,
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index a54c203000ed..ce23fd42c5d4 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -96,6 +96,46 @@ struct tee_param {
>         } u;
>  };
>
> +/**
> + * tee_device_get() - Increment the user count for a tee_device
> + * @teedev: Pointer to the tee_device
> + *
> + * If tee_device_unregister() has been called and the final user of @tee=
dev
> + * has already released the device, this function will fail to prevent n=
ew users
> + * from accessing the device during the unregistration process.
> + *
> + * Returns: true if @teedev remains valid, otherwise false
> + */
> +bool tee_device_get(struct tee_device *teedev);
> +
> +/**
> + * tee_device_put() - Decrease the user count for a tee_device
> + * @teedev: pointer to the tee_device
> + */
> +void tee_device_put(struct tee_device *teedev);
> +
> +/**
> + * teedev_ctx_get() - Increment the reference count of a context
> + *
> + * This function increases the refcount of the context, which is tied to
> + * resources shared by the same tee_device. During the unregistration pr=
ocess,
> + * the context may remain valid even after tee_device_unregister() has r=
eturned.
> + *
> + * Users should ensure that the context's refcount is properly decreased=
 before
> + * calling tee_device_put(), typically within the context's release() fu=
nction.
> + * Alternatively, users can call tee_device_get() and teedev_ctx_get() t=
ogether
> + * and release them simultaneously (see shm_alloc_helper()).
> + *
> + * @ctx: Pointer to the context
> + */
> +void teedev_ctx_get(struct tee_context *ctx);
> +
> +/**
> + * teedev_ctx_put() - Decrease reference count on a context
> + * @ctx: pointer to the context
> + */
> +void teedev_ctx_put(struct tee_context *ctx);
> +
>  /**
>   * tee_shm_alloc_kernel_buf() - Allocate kernel shared memory for a
>   *                              particular TEE client driver
>
> --
> 2.34.1
>
