Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46025A0362
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 23:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471B610E6D3;
	Wed, 24 Aug 2022 21:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDAE10E6D3;
 Wed, 24 Aug 2022 21:45:10 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id cr9so13824960qtb.13;
 Wed, 24 Aug 2022 14:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=4nsI25kRLXhlPmTx7AXZta0SY303+lH6WK+OEZ+2KNg=;
 b=dB0TokGnMDMZC475iEleW2ahL7oILwORWq+vTd9AXK7echggTrJxmEIUZ2PQxOULpo
 3Tx4jxAGjcK4YUn5g5QMoOX+/SPC9WxrSizxINTrfwwHsK1Wz+7y+MFKbOAFHoQT2aH2
 1xj8ZYk4Kx3jGAhUTUrsFjCcj+5DeDjB39q5us32FlWhfMLHn0jSWK3zM9ODuHp1iAUe
 nyYkgz+rXLS5MqW3AuV8nDIYb/ORdj6zF0S2FyFcFY8f8Q8gEMBwMrs+18/L3dVXA3t/
 WyyTDkLG4eLTGaPo6Mi47p8SheC63tfzhuOzioqGpKc7zW9asEEr7dsolUKIYiZm9qd/
 ZLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=4nsI25kRLXhlPmTx7AXZta0SY303+lH6WK+OEZ+2KNg=;
 b=yyPtXp07/xeoZ26qterJ4nE4KHnDDCBIHMzjx3rzMm+BFt9X7TxImXCiK5j7ld7bTB
 eHFur3nIFUSTCHtkJzv22sJA6CUjYKYjRrvs6OWcU+ryZX/XfaYIkV+yg4AW/HH6goML
 9KHk4Zpe9ys6jEkXD2Vef0yXm1TA8aMV2meN8I/dGvdRkIFjiE00/2oHNt7PRxMPBYOo
 +pW8BAPB+2U2RtK/WEEkEuSHikEqFzRi93OM+R5+5Hf6QhoLLkn5KJ1yB6x73j2IY3qG
 oW52N0AzTboaUfDqzkCwf0XLjRUvSZzqs7rbsl4FQPS8+lVm2rgvYYMJitJFJ1I5+EXK
 r3gw==
X-Gm-Message-State: ACgBeo24prq2dJIz9ry64oJM7NhBhM8Ql4mJ6vi3jmvVmGolswaEG+bG
 fHKfr3QFB9rW0SC4ciiLCp9Hmio27iRlPp4Z2K4=
X-Google-Smtp-Source: AA6agR7gaWXfzWNcr9YOWxUP8sVimDUnN8ygai3ilAxUCeQx4uRj8iddJ8zpgJeU5bESmjTfJok+FrUhHNqV8YjE60I=
X-Received: by 2002:a05:622a:15c7:b0:344:5321:5874 with SMTP id
 d7-20020a05622a15c700b0034453215874mr1181293qty.506.1661377509528; Wed, 24
 Aug 2022 14:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
 <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
 <20220817160751.moqhebkiuiydraka@mail.igalia.com>
 <CABXGCsOM9An-+EeaGWm0OA1FN2p94=BF210Lhy0tiO6ye9onWQ@mail.gmail.com>
 <dd2ee57a-2ab2-db94-36d9-8faced18fe61@riseup.net>
 <CABXGCsMc_D_iJ-r-_s8q13Vq6dgfQg1tnp-0aojfv5Q8izTrfw@mail.gmail.com>
 <a588de9f-958a-fce9-b4d3-2ea45d092b44@riseup.net>
In-Reply-To: <a588de9f-958a-fce9-b4d3-2ea45d092b44@riseup.net>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 25 Aug 2022 02:44:58 +0500
Message-ID: <CABXGCsMwTWbgZ-98gcQFbCN3rqzAt01ROpqUpL1d+3gjbwUcpA@mail.gmail.com>
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 5:13 PM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> Hi Mikhail,
>
> Could you please specify the steps to reproduce this use-after-free? I
> will try to reproduce it on the RX5700 XT and bisect the issue.
>

