Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8B1E540F
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 04:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8F36E149;
	Thu, 28 May 2020 02:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3815C6E149
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 02:40:32 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j8so28329587iog.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 19:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jAgEV3lXpdTMtJoytrXIsuXAMfljBJ1pwoL+aiV7YTw=;
 b=PDuRZqzNGf9psiCSUyEi1eW2qdm097McRwz22ufHFB8dcpvs2jXEnLtseashMWFzNl
 TI2LjGDOHYT9tJBCDRjTVTfP1uzXEccbYfwOJg599i9ML+YvPgeIDhMiSjB9QfzVEIyW
 jEtiMfqirvW5nB362/+Vm22rnd9OIP5O0Iuwuy/zaKeHOzqZajKdFsqxhnAVECMWH6U4
 2wqQIVPH/leVyqjbK7RDTRsPVNLM0QWt8dePoD8bDzCp+0Gu6eibaiIiIv+pF02wAQIG
 Ts7KLluhINdRLxm0KsTSSSbVvDMR8xnuzdHHKQ1qaTlpilRUMRheZQiMZSI2K5poJSRE
 1cKA==
X-Gm-Message-State: AOAM533RgTTX8pdSx0x4F7n5LSTnNQX8WRvHVb1atQrf0ZcUYX0jFLMp
 CcphySbWhUbMj+YCgXSrYRcCrWU=
X-Google-Smtp-Source: ABdhPJzXkkAhZmxetk8xI59P5Da6u7sTn24AZmqsb6MTJ1H3YqrbiXlZdcB6G5fnNZIqM3YLj2VqEw==
X-Received: by 2002:a6b:fa0b:: with SMTP id p11mr689360ioh.147.1590633631449; 
 Wed, 27 May 2020 19:40:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s66sm1938432ilb.25.2020.05.27.19.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 19:40:30 -0700 (PDT)
Received: (nullmailer pid 3259005 invoked by uid 1000);
 Thu, 28 May 2020 02:40:29 -0000
Date: Wed, 27 May 2020 20:40:29 -0600
From: Rob Herring <robh@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add Xingbangda
Message-ID: <20200528024029.GA3258957@bogus>
References: <20200513212451.1919013-1-megous@megous.com>
 <20200513212451.1919013-2-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513212451.1919013-2-megous@megous.com>
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
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 Martijn Braam <martijn@brixit.nl>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 23:24:47 +0200, Ondrej Jirman wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Shenzhen Xingbangda Display Technology Co., Ltd is a company which
> produces LCD modules. It supplies the LCD panels for the PinePhone.
> 
> Add the vendor prefix of it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
