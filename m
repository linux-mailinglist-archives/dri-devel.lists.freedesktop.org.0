Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029338C374
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AAC6F60B;
	Fri, 21 May 2021 09:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728AB6E038
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:40:35 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id f22so12852018pgb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aw8gDlLoU0pIEdlFcNuRqOAiJmYCm1GOm0P/pUdoo+o=;
 b=p8HUmmOqPdlZl5efq5vAQenxYPwsDSCHY3IbPgOt0yf8y1gTt9Y83yTC/r1mMtiiBy
 jCmN0jcTyPMrQ0vXBM+wcQzBDx6wtsBDLAaKBnpO65+0UORk+OTSxFEwHP1miPSXB3f7
 hwE4mvF7ObDhAgclgo6v1hLcJHGxqyGk3KZU5/9/Q30SeLBJazei82yBOX1msdZQHLqS
 NQfa6vOBhhsv3sZkH96JmEw74I+NID5XGFYJdpcBl332x5YYM6cdab/9LhWPrbTgiQSa
 SBaI3NFwYszeFNgN1PyXaVi/D5h4oHToBPDhh6nL4B8v9PUKUzBzRhT5JOwo/eOm4B4+
 zCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aw8gDlLoU0pIEdlFcNuRqOAiJmYCm1GOm0P/pUdoo+o=;
 b=EpBiUFSE6t1iO4fskvpkaqGXVW5H40/oTdTwpIJ7i5LFXl9fqxfBUGHjy8EWZcojUf
 XCKZuZN3fqL5mrcKnQiMBUONAhZ2pLLjwVPxnDYVVXGUjZfdAYcYe04RX8RL1ywUNOBo
 v1gRbT04mj1NWuI4UAnEIj71/piK6InIt+n4jFRD5c8HrWeWgTngNkixzX7kX8k6/XZh
 gLRv+k2z6KynzwZnoFJ3A16Vb2BLHlOLSbLMm22hvmQAQxPiHlyUqBOAoasdfm00+Cbd
 xyp2XUIApvBcDW61SMFSesvSgYw7xQOCLYeLd9LOTZ7B1AegekJUhV1loCPWCRyXQhkz
 6wEQ==
X-Gm-Message-State: AOAM531Uga04LByc5KOBy0Tlz+1chkYMFZ4jHVfDySmJIxZ6L+sw/4An
 KDHPRh7RCNG0c4V8cjgPOtp7Y9/dbl0a+mDPshRlKw==
X-Google-Smtp-Source: ABdhPJxLG9bkG3cUPsNsdBSAPBh3zlZBpZDsInXzIVhKilPzqFUeqYehNJQlRl46JjB36k9qqDBLqJgHzaB42NojxxA=
X-Received: by 2002:a62:ab14:0:b029:2db:b3d9:1709 with SMTP id
 p20-20020a62ab140000b02902dbb3d91709mr9191628pff.80.1621590035117; Fri, 21
 May 2021 02:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
In-Reply-To: <20201110034934.70898-1-john.stultz@linaro.org>
From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 21 May 2021 10:40:24 +0100
Message-ID: <CAF2Aj3iEUkBDyyWDT63iT_7KrquOcEo_L5rCteGF1OJg8Ux3ug@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To: John Stultz <john.stultz@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000003ce7105c2d3da5e"
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000003ce7105c2d3da5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Nov 2020 at 03:49, John Stultz <john.stultz@linaro.org> wrote:

