Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0920B29F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F466EC97;
	Fri, 26 Jun 2020 13:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3D36EC97
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:38:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o8so8865337wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 06:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VIDsXKhd3FsLdPrj7iNBfRAKJOl7dEgIgZhDmwJcgIA=;
 b=ZvIpsMiR3ItY9TwUnp047/SJ26E9IvAhE2ulCaxXXZACOGih6YCXTrosGUNCk5aJjQ
 JZFBmULt8EVtd0P9t4xXSX2JtEr5tUmOnpPs4VCv4KwNesBI8u5z2E1Yhx0sVBiLVito
 Xe5kfg92JFcjt5NfDDD5iZy/MXRB+x/EBZghU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VIDsXKhd3FsLdPrj7iNBfRAKJOl7dEgIgZhDmwJcgIA=;
 b=uf+H8jrc7fJwtRji3zmJ5Wyjbp/6+nrHoaZSVT/j0tTMDI+9ecdzmXywYb+JeffilR
 uc4BPRORp08UT6MbefBMHalN1L5h3g4lhrixoxpW8Q1CcUypXQ2y6z1Zkw9alSPGJWKp
 Ymz9UUpKayW7xypN0GOuBqqhD9EprVVrqUJkxCJKSbnsP6xZc23mZgB+C+r/lQVEBXEn
 aK8DVW7knZL+BmhQT6tumWoSp8Ok5Aj/ILI9HBHsVVS0dAkTMeMyk4e4f9WVgMCC9Vmr
 0xK+fX81/5RR7vvFQv5Qt7XbH7pOTsf7uUVHFfoJTQ3uNBrtPSOW1LWgfgo7NXIebtjD
 noVA==
X-Gm-Message-State: AOAM531cjahi6Su1e/FwLs7nu0m7jbHMSEmTXmpAkRiaWlnFaVGKNXPo
 QbpbrLLFBHwF0SApJ8JEabCBKQ==
X-Google-Smtp-Source: ABdhPJz7xIMEJg4LwGuWXWiNSiA2dSID+PoB6ZsRuM8wgQ0JcL9uDGFVJ4rSMXj0F7YagoLR7WgwxA==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr3441238wmh.134.1593178720233; 
 Fri, 26 Jun 2020 06:38:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm21928052wrn.61.2020.06.26.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 06:38:39 -0700 (PDT)
Date: Fri, 26 Jun 2020 15:38:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Message-ID: <20200626133837.GE3278063@phenom.ffwll.local>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <20200626114040.GA3143884@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626114040.GA3143884@ulmo>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, gustavo@padovan.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 01:40:40PM +0200, Thierry Reding wrote:
> On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
> > On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
> > >
> > > # Host1x/TegraDRM UAPI proposal
> > >
> > > This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> > > the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> > > many ways.
> > >
> > > I haven't written any implementation yet -- I'll do that once there is
> > > some agreement on the high-level design.
> > >
> > > Current open items:
> > >
> > > * The syncpoint UAPI allows userspace to create sync_file FDs with
> > > arbitrary syncpoint fences. dma_fence code currently seems to assume all
> > > fences will be signaled, which would not necessarily be the case with
> > > this interface.
> > > * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> > > Not sure if they are still needed.
> > >
> > 
> > Hi, as this wasn't addressed here (and sorry if I missed it): is there
> > an open source userspace making use of this UAPI? Because this is
> > something which needs to be seen before it can be included at all.
> 
> There's a set of commits that implement an earlier draft here:
> 
>     https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-abi
> 
> and corresponding changes to libdrm to make use of that and implement
> tests using the various generations of VIC here:
> 
>     https://cgit.freedesktop.org/~tagr/drm/log/
> 
> Before actually jumping to an implementation we wanted to go over the
> design a bit more to avoid wasting a lot of work, like we've done in
> the past. Turns out it isn't easy to get everyone to agree on a good
> ABI. Who would've thought? =)
> 
> I expect that once the discussion around the ABI settles Mikko will
> start on implementing this ABI in the kernel and we'll update the
> libdrm patches to make use of the new ABI as well.

Do we have more than libdrm and tests for this, like something somewhat
functional? Since tegradrm landed years ago we've refined the criteria a
bit in this regard, latest version is explicit in that it needs to be
something that's functional (for end-users in some form), not just
infrastructure and tests.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
