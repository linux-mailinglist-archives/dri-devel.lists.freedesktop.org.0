Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90CA3F5E1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 14:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B402610EA68;
	Fri, 21 Feb 2025 13:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M6USAzYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB8410E23E;
 Fri, 21 Feb 2025 11:05:52 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6fb2a0e4125so13594427b3.1; 
 Fri, 21 Feb 2025 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740135951; x=1740740751; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gunB4LRX8aV+G0jYfLa2H15sWh6rWaTQz6rM+eSyu8A=;
 b=M6USAzYeSa2eAKBZT4qksOCUR6ZmvYP+U5NGNeIAIi0rCicRlPKAcwLst29RIcbE44
 C4HhZ5StQFH0glQ/wRaUe5K6HkwqIIwILYy+TPmNAt4YY0ECmH6rLDxrEh3sTrorc8rV
 S78JnZxjv0l3HSAot1DrsUDTmdFgLe5YBD7PvfKBdfxLqIMSOPWaCMQ63CGoTRV+LEzL
 VL+c8/9luOJ9T3/KU7jLv82lopGOPmlNY2E/Pz9S9KZeh+Szyv9GyicbfdzdAhetS4ZE
 5eT6xO/04ejrTkcer0vfs+p1shWHCfYjrImU3GYXN6gxL8zr2rIO4M5MTQ1ajMxwSJQA
 9Rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740135951; x=1740740751;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gunB4LRX8aV+G0jYfLa2H15sWh6rWaTQz6rM+eSyu8A=;
 b=Wxj2rmgHLxpPZwiIjrVlU8bS/4SGxzFzjOLQXP/k1GI5D2RHks+9ol+XefYfH7bz/V
 uDELahMpUgLSezJAuwwmsZsik5uIFprX7jJmN4L91mcAGEXzxAFgp6pX0qRLWU55f9/A
 ANM6iySAWzhWBCuM8Yd8tnZ3xGUKFTtLEgtADIOTnRpkHxNKgX/ynVQKaI7G4P4JWo26
 S7qyr8/03eP9/S4VNpKzRgDm7ZoDLnQQDIOs4YCV+JfzF6JjoQIQVzjTjI4oWmwOCE42
 kw76z7VZa2uAy/LwIoiVCKWxETdsI37z16wmD85gtaz2qE8qp6//y86XIgmApbwi76k/
 WCcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnWTJM/A/rcYKyC8Y2t/94tGmO/Ny6F5aN5E6eWffJ29+2/FEIID+oKymYZ5utl9QWrX3HKVQdQVc=@lists.freedesktop.org,
 AJvYcCXGuzHebtk2odYpEDh4qzD0+O9wVfgQSnIwLLiPXlHWS9kRDyiBChP65kqwth15g7BjOX7YfZnLpA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyExIbA+BtnxIIy86Ii+L+6pU+xK6aB0lNp4Fpa5cbWKZAdFINU
 jyENeRAZaFI6XalywegEpurtaikvxaSxcF1GLcuGVoA/A4r7X4jCiuxOJq/g2b8G/emm/dV+JF5
 ZrXsXTbtPnhQdJwlapcQt6YikHoU=
X-Gm-Gg: ASbGncvcPDXhEsK2FX7qnxhs6tVHpreeoA1OcK+AJPWKMabABdmZeK/qckHstHFKt5A
 9JlydtzFJPYAc8alCFSfzC53Vws1KveH/FqdnsWkGcrlnMXf22RABHOVc4JJjdA9OtMZmYgkxPl
 W3PegmwhfEGsl8FFxZA8DVvhEao56+8O0b5sXNAnk=
X-Google-Smtp-Source: AGHT+IGcNYkZlPLZDFbygZOoiCOiB6YrgPJ7xyUuzTxVkIstWsYq4PBh61ZD33pRFaRXqItP5Yn2tzZKVPKab72Uk3E=
X-Received: by 2002:a05:690c:3341:b0:6f7:5605:c63c with SMTP id
 00721157ae682-6fbcc3721e9mr23673387b3.30.1740135950804; Fri, 21 Feb 2025
 03:05:50 -0800 (PST)
