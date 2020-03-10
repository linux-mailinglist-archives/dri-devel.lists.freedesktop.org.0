Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDE180A56
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 22:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240576E0FD;
	Tue, 10 Mar 2020 21:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15D66E0FD;
 Tue, 10 Mar 2020 21:24:15 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k26so7444243otr.2;
 Tue, 10 Mar 2020 14:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rMyvrlYZi90RciaFxgPs3D8g4aAObdM9SGu5DftceKE=;
 b=CDCyvv/c3ci4ZMHe++6zRLrCJ+SCZl+utkaSiRE/uZ2h5SS0or765mbBpJXeYu38Nx
 BRjGPjZTrC4HcXT1W6B0pEZCZLMPJMS2mhO8wAxEmvYgVW60GBdCs+WXTM6+u0QRN92/
 51VZ7Z6ITkoCJb+RmAku0aih+TjnLOmyEIRM48hjJcC23l13+8U2+iCJ6a2rZX2mMDFc
 1izvGpj1xK4XFoQQyXQsSErWOhtFxtLplheSeOT9JwtulUHUuyN8P3hNX0GYy0a/oOf6
 wwT12M5Isz0l2SPReLVuQVgdVmbjvqKUb1C13lUORIwS5p3BUsGwRxiGauDKijlsJl7G
 G+nA==
X-Gm-Message-State: ANhLgQ11qtWuE4dvWqu5Zwfv3ap9RYNYFGzns6Lb+d14xCzxvahYed9K
 gwKY938NBm2dWYtGTNr/Mw==
X-Google-Smtp-Source: ADFU+vtT87O6/ValNU4002+zt2OEhm5ILV3CuQ5fOpNSeg++uHyZmwRVAgClROx/DQRGEWTFq1ZeEg==
X-Received: by 2002:a05:6830:2391:: with SMTP id
 l17mr16179319ots.339.1583875455228; 
 Tue, 10 Mar 2020 14:24:15 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n6sm1655079otk.75.2020.03.10.14.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 14:24:14 -0700 (PDT)
Received: (nullmailer pid 22188 invoked by uid 1000);
 Tue, 10 Mar 2020 21:24:13 -0000
Date: Tue, 10 Mar 2020 16:24:13 -0500
From: Rob Herring <robh@kernel.org>
To: Vara Reddy <varar@codeaurora.org>
Subject: Re: [DPU PATCH v4 1/5] dt-bindings: msm/dp: add bindings of
 DP/DP-PLL driver for Snapdragon
Message-ID: <20200310212413.GA13839@bogus>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
 <1583367028-19979-2-git-send-email-varar@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583367028-19979-2-git-send-email-varar@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, hoegsberg@google.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 04, 2020 at 04:10:24PM -0800, Vara Reddy wrote:
> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> Add bindings for Snapdragon DisplayPort and
> display-port PLL driver.
> 
> Changes in V2:
> Provide details about sel-gpio
> 
> Changes in V4:
> Provide details about max dp lanes
> Change the commit text
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dp.txt         | 252 +++++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
>  2 files changed, 264 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt

Sorry for the moving target, but bindings have moved to DT schema format 
now.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
