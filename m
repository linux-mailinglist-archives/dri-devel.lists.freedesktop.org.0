Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F924623EC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 23:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307E66E048;
	Mon, 29 Nov 2021 22:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544C06E048;
 Mon, 29 Nov 2021 22:03:45 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id t23so37331065oiw.3;
 Mon, 29 Nov 2021 14:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wL2j/zhnCBNuLmFuTXzTlUDE4xxt9w3i13nGa7X0Qrc=;
 b=ube9yw6PPe4DJU5gbdpiJU73lbF5UDWcBprF/rP5nuGtmwHsCwyq4l2Nfn6EsAX1cI
 GPmLrDvEx+HsBU7NxM6cQTeMBeR6Phyof8CrYxMuVL47C51o7bjdVg4EoCukzmj+/AH5
 stBWpfDBYex0kVMyaSltQc983Krrlwkul5mNEM1tSxoNa2B0OJPha1z2EP6Hrx3XibAz
 +UsnSTmnMO+mYjPvWiPn1vAoQGWqqiIDCJHQ3ny5BXWFPw4Ye5seyy2oNVzFAsGa7LLB
 +9lECShfOgGs7XTUX+z8z+nXCtySUPHcGtm4zB1kh2YOu7rBpTbCckhQAp1OExJbkXAL
 iHWw==
X-Gm-Message-State: AOAM532Cmvf+W1iZNGunNggP5o0bqehU6SjoqK+5UnDEPlOprWMgJ8kI
 JW5l8tnGKaEpIuHKblBRrQ==
X-Google-Smtp-Source: ABdhPJyRltEG100ztU/F/vjH3VbBNGkp77YNJmZqqf5Mb0uG7mYLeNCPrngtXJ+IzOzkeDGFqvrfsw==
X-Received: by 2002:a05:6808:199c:: with SMTP id
 bj28mr721992oib.98.1638223424595; 
 Mon, 29 Nov 2021 14:03:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m2sm2484366oop.12.2021.11.29.14.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:03:44 -0800 (PST)
Received: (nullmailer pid 690738 invoked by uid 1000);
 Mon, 29 Nov 2021 22:03:43 -0000
Date: Mon, 29 Nov 2021 16:03:43 -0600
From: Rob Herring <robh@kernel.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4.5 12/14] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Message-ID: <YaVOPwmWinSJ6z2m@robh.at.kernel.org>
References: <YY7lb9k2UArZf7I/@robh.at.kernel.org>
 <20211115202153.117244-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115202153.117244-1-sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, khsieh@codeaurora.org,
 David Airlie <airlied@linux.ie>, robh+dt@kernel.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021 20:21:48 +0000, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> We'll use a new compatible string for this since the fields are optional.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-13-sean@poorly.run #v4
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v4.5:
> -Remove maxItems from reg (Rob)
> -Remove leading zeros in example (Rob)
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
