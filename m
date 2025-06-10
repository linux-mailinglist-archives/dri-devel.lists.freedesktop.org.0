Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED64AD3353
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C182210E4E0;
	Tue, 10 Jun 2025 10:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GNxX638I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C2A10E10A;
 Tue, 10 Jun 2025 10:12:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38EE544DDD;
 Tue, 10 Jun 2025 10:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B36C4CEED;
 Tue, 10 Jun 2025 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749550363;
 bh=ST5N4y7efa3WI81pyAb9EfnKKmnc6+2XM1s9J2ylets=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=GNxX638ICb6jA3ELDYkyk1s7ytMLGeQ8sQ1q+WnmBdHE0FHZeqPPV30patlKk4h3W
 Q7La763WOAZo37Ae1wurznNwOd521J9iYShUqkx7boJ960f/U7Vcsr8x1UF4TsHtGX
 DpeV/5AH3Z8eQFuiv2AnZU6sdDqBEME3Q3Djt0SLtCvCWKCk6b8IABBhUxYStwdJCB
 5KZaf85Gd2aYMnXlrgxBaoPkQETCfw5Q2GDIkQEDp0OT01bDvQROABLvAvnfWpRipA
 I/Lh2T81rYpxt92Xq5FGmG0FPcWrqaTneDOpcKrpQOGxf15rVIH3Spk2ND9Hhp4rsh
 2aPg25kRyu4yQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 12:12:35 +0200
Message-Id: <DAIRU9INPO8A.1PLCLKFJJGODH@kernel.org>
Cc: "Guilherme Giacomo Simoes" <trintaeoitogc@gmail.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <dakr@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <mcgrof@kernel.org>, <russ.weight@linux.dev>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <leitao@debian.org>,
 <gregkh@linuxfoundation.org>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <fujita.tomonori@gmail.com>,
 <tamird@gmail.com>, <igor.korotin.linux@gmail.com>,
 <walmeida@microsoft.com>, <anisse@astier.eu>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: module: remove deprecated author key
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
 <DAIQ9342ZFYD.3VQVI80A18HKX@kernel.org>
 <CANiq72kC1j-kprAQ5WU0QVV_zhyKfDPJ_M5E9xZ+8+fxt4R6qQ@mail.gmail.com>
In-Reply-To: <CANiq72kC1j-kprAQ5WU0QVV_zhyKfDPJ_M5E9xZ+8+fxt4R6qQ@mail.gmail.com>
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

On Tue Jun 10, 2025 at 12:03 PM CEST, Miguel Ojeda wrote:
> On Tue, Jun 10, 2025 at 10:58=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
>>
>> Unrelated to this change, I think we should add email addresses to
>> people in authors. Possibly enforce it by scanning each author element
>> and checking if there is an email address.
>
> Sounds good to me, but I am not sure if it is possible in all cases.
>
> At least looking at C, there are company names too.
>
> I even saw a URL...

Hmm, I guess a checkpatch lint fits better then?

---
Cheers,
Benno