Hi Ma=C3=ADra, thanks for help.

I'm afraid that it will be unrealistic to reproduce, because on a
laptop with 6800M (also RDNA 2 graphics) the problem does not repeat.

Sorry for the long silence, but I was trying to bisect the problem myself.

git bisect start
# status: waiting for both good and bad commits
# good: [3d7cb6b04c3f3115719235cc6866b10326de34cd] Linux 5.19
git bisect good 3d7cb6b04c3f3115719235cc6866b10326de34cd
# status: waiting for bad commit, 1 good commit known
# bad: [7ebfc85e2cd7b08f518b526173e9a33b56b3913b] Merge tag
'net-6.0-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
git bisect bad 7ebfc85e2cd7b08f518b526173e9a33b56b3913b

# bad: [b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1] Merge tag
'drm-next-2022-08-03' of git://anongit.freedesktop.org/drm/drm
# 001: GPU hangs + use-after-free issue - https://pastebin.com/z86E9ydx
git bisect bad b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1

# good: [526942b8134cc34d25d27f95dfff98b8ce2f6fcd] Merge tag
'ata-5.20-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
# 002: good - https://pastebin.com/9qki65Sj
git bisect good 526942b8134cc34d25d27f95dfff98b8ce2f6fcd

# good: [45490ce2ff833c4ec0de66705e46ba41320860cb] nfp: flower: add
support for tunnel offload without key ID
# 003: good - https://pastebin.com/vHk5eRkw
git bisect good 45490ce2ff833c4ec0de66705e46ba41320860cb

# skip: [e23a5e14aa278858c2e3d81ec34e83aa9a4177c5] Backmerge tag
'v5.19-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux
into drm-next
# 004: GPU not switched in graphic mode - https://pastebin.com/RmqCTMLD
git bisect skip e23a5e14aa278858c2e3d81ec34e83aa9a4177c5

# bad: [b2065fb21d9a789b14f737ea90facedabadeb8a4] drm/amdgpu: fix
i2s_pdata out of bound array access
# 005: GPU hangs + use-after-free issue - https://pastebin.com/Zgw5Hc48
git bisect bad b2065fb21d9a789b14f737ea90facedabadeb8a4

# skip: [344feb7ccf764756937cfd74fa4ac5caba069c99] Merge tag
'amd-drm-next-5.20-2022-07-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
# 006: GPU not switched in graphic mode - https://pastebin.com/b8BUBE7Q
git bisect skip 344feb7ccf764756937cfd74fa4ac5caba069c99

# skip: [869b10ac8d2300327f554d83f4dbab041bf27d49] drm/amdgpu: add dm
ip block for dcn 3.1.4
# 007: GPU not switched in graphic mode - https://pastebin.com/byd7HECH
git bisect skip 869b10ac8d2300327f554d83f4dbab041bf27d49

# skip: [676ad8e997036e2f815c293b76c356fb7cc97a08] drm: rcar-du: Lift
z-pos restriction on primary plane for Gen3
# 008: GPU not switched in graphic mode - https://pastebin.com/3fXCTinb
git bisect skip 676ad8e997036e2f815c293b76c356fb7cc97a08

# skip: [5c57cbc390b166950c2e6c2f0c4edaeb0f47e97d] drm/bridge: lt9211:
Convert to drm_of_get_data_lanes_count
# 009: Build error - https://pastebin.com/rxHe9QRB
git bisect skip 5c57cbc390b166950c2e6c2f0c4edaeb0f47e97d

# skip: [6db5e0c8692e590734a7ec7455365d9cbaa15ef1] Merge tag
'drm-intel-next-2022-07-06' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
# 010: GPU not switched in graphic mode - https://pastebin.com/rqubSuc8
git bisect skip 6db5e0c8692e590734a7ec7455365d9cbaa15ef1

