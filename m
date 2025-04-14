Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AFA88CB0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 22:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0A710E639;
	Mon, 14 Apr 2025 20:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B5V5CScY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9A510E639
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 20:04:20 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3032a9c7cfeso877210a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744661060; x=1745265860; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=;
 b=B5V5CScYiF6HyupMIgsySGdMS5LNkAzdMAwOt6srsj2bpbzPj6RILcgV98GehiKcWe
 qRBAY2Ur8gcewtNhIJ7Yi/jqWEqHn5XtSlCOwu2mPut6JAxYi4hnF6Sg4+Lb5M0MC3Cl
 rR7rzT5X4GcAf+1sK/V4crDsGKqYKAehLY2VUNNd7Atxmi5ikh7ZgKQa2NmCpiX6XdGz
 8oVrO1bwROodbSt+nsBR0DMv57GGFUZCMt5BuYvjKpZzoCrOWZD3VfA0+CGemNH3VBKG
 ioptQEOfnenSqBdsmcJ7PONx+59OpDxR/QLKW//h+iAQciC67TVYHPpj3z1uVU3bWAqt
 tdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744661060; x=1745265860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=;
 b=gdLXCIbYvgMZzM0YXDdxyWEe/TKdAI3FYogDc5AKLcQqZYhg7J77ssbdxYtuigteG2
 61b464n005hQ6VqWascBO4d+1GQ2wWN5n92uWGQg8Y0PGlkeTsE6boOsWM0CmKSIm7Ln
 aq4QWpkVtfqAFy16TNoGnLJz8wTSxLqltYqiVd6Hz2IbkrdDoUQvhiPAiTTPRHtKA0ki
 kp2j2QRhIfARJ70+bMcyDCWtRBB2t8p2wJTntR6qZ/74+WqVVwqE7fXOT7VHV4RQdpJl
 n1m3s1kHj53dcPjxUyUqWe4g3qVnrUGPyIgBOLp6yY7I+CBdGitWsSeS2TKAbpdnvXIg
 3u6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA4xooxsQtyAn7AtgNuXNNU8jV7xWOrh5+lI744f2/9jBQRTMyJJwvURY4WV1y8P2GTAFQMe5qC/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjFur5lhc0LVhbArBq81hFvzA5g2exf0P4tFI+nBUkjPcIdcSC
 btQV4qpVimZc0UtBXN+lIIOaSvngY1NxjEIAsyji6M1wYgQAGLJPiQrTUBLvSZrBY5FYJn4eR16
 Ti5X77eQuumRG5p2YFySh+e7pw7U=
X-Gm-Gg: ASbGncvZDWSx9wa83B1LNGLEg5f8BGxn9Dx/6CK5G7ppnQta8SQ0wiQTHcTSkcNo9Pp
 dQpe/h0QXeEO3jJORvKhf/Ua6nEdfXWveQMp6ABpogz/8SA1M2RFrEC71JhyA6IK1Dec81AXao4
 BfHx6g03gIsNTXnUbbuCeT5g==
X-Google-Smtp-Source: AGHT+IEIsC+csnI6Weh2OROunc3WgcgEHXLp5SfVQnPJhalUb5ZDeDIp3PEVZXXpGRp6IE4jLRwQHMQHJQ/2aNQrYNg=
X-Received: by 2002:a17:90b:17c4:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3084e7660a7mr588747a91.5.1744661059013; Mon, 14 Apr 2025
 13:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
In-Reply-To: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 22:04:05 +0200
X-Gm-Features: ATxdqUGhP1sZvMYgYKWAALlWFoszwfZM_Wql-C1K7rgS--G_42gWwTfE1HErvmc
Message-ID: <CANiq72k0BY04QgxWUTsgDTZJmwHurtK4XKmdWrBA1qN5jKZqpw@mail.gmail.com>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Mon, Apr 14, 2025 at 8:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> operator with some support from upstream Rust. Or do you have

Or, probably something that makes more sense: just forbidding its use.

Cheers,
Miguel
