Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOFSBqdrgGkd8AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:17:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB28CA03F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F3010E3C3;
	Mon,  2 Feb 2026 09:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FBIqFtTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BC110E3C3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 09:17:22 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7cfd8ca8191so1631411a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 01:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770023842; cv=none;
 d=google.com; s=arc-20240605;
 b=TsvifWF6BdU4vLWt9Gpf4YP7FseXSj7D63v39pbz1XUXCAdulfkrdNHdJPlg+RBdAn
 uvyOOsk+pxHp5Y1DKSXhL6yE68Ml6S8CQE6hnCAhGn8ii19n55LtK582u+ZrlaoK3Pkj
 DVlWHAcVm4JCmqGqf0ynPN/KQS5kOuWZ9VQTjPL/7D9PtJk4BbIpImTGyousI0dzF6eY
 Tl3cssTFl250wO+aLy6ZjYpzfrX4+eJ8I21UrvsAYujjisl5S7g2HmFnUYcj+wVVhK5g
 TVaZ0b2Af1DcDIwRhEnxIvR910/qD9kfZMtoAeauooRoxRUsMZTWzeE4bT19x2a5QEmR
 ouWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=64M/kHAX4t0OD4Qki58JSYxHG2qiMFBMqxrwfNOfNOA=;
 fh=FCTxiT1XD9ctbP/fVwiXyAEl6pnoqUK5GnA/Pa62cjY=;
 b=Pz4mZ2/jG8Zsgc/Zhd+9UhX0d7xtBxtu0Aeq41WzNtVgUufiOiXjNE2O1X0EnABseh
 kf3VMKY0iqru9gPOxm34eDbBpUb1VqDAG7eAz7F/P4mu8WkrpC0ymuqJ89BZZeNo4e0J
 7kNGMj7wQiRjdr6kkuKCF/MINi1KHarSYS6EttgzzIrrx4i5tzIUUT+Wfcg3IZasz+9Z
 TdvNQSPANxkDlysrkfiK0Vsk+lh9YxU8509m59kDuXhUTc2XrfpZUEvQVc/s/VvyuzeV
 JWZtIBc6w7TjoZvwnpANrdIkohbQED5MpuqxnfzWSNP+Uho73z/d8ODr+aJGBtoLTiVu
 w/kQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770023842; x=1770628642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64M/kHAX4t0OD4Qki58JSYxHG2qiMFBMqxrwfNOfNOA=;
 b=FBIqFtTul10f0gzgfqF1yj3F71uiI2W4X0eKy0Tx3aVkGvdX83S7qhbE69Z6ELAA28
 DEq8FhMhAVndAarbiRTJWN2iCq5d1SmkZ+9j48VXyMu2s+HT4jiyR7VMf6Xzqw/kuqqd
 ESRyPf64GGYPP9L+UdikwgnUAJMqinqUJlq7FpivKneC7uhWHDPnjgf0gV/k84bCe8sT
 EPKWDkTUfuxJ2yd93x0Napdj3Ru1mznHHHeqHALSA47g6pT7ieTse2eCtuMjJKkwl3y3
 hyyBGskOkMXItHMYqtwonYETzx9je9EFDxrhN42QF1MwprTwBRPgTZVwmI8XOyHbpKQt
 h3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770023842; x=1770628642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=64M/kHAX4t0OD4Qki58JSYxHG2qiMFBMqxrwfNOfNOA=;
 b=LEzSphclUVjMDWgxNXbMUffMDHNllhrtRJvCNkN4keNirWmsPLtWlv5kCSJYy4o7am
 IFPuhJS+RLcWjdRFtbBX3lCmoh04J614H6qEh0hI4Z08CUkbcu9O/E+yaSIwzq0thuVd
 OU3BzW7SdPbccFhHdefkORqspHgehQUaIXrxBgZ8EyPDkjyTVTMFxpod7aYJUqgWnyyR
 Cxj/Lq6kTU5/l0+vrPqj4Q96D3pE/iawMY58fhQwNrlFN2hILX8/DBoLT8cFgDPuwAZm
 z5P25WFMlFurrIoemS+bvSXewntvnGTyx99Da5e9/6KpHzKN6TddwNJVpf2qNX8G5D3h
 SG3g==
