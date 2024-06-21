Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB619122BD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04D10F14F;
	Fri, 21 Jun 2024 10:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l0HLLOLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316B910F14F;
 Fri, 21 Jun 2024 10:45:10 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6b4f980ac7aso2077876d6.1; 
 Fri, 21 Jun 2024 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718966709; x=1719571509; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCzKBkI0EOlIaIsyEt1Ho+UPCJV1SGzIjta1R/xOqyo=;
 b=l0HLLOLQ+NsI0p9Ygau8vnXT5AvjlUZnGYyMZsaaHFiV2wJeWKMNSkzeFG0QX+uNt3
 jTT81VnuEJefUkHLwfNMvtljvXRD33ZJJg1NN4QfdtiIb0d3AVNHM8h2nkI4B4BmEDqm
 kTCQw0uuEG64BF9M3a1YDkZdej6As3XpxdFNjjopEQlqlomZhslfv2oE86S8s9ouMyxI
 eQxPscCIU1KsGNv0WNQ9qZuKXWqWiKYcvkFsBmoahq3vd7HIy6iOBwJJLBGhX8ReLQDG
 Ft0l9/3lSC4u/+fB+V56P+wc5y8oVySfHU5X+4cibNNopIC0Xa/MfgPRcy6PiXENOO2x
 it1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718966709; x=1719571509;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vCzKBkI0EOlIaIsyEt1Ho+UPCJV1SGzIjta1R/xOqyo=;
 b=Iw7l+8TQNOFhAaWbFRRpw/YnZaVzK6hNSpIaXqB9UNpRHbKLeCW0qLT14y6gtfhrIE
 1IzkVOgzdvxFKnMH67R8RBciJHkpqowwBysrdzcynzoNkFL5cvnkxjZvbufJia3fEOtV
 /qqfCZk/dML2qxx7JB+86WgnChE30hlzm/cNQNp2qKzt0Eq3tZlYvRLK7LeRlgC74pJg
 oLTVTWrwpYVjkG/ztsj15aD1l/0Sx6azopvBOojua5U2sWjVnl5ynsfUEoNlte9+PhVF
 HLHLlhnmX95X6lwjtNOklgV+ARz18G4FDelq9BXMNRXC8RyxkDs3SLUQveTHc2+GBH7b
 oCIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG9QGyDz6EgME8byEP4d3Ti8enYFC+RUhbF+nlQJyPq7lmNoxrN6dFmIEZEed/SFCVp8pWmQEEsWtFlFnWFbM7U1mxGBFgs8IQewoZhGlu6ISrFHNSpXPVuqPcqNEpzjJRpROH/WOJSkPvKvPQ4g==
X-Gm-Message-State: AOJu0Yyo9FWDqqMRHgsnGEGkc4WDJiJ3mWP/EqTCSnzvE26YUny/5UNw
 lYXnWaLq6xlNjfRCiD3dAWW/W0lQ3uH/Uvry7QSZRGnasf8fU+dA5Xbj6ndHUOOvcXlwouqV0ZP
 KTPoC6Ri2SAn2cQ0Wam+FBKo/wzo=
X-Google-Smtp-Source: AGHT+IGI1lyNp+TbE3ThRp8In7N425hvlee/0+RjTWRu6FiUFfFtrbG1ST8pJQ2n45IwF01JbVb46PDQIa50lhYgPS4=
X-Received: by 2002:a05:6214:c8b:b0:6b2:af02:28d6 with SMTP id
 6a1803df08f44-6b501d261e4mr83907056d6.0.1718966708856; Fri, 21 Jun 2024
 03:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
In-Reply-To: <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 21 Jun 2024 15:44:58 +0500
Message-ID: <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Alex Deucher <alexdeucher@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Rodrigo.Siqueira@amd.com, "Deucher, Alexander" <alexander.deucher@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
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

On Fri, Jun 21, 2024 at 12:56=E2=80=AFPM Linux regression tracking (Thorste=
n
Leemhuis) <regressions@leemhuis.info> wrote:
> Hmmm, I might have missed something, but it looks like nothing happened
> here since then. What's the status? Is the issue still happening?

Yes. Tested on e5b3efbe1ab1.

I spotted that the problem disappears after forcing the TV to sleep
(activate screensaver <Super> + <L>) and then wake it up by pressing
any button and entering a password.
Hope this information can't help figure out how to fix it.

--=20
Best Regards,
Mike Gavrilov.
