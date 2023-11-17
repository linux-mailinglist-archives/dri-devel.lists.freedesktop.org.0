Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE077EF78B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 19:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE5E10E14A;
	Fri, 17 Nov 2023 18:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC6D10E14A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 18:50:34 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a90d6ab962so25498277b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700247034; x=1700851834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DtpYAOIzka1JBZk8iAppwwSnkzFLFfJkyz+jdr3nWyE=;
 b=q56xT3FBA8nCIjGXzAqTsqoD5MxCrtbVpNjpzOPwA98Rf5Oka/WN52leoLhL2tR9RE
 Tymz0ZN4QWjupFZ0Dqaki8eswFeuFwsbwq2TVRNXDRpGXkTFORjZw13Yr4a8uNESFwLl
 BFxuKt1ulOXY9MeJHxcaOoFFDdEhxvBeNm37xEBBox3npvqFklVZ8ifw4xfOJpnbIST0
 1H2H+xF3+H6hUrpLFbgxaxOdZhTH8E5OCCs16ykLBFr+Wd1ZMmbrgKYJmVyKha+VZ2If
 JTBNWnSyav/ObFZLwRRaivFQZtFHBQxSrU2WN/j4EeKCKZvjpEuiaZIVgvOoaLXl+2bw
 +kHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700247034; x=1700851834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtpYAOIzka1JBZk8iAppwwSnkzFLFfJkyz+jdr3nWyE=;
 b=uK+FKkuzkw7zjbxVI2hm/n1BxHdeSiH4Zbsq/leRKpFTcKRzAh8ZFfEC0sq29XBq5f
 2uBMm6BCxoq0n2dz/oD6JswAorvrBB+ETGswWoIFsfbEH52BuWnRW/gjl5EU/Cayngip
 oDEbeSRBRDsQKYjXBXJmNaEYZBeJwITqjsbxb7w3GY9e0+f/IkS7xPDHOM+l6DSvr1vg
 ZdkUKUiSnibiLhFOFc0hK2NiPQgRGVPx855ge+QH2BFirAhB/IANTbSV+YoNPux5k5+a
 pYcCk/eRp8SUudjyWnqFx6+TkVMA+LR1sb8LB+hjgLH2LDLwN+UAM3/r+l7qehh0afQi
 5K8A==
X-Gm-Message-State: AOJu0YxPp8djdflyeC37PQFeVFiIU9ArDKwxKFbg0HVGwZDYVLF2iU77
 Ysrib1n3GrvfNFUtnq41+8oJp591y8B5oQsPqLTquQ==
X-Google-Smtp-Source: AGHT+IFi5dwlJjXKeALdkQ3r7NL6Ns0Vqtg+0GbT2TnyYHl6vrk7ylgtgCrw4Xy73kvNJHON7kCIdI2uoaIh9nEMUls=
X-Received: by 2002:a05:6902:1508:b0:d91:c3fe:6144 with SMTP id
 q8-20020a056902150800b00d91c3fe6144mr286813ybu.3.1700247033764; Fri, 17 Nov
 2023 10:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20231116191409.work.634-kees@kernel.org>
In-Reply-To: <20231116191409.work.634-kees@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 17 Nov 2023 10:50:21 -0800
Message-ID: <CABdmKX1oNw+quAd+ALcgGoz-PPsvy=O6YM4f2_SmP+dQBddzAA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Replace strlcpy() with strscpy()
To: Kees Cook <keescook@chromium.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>, linaro-mm-sig@lists.linaro.org,
 linux-hardening@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 11:14=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> strlcpy() reads the entire source buffer first. This read may exceed
> the destination size limit. This is both inefficient and can lead
> to linear read overflows if a source string is not NUL-terminated[1].
> Additionally, it returns the size of the source string, not the
> resulting size of the destination string. In an effort to remove strlcpy(=
)
> completely[2], replace strlcpy() here with strscpy().
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strl=
cpy [1]
> Link: https://github.com/KSPP/linux/issues/89 [2]
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Azeem Shaikh <azeemshaikh38@gmail.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

strscpy returns -E2BIG when it truncates / force null-terminates which
would provide the wrong argument for dynamic_dname, but
dma_buf_set_name{_user} makes sure we have a null-terminated string of
the appropriate maximum size in dmabuf->name.
