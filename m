Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E57D2CF6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2E710E185;
	Mon, 23 Oct 2023 08:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400DF10E186
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 08:40:54 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a7a80a96dbso32687227b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698050453; x=1698655253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaL68/qeer0rqmvgi8CDg0bYTQpez2jRXyNtczwGTGY=;
 b=AkLTHZ9GOVqjz7oLS7xiP1BHGRaSVSiKfdmH3voeJxwhnfDroMUTHVwFp43FsZ/+QC
 tWscABXz5DyJwYqCbxXKECY3p5dBMB54m6FPCPqMKzbCvZq2uESxLSck0A30Z4GUkPjs
 M+xrfW40bdD527r75m+Ltm/ccW8XxYWN2150M5WAVW72mzTtuBGE9BmmW4UwfC1JPm+w
 bpEfG/1vAg1maqpi1JmHH3taDZgHLyGUTjteA5C4T7mIvxx9r5dhd+GbJhTr8hBKUzrA
 sYVImFpFUiNkGCaMu9oEgfUarUK2PCyHoa8sX/atn8/12rlONyRGy2WVKcmO1UPoZm7+
 9NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698050453; x=1698655253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaL68/qeer0rqmvgi8CDg0bYTQpez2jRXyNtczwGTGY=;
 b=ObpUuOHbnkejetSmCgfR66malH35QrHemEzSeMnvuxEGDtCle6IJfeYjh/oymoujxQ
 xk41X0JWZQlAtL9feR4ZMXh0QpAhpml3tKmff2XSkCJV40kCRZq4DjT0YIww2snVHCtu
 VkW41DUZY9sFLV5KuegYZaOdp2BhueAxXheFghliWG5GXD4dB74gI1ZFp2QtUz8Y+gh6
 6faEpVSUGR96mX5fkyBUz8A1XJe2Q6dzuz7PfXnz9+Hv+a7tb5yYg/B4sXK7n15aVBvT
 8nQrGcugZvD0gfWuu5PvF0RaNpDKv3RrQJGV79LsHMA9/6ZtIt20/NOaGaWEjv/i1y+A
 mLEg==
X-Gm-Message-State: AOJu0YykZDYvz5Em1EIYBtbHedLYTJD8xHsVZLcvSKVPjp0ZxOQ46RYO
 EVMXgvaBAYgfSS+Sp6I8ifQumfj5j5mUE34ZO6xd+1diHWqyFUdpPHU=
X-Google-Smtp-Source: AGHT+IGAkh/c3GbWNcWRXLTZ32eNfXArR9TC3Fd+iqsnvwbLzueIKhgdFmlb34ugIHWdJbPKSIqmrLsbZYsECiGgkW4=
X-Received: by 2002:a0d:d6c2:0:b0:5a7:fcad:e865 with SMTP id
 y185-20020a0dd6c2000000b005a7fcade865mr11281424ywd.2.1698050453310; Mon, 23
 Oct 2023 01:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <1871104.tdWV9SEqCh@steina-w>
 <CAA8EJpofiawC5z3jw1-TsxS+ZWz4QobCby3kScDDdk9Z-74mgQ@mail.gmail.com>
 <3266380.44csPzL39Z@steina-w>
