Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E637C1893BB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 02:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4806E84E;
	Wed, 18 Mar 2020 01:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD276E046
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:42:44 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id w7so7002200ioj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 12:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=WxE6W2Kl9rsSCxGJt+M5n7ku4cFYrDBWOzXNzMLJ58w=;
 b=ZRT6vursB082K5cldWQtEKUo/RRUohEreuteu7YBJqX2M9W/2oQ1cEPBM/D3Q6Lamu
 bT1olDbzjnQBiaNlA3K0X2d/hHRMlu7Y4j+sW6R0jeMbiBmOs8E7aqiikznNwfeHJbHU
 q9WsTK7Q290wPZgPqzTmbxLWTAILPXBID0rQC2o6QcOvKTou6riMgyYXvb2irfGVV3eL
 vGSGgwzi9T8XU5Zy5MCFS8CsxE1yY3QiTEoyvsE5lnLp5GIaphNw0ylIS5BPV5HGALE1
 uQsFeOCLh2cuQa9rH144YilSUM3xytMV+iv7SQtzmGfOm+Qc5fZkO0ZK6I8Njjc2NyLV
 iwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=WxE6W2Kl9rsSCxGJt+M5n7ku4cFYrDBWOzXNzMLJ58w=;
 b=oL0w6Y17YWKjF/3RFlQ7hU8YCxtsJhu0Q1FErx1XdIT1iscdMj4mSa0p8Y0Kxvh/Ly
 8mVceLV7izHxa4bCJIuRz+jxw53icmwkaoxLJ7wO3M3s6wriBisFpTCfMWfLxFOtzO6t
 mpoEhMJDzSI1kgKzpsorSJkun0Bp4ZF6dgqfZLYOizZ+SKq5ylkel+KOGM5S9hR/YRmD
 OSn7n/rNSvijvurnmq2vZuZk6apDUj9DoH7ZwLhGYGJHOVhX1xST4QYPp0C0nauZySm0
 8cKSpMc0vDHbbjOC8q1oIzD9zt5PRbc4HFiT/gMvgnRazg+elYQE0H4JFdup4RRerqqc
 RTuA==
X-Gm-Message-State: ANhLgQ3rSRxtQvaQz96Pga7fqQzwOdH/UYQDFcWHVz0jGU1xKVzKRcEw
 ZdUB2C2EEkav10+iW14CXZvl1Yv7iLiE0cadoig=
X-Google-Smtp-Source: ADFU+vuEWx8F9E8b3NGAosisFRV1CjQNR8t8XJ3MHiVLnB90Xid+VkYBNbbpLsqVkZhgWnYWs7frQ9owgoc3SCP1P0g=
X-Received: by 2002:a6b:ef0f:: with SMTP id k15mr425780ioh.62.1584474163955;
 Tue, 17 Mar 2020 12:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200316210413.2321-1-igormtorrente@gmail.com>
 <CAOA8r4HieupER-gW4BU9U8YYC+6eLkSzoS2z-KRrbq4XZb40Ww@mail.gmail.com>
 <20200317170431.GS2363188@phenom.ffwll.local>
In-Reply-To: <20200317170431.GS2363188@phenom.ffwll.local>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Tue, 17 Mar 2020 16:42:32 -0300
Message-ID: <CAOA8r4EyosfO3fa5WoLdGGKBOkt299k_xio1gU9JD_ugMthefg@mail.gmail.com>
Subject: Re: Fwd: [PATCH] Staging: drm_gem: Fix a typo in a function comment
To: Igor Torrente <igormtorrente@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Wed, 18 Mar 2020 01:38:24 +0000
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
Content-Type: multipart/mixed; boundary="===============2085757165=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2085757165==
Content-Type: multipart/alternative; boundary="000000000000b2cbde05a1122388"

--000000000000b2cbde05a1122388
Content-Type: text/plain; charset="UTF-8"

Yes, I will do it.

