Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F95ACA9A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8A610E182;
	Mon,  5 Sep 2022 06:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DDA10E15B;
 Mon,  5 Sep 2022 06:11:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b16so9947949edd.4;
 Sun, 04 Sep 2022 23:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TOxGbAy2/OZKwJ9nVGZ0GlPbb7hcvaZ08+xyL+o4xuM=;
 b=P/RNRHPfxk589sRUV2jUSQ2pYGwFnYClt07V5tXQYH+u+yVAnCG9IXsvjyIFHkL4X4
 IsP3CXKPZEjK0izCyF2p4snAYK6cfmeAvl0cj7jQZ8WjhFsQfeaa2hK/5o2r6eiBCrX/
 ihaTbTv78PiysAWrOqUWwUYpazupk+9ci6Hg71bmaHFE3RcP4YI73AuJxsV/cX1+nNEZ
 o0JV5puFxO0CXNNfE5XJz8eBrarQ5f9398fcTrXZPMy7O4q0iIV9LPEd7i9lcYRsyaiv
 TxUGdGIXswj2NnMAfJgfn4tElxYtikBOA5mkLAyAwGpKGZuO04+2bvI3iQvBxFcULsuF
 dXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TOxGbAy2/OZKwJ9nVGZ0GlPbb7hcvaZ08+xyL+o4xuM=;
 b=vGmYIxH2QxxdbDoS2JCkRRFUuuYCupASYscGTIFu+l6vWBPChZugJGRafo1sSBKHLL
 lgoScm8hGyKmXXySBF6RFJ1+qySH2ctGZinK+hTXPJw0B1+rWJYf0VbiXVeuJSmWg5bE
 nrv8tEHh2rtgPs/6a/h7RW578i4EZWpCiq5xrbRDbiDM2jIV7a7YH9EbILYTbwSUfXGl
 d0ccLPOBMmBn90o0gwE7eMGBNxwhH4wBXPJ6Ml+boK+KX5tpBpHFmYVdnrQtEUQXpLoj
 qmIYiTP8cNss0lcor4QYLjvdVWY7YpNk4H37czV0uh2pA0+dDk+V+KSTCAcNqQvbFkgz
 vfDg==
X-Gm-Message-State: ACgBeo3s619GDFFm5iFHYPmLiVw9qMthPiFQyYEiXTKhCNFrk7e+mCB9
 +RBFV5sFVaQgdwm8GOVfZbo4wVOsQmibO0eqcX4=
X-Google-Smtp-Source: AA6agR4yAzdHez7/blZk6NYwiF92kJyUQkRjMuq5dEPkWOo26MOn5t5bRvhx0Ku08bELMi7XurlgR1oHdGlPYRnm5y8=
X-Received: by 2002:a50:ef03:0:b0:44e:82bf:28e6 with SMTP id
 m3-20020a50ef03000000b0044e82bf28e6mr2863623eds.270.1662358276030; Sun, 04
 Sep 2022 23:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
In-Reply-To: <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Mon, 5 Sep 2022 14:11:04 +0800
Message-ID: <CAJedcCz5GKSUt0hZUp3djX3tCq8v3=gPa-tZJJOSaj_fV2psyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: xmzyshypnc <1002992920@qq.com>
Content-Type: multipart/alternative; boundary="00000000000088448105e7e7f2aa"
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

--00000000000088448105e7e7f2aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resent the mail for the former letter contains html text.

Regards,

Zheng Wang

Zheng Hacker <hackerzheng666@gmail.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=885=
=E6=97=A5=E5=91=A8=E4=B8=80 12:47=E5=86=99=E9=81=93=EF=BC=9A

> Hello everyone,
>
> I'm Zheng Wang. I found a potential double-free bug
> in drivers/gpu/drm/i915/gvt/gtt.c. I haven't been replied for a long time=
.
> So I decided to send it to more relavent supporters and developers to hel=
p
> to solve the problem.
>
> Best regards,
> Zheng Wang.
>
> xmzyshypnc <1002992920@qq.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=884=E6=97=A5=
=E5=91=A8=E6=97=A5 20:32=E5=86=99=E9=81=93=EF=BC=9A
>
>> There is a double-free security bug in split_2MB_gtt_entry.
>>
>> Here is a calling chain :
>> ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry. If
>> intel_gvt_dma_map_guest_page failed, it will call  ppgtt_invalidate_spt,
>> which will finally call ppgtt_free_spt and kfree(spt). But the caller do=
es
>> not notice that, and it will call ppgtt_free_spt again in error path.
>>
>> Fix this by returning the result of ppgtt_invalidate_spt to
>> split_2MB_gtt_entry.
>>
>> Signed-off-by: Zheng Wang <1002992920@qq.com>
>> ---
>>  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c
>> b/drivers/gpu/drm/i915/gvt/gtt.c
>> index ce0eb03709c3..9f14fded8c0c 100644
>> --- a/drivers/gpu/drm/i915/gvt/gtt.c
>> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
>> @@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu
>> *vgpu,
>>                 ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn +
>> sub_index,
>>                                                    PAGE_SIZE, &dma_addr)=
;
>>                 if (ret) {
>> -                       ppgtt_invalidate_spt(spt);
>> +                       ret =3D ppgtt_invalidate_spt(spt);
>>                         return ret;
>>                 }
>>                 sub_se.val64 =3D se->val64;
>> --
>> 2.25.1
>>
>>

--00000000000088448105e7e7f2aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Resent the mail for the former letter contains html t=
ext.<br></div><div><br></div><div>Regards,</div><div><br></div><div>Zheng W=
ang</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Zheng Hacker &lt;<a href=3D"mailto:hackerzheng666@gmail.com">hackerzheng=
666@gmail.com</a>&gt; =E4=BA=8E2022=E5=B9=B49=E6=9C=885=E6=97=A5=E5=91=A8=
=E4=B8=80 12:47=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hello everyone=
,<div><br><div>I&#39;m Zheng Wang. I found a potential double-free bug in=
=C2=A0drivers/gpu/drm/i915/gvt/gtt.c. I haven&#39;t been replied for a long=
 time. So I decided to send it to more relavent supporters and developers t=
o help to solve=C2=A0the problem.</div></div><div><br></div><div>Best regar=
ds,</div><div>Zheng Wang.</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">xmzyshypnc &lt;<a href=3D"mailto:1002992920@=
qq.com">1002992920@qq.com</a>&gt; =E4=BA=8E2022=E5=B9=B49=E6=9C=884=E6=97=
=A5=E5=91=A8=E6=97=A5 20:32=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">There is a double-free security bug =
in split_2MB_gtt_entry.<br>
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
Signed-off-by: Zheng Wang &lt;<a href=3D"mailto:1002992920@qq.com">10029929=
20@qq.com</a>&gt;<br>
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
</blockquote></div></div>

--00000000000088448105e7e7f2aa--
