Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D194B084BB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF11410E2AB;
	Thu, 17 Jul 2025 06:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D1B10E3DE;
 Thu, 17 Jul 2025 02:25:22 +0000 (UTC)
X-QQ-mid: zesmtpgz7t1752718861t8873202c
X-QQ-Originating-IP: Zl/o0y9rYQVp35UT5ekeseH22v+Sdn/qwiqeQJnkDl0=
Received: from [127.0.0.1] ( [119.98.96.24]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 17 Jul 2025 10:20:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3465737500828252999
Message-ID: <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
Date: Thu, 17 Jul 2025 10:21:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <20250714173554.14223-7-daleyo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NklBUSB3jTRVvXDiQ8w9DwZ39M5ljPi3YvIiCLjPoclJeL4bOwDJNaXR
 tG9PVLVhqKousPxdxkCAuo+DfPg9u32IYM5U6g8Em7RsjQd4RahY/AhS0b9rtXv56pkMDqv
 CVps2+Ud9kfnMNEEchpEJPfxd8zeNDVO/zIChEcfU35P6eI7YDVhQ70ytT5jzYpSiXKofDr
 sB44BPEOIKXnwytI9c1i1hCoFQgTrJvP1lPdR08QFI5xc1U3wqxqCiOwzdKb0IUtKE4sbYn
 UmLH/UQ0qSlF/sk7wvyj82Nq7l4Ife9jRqBx2UIEoc5zQ7SdpSn2/eJU7+dvDHDeaYeFLmD
 Qq1evB7qMyFXGr4oUSabGiltpW1WDDEjIlhWqkr+HJ5F7zpNwc3H715id2WoLptPVLstSHz
 30t7xNLU3A9+UiKG8VoJ8AVzoKrgXmcMVzOIq4Y7+9+dZzHJRBsy/CqpbAjZiNAZtuLLBiC
 aHvQsgctfMTVnISkToNVlmVvOLhwKPZMbON3CSVwAHSPisg0MNBP5ud3pI9eRM0XoudEcip
 WZ+JGBGJAEy5WMPxFCxOy1POZNqEm3wBW3qBClzZw1CWhQKHWYA8N2t2gu8eiKMdFQCSVSh
 FInlFGChoNEe0XgDlEhe1tDK1Fv21CJDFSsOzYURhV16jBzecCHZRvcd3byOLW4bpX/1NK2
 WGqNGzxUW862XMrBP+35KzTXCH/J+h94CwG9rIV7AtPTr9ATNHsiTexdwdfYpT5T45mBc45
 QogQfiKVEvDDLQ6ryfBUM48dDC+mV1XZOApS0dY0RRbCTZFMJJxDFjb/mYM6c4vp+6So61K
 3JZAuWMFEKQgYusULeOZfFnu32ovkkvYkJBTl7Y6WsoaGRR3ufcJEouh3VLoikChW1Q1Q5o
 ZWxV4aMIeHxcrDnEm8jJvFcKbV2KdK7RdN02z6jSV25hHQ975gba8zx5Y/Y4XdqpyUTg6Vk
 QZGcLQFsd7SB4McbWzoKeSDfxPkfqcGxCRVnXA2lK1mvd4nA5rc3plZxuyeCO8Qn5z4Xd9q
 UjMtWyLumUMnOtFwK8D5oHckMhqb1qqiw8KNdeKQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Thu, 17 Jul 2025 06:17:53 +0000
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

On 2025/7/15 01:35:42, Dale Whinham wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> The OLED display in the Surface Pro 11 reports a maximum link rate of
> zero in its DPCD, causing it to fail to probe correctly.
> 
> The Surface Pro 11's DSDT table contains some XML with an
> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> (8.1Gbps/HBR3).
> 
> Add a quirk to conditionally override the max link rate if its value
> is zero specifically for this model.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 4e8ab75c771b..b2e65b987c05 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -11,6 +11,8 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   
> +#include <linux/dmi.h>
> +
>   #define DP_MAX_NUM_DP_LANES	4
>   #define DP_LINK_RATE_HBR2	540000 /* kbytes */
>   
> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>   	if (rc)
>   		return rc;
>   
> +	/*
> +	 * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro 11
> +	 * reports a max link rate of 0 in the DPCD. Fix it to match the
> +	 * EDPOverrideDPCDCaps string found in the ACPI DSDT
> +	 */
> +	if (dpcd[DP_MAX_LINK_RATE] == 0 &&
> +	    dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> +	    dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edition")) {
> +		dpcd[1] = DP_LINK_BW_8_1;
> +	}
> +

My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max link 
rate of 0. But I think eDP v1.4 panels need a different way to retrieve 
supported links rates, which could be found in the amdgpu [1], i915 [2] 
and nouveau [3] drivers.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/i915/display/intel_dp.c#n4281
[3]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/nouveau/nouveau_dp.c#n101


>   	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
>   	link_info = &msm_dp_panel->link_info;
>   	link_info->revision = dpcd[DP_DPCD_REV];


-- 
Best regards,
Xilin Wu <sophon@radxa.com>
