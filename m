Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976052A0697
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 14:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2826E9BF;
	Fri, 30 Oct 2020 13:38:11 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFF16E9BF
 for <dri-devel@freedesktop.org>; Fri, 30 Oct 2020 13:38:10 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k3so5564377otp.1
 for <dri-devel@freedesktop.org>; Fri, 30 Oct 2020 06:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+NTaR+FmsROaR0mc3AxOVyIyS9PM41eAe1X9dDcISGo=;
 b=LVL8L8dRppbSeMj7kVfhbXixda5PynT7oIUjqp2oOzuPJaXozdGPrKkaoE0EaXprL8
 7Mr9jeKFpMyPjJIwV6SXKimpLVPkNTTYr429XweNqM6imlKBFBQKLgH4dx2SLm0JgMgh
 nh65cZWViEnWDMdcqR0ZqMvqgezpvSlZ2he6j+Kym6GAXplk05h4KzribbnBGDna5pav
 Cl3jPSt7kbAue1FlBUY9WzEuT8Xg8Dlg9fU/uBJ+FrQNfQVTo+rnc2CdaHoOPN96TEut
 CYtIxLutYb4Bm0xyGpXZNY22rbcYPzTu04RJ4tYK1SJ5fxLR50AP7EQ1g6Zk3CzPNDs9
 2hdA==
X-Gm-Message-State: AOAM530jSuJi2zQAweMPsDlEsWpVTwqL1MfNo0K1ARH77FioLY/jkCN0
 hS2TPBvUzr8Y3/bK5apDAA==
X-Google-Smtp-Source: ABdhPJw2DwG/OKaEJ21EJ8MvBOaMf7vQ+RMEY20B0hdl2Y4TXBFZRVC5SVhlmh9eBGawREAWfV9uYg==
X-Received: by 2002:a05:6830:154d:: with SMTP id
 l13mr1814291otp.61.1604065090197; 
 Fri, 30 Oct 2020 06:38:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v21sm1315274ots.29.2020.10.30.06.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 06:38:08 -0700 (PDT)
Received: (nullmailer pid 3727265 invoked by uid 1000);
 Fri, 30 Oct 2020 13:38:08 -0000
Date: Fri, 30 Oct 2020 08:38:08 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH v4 3/3] dt-bindings: drm/msm/gpu: Add cooling device
 support
Message-ID: <20201030133808.GA3727230@bogus>
References: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
 <1603958841-20233-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603958841-20233-3-git-send-email-akhilpo@codeaurora.org>
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
 linux-kernel@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Oct 2020 13:37:21 +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
