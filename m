Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8C9BCA4C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D821410E54A;
	Tue,  5 Nov 2024 10:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rfv6xPj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC2710E54A;
 Tue,  5 Nov 2024 10:21:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7206304f93aso4967344b3a.0; 
 Tue, 05 Nov 2024 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730802084; x=1731406884; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7johmFIxlLMPLSJqq5TydQDo3koGyzHVL0vN4smmk5U=;
 b=Rfv6xPj0H936cAfd/S4LSuOuazomkwYRTpDGyEMgZONgSZ/5q2+ipgj5NV8iD4z7+H
 g0NqlC+hrn522FeFJBAtDzlxp0XzhAHd1qbdHcclmLIwr90y1AIGVJxXTxy1Ay0LEw4v
 ba/CzQlWAN+VvHje8EIcxueSXhMT6Zyq1N06OQ2f1aD1ZGt/0UjZ+cTBSZZxy5Kldu0V
 ByqGOkXpeoKfDrSnzYg8SLSfFyJfRnuq1btfcR0gQ2RUSK9OJSu+SbkLnSzX3DFLyUyv
 KNzft7fGFEa2VnkwKfEyTQSczz2Ldri8QktS47XMrmPfUEFn6GmLN6Uy51ieFFwB+iEs
 DKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730802084; x=1731406884;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7johmFIxlLMPLSJqq5TydQDo3koGyzHVL0vN4smmk5U=;
 b=vokGxJdtWJwQhiwd2IPMBjcuWEfd61U9lRv2VDhfenlDTBuhUZ/jxVE15FNXegXOPy
 QnUt5gFTeQzhlK02+QR4/qaq0i568zjzmnYI+8Ue67dkeNFDY/PIgozCxQwvRPXmId2Q
 R2c1pUT6sLT0n4HkAaqd9FYfvtmG1twmKg8hJ2fUmSPVn90ckqEgqNpVCKgGLBVUCXEA
 pQrsgivkGb3roB5DzHUeUA3UZqogN/NDAYcEUyV58BdgNqfIihbX1RwLHqszm1XP+1Xm
 3NMD1JlEUeZPnB6s4F7aHVyKrestz83Zc/8e8kCSXmrv72Nn1c6+0bqOXGk/vIFXVWf9
 jCHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJIjmdNVQE+lnx0Yp6Ku/Ds4hESGsjBWjMEy0XBWkiC7eaZH/ttrFZez2+gVQy2jyFxsuajPFvG9g=@lists.freedesktop.org,
 AJvYcCWJAcEzMASyFRwRUKxJy9AIkKsv8Xc5EXdFtzqkf0XpP2Tm0//rYhbkS7BYL+HdM/so+4c+nnrho6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1phTK4QGGfNGKkOkIRJb4yifC4xkhSHU8DpibTETPEVxQBnVe
 32FmEHSntIA0bwbNYjfUPuHt/o6KRb09YAmOJMZPgCrSf82NBedSdjnX2LUUapxBTtXzcNqgs3v
 OtxanxvL17N439XPj6AqjEo6IFJc=
X-Google-Smtp-Source: AGHT+IGbd1N33EFPPngiyV0kWvChfD3xYpzmCqXRcDRgBnf1Ooc0ARy5UKUi+cbzUnCCAiKwcTZRwKSDCVwbJyRn6tM=
X-Received: by 2002:a05:6a21:6d8d:b0:1db:eb50:abb0 with SMTP id
 adf61e73a8af0-1dbeb50ac23mr5158105637.3.1730802083687; Tue, 05 Nov 2024
 02:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20241102022204.155039-1-gye976@gmail.com>
 <hdffht6z6a6dnap7kpbg6w5hyiftgahpiyhidvgga4qjeiw5xz@wu3ca5tvfj3l>
 <p3vspkvcm7nq3gankpblloudrumenpcuflhu5fpdse75kcyyk6@w7adi7togz4j>
In-Reply-To: <p3vspkvcm7nq3gankpblloudrumenpcuflhu5fpdse75kcyyk6@w7adi7togz4j>
From: gyeyoung <gye976@gmail.com>
Date: Tue, 5 Nov 2024 19:21:12 +0900
Message-ID: <CAKbEzntS731PtOZ7iSvC8Y5XEBaFqG5TEciXQe2EiqWOv85Vdg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/xe: Fix build error for XE_IOCTL_DBG macro
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> there were some checkpatch issues about mixing tabs and spaces. Next
> time please double check the checkpatch output. I also reworded the
> commit message a little bit to follow an imperative mood as outlined at
> https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html#describe-your-changes

I'm sorry for not being more careful, I'll use a script next time
instead of doing it manually.

Thanks,
Gyeyoung Baek

>
> Applied to drm-xe-next. Thanks.
>
> Lucas De Marchi
>
> >
> >thanks
> >Lucas De Marchi
