Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51422A252E3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F8A10E3D4;
	Mon,  3 Feb 2025 07:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iD9Jul54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267CE10E3D4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 07:15:12 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ab6f636d821so590549466b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 23:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738566910; x=1739171710;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4Q2C26T0K74YYtpMKkiUgCp9WgkXow2PCxFIgsZpR8=;
 b=iD9Jul54kGD3KD4YCGuc09bdkFQPPJ/ubx2qIPleJLYnPxhSBDfIeZxcYdqxVGAwcc
 1PoI4kyzZ1ZecI0Jk5m/pQFc2gBGnyODJuBJJssoY/LJYrw7q9B6Sjzp/J84jI0v17b6
 X7vbwQGSkX77//fQnzHkOPeN79Tx+r20Nkfi6VkH4IzRuk/BbHbalzRQKmz73A6WA5n2
 ooGUixjkUOFLkD+7DC5opSDxlcp1dgHTNBW0wU+sFFGBFGGj0LeqHecsGCPnG1GQYiMt
 LqTg9jV38fqFDZ8KP6WZHArtbGp2BEBI19pEtHynGxEB2FkgM2Vg40OMiSTJTXAkXmsC
 WM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738566910; x=1739171710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4Q2C26T0K74YYtpMKkiUgCp9WgkXow2PCxFIgsZpR8=;
 b=tQdgNV4uPkX0ARJyc3nvmAYR5NvqF1lXaoNHqn+Z7sAVcD7LZ1gO4NNVhOpn8NfeDq
 Gv5kyCR1z/1Mf1Hk6gUn433ZSJ70qje5tYYuwzGQdLp8E88XgilCfsHIvF5lZVbm+4Uh
 LkrB4ohrGIhqOsVU4cvS1LQYjonUgaYEJKkfsN71vw0fF3VWG5n9jzEFccYUQwf6xfoU
 Aapg/gPVlFdbdKHlxMBNla8YKLb1BCIVJ59/YClteV+Yzj/xx0uR3aPow0vqW5RBaV7w
 OlGOgELJa1jq2Y1RrWcVnBJ+/I0VJHpyF9otULXcFZtJQ+39IB3e1rAUzUQ4NT7Hs6tN
 bMnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsXSWaVRE6+OZINVJjrc9HKThSBMvlWnPpEiwmrlu6F9vp1wxpvxQi3XorA32JSUDxyOg0FkyiffE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz46cULBhS6dhEVyRWU6+OUORA7n7Z4o+QZdTgIJGkS0dK0FzpS
 ch3pj7mm0uI0Dz44dixDdbIjxblvtYVhgPgSlOb0tCcJARkgyRx2f1kBCmlKSUyperb3dox5kfD
 pJFViAF95j7cdfdidOWPcnwM0S98CeNrU0xKu
X-Gm-Gg: ASbGncvoGXSSTskjjsgWyXgsUvOWQpF5Z3vWlsLVJWk5X3DDqSZBJKhbLZuvJgHqY5d
 MIa9EqbZAqMOwnU0sSLCQED2K/adaF/RyAI0ynJLDXmbr75r2vEV0GEl7RK2xVQ5O5Mfa1oPSZT
 lcUZaBkLbqnJ8kVrj5uxK0jSe5BBig
X-Google-Smtp-Source: AGHT+IHdYYosvgmkyk0C8oZShVymubMByyKMeQ8cwNm/+8aabmGSqYwd9mo6bUikqVJ6ovwhEY68gP7+kn4UIYDAqqs=
X-Received: by 2002:a17:907:7ba3:b0:ab6:8bc1:9b5a with SMTP id
 a640c23a62f3a-ab6cfda42bbmr2465753066b.41.1738566900382; Sun, 02 Feb 2025
 23:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com>
 <20250130100050.1868208-7-kirill.shutemov@linux.intel.com>
 <CAMgjq7AWZg0Y7+v3_Z8-YVUXrANB29mCDSyzF39dtAM_TQ0aKw@mail.gmail.com>
