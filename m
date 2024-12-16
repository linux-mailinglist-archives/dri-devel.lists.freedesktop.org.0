Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452649F38EC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B9610E759;
	Mon, 16 Dec 2024 18:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RjghAhZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F51210E759
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 18:28:34 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6eff5ad69a1so35947507b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373713; x=1734978513;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=rO0fP7kC0ChLCdFf2h9Dk5fHEcQ84J84WudIRLZjttI=;
 b=RjghAhZKmDRNBYCHUXzycX9Gr6Avl6uCgipbCyiy/A6IjwyjRCHd3sAr79yWPpzz4+
 JWlvNEwonxrQz7ajNjqiFJBA+57Q3gZnMPh0A6lYG2CFeMLJFaKEb4eW+ZxBUAom5VLj
 WhzV6MgKLFSqPMhu8PhsRSL407sp+8psfRYyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373713; x=1734978513;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rO0fP7kC0ChLCdFf2h9Dk5fHEcQ84J84WudIRLZjttI=;
 b=G47NV2kXJKRIzumT2tsiNPpUsYBpvTkqm/AWccIp0+iDOLInkQndrXfZzl4czwEdxD
 GBIpSnuSrZKzWXuI3Z3g8plXdzglqrxUeMceoc751ojcaA+hIQB7XUu2317AEoIHQMFI
 H68oj8uv0nzerM1IyO2MQ+IxGdaQBOzkPkxGyLHjjEqGdaEweLmgNTQTXDJGUpMIZ0GM
 eqAQ8fqQDdhvmehcwmNEVzEa2Se6PtV5f1/t9lzNZE1sZ7p8J1TBBBOcTOIDpPQn/e92
 MasOENVVco1fbqVz+i+luTd5aPMHyUxsFYZjDqTwpalQeqnGHsPK0zhvRssCWDXktQSA
 3Icw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLDZoA/6a5AnP9lvYlKX/awO5IQfdWxzrjoM5XlPDGQCUTn1+9pstwcPgq6zkChWnZwnsHi3tsvjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXdqk7yz2MmOEFTEmyK5k3cbdFpLMXTin1ct9zTcWOYYBKT+Um
 CZmW39H5SllbhDsRdVU47WFPQfcLKxCyOGbp3gv+TQv5kyIn/1RWHJzLZo8mnqO1F6OC9OuRA6J
 bMshOKLvWMaGIsgj6unUUZvZZoPrcqiC3LTnw
X-Gm-Gg: ASbGncvr1IX2ONf/K05rp8XN3y95NtpVg3AJ2JTbZ5UbWd9OE1WbnwcynwIzUTMlB7e
 giDecP740lB3SABKPk6VbOuezjGFr9emHL7Y98EiEeV30ELaq/RF3pxkEmflKtUqDuw==
X-Google-Smtp-Source: AGHT+IE4CdB36DYH9vipsU7nBQzIha3QX2anHYVsV1wQT8Ge+vTgkTSbipalEX/mJfncpySK3J6yzUz+Iw2WBcHVy54=
X-Received: by 2002:a05:690c:6408:b0:6ef:6d61:c249 with SMTP id
 00721157ae682-6f2bb3a54c2mr8410207b3.39.1734373713619; Mon, 16 Dec 2024
 10:28:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:28:33 -0800
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:28:32 -0800
Message-ID: <CAE-0n52uH4q5=QbU7V1jvRmvccAWTF1bOSXZ32j2NxKEKQVhMQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:07)
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
