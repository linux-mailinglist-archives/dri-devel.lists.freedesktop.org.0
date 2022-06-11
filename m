Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B4547455
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 13:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5973910E9A4;
	Sat, 11 Jun 2022 11:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB02310E9A4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 11:41:02 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id o17so1319910pla.6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 04:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XifpliP7qkNCIB8pC7G+wpzXuAJiP8EhvQ0E8ZTWFKY=;
 b=UkF8D4rIF0NAazU7NIlveLmFiP6vz05NI9hZyD3/1yg2wjHrxFtMTnns5DlxqbLIqp
 CVXPyiEj23jajHzwaBJQ7gLJhr9y5LLOcJVhLZNgxFe8qnsLmFvolK+s4fsuwpD55aUB
 KSapvtKLoEVt93eAhlh5V5rf2mhv6ltd1bzYaJhgwfePhF5aCTImn9PBmtvIPeNaMbUK
 hlMloD/zIraG+HiznssrfIzIBIlQ51JKFeZJ5rD0Uy1vkH612vDlMcFLH+FzSzQmFOHc
 frdLOGKVZrgiSbovqRGVGsvSVcH6EqNAE8cIZq5bojY3Oa0btGjDYbcQoZ/gcHY3Vjzh
 RZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XifpliP7qkNCIB8pC7G+wpzXuAJiP8EhvQ0E8ZTWFKY=;
 b=ht0KPRS2z+8aQJZq8PpzJErI7uw3pUw8ElWsobqN3vb3/Xh429HzYsM1h53930s8JB
 8mu60Rch2rown8Wdjz05AblSK455ZC83PNIuFtSYTlFp1IxZk0gglcYKwy/nByLD3cJt
 QTaqGCa0Nh4j98HOM+F6ZL6SXE2df8SxmvD1iLNtaqqHmJT30UQjLJI6XZtDoCHy/fTF
 gbKOeudbkthfIIopLEm8iDNoU0n+9eyff0Ha0d88EjtlexLvgD+sfcQ4C6yIl9Y4J9P1
 lCi+ziWJO7jHuak2PIe8rEv5L1OJEEGwYkoLr914lkeCi+DpTqIalnXnlgz1OEiSc9zC
 v/iA==
X-Gm-Message-State: AOAM530Ay9+LNSmXTGYSkwYSMDoTNhkswERHbWZsZipnAT4dHg1eLO8O
 8YQcVnGjI24Vk+fnrnGX56mv985BeRQmanMzuDNu0Q==
X-Google-Smtp-Source: ABdhPJy0TkF2P9On45crKDAJSc6rYSBDzUJY/SMng0ZXAP4fjJQ4EuQnMecjqHK2NE0JI465Y9ZeWymnKvxn/uqi540=
X-Received: by 2002:a17:903:24f:b0:168:d2ba:711c with SMTP id
 j15-20020a170903024f00b00168d2ba711cmr123550plh.7.1654947662202; Sat, 11 Jun
 2022 04:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220610135426.670120-1-michel@daenzer.net>
 <2260b6a6-153c-6c12-212c-2b3f5199e6dc@gmail.com>
In-Reply-To: <2260b6a6-153c-6c12-212c-2b3f5199e6dc@gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Sat, 11 Jun 2022 13:40:51 +0200
Message-ID: <CAHbf0-EA430-DLb_9M+jX_UwdMbrGDdFu_XcKicgsXz0zeROhA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000087271905e12a870b"
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000087271905e12a870b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for finding this

I'll have access to my machine on Monday and will close those issues off
once I've tested things

Cheers

Mike

