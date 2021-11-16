Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C745361C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 16:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37956E4C9;
	Tue, 16 Nov 2021 15:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8066E6E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 15:42:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s13so38492097wrb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MaOSO/5HtReWKBBksqBOQJDhfTRE2n/pBGJORKYgmI8=;
 b=dpMihBVSiTIhJ8gwEIK/0RaxfyXs2DtvxfMOWHwvsfqgQpUny0lQtED0wIphEPCb6v
 AEzTzY5KUWh+ZBUlwhm1MKOSsfEKvWzAZN6hA0iVz1ZkNSHET0GNQ7X4qOZ4ru7PoXmg
 a/08/a6OGQp4ufg1hfyxfYLxOjuSPoP4Iv2indtDuuY25uHOzB4zY/j/Htu2gPPN48F8
 +FDsCnukvP5bxxuyqV5df/R9Dld2m5MFGmv/6quqjj8jagtwmzBL49QLLLkaiJPMV3TB
 utBJFccrrLjAw31i2P+rtb2jHXojpAt5V88ehKxTw8pEyulGHnLBAJQgM7JuB/O0nT8J
 yzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MaOSO/5HtReWKBBksqBOQJDhfTRE2n/pBGJORKYgmI8=;
 b=lmD70lJrCeorFcJza2bWnWcKxqkqtQvFMx+ACSVTYssAPrUUYpRQatINtBbMoRpAUK
 wNwICIYnDwniVeUbW3czANP4WQClh8OZ7HyR2Nv+dfbjNrVu4hOyWMFanq/iK3mb4mKN
 s2v9IHf2hsXkhDMLFwnG6gZkiofpBNUez9Qu8AM8vaOejC+YTaavUVrmXQIo1tuADMaL
 xnAVqgscnMq76zekmi3gw8JI42T3xD9topM0UNMCn1wdljpkxo+0XmJyBnqJgwFBkuIA
 MLb+CHEj+WLJPFFSaoMA4+mB0/JlBt+kw9KHgZ6pzRfy+/bat9R8lDjI95vaH5B8xRCM
 F/Dg==
X-Gm-Message-State: AOAM530B1LUAzgMwvYmUA6KTE5nyOLk82tba1emPblKcO0xfjRY6MP74
 w2l+P+bQGtjszdRIDKvHiH+NDA==
X-Google-Smtp-Source: ABdhPJwGazAeHXqWI2KmcXg8HN2YudpmutPJQ1rdklClDDMa6uJ9nc+mW3BEpIrYrJ5e6pEnv6kpCA==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr10447721wrv.73.1637077337983; 
 Tue, 16 Nov 2021 07:42:17 -0800 (PST)
Received: from google.com ([95.148.6.231])
 by smtp.gmail.com with ESMTPSA id q4sm17892469wrs.56.2021.11.16.07.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:42:17 -0800 (PST)
Date: Tue, 16 Nov 2021 15:42:15 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v3 0/9] backlight: qcom-wled: fix and solidify handling
 of enabled-strings
Message-ID: <YZPRV2jD1EBYGdHL@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211116120213.n7qxqfi62lrxhyl7@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116120213.n7qxqfi62lrxhyl7@maple.lan>
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
 linux-fbdev@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Nov 2021, Daniel Thompson wrote:

> Hi Lee
> 
> On Mon, Nov 15, 2021 at 09:34:50PM +0100, Marijn Suijten wrote:
> > This patchset fixes WLED's handling of enabled-strings: besides some
> > cleanup it is now actually possible to specify a non-contiguous array of
> > enabled strings (not necessarily starting at zero) and the values from
> > DT are now validated to prevent possible unexpected out-of-bounds
> > register and array element accesses.
> > Off-by-one mistakes in the maximum number of strings, also causing
> > out-of-bounds access, have been addressed as well.
> 
> They have arrived piecemeal (during v1, v2 and v3) but all patches on
> the set should now have my R-b: attached to them.

I can see that.  Nothing for you to worry about.

I'll apply these when I conduct my next sweep, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
