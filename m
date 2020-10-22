Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E11295C47
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8440A6F5B1;
	Thu, 22 Oct 2020 09:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD886F5BD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 09:54:02 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r127so1449077lff.12
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eC8I1CwnawM2RddTs5g8HobuBglSdn57cmoHf9fN7hk=;
 b=i8wZwBLhS6atZ00X3SibWKAuo9XoEtDRfH3wj6FDfEv08wnz1r5wLPdlO2q9pDTWjr
 SPwyjPFAAUvRr1N5lpr3RNcR89Qkuh5IDumePwtzcb7AK/w4grMet63lf9vwpfvF1uAW
 GTqHoiNfFtJxyabEn0AqzZNbLqv8eq151d3bOH1q+35vyHaP5nqrMrzdc2e+mQVkop+w
 CqyY90aK0rJ7Vi1NeqHsOUNPuOiDcIUisxF/ffMSA3aYftP/kOuf0ODz+499aygjicC9
 w9KBr7JsgjPwB9E5pEYP4LWb0q7iaHw7j6CsIMMgDYCgYA/yXW41rDm3nVeUzicF48qZ
 PC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eC8I1CwnawM2RddTs5g8HobuBglSdn57cmoHf9fN7hk=;
 b=E3tQppRc68bb017wJJZmVe5P2+7qKbtZGxKzvfcyMvsVbXOL0rUXmT7gUqh891zuJ3
 vc1Hc7wfFr5f8yC1iiq/MKPaj8fin+07GZ1Hld1AI1qychqU1URZetGm4BcOvgPx71ZH
 O35Gt2DUOa8dSwH1grWSAq0vfzXUVWiEXM+hT7/gpx0O+W4taQGJRNDk3ZssVct0vfqr
 SmKWr0GMtOvQKCmdwAdBx/b0f5rhYGDMU7KO+3yHaqCcJt6GCRne+g6oJO+8ls6wTXUc
 CMsto1YpJiI4uxLMYvhgnvRScNsNa+vp9yFnKvGZoIuSrVH1f7FOirhe4EF3MDkJ9wB6
 TYyQ==
X-Gm-Message-State: AOAM531ZmVO5c1q7Zjv6IGQo3a2VUfx06KOU1qFk4dzPB9KBEUvHwySm
 PrvW1/DSJiSiF71Pi4yiSDE=
X-Google-Smtp-Source: ABdhPJzYs1mFo2MgjUyHpj2yqMe53wCo4DvMwjLDzbF3KLd/KIxc6LcHaoQ8jQPnkoiMkHY0uG0bYQ==
X-Received: by 2002:a19:80d5:: with SMTP id b204mr526715lfd.384.1603360441312; 
 Thu, 22 Oct 2020 02:54:01 -0700 (PDT)
Received: from gmail.com (h-98-128-166-43.NA.cust.bahnhof.se. [98.128.166.43])
 by smtp.gmail.com with ESMTPSA id
 t1sm190419lfl.289.2020.10.22.02.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 02:54:00 -0700 (PDT)
Date: Thu, 22 Oct 2020 11:53:58 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document that blobs are ref'counted
Message-ID: <20201022095358.GA3093156@gmail.com>
References: <HNBtgIoryEkrMD_i_O5qy-HyxoyMYWSziPwHQQn9LYoOL8Ds5o7gvqMqz-Y0v7GZDqcYzBLC3d3KPfO37nRCl1doMWeQjKyHYv_pYFxYZ24=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <HNBtgIoryEkrMD_i_O5qy-HyxoyMYWSziPwHQQn9LYoOL8Ds5o7gvqMqz-Y0v7GZDqcYzBLC3d3KPfO37nRCl1doMWeQjKyHYv_pYFxYZ24=@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for this!

I can't review the correctness, but the description looks clear to me
so,

Reviewed-by: Jonas =C5dahl <jadahl@gmail.com>


Jonas

On Thu, Oct 22, 2020 at 09:38:05AM +0000, Simon Ser wrote:
> User-space doesn't need to keep track of blobs that might be in use by
> the kernel. User-space can just destroy blobs as soon as they don't need
> them anymore.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonas =C5dahl <jadahl@gmail.com>
> ---
>  include/uapi/drm/drm_mode.h | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 863eda048265..f7c41aa4b5eb 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -924,6 +924,10 @@ struct drm_mode_create_blob {
>   * struct drm_mode_destroy_blob - Destroy user blob
>   * @blob_id: blob_id to destroy
>   * Destroy a user-created blob property.
> + *
> + * Blobs are reference-counted by the kernel, so user-space can destroy =
them as
> + * soon as they're done with them.  For instance user-space can destroy =
a blob
> + * used in an atomic commit right after performing the atomic commit ioc=
tl.
>   */
>  struct drm_mode_destroy_blob {
>  	__u32 blob_id;
> -- =

> 2.28.0
> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
