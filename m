Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C41A8A68
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 21:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3371E89263;
	Tue, 14 Apr 2020 19:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9A589263
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:01:43 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id t199so7999247oif.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nqVv+ORxaWxg2NdPce1X/0L1DRMcHdT+zeS1PlpMDpw=;
 b=UaDxd6HRwlYiQqhZ0HA7ixu4uImx3VWUzEtK7gngLzOYZtsvvKHMou59LQ1N1sZaKG
 0eKYMgVg7YtEHj3W69pReFLNji8pgDAfObqJVUugLGiaK/qFt0+dbHAbrYyhhE/GUVVu
 EQPy4uqRPCQ6EOi/0DbNZMgaRhdlB0fPwRhmjejFUea3f0Rz/yXvTh84Tmb/SaXj6kSU
 ng1gOqzFnkKVf/Qskbt9ikwJJhQHx2L11f0ziozzBo2kCNdcQTDYeLCdYfAcVBtMmfn4
 94G/eBXgtkdLfUL2/sk2nsPrjYNv/QhNabrYYEsj542vmJx0f8auJKj63N4RLYQyN4XA
 cGOQ==
X-Gm-Message-State: AGi0PuaipjYHLenVMWtq/LkqRhzKVqJEkyhssgywVay995fgkMyr+Z3t
 BDuT1piE9FyWlolvMKwXiw==
X-Google-Smtp-Source: APiQypLrFqniMD1Dn3d9gmjF72MsX++LcJM2BM+neB+4j0XMv9ZzWmLZuNaGysAHg/DplIXj3arcxg==
X-Received: by 2002:aca:eb4e:: with SMTP id j75mr16790839oih.18.1586890902457; 
 Tue, 14 Apr 2020 12:01:42 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i21sm3913255ooe.26.2020.04.14.12.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 12:01:41 -0700 (PDT)
Received: (nullmailer pid 20276 invoked by uid 1000);
 Tue, 14 Apr 2020 19:01:41 -0000
Date: Tue, 14 Apr 2020 14:01:41 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 35/36] dt-bindings: display: convert
 olimex,lcd-olinuxino to DT Schema
Message-ID: <20200414190141.GA20217@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-36-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-36-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Stefan Mavrodiev <stefan@olimex.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:51:08 +0200, Sam Ravnborg wrote:
> v2:
>   - use "ic2" node name in example (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stefan Mavrodiev <stefan@olimex.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/olimex,lcd-olinuxino.txt    | 42 -----------
>  .../display/panel/olimex,lcd-olinuxino.yaml   | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 71 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
