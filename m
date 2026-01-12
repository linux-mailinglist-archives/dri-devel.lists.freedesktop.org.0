Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91136D10B48
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 07:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD9910E2CB;
	Mon, 12 Jan 2026 06:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8831A10E2C9;
 Mon, 12 Jan 2026 06:32:13 +0000 (UTC)
X-QQ-mid: zesmtpgz4t1768199477t5221490e
X-QQ-Originating-IP: lAr+nSzbSl4WkkI7JdgxjIK725eukfFUvW8YDestnqc=
Received: from [127.0.0.1] ( [116.234.96.45]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 12 Jan 2026 14:31:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12744510694498697808
Message-ID: <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
Date: Mon, 12 Jan 2026 14:31:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NcfXIs+Ms1qH1CliA/F7ih2AitXk1RUayG5THx2Om380CtSgoO0SOQre
 grFq2adx+hdV+jGa0PVFo7otwUdwdX+0QCnqjzqEa3oLg05iOqwDYDtzPMAcYyC9J1T7tvZ
 1h0GEZlCTYCjxKk/zuVtLWqbtLC0oS40XVQjReWmeyE+nSOKAmndqSs8gZK6Mn0H7U0kzau
 bAkFpb6TQIERzYrEPss8IDkbEzwMTWRm1DtbuXpMMe1X85OSVASW7ROmUs5SpZshyHt8n/5
 uLSUwV2YXqJsPmXW1Om0rUniwvGyDbYQxzzGRgQDUI9+vZS+k4IO6hO5D2BBH3VIh9mTBrQ
 LKx8dthaOMgLntz/+1Yj8BS9enyjrO3PE7pj+lbrgPW+B3qFiiX46KyJauHFhk86eeNWfHh
 2NpqQ8H52x4n8nMXkSh0kn2PjJRB+eLPpUawdMg1R0tKnmXQ6IEGathafF2u7eEMZAd9CVw
 WkSxuzIrzlyiCijx0HbtIKQFJ9zdHVDbmsd18KlYKmMorVLL/ELwSFaftXHg9MwK5A4QMeb
 afGeQ60xVMT/bfvvk/YA6okq6b0Kf0sPuMFukc+/tVzLIsvHpoR592yRRk5BPB2e3mtt+8d
 rW6QUOvpnMogDt8YzUtFtp7qwVlSeBk1vtuavj8/wyKthezZFVZUeiUV9SZmRoiyG4S+vND
 7qRtUcTff2jALaRK8CRcZWxKCcyz8VQOwGKgLYxSNlHz19fI5mFXTHKOtKMLE5ozrlKur6E
 LuamsmiH384Nx1n9XngTAnN3h7P/UtPIW96eMeyEDl9gOSGf2vV7XtC9MGn3nXB3/R1JYil
 jOqVSVlBl0e+wU3Z2yyPyYSyeMt7oxpfi+VX8pgQm6HsIcCsm5IZoFHn7dsCXM49o7Jo8Jz
 98L+sGuO+0v4HPCo7W4rgERQrC3k8ShYzzlYyUSJSY65I42rH/XHpzJoZ0DHvZNbwU6PYdR
 3R2lpnRCA8xCdnE1TEpjwig3AMoefiwwOdkpsyMVZDN9fb8SLqLijRbAA6h5H7B6VQe2q+U
 8w+OIx2w==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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

On 5/7/2025 9:38 AM, Jessica Zhang wrote:
> Filter out modes that have a clock rate greater than the max core clock
> rate when adjusted for the perf clock factor
> 
> This is especially important for chipsets such as QCS615 that have lower
> limits for the MDP max core clock.
> 
> Since the core CRTC clock is at least the mode clock (adjusted for the
> perf clock factor) [1], the modes supported by the driver should be less
> than the max core clock rate.
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---

Hi. This patch effectively filters out the 3840x2160@120Hz mode on 
SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which slightly 
exceeds the supported max core clock of 600000.

However, 4K 120Hz works flawlessly with the limit removed on this 
platform. I even tried connecting two 4K 120Hz displays, and they can 
work properly simultaneously. Is it possible to bring back support for 
this mode, or adjust the limits?


-- 
Best regards,
Xilin Wu <sophon@radxa.com>
