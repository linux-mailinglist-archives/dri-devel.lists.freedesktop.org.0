Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396541440FE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 16:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AFE6ED60;
	Tue, 21 Jan 2020 15:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C0C6ED60
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 15:53:22 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so3454456wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 07:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bm7F0x3+s1BVKLjj/LaPJwd0q0u5lrHCpTjk7m15XDY=;
 b=T4tJ7rct8T0oRUA0cnN6pTd5z5M2TTu7Z4bgCQ/2KCToXTPFoS2oo74rskig5Qlcs+
 c2+jrmF4dPhaTiZ8jE2fo38mRVc7qJLufwCxjADlW1tW6dBVBauPwUdUmSV4NvcoEWu1
 RMYjMADcRPjpWnCyNHo3N+tMI3iKlZJHaGf3mi5Nd1FewbqznOzru1ElPrdS4Bj7i/4r
 3Wk6zA5ZCRbnkunzxmYPSLl4OmTlNXaVFq4KOfgVvRHE3qTwGe2qMOhYhSmXWjFsCQLp
 lKgLu9oPLphe9z56heKAD8Oudikd+duBsOBoVDALiH8DyMfRoVfQlEhoa/RCVp9dXF4S
 WyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bm7F0x3+s1BVKLjj/LaPJwd0q0u5lrHCpTjk7m15XDY=;
 b=KU+DiYtigIAiacmZCp2buRwWyIRIKSRkAnf9hp7N8vytnSoE4676eF3Hy55L/TBpja
 VXQ0r5u+EZCGYvdFm69+aLBbgIf2BG4gw0FuFScDIJSAG7YqFi6kGwq4NAVrtHJwVAM6
 ahCDQXO6VhiJmn14U1efsMhWBqkZmPNYyrtq0z1Ue0VKQjEt2Y2BGYcf7XQeYNu/M/R+
 n5Zry4MO1itBDAY6PP32M4yrb1YPMpExRiuoq6FMhy1sOyZFgdxOGRSGCoqMEZMC1WdN
 VwTcf+tD7YuTB6385x7IHXYKF+vWiznEW/xMM8VlIscwEDFNXJohAf1aWgD4NJHWaub+
 ZT3A==
X-Gm-Message-State: APjAAAVqcih4DLlj5nC4AmFVXCoJnxL1Bq/2CfkdgPoeDETlHOWKbn34
 fkow41+btICg5yngR3FQyfrGVrRt
X-Google-Smtp-Source: APXvYqxb3ARsOX7YfbX7zxxX9Ii2mKZ57vRqQ/IARNZDZePS5OsT3BXuuct/NxozulAn7NQT2XH9KA==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr4856359wmd.7.1579622001519; 
 Tue, 21 Jan 2020 07:53:21 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id t131sm4703005wmb.13.2020.01.21.07.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 07:53:20 -0800 (PST)
Date: Tue, 21 Jan 2020 15:52:41 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200121155241.GA31974@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-zS1UNS4dP5@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-zS1UNS4dP5@https.bugzilla.kernel.org/>
User-Agent: Mutt/ (2018-04-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 08:01:49AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> Yesterday, I compiled and installed the 5.4.13 kernel, but got no improvements.

Only the AMD/mesa devs can reasonably deal with the insane complexity of the GL
stack (linux(drm) + libdrm + llvm + mesa(GL) + xserver + xf86-video-amdgpu).

But they won't be able to do anything if you don't run the latest git version
of the code (linux + mesa) and provide an easily reproducible and free (as in
free beer) case (or some AMD/mesa devs own your games).
--------------------------------------------------------------------------------
I run such a 64bits system. If you can reproduce the issue with a free (as in
free beer) game, I'll be pleased to test it to see if it happens on my system.

or

You would need to compile and run the following linux kernel:
"git://people.freedesktop.org/~agd5f/linux branch", "amd-staging-drm-next" branch

Unfortunately, Southern Islands hardware shader compiler is llvm, you would
need to compile the latest git llvm-project (a massive pain).

Idem for libdrm, mesa, the xserver, and the amdgpu xserver driver.
--------------------------------------------------------------------------------

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
