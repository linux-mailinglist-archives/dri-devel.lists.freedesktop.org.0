Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CD70F460
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 12:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DCF10E647;
	Wed, 24 May 2023 10:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E810E647
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:40:01 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51190fd46c3so1554269a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684924800; x=1687516800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38iJHpKlIiWZbh1WDjxxGN+0tLET1s1ACGv1lr82oHc=;
 b=Rz6wHr67S1cULfAOj1lT79Lh3G+fcFkDyCZnpmiyp0QRutIFDCh87U8llVuL6KrsIP
 5+FrH0DrH8tWcSoiJ01musD/yKnK5UpEbk8NIm3A+pa75pB8XItq+/TpZaZwAj/CL0LR
 vi2PJd5KJimgYUEpDO68Z+07waFH4+YjdadJBhE8JoxBEFhoVSLVK12/wIF0UIGmoKcy
 afrnF7oI3RjLtZcmAsom2yxImNuJT4vQBz4i2wl8gJnMIThZO2bEXxMSIN424Irr/ucg
 5uFIix90Da3cwxizk+RCqUMtlzAlSgEvdm+CGWI5XB4Cp3bnBBg1Nr7xrw1Mk71/TD9J
 eaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684924800; x=1687516800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38iJHpKlIiWZbh1WDjxxGN+0tLET1s1ACGv1lr82oHc=;
 b=LUdsDuRu+0uNI4oocANc3yaYlxxHW7ZUfK8ay4mBztr/XOQRnT38gMY/TslWLU24Cp
 uH+i+vvTcY77FRlYsJlpoRr+wEBRUT7XmJiNmIC010jhwb0l8uvYD8PnKxsOnHx6INki
 7seHS7eNi+JKgCc3PUinjC9TmzoM3It+KU8XctS3B7D3+Qub9xh/r7SLdq/GDm/mZNm4
 9HipiDftMLnGRA9JkAzLsw+NtLB/pjPW98DxtS4lXt3DFrOEmwkr5f69aamh9RHM3Co0
 Bt+cELPtWQp/tn7htFXHuZNgqtQ+X1nX9Km7O3GWORZljO+y9nORFJ7XTIx8wjXPwd2X
 HM4g==
X-Gm-Message-State: AC+VfDzGuTvPHK9C8ehnBuvolrdzl44Zx7fKBDWhhXKDG6DWryuoELTl
 dMm1yxTNh1yjmKaVYBcpCsbjXGwtVWo17bGm7NKADQ==
X-Google-Smtp-Source: ACHHUZ5KEgHn+BODCBjPTJdXE32cq+ah2nLHIvhhJs/3W9A/frhnK+0OzySN5R8OvNNpBRTK6iEwFez2N6pDL6jV+Zo=
X-Received: by 2002:aa7:c6c6:0:b0:50b:cd19:7545 with SMTP id
 b6-20020aa7c6c6000000b0050bcd197545mr1445519eds.33.1684924799684; Wed, 24 May
 2023 03:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230523021943.2406847-1-azeemshaikh38@gmail.com>
 <202305231021.1AF1342BF@keescook>
In-Reply-To: <202305231021.1AF1342BF@keescook>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 24 May 2023 16:09:48 +0530
Message-ID: <CAO_48GHjU9nSugzjRqDJVU3_HNQuGx4qnTFqayXECd=mFVk_Jw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/sw_sync: Replace all non-returning strlcpy with
 strscpy
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Azeem,


On Tue, 23 May 2023 at 22:52, Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, May 23, 2023 at 02:19:43AM +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read
> > overflows if a source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> > No return values were used, so direct replacement is safe.
> >
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strl=
cpy
> > [2] https://github.com/KSPP/linux/issues/89
Thank you for the patch; I'll queue it up.
> >
> > Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook

Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
