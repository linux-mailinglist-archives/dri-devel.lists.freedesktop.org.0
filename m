Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA04819CB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 06:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E8310E2E6;
	Thu, 30 Dec 2021 05:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24910E2E6;
 Thu, 30 Dec 2021 05:29:26 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id j6so93777526edw.12;
 Wed, 29 Dec 2021 21:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ib/SmxqRmVNYAldt9eWiYKvPaoPQbeRg9bEVu+KXSA0=;
 b=Ns9paFrw3h3pSkuCtGZy/gAjkh2j0/ESJWs11EL7mAsFB69r3QnxFVGvCYpyHemIdj
 t1P6F6v8BEXtgIUFZKWoYH3VOUcsEzhD6VcFZxW7TP3UjdVRQ6qMwVilAzyVbKId8nz8
 UysKw5Y8+xIw7CDgP7kKefINezR/yhscl9PU2xq6kV/ITQ63G2ouhokaPJmGv1in8rNA
 7n2GZdejfCmwKvJD8DujLc7+eyVVOrDauI7EOSuwEvqgLytLIRXjaipLG0cb6nas2t4D
 rfrKAL/qFwuBUCLI6l0X8jSeoXaJs99gf01aEcDGgv27Jf2IXEHk45i4N7UsMeCGTgBb
 pLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ib/SmxqRmVNYAldt9eWiYKvPaoPQbeRg9bEVu+KXSA0=;
 b=qxp/gZGbplBzOAZ0xJc/lSUHquClfYIvGgcU0Jo0WxYapFAffxwGO6mhzT8WsbQNXj
 Kc0S2RNrVfl9A/fiwPTWej7x+wZS9EOunM4pkxTyYGpGhxfAU8AaLZs1OMUMzKavkU1C
 DtzmcFHzHOSF2P6hgGnqVN4aGDc8ktsYSQuaQ7v3GJZRTA7VBknfEwFpXDt2HSiqsgpv
 uihBv5AUpVByr3LGZLyQ6p2zAmhKFCe7y1Yu1tMBXlARtHumsZPHj7vrKO2aenmp8Wvi
 wSyYKKe+yCnyOpdDOfeyRmKEi5yAArAaQvaCJipb2YmY+8mKi7g8k5Bd5KUhO2DiQH6/
 9SIQ==
X-Gm-Message-State: AOAM53336KboMPTIXNzZLuk8VWi0bY2324OrzZdv6VhyGa82aR56IPkd
 FhagxqARGhIIZc6JUG03wKmbg3zGRro9mRUXOaY=
X-Google-Smtp-Source: ABdhPJyrFPj3p9/JfNrAXa9CtGY+i/hqHQT+l2HjK20FQe8tL6oGlI6cFA/kmYLK/I/cQzxkFGE/cePZ/FCZKuTREAw=
X-Received: by 2002:a17:906:5ada:: with SMTP id
 x26mr23883933ejs.720.1640842165370; 
 Wed, 29 Dec 2021 21:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20211229155129.5789-1-alexander.deucher@amd.com>
In-Reply-To: <20211229155129.5789-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 30 Dec 2021 15:29:13 +1000
Message-ID: <CAPM=9tyU-eP7Fc2ziWNURJrdxZJSkaNKbE0V6Xx6L9idswHv2A@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.16
To: Alex Deucher <alexander.deucher@amd.com>, zhan.liu@amd.com,
 angus.wang@amd.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Dec 2021 at 01:51, Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Hi Dave, Daniel,

Just FYI on merging this into tip I got a conflict I'm not sure what
answer is right.

fixes has:
ee2698cf79cc759a397c61086c758d4cc85938bf
Author: Angus Wang <angus.wang@amd.com>
Date:   Thu Dec 9 17:27:01 2021 -0500

    drm/amd/display: Changed pipe split policy to allow for
multi-display pipe split

next has:
1edf5ae1fdaffb67c1b93e98df670cbe535d13cf
Author: Zhan Liu <Zhan.Liu@amd.com>
Date:   Mon Nov 8 19:31:00 2021 -0500

    drm/amd/display: enable seamless boot for DCN301

-.pipe_split_policy = MPC_SPLIT_AVOID_MULT_DISP,
fixes is +.pipe_split_policy = MPC_SPLIT_DYNAMIC,
next is +.pipe_split_policy = MPC_SPLIT_AVOID,

I've chosen the -fixes answer for now, but it would be good to have
someone review it before Linus merges.

Dave.
