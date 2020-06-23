Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE118204A2D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343B96E944;
	Tue, 23 Jun 2020 06:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C16C6E081
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 06:48:51 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id k1so8712865pls.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 23:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=oZZGNxksi984IFrtL4/ab5B2BOXyhHS93zVMSSqHlk8=;
 b=ns9BOijgSYyBCbz7Onv9gy3FniAP6VypfwVkCNaxItLmoPHFknqvdX4uXPkbA5NALN
 tY8IVENeq4JWwf2shAkWfwxRRIuKEaoMY1A/XUAD7VFdbC5GRito5rR/6F985UK7QR5F
 qvSRCnKJdH60UqagJd6YEEbjo6VmM/0pCQwH7K6uwAcr08tyhomVzHtOUtblW4zDf4KL
 xBb8NyW2FDdF9QWkGlxiWuM1Uqkz8DPRZ8bN5X5QcKu3VztQBz4LWrJswneuTETHUBvB
 fOoWcJuMupo46nA4F4bflMpGLcgYwQcw9Fv0y093cTauE742GG5VbJVwqLwEY07dwevz
 aDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=oZZGNxksi984IFrtL4/ab5B2BOXyhHS93zVMSSqHlk8=;
 b=XGCVCRV+JctlngJ5GjNEhfXfg19A2NyCMYKsewga4ant3shu8cNa0tfKr1ja/LBGuy
 LqVf3/crlxU1HFOmoGq8wjDbSWyctSVHb8nug40uFKgoTxh8Wi+79J0hlQLLcFPOOG2Y
 9SQTlXL96cUkYnxdTPxjVKnN9TzccWCx8isW1Xup0NK9uu+NoCi+2G/OGDi8qzz+NO6E
 BbC36iyjZe7RZ4Litmqit1jeh1R115wb2V0/9tPL2COjaX0u+jQxsBSI9MhVJvteeBmj
 bERY0paT3M9Gn4otr7MScoJZnkVize+iPp1y3BqRINWvSKkIAfdR59gmmAVa518Bswwm
 vHQA==
X-Gm-Message-State: AOAM532BQiTqIa9L4HXuspjdrJwfxZDaqcIQWzuMpTWalzvkxoWGfSIP
 q5igzUsb+g707RqSmitmg7k=
X-Google-Smtp-Source: ABdhPJyZtjnEOos/txCUFSLJJLxQYV1cCj3AAkfsfi1hhx+Pi4FZ0B3ahhWOCBDI9Wali2SKaH/rkQ==
X-Received: by 2002:a17:90b:ece:: with SMTP id
 gz14mr6809570pjb.93.1592894930961; 
 Mon, 22 Jun 2020 23:48:50 -0700 (PDT)
Received: from arch ([2601:600:9500:4390::d3ee])
 by smtp.gmail.com with ESMTPSA id q65sm16048866pfc.155.2020.06.22.23.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 23:48:50 -0700 (PDT)
Message-ID: <aa7ab349ff502390edea4fd5721dbd64a0997216.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Dexuan Cui <decui@microsoft.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Mon, 22 Jun 2020 23:48:49 -0700
In-Reply-To: <HK0P153MB03224C17D736FF164209F6DABF940@HK0P153MB0322.APCP153.PROD.OUTLOOK.COM>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <HK0P153MB03224C17D736FF164209F6DABF940@HK0P153MB0322.APCP153.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Jork Loeser <Jork.Loeser@microsoft.com>, Wei Hu <weh@microsoft.com>,
 KY Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-06-23 at 02:31 +0000, Dexuan Cui wrote:
> > From: linux-hyperv-owner@vger.kernel.org
> > <linux-hyperv-owner@vger.kernel.org> On Behalf Of Deepak Rawat
> > Sent: Monday, June 22, 2020 4:06 AM
> > 
> > DRM driver for hyperv synthetic video device, based on hyperv_fb
> > framebuffer driver. Also added config option "DRM_HYPERV" to
> > enabled
> > this driver.
> 
> Hi Deepak,
> I had a quick look and overall the patch as v1 looks good to me. 

Thanks Dexuan for the review.

> 
> Some quick comments:
> 1. hyperv_vmbus_probe() assumes the existence of the PCI device,
> which
> is not true in a Hyper-V Generation-2 VM.

I guess that mean for Gen-2 VM need to rely on vmbus_allocate_mmio to
get the VRAM memory? From what I understand the pci interface anyway
maps to vmbus.

> 
> 2. It looks some other functionality in the hyperv_fb driver has not
> been
> implemented in this new driver either, e.g. the handling of the
> SYNTHVID_FEATURE_CHANGE msg.

I deliberately left this and things seems to work without this, maybe I
need to do more testing. I don't really understand the use-case
of SYNTHVID_FEATURE_CHANGE. I observed this message was received just
after vmbus connect and DRM is not yet initialized so no point updating
the situation. Even otherwise situation (mode, damage, etc.) is
triggered from user-space, not sure what to update. But will definitely
clarify on this.

> 
> Thanks,
> -- Dexuan

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
