Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CCCAE634F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 13:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4E10E03A;
	Tue, 24 Jun 2025 11:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB09F10E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 11:09:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BF4106F;
 Tue, 24 Jun 2025 04:09:08 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3CD23F66E;
 Tue, 24 Jun 2025 04:09:21 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:09:12 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 daniel.almeida@collabora.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm: nova-drm: Update ioctl handlers to drop
 Opaque usage
Message-ID: <aFqHWOl0XcDdOrlN@arm.com>
References: <20250624093200.812812-1-beata.michalska@arm.com>
 <20250624093200.812812-3-beata.michalska@arm.com>
 <0ba4c988-194a-46f6-8e5d-b8fbc95a3eb8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ba4c988-194a-46f6-8e5d-b8fbc95a3eb8@kernel.org>
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

On Tue, Jun 24, 2025 at 11:59:25AM +0200, Danilo Krummrich wrote:
> On 6/24/25 11:32 AM, Beata Michalska wrote:
> > From: Danilo Krummrich <dakr@kernel.org>
> > 
> > Following the removal of `Opaque<T>` for ioctl arguments in the DRM
> > framework, this patch updates the affected driver code to use typed
> > references directly.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> 
> It's very kind you want to attribute the shared diff with a separate patch, but
> you have to include this change into patch 1 ("rust: drm: Drop the use of Opaque
> for ioctl arguments"), otherwise it still breaks the build intermediately.
>
It is not so uncommon to send such changes in separate patches, to clearly
distinguish the changes, as long as whole series preserves the build.
That said, I can still send those as a single patch if that is the requirement.

---
BR
Beata
> Please feel free to just include the change in your patch -- no need for any
> attribution as far as I'm concerned. :)
