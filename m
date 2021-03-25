Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BED349144
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7A96ED0F;
	Thu, 25 Mar 2021 11:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD67F6ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:55:02 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id jy13so2447333ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rZWmRs5uiiZzbSAbUlT9DJTNuhGAA3GeDnT628NrQ7w=;
 b=BxdtSvV+EZJHW2fk1eKvc8Ht075HnGSovHXfOkT72rSYHXnpbVRQrV3XFwBk5Uz0Ia
 YPTOHsrEV+C/SX8mBa3JTdHvS8+eSGyrq0/hH3s5l1LynwopCgPQznL28ypq95ledDHo
 dU/p7If9ZAEkOdVed9XtTJTg5PESS8Z7xb/xIeziSsGUWraA6H/jNPuB02PNJ03HYtgc
 TdTXg2EHDQQfOEcfw9Q65vrgKdO+atqRmtyT2Ry244nIbWtsg7OOF8J093kK3a3xYflS
 rV1kvTTLdB2kxFQQw+x3Rn69le1RwGPiZFhpBiRqWntzBi5KZmrpQefhTlBQb35DSoQV
 zrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rZWmRs5uiiZzbSAbUlT9DJTNuhGAA3GeDnT628NrQ7w=;
 b=IBsmYIKLsQrDiPcMmlCUqIcSi2PlHA/xN8e64qI5YHCnTcZMUSHh2Iky9YTdAFy5Hj
 43Yp6yofEZXuA1Uwi2BvLpj3pGMhHZc9A2oxRpPpdw0b0jjCT2sJW77yL9TRQrbGOkMh
 xj5wz5Z5fMdeAOD9eyrsFlBARrIi4U3nP24h+wQ6H98Yki1Zx/cNtjwZ9yY4Ypi5U416
 o+ofUl42DnNFF+e+v/1xX+0qDjX2Yffqaq4EDXncpScOv5QYXuXrbrCaW4+roZd3j0VK
 k7h07mFi+eoZ2nugDheJB8SnuBnQb+QqWOP3ZKaw7821MOafvYxuz2SoZlkzTmf/F6kU
 4wcw==
X-Gm-Message-State: AOAM5321ZI/B3gwsHJlVi0psD9cm/e1x4dOh+Eb/Q6y5urK5pQpiQu8h
 XLP3YSs5WyCWA5XdhJm+07BO+w==
X-Google-Smtp-Source: ABdhPJzPE/VIPxB5BtQOm53Z531/3bq0GIn3TATCJb4Fkb0yQXA0yz2x6HTeLa+stD5UMjNVUttscw==
X-Received: by 2002:a17:906:6882:: with SMTP id
 n2mr8901334ejr.50.1616673301376; 
 Thu, 25 Mar 2021 04:55:01 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q10sm2554598eds.67.2021.03.25.04.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:55:00 -0700 (PDT)
Date: Thu, 25 Mar 2021 11:54:59 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v5 5/6] backlight: rt4831: Adds support for Richtek
 RT4831 backlight
Message-ID: <20210325115459.k5lj5wgype5skh57@maple.lan>
References: <1608217244-314-1-git-send-email-u0084500@gmail.com>
 <1608217244-314-5-git-send-email-u0084500@gmail.com>
 <CADiBU38aafx9H1Skz_hHmmkQgCGJSssE1VYBC6WddnGfR3ux1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADiBU38aafx9H1Skz_hHmmkQgCGJSssE1VYBC6WddnGfR3ux1w@mail.gmail.com>
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
 lkml <linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 04:22:11PM +0800, ChiYuan Huang wrote:
> Dear reviewers:
> 
>            Didn't get any response about this backlight patch.
> Is there any part need to be refined?

Thanks for the reminders and sorry for the delay. Have just replied
to the original message!


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
