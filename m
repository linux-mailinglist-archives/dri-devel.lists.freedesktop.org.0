Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0CD11282
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D2310E099;
	Mon, 12 Jan 2026 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EF710E099;
 Mon, 12 Jan 2026 08:19:05 +0000 (UTC)
X-QQ-mid: zesmtpsz6t1768205812t38f57e53
X-QQ-Originating-IP: JenX008UtBUgmVb+GIfITQaaGDhQIQLlw7MDTXfP+iQ=
Received: from [127.0.0.1] ( [116.234.96.45]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 12 Jan 2026 16:16:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4988554758296933567
Message-ID: <76B3416F7865BD83+6448d6be-8c58-494b-9287-da0f550dffb5@radxa.com>
Date: Mon, 12 Jan 2026 16:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
 <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
 <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
 <lknvr4qwhsnkuaujuilapcpiykqu7n2bzo7dwimmz5gpfklr57@wod3hszretls>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <lknvr4qwhsnkuaujuilapcpiykqu7n2bzo7dwimmz5gpfklr57@wod3hszretls>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MWdgP8+gtiFROBOHaAbsuEQgJ5RMFxzjtF6r16K1Bjv9TfRk7kwnlZgf
 nZdUvxJk7IDRtbXJEnMvyyS7eGSvJNPGv/XxlbaFWbVL2mp2MKd554cfcux68juK62HF82/
 hu/zJMoeJbQqHeKfGPSaF4bR+Jj6M4NgaYWlA9K5Vu/gj6w9UEY6BLB/kyY3OhKHprPZRZz
 FzzcDG+DqwV74vsJj1ukxvHcqrta7Tu37P5ZgK9o0ElnFybEYvXot8Ymh9i8jiJis9MUT0G
 StcSUx4IiPbYBhH/v/elJGc99yhqYDtyCI0PuHW/gqrAfkXW97Y1/URCBgoyAM6JkS2S6/4
 NzpHuj43eWhnVVGTgEd7FIKK2hhO10rlhBXwyJAkZOFDcZQHlrHBM/A733H6vXI4+vkO/YQ
 /njLs+4wfAWnxxAArRYb8os+3I3IueZnluPsyooaB/MzIw5tD1AFwvWJ5vJ0BpZktO8Dz77
 bPi2KO7ptrnzBmgnC4Aa3VXlGiQG2jMZnvK0ju9AbiDLCywzQtFC80HTLcyajL822B47Jni
 O9QP0EjtXMox7Blw6lQruYu32iGIKJPJAGAXEya2rdbLjBanmMQ8sgeR9YFTSMeHgRK6yTm
 88BzI1awXXvrsyFQc1kKJOv2EtqGTZbaich5NwyMsO2PEyLUVcKzDSKKFtZW7+M/8SLXAaq
 Bz2RPaBKjaytlS2aKlTOgznxxi6ZnKPkmRLbf/oXJJMrBaaLVHJa6mLj9hes/TmrvNk0/PQ
 7dprdEQnuOoDFSqbm25OxRgCtRWRw+366Jkn7ND+cxCufdBPchc44AH4yi+Z2u9UHyZSvTZ
 0p1nZSlGaUdGqqYe+k6j0sVNytWfQ33lzoPpIj7i//bGrW+Fkw1EOq+4eWdspr0cULZBs5h
 jf/UEZ5UK0/a0zlTRMywi2bbS+GL7ltRtW4kqHq2U7L0witmYLLCa7Q+OF9leu9yvaIU/3P
 bXxsvZDKYLE+8e8b5hW9mhGhAML/B3IndDubhF8VhHEh4yp5XKZLufhC3EuKFYAYUlXG3TL
 BVQzz8heuiYf5Ch2IwPPsxwcR1QBJkAvx32sABRsrR0WroJClr8jIs+5esG7j+Bd2eHVoYT
 Sn1JeDji7BYcJ5OE3TCf6M=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
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

On 1/12/2026 3:48 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 03:25:05PM +0800, Xilin Wu wrote:
>> On 1/12/2026 11:11 AM, Dmitry Baryshkov wrote:
>>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>
>>> LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
>>> encoders). As such, don't use ephemeral max_mixer_width and
>>> MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
>>> buffer widths.
>>>
>>> While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
>>> there is some additional logic that needs to be added to the resource
>>> manager to specifically try and reserve PINGPONG_0 for modes that are
>>> greater than 5k.
>>>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
>>> [DB: reworked to drop catalog changes, updated commit message]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> Sorry for the late reply, my colleagues are still testing the new series on
>> qcs6490.
>>
>> However, this completely breaks 4K 120Hz display on SC8280XP CRD, which was
>> previously functional (albeit with the clock check bypassed [1]). The
>> display now shows a solid blue screen. Kernel logs indicate that only one
>> layer mixer is being used, instead of the two that were used previously.
> 
> Could you please post debugfs/dri/0/state and debugfs/dri/0/debug/core_perf/*?
> 

Sure, this is when the display is working:

$ cat /sys/kernel/debug/dri/ae01000.display-controller/state
plane[36]: plane-0
         crtc=crtc-0
         fb=89
                 allocated by = kwin_wayland
                 refcount=2
                 format=AR30 little-endian (0x30335241)
                 modifier=0x500000000000001
                 size=3840x2160
                 layers:
                         size[0]=3840x2160
                         pitch[0]=15360
                         offset[0]=0
                         obj[0]:
                                 name=0
                                 refcount=5
                                 start=00105bee
                                 size=33554432
                                 imported=no
         crtc-pos=3840x2160+0+0
         src-pos=3840.000000x2160.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=1
         sspp[0]=sspp_8
         multirect_mode[0]=parallel
         multirect_index[0]=rect_0
         src[0]=1920x2160+0+0
         dst[0]=1920x2160+0+0
         sspp[1]=sspp_8
         multirect_mode[1]=parallel
         multirect_index[1]=rect_1
         src[1]=1920x2160+1920+0
         dst[1]=1920x2160+1920+0
plane[42]: plane-1
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[48]: plane-2
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[54]: plane-3
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[60]: plane-4
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[66]: plane-5
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[72]: plane-6
         crtc=crtc-0
         fb=93
                 allocated by = kwin_wayland
                 refcount=2
                 format=AB24 little-endian (0x34324241)
                 modifier=0x500000000000001
                 size=512x512
                 layers:
                         size[0]=512x512
                         pitch[0]=2048
                         offset[0]=0
                         obj[0]:
                                 name=0
                                 refcount=5
                                 start=0010f8ca
                                 size=1310720
                                 imported=no
         crtc-pos=512x512+1913+1073
         src-pos=512.000000x512.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=1
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=2
         sspp[0]=sspp_9
         multirect_mode[0]=none
         multirect_index[0]=solo
         src[0]=512x512+0+0
         dst[0]=512x512+1913+1073
plane[78]: plane-7
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
crtc[84]: crtc-0
         enable=1
         active=1
         self_refresh_active=0
         planes_changed=1
         mode_changed=0
         active_changed=0
         connectors_changed=0
         color_mgmt_changed=0
         plane_mask=41
         connector_mask=1
         encoder_mask=1
         mode: "3840x2160": 120 1188000 3840 4016 4104 4400 2160 2168 
2178 2250 0x40 0x5
         lm[0]=0
         ctl[0]=0
         lm[1]=1
         ctl[1]=0
connector[34]: DP-1
         crtc=crtc-0
         self_refresh_aware=0
         interlace_allowed=0
         ycbcr_420_allowed=1
         max_requested_bpc=0
         colorspace=Default
resource mapping:
         pingpong=84 84 # # # # - - - - - - -
         mixer=84 84 # # # # - -
         ctl=84 # # # # #
         dspp=# # # #
         dsc=# # # # # # - -
         cdm=#
         sspp=# # # # - - - - 84 84 # # - - - -
         cwb=- - - -


And this is when this series is applied:

$ cat /sys/kernel/debug/dri/ae01000.display-controller/state
plane[36]: plane-0
         crtc=crtc-0
         fb=89
                 allocated by = kwin_wayland
                 refcount=2
                 format=AR30 little-endian (0x30335241)
                 modifier=0x500000000000001
                 size=3840x2160
                 layers:
                         size[0]=3840x2160
                         pitch[0]=15360
                         offset[0]=0
                         obj[0]:
                                 name=0
                                 refcount=5
                                 start=00105bee
                                 size=33554432
                                 imported=no
         crtc-pos=3840x2160+0+0
         src-pos=3840.000000x2160.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=1
         sspp[0]=sspp_8
         multirect_mode[0]=parallel
         multirect_index[0]=rect_0
         src[0]=1920x2160+0+0
         dst[0]=1920x2160+0+0
         sspp[1]=sspp_8
         multirect_mode[1]=parallel
         multirect_index[1]=rect_1
         src[1]=1920x2160+1920+0
         dst[1]=1920x2160+1920+0
plane[42]: plane-1
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[48]: plane-2
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[54]: plane-3
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[60]: plane-4
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[66]: plane-5
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
plane[72]: plane-6
         crtc=crtc-0
         fb=92
                 allocated by = kwin_wayland
                 refcount=2
                 format=AR24 little-endian (0x34325241)
                 modifier=0x500000000000001
                 size=512x512
                 layers:
                         size[0]=512x512
                         pitch[0]=2048
                         offset[0]=0
                         obj[0]:
                                 name=0
                                 refcount=5
                                 start=0011cf86
                                 size=1310720
                                 imported=no
         crtc-pos=512x512+3833+2107
         src-pos=512.000000x512.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=1
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=2
         sspp[0]=sspp_9
         multirect_mode[0]=none
         multirect_index[0]=solo
         src[0]=7x53+0+0
         dst[0]=7x53+3833+2107
plane[78]: plane-7
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
         stage=0
crtc[84]: crtc-0
         enable=1
         active=1
         self_refresh_active=0
         planes_changed=1
         mode_changed=0
         active_changed=0
         connectors_changed=0
         color_mgmt_changed=0
         plane_mask=41
         connector_mask=1
         encoder_mask=1
         mode: "3840x2160": 120 1188000 3840 4016 4104 4400 2160 2168 
2178 2250 0x40 0x5
         lm[0]=0
         ctl[0]=0
connector[34]: DP-1
         crtc=crtc-0
         self_refresh_aware=0
         interlace_allowed=0
         ycbcr_420_allowed=1
         max_requested_bpc=0
         colorspace=Default
resource mapping:
         pingpong=84 # # # # # - - - - - - -
         mixer=84 # # # # # - -
         ctl=84 # # # # #
         dspp=# # # #
         dsc=# # # # # # - -
         cdm=#
         sspp=# # # # - - - - 84 84 # # - - - -
         cwb=- - - -


The values from core_perf are exactly the same:

$ cat /sys/kernel/debug/dri/ae01000.display-controller/debug/core_perf/*
600000000
0
0
0
0
13600000
18200000
600000000
2500000
800000
0
mode 0


>>
>> [1] https://lore.kernel.org/all/F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com/
>>
>> -- 
>> Best regards,
>> Xilin Wu <sophon@radxa.com>
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>
