Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F352A3E89
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEFB6EC05;
	Tue,  3 Nov 2020 08:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22F46E051
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 02:38:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y14so12887168pfp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 18:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=z264cDYFI+SeiJ6z3FLe1vCBTpX+RvX219w85MXClXA=;
 b=VM5f6vS9Ds5kmcV7IbntoguOWe/gsnaaQQjAjT6piE/k16K/ngQwroHHuoNaiD5evP
 VRnDJDwgzXfscDZKJjaCyVUfNYfOMftRLj1N2u3zsu4b2U0NS03vZL5wu7aYHIpSsjQa
 +Z5YdGlpEXW/PauK5gcOtBrwihSxmRB8ydzNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=z264cDYFI+SeiJ6z3FLe1vCBTpX+RvX219w85MXClXA=;
 b=MfKi4lOMYTliosRcPH/id6lAubIfskRhsj/o6eUX5av7IZsISSMRz3oToXx8rBr0J6
 rveu0JA2/0BURDO7PtR33USVI41tv63uQ9YpFP/R+YGeSjsEcuh8FONlJpRfg+vFvTc0
 AEe/w6b+WeZAOzKehuVBycy3dxfCU8P/TFXUPjtilRD32rI1Z6Y+8YoBdo0G6V1ZScOd
 y/hs3vgV7R40j42yGui4gqzqZS0ikxAG6ZtqmwvvEY/HaYkf/W5sEB2JTRZ19wOmRPHt
 ynLIGrid7ow3yX2E81m7bUWs8YfKDTMatUt2OtQ5uEactUf2yWslBEO7bgkPmOcHz1ZO
 fZ1w==
X-Gm-Message-State: AOAM533T/B5ohwxh8OKygsnVq5t+zwsvFhOQGlrXo9hIuWtzV7vuUc9J
 EHQODBUmbT3Qxl2ehB8S+kgbcQ==
X-Google-Smtp-Source: ABdhPJxOkOF5LQQksAJsl+ExcPzpUCm/vLzwF2VQVdQNsL4wQRTYjH5fTzhbyNC1beTHBYjsxkR6sQ==
X-Received: by 2002:a17:90a:d584:: with SMTP id
 v4mr1422083pju.194.1604371109495; 
 Mon, 02 Nov 2020 18:38:29 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b67sm15041810pfa.151.2020.11.02.18.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 18:38:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <160436612483.884498.883110130131457033@swboyd.mtv.corp.google.com>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201101173741.GA1293305@ravnborg.org>
 <160436612483.884498.883110130131457033@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
From: Stephen Boyd <swboyd@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 02 Nov 2020 18:38:27 -0800
Message-ID: <160437110703.3965362.4640756202560708316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2020-11-02 17:15:24)
> Quoting Sam Ravnborg (2020-11-01 09:37:41)
> > Hi Stephen.
> > 
> > On Thu, Oct 29, 2020 at 06:17:34PM -0700, Stephen Boyd wrote:
> > > This patch series cleans up the DDC code a little bit so that
> > > it is more efficient time wise and supports grabbing the EDID
> > > of the eDP panel over the aux channel. I timed this on a board
> > > I have on my desk and it takes about 20ms to grab the EDID out
> > > of the panel and make sure it is valid.
> > > 
> > > The first two patches seem less controversial so I stuck them at
> > > the beginning. The third patch does the EDID reading and caches
> > > it so we don't have to keep grabbing it over and over again. And
> > > finally the last patch updates the reply field so that short
> > > reads and nacks over the channel are reflected properly instead of
> > > treating them as some sort of error that can't be discerned.
> > > 
> > > Stephen Boyd (4):
> > >   drm/bridge: ti-sn65dsi86: Combine register accesses in
> > >     ti_sn_aux_transfer()
> > >   drm/bridge: ti-sn65dsi86: Make polling a busy loop
> > >   drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
> > >   drm/bridge: ti-sn65dsi86: Update reply on aux failures
> > 
> > Series looks good. You can add my a-b on the full series.
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > I can apply after Douglas have had a look at the patches he did not r-b
> > yet.
> > 
> > Any chance we can convince you to prepare this bridge driver for use in
> > a chained bridge setup where the connector is created by the display
> > driver and uses drm_bridge_funcs?
> > 
> > First step wuld be to introduce the use of a panel_bridge.
> > Then add get_edid to drm_bridge_funcs and maybe more helpers.
> > 
> > Then natural final step would be to move connector creation to the
> > display driver - see how other uses drm_bridge_connector_init() to do so
> > - it is relatively simple.
> > 
> > Should be doable - and reach out if you need some help.
> > 
> 
> I started to look at this and got stuck at ti_sn_bridge_get_bpp(). Where
> can I get the details of the bpc for the downstream bridge or panel? Is
> there some function that can tell this bridge what the bpc is for the
> attached connector? I see that td_mode_valid() in
> drivers/gpu/drm/bridge/tc358775.c stores away the bpc from the incoming
> drm_display_info pointer but I'm not sure that is correct because can't
> that be called for various and not necessarily the one we're using?

