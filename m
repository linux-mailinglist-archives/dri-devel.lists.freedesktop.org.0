Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C988CC17
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 19:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BB410F1E1;
	Tue, 26 Mar 2024 18:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NAiSvKS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9840B10F1E1;
 Tue, 26 Mar 2024 18:35:13 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-29df3333d30so4149998a91.1; 
 Tue, 26 Mar 2024 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711478113; x=1712082913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6/pic9Jbejd2aRlnAlxzqdsMS/JB+QhzFMOjyyFXwpo=;
 b=NAiSvKS5zx6gc6X6KNKAUbNnAh4S4XNY9ZM6bMBB3dmur6RGoYhqZfjAP+BiVSUmbG
 Z7hbcnsN7iZJ8I/6sKU0CHj8Qq1hZ9i2KTmxaLgvDvFwkDv/WBIyxDe/BDdkxeJUKs4C
 CZuv0yo5TX4A0BBbSjWfZAxSC33nR6yn8ktl6+v7raLFSm7e+fUEMfSN0s3KbHKaDm+W
 CxJIeoOO90R4RKqZgR74VQ3E5fglaMxf+3h5FaBJ2XpOdtrgTSPsbXXXpTLo68wH3dcz
 t/xrkqQ/gclH7RdHkRyPOxPnPkXjMiPDOXMm2eR7eoOKfZd54p4TxQitp679bItKRGkW
 09Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711478113; x=1712082913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6/pic9Jbejd2aRlnAlxzqdsMS/JB+QhzFMOjyyFXwpo=;
 b=LHTeimpD6Iyuw6Z1YFkbYEPaZw1R2vueqvQXdgHHaWFF2sVIYCW5ScTW00o00bmRqH
 wgbU1v/ySQSfPCbsTuaPE/J4qPOitlzx8LBNXUpW+KpAz3yfAl36t+Qf7FHHaVyNsfn4
 Q+uMtPc2DKWRjk4vfHAoXaFUvCe9Ob+N+jVQ5pD4ejV/P4FN6eXwLVmsAefzD+QCBGh6
 v+PJe+HEp/ijpZHuSshleqWeE14n+APBObFp4kYZw2KJtUOieBMw1pJAD1TRd4wJM1XN
 g3g7MLzYiV6865LsQAr2Qy2nJJDjq5cHrpJJApFEhUqlIs1LaiCeIw/WOqf1I4fnay2X
 UnQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeC+B5z/nDer+VucSpnWvSmCYDib7aBy3dmnAOAjUWuTUGX7pLTZDQl/n1q9hbGSiWSMidYCX6NkR+TbL9leW0GUq/wnpPav7cdcMCbP71mFlFBO1075E0n2wixDKA1UqW37ARiNoesy/lePQ8nJAG
X-Gm-Message-State: AOJu0YwkVtVtdF2uTutXdj6PpIlhhdKzqLq402FcIQqDd34oDuPvFIl7
 yUJjgxR87ubkOqkq0jD6MPd6PPadEMUyvXTj9rn9HqX2JnQOP+n/UqHVhZJl9PKtpvxMR9rNG+I
 ygIsZHHdbZ4GQV578Cun5NGlZXGk=
X-Google-Smtp-Source: AGHT+IHyAWSU9D8qNbpxhyoJd3DnoClvQEJ6RppgIiF5EAvu3Z5BE4Ql/668JUaxPx7e0+ORaFJGPCuvpJUe5Zqbe7U=
X-Received: by 2002:a17:90a:6c96:b0:2a0:95e2:1f8c with SMTP id
 y22-20020a17090a6c9600b002a095e21f8cmr619354pjj.17.1711478112938; Tue, 26 Mar
 2024 11:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
 <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
In-Reply-To: <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 Mar 2024 19:34:45 +0100
Message-ID: <CANiq72k1euaoqudjKy7jKCeA49JtYN6qH1m8080QGsBfKf89Lw@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 26, 2024 at 7:31=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> This should be fixed with https://patchwork.freedesktop.org/patch/581853/=
.

Ah, so in that case the `CRASHDUMP_READ` target should really be
constant, unlike in other cases in that file?

> We can pickup that one with a Fixes tag applied.

Thanks!

Cheers,
Miguel
