Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A91C0C27
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 04:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBA06E288;
	Fri,  1 May 2020 02:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA306E288
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 02:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588300424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WoEKQ4lWoOTrBQAr9fSIywvhXH2CJ/MfFxWkNiilf98=;
 b=ZJKCu/CmsK/6FisRxgFiLPGjtyCgkcVd1sf1yF6ECXuNLS+9e33VvGVIszgYGBOyNgKbcS
 1GeA6J8U09WvrJWPFn/X9IbL9oOshKcwYMfHEXfYX3Cg35RiLLxiUGzSSUYNFBrkpi5N4V
 f3KpKSXT9U5kpKT1QuXnJFp5ClySC6A=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-meCj_nOQN3mhqZ-CPfcOGw-1; Thu, 30 Apr 2020 22:33:40 -0400
X-MC-Unique: meCj_nOQN3mhqZ-CPfcOGw-1
Received: by mail-vs1-f72.google.com with SMTP id h8so1996973vsq.19
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmTXwQDIMo+IjpBIspuTIpC6trFCfV96jFy7feBDa3U=;
 b=NjYFUVgs6JqDozp6sBmWczZlB98LosWmj2E/3tsT9hYYUKJ6ruwtEEeCpfIwG672iw
 JPSazF7lX90fYU9a7gjb6YVyWy/QjVKtz55SrKL94AE/fPMN0eVYqHHm4Sa8aPkLA/Z2
 jGrndQoFgGZj3FP7t6pvr3/5YrYrpdaDGRmYLyOrMVoog/Nis3V2Y84xH4shcZGOH3R/
 ig/ZR0YSXx5EPcUUglgev98owC5VP1203kvcBWglLFQoJH/T7ncWj1j7enKJkahxxftO
 6vZ6GHvHo1OXQnc5EJmUNsUH3CHF+ZJeLFa+Biih6erEH3kJoIKS7mfj90YOHu+hXoa6
 u/rA==
X-Gm-Message-State: AGi0PuaNP4yPYkYzmNQ/7f4um/7ExbKM12kGn5JJRZaYJw3CzwiF9+0x
 GQWn0s+CaXvUF8Wyd0im4KTUPDSWSOFpwRkYd58cdnc9V/bk00PsOd2Tdf51a3vWoP6z81nOgQK
 6ME4RfqVZjahD0JUihD9cHom9h3ev3YKSGZ2n0/Ek2ykG
X-Received: by 2002:a1f:4106:: with SMTP id o6mr1255019vka.52.1588300419618;
 Thu, 30 Apr 2020 19:33:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzJZChxr1bIOT3BrCLUuQh+Ikon7C/tnK/FqweuMnIX4otnNYFiYRZlgH/GIaMCFHcKeYabPii/TDhlHZceM8=
X-Received: by 2002:a1f:4106:: with SMTP id o6mr1254987vka.52.1588300419383;
 Thu, 30 Apr 2020 19:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-22-hch@lst.de>
 <20200414151344.zgt2pnq7cjq2bgv6@debian>
In-Reply-To: <20200414151344.zgt2pnq7cjq2bgv6@debian>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 30 Apr 2020 22:33:28 -0400
Message-ID: <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
Subject: Re: [PATCH 21/29] mm: remove the pgprot argument to __vmalloc
To: Wei Liu <wei.liu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Gao Xiang <xiang@kernel.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="===============1718727707=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1718727707==
Content-Type: multipart/alternative; boundary="0000000000004b5c5705a48d02f1"

--0000000000004b5c5705a48d02f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings;

I recently noticed this change via the linux-next tree.

It may not be possible to edit at this late date, but the change
description refers to PROT_KERNEL, which is a symbol which does not appear
to exist; perhaps PAGE_KERNEL was meant? The mismatch caused me and a
couple other folks some confusion briefly until we decided it was supposed
to be PAGE_KERNEL; if it's not too late, editing the description to clarify
so would be nice.

Many thanks.

John Dorminy



