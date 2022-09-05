Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F105E5AD803
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 19:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621F510E450;
	Mon,  5 Sep 2022 17:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92F10E450
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 17:03:09 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k9so12159468wri.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 10:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=PhLq7Jg7THme51MufQlUAx9Xm5cp54HX1BkW+U1Xyec=;
 b=E6hgoO2IGDUP+Sfj+zTFvXcaFlXYVtqDxa9/UI1xhE73R5jttJqY5KT5uyUPAsxRml
 j9hUFP1IojuhpUf8yjP8eodVlV7aAKyCTxr08MS5lq0RTHyV8f4zJdx9EH2Iq7eaGRCQ
 V6t9uCK8V1bHbWwI6XfPJXLdV5mxR3fzWDcnYQj4WQxsoS6KZnFvQxZbZ0grFMfRSrLi
 Bl81BKj3MBYeFekKDGW+BjcoQqX/NDoGuxuMJh3hUqu3fwXlyh+5wAO21n/UlZUT2EiO
 2uVaz0R2IfQIWOZ6Ncc0od4+o3OYbMqugf+VG2GxPn1TQpPD8s47Z+XhRNGPkjONKd+O
 cuMA==
X-Gm-Message-State: ACgBeo3ENIV6+/F7N+Z0Y3m4VnBOZrkMP5g8YG+xNQKHQM/DWRSjGa6H
 khX/PRqx75QlWjYWp6Nsy5g=
X-Google-Smtp-Source: AA6agR5S0iuyaUjAWm0IOMULo3XnS5JeNxiF0q+loQpjcjwG2/ubYIc61Vw83rxLgBzCv00NLItm/A==
X-Received: by 2002:a5d:424a:0:b0:228:811f:c1a2 with SMTP id
 s10-20020a5d424a000000b00228811fc1a2mr3526709wrr.262.1662397387859; 
 Mon, 05 Sep 2022 10:03:07 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 p28-20020a05600c1d9c00b003a5b788993csm11733635wms.42.2022.09.05.10.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 10:03:07 -0700 (PDT)
Date: Mon, 5 Sep 2022 17:03:03 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v3 0/3] Drivers: hv: Avoid allocating MMIO from
 framebuffer region for other passed through PCI devices
Message-ID: <20220905170303.bzjcovvcdg7ou3k4@liuwe-devbox-debian-v2>
References: <20220827130345.1320254-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827130345.1320254-1-vkuznets@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-pci@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 03:03:42PM +0200, Vitaly Kuznetsov wrote:
[...]
> Changes since v2re (PATCH3).
> 
> Vitaly Kuznetsov (3):
>   PCI: Move PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO
>     definitions to pci_ids.h
>   Drivers: hv: Always reserve framebuffer region for Gen1 VMs
>   Drivers: hv: Never allocate anything besides framebuffer from
>     framebuffer memory region

Series applied to hyperv-fixes. Thanks.
> 
