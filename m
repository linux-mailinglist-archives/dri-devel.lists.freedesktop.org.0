Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEEF55BFE8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFC612B217;
	Tue, 28 Jun 2022 09:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D4512B238
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 09:48:47 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id v185so11759099ybe.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nnzSecJwwLdHdpah55TWOev8stQAWT9vGpRIkDipvhw=;
 b=I7H7zqGdOfwwpsDfe9uF8VojqU+qtuDQRgt7FtGBoFlVFCSJN9YFG+1NWGSiIuox8S
 W+KTN+aOhO/ktobsqKb4feN5yBBDNx0wm/w13zu9GE1MpTeJ9BkKCl/bKqoxTj+butyG
 02/IG1kxsMpY40YD0RA6epXortCUPMP7sMFf2G2KAsGaM15F0G20pAiOcgk96rxpR8ke
 4UAfgPRBQGXYCKfOAsUeqXv2EnFCWpyg0H2uCQj9u81Sa+kwI5qveTjwZLSeOF0LEPCz
 orDz4fOkku7jaCsorv9stb6v1uGkuYXGTaB+8k6Pjso/QtNIucekoLsh+TNJkKdQ3yXO
 +FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nnzSecJwwLdHdpah55TWOev8stQAWT9vGpRIkDipvhw=;
 b=tGovPzA5evNZt4IO9A5c+m/GwfBCGrLFjZ6R38lyOJ4CEavsH7v0rxPAe+f1DLxjC6
 jwtIQoi/5bxKCimQDb3nB3HMDfqlPVZTOE3vxQKwMvJbhNsCRMSvlSk47Ma4aUmgR+IX
 Cs7Di9e35RhCi+leRYMuX8bpc0qd0ErHcChbk0HzXqNi+SA9T05YQiMN2Lvs9QObZHrQ
 jmXF4pa1CfIQ4Z2IB5fn+6K700n5DujX6ZLlOMKXFQT9SCYwgdTHQ56lK3jGY7JONP7c
 73p8+abAs5u5BIWyjdm3vQ6QDEQdXzIo5y7gI7lNYdLVjVf5bf2+cFv1xVQU0VNGqMJ1
 0BmA==
X-Gm-Message-State: AJIora8LqzjwgNI8PyfzXWLH9m4hF+O2Pvq0Rnt1T3GjubqfP4KQnbud
 7PL25xxTtcQuTd6f3lR/xaBjj9sRPECCq/o+P9/8AQ==
X-Google-Smtp-Source: AGRyM1vPz47fcquk2IzBhzy+bTY7luIs+lRfkEnNwxblxcyPcZABp99gUxefsLLFGaLceF6zmZkkxVh4KZO10IEsTiQ=
X-Received: by 2002:a05:6902:152:b0:66c:e116:6a7 with SMTP id
 p18-20020a056902015200b0066ce11606a7mr8598779ybh.533.1656409726603; Tue, 28
 Jun 2022 02:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org>
 <687a2e724020d135bc7dfef0ec9010a00ecc0a3a.1656409369.git.mchehab@kernel.org>
In-Reply-To: <687a2e724020d135bc7dfef0ec9010a00ecc0a3a.1656409369.git.mchehab@kernel.org>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Jun 2022 11:48:10 +0200
Message-ID: <CANpmjNPbHYKJqFB-qNjPWsLQyk3fWrqfU3qob_E-8KMLrzpCQQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] kfence: fix a kernel-doc parameter
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Jun 2022 at 11:46, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> The kernel-doc markup is missing the slab pointer description:
>
>         include/linux/kfence.h:221: warning: Function parameter or member 'slab' not described in '__kfence_obj_info'
>
> Document it.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Marco Elver <elver@google.com>

Thank you.

> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
>
>  include/linux/kfence.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> index 726857a4b680..9c242f4e9fab 100644
> --- a/include/linux/kfence.h
> +++ b/include/linux/kfence.h
> @@ -210,6 +210,7 @@ struct kmem_obj_info;
>   * __kfence_obj_info() - fill kmem_obj_info struct
>   * @kpp: kmem_obj_info to be filled
>   * @object: the object
> + * @slab: pointer to slab
>   *
>   * Return:
>   * * false - not a KFENCE object
> --
> 2.36.1
>