On Tue, Apr 14, 2020 at 11:15 AM Wei Liu <wei.liu@kernel.org> wrote:

> On Tue, Apr 14, 2020 at 03:13:40PM +0200, Christoph Hellwig wrote:
> > The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove
> > it.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Michael Kelley <mikelley@microsoft.com> [hyperv]
> > Acked-by: Gao Xiang <xiang@kernel.org> [erofs]
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  arch/x86/hyperv/hv_init.c              |  3 +--
> [...]
> >
> > diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> > index 5a4b363ba67b..a3d689dfc745 100644
> > --- a/arch/x86/hyperv/hv_init.c
> > +++ b/arch/x86/hyperv/hv_init.c
> > @@ -95,8 +95,7 @@ static int hv_cpu_init(unsigned int cpu)
> >        * not be stopped in the case of CPU offlining and the VM will
> hang.
> >        */
> >       if (!*hvp) {
> > -             *hvp =3D __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO,
> > -                              PAGE_KERNEL);
> > +             *hvp =3D __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO);
> >       }
>
> Acked-by: Wei Liu <wei.liu@kernel.org>
>
>

--0000000000004b5c5705a48d02f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings;<br><br></div><div>I recently noticed this =
change via the linux-next tree.</div><div><br></div><div>It may not be poss=
ible to edit at this late date, but the change description refers to PROT_K=
ERNEL, which is a symbol which does not appear to exist; perhaps PAGE_KERNE=
L was meant? The mismatch caused me and a couple other folks some confusion=
 briefly until we decided it was supposed to be PAGE_KERNEL; if it&#39;s no=
t too late, editing the description to clarify so would be nice.<br><br></d=
iv><div>Many thanks.<br><br></div><div>John Dorminy<br></div><div><br><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Apr 14, 2020 at 11:15 AM Wei Liu &lt;<a href=3D"mailto:wei.liu=
@kernel.org">wei.liu@kernel.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Apr 14, 2020 at 03:13:40PM +0200, =
Christoph Hellwig wrote:<br>
&gt; The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove<=
br>
&gt; it.<br>
&gt; <br>
&gt; Signed-off-by: Christoph Hellwig &lt;<a href=3D"mailto:hch@lst.de" tar=
get=3D"_blank">hch@lst.de</a>&gt;<br>
&gt; Reviewed-by: Michael Kelley &lt;<a href=3D"mailto:mikelley@microsoft.c=
om" target=3D"_blank">mikelley@microsoft.com</a>&gt; [hyperv]<br>
&gt; Acked-by: Gao Xiang &lt;<a href=3D"mailto:xiang@kernel.org" target=3D"=
_blank">xiang@kernel.org</a>&gt; [erofs]<br>
&gt; Acked-by: Peter Zijlstra (Intel) &lt;<a href=3D"mailto:peterz@infradea=
d.org" target=3D"_blank">peterz@infradead.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/x86/hyperv/hv_init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 3 +--<br>
[...]<br>
&gt; <br>
&gt; diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c<br>
&gt; index 5a4b363ba67b..a3d689dfc745 100644<br>
&gt; --- a/arch/x86/hyperv/hv_init.c<br>
&gt; +++ b/arch/x86/hyperv/hv_init.c<br>
&gt; @@ -95,8 +95,7 @@ static int hv_cpu_init(unsigned int cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not be stopped in the case of CPU offlini=
ng and the VM will hang.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*hvp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*hvp =3D __vmalloc(PA=
GE_SIZE, GFP_KERNEL | __GFP_ZERO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*hvp =3D __vmalloc(PA=
GE_SIZE, GFP_KERNEL | __GFP_ZERO);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Acked-by: Wei Liu &lt;<a href=3D"mailto:wei.liu@kernel.org" target=3D"_blan=
k">wei.liu@kernel.org</a>&gt;<br>
<br>
</blockquote></div>

--0000000000004b5c5705a48d02f1--


--===============1718727707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1718727707==--

