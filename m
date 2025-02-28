Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF48A49E46
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B490510E035;
	Fri, 28 Feb 2025 16:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LxS72PsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8F710E035
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740758687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v/Epw72KVYxpor3/952VJqBcEa+L62LaFNYDgnqaPe0=;
 b=LxS72PsMwZJi2zwEmVO6Vm53iIw6PEo7xuj/pOW7H9DKuPY97ImTkJ5TrVHhK14YCC8/cS
 avwdvz77ixnXv2yUdccD5nm2mK7iKJS6pem90qL5PqeKvEelUpYtBmcv5uP/IlVLcuIyrh
 PE15q4Po3J1igHAI13Q3g8SvN8Evago=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-Y8pe0kBCP3yMnsXpSno9oQ-1; Fri, 28 Feb 2025 11:04:44 -0500
X-MC-Unique: Y8pe0kBCP3yMnsXpSno9oQ-1
X-Mimecast-MFC-AGG-ID: Y8pe0kBCP3yMnsXpSno9oQ_1740758683
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6fd36a398cfso25111677b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740758683; x=1741363483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v/Epw72KVYxpor3/952VJqBcEa+L62LaFNYDgnqaPe0=;
 b=KoB3lqFWUiKet+0fb/T1D7HjMqV1PMEA8kUlGE72bzfRYRkrPHZ7IDTJi6tW2qOraR
 hUwb959c/OpkkQHt6e+u98RH63ZnyLX57yg9UR9k3jNVcoJs+uyt6PyhVcOLlorcDkOM
 4mX+uFaBoUihuSSvw87Fco4d6ve7srqdW7UFEnpuQrhBzWBSephuscQulKQ7KH+tAaj4
 rDiRwnUgxHFpNf05ILVY4oXuqCZxPnCJa0/TJj86LDapvnX3NjtJF6Q4CgszGeHDxa3u
 s7G4fBMN0RF6oE5v+W8oLnAq0gCDh/wb26PkttVOCXXy4T2K1oGgrewmm87i8d8BiMOX
 pTVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqC6WDY+aUNZlp4tcAaS/h9OrmS/yVNxs3cLjH95ac2o+AZxsvJSNDVZQq1b1k5u/FTLhXFuvMn/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy10XqTJk50rj7P5D7D93IcA4IUUuAogIYPl0uoyN/YRyG1gU5f
 GZKeGKYMJNENuXsWsqIfZjx5jS4x8RFR6B232WB4KUZvU5SqK8J5mh4bVOo3ZiQMeDbL2G5uJ7x
 3K1vzU497t+PuRYTsIq0XWR26s1uh7GnU/IfyJY3ogSq7dR3fJ+tpeCtmG+NjD3+Es4ZfyAQuB6
 jIMajS5bOOFVU7LfVHR7o1n+Ubv4RqoybjpBBx4Ziz
X-Gm-Gg: ASbGncsjUyw4fJG8kzkcqCpuuvUT3xX77icyLTeWO5FWZu8v/Vz9z3Th+Fa1kM9Y9Yh
 +qUdRDrfjIjCt1OP5HJz4ZjeNgVI36auFq6+1doZCQwg4kdaaNuxWs5g9j60MIrs4iDZAm/8=
X-Received: by 2002:a05:690c:6f0c:b0:6f9:7b99:8a29 with SMTP id
 00721157ae682-6fd4a16c21dmr53676767b3.34.1740758683558; 
 Fri, 28 Feb 2025 08:04:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVg8niKsikMGRCyiVofkgughhe7poL/Qwd9NVX4342CtOrVzwelyn+Kf8SZYoZNr2HLxWk5StdLMHvVFEonNs=
X-Received: by 2002:a05:690c:6f0c:b0:6f9:7b99:8a29 with SMTP id
 00721157ae682-6fd4a16c21dmr53676457b3.34.1740758683328; Fri, 28 Feb 2025
 08:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-2-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-2-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:04:32 -0500
X-Gm-Features: AQ5f1JoVGJ2pIntVxRNSb1vEz_B2ZLZlUHXIJUMoo-spdx18i0mWdrSb0EnfWtE
Message-ID: <CAN9Xe3Rbf7fjWy=3Gh_QtNb9jq+9DM6BNZL8w2uHKJMTUT9v4Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] drm/gem: Test for imported GEM buffers with helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JdGpcdnItKbtIT-Qw-pxdQggobGiD3quCUPOHDh_sbg_1740758683
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f5b785062f35f6f2"
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

