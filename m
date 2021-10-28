Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFD43DB2B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 08:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8FC6E5D2;
	Thu, 28 Oct 2021 06:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C036E5D2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 06:33:24 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o4so6903637oia.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=012a/Vm5/ys3I7xHUTpKoav2CLUL7YSpnaZKJZYXlbU=;
 b=kB6S9D3z3JDO5QzXuz/0sV2WOSEVXZ2qgSY0IZnKfGAJcuUfZn8yCNPiCiar7BGtV6
 p76fd7ObCQ41N8/bGr2+zEQdqFjOZb6RHaCKFtlNwaLIE9o7aFPPtECLa7F04KSjB4T0
 unmdhb6IwfpxRslLEclYxHgHi9c7Ote5ZJZH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=012a/Vm5/ys3I7xHUTpKoav2CLUL7YSpnaZKJZYXlbU=;
 b=RdA8aEteRM+txH6rd7vikc2R7+tlzrirSrUE30Zi2NcBc+1cHVZ/vZ6poPu1y9BIq4
 EyQSz41CMhcax/FATwd3utAtSDdExnMH0AX3+DDPEWqxNt0SKAAw4XHJB4xPvyo2wtEx
 qN+GJ/5GJX4D8TVq0BxX76vwtoy4ejxz6hcr0ZgRxvsEJJgmWEv/ytIIcArGPObxsm+Y
 99ik40M1J/uX2yD5v8TaELqRCt1EVQyM1Q8iT9qEXSVqN1VFELywldQ6Exfbo9zyIuu7
 780f6BPXtCLpc76o6TE7eY9QpJPdecx70cgFbftD9wtLYuxv0RmRLUtszl8I/JU7zPce
 2q2w==
X-Gm-Message-State: AOAM531BCjKRQXd+dht9EQhJ471jKuqW4s4Mvc/IC+YybB79K5jsSCuX
 I5IpLvF+uc9LwrS7CzS/a0hU1zK+w0f350mHiJ3Vcg==
X-Google-Smtp-Source: ABdhPJwKfcrcVbkDjjQUjrvG2947KpA9p0L4TJMaJtoUfNTXn8AL7+GfwN6Z13xYxPFcN24NqTGRjkARDf39SksmrAk=
X-Received: by 2002:a05:6808:a1d:: with SMTP id
 n29mr7024899oij.164.1635402804016; 
 Wed, 27 Oct 2021 23:33:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:33:23 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-5-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-5-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:33:23 -0700
Message-ID: <CAE-0n52b5xKboi6b-J0m-W_rbjgSzyJqhPrMVaZrm65L2GeOFg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/msm/dp: Enable downspread for supported DP
 sinks
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
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

Quoting Sankeerth Billakanti (2021-10-27 18:54:46)
> The sc7280 eDP sink that supports downspread will fail link training
> if source does not enable SSC / downspread. This change will set the
> downspread bit in the DP sink if supported and indicate SSC support
> to the DP PHY driver.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
