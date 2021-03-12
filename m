Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A955338335
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 02:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6B089C29;
	Fri, 12 Mar 2021 01:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F16C89B06;
 Fri, 12 Mar 2021 01:37:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z1so5734186edb.8;
 Thu, 11 Mar 2021 17:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4lzaQZFF4QQwUeiSDrtC0Cs527ZYrAZKnT600UIQ/cg=;
 b=c4JJPmmvuJHdI+/0NauBwXXRWw9s0DYM6HTPqe8ErjcNSYt/ETWt9cL1k1os7Vtvki
 zl9OFiR4LMSQc9xh+s1kECYCUIDoXMKcmYgFscMrG2y4l2Hgpr3acX1feeSC6kZaueNF
 //CbT2WqCZcOsMEyK+BtD0c14VaYbcZpX6B0S9ozyYYCeoQJWZtQvdIFrSoasDDbUgIg
 +R0wa09lUbMGaBPfi0J+V5d4XAS0aTDl4ySUB7OO537I+zYUkcAwQhnN25OduL2e7mZc
 I3u43yR9PWgU0etSA/FSDLkLyr44kPw+R1y0GVwHOdDYll3pPBY8fLlzzsZvbPLjr5Q0
 HhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4lzaQZFF4QQwUeiSDrtC0Cs527ZYrAZKnT600UIQ/cg=;
 b=F8c83xDNSynLtG8FERSmOyoRNwsqB1GbANVAbuU7wnHU5rwERwRSGK6cDeL29m56a6
 wT747lsjM9YbpPX4O0gP+p/BSJnGQ2dMHv8RoV/Tyeq6veyHdj3mWxz4KrWl8IMKdqCq
 lIrMHuZPYC+NzEi3FvntAdgpZdqoF6CgjGS7eufsRmJrZW++t6xyrnHc4HQfGB3C+k5T
 oew/lCzLO80zvLVCEEam43KPELd5ETyKyyLpnJGvtlgV2qmfxlpn2iYaKT+BCJKKbhrx
 X1iwUa4lyz07HEDV8T0tftSOe0DmBpC0ieCyCNiqJ5rcD3oRjuT54ALV8jvD0MjlLS7y
 v7wQ==
X-Gm-Message-State: AOAM533fkEaQMU8WlvT2Xzmpezzg3XtCwZdB2xe4kerQFKbv7i/AKLPq
 FebxVIpuO28N1GspOFN1rwV5dnbMEXAPWRoLHb0=
X-Google-Smtp-Source: ABdhPJy/TMZFe/Vay8eQHzGp4K5UeW2DtipJBH/KXKcbdfOpGd5G03GuPgotfZTOfw3xw5Ko5BT22fuuhIDcXyTHP3s=
X-Received: by 2002:a05:6402:170f:: with SMTP id
 y15mr11499020edu.127.1615513039260; 
 Thu, 11 Mar 2021 17:37:19 -0800 (PST)
MIME-Version: 1.0
References: <YEn+yXnNFFoW5+CF@intel.com>
In-Reply-To: <YEn+yXnNFFoW5+CF@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Mar 2021 11:36:51 +1000
Message-ID: <CAPM=9tyi=qSSbkgh_cmDWiRfsnxyd+5shNFXdce2xZityUkUpQ@mail.gmail.com>
Subject: Re: [PULL] drm-intel-fixes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Mar 2021 at 21:28, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> Hi Dave and Daniel,
>
> Things are very quiet. Only 1 fix this round.
> Since I will be out next week, if this trend continues I will
> accumulate 2 weeks and send when in -rc4.
>
> Here goes drm-intel-fixes-2021-03-11:
>
> - Wedge the GPU if command parser setup fails (Tvrtko)
>
> Thanks,
> Rodrigo.
>
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
>
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

This was based on 5.12-rc1 against my request earlier in the week to
not do that. but since it was a single patch I just cherry-picked it
across.

Can we make sure no fixes or next based on rc1 arrive please.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
