Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325182A83B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 08:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCDF10E19D;
	Thu, 11 Jan 2024 07:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572DD10E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:21:37 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bbd1fab171so3629736b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 23:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704957696; x=1705562496; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yy2lzqaTFfa02W+7q6UCYddcpHLmZArhRiq65UjnToc=;
 b=B7tN0bvqzYdA62jb+HDDS1I3QTzluo27QF4peK5dgBOtI9yX269U5RvS0lWHRjJhh7
 C7eYR/I7BYW0HhR6HdHTy23H1B12tNHT4wsiQcd+fMp3jmKQ6FdtixjoQib6qk09jspk
 fVgrcDnWXfFSMpp2zuyUIi8mR5/JkFCDthv+J2Y95XSFke7scvVWxSFtNb7z4xcsOzXR
 rN2Qu+RvhVhkvtbNXi5Z6VrJ9QsyRO5K208E0Uq6x2Ndm6CLxRxO8F8WJ8P7WiOMINu6
 r4YWhl6y9GlKjl3L+vJwUTJMv3Zyeq/7R8MqgmZEKN937+ohuHtCnY9qImspTs7GzQbn
 /uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704957696; x=1705562496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yy2lzqaTFfa02W+7q6UCYddcpHLmZArhRiq65UjnToc=;
 b=xO1WQ2htnSvyWaTzJ3V+hlaRlrWSefG1MiREON0v6Ap+YlIf8FZnY/Ocs+T2NTHIZ2
 d9RgWvvrBfxVx5HUfMpSx9EL7v0fqt2pW80jkgQPSOPkDk4/JooopikMQV54GCJjNr0k
 eRjkwRhOYF8ddDBOOseG5bbFiB0pMVucz1+zAZxeBA3u1df4T0N4lItXpLnoP+eE14z+
 SE8LZR47V1wJUoR4buvYYnzHYf34hjYKeCwIF3mlulGOrLtEG2c0htYxVQ4L6uGfNbvP
 fXZtKCIpmp4+qNqOZVCXWDmo0baiJ7w+xywShOc4GXe91xrTixGwUHpvYOIpfLxsVuQV
 EIOQ==
X-Gm-Message-State: AOJu0YxykcKaZW4zWJqAJtG9QxLueKxngPldaG6hm+snpzAk1hzIPCmZ
 t1/B5s4yD20CrSbEHHlpa7U=
X-Google-Smtp-Source: AGHT+IEd95KMby+FaKu8/bxssdUJwSuxQqijxRBzUkA6Qa5Imunn62jJCrDzhGREmY0J6EUzJfPCKg==
X-Received: by 2002:a05:6808:1411:b0:3bb:c599:e3ed with SMTP id
 w17-20020a056808141100b003bbc599e3edmr867056oiv.17.1704957696423; 
 Wed, 10 Jan 2024 23:21:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:70e2:a0a5:5166:fbbf])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056a00098200b006d99056c4edsm464983pfg.187.2024.01.10.23.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:21:36 -0800 (PST)
Date: Wed, 10 Jan 2024 23:21:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] vt: remove superfluous CONFIG_HW_CONSOLE
Message-ID: <ZZ-W_WAmGuOU-Bbg@google.com>
References: <20240108134102.601-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108134102.601-1-lukas.bulwahn@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 02:41:02PM +0100, Lukas Bulwahn wrote:
> The config HW_CONSOLE is always identical to the config VT and is not
> visible in the kernel's build menuconfig. So, CONFIG_HW_CONSOLE is
> redundant.
> 
> Replace all references to CONFIG_HW_CONSOLE with CONFIG_VT and remove
> CONFIG_HW_CONSOLE.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> I think this patch is best picked up by Greg rather than splitting it
> in smaller pieces for m68k, amiga keyboard, fbdev etc.
> 
> Greg, if that is fine, could you pick this for the next merge window?
> 
> I was also considering to rename config VT_HW_CONSOLE_BINDING to
> VT_CONSOLE_BINDING, as the dependency is on VT, not HW_CONSOLE, but
> at the moment, that seemed more churn than value of clarification.
> 
>  arch/m68k/amiga/config.c        | 2 +-
>  drivers/input/keyboard/amikbd.c | 6 +++---

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
