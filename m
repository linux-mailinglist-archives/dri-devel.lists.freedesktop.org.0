Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412A47BB83
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 09:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F9310E14D;
	Tue, 21 Dec 2021 08:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD6E10E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 08:11:37 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id o63so10042098uao.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 00:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TB3EgKnQ6cDDwbUNjEM7H+wsTNMcb9wXt6YvS3W4ql8=;
 b=yXA1rVgDTUdFnBCeZATKdYwe9vtU7xoSyUDzDn191BP7wl23xy8TLQRqgj7kgP5TWT
 1PFGPMKJu9LmwiqhItl6G35FifUVrXC2lHNn9GioT0rhvOKG7TycOKjkwUz5sr5XWwDr
 Bh2nDsgBl3tjANDKWVCOdIRwBTdB9AOFZ9kBvbRIhC8TKTmI/vYbnDwFBplSkwo6h03B
 FZRghI2hvV2iKvD/NViGBPbsaoE9bIB20a9GGMCMjPw6v8r2fMngWOy1+DJL06DrIl8g
 GoHES12cJ0nvpbV1YmS3ObUmAmiMiVbRShbNcbq+QWRDXZ90cYqxa4BgNpmzGJNc5HTr
 dOKg==
X-Gm-Message-State: AOAM530cUhGZ1UjJke6ID6432tlDU5AmXRPm3Pbs5qufPyn7rfmnlJwy
 2eQ3edmPZE3QQpfL3j6453BsScflQUOaew==
X-Google-Smtp-Source: ABdhPJxZvt8N2QQixFx/kq+/nv7JXzJtpeEsbuTGH7XXBqjEoTtTnN4CcYV3F6Mb8A8CUOh5TNezfw==
X-Received: by 2002:a67:f141:: with SMTP id t1mr661799vsm.35.1640074295909;
 Tue, 21 Dec 2021 00:11:35 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id r2sm3715187vsk.28.2021.12.21.00.11.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:11:35 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id p2so22261569uad.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 00:11:35 -0800 (PST)
X-Received: by 2002:a67:2e09:: with SMTP id u9mr653700vsu.77.1640074295303;
 Tue, 21 Dec 2021 00:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20211221004246.213203-1-colin.i.king@gmail.com>
In-Reply-To: <20211221004246.213203-1-colin.i.king@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Dec 2021 09:11:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXN=jjgirX4mTghvYo1TQtW4F+5uMLxHoOFKSXbqk5qPg@mail.gmail.com>
Message-ID: <CAMuHMdXN=jjgirX4mTghvYo1TQtW4F+5uMLxHoOFKSXbqk5qPg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: mb862xx: remove redundant assignment to
 pointer ptr
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 21, 2021 at 3:01 AM Colin Ian King <colin.i.king@gmail.com> wrote:
> The pointer ptr is being assigned a value that is never read. The
> pointer is being re-assigned later in a loop. The assignment is
> redundant and can be removed.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
