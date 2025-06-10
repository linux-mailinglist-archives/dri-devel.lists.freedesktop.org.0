Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF625AD3008
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B6410E496;
	Tue, 10 Jun 2025 08:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rDRqf8zz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272CC10E49E;
 Tue, 10 Jun 2025 08:24:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F1326A4B8AA;
 Tue, 10 Jun 2025 08:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804D5C4CEF2;
 Tue, 10 Jun 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749543875;
 bh=quoL3/AbdEFxunyDYr3lt/Bd6viOltjUaS68qAqZ3DQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rDRqf8zzpSFUo0jbg2eDk6j3WzKLDA90jIoYg/dklaNpFkx175lQWor1PQ6gKRwJn
 W3g3usxWTOyIK27uKUaoYOPLGX3IfXzZ/88WSmBgkqoRt9CvADaWOOdvRCT4q1rk/P
 bx6r5x4zOONF/fMarbOyonJC19vsFGkRPJT8EQsvTCEbOosUKMFs//DW06oRK5wCif
 bCDE4JycDmqkjFA7L9sOB8JmeBOwTS2Hgf4z054PPsQpwMqvruLAnM1vA+yZm7klDn
 08Y1sscR8a8Hmx0dTB5Q5ADJftiP7JYUnpKOSK7zwIYcgRygpOh4ORHNgmxoYcZsLN
 SXz5W6YklVztA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Guilherme Giacomo Simoes" <trintaeoitogc@gmail.com>
Cc: <rafael@kernel.org>,  <viresh.kumar@linaro.org>,  <dakr@kernel.org>,
 <maarten.lankhorst@linux.intel.com>,  <mripard@kernel.org>,
 <tzimmermann@suse.de>,  <airlied@gmail.com>,  <simona@ffwll.ch>,
 <mcgrof@kernel.org>,  <russ.weight@linux.dev>,  <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>,  <boqun.feng@gmail.com>,  <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>,  <lossin@kernel.org>,
 <aliceryhl@google.com>,  <tmgross@umich.edu>,  <leitao@debian.org>,
 <gregkh@linuxfoundation.org>,  <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>,  <leon@kernel.org>,  <fujita.tomonori@gmail.com>,
 <tamird@gmail.com>,  <igor.korotin.linux@gmail.com>,
 <walmeida@microsoft.com>,  <anisse@astier.eu>,
 <linux-pm@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>,  <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: module: remove deprecated author key
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com> (Guilherme
 Giacomo Simoes's message of "Mon, 09 Jun 2025 09:22:00 -0300")
References: <4pEkPxIXoND4Ndog7RjFo36DrUhFW-OT8Z6Y21aYvhfqE0rgUEmYEGn2PStTYOsOfpXv0R8aWmboCdc0m8uZfA==@protonmail.internalid>
 <20250609122200.179307-1-trintaeoitogc@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 10:24:20 +0200
Message-ID: <87y0u02edn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

"Guilherme Giacomo Simoes" <trintaeoitogc@gmail.com> writes:

> Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
> a new `authors` key to support multiple module authors, while keeping
> the old `author` key for backward compatibility.
>
> Now that all in-tree modules have migrated to `authors`, remove:
> 1. The deprecated `author` key support from the module macro
> 2. Legacy `author` entries from remaining modules
>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>


Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


