Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE151323BF8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 13:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CD56EA89;
	Wed, 24 Feb 2021 12:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88136EA89
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 12:40:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d11so1742781wrj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 04:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HRhPlj1aHRVOi3gs8JuQx5ujbUeXgIsk53nwDPobfIc=;
 b=d0H+6s84LfrmhCxlKqm9iuAtf7AbWv9MNiz05h0L717TsS98FBZv0zG8WyGXGe1v3O
 pWUzo4LTRiNWdGOdO8E8SW8zqdunCe9JWRAxLh7Y5m+2ha7iEA5LXIJcwNF7ULANohTO
 cE74c57Zp1mn6ekgF0B2h66H9BPNknjcmelT1JLfot7gkdnkgBcDveQFQIyhv/YMpMt8
 dXSEGx+W/gWdeJgh1/Jme6hH+RGH8Z1NpMlDqBg8iNVs34a9CjPsby3qLhiNfbIS5P7B
 UADTB9ERyTOGXJoVPld+NTQnhcoHmKxufgh6JkK9uYT57OJZoHazMOXFa9+HF//SdJ5I
 oMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRhPlj1aHRVOi3gs8JuQx5ujbUeXgIsk53nwDPobfIc=;
 b=FNVVZmRtegj/gol+eu7/8BeS4TfsKKDaXtp+ufTappK33Ocdh16jIEI2fNEkCYjQ4Z
 v0pVq2dZXyiQYXnwPzgSWge1UFDSnDne9HPwEmqHUJEGrWb1nAqv5Yizi3GMMmCcdGu8
 msmwkNaOlSvtTmtfEz6/Dpx3T9xWwCrxlCWltNvERB6gMlPGES/gywLN/Xxe+f3pnmaB
 aKvBonm9RTCMzXU+pSvrFZf2NWEQOPBpMKHYeCL/PgRvYCNyYB3QBkpKxiuYLyqE+FJO
 fWlddhE8gbBYGOdQaHKEl5PjfmBKHy9i/+gOraTlxqaZWzGNyyxHO3vteOhKU6+IdFpO
 gU0Q==
X-Gm-Message-State: AOAM533eW5fX+4nLyHb384Rp/DU0IELtIZwQkgDZ3MSUaoKdRt+Lo7nu
 eAoystx8WlQIs1dWaVeYWbegIpzDErf94C7kaieVKA==
X-Google-Smtp-Source: ABdhPJzAf/QssqSJWTXQC9OJJ/N4aJn/AEnU3jtc2sPlav4EU3paeRaAIdayhaZXt+dVFhqKzgGMUV5f3CNGZjZh6ZY=
X-Received: by 2002:a5d:4521:: with SMTP id j1mr4780729wra.354.1614170443428; 
 Wed, 24 Feb 2021 04:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <161411675671.3338515.9688232276427844069.b4-ty@sntech.de>
In-Reply-To: <161411675671.3338515.9688232276427844069.b4-ty@sntech.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 24 Feb 2021 12:40:32 +0000
Message-ID: <CAPj87rPpw8wjCW8d51KKJvbZt3MOERnt-=hh66qCBXYuOMVk+A@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Heiko Stuebner <heiko@sntech.de>
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
Cc: Daniel Stone <daniels@collabora.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 stable <stable@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Feb 2021 at 21:49, Heiko Stuebner <heiko@sntech.de> wrote:
> On Tue, 11 Aug 2020 16:26:31 -0400, Alyssa Rosenzweig wrote:
> > The AFBC decoder used in the Rockchip VOP assumes the use of the
> > YUV-like colourspace transform (YTR). YTR is lossless for RGB(A)
> > buffers, which covers the RGBA8 and RGB565 formats supported in
> > vop_convert_afbc_format. Use of YTR is signaled with the
> > AFBC_FORMAT_MOD_YTR modifier, which prior to this commit was missing. As
> > such, a producer would have to generate buffers that do not use YTR,
> > which the VOP would erroneously decode as YTR, leading to severe visual
> > corruption.
>
> Applied, thanks!
>
> [1/1] drm/rockchip: Require the YTR modifier for AFBC
>       commit: 0de764474e6e0a74bd75715fed227d82dcda054c

Thanks Heiko!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
