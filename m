Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB807EE132
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD00110E5D7;
	Thu, 16 Nov 2023 13:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DF410E5D7;
 Thu, 16 Nov 2023 13:14:02 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6b87c1edfd5so695558b3a.1; 
 Thu, 16 Nov 2023 05:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700140442; x=1700745242; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IijjW5z83l5PX4DSM0mCw5PGI5YXGJ/C+FpbXJjae/o=;
 b=JjZiqc+K2v5jzMRNPwaA105BZ1Aui+4Y3OGizoWb5p/LlMrFFgnq3AZHgftEgxgRwz
 8udlPYaKIq3uygm4rSb39TQxBt5gMOtPL11SinBBQkPoqTflcWIRsAjyVBwbLk/I0H4w
 ppvUv9QUIURv5RusbzPclRG6Fq69b0i4nQJX0wqfabT+88isFs7Z3eI7dIj28zGcxChd
 FGIGSsZNdAxCMCOAMx8SsBwyF7F/LTobOKprTSK2jJTmvjH78YJPX7fWo/XKds4PB3+k
 FLtAvKObPIxDrr3tLvkip5/EA1jqTQcn3FDp6MNxHRyHyPY+NXXlS2rH/PJvQoJFguws
 myVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700140442; x=1700745242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IijjW5z83l5PX4DSM0mCw5PGI5YXGJ/C+FpbXJjae/o=;
 b=CJWWJBIjUh7kcn1i3dmzQtmB1ShDXiHc+xHA2i/h2cz6zSk4/2NBtSqrewQElSKva0
 1gaN1PVbRLAX1BcttOujtZrOQfSh9ApLeo1v8D9k1AveNlLQuKAS+3rkMnlEzmU9Oxwb
 5kMFc7uDg9YAkXMynPxZMyO3+h4Wd0K3ujFVuBhhU4riuqKpAyO0wBovTNeTyo+BdYO0
 jRDtvza4FhsU6e7bURGd9yUCX/b75so5LuzuVAUeIJam7yJb2TNHFDxxAc+cur/Sba+H
 p/w4OYFMxbQgrhfbor5jMooyXlBT82ntVGPoX4tRRRc0zcPyTrDmJ4+1p24gXuv8Y9YV
 8dYQ==
X-Gm-Message-State: AOJu0YwsTnxTnWxXSbHymLkEWNKp9RpYQLgc+VDxRfyd2a4kWgUMEKzL
 Pol4LLTYp9vgb8zfH83WKCU=
X-Google-Smtp-Source: AGHT+IEWSiEcX1lNfco4/eSeRq9smE/cTNyoWk8TVFKE59OwR5CRw3g74Fw1pnSPx3oZda7lCOiJHA==
X-Received: by 2002:a05:6a20:8e1f:b0:187:2c9a:c9ad with SMTP id
 y31-20020a056a208e1f00b001872c9ac9admr7906794pzj.55.1700140441584; 
 Thu, 16 Nov 2023 05:14:01 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 u17-20020a056a00159100b006c4d2479c1asm4458116pfk.219.2023.11.16.05.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:14:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 0D69C10D76D28; Thu, 16 Nov 2023 20:13:55 +0700 (WIB)
Date: Thu, 16 Nov 2023 20:13:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
Message-ID: <ZVYVk8KutkQE0RDU@archie.me>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oak Zeng <oak.zeng@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 01:49:37PM +0100, Thomas Hellström wrote:
> +TODO: Pointer to the gpuvm code implementation if this iteration and

"... implementation of this iteration ..."

> +Using a MMU notifier for device DMA (and other methods) is described in
> +`this document
> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.

You can use internal linking instead:

---- >8 ----
diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
index d3c1f6d8c0e0ec..6b5f7e6e7155fb 100644
--- a/Documentation/core-api/pin_user_pages.rst
+++ b/Documentation/core-api/pin_user_pages.rst
@@ -153,6 +153,8 @@ NOTE: Some pages, such as DAX pages, cannot be pinned with longterm pins. That's
 because DAX pages do not have a separate page cache, and so "pinning" implies
 locking down file system blocks, which is not (yet) supported in that way.
 
+.. _mmu-notifier-registration-case:
+
 CASE 3: MMU notifier registration, with or without page faulting hardware
 -------------------------------------------------------------------------
 Device drivers can pin pages via get_user_pages*(), and register for mmu
diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
index bc701157cb3414..08b6a47a6e592f 100644
--- a/Documentation/gpu/drm-vm-bind-locking.rst
+++ b/Documentation/gpu/drm-vm-bind-locking.rst
@@ -366,8 +366,7 @@ need to care about, but so far it has proven difficult to exclude
 certain notifications.
 
 Using a MMU notifier for device DMA (and other methods) is described in
-`this document
-<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
+:ref:`pin_user_pages() documentation <mmu-notifier-registration-case>`.
 
 Now the method of obtaining struct page references using
 get_user_pages() unfortunately can't be used under a dma_resv lock

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
