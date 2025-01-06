Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A644A030CF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 20:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F16810E9E7;
	Mon,  6 Jan 2025 19:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE78610E9E2;
 Mon,  6 Jan 2025 19:40:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47039A41D8B;
 Mon,  6 Jan 2025 19:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC4EC4CED2;
 Mon,  6 Jan 2025 19:40:00 +0000 (UTC)
Date: Mon, 6 Jan 2025 14:41:26 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Genes Lists <lists@sapience.com>
Cc: Andrea Amorosi <andrea.amorosi76@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 thomas.hellstrom@linux.intel.com
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
Message-ID: <20250106144126.20d7f599@gandalf.local.home>
In-Reply-To: <d5ef54d76188ec51d9e053fd097dc3f5bb6e6519.camel@sapience.com>
References: <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
 <73129e45-cf51-4e8d-95e8-49bc39ebc246@gmail.com>
 <d5ef54d76188ec51d9e053fd097dc3f5bb6e6519.camel@sapience.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 04 Jan 2025 15:09:10 -0500
Genes Lists <lists@sapience.com> wrote:

> On Sat, 2025-01-04 at 18:43 +0100, Andrea Amorosi wrote:
> > Hi to all,
> > 
> > I've just updated my archlinux to |6.12.8-arch1-1 and I still get the
> > same issue:|
> > 
> >   
> Right - 6.12.8 (and Arch build of same) does not have Steve Rostedt's
> patch.
> The patch is in mainline and I believe it will be in 6.12.9.

For completeness, the patch in question is this:

  https://lore.kernel.org/20241231000646.324fb5f7@gandalf.local.home

-- Steve


> 
> Since the warning logged is a false positive it is benign.
> 
> 

