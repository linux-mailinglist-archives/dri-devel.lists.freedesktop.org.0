Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B152280E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2649110F430;
	Wed, 11 May 2022 00:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0710F0E0;
 Wed, 11 May 2022 00:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652227287; x=1683763287;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7RHRssae2FRX5psk74Xv8tmjt+FT1A3nY8e9aWoktGc=;
 b=mVhIvLU3WHMvsiHzsfV1gMRgrt9ZhOUhh5H66ZEsIxwdMB6+xyH7tyf9
 Dz/mAVs79mOOG4kqAWs0bhQ3Xs2/1Hxyv+6ujPbfpl4eGmcGaY4c+dRIH
 +PhnJIW+3EPl2TfJllTOVU9Mh60952V/2Ow+VI8DtxEQD3xpKu07Y2nen U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 May 2022 17:01:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:01:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 17:00:56 -0700
Received: from [10.38.241.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 17:00:52 -0700
Message-ID: <228732a3-47d4-c97c-a016-a14013dc13d8@quicinc.com>
Date: Tue, 10 May 2022 17:00:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/probe-helper: Default to 640x480 if no EDID
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, tzimmermann@suse.de, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/10/2022 1:51 PM, Douglas Anderson wrote:
> If we're unable to read the EDID for a display because it's corrupt /
> bogus / invalid then we'll add a set of standard modes for the
> display. When userspace looks at these modes it doesn't really have a
> good concept for which mode to pick and it'll likely pick the highest
> resolution one by default. That's probably not ideal because the modes
> were purely guesses on the part of the Linux kernel.
> 
> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Note that this is the second of two related and similar-sounding but
> different patches. See also ("drm/probe-helper: For DP, add 640x480 if
> all other modes are bad") [1]. I'm hoping to land _both_ of the
> patches since they address different issues. This patch addresses the
> case of a corrupt EDID and having 640x480 be the default in the
> "guessed" modes. The other patch handles the case where the EDID
> _isn't_ corrupt but all the modes listed can't be made with the
> existing situations. The two patches can land in either order.
> 
> Also note that I didn't carry any Tested-by / Reviewed-by tags since
> the patch is now quite different.
> 
> [1] https://lore.kernel.org/r/20220510131309.v2.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid
> 
> Changes in v2:
> - Don't modify drm_add_modes_noedid() 'cause that'll break others
> - Set 640x480 as preferred in drm_helper_probe_single_connector_modes()
> 
>   drivers/gpu/drm/drm_probe_helper.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 682359512996..1fbb9a8c315c 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -516,8 +516,17 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   		count = drm_add_override_edid_modes(connector);
>   
>   	if (count == 0 && (connector->status == connector_status_connected ||
> -			   connector->status == connector_status_unknown))
> +			   connector->status == connector_status_unknown)) {
>   		count = drm_add_modes_noedid(connector, 1024, 768);
> +
> +		/*
> +		 * Give userspace a hint that we don't have a lot of confidence
> +		 * in these modes (we totally guessed) by marking 640x480 as
> +		 * preferred. This is low clock rate and incredibly common as
> +		 * a failsafe mode.
> +		 */
> +		drm_set_preferred_mode(connector, 640, 480);
> +	}
>   	count += drm_helper_probe_add_cmdline_mode(connector);
>   	if (count == 0)
>   		goto prune;
