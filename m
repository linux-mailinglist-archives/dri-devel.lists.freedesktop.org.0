Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547C376C74
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 00:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3FF6E15A;
	Fri,  7 May 2021 22:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC416E15A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 22:19:46 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so9198706otp.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 15:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0UetlzgMV9sWP3u8qRhR3UDA/39bSH3aEdnfUV/MJQQ=;
 b=mGyJbfUjlx7UxnO36r0c8e0MBgJWcHpKhVY0WbuQOAmrGSECvp6eCtQYcedGfMHst+
 qHk15e2ItOQKXHJiu96M1iN4KPRrZcckSVmEvJf7uq/qYa2oli0koS2MhoTxUWPhHaPw
 iZm1X0SC3WKC1SZDQnufmQgXebKsxLIzXCKs1dtpCWiUQZoM3wS+Ftf9F4DQXReA2zkh
 JB1Hc8KuoMQ0XuzOZPX96ErRGr/sYDa3RKgkg+f2vtJpgEWSoyrV31Aer6a/1revhDEC
 TVyadSmRy/eRJcuPwpTKfLbxHwPXjIoB4vg0TgvFwHryuYgM+/Y5fzReM49/zDSH6zzD
 pIRw==
X-Gm-Message-State: AOAM530s6MWUNIrqc0/lXxuyjXf4fZD8JF6uedn9oEHtjzIAg9RgjQqi
 RMKHgU0GplhvWFuGiJsXPedidSR8Gw==
X-Google-Smtp-Source: ABdhPJxNU1vmGTSxd18QKVJuF56qr1MXCsPEJ8Wu+etL3EOUxJ05T0RrrzEPXZuxrzm6y2HLeWnaVA==
X-Received: by 2002:a9d:69c9:: with SMTP id v9mr10185365oto.65.1620425986095; 
 Fri, 07 May 2021 15:19:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r189sm1232402oif.8.2021.05.07.15.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 15:19:45 -0700 (PDT)
Received: (nullmailer pid 3000692 invoked by uid 1000);
 Fri, 07 May 2021 22:19:44 -0000
Date: Fri, 7 May 2021 17:19:44 -0500
From: Rob Herring <robh@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/3] dt-bindings: display: simple: Add YTS700TLBC-02-100C
 and G104AGE-L02
Message-ID: <20210507221944.GA3000663@robh.at.kernel.org>
References: <20210507080017.2794-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507080017.2794-1-mike.looijmans@topic.nl>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 May 2021 10:00:15 +0200, Mike Looijmans wrote:
> Adds these panels to the dt bindings:
> - Yes Optoelectronics YTS700TLBC-02-100C
> - Innolux G104AGE-L02
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
