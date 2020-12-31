Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E32E823F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 23:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB0C89B38;
	Thu, 31 Dec 2020 22:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035AF89B38
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 22:41:03 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id u26so15434998iof.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 14:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bq1ampSovDf3E6K/Nut0jgcMzqjMGTsUaPGA2BE/HFs=;
 b=rZX6Yvh60OcijIMSf0WyVwJ1Wb5CZltk/LMVJqrCADiliWhdlmQ7MB08kfyBleCbWu
 rwO4pL5rGEYcDayvU1C8Vp+x6LzmdpZrTUaxwk7DR9HAYkB2PJzQhZyGYa/zWxqR1Lsw
 HjXTH/QOZkWlK1JQEz9M9qgDKEvhGyqAgaR8iSi+IG143T+fA01sGWmTeKnJ6xzZAtcT
 4sU+M9N1wCOCMV7DF/29C5GozQ15xf6EL3nvMYTfttnYUcbZzwiyaW3oppjlAqK+2KLl
 YqAOR3ngb9tPdffmKP/foSyA68m84i0+2o0kxucrkjpIcH6DMizR7Jo9HVd4t1m5zTkF
 4CTA==
X-Gm-Message-State: AOAM5328HCxqHp1G5GvE3BUBzGhVz8N6tt50SOQFx/zcFAgBiijnx8E5
 fhpqt3ojS8H+lJpcK9Jx0Q==
X-Google-Smtp-Source: ABdhPJx/IhyHgtSG6AFYHM9hSUmuPDlCR3dmePMBnSOqOxfvDdMCLvCvyfiIB/FtB12UbDksCb5c/Q==
X-Received: by 2002:a05:6638:1a:: with SMTP id
 z26mr50695001jao.52.1609454463235; 
 Thu, 31 Dec 2020 14:41:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y3sm34534058ilq.9.2020.12.31.14.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:41:02 -0800 (PST)
Received: (nullmailer pid 2508944 invoked by uid 1000);
 Thu, 31 Dec 2020 22:41:00 -0000
Date: Thu, 31 Dec 2020 15:41:00 -0700
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3] dt-bindings: display: renesas,du: Convert binding to
 YAML
Message-ID: <20201231224100.GA2508888@robh.at.kernel.org>
References: <20201220145053.7382-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201220145053.7382-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 20 Dec 2020 16:50:53 +0200, Laurent Pinchart wrote:
> Convert the Renesas R-Car DU text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Drop boilerplate for ports node
> - Add description for interrupts peroperty
> - Use single quoted strings to avoid double backslashes
> 
> Changes since v1:
> 
> - Use pattern instead of enum for dclkin
> - Update MAINTAINERS
> ---
>  .../bindings/display/renesas,du.txt           | 145 ---
>  .../bindings/display/renesas,du.yaml          | 831 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 832 insertions(+), 146 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/renesas,du.txt
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,du.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
