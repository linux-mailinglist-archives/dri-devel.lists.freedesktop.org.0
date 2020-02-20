Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E421667FE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 21:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EAA6EE0B;
	Thu, 20 Feb 2020 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821C66EE0B;
 Thu, 20 Feb 2020 20:08:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b17so3438360wmb.0;
 Thu, 20 Feb 2020 12:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kBIhuNzrd9/ICrWDQr4DVMV2/B2/59BRqjR58cRFSa8=;
 b=mLjP5rCdAC6xFhQp9dOe10slf2tWdLGlp1jHu9A/olLcXXEAaYmvzZ7Zhy693tEkoj
 fJqN/7P/bZ9+EZEqKuyp8WEevdfQinxoUWik/FWSYT6REWm1SvWUKhljrUdMpniafFYM
 ZmLZCnPcMhKZ8OLKRd6LYyOv/AEV2vG3sKzuNcOHJ7XGwJhc2ghDW2nW7x6jVFJA9zBa
 XUpl64Z+Isf9bF9r9yNS5Z6H1IVqCGbtRP0qs692nxBNDJ6iyn4ewCCcOOZb62L7Xzha
 lYzWZDj4Rdc2AG3x+sT7qJu8nhN2EQHhApyzeIhU71KV3qfiS5zAWtTwpGUwfzmbbtks
 6u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kBIhuNzrd9/ICrWDQr4DVMV2/B2/59BRqjR58cRFSa8=;
 b=Lnyem4iVQD7w5dSRFt35ilbKztuJmBMvcr36i3AyqO7iCo4pNROR5zOrQAKciYyhF2
 pRIpQB4N2AqS4w8UXzO7oGQ5rxj9daCU7/6/stFNtwPk67NrblR6hnfkO8sCzkRgB5cb
 CXyiMrR0/hot0uMouW7HLeXa1GiX8tcrDcy+irkxaM1RZ1U0SD1OO/IGkxYTkyGmTgQ7
 QWmehjQEF3PY6Sdjw+njvfTj/3bNyo52LU0ZkDFl/AhgnGf/tn09yumDdByoOTc+PSo2
 HviHcvEGpK9fNf5/Jrbl0eMVZLGLyjAklWxOWbDsh05mkDwQunGNfuSz6Kupezm6qcJ+
 5dkQ==
X-Gm-Message-State: APjAAAUu8KER9VR1MRvJTk/uw98NJzz3kjwz4rXmQLvf9qd8uPqrtVJK
 uvtpDnCwNLPNTbzvp6EZDrKxmuFL1i4nAnkxs0I=
X-Google-Smtp-Source: APXvYqy7eptXAdEZnovXNA47MGEG44idKZd6tifmRJg1r8lBP52ZR9PRv5Q5jHU2VMNFc4VIVH+tkdwNPjyGtXAaRz0=
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr6249867wmm.79.1582229308197; 
 Thu, 20 Feb 2020 12:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20200214154854.6746-1-sashal@kernel.org>
 <20200214154854.6746-530-sashal@kernel.org>
 <CADnq5_Oq-6VYYMWgvSbTcs5S6+DHP1K+ambo3Cd_BBkYFQk8HQ@mail.gmail.com>
 <20200220192654.GJ1734@sasha-vm>
In-Reply-To: <20200220192654.GJ1734@sasha-vm>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Feb 2020 15:08:16 -0500
Message-ID: <CADnq5_MRkgK=Of_GJ7n1FHnnuSzdb=OJ7zdQJegi0=xMUidKXg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.5 530/542] drm/amdgpu/smu10: fix
 smu10_get_clock_by_type_with_voltage
To: Sasha Levin <sashal@kernel.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 2:26 PM Sasha Levin <sashal@kernel.org> wrote:
>
> On Fri, Feb 14, 2020 at 11:31:31AM -0500, Alex Deucher wrote:
> >On Fri, Feb 14, 2020 at 11:00 AM Sasha Levin <sashal@kernel.org> wrote:
> >>
> >> From: Alex Deucher <alexander.deucher@amd.com>
> >>
> >> [ Upstream commit 1064ad4aeef94f51ca230ac639a9e996fb7867a0 ]
> >>
> >> Cull out 0 clocks to avoid a warning in DC.
> >>
> >> Bug: https://gitlab.freedesktop.org/drm/amd/issues/963
> >
> >All of the upstream commits that reference this bug need to be applied
> >or this patch set will be broken.  Please either apply them all or
> >drop them.
>
> Okay, so I have these 3 in 4.19-5.5:
>
> c37243579d6c ("drm/amdgpu/display: handle multiple numbers of fclks in dcn_calcs.c (v2)")
> 4d0a72b66065 ("drm/amdgpu/smu10: fix smu10_get_clock_by_type_with_latency")
> 1064ad4aeef9 ("drm/amdgpu/smu10: fix smu10_get_clock_by_type_with_voltage"

Yes, that should do it.  Thanks!

Alex

>
> --
> Thanks,
> Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
