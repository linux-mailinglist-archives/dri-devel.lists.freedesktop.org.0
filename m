Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABB3E0A0B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 23:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90389F69;
	Wed,  4 Aug 2021 21:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECED989FA6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 21:37:10 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id x192so5986237ybe.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 14:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BY4rrk+5qtOGaiVVgWgQFO89sryoOkwhyp/eay9sL48=;
 b=hTGql+fhT/lSLWF0apm0sQb0ECFderGGqDtUP5746zcXSEqqLL5uxZntVFEixeu1vW
 /+hb3fKsMaTAnTEtyidAbQ2djVAsdwsBMBIZgfmCxcjT7zkmXYj1V8OXQIbg1GYMDMwW
 G2ew0fAFujkYGyjXsd1384yRbUguXIu4AFFLFTbfi9y785kWT12rR0ZRsHkhs4m4ug13
 5Z29SBbRHFNYVw07bPXvxi6XkA2Fqx/lDNCU2dakZMoJCh5KdqGkbgi/efDLL93Zok29
 KPsU7sYhxdDHiWi5Hu66YZENRNKDg6h+Az9b7eFyCUPKzyQXFItPwsvpUp7TxtHPOHNh
 dbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BY4rrk+5qtOGaiVVgWgQFO89sryoOkwhyp/eay9sL48=;
 b=m//kzeQXPOOtTA8AlH8duPeuiIQaHGxqn4uRd9w/4qqPv3HMc/2pqgKX05GFx5YVaT
 9Z8teNVIammBMucuiKKulOsZC30s+DvhK38lyoHjYqnJbngFpo5ccF57HDcn6cUZltLr
 NlY7BQ4TwLTx9cQuwe9Siv96N3IlTD5cq6gIY5Vk4bfL8+vHi/xXYofnELAsK1iKOVrf
 M3m5ss3TiLmefYjyzMFx3wtYp1axTowAxmM0gNsQQCPaPoG7/ir1Oq/kUJAS5AAlvqZL
 vWFtQlUUs3wRIW0upwQLStaJH6xavaO2aMJCI9naqy1WoRZ8dToQat6lKM5VT6Y+W4J5
 huQw==
X-Gm-Message-State: AOAM53313WEADbA3lWJqK/yX9S1J5AycCsJwWmzkzRk1CJ+D8DhajFwp
 802OKx1JjvT3yg3rNB3adqssJInhUS3LSYbErn0VOA==
X-Google-Smtp-Source: ABdhPJwZgzucwlWgkGVEHrCFtuakYx8jxasJRlSGsG0IN13PykE37Lc3WrmtFa6SDP3Le3y0yAhyiP5+9D8Ga/ED6gM=
X-Received: by 2002:a25:b512:: with SMTP id p18mr1930498ybj.103.1628113029976; 
 Wed, 04 Aug 2021 14:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210804185704.624883-1-jason@jlekstrand.net>
In-Reply-To: <20210804185704.624883-1-jason@jlekstrand.net>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Aug 2021 22:36:58 +0100
Message-ID: <CAPj87rPuZpgu8qRFBv2HZBAmNptPQxh93D4+6EmMiV9ikdaqzQ@mail.gmail.com>
Subject: Re: [PATCH] docs/drm: Add a new bullet to the uAPI requirements (v2)
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 4 Aug 2021 at 19:57, Jason Ekstrand <jason@jlekstrand.net> wrote:
> While tracking down various bits of i915 uAPI, it's been difficult to
> find the userspace much of the time because no one bothers to mention it
> in commit messages.  Require the kernel patch to be a one-stop shop for
> finding the various bits which were used to justify the new uAPI.

Acked-by: Daniel Stone <daniels@collabora.com>
