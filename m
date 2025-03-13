Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE01CA5F9B3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 16:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9267110E11C;
	Thu, 13 Mar 2025 15:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kvhbl7Qm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC47610E11C;
 Thu, 13 Mar 2025 15:23:56 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2ff6ce72844so286562a91.2; 
 Thu, 13 Mar 2025 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741879436; x=1742484236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+Oz+3kglGyqEvObYOSLwEDlHbyIVYwNeXrMoW6augs=;
 b=kvhbl7QmS8pxJVx41W0VBvsxBuHYmKWgfcwhbRxfJSnf5+dKl2/c3DZlQPQDfP0To2
 vWNEhLMLPsQqvi8ywmpvWEFQ+p2ZvLRc7qvxzPCMIqdlcnFbI40fQs7f+Ur9Tz0isBdX
 Q59u7pp50AAFJmTY93dES0gWmPUBA7hArW21Hgh7ADgv3tYfYC1L7BJNvhG41lcaMvrB
 wY1Y7Pg4wbQG7HO2HaVUG/RYfu+xYJrQ1504BsxzkGQKOjxT3tfvJYFcxO48grz+a7Rk
 A6r0Kjf3NxxlvMxN+NvbokI/jggiSfK4DnaUI73x/ITJZvi5qyXmq0o8s247Q2B0tV7i
 KdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741879436; x=1742484236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+Oz+3kglGyqEvObYOSLwEDlHbyIVYwNeXrMoW6augs=;
 b=SQ5FDhCy0eBaN6+/nCI1kGmfRrw+igr+0/PkzPfmx6l7ne/SbUrkj8aTQ/NfzviS/i
 oTq3htesJ1I8Mzk3lzrSLX8IVbflv3kUXy0xzPU6+WBtoDypOzgqjZWUTITQCl6Y/Dse
 RvGnTkLp3TlBC7DvbKJwD8bZPjegL/qmC5d0euP9BnkxYteNA4Gyn+15BSa0eZRdIrPx
 6JsgLgXGzju2dAclOTwxaYMn4tJNGzDQyaHveYQiu9P5YDSlmo16KEpDqTvHMfL+T5UA
 8HCukq+snb3rvg1nkPNnNDMUB/84sPHHJQIfqAPD8yewouSsSiZbe1gdT6esp68Ft6qm
 mWIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2pglarsVw0U53kgGEF5U4Z+rKhzm4boutzdTDgC/zYkA90d5W1G+RKo6O3w6d32YobkBHHsjj@lists.freedesktop.org,
 AJvYcCVOROL3t7p0RsRxb4dvqp8bXntZk0wWdJnyOZmzRjvn4d0IiGN6r+/6JdplUzP6SixeX4t0Jac2+zf2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC+KR8FnrXY9wLJfPb2uaTjaKS8uN8qmKFruhapC7VU7qEw7zn
 vnWZI4KJaddbxuMEnBcVPZOW4RkpcOO0HE1IVqfHLogUPk+DzgTaCUxUS+cKnqQxjoSdMC1eE3z
 5w5feCwyryMFR2YxvugK1cY4GksY=
X-Gm-Gg: ASbGncu5st8FhF5UUiWQBxw30zXfHpAyGNUDkP82PCWl64aaLqNMOKsATj5pAnKMjLW
 XLGq5FMvurU41bMZc89tsHc8LIYkdY/AqWWkNOctxrLpf4K6D89QJsJ7wPoQiK81skPPUpld8AM
 BTuCGpDilgmrHWHiLmW3dEBvFFLg==
X-Google-Smtp-Source: AGHT+IEMV5EXHnCYehMp5LyP1xvYrv7XFTRqiLM9SXt7CUcvDGd8ZoQ3a/SGENHTA0xb/tG8DrhSYjxWL0KRkQ1N5HI=
X-Received: by 2002:a17:90b:1d84:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-300a57a7d5emr11393655a91.8.1741879436330; Thu, 13 Mar 2025
 08:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250205-amdgpu-dmub-v1-1-88151fe565d8@igalia.com>
 <Z9LBt2ePtxJ0Nzz4@quatroqueijos>
 <a77432c5-a02a-451e-a316-594e8fdf5ba8@amd.com>
