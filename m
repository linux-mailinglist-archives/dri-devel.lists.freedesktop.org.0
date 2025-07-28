Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2DBB142A2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 21:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C2510E190;
	Mon, 28 Jul 2025 19:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ra2Jz8h5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2F10E190
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 19:53:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49D395C5AD6;
 Mon, 28 Jul 2025 19:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D1AC4CEE7;
 Mon, 28 Jul 2025 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753732419;
 bh=iv7gVpQcHrEXtlmF36wPqtBB2W2XMVx0c4GQZtQzJPA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ra2Jz8h5JHr2rL3+N1cnOSMvOsEy+v6yGFAZNbGtKzLr+QNexdKIYIRDV0eLPLFeB
 ntadcDqbHe0xpCXBl5wRnSLyv9pfwqgOlSgDxle+q4Nn0vGC64cRQsHtHbMn7UXtwY
 xqcSBYj6RJlLWeW11p8WJTyGFZEjvs9JuyrWjuDHT67tPaDz1HIFLk9hC35IG4qCEq
 iTFehxS1UEue/TI9oCxjnSWLQ9u8PObhRq8cMrG+TG3bJShKfsJBOAt1DqjcyAox4R
 hDB3Ahd01sdS/jFI6kbxVML2mWH77fcixf1IOsWFcT8YoNqyuk2/8K1wvTXOGoOzAc
 fPxlcYbWkOBZw==
Date: Mon, 28 Jul 2025 14:53:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] drivers/gpu: Fix typos
Message-ID: <20250728195338.GA3244723@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Mvhc-w6nUi6WmpL3Czp+0kqsFaZa6bgVqodps=8F1t=A@mail.gmail.com>
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

On Mon, Jul 28, 2025 at 03:16:32PM -0400, Alex Deucher wrote:
> On Wed, Jul 23, 2025 at 4:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > Fix typos, most reported by "codespell drivers/gpu".  Only touches
> > comments, no code changes.
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Any chance you could split this up per driver?

Sure.  What's the appropriate granularity?  This?

  drivers/gpu/drm/amd
  drivers/gpu/drm/i915
  drivers/gpu/drm/nouveau
  drivers/gpu/drm/radeon
  drivers/gpu/drm/vmwgfx
  ...

Or I guess I could dig through MAINTAINERS and find the most-specific
entries?

What's your preferred base and timeline?  This was based on v6.16-rc1.
I can rebase to v6.17-rc1 and post early in the next cycle, or late
next cycle, or whatever you prefer.

Bjorn
