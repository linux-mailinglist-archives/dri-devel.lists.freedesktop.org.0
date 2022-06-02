Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490C53BB2E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 16:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E747C10EB32;
	Thu,  2 Jun 2022 14:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DF910EB32
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 14:49:48 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-f2cbceefb8so6984966fac.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 07:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Y8r93k8L3/uY9c/fAZTXjwzkJHBhkSmh0WbbdSy7HE=;
 b=A33cUR9N57hRK5A+A1wTR4BG42kRWpw8tm2yD6/KzjXwpFL8I4MLWdTJI1cbfpbzMb
 se+dM6sPxPHaM9DGJGJlUolxdkJov3j0DBhaFZoOP/ajP+dOEucPng1VXvTpY0NmXKdX
 T+wLN6gupG/9hk7xUFZuoDvhYvfP91h4InPWOjeHUM6muuAf1UAYCeKzr0bZKx4EjH3T
 h5JNysI0M8FrLRB0FJ//qYrlmcuHw0HkgrUDg4k70709lkMpiJEQOa7RBsUv8U2+cuxF
 807nW/0pcAjz9qqKa5l5kwPqgSPN3lGRAybfSGoSN2koc2QKW73vkAC/wZIwcaIOa40K
 3Tww==
X-Gm-Message-State: AOAM533FN2HGuX3o2U9K9zK5jSQZQFCQPb7uJBc8lKbZzGQJzUqmLrgZ
 vBPIexldP17F8eMHiMUOLA==
X-Google-Smtp-Source: ABdhPJwAk1Ot3hZsXRUg3N5muY4Oa+Q/FYuCITtB9Vhdx0Uw8AdKNGFHqxBIC+sOqyZFiKi4tiTcxg==
X-Received: by 2002:a05:6870:828c:b0:f5:f122:f440 with SMTP id
 q12-20020a056870828c00b000f5f122f440mr3866955oae.168.1654181387324; 
 Thu, 02 Jun 2022 07:49:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s42-20020a05683043aa00b0060613c844adsm2208463otv.10.2022.06.02.07.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 07:49:47 -0700 (PDT)
Received: (nullmailer pid 2296853 invoked by uid 1000);
 Thu, 02 Jun 2022 14:49:46 -0000
Date: Thu, 2 Jun 2022 09:49:46 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: gpu: v3d: Add BCM2711's compatible
Message-ID: <20220602144946.GA2296795-robh@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-2-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601110249.569540-2-pbrobinson@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Jun 2022 12:02:44 +0100, Peter Robinson wrote:
> BCM2711, Raspberry Pi 4's SoC, contains a V3D core. So add its specific
> compatible to the bindings.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
> Changes since v5:
> - Change compatible to align downstream and othee HW, reorder to suit
> 
>  Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
