Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F912457C77
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 09:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1FD6F540;
	Sat, 20 Nov 2021 08:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221896EAB5;
 Sat, 20 Nov 2021 04:47:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so4137111wmj.5; 
 Fri, 19 Nov 2021 20:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aEc6h6UZDj3RJe5zAVD0JZ752OLm/zol4/Bf6vq8of0=;
 b=RDnKynlfwkmTJH0eofR1L7t8GhtSAnX4QqNY0gIvp39V9CWDDDAzL1b8fpOhSZke1a
 DPpwEZgHi0CdE5tRw87bMGPaE7nOwSWe2WcRF7dUkE5uom6hegVKCMkU6PunhD/9hLlX
 kJrU6djzNdFQPHc+2tjCL7hyP3T6jmG7h7QDH/y+8hJn3VeGhy2WDDD0YSPY5Nb/ddSR
 jHubBt2fzpLEM+EqIMRrtxxB8eD5kUfNgYyUaNXe14DaHenkz6E7e29tYAlaPTDl3rGG
 UtBLea1Agk+svdwrc+7nvBsqVtDVtXRwSWyM7Z/HSswZXkZLvN5rzbbOVPP+QWtWiQxQ
 /tmQ==
X-Gm-Message-State: AOAM531COYNg1DMuYrlPvpkt7g8MV1uK/AHi5LQmscDHOYlr572V+OFc
 IVPD/0Gb8pNe11cie8dEpE0=
X-Google-Smtp-Source: ABdhPJwP2k7ucavsfoGlZJcK5To078c9aGO6heH2BJxEfkGEB243/CpxoDU2gn26fg/Nug2rn0s9+Q==
X-Received: by 2002:a1c:4d0b:: with SMTP id o11mr6635748wmh.68.1637383673623; 
 Fri, 19 Nov 2021 20:47:53 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id l16sm1722475wmq.46.2021.11.19.20.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 20:47:53 -0800 (PST)
Date: Sat, 20 Nov 2021 05:47:50 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH bpf] treewide: add missing includes masked by cgroup ->
 bpf dependency
Message-ID: <YZh99tLi9sekmJ3T@rocinante>
References: <20211120035253.72074-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211120035253.72074-1-kuba@kernel.org>
X-Mailman-Approved-At: Sat, 20 Nov 2021 08:02:14 +0000
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
Cc: songliubraving@fb.com, kafai@fb.com, airlied@linux.ie,
 linux-pci@vger.kernel.org, ast@kernel.org, dri-devel@lists.freedesktop.org,
 andrii@kernel.org, a-govindraju@ti.com, ray.huang@amd.com, sbhatta@marvell.com,
 lorenzo.pieralisi@arm.com, daniel@iogearbox.net,
 krzysztof.kozlowski@canonical.com, john.fastabend@gmail.com,
 geert@linux-m68k.org, matthew.auld@intel.com, yhs@fb.com, sgoutham@marvell.com,
 thomas.hellstrom@linux.intel.com, pawell@cadence.com, tzimmermann@suse.de,
 mani@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, kpsingh@kernel.org, rogerq@kernel.org,
 linux-samsung-soc@vger.kernel.org, rodrigo.vivi@intel.com, bhelgaas@google.com,
 sean@poorly.run, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
 linux-block@vger.kernel.org, sj@kernel.org, lima@lists.freedesktop.org,
 linux-mm@kvack.org, jingoohan1@gmail.com, peter.chen@kernel.org,
 linux-usb@vger.kernel.org, christian.koenig@amd.com, hkelam@marvell.com,
 yuq825@gmail.com, gregkh@linuxfoundation.org, bpf@vger.kernel.org,
 colin.king@intel.com, freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jakub,

[...]
>  drivers/pci/controller/dwc/pci-exynos.c               | 1 +
>  drivers/pci/controller/dwc/pcie-qcom-ep.c             | 1 +

Happy to give 

Acked-by: Krzysztof Wilczyński <kw@linux.com>

for the the PCI drivers.  Thank you!

	Krzysztof
