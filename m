Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C22296A32
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39726E49B;
	Fri, 23 Oct 2020 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270526E255;
 Thu, 22 Oct 2020 21:40:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id bc23so3249222edb.5;
 Thu, 22 Oct 2020 14:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ye8Oo0//hYvczhAGt6KHG9OzkSrSCdlWjnUP+NDCwEE=;
 b=r4ZSa7IGg+H9TNC4t7vxsFpbVF4K4dAQ2e9Rmp+xCVpml5fAlLufoVlNprevyUwEiA
 xpjsc2ESKkyRXWY4AgsEQpEO8u5dPEvMiZhw8MKRBmjE4mksbZ+03B7z9CgMMLnw6cDL
 Utt4veTsHmOHtBkr1P5RPWBfzcDk+68Xe75BzAjPQU6iVv0CWUsjWmQ/g9nbOYbOQvxW
 3mOBHWLSrSKDQ+22gOwn6tPQPTIp1gliq8IXfIqUlb9oMzUiFWkRS9Bd025zr0rrn6Y4
 wN98WqMiKP3cpf5e2HmberlrxHeMgvN0ObayE5YYKOo0O+Izt46T9RQKcDZauirPeHBx
 LfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ye8Oo0//hYvczhAGt6KHG9OzkSrSCdlWjnUP+NDCwEE=;
 b=VT0one7D9K4NeoFr1osVFcZMEe2qM8pqdzlX8EMGUVW/IBKQKrbQcWqG0cx/vIvhX0
 RB3pD7772aFjDvI6HuQHs2FQXn2kzSdDqh0qrOkAz+g2kpexbZb7qrvnt8vWvTZ0St0K
 LlH5iiIIAt/EKnXZ/R44HpXYN+dGxzZvsa6aVe0/7rQbRGFipfxB7Im20oDVryfbTCGt
 YTQij6Gr/In/JHhYnPKXJGOfOiydcwRWBoPHWFNd6SzzRxfTO/rIgIMLY9Y6bGQM/MXa
 x/W0IAZC9hr7P/aMLiXvuvRu8L17xuchaLO4Q2E3lfreKW6bVQ0e+emJB2TzeLWr95Lq
 lOzw==
X-Gm-Message-State: AOAM531baKNne/9qpKWANDPCJTTjZIdRTy34DFcXSMZ9TaUSeq6kKg46
 R4PZqj0dC+MPTq8xat8dyhWMGExjUFevsOT60Z8=
X-Google-Smtp-Source: ABdhPJytEh/rhw8O8I7wCP27WT69OW91BrvYNyj3dqUwjwOdIi1rvDsToagDf5iPxny0hZ5jGmMyM+kPSFe8bJnusj0=
X-Received: by 2002:a05:6402:151a:: with SMTP id
 f26mr4316057edw.386.1603402814831; 
 Thu, 22 Oct 2020 14:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603371258.git.sylphrenadin@gmail.com>
 <f6107f3e467f1906abdcc33d35f13cf54f7e5a96.1603371258.git.sylphrenadin@gmail.com>
 <20201022135455.GA1788090@kroah.com>
In-Reply-To: <20201022135455.GA1788090@kroah.com>
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Fri, 23 Oct 2020 03:10:03 +0530
Message-ID: <CACAkLuoR=w-=t-tQWH1-3i_nVZggbLjY8eQVzb412Br4ctqBmQ@mail.gmail.com>
Subject: Re: [Outreachy kernel] [PATCH 4/5] gpu: drm: amdgpu: Replace
 snprintf() with sysfs_emit()
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Outreachy <outreachy-kernel@googlegroups.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0638590417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0638590417==
Content-Type: multipart/alternative; boundary="00000000000035becb05b2494fda"

--00000000000035becb05b2494fda
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2020 at 7:24 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Thu, Oct 22, 2020 at 07:17:56PM +0530, Sumera Priyadarsini wrote:
> > Using snprintf() for show() methods holds the risk of buffer overrun
> > as snprintf() does not know the PAGE_SIZE maximum of the temporary
> > buffer used to output sysfs content.
> >
> > Modify amdgpu_psp.c to use sysfs_emit() instead which knows the
> > size of the temporary buffer.
> >
> > Issue found with Coccinelle.
> >
> > Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > index d6c38e24f130..4d1d1e1b005d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > @@ -2621,7 +2621,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_read(struct
> device *dev,
> >               return ret;
> >       }
> >
> > -     return snprintf(buf, PAGE_SIZE, "%x\n", fw_ver);
> > +     return sysfs_emit(buf, PAGE_SIZE, "%x\n", fw_ver);
>
> Did you build this code?  I don't think it is correct...
>

Yes, you are right. I compiled all of them again separately. I had based
them off the usual drm tree
but that is wrong because sysfs_emit has been added only in the 5.10. I
will send a v2 with the proper
corrections.

regards,
sumera


> thanks,
>
> greg k-h
>

--00000000000035becb05b2494fda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 22, 2020 at 7:24 PM Greg =
KH &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Thu, Oct 22, 2020 at 07:17:56PM +0530, Sumera Priyadarsini wrote:<br=
>
&gt; Using snprintf() for show() methods holds the risk of buffer overrun<b=
r>
&gt; as snprintf() does not know the PAGE_SIZE maximum of the temporary<br>
&gt; buffer used to output sysfs content.<br>
&gt; <br>
&gt; Modify amdgpu_psp.c to use sysfs_emit() instead which knows the<br>
&gt; size of the temporary buffer.<br>
&gt; <br>
&gt; Issue found with Coccinelle.<br>
&gt; <br>
&gt; Signed-off-by: Sumera Priyadarsini &lt;<a href=3D"mailto:sylphrenadin@=
gmail.com" target=3D"_blank">sylphrenadin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_psp.c<br>
&gt; index d6c38e24f130..4d1d1e1b005d 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; @@ -2621,7 +2621,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_read(struct =
device *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%x\n&quot;,=
 fw_ver);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sysfs_emit(buf, PAGE_SIZE, &quot;%x\n&quot=
;, fw_ver);<br>
<br>
Did you build this code?=C2=A0 I don&#39;t think it is correct...<br></bloc=
kquote><div><br></div><div>Yes, you are right. I compiled all of them again=
 separately. I had based them off the usual drm tree<br></div><div>but that=
 is wrong because sysfs_emit has been added only in the 5.10. I will send a=
 v2 with the proper</div><div>corrections.<br><br></div><div>regards,<br></=
div><div>sumera</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div></div>

--00000000000035becb05b2494fda--

--===============0638590417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0638590417==--
