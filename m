Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3864C723B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538F310E66D;
	Mon, 28 Feb 2022 17:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600F210E66A;
 Mon, 28 Feb 2022 17:11:53 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so19509966oos.9; 
 Mon, 28 Feb 2022 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KGfWS2uYCkztuiaNud+EqPaLd7nOZ8rEKRJvpNL/n84=;
 b=T4bcy7EujoEc5qGaA6AuM+2wYt10TmaSOeZMXzIzMv0qQ6R2SXhQXnva5M6/LCj5d8
 Qy3M1FFi7wzIZUc0+q2bMfUq4Ljb19T6r321wAFsW9Z8AMKk9VZdcla+ck6+W3EKgbYR
 0GaaY6ue+YxcW6+e3Qh5cnYIgVTvma8OXXRCnkIfpmFwng5yhUJFXqkXP9spy42S5FNb
 CdFAU++R//p0oD7/cp85VmS29bLjPrygf01YznDEmu7jn7Ktt7LIE91awrVyNGR8PZKe
 CVYgtKlQABJB59WYfNDGP3ZMsxIemQEvyXn5jit3XcfG82FgdjGr8OMZFHKg9NvhQyRT
 3PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KGfWS2uYCkztuiaNud+EqPaLd7nOZ8rEKRJvpNL/n84=;
 b=ZHAMcLJXGUpO/Uyg+trtl6+xEKplZeFbikbQZCdi+UwrvMJrSVnCsYxuDBhlQ8yAqq
 JvFx/+IafMivjjDiu0QglCos6IDodtwi0Qr2fE23kzGTAf7f5YrNGNy91xEQFji6eMT6
 6oIcFrKd0n2JlwEcOFK5cDlx1szT12Fh61FWMEY5I53xJzNqazgcSsUlu8NMBoSQrzha
 LPm+cZA1o3K3BuCdqFZdswNAscyrwQbNQrYzd2KeSIgGNViWXJbZoHiPwDjUonGtsJj/
 mgv7yEWycUnevRsPVFv+4Ws7+N1+bHk2EUEypUonXn51ra0ZM1oyKTGcAFfxvJdxMWT7
 gXtw==
X-Gm-Message-State: AOAM532mU0tuoIqre8ZIptIZjgDtC7HcaDu3+u4yyh7tar8g+t5qNLUl
 y15UhiW3EiGpSLk2zVn4PNMUsEx484IfI+WVUq0=
X-Google-Smtp-Source: ABdhPJw4oSZ/ldoOMl2FkUDczAIOPMjGLMq24FAhG3wvyuwQnb8PORr1fqMZYM+VPIE2ghXuEkGMXzqLoJ4CHpFL7ho=
X-Received: by 2002:a05:6870:1b85:b0:d6:feda:913f with SMTP id
 hm5-20020a0568701b8500b000d6feda913fmr1210825oab.123.1646068311211; Mon, 28
 Feb 2022 09:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20220225183535.5907-1-alexander.deucher@amd.com>
 <CAPM=9txx5hq6ystyMqYx6Jx=VHRLoeXbrL0fDW5vHM5c--E1Jg@mail.gmail.com>
In-Reply-To: <CAPM=9txx5hq6ystyMqYx6Jx=VHRLoeXbrL0fDW5vHM5c--E1Jg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Feb 2022 12:11:40 -0500
Message-ID: <CADnq5_PZoNEiKUgycUWLiDEYyadw2Li5XpeOCOrtTi7hi=GxCA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.18
To: Dave Airlie <airlied@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000f7508905d917245d"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f7508905d917245d
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 1:55 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Sat, 26 Feb 2022 at 04:35, Alex Deucher <alexander.deucher@amd.com> wrote:
> >
> > Hi Dave, Daniel,
> >
> > New stuff for 5.18.
> >
> > The following changes since commit b63c54d978236dd6014cf2ffba96d626e97c915c:
> >
> >   drm/amdkfd: Use proper enum in pm_unmap_queues_v9() (2022-02-17 15:59:06 -0500)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-02-25
> >
> > for you to fetch changes up to 111aeed25ec6bf4d5b4a7b4cb5654f002ba9f795:
> >
> >   drm/amdgpu: add gfxoff support for smu 13.0.5 (2022-02-25 11:51:18 -0500)
> >
> > ----------------------------------------------------------------
> > amd-drm-next-5.18-2022-02-25:
> >
> > amdgpu:
> > - Raven2 suspend/resume fix
> > - SDMA 5.2.6 updates
> > - VCN 3.1.2 updates
> > - SMU 13.0.5 updates
> > - DCN 3.1.5 updates
> > - Virtual display fixes
> > - SMU code cleanup
> > - Harvest fixes
> > - Expose benchmark tests via debugfs
> > - Drop no longer relevant gart aperture tests
> > - More RAS restructuring
> > - W=1 fixes
> > - PSR rework
> > - DP/VGA adapter fixes
> > - DP MST fixes
> > - GPUVM eviction fix
> > - GPU reset debugfs register dumping support
>
> (this time keeping cc).
>
> ^ this seems to conflict with the removal of reset_sem or something in
> that area.
>
> Can you trial merge this to drm-next and send a fixup patch I should
> apply with it?

