Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A48503B8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FF3112455;
	Sat, 10 Feb 2024 09:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="we/8+t0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E443112458
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:43:59 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso1787219276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558238; x=1708163038; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+RI3dWBvWyqq/yEA1r1jf7HN95TUMuR4sMgCLHlYNCo=;
 b=we/8+t0ushi+A67C0UAH4QcGe5UtYj9YHiT0q6tS6DvnUh5BZCni0DQctYZ47/Ij6y
 EkyVClbun17F2hi1OYiSUs3JRp/jOEEKOrGcBGuMwUxTpxpcqlO4+vutZKjLfUI356TW
 Ys4GWXQzip63wBNIVr836VXsYZlzfmQrYMLNz6KkbB2EicJqCfu5/hmHiOXXLEywpmBG
 dKIqoGq2i/iIKTsjgDgh3iG1/G1+aMGrUh2L+9uo28CJ7goh4w7vYYYP/oLCL6To4Whm
 abRxDHnQBytzu/SUs/pOcQpNKm0TQFjwTmaVvPtXxzYcNXzA4fSFcjyxRDs+n0Im/k35
 YMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558238; x=1708163038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RI3dWBvWyqq/yEA1r1jf7HN95TUMuR4sMgCLHlYNCo=;
 b=YVJYC+/QQyDmTEbvAoIZ8rwmyhu5hD/YfAZuIQKoNebOttw3UViKJwhMQOB7GqLEEl
 KFhGjFIo1afaIHQ7hPyLSOVTyjzZnW4im8jhjSZyWcQDBVVAmJdY06aL6/I8V81Mrfcs
 K3qwWoo4k0gYSg354w4ZYd5Vy7Db7Z+B95T/satFfpZ897821TfOeMt7sD2p7jiUdpCv
 gMVLnmQminLSVTY3IpTAxR6bC0QCRaIddq0wsw/SwT4PMBhKHe+V6lNGeKS8t+l0PiQ9
 p8FfRaGBXuiKRv7Jh1qxAaGyOBTKo9EqRBFCrLJizcN4H6fv//g8qIaTyMHs5EKfaRjv
 Pa8w==
X-Gm-Message-State: AOJu0Yxhzvd4uLGE0s09iCZJN7Sp5d2JVBKjNT4Lf4Yne9K42Ha9HBIj
 eGA8w4FD3Ni8+mAYuhkO19nuveMafkbsmSSeXK+G2UbjS+/o0AwiBMXSSMHyxAS9fXTD4SRGJ9h
 oLw0tNWr6j62/9Kd2+YIzuTYqKJ4Jf9YJ7lYeRIJd5TWji7vfeV0=
X-Google-Smtp-Source: AGHT+IGxEsODyIQpa3+puvUQSQAHWgFROHjBlYgNuoD0UH4Y1xDQcQ9joz75lQkRTpTguUXW4Z8MIDNAxAlhshGy4+E=
X-Received: by 2002:a25:246:0:b0:dbd:4883:44ce with SMTP id
 67-20020a250246000000b00dbd488344cemr1345322ybc.32.1707558238734; Sat, 10 Feb
 2024 01:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-9-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-9-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:43:47 +0200
Message-ID: <CAA8EJprtCLn2s3xj1VeOZ4-Ot79PGNfk2Bv8fqPLeGWD71+XNg@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] drm/msm/dp: check if VSC SDP is supported in DP
 programming
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
> In the DP driver, check if VSC SDP is supported and propagate this value
> to dp_panel. In dp_display's dp_mode, the out_fmt_is_yuv_420 parameter
> must also utilize this value since YUV420 is only allowed when VSC SDP
> is supported.
>
> Changes in v2:
>         - Move DP programming when VSC SDP is supported to this patch

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
