Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AB9ED98E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B4410E083;
	Wed, 11 Dec 2024 22:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="b0SakZ/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A75010E083
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:22:58 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6d8e8cb8605so35084576d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733955778; x=1734560578;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=MJDBBPfSDpJWtJb9BzIGgtoPQLKoUXO+S1ieKhazaPs=;
 b=b0SakZ/efcWnyeUWB4gYhAzWOPJkuwDkyacSxoQcVEbN2CCT0uzx2OUt7dtateAk8L
 5zwECWS1zN/R2AxE/rjrTAHZmmMlJABUJqfpE4rgy5fziQGyEkaoNidonNIqV1jPB+RR
 OjIZ4d4Yqqxb5LBc2rFuqd9Hg4BzPZh4ZUwSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733955778; x=1734560578;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJDBBPfSDpJWtJb9BzIGgtoPQLKoUXO+S1ieKhazaPs=;
 b=q0/yXdprmIHfXSi0Q2rBVnen0ZBWcC8Ocb6mPn5K5aW66PJZ7hfbQlixo3P/mA15b9
 Oqg6f8KTGEFe61N6RHVS9URdYFWPf3cZKbWY5Q02m8/6URNRNIr9zlkT6qQkNCjsy5gi
 k09oWXsIV34d/ZpD0v8pnBr97/ErlfoNPDjCyWfzGzyJDiOvkKB0rP4b5KVI3liMTXsI
 +r89funAc3zIwglDO8UHtHqpqgXM9j1QM2mHSp5AHhn3GKusbDL570oIjYhnU19cBzTZ
 J9Y1j9zpa3Mlqt9Ek/AEWBhb+4fAqr9txBvzcQt3ZMGi6xVFlKLmdOoVoheEB1c2U1fU
 bJxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSePLPYdvAciITw1KBRR+sDcALkjPo+yB//VpCC6x9if3lt95t1PfzdjJ9S2qtc04kiL4S6zit7fY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUg3YTrxHs+z/EPv0Mjl40LCcth2JIWsSQV7fPbhZVHU2tJawt
 x54AfIZtYvn8VBlehOW7t2/RKSc8wEHuHTfiRInPycE90PbbN84YUNUT8457V3NE7k9446gHBID
 +EPb8H9J/V5VhzYSC0tJRawj8d4fKfhJzti4R
X-Gm-Gg: ASbGncutCkCV1kODDMngAtYmnxY56Bv8M8+cuGkv0anbm2CVxfVoBLbFi3Juc+UTbxT
 LkQc3vUf4bPE1G21KLt7HDesTcURqqeL1/GMCODkcCwqHhXaacgtJ2qvD3Q3R1Uw=
X-Google-Smtp-Source: AGHT+IGzWdM0tmUIo9hkCU9nyE01NRmj3O1QuD2Ba95w/TbRxxu4YMhY0/0gBbnPplq8JU4pMlDSW05l9pl+kUE9bGI=
X-Received: by 2002:ad4:5ccb:0:b0:6d8:8a60:ef2c with SMTP id
 6a1803df08f44-6dae38e69a4mr17111236d6.2.1733955778063; Wed, 11 Dec 2024
 14:22:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:22:57 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-7-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-7-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:22:57 -0800
Message-ID: <CAE-0n50_NvLiWmfNnQJJKLn=BYA82vmPgy+6Vdpe8x+u6fwn1w@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] drm/msm/dp: move/inline ctrl register functions
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:37)
> Move CTRL-related functions to dp_ctrl.c, inlining one line wrappers
> during this process. The enable/disable functions have been split to the
> enable/disable or enter/exit pairs. The IRQ and HPD related functions
> are left in dp_catalog.c, pending later cleanup.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
