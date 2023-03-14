Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76196B8F12
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 10:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1010E75D;
	Tue, 14 Mar 2023 09:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9FD10E75D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678787971; x=1710323971;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vsj9T9Br4xjmd7W1//zB56r/FVJi0Idwj1ldmitXAZs=;
 b=TgJowHUKzlMcPoUTM5yBGv50F2mXqUYXebgWRUKJCa+s4zAE2Cj48do0
 OABjrp8xvZBh/Wn9neqDKo3TY+6GWIuOmOd5cYrPO8nr6uZ5z3ZkKJyGG
 ieFWOSYQavvTdtgBeIWVJ675AS4gl2F7a8oj4Cc3c5dwyIYgneCqNFInW
 TyuxV31drpopoHLzGo3ZbhWHyUeEf2VnMPfA9p5EMbGuVFywe7RaTZE6b
 1rwlmYbhn1OnOy7ZApXQsU21TwN4mhx+n69Gu/oYJrb2DyIm3E8vSG8JT
 wzz2HKhiYkHcuKb60JmN835vnNr0d6oiORyLmylCZ4tksy7WjWUs5Zf/z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="336073498"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="336073498"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 02:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747941254"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="747941254"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.237.142.115])
 ([10.237.142.115])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 02:59:28 -0700
Message-ID: <5e912413-eee4-5b25-5f6d-00ccc7501b9d@linux.intel.com>
Date: Tue, 14 Mar 2023 10:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dafna@fastmail.com,
 ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 stanislaw.gruszka@linux.intel.com, dri-devel@lists.freedesktop.org
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 06.03.2023 22:34, Jeffrey Hugo wrote:
> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b0db911..feb2974 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17253,6 +17253,15 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
>  F:	drivers/clk/qcom/
>  F:	include/dt-bindings/clock/qcom,*
>  
> +QUALCOMM CLOUD AI (QAIC) DRIVER
> +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/accel/qaic/
> +F:	drivers/accel/qaic/
> +F:	include/uapi/drm/qaic_accel.h

Aren't you missing repo link?
T:	git git://anongit.freedesktop.org/drm/drm-misc

> +
>  QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
>  M:	Bjorn Andersson <andersson@kernel.org>
>  M:	Konrad Dybcio <konrad.dybcio@linaro.org>

Regards,
Jacek