> Hey All,
>   So just wanted to send my last revision of my patch series
> of performance optimizations to the dma-buf system heap.
>
> This series reworks the system heap to use sgtables, and then
> consolidates the pagelist method from the heap-helpers into the
> CMA heap. After which the heap-helpers logic is removed (as it
> is unused). I'd still like to find a better way to avoid some of
> the logic duplication in implementing the entire dma_buf_ops
> handlers per heap. But unfortunately that code is tied somewhat
> to how the buffer's memory is tracked. As more heaps show up I
> think we'll have a better idea how to best share code, so for
> now I think this is ok.
>
> After this, the series introduces an optimization that
> =C3=98rjan Eide implemented for ION that avoids calling sync on
> attachments that don't have a mapping.
>
> Next, an optimization to use larger order pages for the system
> heap. This change brings us closer to the current performance
> of the ION allocation code (though there still is a gap due
> to ION using a mix of deferred-freeing and page pools, I'll be
> looking at integrating those eventually).
>
> Finally, a reworked version of my uncached system heap
> implementation I was submitting a few weeks back. Since it
> duplicated a lot of the now reworked system heap code, I
> realized it would be much simpler to add the functionality to
> the system_heap implementation itself.
>
> While not improving the core allocation performance, the
> uncached heap allocations do result in *much* improved
> performance on HiKey960 as it avoids a lot of flushing and
> invalidating buffers that the cpu doesn't touch often.
>
> Feedback on these would be great!
>
> thanks
> -john
>
> New in v5:
> * Added a comment explaining why the order sizes are
>   chosen as they are
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
>
> John Stultz (7):
>   dma-buf: system_heap: Rework system heap to use sgtables instead of
>     pagelists
>   dma-buf: heaps: Move heap-helper logic into the cma_heap
>     implementation
>   dma-buf: heaps: Remove heap-helpers code
>   dma-buf: heaps: Skip sync if not mapped
>   dma-buf: system_heap: Allocate higher order pages if available
>   dma-buf: dma-heap: Keep track of the heap device struct
>   dma-buf: system_heap: Add a system-uncached heap re-using the system
>     heap
>
>  drivers/dma-buf/dma-heap.c           |  33 +-
>  drivers/dma-buf/heaps/Makefile       |   1 -
>  drivers/dma-buf/heaps/cma_heap.c     | 324 +++++++++++++++---
>  drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------
>  drivers/dma-buf/heaps/heap-helpers.h |  53 ---
>  drivers/dma-buf/heaps/system_heap.c  | 494 ++++++++++++++++++++++++---
>  include/linux/dma-heap.h             |   9 +
>  7 files changed, 753 insertions(+), 431 deletions(-)
>  delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
>  delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h


John, did this ever make it past v5?  I don't see a follow-up.

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Senior Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--00000000000003ce7105c2d3da5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 10 Nov 2020 at 03:49, John Stultz=
 &lt;<a href=3D"mailto:john.stultz@linaro.org">john.stultz@linaro.org</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hey All,<br>
