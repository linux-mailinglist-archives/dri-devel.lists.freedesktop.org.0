Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030EB6EBB19
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EDE10E04E;
	Sat, 22 Apr 2023 20:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3D310E04E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:04:22 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-54f6f0dae19so17180397b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682193861; x=1684785861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FfZExl41ARZJNMZxV8FYuFNwgjQmsvlN+TUukBG6bDI=;
 b=PitDsmJ7XgnfYorv7htt3nxihKXVPB9f+/DUdojUDHhXD5iZmFJ5SyD4HMUzi15ihy
 qmEtBsY/bMAJT4wlc7tVdtkodY5Bt62sBc5uisaR1dHpj+sPn+Ss1Cqw3Vb/IfFoZ0Yd
 8QV/a4LYH8LYG56ER5Zodz6kX3dXPM0cC85yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682193861; x=1684785861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FfZExl41ARZJNMZxV8FYuFNwgjQmsvlN+TUukBG6bDI=;
 b=M7qkNLg0tH313/Eqt9+2AXJnAlmyDqWfIA0VEWAkrqxxXNOWI9KlxPPaMYRvL+lISK
 78RvrvU6vDIAFFDrPrApGMylHUsu2qsB2Fxmz3/N23v/hbGFStLySs1BjltTAXMgGIST
 LU4BgPP0kfxod0Ymy7u2Q2yd1LYydkS38QtJsl58HdByCpX3myjONFJh6mU46g7vsAVw
 5FWC2yBlXW4qdLcN45an4B3ca1ZtrdFpc0QJHjcOBlzZhwKX3P3M5k8Lzs7G6mDPKDoO
 i6RBh3M8iGG9sCu3YCgMAwjvTAFC5Rg8FVcy+NzVsAnQa5mLTdqxNFdfl5gtUe7SURjR
 uEOQ==
X-Gm-Message-State: AAQBX9fep+uARVA0XUDHB5Me3geFYBRG73shTbYhVY7iXQK8VkIEpLKh
 GnPy8nAzGguEp/4ug0QlUk+IX6Czs10QFEpaQzqSeQTKLox36GTgJ0PB4A==
X-Google-Smtp-Source: AKy350ZgipWnsJffCh0aF4OkVvh5WbQA73QUJunhH7fGmroF9t3MQM6XSDWMrTu4h4zXdk8zVRMNP5j2YQDMilKL8OI=
X-Received: by 2002:a0d:d50f:0:b0:54e:f0d1:e3e5 with SMTP id
 x15-20020a0dd50f000000b0054ef0d1e3e5mr5048768ywd.24.1682193861244; Sat, 22
 Apr 2023 13:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230418122205.16632-1-fusibrandon13@gmail.com>
 <CAMty3ZDNv3u+Ye_V6m+zLNnNQM5_2=CfFOuOzmO9bHti8VCuJA@mail.gmail.com>
 <3cce6dc0-bb37-9118-9fee-c2f202826963@denx.de>
In-Reply-To: <3cce6dc0-bb37-9118-9fee-c2f202826963@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 23 Apr 2023 01:34:09 +0530
Message-ID: <CAMty3ZAFBt1dcXESHhLr0ij5SFzr3U1EXu=8+MjuReaAadebxw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: bridge: icn6211: Only warn on invalid chip IDs
To: Marek Vasut <marex@denx.de>, Brandon Cheo Fusi <fusibrandon13@gmail.com>
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
Cc: tzimmermann@suse.de, sam@ravnborg.org, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brandon,

On Wed, Apr 19, 2023 at 12:43=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 4/18/23 15:42, Jagan Teki wrote:
> > On Tue, Apr 18, 2023 at 5:52=E2=80=AFPM Brandon Cheo Fusi
> > <fusibrandon13@gmail.com> wrote:
> >>
> >> Avoid aborting chip configuration after reading invalid IDs and
> >> instead issue a warning. I have a bunch of these chips and they all
> >> report "Vendor=3D0x00 Device=3D0x00:0x00 Version=3D0x00" but are succe=
ssfully
> >> configured and go on to work just fine.
> >>
> >> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> >> ---
> >>   drivers/gpu/drm/bridge/chipone-icn6211.c | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/dr=
m/bridge/chipone-icn6211.c
> >> index 0e37840cd..39de9a7c7 100644
> >> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> >> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> >> @@ -361,8 +361,7 @@ static void chipone_atomic_enable(struct drm_bridg=
e *bridge,
> >>                  id[0], id[1], id[2], id[3]);
> >>
> >>          if (id[0] !=3D 0xc1 || id[1] !=3D 0x62 || id[2] !=3D 0x11) {
> >> -               dev_dbg(icn->dev, "Invalid Chip IDs, aborting configur=
ation\n");
> >> -               return;
> >> +               dev_warn(icn->dev, "Invalid Chip IDs, configuration ma=
y fail\n");
> >
> > Did you test I2C-Configured ICN6211 or non-I2C-Configured? if it's
> > later then better to fix a valid ID for it or if it doesn't support ID
> > then a handle via quirk would be a proper solution.
>
> The ICN6211 should always be accessible via either option. If the ID
> readout does not work, the bug is likely in broken DSI command mode on
> whatever DSI host is used, or, the ICN6211 clock are misconfigured.

Look like Marek was correct, please check your DSI host->transfer
support MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM if it is implemented
then the readid would pass.

Jagan.
