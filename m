Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA99F38F6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3610E75E;
	Mon, 16 Dec 2024 18:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NyTPjwct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78A610E75E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 18:29:59 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6ef7f8d4f30so37801687b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373799; x=1734978599;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=D6BkjH67J+jGm+KB+qtNt47cbbPwybjknONYRIcntzc=;
 b=NyTPjwctg2bVPU3duv1TUAItq+6cA8vHdt5q251qqLoaYy32yeHqhHtCx05RUcCMLI
 o1OmY5FyIHSo2q/6sGe3RH/evgBraS9KhaO/TBpcKkTk/Ztibi3fvvPQFQDtzdwKNxae
 Te75AFepDdYJUJlfModhkziD0T60LCzsyrTQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373799; x=1734978599;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6BkjH67J+jGm+KB+qtNt47cbbPwybjknONYRIcntzc=;
 b=imM7RPfYOGO6Ayk9OWM+IthVOwOmICNWeLgTLmehHdMBVECQfSH9C/1LJVBwq+IAKo
 l5jRzrvzmklBmkH2+wDOQZ9Wz4qcjFuxvqY1mYq8DGARMdAVjrmFSk20y6LL07ei6Zsx
 Lp2uBFE7xIskiWk4IVXF1K2n1SfShGEa8YcUc0oRbj0rktxWDffvY28RSeuyi4mvvSPL
 r2X/uqNL6Ez4lagOvLqwRrZjEzHCdjpZonJUbkIUMh0lNB85E7B6ZGPKO7EVUMtHee+m
 xC8UCBKYy1wrtpOhVV3jlmDI4TbOGTKsVZ8uMnCm9mxgk0faY136jv/ANzbFz+Z4/RNI
 QNPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbjehszNt3zTGWcc+7FBewrRP/y7YamjkwTnZVmu9nVvwuYY0CDBPQXke/D75cx35Gv56XRxoY09I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCYTe9VnhHl5iO70ccpLFSdtWyitgZVNwO3rtLbdmEk834FZm1
 0wzIFOgI0nIXiCcGSjtpP93a8MsU+23PcE6vm30QabRvy+zBTeNrf9pxRgPE1B+xJ1mecTf9SJq
 EW54Y9gd00nO2YtGIVXGX8PvMaYJWgHpwGExi
X-Gm-Gg: ASbGnctGMPgCblWJe5TbDkZwJZfeGdyYQNW++x7WrqNym2WAT9B0ayRy5wNcwpLSlZ+
 WtQnGpYTzJy2XcV6eGvdph4CScyY0Nq2Cd78Y3xaLPLOujGttLvYItXqTAAXZHPWUFQ==
X-Google-Smtp-Source: AGHT+IFec3otTchyFxbDJfKFBz47WzGfI8yjCwnobgW8mFZyVIcbwLvFYT+D1W5djrG5rBzv+7Jo60SR7JxAagJAj/U=
X-Received: by 2002:a05:690c:6005:b0:6ef:4ed2:7dec with SMTP id
 00721157ae682-6f279adac53mr117919057b3.8.1734373799003; Mon, 16 Dec 2024
 10:29:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:29:58 -0800
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:29:58 -0800
Message-ID: <CAE-0n52Uj6h=X2PqZcPBnPDR_vVfi4_Y_miG-dTPP6FzH8rtag@mail.gmail.com>
Subject: Re: [PATCH v4 15/16] drm/msm/dp: read hw revision only once
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:20)
> There is little point in rereading DP controller revision over and over
> again. Read it once, after the first software reset and propagate it to
> the dp_panel module.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
