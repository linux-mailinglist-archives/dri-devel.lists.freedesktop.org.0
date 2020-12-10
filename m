Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5882D51EA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 04:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DCA6E528;
	Thu, 10 Dec 2020 03:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5976E528
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 03:47:51 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 11so3637762oty.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 19:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7LvVqs5ncSD4pl3VnfXv2RU1ugwx7nqGrx68QnCprxg=;
 b=FnxTdz/wI3lA7Ro7ZGsvV6tFrI4VZmgZQeMZbM/XQymy54EkCX2mzob8tXByPga4u6
 fUUEh1JZSQzihUrKdk7mez6aGc/lZMD5N4klaEPEQ3RzoOlWGOyMTtrrPiAmdalE3H2v
 k0fMyePuA2yv9DajAUtZKt7/WRouPc1BIo38bjtoX2ZR3ERds8ZKzJNg54CtXRmUN65U
 DzNGVHTCI8VGiUE8d7oA8HWDSFGAFK1M7XtqC4tGfRaeaLBFesWaEkkEbgY6fuRfAOfy
 cGaoPM3Mo7ojWf+ys0rihINk2UbvOhM1grGvg9VSUGygKFSCztUEB0vGf4Ap7+YUAi0L
 ekCw==
X-Gm-Message-State: AOAM533VqByid8ahUthDkb6JVLEVS2vTE6CwEjWc2laSJACVOakMLhD8
 PrWu5GNQMeFAo2ea9tG9ig==
X-Google-Smtp-Source: ABdhPJyCfuLosZZ/+ky1293Ud30jc/f36KYY799wDDhYaMnz2bboZStpC5fYnkxw+auMputWawaGfQ==
X-Received: by 2002:a9d:774a:: with SMTP id t10mr4470692otl.190.1607572071320; 
 Wed, 09 Dec 2020 19:47:51 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z10sm783811oom.3.2020.12.09.19.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:47:50 -0800 (PST)
Received: (nullmailer pid 1621961 invoked by uid 1000);
 Thu, 10 Dec 2020 03:47:49 -0000
Date: Wed, 9 Dec 2020 21:47:49 -0600
From: Rob Herring <robh@kernel.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Message-ID: <20201210034749.GA1621931@robh.at.kernel.org>
References: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
 <1607352626-26088-2-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607352626-26088-2-git-send-email-kevin3.tang@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, orsonzhai@gmail.com,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Dec 2020 22:50:21 +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
> 
> The Unisoc DRM master device is a virtual device needed to list all
> DPU devices or other display interface nodes that comprise the
> graphics subsystem
> 
> Unisoc's display pipeline have several components as below
> description, multi display controllers and corresponding physical interfaces.
> For different display scenarios, dpu0 and dpu1 maybe binding to
> different encoder.
> 
> E.g:
>   dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;
>   dpu0 binding to DSI for primary display, and dpu1 binding to DP for external display;
> 
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../display/sprd/sprd,display-subsystem.yaml       | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
