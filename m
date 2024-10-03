Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161698F564
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 19:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883310E23C;
	Thu,  3 Oct 2024 17:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d/tfb6N2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9115D10E238
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 16:47:36 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fad100dd9fso19333681fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727974055; x=1728578855; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=psqXgVYQxh+Nqc0Py7UigoY7uptpL1QNQzj4fqHhGjU=;
 b=d/tfb6N2jPi56DgOqKwOrVDA5iPutjJ1jgv3tRNwOPmiyseiGTa9DEB8T6SMPmJ0bn
 FYKgwsFJfvU9qtVH8CIbi5/Dmi8j9cdQSzTvooI/RWScxYIkO29VxCNp1a068uHjKTko
 IBecePjNeuNt5CfPUcU6BadH4t9TR6uOh4z+m0WsE+1Ot8m9mAw17Ym1UKnmox3wX/Fj
 /m8Uq49OIsc7zwBDLqzzp+Q0HuZDlHIgtdBMnCOoB4FiIgH9xCg1OG9FQjwjMpcY66J3
 OWZGbPur8Spo3lsNadF24qaX7w2QWA/gMxPeHz9iaphkaWHeIN5ehwldmHhqJfM/FCLL
 yqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727974055; x=1728578855;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=psqXgVYQxh+Nqc0Py7UigoY7uptpL1QNQzj4fqHhGjU=;
 b=mB3mgRe8ms+jt+uCYHfvt+5cgpr1kU6BQ1reSFs/EPIzN0Cm3bbbo+X/IVpOUyGVyI
 nZG9JxBI6WrPjuaB4Ic/Q5FetjtIhOp+5S+E62XycTKVi5VGO2FSrZaYkcSv7825XwEY
 Cm9v5JIb2KAFsvd/Ug+dMkal+X1qBQuvSfMeGV3hh3SK3ooIw/cFb1JblvLHdytbHz/e
 N+AcOm/lL0iQIPrGmcBk/bfoZMtSRrW666noobU1dxVfpQsUzYyk9K9ka8nbinvkhmAq
 ayrvfbcYgrIV0pO7XY4DQm+J48Pyh/U3OylRBMAPO/rVRlW7asX6EVB9W8Frbc8vMbus
 oCIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz1Te3pKbTBVTk2nL0NnZwkj0r0JfCPF4t2yr+1SvipWyj5GGDXzgTjdUcWS7qY/iLHpapYwL5DpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOgsczjmjocIvk6nseszPAU8caVh54iIgcbRbLkgGqzCCkq/UZ
 Ma2rz2vbxfGr0/YG/qr15cExil/XnY0UY4DpGrMC/W/i5oWtAort4SGumM53ccV0V4tXe8TfqHM
 yBHQ2BEwKbWEKIuc5EynNdevmPF811g==
X-Google-Smtp-Source: AGHT+IGPSZ3E9O5gAxhRq5O9LqntfK9B6JDHzw+kooRnu6f4cg5nHyGVMnGw5PmESsxX1yJS8iK6tHj52Q6zsyKi2nE=
X-Received: by 2002:a2e:b8c1:0:b0:2fa:c455:23c with SMTP id
 38308e7fff4ca-2fae10b4c0emr73735201fa.42.1727974054298; Thu, 03 Oct 2024
 09:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241001174611.12155-1-quic_pintu@quicinc.com>
 <CAO_48GFPg=R4JaSZtgTKjh0TLKTrw24AF0nRMvFRXxwYCP28fg@mail.gmail.com>
In-Reply-To: <CAO_48GFPg=R4JaSZtgTKjh0TLKTrw24AF0nRMvFRXxwYCP28fg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 3 Oct 2024 22:17:22 +0530
Message-ID: <CAOuPNLg1=YCUFXW-76A_gZm_PE1MFSugNvg3dEdkfujXV_5Zfw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: replace symbolic permission S_IRUGO with
 octal 0444
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Pintu Kumar <quic_pintu@quicinc.com>, christian.koenig@amd.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, joe@perches.com, 
 skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Oct 2024 17:37:05 +0000
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

Hi Sumit,

On Thu, 3 Oct 2024 at 12:27, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hello Pintu,
>
> On Tue, 1 Oct 2024 at 23:16, Pintu Kumar <quic_pintu@quicinc.com> wrote:
> >
> > Symbolic permissions are not preferred, instead use the octal.
> > Also, fix other warnings/errors as well for cleanup.
> >
> > WARNING: Block comments use * on subsequent lines
> > +       /* only support discovering the end of the buffer,
> > +          but also allow SEEK_SET to maintain the idiomatic
> >
> > WARNING: Block comments use a trailing */ on a separate line
> > +          SEEK_END(0), SEEK_CUR(0) pattern */
> >
> > WARNING: Block comments use a trailing */ on a separate line
> > +        * before passing the sgt back to the exporter. */
> >
> > ERROR: "foo * bar" should be "foo *bar"
> > +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
> >
> > WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> > +       d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,
> >
> > total: 1 errors, 4 warnings, 1746 lines checked
> >
> > Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
>
> Thanks for this patch - could you please also mention in the commit
> log how did you find this? It looks like you ran checkpatch, but it's
> not clear from the commit log.
>
Thanks for your review.
Sure. Yes, it was found while using the checkpatch.
I tried to put "checkpatch fixes" in the commit header but the tool
did not allow me.
So, I removed it.
But I think I can add that in the commit log.

> Since this patch does multiple things related to checkpatch warnings
> (change S_IRUGO to 0444, comments correction, function declaration
> correction), can I please ask you to change the commit title to also
> reflect that?
>
ok sure. Last time I tried to mention "fix checkpatch warnings" in a
general way,
but the tool itself catches it and throws another warning.
So, I chose the major fix as the commit header and combined others, instead
of raising 3 different patches.
Let me try to put the same as you mentioned above.

I will correct these and send v2 in a different mail.

Thanks.
