Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F25ACAA2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B02A10E19F;
	Mon,  5 Sep 2022 06:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518AD10E034;
 Mon,  5 Sep 2022 04:48:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id nc14so14636553ejc.4;
 Sun, 04 Sep 2022 21:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=V84qcp9DlZSlObBKnnLO7DSo4j7RpB5UAIcq4lon1b0=;
 b=WAWvZqfpx/FUHk/V9RvVXeus18VpEaln451ZEnC5du6MR8RODpagI1k2ce2QPrj8iK
 lTp0T00ZeBK1zScY1clw225JFKIqo3HROg3cBcLT4E8QcWrtr3KGORcz4AzA0rdnapKZ
 1kJRA0XWgBTIfuYPZMVyOrPZkng+qEqEkg+zzNkDRa6yipyWl5PQUa/s5ihANRj8v86Y
 fuRaaTZwsTgmVgppE0OPKrYnKLr/qJHQMbILBCk+jejYIAamhaJfHM5Z2JtmC+4zYS4B
 Z0oFzX2Sqyx63t5VaQwUXaF/5KfGjBPWKy9Pud1gV8M9VaOkwtYD1TqtsGMC/4ThCmA0
 i1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=V84qcp9DlZSlObBKnnLO7DSo4j7RpB5UAIcq4lon1b0=;
 b=apYAfJuIGBhnXd8+5qIU/4vViNZfiidysX+N/wHJCaz8/A033A9gUz/wyAoATBT6Yh
 t9+3L9MOomfgZ8IwuY/JuXUEnTSMe9fEXNj3xQBF9Gvyftzwqipv12k5KfZ4ARZpStLy
 dGfWZaL4quiKrGuKylalEdxDcACtQdFvPHokhZJGDPNocN2jj4hXnTWfdtV5RA2KJk/P
 560UaF2hvl5eiKiB/HkNJE5c/jTltxBl7Px18SgIn/s8U+a1pJhFYYYr9gKQveYHdKwI
 4Q3l9voqc3GDTfsnpTHbK4LOZYvNXQpJ+G9lACElZRlc0fZ5CjA6BEOy5TERkXrgxH3L
 rkgA==
X-Gm-Message-State: ACgBeo3wJqneGsZTepDKu9C9Ep9rZr/MvwoBctRo17qDA3imBnEPyY7j
 zAMud3aqqOGkPvkxOAoBNFkrq5QtGjrkOT/Lsp0=
X-Google-Smtp-Source: AA6agR6YKvNJo8UV69kqLZfNJ8Yyz0p+ORxRwzRlHng2f2KrAkfUUplDmEIZovnnZYWz1GqQ1CvAG7Z/Ugmg1NWsiHo=
X-Received: by 2002:a17:907:9706:b0:741:64ca:ae10 with SMTP id
 jg6-20020a170907970600b0074164caae10mr25937397ejc.364.1662353288532; Sun, 04
 Sep 2022 21:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
In-Reply-To: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Mon, 5 Sep 2022 12:47:57 +0800
Message-ID: <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: xmzyshypnc <1002992920@qq.com>
Content-Type: multipart/alternative; boundary="0000000000004116c505e7e6c96a"
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: alex000young@gmail.com, security@kernel.org,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004116c505e7e6c96a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I'm Zheng Wang. I found a potential double-free bug
in drivers/gpu/drm/i915/gvt/gtt.c. I haven't been replied for a long time.
So I decided to send it to more relavent supporters and developers to help
to solve the problem.

Best regards,
Zheng Wang.

xmzyshypnc <1002992920@qq.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=884=E6=97=A5=
=E5=91=A8=E6=97=A5 20:32=E5=86=99=E9=81=93=EF=BC=9A

> There is a double-free security bug in split_2MB_gtt_entry.
>
> Here is a calling chain :
> ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry. If
> intel_gvt_dma_map_guest_page failed, it will call  ppgtt_invalidate_spt,
> which will finally call ppgtt_free_spt and kfree(spt). But the caller doe=
s
> not notice that, and it will call ppgtt_free_spt again in error path.
>
> Fix this by returning the result of ppgtt_invalidate_spt to
> split_2MB_gtt_entry.
>
> Signed-off-by: Zheng Wang <1002992920@qq.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c
> b/drivers/gpu/drm/i915/gvt/gtt.c
> index ce0eb03709c3..9f14fded8c0c 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu
> *vgpu,
>                 ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn +
> sub_index,
>                                                    PAGE_SIZE, &dma_addr);
>                 if (ret) {
> -                       ppgtt_invalidate_spt(spt);
> +                       ret =3D ppgtt_invalidate_spt(spt);
>                         return ret;
>                 }
>                 sub_se.val64 =3D se->val64;
> --
> 2.25.1
>
>

--0000000000004116c505e7e6c96a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello everyone,<div><br><div>I&#39;m Zhen=
g Wang. I found a potential double-free bug in=C2=A0drivers/gpu/drm/i915/gv=
t/gtt.c. I haven&#39;t been replied for a long time. So I decided to send i=
t to more relavent supporters and developers to help to solve=C2=A0the prob=
lem.</div></div><div><br></div><div>Best regards,</div><div>Zheng Wang.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">xmzyshypnc &lt;<a href=3D"mailto:1002992920@qq.com">1002992920@qq.com</a>=
&gt; =E4=BA=8E2022=E5=B9=B49=E6=9C=884=E6=97=A5=E5=91=A8=E6=97=A5 20:32=E5=
=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">There is a double-free security bug in split_2MB_gtt_entry.<br>
<br>
Here is a calling chain : ppgtt_populate_spt-&gt;ppgtt_populate_shadow_entr=
y-&gt;split_2MB_gtt_entry. If intel_gvt_dma_map_guest_page failed, it will =
call=C2=A0 ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and=
 kfree(spt). But the caller does not notice that, and it will call ppgtt_fr=
ee_spt again in error path.<br>
<br>
Fix this by returning the result of ppgtt_invalidate_spt to split_2MB_gtt_e=
ntry.<br>
<br>
Signed-off-by: Zheng Wang &lt;<a href=3D"mailto:1002992920@qq.com" target=
=3D"_blank">1002992920@qq.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/i915/gvt/gtt.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.=
c<br>
index ce0eb03709c3..9f14fded8c0c 100644<br>
--- a/drivers/gpu/drm/i915/gvt/gtt.c<br>
+++ b/drivers/gpu/drm/i915/gvt/gtt.c<br>
@@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgp=
u,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D intel_gvt_d=
ma_map_guest_page(vgpu, start_gfn + sub_index,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_SIZE, &amp;dma_addr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ppgtt_invalidate_spt(spt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D ppgtt_invalidate_spt(spt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sub_se.val64 =3D se=
-&gt;val64;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000004116c505e7e6c96a--
