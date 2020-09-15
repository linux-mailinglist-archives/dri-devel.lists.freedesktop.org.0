Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF04A26A9EC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 18:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB2F6E887;
	Tue, 15 Sep 2020 16:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADD86E887
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 16:35:59 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t12so3623820ilh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 09:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OeYVlC0q8YHDsCZ+AV00n0PZxL9YUd4roOHRH74bsdM=;
 b=n+KDkIwSHc0o8CSIQDeXbLhxvvSJP+yybg4rTFCks95ImRdMX+ZVywN1qGV+aq5Bsl
 rIJJuIWa6h04qVQmgigZMIzm4lc/Rmm4kob1Ahyi4MLBat9wopsNLKIDLVXKrpGMBJYb
 z/cep2XnEZMgfhv+tsVBFXEbHmp6uJGLoE9VoQLj7E1uxkI5W3WwE5lri8kn+Vk2QWPE
 H+6Hj7/nXUf+4oktuLBTyonXlkJxrc9KQWaGSaVFBexB8L0AbGEA+LgMKBidDOo2DCCf
 iJReoW5wlkKDhfvWhWgXwvDlTaDd9R9z5mDaTPyTN1rR3yB0SPMWZR6cTYKz1eZ4K/5X
 ibLA==
X-Gm-Message-State: AOAM531d3J6/4pdnruTR7VZIVS2zCrS1OEdjv4jqaa2xTfT/KjfpZYSC
 NjN1OiemzJLTHN0Wj8wMsA==
X-Google-Smtp-Source: ABdhPJw391l1UvBEqoCZekDL6ccaND9ZxKJJty44VSqfQt0C91sMXSS6MFT0dofYVvT8JZ17PiVofA==
X-Received: by 2002:a92:cbcd:: with SMTP id s13mr11341896ilq.306.1600187759093; 
 Tue, 15 Sep 2020 09:35:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o8sm6836134ill.88.2020.09.15.09.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 09:35:58 -0700 (PDT)
Received: (nullmailer pid 2084415 invoked by uid 1000);
 Tue, 15 Sep 2020 16:35:56 -0000
Date: Tue, 15 Sep 2020 10:35:56 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: display: renesas: dw-hdmi: Add
 R8A77961 support
Message-ID: <20200915163556.GA2084385@bogus>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "shimoda \(Renesas\)" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Sep 2020 09:34:17 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds R-Car M3-W+ (R8A77961) SoC bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
