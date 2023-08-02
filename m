Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054676D610
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACDA10E1B3;
	Wed,  2 Aug 2023 17:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971B10E1B3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 17:50:28 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-79aeb0a4665so47806241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1690998628; x=1691603428;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xGq1aIBCGxiEXrqQEhQT2LiB068qDotkWqP0YLxkeNY=;
 b=VE5dAkKjhFGny8iA1SHzqW1gjkpPyzpJFeCvCiaMmYrYz136cFMNC2wBIbAIpyYvG8
 PcRFVQlMWLR3IyZu1ZbABkwfBOos+L3H4YyKb0sxceiTZN7kffAtSWidSEwB6sm+WOfg
 RB8VB9ot6MVX10g89RfjV6H83XBT/9+O3hA0t3Urr7/zSuunnEHEK4VDHBAUkNMnpOvo
 tDqP0rKHdn9wTIcG/u6Q2vqXUA/jjPED33xazSaZOT2mDzVUPtCzgzTtDQfQmZME6LmS
 oyYOCB/iNzBwv7KLufHbEpC68ObAZITaI5lh2GNzADEaKEbeq+hoi/5/FRdj1/SUMFgb
 lRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690998628; x=1691603428;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGq1aIBCGxiEXrqQEhQT2LiB068qDotkWqP0YLxkeNY=;
 b=DEwS2ODPRdPsp7h214VPdEGCNWXWW3poFAGJCPHEVRsznNx1yzLDoN0SyS6rweE1Mc
 +qLNsJNxhP/SQVGk6/ssBy9zP0XUuNDT2IhwVXS7FRvtdyOEon0gTXIUVm5CoaciMsB6
 iCmXalANODFZdzcOPcsYAha5v+dUCMWbMYAKFI7hXoft5uMVdnCARaV+WhNP7tt6aoHX
 s9UqEQ0ScO6r2fdG6sWEBNIXy9Y5tn2xFvRG+CE1aQoRjzJON/korKEQQu84XIKiBQLB
 qp3H8qGLk+JYiIR7l2FrWmxC58b3/UVcYRs8Rc8D5P9iVYOM4iznPBk012Hf8zdmbE0z
 8BuA==
X-Gm-Message-State: ABy/qLZx/5oS48X5atq1leVqTaerqQtZwm4hki2UiAZ3Y9li3O3Wkr6s
 fvbVjRVcdnZdFP+laTIkvdv0boyixQymOX/Z+RPiOQ==
X-Google-Smtp-Source: APBJJlEKR2Jf7TabvMSTmOGKPPwR3l8uT7K3XVNms8a2Ktc3rqhSqafmYxy++abfkChGUgUk+R2wfEAjkMi811bR0sM=
X-Received: by 2002:a05:6102:2c5:b0:447:4fbe:17f8 with SMTP id
 h5-20020a05610202c500b004474fbe17f8mr5295171vsh.23.1690998627720; Wed, 02 Aug
 2023 10:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
 <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
 <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
 <i3cbgrc365lwscwux2itho6uv74ji3hsjuge4zoxfnlnhacyqc@r73mmifyxffj>
 <CADcbR4JB0h8fByM2Z6diByvWaFprW9GDapBNt+YLWr9-vKoe7A@mail.gmail.com>
 <kuctj2p353nsae24lrhcymqqpfajbc7qoqly63zpwvdp6lgu3b@kk4gpzsapxnn>
 <64ca91a3.0d0a0220.8e58d.89b3@mx.google.com>
In-Reply-To: <64ca91a3.0d0a0220.8e58d.89b3@mx.google.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 2 Aug 2023 18:50:11 +0100
Message-ID: <CAPY8ntBGnrJLROCSTDv+qPAN6-Nc3TKBhFg2WqCv-d7c4WPnBA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled in
 drm_panel
To: Chris Morgan <macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, Doug Anderson <dianders@chromium.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 18:26, Chris Morgan <macroalpha82@gmail.com> wrote:
>
> * Spam *
> On Mon, Jul 31, 2023 at 07:03:07PM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > On Mon, Jul 31, 2023 at 11:33:22AM -0500, Chris Morgan wrote:
> > > In my case a few different panel drivers disable the regulators in the
> > > unprepare/disable routines.
> >
> > And that's totally fine.
> >
> > > For at least the Rockchip DSI implementations for some reason the
> > > panel gets unprepared more than once, which triggers an unbalanced
> > > regulator disable.
> >
> > "For some reason" being that DW-DSI apparently finds it ok to bypass any
> > kind of abstraction and randomly calling panel functions by itself:
> >
> > https://elixir.bootlin.com/linux/v6.4.7/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L868
> >
> > It looks like it's fixed it current drm-misc-next though.
>
> Good, when I get a chance I will test it out with the existing panels
> I have at my disposal and submit some patches to clean them up.
>
> >
> > > Obviously though the correct course of action is to fix the reason why
> > > the panel is disabled more than once, but that's at least the root
> > > cause of this behavior on the few panels I've worked with.
> >
> > Like I said we already have a commit on the way to fix that, so it
> > shouldn't be an issue anymore.
> >
> > I stand by what I was saying earlier though, I think it's mostly
> > cargo-cult or drivers being very wrong. If anything, the DW-DSI stuff
> > made me even more convinced that we shouldn't even entertain that idea
> > :)

DW-DSI is hacking around the fact that DSI panels may want to send DCS
commands in unprepare, however the DSI host driver shuts down the
controller in the DSI bridge post_disable which gets called first.

That ordering can now be reversed with pre_enable_prev_first flag in
struct drm_bridge, or prepare_prev_first in drm_panel, hence no need
for the DSI controller to jump around the bridge chain.

  Dave

> > Maxime
>
> Thank you, and yes if a driver is doing something it shouldn't we
> shouldn't be patching around that, we should be fixing things. Thanks
> for providing me with the additional info.
>
> Chris
>
