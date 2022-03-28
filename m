Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454B04E9207
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC82C10E60F;
	Mon, 28 Mar 2022 09:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB8D10E60F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 09:54:24 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so14942628pjf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vFzI/UO9S/7amXxoLgmYKGJ5Mev3LOFubNmP39fe8tI=;
 b=TMsLXfqkJdT1zPna/+HAShg++nN7DF7jJsTb4VSpRixOLRQlZax4SyZ7cooc+dbQYe
 orGkB0WXzAlWV7F4OPxRZXYgHqfUTKcknBVkKAAuf2d9C/jlrBTdts44nY1DbCvGQeEw
 RC5EpqZrVDJZhtoIObQClGHZCBXF+6id6SNJXNrMSrm/DyX+x18EJsWZGJy5TFH+UfTf
 iChpKdFEi5ou2S9mJcO6vPOVA5oanURTWuqUonvz4cD5eN1M6E2VeQfGPXVSk3rw0rvB
 5xoWqBTBxtsRUtq8/mpn7vfw7cDLnABFHLo0Zx+yepOjfPFi1C0RWkAkZHuOwmTRcVU8
 eRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vFzI/UO9S/7amXxoLgmYKGJ5Mev3LOFubNmP39fe8tI=;
 b=JztvEEnz8LppIFM6PPHBoI705rZF3AsCFn8y4A68xiswMLU+RGC25vFeGimbbR3F3v
 PFylyC6KsgzRC9oIY6mcC+A6snP0v2KI4W7Jl43ejn/AqRH+yWQWobHNJZjJNffyeOcn
 CHFT3cLwURyn+8c59PXrP4YEKfCuEZ1YwNbw/ZhY8l516ZHM1mEFKu46NfazuJrPDWs8
 c+OBHJfwHuBnPsQ2aX+Dr3UFrPfwu/r1eJp14c17XxR89o912xni59mOXK5YpVvm43In
 Q6PGVtq7a5m3oTc1VjmdmgUQU08bdKQO7RLy9p2lMwDDpUZQK5wjMLCUT0f5HhgpoYUe
 Ivyg==
X-Gm-Message-State: AOAM531rZIP9bGnEaj1QbLP4w45tKDMJHPet1yukYSVsaVvk1g7M1NfP
 kTRoK8BsVRZSC1YPFCrhjh72QVlORfCYGy0/Wp/gkg==
X-Google-Smtp-Source: ABdhPJzbwvWS4Ya4eSWLbt3jj91/xcjC8ySl3W6dm7vJZUIPTR+YYZCh59b57AISL/1wZWV+X0VTOrH7gRzWttv8tKI=
X-Received: by 2002:a17:902:9301:b0:153:2252:44ea with SMTP id
 bc1-20020a170902930100b00153225244eamr25086369plb.65.1648461263991; Mon, 28
 Mar 2022 02:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
 <YiWiYpEfTOOqgyAN@google.com>
 <CAG3jFys-BYsBp07AAFQ2O_TFsXOwhcVDnsOh8WVNNSag3HZw+Q@mail.gmail.com>
 <CAG3jFyu47cv8oSecONM95KVoP=NOvgwafAp4TQ33CZ0Y4zWmnQ@mail.gmail.com>
 <20220321115226.GA1484106@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220321115226.GA1484106@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 28 Mar 2022 11:54:12 +0200
Message-ID: <CAG3jFysvDa2FS3NS6f2sXAid_TmrXyb9vCADN87v=mJ-txGp0A@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
To: Xin Ji <xji@analogixsemi.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 bliang@analogixsemi.com, drinkcat@google.com, sam@ravnborg.org,
 jernej.skrabec@gmail.com, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 jonas@kwiboo.se, qwen@analogixsemi.com, robh+dt@kernel.org, maxime@cerno.tech,
 pihsun@chromium.org, hsinyi@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > > > > -   DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > > > > > +   bus_type =3D V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > +   mipi_lanes =3D MAX_LANES_SUPPORT;