In-Reply-To: <a77432c5-a02a-451e-a316-594e8fdf5ba8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Mar 2025 11:23:44 -0400
X-Gm-Features: AQ5f1JpesdZ2YUfQgarD8_tWeAFjpNJrc0EsgRTFysMhStEIvkgaDrI8adx0yYM
Message-ID: <CADnq5_MY4QOC0Tmh7AgSHxjSL+TS7TJ=nTvuqc1Y6UzL3WdXYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: avoid NPD when ASIC does not support DMUB
To: Leo Li <sunpeng.li@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Harry Wentland <harry.wentland@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tom Chung <chiahsuan.chung@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, stable@vger.kernel.org, 
 Daniel Wheeler <daniel.wheeler@amd.com>
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

Applied.  Thanks.

Alex

On Thu, Mar 13, 2025 at 11:17=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
>
>
>
> On 2025-03-13 07:29, Thadeu Lima de Souza Cascardo wrote:
> > On Wed, Feb 05, 2025 at 10:06:38AM -0300, Thadeu Lima de Souza Cascardo=
 wrote:
> >> ctx->dmub_srv will de NULL if the ASIC does not support DMUB, which is
> >> tested in dm_dmub_sw_init.
> >>
> >> However, it will be dereferenced in dmub_hw_lock_mgr_cmd if
> >> should_use_dmub_lock returns true.
> >>
> >> This has been the case since dmub support has been added for PSR1.
> >
> > This bug has landed on stable trees. Any chance for a review here?
> >
> > Thanks.
> > Cascardo.
>
> Thanks for the ping and fix!
>
> Reviewed-by: Leo Li <sunpeng.li@amd.com>
>
> >
> >>
> >> Fix this by checking for dmub_srv in should_use_dmub_lock.
> >>
> >> [   37.440832] BUG: kernel NULL pointer dereference, address: 00000000=
00000058
> >> [   37.447808] #PF: supervisor read access in kernel mode
> >> [   37.452959] #PF: error_code(0x0000) - not-present page
> >> [   37.458112] PGD 0 P4D 0
> >> [   37.460662] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> >> [   37.465553] CPU: 2 UID: 1000 PID: 1745 Comm: DrmThread Not tainted =
6.14.0-rc1-00003-gd62e938120f0 #23 99720e1cb1e0fc4773b8513150932a07de3c6e88
> >> [   37.478324] Hardware name: Google Morphius/Morphius, BIOS Google_Mo=
rphius.13434.858.0 10/26/2023
> >> [   37.487103] RIP: 0010:dmub_hw_lock_mgr_cmd+0x77/0xb0
> >> [   37.492074] Code: 44 24 0e 00 00 00 00 48 c7 04 24 45 00 00 0c 40 8=
8 74 24 0d 0f b6 02 88 44 24 0c 8b 01 89 44 24 08 85 f6 75 05 c6 44 24 0e 0=
1 <48> 8b 7f 58 48 89 e6 ba 01 00 00 00 e8 08 3c 2a 00 65 48 8b 04 5
> >> [   37.510822] RSP: 0018:ffff969442853300 EFLAGS: 00010202
> >> [   37.516052] RAX: 0000000000000000 RBX: ffff92db03000000 RCX: ffff96=
9442853358
> >> [   37.523185] RDX: ffff969442853368 RSI: 0000000000000001 RDI: 000000=
0000000000
> >> [   37.530322] RBP: 0000000000000001 R08: 00000000000004a7 R09: 000000=
00000004a5
> >> [   37.537453] R10: 0000000000000476 R11: 0000000000000062 R12: ffff92=
db0ade8000
> >> [   37.544589] R13: ffff92da01180ae0 R14: ffff92da011802a8 R15: ffff92=
db03000000
> >> [   37.551725] FS:  0000784a9cdfc6c0(0000) GS:ffff92db2af00000(0000) k=
nlGS:0000000000000000
> >> [   37.559814] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [   37.565562] CR2: 0000000000000058 CR3: 0000000112b1c000 CR4: 000000=
00003506f0
> >> [   37.572697] Call Trace:
> >> [   37.575152]  <TASK>
> >> [   37.577258]  ? __die_body+0x66/0xb0
> >> [   37.580756]  ? page_fault_oops+0x3e7/0x4a0
> >> [   37.584861]  ? exc_page_fault+0x3e/0xe0
> >> [   37.588706]  ? exc_page_fault+0x5c/0xe0
> >> [   37.592550]  ? asm_exc_page_fault+0x22/0x30
> >> [   37.596742]  ? dmub_hw_lock_mgr_cmd+0x77/0xb0
> >> [   37.601107]  dcn10_cursor_lock+0x1e1/0x240
> >> [   37.605211]  program_cursor_attributes+0x81/0x190
> >> [   37.609923]  commit_planes_for_stream+0x998/0x1ef0
> >> [   37.614722]  update_planes_and_stream_v2+0x41e/0x5c0
> >> [   37.619703]  dc_update_planes_and_stream+0x78/0x140
> >> [   37.624588]  amdgpu_dm_atomic_commit_tail+0x4362/0x49f0
> >> [   37.629832]  ? srso_return_thunk+0x5/0x5f
> >> [   37.633847]  ? mark_held_locks+0x6d/0xd0
> >> [   37.637774]  ? _raw_spin_unlock_irq+0x24/0x50
> >> [   37.642135]  ? srso_return_thunk+0x5/0x5f
> >> [   37.646148]  ? lockdep_hardirqs_on+0x95/0x150
> >> [   37.650510]  ? srso_return_thunk+0x5/0x5f
> >> [   37.654522]  ? _raw_spin_unlock_irq+0x2f/0x50
> >> [   37.658883]  ? srso_return_thunk+0x5/0x5f
> >> [   37.662897]  ? wait_for_common+0x186/0x1c0
> >> [   37.666998]  ? srso_return_thunk+0x5/0x5f
> >> [   37.671009]  ? drm_crtc_next_vblank_start+0xc3/0x170
> >> [   37.675983]  commit_tail+0xf5/0x1c0
> >> [   37.679478]  drm_atomic_helper_commit+0x2a2/0x2b0
> >> [   37.684186]  drm_atomic_commit+0xd6/0x100
> >> [   37.688199]  ? __cfi___drm_printfn_info+0x10/0x10
> >> [   37.692911]  drm_atomic_helper_update_plane+0xe5/0x130
> >> [   37.698054]  drm_mode_cursor_common+0x501/0x670
> >> [   37.702600]  ? __cfi_drm_mode_cursor_ioctl+0x10/0x10
> >> [   37.707572]  drm_mode_cursor_ioctl+0x48/0x70
> >> [   37.711851]  drm_ioctl_kernel+0xf2/0x150
> >> [   37.715781]  drm_ioctl+0x363/0x590
> >> [   37.719189]  ? __cfi_drm_mode_cursor_ioctl+0x10/0x10
> >> [   37.724165]  amdgpu_drm_ioctl+0x41/0x80
> >> [   37.728013]  __se_sys_ioctl+0x7f/0xd0
> >> [   37.731685]  do_syscall_64+0x87/0x100
> >> [   37.735355]  ? vma_end_read+0x12/0xe0
> >> [   37.739024]  ? srso_return_thunk+0x5/0x5f
> >> [   37.743041]  ? find_held_lock+0x47/0xf0
> >> [   37.746884]  ? vma_end_read+0x12/0xe0
> >> [   37.750552]  ? srso_return_thunk+0x5/0x5f
> >> [   37.754565]  ? lock_release+0x1c4/0x2e0
> >> [   37.758406]  ? vma_end_read+0x12/0xe0
> >> [   37.762079]  ? exc_page_fault+0x84/0xe0
> >> [   37.765921]  ? srso_return_thunk+0x5/0x5f
> >> [   37.769938]  ? lockdep_hardirqs_on+0x95/0x150
> >> [   37.774303]  ? srso_return_thunk+0x5/0x5f
> >> [   37.778317]  ? exc_page_fault+0x84/0xe0
> >> [   37.782163]  entry_SYSCALL_64_after_hwframe+0x55/0x5d
> >> [   37.787218] RIP: 0033:0x784aa5ec3059
> >> [   37.790803] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c=
7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 0=
5 <41> 89 c0 3d 00 f0 ff ff 77 1d 48 8b 45 c8 64 48 2b 04 25 28 00 0
> >> [   37.809553] RSP: 002b:0000784a9cdf90e0 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000010
> >> [   37.817121] RAX: ffffffffffffffda RBX: 0000784a9cdf917c RCX: 000078=
4aa5ec3059
> >> [   37.824256] RDX: 0000784a9cdf917c RSI: 00000000c01c64a3 RDI: 000000=
0000000020
> >> [   37.831391] RBP: 0000784a9cdf9130 R08: 0000000000000100 R09: 000000=
0000ff0000
> >> [   37.838525] R10: 0000000000000000 R11: 0000000000000246 R12: 000002=
5c01606ed0
> >> [   37.845657] R13: 0000025c00030200 R14: 00000000c01c64a3 R15: 000000=
0000000020
> >> [   37.852799]  </TASK>
> >> [   37.854992] Modules linked in:
> >> [   37.864546] gsmi: Log Shutdown Reason 0x03
> >> [   37.868656] CR2: 0000000000000058
> >> [   37.871979] ---[ end trace 0000000000000000 ]---
> >> [   37.880976] RIP: 0010:dmub_hw_lock_mgr_cmd+0x77/0xb0
> >> [   37.885954] Code: 44 24 0e 00 00 00 00 48 c7 04 24 45 00 00 0c 40 8=
8 74 24 0d 0f b6 02 88 44 24 0c 8b 01 89 44 24 08 85 f6 75 05 c6 44 24 0e 0=
1 <48> 8b 7f 58 48 89 e6 ba 01 00 00 00 e8 08 3c 2a 00 65 48 8b 04 5
> >> [   37.904703] RSP: 0018:ffff969442853300 EFLAGS: 00010202
> >> [   37.909933] RAX: 0000000000000000 RBX: ffff92db03000000 RCX: ffff96=
9442853358
> >> [   37.917068] RDX: ffff969442853368 RSI: 0000000000000001 RDI: 000000=
0000000000
> >> [   37.924201] RBP: 0000000000000001 R08: 00000000000004a7 R09: 000000=
00000004a5
> >> [   37.931336] R10: 0000000000000476 R11: 0000000000000062 R12: ffff92=
db0ade8000
> >> [   37.938469] R13: ffff92da01180ae0 R14: ffff92da011802a8 R15: ffff92=
db03000000
> >> [   37.945602] FS:  0000784a9cdfc6c0(0000) GS:ffff92db2af00000(0000) k=
nlGS:0000000000000000
> >> [   37.953689] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [   37.959435] CR2: 0000000000000058 CR3: 0000000112b1c000 CR4: 000000=
00003506f0
> >> [   37.966570] Kernel panic - not syncing: Fatal exception
> >> [   37.971901] Kernel Offset: 0x30200000 from 0xffffffff81000000 (relo=
cation range: 0xffffffff80000000-0xffffffffbfffffff)
> >> [   37.982840] gsmi: Log Shutdown Reason 0x02
> >>
> >> Fixes: b5c764d6ed55 ("drm/amd/display: Use HW lock mgr for PSR1")
> >> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >> Cc: stable@vger.kernel.org
> >> Cc: Sun peng Li <sunpeng.li@amd.com>
> >> Cc: Tom Chung <chiahsuan.chung@amd.com>
> >> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c b/d=
rivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
> >> index 5bb8b78bf250a0e56c3e99ce7c99ed7f70c8f0f6..eef817a4c580aca2ebc7fb=
1b77cfc0377d477bdc 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
> >> @@ -63,6 +63,9 @@ void dmub_hw_lock_mgr_inbox0_cmd(struct dc_dmub_srv =
*dmub_srv,
> >>
> >>   bool should_use_dmub_lock(struct dc_link *link)
> >>   {
> >> +    /* ASIC doesn't support DMUB */
> >> +    if (!link->ctx->dmub_srv)
> >> +            return false;
> >>      if (link->psr_settings.psr_version =3D=3D DC_PSR_VERSION_SU_1 ||
> >>          link->psr_settings.psr_version =3D=3D DC_PSR_VERSION_1)
> >>              return true;
> >>
> >> ---
> >> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> >> change-id: 20250205-amdgpu-dmub-3fc25a0bc68e
> >>
> >> Best regards,
> >> --
> >> Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >>
>
