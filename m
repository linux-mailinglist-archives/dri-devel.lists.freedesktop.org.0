Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F187C8CED
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2C210E626;
	Fri, 13 Oct 2023 18:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B0810E626
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:14:15 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53db1fbee70so4137547a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697220854; x=1697825654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QcKr/CZetWXeaiAMnijTZoyqZxIstUr2Yy9KcLmxk00=;
 b=k0SCaERcSkJLKc1KcFCyb/+g8uWbYZAn84AUj4EcImpNrN8kRO/lfG0iuCv32XS4pe
 Timc3PPWagwAqqmGOzyv7YdyZxw0mqGOQK8vO4lYjLuOO4VSFToFTiqFh//yReXBiwb4
 TDbX4v64kXgHpociborZLEsfHCly2+st3rSUG8mfUl7btjYRSMteEfe+Ar1rEHPE1/oW
 Yr7+1XFicJYUpcGAspR5wvXdXR5ZicxpLHTS8iRGXWC7XNPsrvKagq1VloXZbwcFrmOV
 ScBSWaYOFajyv8SUXn7CZqpi0prNTXkjJTFSLPQhvvYj7yJbgoBJmvDTxdOvO8qnErA+
 XD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697220854; x=1697825654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QcKr/CZetWXeaiAMnijTZoyqZxIstUr2Yy9KcLmxk00=;
 b=W6eczRO7PBkR2BpETKKo8aHZSDsMdNT3uwtAtEsHC3K09W53m4hWH8FNfYuyW+AaWf
 jWcOR+IWurHCRDN3YV0R36pXjqj0H/ja4E5tFq8dmb5PS0I/k6TpgD0l2e39jKTwqGoX
 lxeNnB4Id8VpMtNe4gKzM1ITEeR++E5uUFRqv0WM4i30OJ1MEbhAFtcMvVbbUhnKBGyW
 XOhWoxFyZ0kQh2k9BRnLzSlKVXTn2gwAj4P578JzbuxnDsOX05nCxdZUdDwHKpyKn9nL
 lHW9XSoPAc1A/KYQSm+ryTMb6h3t58hGHR6FcP6xZVubZ90Bca53OLe963FXxxbh6X77
 pBFA==
X-Gm-Message-State: AOJu0YxhkZo4trtP7bYpB0wiLD3TR1AzPUyiH2pkB9qRO8xJLM1E8+pb
 zfK0QMnkig6keuT5k28x6LQ36veMl8zV9L5qsOWoKOeU
X-Google-Smtp-Source: AGHT+IEtJ5x+F9mrNzc9avM60w7274IkSanoEYkFNsZVZpimqjl8luZlhJSocnsp0jQBDKCWgiF2t/gD7rtoBeBCgsA=
X-Received: by 2002:a05:6402:50c7:b0:53d:ed7a:11f2 with SMTP id
 h7-20020a05640250c700b0053ded7a11f2mr7624692edb.38.1697220853805; Fri, 13 Oct
 2023 11:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231006173205.371205-1-robdclark@gmail.com>
 <CAPj87rNT7rhL_GiSA6GtgcnByKwTmWUsFVMWTRSECz2QydjtMg@mail.gmail.com>
In-Reply-To: <CAPj87rNT7rhL_GiSA6GtgcnByKwTmWUsFVMWTRSECz2QydjtMg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 13 Oct 2023 11:14:02 -0700
Message-ID: <CAF6AEGtS8ZTiDs=6P4fkq9WjxAHbi6Nzr2vNVqiF-JaMqGYqgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Default to UART for logging
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 9:28=E2=80=AFAM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> On Fri, 6 Oct 2023 at 18:32, Rob Clark <robdclark@gmail.com> wrote:
> > ssh logging is the default for mesa, as it is generally more reliable.
> > But if there are kernel issues, especially at boot, UART logging is
> > infinitely more useful.
>
> Hmm, we should still be capturing the UART boot logs regardless. Those
> go into a collapsed 'LAVA boot' section but they don't just disappear
> ... ?

Hmm, I wasn't seeing anything in the raw log, which doesn't collapse sectio=
ns..

That said, I still think uart is preferable to ssh for kernel CI.. we
aren't running jobs at the scale of mesa CI jobs so even if we get
UART flakes 1/1000 (or even 1/100) times, that is an acceptable
trade-off for the fact that uart can still work when things are too
fubar for ssh.

BR,
-R
