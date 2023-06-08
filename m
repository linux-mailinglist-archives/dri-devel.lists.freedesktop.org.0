Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F2E72877A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 20:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8210E604;
	Thu,  8 Jun 2023 18:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA8210E608
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 18:49:07 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-777b4716673so37468139f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 11:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686250146; x=1688842146;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jIKmCroANEKPOHzkl2knynvAkLLXALNRwLAU/LLLoFY=;
 b=VVCbsF6PpufTwD9oQtOubqIpOMaE8wVNGD/KhOcu69XcYDy9StMIWwp+Ja4kg1HC3m
 0A+RK/lwLxEEu0Qz148ls8atYZxSjfhYdoZnIaGkCuoljWbHZRU86Rc/oFVu1VCUF4Wn
 E+NFOSuu9Nq6CpP4ivf1ThCSwQwh2RYpAylv5WQhu2FdtKhdRXN8SrvfkafpzI1X5HZY
 O6GUHeKwiMf+QPPIFDJwcFwuAx/RaHOC94rNbJkj6ZGJDyLdrMstszZIyP4Yoyzc29jS
 fYOqa00+tXgN9W9ciK3NE4cTUrDR6uwFBNmC68P2Ir/4m1pyEELhoxZeiH57qzFVV5HV
 RwMg==
X-Gm-Message-State: AC+VfDxSYqxDKaHwuK3jZwuJ1y8wUVqteHhdML7O3yrWnGhdGu/runEL
 UcnwPMPruiEPtJx1bOvb9g==
X-Google-Smtp-Source: ACHHUZ40+TuJlTCIi/OKeN/bZ+QJqRylgyQjhG2PfjnerEU6twqk6MXkiUDgygcnfLixbmWfBb9FXQ==
X-Received: by 2002:a5e:8907:0:b0:777:a6a7:e83d with SMTP id
 k7-20020a5e8907000000b00777a6a7e83dmr1785128ioj.4.1686250146061; 
 Thu, 08 Jun 2023 11:49:06 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a6be90d000000b0076c750dc780sm519421iof.29.2023.06.08.11.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:49:05 -0700 (PDT)
Received: (nullmailer pid 3220171 invoked by uid 1000);
 Thu, 08 Jun 2023 18:49:03 -0000
Date: Thu, 8 Jun 2023 12:49:03 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] of: More 'device' vs. 'module' cleanups
Message-ID: <20230608184903.GA3200973-robh@kernel.org>
References: <20230510154803.189096-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230510154803.189096-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 05:47:58PM +0200, Miquel Raynal wrote:
> Hello,
> 
> As part of a previous series, Rob suggested that keeping too much logic
> in of/device.c was backward and would benefit from a gradual cleanup
> with the hope some day to move the remaining helpers into inline
> functions wrapping the proper of_*() methods.

Where I'm at on device.c is it should be functions that bus 
implementations need. I have a ton of tree wide changes to disentangle 
of_device.h and of_platform.h. Some of that landed in 6.4.

uevents are pretty much tied to struct device and the bus, so I don't 
think moving these parts to module.c makes sense unless there is a need 
for the functionality without a struct device. 

Also, perhaps we want to make module.c configurable?:

obj-$(CONFIG_MODULE) += module.o

The uevent stuff is certainly independent of module support.

> Link: https://lore.kernel.org/lkml/CAL_JsqJE43qfYzHUuCJsbaPPBTbYX05Q7FFmPTjPFZ3Dmz_mXg@mail.gmail.com/
> 
> A few of these "conversions" happened in the series I was originally
> working on. At this time I actually wrote a few other changes,
> completely unrelated to my original series, but still following Rob's
> cleanup idea: here they are.
> 
> Link: https://lore.kernel.org/lkml/20230307165359.225361-1-miquel.raynal@bootlin.com/
> 
> The last step of this series is to actually remove a copy of one of
> these helpers which I think is not needed. This drivers/gpu/ patch
> depends on the previous changes.
> 
> Thanks, Miquèl
> 
> Miquel Raynal (5):
>   of: module: Mutate of_device_modalias() into two helpers
>   of: module: Mutate of_device_uevent() into two helpers
>   of: module: Mutate of_device_uevent_modalias() into two helpers
>   of: module: Export of_uevent()
>   gpu: host1x: Stop open-coding of_device_uevent()

This last patch is certainly worthwhile doing.

Rob