MIME-Version: 1.0
From: Gonsolo <gonsolo@gmail.com>
Date: Fri, 21 Feb 2025 12:05:39 +0100
X-Gm-Features: AWEUYZmA3O0TQTJbuud3xwlDz31l7eWQGm2zkfeDJxmrBIJT_gk4aoMNYT2cBGs
Message-ID: <CANL0fFRwt390+Wa0DMZHYARdjV6m71yGH=W66Y0pzRyUDmoR2Q@mail.gmail.com>
Subject: Blender crash with nouveau
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Zhi Wang <zhiw@nvidia.com>, 
 Sid Pranjale <sidpranjale127@protonmail.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Feb 2025 13:26:55 +0000
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

Hi!

Blender crashes when trying to set a shader in the GUI.

Also reported here: https://gitlab.freedesktop.org/mesa/mesa/-/issues/12656

dmesg:

[21. Feb 11:19] nouveau 0000:41:00.0: gsp: rc engn:00000001 chid:112
type:13 scope:1 part:233
[  +0,000010] nouveau 0000:41:00.0:
fifo:c00000:000e:0070:[blender[14688]] errored - disabling channel
[  +0,000008] nouveau 0000:41:00.0: blender[14688]: channel 112 killed!

...

Stacktrace:

#0  pushbuf_dump () at
../mesa-24.3.4/src/gallium/winsys/nouveau/drm/nouveau.c:1122
#1  0x00007fff8588fefd in pushbuf_submit () at
../mesa-24.3.4/src/gallium/winsys/nouveau/drm/nouveau.c:1195
#2  pushbuf_flush () at
../mesa-24.3.4/src/gallium/winsys/nouveau/drm/nouveau.c:1233
#3  0x00007fff858907a4 in pushbuf_validate () at
../mesa-24.3.4/src/gallium/winsys/nouveau/drm/nouveau.c:1539
#4  0x00007fff85e3861b in PUSH_VAL () at
../mesa-24.3.4/src/gallium/drivers/nouveau/nouveau_winsys.h:107
#5  nve4_m2mf_copy_linear () at
../mesa-24.3.4/src/gallium/drivers/nouveau/nvc0/nvc0_transfer.c:330
#6  0x00007fff85e4304d in nouveau_copy_buffer () at
../mesa-24.3.4/src/gallium/drivers/nouveau/nouveau_buffer.c:591
#7  0x00007fff85003629 in bufferobj_copy_subdata () at
../mesa-24.3.4/src/mesa/main/bufferobj.c:583
#8  0x00007fff8500eb07 in copy_buffer_sub_data () at
../mesa-24.3.4/src/mesa/main/bufferobj.c:3333
#9  _mesa_CopyNamedBufferSubData () at
../mesa-24.3.4/src/mesa/main/bufferobj.c:3488
#10 0x000055555a67c82d in
blender::gpu::GLStorageBuf::async_flush_to_host (this=0x7fff4ddbc840)
    at /usr/src/debug/blender/blender/source/blender/gpu/opengl/gl_storage_buffer.cc:203
#11 0x00005555579ff049 in
blender::draw::detail::StorageCommon<blender::eevee::ShadowStatistics,
1l, false>::async_flush_to_host (this=0x7fff50885920)
    at /usr/src/debug/blender/blender/source/blender/draw/intern/DRW_gpu_wrapper.hh:251
#12 blender::eevee::ShadowModule::set_view (this=0x7fff50884d58,
view=..., extent=extent@entry=...)
    at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_shadow.cc:1331
#13 0x00005555579deb5b in blender::eevee::DeferredLayer::render
(this=this@entry=0x7fff50882608, main_view=..., render_view=...,
prepass_fb=..., combined_fb=...,
    gbuffer_fb=..., extent=..., rt_buffer=..., radiance_behind_tx=0x0)
