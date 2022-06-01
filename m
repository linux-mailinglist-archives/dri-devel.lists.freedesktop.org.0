Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED053ADB0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 22:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C677E10E24D;
	Wed,  1 Jun 2022 20:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1CD10E24D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 20:38:44 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id l13so4616558lfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 13:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rli81qT3aY9grG7I0Zdsvr0TJJcjGf6V8Lsp1mBXU0I=;
 b=a5fplg21+zkFG8cnfxhUnkrPIaRdaxJHnKXMotITglu3xFma5QXQf2oXi9oIXPXPbT
 zCFhd2QpvvPUg1jgKn1Orbp9FBlELi65AtS/cRgFD8+zSMlx4+iD1H4DySkoQn3EA+VG
 KPN6wS8VSOrMdKxO+9a2jxgJrr23x/6dZ6wvzziVklDLXKlpWe1Bhj6c6oMz9JTnI441
 /hBeR1SNQHIuVi5iP6jO+QBQr48oAlPKgVM3ZOmhP2Plw5Qu42tx2YluaYtxw5Y5ko6d
 KXbINJHHHcl0fhpYpvynhUdtbnCBbxeRcNr7Ogo/an/Igtupztsw2jxOqykEWffy33LR
 lp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rli81qT3aY9grG7I0Zdsvr0TJJcjGf6V8Lsp1mBXU0I=;
 b=xrqcHZZztf3BhPWHl3FPgZ0+VEGaFQllSJi7KqgWREMDPAZzmCvLhkVo8pXxcsVV+q
 Ol+IEkiiXrgBEcB6NZ8O79cmE63fmzc2i0nmKqCuB4KQqohS6nBlm/mwqnMIcFd5KDuq
 jT+4nCFHfMfTNzcOPeRiFOAEZtM+z7NRXwiOJDveqrY88BbizBqsiBuFzOpAGPgiakQJ
 EpQjnqLkTAWiFyNLHQd1K7DtKcYAUwqpGdWfBJ+9K/O9qxZ9qQCdj0kWkfHgQgO4/LPZ
 L7hNtIHAd15d1LPjg4miAM2R56Nah8JzxEQ+YIp8ju6j4TqWr95amMbPHuKytKcES195
 mjDQ==
X-Gm-Message-State: AOAM532vwiFdJYOZSAatTEA4CGf38/I8tQbxswdmN2ZjVzF8p6pn5Kug
 XRCpM/sSz9+esEXML0NDADQp/g==
X-Google-Smtp-Source: ABdhPJyf67M4a459Gk7ua+s+fVv1OXZeLfmT3T/mpL6Je/8FI/kzjQ+76g+lY+ihfqCubA0XCYTsiA==
X-Received: by 2002:ac2:58e3:0:b0:479:2a5:6fed with SMTP id
 v3-20020ac258e3000000b0047902a56fedmr914026lfo.326.1654115922821; 
 Wed, 01 Jun 2022 13:38:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w41-20020a0565120b2900b00477a51842aasm555425lfu.211.2022.06.01.13.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 13:38:42 -0700 (PDT)
Message-ID: <f5aca17d-dd97-8805-08ab-f28cbe06ce57@linaro.org>
Date: Wed, 1 Jun 2022 23:38:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4] drm/probe-helper: Default to 640x480 if no EDID on DP
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
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
Cc: quic_sbillaka@quicinc.com, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com, tzimmermann@suse.de,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/06/2022 21:23, Douglas Anderson wrote:
> If we're unable to read the EDID for a display because it's corrupt /
> bogus / invalid then we'll add a set of standard modes for the
> display. Since we have no true information about the connected
> display, these modes are essentially guesses but better than nothing.
> At the moment, none of the modes returned is marked as preferred, but
> the modes are sorted such that the higher resolution modes are listed
> first.
> 
> When userspace sees these modes presented by the kernel it needs to
> figure out which one to pick. At least one userspace, ChromeOS [1]
> seems to use the rules (which seem pretty reasonable):
> 1. Try to pick the first mode marked as preferred.
> 2. Try to pick the mode which matches the first detailed timing
>     descriptor in the EDID.
> 3. If no modes were marked as preferred then pick the first mode.
> 
> Unfortunately, userspace's rules combined with what the kernel is
> doing causes us to fail section 4.2.2.6 (EDID Corruption Detection) of
> the DP 1.4a Link CTS. That test case says that, while it's OK to allow
> some implementation-specific fall-back modes if the EDID is bad that
> userspace should _default_ to 640x480.
> 
> Let's fix this by marking 640x480 as default for DP in the no-EDID
> case.
> 
> NOTES:
> - In the discussion around v3 of this patch [2] there was talk about
>    solving this in userspace and I even implemented a patch that would
>    have solved this for ChromeOS, but then the discussion turned back
>    to solving this in the kernel.
> - Also in the discussion of v3 [2] it was requested to limit this
> 83;40900;0c  change to just DP since folks were worried that it would break some

Nit: this line seems broken

>    subtle corner case on VGA or HDMI.
> 
> [1] https://source.chromium.org/chromium/chromium/src/+/a051f741d0a15caff2251301efe081c30e0f4a96:ui/ozone/platform/drm/common/drm_util.cc;l=488
> [2] https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> I put Abhinav's Reviewed-by tag from v2 here since this is nearly the
> same as v2. Hope this is OK.
> 
> Changes in v4:
> - Code is back to v2, but limit to just DP.
> - Beefed up the commit message.
> 
> Changes in v3:
> - Don't set preferred, just disable the sort.
> 
> Changes in v2:
> - Don't modify drm_add_modes_noedid() 'cause that'll break others
> - Set 640x480 as preferred in drm_helper_probe_single_connector_modes()
> 
>   drivers/gpu/drm/drm_probe_helper.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 425f56280d51..75a71649b64d 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -569,8 +569,17 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   		count = drm_add_override_edid_modes(connector);
>   
>   	if (count == 0 && (connector->status == connector_status_connected ||
> -			   connector->status == connector_status_unknown))
> +			   connector->status == connector_status_unknown)) {
>   		count = drm_add_modes_noedid(connector, 1024, 768);
> +
> +		/*
> +		 * Section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a
> +		 * Link CTS specifies that 640x480 (the official "failsafe"
> +		 * mode) needs to be the default if there's no EDID.
> +		 */
> +		if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +			drm_set_preferred_mode(connector, 640, 480);
> +	}
>   	count += drm_helper_probe_add_cmdline_mode(connector);
>   	if (count != 0) {
>   		ret = __drm_helper_update_and_validate(connector, maxX, maxY, &ctx);


-- 
With best wishes
Dmitry
