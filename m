Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF94C7125
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 17:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCB210E464;
	Mon, 28 Feb 2022 16:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383D610E464;
 Mon, 28 Feb 2022 16:01:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 206so67594wmc.5;
 Mon, 28 Feb 2022 08:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aizF1/4lDI+yEy/WBxd8YVF7MFTOczvWHCG6YamD9nM=;
 b=blm/2RrpCx2TsR/aMRP+1EJLebTjElVVfw8i40QiGlQMN6Wi4MltaOd+UtUI+4NfFD
 OvIwLBmq5XdskxKXmbGsJfayfiwvCeecqgTkJnMpwimuFXPulAUNE5iV9YhTJHFU95qd
 n8Ndhugd5pEd90a++PIz8mlF56J1Vx6yIEFPX+C6J9mqn75oWffmgBOskCPhEa/qDNwj
 ZlMyqEqVWCIDC3l31oKWlahqUm6m8aW6WF/ezxGwyoiXUJpvyrkNusfWFeucWTq4hyqF
 NmcFd8Opv10P0TT05CAnQEmiN4DKlzGYCa/ykxZRnKFOiNgFKfuA0gi+i9kuNYXp58M1
 1Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aizF1/4lDI+yEy/WBxd8YVF7MFTOczvWHCG6YamD9nM=;
 b=kHNn2KYu7r0K39dCjg2ybAr2ToiFooQMYJMTu+jeuJnRPuHMo6u6JXUanrmUl8o/B8
 tO5K4tAXeiQm5J/6CpsiwUVnfJSUayqFzzhiqAwnbKPSdeoFVGp2BfY0VunVfINQ1e1Q
 5VofE/W1udJ08uKeU9W0o2vY27kFxivGtd4M4CnUTQjW7deUOXLm9S1hZkW2Bsq0l6tk
 ZhRuT8gpgjc53EX0UkdR13y/xrfIh6ji+BbAzm8SEXrGobdusphr/VEwDL95OUjYbpfb
 h4p5d51UZ2WcxXjJplSrTejs74hCGFsRtrcWxWA/wo9y/C0HYz61hwyYiJW5Vgtz9r34
 qttg==
X-Gm-Message-State: AOAM532exjmASHrNnawSUg8aneHO7nNP6T6Gs2lkSlk3/dscW9Ehabc/
 PAsNsJVn81GpCu2i0gYwkna5vEBlR7J+KW6CDF4=
X-Google-Smtp-Source: ABdhPJzF+Eh23FRqoZaEV8ax1NSHQUu83RaAE2w3foKNDynSteZKOLsVwgh4y2QhxxN5kXgYFvHjBSOQuJyfTdpPugo=
X-Received: by 2002:a05:600c:25cd:b0:381:4f09:a4b6 with SMTP id
 13-20020a05600c25cd00b003814f09a4b6mr8198514wml.44.1646064063544; Mon, 28 Feb
 2022 08:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20220225202614.225197-1-robdclark@gmail.com>
 <20220225202614.225197-3-robdclark@gmail.com>
 <CAF6AEGvXs9etrtBUP5fAx7z6pLMV76a-FEXrdk2gY8npDHrFnA@mail.gmail.com>
 <f460b115-6ff6-7f69-8b0d-174c4defc771@linux.intel.com>
In-Reply-To: <f460b115-6ff6-7f69-8b0d-174c4defc771@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Feb 2022 08:01:34 -0800
Message-ID: <CAF6AEGsNHkODt4oOgAhLdrik1Jt-cfcyjk+nGzDhSMNfFMEWsA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Expose client engine utilization via fdinfo
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 6:33 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 25/02/2022 22:14, Rob Clark wrote:
> > On Fri, Feb 25, 2022 at 12:25 PM Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> Similar to AMD commit
> >> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> >> infrastructure added in previous patches, we add basic client info
> >> and GPU engine utilisation for msm.
> >>
> >> Example output:
> >>
> >>          # cat /proc/`pgrep glmark2`/fdinfo/6
> >>          pos:    0
> >>          flags:  02400002
> >>          mnt_id: 21
> >>          ino:    162
> >>          drm-driver:     msm
> >>          drm-client-id:  7
> >>          drm-engine-gpu: 1734371319 ns
> >>          drm-cycles-gpu: 1153645024
>
> Nice, so my vendor agnostic actually worked (with that single fixup of
> accounting for the fact pdev tag is optional)?
>
> > Note that it might be useful to have a standardized way to report # of
> > cycles and max freq, so userspace tool can derive %utilization in
> > addition to just %busy
>
> How do you define %utilisation vs %busy - I don't exactly follow since I
> see the two as same?

so, say you are running at 50% of max clk, and gpu is busy 70% of the
time.  The utilization is only 35% because the gpu could scale up the
clk to get more work done.

> Looking at your patch I guess I don't understand the difference between
> 'elapsed' and 'cycles' inside your retire_submit(). Both are scoped to a
> single context and are not global? If 'elapsed' is time context has
> spent on the GPU, cycles isn't the same just in a different unit?

Correct, we capture (from GPU cmdstream) two counters both before and
after a submit (aka execbuf) runs, one is a fixed-rate counter, which
gives us elapsed time.  The second is a counter that increments every
clk cycle, which gives us the # of cycles.  With the two values, we
can calculate GPU frequency.

BR,
-R

> Regards,
>
> Tvrtko
>
