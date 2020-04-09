Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C11A2E1A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 05:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3785D6EB3D;
	Thu,  9 Apr 2020 03:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F8B6EB3D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 03:59:26 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 111so7761115oth.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 20:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmvlzvuP/vnjEDUAwKX6NbPh583pohCBXmnvTfFr87o=;
 b=WcfWA0De+txeD+3/qwDi56IMDD7hs+I4DO8x9nTO8TIxgeXl/V6E/fN2vgTJLcstLM
 886C43uVdfSX+4NagjIP3e0rIvnsIACoAp2qqqM5tvPsuRtdRo/dBdIGz6pgvqafbnCT
 MsXHtdqENcOPqOgGtN1jR8qa4q/4FJvT2MDhcwQmEOSaIsCkJOoq9bfK6evwJJAQf9p3
 5uXnh52JdhZywazugrRBkXfhasgQzdTE5rD/ltu3H/cGMygWVnIGBwyE9oE35OHCFXCd
 +7FEkU/SMbmBstyAFQ85PLXt1sHRn/iZkz4um5cIC0b0Xfayi2XLvfYGZZPAN4AdQCTi
 4iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmvlzvuP/vnjEDUAwKX6NbPh583pohCBXmnvTfFr87o=;
 b=gQ0qAESRxpKtArGASQ5BnDxXzQxIj355xYDYixPrxJAVK5zqPq01MIEV91zXnklvey
 xFMYXRpyxR0gEx3ZQKjjiOCrYfwIZQSF2Df5lh7D3fFxmMU8I4iSDR4R9RYahPx1ozMM
 ldiLW5jORyIordaKlsJ4QYrlL8SLv1K1ovjcgeV3g4ePImQlfPf1IO8FsHRdEwonbnv7
 z0Q27iwJxLnPoBmZDBlucPa/e92JkTIjFtxzELBSdqFQIBs3qzy23Zw6qxwcOcEwG0Ju
 ZgwrcDT8jr5YPs6PxC1BQo0obdADxA964eZ2yY1TZrbS18NefbufAOWlUk5nll85mipv
 6OnA==
X-Gm-Message-State: AGi0Pua0/YBferCJlqC+kANBPMZ6emM4gfAN3OYrXK6QuLs/vzDBsyuO
 xD0VDY9fANaHnrjxGpH95fo8RYzoxModWe3gi8Ee0A==
X-Google-Smtp-Source: APiQypIL+VSKtQqdwmZy4oiaXjGpHl/0mTLNWmmy5b0h+TbJd0NijtQXz9X0wf4utwLodwHw+mkZqIhkKaDKK9J/bMo=
X-Received: by 2002:a05:6830:1e79:: with SMTP id
 m25mr8202815otr.36.1586404765365; 
 Wed, 08 Apr 2020 20:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org>
In-Reply-To: <7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 9 Apr 2020 09:29:13 +0530
Message-ID: <CAO_48GHuPAMgnbPDHgZs3kd=xDXssBD+H8-xi3zR4nSgsA1hdQ@mail.gmail.com>
Subject: Re: [PATCH -next] dma-buf: fix documentation build warnings
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Randy,


On Wed, 8 Apr 2020 at 09:50, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix documentation warnings in dma-buf.[hc]:

Thank you for your patch; I will apply it to drm-misc tree.
>
> ../drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> ../drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> ../include/linux/dma-buf.h:339: warning: Incorrect use of kernel-doc format:          * @move_notify
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/dma-buf/dma-buf.c |    4 ++--
>  include/linux/dma-buf.h   |    3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> --- linux-next-20200407.orig/drivers/dma-buf/dma-buf.c
> +++ linux-next-20200407/drivers/dma-buf/dma-buf.c
> @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   * calls attach() of dma_buf_ops to allow device-specific attach functionality
>   * @dmabuf:            [in]    buffer to attach device to.
>   * @dev:               [in]    device to be attached.
> - * @importer_ops       [in]    importer operations for the attachment
> - * @importer_priv      [in]    importer private pointer for the attachment
> + * @importer_ops:      [in]    importer operations for the attachment
> + * @importer_priv:     [in]    importer private pointer for the attachment
>   *
>   * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>   * must be cleaned up by calling dma_buf_detach().
> --- linux-next-20200407.orig/include/linux/dma-buf.h
> +++ linux-next-20200407/include/linux/dma-buf.h
> @@ -329,13 +329,12 @@ struct dma_buf {
>
>  /**
>   * struct dma_buf_attach_ops - importer operations for an attachment
> - * @move_notify: [optional] notification that the DMA-buf is moving
>   *
>   * Attachment operations implemented by the importer.
>   */
>  struct dma_buf_attach_ops {
>         /**
> -        * @move_notify
> +        * @move_notify: [optional] notification that the DMA-buf is moving
>          *
>          * If this callback is provided the framework can avoid pinning the
>          * backing store while mappings exists.
>

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
