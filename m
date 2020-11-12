Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60AE2B175F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280236E486;
	Fri, 13 Nov 2020 08:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1399 seconds by postgrey-1.36 at gabe;
 Thu, 12 Nov 2020 13:43:13 UTC
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D376E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 13:43:12 +0000 (UTC)
Received: from spam2.hygon.cn (localhost [127.0.0.2] (may be forged))
 by spam2.hygon.cn with ESMTP id 0ACDJl6n058495
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 21:19:47 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam2.hygon.cn with ESMTP id 0ACDFfPK058184;
 Thu, 12 Nov 2020 21:15:42 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-DB.hygon.cn with ESMTP id 0ACDFe3i005842;
 Thu, 12 Nov 2020 21:15:40 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Thu, 12 Nov
 2020 21:15:33 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Thu, 12 Nov 2020 21:15:33 +0800
From: Wen Pu <puwen@hygon.cn>
To: Dave Airlie <airlied@gmail.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
Thread-Topic: [git pull] drm next pull for 5.10-rc1
Thread-Index: AQHWuMgqRTntvTjDY0CXN6PBUWhRl6nD9B8A
Date: Thu, 12 Nov 2020 13:15:33 +0000
Message-ID: <746a573d-508b-4eb2-22ba-f361f5acdaa3@hygon.cn>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
In-Reply-To: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-ID: <A92D4B80897B4F42A96B02D1903186E6@Hygon.cn>
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 0ACDFfPK058184
X-DNSRBL: 
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/10/15 9:33, Dave Airlie wrote:
>       drm/vram-helper: stop using TTM placement flags

This commit (7053e0eab473) produce call trace for me as below:

[   64.782340] WARNING: CPU: 51 PID: 1964 at drivers/gpu/drm/drm_gem_vram_helper.c:284 drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]
[   64.782411] CPU: 51 PID: 1964 Comm: Xorg Not tainted 5.10.0-rc3 #12
[   64.782413] Hardware name: To be filled.
[   64.782419] RIP: 0010:drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]
[   64.782424] Code: 00 48 89 e5 85 c0 74 17 48 83 bf 78 01 00 00 00 74 18 48 8b 87 80 01 00 00 5d 48 c1 e0 0c c3 0f 0b 48 c7 c0 ed ff ff ff 5d c3 <0f> 0b 31 c0 5d c3 0f 1f 44 00 00 0f 1f 44 00 00 55 48 8b 87 18 06
[   64.782427] RSP: 0018:ffffa9128909fa68 EFLAGS: 00010246
[   64.782431] RAX: 0000000000000002 RBX: ffff95a5c25e1ec0 RCX: ffffffffc02b6600
[   64.782433] RDX: ffff959e49824000 RSI: ffff95a5c25e0b40 RDI: ffff959e4b1c2c00
[   64.782434] RBP: ffffa9128909fa68 R08: 0000000000000040 R09: ffff95a9c5dcb688
[   64.782436] R10: 0000000000000000 R11: 0000000000000001 R12: ffff959e49824000
[   64.782437] R13: 0000000000000000 R14: 0000000000000000 R15: ffff95a5c5c56f00
[   64.782440] FS:  00007f485d466a80(0000) GS:ffff95a9afcc0000(0000) knlGS:0000000000000000
[   64.782442] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   64.782444] CR2: 00007f485e202000 CR3: 0000000c82a0e000 CR4: 00000000003506e0
[   64.782446] Call Trace:
[   64.782455]  ast_cursor_page_flip+0x22/0x100 [ast]
[   64.782460]  ast_cursor_plane_helper_atomic_update+0x46/0x70 [ast]
[   64.782477]  drm_atomic_helper_commit_planes+0xbd/0x220 [drm_kms_helper]
[   64.782493]  drm_atomic_helper_commit_tail_rpm+0x3a/0x70 [drm_kms_helper]
[   64.782507]  commit_tail+0x99/0x130 [drm_kms_helper]
[   64.782521]  drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
[   64.782551]  drm_atomic_commit+0x4a/0x50 [drm]
[   64.782565]  drm_atomic_helper_update_plane+0xe7/0x140 [drm_kms_helper]
[   64.782592]  __setplane_atomic+0xcc/0x110 [drm]
[   64.782619]  drm_mode_cursor_universal+0x13e/0x260 [drm]
[   64.782647]  drm_mode_cursor_common+0xef/0x220 [drm]
[   64.782654]  ? tomoyo_path_number_perm+0x6f/0x200
[   64.782680]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
[   64.782706]  drm_mode_cursor2_ioctl+0xe/0x10 [drm]
[   64.782727]  drm_ioctl_kernel+0xae/0xf0 [drm]
[   64.782749]  drm_ioctl+0x241/0x3f0 [drm]
[   64.782774]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
[   64.782781]  ? tomoyo_file_ioctl+0x19/0x20
[   64.782787]  __x64_sys_ioctl+0x91/0xc0
[   64.782792]  do_syscall_64+0x38/0x90
[   64.782797]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   64.782800] RIP: 0033:0x7f485d7c637b
[   64.782804] Code: 0f 1e fa 48 8b 05 15 3b 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e5 3a 0d 00 f7 d8 64 89 01 48
[   64.782805] RSP: 002b:00007fff78682a28 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   64.782808] RAX: ffffffffffffffda RBX: 00007fff78682a60 RCX: 00007f485d7c637b
[   64.782810] RDX: 00007fff78682a60 RSI: 00000000c02464bb RDI: 000000000000000c
[   64.782811] RBP: 00000000c02464bb R08: 0000000000000040 R09: 0000000000000004
[   64.782813] R10: 0000000000000002 R11: 0000000000000246 R12: 0000558647745e40
[   64.782814] R13: 000000000000000c R14: 0000000000000002 R15: 00000000000002af
[   64.782820] CPU: 51 PID: 1964 Comm: Xorg Not tainted 5.10.0-rc3 #12
[   64.782821] Hardware name: To be filled.
[   64.782822] Call Trace:
[   64.782828]  dump_stack+0x74/0x92
[   64.782832]  ? drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]
[   64.782836]  __warn.cold+0x24/0x3f
[   64.782840]  ? drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]
[   64.782844]  report_bug+0xd6/0x100
[   64.782847]  handle_bug+0x39/0x80
[   64.782850]  exc_invalid_op+0x19/0x70
[   64.782853]  asm_exc_invalid_op+0x12/0x20
......

I hacked up patch and found this hunk in particular introduced the call trace:
@@ -135,20 +135,23 @@ static void ttm_buffer_object_destroy(struct ttm_buffer_object *bo)
......
+	if (pl_flag & DRM_GEM_VRAM_PL_FLAG_TOPDOWN)
+		pl_flag = TTM_PL_FLAG_TOPDOWN;

It seems that these two lines will lead to gbo->placements[c].mem_type be
forcibly set to TTM_PL_SYSTEM in the next hunks which caused the problem,
even though the pl_flag is DRM_GEM_VRAM_PL_FLAG_VRAM & DRM_GEM_VRAM_PL_FLAG_TOPDOWN.

If I comment out these two lines, there will be no call trace any more.

-- 
Regards,
Pu Wen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
