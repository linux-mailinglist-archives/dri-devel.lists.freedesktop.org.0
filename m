Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689837CB471
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9CD10E0D0;
	Mon, 16 Oct 2023 20:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E5010E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 20:16:53 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-495d687b138so2178056e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697487412; x=1698092212; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HT9t9ah3S63fNx/JxNsR4/9zQ/DI1bcgx6xA9b8HiOA=;
 b=THtGknQ5zoGDbqO80Qh5/MyiiFUSO9rhYjNX6tGEKoYzjdYuYZ0qJ+f+XfMVFokwIW
 E3NAyCa8CoeRsBHiT9dYD3hX3ruEiSrKORZf9fxl60xp99quz+YGu5RoQ5SVK2X+w4EO
 LwiFQtUrb6sWGlsujuvZohnagF2Kb7L90dWeNGnOT7+6z4eeAjqh6+3QZfTFumb3n1ez
 eQazj194xLPYLvpk5Snj2ZZwY3PpHIDfKbidL0uKapG5EfuYJrRQKFMHnvuL41A15rcr
 WihoHYBsCJ4AFTlOJ+gy6ystGwa0mHjnHsrT6b8EDIJxP+psoaZADmAgQCbUCrYBhIDh
 inQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697487412; x=1698092212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HT9t9ah3S63fNx/JxNsR4/9zQ/DI1bcgx6xA9b8HiOA=;
 b=q/mJB8xZhbzwbqbMWBnNQxwrM9I98O7eZFeqMCbnb16jcQZ/xUeUs09ftZcd+P7LRa
 YB7ENel3k0KmmRfaBPunI9/TwaocXuF0yQQDnWqSCgZhaL7yRIeMb93YDpkFtw02KN7l
 akuvhMDsNjBkJDa5vpnFSOmvDjYYmiIhVBU8yybE/nKP50fJDdLscwq8+HvNG1bhz+cN
 CAbdbRyE2fMd9yAm+44AvZ9b8LAxNWHapRJzvL0bUKSfcT29cnxfABKO19LN2Ebw7WXy
 D/wA8Qv7GGBgh8r+EinizzG+aY2cjQw9qH4L3XAHVKV5S+oeyaBDvdphPFMfALeXcglG
 3f7A==
X-Gm-Message-State: AOJu0Yzds2sRN1w2rZ9KKyaUIXW+/aM2dOBggubVNMjKbBIXGqerKu5w
 U8x1911rVFeobWYc64bsxqvAf8bny+vcY1vEtdw=
X-Google-Smtp-Source: AGHT+IEDopIHQ6mq/8yBbrNdL+A2z7WoARYWFrkce63ShJzNwPaboUdCywW0Nk/eH3oz3x5DkVID0QFHIxxkQqLr+jY=
X-Received: by 2002:a1f:1f81:0:b0:4a1:a334:57f0 with SMTP id
 f123-20020a1f1f81000000b004a1a33457f0mr526147vkf.3.1697487412093; Mon, 16 Oct
 2023 13:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231016184200.639-1-gurchetansingh@chromium.org>
 <20231016184200.639-3-gurchetansingh@chromium.org>
In-Reply-To: <20231016184200.639-3-gurchetansingh@chromium.org>
From: Josh Simonot <josh.simonot@gmail.com>
Date: Mon, 16 Oct 2023 16:16:41 -0400
Message-ID: <CAP1LCYdB_xv8NmOyYZrbyuvQm0tJxXVtZb9Rs110ufcYVYiBFg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/virtio: implement debug name via CONTEXT_INIT
To: Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000356e840607db16b3"
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
Cc: dmitry.osipenko@collabora.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000356e840607db16b3
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Josh Simonot <josh.simonot at gmail.com>


On Mon, 16 Oct 2023 at 14:42, Gurchetan Singh <gurchetansingh@chromium.org>
wrote:

