Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2057348254
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 20:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D8D6E1B7;
	Wed, 24 Mar 2021 19:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DC06E1B7;
 Wed, 24 Mar 2021 19:58:58 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id u10so201459ilb.0;
 Wed, 24 Mar 2021 12:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GpCo3IcBQxKypw+sopIjeowZKLjnxLfCAm7E3MjkcwU=;
 b=kLmCPinDNV7ZxsmCvcay0/5Jb2NdL2daNkS2Nl9QYFuEehGfOzpviZWFvPmZx/0rrh
 b7caU/PJ8Jlu640iMlwboMDTO9Uh/dU19MVrANEUJsGjrbaOVLIlexQmufZkEw0hRRxy
 U4rKqO+yAzCY5LYetVLAmapwTG1BnvbAt1NOTDVQt6IXOvnY6siHDhxV5u+b+6pyqNC4
 1fHKJc3ALwg2McxueouyBGfJGgzB8XgdmCGZVDTG7w3er9K+7DvUoMRSYwyfB8St+3ZF
 OtuHFo4FUrjo1QF0nwkKPndR9BRFkfDSCcgo3DP6Me4RomyycoqZYKHs9VHed2pkFLD4
 Hsiw==
X-Gm-Message-State: AOAM531pGK7OWAnUFXz9FTCO+Lip8uNPdUbd1pF5AGtMkvLdjPINS0Ph
 tlKQwC58VITTWYKZO0ZWlg==
X-Google-Smtp-Source: ABdhPJwuHwuYqlKiAKQaCtWWN9OC67sZtR0+TRfT7M4eIvcf2rvt2nbJgLzkTu9Ht9xMFjHaUA0+Rg==
X-Received: by 2002:a05:6e02:15c7:: with SMTP id
 q7mr4089063ilu.228.1616615937819; 
 Wed, 24 Mar 2021 12:58:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 23sm1587941iog.45.2021.03.24.12.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 12:58:57 -0700 (PDT)
Received: (nullmailer pid 3526356 invoked by uid 1000);
 Wed, 24 Mar 2021 19:58:54 -0000
Date: Wed, 24 Mar 2021 13:58:54 -0600
From: Rob Herring <robh@kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] dt-bindings: msm: Couple of spelling fixes
Message-ID: <20210324195854.GA3526276@robh.at.kernel.org>
References: <20210320192553.29922-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210320192553.29922-1-unixbhaskar@gmail.com>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, dt@kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Mar 2021 00:55:53 +0530, Bhaskar Chowdhury wrote:
> 
> s/Subsytem/Subsystem/
> s/contoller/controller/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
