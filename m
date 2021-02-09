Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2263157BF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 21:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135296EBAC;
	Tue,  9 Feb 2021 20:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F4F6EBFD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 20:36:23 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id q4so9097154otm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 12:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LIgzsr2Qli/S9QkbglvtZGEX6pYu5VmKf6DxSm22SAg=;
 b=U9hel0YjefMloDpAhQ7ECZvOMiryy19jlYGqoZlbCW/KDzreSIJn33uc9G0El+6ifw
 2xnFKILCwMq7xk1pziZD305n9zTT/xpGZy1lN0ZjpKuHgyrkjuVE6lUyhRgXLAxUS0Yw
 bzoDNuiYrCPGT8o2A4JWQnxxwg0KqWud7xTLHknzKLLTof73QzZtJhRqO6Oee1easJVf
 huRaSat1WoFKwt9uNJjbAI8UOmctgFtwG9RW5y/NG1V8nRBESa9mMaYsxp0Y99FDZiX0
 O9MrlQhUm7Q5ceMHkR+2MxPH5lIo9G2Qt58LfLNW5hKK+4tUaIxmVod2MADBZCgYrjFT
 FQfA==
X-Gm-Message-State: AOAM532PkftJfPPHxzhJrvdEMuTB7PhfVb1H9GJFZ99T4DAVtC+i/ZjS
 +vLTcdKiS3XxocBwuOHeDQ==
X-Google-Smtp-Source: ABdhPJxMOMcPuoEWBVYoR0AMeOOcRe94R1/BeO+3YMZYe1mviRFUfFiEYJvhqsYzd2MObhwj9iQgHA==
X-Received: by 2002:a9d:684f:: with SMTP id c15mr651253oto.40.1612902982606;
 Tue, 09 Feb 2021 12:36:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o3sm979oou.47.2021.02.09.12.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:36:19 -0800 (PST)
Received: (nullmailer pid 128691 invoked by uid 1000);
 Tue, 09 Feb 2021 20:36:18 -0000
Date: Tue, 9 Feb 2021 14:36:18 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/3] dt-bindings: Add DT bindings for Displaytech
 DT050TFT-PTS
Message-ID: <20210209203618.GA128652@robh.at.kernel.org>
References: <20210130181114.161515-1-marex@denx.de>
 <20210130181114.161515-2-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210130181114.161515-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Jan 2021 19:11:13 +0100, Marek Vasut wrote:
> Add DT bindings for Displaytech DT050TFT-PTS 5.0" (800x480)
> color TFT LCD panel, connected over DPI.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
