Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E37700E54
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 20:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB57410E208;
	Fri, 12 May 2023 18:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E5710E221
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 18:03:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4ec8149907aso11986502e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683914588; x=1686506588;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=wX35csAzyFHnVisSwqQUmM55/FGS5IjRbvk+3PARSIY=;
 b=LkIyLmh7YkVvVJ6EY/UaSJfOCHOZ7lrPp1AXhNw+dBTO64ls2762UQMe8Wg75N8uqO
 etv7DfqD8OdH/pp2S3wkVip4CUpj/yR8ezy/NKnhg1mfOOtBKWC6boc4DDvx1alg2hcZ
 EXlclIBCqttJZ5IdHJB/W+2DJzWqpJ0U0i6fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683914588; x=1686506588;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wX35csAzyFHnVisSwqQUmM55/FGS5IjRbvk+3PARSIY=;
 b=URsnTvGNMbJPZjg1GXw8lrNDX0JlY4TsDyJ7s2+F2LmseegNYN8A/3Go5mWmyXJTHY
 lRAUSl5BJFwRZrpbKhhdEXv4HbpUCRk5EaMzwKZBBrUT1l+1qdKxJoLXVkWwCpe0qV1d
 HViOtCiFjeN9e8/oG4ObIJDHk/kOM5McEiUjUX0lF/6sPSwReCK5x5nogKinyPa72/If
 vLrUwk7F5uaqb7OgjFO1tOM7L7VYeVZ1jnwxiAezXb/TiMendFyNtp2AWXVvc3WLqWpr
 wHQWgnm1ntNlLtb8ZYB5khRbD7AlVWj6uzyt+JaFdN0S+2NSWsJR/ZDSqy8yIS0losjD
 XMlQ==
X-Gm-Message-State: AC+VfDwiin09s1ihk4OF+ebutobhStPjsAxtT7ljHjYBpOSQuxF+mUqG
 4dDWZg+z/rOmQWUhwCmp27MQ7S3TmrH6NWoq6l+QAA==
X-Google-Smtp-Source: ACHHUZ6PaqBOAHi370NUX7PmynPhgX949UwtsRLRySAJxMzlzmUq+lXxvttUdtc5tbCV15gkYvMmpUGa1Yv56ikLq3U=
X-Received: by 2002:a05:6512:21a9:b0:4eb:30f9:eeca with SMTP id
 c9-20020a05651221a900b004eb30f9eecamr3740062lft.28.1683914587723; Fri, 12 May
 2023 11:03:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 May 2023 11:03:07 -0700
MIME-Version: 1.0
In-Reply-To: <CAA8EJpokAoGni7vNwuijs7EvmjCweO3pgChij3Qx3OUkVTVpiQ@mail.gmail.com>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprtQF0x_LCOTrt5bvRnJ+xRz6QxLF6QAP-4Pff6V5TJ2g@mail.gmail.com>
 <20230511155331.2jmfe7xcs5tihdgb@ripper>
 <5ef83699-01de-d062-6239-9bb834c70458@linaro.org>
 <8ac0b5f5-27da-2b28-8f10-b2fca447511a@quicinc.com>
 <CAA8EJpokAoGni7vNwuijs7EvmjCweO3pgChij3Qx3OUkVTVpiQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 12 May 2023 11:03:07 -0700
Message-ID: <CAE-0n51SHQhUJiY=BJp8CQQ1aTAOxeMDr2+NX_vpmjN_cyJJrA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/msm/dp: enable HDP plugin/unplugged interrupts
 to hpd_enable/disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-05-11 17:54:19)
> On Fri, 12 May 2023 at 03:16, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > 1) DP with GPIO: No downstream drm_bridge are connected, is_edp = false
> > and internal HPD-logic is in used (internal_hpd = true). Power needs to
> > be on at all times etc.
> >
> > 2) DP without GPIO: Downstream drm_bridge connected, is_edp = false and
> > internal HPD-logic should not be used/enabled (internal_hpd = false).
> > Power doesn't need to be on unless hpd_notify is invoked to tell us that
> > there's something connected...
> >
> > - dp_bridge_hpd_notify(). What is the point of this check? <== i have
> > below two questions,
> >
> > 1) can you explain when/what this dp_bridge_hpd_notify() will be called?
>
> The call chain is drm_bridge_hpd_notify() ->
> drm_bridge_connector_hpd_notify() -> .hpd_notify() for all drm_bridge
> in chain
>
> One should add a call to drm_bridge_hpd_notify() when the hotplug
> event has been detected.
>
> Also please note the patch https://patchwork.freedesktop.org/patch/484432/
>
> >
> > 2) is dp_bridge_hpd_notify() only will be called at above case #2? and
> > it will not be used by case #1?
>
> Once the driver calls drm_bridge_hpd_notify() in the hpd path, the
> hpd_notify callbacks will be called in case#1 too.
>
> BTW: I don't see drm_bridge_hpd_notify() or
> drm_kms_{,connector_}_hotplug_event() HPD notifications in the DP
> driver at all. This should be fixed.
>

Is dp_bridge_hpd_notify() being called by
drm_helper_probe_single_connector_modes() when the connectors are
detected?

I see drm_helper_probe_detect() calls connector->funcs->detect() which I
think calls
drm_bridge_connector_funcs::drm_bridge_connector_hpd_notify() but I
haven't confirmed yet. The 'detect' bridge is the DP bridge in msm
driver

         if (!dp_display->is_edp) {
                bridge->ops =
                        DRM_BRIDGE_OP_DETECT |

so if the bridge_connector is being used then I think when fill_modes()
is called we'll run the detect cycle and call the hpd_notify callbacks
on the bridge chain.
