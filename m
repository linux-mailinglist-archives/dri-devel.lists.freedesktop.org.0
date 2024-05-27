Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9208D0171
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 15:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103D10E2EB;
	Mon, 27 May 2024 13:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TpspyfNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A05B10E472;
 Mon, 27 May 2024 13:27:44 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a6267639e86so372517166b.2; 
 Mon, 27 May 2024 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716816462; x=1717421262; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PiCS/M86gUVosiM8K3s52DAeVhft4izSu+PTRcDU+c=;
 b=TpspyfNiRowRipGQwCvgMaQ/DLVchj7YQj5FOLWcDv3PvNB+LToXoL9IhSqAOc/QWj
 p/cqIGGq2c7vMixgl1bXC9eNuHD3zgDJFIEvqBNIV4Bc0oIY5HoIrH6xQX/AClGl7bpQ
 ZLDmxyHmVK4bL9iNwzDFHrnlpFhkopfrRp1dcvWxTN5LiHtUg5onF99h0CVG/Rqg75IJ
 xM8n2rdbqaGCbnhSzgcMLY6iSPg9aBOHWrMFY5q+/J8zoETOFwpMc+dgBI52+C+K2Iej
 l9awisalO9xcedgF/MqSgvYASj69DLeIyUL6E9prmD7MUNvXPT7FG1V+aLBS48H6iriA
 zrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716816462; x=1717421262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PiCS/M86gUVosiM8K3s52DAeVhft4izSu+PTRcDU+c=;
 b=kwGhM3XnAV4pd+3c1p6mBVkcikB0UM+wPfOGOtpSWFRmjxdEGbGMCZ5GdxDsZsVM9r
 WM4WmgAw38WmqrNYbc9nD9kU1JQf50dzVf+CUHgtNeQKs8b3OFwbl+s5kW/j/t92Xk5L
 j3XTa5F+QqAjKGzJ6s2xupyqrV12a6FR5LK+nuUUXNSZY/lG/kHXK3LjMzmbXthu2lZT
 8KCSKzguTveqjzR0hEOO+V9Cuw0fxgq0eeZKNBl9PbE16y/7WZ/Zv5yHHbeRGLq41v6q
 vpifoNcWcAg2u+pS0P7KhaXoecpamhezkkpf2yvMK7XuGEM3Ue+6OtYb1nonmt7ufPWA
 nF+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC+igPfgltoFtBHjR8v0/Y6fgxzCpxWi074OWShXhM+/kkulj0HqlFZax0tBiZ6kfr43BebBk3pAGtFtqCTgqDG1/YvQbR8dnwoG2h2E9sByH7gAavCcNPyCU08Vj/5ycxSkP5brQ0nNlAULZikviC
X-Gm-Message-State: AOJu0YzdzwGDnnftjMyVcA/FGb8JKsiazeCefeoCTVJtS8Oppg/ARnvd
 K27Qv4W5CstDzEoyqgPnzCmS3CkwqZuDpd4msigYzLSrlAU+QZV7xEaqPrmAGwS3GVtaRo/sA3M
 0TyiYIOhMB39ofudraYXQHZlPRnI=
X-Google-Smtp-Source: AGHT+IFVnPcxnn20cR6Msa0tnRriAja6yhiHKtdshVA25MZLyQu648CM9lajmEybbVLSk/Zbf87ADoFMy1T7v8HuJeI=
X-Received: by 2002:a17:906:7f15:b0:a62:e9c:f621 with SMTP id
 a640c23a62f3a-a6265148c46mr662007966b.58.1716816462000; Mon, 27 May 2024
 06:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240527094320.2653177-1-jani.nikula@intel.com>
In-Reply-To: <20240527094320.2653177-1-jani.nikula@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 May 2024 16:27:05 +0300
Message-ID: <CAHp75VcWXCeQo4n67cfq0VQaO-+YW-=iqKx+r4NtFfYnJBTBFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] string: add mem_is_zero() helper to check if memory
 area is all zeros
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, Kees Cook <keescook@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>
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

On Mon, May 27, 2024 at 12:43=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> Almost two thirds of the memchr_inv() usages check if the memory area is
> all zeros, with no interest in where in the buffer the first non-zero
> byte is located. Checking for !memchr_inv(s, 0, n) is also not very
> intuitive or discoverable. Add an explicit mem_is_zero() helper for this
> use case.

...

> +static inline bool mem_is_zero(const void *s, size_t n)
> +{
> +       return !memchr_inv(s, 0, n);
> +}

There are potential users for the 0xff check as well. Hence the
following question:
Are we going to have a new function per byte in question, or do we
come up with a common denominator, like mem_is_all_of(mem, byte)?


--=20
With Best Regards,
Andy Shevchenko
