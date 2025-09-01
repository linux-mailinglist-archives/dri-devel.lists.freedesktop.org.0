Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7AB3EB30
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BCE10E4DC;
	Mon,  1 Sep 2025 15:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="AsxTBO+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE910E4DC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 15:44:23 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e96e45e47daso3024416276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1756741463;
 x=1757346263; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gv8Fs1lCORqoKvCxwSJ1PHBV0IJT6OUFz2w3OLpOTgo=;
 b=AsxTBO+y4BTjyLCbAOOghYDOoBKa9/XLu/bfCeuNUVHiFT0/OwexbAN57JkGWz4JER
 Q6T2rqEqquVuuwUgVaARzvK36Oy0jMKoBDgFFib20iYSwumg3mu6IB71ZoEpF6cYHMwq
 Vk40oHujf6VzWn4BxArNYqEVPLk22Ew1BBWUBZxtl9aS798vfcQYVaEeLzo+JhrVjQh3
 KrApfW6gF1HjKY1HFucvAXqeTvoSd85vneYpx/2VKFZKR20bbAZawKsC1dl216+9d7H6
 AYXfOtnYLoa65Wja+RikWwjU16QHkpkN4e/k9sGREpbbaw/7E60ze31Gm/EhOugKwiXn
 GWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756741463; x=1757346263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gv8Fs1lCORqoKvCxwSJ1PHBV0IJT6OUFz2w3OLpOTgo=;
 b=FF+Oo8F68R+y7+/SJBBqSXZ76DdVXzQJbVxs/zTsboTCQTX/BRXA8HMOb5/kBwVuuz
 gsF48Qcrdel6fSj8ehlN6EOz6Ulg6iCOqonDdsXHPHaTOrqit4UkEpWXCvsQMubNgjl7
 nB7uBiNXpa8EnWIA3hAeBIPO5jdDALTGlVNM395bWr1iQ3Jlyunqw9WgV+deAuI3cDjE
 hdlJAc98gpWKUDLWDcvjXs9ztcwmUAFci8ODOLTFz7mlBhvbvAyK/ecXhluPkpF/Rfq5
 el/Oj2MJwouhAywaxvLLIb2MimJZ/iXlO7oBS15qx7y/YP6bNsC+1W/X0v9XUz1gu6fQ
 q1Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzc8aYsBJNR0ksPs9DyDv1GjR2fj90uJ0fkqphGkUVBDIRBcVNIl7nzkbCFVIi/HT3SE+MNs6IJPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwShSEjis0ABdj5KIPAIHhiv4c8cwC0kz8iSWmdkx3NWkbSJzdg
 J8BW4AwoSv2Tsjhrelexm0mKAZq2yOIXTCeLMsp6txPqM9mk+8j4vK4y/1Rv0+XnKi7YxhAcAbG
 id2/f6THfng==
X-Gm-Gg: ASbGncvrMueft90sHuAijzNbDC62Hsgyap/t/OWDK8/2EJ8Oq15DEtTalZg0sXSIIaa
 AKteLBdzt0TZmfER7t7Rm3nOjwx2PBVtypRYqzqDbjECIvJkkLkEJbED5fwm+O2zbwAtUOU/h0z
 h1mmaBeqDJXZTdLIR9DiFNm7TJSdTDCQDMZH1Uh7mhpiPI5XNTX7qtXCyEUoyW0j24XM0m8UgSi
 oMXcjurNX3TR/00Mk3aCAulEK9EW2iwRaGnWVklZH5cj+cX+m97SEh8oSV1IfUD2378335l/sza
 jcb9x1UjLKXdIFdQvDtqE8LHn1pZxlhsfr88wS+PyotU1tOiiEz85yqyDpZU0iF/fDofBFxWLBT
 Og4JuGLQXW+2UR/fTNrMI+26Vgax3Hq8SrTsCuswB4OeILE51tx3rOcyW1ds4UcI6Bw==
X-Google-Smtp-Source: AGHT+IHG8N1bMAG2tPCNviBWUCcShWv2/L3YlKyfRbHi/Eu76qI9nLyHHa7eH+SrBHxjg7cIOtggag==
X-Received: by 2002:a05:6902:1248:b0:e97:53f:668b with SMTP id
 3f1490d57ef6-e98a585c827mr9897383276.49.1756741463106; 
 Mon, 01 Sep 2025 08:44:23 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e98ac41ffa1sm2082522276.3.2025.09.01.08.44.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:44:22 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-71d601859f5so35149917b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUO2rTvUnVSbO/HhfWAjadMFXZdWSVvUrqtRX2QTh9SnvQdG/0uAbjVd8Zt8kK1KA+TxBs0uWjZ0tI=@lists.freedesktop.org
X-Received: by 2002:a05:690c:6903:b0:721:40df:7383 with SMTP id
 00721157ae682-7227655ae4fmr106570827b3.41.1756741462296; Mon, 01 Sep 2025
 08:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250814113519.1551855-1-heiko@sntech.de>
In-Reply-To: <20250814113519.1551855-1-heiko@sntech.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 1 Sep 2025 17:44:10 +0200
X-Gmail-Original-Message-ID: <CAAObsKBZ7rRXv2JmmLO9PKvMY+KLuD2v8zhLYL9_StdaKgyOyQ@mail.gmail.com>
X-Gm-Features: Ac12FXwcbnQZ_C4li99eU8OMsQt941Fs8LXnbtlzUm57hljet67PvO5cNNPHidE
Message-ID: <CAAObsKBZ7rRXv2JmmLO9PKvMY+KLuD2v8zhLYL9_StdaKgyOyQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Rocket Kconfig fixes
To: Heiko Stuebner <heiko@sntech.de>
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org, 
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

Thanks, Heiko, I have applied them to drm-misc-next.

Regards,

Tomeu

On Thu, Aug 14, 2025 at 1:35=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> More common indentation and depending on the actual accel framework.
>
> Heiko Stuebner (2):
>   accel/rocket: Fix indentation of Kconfig entry
>   accel/rocket: Depend on DRM_ACCEL not just DRM
>
>  drivers/accel/rocket/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> --
> 2.47.2
>
