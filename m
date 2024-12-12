Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2999EFD6B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 21:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7956B10EE96;
	Thu, 12 Dec 2024 20:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hwpGViZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC5810EE96
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:26:47 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6ef4084df4cso8641117b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734035206; x=1734640006;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=SW5CnNui3R97mY2cLBPEbaMn7nNMtZlM3tT/CgKujL8=;
 b=hwpGViZ8TNHu7oXSnoL/qGLhChKfhO+pcVoCrGfwrRRYrsdRjoXGcQ/rNLJSBPCvD0
 ttVNM24+WahpmC4WwLNAX+CdQ6KepMD5dcJ5na/aF6oE5PueMdzokhJQrCvaxo2rg0bx
 PbdaBJoG3IGNDk25B1Qno0XUcA9ZXZimr87QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734035206; x=1734640006;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SW5CnNui3R97mY2cLBPEbaMn7nNMtZlM3tT/CgKujL8=;
 b=aHH4BJXhPo3XTLL/xbgj1tvyyYR+wIDMCiCiiUMXnz26whD1aINIy9PM2LiKqmcugu
 T8zCi/9ZJJhWecm6X2bod/GfEu5ja8yDPcQ+ptDYaQ3D8SJUjlt+G+y5I9vKpj4uZNJZ
 STZlHWjuID2XOMOicunrBHGN5pEf5Gpqz/uDn7YjEuKbWf+pPvp+Oh9MJ9BGu+jm21a+
 B+cRFuvT0GA3Yul4nzdF9UewQyXslqzqyThXOZsdLuu5FWJ3756zx6QogdX9rp1QAZL/
 BwIpwFi7QlDnkMsuG+P4B5DQInz04JFn8bMChygblxjmrOVn5D3YgFzedLdG6GOfywD7
 apxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQPDY6yCtb36jYKVHp3FwDT5XCiNxvVFEGuc1VH7PC+PEAvuA9VszpdqYbuSUnpPCL6fzP1LNsfsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXBa3yWBN2FucxKVwvwrq50ohcDpNIpbL2bexMlFQQ0/kpbiCd
 OEErB9iyfscs1IwWxvRSWpeujelcRhc3jLP2RRMZgCXxkyNvBh/s83xHERZaoD1QXfzUAu10/Qa
 VCpCUm98cxk/11VfNG4FIc/tu4WYA0HRfDMlO
X-Gm-Gg: ASbGncsw+AYS30TxLfDJpSmR34i0eyH1lNGr5seHOPD56B2A0urUWjk5v/zpcgjyNlz
 TStqVuzQNNU1KW+bww57pXvQ8yFou5KY03U0v2+u5Dz5gc28PfP8P7HqFercQPGtYww==
X-Google-Smtp-Source: AGHT+IGFOgDVm4CFDXe3IU7TrIeBHR0ltNsmIqxmA2AqNWpAHBHRWN40vh5Dhn/6yXzuo/xaxcnVD3/msC5W/xKQZns=
X-Received: by 2002:a05:6902:140f:b0:e39:598a:239f with SMTP id
 3f1490d57ef6-e434f945c4dmr88547276.49.1734035206765; Thu, 12 Dec 2024
 12:26:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:26:46 -0800
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-6-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-6-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:26:46 -0800
Message-ID: <CAE-0n52xCodsb94V2N5+ENsft81LvHrngTrcc=w+FSYmmXELHw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] drm/msm/dp: move/inline AUX register functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-11 15:41:41)
> Move all register-level functions to dp_aux.c, inlining one line
> wrappers during this process.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
