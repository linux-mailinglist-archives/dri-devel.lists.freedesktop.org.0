Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16771656E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 16:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9210E140;
	Tue, 30 May 2023 14:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6EF10E140;
 Tue, 30 May 2023 14:58:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B82E631DB;
 Tue, 30 May 2023 14:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EBAC43173;
 Tue, 30 May 2023 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685458717;
 bh=VtfdUXYIF1iKd6oD3B4hTdmPM1+ND/GXtC01F02RcZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n5pC1idIo5PpaWZnm4C56D7agLhnfn2Mi9XDSTnY0r/cVstOGtUNelc+tiatjuodp
 s93x9rENFzQk7eknUM3TXLim3JeQJy0KCzIp5CQUQWSlfDEU0mJohDon2Sf6NTyjNq
 s7Yc5ELQ+FiAospxT+RVCAbrGx3hVLUIXZOZL/P7Vodjb2c+1sOV8/rHFEixdrWR8m
 J27m6fWTxieK60aMLeENfnMzyks7GdCIJVCQvrvdryxI/hoJNyarapLdgwgsomrUjj
 1d43ZGhCVIGUc3UD/YxBpGCzyaUMzAgA5lFxawOoyzSRCPAAAh7zpB2wJmybWIypQR
 o5RWOc+46FWDw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q40o2-0000uh-FA; Tue, 30 May 2023 16:58:39 +0200
Date: Tue, 30 May 2023 16:58:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: add module parameter for PSR
Message-ID: <ZHYPHnWoDbXB-fqe@hovoldconsulting.com>
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
 <ZGzalLjTvUfzEADU@hovoldconsulting.com>
 <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
 <ZG216qoxK9hQ-kQs@hovoldconsulting.com>
 <4f2556e2-52ab-eb1d-b388-52546044f460@linaro.org>
 <CAD=FV=VYczHFHv_h1tt-O+AagE1-KzgYd2B=Cx6fK_s4jR8iTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VYczHFHv_h1tt-O+AagE1-KzgYd2B=Cx6fK_s4jR8iTw@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 10:13:33AM -0700, Doug Anderson wrote:
> On Wed, May 24, 2023 at 1:06 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:

> > Originally this issue was reported by Doug, and at [1] he reported that
> > an issue is fixed for him. So, for me it looks like we have hardware
> > where VT works and hardware where it doesn't.
> 
> As I understand it, the problem was originally reported by Bjorn over
> IRC. When he reported the problem on VT2, Stephen Boyd confirmed that
> he could see the same problem on our hardware when using VT2. I
> confirmed I could reproduce and also tested the fix. I don't remember
> if Bjorn ever tested the fix. I think many of us assumed that it was
> the same issue so a fix for one person would also fix the other.

Yeah, that sounds reasonable even if there apparently are some
differences between mainline and what you run in ChromeOS here.

> > Doug, can you please confirm whether you can reproduce the PSR+VT issue
> > on 6.4-rc (without extra patches) or if the issue is fixed for you?
> >
> > [1]
> > https://lore.kernel.org/dri-devel/CAD=FV=VSHmQPtsQfWjviEZeErms-VEOTmfozejASUC9zsMjAbA@mail.gmail.com/
> 
> Ugh. Unfortunately, it's not easy for me to test this particular
> feature directly on upstream Linux. :( I typically run with a ChromeOS
> root filesystem, which works pretty well with mainline. One place
> where it doesn't work with mainline is VT2. The VT2 feature for
> Chromebooks is implemented with "frecon" and takes advantage of a
> downstream patch that we've carried in the ChromeOS kernel trees for
> years allowing handoff of who the DRM "master" is.
> 
> For testing the fix previously, I confirmed that I could reproduce the
> problem on our downstream kernel (which had the PSR patches picked)
> and that the fixes worked for me in that context.
> 
> Ah, but it shouldn't be too hard to pick that one patch. Let's see if
> that works. I'll pick ("CHROMIUM: drm: Add drm_master_relax debugfs
> file (non-root set/drop master ioctls)"). Indeed, it works!
> 
> OK, so with the top of Linus's tree (v6.4-rc3-17-g9d646009f65d) plus
> the CHROMIUM patch to enable my VT2, I can confirm that I don't see
> the issue. I can switch to VT2 and typing works fine. I will say that
> on herobrine the backlight is all messed up, but I assume that's an
> unrelated issue.

Interesting, as VTs are still broken in with rc4 on the X13s (and
sc8280xp CRD).

Does anyone have any ideas of why things break on mainline with these
machines? Any patches or tests I can try?

Dmitry, do you have an X13s now that you can reproduce this on?

Johan
