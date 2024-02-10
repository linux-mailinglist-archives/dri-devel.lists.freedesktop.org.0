Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A440850437
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 12:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5C110F95F;
	Sat, 10 Feb 2024 11:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GioHjRXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E38F10F95F
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 11:31:31 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-598699c0f1eso1178142eaf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 03:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707564690; x=1708169490; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M4AqEzTtCCjUhsIjO6HajtAUGJbh5B0Lu9dEnEpAroI=;
 b=GioHjRXfn/+vb4Y+pBg71NtkWIKCqPcOfTaVbrEgZOaD+Pcs5WrXULLt2cg3uzEZzP
 pdn8sUZ0LgugZFEJQj75XPBlkEX6mAgxvwpET9HuUv0BY9tJ3+LbDIL3cWJxlpWEtwaQ
 tCsZyTLS3hw+UyszBWlsmF2BB0wHr3nDw9gLQA9hcvv1ifNPuE5//QnTKhVQz0dn1WuG
 LZvfzq3Jh+IQGuquuRugXY44XYLNjl2+5GSXyv32YQ58LzcFWTyuZ9of0mr3PBOeG+om
 MxwHkCaeckspY8Ms/5oaGDNk52vL7z2EwGe+kGx8sAY0XWP/iMJDrbawx65y18U0nCvG
 Kkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707564690; x=1708169490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4AqEzTtCCjUhsIjO6HajtAUGJbh5B0Lu9dEnEpAroI=;
 b=wO3M2FS3p/nqK0oT1/Wr2pnHMbZgifjEiwQpmSutNCCWyxQCJcqXvOlkQO5m6EFsxS
 MvYBbo+oCZ1kDD3ttzxMKWdijf2GHZidSkxNcdC1aKAYHqAZufNUPTP9VwJn1qHUVrkb
 JsY6OL9Iz10emQQ8VN+BsdyCT01MUvZBCMZzvOW103BLCsgvw8TvrYhWS7KZCtlZMo7M
 aIXbLBRK3lT32RzsbA8/bFVKd3mSPXLyMsOsis7NVg3ujnXXnZ+b6TV/cjXFsNGcA3kK
 3dt+w2E+OC3PlNnmZlx8GycdTtfBWzvTmahTVIob/l35iZhgWPImszjAjiHayg2eqZkj
 C3kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFXUpqh1dRoesBqxq54nSho9b/BHt0FFLdTwuovhC+CSBAVZ0M04viMr4daUlxnHlPQQgYp+lpTXy5L1ykVjLMQlauicjZ4ZMag1ocmBCd
X-Gm-Message-State: AOJu0YyuziBFsdEcZ7RmOW/omyT1oktwAGr2sh2yPcr+ZOX2xvgueCvm
 4iTtkxxc3RK8f3+M1KzkX3YjPS5ITEbHBxWC0HwTX3KCI/1hpBMAZYzeizCaPyen4zA7Na0fQY9
 NbsnW3ojmqSly1OZUAbvBT5SefP9goIBek6c0Ig==
X-Google-Smtp-Source: AGHT+IEwbU4Urd+epmxc0Oq7zQyb2ah5l24AnSJhfOyIVqyt2jvHOugDdn5MyWEy7q3O4vfsPa7YZCHwU1rvF2/qAyg=
X-Received: by 2002:a05:6358:199e:b0:178:8cc8:4c7b with SMTP id
 v30-20020a056358199e00b001788cc84c7bmr3127825rwn.24.1707564689944; Sat, 10
 Feb 2024 03:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-19-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-19-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:31:18 +0200
Message-ID: <CAA8EJppnT2Rfi8R0yiSwD8TJCw9JS4Q4sVrgUjYg36qMTr85EQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] drm/msm/dpu: reserve CDM blocks for DP if mode
 is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Reserve CDM blocks for DP if the mode format is YUV420. Currently this
> reservation only works for writeback and DP if the format is YUV420. But
> this can be easily extented to other YUV formats for DP.
>
> Changes in v2:
>         - Minor code simplification
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
