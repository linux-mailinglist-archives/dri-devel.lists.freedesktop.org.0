Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896664A7B59
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 23:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F1F10E162;
	Wed,  2 Feb 2022 22:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3E10E162
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 22:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643842743; x=1675378743;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=+pUN3JlnPavzBMbaICKxg2/kXH55f1nTA325RsT2Wok=;
 b=U7gkuaqikviK3x2oQWLnpMJllbVDcPOmkaZ+iBpqciYo/Ll5sAMR7ynu
 4iJyLNwj0RDbOQDMwcFdHrAJcWtNILoWJF/PazNbOzzSVVQCpJUAehN9N
 Ulj2mpCOUp3m30mfCxjEeOLVT2uhxNEpwIgzsuXnYNT0JE9FnXXdsOFPb
 lh6yoZrIR3iL0eLU+yDq68o5u2YCFpIo0LivQb3vzSflM6s1ZNV2dsJB/
 FuxAyi3CEbfaAKfX3VEBU7VroFMMvm9i339mZL01gYSGNU3Q86QHZ4+2W
 Pa7vz9ykwNwMk0t1byMP4/S3ecrKw/yCOJhPsvI2dqvBE1r6FpUKZVOjg A==;
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; 
 d="scan'208,217";a="278228776"
Received: from mail-yb1-f197.google.com ([209.85.219.197])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2022 14:59:02 -0800
Received: by mail-yb1-f197.google.com with SMTP id
 g67-20020a25db46000000b0061437d5e4b3so2213850ybf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 14:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pCct70CLnL8G//SR6J7zMjeBTqO1APzYlPVuHv1kmlY=;
 b=HToRS/fGwy4p1JNJKTJfMVS/q3JTwgj/xeBKy250jrkGWDghBXMRq7RJXlXskf+3hT
 a4TY5wvczBZhUo4y+k+hIThrXanQE8WEU2YiNBg7QeED5QsHSZKAaycNiiFmBKhJek8F
 j7IDPG+soOMohAGVyAXa/k07h04tfn/MHWufs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pCct70CLnL8G//SR6J7zMjeBTqO1APzYlPVuHv1kmlY=;
 b=cEf+922yuEXqo0SQbKuVc3XymmHV+jR0L05MGwvnQIHFtzGr2VjiJDbPKpjnS1/aZ1
 jIuzHSqrxT5Ura02yGJIr8iqVAU2pQclftcOzltdCEd7KvdE/GckfraS2T+ny+FZNVdr
 2dG5zbm6Rt03uDJmw3eInXq2zTK4MdHSM5aqjHtEFSuVvkwtDEhkDR/cFKFde+jIev+M
 mhVhDY+mD5H6pIgrfYc08o42OON+wK1YcrnkAbSg28qkMtPXGeH3w+hUhNxi6gpdiS2f
 kTq5LDu9/Ib9rhP10dpYdRCGJakXZx8F4houCge8Va8KpvxBb9MuE3lmHIf+FLfaDOW0
 lSvg==
X-Gm-Message-State: AOAM533d88u0X9XH/0EEMMhw4tnjuBh1phWLWMMWmHfidir4O1mMQalW
 Z6H4k1kLhABXoVnu+PeN6cIunExLARPOUa4cQe0qkwyfSUZUCl6GfIXECAzLwuk5QsXlLSvB4up
 XlAv4tBPOzBbjSgRJHX1E+We3+d7sjZstwblJ9f7RRIAkAw==
X-Received: by 2002:a25:b13:: with SMTP id 19mr40767775ybl.684.1643842740380; 
 Wed, 02 Feb 2022 14:59:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGfzstgjCS9b1TQu3kvtqpVCK1YtdP5hMzWZ7qQZlTybqtmpfsiK389EOiwxkU8KpV33jWfpJtfNygqfnyF/g=
X-Received: by 2002:a25:b13:: with SMTP id 19mr40767762ybl.684.1643842740183; 
 Wed, 02 Feb 2022 14:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20220131065719.1552958-1-yzhai003@ucr.edu>
 <b1c1f68d-4620-2429-66bd-33d806d31457@gmx.de>
 <Yfq+/dVOgDVbhjRJ@ravnborg.org> <882bfe4e-a5b6-2b2c-167b-eda8c08419e3@gmx.de>
In-Reply-To: <882bfe4e-a5b6-2b2c-167b-eda8c08419e3@gmx.de>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Wed, 2 Feb 2022 14:58:49 -0800
Message-ID: <CABvMjLS9Dv+oJ1fAAc0sN=C8THDecs7T3schtofjKrLu3XorMQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: fbmem: Fix the implicit type casting
To: Helge Deller <deller@gmx.de>
Content-Type: multipart/alternative; boundary="0000000000009877e005d710f627"
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zheyu Ma <zheyuma97@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009877e005d710f627
Content-Type: text/plain; charset="UTF-8"

Not at all, I can draft the new patch and resend. Thanks for all the useful
discussion : )

On Wed, Feb 2, 2022 at 9:36 AM Helge Deller <deller@gmx.de> wrote:

