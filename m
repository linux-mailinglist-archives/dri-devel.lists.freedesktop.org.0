Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E8F154D22
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 21:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DA76E3A6;
	Thu,  6 Feb 2020 20:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA916E3A6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 20:45:42 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a33so3345217pgm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 12:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+5+zudFLEE54RFgGYNUhud7P5ykhS6QeS0Eeg6mrByQ=;
 b=MxcXUnfiOpBxAOEhKeZnQ8tMjgtFswHJGwM4hW/yp5id0wpoSvvE6lqGGxouQCgZLB
 JxzDnzLAFCdp760reOzFhrVks4ApBkFbeCXCoQfz+l1NTljjVNcfyMjb72rxLJJ9uMeK
 1nJE4Fcn1NrTmq/ExfAMPVOfT59pSAkLOFbiQpmsw04ghI3mZSyNo6T0+WK4dAao67aJ
 VvNHF0EqN/yDwo45xDMcurbIHokszcqmQSrdEOqMekp3lWFyDcjWuvzScnpf9SuzERe5
 Dktyce4sMTHhutMlnQTEtoAbHViDOfyTenn5rGi1ZuizXJRM2PzaqsbnVc56cIhj44PK
 qTQw==
X-Gm-Message-State: APjAAAXS0qRxKl+rhWbh2vtzGqr397UhDK3L9Fb+Igm3enOMQwN0lNu0
 HBwiaaVRkNZCEc4+9lrC/g==
X-Google-Smtp-Source: APXvYqxx3xiy6suP140csN6jmTWRjdAkDcziJEtMyX+hlSDZ0vGdcdlTlihGnjZPFtNI/bKbll/9SA==
X-Received: by 2002:a63:e044:: with SMTP id n4mr5612914pgj.338.1581021942409; 
 Thu, 06 Feb 2020 12:45:42 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id m12sm158298pjf.25.2020.02.06.12.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:45:41 -0800 (PST)
Received: (nullmailer pid 4349 invoked by uid 1000);
 Thu, 06 Feb 2020 18:35:33 -0000
Date: Thu, 6 Feb 2020 18:35:33 +0000
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: Add documentation
 for Toshiba tc358768
Message-ID: <20200206183533.GA4136@bogus>
References: <20200131111553.472-1-peter.ujfalusi@ti.com>
 <20200131111553.472-2-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131111553.472-2-peter.ujfalusi@ti.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, tomi.valkeinen@ti.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jan 2020 13:15:52 +0200, Peter Ujfalusi wrote:
> TC358768/TC358778 is a Parallel RGB to MIPI DSI bridge.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../display/bridge/toshiba,tc358768.yaml      | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
