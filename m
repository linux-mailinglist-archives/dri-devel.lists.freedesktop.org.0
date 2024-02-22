Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389A8601BA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A8210EA25;
	Thu, 22 Feb 2024 18:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8DB10EA2B;
 Thu, 22 Feb 2024 18:42:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8743FCE1BE0;
 Thu, 22 Feb 2024 18:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6731C433C7;
 Thu, 22 Feb 2024 18:41:58 +0000 (UTC)
Date: Thu, 22 Feb 2024 13:43:49 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, "Ville =?UTF-8?B?U3lyasOkbMOk?="
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/i915: Add missing ; to __assign_str() macros in
 tracepoint code
Message-ID: <20240222134349.1e9a155d@gandalf.local.home>
In-Reply-To: <20240222133057.2af72a19@gandalf.local.home>
References: <20240222133057.2af72a19@gandalf.local.home>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Thu, 22 Feb 2024 13:30:57 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> I'm working on improving the __assign_str() and __string() macros to be
> more efficient, and removed some unneeded semicolons. This triggered a bug
> in the build as some of the __assign_str() macros in intel_display_trace
> was missing a terminating semicolon.
> 
> Fixes: 2ceea5d88048b ("drm/i915: Print plane name in fbc tracepoints")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---

Note, I have patches that depend on this fix, so if one of the maintainers
would like to just give me an "Acked-by", I'll take it through my tree. I
doubt it will have any conflicts, unless you are planning on changing the
given effected events.

-- Steve
