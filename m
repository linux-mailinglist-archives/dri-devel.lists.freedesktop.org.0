Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A693CAE4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 00:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A271210E346;
	Thu, 25 Jul 2024 22:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hl9spIrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCBC10E346
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 22:33:15 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-708bf659898so230998a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721946795; x=1722551595; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WXRhM7vDpKgVAUvFwlLby6Ne8OfPDiuk2A603GkEuQE=;
 b=Hl9spIrYQIoC7Ymk/5pMDU2MRIQs31F567cFpzbzSycApCWjhf0xObjVHgU5qxBWKh
 4M3BdNpURtP35kYYO0Rqb0t9OoXXTPRwqaSRR/WnEb1rN4q7CYimL8sHE2+D1XCfQdul
 0Z74dEK62q8rlq7X0Nx55iS23syT8f3dYwRv2s/SMrQ3wToPh/GOuECI2egKdiHPsH1r
 RKj6YytAbumBREludagcD3+AEnr5S4g7657UJW8u9THMpyapgbX408fbxAGrktavl1Mr
 Y4Jquwh4eNjXoqkdvGeB4XYiTGxnklBr4P5oi5SVWuSJBVmHG/LBJnA43+fK8hBzI4gr
 Pd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721946795; x=1722551595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXRhM7vDpKgVAUvFwlLby6Ne8OfPDiuk2A603GkEuQE=;
 b=ffYiY6eX3Z3ULhOrMoZcRqjKgo1q3H32Af8W4hMcExKppAcD95F8Ib7NtC9awEplMz
 RZ8G7ED9G/lACoGVI0VSZeOgqdpq62SkHrFBmG9+ye+QLrcqya9u2ncVAjUaA9psW35p
 0g17vcAXy7Ed+rgRRkzo9XZT3CjA38TfoEx5sGIbX68p2E3LzZF2urPH7BqRsYgG/0Xw
 GItO70W5YAhWcsFSIE1TIPaKMpE3yVbAL0Vk3Xei6Vu+dsWbvbUGvdkRnUwWSprAO6JF
 aGgtVXAmLj2cxNRQhQhjr36vnaFsRz1Bv6duvq5ys1UY/8c3kdgKF/YjJZrSAmWCm+z1
 Bkzw==
X-Gm-Message-State: AOJu0Yy95S8gW7yE0AOqJnX+VT8vuNro8IJovPKxv3r1e57hn3IM0Nwd
 hlj2fBI9QEtiBwK/W3yNc/0rraXadSTqb8tuUPVL8+Qso685xXPygS11FK5aC80=
X-Google-Smtp-Source: AGHT+IEoaG8W49/RqA0bGCYQ0nrXGSfiv2s/Op+ULBrRNzaBTKJBkNyC+boQkKu7DApkVEwlXWx4BQ==
X-Received: by 2002:a05:6830:dc4:b0:709:3772:8c31 with SMTP id
 46e09a7af769-70937728ff3mr2074908a34.31.1721946795132; 
 Thu, 25 Jul 2024 15:33:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:928f:fdbe:c604:7b3f])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7093071d443sm493130a34.32.2024.07.25.15.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 15:33:14 -0700 (PDT)
Date: Thu, 25 Jul 2024 17:33:12 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomer Tayar <ttayar@habana.ai>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [bug report] accel/habanalabs: enforce release order of compute
 device and dma-buf
Message-ID: <d70342ef-2b52-4f26-953f-8c924c20b1cd@suswa.mountain>
References: <71169637-1e35-48d5-ba04-161d30073495@stanley.mountain>
 <cc6716f4-10e0-4f64-b64c-a3e41e1f7113@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc6716f4-10e0-4f64-b64c-a3e41e1f7113@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 25, 2024 at 08:21:51AM +0000, Tomer Tayar wrote:
> On 24/07/2024 19:08, Dan Carpenter wrote:
> > Hello Tomer Tayar,
> >
> > Commit 09524eb8824e ("accel/habanalabs: enforce release order of
> > compute device and dma-buf") from Jan 22, 2023 (linux-next), leads to
> > the following Smatch static checker warning:
> >
> > 	drivers/accel/habanalabs/common/memory.c:1844 hl_release_dmabuf()
> > 	error: dereferencing freed memory 'ctx' (line 1841)
> >
> > drivers/accel/habanalabs/common/memory.c
> >      1827 static void hl_release_dmabuf(struct dma_buf *dmabuf)
> >      1828 {
> >      1829         struct hl_dmabuf_priv *hl_dmabuf = dmabuf->priv;
> >      1830         struct hl_ctx *ctx;
> >      1831
> >      1832         if (!hl_dmabuf)
> >      1833                 return;
> >      1834
> >      1835         ctx = hl_dmabuf->ctx;
> >      1836
> >      1837         if (hl_dmabuf->memhash_hnode)
> >      1838                 memhash_node_export_put(ctx, hl_dmabuf->memhash_hnode);
> >      1839
> >      1840         atomic_dec(&ctx->hdev->dmabuf_export_cnt);
> >      1841         hl_ctx_put(ctx);
> >                              ^^^
> > This will free ctx on the last reference
> >
> >      1842
> >      1843         /* Paired with get_file() in export_dmabuf() */
> > --> 1844         fput(ctx->hpriv->file_priv->filp);
> >                        ^^^
> > Potential use after free
> 
> Thanks for notifying us about this warning.
> 
> Actually, because of this commit, the call to hl_ctx_put() here cannot 
> be last.
> The release of the device file has another reference decrement [ 
> hl_device_release() -> hl_ctx_mgr_fini() ], and this change prevents 
> that release as long as a dma-buf object is alive.

Thanks for looking at this.  To be honest, I'm just going to take this
on trust.  ;)  I looked at the code but refcounting is always a bit
tricky.

> 
> However, I will revise the function to get a pointer to 
> 'ctx->hpriv->file_priv->filp' before calling hl_ctx_put(), so we won't 
> have the warning.

Please, don't do things just to make the static checker happy.  These
refcounted use after free warnings are prone to false positives.  I try
to do some sanity checking but I'm not a domain expert in this subsystem.
So, you know, just look at the warning and ignore it if it's wrong.

These warnings are a one time email.  Everyone who works on the kernel
is really good about fixing bugs so we assume all old warnings are false
positives.  Plus if they have questions they can search lore for this
email thread.

regards,
dan carpenter


