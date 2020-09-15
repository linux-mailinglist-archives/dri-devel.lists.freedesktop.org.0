Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFCA26A9DC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 18:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01F26E10C;
	Tue, 15 Sep 2020 16:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1C16E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 16:34:10 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id a8so3636957ilk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 09:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9fIL/FgQhm9day34dQ8PFJlUZXL9ZXva0VX7sFbpBEU=;
 b=ZW9JOnx/YfGt94pN3dSgDOxE8cUYCok4FmYewKP43lfx50t42T7j1EsqM5bLEYyxkr
 TOA/qVlBN2w+3rkU6VJpwCuPF6Tt05tmn5vYW1mAh37y2jfLVtdsQ3U0WcGXHKTRMHmM
 lynqhu/j9mMKRjVfMeR1YQMGHYzoeuAku5XLFaSnOf8fhjKc2dnJB1KqJFZ6R6FpwIV/
 TMoGgHD8QYM7Wnajb8n+or3dk1COMTFcoQp8CKPkzKwVIpZywBchvt1V0y+Xgc0woYkn
 WxMRVI3Wvej7ZYyf177OV8n8gA8DfV/L1nGFA3H/j8teGq4DyLjZy9WroXQzeGs5BKJd
 0I4Q==
X-Gm-Message-State: AOAM5332VRyl3RZziJSa83XpTv0XBJyl86co32tCxM8NBzRO9NqeotfO
 AInasTry/y3gGY0+Gdk4uA==
X-Google-Smtp-Source: ABdhPJysXqkcSID5sHY9Z2TFS1pKKNGsMObUCnI9Q/goE2H51xiVmt8RRYMXpiYda+hu5nEEtw51jw==
X-Received: by 2002:a05:6e02:bea:: with SMTP id
 d10mr16621861ilu.143.1600187650181; 
 Tue, 15 Sep 2020 09:34:10 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w22sm7815516iob.32.2020.09.15.09.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 09:34:09 -0700 (PDT)
Received: (nullmailer pid 2081410 invoked by uid 1000);
 Tue, 15 Sep 2020 16:34:06 -0000
Date: Tue, 15 Sep 2020 10:34:06 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: display: renesas: du: Document the
 r8a77961 bindings
Message-ID: <20200915163406.GA2081354@bogus>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
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

On Tue, 08 Sep 2020 09:34:04 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Document the R-Car M3-W+ (R8A77961) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
