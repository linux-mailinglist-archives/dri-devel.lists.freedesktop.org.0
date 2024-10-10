Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A66997D44
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 08:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6722010E02C;
	Thu, 10 Oct 2024 06:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="uMTUr1zL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1F710E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:34:26 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a9963e47b69so90185166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 23:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728542065;
 x=1729146865; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNbQgNGz4ln13V+1AJHezmBRqD3GeJjDxhy0+sxFIyA=;
 b=uMTUr1zLTW4ukxU5SFglrw+oWjZlSxu3X7RWsHsGxF+isS9MhuOb7bapU9dH1mMaGC
 eOGY3Sd9TA8YY7CpyaFQ3bgjV9dqiyLgxaz5+GiBHXNdpYGu4eJtTgxg6cHCjcaFuZFM
 T0Lao7y7PX89tXWrPvauHIBGwtLc7ugOco6y8E5P7cqD1LowiPFFxDrPTRWwN4rIQflc
 /qFxZ/1sMnbEGX+sAtzWeC8X96dl1UJg0oH/2Fu5GzupW+wNKwZWw9cLDvdztraurzyw
 Pq5hkdQz5974ha2OlsLrdRKWEdx0VWLsINrW50o0FOgQatjHBCLIifHgKL3egTC18IDW
 2Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728542065; x=1729146865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNbQgNGz4ln13V+1AJHezmBRqD3GeJjDxhy0+sxFIyA=;
 b=Ts0AEPZm9RMHTEn1DAwN7zypw9blOAJg/g3b7pV/gk0xRiG+sr9wDdFjGgZke13MWn
 XTEsjvnR9ebk2DJU49Zn79bozlYAO1R98O7FOsnVvydhDpqlVn2uUfRFej0DQjdqufg9
 HuzcOWROSg04KwID1uoFhUt46LLTZmYIKGOWRRpbk5yNbLU6imCBdz8SsiDVV5thMBOT
 rr08x4VHXDGBE2BVoLCKX6T/8EQLmgjhOPZs4RL2eeyLg8VzSdEv+YFcnAL5mSYTo9WH
 FFR1ImtAGm35Find7FlCU7AM53/GQGRgzscfZuwjAPAVGgG6z82BDFW3G91L+gLH5K8K
 XYIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT1ps3pm8C5iUHG1qIsWP9xDvLzw7OMN+22h6xW3aJ/NStHbTiyBOkhsLe1+xYfpqomsHQ0s/iQ5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpuOxA5+TXaXPVxtLVtPKgzesEmISAfXTKo8X9iqcLanyX0GL8
 zr0b/2UMkGZK4r/GbopVWPDQbpNud76cnRaYkskXqPxXuKQalmD0X4okWsC7qZs3j8hvWw7UDiZ
 idVWgpi0VYkxHWojitckTpxkG0VIDjfibTOeYwg==
X-Google-Smtp-Source: AGHT+IEFirfdNC1tkJJSNx+yCF2buHjstu4V7B995CFeHueDWDw1iSohi1NTD6YhOveJe2g1G3rj+p3QJlhlIWL6tk0=
X-Received: by 2002:a17:907:6d11:b0:a99:4136:895f with SMTP id
 a640c23a62f3a-a999e8cd43bmr218826866b.41.1728542064655; Wed, 09 Oct 2024
 23:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241009213922.37962-1-everestkc@everestkc.com.np>
 <c2a9c4ad-ce50-42ab-8dac-65914e188cac@stanley.mountain>
In-Reply-To: <c2a9c4ad-ce50-42ab-8dac-65914e188cac@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Thu, 10 Oct 2024 00:34:13 -0600
Message-ID: <CAEO-vhG01xvKvJ_e5Rbkn6WRQho8gauLBQw9Wd_VQj2Lyw8fyg@mail.gmail.com>
Subject: Re: [PATCH V2] drm/xe/guc: Fix dereference before Null check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 skhan@linuxfoundation.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
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

On Thu, Oct 10, 2024 at 12:28=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Wed, Oct 09, 2024 at 03:39:20PM -0600, Everest K.C. wrote:
> > The pointer list->list is derefrenced before the Null check.
> > Fix this by moving the Null check outside the for loop, so that
> > the check is performed before the derefrencing.
> >
>
> Please, mention the effect on runtime if it's not totally obvious.  In th=
is case,
> someone reading the commit message would think that it leads to a NULL
> dereference but actually the pointer can't be NULL as I explained so ther=
e is
> no effect on run time.  Say something like:
> "The list->list pointer cannot be NULL so this has no effect on runtime. =
 It's
> just a correctness issue."
>
> Change Null to NULL so people don't think it's Java.  ;)  Also dereferenc=
ing
> has a typo.  s/derefrencing/dereferencing/.
>
>
> > This issue was reported by Coverity Scan.
> > https://scan7.scan.coverity.com/#/project-view/51525/11354
> > ?selectedIssue=3D1600335
>
> Don't line break URLs like this.  Just go over the 72-74 character limit.
>
> >
> > Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
> >
>
> Remove the blank line after Fixes.
>
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
>
> Otherwise, it looks good.
Will incorporate your feedback and will send a V3.
Thank you for taking time to review it.
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> regards,
> dan carpenter
>
Thanks,
Everest K.C.
