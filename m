Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4C66A4DB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D1C10E204;
	Fri, 13 Jan 2023 21:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4566E10E204
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 21:12:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g18so1948013lfh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 13:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5E2jUOsmFLtdYppT5Vp0YBT45RVJ+ABe3kgqhVZhkI=;
 b=IkJ+FOVocZ4ttJ4pEh+dqaYc1loiq1VzM4s8rw3sfw+1LDPtVXu3+QCzwNyI/P+Oz3
 Q8GtrQlQFVgEw2AwhcdO9Y+lo70CcrUxOaUVv6K3tg9hOQIlRZure7tE16OwYGB+40y7
 IkaTssjuMdbN49fZTK+WSj6EXgdB+69XdqZus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=r5E2jUOsmFLtdYppT5Vp0YBT45RVJ+ABe3kgqhVZhkI=;
 b=oxPWMhl7uymZ0Accb5ErGKyrGJgE5nweYn8sJwCjURSALXSQiZRHt24m24sLe8tZDn
 25OV6wL//j3XwjiRJ1RGUZzVEpzcu8lmYRYyWISSAcTKf9fLrwQ8WS7676xMz8E9996e
 gKQ35L6QAkRBbQLce2ev0b9NbAY9ps3sSrVDiCsqrl48AaPbbO4XlMhsiVUUdZ+GZx3b
 9dg11BEJaxtrN49puTEJiquvr3UVunYvqQXyImsRsGAOUWipzEdUjVJR+ThPwooIzJBf
 DWUzaNEBqlvgiC1qtUXqzr+xgExS22CvMANdYSSN7K67v+EVk6w3Qnapb9i7d3ykjl4G
 i52Q==
X-Gm-Message-State: AFqh2ko7OeE+9y3bm537G1IbpW3IkhIAx+J9o+D7tjaUNwrOehCnhMmQ
 NaQNWokdgpTeqO7gUumi/1tdoi5XedMP2BpD33TmKg==
X-Google-Smtp-Source: AMrXdXsEHDMUikQ5Emug3xW/Z4eyYFdBuE++yVRLiUqBN6JN5+W+1CZEk4riH+MmzQZSNNRp1Leh8neGlYysREAjyE0=
X-Received: by 2002:a05:6512:4017:b0:4bd:35fd:65b5 with SMTP id
 br23-20020a056512401700b004bd35fd65b5mr8207466lfb.297.1673644328511; Fri, 13
 Jan 2023 13:12:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Jan 2023 15:12:07 -0600
MIME-Version: 1.0
In-Reply-To: <CAPY8ntA=Dq6GFQ3gEOm9PzPyOa9bHTr8JrpXLibnai7xKqRbpQ@mail.gmail.com>
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <CAPY8ntA=Dq6GFQ3gEOm9PzPyOa9bHTr8JrpXLibnai7xKqRbpQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 13 Jan 2023 15:12:07 -0600
Message-ID: <CAE-0n53UFuyYvjJUWViXy9Eex2mpBRJGtt4vGc2cbFZS9i8xFw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, patches@lists.linux.dev,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dave Stevenson (2023-01-13 08:27:29)
> Hi Stephen
>
> On Fri, 6 Jan 2023 at 03:01, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > The unprepare sequence has started to fail after moving to panel bridge
> > code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch t=
o
> > DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> >
> >    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> >
> > This is because boe_panel_enter_sleep_mode() needs an operating DSI lin=
k
> > to set the panel into sleep mode. Performing those writes in the
> > unprepare phase of bridge ops is too late, because the link has already
> > been torn down by the DSI controller in post_disable, i.e. the PHY has
> > been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> > on the DSI .
> >
> > Split the unprepare function into a disable part and an unprepare part.
> > For now, just the DSI writes to enter sleep mode are put in the disable
> > function. This fixes the panel off routine and keeps the panel happy.
>
> It is documented that the mipi_dsi_host_ops transfer function should
> be called with the host in any state [1], so the host driver is
> failing there.

Thanks for the info! It says "Drivers that need the underlying device to
be powered to perform these operations will first need to make sure it=E2=
=80=99s
been properly enabled." Does that mean the panel driver needs to make
sure the underlying dsi host device is powered? The sentence is too
ambiguous for me to understand what 'drivers' and 'underlying device'
are.

>
> This sounds like the same issue I was addressing in adding the
> prepare_prev_first flag to drm_panel, and pre_enable_prev_first to
> drm_bridge via [2].
> Defining prepare_prev_first for your panel would result in the host
> pre_enable being called before the panel prepare, and therefore the
> transfer calls from boe_panel_init_dcs_cmd boe_panel_prepare won't be
> relying on the DSI host powering up early. It will also call the panel
> unprepare before the DSI host bridge post_disable is called, and
> therefore the DSI host will still be powered up and the transfer won't
> fail.
>
> Actually I've just noted the comment at [3]. [2] is that framework fix
> that means that the magic workaround isn't required, but it will
> require this panel to opt in to the ordering change.

Cool. Glad that we can clean that up with your series.

Is it wrong to split unprepare to a disable and unprepare phase? I'm not
super keen on fixing 6.1 stable kernels by opting this driver into the
ordering change. Splitting the phase into two is small and simple and
works. I suspect changing the ordering may uncover more bugs, or be a
larger task. I'd be glad to test that series[2] from you to get rid of
[3].

>
>
> [1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#c.mip=
i_dsi_host_ops
> [2] https://patchwork.freedesktop.org/series/100252/
> [3] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/msm/dsi=
/dsi_manager.c#L47
>
