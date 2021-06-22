Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FB3AFF74
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 10:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD086E0F3;
	Tue, 22 Jun 2021 08:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC496E0F3;
 Tue, 22 Jun 2021 08:42:54 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 f3-20020a0568301c23b029044ce5da4794so13885326ote.11; 
 Tue, 22 Jun 2021 01:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wk5uHooOe9m9o4Li9n5UAmr51NiBBmwNJ7AeW2XMF1s=;
 b=DpDeRnU/4unkLfeKoqfIKEFsfBMZFLBF8xKaZiqlTL9oc6P670t4XFLRq0TbDdE6nr
 Ztf3mV6Jahqo5RivMEWXCClTKbKDMDe6c7CL3y9QiJTZt8/r2DB9HhkBvxBCH8TrEfdm
 Rt/c8fK3pi38t+F5QDTk0+rxauu4yuqIqdSUlpvdAhK+1McLQSnLZ32JDHCpHLb58xJG
 9PLhewIvLG/dnvIOahxYSNKAxU8IZKlfkXFiSxdV5+C0PGXWM7yX0apmRtf4EIruhPsC
 ZdnMtoc3+SsuyvZ4RQOwY5D2Bxf48aWo0hzb8v20huhOrOF7qWZgFU7vlfk5rpemBNeB
 mw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wk5uHooOe9m9o4Li9n5UAmr51NiBBmwNJ7AeW2XMF1s=;
 b=ZVWlAIyRGm4oYt/upbFWOaQGgLFlNel+x11nPNgGDztlL077q9tf3Wo1O5BpQ6Rjz3
 8vps0U/ofrnbJYvkZmO1lAkzhZzpaZ7OOa05AEulyFOFmNVL2zia2l4PWCzeFbg9IJvH
 4NtZoO0KRhn8m8A07gGbkywW9V4PabsCCRqCd6zhHedaVejQSvCtRgn1IWnqHOC4JNqa
 mB9o7GZ14AUdn1jTRdOzICLfDI+jXtVMjRArsQhbdBSMDcztYnKSA7MMvkGryws1jBhW
 S2JLP0CgzqgiaIIaaEHHRo6tGXv1OvwtZ5I4j09cbA0lj/k3Eg4mbirVfkFEAnNDl/+e
 yzEA==
X-Gm-Message-State: AOAM532Dr2dCxhw7lq+3b09hCtVbJnSlz1+PuXBlXgnR/RTQHwXC21cC
 WRpJpAb0g+IJEtBWR8qVQO7lJe6wU6hoZ/R6S74=
X-Google-Smtp-Source: ABdhPJzeINwyGxytAS9kO9kcC4dX49tJx+ip+znA7WLEk4h03GgImJS/DeJ5KNQOD5tnXfEngTt8fSVxTPnkQjTwAv4=
X-Received: by 2002:a9d:509:: with SMTP id 9mr2169190otw.339.1624351373978;
 Tue, 22 Jun 2021 01:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
In-Reply-To: <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 22 Jun 2021 11:42:27 +0300
Message-ID: <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, sleybo@amazon.com,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 9:37 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> > On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
> >
> >> Another thing I want to emphasize is that we are doing p2p only
> >> through the export/import of the FD. We do *not* allow the user to
> >> mmap the dma-buf as we do not support direct IO. So there is no access
> >> to these pages through the userspace.
> > Arguably mmaping the memory is a better choice, and is the direction
> > that Logan's series goes in. Here the use of DMABUF was specifically
> > designed to allow hitless revokation of the memory, which this isn't
> > even using.
>
> The major problem with this approach is that DMA-buf is also used for
> memory which isn't CPU accessible.
>
> That was one of the reasons we didn't even considered using the mapping
> memory approach for GPUs.
>
> Regards,
> Christian.
>
> >
> > So you are taking the hit of very limited hardware support and reduced
> > performance just to squeeze into DMABUF..

Thanks Jason for the clarification, but I honestly prefer to use
DMA-BUF at the moment.
It gives us just what we need (even more than what we need as you
pointed out), it is *already* integrated and tested in the RDMA
subsystem, and I'm feeling comfortable using it as I'm somewhat
familiar with it from my AMD days.

I'll go and read Logan's patch-set to see if that will work for us in
the future. Please remember, as Daniel said, we don't have struct page
backing our device memory, so if that is a requirement to connect to
Logan's work, then I don't think we will want to do it at this point.

Thanks,
Oded

> >
> > Jason
> > _______________________________________________
> > Linaro-mm-sig mailing list
> > Linaro-mm-sig@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
>
