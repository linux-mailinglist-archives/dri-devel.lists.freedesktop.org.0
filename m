Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BB413033
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 10:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5AE6E90F;
	Tue, 21 Sep 2021 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E9D6E90D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 08:33:52 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so237441otb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUP5o16fQUNiQB1l95tz+2IQ6syhVg0GwjiWyDFIu3w=;
 b=CsFgP+0Qi4bKPcrzGdWJ9UyNMGuHav8K0QaYienUfPUinb0szeYDCvddtyREIjk71w
 We5qG43IFvZ9RlVX+R/gp3RAM+BbEpixwr5iELdwsHW1baM3vBK7b1PeMAl7+Wm1bTDI
 5duSuzc7ElDwrw7C3xkYqXHTKV3By8BdjhlQr+4loePXRWSGW6W/biCOdWGBVzo7AnGk
 GxdI/V3N6NAv4hyK8ME+ooo34dWPy1kYNW9DCs7VAENFZZalfyGKuRsID5YIbR4Ux0w9
 A6DlONfM+vIRGq3hz03pl44g25JKpDQelbXUTCj3vdQEtEBbqyfVMouUTQM7195I0ejW
 eB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUP5o16fQUNiQB1l95tz+2IQ6syhVg0GwjiWyDFIu3w=;
 b=T1Ta34VH5uTgzRCVDMM4xK5a7mVspEJELNUHzyVM5KVgOqH7s0E/mc+nyNZcWE1tzB
 a87Krd1i5L48eSGmTyPXuBGHfgZyj9YWRp+5sX24wlDDKIdRd+nuGV3lpHAobHlgeht7
 v4qdEMVPWVjoGbBvrd7Pbtk6E3Pp2z0yQON/DqzXWu4ugnQhjAZ6ekDbOFqAkc8yS2go
 yOLFDahAxJZzvTUEEJjzcIPbuNKFfDNO+b4Z7f7jFDIDeMyTS7J6uwFp7hlLc5C+fsBu
 5EbiPXSIHgTqSol2lOiZ8teZVpKunyVt2FQSiodgy0nSJN2KcMZX1DI4ivRSzcnymLCM
 qvaw==
X-Gm-Message-State: AOAM533iGYDOq0rA5GuN45vH8HuLe2esRv+P9s+dBiW9uVMRmX5FQo6y
 FAP7AZ7PDAkTZJrblwHiMEIIiN36L847BgeO/Ms=
X-Google-Smtp-Source: ABdhPJwirdiIiHRDKyIspe7ojt8fnpquChJUBwqtp9+6cYES+wCmNQrAd/3lqCf9d5RD2L4DHY6E+Qdv8cjRCaj3co4=
X-Received: by 2002:a9d:7dca:: with SMTP id k10mr11801108otn.54.1632213231963; 
 Tue, 21 Sep 2021 01:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
 <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
In-Reply-To: <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 21 Sep 2021 10:33:40 +0200
Message-ID: <CAFqH_52Pr9AdduBWeBwv31giRdBRmqZ_b31LvCzYNkBweGfRrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: multipart/alternative; boundary="000000000000e3903c05cc7d41d8"
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

--000000000000e3903c05cc7d41d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chun-Kuang,

Missatge de Chun-Kuang Hu <chunkuang.hu@kernel.org> del dia dj., 12 d=E2=80=
=99ag.
2021 a les 2:13:

> Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2021=E5=B9=B48=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=887:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > These refinements include using standard mailbox callback interface,
> > timeout detection, and a fixed cmdq_handle.
>
> For this series, applied to mediatek-drm-next [1].
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/lo=
g/?h=3Dmediatek-drm-next
>
>
These patches seem to break the display on the Acer Chromebook R 13
(MT8173) in the current mainline. After running a bisection it pointed me
to the following commit

commit f4be17cd5b14dd73545b0e014a63ebe9ab5ef837
Author: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Sun Jul 4 15:36:48 2021 +0800

    drm/mediatek: Remove struct cmdq_client

Reverting this patch alone is not trivial, so I ended up reverting the full
series, and I can confirm that reverting the full series makes the display
work again.

Unfortunately, after the merge window, different things broke for this
device, and I didn't finish isolating them, and it is not clear to me yet
whether the logs I'm getting are useful for this specific issue or not.
Basically with this series merged the kernel seems to be stuck, and the
display is not working. Latest message is

[   12.329173] mtk-iommu 10205000.iommu: Partial TLB flush timed out,
falling back to full flush

