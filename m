Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABFDB1D66B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 13:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7F110E004;
	Thu,  7 Aug 2025 11:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PwPd2/L2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0CD10E119
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 11:11:47 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b2c4331c50eso586508a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 04:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754565107; x=1755169907;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CoXNXUKeiOUNFFg2C7vkQ9nmMli8YvVdClg8JNyIxRk=;
 b=PwPd2/L2W5T+RGJhXtTpHUjbepm5p7XhR1+SdMppL9Rbgh/AmRvbEI7JDidCZ7C25X
 ug89I37zNiG6s3V+tawbCObHSNeK7panKh9DBFjJfD9t5/6XSJWpEc2WPGSi8YD7KmZd
 4Ksv+PQ4Mobgg3jQdAljwRuKtlFWl/JF178W9VD3HmjRX+LXb1qKr7EBD1nwAdgjR0KF
 HM/ixCIhJw+ktxWSxQ4DFk+BoLOgaMxmhCoTtVO7JeYQcAyqTNnkY9h42bLfo2u/nwcJ
 ELpZjiBBbtCzc3K7H+Sdqw+hvG0erXcViszApL7R60w56ZA8seMdumbNmuDYqUcdO+zC
 eJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754565107; x=1755169907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CoXNXUKeiOUNFFg2C7vkQ9nmMli8YvVdClg8JNyIxRk=;
 b=BwIp+pIXF413oHiy879mx5Mmx99ui5D8OPD1pTi7D0Nrr+340L0qgWruemn7WNcyHk
 Xg4+580WKiLok1VLx1Ca2qjZQIruQrrR8N3Ayn4eN/GfhBkQCf+e16VdXg+DMY45+BvT
 Jry4yLqDSUgWStc40eZujh7de6zhXVB2priH7DsoDVBcQ0+2grQ8CDFd8vRGGZV0NNo2
 tTegGx9lbT8SeghHBiDMyvC9RuFPuAaw4CSKpho8GSt8utIlKBDXhzOb/1WcNkT4mPjL
 tM7asIKSHxMe169vI7mwb4g6Ywk4azBYCE+AUq9EYlxnJsf81j2MmR+XP/hVflksZrWs
 ox3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJeIWQPBWSgErm6sANCAjTSQsmcnBemRglXTczkmMMG/2l9xSQkFfRTRcvctnLyNOtW8WoFRuDwmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLaor9LZt0+OLZjsFLq2PpJumj1KesOdUk6iA2KrzyTF2zWXmF
 2LBZ1vLnfb93plGZN1jkPC6w9khdEdUaTdu523gwA8fX5KI6mIE2RvDl0Gfl9XShEmmgw09OGPU
 p3WgUn6FJYH/Uad+h/fYTAHz/mmNaz0fokANPyioX
X-Gm-Gg: ASbGnctrW/rlLxZ4rnoGQxYi39kJ7HZozvzI+ph0AAIgvCeTjPPNTksb2+bHFxNp0E+
 xBMjhYOjgl1zjIZT35SsnMnnweY3b330DFibXv/UA5rEh94Ne6YN+viD2pq+8P43mbRsa2IBdzO
 m+0UTiMIgSg2IDXKkerNSY6A/Q+dF0Bg+2mxJlJd1TmlXnqgQHy/GWXPS5iJcSrSuiRlSbEoG/T
 aJUHHxPMEpyw4kNMGvHCNAYIpiwItr0XeXly/g=
X-Google-Smtp-Source: AGHT+IHWtnkQaumsTew0jXS9kaK3+ePJQyaqgUXoTNxp2BPH6vF9Q5lSXC7XsOCAVRCtweFXeukJL89E4f1X03Xzmvc=
X-Received: by 2002:a17:902:f54b:b0:240:8f4:b36e with SMTP id
 d9443c01a7336-2429f30a072mr90455775ad.34.1754565106720; Thu, 07 Aug 2025
 04:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-5-marievic@google.com>
 <CABVgOSnmtcjarGuZog9zKNvt9rYD2Tsox3ngVgh4pJUFMF737w@mail.gmail.com>
In-Reply-To: <CABVgOSnmtcjarGuZog9zKNvt9rYD2Tsox3ngVgh4pJUFMF737w@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 7 Aug 2025 13:11:10 +0200
X-Gm-Features: Ac12FXxEPQeFs5tHqqfxXkjXiWaH8qt7LNAFX9V6D-alLoCQyoAF_FdJ5KU_fBk
Message-ID: <CANpmjNMkcZaZ_dbXdd40dHrD3Wo2muv14ojmz4diwLG68LiFyQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] kcsan: test: Update parameter generator to new
 signature
To: David Gow <davidgow@google.com>
Cc: Marie Zhussupova <marievic@google.com>, rmoar@google.com, shuah@kernel.org,
 brendan.higgins@linux.dev, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, 2 Aug 2025 at 11:45, David Gow <davidgow@google.com> wrote:
>
> On Wed, 30 Jul 2025 at 03:37, Marie Zhussupova <marievic@google.com> wrote:
> >
> > This patch modifies `nthreads_gen_params` in kcsan_test.c
> > to accept an additional `struct kunit *test` argument.
> >
> > Signed-off-by: Marie Zhussupova <marievic@google.com>
> > ---
>
> This is a pretty straightforward fix after patch 3. KCSAN folks, would
> you prefer this kept as a separate patch, or squashed into the
> previous one (so there's no commit where this is broken)?

Normally patch series should be structured so that bisection does not
break. Having this fixup as a separate patch means that bisections
where the KCSAN test is enabled will break.

This is a tiny change, so I'd just squash it.


> Either way,
> Reviewed-by: David Gow <davidgow@google.com>
>
>
> -- David
>
> >  kernel/kcsan/kcsan_test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> > index c2871180edcc..fc76648525ac 100644
> > --- a/kernel/kcsan/kcsan_test.c
> > +++ b/kernel/kcsan/kcsan_test.c
> > @@ -1383,7 +1383,7 @@ static void test_atomic_builtins_missing_barrier(struct kunit *test)
> >   * The thread counts are chosen to cover potentially interesting boundaries and
> >   * corner cases (2 to 5), and then stress the system with larger counts.
> >   */
> > -static const void *nthreads_gen_params(const void *prev, char *desc)
> > +static const void *nthreads_gen_params(struct kunit *test, const void *prev, char *desc)
> >  {
> >         long nthreads = (long)prev;
> >
> > --
> > 2.50.1.552.g942d659e1b-goog
> >
