Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B2CEB8DA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6BB10E085;
	Wed, 31 Dec 2025 08:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Wed, 31 Dec 2025 08:39:26 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C68D10E085;
 Wed, 31 Dec 2025 08:39:26 +0000 (UTC)
X-QQ-mid: zesmtpip4t1767169836t8268e047
X-QQ-Originating-IP: fMplGKqgXfykVLGKncaHisjFc0ZxUPSnlLhM2eZrTvU=
Received: from [127.0.0.1] ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 31 Dec 2025 16:30:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13277669007580881109
Message-ID: <B215717DE5B3F973+806cb099-b491-464b-b9a8-fd12f2cd1e27@radxa.com>
Date: Wed, 31 Dec 2025 16:30:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mw5V7KuSxHjfVhROMvJjKAvbc5VRgJ/oG1pJSbNh2s0xx6PQixbDrV7t
 QFvi/2ULkol93l5ZimGQd9EC0+08has+bI8uZ/h9qNAd5VSsqR9O00OlonNRcvL3p5ODA/L
 phMXwQdUrRwXEYiV4AnlPjv45t6ev8qyMOy3CLi8c2asvvUUcNLRMC2mSOqISCUAHq1W7K1
 AibDprWrdimSMKIxWoQ0peeeZahbNLNcoQtOk8ROxNYcvDIiqlL4HNz7ZUMRXiDTe+ypl42
 Ws3hJMm3X2YE3Y9Sf65BlPqV6X6LJPxCCawQJ0a4smWmF9Cb6TfHrT9RFOEAuVXm4BnXG4j
 LHiS43qfnySXg9PSdQfFNFWdRQdhOjRi1M8KXySLSgOkSDaF6kMbVNIaiAY86HRFBXUi46l
 q/ZOhsg0MwevY9Tli/9Q5uIabRgmUWYlTlCb3MH1Wl8l4CBwLXGLRC9MwjsLwe+e9Lgrs58
 rQQAzYC67NzlN+Lm5SMaeJpWrSZ6ALr76YuM4cWG3gdW91va0w9Xw6JxOQiF66dJch+4Wvm
 dI8XzLOc8BXKn8CdwanVJcShbcl871TX9RfVPsAejVDA2XVJsfC3jJq+vHdByaJdwH73u4J
 VBL8kTev8FMpzsG4V2LrZGLyaVGoBdmT8pcp+6A0Y2BJrdbifeVYJxRTOqpkzirmH3DQPaY
 Gv/vNp+H7Pgt7EjxE/oQ2UM/9fHBDaKvMr+JKk2sdprdLBAviJzwfAjEyu3hgzREmrM6vTQ
 DjCAbdNDaG6DMTsxCcNUqeJ2hC8P+jKSQn58ZuEEZKuwlQ+wvBKEVlt35bkFhpn4v/t9qeD
 2xVFEVN7qKd8A7Jd/Ko6zWUwW/QTxAm808yKbe4QgTd7TBcGAY6pwFtJrzITS5c9QMpx5aY
 vx1y3DPvcPlaGB65PWBNbogGn6R15Q09G3tFjbuYGdoDNxPblOY+RUZoyzSiw5RSWqVn4AU
 H10/0OedRjYhTYZrtkGW5pbAA0yZRBGPp86emy0a0XtayKVH4fpxD8a7L5xUeLxo60cBY1p
 zVPF796H0zZ1W1AXIrTBiiYt8iWmYvLs2z0sUjXw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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

On 5/15/2025 7:52 AM, Jessica Zhang wrote:
> Validate requested mode and topology based on the PINGPONG or DSC encoder
> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> off of PINGPONG or DSC encoder max width
> 
> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> for PINGPONG_0, there is some additional logic that needs to be added to
> the resource manager to specifically try and reserve PINGPONG_0 for
> modes that are greater than 5k.
> 
> Since this is out of the scope of this series, add a helper that will
> get the overall minimum PINGPONG max linewidth for a given chipset.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>   1 file changed, 39 insertions(+), 7 deletions(-)
> 
Thanks for the patches! With patch 2&3 applied on top of v6.18, I'm able 
to get DSI panel and DP monitor working simultaneously on qcs6490.

Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