Without the series, the kernel goes far and display works, however there
are other issues affecting the cros-ec, but I think that's another issue.

I'll try to dig a bit more, but, meanwhile, if you have any idea please let
me know.

Thanks,
 Enric



> Regards,
> Chun-Kuang.
>
> >
> > Changes in v2:
> > 1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
> >    when CONFIG_MTK_CMDQ is reachable.
> >
> > Chun-Kuang Hu (4):
> >   drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
> >   drm/mediatek: Remove struct cmdq_client
> >   drm/mediatek: Detect CMDQ execution timeout
> >   drm/mediatek: Add cmdq_handle in mtk_crtc
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 110 ++++++++++++++++++++----
> >  1 file changed, 91 insertions(+), 19 deletions(-)
> >
> > --
> > 2.25.1
> >
>

--000000000000e3903c05cc7d41d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Chun-Kuang,</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Missatge de Chun-Kuang Hu &=
lt;<a href=3D"mailto:chunkuang.hu@kernel.org">chunkuang.hu@kernel.org</a>&g=
t; del dia dj., 12 d=E2=80=99ag. 2021 a les 2:13:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Chun-Kuang Hu &lt;<a href=3D"mailto:chunk=
uang.hu@kernel.org" target=3D"_blank">chunkuang.hu@kernel.org</a>&gt; =E6=
=96=BC 2021=E5=B9=B48=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=
=887:47=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; These refinements include using standard mailbox callback interface,<b=
r>
&gt; timeout detection, and a fixed cmdq_handle.<br>
<br>
For this series, applied to mediatek-drm-next [1].<br>
<br>
[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu=
/linux.git/log/?h=3Dmediatek-drm-next" rel=3D"noreferrer" target=3D"_blank"=
>https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log=
/?h=3Dmediatek-drm-next</a><br>
<br></blockquote><div><br></div><div>These patches seem to break the displa=
y on the Acer Chromebook R 13 (MT8173) in the current mainline. After runni=
ng a bisection it pointed me to the following commit</div><div><br></div><d=
iv>commit f4be17cd5b14dd73545b0e014a63ebe9ab5ef837<br>Author: Chun-Kuang Hu=
 &lt;<a href=3D"mailto:chunkuang.hu@kernel.org">chunkuang.hu@kernel.org</a>=
&gt;<br>Date: =C2=A0 Sun Jul 4 15:36:48 2021 +0800<br><br>=C2=A0 =C2=A0 drm=
/mediatek: Remove struct cmdq_client<br></div><div><br></div><div>Reverting=
 this patch alone is not trivial, so I ended up reverting the full series, =
and I can confirm that reverting the full series makes the display work aga=
in.</div><div><br></div><div>Unfortunately, after the merge window, differe=
nt things broke for this device, and I didn&#39;t finish isolating them, an=
d it is not clear to me yet whether=C2=A0the logs I&#39;m getting are usefu=
l for this specific issue or not. Basically with this series merged the ker=
nel seems to be stuck, and the display is not working. Latest message is</d=
iv><div><br></div><div>[ =C2=A0 12.329173] mtk-iommu 10205000.iommu: Partia=
l TLB flush timed out, falling back to full flush<br></div><div><br></div><=
div>Without the series, the kernel goes far and display works, however ther=
e are other issues affecting the cros-ec, but I think that&#39;s another is=
sue.</div><div><br></div><div>I&#39;ll try to dig a bit more, but, meanwhil=
e, if you have any idea please let me know.</div><div><br></div><div>Thanks=
,</div><div>=C2=A0Enric</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Regards,<br>
Chun-Kuang.<br>
<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; 1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()<br>
&gt;=C2=A0 =C2=A0 when CONFIG_MTK_CMDQ is reachable.<br>
&gt;<br>
&gt; Chun-Kuang Hu (4):<br>
&gt;=C2=A0 =C2=A0drm/mediatek: Use mailbox rx_callback instead of cmdq_task=
_cb<br>
&gt;=C2=A0 =C2=A0drm/mediatek: Remove struct cmdq_client<br>
&gt;=C2=A0 =C2=A0drm/mediatek: Detect CMDQ execution timeout<br>
&gt;=C2=A0 =C2=A0drm/mediatek: Add cmdq_handle in mtk_crtc<br>
&gt;<br>
&gt;=C2=A0 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 110 ++++++++++++++++++=
++----<br>
&gt;=C2=A0 1 file changed, 91 insertions(+), 19 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</blockquote></div></div>

--000000000000e3903c05cc7d41d8--