reset_sem moved from adev->reset_sem to adev->reset_domain->sem.  See
the attached diff.  I also pushed a sample merge if that is helpful:
https://gitlab.freedesktop.org/agd5f/linux/-/commits/drm-next-amd-drm-next-merge-5.18

Thanks!

Alex


>
> Dave.

--000000000000f7508905d917245d
Content-Type: text/x-patch; charset="US-ASCII"; name="semaphore_fixup.diff"
Content-Disposition: attachment; filename="semaphore_fixup.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l06yf51m0>
X-Attachment-Id: f_l06yf51m0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCmluZGV4IGRmZWVk
NjQxMGY3OS4uNDI2YjYzZTRmMWY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZWJ1Z2ZzLmMKQEAgLTE2NTEsMjMgKzE2NTEsMjMgQEAgc3RhdGljIHNzaXplX3QgYW1k
Z3B1X3Jlc2V0X2R1bXBfcmVnaXN0ZXJfbGlzdF9yZWFkKHN0cnVjdCBmaWxlICpmLAogCQlyZXR1
cm4gMDsKIAogCW1lbXNldChyZWdfb2Zmc2V0LCAwLCAxMik7Ci0JcmV0ID0gZG93bl9yZWFkX2tp
bGxhYmxlKCZhZGV2LT5yZXNldF9zZW0pOworCXJldCA9IGRvd25fcmVhZF9raWxsYWJsZSgmYWRl
di0+cmVzZXRfZG9tYWluLT5zZW0pOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKIAlmb3Ig
KGkgPSAwOyBpIDwgYWRldi0+bnVtX3JlZ3M7IGkrKykgewogCQlzcHJpbnRmKHJlZ19vZmZzZXQs
ICIweCV4XG4iLCBhZGV2LT5yZXNldF9kdW1wX3JlZ19saXN0W2ldKTsKLQkJdXBfcmVhZCgmYWRl
di0+cmVzZXRfc2VtKTsKKwkJdXBfcmVhZCgmYWRldi0+cmVzZXRfZG9tYWluLT5zZW0pOwogCQlp
ZiAoY29weV90b191c2VyKGJ1ZiArIGxlbiwgcmVnX29mZnNldCwgc3RybGVuKHJlZ19vZmZzZXQp
KSkKIAkJCXJldHVybiAtRUZBVUxUOwogCiAJCWxlbiArPSBzdHJsZW4ocmVnX29mZnNldCk7Ci0J
CXJldCA9IGRvd25fcmVhZF9raWxsYWJsZSgmYWRldi0+cmVzZXRfc2VtKTsKKwkJcmV0ID0gZG93
bl9yZWFkX2tpbGxhYmxlKCZhZGV2LT5yZXNldF9kb21haW4tPnNlbSk7CiAJCWlmIChyZXQpCiAJ
CQlyZXR1cm4gcmV0OwogCX0KIAotCXVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7CisJdXBfcmVh
ZCgmYWRldi0+cmVzZXRfZG9tYWluLT5zZW0pOwogCSpwb3MgKz0gbGVuOwogCiAJcmV0dXJuIGxl
bjsKQEAgLTE2OTksMTMgKzE2OTksMTMgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jlc2V0X2R1
bXBfcmVnaXN0ZXJfbGlzdF93cml0ZShzdHJ1Y3QgZmlsZSAqZiwKIAkJaSsrOwogCX0gd2hpbGUg
KGxlbiA8IHNpemUpOwogCi0JcmV0ID0gZG93bl93cml0ZV9raWxsYWJsZSgmYWRldi0+cmVzZXRf
c2VtKTsKKwlyZXQgPSBkb3duX3dyaXRlX2tpbGxhYmxlKCZhZGV2LT5yZXNldF9kb21haW4tPnNl
bSk7CiAJaWYgKHJldCkKIAkJZ290byBlcnJvcl9mcmVlOwogCiAJc3dhcChhZGV2LT5yZXNldF9k
dW1wX3JlZ19saXN0LCB0bXApOwogCWFkZXYtPm51bV9yZWdzID0gaTsKLQl1cF93cml0ZSgmYWRl
di0+cmVzZXRfc2VtKTsKKwl1cF93cml0ZSgmYWRldi0+cmVzZXRfZG9tYWluLT5zZW0pOwogCXJl
dCA9IHNpemU7CiAKIGVycm9yX2ZyZWU6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKaW5kZXggNTM5NmE5ZjE4NjVmLi5jYTg1NDYyNmExMDggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTQ3MjEsNyArNDcyMSw3IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X3Jlc2V0X3JlZ19kdW1wcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAl1aW50MzJfdCByZWdfdmFsdWU7CiAJaW50IGk7CiAKLQlsb2NrZGVwX2Fzc2VydF9o
ZWxkKCZhZGV2LT5yZXNldF9zZW0pOworCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmFkZXYtPnJlc2V0
X2RvbWFpbi0+c2VtKTsKIAlkdW1wX3N0YWNrKCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+
bnVtX3JlZ3M7IGkrKykgewo=
--000000000000f7508905d917245d--
