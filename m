Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1FB44EB69
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 17:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C6E6EBB7;
	Fri, 12 Nov 2021 16:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB0E6EBB7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 16:32:16 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id x9so9505130ilu.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 08:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZQU60Xp18Hdsmtr7VDsvNRYsO9Fr9Pv2XyHmxjj+mM=;
 b=KuCqVetYf798pzMpcifYfYBDXK7mJj8RA51iDj8N5l+Hr6lkTUxdpghhQ5jIk36Mth
 wl4kFkIE3mufICbUYUMyO5l9GhOWg2rrWnFEOtLxzTSdv7cJuUBFXVOo/o8RLBg3Siw8
 LyHz6ZvZjh2sGHFGCifhnNbxYDuwOX6YT1ZVEMevpd7LFwXs1Rmu9k8DS/5n1pBmSMTT
 GjeArjcZePLAIQdrnN+IKo11faF3a5gjiLW7Px3vgI8g53ptQX9AJvBHmsU4ZWDM1zfv
 DQ4Nyq7pXqwd9oFi+UH9P7wsxxQIPhTb4a23Fea4vkvRAKmOI1GxAlJ7R/uy8IamChq4
 Yhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZQU60Xp18Hdsmtr7VDsvNRYsO9Fr9Pv2XyHmxjj+mM=;
 b=O3QdRWqwsqMrIjXEYAhbxrpYxXiOoeBg7JywvL1T4ep+tkWNf46j+ot/9VtIpKSm1f
 YtJcsGl6IXrUWNLVU+2O2GCJcfx3NBV+BaKMRn7rfYd0/PU1BU/8qi6ytlEDvByWB1e/
 eZbv9UzDq5qAzaZ0bfkkv0aJHBJF8nOfVr+dgW4ubjRmLcMMcV3QylEzgpUfWQTSUMhO
 JZWYaIUXLkXZKw39kc3GhmpF7AlVqNXMEG/MLEirPKuGHp/lTfwlnCdxMZ1SikjmdTyl
 2sKEaNfMTYSDONJtj3srFqapJujahOKis1GPeUTMRftFYk0c+5cbLZddM3T/OzRrJkne
 JUEQ==
X-Gm-Message-State: AOAM530DmclEA+MNrTJbgvOQGSL/bmn5TRpB6zfd7aOt4s7Hy2Syz/rS
 t2xG/OBVwrzdO2nmWgfeiWJ+kEl7UyCjZpuQ+UHEPw==
X-Google-Smtp-Source: ABdhPJx2vazsN9hiP4Pi5PPRhbKghUbvJI/jrMtOuxA3B6w+bLX6dIBky+qiit4PlBLgRfNrY9wQl1QF0SBSxiEolaQ=
X-Received: by 2002:a05:6e02:144e:: with SMTP id
 p14mr9934206ilo.180.1636734735453; 
 Fri, 12 Nov 2021 08:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20211112084302.2447931-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20211112084302.2447931-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 12 Nov 2021 08:32:04 -0800
Message-ID: <CAD=FV=XWdA5kC5VpRPNWzCQDJjmDg5s7bP=sa7yVuqnRcxWf+w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Fix additional suspend/resume
 at bootup
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, philipchen@chromium.org, jonas@kwiboo.se,
 airlied@linux.ie, robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, swboyd@chromium.org, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 12, 2021 at 12:43 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Through log and waveform, we can see that there will be additional
> suspend/resume when booting. This timing does not meet the ps8640 spec.
> It seems that the delay of 500ms does not satisfied drm_panel_get_modes.
> I increased it to 900ms and it seems that this problem can be solved.
> To be safe, I'd just round up to a full 1000.

Do be clear: I'm still not convinced that the old 500 ms actually
causes any real problems. I think someone is just measuring with a
scope and upset that they see the device power on and then power off
again. In any case, if we can avoid an extra power cycle at boot then
that seems sane to me. Since this is a tiny change, I'll plan to merge
it some time next week unless someone yells.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
