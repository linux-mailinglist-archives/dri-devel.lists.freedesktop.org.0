Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9C21E43D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FE46E84F;
	Tue, 14 Jul 2020 00:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BDE6E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:02:33 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id h16so12739689ilj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HdkxFP6RySWIBJNgeXU3DOswKHXBO1oVzLiJk/Yo1J0=;
 b=l8h1FK8+bBks3mnQqYgMjzHLkJRAAFEoDdP+iiPZnMMoCjdpYtKUDNjn1ltZTPwdC9
 Ad1CT3oga7bF/87Luia9HANo2QD5X8GUexYDYXdBdUHRhr6YBx3wjGepxhT0+XYZDQE8
 j2uUvA4gJ4tu6CNFJgPXlIMO7PeqG0Kf7r2Aq7uANO0LXRUJ8HvGF5x9ZtMVSqF3o94i
 k8etZMEifqGHNo2LwjlZS3R3u2cN3FVHYwsv8i1n0FmuWTvewYwRcvzt7cgFHMpmWmYQ
 BrlsmXvHPwdXaIb1q7ayEp5uRvE2ex12P0RYrg490sj9/Vkd3mseqt8VNJ+trkbkEvQh
 sMCQ==
X-Gm-Message-State: AOAM5302ID+g8b0XxqDIwPS0jc2GvKBfoM1iYrr27moCL/Rdl+q1Ixdm
 J4jzsSzrEl40e5UEki1XfA==
X-Google-Smtp-Source: ABdhPJzkMFBVjplcCCONjH2uvM40l21gPZTa/5pBmaoQH0Y0NKi5HsLtcSW8OLDgOWsaAs0rVbPE3A==
X-Received: by 2002:a05:6e02:48b:: with SMTP id
 b11mr2345337ils.87.1594684953219; 
 Mon, 13 Jul 2020 17:02:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id q5sm9071188ilm.73.2020.07.13.17.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 17:02:32 -0700 (PDT)
Received: (nullmailer pid 966436 invoked by uid 1000);
 Tue, 14 Jul 2020 00:02:31 -0000
Date: Mon, 13 Jul 2020 18:02:31 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 8/8] dt-bindings: media: renesas, vsp1: Add
 power-domains and resets
Message-ID: <20200714000231.GA966388@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
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
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Jun 2020 03:47:34 +0300, Laurent Pinchart wrote:
> The power-domains and resets properties are used in all DT sources in
> the kernel but are absent from the bindings. Document them and make them
> mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
