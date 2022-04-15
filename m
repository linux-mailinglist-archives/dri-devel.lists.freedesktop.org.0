Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24217501FCA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 02:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927D310E6C7;
	Fri, 15 Apr 2022 00:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664FE10E68C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 00:48:10 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x17so11785239lfa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 17:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BycpfwmzoR4vzcAZR2CT84zb+01RL1PgdUJzETRbklU=;
 b=NBQEoiYmC/899Hw9WnmJ+R+JGTM5xfbrHKBaRot/VLZdi5oUx132Hm34eKvvuzCQq4
 wKW7E6pru0TICqR+6kebPpRT6Vcb53nbTvdPh+5Uz4BRRilxTNIguBHGly9DxV520Zhu
 ZRc7hnUYVvPL3q5Muo7vIDSv5MrJ8J+Bgk6L1tyCvJ4P7FK6ZeNidUaxmu9v78STJr7U
 7/cNbXOQrTXbCWDTs3iSe+ad3Err8qBiC33WZfzyagj4X3erSZrykwgp9WxLmXP4z87u
 yjSnHSWEO37JgM+CUb6PXghGg0BXDK9u1oeb+Oq6pwVMV2jqzjMiE33pmH7YNUhZvRZi
 wGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BycpfwmzoR4vzcAZR2CT84zb+01RL1PgdUJzETRbklU=;
 b=m7m+TlhHupDAwkIVYwnMjb57Mq9fbIO/mau/63Ag/hJG/0x2ojKrnH60Wf3Pf+fTWu
 EyM155H8M1hU/OsYfFZm0zpVSghpFADHAi2wL3/2GjkPf0qKRkyqXqTqhiY08ZhhFZaV
 3yalgwFWdlWvfnYGWJpt2BYAVOSfK/1iSD93F6ft5EMqlkU7obyRzfUXidNrmPcJN2i2
 01otc3ltoskbqTBJqripH48zzcl1D6ccoVezbYYUqn72xbpG2TGRzCbOH29fROZ/8aOo
 9meJmz0FO+5G0u0oEwAlSNNS2DPNQZjWgZs7uAx+n4rqn4s6rxoDPYda/0VO8VjxMs1m
 bCZA==
X-Gm-Message-State: AOAM531sgaMWotzR8ixk6rmaxFEKgdysDbogMwqJ0ELVkCC1CfUW3ZNq
 73/F+Qiedne2M+vIy2W/LfjVkA==
X-Google-Smtp-Source: ABdhPJwbti2aqvzvc7DFdbELNEMXxtK8iweXhJZDxAE3gj2VfSKrWrYUMtY4ksILtWY52drF7E1T9w==
X-Received: by 2002:ac2:4e11:0:b0:46b:a38d:686a with SMTP id
 e17-20020ac24e11000000b0046ba38d686amr3522985lfr.564.1649983688700; 
 Thu, 14 Apr 2022 17:48:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a2ea418000000b0024b5b76a06csm139293ljn.12.2022.04.14.17.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 17:48:08 -0700 (PDT)
Message-ID: <68538a58-54e2-e82e-0789-52eb1cc6b66a@linaro.org>
Date: Fri, 15 Apr 2022 03:48:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 3/6] drm/dp: Add is_hpd_asserted() callback to struct
 drm_dp_aux
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.3.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220408193536.RFC.3.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/04/2022 05:36, Douglas Anderson wrote:
> Sometimes it's useful for users of the DP AUX bus (like panels) to be
> able to poll HPD. Let's add a callback that allows DP AUX busses
> drivers to provide this.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
>   include/drm/dp/drm_dp_helper.h | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> index dad1442c91df..a12951319573 100644
> --- a/include/drm/dp/drm_dp_helper.h
> +++ b/include/drm/dp/drm_dp_helper.h
> @@ -2021,6 +2021,20 @@ struct drm_dp_aux {
>   	ssize_t (*transfer)(struct drm_dp_aux *aux,
>   			    struct drm_dp_aux_msg *msg);
>   
> +	/**
> +	 * @is_hpd_asserted: returns true if HPD is asserted
> +	 *
> +	 * This is mainly useful for eDP panels drivers to query whether
> +	 * an eDP panel has finished powering on. This is an optional function.
> +	 *
> +	 * NOTE: this function specifically reports the state of the HPD pin
> +	 * that's associated with the DP AUX channel. This is different from
> +	 * the HPD concept in much of the rest of DRM which is more about
> +	 * physical presence of a display. For eDP, for instance, a display is
> +	 * assumed always present even if the HPD pin is deasserted.
> +	 */
> +	bool (*is_hpd_asserted)(struct drm_dp_aux *aux);
> +
>   	/**
>   	 * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
>   	 */


-- 
With best wishes
Dmitry
