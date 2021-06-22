Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C153B0924
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B196E5AB;
	Tue, 22 Jun 2021 15:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E956D6E5A9;
 Tue, 22 Jun 2021 15:31:32 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w1so10967508oie.13;
 Tue, 22 Jun 2021 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ACobuG9GBL6iTgJMQGUeQ4NnxCVUdn2UEz4s51ScZk=;
 b=FbRKl08RV+5aNUCIy+bm9R79y0vvn1Fqntx11lMKc7uBstykFXlpjoeTaLfrm6HFII
 +HEgrFz1c8I98k1PfPI2oRB/vJPXDmZ7gYDvk98AWo4x8o7v0B2KGaLjrV+spIPFeNoQ
 +dZfs7yBimI8raW3JRyWsffkiQa2vHSo1DFmxWvweSeHp1PLh8ThPMpJQRWXeK66Evlo
 pDd+cX8OKOIU4tq3oOJn8fvNkOqv8BF2KExwwBZXTVAi9/BNVYgDv1Etlgr4Jnfm2zDG
 U15DMNfGUTB+tKLKilihttsdLp7AKs76NKs/jFR6oW+8c3b50Hh6Ou4jaazsw8Vz58YB
 FpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ACobuG9GBL6iTgJMQGUeQ4NnxCVUdn2UEz4s51ScZk=;
 b=ilk+RccwPCeBv1HD23hxn25tKRoSxqcguOetRuVgF7tG0OoWl/ihy3ED5LJixV0MDl
 fCFybyu1H/Wv0Pwzf8rjf8vb8rb86VRBZhXQkXArQGnGcj198QsOwF+8W0qK58H6OF59
 IbX3VLgFtly7PDsyCwMsU0QtXK0A7cH4BMXzrubZNmxcdd8WLmU5rVYMRYEl23A1qAZ2
 1yIpOJ0fRbn6Tj7I5tYgzvVfN3GbQPIoTzZXdFMmgZVKtJZCGPNhqvPwR37X4tqW4X3z
 wQA0LUCGy1dB/y0xveZ0Ca3YAPCZImqqlvkNCTLvIBVUJWvUmMWtNwlQGgntT5yHvZ0P
 vlJg==
X-Gm-Message-State: AOAM532hpW+ciuFAFDkN2MY7LrPl9m6k8rz20LL6K8llrIJGa7CvXjwP
 0YLxbduasytZU082cXmbUxRU+PH1zqrvSikI6BE=
X-Google-Smtp-Source: ABdhPJxWKRZiOyy1GQQeMKz5oOkBqbf2aVaRbiEZ6YA+N5BKZTQCBdtNW4NVGB7tYtQeE5WiBYa8ZoPrLTug+PhQCMk=
X-Received: by 2002:aca:ac02:: with SMTP id v2mr3623956oie.154.1624375891987; 
 Tue, 22 Jun 2021 08:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
 <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
 <20210622151142.GA2431880@ziepe.ca>
 <4a37216d-7c4c-081e-3325-82466f30b6eb@amd.com>
 <20210622152827.GQ1096940@ziepe.ca>
In-Reply-To: <20210622152827.GQ1096940@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 22 Jun 2021 18:31:04 +0300
Message-ID: <CAFCwf132jue+0ZOEd+3U-NPQuVt+ry1hz6FB=oZ4g_8J4pAqpw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Leon Romanovsky <leonro@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 6:28 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jun 22, 2021 at 05:24:08PM +0200, Christian K=C3=B6nig wrote:
>
> > > > I will take two GAUDI devices and use one as an exporter and one as=
 an
> > > > importer. I want to see that the solution works end-to-end, with re=
al
> > > > device DMA from importer to exporter.
> > > I can tell you it doesn't. Stuffing physical addresses directly into
> > > the sg list doesn't involve any of the IOMMU code so any configuratio=
n
> > > that requires IOMMU page table setup will not work.
> >
> > Sure it does. See amdgpu_vram_mgr_alloc_sgt:
> >
> >         amdgpu_res_first(res, offset, length, &cursor);
>          ^^^^^^^^^^
>
> I'm not talking about the AMD driver, I'm talking about this patch.
>
> +               bar_address =3D hdev->dram_pci_bar_start +
> +                               (pages[cur_page] - prop->dram_base_addres=
s);
> +               sg_dma_address(sg) =3D bar_address;
>
> Jason
Yes, you are correct of course, but what will happen Jason, If I will
add a call to dma_map_resource() like Christian said ?
Won't that solve that specific issue ?
That's why I want to try it...

Oded
