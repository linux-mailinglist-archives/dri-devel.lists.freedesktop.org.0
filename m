Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84B2B0114
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2676E1BD;
	Thu, 12 Nov 2020 08:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9D389F4A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 07:57:26 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id w20so317126pjh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJM6oYGDac+fkoGJVfE5BHDeRyFBkywKIxFwj/L9nFw=;
 b=cqh976neUpt6wJF4oDuGd7FQ03/sg8401yoH5NtuzSJ9tNVTePHx0J+9qn0xXTY565
 00IisHKv6G4FKmOGXQSdngTvK5p47FRodwF/eXMs7mhJNxFEL6Yf21utRd6nv76J07wP
 gc5X2m84NOMI41xwY/z0dC+sKve9N/vegiF3UOOn0PCe+0EJnVsWPlT36GX7eJO1JGTx
 wbnRhJo1nWJkOEB5dkqggNo5iADduJ57eSsJMaMpbehVGCbCp9RHRFoDNnht8GwpfoOj
 tN1WDZXbGA8VBFnkZdFBqMr0g2Yn7rh7RS0wj/1Rihq9Y472Atd+UP3hRRRlx1TegLuT
 zSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJM6oYGDac+fkoGJVfE5BHDeRyFBkywKIxFwj/L9nFw=;
 b=NVCNSXYoE099UX3++Ftm47TAKF8D4z2lGhuwGw0DeT9BsO3yTFHuNxOO/tkRWBMlvk
 keANXhIQfUzTLovMwBMnNP5WzqySn+vx0epNwf91ZAyvIzK14d5trpEAujq4EDJXNZyr
 cUvhr7WnszQFq7R3YK2hEdsgWOBIRUAad5U4AvSHT9mzHbW+s/MpefzS48+eoV56x+I8
 GBG8Ju1UJWEVvEQHdgm/qzzNz1NBcc8QJbPe7jWaC44+gt7WwY6PEicW/tNmiwxC1cUL
 SSPXcFuinIPXqcH2bbunknfS7errP4pExCwaJal5NykzIj4koit3U7TF54XlSMEr8mWw
 xJRg==
X-Gm-Message-State: AOAM530OIbciFs89TVyB7Sqz8CCeq6c5OxFSbm5hN8PXkv79Vf6nQxJx
 vqvdBE8BIHRza/7dZTVZCRLoQkrR4JETbpxeWTU=
X-Google-Smtp-Source: ABdhPJyb7iPNVQ/2dY2Fqo1Hk7EEuIQ1cDTFw8mWjeXWiQ2ARKcYs+hfLV/kGaH6/2hd6Yj3qkDsKvBa/O7MKUVnHOk=
X-Received: by 2002:a17:90a:8542:: with SMTP id
 a2mr2712822pjw.101.1605081445714; 
 Tue, 10 Nov 2020 23:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20201031081747.372599-1-net147@gmail.com>
 <20201108095322.GA1129714@ravnborg.org>
 <20201108095724.GW1551@shell.armlinux.org.uk>
 <20201108104742.GA1161483@ravnborg.org>
In-Reply-To: <20201108104742.GA1161483@ravnborg.org>
From: Jonathan Liu <net147@gmail.com>
Date: Wed, 11 Nov 2020 18:57:15 +1100
Message-ID: <CANwerB3AyNHt50vR--eeBw=gk8771h+-6p+Fwg0gCx+16fkkMQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Avoid resetting force in the detect
 function
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0093086760=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0093086760==
Content-Type: multipart/alternative; boundary="000000000000684d1905b3d025b0"

--000000000000684d1905b3d025b0
Content-Type: text/plain; charset="UTF-8"

Hi Sam,

