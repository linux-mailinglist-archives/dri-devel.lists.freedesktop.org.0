Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C080CACD841
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E5E10E7BC;
	Wed,  4 Jun 2025 07:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8134D10E048;
 Tue,  3 Jun 2025 14:17:33 +0000 (UTC)
X-QQ-mid: esmtpsz17t1748960179t92f8d0ba
X-QQ-Originating-IP: 7Unthp6zRkf2GCBo0PISOzyxqfWe8p0qMqpIANg83dk=
Received: from [127.0.0.1] ( [45.8.186.102]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 03 Jun 2025 22:16:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5516064207330598275
Message-ID: <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
Date: Tue, 3 Jun 2025 22:16:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
 <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OFwcIyq3IdMx5mbUqpsEPIGjjz2jBFV+3UjWd5zFxFBnV6mpXZdKUZqv
 Fa7ZdQXJGcv0rz/T32NTPoUn5aU1qkdfxQDaoYFF+jlFMBUCEm+CzhNtC2F1IUAl6Sdxvwo
 CKFGQhfpuTC13TOpWtz1muXAeao9PS7gBiDDUuf5xIKdDV3imhuTSsXZODRrnoC1QVkUyG1
 OCFha1MOysWUJIlbO0E4MvypyqeZzBlvE70PwbpIf9sfGuCguUtNdvpUF6xvdHy+gannc2f
 xtbkeGpXcSKBegMd1h9L4jxHbgjgYUW9gMsl+JHpYuk/E3qwg1ox9L32/FtTsPS3XGX2DxE
 i8mZVTAksNRO/7kEA49kyGUG2X0ufFws7osQNpKxNNFZToyNZFx+wiLbTdYr9SKocx1ZE/V
 MdBwHXU+gIVEIWdtpfsrbDVfy0kuJ5i/DVZOl/J7QLrSNXjLBoeY4zfbpmGyQ6SvvPiOwP/
 NN1HqqT8lzlqgdcoUoamdETGqd4HYYCfTCA0Pt2LQAwfNDks2J7Lqb01HKEvSYo9ykJ1vyI
 8ZyV79Ur2+fOuiZYB3IDRarIkGaEbJbsC06izwrEsPPX6ebPWiCuLL5W8aIFSGvHdnIAE5n
 hi93Q0xdG+am5v40ei9mjt06zi6UBtJReb1eQJC7fq/9OTVDAYzLFaytU1OipxgmLhn01bk
 vAiWmDPalO059H5cd4mRDZNUYJ/RmVQo2P5Cm9twM6/ViS1xWUQ3TnQJRtQ3chYHcUjUGQp
 jgB4ZblkSSR6nn3KNCInBGb7F4AsZf2H/RmsBecfUyzhi9WifdbuDfpIjtSYqIcIv8dcVoq
 IFJAP3IvXQYH0XJ9JSztKVxvVW6SF8dWBd5uPWNccfRxXoS1a5MMLqCRIUFXadXQgWrH7QC
 A2WbCp28Cr2aHsMFhw3drsBgzbjn4EhbdTAC3qqTczyHToTf5eqyv1VpGDmi3EBFTYO6nbW
 AhqtSfwk/cAcGmnCmRMDBY4XYcklxfho3GJ82813MJ2t5+ZrJW0SU1hV43IYXM7nDkSUJl+
 qxA25ijzGAAtept/bxQphsu5H1kBh5i0xZRgAaqA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Wed, 04 Jun 2025 07:11:31 +0000
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

On 2025/6/3 22:06:36, Dmitry Baryshkov wrote:
> On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
>> On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <lumag@kernel.org>
>>>
>>> The MSM DisplayPort driver implements several HDMI codec functions
>>> in the driver, e.g. it manually manages HDMI codec device registration,
>>> returning ELD and plugged_cb support. In order to reduce code
>>> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
>>> integration.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
>>> support. Present DRM HDMI Audio support has been written with the HDMI
>>> and in particular DRM HDMI Connector framework support, however those
>>> audio helpers can be easily reused for DisplayPort drivers too.
>>>
>>> Patches by Hermes Wu that targeted implementing HDMI Audio support in
>>> the iTE IT6506 driver pointed out the necessity of allowing one to use
>>> generic audio helpers for DisplayPort drivers, as otherwise each driver
>>> has to manually (and correctly) implement the get_eld() and plugged_cb
>>> support.
>>>
>>> Implement necessary integration in drm_bridge_connector and provide an
>>> example implementation in the msm/dp driver.
>>> ---
>>> Changes in v7:
>>> - Dropped applied patches
>>> - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
>>>
>>> Changes in v6:
>>> - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
>>>     callbacks to the drm_bridge interface (Maxime)
>>> - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
>>>
>>> Changes in v5:
>>> - Rebased on top of linux-next, also handling HDMI audio piece of the
>>>     MSM HDMI driver.
>>> - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
>>>
>>> Changes in v4:
>>> - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
>>>     HDMI driver.
>>> - Drop outdated comment regarding subconnector from the commit message.
>>> - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
>>>
>>> Changes in v3:
>>> - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
>>>     (Laurent, Maxime)
>>> - Dropped the subconnector patch (again)
>>> - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
>>>
>>> Changes in v2:
>>> - Added drm_connector_attach_dp_subconnector_property() patches
>>> - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
>>> ---
>>>    drivers/gpu/drm/msm/Kconfig         |   1 +
>>>    drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
>>>    drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
>>>    drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
>>>    drivers/gpu/drm/msm/dp/dp_display.h |   6 --
>>>    drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
>>>    6 files changed, 31 insertions(+), 170 deletions(-)
>>>
>>
>> This change breaks DP audio on the qcs6490 platform, tested on kernel
>> next-20250528.
> 
> I can not confirm this issue here (though I tested it on a different
> hardware). Do you have any patches on top of linux-next?
> 

I have this patch series applied, but I don't think it could be relevant:

[PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
https://lore.kernel.org/all/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/

>>
>> [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
>> [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
>> dai_count 0
>> [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
>> Missing hw_params
>> [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
>> Invalid parameters
>> [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
>> hdmi-audio-codec failed with error -22
>> [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
>> on minor 0
>>
>> Manually reverting this change solves the problem.
> 
> It is suspicious, since dai_count can not be 0. We set
> hdmi_audio_max_i2s_playback_channels to 8, which in turn should set the
> hdmi_codec_pdata.i2s to 1.
> 

It suddenly comes to my mind that I'm using a kernel with everything 
compiled as builtin. Could that be a possible issue?


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

