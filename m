Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4B86029F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD9610EA47;
	Thu, 22 Feb 2024 19:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA4310EA47;
 Thu, 22 Feb 2024 19:25:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0166161769;
 Thu, 22 Feb 2024 19:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB39EC433C7;
 Thu, 22 Feb 2024 19:25:53 +0000 (UTC)
Date: Thu, 22 Feb 2024 14:27:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, Ville
 =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/i915: Add missing ; to __assign_str() macros in
 tracepoint code
Message-ID: <20240222142744.177cc877@gandalf.local.home>
In-Reply-To: <ZdeatNbtahdEWMXV@intel.com>
References: <20240222133057.2af72a19@gandalf.local.home>
 <20240222134349.1e9a155d@gandalf.local.home>
 <ZdeatNbtahdEWMXV@intel.com>
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

On Thu, 22 Feb 2024 14:04:20 -0500
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> > Note, I have patches that depend on this fix, so if one of the maintainers
> > would like to just give me an "Acked-by", I'll take it through my tree. I
> > doubt it will have any conflicts, unless you are planning on changing the
> > given effected events.  
> 
> since it is not breaking builds on our side and the conflicts, if any, would
> be minimal, feel free to take this trough your tree
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks, much appreciated!

-- Steve
