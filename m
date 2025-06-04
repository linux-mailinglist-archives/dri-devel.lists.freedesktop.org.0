Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E81ACE25A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020CE10E15E;
	Wed,  4 Jun 2025 16:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884910E15E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:42:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D069614BC;
 Wed,  4 Jun 2025 16:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396C3C4CEE4;
 Wed,  4 Jun 2025 16:42:16 +0000 (UTC)
Date: Wed, 4 Jun 2025 12:43:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Hugh Dickins <hughd@google.com>
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christian
 Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250604124332.5291e30d@gandalf.local.home>
In-Reply-To: <20250604123837.0603354d@gandalf.local.home>
References: <20250604085121.324be8c1@gandalf.local.home>
 <6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
 <d996ffad-42f1-1643-e44e-e837b2e3949d@google.com>
 <20250604123837.0603354d@gandalf.local.home>
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

On Wed, 4 Jun 2025 12:38:37 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 4 Jun 2025 09:26:21 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
>=20
> > > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>=
   =20
> >=20
> > Acked-by: Hugh Dickins <hughd@google.com> =20
>=20
> Thanks Thomas and Hugh,
>=20
> Now the question is, who's gonna take it? ;-)

Never mind, I see Linus took it.

-- Steve

