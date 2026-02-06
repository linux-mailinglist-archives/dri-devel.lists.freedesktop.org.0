Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBnXHeJHhmkhLgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:58:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19561102F03
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA54810E1EB;
	Fri,  6 Feb 2026 19:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fPDH5uPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF74810E8B3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 19:58:20 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1270adc5121so772470c88.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 11:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770407900; cv=none;
 d=google.com; s=arc-20240605;
 b=SI/kd7KXtLCHAwgxvTb1Ce3D+ru1G0BJ80+DzhhII5dbBNWI7iPLdYiGvHHIOfzPRp
 /z0KxZTu6eNRaTKBr2yntoPtj6jeByzJbScUlbD9FrlvLGFeM5TRFF8tNmA/qKG0W2Kc
 Oqv6XLs795lM2aS3tpjNZFo3DYPbB7jfndgSgfTszy7y67bGr5NGgeFy2SdbH7jNFdxh
 svrUBPQlcvWpJCXrt3LVnGaseTlMjsaQOrtYjU81tEEw2qwzmdKA5VYReQ/4jsN12Csi
 ULD0NX36GLI9hzvGCmYdD9wGvju7nCe48CGImVh52HDZoO/dXQx4D/tfJh6e1UouOXa6
 G5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GRm7HNfTA4ant2yIYhCAG8o23gsjvSTOyf18mlTBqqw=;
 fh=BQyoTePx0c6xKIm9HeHbjentNTrMS7LeVa48dRVsZZY=;
 b=BEk9JxrQp5vAHE2fjdaBaLNkjkgix8vWODo0ayRmNvqD4H2mqJOtrkYShXogJtc4ek
 9b1n0UXGzdgaJyWDkHHTOKrbQqf/DFmqW9mwGPB/bxeLVrljKNf8lPJLOORx8W9+hFVs
 h5n57+5HK9u7b1TrUFsiIiXbTbS1JEMuZinmJ4vecqC+aucM/B6XoXbCgPKrdManv/dg
 qr55XX+AdPHfs+ZrNdjcOLAFSsJvTBVJXFy24cQz4wOE7jEVXvSJnqSIEvcbtEkNIvr4
 UU2zNm8YQpHLpzlnS0BKanyajKI+w59DDGtjWG5UZX4DAU2bwLSEVBCbvEluMlpQF5oT
 2ijA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770407900; x=1771012700; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GRm7HNfTA4ant2yIYhCAG8o23gsjvSTOyf18mlTBqqw=;
 b=fPDH5uPqwAxSmrXYr/74fbJvRWDRuaWNH4ntA0RwaI6NGSc/GfhRsJHBcE5EknCpjZ
 b2ERv56y1TDJrtEyrVJShn5dE+kcdxMqLiAINjcLYgn8T7vdyg+Fdog2HVJqyoiLnm59
 XSAasL2ICwE4QMJiKHX9af9HW5Zz9qWN/ExROfSkWyvWxu4MXypq63QrWnlday+/pOtz
 E7otOCcSNar2GCmlzTfMlOCML9UBfnZNCejjIph5JpHdUvGdwL25Tk11zKow2c+bekAF
 uJGHndWWEUc40+666PeIkQ2DGHMaOEUvHphEpk5KvbPEoYPTSIe2zy5+f/gt97MapGh8
 xXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770407900; x=1771012700;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRm7HNfTA4ant2yIYhCAG8o23gsjvSTOyf18mlTBqqw=;
 b=P/rgGSaLHfOL0lIkhBipsxvF5+G/L9JICdOEUfEaiXW5GiriS2tN4Qf9rNh0nJjGq3
 g4UStDvKudm9/y0/tCwU+CvLRNHW2VDSXwrTiR9Isv+BE2NHKx/ZVBZLAO9X0bFDAuMM
 o7+mFeBrAi8aGrVYQAUVC2SCwqMO/GCuMdSK8Bg6Ay7kXJ1vENMIc5hJ2w2Zt7XN2LpY
 Ll2v6cvnjKgap+XTsFV6xOomUj/UGYuxlt3BUiN/Ix01swST0A90Ncqr61fAhIEX+2gI
 rihfr9YUJ6bOSqDtiOQ5UmMqXf5dFgNXbtXyDkmwfuLyIPV3wSQfUbXttYFhVliCRhIb
 fhqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTRn9E97Q+si3Wz/1WwHcjlKTCciwzHat+nEruslz9sHrPhE3EWmzDUGCu7hxZP4ealnCHsfWiM4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUjj6OEiACU8w5wKvC6vnbzvXZuDRKpKUzET1CY7F4bhQ5DkS7
 pSiKCyoTlYbmL3Sjdao9Y9/JL/r9YqSAfDKw3o+4djQ2MmsGL3DQ3vQIk8WMQPbtPFl0FFuwUoL
 BbWgD76FqifhaHrzLmUwIq7xyzgeyips=
