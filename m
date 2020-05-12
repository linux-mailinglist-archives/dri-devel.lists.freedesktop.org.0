Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB31CF3A5
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 13:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE566E0E6;
	Tue, 12 May 2020 11:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687BB6E0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 11:49:18 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u6so13245103ljl.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LaN40dqXaRdgr+itxZUWzR4xWLlgoAEeZw85S/t/at0=;
 b=rwCA7Rt2qANtiQ1cyJisGlj52sRYBq7zbk5/4TT1kGGAX5i7eijZbUHqjB7XeMtVK6
 0NCBd2NrzB8IHtgcaRVzKuFDU7c7SqP6t3hEj11m3Mn9ITaO6oTnc69X706rR8l7Q+ro
 n3TFb8q0OwfkqdJHauWFFZBXJczkJa/njkERdmIR+kVjmA4mvIwhXZRF1b88vCQ96wlr
 bn1JysDUZ9XSRKakRudo0R018IEw5XpdGscj9Fco0gWcygt/iuDEUNnspGFEsgNlxw5+
 MUwRO+9YK5h5tDbK/ekLGMO5rAO06IQlTANQWCdUYsDxktfNfn8/hLboScSCkyo0DLTb
 tBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LaN40dqXaRdgr+itxZUWzR4xWLlgoAEeZw85S/t/at0=;
 b=YDQTzXq7NEX/s1esJqRSBhnEYTritoSvmNwAjNaIIUS7IgNDQ3deXBN8HCyoKS5mAV
 g+dlDy9FTKf2UBS1j64S1w83pF2N6sGpDGWK4e9GY6QZn6w9WgE2Qm1QLt69nHy9sRGS
 787qQeWZ5iJoU1KC+nih62jvQeiBgJwc+6Toj9gYWSM6aB76YgkZhFIlPI7zLTxdGyJD
 7eQDWhpUdAfaabxhRsRuCjspW0Izn9Gn3KoTXvaKZCRUD/vDQv8TMwd044T+JMEPfdL0
 8p1xLVbRIjgnx356pb9oyuGo4l/wR2+d0UueX9XPMi11xzlVZK+ClAeOrcFC5MaB05Md
 feqA==
X-Gm-Message-State: AOAM530uyGgQQCWwRsrFaUSqr/Cx3kXh7nKsm1C1fcCMOXTMGeytqB+F
 5UU6URS4pfdS1s/h+jD/Zr3M2ljy44ivXCj8IJOOmAod
X-Google-Smtp-Source: ABdhPJzH0WBo+S41IQb7cfAxprmCk+6/byQtNll0cLlMLCB+prcvinTQdNVQlk9tigEy64l94Ilx3732NrcK0VCb74Q=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr13984293ljh.223.1589284156747; 
 Tue, 12 May 2020 04:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200428141459.87624-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141459.87624-1-weiyongjun1@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 May 2020 13:49:05 +0200
Message-ID: <CACRpkdZ++vYw8LAiNUv6AXQ0QTh+W9vSL0_w2AR-GNNd=GH7FA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mcde: dsi: Fix return value check in dev_err()
To: Wei Yongjun <weiyongjun1@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 4:13 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function of_drm_find_bridge() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied! Thanks Wei, sorry for the long delay.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
