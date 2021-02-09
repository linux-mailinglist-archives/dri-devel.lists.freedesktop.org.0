Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CE314EDB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0096EACB;
	Tue,  9 Feb 2021 12:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2A46EACB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:24:29 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id f8so12317574ljk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+4qvv4x061bpt+yhDSBt6n6FbfU5CMGKYhBkEmmkYA=;
 b=VJJ8sD7hH4an6Cb8CDi2pX+cA4xNUQtKm7ClYnnJ7Fslwx7bnZ12X7yZzaTFre2scU
 giFj/qg+yW/ab1dTsNYCEIQMRUcNhGcsG6mXb2Zn02IcXpNCXRZTJnzUC2hMJ24eaR/7
 K+pi3BD30tiq7pNbHpdHYEjuxFkTsyDk0X4bGYxHfvj3OVUiE5gkXXxHtxLfIIZHjQOi
 qEbA/p7LRJD4TTslbeunQpzkHyDiijDUeSsmVqA3Dit6DMxzNirqQbvm9B8EguShTkzu
 0Ns+qJ8VtH7qf+3xRTUha8HATd/mLgNr5klv+M/U2BRtWexH+6K/rtE6/sqxifkuobXF
 k4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+4qvv4x061bpt+yhDSBt6n6FbfU5CMGKYhBkEmmkYA=;
 b=R303dA7UUf4nVV+P5PEeQNt9E1WJKY4sa5dZhk8hTeMKZKR83A+nJPXLAdhzYBXPwu
 1WdqMgkTMZEJXpT8vThs+qNGWUchPnX1BrIf1+4dtatoRI+iWmp2emG1CeUUnKAubudV
 ApCUKDP6XsU+ghMcUl0YeKVnHiNMEulWwk8s+elgYUzA0UjMPQ/XaPzPWp7kxAqQmuHF
 NZ03sGrT/6372oHbBl/VtUX5/e3Zh19aMROfYofFSiByvS6Xbg6/xyfmzlXDO9OvuN5v
 6mRoTMqIhEsNZ3g0sP3AoBz2FMBFJWYOz32/H22IioCEu7RiitJDCEGfQsrrWgHjz82m
 AvSQ==
X-Gm-Message-State: AOAM530MvOF0KPIpAeCpNd1LW5S0VaJuZquLGczmFawCGF9entGUY8Hg
 lAnTr96/0eh4bpq3jR/tPMrk5EtkycAADdaFOIQ=
X-Google-Smtp-Source: ABdhPJwHwlWpW+alBg9nVHcGMG7+plsrvVNE6C0wek1r8mC5ievzfqlHnFAWluC3LW9i38D+E5149cBKQyhEs3yvfbY=
X-Received: by 2002:a05:651c:1303:: with SMTP id
 u3mr13999733lja.419.1612873467770; 
 Tue, 09 Feb 2021 04:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20210209112721.3421-1-tzimmermann@suse.de>
In-Reply-To: <20210209112721.3421-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 9 Feb 2021 13:24:16 +0100
Message-ID: <CAMeQTsZUKvnuLorRkMkOjp22tjeEaZy_=MfH=EMh7rdoCntGbw@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Drop DRM_GMA600 config option
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 9, 2021 at 12:27 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> With support for the MID-only Medfield chips removed, simply build
> the complete driver if DRM_GMA500 has been selected. Anyone who wants
> to enable one of the chips would probably also want the rest.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 837f23bb4b60 ("drm/gma500: Drop DRM_GMA3600 config option")
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: dri-devel@lists.freedesktop.org

Applied to drm-misc-next

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
