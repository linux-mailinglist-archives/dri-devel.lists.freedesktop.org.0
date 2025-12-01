Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079EC9933B
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 22:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C8610E497;
	Mon,  1 Dec 2025 21:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UWLKvnZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F58310E497
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 21:39:27 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8b21fc25ae1so451082785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 13:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764625166; x=1765229966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ya5FXlt3fgfn2bY5272+Q5pv7MOagNgU6+eVeVRebso=;
 b=UWLKvnZkMUn0juOhiKiLPQRc84GzuVY7HCn6jrjMAn7ScsZhezV3pMtajr5VZytnxy
 n7V36AYJIHOnMi3Tmer98tHmFjREqcyqeSR5j4J9lwSToRRiFr/+8FtP7HUrGgzGMaBM
 FytEeeA85nUqeb/Xq1KfxI/d+iydWJoq1xiRrtZfOLppTj38sgqNHT26TXwLSsbtsB/u
 rI4zVJM+6n45xdbsh0jsu6Lm+Tj+4daOrYgtwPMtrIVciwrMeINvrMCzHLfDpw/yfba6
 3heorBkXexKVt81qOs0TA0wrhwWr+Ufb33/FmkT+N6OlOsDuMjZm0bEkwJ7G44D3CvOp
 Cshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764625166; x=1765229966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ya5FXlt3fgfn2bY5272+Q5pv7MOagNgU6+eVeVRebso=;
 b=P4gSQYEtGWL3a4QbQuykXmVYR+jZyBgnHRDXxFELrS+cEsv47yKusULnc7OYFa4j2Q
 COWU5PEX2/Oz75NnPzKWGvmVDJy6b1a59UO8bAhHlN4KIWtb6HZdV7QgINOXu4u2nxGy
 VaQ45pCuzK8ofxr6t1Zv4gIVR3Yn7UiwQTE38wjELhwC89RUHgaqiQP5pyopPjoNzwTC
 3vOIwUPVzUFVTjCisJIgs8JIPceiPGRTA2Q8knnhUuMKVu55MyYaXfQik4HnVdlJaCTe
 O/dbilujGvAtBSimy0BAdiwRnyx3v1c37rKMSUB0gjavJHoqcMK9d0GDWoMaGUjXk41I
 BA+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaWCtwfstpHCJSa2Z6i8p799tLoz3V9+Sj+dYkXp0da+6XJttYfSnt3CJsY1qoRp9vhnLOkG9IYtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhje4oC1xcLi0MZ5eLjjhEE6xCsrXSzcMmOW1sv3BIVVVbcFBx
 kUQEQyMc6+xbymZxvffFsvYn+rfUn9e3vnhTxvCULz+rTDBfkJMSZ3g6XT/k2CA7YlXbJoGJiqz
 yl5ETdilElBOumTvXXRc2E1oxi24AoN4=
X-Gm-Gg: ASbGnctmiyI1En1BJlyZ6U0AfRuVZ17XYddpFsHAPrgyH7n28xEGbe3bc3nRCX3bXLC
 +0uh6RnNavlCB/0SsS/uCv+HNtFSWmL6Aup8VL8cvL1xsRhLc+IoB8wwudxr9uZYfU1kjI7R+zV
 v0EJqJ/+sLH5xBsjk1IKyx07Td2xPX7L7qcsv5TRDrVlGolVzSTK3vbnxXoMowApM8ukPs59fD1
 UXeRcxs8+V1VijadVMvzC5ORPlzCnGikZA0snKwIYtObSKraVwlDgxL00/p4XDqgY5fkA==
X-Google-Smtp-Source: AGHT+IFDJ6lg5MxUSmUVun4F/Tz+fV/DaTriGHNCnPcATTgtDfNsilRg6+Hi6qXUw8UE/oCfbowoPuItAeaNKnkxOOI=
X-Received: by 2002:a05:620a:2907:b0:857:890f:7fab with SMTP id
 af79cd13be357-8b4ebdce57dmr3735537485a.85.1764625165847; Mon, 01 Dec 2025
 13:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20251122090343.81243-1-21cnbao@gmail.com>
 <ed7701d7-28c8-4760-9ccb-f22fc1e9528e@kernel.org>
In-Reply-To: <ed7701d7-28c8-4760-9ccb-f22fc1e9528e@kernel.org>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 2 Dec 2025 05:39:14 +0800
X-Gm-Features: AWmQ_bkntYc9RqDd7viHZ4oh-bPL-P8xMulAYuAEyBuveMg92U8PVcocpttZ0iw
Message-ID: <CAGsJ_4zwXiwvHYvX6pBsyWLi-LXQcTDzR=e+hQ_4YOLd5BhCOA@mail.gmail.com>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 John Stultz <jstultz@google.com>, Maxime Ripard <mripard@kernel.org>
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

On Mon, Dec 1, 2025 at 6:36=E2=80=AFPM David Hildenbrand (Red Hat)
<david@kernel.org> wrote:
[...]
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 0832f944544c..af2e3e8c052a 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -642,6 +642,34 @@ static int vmap_small_pages_range_noflush(unsigned=
 long addr, unsigned long end,
> >       return err;
> >   }
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             unsigned int stride,
> > +             int max_steps,
> > +             unsigned int idx)
>
> These fit into less lines.
>
> ideally
>
> \t\tunsigned int stride, int max_steps, unsigned int idx)

Right, thanks!

>
> > +{
>
> int order, nr_pages, i;
> struct page *base;
>
> But I think you can just drop "base". And order.

Right, thanks!

>
> > +     /*
> > +      * Currently, batching is only supported in vmap_pages_range
> > +      * when page_shift =3D=3D PAGE_SHIFT.
> > +      */
> > +     if (stride !=3D 1)
> > +             return 0;
> > +
> > +     struct page *base =3D pages[idx];
> > +     if (!PageHead(base))
> > +             return 0;
> > +
> > +     int order =3D compound_order(base);
> > +     int nr_pages =3D 1 << order;
>
>
> You can drop the head check etc and simply do
>
> nr_pages =3D compound_nr(pages[idx]);
> if (nr_pages =3D=3D 1)
>         return 0;
>

Nice. Since compound_nr() returns 1 for tail pages.

> Which raises the question: are these things folios? I assume not.

In my case, it=E2=80=99s simply alloc_pages with GFP_COMP. I assume that fo=
lios
allocated via folio_alloc() would also automatically benefit from this patc=
h?

Currently, vmap() takes a pages array as an argument. So even for a folio,
we need to expand it into individual pages. Simply passing a folios array t=
o
vmalloc likely won=E2=80=99t work, since vmap() could start and end at subp=
ages
in the middle of a folio.

Thanks
Barry
