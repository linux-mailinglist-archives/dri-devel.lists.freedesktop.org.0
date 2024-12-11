Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A344F9EDA82
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A9210E633;
	Wed, 11 Dec 2024 22:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="k9nw99Hb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B474F10E633
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:58:54 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7b6eeff1fdfso2366885a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957934; x=1734562734;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=d7oul3/epjfIWJpF9pC+/pDis54zJFCmAnINjv8ddgk=;
 b=k9nw99HbQRPecoOI9s0rfOWi2BGN5u6N6vR8cWDzKW1gOwUcZ07ZZznUi+NLL7VWe0
 4C+dKnGNREvBvnq/S7Puf4TFBVYesyuZKTepQ0W+gBINRiaNwsM4Kh8Sdh1dLBGXLP+3
 N45yZyLqHlBGrZpBlfJED5fPbhxcLLRxNxaW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957934; x=1734562734;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7oul3/epjfIWJpF9pC+/pDis54zJFCmAnINjv8ddgk=;
 b=tAfuvEM64R6MGYRUnUTmUDrFmGHo4KSvkoIlfgeeOsmaUIrgnGcu4htvPL8WKIAg7a
 hOVJPExDoPse09hBRy/3F1DG98qymgamvaZ1J8vgPk/xFliJCZRW2gM54YKvZwymaeNK
 t5W7CETrgLXWFPjROd+OTgKWlxyFSO87PnNRoaGo0mRAXbOvEredzLULi6UQ5DC8qkNw
 5JhJx9jLI6Rl/NyX9brcDs+szTQARDK4PGPb9dNFSNNvkhTaBE8VwQFYSL7cQWjiqgzF
 tQ0XTvbrB8XLzGed2EtKpE1HVNQ99Gtke+y2K06XlgDA0UBZdMJAnGa2u4Zsc3iqI1wx
 m2iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Xpdhx5gxm+NvQpFp5CqjH+7Fck4+x2aU+Orzbhjw8e3zErE1UycPButdV+7fieYFtSEpHD+WUp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjPy/HPfXAunxLiQIry2Dmu24WUq840o6e3M/4acJIKzrZnQg5
 5ePjCulaiWNn6bkZ2xi5PcJJ9Y57oFi5HAI9gkpyJ2iao6ly4DWO2QFnjv6hq9mo6uGy+LiCcro
 GMhTujK4udiv0mleAo/IS1aWUYPmnNGGzfq/Y
X-Gm-Gg: ASbGncs04zdNjUbxULbmQc0lGMvAIGsPMQkosI8HFaSrg65xTd12LMgbswKRP8uzpNx
 t3IkbfURJF/0pIdiOaTYttVLngaKMZH+Vh/IfrMR2AqpVrcVS/74VF7A7/lMUe1U=
X-Google-Smtp-Source: AGHT+IGPvlar9kD/U1IZ+NJKxYLinjgrZQ9MpbRulgpuokUWHWjoaaMJU+Xn5x1nVqU9KmYDv8PLu/rJckgmgpIo2wo=
X-Received: by 2002:a05:6214:5293:b0:6d8:8cb0:b40d with SMTP id
 6a1803df08f44-6dae398c5efmr20747426d6.39.1733957933934; Wed, 11 Dec 2024
 14:58:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:58:53 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-14-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-14-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:58:53 -0800
Message-ID: <CAE-0n50Ae+HqW2ZvZ5n=zgw0ZNA+ndgUFf_vFXZs3uzj3VPQzA@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] drm/msm/dp: move interrupt handling to dp_ctrl
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:44)
> It makes it easier to keep all interrupts-related code in dp_ctrl
> submodule. Move all functions to dp_ctrl.c.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
