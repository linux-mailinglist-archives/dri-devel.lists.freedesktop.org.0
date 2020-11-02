Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5262A3636
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 22:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE8F6E40A;
	Mon,  2 Nov 2020 21:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AF16E40A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 21:59:41 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id d9so10276328oib.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 13:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2tlgrX0K0Vy+ZK2RU6+dKp7rmFUpdiDwSkOCxazfILQ=;
 b=jvrsBUUhWjBYBRf9PTnSvHChgVloQZYlmSHPohx0dHd73t+BYrbLx2GMjmAs2bDw8T
 iRK+1faLaOQSerM1FCjUWL3SV++PT/zgrGCvNK1ZtLWOKzBgbfXV47b3rGLi+ADPrlcI
 ItnOTwNOODhKPnaEFtUUq1hrci08QDkPf4Mv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tlgrX0K0Vy+ZK2RU6+dKp7rmFUpdiDwSkOCxazfILQ=;
 b=ZU4bz6Pk3s3etc8IZ84mJZ3C2VQk0+yPg7obk44RPEqDgNKw9Z4NSMhmll7zJzSJDT
 nKWw/EqJuWK+U2ga0/g28E2wcZb6PfFGFfFKQQpRL8Ey+LfZFto1HrByKQ8W+0bBMdHo
 xyBqAtBgiEgtPdTKC7WHO5LtQ8Y7/Ec3Z1HQNJX/S7wToF8VqTRA21vPoIKCsC7nyb6g
 WvnSQAkCu13K/maI2C6WNDATbvdVc6APKZa6f/XeW9PhZa8yjGjABRY2cQoinHKLyCsF
 Q6Hoivz2K+Vnt/i2gl1bmWSTbBOlbf7kHpOMinzxy4ajWSZjbLcoHPZy+0ldUqUZ8VpE
 PD7g==
X-Gm-Message-State: AOAM530uN4RQPtn89p62UKo+g/ky4gfoPn2VmcPu2FGrXJD5blUGPvKC
 EoYCs0IyaycrgCTwIQ8QyirB7+0qsOXL3ngaQv6KRA==
X-Google-Smtp-Source: ABdhPJyaU//w4Xg+7sz+YC0Hg+SDFiSf7P0eLscSeTPoG98pKXo2MDt7Y/5YtVVGNQpiAiMcAo9GLuVqhVSP8jB6y4o=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr176442oia.14.1604354381126; 
 Mon, 02 Nov 2020 13:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20201102081508.GA104814@mwanda>
 <MW3PR11MB4555588F506D774990798A47E5100@MW3PR11MB4555.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4555588F506D774990798A47E5100@MW3PR11MB4555.namprd11.prod.outlook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 2 Nov 2020 22:59:29 +0100
Message-ID: <CAKMK7uG4MC_uT=kqXT-wZJR=kox6TW0aa3JOA7idnOa1SGNrkQ@mail.gmail.com>
Subject: Re: [bug report] dma-buf: Clarify that dma-buf sg lists are page
 aligned
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 10:33 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
>
> Hi Dan,
>
> Thanks for reporting the bug. I see what was missing. Am I supposed to submit a patch to
> replace the original patch or just to fix this bug?

drm-misc-next doesn't rebase (except in emergencies), so please follow
up with a fixup patch that references the one already merged with
Fixes: line and everything else.

Thanks, Daniel

>
> Jianxin
>
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Monday, November 02, 2020 12:15 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Subject: [bug report] dma-buf: Clarify that dma-buf sg lists are page aligned
> >
> > Hello Jianxin Xiong,
> >
> > The patch ac80cd17a615: "dma-buf: Clarify that dma-buf sg lists are page aligned" from Oct 14, 2020, leads to the following static checker
> > warning:
> >
> >       drivers/dma-buf/dma-buf.c:917 dma_buf_map_attachment()
> >       error: 'sg_table' dereferencing possible ERR_PTR()
> >
> > drivers/dma-buf/dma-buf.c
> >    897          sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> >    898          if (!sg_table)
> >    899                  sg_table = ERR_PTR(-ENOMEM);
> >    900
> >    901          if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> >    902               !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> >    903                  dma_buf_unpin(attach);
> >    904
> >    905          if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
> >                     ^^^^^^^^^^^^^^^^^
> >
> >    906                  attach->sgt = sg_table;
> >    907                  attach->dir = direction;
> >    908          }
> >    909
> >    910  #ifdef CONFIG_DMA_API_DEBUG
> >    911          {
> >    912                  struct scatterlist *sg;
> >    913                  u64 addr;
> >    914                  int len;
> >    915                  int i;
> >    916
> >    917                  for_each_sgtable_dma_sg(sg_table, sg, i) {
> >                                                 ^^^^^^^^^ Not checked here.
> >
> >    918                          addr = sg_dma_address(sg);
> >    919                          len = sg_dma_len(sg);
> >    920                          if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
> >    921                                  pr_debug("%s: addr %llx or len %x is not page aligned!\n",
> >    922                                           __func__, addr, len);
> >    923                          }
> >    924                  }
> >    925          }
> >    926  #endif /* CONFIG_DMA_API_DEBUG */
> >
> > regards,
> > dan carpenter
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
