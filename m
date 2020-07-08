Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455C2185CD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 13:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB2C89DC9;
	Wed,  8 Jul 2020 11:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E22D89DC9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 11:14:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 17so2537261wmo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DMw4+fPRGMaXG7hndNa1cNxYT36XUGUYTrv9BZ28ww0=;
 b=tmkQJgYxYvMfsw2nQIhiJGMliDc9xePDNklFbCpzEnmfNrhZ3ADzGcnv46CcgNaGG/
 TFKSX37aEse++WZY8OLMvbdmWIUXkjFPWYjU3NHOZPhAiZhYCM7cjrZIREHauaCOfKYF
 XJ46tYARoLKrRH/4EDh7CIXNnMHj49uzV9wISO0wXYU87a7ZWF3NDk0S0stf/JLYNkFx
 jBOOox1kWc21p0taavMn/f6Vxlmh0VDtJ0Vc6nJ6rBfYDzlk+0zXgcAzB+/oTdXZD2/z
 XyPW1myJ/3l1gggzhq14CczQ++YlSc+X2aibaiUkX71E4umV/JkD2MasEar7DSj+mLBH
 qPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DMw4+fPRGMaXG7hndNa1cNxYT36XUGUYTrv9BZ28ww0=;
 b=OATwrNUN+eH2w3K66BaGEc3QiqdxFUo5F31yCifLte/iuhI5LRhd/XI2UntzWut9Ly
 7uLsUsKSk0pN2RW7u8CkZ2/FcDpFBfctsfKl/U3MiYhEHGvYoA0z5YGwsFYEfXwI05Ei
 rqwu2pWn9YMiH72m2APTeSfOWXVOWjOhBAR9jztAv+Wy6NtkpRlK3jMhowuY3EPhVIpn
 Mlr7jb+d9eBSQ9Jim+Sge+zKMZkKxymcm1fhQzYxvJjRtHrMJ84tLATi81fGdu8KD4rW
 TuDvCLVBl9Rtnj9WcFemDdXSgfr+RuW+TeL5l3RmpsbjkKscugPgvrLp3e/+4LNs4zj/
 Jirw==
X-Gm-Message-State: AOAM530HZh3DWT6C4EQuuROpcb+Fxy6pBDRg+KnA7q41dEMUtIj2pW1k
 4OxSLdr1hUoHaLdhWraQ4uHHxA==
X-Google-Smtp-Source: ABdhPJxjgpOLdK7XXUd4ThbhV82XPTgdLbJairgMJNL7e604Gj2YRDxht52niQkYjRTjIrae1pu8NA==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr8535587wmg.153.1594206873106; 
 Wed, 08 Jul 2020 04:14:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a3sm5286137wmb.7.2020.07.08.04.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 04:14:32 -0700 (PDT)
Date: Wed, 8 Jul 2020 12:14:30 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 17/20] backlight: use backligt_get_brightness()
Message-ID: <20200708111430.rkcnqla77hds6wg2@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-18-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-18-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 08:45:43PM +0200, Sam Ravnborg wrote:
> Introduce the backlight_get_brightness() helper in all
> video/backlight/* drivers.
> This simplifies the code and align the implementation of the
> update_status() operation across the different backlight drivers.
> 
> Some of the drivers gains a little extra functionality by the change
> as they now respect the fb_blank() ioctl.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