# skip: [5d763a9955f0fbf2681a2f1fa87c416056bd0c89] drm/amd/display:
Remove compiler warning
# 011: GPU not switched in graphic mode - https://pastebin.com/BrJs6ybP
git bisect skip 5d763a9955f0fbf2681a2f1fa87c416056bd0c89

# skip: [e6c2db2be986158afb9991d9fa8a38fe65a88516] drm/i915: Don't use
DRM_DEBUG_WARN_ON for unexpected l3bank/mslice config
# 012: GPU not switched in graphic mode - https://pastebin.com/yxppyqbD
git bisect skip e6c2db2be986158afb9991d9fa8a38fe65a88516

# bad: [cb6b81b21bd9cf09d72b7fe711be1b55001eb166] Merge tag
'drm-misc-next-fixes-2022-07-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
# 013: GPU hangs without use-after-free issue - https://pastebin.com/iRek4b=
By
git bisect bad cb6b81b21bd9cf09d72b7fe711be1b55001eb166

# skip: [48b927770f8ad3f8cf4a024a552abf272af9f592]
drm/exynos/exynos7_drm_decon: free resources when clk_set_parent()
failed.
# 014: GPU not switched in graphic mode - https://pastebin.com/ekp10xhP
git bisect skip 48b927770f8ad3f8cf4a024a552abf272af9f592

# skip: [c5da61cf5bab30059f22ea368702c445ee87171a] drm/amdgpu/display:
add missing FP_START/END checks dcn32_clk_mgr.c
# 015: GPU not switched in graphic mode - https://pastebin.com/YbskKWmA
git bisect skip c5da61cf5bab30059f22ea368702c445ee87171a

# skip: [a77f7c89e62c6dfe405a64995812746f27adc510] drm/edid: convert
drm_gtf_modes_for_range() to drm_edid
# 016: GPU not switched in graphic mode - https://pastebin.com/bA2AwkJ7
git bisect skip a77f7c89e62c6dfe405a64995812746f27adc510

# skip: [6fde8eec71796f3534f0c274066862829813b21f] drm/doc: Add KUnit
documentation
# 017: GPU not switched in graphic mode - https://pastebin.com/wiByMQDG
git bisect skip 6fde8eec71796f3534f0c274066862829813b21f

# skip: [bbded689680f0f2e65d4a57d0dfa654671052d56] drm/edid: convert
drm_edid_iter_begin() to drm_edid
# 018: GPU not switched in graphic mode - https://pastebin.com/wYjmXmHH
git bisect skip bbded689680f0f2e65d4a57d0dfa654671052d56

# skip: [c6dac00340fcd20b076cd2c3413610d1d7ade7bd] drm/vc4: hvs: Add
debugfs node that dumps the current display lists
# 019: GPU not switched in graphic mode - https://pastebin.com/JvuvfNt5
git bisect skip c6dac00340fcd20b076cd2c3413610d1d7ade7bd

# skip: [786a4f668550f8576c28d167fd50f4ef84af8ba4] drm/msm/dp: rename
second dp_display_enable()'s argument
# 020: GPU not switched in graphic mode - https://pastebin.com/428dBZad
git bisect skip 786a4f668550f8576c28d167fd50f4ef84af8ba4

# skip: [427a60c1c30e1c0e9d0800a63df51985aaf3a26a] drm/amd/display:
OVT Update on InfoFrame and Mode Management
# 021: GPU not switched in graphic mode - https://pastebin.com/m68JFsHe
git bisect skip 427a60c1c30e1c0e9d0800a63df51985aaf3a26a

# skip: [b87d39019651c9cae169396cf5ae525393084490] drm/i915/sseu:
Disassociate internal subslice mask representation from uapi
# 022: GPU not switched in graphic mode - https://pastebin.com/eVbTEj3M
git bisect skip b87d39019651c9cae169396cf5ae525393084490

# skip: [fb10dc451c0f15e3c19798a2f41d357f3f7576f5] drm/vc4: hdmi:
Correct HDMI timing registers for interlaced modes
# 023: GPU not switched in graphic mode - https://pastebin.com/dPJv2R6H
git bisect skip fb10dc451c0f15e3c19798a2f41d357f3f7576f5