On Sun, 8 Nov 2020 at 9:47 pm, Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Russell,
>
> On Sun, Nov 08, 2020 at 09:57:25AM +0000, Russell King - ARM Linux admin
> wrote:
> > On Sun, Nov 08, 2020 at 10:53:22AM +0100, Sam Ravnborg wrote:
> > > Russell,
> > >
> > > On Sat, Oct 31, 2020 at 07:17:47PM +1100, Jonathan Liu wrote:
> > > > It has been observed that resetting force in the detect function can
> > > > result in the PHY being powered down in response to hot-plug detect
> > > > being asserted, even when the HDMI connector is forced on.
> > > >
> > > > Enabling debug messages and adding a call to dump_stack() in
> > > > dw_hdmi_phy_power_off() shows the following in dmesg:
> > > > [  160.637413] dwhdmi-rockchip ff940000.hdmi: EVENT=plugin
> > > > [  160.637433] dwhdmi-rockchip ff940000.hdmi: PHY powered down in 0
> iterations
> > > >
> > > > Call trace:
> > > > dw_hdmi_phy_power_off
> > > > dw_hdmi_phy_disable
> > > > dw_hdmi_update_power
> > > > dw_hdmi_detect
> > > > dw_hdmi_connector_detect
> > > > drm_helper_probe_detect_ctx
> > > > drm_helper_hpd_irq_event
> > > > dw_hdmi_irq
> > > > irq_thread_fn
> > > > irq_thread
> > > > kthread
> > > > ret_from_fork
> > > >
> > > > Fixes: 381f05a7a842 ("drm: bridge/dw_hdmi: add connector mode
> forcing")
> > > > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > >
> > > you are the original author of this code - any comments on this patch?
> >
> > No further comments beyond what has already been discussed, and the
> > long and short of it is it's been so long that I don't remember why
> > that code was there. Given that, I'm not even in a position to ack
> > the change. Sorry.
> Thanks for the quick reply.
>
> Given that this fixes a problem for Jonathan I will apply this to -fixes
> if there is no other feedback the next couple of days.
> If it introduces regression we can take it from there.
>
> Jonathan - please ping me if I forget.
>
>         Sam


> Ping.

Regards,
Jonathan

--000000000000684d1905b3d025b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Sam,</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, 8 Nov 2020 at 9:47 pm, Sam Ravnborg &=
lt;<a href=3D"mailto:sam@ravnborg.org">sam@ravnborg.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hi Russell,<br>
<br>
On Sun, Nov 08, 2020 at 09:57:25AM +0000, Russell King - ARM Linux admin wr=
ote:<br>
&gt; On Sun, Nov 08, 2020 at 10:53:22AM +0100, Sam Ravnborg wrote:<br>
&gt; &gt; Russell,<br>
&gt; &gt; <br>
&gt; &gt; On Sat, Oct 31, 2020 at 07:17:47PM +1100, Jonathan Liu wrote:<br>
&gt; &gt; &gt; It has been observed that resetting force in the detect func=
tion can<br>
&gt; &gt; &gt; result in the PHY being powered down in response to hot-plug=
 detect<br>
&gt; &gt; &gt; being asserted, even when the HDMI connector is forced on.<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Enabling debug messages and adding a call to dump_stack() in=
<br>
&gt; &gt; &gt; dw_hdmi_phy_power_off() shows the following in dmesg:<br>
&gt; &gt; &gt; [=C2=A0 160.637413] dwhdmi-rockchip ff940000.hdmi: EVENT=3Dp=
lugin<br>
&gt; &gt; &gt; [=C2=A0 160.637433] dwhdmi-rockchip ff940000.hdmi: PHY power=
ed down in 0 iterations<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Call trace:<br>
&gt; &gt; &gt; dw_hdmi_phy_power_off<br>
&gt; &gt; &gt; dw_hdmi_phy_disable<br>
&gt; &gt; &gt; dw_hdmi_update_power<br>
&gt; &gt; &gt; dw_hdmi_detect<br>
&gt; &gt; &gt; dw_hdmi_connector_detect<br>
&gt; &gt; &gt; drm_helper_probe_detect_ctx<br>
&gt; &gt; &gt; drm_helper_hpd_irq_event<br>
&gt; &gt; &gt; dw_hdmi_irq<br>
&gt; &gt; &gt; irq_thread_fn<br>
&gt; &gt; &gt; irq_thread<br>
&gt; &gt; &gt; kthread<br>
&gt; &gt; &gt; ret_from_fork<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Fixes: 381f05a7a842 (&quot;drm: bridge/dw_hdmi: add connecto=
r mode forcing&quot;)<br>
&gt; &gt; &gt; Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gma=
il.com" target=3D"_blank">net147@gmail.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; you are the original author of this code - any comments on this p=
atch?<br>
&gt; <br>
&gt; No further comments beyond what has already been discussed, and the<br=
>
&gt; long and short of it is it&#39;s been so long that I don&#39;t remembe=
r why<br>
&gt; that code was there. Given that, I&#39;m not even in a position to ack=
<br>
&gt; the change. Sorry.<br>
Thanks for the quick reply.<br>
<br>
Given that this fixes a problem for Jonathan I will apply this to -fixes<br=
>
if there is no other feedback the next couple of days.<br>
If it introduces regression we can take it from there.<br>
<br>
Jonathan - please ping me if I forget.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam</blockquote><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" =
dir=3D"auto"><br>
</blockquote></div></div><div dir=3D"auto">Ping.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Regards,</div><div dir=3D"auto">Jonathan</div>

--000000000000684d1905b3d025b0--

--===============0093086760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0093086760==--