at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_pipeline.cc:829
#14 0x00005555579dfa51 in blender::eevee::DeferredPipeline::render
(this=0x7fff50882608, main_view=..., render_view=..., prepass_fb=...,
combined_fb=...,
    gbuffer_fb=..., extent=..., rt_buffer_opaque_layer=...,
rt_buffer_refract_layer=...)
    at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_pipeline.cc:989
#15 0x0000555557a17d05 in blender::eevee::ShadingView::render
(this=this@entry=0x7fff50a8f2b0)
    at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_view.cc:130
#16 0x00005555579a84b9 in blender::eevee::MainView::render
(this=<optimized out>)
    at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_view.hh:139
#17 blender::eevee::Instance::render_sample (this=this@entry=0x7fff50880400)
    at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_instance.cc:417
#18 0x00005555579a98f8 in blender::eevee::Instance::render_frame
(this=this@entry=0x7fff50880400, engine=engine@entry=0x7fff91849388,
    render_layer=render_layer@entry=0x7fff9181afc8,
view_name=view_name@entry=0x7fff9183e598 "")
    at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_instance.cc:511
#19 0x0000555557982c37 in eevee_render_to_image
(vedata=0x7fff9187ec18, engine=0x7fff91849388, layer=0x7fff9181afc8)
    at /usr/src/debug/blender/blender/source/blender/draw/engines/eevee_next/eevee_engine.cc:170
#20 0x00005555579300b0 in DRW_render_to_image (engine=0x7fff91849388,
depsgraph=<optimized out>)
    at /usr/src/debug/blender/blender/source/blender/draw/intern/draw_manager_c.cc:2049
#21 0x0000555558c36270 in engine_render_view_layer (re=0x7fff9183d018,
engine=0x7fff91849388, view_layer_iter=<optimized out>,
use_engine=<optimized out>,
    use_grease_pencil=true) at
/usr/src/debug/blender/blender/source/blender/render/intern/engine.cc:919
#22 0x0000555558c36ec0 in RE_engine_render (re=0x7fff9183d018,
do_all=<optimized out>) at
/usr/src/debug/blender/blender/source/blender/render/intern/engine.cc:1075
--Type <RET> for more, q to quit, c to continue without paging--
#23 0x0000555558c3eac4 in RE_PreviewRender (re=0x7fff9183d018,
bmain=0x7fff5bd39d08, sce=0x7fff5c2a7820)
    at /usr/src/debug/blender/blender/source/blender/render/intern/pipeline.cc:2652
#24 0x00005555588c846a in shader_preview_render (sp=<optimized out>,
id=0x7fff648cd0a0, split=split@entry=0, first=first@entry=0)
    at /usr/src/debug/blender/blender/source/blender/editors/render/render_preview.cc:1224

...

Output:

EGL Error (0x3009): EGL_BAD_MATCH: Arguments are inconsistent (for
example, a valid context requires buffers not supplied by a valid
surface).
...
nouveau: kernel rejected pushbuf: No such device
nouveau: ch72: krec 0 pushes 1 bufs 18 relocs 0
nouveau: ch72: buf 00000000 00000018 00000004 00000004 00000000
0x7b15ca07e000 0x5c80000 0x80000
nouveau: ch72: buf 00000001 00000051 00000004 00000004 00000000
0x7b15ad400000 0x9407000 0x200000
nouveau: ch72: buf 00000002 000000a2 00000002 00000002 00000002 (nil)
0x14800000 0x20000000
nouveau: ch72: buf 00000003 000000eb 00000002 00000002 00000002 (nil)
0x60e0000 0x100000
nouveau: ch72: buf 00000004 000000a0 00000002 00000002 00000002 (nil)
0x9666000 0x1000
nouveau: ch72: buf 00000005 000000b3 00000002 00000002 00000002 (nil)
0x6200000 0x400000
nouveau: ch72: buf 00000006 000000b5 00000002 00000002 00000002 (nil)
0x34800000 0x1600000
nouveau: ch72: buf 00000007 000000d7 00000002 00000002 00000002 (nil)
0xe871000 0x1000
nouveau: ch72: buf 00000008 00000067 00000002 00000002 00000000 (nil)
0xc640000 0x20000
nouveau: ch72: buf 00000009 000000ab 00000002 00000002 00000000 (nil)
0x7840000 0x20000
nouveau: ch72: buf 0000000a 0000003f 00000002 00000002 00000000 (nil)
0x79c0000 0x20000
nouveau: ch72: buf 0000000b 00000008 00000002 00000002 00000000 (nil)
0x4d0000 0xd0000
nouveau: ch72: buf 0000000c 0000000a 00000002 00000002 00000000 (nil)
0x5a0000 0x20000
nouveau: ch72: buf 0000000d 00000009 00000002 00000002 00000002 (nil)
0x1a00000 0x3a00000
nouveau: ch72: buf 0000000e 00000006 00000004 00000000 00000004
0x7b1638f91000 0x21c000 0x1000
nouveau: ch72: buf 0000000f 00000007 00000002 00000002 00000002 (nil)
0x450000 0x80000
nouveau: ch72: buf 00000010 000000d2 00000002 00000002 00000002 (nil)
0x9610000 0x20000
nouveau: ch72: buf 00000011 000000ee 00000004 00000004 00000004 (nil)
0x61e2000 0x1000
nouveau: ch72: psh 00000000 0000077a48 000007a26c
[0x00000000] HDR 80000044 subch 0 IMMD
mthd 0110 NVC797_WAIT_FOR_IDLE
.V = (0x0)

[0x00000001] HDR 20024062 subch 2 NINC
mthd 0188 NVA140_OFFSET_OUT_UPPER
.VALUE = 0x0
mthd 018c NVA140_OFFSET_OUT
.VALUE = 0x459c00

[0x00000004] HDR 20024060 subch 2 NINC
mthd 0180 NVA140_LINE_LENGTH_IN
.VALUE = 0x1ff8
mthd 0184 NVA140_LINE_COUNT
.VALUE = 0x1

[0x00000007] HDR a7ff406c subch 2 1INC
mthd 01b0 NVA140_LAUNCH_DMA
.VALUE = 0x1001
mthd 01b4 NVA140_LOAD_INLINE_DATA
.VALUE = 0x7919
mthd 01b4 NVA140_LOAD_INLINE_DATA
.VALUE = 0x0
mthd 01b4 NVA140_LOAD_INLINE_DATA
.VALUE = 0x2000
mthd 01b4 NVA140_LOAD_INLINE_DATA
.VALUE = 0xe1e00
mthd 01b4 NVA140_LOAD_INLINE_DATA
.VALUE = 0x7812


...

[0x000009dd] HDR 20022062 subch 1 NINC
mthd 0188 NVC7C0_OFFSET_OUT_UPPER
.VALUE = (0x0)
mthd 018c NVC7C0_OFFSET_OUT
.VALUE = (0x580120)

[0x000009e0] HDR 20022060 subch 1 NINC
mthd 0180 NVC7C0_LINE_LENGTH_IN
.VALUE = (0x10)
mthd 0184 NVC7C0_LINE_COUNT
.VALUE = (0x1)

[0x000009e3] HDR a005206c subch 1 1INC
mthd 01b0 NVC7C0_LAUNCH_DMA
.DST_MEMORY_LAYOUT = PITCH
.COMPLETION_TYPE = FLUSH_DISABLE
.INTERRUPT_TYPE = NONE
.SEMAPHORE_STRUCT_SIZE = FOUR_WORDS
.REDUCTION_ENABLE = FALSE
.REDUCTION_OP = RED_ADD
.REDUCTION_FORMAT = UNSIGNED_32
.SYSMEMBAR_DISABLE = TRUE
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x9614000)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x0)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x4000)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x0)

[0x000009e9] HDR 200125a6 subch 1 NINC
mthd 1698 NVC7C0_INVALIDATE_SHADER_CACHES_NO_WFI
.INSTRUCTION = FALSE
.GLOBAL_DATA = FALSE
.CONSTANT = TRUE

