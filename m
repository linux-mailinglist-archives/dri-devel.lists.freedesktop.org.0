Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B7310F2F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 18:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87586E0D1;
	Fri,  5 Feb 2021 17:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BD16E0D1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 17:55:46 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id u7so1842508ooq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 09:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T42QgMy/ntJkBGGqkjSbsJZWWBXpaF/+D1lujMvpfJc=;
 b=AfmBt+Sv7wLumC16XnKhFhvNm+x1+g4+NJhhiFG0ztxjhxNGPRuCj28AmEFxRSJGT1
 t9N4KWur7v6Erl91SeXyn2WASov+krgzoU926PoMySq26GzMex7GU++Vh+u4lV5LI5pT
 KsNx6n1oWEpC+jsInY7GjTYPQ8G1iM0o/SjAzsgAaLtq7/V8ZELkRDSxkJO3l//yCGIL
 bB5HoR1+HoXCWF9/OifVy/ZL2vAy5cdy9u3bBGCGndmCbMtPDrFpGRTvKqE9cpYpjZZg
 0d7we2FXBhlSivasYa1K7LMibWBq40R5q7TJHznkmVVNYlEaG2ElzpJpR1ss3pV+01Pc
 93HQ==
X-Gm-Message-State: AOAM5337uaPDRfJ8T+qGKjOrJT9siYd/JrTgp8LIy4NGCfWv/TBLOvPr
 1QOuGNloF8ZFyTq0yyUdcA==
X-Google-Smtp-Source: ABdhPJySCZ7kdYpyhimOLr/9yznPkOjWJYIhPiUxyeO0L7wpfbeLU1V09oGJfG5EdCAHFIQTPlY7BA==
X-Received: by 2002:a4a:a745:: with SMTP id h5mr4329374oom.21.1612547745786;
 Fri, 05 Feb 2021 09:55:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x9sm1919074ota.23.2021.02.05.09.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:55:44 -0800 (PST)
Received: (nullmailer pid 3364197 invoked by uid 1000);
 Fri, 05 Feb 2021 17:55:43 -0000
Date: Fri, 5 Feb 2021 11:55:43 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
Message-ID: <20210205175543.GA3363048@robh.at.kernel.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Jan 2021 09:17:56 +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> Changes in v11:
>  - binding: power-domain-names not power-domainS-names
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3: None
> Changes in v2: None
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
