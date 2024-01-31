Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD7E8433F7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 03:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F1D10EE9E;
	Wed, 31 Jan 2024 02:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DBB10EE9E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 02:32:41 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-602d2e67217so47288967b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 18:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706668300; x=1707273100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLBaE0kVsjG+87445CCVgqnCaDCxYOTjvYMT2E/2XxA=;
 b=Oj5G2f1Ojrtmz0i4ybDrfkdh+bCfUIeWpdlaEbr35wZD7/N5h/HdTooGECY+Cp8QNs
 nGZ7p9rpJdHKZUGcaQfl/sKCrfMfS+wc8n+7SjzN2IRkxGSuT6tYs4y9G2jGCx3SRVeL
 EGgx96qlEsCA9Jh/MfHRLZkq3c5cGf1Ppp2RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706668300; x=1707273100;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YLBaE0kVsjG+87445CCVgqnCaDCxYOTjvYMT2E/2XxA=;
 b=jvF+e4DLP9xpkJ4ktcPpp+gVvWoXxPeaNHYCC05BY3/4C0yIIu8iJ/k39XADDaRb5+
 1sVXzpmP0LQhvcaL13LaFEI4qPFrNTzRRqRSPLHMSEiByhoV0XLQKbZNDtIded/hvzTf
 43YIULifbl2/7hcPPwkz4rI6O6LDmFnAVntoeZSdB5LwJY4Okr/ULHRWEYClZPAEuHAe
 pTHlz+LapCNiNc2Q4wr8Yu4lOuSbvJH/q+B10jJ9SQFLK2+PtbDlMQrimct9aOnOEw+s
 Gp1ynvVvYL46GT/4ZGQVvuMbImsaUz1qfVnUyMxyK+7G48/DKrEAIJHCjZJ3g699WfMe
 J9zg==
X-Gm-Message-State: AOJu0YxQXq1JoGqL++f+vHdYemlowjwUukjItO062Rj0QIzz6e/KUiQh
 qayHmA9WjJxLGXscT28HXb8uNMUdyvC3eCawpuSP6idz2Upe0U0yYcDMqWr0pGnI7qTrapb5IYi
 X3DtKNWFnWOdr64AI1qFljXLK3nCFHBo9nUGu
X-Google-Smtp-Source: AGHT+IGi07hbYIm16m16w6BxE+dXSntdgRXwyrqG4i/r6ghPrSvj9Jg1cDTAwFKPxrrLQMzUIMaUUkqYTDIBkr9x5VY=
X-Received: by 2002:a25:74c6:0:b0:dc3:2798:dff0 with SMTP id
 p189-20020a2574c6000000b00dc32798dff0mr390273ybc.50.1706668300148; Tue, 30
 Jan 2024 18:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
 <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
 <613cf732-fc95-4f61-b64d-772206460535@suse.de>
 <CABQX2QP8nLpM6e3D3qQASvbxr1DDON1dq=s+iNBcczhSJu8Ggg@mail.gmail.com>
 <CAPj87rOhA6jwq3A5kgQg1w+y-ms2=gF4bZ+Obp3ELq+3f-jemg@mail.gmail.com>
In-Reply-To: <CAPj87rOhA6jwq3A5kgQg1w+y-ms2=gF4bZ+Obp3ELq+3f-jemg@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 30 Jan 2024 21:31:29 -0500
Message-ID: <CABQX2QNaQ3yN-njyw7zE7qH_p=JB3JpxxhTxYDqSbcmA5DicFg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: dri-devel@lists.freedesktop.org, Ian Forbes <ian.forbes@broadcom.com>,
 maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 Thomas Zimmermann <tzimmermann@suse.de>, martin.krastev@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 6:50=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Tue, 30 Jan 2024 at 18:39, Zack Rusin <zack.rusin@broadcom.com> wrote:
> > In general, yes. Of course it's a little more convoluted because we'll
> > act like OpenGL runtime here (i.e. glXSwapBuffers), i.e. our driver
> > will fake page-flips because the only memory we'll have is a single
> > buffer as the actual page-flipping happens in the presentation code on
> > the host. So the guest is not aware of the actual presentation (it's
> > also why we don't have any sort of vblank signaling in vmwgfx, the
> > concept just doesn't exist for us). i.e. on para-virtualized drivers
> > the actual page-flips will be property of the presentation code that's
> > outside of the guest. It's definitely one those things that I wanted
> > to have a good solution for in a while, in particular to have a better
> > story behind vblank handling, but it's difficult because
> > "presentation" on vm's is in general difficult to define - it might be
> > some vnc connected host on the other continent. Having said that
> > that's basically a wonky VRR display so we should be able to handle
> > our presentation as VRR and give more control of updates to the guest,
> > but we haven't done it yet.
>
> Please don't.
>
> Photon time is _a_ useful metric, but only backwards-informational.
> It's nice to give userspace a good forward estimate of when pixels
> will hit retinas, but as it's not fully reliable, the main part is
> being able to let it know when it did happen so it can adjust. Given
> that it's not reliable, we can't use it as a basis for preparing
> submissions though, so we don't, even on bare-metal drivers.
>
> As you've noted though, it really falls apart on non-bare-metal cases,
> especially where latency vastly exceeds throughput, or when either is
> hugely variable. So we don't ever use it as a basis.
>
> VRR is worse though. The FRR model is 'you can display new content
> every $period, and here's your basis so you can calibrate phase'. The
> VRR model is 'you can display new content so rapidly it's not worth
> trying to quantise, just fire it as rapidly as possible'. That's a
> world away from 'errrr ... might be 16ms, might be 500? dunno really'.
>
> The entire model we have is that basis timing flows backwards. The
> 'hardware' gives us a deadline, KMS angles to meet that with a small
> margin, the compositor angles to meet that with a margin again, and it
> lines up client repaints to hit that window too. Everything works on
> that model, so it's not super surprising that using svga is - to quote
> one of Weston's DRM-backend people who uses ESXi - 'a juddery mess'.

That's very hurtful. Or it would be but of course you didn't believe
them because they're working on Weston so clearly don't make good
choices in general, right? The presentation on esxi is just as smooth
as it is by default on Ubuntu on new hardware...

> Given that the entire ecosystem is based on this model, I don't think
> there's an easy way out where svga just does something wildly
> different. The best way to fix it is to probably work on predictable
> quantisation with updates: pick 5/12/47/60Hz to quantise to based on
> your current throughput, with something similar to hotplug/LINK_STATUS
> and faked EDID to let userspace know when the period changes. If you
> have variability within the cycle, e.g. dropped frames, then just suck
> it up and keep the illusion alive to userspace that it's presenting to
> a fixed period, and if/when you calculate there's a better
> quantisation then let userspace know what it is so it can adjust.
>
> But there's really no future in just doing random presentation rates,
> because that's not the API anyone has written for.

See, my hope was that with vrr we could layer the weird remote
presentation semantics of virtualized guest on top of the same
infrastructure that would be used on real hardware. If you're saying
that it's not the way userspace will work, then yea, that doesn't
help. My issue, that's general for para-virtualized drivers, is that
any behavior that differs from hw drivers means that it's going to
break at some point, we see that even for basic things like the
update-layout hotplug events that have been largely standardized for
many years. I'm assuming that refresh-rate-changed will result in the
same regressions, but fwiw if I can implement FRR correctly and punt
any issues that arise due to changes in the FRR as issues in userspace
then that does make my life a lot easier, so I'm not going to object
to that.

z
