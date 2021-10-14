Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F442DB94
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 16:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBD76EB28;
	Thu, 14 Oct 2021 14:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC416EB30
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634221852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qjxkd6qIxa6afij1vTqNqr+MC+NtBXcpce6L9f194Qw=;
 b=CDeqSewIKXdJ7k6v1wQI03oMNq+4YVI94kIAh2ZDm2m7r6kU9XN77Hs2Z0RsUxFWD2HVOm
 Jgy0kVCIzxIA6wpwGo2qPzwrRNXAg//xqXPqblUOqZsWM76LfHxyLjZWEZulIA2aCRk1x8
 93crCpSewwbZBngOJiCywdd2ehSHQzc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-yAtoR-uQMk6nhU7EcxkaRg-1; Thu, 14 Oct 2021 10:30:51 -0400
X-MC-Unique: yAtoR-uQMk6nhU7EcxkaRg-1
Received: by mail-ed1-f72.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so5298122edl.17
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 07:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qjxkd6qIxa6afij1vTqNqr+MC+NtBXcpce6L9f194Qw=;
 b=EZSPWspPu1o1W1YBRuIUgdRCj/NtBd5tyQUEIOhs4nt5FQZY4LjMk5GqreBkiIVm1R
 iEoK3nRSovtVsJek/oBXFoipnP95ovGXohPq67tFFd+pyuI4hTVYlGDODUWfEZ/mZJtR
 xKhZOHP5Z581K/MHnmONN8iHg+USflgzvUrwh/a2taCYdwATjp9JNdBLZCQlsV9GAXl5
 Zlxq3P9R6TqXZLrkL8tpZYOLCrXz/j9cSpH4xhnzeydsQf35zYpLw38ei91ONtOOjhE8
 vtmIvYK8oC3pObEZyLCut5Izzj7wVWBMVaqfjMsKKvnoPK5NQ/duEDzG6xUG5E7gO5Vi
 VNNg==
X-Gm-Message-State: AOAM530Swoszgkkb8omBS/pL/FzWZ7xCQpqhGK01ZzwtvXJrZ4624Yhs
 LXJDDQglLqKQoZ/0+zM0KGzFPZJ5T5YVRcWCusG0CUv9YyY8ulxdJeR0RX3SS2Ik6QUwl/Tl3K3
 4u5L8w3nTJZxSk1EFgIvN5d5GinMa
X-Received: by 2002:a17:907:7ba8:: with SMTP id
 ne40mr4054139ejc.335.1634221850283; 
 Thu, 14 Oct 2021 07:30:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPOu4t8z30VvQcwYxIwLoEy5kn2EUQYMs3skWQhi1HQfLZ4CKTI1pxvHqzXeaTSd0eWFgjfQ==
X-Received: by 2002:a17:907:7ba8:: with SMTP id
 ne40mr4054108ejc.335.1634221849994; 
 Thu, 14 Oct 2021 07:30:49 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id g22sm2088225ejd.33.2021.10.14.07.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 07:30:49 -0700 (PDT)
Subject: Re: [Intel-gfx] [PULL] drm-misc-next
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
References: <20211014120452.2wicnt6hobu3kbwb@gilmour>
 <c78e0488-249f-5cb4-8cca-f64dcb13bd45@redhat.com>
Message-ID: <6f5ce650-6e06-955a-c079-e8f916e8bbd9@redhat.com>
Date: Thu, 14 Oct 2021 16:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c78e0488-249f-5cb4-8cca-f64dcb13bd45@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi,

On 10/14/21 3:24 PM, Hans de Goede wrote:
> Hi,
> 
> On 10/14/21 2:04 PM, Maxime Ripard wrote:
>> Hi Dave, Daniel,
>>
>> Here's this week drm-misc-next PR
>>
>> Maxime
>>
>> drm-misc-next-2021-10-14:
>> drm-misc-next for 5.16:
> 
> Ugh, this just missed the drm-privacy-screen work which I just pushed
> out to drm-misc-next (I was waiting for the last i915 integration patch
> to get reviewed).
> 
> It would be nice if we can still get the drm-privacy-screen work
> included into 5.16. But if it is too late I understand.

Thinking more about this, delaying this till 5.17 is fine, that
will nicely align its release with GNOME42 which will be the
first userspace to support this; and it will give it a nice long
time to find any issues in -next (not that I expect any).

Regards,

Hans


