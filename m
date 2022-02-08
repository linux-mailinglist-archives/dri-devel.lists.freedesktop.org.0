Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF64AD2C6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A50E10E3B6;
	Tue,  8 Feb 2022 08:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ECD10E36A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:07:45 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id c6so47607897ybk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 00:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PXxGXqL0fSEKZMDAAFA60E1Rbs/msz2tQymkFw5ax8o=;
 b=qlzWW2qtvfYAAanbEMYNLuRx8ZSraE6ZerXTO+z8zhvTvhhuYlpIgqjAKGiZyn03oe
 dobQls8uADFSdqKk74wWyKhvtGm+6ci7zMlOM/25PMWhbnesE0+5XQtQJ1DQ4BSmrIVR
 KXs5u2kjzPM5yfRm+Agx/SxngcjD9ixaxLZX1vw+RU3PzkOEaYN8IUkGN+VCPNNtWbRa
 OkYOtxUahGsG7+n6hO78zD3yqAbAhOS+2yz1YaW3MqVv7bTnB7WgJxSZvd7dRu/1CoqZ
 ioyre/8Cv4eirgKtPsl7phMdGqzPgirLv2toaU5HewuA29ykBKN/lcY8q2AtU/epI3VH
 FJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PXxGXqL0fSEKZMDAAFA60E1Rbs/msz2tQymkFw5ax8o=;
 b=pCNuW3/DzUGQL1N0nIRogWu0zHsNFFptRS0SqFxMpgVsFwO0psIINtgVAMpzAE2Ad2
 FSnMD4e9dobE1ur7asvpl4cblqlMU9UR4g0JQmZUVNDDFd3bhQETVtXU6CUEfcozntWZ
 kF6Zk2UCdSEUb0gELoJLvswI2snamuz2oSjqOUp/HNkDyxh04CAMyhnnBWS6NVzlXLPA
 dEZtdkGTYQ9WU5LETMfDz6qJDOSbtrl45sna+2/hb9YhtamVSzJ61th4aQcDjk6tdUoj
 VXfSnaR7vMdmNVYnGVJSQSKjuEzU9MliOwui7EMITHBuT4LoLEIwBGbBSfKEonrzwl1f
 eOZw==
X-Gm-Message-State: AOAM530kcJPRuZd1ajIfWiMp6WOX71p1y+ZhPGuUHkwC54G4ZhJBO2hR
 oYHqMycOqVCn5Cz7xhQxZES/keb8CytICKZjq2SArA==
X-Google-Smtp-Source: ABdhPJxrFiobqvBhVclJNZluCx9G58Pv+JirZ6BIfPGVufYPFT03Bj1OgbKZjqvNPQBBROocQXaDN+k+XywWU2el4os=
X-Received: by 2002:a25:4742:: with SMTP id u63mr3440116yba.523.1644307664507; 
 Tue, 08 Feb 2022 00:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-3-hch@lst.de>
In-Reply-To: <20220207063249.1833066-3-hch@lst.de>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 8 Feb 2022 16:07:07 +0800
Message-ID: <CAMZfGtWA3M+ck8WduwxyoDiXpjC1kXs=irVZ1m-SMSREJG17Mg@mail.gmail.com>
Subject: Re: [PATCH 2/8] mm: remove the __KERNEL__ guard from <linux/mm.h>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 7, 2022 at 2:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> __KERNEL__ ifdefs don't make sense outside of include/uapi/.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
