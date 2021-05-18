Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE77387ABF
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65A86E886;
	Tue, 18 May 2021 14:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72446E886
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:10:19 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id m124so7083662pgm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=5PhvFpEj5Jv7/tDgkVZZmBwcTpOnJPEafYIx+5Yo9cI=;
 b=mX6HuOXSfPlMEEadR6ZHmHfxZRAlVGb+niymAS9WNN9C3aHb7qYLgo8M9yTb4Roz/K
 FjNWUrcBBPExTuPA/QkvNh7e2udQUCGvWGPbsfyYVMg5+CEkRD/GC+ukRr6tP8f/nZj/
 4juBngXAOOOOwDN6rf44wgvpEB9k+TqyNBeoF4DpNEnErF2EpW7fVFMSqZaofMBPe8Va
 Wod3U9Tg/8B7IEJmeVsmomvbvMMIZDkf2W8rLsi8lVIYkiSgKfZTWy6N4zpwZeuUzy0V
 eb8winNCYw9cJE6nvq+yYC3mn63TCeEGRZbE22BtlmXNiPQWH58qcsR+eLtyZb2oH5tI
 QpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=5PhvFpEj5Jv7/tDgkVZZmBwcTpOnJPEafYIx+5Yo9cI=;
 b=OM3PxsloKtjOSQtoGhl21sCW/HU+ELM5IPQ6MLRRVY1T7n4PWSx+T7D3M6MKgs9NWH
 4sZ/Ho+jFe+OIomSA2MzcgsTv096AdFpGth/qd/Gr8fHq8daGcaJ1ttnmTqKthYrMdUl
 nh8dtmy4cgDILtiijaTKMh/34vz+h80UMR5DK2JgQqYTNs6C/WTVDl82Ma5FUVPGG4zL
 1nCTs6QXeJItQmKF/nvHPR6QCQQXhf0chhJ4nRpOhrSGNPfkvPRF4EfuuRb6MB7dLtox
 02niE0bQzNgGq4V5v+gWtCgYpdnE6izikaKDIfyvaMm3/lH5L/iN6JFd10xFVeG7tscl
 BHaQ==
X-Gm-Message-State: AOAM530wRp8PRQ+F50CVddPbRsbYurfB34bYmLDthif2nDlYNFmBzhD3
 ZKvEDLWAMV9zfjkfjjQIX7A=
X-Google-Smtp-Source: ABdhPJyVPoDyYqj9WEhMDiY51xY2lTstkQbDILJDhuOl1up3PKlTW2ewSw+s/+94CFv0eEpjlNpZ2w==
X-Received: by 2002:a63:d941:: with SMTP id e1mr5246152pgj.124.1621347019328; 
 Tue, 18 May 2021 07:10:19 -0700 (PDT)
Received: from [192.168.1.7] ([223.177.234.226])
 by smtp.gmail.com with ESMTPSA id r10sm9354552pjm.20.2021.05.18.07.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:10:18 -0700 (PDT)
Message-ID: <0e61f1a6c099a4eea6d51fe31de8c0870a70a70c.camel@gmail.com>
Subject: Re: [PATCH v4 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,  linux-hyperv@vger.kernel.org
Date: Tue, 18 May 2021 07:10:19 -0700
In-Reply-To: <3c7966c8-8985-e5f1-464c-90bc6544dc74@suse.de>
References: <20210517115922.8033-1-drawat.floss@gmail.com>
 <3c7966c8-8985-e5f1-464c-90bc6544dc74@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > +
> > +static struct pci_driver hyperv_pci_driver = {
> > +       .name =         KBUILD_MODNAME,
> > +       .id_table =     hyperv_pci_tbl,
> > +       .probe =        hyperv_pci_probe,
> > +       .remove =       hyperv_pci_remove,
> > +};
> 
> The PCI code doesn't do anything. Do you need this for gen1 to work 
> corretly. If so, there should at least be a short comment. Why don't
> you 
> call hyperv_setup_gen1() in the PCI probe function?
> 
> 

Thank you very much Thomas for the review. Yes, this is needed for gen1
to work. Regarding why hyperv_setup_gen1() is not called from PCI
probe, this is to maintain consistency with hyperv_fb and also
hv_driver probe method is called irrespective of gen1 or gen2. I will
add a comment explaining this.

Deepak