Looking closer I see that tc358775 doesn't store away the incoming
value, it derives a bpc from what comes in. I guess it isn't really a
good example for this problem.

I tried to hack around this and convert this driver to use bridge funcs
with Vinod's msm patch underneath but now the encoder is invalid. I
wonder if something is wrong with how the msm display driver drives the
bridge and connector? That TODO in ti_sn_bridge_attach() makes me think
something else needs fixing. I'll send another patch series tomorrow on
top of this one that kicks off the conversion to bridge connector so we
can discuss there.

[    4.577814] [drm:dpu_core_perf_crtc_update:397] [dpu error]crtc-49: failed to update bus bw vote
[    4.603697] panel-simple panel: error waiting for hpd GPIO: -6
[    4.613106] dsi_calc_pclk: forcing mdss_dsi lanes to 1
[    4.619070] dsi_link_clk_set_rate_6g: Failed to set rate pixel clk, -22
[    4.625883] msm_dsi_host_power_on: failed to enable link clocks. ret=-22
[    4.632784] dsi_mgr_bridge_pre_enable: power on host 0 failed, -22
[    4.646235] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000370
[    4.655279] Mem abort info:
[    4.658249]   ESR = 0x96000006
[    4.661456]   EC = 0x25: DABT (current EL), IL = 32 bits
[    4.667047]   SET = 0, FnV = 0
[    4.670195]   EA = 0, S1PTW = 0
[    4.673430] Data abort info:
[    4.676401]   ISV = 0, ISS = 0x00000006
[    4.680347]   CM = 0, WnR = 0
[    4.683413] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000104f18000
[    4.690033] [0000000000000370] pgd=0000000104f21003, p4d=0000000104f21003, pud=0000000104f21003, pmd=0000000000000000
[    4.700941] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[    4.706672] Modules linked in: cdc_ether usbnet r8152 joydev mii
[    4.712866] CPU: 6 PID: 376 Comm: frecon Not tainted 5.10.0-rc2+ #5
[    4.719302] Hardware name: Google Lazor (rev1+) with LTE (DT)
[    4.725201] pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[    4.731390] pc : ti_sn_bridge_enable+0xa4/0x7ec
[    4.736047] lr : ti_sn_bridge_enable+0x54/0x7ec
[    4.740704] sp : ffffffc0109db960
[    4.744119] x29: ffffffc0109db990 x28: ffffffd216acb000 
[    4.749586] x27: ffffffd216854000 x26: ffffffd216acb000 
[    4.755046] x25: ffffffd2164e89d0 x24: 0000000000000000 
[    4.760508] x23: 0000000000000000 x22: ffffff8281de5080 
[    4.765970] x21: ffffff8281de56f0 x20: ffffff8281de5670 
[    4.771431] x19: ffffff8281de5090 x18: 0000000000000484 
[    4.776893] x17: 0000000000000000 x16: 0000000000000001 
[    4.782355] x15: 0000000000000010 x14: 0000000000000000 
[    4.787816] x13: 00000000000013a8 x12: ffffff828208f950 
[    4.793277] x11: ffffff82818e1d80 x10: 0000000000000000 
[    4.798738] x9 : 0000000000000002 x8 : 0000000000000002 
[    4.804200] x7 : ffffffc0109db978 x6 : 0000000000000001 
[    4.809660] x5 : 0000000000000001 x4 : ffffffd2166b6388 
[    4.815122] x3 : 0000000000000001 x2 : ffffffd216680dab 
[    4.820584] x1 : 0000000000000010 x0 : ffffff8280ceac00 
[    4.826046] Call trace:
[    4.828568]  ti_sn_bridge_enable+0xa4/0x7ec
[    4.832886]  drm_atomic_bridge_chain_enable+0x7c/0xa4
[    4.838095]  drm_atomic_helper_commit_modeset_enables+0x19c/0x23c
[    4.844360]  msm_atomic_commit_tail+0x308/0x6e8
[    4.849017]  commit_tail+0xa8/0x140
[    4.852608]  drm_atomic_helper_commit+0xf8/0x100
[    4.857354]  drm_atomic_commit+0x50/0x5c
[    4.861385]  drm_atomic_helper_set_config+0xcc/0xd4
[    4.866398]  drm_mode_setcrtc+0x280/0x5c0
[    4.870519]  drm_ioctl_kernel+0xa0/0x118
[    4.874549]  drm_ioctl+0x240/0x3dc
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
