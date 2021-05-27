Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037163933B0
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCAA6F424;
	Thu, 27 May 2021 16:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D286F424
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:26:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v12so486045wrq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sYfRojD79IjGqc7nXmoUz1TVBKWvqSb4uV+m+zK9THk=;
 b=lgrw5ga3WKPAoziTjNoBM5nBMOAQDvKM3uLTPCxqTZFAFeNVTFjk4a/+4JLAdmLVPN
 Dm8Lu+EttQQjXJO/l5z4zx8rCYTD2Dkleix1U0EhD8B1ugYZT4bFp0taxSuw7tAG8LbV
 gRWSOodIJOTqgNWQBrtpf+Wo7H9hJlh5/krjKfdoFbTwlXTxymPpXi3YpQA5AqIknzJj
 ZJnDqjfTLlepY9LvnsOGKpdkltNV0eAgLQSWL5Gv3DIAQQmhT5YCKDYYDHAgH3fPdZ8c
 +YF9sN8dYhVCHfuLCBkwquugfBQtuLj2l2eWCHbWOOgHbPJOAsTzMzCpESvsFhz8pP++
 0dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sYfRojD79IjGqc7nXmoUz1TVBKWvqSb4uV+m+zK9THk=;
 b=EFPBRxAieHiv7NEkh+aOIZOUay3q3fWiNNcUOR9XB7OA6FI0QxXxOhxhVA65WGMJRU
 doY7mZiNmuJRooC0gYAkXDDhGNycWE/kS2sMMmnzV260lHVMgiMXfyS7VC73jT5CHYOB
 +AY5mCoQROEo/rvWfWEDH6GcBORcqlEsBNu46hY+u7X75X6nqyStPXsvm7GHQy0Yrmsx
 /DAZPfO4MgmbQsUKO17s7NwgaHZzKpc+cdQMisr7mXuq0DuSKSqfzdN0JGu67V0l0JQy
 E/BDTKIOpJc51iug3krmkKEZfzSi6LvT0ZEcyJT+Z5d9x0Nv8pnxCqvYQ8o+9ID5+OQH
 zHWw==
X-Gm-Message-State: AOAM531eC38I0VQvwCpb7+9uJAU4q53GcjmgJ3OOt4uZd+4lNCBtoVGw
 gOjj2Xs53fykNkZSQvFl3jYOBw==
X-Google-Smtp-Source: ABdhPJxM+yIpAp4eL9sHrYNbLxW3nG30aoIiJSUnb2poiCGc7Ta6Z2ALK/q7HvKiZyAPXq3UXZYhug==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr1040670wrp.73.1622132766819; 
 Thu, 27 May 2021 09:26:06 -0700 (PDT)
Received: from dell ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id i5sm3955864wrw.29.2021.05.27.09.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:26:06 -0700 (PDT)
Date: Thu, 27 May 2021 17:26:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210527162604.GL543307@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
 <a81bfa44-ed86-207c-0f8c-c9bbad62733d@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a81bfa44-ed86-207c-0f8c-c9bbad62733d@somainline.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 May 2021, Konrad Dybcio wrote:

> Hi,
> 
> > Why are you Reviewing/Acking a patch that was applied on the 10th?
> 
> Forgive me if it turns out I'm blind, but I can't see the patch
> being in either -next, backlight/for-next, or 5.13-rc3. Perhaps it
> was omitted after all?

Interesting.  It's not you, it's me!

No idea what happened exactly TBH, but it's applied again.

Should be in -next tomorrow.  Apologies for the delay.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
