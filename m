Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB2611795
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 18:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBBF10E870;
	Fri, 28 Oct 2022 16:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BA810E870
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 16:35:08 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g7so9169923lfv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dDdem09UvQC6RtPh9eP/fPIosZi0f2DCCtFcOfni9E0=;
 b=iVRKB99bCuGg75YHK5Jin6eKXNVe9XeG9Wu8TuxvOpZO8X9g0HtdOKXe+lJnotbapy
 yY1d/TS43YunRmZBAdM4kiS1Sb8vvY1JzgsNRODuo9qg+niv7CXg1LdbK/MFiVHVTCVh
 uZZlAnEomqAMCPuV5LXMWtWwirMKSIYACBgbeq/QvJ2NTjC6iw3aocNENCpW3yfSF+VF
 h4Np4qcUKUFrsMntcE0udkLz1iH8nhF4d+Vl8ryBfkZ1woIlFqAplaVWyTnQlJUeIlwr
 w9vUx8zv8jyRRFHooTylzter5G7/0iRYvFvfCgrWmJ1KX4Ui/6vhhI2pxLyUISlF4kgT
 PF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDdem09UvQC6RtPh9eP/fPIosZi0f2DCCtFcOfni9E0=;
 b=w032D6JOsSBWVlF5jERDvmDPXa7aFp0dOrpSEw+g/UJfCLHatWi5PsxZQs0kpZDciR
 HDGNSZrvC8ffXOyoFMat4Tdl9b5jaHPuR7rhD+iccMn/kl6W7DXWKaVyEWxca8xZ+bKp
 REwExBCUtkPamBHqsFvvFC8c4Gqf4H0D6xdQIWk7HcEuLTC68eZKuM5w7ZcvATmsYEfX
 SR8XlgkCbDXTribZ5nQq7PyWj1ZhH8xA7exZuxWzPsMaYRsQacw+uqpCSAZzS6beQAhs
 Em8nVe4DHz1vVmHrZwivXHV5FpDEx6WLefrUP0Ol9GgRny993j9o5T1D08HkLNcTucpJ
 4U/Q==
X-Gm-Message-State: ACrzQf0lc57No50DW+6uzvhG4oIVD6EAMP68pvVcDlkJq2XIdWJxQKeB
 nZ6p1cMI97uOlTJjw6mw7zna7JGc8Z66sZCH1x3j
X-Google-Smtp-Source: AMsMyM4GCKg+Wc/lMbvqmo5qiLQjfqMXoXH+QadR3RXEfZMfTqJByvQ611ruQrIRULNKM67OA8DPiAstRGkRDG9JZno=
X-Received: by 2002:a05:6512:2616:b0:4a2:1723:cf40 with SMTP id
 bt22-20020a056512261600b004a21723cf40mr80364lfb.354.1666974906701; Fri, 28
 Oct 2022 09:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 28 Oct 2022 09:34:55 -0700
Message-ID: <CANDhNCpWcfMfXKHU7rHSUXd8e0JcAnD+qJABWCs9rWTC_J3h6g@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Laura Abbott <labbott@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 11:55 PM Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Remove duplicated 'by' from comment in cma_heap_allocate().
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Thanks for sending this and going through a few iterations!

Acked-by: John Stultz <jstultz@google.com>

-john
