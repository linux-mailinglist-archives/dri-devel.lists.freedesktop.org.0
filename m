Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF81B16AF9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB69F10E46A;
	Thu, 31 Jul 2025 03:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d208GFI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E9110E46A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:52:36 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-61589705b08so959730a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753933954; x=1754538754;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WGNWExXll/J0aYsizYZXNM2okZjvNKQEHFu2OQuymMM=;
 b=d208GFI1Ng4GxpvJu0NiyoU4mJem/GEpMOZWB9p8URlVXHrDg9QG+IpR2FFh+VTFCg
 HR13qvvWDxgnLFyXr19LyOVU7G5doL/ScM4Sn8Jx0qfs5a3YcigZpIY6VkcDEF5t2IGG
 iY4oU9Ba6R0PxJ1LCf22X4kWuuvBQiijD+Mk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753933954; x=1754538754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGNWExXll/J0aYsizYZXNM2okZjvNKQEHFu2OQuymMM=;
 b=ZnrV665HYSaAZGRP1jkEsalZw6SrvgddK9hjGpGI69EPiptHl7sPa5jESoTTAJH8tP
 PpRRcJLEqfhfP4Pwe5C7SmCFiUafUf7E+GTCawCQomVhRmNHKIK5ooYg6XPEqejTXSRu
 HgjJj1xXcEdL0asgg9iD2JjeGfVOqBrANMkDUKqWacBvaTJB4ICSKeQmmn6NtargEAsR
 V9kMOKhwpaWFhiFEAhUsHU7JB6lcRxB3d9N3FviMYgfNBZhMWPByYjdtn9+MfAoJTWR+
 PVcemFMvLMu0apT2OU8UywZ6MYb+Cuzrr/SEapCg1tVyD1UKRgfPff2BE0KBtJmoS72e
 6uTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZS6D0t5KU92DnkvhWZ/Klrd/yRJPnJdl34Z0cgHJd5rLhUgXw/AOtZQGE3jhQdDrQnShh+sK9B50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSmT39r1kA90s6Uzk7QaThyQvak31PonarCDh5sGnb7FMdUufR
 Db5U4nVFOWa59yWK50UlaKWdvHOW51e+Zs2Gpa+cOiGm+542CMj/HlpHou0rOzIPbnDTsJJvogY
 R9KabnPE=
X-Gm-Gg: ASbGncuKa2xTbnfWEtXadKrVUzEh3pf+SrA/T+qn+W/fWk03IArm0u7YLt9+YAOhYcV
 8au4rhTWQldQUzqR7BtxahsyNm/7KR5bxkI7Vr1A73WIkvaz9KIZQxrtEs8PDjRtpSfmtIFqPZ9
 B0vcEt+nAdkimM+wb84ekx0vLfGgr3YCBIdUXG8sIv5w55etUwB+vQojh9HwJyBaZkzwoOu9Chc
 FSXFJx91HYm77BFZ+rqzlUWQHwDvHHvMdrYjr2o181+Q3hT0rfWHgUBKcAIcO1wINBSN1Wjrfkg
 15peBmBjxnDIUxXPqDuD+pY9nn4paMqxPQ0jhnSSwm/+QAHw3uv443TCv670TFgiaTuH7R6UaFk
 Mk4XcP/wOzKNAGXdgOp2WQhM0n0bw4tALYVEmG2NNfny2Kqn627ZCXEArp+/fPn1zUbxtQpWs6u
 xujSNvSjM=
X-Google-Smtp-Source: AGHT+IHJf7WuX8WaqFzO/E1MSuby0Gjy+oPvzDHtGijHvOwn3J5lHSn08To0rIoXYqh1lE2Fa37WeA==
X-Received: by 2002:a05:6402:234c:b0:615:aa8e:a19c with SMTP id
 4fb4d7f45d1cf-615aa8ea47bmr1017746a12.32.1753933954654; 
 Wed, 30 Jul 2025 20:52:34 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9113e40sm472498a12.57.2025.07.30.20.52.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 20:52:34 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so715049a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:52:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIBHQuDPC1nMmma2YVKDr6anL38xQNcKFioHiE7mKKThu33ToU2F+nKEfZCXJTeFXV71ky6+FHJ8k=@lists.freedesktop.org
X-Received: by 2002:a05:6402:1506:b0:60c:4521:aa54 with SMTP id
 4fb4d7f45d1cf-615870b422bmr5699057a12.17.1753933953132; Wed, 30 Jul 2025
 20:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAPM=9tze2EcWTyi7VZxEY6Ys+YSrep4U15TtizZghFSD6eWjsQ@mail.gmail.com>
In-Reply-To: <CAPM=9tze2EcWTyi7VZxEY6Ys+YSrep4U15TtizZghFSD6eWjsQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 20:52:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wimp=a1zH4goKuXjXGMKUsuQDtB-TVNM+JRzk1ht6+c9Q@mail.gmail.com>
X-Gm-Features: Ac12FXz8hE3dOTilhZGKs-EhjAf6PWZR_3hmZLP6VtUZeZKi2A2bT3LmLcgkVT4
Message-ID: <CAHk-=wimp=a1zH4goKuXjXGMKUsuQDtB-TVNM+JRzk1ht6+c9Q@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
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

On Wed, 30 Jul 2025 at 20:47, Dave Airlie <airlied@gmail.com> wrote:
>
> Is that the Polaris card still?

Same old boring Radeon RX 580.

lspci calls it "Ellesmere", don't know about the Polaris codename..

         Linus