> This allows setting the debug name during CONTEXT_INIT.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 +++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 38 ++++++++++++++++++++++----
>  2 files changed, 36 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 96365a772f77..c0702d630e05 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -58,6 +58,8 @@
>  #define MAX_CAPSET_ID 63
>  #define MAX_RINGS 64
>
> +#define DEBUG_NAME_MAX_LEN 64
> +
>  struct virtio_gpu_object_params {
>         unsigned long size;
>         bool dumb;
> @@ -274,6 +276,8 @@ struct virtio_gpu_fpriv {
>         uint64_t base_fence_ctx;
>         uint64_t ring_idx_mask;
>         struct mutex context_lock;
> +       char debug_name[DEBUG_NAME_MAX_LEN];
> +       char explicit_debug_name;
>  };
>
>  /* virtgpu_ioctl.c */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 8d13b17c215b..4d6d44a4c899 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -42,12 +42,19 @@
>  static void virtio_gpu_create_context_locked(struct virtio_gpu_device
> *vgdev,
>                                              struct virtio_gpu_fpriv
> *vfpriv)
>  {
> -       char dbgname[TASK_COMM_LEN];
> +       if (vfpriv->explicit_debug_name) {
> +               virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> +                                             vfpriv->context_init,
> +                                             strlen(vfpriv->debug_name),
> +                                             vfpriv->debug_name);
> +       } else {
> +               char dbgname[TASK_COMM_LEN];
>
> -       get_task_comm(dbgname, current);
> -       virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> -                                     vfpriv->context_init,
> strlen(dbgname),
> -                                     dbgname);
> +               get_task_comm(dbgname, current);
> +               virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> +                                             vfpriv->context_init,
> strlen(dbgname),
> +                                             dbgname);
> +       }
>
>         vfpriv->context_created = true;
>  }
> @@ -107,6 +114,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device
> *dev, void *data,
>         case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
>                 value = vgdev->capset_id_mask;
>                 break;
> +       case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
> +               value = vgdev->has_context_init ? 1 : 0;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -580,7 +590,7 @@ static int virtio_gpu_context_init_ioctl(struct
> drm_device *dev,
>                 return -EINVAL;
>
>         /* Number of unique parameters supported at this time. */
> -       if (num_params > 3)
> +       if (num_params > 4)
>                 return -EINVAL;
>
>         ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
> @@ -642,6 +652,22 @@ static int virtio_gpu_context_init_ioctl(struct
> drm_device *dev,
>
>                         vfpriv->ring_idx_mask = value;
>                         break;
> +               case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
> +                       if (vfpriv->explicit_debug_name) {
> +                               ret = -EINVAL;
> +                               goto out_unlock;
> +                       }
> +
> +                       ret = strncpy_from_user(vfpriv->debug_name,
> +                                               (const char __user
> *)u64_to_user_ptr(value),
> +                                               DEBUG_NAME_MAX_LEN);
> +                       if (ret < 0) {
> +                               ret = -EFAULT;
> +                               goto out_unlock;
> +                       }
> +
> +                       vfpriv->explicit_debug_name = true;
> +                       break;
>                 default:
>                         ret = -EINVAL;
>                         goto out_unlock;
> --
> 2.42.0.655.g421f12c284-goog
>
>

--000000000000356e840607db16b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PHByZT48Zm9udCBzaXplPSIyIiBzdHlsZT0iZm9udC1mYW1pbHk6YXJp
YWwsc2Fucy1zZXJpZiI+UmV2aWV3ZWQtYnk6IEpvc2ggU2ltb25vdCAmbHQ7am9zaC5zaW1vbm90
IGF0IDxhIGhyZWY9Imh0dHA6Ly9nbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5nbWFpbC5jb208
L2E+Jmd0OzwvZm9udD48L3ByZT48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxk
aXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIDE2IE9jdCAyMDIzIGF0IDE0
OjQyLCBHdXJjaGV0YW4gU2luZ2ggJmx0OzxhIGhyZWY9Im1haWx0bzpndXJjaGV0YW5zaW5naEBj
aHJvbWl1bS5vcmciPmd1cmNoZXRhbnNpbmdoQGNocm9taXVtLm9yZzwvYT4mZ3Q7IHdyb3RlOjxi
cj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4
IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFk
ZGluZy1sZWZ0OjFleCI+VGhpcyBhbGxvd3Mgc2V0dGluZyB0aGUgZGVidWcgbmFtZSBkdXJpbmcg
Q09OVEVYVF9JTklULjxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IEd1cmNoZXRhbiBTaW5naCAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmd1cmNoZXRhbnNpbmdoQGNocm9taXVtLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPmd1cmNoZXRhbnNpbmdoQGNocm9taXVtLm9yZzwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0K
wqBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmjCoCDCoHzCoCA0ICsrKzxicj4N
CsKgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCAzOCArKysrKysrKysr
KysrKysrKysrKysrLS0tLTxicj4NCsKgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2
Lmg8YnI+DQppbmRleCA5NjM2NWE3NzJmNzcuLmMwNzAyZDYzMGUwNSAxMDA2NDQ8YnI+DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2Lmg8YnI+DQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2Lmg8YnI+DQpAQCAtNTgsNiArNTgsOCBAQDxicj4N
CsKgI2RlZmluZSBNQVhfQ0FQU0VUX0lEIDYzPGJyPg0KwqAjZGVmaW5lIE1BWF9SSU5HUyA2NDxi
cj4NCjxicj4NCisjZGVmaW5lIERFQlVHX05BTUVfTUFYX0xFTiA2NDxicj4NCis8YnI+DQrCoHN0
cnVjdCB2aXJ0aW9fZ3B1X29iamVjdF9wYXJhbXMgezxicj4NCsKgIMKgIMKgIMKgIHVuc2lnbmVk
IGxvbmcgc2l6ZTs8YnI+DQrCoCDCoCDCoCDCoCBib29sIGR1bWI7PGJyPg0KQEAgLTI3NCw2ICsy
NzYsOCBAQCBzdHJ1Y3QgdmlydGlvX2dwdV9mcHJpdiB7PGJyPg0KwqAgwqAgwqAgwqAgdWludDY0
X3QgYmFzZV9mZW5jZV9jdHg7PGJyPg0KwqAgwqAgwqAgwqAgdWludDY0X3QgcmluZ19pZHhfbWFz
azs8YnI+DQrCoCDCoCDCoCDCoCBzdHJ1Y3QgbXV0ZXggY29udGV4dF9sb2NrOzxicj4NCivCoCDC
oCDCoCDCoGNoYXIgZGVidWdfbmFtZVtERUJVR19OQU1FX01BWF9MRU5dOzxicj4NCivCoCDCoCDC
oCDCoGNoYXIgZXhwbGljaXRfZGVidWdfbmFtZTs8YnI+DQrCoH07PGJyPg0KPGJyPg0KwqAvKiB2
aXJ0Z3B1X2lvY3RsLmMgKi88YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwu
Yzxicj4NCmluZGV4IDhkMTNiMTdjMjE1Yi4uNGQ2ZDQ0YTRjODk5IDEwMDY0NDxicj4NCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jPGJyPg0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmM8YnI+DQpAQCAtNDIsMTIgKzQyLDE5IEBA
PGJyPg0KwqBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NyZWF0ZV9jb250ZXh0X2xvY2tlZChzdHJ1
Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IHZpcnRp
b19ncHVfZnByaXYgKnZmcHJpdik8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBjaGFyIGRiZ25h
bWVbVEFTS19DT01NX0xFTl07PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHZmcHJpdi0mZ3Q7ZXhwbGlj
aXRfZGVidWdfbmFtZSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZpcnRpb19ncHVf
Y21kX2NvbnRleHRfY3JlYXRlKHZnZGV2LCB2ZnByaXYtJmd0O2N0eF9pZCw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB2ZnByaXYtJmd0O2NvbnRleHRfaW5pdCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJsZW4odmZw
cml2LSZndDtkZWJ1Z19uYW1lKSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2ZnByaXYtJmd0O2RlYnVnX25h
bWUpOzxicj4NCivCoCDCoCDCoCDCoH0gZWxzZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2hhciBkYmduYW1lW1RBU0tfQ09NTV9MRU5dOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGdl
dF90YXNrX2NvbW0oZGJnbmFtZSwgY3VycmVudCk7PGJyPg0KLcKgIMKgIMKgIMKgdmlydGlvX2dw
dV9jbWRfY29udGV4dF9jcmVhdGUodmdkZXYsIHZmcHJpdi0mZ3Q7Y3R4X2lkLDxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZmcHJp
di0mZ3Q7Y29udGV4dF9pbml0LCBzdHJsZW4oZGJnbmFtZSksPGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGJnbmFtZSk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ2V0X3Rhc2tfY29tbShkYmduYW1lLCBjdXJyZW50KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2aXJ0aW9fZ3B1X2NtZF9jb250ZXh0X2NyZWF0
ZSh2Z2RldiwgdmZwcml2LSZndDtjdHhfaWQsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmZwcml2LSZndDtj
b250ZXh0X2luaXQsIHN0cmxlbihkYmduYW1lKSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkYmduYW1lKTs8
YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgdmZwcml2LSZndDtjb250
ZXh0X2NyZWF0ZWQgPSB0cnVlOzxicj4NCsKgfTxicj4NCkBAIC0xMDcsNiArMTE0LDkgQEAgc3Rh
dGljIGludCB2aXJ0aW9fZ3B1X2dldHBhcmFtX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEsPGJyPg0KwqAgwqAgwqAgwqAgY2FzZSBWSVJUR1BVX1BBUkFNX1NVUFBPUlRF
RF9DQVBTRVRfSURzOjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZhbHVlID0gdmdkZXYt
Jmd0O2NhcHNldF9pZF9tYXNrOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxi
cj4NCivCoCDCoCDCoCDCoGNhc2UgVklSVEdQVV9QQVJBTV9FWFBMSUNJVF9ERUJVR19OQU1FOjxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZhbHVlID0gdmdkZXYtJmd0O2hhc19jb250ZXh0
X2luaXQgPyAxIDogMDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQrC
oCDCoCDCoCDCoCBkZWZhdWx0Ojxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAt
RUlOVkFMOzxicj4NCsKgIMKgIMKgIMKgIH08YnI+DQpAQCAtNTgwLDcgKzU5MCw3IEBAIHN0YXRp
YyBpbnQgdmlydGlvX2dwdV9jb250ZXh0X2luaXRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDs8YnI+DQo8YnI+
DQrCoCDCoCDCoCDCoCAvKiBOdW1iZXIgb2YgdW5pcXVlIHBhcmFtZXRlcnMgc3VwcG9ydGVkIGF0
IHRoaXMgdGltZS4gKi88YnI+DQotwqAgwqAgwqAgwqBpZiAobnVtX3BhcmFtcyAmZ3Q7IDMpPGJy
Pg0KK8KgIMKgIMKgIMKgaWYgKG51bV9wYXJhbXMgJmd0OyA0KTxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHJldHVybiAtRUlOVkFMOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGN0eF9zZXRf
cGFyYW1zID0gbWVtZHVwX3VzZXIodTY0X3RvX3VzZXJfcHRyKGFyZ3MtJmd0O2N0eF9zZXRfcGFy
YW1zKSw8YnI+DQpAQCAtNjQyLDYgKzY1MiwyMiBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfY29u
dGV4dF9pbml0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsPGJyPg0KPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdmZwcml2LSZndDtyaW5nX2lkeF9tYXNrID0g
dmFsdWU7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBWSVJUR1BVX0NPTlRFWFRfUEFSQU1fREVC
VUdfTkFNRTo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAodmZw
cml2LSZndDtleHBsaWNpdF9kZWJ1Z19uYW1lKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIG91dF91bmxvY2s7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBzdHJuY3B5X2Zyb21fdXNlcih2
ZnByaXYtJmd0O2RlYnVnX25hbWUsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKGNvbnN0IGNoYXIgX191
c2VyICopdTY0X3RvX3VzZXJfcHRyKHZhbHVlKSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBERUJVR19O
QU1FX01BWF9MRU4pOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlm
IChyZXQgJmx0OyAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0ID0gLUVGQVVMVDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIG91dF91bmxvY2s7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB2ZnByaXYtJmd0O2V4cGxpY2l0X2RlYnVnX25hbWUgPSB0cnVlOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGRlZmF1bHQ6PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcmV0ID0gLUVJTlZBTDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBnb3RvIG91dF91bmxvY2s7PGJyPg0KLS0gPGJyPg0KMi40Mi4wLjY1NS5nNDIx
ZjEyYzI4NC1nb29nPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000356e840607db16b3--
