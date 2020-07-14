Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F86521E430
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4326E845;
	Tue, 14 Jul 2020 00:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670A26E845
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:01:10 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id l17so3944332iok.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DfE+/eEhL/C/7mzzImUH7fr1V8lvgwK7gw/o36CiHCc=;
 b=bjG5G2pT+Ns+e60wpBbwGnKKJq/SG3oxy4T/xkWjqPAVBG3fGYhAqRTH6Fgi9l3fW8
 QvYg6joiDl8vtSF8Y+/HUpyrJ6PvUyN2n4suAQfjTgPpKgruvws1IYxeqQP4rHS/3GC6
 OQcHmf7346kXeCr/CTcmDT0toEaf02c4mg1e6Ryl4t5XSHPzVBnMKmzcwFk9ydmyn9kF
 XZx0qRIwDUsRPecGzjhtoNYRoxcQXRt2+X03ezKym5smTwCS70ZSrek6OUA343fv/8pG
 36L5LRe/4HDg3gko+ezjYnN1pFgSkgdfAmzpeZ4+vb4i2Qe7Zd9eOIyCTn0/gT2nO0lJ
 L+0w==
X-Gm-Message-State: AOAM533hRO/bBA7qOCHwOnMEO81+pO8rHjeje6w0Iqqr+QObY2xXT/Ad
 5XUsuNrf8cC6s6x1r487HQ==
X-Google-Smtp-Source: ABdhPJx85S/x+F+SaLcSc/V1TI9FIVxrAl7Lmv24/4MX7WwBWJmlqBWALzJD5lIWOPpaCnh7zneBNw==
X-Received: by 2002:a05:6638:e93:: with SMTP id
 p19mr2902688jas.67.1594684869852; 
 Mon, 13 Jul 2020 17:01:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u65sm8228227iod.45.2020.07.13.17.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 17:01:09 -0700 (PDT)
Received: (nullmailer pid 964336 invoked by uid 1000);
 Tue, 14 Jul 2020 00:01:08 -0000
Date: Mon, 13 Jul 2020 18:01:08 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: media: renesas,fdp1: Add resets
 property
Message-ID: <20200714000108.GA964283@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
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

On Sun, 21 Jun 2020 03:47:32 +0300, Laurent Pinchart wrote:
> The resets property is used in DT sources in the kernel tree. Document
> it and make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
