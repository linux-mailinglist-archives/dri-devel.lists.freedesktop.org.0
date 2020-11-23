Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635E2C1F7D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338D6E22F;
	Tue, 24 Nov 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060276E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 18:02:01 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id h11so6232393qkl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 10:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7+lSYUi+lYvreoUQbQeklZ4cRIMv/oTw7seJhFROrZ8=;
 b=BkTjg7eOzOEGq3pVj6UyISuMoQUhg8+ZOG9QgsbJuwsFycaebbXZuf2rCN5PP26DXc
 OA7g8KmqVRR4PhjlGutP9XIraLdFgBeN0aoWfEAljXN2JwKB3KTemdHEj5Ak96V3glx1
 Od5jJq6tFeSDLRAtXYCaV+dOe2dcqJlIGt+Xs/U7VRTvh3rlam50pfW14c/UJsygTNBt
 eH0r17lmgdxTAG/gAfI0mW4YSW4eHN0/ULr2NF2fkiONvzfz5ueiM/P/Mb6YRupGp/4q
 Wm9pqHt2bVUjbhYZaEv/Lbt+ZmvByolqs+yCIc+iOol8C3P0ilCBIsXWnLgeyJU9i9V7
 X+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7+lSYUi+lYvreoUQbQeklZ4cRIMv/oTw7seJhFROrZ8=;
 b=RgwDZB+B/RYFvztsGeHsJMw9DNU32LM8Aa9UCHlMB9A/MB/OyjSXmaX2v5dn9Ih19J
 OelQGQrHYUREqedemmdKv7cnyCsmnUkBHDINZvABlNS0SMOgWiH4kH3iTq/pY8c4aW3z
 VBiAujU9MHxDWvJobcjAHgciDhQsAmCGDyKfFjrvqFM7IujqW4R9sISaCcg4PEZOG5T9
 hiT3N/V6AcoCwPuDpNJRSq68jlF6DPDjQOhyFIF9yQoYXiTm8oARKp4wm0Q42JdDe57i
 +xbRB1NHd5mb0OeNGLlWEXJaesKwGUxH7k9+HMcMlkvoWFLpGbNWLi40dt89SaNdycRA
 Lkgg==
X-Gm-Message-State: AOAM5319LABwGsVp0Lfnkg28uc/RVwSOizYF2Cx0cY00ZU1h2kk4s444
 pXHkYbL1Eg5YpbBL07TRCYi7uA==
X-Google-Smtp-Source: ABdhPJwFkRrCXup4ypaFSlMFJADjuBv1Ideil3Uminq6+V0Q/qol9nWL7qaeLeNPSR4LzpVE5Yiexg==
X-Received: by 2002:a37:64d4:: with SMTP id y203mr693429qkb.150.1606154520246; 
 Mon, 23 Nov 2020 10:02:00 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id b33sm9695443qta.62.2020.11.23.10.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 10:01:59 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khGA2-00AETC-SE; Mon, 23 Nov 2020 14:01:58 -0400
Date: Mon, 23 Nov 2020 14:01:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core 2/5] mlx5: Support dma-buf based memory region
Message-ID: <20201123180158.GZ244516@ziepe.ca>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-3-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606153984-104583-3-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 09:53:01AM -0800, Jianxin Xiong wrote:

> +struct ibv_mr *mlx5_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
> +				  uint64_t iova, int fd, int acc)
> +{
> +	struct mlx5_mr *mr;
> +	int ret;
> +	enum ibv_access_flags access = (enum ibv_access_flags)acc;

Why?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
