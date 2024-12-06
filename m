Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253239E7802
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9970710E407;
	Fri,  6 Dec 2024 18:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="OijmgK0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CCE10E407
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:20:27 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-21561af95c3so20198465ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 10:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1733509227; x=1734114027;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2ERC5fzimWkobKffa97cN4PlwdlN14QHApFaE7AagRo=;
 b=OijmgK0s1l6N0uwtc+N0PoTTR1BwgI7z1k5ChVSXZ7PXoP1g7aKZXlP19xxtJhuycQ
 YPQtawl/sdAVNpXhw3d3vpBRQ7ZFCWIjR4ccGi6AeTTs10Dw815NOIrTEHwtCY4SgQao
 RSTuGclRK4wyAByCllUK8lSpHDLxUcGP7H6R6QfQ/0Cewrm5Vt1ho8OobPU6N/ZC/TrB
 yKmeQr9PzpxrjdbgDTPxfS6S3bJIecT59rs1uc5NV5HXWKtrNT2ERalGYJqSBMwY1oG0
 6qmthPsN940gYdAmpAuYKlLb66h3cJWrOD9gFuq7XTMCwNgUmwHtuq34AdjhQsBHmlXX
 lh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733509227; x=1734114027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ERC5fzimWkobKffa97cN4PlwdlN14QHApFaE7AagRo=;
 b=YAGxwLOfoiWYYt2e/sIXTZFNIcSeKLA+9JlQmMDplpTGdQvKYyHjEpY7R5Yc15d5/Z
 ywxY3+CPoNZrYi6guizUb2mo30duJGB7TXJXwckQdG2XHnG5EiIRhP9YoLfIxArvUQLp
 wnlBZCnPi7NObAVDGG22h+VoSVwddLq3mWW3OWiGh0zuAep5xEj/l939X9q07oBrz/fa
 AvqoyBuKVfUr6DAc0NKrfA8q+kcdbSWepg5C9C48Cn9XZieg3NzLkoKqnD1oRaQgUGF6
 dIwNEBso7m0qgDgZhAH+WAYhqocZxU+KD6W0Zf+cu4SBSC6P6uxUm8QSUf9vqHstvBfN
 nOQQ==
X-Gm-Message-State: AOJu0YwSUEluVBsqXllmVe2/Wyxu1lEVMm1cehvy0M/x61RJxxiwlTqP
 14sPNEdR3WjDqUKjmuCr37wPx74ByPt1jlclJQs5WCzAV3IaVOMM9brYie0QY3UnmHRz6TNjmHc
 gbveQbNo/1wboAkQAwEyWWRgiMui0daw7ykl2oaz3UoR46oOulw==
X-Gm-Gg: ASbGncvYTN1xubHBYlY0iXYehS3oup43c361/mAOa1q5FrecoS04W755hvTvarc8KhM
 16aW0MaBQL4DKJisPLgl13uR9ocZ9RNCr
X-Google-Smtp-Source: AGHT+IH0BAso9I1gktFTjt8xfLL9WKmgSHkglghyAUPh4yYXBnunhqy3dbiNRFfN/domgmNPWsOdPaA9s1lo3vBnUw4=
X-Received: by 2002:a17:902:db12:b0:215:65c2:f403 with SMTP id
 d9443c01a7336-21614d456bcmr50878815ad.17.1733509226851; Fri, 06 Dec 2024
 10:20:26 -0800 (PST)
MIME-Version: 1.0
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <c9e86bf2-1d97-87bc-e170-4525d304d89d@amd.com>
 <CAHbf0-Hb=y02=YX3O6Hb7yYH8922sPchWn1YYADNFSrzonoSzg@mail.gmail.com>
 <7cf3e84d-002a-57cf-2412-f4aa2ed0b2ae@amd.com>
In-Reply-To: <7cf3e84d-002a-57cf-2412-f4aa2ed0b2ae@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 6 Dec 2024 18:20:15 +0000
Message-ID: <CAHbf0-HcDaQZhZ_N7u9HC1mz9XtAYd4J_-tVtBgcLOrKoQ4ONw@mail.gmail.com>
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Zhen,
 Max" <Max.Zhen@amd.com>
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

On Fri, 6 Dec 2024 at 18:13, Lizhi Hou <lizhi.hou@amd.com> wrote:
>
>
> On 12/6/24 09:52, Mike Lothian wrote:
> > On Fri, 6 Dec 2024 at 17:10, Lizhi Hou <lizhi.hou@amd.com> wrote:
> >> Hi Mike,
> >>
> >>
> >> How did you install npu.sbin.1.5.2.380?  There should be a symlink
> >> npu.sbin which points to npu.sbin.1.5.2.380.
> >>
> >> https://gitlab.com/kernel-firmware/linux-firmware/-/blob/main/WHENCE?ref_type=heads#L2719
> >>
> >>
> >> Thanks,
> >>
> >> Lizhi
> >>
> >> On 12/5/24 07:44, Mike Lothian wrote:
> >>> Hi
> >>>
> >>> I needed to add the following to get things compiling for me
> >>>
> >>>
> >>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>> index fe684f463b945..79b9801935e71 100644
> >>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>> @@ -6,6 +6,7 @@
> >>> #include <drm/drm_device.h>
> >>> #include <drm/drm_managed.h>
> >>> #include <linux/bitfield.h>
> >>> +#include <linux/interrupt.h>
> >>> #include <linux/iopoll.h>
> >>>
> >>> #define CREATE_TRACE_POINTS
> >>>
> >>>
> >>> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
> >>> from npu.sbin.1.5.2.380 to npu.sbin
> >>>
> >>> Cheers
> >>>
> >>> Mike
> >>>
> >>>
> > It's just a clone of
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> > in /lib/firmware, there's definately no symlink in
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/amdnpu/1502_00
>
> Did you build a package (e.g. make deb) and install it? I saw the
> symlink with the generated package.
>
> dpkg -c dist/linux-firmware-upstream_20241110-135-g06aea4d8_all.deb |
> grep amdnpu.1502
> drwxr-xr-x root/root         0 2024-12-06 10:05
> ./lib/firmware/updates/amdnpu/1502_00/
> -rw-r--r-- root/root    246656 2024-12-06 10:05
> ./lib/firmware/updates/amdnpu/1502_00/npu.sbin.1.5.2.380
> lrwxrwxrwx root/root         0 2024-12-06 10:05
> ./lib/firmware/updates/amdnpu/1502_00/npu.sbin -> npu.sbin.1.5.2.380
>
>
> Thanks,
>
> Lizhi
>

Hi, it looks like I've been lucky in the past not needing anything
with a symlink "make install" fixed the symlink, thanks
