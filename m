Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9047D0C7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722B410E85F;
	Wed, 22 Dec 2021 11:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C447F10E85F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:17:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j18so4218065wrd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Q7HippQlas3qDOGNhPQSLv1qwUHwbA/DJgC1NDChOnw=;
 b=vzGFBuqKFULvj/9Vt4j7lk13/7xw5IjDQ7PZx9aME4tOwVzVX2E5/uTbcWKAYNDST8
 uo/DLkFnqLOXP6vIxq9DNP56NICKdr8RJZI1agmfTu6d0utV67zAG3+7hQAL0TYRx5HH
 b9rh/cVTJXbqWW1f+bl/r9PAc8ARpDtumKv1suaesob04lgEZFg32Lgemy9QNwcBvUbR
 L+PUK2ZjlkDXLIUcSUuiI+3i/0OZTWB02QRcq+QY+NW03/W6TJ1rGLrtebVG+mUkIVxv
 7IUaJ+B2hJIltuhKx2+oiOPz6QdXGgNsVTWqW0ILPI4Lti9fOdcEY80ZBncoL3cMHE1J
 OZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Q7HippQlas3qDOGNhPQSLv1qwUHwbA/DJgC1NDChOnw=;
 b=mWr/qxg2rkNXXmAjsV6QuZZcgZQXn533MNfm3L/Cxzcmwm4obcM6g44vrSdtth1syL
 a9tJG79ww/DJkm6CTFzhlaXMdpPJHLrofa8i7CuuSGU8lRRvDbU26TuOZxRY9CF0U+qK
 y0ETxvRNA7BQdUItPWYIhKLBmqUmqRCvTtdNELLOBDiIJoIOXDLO2M1NEchnyKnpYeQS
 E+XUZ4+9FqT02CNLysz8JggLcKnR1a4eGNm2MoO71CPjSuLD4LonlCHNE66tNOWxKtym
 q9IXKFynoXHy5tZtUgPtgZe+xVC38lfYyKZeAD88ScfXhtp/7gB/pI/oTTa0RQ0rn5yk
 fnBw==
X-Gm-Message-State: AOAM530EyNyewi5+OA3CtAA5bX27Ij6Vm9z95RRMm9Iqb/Wecz1NVvRQ
 n/D5JuTCq9YGtLZxihK4rgVrPA==
X-Google-Smtp-Source: ABdhPJxDiz09y/oHQhq0LvU7qN+3clsuh9GlfdjRUwswgcYZ+3rK2G7Y2z9kq/CqU8sP0QX92Sc3Rg==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr1765868wrt.117.1640171875381; 
 Wed, 22 Dec 2021 03:17:55 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id b10sm1634803wrg.19.2021.12.22.03.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:17:54 -0800 (PST)
Date: Wed, 22 Dec 2021 11:17:52 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 6/9] backlight: qcom-wled: Remove unnecessary 4th
 default string in WLED3
Message-ID: <YcMJYD3fM4R1MPZo@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-7-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-7-marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-fbdev@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> The previous commit improves num_strings parsing to not go over the
> maximum of 3 strings for WLED3 anymore.  Likewise this default index for
> a hypothetical 4th string is invalid and could access registers that are
> not mapped to the desired purpose.
> Removing this value gets rid of undesired confusion and avoids the
> possibility of accessing registers at this offset even if the 4th array
> element is used by accident.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
