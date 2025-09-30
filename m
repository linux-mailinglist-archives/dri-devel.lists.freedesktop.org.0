Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9183BAB162
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 04:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF03D10E266;
	Tue, 30 Sep 2025 02:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RBP4eVyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com
 [74.125.224.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0FA10E266
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 02:49:24 +0000 (UTC)
Received: by mail-yx1-f99.google.com with SMTP id
 956f58d0204a3-6354f14b881so3959919d50.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 19:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759200563; x=1759805363;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Hy0W+dLX7DSqdGhnKrHuxSRI9leIICuGVUFYECfUzM4=;
 b=bcPXEG3HZH4K0FBTkTnG0Oo36fzG24VycBPTNdcT82yPnv6lpSCGXEd7DbuopNBxL7
 MVavFXvHgUHQCM6rzexKzG2wHbw6RBNCm2ERK+QSLJBHesF45nvsBcvEhvXkzpAtuiGJ
 SwJMMoU5YU9eLu+fzH0ndv5WCBL8m0TnmaL3OX0zU0E1xHRHhdo9PXY5+GlZN8IdJQ1Y
 0bLFLLkClu7NeFU78qYxLzWC/U9jwPt3iTMavC8tufkJJFuyx5siFLQUtP3VPUDntxiB
 ANjdPcA+IDMjESYQ4Yi+tgglj9AO+oYj4pFSZw696C2qXasDeeN5CSvRmdSaRZTScrT1
 uRsQ==
X-Gm-Message-State: AOJu0YxYWBEt4t1XNwSWhTeqlI/xK8X/x6UVHtdgjT6ZGq7UNIXPzSok
 94eFRanl+1WFjnvoaH4vFnzgATH175MDupCP1fYOGiQLSUwmxIbH5u4STmV1GFmH0v8kIY/pE4W
 tE7+CMneju5ATIcPxDhf5NXwg955r/3zus/jmhcHZoKak82vPjZjmT/CzUOVBs1xfNpwOHNtxAz
 ENSAayzXNOxEOrI39ptmYgz+92hY0YmtP8aRArltocP2/eeSZyCAVGiih0xAlW5P/jpaA724JNB
 4+dzIXxWpzIcQZFPt4X
X-Gm-Gg: ASbGncuVJKaCZoj46EN2w1VwYlev1OvQPl+S1RNTnc8uMAlz6djIaUNLHYiVH5c8Pi3
 3m+2oMBFPx/SII6NjlGZ3kyLd/hnRbVgkHXYgJ35o2ewr5oUrXVzCQ1qn0orHArI+aWjzNi9Pt3
 uitHaVfsZeViPNAmZle8TzVGnZ/H0WF2C4W6X37eR/gBzGdUYBVG/Fr/3hQSgv9tanQxNp8rJaE
 f/JMKDjEyi1qaYfltSZ50FIwBqwP9TR+dFZkD9GkN527zPFZp+jpoR/AKF6vOIRWzZ5zfJIol0p
 RjgqYOOxse2TuI9g/JSrgZEFjYFauWO+H2OUgkGxfmbdk3xW4XLwTgASHclVF875UbcbswBkpTt
 wYGneABxyID0Y/re0MdoWDtNn7g0Y20Jt6aZrDnIieVx7Lb59bEULdO9CVz2nW+QaBTQ0Us/Fya
 NtLTEp
X-Google-Smtp-Source: AGHT+IFJZG2YCpWhkpzsFoJwe+6mvesiQ1qYUFFdk2/8xJSH6whHCM/WKpyyu3TpJfwMnJ5j2tMVnQccrZOU
X-Received: by 2002:a05:690e:d4d:b0:622:4818:ce38 with SMTP id
 956f58d0204a3-6361a7ec640mr21457206d50.37.1759200562975; 
 Mon, 29 Sep 2025 19:49:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 956f58d0204a3-6361e9416d5sm590363d50.14.2025.09.29.19.49.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Sep 2025 19:49:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-36cc5d00795so32141541fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 19:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1759200560; x=1759805360;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hy0W+dLX7DSqdGhnKrHuxSRI9leIICuGVUFYECfUzM4=;
 b=RBP4eVytEFvmu0J7wNn1THcV1QaxckNf85TQL7ooenFlNqZ2jOCIOVgHXaBTKGJjb5
 xQrKhnjmb1XKtvHKyvEFbeUfTd8zlpBEK3l4qdMUpqzBlQYXNEnrEHU8CuX4MgaQRZJp
 lZKWYbuIqtveDXznpxbyMRYjlCCNxY0yu7yO0=
X-Received: by 2002:a05:651c:1592:b0:372:9223:9efb with SMTP id
 38308e7fff4ca-3729223d730mr23318161fa.45.1759200559434; 
 Mon, 29 Sep 2025 19:49:19 -0700 (PDT)
X-Received: by 2002:a05:651c:1592:b0:372:9223:9efb with SMTP id
 38308e7fff4ca-3729223d730mr23318151fa.45.1759200558947; Mon, 29 Sep 2025
 19:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250926195427.1405237-1-ian.forbes@broadcom.com>
 <20250926195427.1405237-3-ian.forbes@broadcom.com>
In-Reply-To: <20250926195427.1405237-3-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 29 Sep 2025 22:49:06 -0400
X-Gm-Features: AS18NWALgiKqUzgI3ArUF6mI_S9y4kkH2Qnc5eIazxhE_hJCNOiEjapzOXeeEJE
Message-ID: <CABQX2QMfjxkVZ6yMVDXsrmETuYM4Z6CowCnsz5fxK2GqfW6tSA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/vmwgfx: Move the validation duplicates hashtable
 onto the stack
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com, praveen.singh@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000077d46d063ffbcc2c"
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

--00000000000077d46d063ffbcc2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 3:54=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> This hashtable is only used under a lock in vmw_execbuf_process and needs
> to be cleared before vmw_execbuf_process returns otherwise bad things
> happen because the nodes that are stored in the table come from an arena
> allocator that is cleared at the end of the function.
>
> Rather than wasting time cleaning up the hashtable move it onto the stack
> so we don't have to do any cleanup.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  9 -----
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  3 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    |  3 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 43 +++-------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.h |  5 ++-
>  5 files changed, 9 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 8ff958d119be..4b53d751b0e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -814,13 +814,6 @@ static void vmw_write_driver_id(struct vmw_private *=
dev)
>         }
>  }
>
> -static void vmw_sw_context_init(struct vmw_private *dev_priv)
> -{
> -       struct vmw_sw_context *sw_context =3D &dev_priv->ctx;
> -
> -       hash_init(sw_context->res_ht);
> -}
> -
>  static void vmw_sw_context_fini(struct vmw_private *dev_priv)
>  {
>         struct vmw_sw_context *sw_context =3D &dev_priv->ctx;
> @@ -836,8 +829,6 @@ static int vmw_driver_load(struct vmw_private *dev_pr=
iv, u32 pci_id)
>         enum vmw_res_type i;
>         bool refuse_dma =3D false;
>
> -       vmw_sw_context_init(dev_priv);
> -
>         mutex_init(&dev_priv->cmdbuf_mutex);
>         mutex_init(&dev_priv->binding_mutex);
>         spin_lock_init(&dev_priv->resource_lock);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index eda5b6f8f4c4..e8004a0a68c9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -78,7 +78,6 @@
>  #define VMW_RES_STREAM ttm_driver_type2
>  #define VMW_RES_FENCE ttm_driver_type3
>  #define VMW_RES_SHADER ttm_driver_type4
> -#define VMW_RES_HT_ORDER 12
>
>  #define MKSSTAT_CAPACITY_LOG2 5U
>  #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
> @@ -347,7 +346,6 @@ struct vmw_ctx_validation_info;
>
>  /**
>   * struct vmw_sw_context - Command submission context
> - * @res_ht: Pointer hash table used to find validation duplicates
>   * @kernel: Whether the command buffer originates from kernel code rathe=
r
>   * than from user-space
>   * @fp: If @kernel is false, points to the file of the client. Otherwise
> @@ -377,7 +375,6 @@ struct vmw_ctx_validation_info;
>   * @ctx: The validation context
>   */
>  struct vmw_sw_context{
> -       DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
>         bool kernel;
>         struct vmw_fpriv *fp;
>         struct drm_file *filp;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index 819704ac675d..6a7a9fc13a7f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -4172,8 +4172,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>         if (unlikely(ret !=3D 0))
>                 goto out_err;
>
> -       vmw_validation_drop_ht(&val_ctx);
> -
>         ret =3D mutex_lock_interruptible(&dev_priv->binding_mutex);
>         if (unlikely(ret !=3D 0)) {
>                 ret =3D -ERESTARTSYS;
> @@ -4282,7 +4280,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>                 __vmw_execbuf_release_pinned_bo(dev_priv, NULL);
>  out_unlock:
>         vmw_cmdbuf_res_revert(&sw_context->staged_cmd_res);
> -       vmw_validation_drop_ht(&val_ctx);
>         WARN_ON(!list_empty(&sw_context->ctx_list));
>         mutex_unlock(&dev_priv->cmdbuf_mutex);
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_validation.c
> index 35dc94c3db39..1da7dbef905f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -166,7 +166,7 @@ vmw_validation_find_bo_dup(struct vmw_validation_cont=
ext *ctx,
>                 struct vmwgfx_hash_item *hash;
>                 unsigned long key =3D (unsigned long) vbo;
>
> -               hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash,=
 head, key) {
> +               hash_for_each_possible(ctx->res_ht, hash, head, key) {
>                         if (hash->key =3D=3D key) {
>                                 bo_node =3D container_of(hash, typeof(*bo=
_node), hash);
>                                 break;
> @@ -208,7 +208,7 @@ vmw_validation_find_res_dup(struct vmw_validation_con=
text *ctx,
>                 struct vmwgfx_hash_item *hash;
>                 unsigned long key =3D (unsigned long) res;
>
> -               hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash,=
 head, key) {
> +               hash_for_each_possible(ctx->res_ht, hash, head, key) {
>                         if (hash->key =3D=3D key) {
>                                 res_node =3D container_of(hash, typeof(*r=
es_node), hash);
>                                 break;
> @@ -258,8 +258,7 @@ int vmw_validation_add_bo(struct vmw_validation_conte=
xt *ctx,
>
>                 if (ctx->sw_context) {
>                         bo_node->hash.key =3D (unsigned long) vbo;
> -                       hash_add_rcu(ctx->sw_context->res_ht, &bo_node->h=
ash.head,
> -                               bo_node->hash.key);
> +                       hash_add(ctx->res_ht, &bo_node->hash.head, bo_nod=
e->hash.key);
>                 }
>                 val_buf =3D &bo_node->base;
>                 vmw_bo_reference(vbo);
> @@ -305,11 +304,11 @@ int vmw_validation_add_resource(struct vmw_validati=
on_context *ctx,
>
>         if (ctx->sw_context) {
>                 node->hash.key =3D (unsigned long) res;
> -               hash_add_rcu(ctx->sw_context->res_ht, &node->hash.head, n=
ode->hash.key);
> +               hash_add(ctx->res_ht, &node->hash.head, node->hash.key);
>         }
>         node->res =3D vmw_resource_reference_unless_doomed(res);
>         if (!node->res) {
> -               hash_del_rcu(&node->hash.head);
> +               hash_del(&node->hash.head);
>                 return -ESRCH;
>         }
>
> @@ -611,38 +610,6 @@ int vmw_validation_res_validate(struct vmw_validatio=
n_context *ctx, bool intr)
>         return 0;
>  }
>
> -/**
> - * vmw_validation_drop_ht - Reset the hash table used for duplicate find=
ing
> - * and unregister it from this validation context.
> - * @ctx: The validation context.
> - *
> - * The hash table used for duplicate finding is an expensive resource an=
d
> - * may be protected by mutexes that may cause deadlocks during resource
> - * unreferencing if held. After resource- and buffer object registering,
> - * there is no longer any use for this hash table, so allow freeing it
> - * either to shorten any mutex locking time, or before resources- and
> - * buffer objects are freed during validation context cleanup.
> - */
> -void vmw_validation_drop_ht(struct vmw_validation_context *ctx)
> -{
> -       struct vmw_validation_bo_node *entry;
> -       struct vmw_validation_res_node *val;
> -
> -       if (!ctx->sw_context)
> -               return;
> -
> -       list_for_each_entry(entry, &ctx->bo_list, base.head)
> -               hash_del_rcu(&entry->hash.head);
> -
> -       list_for_each_entry(val, &ctx->resource_list, head)
> -               hash_del_rcu(&val->hash.head);
> -
> -       list_for_each_entry(val, &ctx->resource_ctx_list, head)
> -               hash_del_rcu(&val->hash.head);
> -
> -       ctx->sw_context =3D NULL;
> -}
> -
>  /**
>   * vmw_validation_unref_lists - Unregister previously registered buffer
>   * object and resources.
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm=
/vmwgfx/vmwgfx_validation.h
> index 353d837907d8..2b82a1a3110d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
> @@ -37,10 +37,11 @@
>  #define VMW_RES_DIRTY_NONE 0
>  #define VMW_RES_DIRTY_SET BIT(0)
>  #define VMW_RES_DIRTY_CLEAR BIT(1)
> +#define VMW_RES_HT_ORDER 7
>
>  /**
>   * struct vmw_validation_context - Per command submission validation con=
text
> - * @ht: Hash table used to find resource- or buffer object duplicates
> + * @res_ht: Hash table used to find resource- or buffer object duplicate=
s
>   * @resource_list: List head for resource validation metadata
>   * @resource_ctx_list: List head for resource validation metadata for
>   * resources that need to be validated before those in @resource_list
> @@ -55,6 +56,7 @@
>   */
>  struct vmw_validation_context {
>         struct vmw_sw_context *sw_context;
> +       DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
>         struct list_head resource_list;
>         struct list_head resource_ctx_list;
>         struct list_head bo_list;
> @@ -84,6 +86,7 @@ struct vmw_fence_obj;
>  #define DECLARE_VAL_CONTEXT(_name, _sw_context, _merge_dups)           \
>         struct vmw_validation_context _name =3D                          =
 \
>         { .sw_context =3D _sw_context,                                   =
 \
> +         .res_ht =3D {},                                                =
 \
>           .resource_list =3D LIST_HEAD_INIT((_name).resource_list),      =
 \
>           .resource_ctx_list =3D LIST_HEAD_INIT((_name).resource_ctx_list=
), \
>           .bo_list =3D LIST_HEAD_INIT((_name).bo_list),                  =
 \
> --
> 2.51.0
>

Could you make this one part of a seperate series i.e. "Cleanup
resource hashtable usage" or such. As is it's a bit of half-way done,
e.g. DECLARE_VAL_CONTEXT still takes sw_context, for which the only
reason was the hashtable which is not part of it anymore. I think we'd
want to finish this cleanup, get rid of sw_context usage in validation
and remove it from DECLARE_VAL_CONTEXT.
This also gives us a more natural spot to land those patch (the first
two in drm-misc-fixes and this series in drm-misc-next).

z

z

z

--00000000000077d46d063ffbcc2c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVIgYJKoZIhvcNAQcCoIIVEzCCFQ8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghKPMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGWDCCBECg
AwIBAgIMYT8cPnonh1geNIT5MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MTEyODA2NTUwOVoXDTI2MTEyOTA2NTUwOVowgaUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjETMBEGA1UEAxMKWmFjayBSdXNpbjEmMCQGCSqG
SIb3DQEJARYXemFjay5ydXNpbkBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQCwQ8KpnuEwUOX0rOrLRj3vS0VImknKwshcmcfA9VtdEQhJHGDQoNjaBEFQHqLqn4Lf
hqEGUo+nKhz2uqGl2MtQFb8oG+yJPCFPgeSvbiRxmeOwSP0jrNADVKpYpy4UApPqS+UfVQXKbwbM
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEILOd
owfbiigX+pPNj9xbO0AX6F4cONpeDhJW0Y2AdIVeMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDkzMDAyNDkyMFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAEMowfW0upXZOpVMd1arB/WX0e+PoP4lS3YUQL+Y
V9+4urMhRYOLc7WQoYRYpr/7olE+eXXpik3qb+7KKDJdiRXI7mkKiSqtIjeAsiS9FfIqxqJ2fjyv
VioTVSKhKfgOit7QAZCqal4bOMt2WQeVozk4+3cX5MrYaabG3GkqUh2caQ3VB0S7zdjamS5UPAdT
L9qaIXScqShSlocMl2RHkwGpz0H05rnKbAbnA74p6pou0q/DpYn89lCl1S4c/WXwP3i5e1wkLB7f
L52dDGeuTopAzq6tblINwdIa+/kxmmflkhxk/DifLodeT+tQnxqosqJWfqOGzgHV5Z/XesNP9dI=
--00000000000077d46d063ffbcc2c--
