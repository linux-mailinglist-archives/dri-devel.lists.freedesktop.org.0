Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271AA542E5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 07:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FE410E8F7;
	Thu,  6 Mar 2025 06:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YTBCZ5HT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1503310E8ED;
 Thu,  6 Mar 2025 06:40:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 80AE3A4452F;
 Thu,  6 Mar 2025 06:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ED7C4CEE4;
 Thu,  6 Mar 2025 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1741243251;
 bh=8kwjl92rykcychAi9RQKmq2UV5+R5DBT3Ncrt4ABzA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTBCZ5HTEYnF0lhxjYly1lFdZAL5CJRuGXJnBCmFX+ULRtxWDt8TsuywTX7xTXIgi
 2YMR7iK2RA7DvXHkuykHRGzUiMEU6aI5rFxPnrrwLroJiFiaVWAljoG721dIH88zXh
 rbPStM7B4ecYg1T/zc5TbMJD3Hn7coe0knxuOHdA=
Date: Thu, 6 Mar 2025 07:39:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: mcgrof@kernel.org, russ.weight@linux.dev, ojeda@kernel.org,
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
Message-ID: <2025030629-porcupine-percolate-c4d8@gregkh>
References: <20250304173555.2496-1-dakr@kernel.org>
 <Z8isev0gwQJPs7S9@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8isev0gwQJPs7S9@cassiopeiae>
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

None from me!
