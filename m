Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9283B0F4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 19:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C00710EA28;
	Wed, 24 Jan 2024 18:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09BE10EA3E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 15:34:53 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5f69383e653so55545187b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706110433; x=1706715233; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sF+OHxguRNODCvdH55DenpgBbXkSJhRqehOviUia52g=;
 b=GUHsceM9iQARGUaVERNXVNGOiVzVQdJ7qdAh1w0AQ4FJu9T3LNDSV3zlScDHL8Yk1c
 dci8khxn6wmcsFp7BtNJXDL22hckgU1akIAInHb6iO+rxuuQNie3TV0qcY8O2QImPoru
 Qxc88DAiWTGJsVFPpl+4Jzl5LoxrYOGIvp7SGxT7osq+tUTBSAg9G9xYXrBwXfjZdHDk
 79VeGqGKj3c1+qI5dNR8n2CY42DMBVVyyxwwmg3537ipCHKMA1DVc/4TvzvbWZlnBjro
 7mgZSOZ3aqUPClox0jeqd2Lfs2h9u9EA8PYRlKPHHx7nDE8/ccfe6C/ShS0ADxF2aM/y
 I1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706110433; x=1706715233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sF+OHxguRNODCvdH55DenpgBbXkSJhRqehOviUia52g=;
 b=ud/DmkuiSNJQ4NyOQ/6ZyNM0VMH7s0WV7xqP+eTOrlNXtOcZLQico07pVgfyysO57A
 SL/AHY846OZhWRiGLrBfBpCXr8yaICawH2qvFj5TCly3lhgl+WMYL9xwsCdcXB7gth+V
 tDBl3RDbUkySGzmOEiwoBwP6glfVXfxzcYqyY2LZnefvZ2I9VzNlCBH/uyq9pjtsM4lx
 EEMaKjK42peS81sPqx6+1Haa8X5D6PJnIUujtGsI+7ckSSQ5/1P73i90Nn90TvubyE6l
 BNNk75HrgRLrYG0l0lO8xWiW2BYj+ul/5HRfMGtcQzEM4/9mrgfDog7OpukRYpXAjaQv
 iAAQ==
X-Gm-Message-State: AOJu0Yz+Y/vs17ebFiTD4XcsPdUan6QMv23KaFr/iuSz6Bnlu2bb1or1
 lCrxqXTHnDuBvvhPz0MZrQ20IrpWhdF5kiZuop9qa6Ccj/PiZuZ2T8VaSIim80zQEf0OdGXn6W4
 C2Yv2GMkvNKDQ5cS8F9uekFgGq7s=
X-Google-Smtp-Source: AGHT+IGUS9tuxVIMX25dmxiV7fTiY5eFrs8jLOCRBDlqb/bOIj6etzQYJ1BCdRIcGim1usEdGT+9uK42wTpI2OLXkW4=
X-Received: by 2002:a81:9c47:0:b0:5e8:75e2:9345 with SMTP id
 n7-20020a819c47000000b005e875e29345mr911645ywa.60.1706110433055; Wed, 24 Jan
 2024 07:33:53 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
 <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
In-Reply-To: <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
From: Donald Carr <sirspudd@gmail.com>
Date: Wed, 24 Jan 2024 07:33:42 -0800
Message-ID: <CAOVeLGSczkyhj61T8SZc2cK1Cjy2izV6URVa2422kcfy8ONYFw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Jan 2024 18:20:36 +0000
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Dave Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 7:31=E2=80=AFAM Donald Carr <sirspudd@gmail.com> wr=
ote:
> I am experiencing the exact same symptoms; sddm (on weston) starts
> perfectly, launching a KDE wayland session freezes at various points
> (leading to plenty of premature celebration), but normally on the
> handoff from sddm to kde (replete with terminal cursor on screen)
>
> Working perfectly as of the end of 6.7 final release, broken as of 6.8 rc=
1.
> Sometimes sddm can be successfully restarted via ssh, other times
> restarting sddm is slow and fails to complete.

This is against the Renoir GPU on the 7950x, but also reproduces
consistently on my 7900 xtx.

Yours sincerely,
Donald

--=20
-------------------------------
 =C2=B0v=C2=B0  Donald Carr
/(_)\ Chaos Reins
^ ^   http://chaos-reins.com/
