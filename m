Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E72F220D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 22:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3315589B05;
	Mon, 11 Jan 2021 21:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16D489B05
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 21:43:32 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id q25so302306otn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YYDJmyTvCMUq876NjFDCcLGbzfPkkSf05NMN8BoG/ug=;
 b=LIGg+ZSmRjlGgEVh2SOsxvu4EkOGs7IQjC8cF3DMVKRJhj9ZOvoznF2rEHmirD9UDD
 m1OT61Bmh3HgyYiNgH6SkdIwnIc32YuHK+2BTty2o041RiZg4njW7EHtyCsEuY8nzneM
 T2HOdQ8smseGuKVw20LgSgsxXldImbiGq1PzcgPq/79rSQE5NbE82Fyt+az/iTvcZ+/M
 rR5ztqxKbccTltRD5Fc6VX1Urp2ebZVuu+9d+3tDDJ9MyNWeYqMnGyVIr7mWNXyJkcPk
 YiASbkuMtuTELWbF8lyVtddG93PPjbBGbkpa91Zlwm+EF/p9M8GY6XBiA6AixiYn6HEX
 LmMw==
X-Gm-Message-State: AOAM530D1dOiqpeV1mPJrUKorTLlzYmwmMDjtAWPPGHwLPUZWEdY9Jbg
 S8KTJnHXplohfPonXx3Ohw==
X-Google-Smtp-Source: ABdhPJwQu4ByJW5KvBlFIwF5mH1nnxnkWAxvkLskgCP+LxP3RFiR9dfxI8CSLfyucz/ViPFezsnpow==
X-Received: by 2002:a05:6830:15c1:: with SMTP id
 j1mr748036otr.211.1610401412079; 
 Mon, 11 Jan 2021 13:43:32 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g12sm217692otg.10.2021.01.11.13.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 13:43:31 -0800 (PST)
Received: (nullmailer pid 3111702 invoked by uid 1000);
 Mon, 11 Jan 2021 21:43:30 -0000
Date: Mon, 11 Jan 2021 15:43:30 -0600
From: Rob Herring <robh@kernel.org>
To: Iskren Chernev <iskren.chernev@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple: add samsung,s6e3fa2 panel
Message-ID: <20210111214330.GA3111653@robh.at.kernel.org>
References: <20201230151711.3619846-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230151711.3619846-1-iskren.chernev@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Dec 2020 17:17:10 +0200, Iskren Chernev wrote:
> Add samsung,s6e3fa2 in the allowed simple-panel compat strings.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
