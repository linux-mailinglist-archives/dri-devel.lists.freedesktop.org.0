Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B5B150A50
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FF16EC6E;
	Mon,  3 Feb 2020 15:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37C86EC6E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 15:53:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m16so18841926wrx.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 07:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tP8fWS0Om+HUZS9XvN6HPA99hRkjM3xVE0yxOW/WzBs=;
 b=iRWKLxsHcyZrD1wNg1aXKTNOCagTSPfm7cM/3WFVqFNUweN5owdyRC/QcuJZILZExn
 P4T4kEBk8jMndqKqm0WjSWdCfLLG0SY94b6iuh4haulJsn6AVXrUZH+l4fqWTzl9Z+5N
 IyIFodR23VPn9Owk1vzpf15cObQ55VGJ30oKYeeaQBDo8IJT95ovdp2ckM5MZPW/eOvo
 /gAb4lxF+ZeTLP6ffiE4UaRLYK7OuewRhzSyI7w6/fH/qcllaGELKADpM4NuIOGMmiNE
 Mg1kBLL+vX2zAF23XHglXhmiqpcTu4X0cF3REDdxcnmeDGI5zepv09qJU7G+pDafKehO
 qK3A==
X-Gm-Message-State: APjAAAWO9OwRBgTjJ1cGIdLSi6etF2rk8J7AjFhFu4H+alR3A6zR9f7R
 FYCiII4xE8TkxVlIZhBKxA==
X-Google-Smtp-Source: APXvYqzHf4VEmi2pcidWYBE74yP1wuva3q2BtMtnLGr1Ujp3xojBAWYPbbfNYhl4YvKIuxa+73JvAA==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr17245205wrr.73.1580745238257; 
 Mon, 03 Feb 2020 07:53:58 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
 by smtp.gmail.com with ESMTPSA id 18sm23239849wmf.1.2020.02.03.07.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 07:53:57 -0800 (PST)
Received: (nullmailer pid 31100 invoked by uid 1000);
 Mon, 03 Feb 2020 15:53:56 -0000
Date: Mon, 3 Feb 2020 15:53:56 +0000
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: Add ITE Tech prefix
Message-ID: <20200203155356.GA30832@bogus>
References: <20200127022023.379080-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127022023.379080-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Sean Cross <xobs@kosagi.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jan 2020 03:20:21 +0100, Marek Vasut wrote:
> Add vendor prefix for ITE Tech Inc, http://www.ite.com.tw/
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sean Cross <xobs@kosagi.com>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