[0x000009eb] HDR 20022062 subch 1 NINC
mthd 0188 NVC7C0_OFFSET_OUT_UPPER
.VALUE = (0x0)
mthd 018c NVC7C0_OFFSET_OUT
.VALUE = (0x580100)

[0x000009ee] HDR 20022060 subch 1 NINC
mthd 0180 NVC7C0_LINE_LENGTH_IN
.VALUE = (0x20)
mthd 0184 NVC7C0_LINE_COUNT
.VALUE = (0x1)

[0x000009f1] HDR a009206c subch 1 1INC
mthd 01b0 NVC7C0_LAUNCH_DMA
.DST_MEMORY_LAYOUT = PITCH
.COMPLETION_TYPE = FLUSH_DISABLE
.INTERRUPT_TYPE = NONE
.SEMAPHORE_STRUCT_SIZE = FOUR_WORDS
.REDUCTION_ENABLE = FALSE
.REDUCTION_OP = RED_ADD
.REDUCTION_FORMAT = UNSIGNED_32
.SYSMEMBAR_DISABLE = TRUE
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x40)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x1)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x1)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x1)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x1)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x1)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x0)
mthd 01b4 NVC7C0_LOAD_INLINE_DATA
.V = (0x0)

[0x000009fb] HDR 200125a6 subch 1 NINC
mthd 1698 NVC7C0_INVALIDATE_SHADER_CACHES_NO_WFI
.INSTRUCTION = FALSE
.GLOBAL_DATA = FALSE
.CONSTANT = TRUE

[0x000009fd] HDR 200120ad subch 1 NINC
mthd 02b4 NVC7C0_SEND_PCAS_A
.QMD_ADDRESS_SHIFTED8 = (0x94262)

[0x000009ff] HDR 600220b0 subch 1 0INC
mthd 02c0 NVC7C0_SEND_SIGNALING_PCAS2_B
.VALUE = 0x1
mthd 02c0 NVC7C0_SEND_SIGNALING_PCAS2_B
.VALUE = 0x2

[0x00000a02] HDR 20012044 subch 1 NINC
mthd 0110 NVC7C0_WAIT_FOR_IDLE
.V = (0x0)

[0x00000a04] HDR 200406c0 subch 0 NINC
mthd 1b00 NVC797_SET_REPORT_SEMAPHORE_A
.OFFSET_UPPER = (0x0)
mthd 1b04 NVC797_SET_REPORT_SEMAPHORE_B
.OFFSET_LOWER = (0x21c000)
mthd 1b08 NVC797_SET_REPORT_SEMAPHORE_C
.PAYLOAD = (0x6d9)
mthd 1b0c NVC797_SET_REPORT_SEMAPHORE_D
.OPERATION = RELEASE
.RELEASE = AFTER_ALL_PRECEEDING_WRITES_COMPLETE
.ACQUIRE = BEFORE_ANY_FOLLOWING_WRITES_START
.PIPELINE_LOCATION = ALL
.COMPARISON = EQ
.AWAKEN_ENABLE = FALSE
.REPORT = NONE
.STRUCTURE_SIZE = ONE_WORD
.SUB_REPORT = (0x0)
.REPORT_DWORD_NUMBER = (0x0)
.FLUSH_DISABLE = FALSE
.REDUCTION_ENABLE = FALSE
.REDUCTION_OP = RED_ADD
.REDUCTION_FORMAT = UNSIGNED_32
.CONDITIONAL_TRAP = FALSE

nouveau: kernel rejected pushbuf: No such device
nouveau: ch72: krec 0 pushes 1 bufs 0 relocs 0
Writing: /tmp/blender.crash.txt
Compilation Subprocess: Lost parent process
Compilation Subprocess: Lost parent process
Compilation Subprocess: Lost parent process
Compilation Subprocess: Lost parent process
Compilation Subprocess: Lost parent process
Compilation Subprocess: Lost parent process
Compilation Subprocess: Lost parent process
Compilation Subprocess: Lost parent process

Latest Arch Linux

Kernel version 6.13.3-arch1-1

Blender 4.3.2

Mesa 24.3.4

Thanks
-- 
g