# skip: [1c89b4b718168aa6cf136a984b474d663e4203b7] drm/gem-vram: Share
code between GEM VRAM's _{prepare, cleanup}_fb()
# 024: GPU not switched in graphic mode - https://pastebin.com/bjxKiY8f
git bisect skip 1c89b4b718168aa6cf136a984b474d663e4203b7

# skip: [bdd0d7e290e0e4c8f7545fff89770abbd22bd51a] drm/amd/display:
fix non-x86/PPC64 compilation
# 025: GPU not switched in graphic mode - https://pastebin.com/up0Hk998
git bisect skip bdd0d7e290e0e4c8f7545fff89770abbd22bd51a

# skip: [9569ff1a188fe48b46eb1ac2ae4543c271e0d4c2] drm/i915: Fix error
code in icl_compute_combo_phy_dpll()
# 026: GPU not switched in graphic mode - https://pastebin.com/Hq05Jnq1
git bisect skip 9569ff1a188fe48b46eb1ac2ae4543c271e0d4c2

# skip: [5074376822fe99fa4ce344b851c5016d00c0444f] drm/rockchip: Fix
an error handling path rockchip_dp_probe()
# 027: GPU not switched in graphic mode - https://pastebin.com/B6K3E7hh
git bisect skip 5074376822fe99fa4ce344b851c5016d00c0444f

# skip: [58eaa6b3fb636072a4f19e6b6c76bbf564e95b95] drm/i915/guc/slpc:
Use non-blocking H2G for waitboost
# 028: GPU not switched in graphic mode - https://pastebin.com/W9em564t
git bisect skip 58eaa6b3fb636072a4f19e6b6c76bbf564e95b95

# skip: [72bd9ea389c70ac948f48d20c0e4ae70c0153940] drm: Remove
linux/media-bus-format.h from drm_crtc.h
# 029: GPU not switched in graphic mode - https://pastebin.com/i2sDFXVc
git bisect skip 72bd9ea389c70ac948f48d20c0e4ae70c0153940

# skip: [851dd8625320fb626b6ab6399b2402fd84abcdfb] drm/amdgpu: fix
scratch register access method in SRIOV
# 030: GPU not switched in graphic mode - https://pastebin.com/0L7XA3dj
git bisect skip 851dd8625320fb626b6ab6399b2402fd84abcdfb

# skip: [d8b599bf625d1d818fdbb322a272fd2a5ea32e38] drm/bridge:
ti-sn65dsi86: Use atomic variants of drm_bridge_funcs
# 031: GPU not switched in graphic mode - https://pastebin.com/5V8KMZUv
git bisect skip d8b599bf625d1d818fdbb322a272fd2a5ea32e38

# skip: [89ed996b888faaf11c69bb4cbc19f21475c9050e]
drm/nouveau/kms/nv50-: remove unused functions
# 032: GPU not switched in graphic mode - https://pastebin.com/Md13jJmq
git bisect skip 89ed996b888faaf11c69bb4cbc19f21475c9050e

# skip: [c5cfd54e93f89c9cd5cf0f61408bf3e11c7e6684] drm/amdgpu: Fix
acronym typo in glossary
# 033: GPU not switched in graphic mode - https://pastebin.com/mX3QLTyp
git bisect skip c5cfd54e93f89c9cd5cf0f61408bf3e11c7e6684

# skip: [7fc83cd079bba8b96b0f46e31f26c8f31c814146] drm/amd/pm: support
BAMACO reset on smu_v13_0_7
# 034: GPU not switched in graphic mode - https://pastebin.com/gsLz4Q2w
git bisect skip 7fc83cd079bba8b96b0f46e31f26c8f31c814146

# skip: [3cffeffe051a961417bc26f2053bced4cff83119] drm/amd/display:
Add DCN314 DC resources
# 035: GPU not switched in graphic mode - https://pastebin.com/WnEaVEva
git bisect skip 3cffeffe051a961417bc26f2053bced4cff83119

