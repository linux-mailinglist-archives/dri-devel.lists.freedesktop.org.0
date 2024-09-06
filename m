Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBBE96E6B3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 02:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3929610E844;
	Fri,  6 Sep 2024 00:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jTOzyD6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8A610E844
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 00:17:21 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so198189266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 17:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725581839; x=1726186639;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NG9BmRA6hMBliXpavQRbROysFPGHOwtBx2R9wnjVQuw=;
 b=jTOzyD6EzwCNRAexc9nEEQwze4LulYHfxqhajuu+TI8Rlg9pL8roXs5LX5LjW+9C11
 EpsgK8TF3xkeEXPWuLmQuB/UQcG0Fa42b6aCRwgOAXmuOPg4Q6kB9n8QS7r2b5cltAlJ
 U4ifU5KRWR7/0iIr1L7ciDX+Qyaf1VZ55fVFC0Eq9xToClIaa+ROHvU5ErEQSBWZLYtN
 lLnd86FS4qwZ86veeveoihLCeyLvAf9BC4MP8y8SR11y5sId54n7d/IfLVsLgSrc3+6Q
 0wwWj18RoiOn8mMVwbXAvy8FVV4CLr7vvI9vwK696zeSgzDWUt8aSPymJNhPZNX3l4wf
 Ew8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725581839; x=1726186639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NG9BmRA6hMBliXpavQRbROysFPGHOwtBx2R9wnjVQuw=;
 b=t9xqNb4S7++zfToD2h6e7173HdN7DXFcrWcacMwOqH32aAn9utImtPxRYMBqlf9S2m
 YXaACT9AX/HPUnVfBBFKZ0QzGzNBSikYHF4+T9Qc5+M43tdcT/l/JnE/n/EVpMjNluLX
 UYrMdZ35neWET2oiFImoal1PdXfsouOMSkVFekKwK6h2P/wGbtiG3deAtsWGk5WLmcIP
 ksi6JSiH199eABfzXQykcEvskovJ8Rm2gLZ+65fuNISrLKfWNiqchA22Nzmba/e1op0N
 wg18MWHFpCVl+UgEuXZopgmTxV0AoMP0ehaGHwRzZGewEGOfps001qKHFCktYvCBytS0
 FS2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYICujR2I2aYUdl3NEzSBuYo38XoBz9CtwAYGmybjjvzSWT/hAA23dCY9u9715szeEt0aWiohnVVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ1XSC8VDV7hzOAIyZW2B4apbLgqBbKs0ZymAl50JhrDoTPwnp
 CREm496/jGCRPl1VBUTA/1NTzlF8SmfQ1n3LXncueV2vFqaePybdVSKlTdP4Eeqy8xhqV3J9qHg
 +txJpbUSzCVSzkvoKNtn+SlxOy8gM9u2s5S4=
X-Google-Smtp-Source: AGHT+IH6iGOhY96esUOgnqkha3Im5NDBFCI3MQ/51ohxLt/quz+M5fUyeZSZEDsXTKSS5BJ+8U+V3xQiVG0pxHwj5yY=
X-Received: by 2002:a17:907:1c1b:b0:a8a:78bb:1e2 with SMTP id
 a640c23a62f3a-a8a78bb0272mr274642366b.6.1725581838319; Thu, 05 Sep 2024
 17:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240906000314.2368749-1-tjmercier@google.com>
In-Reply-To: <20240906000314.2368749-1-tjmercier@google.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Sep 2024 17:17:06 -0700
Message-ID: <CANDhNCqudbuWM-WG7jiY_KQfgOZ84nAwWUfUHNzgniBiSZzeyA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Add __init to CMA and system heap
 module_init functions
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

On Thu, Sep 5, 2024 at 5:03=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> Shrink the kernel .text a bit after successful initialization of the
> heaps.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Acked-by: John Stultz <jstultz@google.com>
