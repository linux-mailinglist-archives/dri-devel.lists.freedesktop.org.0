Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58DA13C12
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F179A10E97D;
	Thu, 16 Jan 2025 14:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="smpJYcZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3E510E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 14:23:19 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e53c9035003so1577236276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737037338; x=1737642138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CbuGDZY9OMcPNxDGGBghCFG72kiSYqjW874tNYrUfyE=;
 b=smpJYcZsKbSuyn8aWf0Rm1on+tpiMP6soapjBW65GKbZI9tm96R8o5m6Fsv/1BkunI
 ZgD6uzwFckAUzWcJckuXHExgZbaLxVz47H9Vt4aW4b8sGQJg66HdNyvCXySV22D1m5Oa
 6qHI6z/cP5Xi4+DE/As/ZGaGK7R1pvL9PxzGh+ii1gMK+lYuBpZCauWJ+EgggLgBOwRA
 rL8VSzBm9sSXl+jDEYt1+J0nJiXV1EBenCxbS/1dsuy8V7BXp8sjIxMD45jD99zgaMMn
 5Fpggo/4bFHPwU+qPhlFEpLjHHB7zCLxl+HpXX8/UrgpM7CHS+8REbWXvWtZsqwvbf04
 KYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737037338; x=1737642138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CbuGDZY9OMcPNxDGGBghCFG72kiSYqjW874tNYrUfyE=;
 b=RBeCGceU9/2QX9kthCTCaCrVCWguEpqx1/z5SpbAi86Rvr2ivSULSe6U5EIqiwO0nd
 4pQFfSX3m11d9yjmLkAeUjglbZkEfG8OUyMGHn8Vn6kx5Z+qMY0u6nwn75BejNvAcaKi
 Xx4kv6ROzmC3Vu0QjaWed/0RgySr8sr+uNKRVfv/i0y3z7TZMpc/Ut+bko0FEOkDmRLZ
 GvlOtBiqpBtxKTTlw5RGG8syhTNOzxAi4Jh1Y1PPb+DS7r+992nBNBvKbs+/ttxYnRGf
 mE46lRVqvlv6SzHQxISfuRsAPs51s2v6fAGDb4gwkVe4H1DZ/xTZhEXtV9dRFEn5pdSX
 9Taw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV67LV336kaR41y3wIZI0qAuHb3b0XoYM1wwoNsMcCu53XKFnMPYbZ6y919KADLgv1pNrzSCsC9e5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzffupPBLuakE2O8QpKtdeSuWPYa6WqXUx7p+3XfRoGHIhXJM9P
 Z5cKFJpxfEjmrRIFi2McQWVfA9PqbOpgl9aYvq0BFJv4srwgNRxUxrLpvvemPU8W2R1/HKaIVs8
 zYaqForceLudVz1vr3qOVEFD2FFptKjo1ABwf4Q==
X-Gm-Gg: ASbGncvplC+T1YkNSCWQOu1jKRWTwBfR4hTrnQDS76jGQPoX160LzaoCstBQq+TK0g3
 OD0UZvo64pMk56pQKG7nXXfnDFneOIJTP5Ie1OA==
X-Google-Smtp-Source: AGHT+IHpVHqUtQvPALKWxgEbVerYIcWLhBHU/N9iKLPyTQmVZmgA6sC1QD/jrIZf+QH/2MqpX2ZsNueHigREXGRNnaY=
X-Received: by 2002:a05:6902:2e0e:b0:e56:c350:5977 with SMTP id
 3f1490d57ef6-e56c350607emr18592868276.49.1737037338327; Thu, 16 Jan 2025
 06:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
 <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
In-Reply-To: <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 22:22:07 +0800
X-Gm-Features: AbW1kvbNYMvnvklmfvw1tMEdJlgZxWihb_2YnyoIX0fWNnPoBLq0Dgu08ZgKo4I
Message-ID: <CABymUCPn=u8jr_OTFwB-WBjj2nNgBeTyH5b=PvF5vLrDhCxr3Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:26:03PM +0800, Jun Nie wrote:
> > Support SSPP assignment for quad-pipe case with unified method.
> > The first 2 pipes can share a set of mixer config and enable
> > multi-rect mode if condition is met. It is also the case for
> > the later 2 pipes.
>
> Missing problem description.

Is this OK?
    SSPP are assigned for 2 pipes at most with current implementation,
    while 4 pipes are required in quad-pipe usage case with involving
    configuration of 2 stages. Assign SSPPs for pipes of a stage in a
    loop with unified method. The first 2 pipes can shar a set of mixer
    config and enable multi-rect mode if condition is met. It is also the
    case for the later 2 pipes.

>
> Also, shouldn't this patch come before the previous one?
>
Yeah, it is reasonable to prepare the assignment capability, then
enable the plane splitting into 4 pipes. It does not hurt actually
because quad-pipe is not enabled in data structure side.
Will reverse the sequence in next version anyway.

Jun
