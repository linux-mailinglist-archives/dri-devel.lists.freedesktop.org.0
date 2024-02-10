Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666678503BC
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7210ED51;
	Sat, 10 Feb 2024 09:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NB0bxXSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9691E10F550
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:44:58 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so1713677276.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558297; x=1708163097; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wZ6CRidteOeNsDNsYH3R4IcXLfOLzQiLCa4L+raUHnI=;
 b=NB0bxXSZYEXDDf9O5TTnu9snExtBHVQEOvfXElxk4WUX/EuacsfsVRrCDB84leLNMq
 WugLBFSW1qXBNNAIEOWZw5e7bMFhIVqaTManVZcTJxokP1kLJk8BZXeHmTYghF3cyZxU
 sxNF/STh/CaZ3JGNlYVcrqJaffY3DOI5152hAP0P7zNZY3N6a0K1GnhqROM9YUce82ow
 PoQ4Zci+Wyyl2PLWavVTXrt6ea0ko9FwNvC9QzZsj3wGl1UNaliwO/WfchNFiN/+IHfW
 2Q8M/GhMP1PohDNUG86iIx8VjsLXlJhNIZ6tUoKpqQWmckwJ26FT+SIQgrsVmR7ZHf01
 2uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558297; x=1708163097;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wZ6CRidteOeNsDNsYH3R4IcXLfOLzQiLCa4L+raUHnI=;
 b=DoO01RIdL3DHbwrViHLDB43DkiWEP5hidJNtK/fF7Xyf6n+asD6kHkrD/GEitUqyiU
 70W281CFv9Lx3HJLm7fvEaiuhd0HGi0ixwYpjEkzdi1co/yVrEmcD5RWty8dAYO1GTVQ
 MtpPsWS4rSH9s7ESwPVNxTQW2hMM/qbGasG3IRbLuRK1Izbv0lK6RGiDFDKnxQ5nvOoj
 Wt3EZfHzBl9QtVrKZpj8SzzNM087dLqoNK95luvMM2VgjSIPq3qoFWG/Rcz22Ns9/VRc
 Y+UNOmam683iZ06oIyC4zlsAphtfo9l+N2oHwUX41fFfFG3Pw6KN+DyDVHk8x/326NAP
 AC4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQynow5WIdMzfXYN2Zs7pr5jXX/qLGduh49ezKJp8MslyaaHFhOnV8+hTyo34gnk06fxrh9ifmWjyAUTLpB2al9K20+GDRiSUowhirrJTf
X-Gm-Message-State: AOJu0Yw4niU1oWLh0vKoJTymbfIO1axJAbalTNnNBf6iEHtV0YRuO+ih
 0/Vj8Gsthg2M8RhANOUTLYzuFWq464XqD2wtWc3sONkRJ9TRcDjtXB1jLP2RZp4pIAI32wj1tt4
 gLNPgJJfcqW4jpV5COyNCFc8lrMbwZPKhTqwXm8bi5nYH80DQ9oA=
X-Google-Smtp-Source: AGHT+IF0eF6lGAv+TUyybyGNECGzCMVsbLQbS6zL7lEgkfBkLiiZ3utg1bX7sy4VZtcBLvZgXXa1fnVTapkwH3o8UVY=
X-Received: by 2002:a25:b89:0:b0:dc7:481f:f578 with SMTP id
 131-20020a250b89000000b00dc7481ff578mr1613461ybl.40.1707558297705; Sat, 10
 Feb 2024 01:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-11-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-11-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:44:47 +0200
Message-ID: <CAA8EJpoh3E0b_rNCN4drhB65_xkDN1QJhPLBHWouQaKOLBKCQA@mail.gmail.com>
Subject: Re: [PATCH v2 10/19] drm/msm/dp: program config ctrl for YUV420 over
 DP
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

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Change relevant DP controller related programming for YUV420 cases.
> Program the configuration control register to indicate YUV420.
>
> Changes in v2:
>         - Create a new patch only for configuration control programming
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
