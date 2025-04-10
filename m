Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E4A84969
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881D910E9FF;
	Thu, 10 Apr 2025 16:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="tTwDU/FS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54BD10E9FF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744301897; x=1744561097;
 bh=3OrBhjjKfrQrfSbH/4amearvQ/guLXPqW6egb+h95MU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=tTwDU/FSQNRgai4+0Q4Ha8Q6/cL/p9chvievaUqHNP5eKPo8Q9lswLkCWtiC3I9hK
 Jnx51SukWnYcGc0oTqIdAGT8ulvUFQuKmqbfI9Y8EEb9mufGqelmxbLSZ7C9RJnUoh
 flepH40xj0+lw6N7M3kRpHFd4B+dSirptRsV0+bnICyW6+ugZt4MXvHDSr98WYw4Ax
 j+kr9T+fc5bNv4Co8DCrJseZNo6GlRzFrusdribheOXPE8O4X6XLvOLHn1Z3K6TqC0
 rEUWD+NCe8h10/UjpMu5sZYGPZSFQVMNZ06IBiJBSoRyXcOHi+2xfJfuTomwQHuGU3
 yXfxzecCfIgrA==
Date: Thu, 10 Apr 2025 16:18:10 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 43/43] drm/colorop: Add destroy functions for color
 pipeline
Message-ID: <MR-ewrD_HzmW-bQzgnYRqWk-QZD9s9aF4dZ4EeGYrvtlarHFwQP0K1aCD9F3RUwEoOdHOYgmIeapScgP0j4SczvXn_2UDdSoYYJ0tZ-Tz1E=@emersion.fr>
In-Reply-To: <a8aae4e1-59ed-4a03-a4f5-6f70cd92ebd0@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-44-alex.hung@amd.com>
 <_GmbIozpR3Vwp7BPlTFO3i1Kn2S3SIYiQLIbF4TEizuVzpkcUrTZWj87cDM8l_ArWVpCKWJVYJyrNX3ElPuu-fOb_J5C5dVhGfdLkQ5Y5k0=@emersion.fr>
 <a8aae4e1-59ed-4a03-a4f5-6f70cd92ebd0@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 525a1ec65c83036ee84b42b1015d2502d53865c0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tuesday, April 1st, 2025 at 04:42, Alex Hung <alex.hung@amd.com> wrote:

> On 3/29/25 09:48, Simon Ser wrote:
>=20
> > I would prefer these functions to be introduced together with the
> > patches adding functions to create objects and adding the new fields.
> > That way it's easier to check the symmetry and at no point in the
> > series there are memory leaks.
>=20
> The object creation and new fields are introduced in different patches.
> I divided this patch by introducing these functions in a patch, and 2.
> adding callers when needed to avoid memory leaks.

Could we introduce the destructor together with the function creating a
colorop, as a thin kfree() wrapper, and add cleanup for new fields in
that destructor in the same commit where the new fields are introduced?

> > Additionally, I would avoid using the name "cleanup", which seems to
> > have different semantics: for instance drm_plane_cleanup() doesn't kfre=
e
> > the pointer. "destroy" seems more appropriate here.
>=20
> How about the following changes, i.e., freeing pointer is moved out of
> the cleanup function, and keeping the names.

I don't really see the upside, because (1) the creator function allocates
(so there is an asymmetry between the creator and destructor) and (2) all
callers of the destructor function will always want to kfree(), but I'd be
fine with that.