X-Gm-Message-State: AOJu0YxkMBw+VZL/u7JZvFGs0YCneYg3ZU593VyqkF7D4nSGt6G8PPM5
 +UKXDIOBofKLAJq4izAF7XnHb3bTMM5kMw2fKRr2M0ea4lRxqlPRAAJ/Okc+yp2VYzT8T9+b4Ha
 iOl+IayXv/L7abwCLRxmmiRin+dZuNJg=
X-Gm-Gg: AZuq6aILPZqRZKi22TMc91JSe9EKdGe3kGTJ/Q5PtcxZh5mXhaqiIRSeRrMXyvdAVbY
 bW49oioAwZmIT+obGFmEwa0SFCJNiiYvE52aooxoSNyFXXjZPfaUlr2XdiUAZ8xfoX9wcYWr/Se
 U6ViwkkLxvi/ARhjjwidzAX2YAhoDc/RFAmwdolWJqldCrjJbmfYzva04WdstIBrWBSZxit8zfg
 ZWqaBF1zsyvZw8pyFI0i7ZNpDo81z4kDj5YYPEou0e/CLNscifHO/7iDU+30ft7ZOhtVvc=
X-Received: by 2002:a05:6830:650b:b0:7c7:e3b:488a with SMTP id
 46e09a7af769-7d1a53283bfmr4466691a34.30.1770023842034; Mon, 02 Feb 2026
 01:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20260130151319.31264-1-jani.nikula@intel.com>
