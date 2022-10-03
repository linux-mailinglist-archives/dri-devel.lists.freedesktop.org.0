Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2E5F36AE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 21:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F9810E4B6;
	Mon,  3 Oct 2022 19:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09DA10E4B6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 19:49:29 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id b2so24459437eja.6
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 12:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wVHQkQCPYZN4TIifN/vewTfiR5dIM2yZ2zj6SDN54Hs=;
 b=Okume8QkZIMGz86eRMmqlWVYiQFnQz/N2IFOTYxGD67+tJwFT9VbjU185806c9c+Al
 +9BN0QKRoy2pbrrEwCCDhRtlNy5VzZq0Bkq1TQvUBKw1o+KrkL+RGQY2yunxzzGsD0s4
 uUchS8r6/8ckn2WVKIbYRsd8pOKiTV7lb8ZT4nVHiOTilHN7LTfCNM4nW8svfgptFilw
 H51GmpvTi4mQv0d91MfaRaTVqk4/e5LB+Z9W6cqZ1iLMr8p5HZ69wKvHP4cj7EIAu3r6
 nJRSS7vBZEA7s+DXyjjL773YXnCTu8JNaKn1ZzLhIW5bvZIK+BZU1XRHBuf4A2dqtFma
 CGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wVHQkQCPYZN4TIifN/vewTfiR5dIM2yZ2zj6SDN54Hs=;
 b=cPa2V676oJQKa8MZrcwXqu/0LWd5d4fgAS36ba3w1ZjYANtyagAz5wZ/OABwd5vecS
 B5Cvqn/1gPDK+N25v2rVMSL59Xr1TPemx/DxZS75qnvluvPFYozAvtdeRazhHpE/pYFO
 sKFx+/JOfYLpm/z1TV3pa0B2AVa/V9Es64NdLyI1YR/tGbV6SA0FZzWH9lnubZJbrGzp
 6FwylRlUDQRUx2i/x/FkXg9ED3g0lDcxGM4JxLk5ZwFNsHHPyMIy+DrqzwceO1ntf2VQ
 r6FzmciAcn48Xu57fQubO8QUhMml0GM42sYU2uKMq5HnX/T2n/8FFw94HA5h7Iev5POK
 lE+g==
X-Gm-Message-State: ACrzQf0j8lpuiYAHKqxdb+kUFDN7fNOE7+QVzhBXYI9BFLd8LkHI011u
 v6kbP4O8g6md9sPt8M6lmrbsNG8L5YFzjb18JLlDug==
X-Google-Smtp-Source: AMsMyM4HGIUIIiyz4+/1OJ+p9WmbyI3NsWP83mUwiv5xw45KlnN/oDN3AFGqBcZJL3ewP/PK13XRl5BObTJ59Pm8Xvs=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr16277452ejc.440.1664826568201; Mon, 03
 Oct 2022 12:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220915163156.2519577-1-weiyongjun@huaweicloud.com>
In-Reply-To: <20220915163156.2519577-1-weiyongjun@huaweicloud.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Oct 2022 21:49:17 +0200
Message-ID: <CACRpkdY63UXRsvyFo2+Q_S_tkyNbvO8HvuRufHGGeG8+1zqL9g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: db7430: Silent no spi_device_id warning
To: Wei Yongjun <weiyongjun@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 6:14 PM Wei Yongjun <weiyongjun@huaweicloud.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Add spi_device_id entries to silent following SPI warning:
>
> SPI driver db7430-panel has no spi_device_id for samsung,lms397kf04
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
