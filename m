Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D7CF8653
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 13:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E187910E506;
	Tue,  6 Jan 2026 12:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="Fhfd/JIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2810E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 12:56:24 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-34c27d14559so805560a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 04:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1767704184; x=1768308984; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a6QY7v3K7LjddIGzyyZ7ya0cKsRU0fqtaAJcXUSvpLo=;
 b=Fhfd/JIaGLjacl7sH2aSFSw2vJxthZCGwBWoE6XtFfPbgAZUjAfsISQ1fme/l/n2tB
 Sm/JenRC95P054a32kZcQmNqXJwYB8u/15ACxfnZHSZJD9BxL7oC7chr3zusd0xACZM4
 rw0rttNM2ITMTbUn3UZ1SMN2p4BsZRqwQ6YOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767704184; x=1768308984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6QY7v3K7LjddIGzyyZ7ya0cKsRU0fqtaAJcXUSvpLo=;
 b=hG2Sfoyzax4nWiMiJ6N6zrYKXwSlPSPBxDz3KKFwsgo/8tgzfdOhGLr8HHHyE95wE/
 An9PGTp3YG21TmDbBkrQavYJPXbbdhADi5MA+fca9MdiiN5MwSlA9AK1t+i1/V/c8x7L
 Hmu01WWrZCVIQffbCQNRSsNKfU1rQ7t3H739r1GMLY/KTwy92rvmOKzCT2hP/HO8zNWZ
 LHae9zVlC8DOHgaD9go8LPd7s75jMakzI7Ie3fnfpRmTNdrBG7onSUF3+jAvfkxy7oxS
 M3xF5wFhZF4F5ffpuY1ujiJT2MAiXrYLKXqOxyuf6I+ElbKWHLqDmPvu3oq39autrkn9
 zSHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQwhfAUTNHuO18BfdAfy52T5gmvyebgT5dc8zpPWQQ/jqtsn6G++/O+SHYvb4qQ0Uzym58TU/Cz7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWHTk6f9tuvWf0rCAFlonIFmkRwHiGrMjU+IBnpxDFJG/DPvL8
 P2eOIR1EZ1wqP5VwDhZegZHvrOb+d7OMh8Wj8EqNqVq221EaQiaL0M7IHp/wuVqQ8Ev6ss5i7SC
 R0I4mkIi069x35593Q/2QKMPL2iZAJMrbLYqLWDzuMw==
X-Gm-Gg: AY/fxX7gkKeAeVfdjwluC5XHAHmyYwBuh1FA9g7y/rXtbDg8SYLikWXf4KkK8GurZut
 xCOtFced6H97BPJbDeZPHzv7dEj7cuunO5XqKSmR+OPdDHs0Mb96di6A1kxY6Spsrrx1w84dfIy
 9Yk0/GlLk8vBVEfHBbyMPVSVz1CmpRKnKoC635fPDuz8MfA8adv2NoFjdTtBWY47PxgGGKEQc4R
 KXrICV9Ef1jwQYE/0t2SN/03Go0k8P0zcpCe33yuvemD+16ueOV5r8D3tEsD0jpMcEjCNuF77Ic
 GyftWHE=
X-Google-Smtp-Source: AGHT+IHnONGJjk+cAuGQ/Uc3C9K5oE87B+HOi6y2Nb+5V2EGCNfaEvbJpioISHK4gDmLBHgSsc6t8cW7NhLgahAIJWI=
X-Received: by 2002:a17:90b:3e83:b0:341:315:f4ed with SMTP id
 98e67ed59e1d1-34f5f280f61mr2131814a91.10.1767704183640; Tue, 06 Jan 2026
 04:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
 <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
 <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
In-Reply-To: <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 6 Jan 2026 21:56:11 +0900
X-Gm-Features: AQt7F2oqCzC4ATldD0uEPXW8K0e3G46S_P8BzIk8JoOxtgGMBUB2Uvx42XKGtbU
Message-ID: <CAFr9PX=hc31at7uHrZ3qcqtTd=B+726WZyxMz+7j1bAJ1vokhQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] video/logo: move logo selection logic to Kconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>
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

On Tue, 6 Jan 2026 at 20:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> E.g. an m68k multi-platform kernel including Mac support will scare
> non-Mac users into thinking their machine was assimilated by the
> Apple Empire...
>

This is actually how I tell if my Amiga or Mac is currently connected
to my monitor... Amiga has the normal tux, Mac has the tux inside of a
monitor.
