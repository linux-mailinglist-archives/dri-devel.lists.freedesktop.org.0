Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE13AA08FA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 12:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6631010E41A;
	Tue, 29 Apr 2025 10:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cWVhq1IA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7F110E41A;
 Tue, 29 Apr 2025 10:57:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso28713975e9.3; 
 Tue, 29 Apr 2025 03:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745924247; x=1746529047; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uvtd6fy4RCGG//kBsfKgM+4FFLLpycksKJkZw5rqC0Q=;
 b=cWVhq1IAACKfpxcXvLRHj1t21oEmYRhdIry72N9MEGfyatCHdn49WiXgtA/cu8pY27
 gB4I4N4ROU+19jnHI8sXK6uLaECkic41zkFFz8IvbpVaaPyrkeja/jSOWp+T4tsLMdQl
 C07uTue7XXrNiVhWxmshGgS763sx5yWQegG2Fl3L+x5K/QCyBe0QjyedaC/zXY+8a4y8
 6wk7LSROj9qWklIjm89EPmusVS1UvaOngovHAZf8wAw37t1y4LLV60Q1xX7PaKU5FP/+
 xRKl183MFj6riReZziZX1WcsSpUyqNP6vWi7f0z1h0hd9qHfkeSikVUhAabPWtJh7keS
 GP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745924247; x=1746529047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uvtd6fy4RCGG//kBsfKgM+4FFLLpycksKJkZw5rqC0Q=;
 b=H9ykgENCtvp5xZmuUltjupnYqY5hixnmS8870PRwGgdB/M3ItyhXiQl4qBNdwyg+5W
 f80VPgGfP9S4cQBnXFeArHV/MVzD3x0jgKr18HlvWGYzWQ255FW4W/tXL1v/5Vq0hptH
 0Vsv+cCTso+xnxF9mHxkibT9+uDpECmTDPZ+SGYPCcM+cMmQjd10gkLuOfp1i41c1lyy
 /fQFTnJxPuomLfUdhF5MO0EnAX3jb+C9mtucyBwrspAb52y+u1CMVD7281XaCaMCgmV9
 J6/wQKeFKRcu5iY4ONFt9jshcqjZwauzrAWJBcSdOyTxM/hYlXw826afzBLH1eyHc2Ir
 GWEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG03bZPCcAr+Tt2Osmb5i8/1V50RTQFyOrymitYAzfV6YgQS/tBCFyIKE476cCRjPE31cy7V6HJjHq@lists.freedesktop.org,
 AJvYcCXzR2J6DCElMuQgmjrdoo+apPRBxVp6nc0v4nZA/k3SjliIw+9yjuqKFaAHGtUqi3SE8MmygtQ+rsk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd6+WSBfgDRr8sW+0k3fGJfWT8PhPTCqz0w18faf1cc0qZj3rR
 4whUMHIogUF0nyd6m9m9sRHe2r9a7dQZakGPhzWpuPbRYJNjIm5I+uOmtFTIhMJ5U0bM6kABfYj
 prN6AgipKTE+mad+WxIwcVAZRMw==
X-Gm-Gg: ASbGncsbagxg+iWg6AfOpkhvX9vRThlv3BUJP8jLTegqeuYPN33d+4mjadSM/wAshr0
 nJIsPXpQw2svOPORPoKciGJaI6vD+1PeW4DWQK4SYLv6pdgWIju/HJgzmPTne3Au9btcGNyazNw
 m4F7x1ts9fUTD7HxZPxjnvvg==
X-Google-Smtp-Source: AGHT+IHirYlnb/J0Rw491chdfeUL8F8I4KZrN9hJ04U8tCSV4ragmKxqYNjWe5UdaZyFQMvJteyrgFv9C6magoKSZoE=
X-Received: by 2002:a05:600c:1550:b0:43d:79:ae1b with SMTP id
 5b1f17b1804b1-441ad3b5ea9mr23239755e9.14.1745924247107; Tue, 29 Apr 2025
 03:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com> <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com> <aBCE3wSG2g5pp7jg@linaro.org>
 <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
In-Reply-To: <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 29 Apr 2025 12:57:16 +0200
X-Gm-Features: ATxdqUFvmRK5viywa4f0WLPi0f48GWdtHCGAXUyP3eWhlaokJqLCQWixu2VChH0
Message-ID: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com
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

On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > On 25-04-29 09:23:46, Johan Hovold wrote:
> > > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
>
> > > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > > adapters or docks with retimers in transparent mode?
>
> > > Ok, but my concern is if they may have worked in a default transparent
> > > mode.
> >
> > But if they are by default in transparent mode, doing the setup to
> > transparent mode will not break it in any way.
>
> It looks like it will, see below.
>
> > > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > > would return 0 and none of the of the transparent/non-transparent setup
> > > > would happen.
> > >
> > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > to the count or not? If they don't, how would you ever learn that there
> > > are any LTTPRs? If they do, it seems we may have a problem here.
> >
> > Count gets increased either way. It doesn't matter if they are in
> > transparent mode or not.
>
> Thanks for confirming. So then it seems we do have a problem as since
> 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> mode.

In this case, let me add Fixes to the entire series. Do you think we
could land it in 6.15-rcX then? The second option proposed to roll
back current LTTPR support and wait until 6.16 will completely break
DP output on all X1E, so it's very undesirable.

This series was tested quite a bit on at least the X1E/X1P devices,
both with and without docking stations, as it is also (v2 iirc) part
of Ubuntu's concept tree since little over a month ago. You have
confirmed that x13s also works with this change but without a docking
station. If someone could confirm that x13s with this change does work
with a docking station as well, it would be safe to merge the entire
series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
perhaps someone has both x13s (or another qcom-based non X1(E) device)
and a docking station.

Thanks,
Alex

>
> Johan
