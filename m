Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFF4AC838
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 19:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B8810E3AC;
	Mon,  7 Feb 2022 18:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4CF10F86B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 18:08:40 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so3752295pjh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 10:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYdhIytWWvNZPQpgxc7JanMz43mOjz+UXOqpB/Si8gY=;
 b=R93xjTEs3HgPo29762m4uqHy6DgEIiw341Wvf7q57zjQt/fMOf/vIggnLWq+UIkvE2
 ItYfM1ocg4jOoHter+LGmVVn+56WIrTresjlRqOzDpxhR2gE2Z7XKfivMQnYws3oBpcN
 Wnp4OjEX2kVSHOm5wWUaWUQHoBL2pZOajsCNpVYP+2s7M4Pt370NfYYH6tCLMb0ePa8z
 HUeyronXi33SaNNHMgqIF/E3v+pRpLWgtLiP7uZ593CHEdxKAHCZRXlItwp/sNFJZgmH
 Q6m9V+2GxeMGSIE/EyF8AlQqUfCTIeQOL4NCF8eo53fHgen+/6rfpdiFIvCtnwfrEBzm
 8haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYdhIytWWvNZPQpgxc7JanMz43mOjz+UXOqpB/Si8gY=;
 b=xqGy88LbOJ2CNb2/VybUnOVy8XjFyGFHNiXrebobE2fs9BucWTaEtNhROpdf4NwI+a
 1Ek4ZQ0BQ+PfmWtXPhqcA9dv2EkEdCcuP7C8VovdYwkuZPZFGxnVPXtzRz/MwUngWQIs
 BF+ojgXl1FtSbQ0cLeIv9cA5kixzqSg2vxQTs5oZcv4jACsB5EG0lXPoj1YKhIBwvoYH
 jJsrVWAjL1NNe3x7q43iYvqDrK1DHGTDzXGU3TtUbwgixalCpJBOxep4At02Bvz8ZY0i
 bSOqdUw0q5nO3Z2vL1Vdyc/gIaByMp6kXw9iaiLfWJNHbsWhZY6kt7Nii8E5C7YYLl73
 Y3nA==
X-Gm-Message-State: AOAM5306g+m/a21vz6EnXWXezn2Vc/ILp2azYAPjy989Hr/MdURFxJZJ
 k9LczItKddy9GcvXsnsU1Aitst1ndFZJ/mFuS6TkiA==
X-Google-Smtp-Source: ABdhPJzkFzzjmqODkvgrvwQLNfbzdHBUvOVv75drXwoWtoHzOi4Qr8amdduzRjHB4i+xpu3YrgRs1ma/CEMYchNDNj0=
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr121877pjb.93.1644257320409; 
 Mon, 07 Feb 2022 10:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-3-hch@lst.de>
In-Reply-To: <20220207063249.1833066-3-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 10:08:29 -0800
Message-ID: <CAPcyv4i3hJR9WBh6PFN9VgA0p3x4Vvgdy6T3b-3_bP_LaPK9fg@mail.gmail.com>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Linux MM <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 6, 2022 at 10:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> __KERNEL__ ifdefs don't make sense outside of include/uapi/.

Yes.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
