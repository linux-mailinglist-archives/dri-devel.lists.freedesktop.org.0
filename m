Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144AAB17AF
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 16:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B3810E2C6;
	Fri,  9 May 2025 14:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hXKzZEI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AD410E2BE;
 Fri,  9 May 2025 14:48:14 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-30a892f82b3so299074a91.0; 
 Fri, 09 May 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746802094; x=1747406894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mARamw7lUsmL/I3Kzqf41NTjnfcBpH049UKr+MaBAho=;
 b=hXKzZEI9BQIeNylRGKrcrtMkaufu2H0rqmhuuAWImsdijvlt5lJDL7QYZVwUOrSGYu
 n5gViA0k6YFmUawHcWOu0ev1KdU8ftcoeB50O+FBi9B6FjieIzAvRl1/ZIaWOOsO8IcX
 fpGGR/WOQnyyTWDhYsRgEN4kWd5ay4oPD3ZF3Y0vC829lITrifSk7Vq3jCErW/X5QxZO
 4qTcyqsoXMw85FXIQsqNzrUOTreGtF67hSH4TGH5vGp0/tbaQ09N48MiA9VzB7NGeZZV
 nUbGxCtTwHJ9M/CUv9UQOBiP2mgM+HyfVn6xbP10o9FJJ175vTGe89ch7CDnN49MfD+/
 8qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746802094; x=1747406894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mARamw7lUsmL/I3Kzqf41NTjnfcBpH049UKr+MaBAho=;
 b=lBG4G5tJQRxuqook8/joucMfz25v+lSuuKzSpqrAT6+q+MBngiUGy9igLfsUHb6kRE
 qcSOIXYgXoolJTjX8iHWWaHZ8gZ8KCwTuYxgLhI34n0UASkUL+j3zKn4QK93Wv6gPRpp
 l7oekvvmf6FKXztJD968nqXmm36MRCv8z0NlbQSrH0G0YhyV2ywYGPtmcTXBIw6INmZk
 C2m1WoggK7q6xKlUqbqz4rVeiKUbMNBOqQ3DQ8BxonrYOccTNENSp88NCgytAYlA1mYF
 MZ3WL3GDEDIfk4hReO3vWdnopnnh3AWri5dKSlRWfMkffZI+FMLMO6hbgvjDleOkf4c/
 4eBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqmKv5B5Pl8E2003ApTotEO/U0HBYfg2SA4AmerrJpIjrz8xRUvJkHvsE59c+REnWUJqxllEbP/DQ=@lists.freedesktop.org,
 AJvYcCVYIoESvKVoBNhXRmYUt+ZpB+UYgoeM6I1pChxv+SV2PJxG9EQToE6vL4uLP+MeEeArd9x0X4m2fxc1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybyOn5KZ7bNZxHa9WHmtMQbe4Tri1eXl4HjkJNvHQZjIrBVzu4
 A5qy5WCLYIzltx2wks/5rt/SXnVsJv2Yv8XTCdgx9GBN7MsjwVeAj4xtimKuaEZY95m8OT5U7nJ
 aoXdFqpGDSqy+4mPgEDQjAkDG7Tg=
X-Gm-Gg: ASbGncs6tzKwkDd1Sr6iT16yfU7EGKFQNOWD6n+Bx11/rNzFMwP6/kvxVfFZcLOEXNY
 PvkBXCnDGXXswr/bs5eg6EIFYWxwDNB7Jpxor18BqOCz2fmCIv1n3aTDBrGTZD9SgJ/TWY60bfe
 /r1eaUl3zEC7qrCe8ZlteA5Q==
X-Google-Smtp-Source: AGHT+IFa+1K23FbGssXhKRVsJgrzYJ5or5/KFBu3auQ6eL8QQ6Og83ldhpGgIYC/Xa1BzTwzbCW/k+eY4LIKoaFiBEM=
X-Received: by 2002:a17:90b:1a81:b0:30a:80bc:ad5 with SMTP id
 98e67ed59e1d1-30c3d62eb56mr2270414a91.3.1746802093903; Fri, 09 May 2025
 07:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
 <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
In-Reply-To: <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 9 May 2025 10:48:02 -0400
X-Gm-Features: ATxdqUH7m-SRD5rFdt3OSCvmnhthEka5DCwMJApoXPZk7CfFgdIwZBmJF-0jfvI
Message-ID: <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Fri, May 9, 2025 at 9:37=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/9/25 3:17 PM, Konrad Dybcio wrote:
> > On 5/8/25 9:26 PM, Connor Abbott wrote:
> >> On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>>
> >>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> On A663 (SA8775P) the value matches exactly.
> >>>
> >>> On A610, the value matches on SM6115, but is different on SM6125. Tha=
t
> >>> turns out not to be a problem, as the bits that differ aren't even
> >>> interpreted.
> >>
> >> This is definitely going to break userspace, because the kernel
> >> doesn't expose the UBWC version, instead exposing just the swizzle and
> >> userspace expects that it sets the right value for older UBWC versions
> >> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
> >> It looks like the data for SM6125 is just wrong.
> >
> > Oh that's sad.. I'll drop this commit
>
> Wait uh, we have this data in the common config.. why would it break
> userspace?
>
> Konrad

As you said in the commit message SM6125 has ubwc_swizzle =3D 1 which
seems wrong to me (it should be 7), it just didn't matter before that
it was wrong. You should probably just fix that.

Connor
