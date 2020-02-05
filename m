Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53441538F3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 20:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18A16F93E;
	Wed,  5 Feb 2020 19:21:49 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977816F93E
 for <dri-devel@freedesktop.org>; Wed,  5 Feb 2020 19:21:48 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id b79so2105005vsd.9
 for <dri-devel@freedesktop.org>; Wed, 05 Feb 2020 11:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
 b=d+Lea2T1FikkJSXKbyM1VkmMu7+6OK51opstzFjKZqfVTWGc0HJyavyLb+VPLonbdH
 XamEHLtjdwui0xj8WnEoC7whi/BeT3DvPVSnA1XJbAN0mMEripODaa76GX6Q5KujvPEs
 uxYN8bYLDYx5xjHsKtyyQHKN8OKwwXdxQ/T74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
 b=d0JZoh0Hp6FWGHjCaWpF3SZUsyy9FwUtPw/lUruc7a8axzm3+yLC8cNxpDgeQ7ZgRM
 JGcgUBJjvD1damcIsDf/TXrQenlxz7iCuXKPBW315BE/GXzbMQ33BOkt2K27A7eqj4ev
 JsUXiHbzfsDhlGbxwkBdSHIlsLnlL4h63ESbxsZJeqScmEw66oYoGCRqMwyo2nccyp3+
 VRHGGpO2rGJISFMfUdYfPzjzNt2ziDPDvG9OiSW1JUQYq8JhILBV4c1P9zW1J1vWU4RI
 +5D57miHV1nJ2zJ5XVj1vQ2eU7NmBlK77mAw3KoMFyVWJbtarNIjFXHwe6T/mSv8CENX
 TIlw==
X-Gm-Message-State: APjAAAUchGxT8p1nBXl2O4PMA8Hqe6BFJIbKf7lu71LZpU8IHVkbetSw
 wtdIfjuWxV74eXoNtPCjJV0MZUAMiyE=
X-Google-Smtp-Source: APXvYqw/jD3VNqQy4xbT1FpXSvx0RffTg61BVWN0HdVfgaQF/qyhOITsVvzIrE3kj5ER+TKF9rz39Q==
X-Received: by 2002:a67:6746:: with SMTP id b67mr23619654vsc.193.1580930507234; 
 Wed, 05 Feb 2020 11:21:47 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id o6sm257283vsr.21.2020.02.05.11.21.46
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:21:46 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id g15so2133241vsf.1
 for <dri-devel@freedesktop.org>; Wed, 05 Feb 2020 11:21:46 -0800 (PST)
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr22314847vsr.109.1580930506045; 
 Wed, 05 Feb 2020 11:21:46 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 11:21:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: qcom: Add support for GPU GX
 GDSCR
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 4, 2020 at 11:01 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Taniya Das <tdas@codeaurora.org>
>
> In the cases where the GPU SW requires to use the GX GDSCR add
> support for the same.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Since you are re-posting Taniya's patch you need to add your own
Signed-off-by as per kernel policy.

Other than the SoB issue:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