In-Reply-To: <20260130151319.31264-1-jani.nikula@intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 2 Feb 2026 10:17:10 +0100
X-Gm-Features: AZwV_Qi-hdET-ufY_5XDg6H2-vgefIvq1t3zug1H5vtWi7Q0U7YaYWUrnmMU_wg
Message-ID: <CAMeQTsbi2fbc4jpS69Xve=sGUE=m7SVzAKRDkZr+3oRpjDAaPQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/gma500: use drm_crtc_vblank_crtc()"
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[patrikrjakobsson@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@intel.com,m:tzimmermann@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrikrjakobsson@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,mail.gmail.com:mid,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9BB28CA03F
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 4:13=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> This reverts commit d930ffa5d6e8867a290db9c6aad1c62731aeb2c3.
>
> According to Thomas, commit d930ffa5d6e8 ("drm/gma500: use
> drm_crtc_vblank_crtc()") breaks the driver with a NULL-ptr oops on
> startup. This is because the IRQ initialization in gma_irq_install() now
> uses CRTCs that are only allocated later in psb_modeset_init(). Stack
> trace is below. Revert. Go back to the drawing board.
>
> [   65.831766] Oops: general protection fault, probably for non-canonical=
 address 0xdffffc0000000021: 0000 [#1] SMP KASAN NOPTI
> [   65.832114] KASAN: null-ptr-deref in range [0x0000000000000108-0x00000=
0000000010f]
> [   65.832232] CPU: 1 UID: 0 PID: 296 Comm: (udev-worker) Tainted: G     =
    E       6.19.0-rc6-1-default+ #4622 PREEMPT(voluntary)
> [   65.832376] Tainted: [E]=3DUNSIGNED_MODULE
> [   65.832448] Hardware name:  /DN2800MT, BIOS MTCDT10N.86A.0164.2012.121=
3.1024 12/13/2012
> [   65.832543] RIP: 0010:drm_crtc_vblank_crtc+0x24/0xd0
> [   65.832652] Code: 90 90 90 90 90 90 0f 1f 44 00 00 48 89 f8 48 81 c7
> 18 01 00 00 48 83 ec 10 48 ba 00 00 00 00 00 fc ff df 48 89 f9 48 c1 e9
> 03 <0f> b6 14 11 84 d2 74 05 80 fa 03 7e 58 48 89 c6 8b 90 18 01 00
> 00
> [   65.832820] RSP: 0018:ffff88800c8f7688 EFLAGS: 00010006
> [   65.832919] RAX: fffffffffffffff0 RBX: ffff88800fff4928 RCX: 000000000=
0000021
> [   65.833011] RDX: dffffc0000000000 RSI: ffffc90000978130 RDI: 000000000=
0000108
> [   65.833107] RBP: ffffed1001ffea03 R08: 0000000000000000 R09: ffffed100=
191eec7
> [   65.833199] R10: 0000000000000001 R11: 0000000000000001 R12: ffff88800=
14480c8
> [   65.833289] R13: dffffc0000000000 R14: fffffffffffffff0 R15: ffff88800=
fff4000
> [   65.833380] FS:  00007fe53d4d5d80(0000) GS:ffff888148dd8000(0000) knlG=
S:0000000000000000
> [   65.833488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   65.833575] CR2: 00007fac707420b8 CR3: 000000000ebd1000 CR4: 000000000=
00006f0
> [   65.833668] Call Trace:
> [   65.833735]  <TASK>
> [   65.833808]  gma_irq_preinstall+0x190/0x3e0 [gma500_gfx]
> [   65.834054]  gma_irq_install+0xb2/0x240 [gma500_gfx]
> [   65.834282]  psb_driver_load+0x7b2/0x1090 [gma500_gfx]
> [   65.834516]  ? __pfx_psb_driver_load+0x10/0x10 [gma500_gfx]
> [   65.834726]  ? ksize+0x1d/0x40
> [   65.834817]  ? drmm_add_final_kfree+0x3b/0xb0
> [   65.834935]  ? __pfx_psb_pci_probe+0x10/0x10 [gma500_gfx]
> [   65.835164]  psb_pci_probe+0xc8/0x150 [gma500_gfx]
> [   65.835384]  local_pci_probe+0xd5/0x190
> [   65.835492]  pci_call_probe+0x167/0x4b0
> [   65.835594]  ? __pfx_pci_call_probe+0x10/0x10
> [   65.835693]  ? local_clock+0x11/0x30
> [   65.835808]  ? __pfx___driver_attach+0x10/0x10
> [   65.835915]  ? do_raw_spin_unlock+0x55/0x230
> [   65.836014]  ? pci_match_device+0x303/0x790
> [   65.836124]  ? pci_match_device+0x386/0x790
> [   65.836226]  ? __pfx_pci_assign_irq+0x10/0x10
> [   65.836320]  ? kernfs_create_link+0x16a/0x230
> [   65.836418]  ? do_raw_spin_unlock+0x55/0x230
> [   65.836526]  ? __pfx___driver_attach+0x10/0x10
> [   65.836626]  pci_device_probe+0x175/0x2c0
> [   65.836735]  call_driver_probe+0x64/0x1e0
> [   65.836842]  really_probe+0x194/0x740
> [   65.836951]  ? __pfx___driver_attach+0x10/0x10
> [   65.837053]  __driver_probe_device+0x18c/0x3a0
> [   65.837163]  ? __pfx___driver_attach+0x10/0x10
> [   65.837262]  driver_probe_device+0x4a/0x120
> [   65.837369]  __driver_attach+0x19c/0x550
> [   65.837474]  ? __pfx___driver_attach+0x10/0x10
> [   65.837575]  bus_for_each_dev+0xe6/0x150
> [   65.837669]  ? local_clock+0x11/0x30
> [   65.837770]  ? __pfx_bus_for_each_dev+0x10/0x10
> [   65.837891]  bus_add_driver+0x2af/0x4f0
> [   65.838000]  ? __pfx_psb_init+0x10/0x10 [gma500_gfx]
> [   65.838236]  driver_register+0x19f/0x3a0
> [   65.838342]  ? rcu_is_watching+0x11/0xb0
> [   65.838446]  do_one_initcall+0xb5/0x3a0
> [   65.838546]  ? __pfx_do_one_initcall+0x10/0x10
> [   65.838644]  ? __kasan_slab_alloc+0x2c/0x70
> [   65.838741]  ? rcu_is_watching+0x11/0xb0
> [   65.838837]  ? __kmalloc_cache_noprof+0x3e8/0x6e0
> [   65.838937]  ? klp_module_coming+0x1a0/0x2e0
> [   65.839033]  ? do_init_module+0x85/0x7f0
> [   65.839126]  ? kasan_unpoison+0x40/0x70
> [   65.839230]  do_init_module+0x26e/0x7f0
> [   65.839341]  ? __pfx_do_init_module+0x10/0x10
> [   65.839450]  init_module_from_file+0x13f/0x160
> [   65.839549]  ? __pfx_init_module_from_file+0x10/0x10
> [   65.839651]  ? __lock_acquire+0x578/0xae0
> [   65.839791]  ? do_raw_spin_unlock+0x55/0x230
> [   65.839886]  ? idempotent_init_module+0x585/0x720
> [   65.839993]  idempotent_init_module+0x1ff/0x720
> [   65.840097]  ? __pfx_cred_has_capability.isra.0+0x10/0x10
> [   65.840211]  ? __pfx_idempotent_init_module+0x10/0x10
>
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Closes: https://lore.kernel.org/r/5aec1964-072c-4335-8f37-35e6efb4910e@su=
se.de
> Fixes: d930ffa5d6e8 ("drm/gma500: use drm_crtc_vblank_crtc()")
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Fix applied to drm-misc-fixes

I should probably put a gma500 machine back into my nightly test runs.
It would have caught this much earlier.

Thanks
Patrik


> ---
>  drivers/gpu/drm/gma500/psb_irq.c | 36 ++++++++++++--------------------
>  1 file changed, 13 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/ps=
b_irq.c
> index 3a946b472064..c224c7ff353c 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -250,7 +250,6 @@ static irqreturn_t gma_irq_handler(int irq, void *arg=
)
>  void gma_irq_preinstall(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> -       struct drm_crtc *crtc;
>         unsigned long irqflags;
>
>         spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
> @@ -261,15 +260,10 @@ void gma_irq_preinstall(struct drm_device *dev)
>         PSB_WSGX32(0x00000000, PSB_CR_EVENT_HOST_ENABLE);
>         PSB_RSGX32(PSB_CR_EVENT_HOST_ENABLE);
>
> -       drm_for_each_crtc(crtc, dev) {
> -               struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(c=
rtc);
> -
> -               if (vblank->enabled) {
> -                       u32 mask =3D drm_crtc_index(crtc) ? _PSB_VSYNC_PI=
PEB_FLAG :
> -                               _PSB_VSYNC_PIPEA_FLAG;
> -                       dev_priv->vdc_irq_mask |=3D mask;
> -               }
> -       }
> +       if (dev->vblank[0].enabled)
> +               dev_priv->vdc_irq_mask |=3D _PSB_VSYNC_PIPEA_FLAG;
> +       if (dev->vblank[1].enabled)
> +               dev_priv->vdc_irq_mask |=3D _PSB_VSYNC_PIPEB_FLAG;
>
>         /* Revisit this area - want per device masks ? */
>         if (dev_priv->ops->hotplug)
> @@ -284,8 +278,8 @@ void gma_irq_preinstall(struct drm_device *dev)
>  void gma_irq_postinstall(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> -       struct drm_crtc *crtc;
>         unsigned long irqflags;
> +       unsigned int i;
>
>         spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
>
> @@ -298,13 +292,11 @@ void gma_irq_postinstall(struct drm_device *dev)
>         PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
>         PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>
> -       drm_for_each_crtc(crtc, dev) {
> -               struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(c=
rtc);
> -
> -               if (vblank->enabled)
> -                       gma_enable_pipestat(dev_priv, drm_crtc_index(crtc=
), PIPE_VBLANK_INTERRUPT_ENABLE);
> +       for (i =3D 0; i < dev->num_crtcs; ++i) {
> +               if (dev->vblank[i].enabled)
> +                       gma_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTE=
RRUPT_ENABLE);
>                 else
> -                       gma_disable_pipestat(dev_priv, drm_crtc_index(crt=
c), PIPE_VBLANK_INTERRUPT_ENABLE);
> +                       gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
>         }
>
>         if (dev_priv->ops->hotplug_enable)
> @@ -345,8 +337,8 @@ void gma_irq_uninstall(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
>         struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> -       struct drm_crtc *crtc;
>         unsigned long irqflags;
> +       unsigned int i;
>
>         if (!dev_priv->irq_enabled)
>                 return;
> @@ -358,11 +350,9 @@ void gma_irq_uninstall(struct drm_device *dev)
>
>         PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>
> -       drm_for_each_crtc(crtc, dev) {
> -               struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(c=
rtc);
> -
> -               if (vblank->enabled)
> -                       gma_disable_pipestat(dev_priv, drm_crtc_index(crt=
c), PIPE_VBLANK_INTERRUPT_ENABLE);
> +       for (i =3D 0; i < dev->num_crtcs; ++i) {
> +               if (dev->vblank[i].enabled)
> +                       gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
>         }
>
>         dev_priv->vdc_irq_mask &=3D _PSB_IRQ_SGX_FLAG |
> --
> 2.47.3
>
