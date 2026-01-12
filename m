Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4478D10DB3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA7910E2D8;
	Mon, 12 Jan 2026 07:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0198F10E03F;
 Mon, 12 Jan 2026 07:26:04 +0000 (UTC)
X-QQ-mid: zesmtpip2t1768202707tc160a062
X-QQ-Originating-IP: oKEITeMqQL1Z+DxJ12O8HBGdk/32is1aGKFweU36mns=
Received: from [127.0.0.1] ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 12 Jan 2026 15:25:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9765549277843554367
Message-ID: <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
Date: Mon, 12 Jan 2026 15:25:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
 <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NEaes6yu2o+muoOdEqRxciWYfZVaRFoUIzewzy6iA50sqzabt7ANL4S+
 V7K6VKDlBNY2o1K987nsETABKc2TSftRI/z2DBjw96KPxMHeyNUVh6Gd79btysqPC42YaCH
 HISLLDN7j4Xsk8nG0RR+uKpSJwtYZk4EqLkB3HlP1lkzvndsVRyzE5Y+dEPcZPZve/eHg6U
 LF1zqkx5i+w6jjxkGe7VC6oPbEMFrBmUO4ejGm1NA202R/+5sbxAGjHmLT3lFuNUcsVRFWi
 6wmG73T3tPfcmHpzpR2Jh9lXjfAWBjf+IJgGcPjcKEzHtDMsC6bEFxOMMTUDMWSgGmI6Yhj
 Vf3mW/aoEexBLEVX74oVsdA6SQ1h0Z8NQifrrydt0hflWEZD4PwarkvYPkz+QUfoYVB+ZeM
 JSaz9Txh5WGXMCO17beM5E57pgHdKg+l10SV8GNytMhzgKRLm9/QfdgWN8kJt8Auu6ybI8H
 24l2pYpHoI1S4wbKEmRUkU4/HHlM8pUdPm33PhfbM67vNDY91JY0124YKb4DZBJBgVTWjLH
 LqmhqGT7K1jXl0tdc05fq8g0qebZMokwnfCP3r8JjTEND2uFwfFU0U4Yf3mYzUpfYxYIjSO
 RPhLwgv1wo5ZqE/TdwlQhwPfOcT7OrwfhVtmfMnQwc1kTB2eoqzg/FXsjA7r58tMEm9IisE
 xJwxnnCJcPhMa1AMay6DIfcvZyAgRwVsVINIhsZGbGFg6F7ogN61Yc4y8cg8JjRnCr3OQIP
 yoPSGCChd0fiuXkNdIrumWHGPfjkZBA5ZqGmnnvEWleqkdjUNRNCJDOtsfDXN4ZTA2x53B0
 fWduEB4zzdOV59z2WXcwXi1QIPDEKZ4xan5y8gOoyyZIO+4x2svNCGzW13Fo8cAE6IY6Xpz
 zertoUGUyIYNnUQWe5x2vYWd/nGZybC9tGBEJtWwK7hmnaL5g4e+ihQ+phQ3BrlIihKS/t4
 GPehaD/iM/RHUHVP10Tv4z+GyzfNYOupXurAHm9MJOoozYuGyediJKi9s45zgrR2v4nimrh
 tIGr1QZ/ytBnYatnKluFKAquNpCoxZFXeL9MQ2CA==
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

On 1/12/2026 11:11 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
> encoders). As such, don't use ephemeral max_mixer_width and
> MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
> buffer widths.
> 
> While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
> there is some additional logic that needs to be added to the resource
> manager to specifically try and reserve PINGPONG_0 for modes that are
> greater than 5k.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> [DB: reworked to drop catalog changes, updated commit message]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sorry for the late reply, my colleagues are still testing the new series 
on qcs6490.

However, this completely breaks 4K 120Hz display on SC8280XP CRD, which 
was previously functional (albeit with the clock check bypassed [1]). 
The display now shows a solid blue screen. Kernel logs indicate that 
only one layer mixer is being used, instead of the two that were used 
previously.

[1] 
https://lore.kernel.org/all/F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com/

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
