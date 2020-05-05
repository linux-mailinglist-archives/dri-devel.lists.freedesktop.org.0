Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6CC1C60A6
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 21:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967116E09F;
	Tue,  5 May 2020 19:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8336E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 19:03:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z25so2604523otq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 12:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rltowIsU/RX+KwHoE8r4JocAq1x5HMLCxTuqb1yIep4=;
 b=fL2p2xaRR6pMBm0GROkh5bq54QCR0lUWIQlGg/IsnYgnWH3MNgAjwd+GvTvNXe1soN
 PGwXPamLJmSHod1sslL098cwQNlvcXWN5JYjLJmiY2pos4emSDbNGvpwAemQ49UK6X3e
 S1zAh6qs0CH8GPfjrBK8iITzUZRrFRrWAvx37b0ikDdL0kb9ZFCbW7srmPa8SLGJbTKW
 5QgmkSQO8wQoSJCJUukd7+wI1y2ML7KIGBZ0G1Qq3A9Oy7TUmrh44+Pi5nfoPeIM0hgy
 G1wjAsF11yCBYIoltsisyyyzUZl2HRUQlR9DH8u5RRkwPtO5P+Pmib5DV38d2/FabsZr
 I96Q==
X-Gm-Message-State: AGi0PuYHwneXD+YmkWQM3VecmmkMZRkZtlcbGYl9z/vhqLk/KBf5G/8u
 nNGAH2dCKkSMoTt/AIgCSA==
X-Google-Smtp-Source: APiQypJwkfA+D6zkGo1Z1qO/bvY0b844rxJMKdutLVPWTZ/m7e8cpvA3Yj80e8zScxt9f4KVVm4xcg==
X-Received: by 2002:a05:6830:1e39:: with SMTP id
 t25mr3673735otr.114.1588705413026; 
 Tue, 05 May 2020 12:03:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k8sm786584ood.24.2020.05.05.12.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 12:03:31 -0700 (PDT)
Received: (nullmailer pid 12291 invoked by uid 1000);
 Tue, 05 May 2020 19:03:30 -0000
Date: Tue, 5 May 2020 14:03:30 -0500
From: Rob Herring <robh@kernel.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings
 to  .yaml format
Message-ID: <20200505190330.GA12221@bogus>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Kiran Gunda <kgunda@codeaurora.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Apr 2020 21:03:34 +0530, Kiran Gunda wrote:
> Convert the qcom-wled bindings from .txt to .yaml format.
> Also replace PM8941 to WLED3 and PMI8998 to WLED4.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 ---------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 208 +++++++++++++++++++++
>  2 files changed, 208 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
