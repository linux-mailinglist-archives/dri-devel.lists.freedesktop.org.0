Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECE5F6F42
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDC910E67F;
	Thu,  6 Oct 2022 20:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AED410E67D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 20:37:18 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id i6so3135486pfb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=vUTyG6Np/u72Dz/dgBQ4qw28uB5CVEnf9ne0MjdRNXQ=;
 b=l4pzgbjCLfunsDmBM/oJsQgA/6oc2FTqn96xT9kDUHrLVbLcZSnT2054BUsF9BaE4N
 Vp2VyRDx9wEPFP/en9z5piVn4kS17i1eno1WqQYJzbR+iRHgHHWY82eSHog5/x3sSfDw
 wv2xe97OHgpkWIoe8EIm7Z+bM7mahJL49i8ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=vUTyG6Np/u72Dz/dgBQ4qw28uB5CVEnf9ne0MjdRNXQ=;
 b=ass9BjnORaZosk3qKGml1bz0DfAaqIjNAnRSRr+N9beH0Qeb+5sB71HjNlZy/yMyy5
 9AfjP0BWsKtCa/MKIK4H9ilO3tpI7mQ/xfVXAmGAzHl1OMf5mCpjEIDCu0iHVCxTUR11
 BVqontWDr8YMOsPa7BSchjJ+ukU5575QdGEIPy6mJyWby52VYskJbO9j3/O9a8NFf52U
 ThM1fMya/mXxA8ryrtAJB/HeyPOBLN4OEj+/nsA4owYtF1UMNkngCiUb0Y3vjuOaUGqS
 Vw96DUeFKMImte2Fb+sw6Obv3Yffdx+1AhPbB8tJffU/MtUjHc/LRCmI3tSEDQ6zpAS/
 pXtg==
X-Gm-Message-State: ACrzQf3n6jr2uaKfuPZPsS2ag2J+Uv3XdjnsMo1VEl7vctlOzHEbM9eY
 eIn/gLdlafu4Ey4l7soK2MD6cQ==
X-Google-Smtp-Source: AMsMyM6tUrflXlcmIduh6tv4hATbfSVnVFeSJd3pPCVGqgQFpNV5ZCLn3XXM8SrarBxmq5FPsdAdow==
X-Received: by 2002:a05:6a00:230d:b0:53d:c198:6ad7 with SMTP id
 h13-20020a056a00230d00b0053dc1986ad7mr1277124pfh.67.1665088637855; 
 Thu, 06 Oct 2022 13:37:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f33-20020a17090a702400b0020647f279fbsm3284227pjk.29.2022.10.06.13.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 13:37:17 -0700 (PDT)
Date: Thu, 6 Oct 2022 13:37:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure due to 5d8c3e836fc2 ("drm/amd/display:
 fix array-bounds error in dc_stream_remove_writeback()")
Message-ID: <202210061328.37FCC30@keescook>
References: <Yz6W+j+l0cJbr5dX@debian>
 <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 06, 2022 at 12:39:40PM -0700, Linus Torvalds wrote:
> What confuses me is that error message ("array subscript [0, 0] is
> outside array bounds of 'struct dc_writeback_info[1]') which seems to
> be aware that the value is actually 0.

I've seen bugs in the tracker where the reporting is broken but the
range checker is working "correctly", which seems to be the case here.

> If somebody cannot come up with a fix, I suspect the solution is "gcc
> array bounds analysis is terminally buggy" and we just need to disable
> it for gcc-11 too.

It does continue to find bugs, so I'd rather keep it on. GCC has fixed
all the issues we've run into so far (though not all have been back
ported to GCC 12 yet, so yes, let's keep -Warray-bounds disabled there).

Specifically, I've been tracking:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105679	Fixed 13+
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578	Fixed 12+, 11.3

And it looks like Sudip's proposed fix for this particular code is
additionally fixing unsigned vs signed as well. I think -Warray-bounds
did its job (though, with quite a confusing index range in the report).

-Kees

-- 
Kees Cook
