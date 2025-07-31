Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6CB16B76
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 07:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDB310E07A;
	Thu, 31 Jul 2025 05:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M2K26QpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188010E07A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 05:10:19 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6152faff57eso686221a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 22:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753938618; x=1754543418; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tuA7w177qipht0CdytdjoNMQyoHN844GStBL0h6TTT8=;
 b=M2K26QpIYUUVUx4qOsieYaoU9Gz3AqHPM8uTjZKrjOgzilV34gZaf5P7J2i/E3qOGU
 aV/hhZFHCJhltjqyX2wGdBhlcW5XbRAymRlvhbfKiv7eGorNSD6H9Fx64aGyIA2pGQUv
 gdHF5NWxWrvIjCebYDx9X6MtOcPD3GKMN64gABahCYmXo1dlQppC+cGhDlGWcT1DxAmN
 iDV/NEJQVUBqKTI4QNltRB0bwxLPW8LhHz389cupbrWXwGnugGJ4JG5FNKxanN1hFl+e
 C0KXOQ/EnkbbiQd9cT5YZ45p+Qip9h6xPQ7KIQ5l1n8VO43YnvVRtG8xir0zsUtlpMz/
 ZEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753938618; x=1754543418;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tuA7w177qipht0CdytdjoNMQyoHN844GStBL0h6TTT8=;
 b=hHqCRo9BbYctI7IYnu5w7RWkfT/1i/N1U4Bngpmqo+erQmXavk3hDw+xnVbvvsAnE+
 oMRFlk0vDD9W4rCYvpL1bQ8qmLosqt2+mkNOmgnd4W6K8G+ToaPPUfANnofcaUf62Hc/
 MXPkmdn0hZvIC5s78l4GQqq2rkSaB5tDC8gb7UtVrhrQdU771kw+3K1CIrwsaljZFIps
 pDTEf1mOpxw3aCUuPDNcuLSjcTLpthOaRsgIPGLH/CNL/UACg2nhw981p6qxSbJkdGUc
 g7KG78flOWFP8956tYoc52RMcovriB91HDgBsJJ9nj7/pp7o0YdVHUlMJRXAqcZcpl3t
 Ysfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFsI/ioGkuMVoFlYwsQjfMsbkjKXQJk9N9eTNzlgZ3obnCCta/vr1UpisFR92hLfYirRuKARMBpLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM0biWlEPuKMlUovSkNzm6jzfGVlmLkAczyxGZPbgKrxzXdjiU
 XgV0bUN6Nr2TCjjf85TY0ke5li3t/pQWjNh2sDIe3H/Gq7CPQ3h9zu4e6K5/S/jtWqr47uyWLiw
 nWzgfMsnyRgmrgSXg4vYq2KESSabD+EGPLA==
X-Gm-Gg: ASbGncuqXMfxRKfvNgiwJpwDpIEZHSzBhA96wdfYePk3w3av4POf2i0JYvlkxiy3Igh
 QSfKbifStRJQWlxi9++CAx2rHg4A+vmIYuaqcP43tYvaYyRzc1d2EQ2aNwTbD7ryKAzv4qyOM8F
 L5POPwtGmherDbazgjmbdgsEvCEdnFRiUhmSuY4a7W0NhErS6ODnYf0E+l+2vEZBuH5qj+FkCJ+
 DVo6Q==
X-Google-Smtp-Source: AGHT+IEdZwwZGZh5R0EM0A9nQcuU8F2sGN1Zwy698U3lAVS34NsIuSZl2ZCheD2yAxaJPeCjJ/yrFjXR9zP/EbwdtNE=
X-Received: by 2002:a17:907:d05:b0:ad4:8ec1:8fcf with SMTP id
 a640c23a62f3a-af8fda40367mr804977666b.46.1753938618057; Wed, 30 Jul 2025
 22:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
 <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
 <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
 <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
 <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
In-Reply-To: <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 31 Jul 2025 15:10:06 +1000
X-Gm-Features: Ac12FXyj_-Sg2dQ6mpxY2mBQqpPySgzev8nc6LKsN8JY5M53So2VWDmy-mfI64o
Message-ID: <CAPM=9tz80Lcrp7htw=RECyy6aLumX_FJjz4g_qE_jbj-V9-Hfg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dillon Varone <dillon.varone@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, 
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Wenjing Liu <wenjing.liu@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, 31 Jul 2025 at 14:59, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Jul 2025 at 21:48, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Well, it's one of these:
> >
> >   3f2b24a1ef35 drm/amd/display: Monitor patch to ignore EDID audio SAB check
> >   aef3af22a456 drm/amd/display: Add definitions to support DID Type5 descriptors
> >   d7b618bc41ee drm/amd/display: Refactor DSC cap calculations
>
> d7b618bc41ee3d44c070212dff93949702ede997 is the first bad commit
> commit d7b618bc41ee3d44c070212dff93949702ede997
> Author: Dillon Varone <dillon.varone@amd.com>
> Date:   Fri Jun 20 16:23:43 2025 -0400
>
>     drm/amd/display: Refactor DSC cap calculations
>
> That's the one that makes my machine no longer work.
>
> This is a 5K monitor (ASUS ProArt) connected through a DP connection
> to the Radeon RX 580.

Ah yes that monitor will need dsc to make 5K work, explains why I
won't see it here.

If you can't revert it, it'll probably be a null ptr somewhere below
get_dsc_enc_caps,

Dave.
