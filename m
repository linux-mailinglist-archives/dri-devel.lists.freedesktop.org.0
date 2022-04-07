Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B04F7B5A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42A010E83B;
	Thu,  7 Apr 2022 09:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070E810E7EF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:15:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b24so5617122edu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wOZr49sb/Ny9apGippa8fdUG/E6tcaVDX+ivqlNiEoY=;
 b=OUJdfm0Skg/SevIzmzikdz6fZur6D0CXVIcupP3mXL+yxFUOW0AUukZZ3mPDZIAqz6
 oOojssy3IAFP3UuvZOjSFUnfyfVG+F2Ur+jroH3JX/9Xuqbcy6tNPI9BF6qzAls8Pyes
 O5Tz5E9oaCFqu9ZnbxNI31yVF2KMClPL1HDtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wOZr49sb/Ny9apGippa8fdUG/E6tcaVDX+ivqlNiEoY=;
 b=7365gTeiF+iZ+E3nEwF1cwUWHB6gFKYi9otsqTmwj9Uv7wNG88I6H/8FrdYbuAnrM3
 RMxhFob0+sN5KrhiKcD1vNvBDp9WSKpnZTo48PjaDM+jPbrf8fdsAIoCU8t2rk8QLq3B
 jh2ZWSTueXHxchyHywkd8yZYmaauIrZOjZzRj/rup+nk/apym4qT3n8zWTHk+wXbl3YA
 XcVhukq47hKfR3VAYbEBjYd//6vuh+m3jw1HEFJChtwo21cX9bTO/8sm5ALV/picT3Bq
 CjSikMbEht1/05A0rIDRl7HvJrGg0owan+RdapT8XEdVsXEpPsrNN4ubZ0NlxDalkbO/
 OZoQ==
X-Gm-Message-State: AOAM532CSHQ6Fmd1ZxCVxkDnKpq9bkVK9zZaJ5tC5azFwEktuCezhWB+
 oZFCTYolXNrKQDAUqxec4cj8qQ==
X-Google-Smtp-Source: ABdhPJzmpKY3RGEMTeuwi1iMVD/SXnxu3nIwPkgnTiZcLFENqdqDVYQLLrvfFPDqAev7Uq5qFJsuMA==
X-Received: by 2002:a05:6402:5186:b0:419:651e:5137 with SMTP id
 q6-20020a056402518600b00419651e5137mr13192197edd.335.1649322937637; 
 Thu, 07 Apr 2022 02:15:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a50cfce000000b0041cbaba8743sm7069038edk.56.2022.04.07.02.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:15:37 -0700 (PDT)
Date: Thu, 7 Apr 2022 11:15:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: DMA-resv usage
Message-ID: <Yk6rt7Vpm038eGMZ@phenom.ffwll.local>
References: <20220407085946.744568-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 10:59:31AM +0200, Christian König wrote:
> Hi Daniel,
> 
> only patch #2 had some significant changes. The rest ist pretty much the
> same except for the dropped exynos change and the added cleanup for the
> seqlock.

Reviewed that patch, I plan to do a full review of the docs and hopefully
also a bit of all the various users once it's all landed.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
