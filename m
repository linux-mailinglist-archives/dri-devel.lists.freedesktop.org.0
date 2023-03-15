Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2395B6BBF25
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 22:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9431510E35E;
	Wed, 15 Mar 2023 21:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7D310E35E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 21:34:08 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id q6so8447230iot.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 14:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678916046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxQiJhldQojh4IbDRDL1+iMAuzL0o4Se1pqroOsNCwQ=;
 b=gmAtNBMc7/vjNIghl49Q+TQX+Sj/wxnxkzMgubxh4Vm1nnU/q9DoZIeMmj2/a0SuJo
 te0L/G+P8auI0scnh3z7CgsSx57w9UKrTwVaGcubR9xv1eJROolJf/jg1RFvXrha0y4h
 crhwUQRV5uuyD0Zn0KzA9lCPnWJPL5KqyZ650=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678916046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxQiJhldQojh4IbDRDL1+iMAuzL0o4Se1pqroOsNCwQ=;
 b=jwy7S+9jpEGrvateE/HxrRnfTDBwTQrbIglAMzF3o7afqNNzq2SrQ7p0zm8BLieBJW
 T2ojBoCqSr7VHG9OjEq8w2ZSCEcNvMUkUn0M9Q+3sYr6l2wDmUp3U6EdiPNYVhUrIfgl
 fPIYrxjva0zUSuuHct85K5VNSHtCLEnfEilTfDIK1+IEIQxfYQfKeaJCjzhNWXlYlMro
 PsKq5ksyeQl7TxJY9fnnuthwiQNqqjAahaJwjfVqTMRfzyCRcKfyTPUTX6N3iK7lLHit
 rfX3aHCC0KQVI97Mr0ZiqQ9oA/QtcfSlwI+nOtZWbTAi3NVNvTFObqwKh2qEp4cf3MBX
 v+PQ==
X-Gm-Message-State: AO0yUKVN54iT9vRR136uHCxLxI1M9pz//Oxpbr3roeDfRm9GxmtVj9Qb
 LMYN2cEHP4bifM0WobVQ87I1dcgqMJLLfjyeYPs=
X-Google-Smtp-Source: AK7set8BwKaRvnFGYBppMIuYY2oIr1KYHGxgvc6RZLwbA9BUZtjo8tnDkaRPZMRpp363Xe6OCui3CA==
X-Received: by 2002:a6b:d806:0:b0:753:42e:5d55 with SMTP id
 y6-20020a6bd806000000b00753042e5d55mr1555555iob.0.1678916045992; 
 Wed, 15 Mar 2023 14:34:05 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174]) by smtp.gmail.com with ESMTPSA id
 y22-20020a02bb16000000b003fd73ca55c4sm1969170jan.91.2023.03.15.14.34.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 14:34:04 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id i19so11089084ila.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 14:34:04 -0700 (PDT)
X-Received: by 2002:a05:6e02:549:b0:315:8e92:39ad with SMTP id
 i9-20020a056e02054900b003158e9239admr3841409ils.1.1678916043909; Wed, 15 Mar
 2023 14:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230314110043.2139111-1-treapking@chromium.org>
 <CAD=FV=W=jVsvD620wWKfniRYQNJnb7goDUKb_HhL_qVxLYGZOA@mail.gmail.com>
 <CAEXTbpe6EyukjKfgaVtHdMK2Ppw715kUUnOqvFa+tEX913p9aQ@mail.gmail.com>
In-Reply-To: <CAEXTbpe6EyukjKfgaVtHdMK2Ppw715kUUnOqvFa+tEX913p9aQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Mar 2023 14:33:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLh37hFpLwyuPoGNDCpvVL7FGLySVp7d1W788YkjNYog@mail.gmail.com>
Message-ID: <CAD=FV=VLh37hFpLwyuPoGNDCpvVL7FGLySVp7d1W788YkjNYog@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: ps8640: Skip redundant bridge enable
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 14, 2023 at 8:28=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Hi Doug,
>
> On Wed, Mar 15, 2023 at 5:31=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Mar 14, 2023 at 4:00=E2=80=AFAM Pin-yen Lin <treapking@chromium=
.org> wrote:
> > >
> > > Skip the drm_bridge_chain_pre_enable call when the bridge is already
> > > pre_enabled. This make pre_enable and post_disable (thus
> > > pm_runtime_get/put) symmetric.
> > >
> > > Fixes: 46f206304db0 ("drm/bridge: ps8640: Rework power state handling=
")
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > ---
> > >
> > >  drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm=
/bridge/parade-ps8640.c
> > > index 4b361d7d5e44..08de501c436e 100644
> > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > @@ -557,7 +557,8 @@ static struct edid *ps8640_bridge_get_edid(struct=
 drm_bridge *bridge,
> > >          * EDID, for this chip, we need to do a full poweron, otherwi=
se it will
> > >          * fail.
> > >          */
> > > -       drm_atomic_bridge_chain_pre_enable(bridge, connector->state->=
state);
> > > +       if (poweroff)
> > > +               drm_atomic_bridge_chain_pre_enable(bridge, connector-=
>state->state);
> >
> > It always seemed weird to me that this function was asymmetric, so I
> > like this change, thanks!
> >
> > I also remember wondering before how this function was safe, though.
> > The callpath for getting here from the ioctl is documented in the
> > function and when I look at it I wonder if anything is preventing the
> > bridge from being enabled / disabled through normal means at the same
> > time your function is running. That could cause all sorts of badness
> > if it is indeed possible. Does anyone reading this know if that's
> > indeed a problem?
>
> If the "normal mean" is disabling the bridge, then we are probably
> disabling the whole display pipeline. If so, is the EDID still
> relevant in this case?

In general when we do a "modeset" I believe that the display pipeline
is disabled and re-enabled. On a Chromebook test image you can see
this disable / re-enable happen when you switch between "VT2" and the
main login screen.

If the display pipeline is disabled / re-enabled then it should still
be fine to keep the EDID cached, so that's not what I'm worried about.
I'm more worried that someone could be querying the EDID at the same
time that someone else was turning the screen off. In that case it
would be possible for "poweroff" to be true (because the screen was on
when we started reading the EDID) and then partway through the screen
could get turned off.

-Doug
