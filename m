Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594502A708A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 23:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73846E064;
	Wed,  4 Nov 2020 22:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5585E6E064
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 22:32:32 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 79so278496otc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 14:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/+xov9qNrCa5kR+k+88TJtmG8DM6VvKyohLxdnZITB8=;
 b=n2AZs8qnaL1D0pgV6J1TmL6Jn1P1J8/XcaGZvII0M+Y6iCURbtpteRUp+WD9gAg8+H
 KaqSox6f9wk3G3TzDK8/5coiMi+Czl6YjpWhNWyUY0yrBw+V3tEXbG3UxgUc8GAk0hXQ
 XLS2lluFNVBNnveRCz/5OxcCUyJVi/0JPjCO4zcC7Kpi8QLFt6fj3+kLB5KzR0ENY8Tj
 5PP9D8Ro/ml/gthwB5UrZwag+tktz5o6l3Oeqybgrl8d+wSvtJOiag1PYInE1VRiI1TF
 vQh2XXqM7+d/SkiuQCbcMmBLQNY/lpoX0UP1aBtXnjxe6arFp/R2dsElTXsb73PiHmjp
 3xTQ==
X-Gm-Message-State: AOAM5303aH9nZeSP6/PyLikuaHxPCbL2TOB2UgKwthsbpz9fBAvvlmGd
 IlTDNLrvLy5kffETNNGE5rwHyCxTjQ==
X-Google-Smtp-Source: ABdhPJzT3+IkXidl8JPgKMkkFdkJi9iO4FXdvOhbw7kKGwODl+3fCylb57kXfLctK5HLo2xPcY+e+w==
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr20262297otq.208.1604529151638; 
 Wed, 04 Nov 2020 14:32:31 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l89sm744690otc.6.2020.11.04.14.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:32:31 -0800 (PST)
Received: (nullmailer pid 45723 invoked by uid 1000);
 Wed, 04 Nov 2020 22:32:30 -0000
Date: Wed, 4 Nov 2020 16:32:30 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add abt vendor prefix
Message-ID: <20201104223230.GA45670@bogus>
References: <20201101093150.8071-1-paul@crapouillou.net>
 <20201101093150.8071-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101093150.8071-2-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Christophe Branchereau <cbranchereau@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 01 Nov 2020 09:31:47 +0000, Paul Cercueil wrote:
> Add prefix for ShenZhen Asia Better Technology Ltd.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
