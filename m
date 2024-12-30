Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F239FEACA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 22:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9AC10E58A;
	Mon, 30 Dec 2024 21:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF9B10E388;
 Mon, 30 Dec 2024 21:02:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2B695A40E27;
 Mon, 30 Dec 2024 21:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B6FC4CED0;
 Mon, 30 Dec 2024 21:02:03 +0000 (UTC)
Date: Mon, 30 Dec 2024 16:03:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, stable@vger.kernel.org,
 regressions@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
Message-ID: <20241230160311.4eec04da@gandalf.local.home>
In-Reply-To: <5f756542aaaf241d512458f306707bda3b249671.camel@sapience.com>
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
 <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
 <20241230141329.5f698715@batman.local.home>
 <20241230145002.3cc11717@gandalf.local.home>
 <5f756542aaaf241d512458f306707bda3b249671.camel@sapience.com>
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

On Mon, 30 Dec 2024 15:52:14 -0500
Genes Lists <lists@sapience.com> wrote:

> On Mon, 2024-12-30 at 14:50 -0500, Steven Rostedt wrote:
> > On Mon, 30 Dec 2024 14:13:29 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >   
> > > I guess the "fix" would be to have the check code ignore pointer to
> > > arrays, assuming they are "ok".  
> > 
> > Can you try this patch?
> > 
> > -- Steve  
> 
> Confirmed - all quiet now with 6.12.7 + your patch - I can test
> mainline too but doesn't look that useful.
> 
> Thank you for sorting this out so quickly.
> 
> 

I'll start making it into an official patch. Can I add your "Tested-by" to it?

-- Steve
