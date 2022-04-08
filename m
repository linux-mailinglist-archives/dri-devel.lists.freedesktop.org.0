Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E57864F9244
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3733D10EEFF;
	Fri,  8 Apr 2022 09:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D920010EF3E;
 Fri,  8 Apr 2022 09:50:57 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bq8so16179074ejb.10;
 Fri, 08 Apr 2022 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UTDP5PxuJrNhtwiIw4kPX3oornzx0fZUq1ACNZdju5g=;
 b=oSzOmpZ+P66fuPaE0vyi8SUeW9IBkGVgrCfg2WtxLRjCFyFBI+PN3wXaNfFZWSpyL2
 3bPRWlApOdFalecgK1ltupG8ZnnagEh5pMlrsy/DIKG7EChbPbJ66IdU4srfD7OuBw1g
 bGSWN0fnoMnu/rL7+VSj0BtCta1WiCkqxNwqVnDTkH9SxRpH5Yt5kPS5ZGBdmNHe6yOZ
 sKK7X0An9d8BXqS/AhOFC6hvqpxy61XbfQ6ZqIskb6F92Jc4Fk14Gr8Gz7gOp/DGJJ/J
 TNm15y7O7cCIP7g5/USWI7lPcYlmlie6pmS9nlzxO7yc0kXm1+1JNOWtmmHnYwtmqUCI
 YFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTDP5PxuJrNhtwiIw4kPX3oornzx0fZUq1ACNZdju5g=;
 b=nYT6VjO+Cqg9VDD0Xpp1zGiiSfqVl/am7TJOMG/csxQhPo+3OaVSyZErGX8EOhD75V
 tGtEIoCQnoCjiuNgr3dQPGT634FR08Wqi9SGFG0zyI2VrNtDz2whDKttwMwcU9A5INfo
 7WPxdKzBsqnMCNgdzOuY5uxH5kS2ZpZUx2jVU7zVpOm5X82kguk/a5HcYFZlido0z96C
 Df9j/yb1+6vsc4idqkSQ9Qa2vuPeX2cUVFbfTrCDA941GuuATYQsvkI1k26oxc/WQ8k7
 s4CZLFw3JMsZUe3hT+6w3c+BiecZIjetPvkvBu6SHDHHWJuCriLnr6P8RhhuWxFfAeyq
 MO6w==
X-Gm-Message-State: AOAM53299BGgkNCarWZ/Ip1EUkMYPa7mj1fVfvXQG10I3v4ALWrKEHkC
 2yfzfrIOEi3B63qVr47qe1S+vSJliBbFDiHxzTM=
X-Google-Smtp-Source: ABdhPJyAoQKrVZDAh1z+M8F5kkP4azVx+dQWCPnP3y8cew9bhU+ZQlwfEvMyF8THi53mytdvPyU1H4sO+NPpuc7vyMk=
X-Received: by 2002:a17:906:478b:b0:6db:8b6e:d5de with SMTP id
 cw11-20020a170906478b00b006db8b6ed5demr18052634ejc.161.1649411456228; Fri, 08
 Apr 2022 02:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
 <20220407151627.3387655-2-tvrtko.ursulin@linux.intel.com>
 <Yk/rHyGrOlrkDtdR@phenom.ffwll.local>
 <b9fd2365-9412-b496-6e41-757d6d5d0f0c@linux.intel.com>
In-Reply-To: <b9fd2365-9412-b496-6e41-757d6d5d0f0c@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Apr 2022 19:50:45 +1000
Message-ID: <CAPM=9tyJTMBidxLip9XkJjYPNr5s7=oQqLYo9++UtHEemR9DQQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/i915: Inherit submitter nice when scheduling
 requests
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 18:25, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 08/04/2022 08:58, Daniel Vetter wrote:
> > On Thu, Apr 07, 2022 at 04:16:27PM +0100, Tvrtko Ursulin wrote:
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Inherit submitter nice at point of request submission to account for long
> >> running processes getting either externally or self re-niced.
> >>
> >> This accounts for the current processing landscape where computational
> >> pipelines are composed of CPU and GPU parts working in tandem.
> >>
> >> Nice value will only apply to requests which originate from user contexts
> >> and have default context priority. This is to avoid disturbing any
> >> application made choices of low and high (batch processing and latency
> >> sensitive compositing). In this case nice value adjusts the effective
> >> priority in the narrow band of -19 to +20 around
> >> I915_CONTEXT_DEFAULT_PRIORITY.
> >>
> >> This means that userspace using the context priority uapi directly has a
> >> wider range of possible adjustments (in practice that only applies to
> >> execlists platforms - with GuC there are only three priority buckets), but
> >> in all cases nice adjustment has the expected effect: positive nice
> >> lowering the scheduling priority and negative nice raising it.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >
> > I don't think adding any more fancy features to i915-scheduler makes
> > sense, at least not before we've cut over to drm/sched.
>
> Why do you think so?
>
> Drm/sched has at least low/normal/high priority and surely we will keep
> the i915 context priority ABI.
>
> Then this patch is not touching the i915 scheduler at all, neither it is
> fancy.
>
> The cover letter explains how it implements the same approach as the IO
> scheduler. And it explains the reasoning and benefits. Provides an user
> experience benefit today, which can easily be preserved.

won't this cause uAPI divergence between execlists and GuC, like if
something nices to -15 or -18 with execlists and the same with GuC it
won't get the same sort of result will it?

Dave.
