Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC181ADEA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5410E057;
	Thu, 21 Dec 2023 04:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390A410E057
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 04:23:28 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5e86fc3f1e2so4216587b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 20:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703132607; x=1703737407; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pyDXy/DYBJClmcs3SI2snYWZHNkZ45xY7c9L7g9PObw=;
 b=SRQzvbPTB93t9y/d9WrmLhU21zRnd4gIaESCeSP4rtuAfLdo5tYBjpkhJWlkQo5Cd7
 CNXYtOCrpp9Z9dhoCVyJqDxggyEu5/N2Pdkbu3niJTReBT1AAef9NJpG7bUkszuDUL8D
 K4CfEAABaTRU8ZOaPfWMPxx8byyb8DtGvtpkfc2POctxmkjEo8w/iNjDL8b2b88wA2M2
 aIk7eHm0q0MKsV4szI5fiseh582SiffmL/+O3csYC3Tw3WJXBh594NZTYOwtFCSfA9Ps
 Wa3E2WgbB+qX08pGed4fk3LnUfAUhu7uxrrxx8WubW2Zo81oCJeHqCkhZqLwBPRyTwA9
 ZnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703132607; x=1703737407;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pyDXy/DYBJClmcs3SI2snYWZHNkZ45xY7c9L7g9PObw=;
 b=EHaELM3QzM4D61WXdkKilkxVEZnEc/ZQqDoW3ntHHO199i7yQw4SQpdIOy6N0L121y
 +khldTjEPuXTemtUF7CdljMhpO2Op/NJ1n7gxjAF1VzRMs3wrVbMdkHtR3fPQxjOmxtA
 WyNdoCiEwVGPHy2ZJA+fuLY/pXCmigaAWP5rpi73dxnrJ91vnExRKqLTMFezuCF/i7Bi
 DjEApQpr6WnRX7fwQ1aHFkrYPuCnpQgeQMEZBa4T6h9mcSyqlngKx/V33wcJAsDsrvct
 W0q0q+1kQ7X7ZvTPkij9emcWiKKgSOY7h8/rQ3/fYNKNOrl0wZk/cAbYFOCuqS6JM47k
 V+qw==
X-Gm-Message-State: AOJu0Yw9fWqyYqRECeFv69UIPSB5jwDwuSc5rcGPqhfRAFMmIH0UkEDD
 KVZMOHbUHsgQXPdJIXSpJ0us7+cuCyH1wXSCCzs=
X-Google-Smtp-Source: AGHT+IH6oWaRIq9Zo8KcF8YRh6OECICim3iDdgKfUY31QITK4G/ZJtCJ1SyMxqcSpPR4NsO0zc4lEzMBvqiW0y6CLnw=
X-Received: by 2002:a0d:dec6:0:b0:5df:c224:fb42 with SMTP id
 h189-20020a0ddec6000000b005dfc224fb42mr806915ywe.96.1703132607089; Wed, 20
 Dec 2023 20:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
In-Reply-To: <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 21 Dec 2023 13:23:16 +0900
Message-ID: <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Content-Type: multipart/alternative; boundary="0000000000000d19ce060cfd767b"
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Michael Walle <mwalle@kernel.org>,
 David Airlie <airlied@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000d19ce060cfd767b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 12=EC=9B=94 19=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 11:11,=
 Frieder Schrempf <frieder.schrempf@kontron.de>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1:

