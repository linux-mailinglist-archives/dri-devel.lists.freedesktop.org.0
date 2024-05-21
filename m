Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0F8CB0CB
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8156310E05B;
	Tue, 21 May 2024 14:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rbp/H0XN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569B210E05B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 14:55:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42011507a54so21157025e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716303326; x=1716908126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qgFYEo7mUeHhZiZwJPhoRw4RWn2GtW8/d5ROVxJwNOI=;
 b=Rbp/H0XNjC1e68YDsODkATs/QwCTFImX0C7Wr2uzDjOthb0ACD/rWpdOM31ijMTL/h
 UEoSr46LK7ych90rt3uu8jZsmvb72Kn1p3tbpruPKD/wE74NmHsq0uqaiabHNVs4odBT
 XtPPSKMHONMKEQv/6Sg+73foG9FK029huufFP6BfqQi++1ZloRuF3H/xV5RsvV5DG5v2
 oyY/zwSguRptOsXsLq+lgqb0AfICRF1pjXNHqCBrnMJ/mvEuBkNTIRQvoVtM2yx2FOg/
 MymplIMVT2n1jIfghdT6vntsW+3KjQFjQCBjViB2dAuwNIZgQudrnyCE1YDMdL1hh6Sq
 vz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716303326; x=1716908126;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgFYEo7mUeHhZiZwJPhoRw4RWn2GtW8/d5ROVxJwNOI=;
 b=K7Zb+yQbKIT4n7MIYa+1WuMT83On7Ap+WQr10Iwlb1ORegfPnPQ2Iq5W3fIS9GE1qp
 SBeFuoHgB8kXA/3HawdTAsHNdEh2z0xU1NNe6bNvi7BKWvktRp1O2/FQUks3VmqbAf9g
 ENwJJkVeM3Y3Xieuby1axqig5qiRQKOrFYwMAB6Jl192F92Iyy6nnCJtbJ5R6hEScuN2
 WnBqBRT43nH2EXeNCC+lnYgOlmI3x3Q6Tek3WgUlgsBquQjrcwxbotk8IMhUIhwNdzBx
 NzbzZhLnWseyUwLdzQKarOSrCejQtDS/IZl7UGUYwjnGyV/0pGquf6Hh+bIDH0t4MlmC
 /QjA==
X-Gm-Message-State: AOJu0Yz3m+ee6ioznTqFiEaNtt7ZSxVpgx3SWW/rKm5rS0MbawZceCaI
 M//R+62lHmDzyv1WicIDNylwZ1136wpbvUBjKMY7EyBSI26N1fc=
