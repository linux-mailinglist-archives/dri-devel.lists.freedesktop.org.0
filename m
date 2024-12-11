Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDF9ED970
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ED810EC39;
	Wed, 11 Dec 2024 22:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cCTfPckH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF49410EC3C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:18:21 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-467918c35easo12478031cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733955500; x=1734560300;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=0rt+LftUaiIAtV8Lnqx/UsM/DKwcWcCSJ7gULGGysG8=;
 b=cCTfPckHPpoLuPxL43NhIpCdepdQEEX4ufesIDd/PwUDyJBZdjE1gmI5U3Sy2hXd08
 +OKWuKhP81e9icAF/MoZB91rIEAcpLlMBVgHA4EJyGp7EX7srZhT0VIcuKW2r6rq9mgm
 eP2K0yw7UmxMYniQG6S5QI2WI/NKBuRktMKLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733955500; x=1734560300;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rt+LftUaiIAtV8Lnqx/UsM/DKwcWcCSJ7gULGGysG8=;
 b=a3Llp33JVj+rN9d3JDqqwKX1KGpkWPoEa1bwK7RMfRu2h3FOWicaQBl7kpjaYhD2C4
 OEcsyfjt3nkeZj4oDRQTzV00rIsHtXtXDaIXDjdnJpkNYfDhsP9mxexciVuqzV3MSQw1
 9GVXiVxJ3gvCRaNeKzCZdEk3Ax9QK+0/1pA/QwjglpbZkitpRjDEWyh9HGWojXTYWqi4
 fRkvuHWtdKFoKwE4lLBWMZt8beJhr8ACSYNAVEEKIEdLGa46RrgJS2LWcmr30ow8CXKf
 7xLw6C3TtnXhEaE9MiekvPre6KZEN46vJPSmMEXPPoxj3dwNKjAAcAQnbOsS0VaTHfAG
 CpXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSTKOzScjr/IlqnouPXiA6JS6zDiWCcZTVJG2VtQr6Z5LUPU6+XyxS3bevu4+5BGatgTp6BGgFEOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiY+LlqsD0C6Eg9E0EaYYkZK8fbY/QG30gfrzvwYUGG25bSd7h
 i2O4aLy6B/PlrN0Y31icPdaAMSSE9vO4SkIRB5lRmT361rWWOaXJJLUQKUXNoE3PiuCUikaoMiA
 7uGlRt8lgeyoJwTwHtHj3dX1orqpTXDUi+VRp
X-Gm-Gg: ASbGnctwgEvIzlZwi3PQprF2/ojht/xWeJwrPZGU39CSokUYXIr5GLHsq3PEVJK1W1b
 T920sBz5mOpJxORj5DMFbe0IBiPhiaZWaeKENTNrYB86Bl7k7D6dSTRmL8aqebVI=
X-Google-Smtp-Source: AGHT+IEh22eo0rd7CRUaBnizbOTPapamAsVOnD5oqCjCeDY0vRSnRalP/VlK+LQ2LP76cy7+yeYmUI+Cf2UJpD/kvGU=
X-Received: by 2002:a05:6214:d68:b0:6d8:8e0f:8c03 with SMTP id
 6a1803df08f44-6dae38f5720mr18047506d6.18.1733955500628; Wed, 11 Dec 2024
 14:18:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:18:20 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-4-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-4-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:18:20 -0800
Message-ID: <CAE-0n53V9xmrktUBpfNd9Me7pig=c3sP1AcCPdKnpDd-RSuakw@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:34)
> Having I/O regions inside a msm_dp_catalog_private() results in extra
> layers of one-line wrappers for accessing the data. Move I/O region base
> and size to the globally visible struct msm_dp_catalog.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
