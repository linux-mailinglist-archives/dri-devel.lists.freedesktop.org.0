Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257B36CB9B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 21:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D336E5AB;
	Tue, 27 Apr 2021 19:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BB46E5AB;
 Tue, 27 Apr 2021 19:23:40 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so5576936pjz.0; 
 Tue, 27 Apr 2021 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sOQ4uL//4dF+bhfWLAfsTTJSc4cjS4RQvOxaajpV6gI=;
 b=J/H4xWlrX/2Qbw3BB0yomb2oWXGB8++P8kqc6DFMpsLJo3vtVYWQzkjt3TUxMgnRJZ
 if9gKp+zIKXUIWZnt2Gtyx+Xe5ah3ygjEHdi5MAGfRH74wufa337ALkfaQov1xG11j7R
 L77uFHVrXDuGm6cOceuIktAFNPqWkWwhIqqBewCyGlTVkXuuer53NxAR9hB62OQdSXn4
 4V4o/PMXS6yqqdu5QsPaUQE+yAGlZvPoidVQoUZrC5v8VS30mU4UlolzOM937KdJ/Swi
 6NPC39l6ceug7LdqRxAw4i8KkZ81V+2NRorm8Mxj7M6m4+O5mk+Mbv5PtiJ9sRVfhj/T
 2F2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sOQ4uL//4dF+bhfWLAfsTTJSc4cjS4RQvOxaajpV6gI=;
 b=Ib+nNkiTYztUiXSapQU95QPUg0VfcXk0ZBZa2N+Kan8WiRMgSy4UJACYwO23HcM92C
 lsCh4hLxOoNs5d5UbvbA0yoP+VOmu5NgO3X2c1X7LF9QKcNXrZDRbykoXqLqKucAXpRb
 nQSN5gzFryNn8ns0CfsjAOxlzn83kXRui1YGMsnVCEI/RL7UORw9uChcYZj+TnwA+GpJ
 jU/szoDx9/jRewMJnlkDOvIVi4WaENjTs2PaEo3Fvv12lBl38KV8tWyaYv0ti+W48kyd
 jGT7nXLzoaZah2XUfUHF1gLEp9i0J+1x4gp2yF24pRXK5Gcwnbq8wOkM0FwWnREwLi1c
 jtAA==
X-Gm-Message-State: AOAM531ULpXm0VKpK+cypXmpz+LdEX/sIE7/ufABgbsTulx+UziLt14F
 PFeJqRr0x0Uo6BJaDEhCwEdKcDcBwzxBzsQwdXs=
X-Google-Smtp-Source: ABdhPJxb5cuBJS1ut3kIDpZf7dZu9WM2D8zBOj1r2mDWaoKWmA2QvJUL8VnuPHm5g527R9X9MmfU3VaIAZY+BgqMiF8=
X-Received: by 2002:a17:90b:1b4a:: with SMTP id
 nv10mr6853600pjb.75.1619551419707; 
 Tue, 27 Apr 2021 12:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
In-Reply-To: <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Apr 2021 15:23:03 -0400
Message-ID: <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Dave Airlie <airlied@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0940718599=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0940718599==
Content-Type: multipart/alternative; boundary="0000000000001135bd05c0f9339b"

--0000000000001135bd05c0f9339b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Supporting interop with any device is always possible. It depends on which
drivers we need to interoperate with and update them. We've already found
the path forward for amdgpu. We just need to find out how many other
drivers need to be updated and evaluate the cost/benefit aspect.

Marek

On Tue, Apr 27, 2021 at 2:38 PM Dave Airlie <airlied@gmail.com> wrote:

> On Tue, 27 Apr 2021 at 22:06, Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Correct, we wouldn't have synchronization between device with and
> without user queues any more.
> >
> > That could only be a problem for A+I Laptops.
>
> Since I think you mentioned you'd only be enabling this on newer
> chipsets, won't it be a problem for A+A where one A is a generation
> behind the other?
>
> I'm not really liking where this is going btw, seems like a ill
> thought out concept, if AMD is really going down the road of designing
> hw that is currently Linux incompatible, you are going to have to
> accept a big part of the burden in bringing this support in to more
> than just amd drivers for upcoming generations of gpu.
>
> Dave.
>

--0000000000001135bd05c0f9339b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Supporting interop with any device is always possible=
. It depends on which drivers we need to interoperate with and update them.=
 We&#39;ve already found the path forward for amdgpu. We just need to find =
out how many other drivers need to be updated and evaluate the cost/benefit=
 aspect.<br></div><div><br></div><div>Marek<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 27, 2021=
 at 2:38 PM Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com">airlied@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 27 Apr 2021 at 22:06, Christian K=C3=B6nig<br>
&lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">c=
koenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Correct, we wouldn&#39;t have synchronization between device with and =
without user queues any more.<br>
&gt;<br>
&gt; That could only be a problem for A+I Laptops.<br>
<br>
Since I think you mentioned you&#39;d only be enabling this on newer<br>
chipsets, won&#39;t it be a problem for A+A where one A is a generation<br>
behind the other?<br>
<br>
I&#39;m not really liking where this is going btw, seems like a ill<br>
thought out concept, if AMD is really going down the road of designing<br>
hw that is currently Linux incompatible, you are going to have to<br>
accept a big part of the burden in bringing this support in to more<br>
than just amd drivers for upcoming generations of gpu.<br>
<br>
Dave.<br>
</blockquote></div>

--0000000000001135bd05c0f9339b--

--===============0940718599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0940718599==--
