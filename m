Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE0234CB6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 23:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04126E055;
	Fri, 31 Jul 2020 21:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43386E055
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 21:12:42 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q75so24854651iod.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 14:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pQcDCvIyTL85E1igV+Ze6j95UbBO0x3+Ju2NfYedtmY=;
 b=gMhrppLSYFZVelZUNcdSuJj6d3vLv1easWqZWx9VzydXa+cMd4uvRTo7ewvXFgD9vR
 z8TMgfZrHSK3k5gMmR9Kp96O+5JJP23NpxKUwC0Es5+q8XuRH5ba2D8DJ1sI5Qw77g14
 UlslM/kNE4w5dmE+Gh26mYXm2penapnOs2zeXH5c1C/KxzvH3IzYivS/8aLfHCgcQLIs
 Lq4LfUoeCkrYJTrfVswd+t56EOjCAm0ssNNRdwZ3/dfLBEbhxVFE0RQiQJqCBDl9kRKs
 8yxrUGSwgy7tUgwakPmQZXS+V/F/+VasDFhvm0BpBSHgkwq0bCihLByAJCVj3vtikCF8
 Zxmw==
X-Gm-Message-State: AOAM532Uujg4w268GAz1CC4mVhhgCQF64l+HxjBjdzJCRN/LXZvIRe0C
 OiFD+TyYRLlXDaJcuzz8Wg==
X-Google-Smtp-Source: ABdhPJys85Ij0b9vTldeq5s1VeJLpEY1fhMNq9zPKVcCpELIAayLKalQlNqnOxF5N162R6Hk9odE9g==
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr5493961ioh.173.1596229962114; 
 Fri, 31 Jul 2020 14:12:42 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id o17sm5397271ila.35.2020.07.31.14.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:12:40 -0700 (PDT)
Received: (nullmailer pid 798687 invoked by uid 1000);
 Fri, 31 Jul 2020 21:12:39 -0000
Date: Fri, 31 Jul 2020 15:12:39 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: Add vendor prefix for Chefree
Message-ID: <20200731211239.GA798580@bogus>
References: <20200728201242.4336-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728201242.4336-1-marex@denx.de>
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

On Tue, 28 Jul 2020 22:12:40 +0200, Marek Vasut wrote:
> The Chefree Technology Corp. is an LCD panel manufacturer.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
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