>> UAPI Changes:
>>
>> Cross-subsystem Changes:
>>
>> Core Changes:
>>   - fbdev: Fix double-free, Remove unused scrolling acceleration
>>   - locking: improve logging for contented locks without backoff
>>   - dma-buf: Add dma_resv_for_each_fence iterator, and conversion of
>>     users
>>
>> Driver Changes:
>>   - nouveau: Various code style improvements
>>   - bridge: HPD improvements for lt9611uxc, eDP aux-bus support for
>>     ps8640, lvds-codec data-mapping selection support
>>   - panels: Vivax TPC-9150, Innolux G070Y2-T02, LOGIC Technologies
>>     LTTD800480070-L2RT, Sharp LS060T1SX01,
>> The following changes since commit 9962601ca5719050906915c3c33a63744ac7b15c:
>>
>>   drm/bridge: dw-hdmi-cec: Make use of the helper function devm_add_action_or_reset() (2021-10-06 11:21:46 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-10-14
>>
>> for you to fetch changes up to b3ec8cdf457e5e63d396fe1346cc788cf7c1b578:
>>
>>   fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list) (2021-10-13 15:29:23 +0200)
>>
>> ----------------------------------------------------------------
>> drm-misc-next for 5.16:
>>
>> UAPI Changes:
>>
>> Cross-subsystem Changes:
>>
>> Core Changes:
>>   - fbdev: Fix double-free, Remove unused scrolling acceleration
>>   - locking: improve logging for contented locks without backoff
>>   - dma-buf: Add dma_resv_for_each_fence iterator, and conversion of
>>     users
>>
>> Driver Changes:
>>   - nouveau: Various code style improvements
>>   - bridge: HPD improvements for lt9611uxc, eDP aux-bus support for
>>     ps8640, lvds-codec data-mapping selection support
>>   - panels: Vivax TPC-9150, Innolux G070Y2-T02, LOGIC Technologies
>>     LTTD800480070-L2RT, Sharp LS060T1SX01,
>>
>> ----------------------------------------------------------------
>> Alex Xu (Hello71) (1):
>>       drm/plane-helper: fix uninitialized variable reference
>>
>> Amos Kong (1):
>>       drm/ttm_bo_api: update the description for @placement and @sg
>>
>> Christian König (7):
>>       dma-buf: add dma_resv_for_each_fence v3
>>       dma-buf: use the new iterator in dma_buf_debug_show
>>       dma-buf: use the new iterator in dma_resv_poll
>>       drm/ttm: use the new iterator in ttm_bo_flush_all_fences
>>       drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2
>>       drm/i915: use the new iterator in i915_request_await_object v2
>>       drm: use new iterator in drm_gem_fence_array_add_implicit v3
>>
>> Claudio Suarez (1):
>>       fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)
>>
>> Dan Carpenter (1):
>>       drm/v3d: fix copy_from_user() error codes
>>
>> David Heidelberg (1):
>>       dt-bindings: display: simple: hardware can use ddc-i2c-bus
>>
>> Dmitry Baryshkov (5):
>>       drm/bridge/lontium-lt9611uxc: fix provided connector suport
>>       dt-bindings: add bindings for the Sharp LS060T1SX01 panel
>>       drm/panel: Add support for Sharp LS060T1SX01 panel
>>       dt-bindings: add bindings for the Sharp LS060T1SX01 panel
>>       drm/panel: Add support for Sharp LS060T1SX01 panel
>>
>> Guido Günther (5):
>>       drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
>>       drm/panel: mantix: Add media bus format
>>       drm/panel: st7703: Add media bus format
>>       drm: mxsfb: Print failed bus format in hex
>>       drm: mxsfb: Set fallback bus format when the bridge doesn't provide one
>>
>> Jani Nikula (1):
>>       drm/locking: add backtrace for locking contended locks without backoff
>>
>> Jing Xiangfeng (1):
>>       drm/virtio: fix the missed drm_gem_object_put() in virtio_gpu_user_framebuffer_create()
>>
>> Karol Herbst (1):
>>       drm/nouveau/mmu/gp100: remove unused variable
>>
>> Lee Jones (1):
>>       drm/nouveau/nouveau_bo: Remove unused variables 'dev'
>>
>> Luo penghao (2):
>>       drm/nouveau/mmu: drop unneeded assignment in the nvkm_uvmm_mthd_page()
>>       drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.
>>
>> Marek Vasut (3):
>>       drm/bridge: ti-sn65dsi83: Implement .detach callback
>>       dt-bindings: display: bridge: lvds-codec: Document LVDS data mapping select
>>       drm/bridge: lvds-codec: Add support for LVDS data mapping select
>>
>> Nikola Pavlica (2):
>>       dt-bindings: add vendor prefix for Vivax
>>       dt-bindings: display: simple: Add Vivax TPC-9150 panel
>>
>> Oleksij Rempel (1):
>>       dt-bindings: display: simple: add Innolux G070Y2-T02 panel
>>
>> Philip Chen (1):
>>       dt-bindings: drm/bridge: ps8640: Add aux-bus child
>>
>> Randy Dunlap (1):
>>       drm/connector: fix all kernel-doc warnings
>>
>> Sam Ravnborg (2):
>>       Revert "drm/panel: Add support for Sharp LS060T1SX01 panel"
>>       Revert "dt-bindings: add bindings for the Sharp LS060T1SX01 panel"
>>
>> Simon Ser (1):
>>       drm/connector: refer to CTA-861-G in the "content type" prop docs
>>
>> Søren Andersen (1):
>>       drm/panel: panel-simple: add LOGIC Technologies LTTD800480070-L2RT panel
>>
>> Tvrtko Ursulin (1):
>>       dma-resv: Fix dma_resv_get_fences and dma_resv_copy_fences after conversion
>>
>> Uwe Kleine-König (1):
>>       drm/panel: s6e63m0: Make s6e63m0_remove() return void
>>
>> Yang Yingliang (1):
>>       drm/nouveau/gem: remove redundant semi-colon
>>
>> Zheyu Ma (1):
>>       fbdev: fbmem: Fix double free of 'fb_info->pixmap.addr'
>>
>> yong yiran (1):
>>       drm/nouveau/nvenc: remove duplicate include in base.c
>>
>>  .../bindings/display/bridge/lvds-codec.yaml        |  33 +-
>>  .../devicetree/bindings/display/bridge/ps8640.yaml |  19 +-
>>  .../bindings/display/panel/panel-simple.yaml       |   5 +
>>  .../bindings/display/panel/sharp,ls060t1sx01.yaml  |  56 +++
>>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>>  Documentation/gpu/todo.rst                         |  13 +-
>>  drivers/dma-buf/dma-buf.c                          |  60 +--
>>  drivers/dma-buf/dma-resv.c                         |  69 ++-
>>  drivers/gpu/drm/Kconfig                            |  15 +
>>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   9 +-
>>  drivers/gpu/drm/bridge/lvds-codec.c                |  76 ++-
>>  drivers/gpu/drm/bridge/nwl-dsi.c                   |  35 ++
>>  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  17 +-
>>  drivers/gpu/drm/drm_connector.c                    |  32 +-
>>  drivers/gpu/drm/drm_gem.c                          |  26 +-
>>  drivers/gpu/drm/drm_modeset_lock.c                 |  49 +-
>>  drivers/gpu/drm/drm_plane_helper.c                 |   1 -
>>  drivers/gpu/drm/i915/i915_request.c                |  34 +-
>>  drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   8 +-
>>  drivers/gpu/drm/nouveau/nouveau_bo.c               |   4 -
>>  drivers/gpu/drm/nouveau/nouveau_gem.c              |   2 +-
>>  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c   |   1 -
>>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     |   2 +-
>>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |   4 +-
>>  drivers/gpu/drm/panel/Kconfig                      |  10 +
>>  drivers/gpu/drm/panel/Makefile                     |   1 +
>>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   9 +
>>  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   3 +-
>>  drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |   3 +-
>>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   4 +-
>>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.h      |   2 +-
>>  drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    | 333 ++++++++++++++
>>  drivers/gpu/drm/panel/panel-simple.c               |  35 ++
>>  drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   8 +
>>  drivers/gpu/drm/scheduler/sched_main.c             |  26 +-
>>  drivers/gpu/drm/ttm/ttm_bo.c                       |  16 +-
>>  drivers/gpu/drm/v3d/v3d_gem.c                      |  13 +-
>>  drivers/gpu/drm/virtio/virtgpu_display.c           |   4 +-
>>  drivers/video/fbdev/core/bitblit.c                 |  16 -
>>  drivers/video/fbdev/core/fbcon.c                   | 509 +--------------------
>>  drivers/video/fbdev/core/fbcon.h                   |  59 ---
>>  drivers/video/fbdev/core/fbcon_ccw.c               |  28 +-
>>  drivers/video/fbdev/core/fbcon_cw.c                |  28 +-
>>  drivers/video/fbdev/core/fbcon_rotate.h            |   9 -
>>  drivers/video/fbdev/core/fbcon_ud.c                |  37 +-
>>  drivers/video/fbdev/core/fbmem.c                   |   5 +-
>>  drivers/video/fbdev/core/tileblit.c                |  16 -
>>  drivers/video/fbdev/skeletonfb.c                   |  12 +-
>>  include/drm/drm_modeset_lock.h                     |   8 +
>>  include/drm/ttm/ttm_bo_api.h                       |   6 +-
>>  include/linux/dma-resv.h                           |  25 +-
>>  include/linux/fb.h                                 |   2 +-
>>  52 files changed, 939 insertions(+), 860 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
>>  create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
>>