In-Reply-To: <3266380.44csPzL39Z@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Oct 2023 11:40:42 +0300
Message-ID: <CAA8EJpoF+r6a9cAnW0uT_YgBi=oC1dw9JYShau8ji-sR71iUxw@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 at 11:14, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 23. Oktober 2023, 09:34:42 CEST schrieb Dmitry Baryshkov:
> > On Mon, 23 Oct 2023 at 09:52, Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi Dmitry,
> > >
> > > Am Sonntag, 22. Oktober 2023, 12:49:41 CEST schrieb Dmitry Baryshkov:
> > > > On Thu, 19 Oct 2023 at 14:42, Alexander Stein
> > > >
> > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > Hi,
> > > > >
> > > > > Am Donnerstag, 19. Oktober 2023, 13:19:51 CEST schrieb Dmitry
> Baryshkov:
> > > > > > On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org=
>
> wrote:
> > > > > > > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wr=
ote:
> > > > > > > > The MIPI DSI links do not fully fall into the DRM callbacks
> > > > > > > > model.
> > > > > > >
> > > > > > > Explaining why would help
> > > > > >
> > > > > > A kind of explanation comes afterwards, but probably I should c=
hange
> > > > > > the order of the phrases and expand it:
> > > > > >
> > > > > > The atomic_pre_enable / atomic_enable and correspondingly
> > > > > > atomic_disable / atomic_post_disable expect that the bridge lin=
ks
> > > > > > follow a simple paradigm: either it is off, or it is on and
> > > > > > streaming
> > > > > > video. Thus, it is fine to just enable the link at the enable t=
ime,
> > > > > > doing some preparations during the pre_enable.
> > > > > >
> > > > > > But then it causes several issues with DSI. First, some of the =
DSI
> > > > > > bridges and most of the DSI panels would like to send commands =
over
> > > > > > the DSI link to setup the device. Next, some of the DSI hosts h=
ave
> > > > > > limitations on sending the commands. The proverbial sunxi DSI h=
ost
> > > > > > can
> > > > > > not send DSI commands after the video stream has started. Thus =
most
> > > > > > of
> > > > > > the panels have opted to send all DSI commands from pre_enable =
(or
> > > > > > prepare) callback (before the video stream has started).
> > > > > >
> > > > > > However this leaves no good place for the DSI host to power up =
the
> > > > > > DSI
> > > > > > link. By default the host's pre_enable callback is called after=
 the
> > > > > > DSI bridge's pre_enable. For quite some time we were powering u=
p the
> > > > > > DSI link from mode_set. This doesn't look fully correct. And al=
so we
> > > > > > got into the issue with ps8640 bridge, which requires for the D=
SI
> > > > > > link
> > > > > > to be quiet / unpowered at the bridge's reset time.
> > > > >
> > > > > There are also bridges (e.g. tc358767) which require DSI-LP11 upo=
n
> > > > > bridge
> > > > > reset. And additionally this DSI-(e)DP bridge requires LP11 while
> > > > > accessing
> > > > > DP-AUX channel, e.g. reading EDID. So bridges need at least some
> > > > > control
> > > > > over DSI line state.
> > > >
> > > > For sending commands in LP11 it is typical to toggle the
> > > > MIPI_DSI_MODE_LPM flag, for example see panel-=3Djdi-lt070me05000.c=
 or
> > > > some other drives. It might be a good idea to make that more explic=
it.
> > > > All suggestions here would be appreciated.
> > >
> > > The biggest difference between that display and the tc358767 bridge i=
s
> > > that
> > > the display uses DSI commands, while the bridge is using i2c transfer=
 to
> > > issue DP-AUX commands. There is no host_transfer [1] which would enab=
le
> > > LP-11. It seems this DSI-DP bridge requires LP-11/HS on DSI lanes all
> > > times. This contradicts current Linux behaviour.
> >
> > I see. I took a quick glance at the driver. Does the device mark AUX
> > as busy when there is a HS transfer?
> > Because otherwise it might be pretty hard to synchronise DP-AUX
> > transfers with the DSI link state. We might need to add an API for
> > this, if the DSI hosts actually can signal the blanking / DSI LP.
>
> I don't see that a synchronization would be required. AUX should be
> independent from DSI transfers. ASFAICS the bridge internals just require=
s DSI
> lines to be LP-00 or HS for AUX channel to be functioning.

Ah, LP or HS. Then it should be fine. I probably misread your original
email. I thought that AUX transfers work only in the LP mode.

>
> >
> > Side note: the driver needs some care. It doesn't support the aux-bus
> > bindings for eDP panels, it doesn't support other bridges on top of DP
> > connectors (but there can be e..g. dp-connector device).
>
> I don't think that this is necessary as you add an optional endpoint to p=
ort2
> which will then add an eDP display panel bridge. This should then handle =
aux-
> bus bindings.

Not quite, see Documentation/devicetree/bindings/display/dp-aux-bus.yaml
and devm_of_dp_aux_populate_bus().

It is expected that eDP panels are to be placed under the edp_bridge /
aux-bus device node. But this is a separate topic, I just wanted to
point out other missing pieces.

>
> Best regards,
> Alexander
>
> > > Best regards,
> > > Alexander
> > >
> > > [1]
> > > https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-=
dsi-> > bridge-operation
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>


--=20
With best wishes
Dmitry
