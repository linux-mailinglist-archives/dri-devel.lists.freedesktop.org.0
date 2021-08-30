Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8853FB00B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 05:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60A89D77;
	Mon, 30 Aug 2021 03:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545E489D77
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 03:35:40 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m11so9727779ioo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 20:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pFq1SXN1GauIe1BZb8Nkg2+3MasqN0StzvgVgag5N4Q=;
 b=DenReq/HlnC04dP+f5caclAI2PPZncuErRZ3Pe2SrtjtMpZF1CvIrQUNf2NyIIYGf2
 +7l2FvuQcxeixixKGHwQrXw7nT8BCmzKSzOC9KAAsl6C+i/rJfAlBbLYm4+/r7lqK0qc
 /wR4DulHonSThEGWAB9fzbnFZck3LAAfj9wUOvRXbUDaLumr0gwlsKER76wg2RZQdSUB
 j3L/YO2P+/nhqUrudxcMdjTg1O8SQ1gYp5lZ+DLZS0Vqm0GI8jjguchoEI/PuKLWfy9l
 uKb+P7egCzsb4K4Zdi4JeplEVIKXgAbnuC/jrMs4DRjSfsABpn/wOjGfb115V8JagfGW
 iCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pFq1SXN1GauIe1BZb8Nkg2+3MasqN0StzvgVgag5N4Q=;
 b=O8mIKlHwnmqR87/uY2e0y4gquA/evDYcRK0uYDl2A1aZi/+MVYhEdGtnXxIuxs4gyU
 4wcFwdZr5moMafdCaRQkrEL5Jwlw6kKNy1U8jO9hiTXLAi7W3HPhOiKJ1zRIUzHGG3A/
 AxUvIBufdjOLE/tfgYp+IfM79iDIyOA4VMhblUXwydS7IIUhjZKteNgK2/3nHgI1swxI
 wbGvd8G7g1Isn3gkMkqelU0kyO4AbtgTfMc+K2HnfTukg7KYZVEY1OYD0trA8SlCfCt2
 afB2nUjw/whXQ0QfewXXHEAocVXNy5tOw2pN14m9XsLYkj287cPz63dJbWvBSIJtrrwj
 Cgnw==
X-Gm-Message-State: AOAM533UxbMVICrmX5Y/yOopgZysvcT6d8JGshuzX55YGVf3wmxL8Hmq
 rmVohyMknLpUGs/fsweuX89CP4XXJEXH8HOw43XI7g==
X-Google-Smtp-Source: ABdhPJwwO40ZnarbBFOxrzLa2I20iZv+xFR3Q8HxbAvYXHLdzccwRBjNr9a1xcnU3EnJZD6ztXuyXtxFP5Fw9ImgLXU=
X-Received: by 2002:a02:9566:: with SMTP id y93mr17836676jah.55.1630294539616; 
 Sun, 29 Aug 2021 20:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
 <20210827082407.101053-4-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=Uo-7rFWGiJG0oJ0ydosA4DxhFqiWGrab1zoZyxyPsOBg@mail.gmail.com>
In-Reply-To: <CAD=FV=Uo-7rFWGiJG0oJ0ydosA4DxhFqiWGrab1zoZyxyPsOBg@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Mon, 30 Aug 2021 11:35:29 +0800
Message-ID: <CAHwB_N+jn9tdd6kEGOU2V2ucy1VpP0LnnmN7=chs=sSDKMYJUg@mail.gmail.com>
Subject: Re: [v3 3/4] drm/panel: support for BOE and INX video mode panel
To: Doug Anderson <dianders@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000e9da5205cabe86d1"
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

--000000000000e9da5205cabe86d1
Content-Type: text/plain; charset="UTF-8"

Hi,Doug
  Thanks for your help. I had send v4 patch
https://patchwork.kernel.org/project/dri-devel/patch/20210830023849.258839-4-yangcong5@huaqin.corp-partner.google.com/.
Please help to review.

yangcong

On Fri, Aug 27, 2021 at 10:42 PM Doug Anderson <dianders@google.com> wrote:

> Hi,
>
> On Fri, Aug 27, 2021 at 1:24 AM yangcong
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Add driver for BOE tv110c9m-ll3 and Inx hj110iz-01a panel
> > both of those are 10.95" 1200x2000 panel.
>
> Your commit message would be a good place to note design choices you
> made in your patch. Maybe you might say:
>
> Support for these two panels fits in nicely with the existing
> panel-boe-tv101wum-nl6 driver as suggested by Sam [1]. The main things
> we needed to handle were:
> a) These panels need slightly longer delays in two places. Since these
> new delays aren't much longer, let's just unconditionally increase
> them for the driver.
> b) One of these two panels doesn't support DSI HS mode so this patch
> adds a flag for a panel to disable that.
>
> [1] https://lore.kernel.org/r/YSPAseE6WD8dDRuz@ravnborg.org/
>
> If you send a new version, maybe you could include prose similar to that?
>
> > +       _INIT_DCS_CMD(0x4D, 0x21),
> > +       _INIT_DCS_CMD(0x4E, 0x43),
> > +       _INIT_DCS_CMD(0x51, 0x12),
> > +       _INIT_DCS_CMD(0x52, 0x34),
> > +       _INIT_DCS_CMD(0x55, 0x82, 0x02),
> > +       _INIT_DCS_CMD(0x56, 0x04),
> > +       _INIT_DCS_CMD(0x58, 0x21),
> > +       _INIT_DCS_CMD(0x59, 0x30),
> > +       _INIT_DCS_CMD(0x5A, 0xBA),      //9A
>
> nit: the "//9A" above seems like it's leftover from something. Remove?
>
> > +       _INIT_DCS_CMD(0x1F, 0xBA),//9A
> > +       _INIT_DCS_CMD(0x20, 0xA0),
> > +
> > +       _INIT_DCS_CMD(0x26, 0xBA),//9A
> > +       _INIT_DCS_CMD(0x27, 0xA0),
> > +
> > +       _INIT_DCS_CMD(0x33, 0xBA),//9A
> > +       _INIT_DCS_CMD(0x34, 0xA0),
> > +
> > +       _INIT_DCS_CMD(0x3F, 0xE0),
> > +
> > +       _INIT_DCS_CMD(0x40, 0x00),
> > +
> > +       _INIT_DCS_CMD(0x44, 0x00),
> > +       _INIT_DCS_CMD(0x45, 0x40),
> > +
> > +       _INIT_DCS_CMD(0x48, 0xBA),//9A
> > +       _INIT_DCS_CMD(0x49, 0xA0),
> > +
> > +       _INIT_DCS_CMD(0x5B, 0x00),
> > +       _INIT_DCS_CMD(0x5C, 0x00),
> > +       _INIT_DCS_CMD(0x5D, 0x00),
> > +       _INIT_DCS_CMD(0x5E, 0xD0),
> > +
> > +       _INIT_DCS_CMD(0x61, 0xBA),//9A
> > +       _INIT_DCS_CMD(0x62, 0xA0),
>
> More random //9A to remove above?
>
>
> > @@ -515,7 +1363,7 @@ static int boe_panel_unprepare(struct drm_panel
> *panel)
> >                 regulator_disable(boe->pp3300);
> >         } else {
> >                 gpiod_set_value(boe->enable_gpio, 0);
> > -               usleep_range(500, 1000);
> > +               usleep_range(1000, 2000);
> >                 regulator_disable(boe->avee);
> >                 regulator_disable(boe->avdd);
> >                 usleep_range(5000, 7000);
> > @@ -556,7 +1404,7 @@ static int boe_panel_prepare(struct drm_panel
> *panel)
> >         if (ret < 0)
> >                 goto poweroffavdd;
> >
> > -       usleep_range(5000, 10000);
> > +       usleep_range(10000, 15000);
>
> nit: how about using the range 10000, 11000? Last I looked at
> usleep_range() it almost always ended up at the longer of the two
> times, so that will shave 4 ms off and get us nearly to where we were
> without your change. The whole point of the range is to make the
> system more power efficient for frequent operations (wakeup
> combining), but that really doesn't matter for something as infrequent
> as turning on a LCD.
>
> Other than nits this looks fine to me and I'd be happy to add my
> Reviewed-by to a version with nits fixed. I'm not really an expert on
> MIPI panels but the convention of a big stream of binary commands
> seems to match what other panels in this driver do, even if their
> table of binary data isn't quite as long as yours (are all of yours
> actually needed?). I'm happy to land this in drm-misc-next with Sam or
> Thierry's Ack, too.
>
>
> -Doug
>