> > > > > > +   ep0 =3D of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > +   if (ep0) {
> > > > > > +           if (of_property_read_u32(ep0, "bus-type", &bus_type=
))
> > > > > > +                   bus_type =3D 0;
> > > > > > +
> > > > > > +           mipi_lanes =3D of_property_count_u32_elems(ep0, "da=
ta-lanes");
> > > > > > +   }
> > > > > > +
> > > > > > +   if (bus_type =3D=3D V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus t=
ype is Parallel(DSI) */
> > > > >
> > > > > This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has n=
othing
> > > > > to do with DSI. DSI stands for Digital *Serial* Interface. If any=
thing,
> > > > > the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, e=
ven if
> > > > > it's not an exact match.
> > > > >
> > > > > This patch has landed in v5.17-rc1, along with the corresponding
> > > > > bindings. As DT bindings are an ABI, we should really fix this be=
fore
> > > > > v5.17 is released. There is no DSI bus types defined in DT, and a=
dding
> > > > > one as a fix so late in the v5.17-rc cycle seems a bit of a stret=
ch to
> > > > > me (unless Rob disagrees).
> > > > >
> > > > > It would seem best to revert this series and the corresponding bi=
ndings,
> > > > > and retry in v5.18.
> > > >
> > > > There is a DT patch using this property that is already queued up f=
or 5.17
> > > > in the soc tree:
> > > >
> > > > https://nam10.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fall%2F20220214200507.2500693-1-nfraprado%40collabora.com=
%2F&amp;data=3D04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da0=
0ea7baa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000&amp;sdata=3DKbitBhnvGWfpHu6PNLUmrgdqcoZbXaA3hGwq9iAjQfI=
%3D&amp;reserved=3D0
> > > >
> > > > merged here:
> > > >
> > > > https://nam10.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
git.kernel.org%2Fsoc%2Fsoc%2Fc%2F32568ae37596b529628ac09b875f4874e614f63f&a=
mp;data=3D04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da00ea7b=
aa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000&amp;sdata=3DYJAs0IPxR0hrHpGR7K00itcTIF9cnz4L4ta%2B9ACQdSk%3D=
&amp;reserved=3D0
> > > >
> > > > We will need to revert that one as well.
> > >
> > > I just submitted a series reverting the dt-binding change + the
> > > related commit to "mt8183: jacuzzi".
> > > Can I get a quick r-b/a-b in order to get this into v5.17.
> > >
> > > https://nam10.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ore.kernel.org%2Fall%2F20220307154558.2505734-3-robert.foss%40linaro.org%2F=
&amp;data=3D04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da00ea=
7baa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000&amp;sdata=3DS5ScH2jid3ZRobvO%2Fl2nVgdOvFHNj1nWafTQYG3L9d0%=
3D&amp;reserved=3D0
> > >
> >
> > v2 of revert submitted.
> >
> > https://nam10.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.kernel.org%2Fall%2F20220308094911.2680291-1-robert.foss%40linaro.org%2F&a=
mp;data=3D04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da00ea7b=
aa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000&amp;sdata=3DD6ulS16g4v4x0u23OtYRrSeitTqllWwDzPiT%2BxMcQQg%3D=
&amp;reserved=3D0
> >
> > Xin: Will you spin a series that adds DPI support and re-enables DPI
> > for anx7625? Additionally, "mt8183: jacuzzi" will have to have DPI
> > re-enabled.
> Hi Robert Foss, I'm little confused, do I need resend this serial or
> send a patch based on currently define(V4L2_FWNODE_BUS_TYPE_PARALLEL)?
>
> And use V4L2_FWNODE_BUS_TYPE_PARALLEL for DPI, other value for DSI
> setup?

V4L2_FWNODE_BUS_TYPE_PARALLEL is not meant to be used for DPI, but
rather is used to represtent CPI. So another enum (something along the
lines of V4L2_FWNODE_BUS_TYPE_DPI) needs to be defined, and then this
series needs to use this new enum.

I'd like to see the following:
 - Introduction of V4L2_FWNODE_BUS_TYPE_DPI
 - Reworking this series to use V4L2_FWNODE_BUS_TYPE_DPI
 - Reworking "mt8183: jacuzzi" to use V4L2_FWNODE_BUS_TYPE_DPI

Does that make sense?


Rob.