X-Gm-Gg: AZuq6aLv/QBTIy0yZE1oy2PzvSNdoLHSdQvizh5LLa01I7JMYNHCO/Hle2HqTPF+YqF
 7VNhr9TkAlasQ5vKttnxTFnSUrcgwlBU7A2HpqhoFNMi7ZXlkokwfONpwO4GTqMNwXpUGk96N9S
 rh6ojcq97E3+1iEu1S/DsPiaLB/d0Yj60sA32BjvCVJwptS+82ik0eVpR7NEHD8E9q/Bxgh/7fh
 0V+d5AWNl+Y+z7C+GQ3X/v063EV97fS7SHoV1FIid5+hsML7dpjAqgSw9GNltgDJQOi5yYGg8Su
 jfsavDUmwy0mPBSn7Rb/AhpT5I5foQ==
X-Received: by 2002:a05:7022:69a:b0:119:e56b:9899 with SMTP id
 a92af1059eb24-12703f0a668mr1468969c88.0.1770407899815; Fri, 06 Feb 2026
 11:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20260206012447.105684-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260206012447.105684-1-vitaly.prosyak@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 6 Feb 2026 20:57:43 +0100
X-Gm-Features: AZwV_QhLMdFhSXx3RckTz1j0D67WiUHBqy1sixFOW1ooDJ3FyA1L5WvRL6T6864
Message-ID: <CAEsyxyjvV9LX_S_OhFTSp-kkyAjxYC2Yurz5kwAA=bA9YG=dpQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: guard NULL manual-trigger callback in
 cursor programming
To: vitaly.prosyak@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 alexander.deucher@amd.com, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000f9e399064a2d3501"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vitaly.prosyak@amd.com,m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:aurabindo.pillai@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 19561102F03
X-Rspamd-Action: no action

--000000000000f9e399064a2d3501
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Successfully tested on Polaris 11 / DCE 11.2.

Reviewed-and-tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>

On Fri, Feb 6, 2026 at 2:32=E2=80=AFAM <vitaly.prosyak@amd.com> wrote:

> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> KASAN reports a NULL instruction fetch (RIP=3D0x0) from
> dc_stream_program_cursor_position():
>
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   RIP: 0010:0x0
>   Call Trace:
>     dc_stream_program_cursor_position+0x344/0x920 [amdgpu]
>     amdgpu_dm_atomic_commit_tail+...
>
> [  +1.041013] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> [  +0.000027] #PF: supervisor instruction fetch in kernel mode
> [  +0.000013] #PF: error_code(0x0010) - not-present page
> [  +0.000012] PGD 0 P4D 0
> [  +0.000017] Oops: Oops: 0010 [#1] SMP KASAN NOPTI
> [  +0.000017] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G
>   E       6.18.0+ #3 PREEMPT(voluntary)
> [  +0.000023] Tainted: [E]=3DUNSIGNED_MODULE
> [  +0.000010] Hardware name: ASUS System Product Name/ROG STRIX B550-F
> GAMING (WI-FI), BIOS 1401 12/03/2020
> [  +0.000016] Workqueue: events drm_mode_rmfb_work_fn
> [  +0.000022] RIP: 0010:0x0
> [  +0.000017] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> [  +0.000015] RSP: 0018:ffffc9000017f4c8 EFLAGS: 00010246
> [  +0.000016] RAX: 0000000000000000 RBX: ffff88810afdda80 RCX:
> 1ffff110457000d1
> [  +0.000014] RDX: 1ffffffff87b75bd RSI: 0000000000000000 RDI:
> ffff88810afdda80
> [  +0.000014] RBP: ffffc9000017f538 R08: 0000000000000000 R09:
> ffff88822b800690
> [  +0.000013] R10: 0000000000000000 R11: 0000000000000000 R12:
> ffffffffc3dbac20
> [  +0.000014] R13: 0000000000000000 R14: ffff88811ab80000 R15:
> dffffc0000000000
> [  +0.000014] FS:  0000000000000000(0000) GS:ffff888434599000(0000)
> knlGS:0000000000000000
> [  +0.000015] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  +0.000013] CR2: ffffffffffffffd6 CR3: 000000010ee88000 CR4:
> 0000000000350ef0
> [  +0.000014] Call Trace:
> [  +0.000010]  <TASK>
> [  +0.000010]  dc_stream_program_cursor_position+0x344/0x920 [amdgpu]
> [  +0.001086]  ? __pfx_mutex_lock+0x10/0x10
> [  +0.000015]  ? unwind_next_frame+0x18b/0xa70
> [  +0.000019]  amdgpu_dm_atomic_commit_tail+0x1124/0xfa20 [amdgpu]
> [  +0.001040]  ? ret_from_fork_asm+0x1a/0x30
> [  +0.000018]  ? filter_irq_stacks+0x90/0xa0
> [  +0.000022]  ? __pfx_amdgpu_dm_atomic_commit_tail+0x10/0x10 [amdgpu]
> [  +0.001058]  ? kasan_save_track+0x18/0x70
> [  +0.000015]  ? kasan_save_alloc_info+0x37/0x60
> [  +0.000015]  ? __kasan_kmalloc+0xc3/0xd0
> [  +0.000013]  ? __kmalloc_cache_noprof+0x1aa/0x600
> [  +0.000016]  ? drm_atomic_helper_setup_commit+0x788/0x1450
> [  +0.000017]  ? drm_atomic_helper_commit+0x7e/0x290
> [  +0.000014]  ? drm_atomic_commit+0x205/0x2e0
> [  +0.000015]  ? process_one_work+0x629/0xf80
> [  +0.000016]  ? worker_thread+0x87f/0x1570
> [  +0.000020]  ? srso_return_thunk+0x5/0x5f
> [  +0.000014]  ? __kasan_check_write+0x14/0x30
> [  +0.000014]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? _raw_spin_lock_irq+0x8a/0xf0
> [  +0.000015]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [  +0.000016]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __kasan_check_write+0x14/0x30
> [  +0.000014]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __wait_for_common+0x204/0x460
> [  +0.000015]  ? sched_clock_noinstr+0x9/0x10
> [  +0.000014]  ? __pfx_schedule_timeout+0x10/0x10
> [  +0.000014]  ? local_clock_noinstr+0xe/0xd0
> [  +0.000015]  ? __pfx___wait_for_common+0x10/0x10
> [  +0.000014]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __wait_for_common+0x204/0x460
> [  +0.000014]  ? __pfx_schedule_timeout+0x10/0x10
> [  +0.000015]  ? __kasan_kmalloc+0xc3/0xd0
> [  +0.000015]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? wait_for_completion_timeout+0x1d/0x30
> [  +0.000015]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? drm_crtc_commit_wait+0x32/0x180
> [  +0.000015]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? drm_atomic_helper_wait_for_dependencies+0x46a/0x800
> [  +0.000019]  commit_tail+0x231/0x510
> [  +0.000017]  drm_atomic_helper_commit+0x219/0x290
> [  +0.000015]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
> [  +0.000016]  drm_atomic_commit+0x205/0x2e0
> [  +0.000014]  ? __pfx_drm_atomic_commit+0x10/0x10
> [  +0.000013]  ? __pfx_drm_connector_free+0x10/0x10
> [  +0.000014]  ? __pfx___drm_printfn_info+0x10/0x10
> [  +0.000017]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? drm_atomic_set_crtc_for_connector+0x49e/0x660
> [  +0.000015]  ? drm_atomic_set_fb_for_plane+0x155/0x290
> [  +0.000015]  drm_framebuffer_remove+0xa9b/0x1240
> [  +0.000014]  ? finish_task_switch.isra.0+0x15a/0x840
> [  +0.000015]  ? __switch_to+0x385/0xda0
> [  +0.000015]  ? srso_safe_ret+0x1/0x20
> [  +0.000013]  ? __pfx_drm_framebuffer_remove+0x10/0x10
> [  +0.000016]  ? kasan_print_address_stack_frame+0x221/0x280
> [  +0.000015]  drm_mode_rmfb_work_fn+0x14b/0x240
> [  +0.000015]  process_one_work+0x629/0xf80
> [  +0.000012]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __kasan_check_write+0x14/0x30
> [  +0.000019]  worker_thread+0x87f/0x1570
> [  +0.000013]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [  +0.000014]  ? __pfx_try_to_wake_up+0x10/0x10
> [  +0.000017]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? kasan_print_address_stack_frame+0x227/0x280
> [  +0.000017]  ? __pfx_worker_thread+0x10/0x10
> [  +0.000014]  kthread+0x396/0x830
> [  +0.000013]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [  +0.000015]  ? __pfx_kthread+0x10/0x10
> [  +0.000012]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __kasan_check_write+0x14/0x30
> [  +0.000014]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? recalc_sigpending+0x180/0x210
> [  +0.000015]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __pfx_kthread+0x10/0x10
> [  +0.000014]  ret_from_fork+0x31c/0x3e0
> [  +0.000014]  ? __pfx_kthread+0x10/0x10
> [  +0.000013]  ret_from_fork_asm+0x1a/0x30
> [  +0.000019]  </TASK>
> [  +0.000010] Modules linked in: rfcomm(E) cmac(E) algif_hash(E)
> algif_skcipher(E) af_alg(E) snd_seq_dummy(E) snd_hrtimer(E) qrtr(E)
> xt_MASQUERADE(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E)
> nf_defrag_ipv4(E) xt_mark(E) xt_tcpudp(E) nft_compat(E) nf_tables(E)
> x_tables(E) bnep(E) snd_hda_codec_alc882(E) snd_hda_codec_atihdmi(E)
> snd_hda_codec_realtek_lib(E) snd_hda_codec_hdmi(E) snd_hda_codec_generic(=
E)
> iwlmvm(E) snd_hda_intel(E) binfmt_misc(E) snd_hda_codec(E) snd_hda_core(E=
)
> mac80211(E) snd_intel_dspcfg(E) snd_intel_sdw_acpi(E) snd_hwdep(E)
> snd_pcm(E) libarc4(E) snd_seq_midi(E) snd_seq_midi_event(E) snd_rawmidi(E=
)
> amd_atl(E) intel_rapl_msr(E) snd_seq(E) intel_rapl_common(E) iwlwifi(E)
> jc42(E) snd_seq_device(E) btusb(E) snd_timer(E) btmtk(E) btrtl(E)
> edac_mce_amd(E) eeepc_wmi(E) polyval_clmulni(E) btbcm(E)
> ghash_clmulni_intel(E) asus_wmi(E) ee1004(E) platform_profile(E) btintel(=
E)
> snd(E) nls_iso8859_1(E) aesni_intel(E) soundcore(E) i2c_piix4(E)
> cfg80211(E) sparse_keymap(E) wmi_bmof(E) bluetooth(E) k10temp(E) rapl(E)
> [  +0.000300]  i2c_smbus(E) ccp(E) joydev(E) input_leds(E) gpio_amdpt(E)
> mac_hid(E) sch_fq_codel(E) msr(E) parport_pc(E) ppdev(E) lp(E) parport(E)
> efi_pstore(E) nfnetlink(E) dmi_sysfs(E) autofs4(E) cdc_ether(E) usbnet(E)
> amdgpu(E) amdxcp(E) hid_generic(E) i2c_algo_bit(E) drm_ttm_helper(E) ttm(=
E)
> drm_exec(E) drm_panel_backlight_quirks(E) gpu_sched(E)
> drm_suballoc_helper(E) video(E) drm_buddy(E) usbhid(E)
> drm_display_helper(E) r8152(E) hid(E) mii(E) cec(E) ahci(E) rc_core(E)
> igc(E) libahci(E) wmi(E)
> [  +0.000294] CR2: 0000000000000000
> [  +0.000013] ---[ end trace 0000000000000000 ]---
>
> The crash happens when we unconditionally call into the timing generator
> manual trigger hook:
>
>   pipe_ctx->stream_res.tg->funcs->program_manual_trigger(...)
>
> On some configurations the timing generator (tg), its funcs table, or the
> program_manual_trigger callback can be NULL. Guard all of these before
> calling the hook. If the first pipe matching the stream cannot trigger,
> keep scanning to find another matching pipe with a valid hook.
>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig  <christian.koenig@amd.com>
>
> Suggested-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index f59020f1a722..ecd08580937d 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -522,8 +522,10 @@ bool dc_stream_program_cursor_position(
>                         struct pipe_ctx *pipe_ctx =3D
> &dc->current_state->res_ctx.pipe_ctx[i];
>
>                         /* trigger event on first pipe with current strea=
m
> */
> -                       if (stream =3D=3D pipe_ctx->stream) {
> -
>  pipe_ctx->stream_res.tg->funcs->program_manual_trigger(pipe_ctx->
> stream_res.tg);
> +                       if (stream =3D=3D pipe_ctx->stream &&
> +
>  pipe_ctx->stream_res.tg->funcs->program_manual_trigger) {
> +
>  pipe_ctx->stream_res.tg->funcs->program_manual_trigger(
> +                                       pipe_ctx->stream_res.tg);
>                                 break;
>                         }
>                 }
> --
> 2.52.0
>
>

--000000000000f9e399064a2d3501
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Successfully tested on Polaris 11 / DCE 11.2.</div><d=
iv><br></div><div>Reviewed-and-tested-by: Mario Kleiner &lt;<a href=3D"mail=
to:mario.kleiner.de@gmail.com">mario.kleiner.de@gmail.com</a>&gt;</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Feb 6, 2026 at 2:32=E2=80=AFAM &lt;<a href=3D"mai=
lto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Vitaly Prosyak &lt;=
<a href=3D"mailto:vitaly.prosyak@amd.com" target=3D"_blank">vitaly.prosyak@=
amd.com</a>&gt;<br>
<br>
KASAN reports a NULL instruction fetch (RIP=3D0x0) from<br>
dc_stream_program_cursor_position():<br>
<br>
=C2=A0 BUG: kernel NULL pointer dereference, address: 0000000000000000<br>
=C2=A0 RIP: 0010:0x0<br>
=C2=A0 Call Trace:<br>
=C2=A0 =C2=A0 dc_stream_program_cursor_position+0x344/0x920 [amdgpu]<br>
=C2=A0 =C2=A0 amdgpu_dm_atomic_commit_tail+...<br>
<br>
[=C2=A0 +1.041013] BUG: kernel NULL pointer dereference, address: 000000000=
0000000<br>
[=C2=A0 +0.000027] #PF: supervisor instruction fetch in kernel mode<br>
[=C2=A0 +0.000013] #PF: error_code(0x0010) - not-present page<br>
[=C2=A0 +0.000012] PGD 0 P4D 0<br>
[=C2=A0 +0.000017] Oops: Oops: 0010 [#1] SMP KASAN NOPTI<br>
[=C2=A0 +0.000017] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=C2=A0 =C2=A0 =C2=A0 =C2=A06.18.0+ #3 =
PREEMPT(voluntary)<br>
[=C2=A0 +0.000023] Tainted: [E]=3DUNSIGNED_MODULE<br>
[=C2=A0 +0.000010] Hardware name: ASUS System Product Name/ROG STRIX B550-F=
 GAMING (WI-FI), BIOS 1401 12/03/2020<br>
[=C2=A0 +0.000016] Workqueue: events drm_mode_rmfb_work_fn<br>
[=C2=A0 +0.000022] RIP: 0010:0x0<br>
[=C2=A0 +0.000017] Code: Unable to access opcode bytes at 0xffffffffffffffd=
6.<br>
[=C2=A0 +0.000015] RSP: 0018:ffffc9000017f4c8 EFLAGS: 00010246<br>
[=C2=A0 +0.000016] RAX: 0000000000000000 RBX: ffff88810afdda80 RCX: 1ffff11=
0457000d1<br>
[=C2=A0 +0.000014] RDX: 1ffffffff87b75bd RSI: 0000000000000000 RDI: ffff888=
10afdda80<br>
[=C2=A0 +0.000014] RBP: ffffc9000017f538 R08: 0000000000000000 R09: ffff888=
22b800690<br>
[=C2=A0 +0.000013] R10: 0000000000000000 R11: 0000000000000000 R12: fffffff=
fc3dbac20<br>
[=C2=A0 +0.000014] R13: 0000000000000000 R14: ffff88811ab80000 R15: dffffc0=
000000000<br>
[=C2=A0 +0.000014] FS:=C2=A0 0000000000000000(0000) GS:ffff888434599000(000=
0) knlGS:0000000000000000<br>
[=C2=A0 +0.000015] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<b=
r>
[=C2=A0 +0.000013] CR2: ffffffffffffffd6 CR3: 000000010ee88000 CR4: 0000000=
000350ef0<br>
[=C2=A0 +0.000014] Call Trace:<br>
[=C2=A0 +0.000010]=C2=A0 &lt;TASK&gt;<br>
[=C2=A0 +0.000010]=C2=A0 dc_stream_program_cursor_position+0x344/0x920 [amd=
gpu]<br>
[=C2=A0 +0.001086]=C2=A0 ? __pfx_mutex_lock+0x10/0x10<br>
[=C2=A0 +0.000015]=C2=A0 ? unwind_next_frame+0x18b/0xa70<br>
[=C2=A0 +0.000019]=C2=A0 amdgpu_dm_atomic_commit_tail+0x1124/0xfa20 [amdgpu=
]<br>
[=C2=A0 +0.001040]=C2=A0 ? ret_from_fork_asm+0x1a/0x30<br>
[=C2=A0 +0.000018]=C2=A0 ? filter_irq_stacks+0x90/0xa0<br>
[=C2=A0 +0.000022]=C2=A0 ? __pfx_amdgpu_dm_atomic_commit_tail+0x10/0x10 [am=
dgpu]<br>
[=C2=A0 +0.001058]=C2=A0 ? kasan_save_track+0x18/0x70<br>
[=C2=A0 +0.000015]=C2=A0 ? kasan_save_alloc_info+0x37/0x60<br>
[=C2=A0 +0.000015]=C2=A0 ? __kasan_kmalloc+0xc3/0xd0<br>
[=C2=A0 +0.000013]=C2=A0 ? __kmalloc_cache_noprof+0x1aa/0x600<br>
[=C2=A0 +0.000016]=C2=A0 ? drm_atomic_helper_setup_commit+0x788/0x1450<br>
[=C2=A0 +0.000017]=C2=A0 ? drm_atomic_helper_commit+0x7e/0x290<br>
[=C2=A0 +0.000014]=C2=A0 ? drm_atomic_commit+0x205/0x2e0<br>
[=C2=A0 +0.000015]=C2=A0 ? process_one_work+0x629/0xf80<br>
[=C2=A0 +0.000016]=C2=A0 ? worker_thread+0x87f/0x1570<br>
[=C2=A0 +0.000020]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000014]=C2=A0 ? __kasan_check_write+0x14/0x30<br>
[=C2=A0 +0.000014]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? _raw_spin_lock_irq+0x8a/0xf0<br>
[=C2=A0 +0.000015]=C2=A0 ? __pfx__raw_spin_lock_irq+0x10/0x10<br>
[=C2=A0 +0.000016]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? __kasan_check_write+0x14/0x30<br>
[=C2=A0 +0.000014]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? __wait_for_common+0x204/0x460<br>
[=C2=A0 +0.000015]=C2=A0 ? sched_clock_noinstr+0x9/0x10<br>
[=C2=A0 +0.000014]=C2=A0 ? __pfx_schedule_timeout+0x10/0x10<br>
[=C2=A0 +0.000014]=C2=A0 ? local_clock_noinstr+0xe/0xd0<br>
[=C2=A0 +0.000015]=C2=A0 ? __pfx___wait_for_common+0x10/0x10<br>
[=C2=A0 +0.000014]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? __wait_for_common+0x204/0x460<br>
[=C2=A0 +0.000014]=C2=A0 ? __pfx_schedule_timeout+0x10/0x10<br>
[=C2=A0 +0.000015]=C2=A0 ? __kasan_kmalloc+0xc3/0xd0<br>
[=C2=A0 +0.000015]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? wait_for_completion_timeout+0x1d/0x30<br>
[=C2=A0 +0.000015]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? drm_crtc_commit_wait+0x32/0x180<br>
[=C2=A0 +0.000015]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? drm_atomic_helper_wait_for_dependencies+0x46a/0x=
800<br>
[=C2=A0 +0.000019]=C2=A0 commit_tail+0x231/0x510<br>
[=C2=A0 +0.000017]=C2=A0 drm_atomic_helper_commit+0x219/0x290<br>
[=C2=A0 +0.000015]=C2=A0 ? __pfx_drm_atomic_helper_commit+0x10/0x10<br>
[=C2=A0 +0.000016]=C2=A0 drm_atomic_commit+0x205/0x2e0<br>
[=C2=A0 +0.000014]=C2=A0 ? __pfx_drm_atomic_commit+0x10/0x10<br>
[=C2=A0 +0.000013]=C2=A0 ? __pfx_drm_connector_free+0x10/0x10<br>
[=C2=A0 +0.000014]=C2=A0 ? __pfx___drm_printfn_info+0x10/0x10<br>
[=C2=A0 +0.000017]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? drm_atomic_set_crtc_for_connector+0x49e/0x660<br=
>
[=C2=A0 +0.000015]=C2=A0 ? drm_atomic_set_fb_for_plane+0x155/0x290<br>
[=C2=A0 +0.000015]=C2=A0 drm_framebuffer_remove+0xa9b/0x1240<br>
[=C2=A0 +0.000014]=C2=A0 ? finish_task_switch.isra.0+0x15a/0x840<br>
[=C2=A0 +0.000015]=C2=A0 ? __switch_to+0x385/0xda0<br>
[=C2=A0 +0.000015]=C2=A0 ? srso_safe_ret+0x1/0x20<br>
[=C2=A0 +0.000013]=C2=A0 ? __pfx_drm_framebuffer_remove+0x10/0x10<br>
[=C2=A0 +0.000016]=C2=A0 ? kasan_print_address_stack_frame+0x221/0x280<br>
[=C2=A0 +0.000015]=C2=A0 drm_mode_rmfb_work_fn+0x14b/0x240<br>
[=C2=A0 +0.000015]=C2=A0 process_one_work+0x629/0xf80<br>
[=C2=A0 +0.000012]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? __kasan_check_write+0x14/0x30<br>
[=C2=A0 +0.000019]=C2=A0 worker_thread+0x87f/0x1570<br>
[=C2=A0 +0.000013]=C2=A0 ? __pfx__raw_spin_lock_irqsave+0x10/0x10<br>
[=C2=A0 +0.000014]=C2=A0 ? __pfx_try_to_wake_up+0x10/0x10<br>
[=C2=A0 +0.000017]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? kasan_print_address_stack_frame+0x227/0x280<br>
[=C2=A0 +0.000017]=C2=A0 ? __pfx_worker_thread+0x10/0x10<br>
[=C2=A0 +0.000014]=C2=A0 kthread+0x396/0x830<br>
[=C2=A0 +0.000013]=C2=A0 ? __pfx__raw_spin_lock_irq+0x10/0x10<br>
[=C2=A0 +0.000015]=C2=A0 ? __pfx_kthread+0x10/0x10<br>
[=C2=A0 +0.000012]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? __kasan_check_write+0x14/0x30<br>
[=C2=A0 +0.000014]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? recalc_sigpending+0x180/0x210<br>
[=C2=A0 +0.000015]=C2=A0 ? srso_return_thunk+0x5/0x5f<br>
[=C2=A0 +0.000013]=C2=A0 ? __pfx_kthread+0x10/0x10<br>
[=C2=A0 +0.000014]=C2=A0 ret_from_fork+0x31c/0x3e0<br>
[=C2=A0 +0.000014]=C2=A0 ? __pfx_kthread+0x10/0x10<br>
[=C2=A0 +0.000013]=C2=A0 ret_from_fork_asm+0x1a/0x30<br>
[=C2=A0 +0.000019]=C2=A0 &lt;/TASK&gt;<br>
[=C2=A0 +0.000010] Modules linked in: rfcomm(E) cmac(E) algif_hash(E) algif=
_skcipher(E) af_alg(E) snd_seq_dummy(E) snd_hrtimer(E) qrtr(E) xt_MASQUERAD=
E(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_mark(=
E) xt_tcpudp(E) nft_compat(E) nf_tables(E) x_tables(E) bnep(E) snd_hda_code=
c_alc882(E) snd_hda_codec_atihdmi(E) snd_hda_codec_realtek_lib(E) snd_hda_c=
odec_hdmi(E) snd_hda_codec_generic(E) iwlmvm(E) snd_hda_intel(E) binfmt_mis=
c(E) snd_hda_codec(E) snd_hda_core(E) mac80211(E) snd_intel_dspcfg(E) snd_i=
ntel_sdw_acpi(E) snd_hwdep(E) snd_pcm(E) libarc4(E) snd_seq_midi(E) snd_seq=
_midi_event(E) snd_rawmidi(E) amd_atl(E) intel_rapl_msr(E) snd_seq(E) intel=
_rapl_common(E) iwlwifi(E) jc42(E) snd_seq_device(E) btusb(E) snd_timer(E) =
btmtk(E) btrtl(E) edac_mce_amd(E) eeepc_wmi(E) polyval_clmulni(E) btbcm(E) =
ghash_clmulni_intel(E) asus_wmi(E) ee1004(E) platform_profile(E) btintel(E)=
 snd(E) nls_iso8859_1(E) aesni_intel(E) soundcore(E) i2c_piix4(E) cfg80211(=
E) sparse_keymap(E) wmi_bmof(E) bluetooth(E) k10temp(E) rapl(E)<br>
[=C2=A0 +0.000300]=C2=A0 i2c_smbus(E) ccp(E) joydev(E) input_leds(E) gpio_a=
mdpt(E) mac_hid(E) sch_fq_codel(E) msr(E) parport_pc(E) ppdev(E) lp(E) parp=
ort(E) efi_pstore(E) nfnetlink(E) dmi_sysfs(E) autofs4(E) cdc_ether(E) usbn=
et(E) amdgpu(E) amdxcp(E) hid_generic(E) i2c_algo_bit(E) drm_ttm_helper(E) =
ttm(E) drm_exec(E) drm_panel_backlight_quirks(E) gpu_sched(E) drm_suballoc_=
helper(E) video(E) drm_buddy(E) usbhid(E) drm_display_helper(E) r8152(E) hi=
d(E) mii(E) cec(E) ahci(E) rc_core(E) igc(E) libahci(E) wmi(E)<br>
[=C2=A0 +0.000294] CR2: 0000000000000000<br>
[=C2=A0 +0.000013] ---[ end trace 0000000000000000 ]---<br>
<br>
The crash happens when we unconditionally call into the timing generator<br=
>
manual trigger hook:<br>
<br>
=C2=A0 pipe_ctx-&gt;stream_res.tg-&gt;funcs-&gt;program_manual_trigger(...)=
<br>
<br>
On some configurations the timing generator (tg), its funcs table, or the<b=
r>
program_manual_trigger callback can be NULL. Guard all of these before<br>
calling the hook. If the first pipe matching the stream cannot trigger,<br>
keep scanning to find another matching pipe with a valid hook.<br>
<br>
Cc: Aurabindo Pillai &lt;<a href=3D"mailto:aurabindo.pillai@amd.com" target=
=3D"_blank">aurabindo.pillai@amd.com</a>&gt;<br>
Cc: Alexander Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" targ=
et=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
Cc: Christian Koenig=C2=A0 &lt;<a href=3D"mailto:christian.koenig@amd.com" =
target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
<br>
Suggested-by: Aurabindo Pillai &lt;<a href=3D"mailto:aurabindo.pillai@amd.c=
om" target=3D"_blank">aurabindo.pillai@amd.com</a>&gt;<br>
Signed-off-by: Vitaly Prosyak &lt;<a href=3D"mailto:vitaly.prosyak@amd.com"=
 target=3D"_blank">vitaly.prosyak@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c<br>
index f59020f1a722..ecd08580937d 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c<br>
@@ -522,8 +522,10 @@ bool dc_stream_program_cursor_position(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct pipe_ctx *pipe_ctx =3D &amp;dc-&gt;current_state-&gt;res_=
ctx.pipe_ctx[i];<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* trigger event on first pipe with current stream */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (stream =3D=3D pipe_ctx-&gt;stream) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_ctx-&gt;stream_res.tg-&gt;funcs-=
&gt;program_manual_trigger(pipe_ctx-&gt;<a href=3D"http://stream_res.tg" re=
l=3D"noreferrer" target=3D"_blank">stream_res.tg</a>);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (stream =3D=3D pipe_ctx-&gt;stream &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_ctx-&gt;stream_res.tg-&gt;funcs-=
&gt;program_manual_trigger) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_ctx-&gt;stream_res.tg-&gt;funcs-=
&gt;program_manual_trigger(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_ctx-=
&gt;<a href=3D"http://stream_res.tg" rel=3D"noreferrer" target=3D"_blank">s=
tream_res.tg</a>);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--000000000000f9e399064a2d3501--