> On 2/2/22 18:27, Sam Ravnborg wrote:
> > Hi Helge,
> >
> > On Tue, Feb 01, 2022 at 04:02:40PM +0100, Helge Deller wrote:
> >> On 1/31/22 07:57, Yizhuo Zhai wrote:
> >>> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
> >>
> >> yes, because it comes from the ioctl framework...
> >>
> >>> and in "case FBIOBLANK:" this argument is casted into an int before
> >>> passig to fb_blank().
> >>
> >> which makes sense IMHO.
> >>
> >>> In fb_blank(), the comparision if (blank > FB_BLANK_POWERDOWN) would
> >>> be bypass if the original "arg" is a large number, which is possible
> >>> because it comes from the user input.
> >>
> >> The main problem I see with your patch is that you change the behaviour.
> >> Let's assume someone passes in -1UL.
> >> With your patch applied, this means the -1 (which is e.g. 0xffffffff on
> 32bit)
> >> is converted to a positive integer and will be capped to
> FB_BLANK_POWERDOWN.
> >> Since most blank functions just check and react on specific values, you
> changed
> >> the behaviour that the screen now gets blanked at -1, while it wasn't
> before.
> >>
> >> One could now argue, that it's undefined behaviour if people
> >> pass in wrong values, but anyway, it's different now.
> >
> > We should just plug this hole and in case an illegal value is passed
> > then return -EINVAL.
> >
> > Acceptable values are FB_BLANK_UNBLANK..FB_BLANK_POWERDOWN,
> > anything less than or greater than should result in -EINVAL.
>
> Yes, that's the best solution.
> Yizhuo Zhai, would you mind to resend with that solution?
>
> Helge
>
> > We miss this kind or early checks in many places, and we see the effect
> > of this in some drivers where they do it locally for no good.
> >
> >       Sam
>


-- 
Kind Regards,

*Yizhuo Zhai*

*Computer Science, Graduate Student*
*University of California, Riverside *

--0000000000009877e005d710f627
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not at all, I can draft the new patch and resend. Thanks f=
or all the useful discussion : )</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 2, 2022 at 9:36 AM Helge Deller=
 &lt;<a href=3D"mailto:deller@gmx.de">deller@gmx.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);=
padding-left:1ex">On 2/2/22 18:27, Sam Ravnborg wrote:<br>
&gt; Hi Helge,<br>
&gt;<br>
&gt; On Tue, Feb 01, 2022 at 04:02:40PM +0100, Helge Deller wrote:<br>
&gt;&gt; On 1/31/22 07:57, Yizhuo Zhai wrote:<br>
&gt;&gt;&gt; In function do_fb_ioctl(), the &quot;arg&quot; is the type of =
unsigned long,<br>
&gt;&gt;<br>
&gt;&gt; yes, because it comes from the ioctl framework...<br>
&gt;&gt;<br>
&gt;&gt;&gt; and in &quot;case FBIOBLANK:&quot; this argument is casted int=
o an int before<br>
&gt;&gt;&gt; passig to fb_blank().<br>
&gt;&gt;<br>
&gt;&gt; which makes sense IMHO.<br>
&gt;&gt;<br>
&gt;&gt;&gt; In fb_blank(), the comparision if (blank &gt; FB_BLANK_POWERDO=
WN) would<br>
&gt;&gt;&gt; be bypass if the original &quot;arg&quot; is a large number, w=
hich is possible<br>
&gt;&gt;&gt; because it comes from the user input.<br>
&gt;&gt;<br>
&gt;&gt; The main problem I see with your patch is that you change the beha=
viour.<br>
&gt;&gt; Let&#39;s assume someone passes in -1UL.<br>
&gt;&gt; With your patch applied, this means the -1 (which is e.g. 0xffffff=
ff on 32bit)<br>
&gt;&gt; is converted to a positive integer and will be capped to FB_BLANK_=
POWERDOWN.<br>
&gt;&gt; Since most blank functions just check and react on specific values=
, you changed<br>
&gt;&gt; the behaviour that the screen now gets blanked at -1, while it was=
n&#39;t before.<br>
&gt;&gt;<br>
&gt;&gt; One could now argue, that it&#39;s undefined behaviour if people<b=
r>
&gt;&gt; pass in wrong values, but anyway, it&#39;s different now.<br>
&gt;<br>
&gt; We should just plug this hole and in case an illegal value is passed<b=
r>
&gt; then return -EINVAL.<br>
&gt;<br>
&gt; Acceptable values are FB_BLANK_UNBLANK..FB_BLANK_POWERDOWN,<br>
&gt; anything less than or greater than should result in -EINVAL.<br>
<br>
Yes, that&#39;s the best solution.<br>
Yizhuo Zhai, would you mind to resend with that solution?<br>
<br>
Helge<br>
<br>
&gt; We miss this kind or early checks in many places, and we see the effec=
t<br>
&gt; of this in some drivers where they do it locally for no good.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Sam<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span style=3D"font-size:14px">=
Kind Regards,</span><div style=3D"font-size:14px"><br><div><font face=3D"ar=
ial, helvetica, sans-serif" size=3D"2"><b>Yizhuo Zhai</b></font></div></div=
><div style=3D"font-size:14px"><br></div><div style=3D"font-size:14px"><b>C=
omputer Science, Graduate Student</b></div><div style=3D"font-size:14px"><b=
>University of California, Riverside=C2=A0</b></div></div></div>

--0000000000009877e005d710f627--
