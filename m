Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E27FE1A7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 22:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1631310E679;
	Wed, 29 Nov 2023 21:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5D110E0E4;
 Wed, 29 Nov 2023 21:18:51 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1fa1bcf1d01so108720fac.0; 
 Wed, 29 Nov 2023 13:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701292730; x=1701897530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WS8gBGQpXQrZRMsSNBag3Tt7HvnBrgRu9OXK2ug1d00=;
 b=C8a6zzhNZULkSKxvyKEd0ai7Gxz2+AmqJSaa4EChzMLIbwUJyb89My5BRO3CDJ8lT0
 a5ncfTcJ5mdPgzGqhuBa2yoM9/vBkQHLNsrAnDB0s5zL/RaFUvCA61zTcpDXi3EQhkAf
 1ppTMUXN22gS4Bm+uhoTFaJn6n43DCYSxXhaOUXajo11Kjjy8C80ooCdMHLkPQWYN4P+
 P+QkFelPyvLu0dEKT0Udol9Q6k9SNqVBodXcgUrlsf7SxYm+9jJI/nnkvuFPxh/4NlmW
 sLl9YFS1uajFBeYShhoN6V4sicZ3eIfHspcuaqZ7byeePJqiq7MKfG1D/TLt9bl4QXrY
 gUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701292730; x=1701897530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WS8gBGQpXQrZRMsSNBag3Tt7HvnBrgRu9OXK2ug1d00=;
 b=HuwSoFk3b24mYYMdxaKmXT9HbTzvijTD1ils9iTtCjSOYjrLtQQ43DNPT3DJKfbRQK
 4MJyx1EAqV4c9pxftaIDDkYAwOKL1EvMbzEHvYvWex+yiQ34jemmy0Uxz4zfikg5kCEi
 3JBQsaYtw7MYe2t/HsZbv+vqIQMsIGhDi9pHl8+E208RHYJvbk/hrNVkGCUd/gH9YJuj
 eNicwvLp+BGRf2Us56KR7Zt9Ic+EGJ6zdq/dpIWYi1rvgX6e4p55tSXgGzyERBTOILwZ
 ccf/Wdet3i2AYdyBrWQhXh/SZlvNsNNI19blSlTbOZO7eoXbZFXn0QJ0ga3nSrZhDdqM
 3NXw==
X-Gm-Message-State: AOJu0Yx17kJAlmECQCiAsR/x59aQ82RMZmAEKDjamNtya2KV8by7dfKz
 6HT6UlkbQCr1624wLpSTkzqwR8PUOL/5W8uHH3A=
X-Google-Smtp-Source: AGHT+IHoa2uzgpSCk5/ua6lNSfqbjchnHD4WUwl8N9K8d67JpoJqLMPCK5zWvuA0I1GukMTG2oUufTYweHYHVEnlxdM=
X-Received: by 2002:a05:6871:810:b0:1fa:79c:ad71 with SMTP id
 q16-20020a056871081000b001fa079cad71mr17816587oap.39.1701292730655; Wed, 29
 Nov 2023 13:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20231122160556.24948-1-Ramesh.Errabolu@amd.com>
 <c5ae3f32-0779-4583-8fe6-92f5dea5ede6@amd.com>
In-Reply-To: <c5ae3f32-0779-4583-8fe6-92f5dea5ede6@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 16:18:39 -0500
Message-ID: <CADnq5_OJbURbVzXVypohp7gCjE+ckHkEnDD67H7KTDJZt_e3HA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Correct the documentation of
 name and exp_name symbols
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 1:58=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.11.23 um 17:05 schrieb Ramesh Errabolu:
> > Fix the documentation of struct dma_buf members name and exp_name
> > as to how these members are to be used and accessed.
> >
> > Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Please apply this to drm-misc.

Alex

>
> > ---
> >   include/linux/dma-buf.h | 11 +++++++----
> >   1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 3f31baa3293f..8ff4add71f88 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -343,16 +343,19 @@ struct dma_buf {
> >       /**
> >        * @exp_name:
> >        *
> > -      * Name of the exporter; useful for debugging. See the
> > -      * DMA_BUF_SET_NAME IOCTL.
> > +      * Name of the exporter; useful for debugging. Must not be NULL
> >        */
> >       const char *exp_name;
> >
> >       /**
> >        * @name:
> >        *
> > -      * Userspace-provided name; useful for accounting and debugging,
> > -      * protected by dma_resv_lock() on @resv and @name_lock for read =
access.
> > +      * Userspace-provided name. Default value is NULL. If not NULL,
> > +      * length cannot be longer than DMA_BUF_NAME_LEN, including NIL
> > +      * char. Useful for accounting and debugging. Read/Write accesses
> > +      * are protected by @name_lock
> > +      *
> > +      * See the IOCTLs DMA_BUF_SET_NAME or DMA_BUF_SET_NAME_A/B
> >        */
> >       const char *name;
> >
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
