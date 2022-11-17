Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF362E29A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398310E183;
	Thu, 17 Nov 2022 17:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14E510E19F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 17:08:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gv23so6706211ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 09:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UXTIiUhTsDF1ksUQHxOjXei7p0SmIC0BDVdiFoql/Uc=;
 b=mfyuY0gsE5mnqDj5qh5OiKmRss9nTC7A3qsjOYoPmm5QQril+rlThWhPU0wD6Ub4FC
 e8dxsES6M1eDGjtNdYNKm9uWUX68BWALYloABbu3r2vvFDB+bl/D9MHQ6dolimQYL7aN
 EDoPyKs23xH6dMrl3+/EWt/jUTXcuymGKUPBkiLzojbxcQ6vhLN5DETjo1B4QFlOQLpM
 A7oFWHptPVyHvILMhI23wk40X9QgjTKiYte9CvQuDej/WMCu4v9CcFPEYvL/YiE3Mxtw
 /HQeS59Jod2FDBu4Yq1PYEyxlMlpgmB9ck9ERJDj84wD/D15QAx9uXMl5r5UV9ZilzRE
 MwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UXTIiUhTsDF1ksUQHxOjXei7p0SmIC0BDVdiFoql/Uc=;
 b=UiWyEyanwxfJYR6tb+74dp0Y+hhLEPgtNSRsj3eZLMLs3e2oBf4Hfr+UAX9KSuGWhy
 ujVNr7DDfRguDbVjqSLQ2hc7guDliwFfO+JR+PoFF6b1qUiIZHJpX6OhKokFGIMBVdeU
 ROnb5QvI5PXJgBIXE0Pdc6SNGw9fssp+h9aq7lomTAp6LDWTw9tLPGRqTLN3R8rcsmmK
 RFuZqIhYkH+8KhSRFR2NWJ7PwItxcrOsQqjaezarbaqBRnpaGOm9gXXCAuwuNPs8Hwn/
 Afc1TJBc8g4oisRNReWl+xiMGgCykdhQKSL/Zrrap8pLNGYkB1lukIT7eO9M4djFRrV/
 XxFA==
X-Gm-Message-State: ANoB5pkHSzSZel9BQ7HJL9mKlheRn0FkM7EvVxPzTTPVJBVicBn9/DBd
 YhcK1gShPf6U5tPJghNLQcM=
X-Google-Smtp-Source: AA0mqf7wfxRfK7sRIBOzZ7oJkCHzXBfgd3DzeE6bB2BpmX+zB3cRO/dVMMsqWRKhiAIJzI2mS2+oNg==
X-Received: by 2002:a17:906:c084:b0:78d:e786:e322 with SMTP id
 f4-20020a170906c08400b0078de786e322mr2804280ejz.308.1668704921768; 
 Thu, 17 Nov 2022 09:08:41 -0800 (PST)
Received: from thinkpad-p72 (user-5-173-65-115.play-internet.pl.
 [5.173.65.115]) by smtp.gmail.com with ESMTPSA id
 m7-20020aa7c2c7000000b00467c3cbab6fsm769694edp.77.2022.11.17.09.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:08:41 -0800 (PST)
From: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
X-Google-Original-From: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
Date: Thu, 17 Nov 2022 18:08:38 +0100
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4] udmabuf: add vmap and vunmap methods to udmabuf_ops
Message-ID: <20221117170838.GA74987@thinkpad-p72>
References: <20221117045842.27161-1-lukasz.wiecaszek@gmail.com>
 <970e798d-ea26-5e1e-ace8-7915a866f7c7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <970e798d-ea26-5e1e-ace8-7915a866f7c7@collabora.com>
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
Cc: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 12:04:35PM +0300, Dmitry Osipenko wrote:
> Hi,
> 
> On 11/17/22 07:58, Lukasz Wiecaszek wrote:
> > The reason behind that patch is associated with videobuf2 subsystem
> > (or more genrally with v4l2 framework) and user created
> > dma buffers (udmabuf). In some circumstances
> > when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
> > wants to use dma_buf_vmap() method on the attached dma buffer.
> > As udmabuf does not have .vmap operation implemented,
> > such dma_buf_vmap() natually fails.
> > 
> > videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
> > videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
> > videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
> > videobuf2_common: __buf_prepare: buffer preparation failed: -14
> > 
> > The patch itself seems to be strighforward.
> > It adds implementation of .vmap and .vunmap methods
> > to 'struct dma_buf_ops udmabuf_ops'.
> > .vmap method itself uses vm_map_ram() to map pages linearly
> > into the kernel virtual address space.
> > .vunmap removes mapping created earlier by .vmap.
> > All locking and 'vmapping counting' is done in dma_buf.c
> > so it seems to be redundant/unnecessary in .vmap/.vunmap.
> > 
> > Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
> 
> If new patch version doesn't contain significant changes and you got
> acks/reviews for the previous version, then you should add the given
> acked-by and reviewed-by tags to the commit message by yourself.
> 
> -- 
> Best regards,
> Dmitry
>

I would like to thank you all for your patience and on the same time say
sorry that I still cannot follow the process (although I have read
'submitting patches' chapter).

