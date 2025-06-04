Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8451CACDDCA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06DC10E7B0;
	Wed,  4 Jun 2025 12:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0808210E7E3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EACE46112A;
 Wed,  4 Jun 2025 12:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB936C4CEEF;
 Wed,  4 Jun 2025 12:21:48 +0000 (UTC)
Date: Wed, 4 Jun 2025 08:23:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Hugh Dickins <hughd@google.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Matthew Wilcox	 <willy@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui	 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost	 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250604082304.6f13e9c0@gandalf.local.home>
In-Reply-To: <3262455c0ac3bff64522fff47c0281943c9f76ea.camel@linux.intel.com>
References: <20250602170500.48713a2b@gandalf.local.home>
 <20250602171458.7ceabb1c@gandalf.local.home>
 <aD4boBrdZXtz_5kL@casper.infradead.org>
 <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
 <20250603102959.20c85adb@gandalf.local.home>
 <aD8iL4cFoXpIVK_0@casper.infradead.org>
 <20250603132736.554f611d@gandalf.local.home>
 <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
 <20250603140632.168190f9@gandalf.local.home>
 <dca861b8-a29d-b2b3-eba7-32aaf2b8eff7@google.com>
 <20250604080409.448a27e4@gandalf.local.home>
 <3262455c0ac3bff64522fff47c0281943c9f76ea.camel@linux.intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Wed, 04 Jun 2025 14:18:06 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> Let me know if you want me to send a patch for that.

This is a simple fix. I can send the patch and make sure it fixes my builds.

Thanks,

-- Steve
