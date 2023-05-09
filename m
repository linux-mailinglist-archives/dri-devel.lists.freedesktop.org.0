Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914D6FBC66
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 03:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFF110E06A;
	Tue,  9 May 2023 01:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4610E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 01:17:25 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6439df6c268so2933821b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 18:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683595044; x=1686187044;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xtX/yqQyR6bqJF7RKhbSgXNBUX8CUoF/YA6fJjeuKGw=;
 b=bJplIXXO7CH67uf/PSaUUVndsjBvN0Kr88X0p4BXWzhJPaBWeWae6cc5ibVhqYXEwG
 lV5/t7Vo1+l9jEaq60e23j0J2yIvceKnq2Ev3c9vLPQs9ITUjrTLuFpt6yGOPm2D4GBB
 pkoI64d6C1vhOHIEJCvTldFETkQ3W1gqFAoPU/gwH9Xpakd3N/ezxNCFg+qDW2RjunlB
 D9PWi+ZOXn1Bn/d+803dssHebfRrmFqgA1BDVEZad11L9aRw2FEUGqRFdlvduH6Tt5cK
 uzzrJvcQC5+qDYV8vs3WWG4yDdiHYPITSdhoQiEel8WzEcp0DdlZb9dlOa7N3qOVW7nG
 S3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683595044; x=1686187044;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtX/yqQyR6bqJF7RKhbSgXNBUX8CUoF/YA6fJjeuKGw=;
 b=NuU/Youg/Ypi6CuEK/1AfDMJwd5stOi9NqNq0XAHLWc0qHcLoJcVDG+nWNC7HgltRF
 3wqEzSsktdggzBhGWHZx3iKPRsEcN844+U+rzJ8UgM/iFzIB8fuLIKX31AcjsZPVhm2V
 XsxF7Qb2iwCjUbJ7s9cdGcfPMArFwBzpZAb+xmvtBx8l7m8Qw0EEw9Zaw3Ab9/Z3L8/W
 KN4XLbCn7tleEwF5BSPUt9DU5ZWBv4wX+fP1j0m76h0anCGn2rKkfWly8+tPnAW2nPGh
 3kbe8TdwqDktINSVYhgSvg7VEA/qgIPyDxpTpQonNshn+xjtzvvl4P9zeg26jWzo0++C
 glEQ==
X-Gm-Message-State: AC+VfDwLWDVOGfdZUNQjMLqTIyUgCd3527pm7e57UtrzxwF/C9VsbWtG
 KQduq7o0GpvCnwlxUj6wkTeFD2fSe7t7SuR1/KrrCw==
X-Google-Smtp-Source: ACHHUZ5nFdVd6eetz8ZeVGmaBkRAVkdPCQQuQzOVJxmsvFui2PVGHxD2MSau3vWcEi13JdHGMqYIStzDxArdo0ed8r0=
X-Received: by 2002:a05:6a00:10d2:b0:643:96bc:b292 with SMTP id
 d18-20020a056a0010d200b0064396bcb292mr13721532pfu.5.1683595044347; Mon, 08
 May 2023 18:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230506093243.540406-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WG9L-Fsq6wkmjk19bCPqVJgu41_hmQz0g6kLPvDrt_XQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WG9L-Fsq6wkmjk19bCPqVJgu41_hmQz0g6kLPvDrt_XQ@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 9 May 2023 09:17:13 +0800
Message-ID: <CAHwB_NLBLEUiu__fE9F=j0KFssq7Lxfz8WUnbR0C6yi=zsboJw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Modify innolux hj110iz panel inital code
To: Doug Anderson <dianders@google.com>
Content-Type: multipart/alternative; boundary="000000000000907b6e05fb38846f"
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000907b6e05fb38846f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,Doug:
  Sorry,  the first patch is missed the modification of clock rate /
blanking periods, I set it as Not Applicable in patchwork. The blanking
periods are modified because the iniatal code increases the Vertical.

I will send V2 version update Commit message, thanks you.

On Mon, May 8, 2023 at 10:28=E2=80=AFPM Doug Anderson <dianders@google.com>=
 wrote:

> Hi,
>
> On Sat, May 6, 2023 at 2:32=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Optimize flickering problem and power off sequence GOP timing at sleep
> in mode.
> > When display sleep in raise the potential of all GOP signals to VGHO an=
d
> then
> > lower to GND.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 397 +++++++++++-------
> >  1 file changed, 235 insertions(+), 162 deletions(-)
>
> You sent two different patches with the exact same subject and the
> same description but completely different contents. I can't land that.
>
> Options:
>
> 1. Send a two-patch series where each patch has a different subject /
> description.
>
> 2. Since these both touch the same file and (presumably) are trying to
> address the same issue, just combine them into one patch and send
> that.
>
> Please make sure you document everything the patch is doing. I don't
> think anything in the description explains why you need to change the
> clock rate / blanking periods.
>
> -Doug
>

--000000000000907b6e05fb38846f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,Doug:<div>=C2=A0 Sorry,=C2=A0 the first patch is missed=
 the modification of clock rate / blanking periods, I set it as Not Applica=
ble in patchwork. The blanking periods are modified because the iniatal cod=
e increases the Vertical.</div><br>I will send V2 version update Commit mes=
sage, thanks you.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, May 8, 2023 at 10:28=E2=80=AFPM Doug Anderson &lt;=
<a href=3D"mailto:dianders@google.com">dianders@google.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Sat, May 6, 2023 at 2:32=E2=80=AFAM Cong Yang<br>
&lt;<a href=3D"mailto:yangcong5@huaqin.corp-partner.google.com" target=3D"_=
blank">yangcong5@huaqin.corp-partner.google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Optimize flickering problem and power off sequence GOP timing at sleep=
 in mode.<br>
&gt; When display sleep in raise the potential of all GOP signals to VGHO a=
nd then<br>
&gt; lower to GND.<br>
&gt;<br>
&gt; Signed-off-by: Cong Yang &lt;<a href=3D"mailto:yangcong5@huaqin.corp-p=
artner.google.com" target=3D"_blank">yangcong5@huaqin.corp-partner.google.c=
om</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c=C2=A0 =C2=A0 | 397 ++=
+++++++++-------<br>
&gt;=C2=A0 1 file changed, 235 insertions(+), 162 deletions(-)<br>
<br>
You sent two different patches with the exact same subject and the<br>
same description but completely different contents. I can&#39;t land that.<=
br>
<br>
Options:<br>
<br>
1. Send a two-patch series where each patch has a different subject /<br>
description.<br>
<br>
2. Since these both touch the same file and (presumably) are trying to<br>
address the same issue, just combine them into one patch and send<br>
that.<br>
<br>
Please make sure you document everything the patch is doing. I don&#39;t<br=
>
think anything in the description explains why you need to change the<br>
clock rate / blanking periods.<br>
<br>
-Doug<br>
</blockquote></div>

--000000000000907b6e05fb38846f--