--000000000000f5b785062f35f6f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Add drm_gem_is_imported() that tests if a GEM object's buffer has
> been imported. Update the GEM code accordingly.
>
> GEM code usually tests for imports if import_attach has been set
> in struct drm_gem_object. But attaching a dma-buf on import requires
> a DMA-capable importer device, which is not the case for many serial
> busses like USB or I2C. The new helper tests if a GEM object's dma-buf
> has been created from the GEM object.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem.c |  4 ++--
>  include/drm/drm_gem.h     | 14 ++++++++++++++
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ee811764c3df..c6240bab3fa5 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -348,7 +348,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file,
> struct drm_device *dev,
>                 return -ENOENT;
>
>         /* Don't allow imported objects to be mapped */
> -       if (obj->import_attach) {
> +       if (drm_gem_is_imported(obj)) {
>                 ret =3D -EINVAL;
>                 goto out;
>         }
> @@ -1178,7 +1178,7 @@ void drm_gem_print_info(struct drm_printer *p,
> unsigned int indent,
>                           drm_vma_node_start(&obj->vma_node));
>         drm_printf_indent(p, indent, "size=3D%zu\n", obj->size);
>         drm_printf_indent(p, indent, "imported=3D%s\n",
> -                         str_yes_no(obj->import_attach));
> +                         str_yes_no(drm_gem_is_imported(obj)));
>
>         if (obj->funcs->print_info)
>                 obj->funcs->print_info(p, indent, obj);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index fdae947682cd..2bf893eabb4b 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -35,6 +35,7 @@
>   */
>
>  #include <linux/kref.h>
> +#include <linux/dma-buf.h>
>  #include <linux/dma-resv.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> @@ -575,6 +576,19 @@ static inline bool
> drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>         return (obj->handle_count > 1) || obj->dma_buf;
>  }
>
> +/**
> + * drm_gem_is_imported() - Tests if GEM object's buffer has been importe=
d
> + * @obj: the GEM object
> + *
> + * Returns:
> + * True if the GEM object's buffer has been imported, false otherwise
> + */
> +static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
> +{
> +       /* The dma-buf's priv field points to the original GEM object. */
> +       return obj->dma_buf && (obj->dma_buf->priv !=3D obj);
> +}
> +
>

Looks good to me.
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

>  #ifdef CONFIG_LOCKDEP
>  /**
>   * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the
> gpuva list.
> --
> 2.48.1
>
>

--000000000000f5b785062f35f6f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26,=
 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmerma=
nn@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Add drm_gem_is_imported() that tests if a =
GEM object&#39;s buffer has<br>
been imported. Update the GEM code accordingly.<br>
<br>
GEM code usually tests for imports if import_attach has been set<br>
in struct drm_gem_object. But attaching a dma-buf on import requires<br>
a DMA-capable importer device, which is not the case for many serial<br>
busses like USB or I2C. The new helper tests if a GEM object&#39;s dma-buf<=
br>
has been created from the GEM object.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_gem.c |=C2=A0 4 ++--<br>
=C2=A0include/drm/drm_gem.h=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++<br>
=C2=A02 files changed, 16 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c<br>
index ee811764c3df..c6240bab3fa5 100644<br>
--- a/drivers/gpu/drm/drm_gem.c<br>
+++ b/drivers/gpu/drm/drm_gem.c<br>
@@ -348,7 +348,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file, stru=
ct drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t allow imported objects to be mappe=
d */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;import_attach) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(obj)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -1178,7 +1178,7 @@ void drm_gem_print_info(struct drm_printer *p, unsign=
ed int indent,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 drm_vma_node_start(&amp;obj-&gt;vma_node));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_printf_indent(p, indent, &quot;size=3D%zu\n=
&quot;, obj-&gt;size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_printf_indent(p, indent, &quot;imported=3D%=
s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0str_yes_no(obj-&gt;import_attach));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0str_yes_no(drm_gem_is_imported(obj)));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj-&gt;funcs-&gt;print_info)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj-&gt;funcs-&gt;p=
rint_info(p, indent, obj);<br>
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h<br>
index fdae947682cd..2bf893eabb4b 100644<br>
--- a/include/drm/drm_gem.h<br>
+++ b/include/drm/drm_gem.h<br>
@@ -35,6 +35,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &lt;linux/kref.h&gt;<br>
+#include &lt;linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;linux/dma-resv.h&gt;<br>
=C2=A0#include &lt;linux/list.h&gt;<br>
=C2=A0#include &lt;linux/mutex.h&gt;<br>
@@ -575,6 +576,19 @@ static inline bool drm_gem_object_is_shared_for_memory=
_stats(struct drm_gem_obje<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (obj-&gt;handle_count &gt; 1) || obj-&gt=
;dma_buf;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * drm_gem_is_imported() - Tests if GEM object&#39;s buffer has been impor=
ted<br>
+ * @obj: the GEM object<br>
+ *<br>
+ * Returns:<br>
+ * True if the GEM object&#39;s buffer has been imported, false otherwise<=
br>
+ */<br>
+static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)<b=
r>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The dma-buf&#39;s priv field points to the o=
riginal GEM object. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return obj-&gt;dma_buf &amp;&amp; (obj-&gt;dma_=
buf-&gt;priv !=3D obj);<br>
+}<br>
+<br></blockquote><div><br></div><div>Looks good to me.</div><div>Reviewed-=
by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@red=
hat.com</a>&gt; <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
=C2=A0#ifdef CONFIG_LOCKDEP<br>
=C2=A0/**<br>
=C2=A0 * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the=
 gpuva list.<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--000000000000f5b785062f35f6f2--

