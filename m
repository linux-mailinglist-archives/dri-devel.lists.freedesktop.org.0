Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22FC8D1B91
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 14:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7E410E1B9;
	Tue, 28 May 2024 12:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W43yxD+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD2B10E1B9;
 Tue, 28 May 2024 12:44:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE11C61F34;
 Tue, 28 May 2024 12:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCA0C3277B;
 Tue, 28 May 2024 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716900298;
 bh=V/fjFo99P8wV0+6UkIGN87i3XApEcUm5GYAPEGzq9zk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W43yxD+vh+YWTCR3p3UfO9IYAMG22j/GHcXt3mfCkZfH5EHzipU5mdl6s00/MqKM6
 v+Pyim3ZeHhrZhpo7GdJ3kZKkunhyElGabmyZz9G6R2sIOSkf59bNSJxga1biLyDz8
 TgiSDYrmcE+t22roMDJDuLzt0UvOW3MNdevbgGO8=
Date: Tue, 28 May 2024 14:45:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <2024052816-makeshift-irrigate-cef5@gregkh>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlXLzCYiwdMxic3X@pollux>
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

On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
> However, if you have a driver that needs the firmware abstractions, I would be
> surprised if there were any hesitations to already merge the minimum device
> abstractions [1] and this one (once reviewed) without the rest. At least there
> aren't any from my side.
> 
> [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

No, the device abstractions are NOT ready for merging just yet, sorry,
if for no other reason than a non-RFC has never been posted :)

greg k-h
