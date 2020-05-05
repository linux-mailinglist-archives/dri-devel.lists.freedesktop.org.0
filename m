Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78A1C60AD
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 21:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50026E802;
	Tue,  5 May 2020 19:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967C36E802
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 19:04:13 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j4so2613105otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 12:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ez2jZ5YWvWKk1xrc5GCCzcclQFVn2i3O0Z1QVwxg5FI=;
 b=c9gwUQXa/0I8LK+hHSiOObs4sT+Isbm90C0KDA282FxMd2wJ9MNtJRIkCyATGEbE1u
 0QYd3US3ZRXY2QWdYkwYoZlFVs+gkjq/PC6BxCBZWXWFCzOacTea8EwVGMTdJIMtFQbk
 pzW3eJWe3bcQcxT56/o9/OLzS14IJYxanDlHXJi4jILWr5mnGstyrD7/fCEmspoHKUBH
 O5TGyz/lQlqMGB9jt06MPSo/LA6biJjAVjJf+/0O0jMGgHWh8BLRP7AM9JXxBer0ZvhQ
 rXr+/k5LWbF38p08YwH0sG4xBhvPIlMUDEjFiZEwI8WX3DQf+17GlqNOy6AUjO6Bc1Md
 AeRg==
X-Gm-Message-State: AGi0PuYSSabI1BZXSgufpbQHiFBsN3wxHiygLfH5Qp/aFXNJk/Ztn+fA
 DOWQyge11bz8vf9EQPi1yQ==
X-Google-Smtp-Source: APiQypLUoaZRtev0sjEUdQ8Wn5budqzOQLwjk0QYb1YINN2vbjLc9NGTn4SK0zkfuNm90+AXolxkHg==
X-Received: by 2002:a9d:7d8a:: with SMTP id j10mr3878531otn.266.1588705452881; 
 Tue, 05 May 2020 12:04:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k8sm400975oop.30.2020.05.05.12.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 12:04:12 -0700 (PDT)
Received: (nullmailer pid 13521 invoked by uid 1000);
 Tue, 05 May 2020 19:04:11 -0000
Date: Tue, 5 May 2020 14:04:11 -0500
From: Rob Herring <robh@kernel.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200505190410.GA13452@bogus>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
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

On Thu, 23 Apr 2020 21:03:36 +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 59 ++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