On Tue, Mar 17, 2020 at 2:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Mar 16, 2020 at 06:08:30PM -0300, Igor Torrente wrote:
> > Ccing dri-devel and linux-kernel.
>
> git apply-mbox chokes on this, can you pls resubmit?
>
> Thanks, Daniel
>
> >
> > ---------- Forwarded message ---------
> > From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> > Date: Mon, Mar 16, 2020 at 6:04 PM
> > Subject: [PATCH] Staging: drm_gem: Fix a typo in a function comment
> > To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
> > <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>, <
> > sumit.semwal@linaro.org>
> > Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>, <
> > Rodrigo.Siqueira@amd.com>, <rodrigosiqueiramelo@gmail.com>, <
> > andrealmeid@collabora.com>
> >
> >
> > Replace "pionter" with "pointer" in the
> > drm_gem_handle_create description.
> >
> > Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 6e960d57371e..c356379f5e97 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -432,7 +432,7 @@ drm_gem_handle_create_tail(struct drm_file
> *file_priv,
> >   * drm_gem_handle_create - create a gem handle for an object
> >   * @file_priv: drm file-private structure to register the handle for
> >   * @obj: object to register
> > - * @handlep: pionter to return the created handle to the caller
> > + * @handlep: pointer to return the created handle to the caller
> >   *
> >   * Create a handle for this object. This adds a handle reference to the
> > object,
> >   * which includes a regular reference count. Callers will likely want to
> > --
> > 2.20.1
>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000b2cbde05a1122388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I will do it. <br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2020 at 2:04 PM Dan=
iel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@=
ffwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, Mar 16, 2020 at 06:08:30PM -0300, Igor Torrente wrote:<br>
&gt; Ccing dri-devel and linux-kernel.<br>
<br>
git apply-mbox chokes on this, can you pls resubmit?<br>
<br>
Thanks, Daniel<br>
<br>
&gt; <br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: Igor Matheus Andrade Torrente &lt;<a href=3D"mailto:igormtorrent=
e@gmail.com" target=3D"_blank">igormtorrente@gmail.com</a>&gt;<br>
&gt; Date: Mon, Mar 16, 2020 at 6:04 PM<br>
&gt; Subject: [PATCH] Staging: drm_gem: Fix a typo in a function comment<br=
>
&gt; To: &lt;<a href=3D"mailto:maarten.lankhorst@linux.intel.com" target=3D=
"_blank">maarten.lankhorst@linux.intel.com</a>&gt;, &lt;<a href=3D"mailto:m=
ripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;,<br>
&gt; &lt;sean@poorly.run&gt;, &lt;<a href=3D"mailto:airlied@linux.ie" targe=
t=3D"_blank">airlied@linux.ie</a>&gt;, &lt;<a href=3D"mailto:daniel@ffwll.c=
h" target=3D"_blank">daniel@ffwll.ch</a>&gt;, &lt;<br>
&gt; <a href=3D"mailto:sumit.semwal@linaro.org" target=3D"_blank">sumit.sem=
wal@linaro.org</a>&gt;<br>
&gt; Cc: Igor Matheus Andrade Torrente &lt;<a href=3D"mailto:igormtorrente@=
gmail.com" target=3D"_blank">igormtorrente@gmail.com</a>&gt;, &lt;<br>
&gt; <a href=3D"mailto:Rodrigo.Siqueira@amd.com" target=3D"_blank">Rodrigo.=
Siqueira@amd.com</a>&gt;, &lt;<a href=3D"mailto:rodrigosiqueiramelo@gmail.c=
om" target=3D"_blank">rodrigosiqueiramelo@gmail.com</a>&gt;, &lt;<br>
&gt; <a href=3D"mailto:andrealmeid@collabora.com" target=3D"_blank">andreal=
meid@collabora.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Replace &quot;pionter&quot; with &quot;pointer&quot; in the<br>
&gt; drm_gem_handle_create description.<br>
&gt; <br>
&gt; Signed-off-by: Igor Matheus Andrade Torrente &lt;<a href=3D"mailto:igo=
rmtorrente@gmail.com" target=3D"_blank">igormtorrente@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_gem.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c<br>
&gt; index 6e960d57371e..c356379f5e97 100644<br>
&gt; --- a/drivers/gpu/drm/drm_gem.c<br>
&gt; +++ b/drivers/gpu/drm/drm_gem.c<br>
&gt; @@ -432,7 +432,7 @@ drm_gem_handle_create_tail(struct drm_file *file_p=
riv,<br>
&gt;=C2=A0 =C2=A0* drm_gem_handle_create - create a gem handle for an objec=
t<br>
&gt;=C2=A0 =C2=A0* @file_priv: drm file-private structure to register the h=
andle for<br>
&gt;=C2=A0 =C2=A0* @obj: object to register<br>
&gt; - * @handlep: pionter to return the created handle to the caller<br>
&gt; + * @handlep: pointer to return the created handle to the caller<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* Create a handle for this object. This adds a handle refe=
rence to the<br>
&gt; object,<br>
&gt;=C2=A0 =C2=A0* which includes a regular reference count. Callers will l=
ikely want to<br>
&gt; -- <br>
&gt; 2.20.1<br>
<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--000000000000b2cbde05a1122388--

--===============2085757165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2085757165==--
