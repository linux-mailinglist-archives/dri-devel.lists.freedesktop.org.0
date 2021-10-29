Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C843F49E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 03:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BB66E9A8;
	Fri, 29 Oct 2021 01:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E901F6E9A8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 01:50:55 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id z126so11086788oiz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n3Ihh87f3IefFIDSPqowySAnHL88IGrjudgGPD0ZkIA=;
 b=oKoA7oKepJ3rTggLpNjuTEFPeinb0r98wtf+VhGpfil58TDA6oOeD3Cm097tCas2UE
 pRlgtWBUf80BE5S1Usc91cFhiD6fdBFsZpdi6iom0irzhOQOz4/1JkW1fbJxejVrRNve
 mNhr/c5EateOCQqQIngrmTBzyM5T9E8w6L4HSXtWf0zJEM6h31Cc/Gmz6qP3OgemDBgY
 l293/gSOQjt3Uk7+SMi25L5QFiAqSMXNzbmXG2kI8jO/TYDTWMw669eToExAKMTkg96r
 GBcDOnZ8EbZ0AnoEi4AnjL0SXiB7H8jT5uuDSKmOtTi7CMTjtzIF3DizXxf/mDsXrNG+
 ljvw==
X-Gm-Message-State: AOAM530PVf0lQA5ZnXoz3kNS1eFrFc5hNZaiP16+6RxU/Goqp/I0ksnt
 uhwbhMcHesT8N1uyw0SGew==
X-Google-Smtp-Source: ABdhPJzBNoEnIm5IEbc2rw19homkNQyHpa+LWVyMziQilq7LHXnUJAXP8Z7eXnyqMKCpBdcYkfMeFw==
X-Received: by 2002:a54:4e1d:: with SMTP id a29mr5606670oiy.39.1635472255224; 
 Thu, 28 Oct 2021 18:50:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j25sm5466oos.23.2021.10.28.18.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:50:54 -0700 (PDT)
Received: (nullmailer pid 988667 invoked by uid 1000);
 Fri, 29 Oct 2021 01:50:53 -0000
Date: Thu, 28 Oct 2021 20:50:53 -0500
From: Rob Herring <robh@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: sam@ravnborg.org, airlied@linux.ie, thierry.reding@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, daniel@ffwll.ch
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: panel-simple-dsi: add Tianma
 TL057FVXP01
Message-ID: <YXtTfWTa9nUQLzzK@robh.at.kernel.org>
References: <20211021213445.17289-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021213445.17289-1-julianbraha@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 17:34:44 -0400, Julian Braha wrote:
> Adds the bindings for the Tianma TL057FVXP01 DSI panel,
> found on the Motorola Moto G6.
> 
> v2:
> Fixed accidental whitespace deletion.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
