Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0636A4ECF3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D19F10E693;
	Tue,  4 Mar 2025 19:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G5Mwzih5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AFD10E693;
 Tue,  4 Mar 2025 19:14:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 70D2EA45CD7;
 Tue,  4 Mar 2025 19:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC7EC4CEE8;
 Tue,  4 Mar 2025 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741115692;
 bh=Cf5Pkr2I4+xpU+XK6bETQuRHM1hQiPVBfroY8069cYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G5Mwzih5cN1AbdqvYxxUDI/zFB/PKTtEQeBZdxAOAjafd+UCsJO2wPN9UnHKzSU0O
 nMWhYJzUlUS1b9DTnV1FB+6Dl+0XSLAvjkHRdceuUtnbH7R1wIenIF4qM++rV3vbac
 iF2yrZZQPbmmf8PQdIxm4zQcWgiTpb1wfjJdtCC/dJtqcwwtl0RdGLBQDADe8xWeVx
 baotdAG6pik9G6nWoKa7QUn4j1jZeBMmNbcVZOQ2nRqLOJOxLX1ZtVZTjXumeWlo92
 Oqqr3Sv373/p2UbPZYIsE8HCiUJj0KwHOw2TQphYb/E9egc70kZlerGrhb78GRgNvK
 +q9Qu52NUocjw==
Date: Tue, 4 Mar 2025 21:14:48 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org,
 russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 1/5] rust: module: add type `LocalModule`
Message-ID: <Z8dRKDHI7loVA78O@kernel.org>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-2-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304173555.2496-2-dakr@kernel.org>
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

On Tue, Mar 04, 2025 at 06:34:48PM +0100, Danilo Krummrich wrote:
> The `LocalModule` type is the type of the module created by `module!`,
> `module_pci_driver!`, `module_platform_driver!`, etc.
> 
> Since the exact type of the module is sometimes generated on the fly by
> the listed macros, provide an alias.
> 
> This is first used by the `module_firmware!` macro introduced in a
> subsequent patch.

So generally speaking for any patches, they are not patches once they
land to the Git and theoretically you cannot presume any order.

So cut out hairs the last sentence should be just:

"The first use for this will be module_firmware!"


> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

You can speak about subsequent patches here but not in the commit
message.

>  rust/macros/module.rs | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index cdf94f4982df..6ba9210677c5 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -228,6 +228,8 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
>                  kernel::ThisModule::from_ptr(core::ptr::null_mut())
>              }};
>  
> +            type LocalModule = {type_};
> +

nit:

I'd document this as:

// The `LocalModule` type is the type of the module created by `module!`,
// `module_pci_driver!`, `module_platform_driver!`, etc.

;-)


>              impl kernel::ModuleMetadata for {type_} {{
>                  const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
>              }}
> -- 
> 2.48.1
> 
> 

BR, Jarkko
