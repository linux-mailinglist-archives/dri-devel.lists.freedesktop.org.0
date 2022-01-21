Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C395496778
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA3310E1BE;
	Fri, 21 Jan 2022 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705C10E4D6;
 Fri, 21 Jan 2022 21:41:55 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id e81so15451366oia.6;
 Fri, 21 Jan 2022 13:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lF4HMuqkp4VWT3w6r4KvVzp/kzCK6RItYXFgLAX6eAw=;
 b=TiXsaZsgqefnUJovv/IdIKHwRcehkt+j8PDqC/KrfTykcPhdtrNyegbEesYLmCgCQX
 v+oibXh3ltSdLgtTCuGXBFnbNI3Q14CvsY70nOQ4a5IRcsHmiDyznG2p2Q/L7B3JAgNx
 57nplDvflH8Pc4GioSKhcg2GJG5mcmeY2sRb4ad1+SxGXtxpG2EWsvOBOZsbRlDHGwEh
 1Y1boJ7NpIUJFXW8aZVRsjuISdZpR8AM9yBTp+4eSCPIjkxyQc/DpPZm0cyffDKvSfpr
 GGfys/kmRuYG63MI6eE+fr0iKnvbxcnl/9TSXt9K8KcGDzk4hoPvPqhqH3LoAiVxAU8P
 Hl2Q==
X-Gm-Message-State: AOAM531aILkyuLLpQLTfHXXN7Fl6By7uCPBf612RiNByjtr6LTVhYi6S
 l9cFVdFTZ9imB4wQodgqAA==
X-Google-Smtp-Source: ABdhPJwne2XmMOP72QVvxpy/tQX5tuU1+CZHAFmA7X4krgdi7zq0qlm6dht+yhHpDDCx9ZvZomIEsw==
X-Received: by 2002:a05:6808:607:: with SMTP id
 y7mr2157878oih.131.1642801314203; 
 Fri, 21 Jan 2022 13:41:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 124sm1743747oif.7.2022.01.21.13.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:41:53 -0800 (PST)
Received: (nullmailer pid 1638609 invoked by uid 1000);
 Fri, 21 Jan 2022 21:41:52 -0000
Date: Fri, 21 Jan 2022 15:41:52 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [WIP PATCH] dt-bindings: display: msm: dsi-controller-main:
 distinguish DSI versions
Message-ID: <YesooIWKcypvtBbi@robh.at.kernel.org>
References: <20220108190059.72583-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220108190059.72583-1-david@ixit.cz>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 08, 2022 at 08:00:58PM +0100, David Heidelberg wrote:
> Update documentation compatible and checking to comprehend
> both V2 and 6G version bindings.
> 
> Following this commit, there will be update for
> compatible string in chipsets dtsi.
> 
> Additional changes:
>  - switch to unevaluatedProperties
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Rob, I know you mentioned using rather chipset names, but since
> meanwhile I coded this, I'll let you decide if should make sense to
> change it or keep it this way.

It all depends on how many chips per version. I'm guessing only 1 or 2 
given how many QCom SoCs I'm aware of.

I think this should probably be split to 2 docs for the v2 and 6g 
versions.

Rob
