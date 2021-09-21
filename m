Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897AE4135B0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540596E9D4;
	Tue, 21 Sep 2021 14:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C6A6E9D4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:56:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t18so40066136wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Uy/6vpAUKhCQrg81XG5Al3uBoXiNf0Mz5dJc/PJ/1Oo=;
 b=inwX55DyAUgJ5+/69FFQ5BYIFwpAEpPaNG5iUXLgI9Xx2QUcCzH3GiU03HfEj2LI0e
 qULLRtnz8pRXEtVEGBeiKj9+uiTYiTUFXpLcis2a9BBM01JdTgCa/ERr9ANh+2AY5m5/
 e8ZCbXtASjaNOpOkLp94OMpaFrrvdWD+B1REo6iIAjHq5DvhQn9fx/Oi2Ny0gGl1IqhZ
 oA8omaGlRrNw7uY44M1ZGwm6nSWSXZvx45U8dYvauqZ8gu3qSmpYzWZFTWY6clpmDTWo
 4RhKh65OdHy6+OkNXArCmGdvTOQZmLpi5VZd9JEuOhL82m7pMpORjtL+91x+bhe6oQnM
 +pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Uy/6vpAUKhCQrg81XG5Al3uBoXiNf0Mz5dJc/PJ/1Oo=;
 b=VZGdZI4iHwNOXRzzeHKPQpWJ89sUPCUnfnFH1AAfVTUdJWCCLnwz6KLqXsXY7h19T4
 p6HswtwopBkiex/LQPJbtl4mC4suz2bTmlvZ/Ur2hAt31DLA/bvtgB1fzZp6oFmZ1LFF
 8nQZVN9AQtWTKGDwZ1udLw8tAIY9Xr7qJGFQtufogpdfNMvXmLWCFD35H9RyAsLT0AAf
 kzLIgF6sqzbX93QhJwrnyaNfy7hw1zmygLO5lIcI23+y1sTFi8nnQyFV2xD2EG3RG+7X
 YdBKpBs5KLiFjm3S1R3aFXLQ24OZ/cpOKQurWxiH6NvCnMpVXGWLjG8PZ/WRDOuCESBT
 BMAg==
X-Gm-Message-State: AOAM532WwTrOIAgfbjikSCGz/SF4WfGcJm8mAyAxwT7O6Tlkm23CVkJe
 8amATyRhtUi/UZHOSlxkoglqRg==
X-Google-Smtp-Source: ABdhPJxwyJfqbv3VS2qWqfkrpeWNt0/HGXMc8xJMgFLQyg5ZWJYmS0L9SbXC8wwBEt/xh1Dd4Dt+5w==
X-Received: by 2002:adf:e390:: with SMTP id e16mr35385598wrm.217.1632236175859; 
 Tue, 21 Sep 2021 07:56:15 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id 135sm3191822wma.32.2021.09.21.07.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 07:56:15 -0700 (PDT)
Date: Tue, 21 Sep 2021 15:56:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: propagate errors from get_brightness()
Message-ID: <YUnyjSdhJt5nK5Kd@google.com>
References: <20210907124751.6404-1-linux@weissschuh.net>
 <b25975d3-f417-4cba-92d1-35c93d37e1e6@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b25975d3-f417-4cba-92d1-35c93d37e1e6@t-8ch.de>
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

On Tue, 21 Sep 2021, Thomas Weißschuh wrote:

> On 2021-09-07T14:47+0200, Thomas Weißschuh wrote:
> > backlight.h documents "struct backlight_ops->get_brightness()" to return
> > a negative errno on failure.
> > So far these errors have not been handled in the backlight core.
> > This leads to negative values being exposed through sysfs although only
> > positive values are documented to be reported.
> 
> > [..]
> 
> Friendly ping.

Don't do that.  If you think the submission has been forgotten about
(it hasn't), then please submit a [RESEND].  As it happens, this is on
my TOREVEW list.  I just need to get around to it post-vacation.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
