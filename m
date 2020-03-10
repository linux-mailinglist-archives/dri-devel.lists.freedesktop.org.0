Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A20180660
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 19:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCB9897E3;
	Tue, 10 Mar 2020 18:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAA5897E3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 18:31:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g15so8060380otr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 11:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kE8zJYod7DGw/iirznrwm04icms4ZonrW+m7De0Huos=;
 b=HUX663YzigE7i3HExrLFrDfX8KvFNKD+R4qoIXsQmvLz7e+f0vYclpoNfXYvtCXRmW
 iX2iz5brozD9zeiJ2OWRyWuHQrGMw8IbZkC+5r2mfL0Q1iJjgPIQGKpaSDnfmHIwa4xE
 h/STaX8NUeeTKfHcL6YAU4YZdOH9m1PmkxBs1/hACsUxyF8KSQhIXryUld0DCbGuQeqw
 Gxb7wNWn0VFfftXBZ4cmXYG/0sJ0SelMjM3VnR+AZA8aAvobwVX9+OrLrRLIeMyWHvjQ
 +//77RdD+Rmds7+cY512fcF+wNBg+XysLmP6NK3BlJEkubuDYzkYUty28xPx9m4SXfnD
 Fr/g==
X-Gm-Message-State: ANhLgQ1VI5qiaqUUqA7RYQxo03GWf6Eb3biQpIcJRduhVlKpMDqpG5BL
 ciA2+qGfApugKOgzslvkZw==
X-Google-Smtp-Source: ADFU+vs6BXU2RhaGOMkzDNdE03Xyflh1TY7gz7r9610og46G77Jwujiyd6QdA37f1IfNWYINzkfbHg==
X-Received: by 2002:a9d:21b4:: with SMTP id s49mr17315918otb.294.1583865080731; 
 Tue, 10 Mar 2020 11:31:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e206sm4490498oia.24.2020.03.10.11.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 11:31:19 -0700 (PDT)
Received: (nullmailer pid 14370 invoked by uid 1000);
 Tue, 10 Mar 2020 18:31:18 -0000
Date: Tue, 10 Mar 2020 13:31:18 -0500
From: Rob Herring <robh@kernel.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V3 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200310183118.GA13818@bogus>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583760362-26978-2-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, Kiran Gunda <kgunda@codeaurora.org>,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  9 Mar 2020 18:55:59 +0530, Kiran Gunda wrote:
> Convert the qcom-wled bindings from .txt to .yaml format.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 -----------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 184 +++++++++++++++++++++
>  2 files changed, 184 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#

See https://patchwork.ozlabs.org/patch/1251567
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
