Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B775309526
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 13:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2276E072;
	Sat, 30 Jan 2021 12:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB196E071;
 Sat, 30 Jan 2021 12:46:00 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23745921-1500050 for multiple; Sat, 30 Jan 2021 12:45:11 +0000
MIME-Version: 1.0
In-Reply-To: <20210130123411.GB1822@llvm-development.us-central1-a.c.llvm-285123.internal>
References: <20210129181519.69963-1-viniciustinti@gmail.com>
 <161195375417.17568.2762721732398065240@build.alporthouse.com>
 <20210130123411.GB1822@llvm-development.us-central1-a.c.llvm-285123.internal>
Subject: Re: [PATCH] drm/i915: Remove unreachable code
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Vinicius Tinti <viniciustinti@gmail.com>
Date: Sat, 30 Jan 2021 12:45:10 +0000
Message-ID: <161201071009.32035.9188382145053741268@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vinicius Tinti (2021-01-30 12:34:11)
> On Fri, Jan 29, 2021 at 08:55:54PM +0000, Chris Wilson wrote:
> > Quoting Vinicius Tinti (2021-01-29 18:15:19)
> > > By enabling -Wunreachable-code-aggressive on Clang the following code
> > > paths are unreachable.
> > 
> > That code exists as commentary and, especially for sdvo, library
> > functions that we may need in future.
> 
> I would argue that this code could be removed since it is in git history.
> It can be restored when needed.
> 
> This will make the code cleaner.

It doesn't change the control flow, so no complexity argument. It
removes documentation from the code, so I have the opposite opinion.

> > The ivb-gt1 case => as we now set the gt level for ivb, should we not
> > enable the optimisation for ivb unaffected by the w/a? Just no one has
> > taken the time to see if it causes a regression.
> 
> I don't know. I just found out that the code is unreachable.
> 
> > For error state, the question remains whether we should revert to
> > uncompressed data if the compressed stream is larger than the original.
> 
> I don't know too.
> 
> In this last two cases the code could be commented and the decisions
> and problems explained in the comment section.

They already are, that is the point.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
