Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01F36FFBF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 19:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1AF6E4F3;
	Fri, 30 Apr 2021 17:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0A56E4F1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 17:37:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x2so5349389lff.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 10:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IyZoGH+lT+P8SU23gcGGsIVn6bGEnFnAdvfYbbDN9to=;
 b=ryDFnWPDNEvnvXwTf0jcPPjjEXrVhjstRilHvsIA8HyK6O52T+H+wQ8OPQWWOwaWB8
 CE9qwQA0/2kiylTlZnPXkbNG4DrQxLyX8gS5wTYZX0aMkmGTeckUGp+xCUcixrb7nKv0
 z+mzVNUzvNKMXuro8JYl2HXNj2O20xvQLqllwQ5eYrlTm/Z/lpyJeVqbqW/9JsK2knKU
 5LNmpveMyCCZbDUYFU695phQaFMgAMzzwWVCO2vUFO8DQAzgYvMxBI2ItJcnSrY6OYxp
 SuRvUyWbEJIA/FcRCNQ5QW1ydXUp1tjV7ZyQmbNjtaVj15WO2SnS3LgH1s7CCIG1SPbZ
 eMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IyZoGH+lT+P8SU23gcGGsIVn6bGEnFnAdvfYbbDN9to=;
 b=bZAhLxC09oUwZIJaJopFSBTEcNAFf/DoI/I2hxl7SD/EqUb4G7CjuljfsF8po4I5UJ
 SuUl61XL2+nNnSHY20pBucneQN3qYvn1JA8q8pCzlgKPRAOkwSrWdaxHNbNdWKmh0vK4
 9BfkyHUO2dKNUoj3sMYbTytzRcZZ1U2+gZg5ntMclWE7aGy5BTKyswfHbE5RUMHDpLh1
 DaxP2dYHT22WpypphG/mNJb+cOzjlRegvCo6wC1ukHsj1D36F1ckwGRhh/iE6uGqerlw
 UR2VRxJfBffj7HHqAZEMuwPiBB6dwgI1ypRutl5BZKmpMD+nwHNC1ejyHuRiWJIqZ6S3
 qPKg==
X-Gm-Message-State: AOAM532Zhy9jlyNVeihrRLcQuEuejJxthfBvH+RDyXiaRG4suQrxHjlE
 PPFZcAJHKzSGbfAigDXodS0MzvV/8xBXfLuSodg3Ig==
X-Google-Smtp-Source: ABdhPJyrJphBLygkbPOqBlyI3KGd158lA8+tnQCVqwm0BWpVup5VBgWBQRQB0f1PP1xd/VB51Pqr4tiWIdyHtQCG6fQ=
X-Received: by 2002:ac2:593b:: with SMTP id v27mr3358056lfi.204.1619804253808; 
 Fri, 30 Apr 2021 10:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210430171744.1721408-1-robdclark@gmail.com>
In-Reply-To: <20210430171744.1721408-1-robdclark@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 30 Apr 2021 10:37:22 -0700
Message-ID: <CALAqxLU=zsaMuBikeEzjtgNFAcxZGdqMhETBHvveNC_JZ=B7JA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Delete bonkers code
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Hongbo Yao <yaohongbo@huawei.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@linux.ie>,
 Qinglang Miao <miaoqinglang@huawei.com>, Maxime Ripard <maxime@cerno.tech>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 10:14 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> dpu_crtc_atomic_flush() was directly poking it's attached planes in a
> code path that ended up in dpu_plane_atomic_update(), even if the plane
> was not involved in the current atomic update.  While a bit dubious,
> this worked before because plane->state would always point to something
> valid.  But now using drm_atomic_get_new_plane_state() we could get a
> NULL state pointer instead, leading to:
>
>    [   20.873273] Call trace:
>    [   20.875740]  dpu_plane_atomic_update+0x5c/0xed0
>    [   20.880311]  dpu_plane_restore+0x40/0x88
>    [   20.884266]  dpu_crtc_atomic_flush+0xf4/0x208
>    [   20.888660]  drm_atomic_helper_commit_planes+0x150/0x238
>    [   20.894014]  msm_atomic_commit_tail+0x1d4/0x7a0
>    [   20.898579]  commit_tail+0xa4/0x168
>    [   20.902102]  drm_atomic_helper_commit+0x164/0x178
>    [   20.906841]  drm_atomic_commit+0x54/0x60
>    [   20.910798]  drm_atomic_connector_commit_dpms+0x10c/0x118
>    [   20.916236]  drm_mode_obj_set_property_ioctl+0x1e4/0x440
>    [   20.921588]  drm_connector_property_set_ioctl+0x60/0x88
>    [   20.926852]  drm_ioctl_kernel+0xd0/0x120
>    [   20.930807]  drm_ioctl+0x21c/0x478
>    [   20.934235]  __arm64_sys_ioctl+0xa8/0xe0
>    [   20.938193]  invoke_syscall+0x64/0x130
>    [   20.941977]  el0_svc_common.constprop.3+0x5c/0xe0
>    [   20.946716]  do_el0_svc+0x80/0xa0
>    [   20.950058]  el0_svc+0x20/0x30
>    [   20.953145]  el0_sync_handler+0x88/0xb0
>    [   20.957014]  el0_sync+0x13c/0x140
>
> The reason for the codepath seems dubious, the atomic suspend/resume
> heplers should handle the power-collapse case.  If not, the CRTC's
> atomic_check() should be adding the planes to the atomic update.

Thanks! This patch gets things booting again!

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
