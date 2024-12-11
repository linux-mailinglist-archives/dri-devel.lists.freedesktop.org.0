Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242019ED99F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F7310E138;
	Wed, 11 Dec 2024 22:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nqHXuctD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B2A10E138
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:26:23 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6d87fea84cdso55414406d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733955982; x=1734560782;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=/M/xqt3HYEq8xu0qvRyIhfyiL/m77tfLGjHEA9e2rtQ=;
 b=nqHXuctDT8hlIGtmDowe3z7VHrvXAWpxPs9d8QjV8uSGOxPNTSiqZdW0waWqrVbXVi
 AR3iX0kTiGvJHQhK8ntfwXG8FENy+KEY7Iepv0yaEomwCDgXGWsU8z6FWkZ1qf6T8JG+
 J4y0TsVvP+LRVZK3g5UOW/oId9JKzFw07hwao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733955982; x=1734560782;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M/xqt3HYEq8xu0qvRyIhfyiL/m77tfLGjHEA9e2rtQ=;
 b=ERaRh4eMup8Y/U94RfEMqFKlHPHvW3drX1nwY1VYZBRzEcpbEz8ovzF/HXRlP6fkY6
 Nkas3VNp04kq5yilw6+zyBI6uyQPYMfTj0WHmmBAmpZQFOwOKvoa78hKbYK23zZHfOQI
 JZbswNHpXPGF3Z+f62DeYTht8gdY4nR9MdF36oqYpj8bn6MUlB/0YT++thZucwkSfFYW
 1q2bkqSOtw2iB3uWeOfFkCMdQtnMY61+srPV8zSnRF5N3tW4eYHt3w84wWsj6YdPIQXu
 bC7XIc+5yi2utYHL8FVrdaOqM5jY8RAdNIUp5//7+nJAZk0nFnUW+4c9dcUrBH8MZtHG
 UkuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrtffRQXld0fmVUZKKiBE0IbPlG0HmWt3Dd61ppgaINzSvi4jCWQgNus6gVZD4VVCrF407A4FOrxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSYpcrXhJaZ7nPbfg7iEK86rjgDbVcmjPtbmWlPcrDnytgfNsu
 vhQsGPcn+z13Imip1PtDhLESu/KWyuu/uZwwdeMZhVhYkPtkY+J7g5ZEJo7dJS5TUm3mx9KqfN1
 FOfqI8JYbATvhWfAsCAxTF5+8Fwd+zTPc6Pi+
X-Gm-Gg: ASbGncua7mXMDCUJu10+6vKfw6RUZ2oMXEOLo+upue2cT372Api01vg4zLZEsq3K0E9
 vciSeMaBzqnhDECODqRt74zSkV2++Xbtb6B61VWZSOax1RvRHeyeq/EatWACAW7U=
X-Google-Smtp-Source: AGHT+IG1XnoTiDslXI0cLjNa0JxPS1XzZXpqmwomEHJN72jbeseiTASByoXZoRuL5Gwb8j0Gd5R1nHZIPbm0MA4yihY=
X-Received: by 2002:ad4:5caa:0:b0:6d8:883b:142a with SMTP id
 6a1803df08f44-6dae38de1f2mr20414676d6.2.1733955982669; Wed, 11 Dec 2024
 14:26:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:26:22 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-8-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-8-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:26:22 -0800
Message-ID: <CAE-0n524xYp30nsCh4+-N=dy8g3EuKTkwA5yXbOOXzMeHJztFw@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/dp: move/inline panel related functions
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:38)
> Move panel-related functions to dp_panel.c, following up the cleanup
> done by the rest of the submodules.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