On Sat, 11 Jun 2022, 09:19 Christian K=C3=B6nig, <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 10.06.22 um 15:54 schrieb Michel D=C3=A4nzer:
> > From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >
> > The commit below changed the TTM manager size unit from pages to
> > bytes, but failed to adjust the corresponding calculations in
> > amdgpu_ioctl.
> >
> > Fixes: dfa714b88eb0 ("drm/amdgpu: remove GTT accounting v2")
> > Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1930
> > Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6642
> > Signed-off-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
>
> Ah, WTF! You won't believe how long I have been searching for this one.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > index 801f6fa692e9..6de63ea6687e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > @@ -642,7 +642,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void
> *data, struct drm_file *filp)
> >                           atomic64_read(&adev->visible_pin_size),
> >                           vram_gtt.vram_size);
> >               vram_gtt.gtt_size =3D ttm_manager_type(&adev->mman.bdev,
> TTM_PL_TT)->size;
> > -             vram_gtt.gtt_size *=3D PAGE_SIZE;
> >               vram_gtt.gtt_size -=3D atomic64_read(&adev->gart_pin_size=
);
> >               return copy_to_user(out, &vram_gtt,
> >                                   min((size_t)size, sizeof(vram_gtt))) =
?
> -EFAULT : 0;
> > @@ -675,7 +674,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void
> *data, struct drm_file *filp)
> >                       mem.cpu_accessible_vram.usable_heap_size * 3 / 4;
> >
> >               mem.gtt.total_heap_size =3D gtt_man->size;
> > -             mem.gtt.total_heap_size *=3D PAGE_SIZE;
> >               mem.gtt.usable_heap_size =3D mem.gtt.total_heap_size -
> >                       atomic64_read(&adev->gart_pin_size);
> >               mem.gtt.heap_usage =3D ttm_resource_manager_usage(gtt_man=
);
>
>

--00000000000087271905e12a870b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for finding this<div dir=3D"auto"><br></div><div d=
ir=3D"auto">I&#39;ll have access to my machine on Monday and will close tho=
se issues off once I&#39;ve tested things</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Cheers</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Mike</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sat, 11 Jun 2022, 09:19 Christian K=C3=B6nig, &lt;<a href=3D"=
mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Am 10.06.22 um 15:54 =
schrieb Michel D=C3=A4nzer:<br>
&gt; From: Michel D=C3=A4nzer &lt;<a href=3D"mailto:mdaenzer@redhat.com" ta=
rget=3D"_blank" rel=3D"noreferrer">mdaenzer@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The commit below changed the TTM manager size unit from pages to<br>
&gt; bytes, but failed to adjust the corresponding calculations in<br>
&gt; amdgpu_ioctl.<br>
&gt;<br>
&gt; Fixes: dfa714b88eb0 (&quot;drm/amdgpu: remove GTT accounting v2&quot;)=
<br>
&gt; Bug: <a href=3D"https://gitlab.freedesktop.org/drm/amd/-/issues/1930" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.freedesktop.=
org/drm/amd/-/issues/1930</a><br>
&gt; Bug: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/6642=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.freedeskto=
p.org/mesa/mesa/-/issues/6642</a><br>
&gt; Signed-off-by: Michel D=C3=A4nzer &lt;<a href=3D"mailto:mdaenzer@redha=
t.com" target=3D"_blank" rel=3D"noreferrer">mdaenzer@redhat.com</a>&gt;<br>
<br>
Ah, WTF! You won&#39;t believe how long I have been searching for this one.=
<br>
<br>
Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@am=
d.com" target=3D"_blank" rel=3D"noreferrer">christian.koenig@amd.com</a>&gt=
;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 --<br>
&gt;=C2=A0 =C2=A01 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_kms.c<br>
&gt; index 801f6fa692e9..6de63ea6687e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&gt; @@ -642,7 +642,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *filp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_read(&amp;adev-&gt;visible_pin_size),<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vram_gtt.vram_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vram_gtt.gtt_siz=
e =3D ttm_manager_type(&amp;adev-&gt;mman.bdev, TTM_PL_TT)-&gt;size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vram_gtt.gtt_size *=
=3D PAGE_SIZE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vram_gtt.gtt_siz=
e -=3D atomic64_read(&amp;adev-&gt;gart_pin_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return copy_to_u=
ser(out, &amp;vram_gtt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min((size_t)size, si=
zeof(vram_gtt))) ? -EFAULT : 0;<br>
&gt; @@ -675,7 +674,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *filp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mem.cpu_accessible_vram.usable_heap_size * 3 / 4;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem.gtt.total_he=
ap_size =3D gtt_man-&gt;size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem.gtt.total_heap_si=
ze *=3D PAGE_SIZE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem.gtt.usable_h=
eap_size =3D mem.gtt.total_heap_size -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0atomic64_read(&amp;adev-&gt;gart_pin_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem.gtt.heap_usa=
ge =3D ttm_resource_manager_usage(gtt_man);<br>
<br>
</blockquote></div>

--00000000000087271905e12a870b--
