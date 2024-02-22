Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F188601CD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4619510EA30;
	Thu, 22 Feb 2024 18:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6399110EA24;
 Thu, 22 Feb 2024 18:45:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7CBB1CE2272;
 Thu, 22 Feb 2024 18:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2731C43390;
 Thu, 22 Feb 2024 18:45:08 +0000 (UTC)
Date: Thu, 22 Feb 2024 13:46:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/i915: Add missing ; to __assign_str() macros in
 tracepoint code
Message-ID: <20240222134659.0a2bb63e@gandalf.local.home>
In-Reply-To: <ZdeVs-rlk4oGEOs7@intel.com>
References: <20240222133057.2af72a19@gandalf.local.home>
 <ZdeVs-rlk4oGEOs7@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 22 Feb 2024 20:42:59 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Feb 22, 2024 at 01:30:57PM -0500, Steven Rostedt wrote:
> > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> >=20
> > I'm working on improving the __assign_str() and __string() macros to be
> > more efficient, and removed some unneeded semicolons. This triggered a =
bug
> > in the build as some of the __assign_str() macros in intel_display_trace
> > was missing a terminating semicolon.
> >=20
> > Fixes: 2ceea5d88048b ("drm/i915: Print plane name in fbc tracepoints")
> > Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org> =20
>=20
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Do you want me to apply this to drm-intel or do you want to take
> it through some other tree? Either way seems fine for this stuff.

Thanks. I would like to add it to my tree as my changes rely on it.

But I think to do that, I still need an Acked-by from one of the
maintainers listed in the MAINTAINERS file.

-- Steve
