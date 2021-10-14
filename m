Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEE42CF7A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6086D6EC05;
	Thu, 14 Oct 2021 00:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93466EC05;
 Thu, 14 Oct 2021 00:17:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r7so13883250wrc.10;
 Wed, 13 Oct 2021 17:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rDjhWTWe39jI0tVaVsIwJu3w3RaWMLFlHZz3rzeOD24=;
 b=JdOQHZ5ZtzM7ARgznKsyJUwSb6+PhHX717J520KvwRnhOeNpb9yzZ5tCkg7Gs8ppT/
 j7YUIMyKCtwBIeECn2FQ0OccTpq7g3FCOunnde/dNNXxD3eXZ5RyPUA+Xf5NNQ/aAlmi
 4nup7/mgOd4XCYrd/RrMPlrVTqtDehBLy4MV93u1PBSHzqLbykFKspgxX4RAAZShbEhG
 UqSWtS8UtzS2i69ifjwVeoneGrpdohfkKPo1KKQTINqw+7sVQU7m9krAiRY2TeFV0XIv
 Nr4dXWccAp23SzFr7YgvjfBfR1QUK/ZAio/Yp/tIGKB12rpowHKdQD67l8pVPU5wZEtX
 07tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rDjhWTWe39jI0tVaVsIwJu3w3RaWMLFlHZz3rzeOD24=;
 b=P4Pf8WtzH17bOWXLhlLilsOTg/cjWjIKnnXVWN2r7lF/1qo1VL3xYnd29ecFTEtDmT
 A1xLtzjeaI4cG+qvLed0OlyLoUEHiziuDDa2qqiLIZE9hrkhk4vbfoSn7ZIsx3mOXYfo
 VothgSj7SdqFhLt8OX8zhJqZszwg6Sk+8U1QCF2YenjzgqhzXoELb+kuj9r2dTlW6S02
 HdibzQmsOQBgfL60cMwhLEJd5vOlzG87VS3J+BGpACDxWxx/O66SwMYDBzo1yvBH4oMo
 I2XA1bXAUuv/b0S+uSlh+bLydVrcPogoOSl1Ds2Cx7a8DsXUa4ILt2BICgCfDotA/ob/
 xLqA==
X-Gm-Message-State: AOAM531mGX8B7AZH5uq+NVUya1hHiKP1ZxvTYQBFP0PKscFKygMwFz0M
 Ks1WWOIUETQIzlwQMzXhxK3iUi3ypzPHzbNws4o=
X-Google-Smtp-Source: ABdhPJxMNHNuDB+MA25s5aKeg0eD+rF7A5Qv31Rug4l1a5QZcltnDBgAHkjG+aO4fe51kSoiOYUxF2G1qCWgjpVJxas=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr75000wmb.101.1634170631010;
 Wed, 13 Oct 2021 17:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
 <YXiZIuao6wNch7j-D3ZktdSR3_IRAQ3oSeL8sLCCX8lEhwsoWaouE6_eV6C2Zv9r2_dww_Mtal18UBJfc4fz4g==@protonmail.internalid>
 <CAMi1Hd0sUUFvNzYwt29af9d99o1-x+LiXBPCrQ8=9H0tHvxVHg@mail.gmail.com>
 <b57fbc24-9ef3-a57b-17d4-2cb33fb409d4@linaro.org>
 <20211013141629.qfeqwsyi5yobzjca@gilmour>
In-Reply-To: <20211013141629.qfeqwsyi5yobzjca@gilmour>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 13 Oct 2021 17:16:58 -0700
Message-ID: <CAF6AEGu2CyQA6XZ=r4c9Z0tiiPUxyhTf0OAu3v6w0oswJ3567w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 00/24] drm/bridge: Make panel and bridge
 probe order consistent
To: Maxime Ripard <maxime@cerno.tech>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 Amit Pundir <amit.pundir@linaro.org>, 
 John Stultz <john.stultz@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <sean@poorly.run>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 lkml <linux-kernel@vger.kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>, 
 Inki Dae <inki.dae@samsung.com>, 
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Joonyoung Shim <jy0922.shim@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 7:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Caleb,
>
> On Thu, Sep 30, 2021 at 09:20:52PM +0100, Caleb Connolly wrote:
> > Hi,
> >
> > On 30/09/2021 20:49, Amit Pundir wrote:
> > > On Thu, 30 Sept 2021 at 04:50, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > >
> > > > > On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > The best practice to avoid those issues is to register its functions only after
> > > > > > > > all its dependencies are live. We also shouldn't wait any longer than we should
> > > > > > > > to play nice with the other components that are waiting for us, so in our case
> > > > > > > > that would mean moving the DSI device registration to the bridge probe.
> > > > > > > >
> > > > > > > > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > > > > > > > would be affected by this and wouldn't probe anymore after those changes.
> > > > > > > > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > > > > > > > requires to be tested), but the changes in msm seemed to be far more important
> > > > > > > > and I wasn't confortable doing them.
> > > > > > >
> > > > > > >
> > > > > > > Hey Maxime,
> > > > > > >    Sorry for taking so long to get to this, but now that plumbers is
> > > > > > > over I've had a chance to check it out on kirin
> > > > > > >
> > > > > > > Rob Clark pointed me to his branch with some fixups here:
> > > > > > >     https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> > > > > > >
> > > > > > > But trying to boot hikey with that, I see the following loop indefinitely:
> > > > > > > [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
> > > > > > > [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
> > > > > > > [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
> > > > > > > [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
> > > > > > > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
> > > > > > > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
> > > > > > > [    4.681898] adv7511 2-0039: failed to find dsi host
> > > > > >
> > > > > > I just realized Rob's tree is missing the kirin patch. My apologies!
> > > > > > I'll retest and let you know.
> > > > >
> > > > > Ok, just retested including the kirin patch and unfortunately I'm
> > > > > still seeing the same thing.  :(
> > > > >
> > > > > Will dig a bit and let you know when I find more.
> > > >
> > > > Did you have a chance to test it on anything using drm/msm with DSI
> > > > panels?  That would at least confirm that I didn't miss anything in
> > > > the drm/msm patch to swap the dsi-host vs bridge ordering..
> > >
> > > Hi, smoke tested
> > > https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> > > on Pocophone F1 (sdm845 / A630) with v5.15-rc3. I see no obvious
> > > regressions in my limited testing so far including video (youtube)
> > > playback.
> > Tested on the OnePlus 6 too booting AOSP, works fine. This *fixes*
> > FBDEV_EMULATION (so we can get a working framebuffer console) which was
> > otherwise broken on 5.15.
> >
> > However it spits out some warnings during boot: https://p.calebs.dev/gucysowyna.yaml
>
> Thanks for testing. It looks like the runtime_pm ordering between the
> msm devices changed a bit with the conversion Rob did.
>
> Rob, do you know what could be going on?
>

Not entirely sure.. I didn't see that first splat, but maybe I was
missing some debug config? (The 2nd one is kind of "normal", I think
related to bootloader leaving the display on)

BR,
-R
