Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57834CDF6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 12:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DFC6E332;
	Mon, 29 Mar 2021 10:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370A6E332
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 10:28:35 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id e14so18563476ejz.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FGsJ4xZ84OyCSAfqZtuaiVtx07XyTMxsRtbJsypRgQ0=;
 b=NsB7szuvnsVvmZr6fMEaieeRGj9x9QaZGqOI73CDo4jA2TR2ZQ4McdBi4nQRDQzHhi
 AQkCCAdeenVeAZy5lpU4yQjrdZkg1D7hFyTtlopJXDJNAxxHhGkeEVwiv5zWsx+dXjTk
 MN6TNGINXyNxNDcmCiRA8s7QEGIeV+QFYCai7Pslj3/Z7/8ws3ZZ1H7qiIJ52UxUrjap
 7F+e0tXM/ofOblfLBvEFqiVkntF7sQy20nlbwn15LNdWbPJ01clWSTka6IqrLXBU0vqy
 ugW9KMTQMjqSw5KSh7Otb/rBxb5LEJBTL29R+4n5pa8bRbmvtYnwpJQ8OEF2pU6Qh/1R
 1nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FGsJ4xZ84OyCSAfqZtuaiVtx07XyTMxsRtbJsypRgQ0=;
 b=J89SgwDyAME5ZZEPEAYhKALm6UB3JqdE/qwMKPkZjyUVQszEOvud1bVtPYmwfIFd1j
 oqp6D2r+1pzjjzrWTvwH2kNMPH+8mxD2a2M1+RrrjoRrMZ1W6iPOOmVK5GkrB9yoj5y2
 1+PtMdtBIF4Vl37rvfn8UbiatbcVadZp3ZQKKMq8NHpTlKwvH6YtxpKNfY4iE0VdugVd
 lSw7mEJauY34m2wEeksEuMgJ2Og4RXWCtCyU1WxM2IS1WyVJB5Y9trpvY82SW5flibZm
 DfwZ9hEq5H+ViCHANXDIUol76hi2rrrjAdM1Chry+vae47HRQuzr7qlFB8l77viSWQEG
 uy2w==
X-Gm-Message-State: AOAM531B0JAoqsUNKC7/JgBlMvmGAqsb04iX5lLofuVPSZiLSbAGab8c
 nwK+DVM4GuS2VjybcFrJ7BwD+Q==
X-Google-Smtp-Source: ABdhPJxyRisF2a7DxPDROOeg/GclKMFezzp1ztelOuEDIeJGxlql4tmRUFhVw7fB1msFcAt0U2iUgA==
X-Received: by 2002:a17:907:2d24:: with SMTP id
 gs36mr27997185ejc.344.1617013713856; 
 Mon, 29 Mar 2021 03:28:33 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r17sm8755121edt.70.2021.03.29.03.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 03:28:33 -0700 (PDT)
Date: Mon, 29 Mar 2021 11:28:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v6 2/4] backlight: rt4831: Adds DT binding document for
 Richtek RT4831 backlight
Message-ID: <20210329102831.rwvj46m6db76pp2a@maple.lan>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <1616945059-8718-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616945059-8718-2-git-send-email-u0084500@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 broonie@kernel.org, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 28, 2021 at 11:24:17PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
