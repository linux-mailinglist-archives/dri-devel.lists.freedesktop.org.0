Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE3A55301
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2410EA2E;
	Thu,  6 Mar 2025 17:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jO2pn6Wi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Thu, 06 Mar 2025 17:26:02 UTC
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EDE10EA2E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:26:02 +0000 (UTC)
Date: Thu, 6 Mar 2025 09:19:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1741281618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PU2H6sHIlZ8PGxGfpAa4ar0XUmQ2GWPqr4/VhiRAMwo=;
 b=jO2pn6Wis8m5GqMaNrwbBDwl3P/DD2tVEwJr9LPjTDYvW1/idV+R+GztBToz92gcMsaHkK
 CKlF5iCXCryYRZy3lsXuPCBmpyZoMnxMaUNBuzQAmmC2UXdGsS1bWpgrIdEPOk8xi6AkAW
 1zpbnNZXslY5y1b1312Ob7vY8F/A4Q8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, mcgrof@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, airlied@gmail.com,
 simona@ffwll.ch, corbet@lwn.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Initial Nova Core series
Message-ID: <20250306171955.r5ykx7oz45rj2dpz@4VRSMR2-DT.corp.robot.car>
References: <20250304173555.2496-1-dakr@kernel.org>
 <Z8isev0gwQJPs7S9@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8isev0gwQJPs7S9@cassiopeiae>
X-Migadu-Flow: FLOW_OUT
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

On Wed, Mar 05, 2025 at 08:56:42PM +0100, Danilo Krummrich wrote:
> On Tue, Mar 04, 2025 at 06:34:47PM +0100, Danilo Krummrich wrote:
> > Danilo Krummrich (5):
> >   rust: module: add type `LocalModule`
> >   rust: firmware: introduce `firmware::ModInfoBuilder`
> >   rust: firmware: add `module_firmware!` macro
> 
> Greg, Luis, Russ, any objections on me taking the two firmware patches through
> the nova tree?
> 
> >   gpu: nova-core: add initial driver stub
> >   gpu: nova-core: add initial documentation

No objections here.

- Russ
