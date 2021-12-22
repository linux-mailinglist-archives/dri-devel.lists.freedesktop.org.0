Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A604F47D0AB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D210E85C;
	Wed, 22 Dec 2021 11:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016D10E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:16:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t26so4176620wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XPWgMgD0XzqoivywAckaojk88eeT9YD0wWezKrZwghA=;
 b=TSQvltnJVjN3Yxq5i38Kl4Zl+tIZLyfhNSEv8RP6YUqRZeNA+cHVSjDndysUjDRfNp
 9pAxUCsoF4c4bKarlN0yohlCyEkXltFo0uTGZxKKnBMkys0KDKqKJUCK6sfApzEY760Q
 DxigGxoUD2smGsMvnNnitkRtD7vIBrGHLvEEhCkuwmQcG8/S50V0jWiC13Q8+drZ6UGi
 ZOnLihm7FMgr7wIL/QE4t0vWJlNZFkN6IagPIfkODJ67ckYHngyQmVRleLEBj/zqVS8m
 uHgpx3J2J/U6g5OgwHEfuZ2FziBzKqcQ9jks70Dz3h8BmSJJQRBvcjKrIJQmSpaeD33R
 16yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XPWgMgD0XzqoivywAckaojk88eeT9YD0wWezKrZwghA=;
 b=3NHVdGqEEPcciBtt4/OcBBmIqvcR+bw3qTwDT7sRNFwegxyiC649ZVuUzqvWpqs8fU
 tlJijDCSsYG0lAYVZYlX10TYwEcqbA+9hIbd1L7eeYfdijj3UA4SZTguOnmffHvf31JF
 7XMcTN2r4ZSnlJ40ZxRK72AAG+E0UeeO3CxdUuvB4513glCjTQLUOY3SMgC+J97PHga3
 7V8LVGybIEKefRfbz6gFUqbsxW1FCUIaan4viAr+ZZKY70wIJ9K7jUY8YxTXJqBNIQX6
 2TzceaR/HiS7nOVdXkz3BGVkaC838rALMbpDWOYhfh5uBv/KR0TxpRhThaDWlfjYzd1V
 AuUw==
X-Gm-Message-State: AOAM531lOuIvxu67ucw/qMo/huSwbq+tWqe4tOCNsbbAvvhvRjm0MGJG
 XsADq1vy1ZSsKWqDiQa72ssIGg==
X-Google-Smtp-Source: ABdhPJzkB3s0YBKaAq8SlAKtUF6TM0YviOwwlicJEmYHnBrD6uxPU06eJZhrr/MgKRKs9FFzJP99HA==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr1733297wrw.366.1640171783261; 
 Wed, 22 Dec 2021 03:16:23 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id j3sm1612934wrt.14.2021.12.22.03.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:16:22 -0800 (PST)
Date: Wed, 22 Dec 2021 11:16:20 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 3/9] backlight: qcom-wled: Use cpu_to_le16 macro to
 perform conversion
Message-ID: <YcMJBDcoZc1g7R2M@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-4-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-4-marijn.suijten@somainline.org>
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

> The kernel already provides appropriate primitives to perform endianness
> conversion which should be used in favour of manual bit-wrangling.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
