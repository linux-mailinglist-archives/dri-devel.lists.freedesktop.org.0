Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC608251AF6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 16:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8D66E42A;
	Tue, 25 Aug 2020 14:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D006E37F;
 Tue, 25 Aug 2020 14:37:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 2so1797049wrj.10;
 Tue, 25 Aug 2020 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1wejVjdJjFDp//zuNq4iw9VnnSrXMrBCWrU+B996tjg=;
 b=CqhZ6mVu9piKx5tIee8eVB8qt8z0qMqPF1v8MkxUl379kS2e6mFjdaoArhVrA8O2qx
 KqzfrmiQxbJSHSgwI9I0zRQe59A7IJHdIKk5s7hxMTX/BqNCuhZQuCW5K6IoY1Xe69Fw
 FK0nZeMyNIPLgPRxT9QnKpGmTM0MfqUjv5ehPMjD6rwcrKMUDy3n3JfM+freNTnLXLQF
 vAgwYb/j0y9V7ELIaDyhMaDHGwuqb4zmRaTgqyjLf7X5iUzC5OEG5xvdOKXdDmQyd/1X
 5r0BqVfJqdtQwxNTJ8jHjE+V67HK+PqsR5AQB1C+7jF+Jpf7Q6fgRTMUqV0nwUF0zIAG
 zU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1wejVjdJjFDp//zuNq4iw9VnnSrXMrBCWrU+B996tjg=;
 b=KxIpJWfs319An8R7jPkKtgdGQVGnpyE0Sh3P016i++vSuAvQmPAzirupxZsDa4xUx6
 /JqcF5FKwC5tojj9CWCMcVL7S469ptbd/e3CTsh7pLBEYWQUT2D8uHKk+fT+6qnWyH5d
 L9UIyLredRLGDbkgz0B9tSNW38RWkb2uSjlhEAhPRcD1Jyve/JLOjOeH6UXuIXKibBTi
 r4RtnDvYR8sH+nyOsKeVTjQ1K61doEDlPVCIiUvChpWToeiENx49Kkvalflmvd7xZFg9
 K66TcfERHuMlzdT+Zw01pLBktXkbxE1qwhvgp39V4gcaN58XRyW9p+msnPVsg6VmDy3g
 CsVw==
X-Gm-Message-State: AOAM530I8DGfqAEy2zCJx+J6suFlsjobA6DUaeKVBeuOxJ68oUh/HX4K
 822iqphNGqtJcEiSO4nMARW9GDiIp5tZ32iMZj6EjNd/0X2vsLKS
X-Google-Smtp-Source: ABdhPJy3AYFnvsgq2dH5qSiQ9b/trX2St2yH83z9ADAyiui5u4OcDWeupKkNoGSChUu6CIX5AZVQdhj9aD63JrHRbP8=
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr11044637wrn.83.1598366246593; 
 Tue, 25 Aug 2020 07:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200822175254.1105377-1-robdclark@gmail.com>
 <20200825065224.GB30014@infradead.org>
In-Reply-To: <20200825065224.GB30014@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Aug 2020 07:38:13 -0700
Message-ID: <CAF6AEGtK8b9UkbNMJ8VQMv-909fqKk+3LEXsgtuJ_BW0gVK-CA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: drop cache sync hack
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 11:52 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Aug 22, 2020 at 10:52:54AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Now that it isn't causing problems to use dma_map/unmap, we can drop the
> > hack of using dma_sync in certain cases.
>
> Great to see!  What did solve the problems?

should be 0e764a01015dfebff8a8ffd297d74663772e248a ("iommu/arm-smmu:
Allow client devices to select direct mapping")

I still need to confirm whether qcom_iommu needs a similar thing, but
I think it is ok as the iommu phandle link is down one level on the
'mdp' device, rather than attached to the toplevel drm device.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
