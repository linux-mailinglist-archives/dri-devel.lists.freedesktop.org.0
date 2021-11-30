Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DAA463406
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 13:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A1B6E44B;
	Tue, 30 Nov 2021 12:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6D6E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 12:17:39 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id f125so6307606pgc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 04:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXu04+QUxNwriCyATe0mYK4V2fWk7rKeUqQfH4ZzNho=;
 b=NFz49q4CXrhyY7CXbxV3z2ldVJwzaldxtc/oUsdRBVtBiXC0KM/JK9hjV95JGIcdR3
 XDGcDJ+EiGuf4DJ3sc1r8SPmbPHtA01T9BCHnE04fetiIF5bEeO5kMv+Jr7yO/x0BLOV
 Ih1gTcjC2GEXmWtPZxbvoDVwheVuXdxr7s+SKf5xLZXfPd4SmywfW4UM1xZt3Zfb+4Ja
 LgC1VaiZ3Ttp+29Rd7+1JBOZOCzIGe+JmkD3y7WyBsDSV7ACAYLlHUF9HslcRP/2pbnV
 v5jmy3VYLzwITHpHxo3kYxv45vgBs5BUH8ahHHnLp8P38JAI5Fttzm1opmXGLem+cWcF
 YCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXu04+QUxNwriCyATe0mYK4V2fWk7rKeUqQfH4ZzNho=;
 b=L4sohJCjJImWPf0MeNpMMXU2MKC5VUIV2R/Wt4ozne0r8I6sdiUBH9Uj6dtuvwbcMu
 JVIiV58a6y0VBmi7N2HuTrWELPnYZjuq0ABpxAtpN7mHAFoiVJZv1hoKFkQJy4ercGYv
 2CZbw1g8Hcq7OmvFbhTCn2tfXKTOKaLgVd3z9s8r/TfKQapbwF9284WnZGb/N3VjMRcp
 cddd+KF3KfYlRv/efDQI+KsjeHNqDtLu2Aegr4Fx4ucXA2tTODcewOPyj7ppfWBtPxk7
 BGpcRes4kQc6zMgwdptaaRekw50WI1AGSKQHDW9Bkz/dkix176y94CDUlPMeLgrGtFtb
 rexg==
X-Gm-Message-State: AOAM530U/PIKbaVPT1wXDFYqaPj3YUlTmM3AnrIe0fnuE39sMe2KDBRP
 6szYQorQnr04IQ6F+tiYmxfatPwhniYAXA+obhPcyHH7S4w=
X-Google-Smtp-Source: ABdhPJxXQvjuI9DOLtLA4qoREyXeCJL3uZPQt563tGuuhXX60ozlJ15yWahFJlZ5ASNrD3Cz92l7mKSjcN1q2dr7D/4=
X-Received: by 2002:a63:414:: with SMTP id 20mr39830109pge.178.1638274659171; 
 Tue, 30 Nov 2021 04:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20211117020724.2647769-1-pcc@google.com> <YaW3Cff+AJqT8tS/@matsya>
In-Reply-To: <YaW3Cff+AJqT8tS/@matsya>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Nov 2021 13:17:28 +0100
Message-ID: <CAG3jFyt802J8nxtc_iifgfbTJk0-Mtu_18aY0cEcjyJDaNLjaA@mail.gmail.com>
Subject: Re: [PATCH] lontium-lt9611: check a different register bit for HDMI
 sensing
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Anibal Limon <anibal.limon@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Collingbourne <pcc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Nov 2021 at 06:30, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 16-11-21, 18:07, Peter Collingbourne wrote:
> > It has been observed that with certain monitors such as the HP Z27n,
> > the register 0x825e reads a value of 0x79 when the HDMI cable is
> > connected and 0x78 when it is disconnected, i.e. bit 0 appears
> > to correspond to the HDMI connection status and bit 2 is never
> > set. Therefore, change the driver to check bit 0 instead of bit 2.
>
> So we have got limited information on this but BIT-2 seems to be related
> to HPD and empirical data from various monitors supports this, so this
> seems the right thing to do.
>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>

Applied to drm-misc-next
