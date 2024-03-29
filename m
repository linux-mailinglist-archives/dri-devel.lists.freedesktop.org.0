Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D37890EC9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 01:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319B910E25C;
	Fri, 29 Mar 2024 00:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MFdqj+43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E33B10E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 00:00:20 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso1512290276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711670419; x=1712275219;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T11tKOiumhan7/aJq4T1XnpxT0P/7w0lhoUT1uDz5xc=;
 b=MFdqj+43e55wfzjDb4/qOYUBjlPKXAkLrUeTbMgRbTmOTYEnfpl1pRvaInnMP98K3h
 PgVe+YHnyFJHs3bGmrVSo1BVDc6VSeanNqG+Sot9fTHOByOlI2/uWc5ihk4R2ldTdeks
 N+k1Jg2z1A3l64xc3uQWsLL8kHjZbS7R68HLXK+tueFLmEKfowrOEuY9Hg8eeoAoS+cF
 ssqaGzT84r//Um/BzOK5k7AIdAn5naa4b1rQzGcnWjXSESVVR/HOl7qrnFiEroBozOaX
 SHqvlgzkiXOMmJ0ErXDtXUefCBNd/wnCzugSSEfz/WnwqSPVBrtC2EvQcxFDhHHws8XY
 yuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711670419; x=1712275219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T11tKOiumhan7/aJq4T1XnpxT0P/7w0lhoUT1uDz5xc=;
 b=ZuBPn2uoF/VBFlWis3eZrUpktmPapm/ZNakjqw1ckGlYiXXk8leTiw4UMxUlU7hupT
 TwDHTXfRokDrrXmf3K7XkTmtSY+yBjc5ytWGrLwX853ogdKtRDSOAJrKU1WpHcFQgaOc
 bNR+ByibVJe4vaA6DVsb3VLlu6NmBKF0f7Z2hv6wzqb1lRwphTi5lE6eBEaZ1SqiRGRn
 Jqo+x/LZs+5viBC3AUe5x118QZm6vjlqcfMpmd63GiLZA+HuhWTBIR/s681uxmQ3OxwJ
 LIud4RhgFHi39ziaag6y6t1kuG3NWcmFIH5QZgZqnNuOP+uHqUjTq68GdkAXwaNScZnr
 a85Q==
X-Gm-Message-State: AOJu0YwQbcRUSUygGPJyuaYip1HJogx7LafHbTTY4g6cFpL5ghGgUAJr
 II2S09y4a8GQCMyOEc5WdWIEv/vKY84NX3i73dfcuqOLAP7ki/l6q0cSA3oRTRl7haaIX4a/5li
 rlpFotCRyQzSynShLzHqsn9BhcZTEedK28fqb
X-Google-Smtp-Source: AGHT+IGF3VENnshqQcApg+O/wjOuPYywblLF9c/PO9GX1CsUXA48nDaHFlPvXqTRUPIpQ75kg493PggsfmaoNGiJqu4=
X-Received: by 2002:a25:9b05:0:b0:dcd:2f89:6aac with SMTP id
 y5-20020a259b05000000b00dcd2f896aacmr820996ybn.10.1711670419054; Thu, 28 Mar
 2024 17:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240328145323.68872-1-tursulin@igalia.com>
In-Reply-To: <20240328145323.68872-1-tursulin@igalia.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 28 Mar 2024 17:00:06 -0700
Message-ID: <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Do not build debugfs related code when
 !CONFIG_DEBUG_FS
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
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

On Thu, Mar 28, 2024 at 7:53=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia.com=
> wrote:
>
> From: Tvrtko Ursulin <tursulin@ursulin.net>
>
> There is no point in compiling in the list and mutex operations which are
> only used from the dma-buf debugfs code, if debugfs is not compiled in.
>
> Put the code in questions behind some kconfig guards and so save some tex=
t
> and maybe even a pointer per object at runtime when not enabled.
>
> Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
