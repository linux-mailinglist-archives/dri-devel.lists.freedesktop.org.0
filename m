Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFzrHmgzqWnM2wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:40:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480FB20CCEC
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9896910EB27;
	Thu,  5 Mar 2026 07:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFC410EB27
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 07:40:18 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-01 (Coremail) with SMTP id qwCowAC3XWldM6lpr15HCQ--.972S2;
 Thu, 05 Mar 2026 15:40:14 +0800 (CST)
Message-ID: <127da2b15f3b748cbc1985847cb318b9699b9682.camel@iscas.ac.cn>
Subject: Re: drm AI patch review hacks
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Dave Airlie <airlied@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>,  Sima Vetter <sima@ffwll.ch>
Cc: "clm@meta.com" <clm@meta.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Date: Thu, 05 Mar 2026 15:40:13 +0800
In-Reply-To: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3XWldM6lpr15HCQ--.972S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw17JFy8KrWUXr4rtw4rGrg_yoW7Ar1fpF
 WrJr4UCr4DZF1kXw1kWa1I93yruay8ua48XFn5XrnrZrs8X3W29a1qkFyYkryDKFn0q3W2
 q3y8Z3WkJryqyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5L18JUUUUU==
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Rspamd-Queue-Id: 480FB20CCEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:sima@ffwll.ch,m:clm@meta.com,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,ffwll.ch];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.903];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

Hi Dave,

It looks like the review bot does not see any extra contexts than those
included in the patch file?

I am trying to address the issues (if valid) raised by the bot of my
patchset `[PATCH drm-misc-next 0/3] drm: verisilicon: convert
drm_format to vs_format in atomic_check' .

In the bot review of 3/3, I got the following review note:

```
After this patch, the format is converted and stored in atomic_check.
However, we should verify the existing
`drm_atomic_helper_check_plane_state()` call (if any) happens after our
format validation. Looking at the patch, I don't see where plane state
validation happens.
```

However, the function already returns with
`drm_atomic_helper_check_plane_state()` call at the tail. It's not part
of the patch (because `git diff` just truncates at the code acquiring
the new CRTC state, which is prequisite for calling
`drm_atomic_helper_check_plane_state()` ), but always part of the
codebase.

This shows that the bot cannot see the existing codebase, but only the
patches themselves. This sounds like some problem.

Hope this could be fixed, although it sounds like this will make the
bot more token-burning.

Thanks
Icenowy

=E5=9C=A8 2026-02-12=E5=9B=9B=E7=9A=84 05:44 +1000=EF=BC=8CDave Airlie=E5=
=86=99=E9=81=93=EF=BC=9A
> Hi all,
>=20
> This came up at kernel maintainers summit, so I've been trying to see
> what I can piece together, and have a small demonstration that may be
> useful to some people.
>=20
> I didn't want to pollute the mailing list with AI patch reviews, so I
> decided to set up a public-inbox that the reviews are pushed into.
> This isn't currently automated, I'm just asking claude to pull the
> last 2-3 days of patches and review what is new every so often.
>=20
> The workflow use lei to pull mails to local PC, use review-prompts +
> my own prompt to try and review a patch series, both as a complete
> work, and per-patch reviews, then create the reply emails and put
> them
> into a public inbox git tree for publishing.
>=20
> I've no idea if it's using review-prompts properly or at all, this is
> all very vibe coded so far.
>=20
> https://lore.gitlab.freedesktop.org/drm-ai-reviews/
>=20
> This is a public inbox, you can also git clone
>=20
> https://gitlab.freedesktop.org/drm/ai-reviews-public-inbox
>=20
> I'm currently just using my Red Hat provided claude with opus 4.6,
> until I get told I've burned enough money.
>=20
> The list below are the patches with reviews, if someone wants to look
> and give feedback on whether the reviews for their series are useful,
> find any bugs or regressions, that would be cool.
>=20
> I've bcc'd anyone who has a patch on the list.
>=20
> This is also just an experiment to see what might stick, it might
> disappear at any time, and it probably needs a lot of tuning.
>=20
> Thanks,
> Dave.
>=20
> [PATCH v2 0/2] drm/buddy: Documentation and internal helper cleanup
> [PATCH] drm/amd/display: Remove duplicate include
> [PATCH -next v9 0/3] rust: Add CList and GPU buddy allocator bindings
> [PATCH V1] accel/amdxdna: Fix suspend failure after enabling turbo
> mode
> [PATCH V1] accel/amdxdna: Fix dead lock for suspend and resume
> [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
> [PATCH v2 0/2] drm/vkms: Fix bad matrix offset component
> multiplication
> [PATCH 1/2] accel/amdxdna: Fix NULL pointer dereference in mailbox
> channel cleanup
> [PATCH] drm/msm: always recover the gpu
> [PATCH drm-misc-next] drm: verisilicon: assign git tree to drm/misc
> in
> MAINTAINERS
> [PATCH drm-misc-next 0/3] drm: verisilicon: convert drm_format to
> vs_format in atomic_check
> [PATCH v3 3/3] drm/panel: add LXD M9189A panel driver
> [PATCH v1 0/2] ARM: tegra: document Tegra20 HDMI port
> [PATCH] fbcon: Declare struct fb_info.fbcon_par as of type struct
> fbcon_par
> [PATCH v1] drm/amdgpu: fix sync handling in
> amdgpu_dma_buf_move_notify
> [PATCH v9 0/7] User readable error codes on atomic_ioctl failure
> [PATCH] accel/qaic: Fix dma_free_attrs() buffer size
> [PATCH] drm/radeon: Add HAINAN clock adjustment
> [PATCH] drm/amdgpu: Add HAINAN clock adjustment
> [PATCH v9 01/15] drm/bridge: analogix_dp: Add
> &analogix_dp_plat_data.next_bridge
> [PATCH v2 0/5] drm/ci: add new jobs, uprev IGT and mesa
> [PATCH] drm/bridge: lt9611: Remove DRM_BRIDGE_OP_MODES flag
> [PATCH 0/6] Support for the Pixel 3a XL with the Tianma panel
> [PATCH -next v8 0/3] rust: Add CList and GPU buddy allocator bindings
> [PATCH] drm/bridge: samsung-dsim: Fix memory leak in error path
> [PATCH] drm/rockchip: vop2: Use drm_err_ratelimited() for wait
> timeouts
> [PATCH] fbcon: Remove struct fbcon_display.inverse
> [PATCH 1/5] dma-mapping: avoid random addr value print out on error
> path
> [PATCH v3 2/6] drm/gem-shmem: Test for existence of page in mmap
> fault handler
> [PATCH] gpu: host1x: Fix passing zero to ERR_PTR in
> host1x_iommu_attach()
> [PATCH AUTOSEL 6.18-5.10] drm/tegra: hdmi: sor: Fix error: variable
> =E2=80=98j=E2=80=99 set but not used
> [PATCH] drm/mediatek: dsi: Store driver data before invoking
> mipi_dsi_host_register
> [PATCH] drm/i915/guc: fix corrupted copyright symbols in selftest
> files
> [PATCH v7 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
> [PATCH] drm/panel: ilitek-ili9882t: Fine-tune HFP for tianma,
> tl121bvms07-00
> [PATCH v4 1/8] drm/amdkfd: Add userptr batch allocation UAPI
> structures

