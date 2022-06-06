Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBED53EF6D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 22:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C0C10E48F;
	Mon,  6 Jun 2022 20:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C17510E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 20:19:11 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id v1so20428855ejg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 13:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HCWIcD+SfRMw/M9RRt+jg58AphPseq4gfsJ1F6OVZZU=;
 b=L64JkmvDNh1FIACsNToXduJszZ5RYI3mnVnXlEJgBMBcVUIJznBmtDp/P0EKumXSX/
 zad6k3tZainA3cYz+aKtsb03+xotN0Og3MtfFmorTrxvRWwPwuEKwx8H4Vj5ghwhAf3G
 CWzDhBbC4GdfPTWfSGrqktycegGjlYT4PyutU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HCWIcD+SfRMw/M9RRt+jg58AphPseq4gfsJ1F6OVZZU=;
 b=vD0vXidGKGNym7hZ5KxKWaumkQM4toPtAwNkwio/9ZVs+s7Zayloh5Dqa3zUgYzL6k
 mbx0P7zjd4tpezv4rjcPqnzBIDRc9Jjf6IAtFxz9NPYyhhL+NoMwaY2xuXkcFjHf+X+i
 V/XuqNw2Mwt2e5TZlsblupsfCnZCuwNFmcAcfff3+2Ru2JP8ad2voS1UbiHe87nA/5V1
 qNf/xikqTY9x5SgXzIK0z7W2H9291FrIfZeaTQg/BK/4YMEwsVNSLEd5x1CRpZK2wXL/
 OME4j5tBiSw9DPUJcKOVP+5N5fOlatBcOILjk5bwxSUae+EgmSAwI76KvCXBA0yHDL0E
 Jpdg==
X-Gm-Message-State: AOAM530QSVAHSXXCVKfYTdRQomjk7pPf+mVI0urCWKMOljhceyzS5mmG
 TeByPiuhkqc2/Ol5KkTs7jDKCiVqeTEKxo40fzc=
X-Google-Smtp-Source: ABdhPJx9y+FM9OqS9/eASFBuv6HV+VVZ4rCJwfTRsP542NzLCriPVyWGifTakDP1xf80CrnwgfNo7A==
X-Received: by 2002:a17:907:ea9:b0:710:9003:9b33 with SMTP id
 ho41-20020a1709070ea900b0071090039b33mr12614206ejc.175.1654546749545; 
 Mon, 06 Jun 2022 13:19:09 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 i7-20020a17090685c700b007104b37aab7sm3816721ejy.106.2022.06.06.13.19.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 13:19:09 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id z17so3381859wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 13:19:09 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr14648542wmd.118.1654546319242; Mon, 06
 Jun 2022 13:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
In-Reply-To: <20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 13:11:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKWNeXzDZ=DdXi=U218xghLJAeAQah_uFOjM9WrGZ5sQ@mail.gmail.com>
Message-ID: <CAD=FV=VKWNeXzDZ=DdXi=U218xghLJAeAQah_uFOjM9WrGZ5sQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/probe-helper: Default to 640x480 if no EDID on DP
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 1, 2022 at 11:23 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> If we're unable to read the EDID for a display because it's corrupt /
> bogus / invalid then we'll add a set of standard modes for the
> display. Since we have no true information about the connected
> display, these modes are essentially guesses but better than nothing.
> At the moment, none of the modes returned is marked as preferred, but
> the modes are sorted such that the higher resolution modes are listed
> first.
>
> When userspace sees these modes presented by the kernel it needs to
> figure out which one to pick. At least one userspace, ChromeOS [1]
> seems to use the rules (which seem pretty reasonable):
> 1. Try to pick the first mode marked as preferred.
> 2. Try to pick the mode which matches the first detailed timing
>    descriptor in the EDID.
> 3. If no modes were marked as preferred then pick the first mode.
>
> Unfortunately, userspace's rules combined with what the kernel is
> doing causes us to fail section 4.2.2.6 (EDID Corruption Detection) of
> the DP 1.4a Link CTS. That test case says that, while it's OK to allow
> some implementation-specific fall-back modes if the EDID is bad that
> userspace should _default_ to 640x480.
>
> Let's fix this by marking 640x480 as default for DP in the no-EDID
> case.
>
> NOTES:
> - In the discussion around v3 of this patch [2] there was talk about
>   solving this in userspace and I even implemented a patch that would
>   have solved this for ChromeOS, but then the discussion turned back
>   to solving this in the kernel.
> - Also in the discussion of v3 [2] it was requested to limit this
> 83;40900;0c  change to just DP since folks were worried that it would break some
>   subtle corner case on VGA or HDMI.
>
> [1] https://source.chromium.org/chromium/chromium/src/+/a051f741d0a15caff2251301efe081c30e0f4a96:ui/ozone/platform/drm/common/drm_util.cc;l=488
> [2] https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> I put Abhinav's Reviewed-by tag from v2 here since this is nearly the
> same as v2. Hope this is OK.
>
> Changes in v4:
> - Code is back to v2, but limit to just DP.
> - Beefed up the commit message.
>
> Changes in v3:
> - Don't set preferred, just disable the sort.
>
> Changes in v2:
> - Don't modify drm_add_modes_noedid() 'cause that'll break others
> - Set 640x480 as preferred in drm_helper_probe_single_connector_modes()
>
>  drivers/gpu/drm/drm_probe_helper.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Pushed to drm-misc-next after cleaning up the turd that I somehow left
in the commit message.

fae7d186403e drm/probe-helper: Default to 640x480 if no EDID on DP

-Doug