> On 01.12.23 10:04, Michael Walle wrote:
> >> The FORCE_STOP_STATE bit is unsuitable to force the DSI link into LP-1=
1
> >> mode. It seems the bridge internally queues DSI packets and when the
> >> FORCE_STOP_STATE bit is cleared, they are sent in close succession
> >> without any useful timing (this also means that the DSI lanes won't go
> >> into LP-11 mode). The length of this gibberish varies between 1ms and
> >> 5ms. This sometimes breaks an attached bridge (TI SN65DSI84 in this
> >> case). In our case, the bridge will fail in about 1 per 500 reboots.
> >>
> >> The FORCE_STOP_STATE handling was introduced to have the DSI lanes in
> >> LP-11 state during the .pre_enable phase. But as it turns out, none of
> >> this is needed at all. Between samsung_dsim_init() and
> >> samsung_dsim_set_display_enable() the lanes are already in LP-11 mode.
> >> The code as it was before commit 20c827683de0 ("drm: bridge:
> >> samsung-dsim: Fix init during host transfer") and 0c14d3130654 ("drm:
> >> bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec") was correc=
t
> >> in this regard.
> >>
> >> This patch basically reverts both commits. It was tested on an i.MX8M
> >> SoC with an SN65DSI84 bridge. The signals were probed and the DSI
> >> packets were decoded during initialization and link start-up. After th=
is
> >> patch the first DSI packet on the link is a VSYNC packet and the timin=
g
> >> is correct.
> >>
> >> Command mode between .pre_enable and .enable was also briefly tested b=
y
> >> a quick hack. There was no DSI link partner which would have responded=
,
> >> but it was made sure the DSI packet was send on the link. As a side
> >> note, the command mode seems to just work in HS mode. I couldn't find
> >> that the bridge will handle commands in LP mode.
> >>
> >> Fixes: 20c827683de0 ("drm: bridge: samsung-dsim: Fix init during host
> >> transfer")
> >> Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M enable
> >> flow to meet spec")
> >> Signed-off-by: Michael Walle <mwalle@kernel.org>
> >> ---
> >> Let me know wether this should be two commits each reverting one, but
> >> both
> >> commits appeared first in kernel 6.5.
> >
> > Are there any news?
>
> Inki, are you picking this up? Or if not, who will?
>

I can pick it up but it would be better to go to the drm-misc tree. If
nobody cares about it then I will pick it up. :)

acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

--0000000000000d19ce060cfd767b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 12=EC=9B=94 19=EC=9D=BC (=ED=99=94) =EC=
=98=A4=EC=A0=84 11:11, Frieder Schrempf &lt;<a href=3D"mailto:frieder.schre=
mpf@kontron.de">frieder.schrempf@kontron.de</a>&gt;=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 01.12.23 10:04,=
 Michael Walle wrote:<br>
&gt;&gt; The FORCE_STOP_STATE bit is unsuitable to force the DSI link into =
LP-11<br>
&gt;&gt; mode. It seems the bridge internally queues DSI packets and when t=
he<br>
&gt;&gt; FORCE_STOP_STATE bit is cleared, they are sent in close succession=
<br>
&gt;&gt; without any useful timing (this also means that the DSI lanes won&=
#39;t go<br>
&gt;&gt; into LP-11 mode). The length of this gibberish varies between 1ms =
and<br>
&gt;&gt; 5ms. This sometimes breaks an attached bridge (TI SN65DSI84 in thi=
s<br>
&gt;&gt; case). In our case, the bridge will fail in about 1 per 500 reboot=
s.<br>
&gt;&gt;<br>
&gt;&gt; The FORCE_STOP_STATE handling was introduced to have the DSI lanes=
 in<br>
&gt;&gt; LP-11 state during the .pre_enable phase. But as it turns out, non=
e of<br>
&gt;&gt; this is needed at all. Between samsung_dsim_init() and<br>
&gt;&gt; samsung_dsim_set_display_enable() the lanes are already in LP-11 m=
ode.<br>
&gt;&gt; The code as it was before commit 20c827683de0 (&quot;drm: bridge:<=
br>
&gt;&gt; samsung-dsim: Fix init during host transfer&quot;) and 0c14d313065=
4 (&quot;drm:<br>
&gt;&gt; bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec&quot;) w=
as correct<br>
&gt;&gt; in this regard.<br>
&gt;&gt;<br>
&gt;&gt; This patch basically reverts both commits. It was tested on an i.M=
X8M<br>
&gt;&gt; SoC with an SN65DSI84 bridge. The signals were probed and the DSI<=
br>
&gt;&gt; packets were decoded during initialization and link start-up. Afte=
r this<br>
&gt;&gt; patch the first DSI packet on the link is a VSYNC packet and the t=
iming<br>
&gt;&gt; is correct.<br>
&gt;&gt;<br>
&gt;&gt; Command mode between .pre_enable and .enable was also briefly test=
ed by<br>
&gt;&gt; a quick hack. There was no DSI link partner which would have respo=
nded,<br>
&gt;&gt; but it was made sure the DSI packet was send on the link. As a sid=
e<br>
&gt;&gt; note, the command mode seems to just work in HS mode. I couldn&#39=
;t find<br>
&gt;&gt; that the bridge will handle commands in LP mode.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: 20c827683de0 (&quot;drm: bridge: samsung-dsim: Fix init dur=
ing host<br>
&gt;&gt; transfer&quot;)<br>
&gt;&gt; Fixes: 0c14d3130654 (&quot;drm: bridge: samsung-dsim: Fix i.MX8M e=
nable<br>
&gt;&gt; flow to meet spec&quot;)<br>
&gt;&gt; Signed-off-by: Michael Walle &lt;<a href=3D"mailto:mwalle@kernel.o=
rg" target=3D"_blank" rel=3D"noreferrer">mwalle@kernel.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Let me know wether this should be two commits each reverting one, =
but<br>
&gt;&gt; both<br>
&gt;&gt; commits appeared first in kernel 6.5.<br>
&gt; <br>
&gt; Are there any news?<br>
<br>
Inki, are you picking this up? Or if not, who will?<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I can pick it up but it =
would be better to go to the drm-misc tree. If nobody cares about it then I=
 will pick it up. :)</div><div dir=3D"auto"><br></div><div dir=3D"auto">ack=
ed-by : Inki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsu=
ng.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</=
div><div dir=3D"auto">Inki Dae</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000000d19ce060cfd767b--
