Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE130D0E6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 02:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C5F6E245;
	Wed,  3 Feb 2021 01:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0976E23F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 01:39:25 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id cl8so2156416pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 17:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XIYaotR9cVz0dZkIxPzlPF8z5N/cDZctzyKFUN0dyY0=;
 b=cXvYlwrI6hfAyLYI+VmHQVQQhLu2PXgyoCiLpjHxw4UxkHfexWxOgUdgUW1MnTD2H/
 ntSjl0I5N9XmHiEfPfzHzGi+CTkSytba/uqkzTrUbc7UMxjn3pAvr+yrGkXTI44sUI0X
 9JzN8XpI1Gy5EamBEPB7N2MCyMl2yR+5l0IENR5kl8l4FoUnOFNf1k2RnDJvm7irT+QB
 dSKydTAjlcwL3ukWk/UgaC/dOmNnxuyXkbnEfwnV1bTNzh3BMI73eO3ipiQr23jBYCzC
 2vK1mxCvX2O77vR3QD9SE4/tDIbWSSBVcUbUiK6NHAMJn/2hjlQlID/4oN9t7PbsKSe6
 EwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=XIYaotR9cVz0dZkIxPzlPF8z5N/cDZctzyKFUN0dyY0=;
 b=Qsy19qHs/tcOhE/pHPiJh4+6DfJLX5YzfXXvy37NW2CU3JnDgBlbtTIkT9LS3GoDAB
 TBc42+WgzFBQ6b8pR5PULUp4P8fHleMocbE27m8RW2PyoT0+q95Tgw6q6aTvh8+W1pU0
 1HrhZFvwQVfEioIyksAOWEc/ja3+JQ8d08Kt+6/G+G4Nv8/OGvnPulPYXcKOWZZ0mQrj
 ZkCfgAuymjq4DkZvAJ7aQKw5OYNqRKKWkpS33hV/VVtrfQR/oZYRsQ1NMuNyxTAAoemb
 4tAorPl1SB8cZqFCoOfGziFK2H3rtI8J6NIEoOZoORcHtPI5bOZvSuut45ehg/3ncZq1
 cR9w==
X-Gm-Message-State: AOAM532dEO1QUFCoWswUs0hit0yj2XE10RBWwQQ7Km/RZzxZILE9w54k
 zB+PN6ukmc+zhn7pWi6fMYw=
X-Google-Smtp-Source: ABdhPJw4+TJeBM73IhpaxHBiQrVir31ns6RnIpgpHmpCk5j9tXDdCMTWEfxafjtp+R5KhfwTy9JIuQ==
X-Received: by 2002:a17:90a:8906:: with SMTP id
 u6mr664117pjn.223.1612316365454; 
 Tue, 02 Feb 2021 17:39:25 -0800 (PST)
Received: from google.com ([2620:15c:211:201:1502:84f8:ffc3:45b])
 by smtp.gmail.com with ESMTPSA id m10sm217140pjs.25.2021.02.02.17.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 17:39:24 -0800 (PST)
Date: Tue, 2 Feb 2021 17:39:21 -0800
From: Minchan Kim <minchan@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
Message-ID: <YBn+yWIE9eXbgQ2K@google.com>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203003134.2422308-2-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203003134.2422308-2-surenb@google.com>
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
Cc: linaro-mm-sig@lists.linaro.org, orjan.eide@arm.com, sspatil@google.com,
 christian.koenig@amd.com, kernel-team@android.com, jajones@nvidia.com,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, hch@infradead.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, cgoldswo@codeaurora.org,
 hridya@google.com, akpm@linux-foundation.org, labbott@redhat.com,
 robin.murphy@arm.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 04:31:34PM -0800, Suren Baghdasaryan wrote:
> Currently system heap maps its buffers with VM_PFNMAP flag using
> remap_pfn_range. This results in such buffers not being accounted
> for in PSS calculations because vm treats this memory as having no
> page structs. Without page structs there are no counters representing
> how many processes are mapping a page and therefore PSS calculation
> is impossible.
> Historically, ION driver used to map its buffers as VM_PFNMAP areas
> due to memory carveouts that did not have page structs [1]. That
> is not the case anymore and it seems there was desire to move away
> from remap_pfn_range [2].
> Dmabuf system heap design inherits this ION behavior and maps its
> pages using remap_pfn_range even though allocated pages are backed
> by page structs.
> Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
> in [1]. This would allow correct PSS calculation for dmabufs.
> 
> [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> (sorry, could not find lore links for these discussions)
> 
> Suggested-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Minchan Kim <minchan@kernel.org>

A note: This patch makes dmabuf system heap accounted as PSS so
if someone has relies on the size, they will see the bloat.
IIRC, there was some debate whether PSS accounting for their
buffer is correct or not. If it'd be a problem, we need to
discuss how to solve it(maybe, vma->vm_flags and reintroduce
remap_pfn_range for them to be respected).

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
