Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6082B50265
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4773210E7B6;
	Tue,  9 Sep 2025 16:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9vduXtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEF010E7B6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:21:30 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-24b150fb800so14578155ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757434890; x=1758039690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twavimEyCpt+hWxU7SUvHffE5IVjpLZ+szv1ZgV6xvU=;
 b=e9vduXtG3nYz/9NqZk74cLkPARaTLbHfigEs1dnKJ46dEmFU2Bpa1RdFp2WmLq1poS
 fFnvzz/InFf9JbF3gyVIs6I/WoJovgVWkGfyn9K+doFTj+DT0JV/p1gtqrtExqVYjE2L
 Xv7vcH4epezooY8YA86vHf3GylP+KCZxT39pIkHMfqQ+KyWAu03WzBV7w+8Utggff02Y
 R5c5gv1FneUFveNeZgKvp6ZUDq5uRN4DdrHnJ12u6Gy0zbfCDIcY0vMCgGzJZJFMYJtC
 iZXSsXYcVV+U8Eb2Hg8jnllbtFd4bf9sLHkRRna07bzDE7EI9TP7nmk6ucwfWMn2O8W3
 EHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757434890; x=1758039690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twavimEyCpt+hWxU7SUvHffE5IVjpLZ+szv1ZgV6xvU=;
 b=YDq2j6/2j9keMl48nMZphKIxneQgJG7NJNmGSaoCb3QXx6bBDCTMfmOLX8ve6bvEWa
 ya8NTnEcX6BHOL0ufHtv1IJWPQ73geuFV/GVUBtNJJTiLTDDD0Bh70iUh1M5NYNlPViz
 C8LopA7VNldA+r0G65KZjYQrW3hYypbopr9w3IEgScqWmtyFawNm0s6oBC8CsAldDHGX
 ztHVG3PcgZU62N62O8ZDAny/F4AWEXijoQtOivNo8r13LHoSXQQcWLHS6gPtZDgPuNNp
 5rmLN+GTjn/LLia+fKjv4QVJaY3llfjNYBELwCfq3tW5eTwW/1P61Kog71P/M3oWLn6J
 TGvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc6z0YJBLoAMdWtFATgQxj+6zQGpoZUBtUQ8NSdBA6saDfdlqOSrQuDLcVs7bjwxWnMRcYoIMosyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylKzgDduBFfN1oPtaAeKzDV5+MMLQ+mA09f7f4VH6xXOkdTh1q
 KuBzwNt/tgo3BYtPCIZc8B4xZStvw0lHehLgOweKL77+BCx0M4+o5OdJC4GtoepcoVeXaEQoRBM
 JID9Wl1D8IVb/m5YGLrPm4ZvdurpsuWM=
X-Gm-Gg: ASbGncscTiwEj/jtj0ECR3hHZLO/zYLUMN7dnNCAIRK1HoiS2DjbhPGBBBGi3Gv5YJ4
 qKW/5n77FjYbXsQdRL7DpW3PW1EWPcrXiLX0iz541RTPHzcdKr6Yu1TqI4Jvuj1uQf8dVDqMfaV
 JvILyVRW6mhnPxHdkh+Hqsgt4kJTnq5yyrEF61r9rxOXVlTe/9aaVb4EIowa6G+PsdkPTpzWywt
 zXme9jFQxZtG2WHAQ==
X-Google-Smtp-Source: AGHT+IGFmpLRHs90cmwzuNefLvj/CbyZPVvhGfVJue4Ur8IBfka1symWQMSEOXPEBIHDXCQjV6t6JT3Qe6Q8Gn8JksM=
X-Received: by 2002:a17:903:1207:b0:24d:8d39:d2fb with SMTP id
 d9443c01a7336-2516fdc7599mr92780305ad.3.1757434890411; Tue, 09 Sep 2025
 09:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
 <51ae551b-6708-4fcd-84f9-fc1400f02427@mailbox.org>
 <20250901101011.GAaLVxA_Ax0R-Wy2IX@fat_crate.local>
 <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
 <20250908180022.GHaL8Zto-PsVsPa0e0@fat_crate.local>
 <63b7c020-e589-4644-887e-3922af939009@mailbox.org>
 <20250909161648.GAaMBS8ERsvv3NbJoF@fat_crate.local>
In-Reply-To: <20250909161648.GAaMBS8ERsvv3NbJoF@fat_crate.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Sep 2025 12:21:18 -0400
X-Gm-Features: Ac12FXxIrust0s1Y148Coo4wEhKxgxrPfPL0IOB8UqI-yS2cDR-dlyuYhKne0xU
Message-ID: <CADnq5_MOazXJ4tUNa5uMdkWY7ZCu70M49yG00JsNHB-FO7XNvA@mail.gmail.com>
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: Borislav Petkov <bp@alien8.de>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Sep 9, 2025 at 12:17=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Sep 09, 2025 at 10:43:47AM +0200, Michel D=C3=A4nzer wrote:
> > Then the developer needs to tell the user how to enable the debugging o=
utput
> > and get it to them. That's pretty standard.
>
> *IF* the user even notices anything. As said earlier, it didn't cause any
> anomalies on my machine besides flooding dmesg. Which I look at for obvio=
us
> reasons but users probably don't.

Right.  I think there needs to be something otherwise no one will notice at=
 all.

Alex

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
