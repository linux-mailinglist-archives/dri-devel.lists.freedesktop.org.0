Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84039A92FA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 00:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194A310E5B6;
	Mon, 21 Oct 2024 22:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VIHsdd7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E53810E4E4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:03:47 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3a3b3f4a48bso13669765ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729515826; x=1730120626; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Dd3Jm+THYik8qI/kTt+eRbU438IVrFocb/O4agBMQY=;
 b=VIHsdd7ydtYt9VN6SEn4UZW1eSd3W8BPlribb8/eGySXtVc6Av3zKI4ZaMZIsbu5zI
 5BHPR+E3YBUt+ROh6QA2qjJ8eybPLYcTxPrcj5NIcBX8xIN1QF54j34JC7wUI2CNoB3f
 RLJE/JuW+E3MiIFbWPkvTZ7A8Nir1E/PfIsrVWpM9KKV3T6E2WH+egr60rEik5T0p8Uo
 x/3GjNAy+eYOSy+mP5E85KbqlrE7qQ1GKk4rWgjG8310A1GwIkDVwnf7bp1Cf02tiCs0
 S8i4RPiiKwrLFYzt5x2pkoNOCkGIgARSgJYEkfWolUf+G3PCucf4xLiHm/7rckZTiS9y
 7SuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515826; x=1730120626;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Dd3Jm+THYik8qI/kTt+eRbU438IVrFocb/O4agBMQY=;
 b=KO3cb7rYXCXt50Pp13ZJObaEJWb1HM1P+5WQoNIYfSNS9b+GHgEfLSCCIub9EO1tGE
 NrvHAwxGpcoWrJB7/JRI6qL38p9k6oF/NIn7/UVbrkE3gWUgWWIOeGADDZmyCWTsypCx
 xgt78ZaC9M84fkmeGapwyFcZFeAm++r6nihSseZjwD9LOPDXl6q/O4SfhQxyrWCzopbH
 fLtvE+QLjujpbHaaw62xSdqpQCCFvPiXvsOqvRI0rtysgxPgdGe5tftSsSxiJhaARy1r
 qNhwV3rTf6g5zo4eZ6l6VgQgveskJNWv4SAnCB6u5XY1wsECIdd7GTCMHbsPX94mGyUc
 Ubbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4PZduch7JOa+dHaGnesF68hc8NXbh+NOwyZDdclrUkf07fHf5JKAQIOQ7ivoHT1KxhFYfHrpbP2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7D/jx1Y98gT5T8US2jFKd+loZrLLes8dK4CrA9QgNwAgFkmBE
 Q30GoZrqSklQjwlom52My90BwxlLjLcWU4rhj3R8Y35kduwgFebAPO+YjK58TMtRzbTw6cj5K64
 sRBQ7T5fuoY8sc/GQowhtoqk3Yg4=
X-Google-Smtp-Source: AGHT+IEmcmc+372sh7+l+TILDmZywEoKhmOum+O42c4QnS3Qs4oRVds2IkeF3oHuX+7KiNHeHObM0L/h3KhV/v0O+EI=
X-Received: by 2002:a05:6e02:1686:b0:3a3:637f:1012 with SMTP id
 e9e14a558f8ab-3a3e53195e4mr106922115ab.12.1729515826263; Mon, 21 Oct 2024
 06:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de>
In-Reply-To: <20220621104617.8817-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Mon, 21 Oct 2024 14:03:35 +0100
Message-ID: <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
Subject: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 21 Oct 2024 22:07:41 +0000
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

Hi Thomas,

Since 5ab91447aa13b8b98bc11f5326f33500b0ee2c48 and still happening in
master, I often get a kernel crash, either a "Unable to handle kernel
NULL pointer dereference at virtual address" or "Unable to handle
kernel paging request at virtual address".

This happens in ARM64 with ili9225 and display size 220, 176. It also
happens in another board with a different tinydrm driver and size 320,
240.

I've reported in 2022 a bug (that you fixed, thanks!), where it was
related to screen size causing non alignment of scanlines and pages.
I've not investigated further this time as I was not doing any driver
development, but let me know if I can do any further testing.

Thanks,
Nuno
