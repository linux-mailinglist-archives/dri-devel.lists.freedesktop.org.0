Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBD365B71
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 16:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2EE88E95;
	Tue, 20 Apr 2021 14:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFCB88E95
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 14:49:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so28871467wrt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdVh8MgJ3hW4eH9NelsGjOWmRUKen6Ny2zYwNZtusm0=;
 b=iXvgXWk1pXVxRnSGMDD02neg24RzJJaPmnbrglH49tCCTXQLx9iSVPkXYnhfJUsZ63
 s6/Gp/FnyJxORaV7nbpBWyQnUIXNelzDW/lIr6wXf8dUHSgQUdgAEAf9t3qTdBOzThPt
 0QHr85nCS5abEfAiQv1TOpoY9yMYi5l3ml4JzUnaURpMaiYX3LP25Ps51ZHQ6MdmVx9h
 Fogzvz/F3fic5Sj/PO6YIFNJDYbF0vL4dyjduoRch0Wc4ivWP7MAk3zK6sG8hufW3Pzf
 SdWCIqRYhLxJQgKLHHaA6/eZLZwCqhgT1gErr9UzK1N71mxAoIvG33e5bllM4oaGeheU
 JGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdVh8MgJ3hW4eH9NelsGjOWmRUKen6Ny2zYwNZtusm0=;
 b=MXksqRH/yuVWkLhAVZvMng+V6xDdK/0mqzTpHzEsqXCIYGusEVl902SGfL/qEmoKly
 whoBkSl3F7Z1LSswYeZWpvpgCf3xHjRwBH4WBZJs3UXQKTDL3ViHDVPwskIXy2C3jF/i
 Zoc6gNRCoSu7ccwrE3F+bDFVEp1FNa2Aa2eCps6HA7aoT5m3TF5t2CwiA2vUCKkbavRI
 RKzjBzTOxBbn6i76wg25NFoV88AIiY4xNF9atoyr8Jrkm3+N7jCX27sbWIu5/XOEiAgF
 Nbi5mi6RUGl5wGKl1zPGkwWcg0s6LHDNL3q55ptGv7X2H3p3hFYMeNGwHEq5YGwibL7z
 TdEA==
X-Gm-Message-State: AOAM532Qtge9spyboA2f1TxFndj/Wzfqo6cuOGG1aOwUAzPtQZPx/4Hf
 viKIQlZYFP7TGKvu0+cjntOrICyCtEFljInl0+YwOw==
X-Google-Smtp-Source: ABdhPJzE4R91MpVGkN6iAOo5Axe07ZxsvgnvjbpeOJkCKLR5/LAD17zPHniT6BPdeCwP2Y05zVvzi7vUeydgGNH/YA8=
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr21372540wrn.6.1618930148537; 
 Tue, 20 Apr 2021 07:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210416123352.10747-1-peter.enderborg@sony.com>
 <CAPj87rM9gaPS5SOHo3CKUU=5H0PDaG28r8BXimhVp-wmCbMvWA@mail.gmail.com>
 <9d4b7f7d-1a7d-0899-bf33-49fac1847bbe@sony.com>
In-Reply-To: <9d4b7f7d-1a7d-0899-bf33-49fac1847bbe@sony.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 15:48:21 +0100
Message-ID: <CAPj87rNo2WS8A0BUoncZhZg4gMOcBrjOF5gxiAWrbpO6z1Rnqg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Add DmaBufTotal counter in meminfo
To: Peter Enderborg <Peter.Enderborg@sony.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 NeilBrown <neilb@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Shakeel Butt <shakeelb@google.com>, Mike Rapoport <rppt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Roman Gushchin <guro@fb.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1599874911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1599874911==
Content-Type: multipart/alternative; boundary="0000000000006b8c7805c0688c24"

--0000000000006b8c7805c0688c24
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Apr 2021 at 14:46, <Peter.Enderborg@sony.com> wrote:

> On 4/20/21 3:34 PM, Daniel Stone wrote:
> > On Fri, 16 Apr 2021 at 13:34, Peter Enderborg <peter.enderborg@sony.com
> <mailto:peter.enderborg@sony.com>> wrote:
> >     This adds a total used dma-buf memory. Details
> >     can be found in debugfs, however it is not for everyone
> >     and not always available. dma-buf are indirect allocated by
> >     userspace. So with this value we can monitor and detect
> >     userspace applications that have problems.
> >
> >
> > FWIW, this won't work super well for Android where gralloc is
> implemented as a system service, so all graphics usage will instantly be
> accounted to it.
>
> This resource allocation is a big part of why we need it. Why should it
> not work?
>

Sorry, I'd somehow completely misread that as being locally rather than
globally accounted. Given that, it's more correct, just also not super
useful.

Some drivers export allocation tracepoints which you could use if you have
a decent userspace tracing infrastructure. Short of that, many drivers
export this kind of thing through debugfs already. I think a better
long-term direction is probably getting accounting from dma-heaps rather
than extending core dmabuf itself.

Cheers,
Daniel

--0000000000006b8c7805c0688c24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"">On Tue, 20 Apr 2021 at 1=
4:46, &lt;<a href=3D"mailto:Peter.Enderborg@sony.com">Peter.Enderborg@sony.=
com</a>&gt; wrote:</span><br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 4/20/21 3:34 PM, Daniel Stone wrote=
:<br>&gt; On Fri, 16 Apr 2021 at 13:34, Peter Enderborg &lt;<a href=3D"mail=
to:peter.enderborg@sony.com" target=3D"_blank">peter.enderborg@sony.com</a>=
 &lt;mailto:<a href=3D"mailto:peter.enderborg@sony.com" target=3D"_blank">p=
eter.enderborg@sony.com</a>&gt;&gt; wrote:<br>&gt;=C2=A0 =C2=A0 =C2=A0This =
adds a total used dma-buf memory. Details<br>
&gt;=C2=A0 =C2=A0 =C2=A0can be found in debugfs, however it is not for ever=
yone<br>
&gt;=C2=A0 =C2=A0 =C2=A0and not always available. dma-buf are indirect allo=
cated by<br>
&gt;=C2=A0 =C2=A0 =C2=A0userspace. So with this value we can monitor and de=
tect<br>
&gt;=C2=A0 =C2=A0 =C2=A0userspace applications that have problems.<br>
&gt;<br>
&gt;<br>
&gt; FWIW, this won&#39;t work super well for Android where gralloc is impl=
emented as a system service, so all graphics usage will instantly be accoun=
ted to it.<br><br>
This resource allocation is a big part of why we need it. Why should it not=
 work?<br></blockquote><div><br></div><div>Sorry, I&#39;d somehow completel=
y misread that as being locally rather than globally accounted. Given that,=
 it&#39;s more correct, just also not super useful.</div><div><span style=
=3D""><br></span></div><div><span style=3D"">Some drivers export allocation=
 tracepoints which you could use if you have a decent userspace tracing inf=
rastructure. Short of that, many drivers export this kind of thing through =
debugfs already. I think a better long-term direction is probably getting a=
ccounting from dma-heaps rather than extending core dmabuf itself.</span></=
div><div><span style=3D""><br></span></div><div><span style=3D"">Cheers,</s=
pan></div><div><span style=3D"">Daniel=C2=A0</span></div></div></div>

--0000000000006b8c7805c0688c24--

--===============1599874911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1599874911==--
