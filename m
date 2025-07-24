Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43163B10054
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 07:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6510E881;
	Thu, 24 Jul 2025 05:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZevjKBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7948410E881
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 05:59:04 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-70e5e6ab7b8so5745087b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753336743; x=1753941543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5M6fAaUbUEZzpsoqwr+D7CJN0VrnnQ/DkdQr+OyZ5Nw=;
 b=KZevjKBeKXlQFX9Pm0EmxhQsxqMSblRqUZhnLzdj4kcXOoWJ0z2BnqbT9ilGikPS7C
 FBs6O9qRWkKopvN9QVOvWts3Pn33lt8sgObP3zHJrK7EclpZGxWnuB6SRweps+hTxDOB
 WKCmBcD8MwNsQXV6tmGKTJ7h9oTPcmH9JsnuG2MwDHSVR6upId/JzuEOsxxlv/9xNWlZ
 V8oBb4VgpxfFhxqz/wn+OTdI5rrL4WxNxUYnG4joGRxfGns9HHKHiTFx9m4dP22SJgb0
 JYIBuWIYIrcIj1y1KfPISnNk7BE9hTxJdFLoCxuiEcXcnCPDcs8lp5w8avCgkU2CtKgR
 d4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753336743; x=1753941543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5M6fAaUbUEZzpsoqwr+D7CJN0VrnnQ/DkdQr+OyZ5Nw=;
 b=mYNQYjoWrxNmKBJOlNyyOsaHfg2EmqVpD3YEHsF5jA0BZSuhpnLSI8aBD5JmvpDLQC
 T587SPMZfk8RzN6raO8gLBQjFegjarXKzaAVtI+edsRZb6m1xyg4Ugccmfk49uh1Rm8y
 rUzTPEYiCEZvouCyJbyxoCZa4JW+3gC1esZn+3m+QHmqi1HaluE/ngyXrLyOAw84hxGZ
 KVenxtHhgcnw+S9yml5OXM9c/tvV50iN8/bqKpnZJm4/xsjmp9qfMCO4BH4vVgMyfRUt
 yXbEUOoJQAHB2Zv4Y3rSgb6YeJtgHFOfrygkH27ikH2BA18fTHy3m4JdhSnhRMHeH+uh
 GL0Q==
X-Gm-Message-State: AOJu0Yyyti/bWUgHZ79Eyq53Yvof97lxeZXNNvS+1OP7ii9RyxO+JXgI
 GoZ7oZ9NUkhCYXuP8yj9INZiXxeVqGxsVZWtmCorBH1BPVPmt6iHm+Hos6DH5a9dbIR5vXaeeiw
 01E3AUT/BW5jrlqoWFsomko4lncfqs9Q=
X-Gm-Gg: ASbGncuFWN+QhPrqyGuSntSkGik53HIT2HXIaNtX9km4AmRgzg9a7vFlX3m3q8S5lxM
 jf5clq+UmzajjoWRClQ/msapcGkNfmUEVLbrym9nMZXE4D74UB84w8ZEFwAtg2sZaldcKfCU706
 qLbHykRgeOHHmie162nJa3ToNhyS+svHig/vlOftAwAlgTxd3uc6kPdilwMRXaKiqu8gCeSRB+R
 JMBOgGfuA==
X-Google-Smtp-Source: AGHT+IGv+XnYKYQFlDRXUdEuQHa023IswAQR5p5jGxx00eCdvOfJ8DjYnL6NJ6zL82wg6WDo6lWuri+GSGAmTX10Fik=
X-Received: by 2002:a05:690c:6912:b0:70a:192d:103 with SMTP id
 00721157ae682-719b42da8c0mr75741347b3.28.1753336743546; Wed, 23 Jul 2025
 22:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250721213528.2885035-1-karunika.choo@arm.com>
In-Reply-To: <20250721213528.2885035-1-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 23 Jul 2025 22:58:51 -0700
X-Gm-Features: Ac12FXx1bldgo-CMdxf7oWj3RatSCFZRHsdIZlcQkiXYERDBG_838jlNsnwZFk4
Message-ID: <CAPaKu7R3yZwOetKjUSr5nRYw3simfNcHN6Xm208mv53dzvCmLg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Add support for new Mali GPUs
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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

On Mon, Jul 21, 2025 at 2:36=E2=80=AFPM Karunika Choo <karunika.choo@arm.co=
m> wrote:
>
> This patch series introduces some minor refactoring to enable support
> for new Mali GPUs.
>
> Key changes:
> - Addition of cache maintenance via the FLUSH_CACHES GPU command for all
>   supported GPUs in place of FLUSH_MEM and FLUSH_PT MMU_AS commands.
> - Added SHAREABLE_CACHE support for GPUs from Mali-Gx20 onwards if
>   coherency is enabled.
> - Fixed minor issue with the setting of the coherency protocol.
>
> Firmware for these GPUs can be found here:
> https://gitlab.com/dliviu/linux-firmware
I've made minor comments to individual patches.  With them addressed,
the series is

  Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
