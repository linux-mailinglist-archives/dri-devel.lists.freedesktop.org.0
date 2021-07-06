Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A93BC89F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE84F89DC7;
	Tue,  6 Jul 2021 09:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1AF89DC7;
 Tue,  6 Jul 2021 09:45:16 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d21-20020a9d72d50000b02904604cda7e66so20984104otk.7; 
 Tue, 06 Jul 2021 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dz+mf5b0jxNjbTow/jqpUwCBlNrUahNX3010uoWnq3c=;
 b=GebIlLsG3wnD9bFmhGClYwFbSd5NUry7hy9yznhxk6JYeX7btEUsh1ljWnT3SOG7L9
 VD1fSU4APIJ61ZlkwlZGuzqefuKMTR3YLWKOwTksMQnGj1pEo22y2iil/+luGVXtaNTi
 WHixboA9iwiFbSJ7W54NrYsCzLdX1eRgrdE07Yth8XUt7fAI0M0mi9Hey8aoFuubCHNr
 YdJfkvFfv65cXqQIJPA9u+i80+EQ2gbGUnCAIwH/5L2SVy5AhbqizBw5lKu3jgT3MaKW
 vfj0d+m6UELsbl4c9sYUCMYWgrh61wHZTF0+7tv1Y61rhUDdvhdEOMQxTrQAEKpDzrdm
 VAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dz+mf5b0jxNjbTow/jqpUwCBlNrUahNX3010uoWnq3c=;
 b=SYx5XbQx69TiE3SnGoJ29Dik/IZdJS8Fn31h03+12ZNYezYEAfyUFSus/WnEzt/RZs
 J00oZU/jXjLiaYyJj3EIby40HuGa8SnHAw6RAZJNfXGHGlwN8A8FE+Vy1iRvTJJpBvkq
 O3Ve00O1VhhKNqHlgwQEtHUCQhvISPGihpgbIvIAKM+dKktbmM02Lol3/BKv/f0biESw
 AWwOiDWhbqh62bWRQWrtemnLJ1czxo4P8oJgLy7LCtqn2G0UEtgZMqulPbDVhRJGbKT6
 m8rTgWXFL6rKWL89wwiFhNbgkakIgQH8ITaqJ+5ulaAZiYjURE6lgPEalI91ktbx6B+3
 Ox5A==
X-Gm-Message-State: AOAM5310SGmZpQm6zMeprFm7t05YOSolW+r1g7NvvSrbvhelLIYco2t9
 PHoPlNNHrrSsEA9VvguKdfL+0ah8WJW+BJEIMYU=
X-Google-Smtp-Source: ABdhPJxBf9teTevWqibbqk3iMkxs2oQg8YD+AXIuIYOH7OAlTf44SDRKjAvd1Ntt8xB1TbhYFmVyQUa43hqNw+WGnbA=
X-Received: by 2002:a9d:76d7:: with SMTP id p23mr14460048otl.145.1625564715878; 
 Tue, 06 Jul 2021 02:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <20210705130314.11519-3-ogabbay@kernel.org>
 <20210705165226.GJ4604@ziepe.ca>
In-Reply-To: <20210705165226.GJ4604@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 6 Jul 2021 12:44:49 +0300
Message-ID: <CAFCwf100mkROMw9+2LgW7d3jKnaeZ4nmfWm7HtXuUE7NF4B8pg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] habanalabs: add support for dma-buf exporter
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tomer Tayar <ttayar@habana.ai>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 5, 2021 at 7:52 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Jul 05, 2021 at 04:03:14PM +0300, Oded Gabbay wrote:
>
> > +     rc = sg_alloc_table(*sgt, nents, GFP_KERNEL | __GFP_ZERO);
> > +     if (rc)
> > +             goto error_free;
>
> If you are not going to include a CPU list then I suggest setting
> sg_table->orig_nents == 0
>
> And using only the nents which is the length of the DMA list.
>
> At least it gives some hope that other parts of the system could
> detect this.

Will do.
>
> > +
> > +     /* Merge pages and put them into the scatterlist */
> > +     cur_page = 0;
> > +     for_each_sgtable_sg((*sgt), sg, i) {
>
> for_each_sgtable_sg should never be used when working with
> sg_dma_address() type stuff, here and everywhere else. The DMA list
> should be iterated using the for_each_sgtable_dma_sg() macro.

Thanks, will change that.

>
> > +     /* In case we got a large memory area to export, we need to divide it
> > +      * to smaller areas because each entry in the dmabuf sgt can only
> > +      * describe unsigned int.
> > +      */
>
> Huh? This is forming a SGL, it should follow the SGL rules which means
> you have to fragment based on the dma_get_max_seg_size() of the
> importer device.
>
hmm
I don't see anyone in drm checking this value (and using it) when
creating the SGL when exporting dmabuf. (e.g.
amdgpu_vram_mgr_alloc_sgt)
Are you sure we need this check ? Maybe I'm mistaken but if that's a
real concern, then most of the drm drivers are broken.

> > +     hl_dmabuf->pages = kcalloc(hl_dmabuf->npages, sizeof(*hl_dmabuf->pages),
> > +                                                             GFP_KERNEL);
> > +     if (!hl_dmabuf->pages) {
> > +             rc = -ENOMEM;
> > +             goto err_free_dmabuf_wrapper;
> > +     }
>
> Why not just create the SGL directly? Is there a reason it needs to
> make a page list?
Well the idea behind it was that we have two points of entry to this
code path (export dmabuf from address, and export dmabuf from handle)
and
we want that the map function later on will be agnostic to it and
behave the same in both cases.

Having said that, if we need to consider the max segment size
according to dma_get_max_seg_size() when creating the SGL, I agree
this code is redundant and I will remove it.

>
> Jason
