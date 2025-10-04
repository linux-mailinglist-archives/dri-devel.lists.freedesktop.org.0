Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41DBB8858
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 04:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D497D10E1B4;
	Sat,  4 Oct 2025 02:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PlIKACQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D18810E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 02:17:23 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so519583466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 19:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1759544241; x=1760149041;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2vTYpOQNaxJxWiyEpSzZFbd7xL7UFgeW54OBL7psisU=;
 b=PlIKACQUWSHaYQNmieGiBOrIrWAQqPckWxsphfxFRD/HHb07473PPM/HgNzCUYPOnT
 kH6fwVD8C3nveEjnQDTNRJE3mNULFFpb44Tt/FVIGOm2/rTCFPISzGqanlx7yVVCl/fY
 t5VOXzYvrBJiQS/SQvBNINPMet0RZaC8p4X40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759544241; x=1760149041;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2vTYpOQNaxJxWiyEpSzZFbd7xL7UFgeW54OBL7psisU=;
 b=hJ9d6B+aqEmDM6NyZUabwLstMjJyVNyfzru2pZ6gh0sGMMsNQY0XSxaZOKdIcGZYw+
 Dc91lWab5vceGTiB9rdeeOHrVz74gVey9/RmZTNKEIGV9jz5qlD+50lPZuf4XPTXSWEC
 UQl8om7E25XfZukfytvf8YQn4AkZCzDFFpXBnKH7ijQyOreKmSjtyrNXIwP6OMl2ryEr
 ayFTN4AkYziK/pQfDVK+y3y/h7tQ9H0yyOZebNXZtdTCJ1OECpxpx0WEcIOcY+YlG1ew
 Rbxz8sT1sWQq7/qfx5ZiM0Svylvb056gmwOmGXLlWfR5LuKv0MwC7HU3gdAy2FAGFeIk
 B36A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPi5RHdFA3XDRLFvynKyZ6/nVa0G1hYtPUTbLzQfW6So/EOBKJDA2Ri2WXuMnqVBGa65jIC5QtrtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/yF31IYuR0Q7MGIQ04cLPguykuxN3hok9rz+fLAt8+ohxJKPg
 4YryvEopTZbMUjkNugRaZJgW0PK+iyVPtw4B7Xj8wSHs1bAfFgK+wtM+MsIzj5MpsjGjosWxbjZ
 Mx2bPVqg=
X-Gm-Gg: ASbGncuG+DtKoxDYs6tt3ojDVnLrvSDR7qTtvvLU8+ds9xPs+HVP6fZ+rT9rDxYpH6V
 gCSI3OlZKavVAOGckyD6IXgpSAjhdOe9AFaFnP6mSi1QPXw/bN+UsDG3J4jt+kUGTocPNgP0Hi/
 CJTOLiT2iECUX9JLpgOs0emUafukuxvYNKVidQnpC5EEABdXm9ag62MY+3K0p/Mu3gQb4gBh1cn
 sBQrpsA/pSAOIDx9iHtrJRlWYbbdfKtdHWo7JPnlygiEIX0Nn9bpxAVw19r2+UE3XYG3UMvmaaw
 GMvCGDXNVtiiUMlclKXav6U+/FmTKlU3UCymGS4N7jFL6mSYJIq42o84GBGsPhZltXUdnDnQEZ8
 9oWJWbWyXCeAlePArJE3Tcgy7EytIF5DAEb8w44sHfdQRMjiJth3Z3HQFsCj9j17C0HW+BIZkhv
 WKWLBUI/NOM+FvTr5Xj9aG
X-Google-Smtp-Source: AGHT+IEAnGriSkeS4zQ7TTV9RJNzXsrsVdWGv8c7yUptT5QmvRmpWrZsIhMwjK1U5TU8DJobyRSLJA==
X-Received: by 2002:a17:907:9722:b0:b49:a362:323b with SMTP id
 a640c23a62f3a-b49bfaa6df9mr645942166b.0.1759544241167; 
 Fri, 03 Oct 2025 19:17:21 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b5acsm574980966b.60.2025.10.03.19.17.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 19:17:20 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so519581066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 19:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUNEFp3LfWWfnElIx6FH/VI7UjGDuZZOUqLzLyUHoJ41OGXwd62jtguCdiR0KRtFHHxQeBqgZI4IKA=@lists.freedesktop.org
X-Received: by 2002:a17:906:c145:b0:b40:f7dd:f8ea with SMTP id
 a640c23a62f3a-b49c47acc78mr653224566b.31.1759544239925; Fri, 03 Oct 2025
 19:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
In-Reply-To: <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Oct 2025 19:17:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkdbFkeZdV3-wFUEcs8JXy=066gNNhTjh5atmurTVqrg@mail.gmail.com>
X-Gm-Features: AS18NWAjFli5et_N0xki74y6xLLEIGirelL5EkqeXVth5ogXvBlNcKffgVMRK6Q
Message-ID: <CAHk-=whkdbFkeZdV3-wFUEcs8JXy=066gNNhTjh5atmurTVqrg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Dave Airlie <airlied@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Sima Vetter <sima@ffwll.ch>, 
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

On Fri, 3 Oct 2025 at 18:54, John Hubbard <jhubbard@nvidia.com> wrote:
>
> The main complaint with rustfmt is that it is extremely twitchy and
> unstable with respect to one-line, vs. multi-line output.
>
> *Especially* with "use" statements.

The reason I'd like to fix the rules for "use" statements in
particular is that they do get a rather high rate of conflicts, and
then the "multiple entries per line" is actually very annoying
(because the merge turns into a "figure out small change within a
line" rather than "one line from side A, one line from side B").

And that's not because "use" lines are bad - it's actually pretty
natural, and is very similar to what we see with #include lines in C
files. Those too get much higher rate of conflicts than normal code,
and it simply isn't a problem: the conflicts are trivial to resolve.

Because unlike normal code where different people typically work on
different functions etc, the header includes - and for Rust, the "use"
lines - are kind of that shared area where everybody who makes a
change does so in the same place.

So conflicts in that area are normal and expected, and not generally a
sign of any problem.

But then that "small-items" rule makes for extra pain in this area.

Is it a _huge_ pain? No. But it's an unnecessary annoyance, I feel.

IOW, I really think "use" is fundamentally somewhat different from the
other Rust cases.

            Linus
