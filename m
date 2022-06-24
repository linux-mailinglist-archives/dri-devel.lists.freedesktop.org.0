Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3FA55A341
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0035410E9D0;
	Fri, 24 Jun 2022 21:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ADF10EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:05:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 v65-20020a1cac44000000b003a03c76fa38so1307950wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4FBq55ALNoB8I9/Jp2eahFZ3TVuZO8zAHamAFfwJTA4=;
 b=jtNLzbazAZ3Ty+PCe4NJUDW5r9cbkHlRd8h2mbV7+waX1Tx9erQtwlu2e8BUxesIDH
 SpaHCfUHUYE9Gcjqbo0B/IDMs/JrP3lo3//ZjLcKnRD7/2NuKlxlUOPrugPQ8PeHKwme
 wzVoLofv+/w69KJivy77K+FdWGQ9xTFTuR8C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4FBq55ALNoB8I9/Jp2eahFZ3TVuZO8zAHamAFfwJTA4=;
 b=WHV2mHQhwW92bo80ATBEMs9AhCKU6viPG9jS4unFL65NoW1FM1Pt7OHfH1GkxDxblW
 S9kLv8XWSd82XI5QdP2m3pEYPvrvYhKIoz7AzXpXcX2wP8cgAff7842doOlwF21cqzg6
 DEGMOZGRAUCmsZjt3NEKKC3PcyfVyqxpz4axsv1Pe/AW/OaPbNdVm3s/7g4fInRxYU/7
 j3352sChmX8RgcbubjLkVIBrum7meVqhGGVJM4ki0PEtqKadCd/4fXGElTZlc71VkKGq
 FTZsOYaKnla8WPN7XWv4wLBZJQT+b9f2sJU384TK0gy86dks6UEJG32boVea4FaxV9wM
 zuvw==
X-Gm-Message-State: AJIora+GNBv0vKxVvBc2UOZOhhiTPKEewBzSu02qsQU4K0VdqXxHLdiQ
 Hi02POzsVjndaj8PIhA4FzpGAw==
X-Google-Smtp-Source: AGRyM1s3Pl4EVQvFKsoBwid6w18frt80sinR1W0DhYBmiX4lMtmHCpKONBuPPCGUsGyEmAfWWb+3qw==
X-Received: by 2002:a05:600c:3553:b0:39c:63a3:f54a with SMTP id
 i19-20020a05600c355300b0039c63a3f54amr989149wmq.61.1656104739492; 
 Fri, 24 Jun 2022 14:05:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003974a00697esm8995188wmq.38.2022.06.24.14.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:05:39 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:05:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: Please add another drm/msm tree to the linux-next
Message-ID: <YrYnIY2s2Nj5C66N@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 05:19:42PM +0300, Dmitry Baryshkov wrote:
> Hi Stephen,
> 
> I would appreciate if you could add
> 
> https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag
> 
> to the linux-next tree.
> 
> This tree is a part of drm/msm maintenance structure. As a co-maintainer I
> collect and test display patches, while Rob concenctrates on GPU part of the
> driver. Later during the release cycle these patchesare pulled by Rob Clark
> directly into msm-next.
> 
> During last cycle Rob suggested adding this tree to the linux-next effort,
> so that the patches receive better integration testing during the Linux
> development cycle.

Have you guys thought of group maintainering? Single point of failure
trees freak me out a bit, it tends to build silos pretty hard. Simplest
path is to just toss it all into drm-misc, but at least have one tree for
your driver. Building new single maintainer silos after I've run around
for years collecting them all is rather meh.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