X-Google-Smtp-Source: AGHT+IFrHomcDs7Dce0C4dVgcTRil0b/TRFoFdb/mH2vEEgT78QLQyY9BJNv1nbQtoO2cJ6BQ7Xr3w==
X-Received: by 2002:a05:600c:292:b0:41b:8041:53c2 with SMTP id
 5b1f17b1804b1-420e19f136emr88565265e9.15.1716303326052; 
 Tue, 21 May 2024 07:55:26 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:9379:7e4d:c178:234d?
 ([2a02:810b:f40:4600:9379:7e4d:c178:234d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41ff063d8cesm433554415e9.46.2024.05.21.07.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 07:55:25 -0700 (PDT)
Message-ID: <7aaf1d86-5682-4fdd-9f8e-e30039791577@gmail.com>
Date: Tue, 21 May 2024 16:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] drm/verisilicon : support DC8200 and inno hdmi
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, xingyu.wu@starfivetech.com,
 p.zabel@pengutronix.de, jack.zhu@starfivetech.com,
 shengyang.chen@starfivetech.com, keith <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <3222561.5fSG56mABF@diego>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <3222561.5fSG56mABF@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Heiko,

Am 21.05.24 um 10:03 schrieb Heiko Stübner:
> Hi Alex,
>
> Am Dienstag, 21. Mai 2024, 12:58:07 CEST schrieb keith:
>> Verisilicon/DC8200 display controller IP has 2 display pipes and each
>> pipe support a primary plane and a cursor plane .
>> In addition, there are four overlay planes as two display pipes common resources.
>>
>> The first display pipe is bound to the inno HDMI encoder.
>> The second display pipe is bound to a simple encoder, which is used to
>> find dsi bridge by dts node.
>>
>> Patch 1 adds YAML schema for JH7110 display pipeline.
>>
>> Patches 2 to 3 add inno common api and match the ROCKCHIP inno hdmi driver
>> by calling the common api.
>> The collating public interface is based on ROCKCHIP inno hdmi,
>> and it can be resused by JH7110 inno hdmi.
>> Those common api are tested on rk-3128 SDK, which kernel version is 4.x.
> as you were working on the rk3128-inno-hdmi variant recently
> and I don't really have a rk3036 or rk3128 in working condition
> right now, could you give this series a try.

Sure, I'm going to check this soon.

Regards,

Alex

> For reference, the full series is at lore:
> https://lore.kernel.org/dri-devel/20240521105817.3301-1-keith.zhao@starfivetech.com/
>
> and generalizes the inno-hdmi driver into the bridge model we
> have in a number of other places already.
>
>
> Thanks
> Heiko
>
>
>
>> step1, make sure the process is consistent with the latest kernel version.
>> step2, just remove the interface and add a common interface.
>>
>> Patches 4 to 8 add kms driver for dc8200 display controller.
>>
>> Patch 9 adds inno hdmi support for JH7110 display pipeline.
>>
>> Patch 10 adds a simple encoder.
>>
>> This patchset should be applied on next branch.
>>
>> V1:
>> Changes since v1:
>> - Further standardize the yaml file.
>> - Dts naming convention improved.
>> - Fix the problem of compiling and loading ko files.
>> - Use drm new api to automatically manage resources.
>> - Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
>> - Reduce the modifiers unused.
>> - Optimize the hdmi driver code
>>
>> V2:
>> Changes since v2:
>> - fix the error about checking the yaml file.
>> - match drm driver GEM DMA API.
>> - Delete the custom crtc property .
>> - hdmi use drmm_ new api to automatically manage resources.
>> - update the modifiers comments.
>> - enabling KASAN, fix the error during removing module
>>
>> V3:
>> Changes since v3:
>> - Delete the custom plane property.
>> - Delete the custom fourcc modifiers.
>> - Adjust the calculation mode of hdmi pixclock.
>> - Add match data for dc8200 driver.
>> - Adjust some magic values.
>> - Add a simple encoder for dsi output.
>>
>> V4:
>> Changes since v4:
>> - Delete the display subsystem module as all crtcs and planes are a driver.
>> - Delete the custom struct, directly use the drm struct data.
>> - Tidy up the inno hdmi public interface.
>> - Add a simple encoder for dsi output.
>>
>> keith (10):
>>    dt-bindings: display: Add YAML schema for JH7110 display pipeline
>>    drm/bridge: add common api for inno hdmi
>>    drm/rockchip:hdmi: migrate to use inno-hdmi bridge driver
>>    drm/vs: Add hardware funcs for vs.
>>    drm/vs: add vs mode config init
>>    drm/vs: add vs plane api
>>    drm/vs: add ctrc fun
>>    drm/vs: add vs drm master driver
>>    drm/vs: Innosilicon HDMI support
>>    drm/vs: add simple dsi encoder
>>
>>   .../display/bridge/innosilicon,inno-hdmi.yaml |   49 +
>>   .../display/rockchip/rockchip,inno-hdmi.yaml  |   27 +-
>>   .../starfive/starfive,dsi-encoder.yaml        |   92 ++
>>   .../starfive/starfive,jh7110-dc8200.yaml      |  169 +++
>>   .../starfive/starfive,jh7110-inno-hdmi.yaml   |   75 ++
>>   .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
>>   MAINTAINERS                                   |   11 +
>>   drivers/gpu/drm/Kconfig                       |    2 +
>>   drivers/gpu/drm/Makefile                      |    1 +
>>   drivers/gpu/drm/bridge/Kconfig                |    2 +
>>   drivers/gpu/drm/bridge/Makefile               |    1 +
>>   drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
>>   drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
>>   .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  587 +++++++++
>>   .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   97 ++
>>   drivers/gpu/drm/rockchip/Kconfig              |    1 +
>>   drivers/gpu/drm/rockchip/Makefile             |    2 +-
>>   drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  517 ++++++++
>>   .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |   45 -
>>   drivers/gpu/drm/rockchip/inno_hdmi.c          | 1073 -----------------
>>   drivers/gpu/drm/verisilicon/Kconfig           |   23 +
>>   drivers/gpu/drm/verisilicon/Makefile          |   11 +
>>   .../gpu/drm/verisilicon/inno_hdmi-starfive.c  |  481 ++++++++
>>   .../gpu/drm/verisilicon/inno_hdmi-starfive.h  |  152 +++
>>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  241 ++++
>>   drivers/gpu/drm/verisilicon/vs_crtc.h         |   17 +
>>   drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1060 ++++++++++++++++
>>   drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  493 ++++++++
>>   drivers/gpu/drm/verisilicon/vs_drv.c          |  721 +++++++++++
>>   drivers/gpu/drm/verisilicon/vs_drv.h          |   98 ++
>>   drivers/gpu/drm/verisilicon/vs_modeset.c      |   36 +
>>   drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
>>   drivers/gpu/drm/verisilicon/vs_plane.c        |  487 ++++++++
>>   drivers/gpu/drm/verisilicon/vs_plane.h        |   26 +
>>   drivers/gpu/drm/verisilicon/vs_simple_enc.c   |  190 +++
>>   drivers/gpu/drm/verisilicon/vs_simple_enc.h   |   25 +
>>   drivers/gpu/drm/verisilicon/vs_type.h         |   84 ++
>>   include/drm/bridge/inno_hdmi.h                |   69 ++
>>   38 files changed, 5840 insertions(+), 1144 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
>>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
>>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
>>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
>>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>>   rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (85%)
>>   delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>>   create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>>   create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>>   create mode 100644 include/drm/bridge/inno_hdmi.h
>>
>>
>
>
>
