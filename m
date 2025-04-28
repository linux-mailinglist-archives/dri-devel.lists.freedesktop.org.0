Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A9A9F9FE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6E610E13E;
	Mon, 28 Apr 2025 19:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R4U4wEmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FC010E13E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 19:54:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D64E9A4B70E;
 Mon, 28 Apr 2025 19:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8799DC4CEE4;
 Mon, 28 Apr 2025 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745870045;
 bh=6JkWTiyBuD4FuO3Hff8q2laI10ryTLbOINF7R3/RJdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4U4wEmCxeGgaraJ6WbFWYsUNEsCN5ZB7pFL2aq6terjMCCgqYEv3Ihm/4GPrNHuD
 +7ch2BSj2Edv8I3znl3WeAYSGJVHZZ8KLusRCPMN6ygreeYvLu9YrXT/Fq5ASZOX5S
 4fCoLfFSrjPXsApm+/OC33fYCvskX3sy5U2TygIWfNjNzKVwB3TRT3p+g94GHzwRe9
 xdvUVMtcy0t+AxCUryRwnp74c1JAylsWkkIX2CCjRs60nBRWkgRIbmsmWXychgeXNN
 f9Zn8qUtrazmPM0eVF/m6lhD0RxocX5zPjDgh6Iiej1j0rfwVO179a9cwmBM6qaPmP
 FEim9H8DOOPGg==
Date: Mon, 28 Apr 2025 12:54:02 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bill Wendling <morbo@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Justin Stitt <justinstitt@google.com>,
 the arch/x86 maintainers <x86@kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 llvm@lists.linux.dev
Subject: Re: clang and drm issue: objtool warnings from clang build
Message-ID: <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
 <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
 <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
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

On Mon, Apr 28, 2025 at 12:34:27PM -0700, Linus Torvalds wrote:
> Honestly, the least wrong thing is to just NOT HAVE THE CHECK FOR ZERO AT ALL.
> 
> IOW, just generate the divide instruction.
> 
> I can almost guarantee that that will actually then generate the best
> code too, because you'll probably just end up sharing the divide
> instruction will all the *normal* cases.
> 
> So the best model is to literally remove that pointless and stupid "is
> this a divide by zero" code. It's pointless and stupid because it
> literally just makes for more work both for the compiler AND it
> generates worse code.

BTW, I've noticed Clang also generates UB for negative shift values.  I
assume we'd want it to stop checking for those as well.

-- 
Josh
