Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996BDB0C7D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DFE10E286;
	Mon, 21 Jul 2025 15:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="V8xHEWwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8FF10E286
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753112549; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KLPTRKvTR8bJJ/yQrnw8stHdh64sv0hHG8WCfuTMt16xo/MWnywx11+XVcy2MIgmcMQyPTag216wAxL3re6uPvqImAjRtJGe/xPid0bgTrH3HbDxUVCbW6eSwHIYWAKOXZ38W6UwioGtToKhNisQ5bwBw2bOjxAsqgwUhVmyys8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753112549;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=S2R2FJWcSpGLahbr3EXsNKCo6qb9pAUuObDYMJ+G5Ag=; 
 b=YMxXryLL76nO4ht3VER5OwEbPxcJFRf+eqk09DiphNAnjmKzQDZrOzXxHioFAxnkYWPCgN1GjUBceE+2Jz657A+M/ltaCLm+6UcZn80BfEgzcSExOPtj73CI8WsISPziDDhuFHqfphVqqTdcK+LY+1y3TOq5Q28+QCGbCn0+0QA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753112549; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=S2R2FJWcSpGLahbr3EXsNKCo6qb9pAUuObDYMJ+G5Ag=;
 b=V8xHEWwKx1ToFgwuaYqHWtORm+ka7uPrbzNB9mxJ0QcdiKnAot7Ud9Omv/Aw1m2l
 U5yR3u9/QM2CZNe+CcP60u0Sgf0fsS1iuDSre4q2f/QVwBh4SFlVsDGQ8nP+fRzH4OC
 24wz3uiKnHOcSRn7mTYkogffdslJix5VssJ7EEw0=
Received: by mx.zohomail.com with SMTPS id 175311254621432.273057492186354;
 Mon, 21 Jul 2025 08:42:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250626162313.2755584-1-beata.michalska@arm.com>
Date: Mon, 21 Jul 2025 12:42:12 -0300
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
 aliceryhl@google.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Message-Id: <84F9F400-D27A-4095-A5E4-B2BF1E02424A@collabora.com>
References: <20250626162313.2755584-1-beata.michalska@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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



> On 26 Jun 2025, at 13:23, Beata Michalska <beata.michalska@arm.com> wrote:
> 
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraints. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is actually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com> 