In-Reply-To: <CAMgjq7AWZg0Y7+v3_Z8-YVUXrANB29mCDSyzF39dtAM_TQ0aKw@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 3 Feb 2025 00:14:23 -0700
X-Gm-Features: AWEUYZl7Aut54vM8LMQf8gmofutWUertOFMuqNs0Wcb_mrIfZVJF6RYYAJtQ1BU
Message-ID: <CAOUHufa6gVygmgscgrtX63Z9iE=EL9-tL-YGk7omSHhZhkj64w@mail.gmail.com>
Subject: Re: [PATCHv3 06/11] mm/vmscan: Use PG_dropbehind instead of PG_reclaim
To: Kairui Song <ryncsn@gmail.com>, 
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 David Airlie <airlied@gmail.com>, David Hildenbrand <david@redhat.com>,
 Hao Ge <gehao@kylinos.cn>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Feb 1, 2025 at 1:02=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrote=
:
>
> On Thu, Jan 30, 2025 at 6:02=E2=80=AFPM Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > The recently introduced PG_dropbehind allows for freeing folios
> > immediately after writeback. Unlike PG_reclaim, it does not need vmscan
> > to be involved to get the folio freed.
> >
> > Instead of using folio_set_reclaim(), use folio_set_dropbehind() in
> > pageout().
> >
> > It is safe to leave PG_dropbehind on the folio if, for some reason
> > (bug?), the folio is not in a writeback state after ->writepage().
> > In these cases, the kernel had to clear PG_reclaim as it shared a page
> > flag bit with PG_readahead.
> >
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > ---
> >  mm/vmscan.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index bc1826020159..c97adb0fdaa4 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -692,19 +692,16 @@ static pageout_t pageout(struct folio *folio, str=
uct address_space *mapping,
> >                 if (shmem_mapping(mapping) && folio_test_large(folio))
> >                         wbc.list =3D folio_list;
> >
> > -               folio_set_reclaim(folio);
> > +               folio_set_dropbehind(folio);
> > +
> >                 res =3D mapping->a_ops->writepage(&folio->page, &wbc);
> >                 if (res < 0)
> >                         handle_write_error(mapping, folio, res);
> >                 if (res =3D=3D AOP_WRITEPAGE_ACTIVATE) {
> > -                       folio_clear_reclaim(folio);
> > +                       folio_clear_dropbehind(folio);
> >                         return PAGE_ACTIVATE;
> >                 }
> >
> > -               if (!folio_test_writeback(folio)) {
> > -                       /* synchronous write or broken a_ops? */
> > -                       folio_clear_reclaim(folio);
> > -               }
> >                 trace_mm_vmscan_write_folio(folio);
> >                 node_stat_add_folio(folio, NR_VMSCAN_WRITE);
> >                 return PAGE_SUCCESS;
> > --
> > 2.47.2
> >
>
> Hi, I'm seeing following panic with SWAP after this commit:
>
> [   29.672319] Oops: general protection fault, probably for
> non-canonical address 0xffff88909a3be3: 0000 [#1] PREEMPT SMP NOPTI
> [   29.675503] CPU: 82 UID: 0 PID: 5145 Comm: tar Kdump: loaded Not
> tainted 6.13.0.ptch-g1fe9ea48ec98 #917
> [   29.677508] Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> [   29.678886] RIP: 0010:__lock_acquire+0x20/0x15d0
> [   29.679891] Code: 90 90 90 90 90 90 90 90 90 90 41 57 41 56 41 55
> 41 54 55 53 48 83 ec 30 8b 2d 10 ac f3 01 44 8b ac 24 88 00 00 00 85
> ed 74 64 <48> 8b 07 49 89 ff 48 3d 20 1d bf 83 74 56 8b 1d 8c f5 b1 01
> 41 89
> [   29.683852] RSP: 0018:ffffc9000bea3148 EFLAGS: 00010002
> [   29.684980] RAX: ffff8890874b2940 RBX: 0000000000000200 RCX: 000000000=
0000000
> [   29.686510] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00ffff889=
09a3be3
> [   29.688031] RBP: 0000000000000001 R08: 0000000000000001 R09: 000000000=
0000000
> [   29.689561] R10: 0000000000000000 R11: 0000000000000020 R12: 00ffff889=
09a3be3
> [   29.691087] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   29.692613] FS:  00007fa05c2824c0(0000) GS:ffff88a03fa80000(0000)
> knlGS:0000000000000000
> [   29.694339] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   29.695581] CR2: 000055f9abb7fc7d CR3: 00000010932f2002 CR4: 000000000=
0770eb0
> [   29.697109] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   29.698637] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   29.700161] PKRU: 55555554
> [   29.700759] Call Trace:
> [   29.701296]  <TASK>
> [   29.701770]  ? __die_body+0x1e/0x60
> [   29.702540]  ? die_addr+0x3c/0x60
> [   29.703267]  ? exc_general_protection+0x18f/0x3c0
> [   29.704290]  ? asm_exc_general_protection+0x26/0x30
> [   29.705345]  ? __lock_acquire+0x20/0x15d0
> [   29.706215]  ? lockdep_hardirqs_on_prepare+0xda/0x190
> [   29.707304]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
> [   29.708452]  lock_acquire+0xbf/0x2e0
> [   29.709229]  ? folio_unmap_invalidate+0x12f/0x220
> [   29.710257]  ? __folio_end_writeback+0x15d/0x430
> [   29.711260]  ? __folio_end_writeback+0x116/0x430
> [   29.712261]  _raw_spin_lock+0x30/0x40
> [   29.713064]  ? folio_unmap_invalidate+0x12f/0x220
> [   29.714076]  folio_unmap_invalidate+0x12f/0x220
> [   29.715058]  folio_end_writeback+0xdf/0x190
> [   29.715967]  swap_writepage_bdev_sync+0x1e0/0x450
> [   29.716994]  ? __pfx_submit_bio_wait_endio+0x10/0x10
> [   29.718074]  swap_writepage+0x46b/0x6b0
> [   29.718917]  pageout+0x14b/0x360
> [   29.719628]  shrink_folio_list+0x67d/0xec0
> [   29.720519]  ? mark_held_locks+0x48/0x80
> [   29.721375]  evict_folios+0x2a7/0x9e0
> [   29.722179]  try_to_shrink_lruvec+0x19a/0x270
> [   29.723130]  lru_gen_shrink_lruvec+0x70/0xc0
> [   29.724060]  ? __lock_acquire+0x558/0x15d0
> [   29.724954]  shrink_lruvec+0x57/0x780
> [   29.725754]  ? find_held_lock+0x2d/0xa0
> [   29.726588]  ? rcu_read_unlock+0x17/0x60
> [   29.727449]  shrink_node+0x2ad/0x930
> [   29.728229]  do_try_to_free_pages+0xbd/0x4e0
> [   29.729160]  try_to_free_mem_cgroup_pages+0x123/0x2c0
> [   29.730252]  try_charge_memcg+0x222/0x660
> [   29.731128]  charge_memcg+0x3c/0x80
> [   29.731888]  __mem_cgroup_charge+0x30/0x70
> [   29.732776]  shmem_alloc_and_add_folio+0x1a5/0x480
> [   29.733818]  ? filemap_get_entry+0x155/0x390
> [   29.734748]  shmem_get_folio_gfp+0x28c/0x6c0
> [   29.735680]  shmem_write_begin+0x5a/0xc0
> [   29.736535]  generic_perform_write+0x12a/0x2e0
> [   29.737503]  shmem_file_write_iter+0x86/0x90
> [   29.738428]  vfs_write+0x364/0x530
> [   29.739180]  ksys_write+0x6c/0xe0
> [   29.739906]  do_syscall_64+0x66/0x140
> [   29.740713]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   29.741800] RIP: 0033:0x7fa05c439984
> [   29.742584] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f
> 84 00 00 00 00 00 f3 0f 1e fa 80 3d c5 06 0e 00 00 74 13 b8 01 00 00
> 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20
> 48 89
> [   29.746542] RSP: 002b:00007ffece7720f8 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000001
> [   29.748157] RAX: ffffffffffffffda RBX: 0000000000002800 RCX: 00007fa05=
c439984
> [   29.749682] RDX: 0000000000002800 RSI: 000055f9cfa08000 RDI: 000000000=
0000004
> [   29.751216] RBP: 00007ffece772140 R08: 0000000000002800 R09: 000000000=
0000007
> [   29.752743] R10: 0000000000000180 R11: 0000000000000202 R12: 000055f9c=
fa08000
> [   29.754262] R13: 0000000000000004 R14: 0000000000002800 R15: 000000000=
00009af
> [   29.755797]  </TASK>
> [   29.756285] Modules linked in: zram virtiofs
>
> I'm testing with PROVE_LOCKING on. It seems folio_unmap_invalidate is
> called for swapcache folio and it doesn't work well, following PATCH
> on top of mm-unstable seems fix it well:

I think there is a bigger problem here. folio_end_reclaim_write()
currently calls folio_unmap_invalidate() to remove the mapping, and
that's very different from what __remove_mapping() does in the reclaim
path: not only it breaks the swapcache case, the shadow entry is also
lost.
