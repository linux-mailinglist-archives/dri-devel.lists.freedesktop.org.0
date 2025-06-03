Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20127ACC596
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DA510E6C3;
	Tue,  3 Jun 2025 11:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Vfy7W0G1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B664610E6C3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 11:40:27 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad56829fabdso850402666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748950826; x=1749555626; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ciIAygqOrWJd3fbCLXBzNH0Xz2cW+3EmmUs8ebciGxE=;
 b=Vfy7W0G1bgIA0I7n2o05LJtvGnY0lUYTUBlZDTc5TlSL5VQfCbDLRAQ1M3MG2mQH2J
 Bdxgu9p8UvWpr6a52n77oySBV+hdduMdYASi45IGgGH/lRSIF1+pUalNDoVMTu7o2n7v
 PXIRCgfL8ouU+nZ3ncawvFPPeyp0rl0LV7xkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748950826; x=1749555626;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ciIAygqOrWJd3fbCLXBzNH0Xz2cW+3EmmUs8ebciGxE=;
 b=lyFTB+7bcR3IYa8lGbafU53npE250xpJNrsDoBGwn7hfn7a0n0HM8w6JjBmOwIldhL
 clDe3Beebsy8URKlxR0I2hFny33m7agYquF6SKhzXGcZo7tqwed4C5w5DoVsCBiGzSgp
 4n64lta5Jtu+WFgE8F8bxHpb9JuLrwUdQRyFjnevelpLw866agi7y7apJjKZwZ2u2wgm
 JeXeD6O8T77wzKv+zA/VjDs3ja69/3uxoTLdZhraSZLQADfdsVa0XXDuWWd4Pg09vMvp
 vNFQUlJVGmunbsPz63ay17GGxRQOFI/6xiXG6XBSB64rTxCg0At2bkkdb8G7SWkzisXQ
 uzJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYtlwcnKNIgCTkWWiDM9PlxiaAJ4KcUg1QETjsIoIaAwOJt37BBo/MP8RMP4qM0hWmhXRbpCimFYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC72p+n+CSsgTc32rt7d98VyHbPrZLqpi47s2g6P23vw9oWJIj
 iCtIqwMObgWtYgsZSV42IprR8es625o8yejAYpTq3ZgCe8qVGOkLe0tb8K2wJvrbJqA=
X-Gm-Gg: ASbGncsgN3tXPtctal3Kj7aXeecj+MAyjbY3Os6e0XoLwXIf4wt6TyyWKkVrFzf2uld
 EyyrmaF7uLfc47mmuxAYq6n18FDeErrcqLzfCwp6UyLRYYCW4S27S/LAU2afpqa9dVLz2x3gk0N
 vuJvD7zlOnv6MuVd8VvNACBg2yJ5E7ItiliibKkc6WQneQuU+VJXXb7rbsOPnE3BBudeg0uVWIE
 E0iZQVDtdv1gKgRN2XJRQaWbMNzS2eic3WOIll3x7kGrGzlug21ATR5g/fv/hVCtlTaars9eL+b
 mLQ5BafyVuqgGu8kOKnAj+MIGyvtHqkEMA+ngNzkDZV3lWq+o33D1abXJbrIkQbgZ6Nm+EjYaw=
 =
X-Google-Smtp-Source: AGHT+IFku9TE8EUVSLqmoCZBKfzqgA+/g+kH4IUAPWkSww+uTbuttoOauNZ+o0S0Qv506mn1chR6iQ==
X-Received: by 2002:a17:907:944d:b0:ace:c518:1327 with SMTP id
 a640c23a62f3a-adb493df457mr1224596266b.14.1748950826063; 
 Tue, 03 Jun 2025 04:40:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad6abc2sm941360566b.173.2025.06.03.04.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 04:40:25 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:40:23 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <aD7fJxQWggfGekOf@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
 <202505301037.D816A49@keescook>
 <20250531102304.GF21197@noisy.programming.kicks-ass.net>
 <8C5E309E-03E5-4353-8515-67A53EC6C9E3@kernel.org>
 <20250602075707.GI21197@noisy.programming.kicks-ass.net>
 <20250602-vegan-lumpy-marmoset-488b6a@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-vegan-lumpy-marmoset-488b6a@houat>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Mon, Jun 02, 2025 at 12:38:10PM +0200, Maxime Ripard wrote:
> On Mon, Jun 02, 2025 at 09:57:07AM +0200, Peter Zijlstra wrote:
> > On Sat, May 31, 2025 at 06:51:50AM -0700, Kees Cook wrote:
> > 
> > > It's not for you, then. :) I can't operate ftrace, but I use kunit
> > > almost daily. Ignoring WARNs makes this much nicer, and especially for
> > > CIs.
> > 
> > I'm thinking you are more than capable of ignoring WARNs too. This
> > leaves the CI thing.
> > 
> > So all this is really about telling CIs which WARNs are to be ignored,
> > and which are not? Surely the easiest way to achieve that is by
> > printing more/better identifying information instead of suppressing
> > things?
> 
> You might also want to test that the warn is indeed emitted, and it not
> being emitted result in a test failure.
> 
> And I can see a future where we would fail a test that would trigger an
> unexpected WARN.
> 
> Doing either, or none, would be pretty terrible UX for !CI users too.
> How on earth would you know if the hundreds of WARN you got from the
> tests output are legitimate or not, and if you introduced new ones
> you're supposed to fix?

Yeah we'd like to make sure that when drivers misuse subsystem api, things
blow up. Kunit that makes sure we hit the warn we put in place for that
seems like the best way to go about that, because in the past we've had
cases where we thought we should have caught abuse but didn't. And this
isn't the only thing we use, it's just one tool in the box among many
others to keep the flood of driver issues at a manageable level.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
