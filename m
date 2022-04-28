Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA351335F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D26810E883;
	Thu, 28 Apr 2022 12:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C33710E7C7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:12:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so2907883wmn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=odkhbNhQRQRJ0BJcQ8TUM8TBFpnR2GDPPOPX4Fh6cAQ=;
 b=ias5JCONw09uro2Gk+gZOo8wasg0Oga6sQzbpI2JCP45Js5eNIKtliaJmJixRtjHqH
 I7KQAvRORxO7slv8K01ZMfrBr/C+ooKa/2fzeiHevcVr7O0HmcMD1OScpL0RI7PKck+Q
 eEk3vEjr0JH1GkcZrKknIxM9lQwnzfVs118R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=odkhbNhQRQRJ0BJcQ8TUM8TBFpnR2GDPPOPX4Fh6cAQ=;
 b=LmSCjC7LxLhyLcILkrhUKaZv7gITjlP9hFwrbfBX4In9ttJAfKyrT4j7kvMB/lsX39
 qi74kbOIRYGpayQocaCbttBiGHT79YlOSq4JShFzase8vWJoqjJCepJryDtEEBGwLBAY
 QTU/lgo7d7irtbbNyki6xpZhJf9nBYIRFSCEchXRBdbvDX/d/A/KKII6Ina39zvH0uqf
 g2BtRshSib74rUwNLWl/5awyKzTh5y5XM200SlogqGE5xUFjmz9YTYKpHmLm2rg2feoY
 oNLVtYauGkW8SmFsHKmAWmQntstNFfcTW/RuLXBsnO1ImAqXYU2rda94mWOr5/UiCaGu
 kutg==
X-Gm-Message-State: AOAM533xAK9NHLeH+5w0X0wI1mPRptz+AU05xpLml+TgmiCKyG5IAM7a
 ZZbNYodVumuUXcVPZRg3Pa+SjJFAlyH2M9k+
X-Google-Smtp-Source: ABdhPJwQWaPRBYeA3oR62K2tdf26cKNCtN+YNYQBX6AJzOi3Clkesk9jfBGrtLS+s6aFtP0rfYQv2A==
X-Received: by 2002:a05:600c:4fc6:b0:393:fb29:1f3f with SMTP id
 o6-20020a05600c4fc600b00393fb291f3fmr11748350wmq.60.1651147947624; 
 Thu, 28 Apr 2022 05:12:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c12c900b00393fbe6fbdcsm4368912wmd.45.2022.04.28.05.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:12:27 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:12:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: dim question: How to revert patches?
Message-ID: <YmqEqctl0SZ1Gfnm@phenom.ffwll.local>
References: <c79789fb-642d-ee9e-32a6-fc7f79d9e3b4@gmx.de>
 <YmlRW2fAabBqWc+0@phenom.ffwll.local>
 <3d4f3cf5-c3d0-7398-abab-aa3643296bbd@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d4f3cf5-c3d0-7398-abab-aa3643296bbd@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 09:20:59PM +0200, Helge Deller wrote:
> Hi Daniel,
> 
> On 4/27/22 16:21, Daniel Vetter wrote:
> > On Thu, Apr 14, 2022 at 10:37:55PM +0200, Helge Deller wrote:
> >> Hello dri-devel & dim users,
> >
> > Apologies for late reply, I'm way behind on stuff.
> >
> >> I committed this patch to the drm-misc-next branch:
> >>
> >> commit d6cd978f7e6b6f6895f8d0c4ce6e5d2c8e979afe
> >>     video: fbdev: fbmem: fix pointer reference to null device field
> >>
> >> then I noticed that it was fixed already in another branch which led to this error:
> >>
> >> Merging drm-misc/drm-misc-next... dim:
> >> dim: FAILURE: Could not merge drm-misc/drm-misc-next
> >> dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
> >> dim: in the drm-tip.rst documentation for how to handle this situation.
> >>
> >> I fixed it by reverting that patch above with this new commit in the drm-misc-next branch:
> >>
> >> commit cabfa2bbe617ddf0a0cc4d01f72b584dae4939ad (HEAD -> drm-misc-next, drm-misc/for-linux-next, drm-misc/drm-misc-next)
> >> Author: Helge Deller <deller@gmx.de>
> >>     Revert "video: fbdev: fbmem: fix pointer reference to null device field"
> >>
> >> My question (as "dim" newbie):
> >> Was that the right solution?
> >
> > The patch wasn't really broken, so revert feels a bit silly. The hint was
> > to look at the documentation referenced by the error message - the issue
> > was only in rebuilding the integration tree:
> >
> > https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html#resolving-conflicts-when-rebuilding-drm-tip
> >
> > This should cover you even for really rare conflict situations.
> >
> >> Is there a possibility to drop those two patches from the drm-misc-next branch before it gets pushed upstream?
> >
> > It's a shared tree, mistakes are forever. The only time we did a forced
> > push ever is when someone managed to push their local pile of hacks or
> > something, and we're catching those pretty well now with a server-side
> > test to make sure you're using dim to push.
> >
> > It's also no big deal, and next time you get a conflict just resolve it
> > in drm-tip per the docs and it's all fine.
> 
> Thanks for the feedback!
> So, basically I think I did the right thing (although a revert isn't nice).
> There was no other useful fixup I could have come up with, because the other conflicting
> patch had the right & better solution already pushed.

Yeah if the other patch is strictly better then reverting sounds like the
right approach. Otherwise just resolving the conflict in drm-tip is the
way to go.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
