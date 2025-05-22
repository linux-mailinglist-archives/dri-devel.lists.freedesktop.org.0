Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97EAC0558
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B83910F879;
	Thu, 22 May 2025 07:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZj7ZuNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5716C10F83B;
 Thu, 22 May 2025 07:13:39 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ad5a11c2942so421412466b.3; 
 Thu, 22 May 2025 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747898018; x=1748502818; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G5xPPxipRjhLVKYNh4T8GoP38y7qQ5WrJ1FmZpjqYw4=;
 b=BZj7ZuNKaiAZqu/7qn6fYmfzMwqG4AQIzPViI6TvDY69AhUaqx8yKbBRjev/I+a3cI
 sB0w/OmczLUH439fMa+hMG5HKEv0l124WjcPW1mR1LpEQQOYqcJkTwoRHnCFTn2PV6EI
 UZASHGT1K42l1xpRfsqNWUfzCHNwhrEsgyQWyLjv85s/loSKL3L3Tg3zKciHpr4E29sW
 KsOAJdXoRR+HHVBF9YmUFIpWHI6ycWSRJE0WJb8gQCd48dVzjFZrozh5wjzaiojkBnP8
 AtFc0ign9BaxtBcFeECKXuLrz168ovdAR2QSrJW10kKRLU3H95QRX4e+Am6nrsboRCi+
 ETyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898018; x=1748502818;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G5xPPxipRjhLVKYNh4T8GoP38y7qQ5WrJ1FmZpjqYw4=;
 b=UoV/CbLzhEif6fl30ozfzOZgEQLWZ/1OMkaCgksOynX6CfLPzm7g/AT9GggVauvMCc
 4+xA1MyvhLbs989jjY2HqOcgFMe39t8pEF8Qten7ktojZzpzoU+XC9yYYWAlJJ/W6PAF
 J7hwN2E1/lQMN2voHgI1kXtQcPlOks47tpYVLZOziKujrvN4v9UgsQEvJTlv7jeeJ43d
 /ihrFJ72dFLkwDBALppi0JN9CAb3pYYiKVI+DQOBfJkS1VTnfKAKSQ9wzQPz7NT8YAtY
 UcT/cxoMT0BvdedDkcM8qmUoZWAnur1D1U1HIXp09HrmZ1HG0aqR2SKlsGqOgK68RkzA
 uOaw==
X-Gm-Message-State: AOJu0Yx6/rphGFISSUPmadtMSppSBWhsLNCH1YbFfUmzKKARdKzTtW5b
 RP0jXevsZdFHn7j0Q3wE8hd1NBvUDtAXGtO/bCsNLRU1tMuG0Xf7Hc2+pKl/twhlVsrp8mDLqZc
 rb/DKDxJQOK6ECFkDGNGwCx6H9zyYVEj5sB7KXyg=
X-Gm-Gg: ASbGncu2zLLIRbVAd5gJuM2X81E7hCqw+ojnT9ZFoZBPDkzPSHpF96IzMgGO5SxzOUK
 mOJ6CAkUiawRZ1+vM0RjG2cwOw4b/U/7ONUcC62afrXcmO5M3hFhPkbOPlxUWpHJfg67NbxC7o4
 rFA9ozOhFTFo138YneyOPEZhbS/SJ//cstFHppJUQSqA==
X-Google-Smtp-Source: AGHT+IGFm07Z8k1qQM0PxTPnPSfKKZAs0tA6x4E01IclheVsHTEYFVWPfUu0hMIzdQQTgqD8VFS7C4W7ot1mFAwNh1w=
X-Received: by 2002:a17:907:7205:b0:ad5:10d9:9061 with SMTP id
 a640c23a62f3a-ad536ffbae7mr2685246566b.54.1747898017545; Thu, 22 May 2025
 00:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250522065519.318013-1-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 May 2025 17:13:25 +1000
X-Gm-Features: AX0GCFuvw62JpaYKIrpfAJhfbMdVp2Zj_xfPaXUJlPUnltmsZpLtHEzTJGAB-hI
Message-ID: <CAPM=9ty4dE4w50_JiFD=C78=aDHTmRuMuCTzGqPqy_=_y_ksEA@mail.gmail.com>
Subject: Re: iosys-map: refactor to reduce struct size
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
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

On Thu, 22 May 2025 at 16:57, Dave Airlie <airlied@gmail.com> wrote:
>
> Hey iosys_map users :)
>
> I fell down a bit of a refactor hole today, it was just random and
> sometimes you just have to let these things run their course.

I've put the tree here, and I realised I sent the patches, but when I
rebased onto latest drm-next, there were some new users.

https://github.com/airlied/linux/tree/iosys-map-rewrite

This just fixes up the new drm and sitronix users I found (or missed
earlier). There might still be others around.

Dave.
>
> I noticed iosys_map has a 7-byte hole in a 16-byte structure, and
> it gets embedded into a bunch of other structs and it offended my
> sensibilities.
>
> This series makes iosys_map be 8-bytes, using the bottom bit of
> the void * to store the is_iomem.
>
> Patch 1: adds new accessors to start hiding internals
> Patches 2-7: refactor all users in-tree to use new internals
> (hopefully got them all)
> Patch8: moves the internals around to catch anything not in-tree.
> Patch9: reimplements iosys_map as 8-bytes by hiding the is_iomem
> inside the pointer.
>
> Dave.
>
