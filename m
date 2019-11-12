Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B3F8525
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCF06EA14;
	Tue, 12 Nov 2019 00:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BFD6E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:24:44 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 29so10591810pgm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 16:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1u7+QuAh5HVRp7S6Y9oU83WLcIJ5FzNQRzPZVj2F+ZU=;
 b=Hxkq8HXQ2d4YMO3438jGv3XvRnBttduONoniS/4jjOgWN2/eYVw2nS8QaAsjkMksjk
 +AA+X7reCCD2DigoYm30/+6Lyn/kxgi2dmZleU7x4A4VtzgbiAFoRSohg4OruuafX7vh
 S/WrYj9rGnLV9xU78e7DOY4i8Srx+t7JL8uk+QTBCVcGoOR4vzUnOicoEuqfG/HJ/SEA
 avxhxIgX/RvPPkuhtdwRWsmH/0sqbjtXQ1VFZIIZKT5A9fnL5gjqEIKIHrKyCeQZqGMR
 LolPGS9mpixbX1FE5NRKQ+umxVomuqeFjfmiabavvX3jUjADCvbu0hEDnkhFiN3p+H1V
 Ak8g==
X-Gm-Message-State: APjAAAWmWfVsgQD12ZcjsqhY5AxPB2ufL/Jc7x/8hsl6E4mAhWzoET25
 oLrqk0V5lrbEHKLudDQ+JX3U28kEizvQC6p5OY0=
X-Google-Smtp-Source: APXvYqylhHmZieJYAZ+q2ljRbzMf6zEwsl91aXrQla4Ww5s59cLwG46DTU6rBIGoIo3uQIdjJLqBTC5H7uMJu0AlhTM=
X-Received: by 2002:a63:8f5e:: with SMTP id r30mr32242387pgn.146.1573518284309; 
 Mon, 11 Nov 2019 16:24:44 -0800 (PST)
MIME-Version: 1.0
From: Jacob Lifshay <programmerjake@gmail.com>
Date: Mon, 11 Nov 2019 16:24:32 -0800
Message-ID: <CAC2bXD7Z_P4t+uVHpxiptRPLNg+5frt672n25V-_Dofx02yJyQ@mail.gmail.com>
Subject: variable refresh rate API
To: harry.wentland@amd.com, dri-devel@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1u7+QuAh5HVRp7S6Y9oU83WLcIJ5FzNQRzPZVj2F+ZU=;
 b=o2iGuXLKfObJMuydIrVZdr/eYQXxpdCJ7k1uya3kj2yIXqFNh+HDdy2K9FUe/3b94q
 0gS2kiWO3oxHcHRnyT9UBIv7zof3Acq2GFLOPVBgW55CpppPtYqLdWVUSmcMmzmXqjuB
 tE1UUxjzkDaqFZ6AOPx08W4I/KuwJ2QnJXT5yizbbbYs9sslR7AgBreBcE5dH8Tw0NvH
 EWQ2C+xl6XLEFavFMeOxMaFx3NV0+rd0EWwlhLEmYP9vmp8gPRG81bt86LJSiS2mEa/n
 kCm1odJDpavOq+LgXFlypjRm3sDiVkkpnVUiBEI9N4syio6mVeZtLg1dYIlbymlrA+hR
 Hj2g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0607637464=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0607637464==
Content-Type: multipart/alternative; boundary="00000000000062499a05971b46a0"

--00000000000062499a05971b46a0
Content-Type: text/plain; charset="UTF-8"

Not sure if this was suggested before -- I couldn't find any relevant
threads from a google search:

One solution to the problem of applications submitting a frame scheduled a
long ways into the future then immediately after that getting user input
and wanting to present a new frame right away is to allow changing the
scheduled presentation time of already submitted frames, assuming the
hardware hasn't started presenting yet.

Jacob Lifshay

--00000000000062499a05971b46a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Not sure if this was suggested before -- I couldn&#39;t f=
ind any relevant threads from a google search:<div dir=3D"auto"><br></div><=
div dir=3D"auto">One solution to the problem of applications submitting a f=
rame scheduled a long ways into the future then immediately after that gett=
ing user input and wanting to present a new frame right away is to allow ch=
anging the scheduled presentation time of already submitted frames, assumin=
g the hardware hasn&#39;t started presenting yet.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Jacob Lifshay</div></div>

--00000000000062499a05971b46a0--

--===============0607637464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0607637464==--