--000000000000e9da5205cabe86d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,Doug<div>=C2=A0 Thanks for your help. I had send v4 pat=
ch=C2=A0<a href=3D"https://patchwork.kernel.org/project/dri-devel/patch/202=
10830023849.258839-4-yangcong5@huaqin.corp-partner.google.com/">https://pat=
chwork.kernel.org/project/dri-devel/patch/20210830023849.258839-4-yangcong5=
@huaqin.corp-partner.google.com/</a>. Please help to review.</div><div><br>=
</div><div>yangcong</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Aug 27, 2021 at 10:42 PM Doug Anderson &lt=
;<a href=3D"mailto:dianders@google.com">dianders@google.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Fri, Aug 27, 2021 at 1:24 AM yangcong<br>
&lt;<a href=3D"mailto:yangcong5@huaqin.corp-partner.google.com" target=3D"_=
blank">yangcong5@huaqin.corp-partner.google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add driver for BOE tv110c9m-ll3 and Inx hj110iz-01a panel<br>
&gt; both of those are 10.95&quot; 1200x2000 panel.<br>
<br>
Your commit message would be a good place to note design choices you<br>
made in your patch. Maybe you might say:<br>
<br>
Support for these two panels fits in nicely with the existing<br>
panel-boe-tv101wum-nl6 driver as suggested by Sam [1]. The main things<br>
we needed to handle were:<br>
a) These panels need slightly longer delays in two places. Since these<br>
new delays aren&#39;t much longer, let&#39;s just unconditionally increase<=
br>
them for the driver.<br>
b) One of these two panels doesn&#39;t support DSI HS mode so this patch<br=
>
adds a flag for a panel to disable that.<br>
<br>
[1] <a href=3D"https://lore.kernel.org/r/YSPAseE6WD8dDRuz@ravnborg.org/" re=
l=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/r/YSPAseE6WD8dDR=
uz@ravnborg.org/</a><br>
<br>
If you send a new version, maybe you could include prose similar to that?<b=
r>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4D, 0x21),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x4E, 0x43),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x51, 0x12),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x52, 0x34),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x55, 0x82, 0x02),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x56, 0x04),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x58, 0x21),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x59, 0x30),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5A, 0xBA),=C2=A0 =C2=A0 =
=C2=A0 //9A<br>
<br>
nit: the &quot;//9A&quot; above seems like it&#39;s leftover from something=
. Remove?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x1F, 0xBA),//9A<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x20, 0xA0),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x26, 0xBA),//9A<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x27, 0xA0),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x33, 0xBA),//9A<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x34, 0xA0),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x3F, 0xE0),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x40, 0x00),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x44, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x45, 0x40),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x48, 0xBA),//9A<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x49, 0xA0),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5B, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5C, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5D, 0x00),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x5E, 0xD0),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x61, 0xBA),//9A<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_INIT_DCS_CMD(0x62, 0xA0),<br>
<br>
More random //9A to remove above?<br>
<br>
<br>
&gt; @@ -515,7 +1363,7 @@ static int boe_panel_unprepare(struct drm_panel *=
panel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator=
_disable(boe-&gt;pp3300);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set=
_value(boe-&gt;enable_gpio, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(5=
00, 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(1=
000, 2000);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator=
_disable(boe-&gt;avee);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator=
_disable(boe-&gt;avdd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_ra=
nge(5000, 7000);<br>
&gt; @@ -556,7 +1404,7 @@ static int boe_panel_prepare(struct drm_panel *pa=
nel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto powe=
roffavdd;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(5000, 10000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10000, 15000);<br>
<br>
nit: how about using the range 10000, 11000? Last I looked at<br>
usleep_range() it almost always ended up at the longer of the two<br>
times, so that will shave 4 ms off and get us nearly to where we were<br>
without your change. The whole point of the range is to make the<br>
system more power efficient for frequent operations (wakeup<br>
combining), but that really doesn&#39;t matter for something as infrequent<=
br>
as turning on a LCD.<br>
<br>
Other than nits this looks fine to me and I&#39;d be happy to add my<br>
Reviewed-by to a version with nits fixed. I&#39;m not really an expert on<b=
r>
MIPI panels but the convention of a big stream of binary commands<br>
seems to match what other panels in this driver do, even if their<br>
table of binary data isn&#39;t quite as long as yours (are all of yours<br>
actually needed?). I&#39;m happy to land this in drm-misc-next with Sam or<=
br>
Thierry&#39;s Ack, too.<br>
<br>
<br>
-Doug<br>
</blockquote></div>

--000000000000e9da5205cabe86d1--
