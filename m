Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17C3157BE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 21:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A4E6E054;
	Tue,  9 Feb 2021 20:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564B56E054
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 20:36:09 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id d7so16468730otq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 12:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1aYpcD4VuQOpMJvgjUFMkW5FGvnbf7RZiRf2rUksBW4=;
 b=rICisSFgwz5Dyj2hhhHNBt4ewytD+6GGpjv0BkRAG3hW5hCPycpN7ZnADQlu1wUUX/
 +r0MzOzP8u+ozewarXOObJ5JNygdweIPk9MxOdB+qFQ8ZUhAt1B6kZYfjlHL2F8+Umna
 DXcUBh6zIuG88k+/G2s9iZnb9/yt0LCwbtdAN1wnkRirQjGXO73I1PEYNBT4a9d3if73
 KUqjmI2rpHBIiBfw5DHsYsIrcRC+9jxr4z2CGzghFuQs+efpT4pslSthYlVmBEFvdysi
 j3io4wYd9OCCrXthLkINTQvoW1VqkH9gDcTPBSYXaKy1bMTY/2KXxOb0ZhotghY+LwW1
 7jFA==
X-Gm-Message-State: AOAM533S/Eu18h/nKhcXefD9oApUvFP6OXlZyXPH2QGu1w8OtgboeRP+
 yZxR2wGjoUsmahrZNAQtiw==
X-Google-Smtp-Source: ABdhPJyMm6ERS7/qP0ACvjy5OvEsswCVQRdpGuPiyWbQfdh9lOHx0FtLFl0NCwx4m6P+uCRBvmCsnw==
X-Received: by 2002:a05:6830:1c7b:: with SMTP id
 s27mr7700324otg.144.1612902968653; 
 Tue, 09 Feb 2021 12:36:08 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j8sm4398879oie.47.2021.02.09.12.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:36:07 -0800 (PST)
Received: (nullmailer pid 128212 invoked by uid 1000);
 Tue, 09 Feb 2021 20:36:06 -0000
Date: Tue, 9 Feb 2021 14:36:06 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: Add vendor prefix for Displaytech
Message-ID: <20210209203606.GA128153@robh.at.kernel.org>
References: <20210130181114.161515-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210130181114.161515-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Jan 2021 19:11:12 +0100, Marek Vasut wrote:
> The Displaytech Ltd. is an LCD panel manufacturer.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
