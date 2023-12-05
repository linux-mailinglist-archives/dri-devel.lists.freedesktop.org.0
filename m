Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC30804DBB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F1710E232;
	Tue,  5 Dec 2023 09:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 05 Dec 2023 09:25:49 UTC
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF0F10E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:25:49 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f143:dd2b:2cfe:eb7c])
 by xavier.telenet-ops.be with bizsmtp
 id JZLk2B00X5Tnyl201ZLk4P; Tue, 05 Dec 2023 10:20:46 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rARbg-00B2oN-N4;
 Tue, 05 Dec 2023 10:20:44 +0100
Date: Tue, 5 Dec 2023 10:20:44 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>
Subject: amdgpu header files (was: Re: [git pull] drm for 6.7-rc1)
In-Reply-To: <CAPM=9txd+1FtqU-R_8Zr_UePUzu7QUWsDBV1syKBo16v_gx2XQ@mail.gmail.com>
Message-ID: <45db1e4b-afbe-8bf5-6c4-945bdacb11f3@linux-m68k.org>
References: <CAPM=9txd+1FtqU-R_8Zr_UePUzu7QUWsDBV1syKBo16v_gx2XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
 dri-devel <dri-devel@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023, Dave Airlie wrote:
> This is the main drm pull request for 6.7.

> Highlights:
> - AMD adds some more upcoming HW platforms

> Alex Deucher (24):
>      drm/amdgpu: update to the latest GC 11.5 headers

> Candice Li (8):
>      drm/amd: Add umc v12_0_0 ip headers

> Lang Yu (57):
>      drm/amdgpu: add gc headers for gc 11.5.0
>      drm/amdgpu: add mmhub 3.3.0 headers
>      drm/amdgpu: add VPE 6.1.0 header files
>      drm/amdgpu: add UMSCH 4.0 register headers

> Li Ma (11):
>      drm/amdgpu: add header files for MP 14.0.0
>      drm/amdgpu: fix missing stuff in NBIO v7.11

> Qingqing Zhuo (38):
>      drm/amd/display: Add dcn35 register header files

> Saleemkhan Jamadar (9):
>      drm/amdgpu: add vcn 4_0_5 header files

> Yang Wang (16):
>      drm/amd/pm: add smu_13_0_6 mca dump support

> benl (3):
>      drm/amdgpu: add nbio 7.11 registers

> .../amd/include/asic_reg/dcn/dcn_3_5_0_offset.h    | 15255 +++++
> .../amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h   | 53412 +++++++++++++++++
> .../drm/amd/include/asic_reg/gc/gc_11_5_0_offset.h | 10000 ++++
> .../amd/include/asic_reg/gc/gc_11_5_0_sh_mask.h    | 36579 ++++++++++++
> .../include/asic_reg/mmhub/mmhub_3_3_0_offset.h    |  1395 +
> .../include/asic_reg/mmhub/mmhub_3_3_0_sh_mask.h   |  6722 +++
> .../amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h    |    28 +
> .../drm/amd/include/asic_reg/mp/mp_14_0_0_offset.h |   359 +
> .../amd/include/asic_reg/mp/mp_14_0_0_sh_mask.h    |   534 +
> .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |  9400 +++
> .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    | 57857 +++++++++++++++++++
> .../amd/include/asic_reg/umc/umc_12_0_0_offset.h   |    33 +
> .../amd/include/asic_reg/umc/umc_12_0_0_sh_mask.h  |    95 +
> .../amd/include/asic_reg/vcn/vcn_4_0_0_offset.h    |   422 +
> .../amd/include/asic_reg/vcn/vcn_4_0_0_sh_mask.h   |   882 +
> .../amd/include/asic_reg/vcn/vcn_4_0_5_offset.h    |  1797 +
> .../amd/include/asic_reg/vcn/vcn_4_0_5_sh_mask.h   |  8614 +++
> .../amd/include/asic_reg/vpe/vpe_6_1_0_offset.h    |  1553 +
> .../amd/include/asic_reg/vpe/vpe_6_1_0_sh_mask.h   |  4393 ++

These huge files can be reduced by 50%: all the *_SHIFT definitions are
redundant, as they can be derived from the corresponding *_MASK
definitions at compile-time, cfr. <linux/bitfield.h>.

E.g.:

#define AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER__SHIFT        0x0
#define AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER_RESET__SHIFT  0xf
#define AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER_MASK          0x00FFL
#define AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER_RESET_MASK    0x8000L

AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER__SHIFT =
 	__bf_shf(AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER_MASK)
AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER_RESET__SHIFT =
 	__bf_shf(AZCONTROLLER0_CORB_READ_POINTER__CORB_READ_POINTER_RESET_MASK)

set_reg_field_value_masks() takes a shift and a mask, while it
could calculate the shift at run-time.
set_reg_field_values() takes pairs of shifts and masks, but the shifts
are not needed; lots of tables can be halved, etc...

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
