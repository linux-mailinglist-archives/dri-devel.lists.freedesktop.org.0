Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C247D097
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E55210E707;
	Wed, 22 Dec 2021 11:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D1510E707
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:15:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a9so4146583wrr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FErqBbW53lt1oYTJBI4ZMRwKkKRNvMor2XnjX9IKwDU=;
 b=c2j7wENPJfouxeo0X0JNGqK5MSNayxWWjDKqBkLjkxANAx9QVtWwwNLmS918cfsfih
 h3jImAnqPjf5kMghD/Sme/V9R/rCFPbsnfiZManJs18asjZEnb25PBIOXwXDzfmyrAA2
 6KGH+OHFVm78p0G0c1eE2GWYVfQTwRqqdmT0FGv9g8Ow6GSEcZzpM36TspHc8ikHh6dT
 9i1fycnI+kJR+cSgnLVFFndJ8JxK45n0fiig+dXCo1t1n0qHEBa66JmS7QOhcOyj3sX3
 hu68bDe0i5pclpmjrnyOa7gTu7tJz9Xz0+3anEPTz4tcqYro8wZHRWAM8M9NB7mxQwTj
 PqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FErqBbW53lt1oYTJBI4ZMRwKkKRNvMor2XnjX9IKwDU=;
 b=jLnQ7Y5qMwr4cdglr5mJuY6d9RvXIqM8hgVvrVObTjWycwKlN3B4cenpa1rsqfaact
 m6wLa5F2bARzScdwA9wp2gH9pJBhPlcJX9LanchVE52yfJEnK8sqG0E/Fvd3wWw0fsYr
 PH59RZK2f1jgQQGbubT0NXzI9WrkQttKm8J8YpgfJoieAjHx7eWM6aiNXwmWSlrdoJgL
 u1QQgOnnjPR6o32FAwuNNNFD6PyYktXw6XnEIIaEltly/rx8Gw9RYhwriCJJucC0N2YX
 M+q34wN9wBoQuJe2OoGb18hqcSmqvKMLaRWFhj2fTpq8TiGrvu76+/4P1NbW/EqAee+V
 HFtg==
X-Gm-Message-State: AOAM533Bh38rjqxDMybJ4nFAupOtbNcQvgPXnUizsjT2RmRCtTmfCG5A
 uBSIJUW8wLhX5sRF14OeEBhaeg==
X-Google-Smtp-Source: ABdhPJwkdRz0NAGllckMzltDZM3x4h9FXDVnPJctfuKkz0c09O8W+4cxjS2dPDGLW5sgYxbyOUW+oA==
X-Received: by 2002:a5d:53c5:: with SMTP id a5mr1821540wrw.328.1640171703882; 
 Wed, 22 Dec 2021 03:15:03 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id p23sm1443007wms.3.2021.12.22.03.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:15:03 -0800 (PST)
Date: Wed, 22 Dec 2021 11:15:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 1/9] backlight: qcom-wled: Validate enabled string
 indices in DT
Message-ID: <YcMIteikWuR8S4Vk@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-2-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-2-marijn.suijten@somainline.org>
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

> The strings passed in DT may possibly cause out-of-bounds register
> accesses and should be validated before use.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