=C2=A0 So just wanted to send my last revision of my patch series<br>
of performance optimizations to the dma-buf system heap.<br>
<br>
This series reworks the system heap to use sgtables, and then<br>
consolidates the pagelist method from the heap-helpers into the<br>
CMA heap. After which the heap-helpers logic is removed (as it<br>
is unused). I&#39;d still like to find a better way to avoid some of<br>
the logic duplication in implementing the entire dma_buf_ops<br>
handlers per heap. But unfortunately that code is tied somewhat<br>
to how the buffer&#39;s memory is tracked. As more heaps show up I<br>
think we&#39;ll have a better idea how to best share code, so for<br>
now I think this is ok.<br>
<br>
After this, the series introduces an optimization that<br>
=C3=98rjan Eide implemented for ION that avoids calling sync on<br>
attachments that don&#39;t have a mapping.<br>
<br>
Next, an optimization to use larger order pages for the system<br>
heap. This change brings us closer to the current performance<br>
of the ION allocation code (though there still is a gap due<br>
to ION using a mix of deferred-freeing and page pools, I&#39;ll be<br>
looking at integrating those eventually).<br>
<br>
Finally, a reworked version of my uncached system heap<br>
implementation I was submitting a few weeks back. Since it<br>
duplicated a lot of the now reworked system heap code, I<br>
realized it would be much simpler to add the functionality to<br>
the system_heap implementation itself.<br>
<br>
While not improving the core allocation performance, the<br>
uncached heap allocations do result in *much* improved<br>
performance on HiKey960 as it avoids a lot of flushing and<br>
invalidating buffers that the cpu doesn&#39;t touch often.<br>
<br>
Feedback on these would be great!<br>
<br>
thanks<br>
-john<br>
<br>
New in v5:<br>
* Added a comment explaining why the order sizes are<br>
=C2=A0 chosen as they are<br>
<br>
Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=3D"_=
blank">sumit.semwal@linaro.org</a>&gt;<br>
Cc: Liam Mark &lt;<a href=3D"mailto:lmark@codeaurora.org" target=3D"_blank"=
>lmark@codeaurora.org</a>&gt;<br>
Cc: Laura Abbott &lt;<a href=3D"mailto:labbott@kernel.org" target=3D"_blank=
">labbott@kernel.org</a>&gt;<br>
Cc: Brian Starkey &lt;<a href=3D"mailto:Brian.Starkey@arm.com" target=3D"_b=
lank">Brian.Starkey@arm.com</a>&gt;<br>
Cc: Hridya Valsaraju &lt;<a href=3D"mailto:hridya@google.com" target=3D"_bl=
ank">hridya@google.com</a>&gt;<br>
Cc: Suren Baghdasaryan &lt;<a href=3D"mailto:surenb@google.com" target=3D"_=
blank">surenb@google.com</a>&gt;<br>
Cc: Sandeep Patil &lt;<a href=3D"mailto:sspatil@google.com" target=3D"_blan=
k">sspatil@google.com</a>&gt;<br>
Cc: Daniel Mentz &lt;<a href=3D"mailto:danielmentz@google.com" target=3D"_b=
lank">danielmentz@google.com</a>&gt;<br>
Cc: Chris Goldsworthy &lt;<a href=3D"mailto:cgoldswo@codeaurora.org" target=
=3D"_blank">cgoldswo@codeaurora.org</a>&gt;<br>
Cc: =C3=98rjan Eide &lt;<a href=3D"mailto:orjan.eide@arm.com" target=3D"_bl=
ank">orjan.eide@arm.com</a>&gt;<br>
Cc: Robin Murphy &lt;<a href=3D"mailto:robin.murphy@arm.com" target=3D"_bla=
nk">robin.murphy@arm.com</a>&gt;<br>
Cc: Ezequiel Garcia &lt;<a href=3D"mailto:ezequiel@collabora.com" target=3D=
"_blank">ezequiel@collabora.com</a>&gt;<br>
Cc: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=3D"_blank">=
contact@emersion.fr</a>&gt;<br>
Cc: James Jones &lt;<a href=3D"mailto:jajones@nvidia.com" target=3D"_blank"=
>jajones@nvidia.com</a>&gt;<br>
Cc: <a href=3D"mailto:linux-media@vger.kernel.org" target=3D"_blank">linux-=
media@vger.kernel.org</a><br>
Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dr=
i-devel@lists.freedesktop.org</a><br>
<br>
John Stultz (7):<br>
=C2=A0 dma-buf: system_heap: Rework system heap to use sgtables instead of<=
br>
=C2=A0 =C2=A0 pagelists<br>
=C2=A0 dma-buf: heaps: Move heap-helper logic into the cma_heap<br>
=C2=A0 =C2=A0 implementation<br>
=C2=A0 dma-buf: heaps: Remove heap-helpers code<br>
=C2=A0 dma-buf: heaps: Skip sync if not mapped<br>
=C2=A0 dma-buf: system_heap: Allocate higher order pages if available<br>
=C2=A0 dma-buf: dma-heap: Keep track of the heap device struct<br>
=C2=A0 dma-buf: system_heap: Add a system-uncached heap re-using the system=
<br>
=C2=A0 =C2=A0 heap<br>
<br>
=C2=A0drivers/dma-buf/dma-heap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 33 +-<br>
=C2=A0drivers/dma-buf/heaps/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 -<br>
=C2=A0drivers/dma-buf/heaps/cma_heap.c=C2=A0 =C2=A0 =C2=A0| 324 +++++++++++=
++++---<br>
=C2=A0drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------<br>
=C2=A0drivers/dma-buf/heaps/heap-helpers.h |=C2=A0 53 ---<br>
=C2=A0drivers/dma-buf/heaps/system_heap.c=C2=A0 | 494 +++++++++++++++++++++=
+++---<br>
=C2=A0include/linux/dma-heap.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A09 +<br>
=C2=A07 files changed, 753 insertions(+), 431 deletions(-)<br>
=C2=A0delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c<br>
=C2=A0delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h</blockquote><=
div><br></div><div>John, did this ever make it past v5?=C2=A0 I don&#39;t s=
ee a follow-up.</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div><span sty=
le=3D"font-size:12.8px">Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]</span></div=
><div><span style=3D"font-size:12.8px">Linaro Services Senior Technical Lea=
d</span></div><div><span style=3D"font-size:12.8px">Linaro.org =E2=94=82 Op=
en source software for ARM SoCs</span></div><div><span style=3D"font-size:1=
2.8px">Follow Linaro: Facebook | Twitter | Blog</span></div></div></div></d=
iv></div></div></div>

--00000000000003ce7105c2d3da5e--
