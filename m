Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE97E0F92
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 14:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED3E10E216;
	Sat,  4 Nov 2023 13:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101CF10E215;
 Sat,  4 Nov 2023 13:19:28 +0000 (UTC)
Received: from [100.116.205.35] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3773660741E;
 Sat,  4 Nov 2023 13:19:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699103966;
 bh=1dBKOCU2op7HA41h9kKU4lIb1sXgfhlNw7dDoYMGmGs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UQk4F+bsfvQ9WNm/y0l2nCk4XVq4T3jE2qV70rZH0vK5SRUM3mCxX+dlYOvnVWt7K
 U0qVuJkbSARRj1XJE3/vv6epFmbMAJSp/ppb8n53GY95Eb17Kt51BqN1B3oGdB6YTn
 R7320wWhxsDirvgRJtNm/2JlQvoAtrx9wCi4N8PgKJvjz64orYF+HVjE7C2Fs39nkq
 FCeTjVnsDNEaxX7JlEUkNQtI7hx3rw1ASCIRTd0eaBBBNm3F782qBn9jMfkEFR6yx6
 5tmhIrafeQSi0yCt3XaPvA4M++sY10X7p7YX85+mfKBq2lEsMDKZV12eBYZg3t+uQz
 mIZWFaTAaNTRQ==
Message-ID: <836c7166-0a42-4fdc-acf4-65e0a096c41f@collabora.com>
Date: Sat, 4 Nov 2023 10:19:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ci: Add skips, fails and flakes for SM8250
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
 <20231010-rb5-runner-v1-3-aba1fcc6e3aa@quicinc.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231010-rb5-runner-v1-3-aba1fcc6e3aa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/10/2023 19:25, Jessica Zhang wrote:
> Add skips, fails and flakes for the SM8250 test.
> 
> Generated using update-xfails.py [1]
> 
> [1] https://patchwork.freedesktop.org/patch/561453/?series=124793&rev=1
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt  | 29 +++++++++++++++++++++++++
>   drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt |  3 +++
>   drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt  |  8 +++++++
>   3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt
> new file mode 100644
> index 000000000000..cc8ae32e90e7
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt
> @@ -0,0 +1,29 @@
> +kms_3d,Fail
> +kms_atomic_transition@plane-all-modeset-transition,Timeout
> +kms_color@ctm-0-25,Fail
> +kms_color@ctm-0-50,Fail
> +kms_color@ctm-0-75,Fail
> +kms_color@ctm-blue-to-red,Fail
> +kms_color@ctm-negative,Fail
> +kms_color@ctm-red-to-blue,Fail
> +kms_color@ctm-signed,Fail
> +kms_cursor_legacy@basic-flip-after-cursor-varying-size,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-varying-size,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size,Fail
> +kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size,Fail
> +kms_cursor_legacy@short-flip-before-cursor-toggle,Fail
> +kms_hdmi_inject@inject-4k,Fail
> +kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
> +kms_plane@plane-position-covered,Fail
> +kms_plane@plane-position-hole,Fail
> +kms_plane@plane-position-hole-dpms,Fail
> +kms_plane_alpha_blend@alpha-7efc,Fail
> +kms_plane_alpha_blend@coverage-7efc,Fail
> +kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> +kms_plane_cursor@overlay,Fail
> +kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt
> new file mode 100644
> index 000000000000..0b55665184c1
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt
> @@ -0,0 +1,3 @@
> +kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
> +kms_cursor_legacy@flip-vs-cursor-varying-size
> +kms_plane_cursor@viewport

We are trying to add some docs, specially to the flakes, please check: 
https://lists.freedesktop.org/archives/dri-devel/2023-October/427982.html

Could you add it for those? (I'm glad to see there are just a few flakes).

Thanks
Helen

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt
> new file mode 100644
> index 000000000000..c20422c58e4d
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt
> @@ -0,0 +1,8 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> +
> +# reboots device
> +kms_plane_scaling.*
> +
> +# long execution time
> +kms_flip.*
> 
