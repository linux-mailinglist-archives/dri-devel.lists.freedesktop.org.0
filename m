Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A47DCDCF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B52E10E4C3;
	Tue, 31 Oct 2023 13:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDCB10E4C3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:28:33 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d865854ef96so5077587276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698758913; x=1699363713; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vkk8ZCgsYoi/AnkxKAKmjXFYbNerVSNaR8gjvx3gGLI=;
 b=A5aIwVdFUeCOwBl9/k9hXTVIBPOJURzijbmykluwKO5e1CtUB+XO3Pm6QQPQbIcnc1
 EXpmmW7O4eU+vd1iumF08nT6w6dwd8lyy9dFeDUzX/3k3Yqa8oS+rHMmWfPRpHe9w2Gj
 /jpyjdoWWeRytgvGvWQDNqyojAmJZl4gITzou2UeEPi9tjS3u/58x1XEciZNT0w5HlzR
 UDm00jdWjWV3Wc1dCXGo9dy44VfbV/FapzpGWvOwx9utMOWZz9FVV7tS8HyjADOkuUDx
 iHm1U0aX7Aw/AXSP5CfvZFFE9RKFoabJzbk/8wBx5H8HZgwf5lMeddmO+zGfmjR5+Vyo
 Vg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698758913; x=1699363713;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vkk8ZCgsYoi/AnkxKAKmjXFYbNerVSNaR8gjvx3gGLI=;
 b=vUWzN8s3NQjmELOne0a1H96e1MC91nIAxmewEGMksXWS3HRyMHiNp3ypmIMeq/C4uc
 YbmYmAXyduYPLJpQ5LUVB5DS0bHwnOdRioRoJ7FQaSOKC4gegcu+E9dj7plOnGzxeUBa
 mxj/2WtHjTCKQ9+l5gj/WbAzlrxGE3oNxiMA9H7vVMLpDkEqBNg0raZM6DhfHuar2pik
 f4F2wsfQYL0oGfbpmbkmJugHg6WJiyzWr+cYqkp5X/htLzSD+wRbLcsO0RA7ddCV0PHZ
 WpoOhAGqA9LGgwFYQ5KgJtUysIF7eAl/jtBAAZ3kfv+o0j3hknNHwuE35swp5NjDiA8l
 uptQ==
X-Gm-Message-State: AOJu0Yx/QBSbW5XYKGHHoX1wuIrJTcj7g8+pLlqvwArl2P2zRukjHFO7
 zsPhUZz3OavPRBy7Rs1jw5D5ZOU04nAKq/QZ/tb0yg==
X-Google-Smtp-Source: AGHT+IFxGRQfCveVDXVJVYYAtbgwY6/eAygWWpBIQ5S0HJJ6v7iBgo2Jge7ptyq+gUT1DXQGHLc/CMOxuUr+u443Pmg=
X-Received: by 2002:a25:c541:0:b0:d9a:5ff4:cfde with SMTP id
 v62-20020a25c541000000b00d9a5ff4cfdemr11842307ybe.13.1698758913054; Tue, 31
 Oct 2023 06:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-8-dmitry.baryshkov@linaro.org>
 <ca3a0d84-befc-4426-8cdb-ea9d55e7fac9@linaro.org>
In-Reply-To: <ca3a0d84-befc-4426-8cdb-ea9d55e7fac9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Oct 2023 15:28:21 +0200
Message-ID: <CAA8EJpqbMT3+53NndkjvJ67KvURYsbwD6yfT4v6KowsiYdOR8g@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] phy: qualcomm: add MSM8x60 HDMI PHY support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023 at 13:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 28.09.2023 13:16, Dmitry Baryshkov wrote:
> > Add support for HDMI PHY on Qualcomm MSM8x60 / APQ8060 platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Do you have the PLL working locally? Would it make sense to ship them both?

I do not have APQ8060 / MSM8x60 platforms, so I can either c&p the
existing code or I can drop it completely.

If anybody is willing to donate and/or lend APQ8060 or
MSM8260/MSM8660, we can probably fix that.
Requirements:
 - HDMI output
 - UART available
 - fastboot or network support in the bootloader

-- 
With best wishes
Dmitry
