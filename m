Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82C176A6D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 03:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FD36E912;
	Tue,  3 Mar 2020 02:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B9C6E044;
 Tue,  3 Mar 2020 02:03:36 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 5so1423813oiy.4;
 Mon, 02 Mar 2020 18:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/UbbCrQ4zJM1G4CgVmEuduvPdDUs8jqlAa46gDYcCCo=;
 b=e1xGp0dhI8PJirQM5Bc+Bx3PlwwSndOICUBhMNvMvfQbew4LTjgyihvgQqAJoKs9FJ
 NffG4GYg09ZqQJoD9tmQpSWyyhDr8rBUpAOiRXG19BskFZcAJ62VTTzODzF2f4zLdQ0m
 Jne/W5vIcqS2vFGDtzLfEAn+1EjdyjZHPL/DgifYRdLeOtaWA5h8ZFK6Ea57ts2EcNwk
 O/QZHA0OQYZTx4t/kIioJUJb5pcZ7FTzsc9Cjh/UmPBEJPBxu3XWC7yktJ6DVLW8C99I
 4MTT9/q2OQ/c2U+BaMsnLUbsziT3IT/LfG8b2a4h1OZOfQxebslJiAWbGcwWSfWFDSsZ
 3t3g==
X-Gm-Message-State: ANhLgQ0QOUCrwkzIcG+F6Er/f5kI7MKxf87zIstXv6J4qKpBsvDXtm1f
 jM55KdTnqlMFQ5smey6rNA==
X-Google-Smtp-Source: ADFU+vsTrN9e4+w5gxNDsk4u2uwXJbz5xUm56Q2btlvLSjXZ4AzZ/N9PS1Koa2Y58E6zkQ/klqwpJg==
X-Received: by 2002:a05:6808:902:: with SMTP id
 w2mr971212oih.170.1583201015568; 
 Mon, 02 Mar 2020 18:03:35 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m2sm7016696oim.13.2020.03.02.18.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 18:03:35 -0800 (PST)
Received: (nullmailer pid 24397 invoked by uid 1000);
 Tue, 03 Mar 2020 02:03:34 -0000
Date: Mon, 2 Mar 2020 20:03:34 -0600
From: Rob Herring <robh@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: Convert GMU bindings
 to YAML
Message-ID: <20200303020334.GA24316@bogus>
References: <1583182067-16530-1-git-send-email-jcrouse@codeaurora.org>
 <1583182067-16530-2-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583182067-16530-2-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  2 Mar 2020 13:47:46 -0700, Jordan Crouse wrote:
> Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
> text bindings.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  .../devicetree/bindings/display/msm/gmu.txt        | 116 -------------------
>  .../devicetree/bindings/display/msm/gmu.yaml       | 123 +++++++++++++++++++++
>  2 files changed, 123 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