# skip: [9e9fa6a9198b767b00f48160800128e83a038f9f] udmabuf: Set the
DMA mask for the udmabuf device (v2)
# 036: GPU not switched in graphic mode - https://pastebin.com/2wHWbaaL
git bisect skip 9e9fa6a9198b767b00f48160800128e83a038f9f

# skip: [3e7f74dcfb7233ba3f8b3879066fdd3e79f2f701] drm: rcar-du: Add
num_rpf to struct rcar_du_device_info
# 037: GPU not switched in graphic mode - https://pastebin.com/LE3K5KkF
git bisect skip 3e7f74dcfb7233ba3f8b3879066fdd3e79f2f701

# skip: [bb4f196b47b6554ba89f02ec60246f0c643a4bf8] drm/amdgpu/vcn:
support unified queue only in vcn4
# 038: GPU not switched in graphic mode - https://pastebin.com/uGEpH3Z5
git bisect skip bb4f196b47b6554ba89f02ec60246f0c643a4bf8

# skip: [e9794c88cd6cf4be4a79188916a75539751f532c] drm/i915: remove
single-use GEM_DEBUG_EXEC()
# 039: GPU not switched in graphic mode - https://pastebin.com/HF5YCX0B
git bisect skip e9794c88cd6cf4be4a79188916a75539751f532c

# skip: [06f2f7772dc7ff2e3734e654cb2d0b588076860d] drm/amd/display:
Fix eDP not light up on resume
# 040: GPU not switched in graphic mode - https://pastebin.com/grj2sMfN
git bisect skip 06f2f7772dc7ff2e3734e654cb2d0b588076860d

# skip: [8aa5bcb61612060429223d1fbb7a1c30a579fc1f] gpu: host1x: Add
context device management code
# 041: GPU not switched in graphic mode - https://pastebin.com/hWQH5ejq
git bisect skip 8aa5bcb61612060429223d1fbb7a1c30a579fc1f

# skip: [32e8ab05ed81c995b92f12b590c12ef951ca1129] drm/amd/display:
Update SW state correctly for FCLK
# 042: GPU not switched in graphic mode - https://pastebin.com/RzJdzsRJ
git bisect skip 32e8ab05ed81c995b92f12b590c12ef951ca1129

# skip: [9975af040a04ba9aef33f3ef1ca4e8f04c7223dd] drm/edid: convert
drm_detect_monitor_audio() to use cea db iter
# 043: GPU not switched in graphic mode - https://pastebin.com/z3z0xUip
git bisect skip 9975af040a04ba9aef33f3ef1ca4e8f04c7223dd

# skip: [ceb180361e3851007547c55035cd1de03f108f75] amdgpu/pm: Fix
possible array out-of-bounds if SCLK levels !=3D 2
# 044: GPU not switched in graphic mode - https://pastebin.com/0t9V7LNE
git bisect skip ceb180361e3851007547c55035cd1de03f108f75

# skip: [8db73897698ccb4eb70ab103245372569ff5a5ec] drm/edid: detect
color formats and CTA revision in all CTA extensions
# 045: GPU not switched in graphic mode - https://pastebin.com/u8QhS8ru
git bisect skip 8db73897698ccb4eb70ab103245372569ff5a5ec

Bisect had to be aborted because yesterday gcc was updated to version
12.2 which makes it impossible to build a kernel with commits prior to
0af5cb349a2c97fbabb3cede96efcde9d54b7940.

As you can see a lot of steps I marked as "skip" because on these
steps the GNOME (gdm) graphical login screen doesn't appear. GPU stuck
on boot phase.

The question I consider open is whether we are looking for
use-after-free or the GPU freeze that preceded it?

If we search for use-after-free then I should answer on commit
cb6b81b21bd9cf09d72b7fe711be1b55001eb166 - good, because here the GPU
hangs without use-after-free.

To each bisect step I added by link to related the kernel log and
build log if the build was unsuccessful.

--=20
Best Regards,
Mike Gavrilov.
