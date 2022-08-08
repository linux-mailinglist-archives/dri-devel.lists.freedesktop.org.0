Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6058CF1E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 22:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBFA113B10;
	Mon,  8 Aug 2022 20:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A648E11A34C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 20:28:02 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so11805654fac.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=LZFfaWPD18Mwn/Qf0FVZj2x1xhwBuquEIxoxBMUtgQA=;
 b=kE0qc3AisgkyAVOsp0+1WD3dlNS4GeQRZ7j67HMm+hPcipeVb7jpkSQKROx9XIPzE+
 cDqDz67Ndri+iJTuRM7ShjG3zfASAYpmwv1hKFOyFH7ogOwW4fDLC3uTyEp/clOFUqyt
 L7EWk5GhOO/G9SOmxlvsj15iJzytGdYDtyMgaLDXJaYR4+d60YeAnaADYjo4391WH1TZ
 TkPh+QssbFJvu9qJBeNC6r72nR2E2dNBrBSXvHeRvCpvzxDPblTg5S+Dl9sFZSy5Tlyz
 fcU/4Zprem1uXevmQVApTrpMEc4K9/AIIDJ0nH2UCQ7o8e+x7Mo5uAyJ2m6j8dfYUzTQ
 xA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=LZFfaWPD18Mwn/Qf0FVZj2x1xhwBuquEIxoxBMUtgQA=;
 b=RsmUUmp1UwuadYxx1MuenO7XovWKWHyZH3AHr+a5f1/yih4PwUz7Bv7qHqHsKzWTHY
 5BL8ELRt7qTy8qfVikn0IeHdzux1h7/0DgaVwMBZAXvjWzjfqTZu0AASxM3947v5pk0P
 9K7HzVghtaL2TvXYcT1gt8VX3Svrofl9PAQR40wbeJ1ibc8FYxxWFxqluW5ndPlhbRmw
 XAN4CBg3i0wMT02aESMupJjhWDaKeu0/wqVjX3lNfo7XT0mtXdN/HmlVk4ToRI/+dsg9
 OQRcnpyZL3Bi/Jl6FwycZxHHoi9qZ8RC6c3FBQNZtYb5yJrZnyjsBAwWHTNlj5nHykgH
 D93A==
X-Gm-Message-State: ACgBeo1TREHYrRMO6Ki7k4EqtKd5lcfk1NAiSgusbQYOfg2mHLnzLr97
 LpqOYIusmw7+5QawioTljgxsBNhk4FfMUST7ZaM=
X-Google-Smtp-Source: AA6agR6ye6dw5us5WT0+i8bbYGiBw3rPYmeCiduhNj8+D7R0kKFXxfpvP6A/HaBoK/SMUCs/fyAulvTxgOOgk/NFJjU=
X-Received: by 2002:a05:6870:9193:b0:10d:130e:e57c with SMTP id
 b19-20020a056870919300b0010d130ee57cmr12444363oaf.286.1659990481767; Mon, 08
 Aug 2022 13:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220805103605.23096-1-yuji2.ishikawa@toshiba.co.jp>
In-Reply-To: <20220805103605.23096-1-yuji2.ishikawa@toshiba.co.jp>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 8 Aug 2022 23:27:34 +0300
Message-ID: <CAFCwf10PL+kO5YcaBTmA1N34tSF18NJ0GLJoJ0L2VG5GuV-6XQ@mail.gmail.com>
Subject: Re: FYI: misc: visconti: Toshiba Visconti DSP accelerator driver
 sample
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 5, 2022 at 1:41 PM Yuji Ishikawa
<yuji2.ishikawa@toshiba.co.jp> wrote:
>
> Hello Odded
>
> This is a sample (wip) driver for a DSP found on Toshiba Visconti SoC.
> The DSP typically accepts some images, apply an algorithm on them and yields resulting one.
> Therefore (image-in, image-out), they say this driver should be classified to media driver category.
> However, it can handle various data format (wider than v4l2 officially supports)
> if userland provide firmware (=algorithm) for its own.
>
> Yes, this rough implementation is the first step only our staff could go.
> I'm not for sure whether we could carry out experiments earlier if we chose to use existing frameworks,
> instead of writing our own routine for handling DMA-BUFs and interrupts.
> I hope this post will help your case-study.
>
> Regards
>         Yuji Ishikawa
>
Thanks Yuji.

I've gone over the IOCTLs and they seem fairly straightforward. I
think that we will be able to accommodate at least part of them in the
common code of an accel subsystem.
Oded
