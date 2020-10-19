Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13410292D6D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 20:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035B56E993;
	Mon, 19 Oct 2020 18:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB926E993
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 18:22:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d81so451399wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vpav1xfroqBH6IifIlLxNV+MvL1VW3DLMftkJIuraI=;
 b=DmUpmslPSJAp/soELe21RQd0EwUpEZnLLLcHNnLvilwPUP0UMLL33Cv0qKiGZq1c0S
 2SXH3R4yQgONL5mcArel6orc8Xf1D3P57HkVw9wYqME0F+tPP3eFwIbhDOz3Vnr8DVLf
 f4OKNeyDYjJjJSIOzQ7wewdJOOSrcN6WQ+32yczTgjUz0Ur4qA9rOT01XuAbUcnhJAxh
 Sgixeo5bfOSgxOZGIntGtFcloEg6NJtK3Bdo7QjABIWcmk9kETcfRmAVsV13KhSfjy2S
 mxMf3K2vA85E2gsb7TG7c4ZHN1YkQkevsWyeo6JXCZ9MIp38qGtepK4fMmRT8rZnu+3r
 L+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vpav1xfroqBH6IifIlLxNV+MvL1VW3DLMftkJIuraI=;
 b=okLXY8TKfTgV7QDeEv6qqpTa77aIf/t6FP8ZR4X+4F6zitv76AlT5QoPVNQsete3WV
 pxrClZVveTRkIdDFzsGuonrE+82xI5Pq/75XKWwdaWK/o7VF69fBwc0dnPeep1T/8sgF
 04eTPUZ36esM3Bn+74S7hYjF08TbizSTIX+rAyIWODukCgGHQnigebrL9MucwUC+8MWw
 eGrsOvO+Gf2vPZFYYoO/T6nFLixX/Sz53CWB2t8Ixum5PWccT0tK/BPjYjTjyeM2Q0vi
 Ps90l7gTC/YOFLbZs9JRIbpCkjxPCyCJaZdiKu8htUQy9veFly/QrAJiWkPQqUvFan0Q
 wtzg==
X-Gm-Message-State: AOAM533sz+svfHDAZwJDEJukmHdfb179SSN/sk52cVyEg67C6YSdfmEY
 j/ly2Sze8R1FOmI2LO9jLo5cenaENGy8uRM6Z1fe0ZR2
X-Google-Smtp-Source: ABdhPJzIXebLQ61HeQqkSigiI7Uo3D+RfXnvZGjeDB88CeQ0j0gUQEHvdBJ8olmbCn29nurl/zBq3YhtqT3nnsL71rw=
X-Received: by 2002:a1c:a1c2:: with SMTP id k185mr515192wme.39.1603131761451; 
 Mon, 19 Oct 2020 11:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <-II5uGU2OLUvxeRHxuPIMmnyrFPVyg6pkc2UM16KaQ5f6_kbDJN0se2tfgIf15RJLLKrWZg0niAIgXxr-0V7qBQGR9mPq306qamxuQq9q7M=@pm.me>
In-Reply-To: <-II5uGU2OLUvxeRHxuPIMmnyrFPVyg6pkc2UM16KaQ5f6_kbDJN0se2tfgIf15RJLLKrWZg0niAIgXxr-0V7qBQGR9mPq306qamxuQq9q7M=@pm.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Oct 2020 14:22:30 -0400
Message-ID: <CADnq5_M+qgk7p92daoUMNN-OaoXKeTWULUQiivGe=V_J4e1oqA@mail.gmail.com>
Subject: Re: amdgpu: Manual Card Configuration Change
To: Josh Fuhs <Joshua.Fuhs@pm.me>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 18, 2020 at 4:32 PM Josh Fuhs <Joshua.Fuhs@pm.me> wrote:
>
> Hello all,
>
> Regarding amdgpu, I've been using some Radeon 5700XTs for compute work with kernels through 5.8.14. I recently tried kernel 5.9.0, and found that the following is no longer allowed:
>
> echo "m 1 200" | sudo tee /sys/class/drm/card0/device/pp_od_clk_voltage
>
> Is this an expected change? If so, where should I look for documentation regarding how to manually configure these cards with this kernel. Note, I've had this working with 5.8 kernels for months.
>

It was a bug.  Fixed in 5.9.1.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
