Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE13DAEE6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 00:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA57F6EE87;
	Thu, 29 Jul 2021 22:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086BF6EE8F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 22:31:59 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id a13so9107724iol.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8xRR7b05CZCC7cFh3+x7THVjJVxqClYmWXBUMBmzhzc=;
 b=NDWKLxP4CQEuT8ethmKSAlaT1/Smm52Mj2R19h0HVh7wLn5003nNZuJHyd6Mh4rAff
 9JHuLDi3gvdtXlPlCTGePbmS3SPZ2h8BD1sL4KTdDh7VlvnpwYCf/79A8sqBjPY8DOax
 MHx0DT0nb/EFnMCUu86A7PVKOFOA615UNqGgYigD2EPNunNBUp9k5qC6YjTdocositN3
 aaORCdrJCclE7x6ocJSfZv1/Ke7aFTMoVPlPSXhq1u4rKwxnyMhX14i6sfTHJ3u87p9e
 cu2GKNJxws/pjeHQ8qaoI6TZ2Aa4gW5tDXmSUN112oBCIgAwUuvSSOxr3y4giF8GIAZ2
 ffbA==
X-Gm-Message-State: AOAM533uANbAxJa5sG1LogdTv0R5arl67GKTzPFz2fLJWILOHmUW3j2C
 m2NQqSMNTAV23O/5KYView==
X-Google-Smtp-Source: ABdhPJz3myyUSpUJ0VTVRdeLG/tG/ZdbT3RE/4rk1olugX7JtG6zT1jFIK54Se6giDwLxuwmQTIE6Q==
X-Received: by 2002:a6b:b795:: with SMTP id h143mr5887746iof.74.1627597918403; 
 Thu, 29 Jul 2021 15:31:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p9sm2554309ilj.65.2021.07.29.15.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 15:31:57 -0700 (PDT)
Received: (nullmailer pid 1022957 invoked by uid 1000);
 Thu, 29 Jul 2021 22:31:55 -0000
Date: Thu, 29 Jul 2021 16:31:55 -0600
From: Rob Herring <robh@kernel.org>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Message-ID: <YQMsW0Z9UhM/PXcW@robh.at.kernel.org>
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725140339.2465677-1-alexeymin@postmarketos.org>
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
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 25 Jul 2021 17:03:37 +0300, Alexey Minnekhanov wrote:
> The Samsung S6E3FA2 AMOLED cmd LCD panel is used on Samsung Galaxy
> S5 (klte) phone.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  .../display/panel/samsung,s6e3fa2.yaml        | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
