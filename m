Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BA3133CC3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7502E6E183;
	Wed,  8 Jan 2020 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07B16E156
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 04:57:52 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id s7so542077pjc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 20:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7N4CATf1B3tWrcIqA0lc8Bs8r5BQEFhVHByDqIRWZkg=;
 b=engY/nBde/VG8iDXNQFdCygeBfI1kKcPbMY/gCLX4UarB1FIWNVeDf6EhhNc3xDyzu
 aYDHKmbHMAxuf/+24HsS0vDPiAWKopjjkDHJqg0mzWvUV05nkRozpxSX2Ho25cBfG8aS
 7ltmZSN54dLw546fKzpFLyc2f+tccLrNqQiOZnJbtXOu7v0ROQTDtO/wuHpT5syhGs3p
 Wo5asKTItDxZGD/WtLMtFF4Pbszpp8AEr6Piu3tk7NS5s42qvoVZImt8i2sLtxMo56gB
 Hoei9n+xsalTTowM80VxASgRJHrSrf1hF/U2Dt1xWATc/N0eBuuLA9j0Tnt5mrXEiR/z
 UBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7N4CATf1B3tWrcIqA0lc8Bs8r5BQEFhVHByDqIRWZkg=;
 b=cqWQu0jJcByRgOYmT2E8fQENRLVYIg3Raal+YPUoxM7lhlfx/n1UsVmjaEqxWBWBUR
 BcNRMm31xjtoxF43bjUNaYqHiG6sRxoOZt17wf6zHCe8mTN0gG8LEFO0MUBwgeF8CMyZ
 WODzLQYV4rxCPygM8148l5kAP5jgfTgZqZ58YqNrQrhXlhWFQ5eQxtsX+V0iqcaAv4I9
 7K1ieDMl8yR9nzf616OEDE7bL4g6Xg1rH6TQ/HJH2Y1VkVljOhMKr73GL2AFUixbcxNN
 25lyZVeA9NxruVXBfIh2EenJDk0rWhG+q6Lhd/+EqV7X4lAHULxU56UcGQzK44kx3rZR
 XqcQ==
X-Gm-Message-State: APjAAAUjlZLT2iAMV1msJXFgYFvOaZioNIVwSn+I/J9saPifHss0cSpu
 MlaUPEsD4Ca+aNkPhWUKUeVOFQ==
X-Google-Smtp-Source: APXvYqyNiIMntmUkLSiqTU3rALo/9w7vTQWMfUF1QMT6CqT2wsMNuZvBjRLDUfmYn8Nuk2kqpZTSqQ==
X-Received: by 2002:a17:90b:4383:: with SMTP id
 in3mr2230799pjb.111.1578459472091; 
 Tue, 07 Jan 2020 20:57:52 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id r62sm1418357pfc.89.2020.01.07.20.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 20:57:51 -0800 (PST)
Date: Tue, 7 Jan 2020 20:57:48 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: drm/msm/gpu: Document firmware-name
Message-ID: <20200108045748.GI738324@yoga>
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108013847.899170-3-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 07 Jan 17:38 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> The firmware-name property in the zap node can be used to specify a
> device specific zap firmware.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 3e6cd3f64a78..7edc298a15f2 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -33,6 +33,8 @@ Required properties:
>  - zap-shader: For a5xx and a6xx devices this node contains a memory-region that
>    points to reserved memory to store the zap shader that can be used to help
>    bring the GPU out of secure mode.
> +- firmware-name: optional property of the 'zap-shader' node, listing the
> +  relative path of the device specific zap firmware.
>  
>  Example 3xx/4xx/a5xx:
>  
> @@ -85,6 +87,7 @@ Example a6xx (with GMU):
>  
>  		zap-shader {
>  			memory-region = <&zap_shader_region>;
> +			firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
>  		};
>  	};
>  };
> -- 
> 2.24.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
