Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E7047D0A6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C908910E7B8;
	Wed, 22 Dec 2021 11:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8373410E7B8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:15:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e5so4179227wrc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Wm7ceiBo2JszsCIJkrhp1xhqeVltfP3wlNwXPrRjP24=;
 b=JuDGpd4Hf730Hy1xkZzdm7Jm917/6CwrXFdCWLv4thxaPaEAifEYweXoJTV2dVFxiq
 5xNyIY8uwWCzHqo0fIzTfrz0TCDGF/U3IMQMKFidXd7Wya1wS/CDmt9LGkmKh9VOdxwg
 mJABWKYoU0c636DwooyIxlIV1WtLmeZtbP7evZqI20Ft33qK8PHZFj/UWPobzGv+fL6j
 eJ1MR6XCqEs61xqgDGX08pWrOy9fzmd3qJ/tz8fZ5a86CY4EoTFamlTp0O7xsPvU2RVv
 M5W+bMyn1VJxWuoY5gA8vqSqAuUF/dmwjl+6S7X8vOkqg6XTljUe/M6I4lBeR79ZS6G0
 mt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Wm7ceiBo2JszsCIJkrhp1xhqeVltfP3wlNwXPrRjP24=;
 b=Alw1Y0yb/XqMtHnv9XRqYnWHqNHOqu6uVyxK9GAruhhZDLClNMGOkY2xNt8aMZ6JGj
 DGKrm4y+4zeM3Tikonbs1nCJKASJj7m+6CK1+HSZI6TRTbJgumQkA22NHAOtOT+FSsNU
 i6uwJjp4dOuEXl12XI3VFkvc5yKAruQevncDM5doB3tRaPRXNpiNMJl2rFyPC/Rl5Dql
 eXUOeVoNBxP9HTarhvfgDqTuB6aspqKds0UYwXIhJrvBSHk7ZstOHDvBpo5Zt/geFCMn
 y/cnSMWwx6JDJec8B+shchhHPgXLo1ggo0eI/n18VZAwL8D/MwfxWDm1AjakzHcqCIR1
 kXBg==
X-Gm-Message-State: AOAM531uuO2CI3xkVjTFeuW+OVR4uh012wTPU2AYzhbjdOAd+ppkvpUq
 qd35lLKUPjtFP/6lI6vS0Nf7Kg==
X-Google-Smtp-Source: ABdhPJyaGzs1v4cpza6jVqOa8pif0o1C0RknC0vja0TI23nk6gWPNt71MTTcv4gmRcsLQ98s4nzF8A==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr1755010wre.622.1640171751048; 
 Wed, 22 Dec 2021 03:15:51 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id 14sm1801429wry.23.2021.12.22.03.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:15:50 -0800 (PST)
Date: Wed, 22 Dec 2021 11:15:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 2/9] backlight: qcom-wled: Pass number of elements to
 read to read_u32_array
Message-ID: <YcMI5Oq3jOIFQvKc@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-3-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-3-marijn.suijten@somainline.org>
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

> of_property_read_u32_array takes the number of elements to read as last
> argument. This does not always need to be 4 (sizeof(u32)) but should
> instead be the size of the array in DT as read just above with
> of_property_count_elems_of_size.
> 
> To not make such an error go unnoticed again the driver now bails
> accordingly when of_property_read_u32_array returns an error.
> Surprisingly the indentation of newlined arguments is lining up again
> after prepending `rc = `.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
