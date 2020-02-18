Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBB162996
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 16:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB99789E7B;
	Tue, 18 Feb 2020 15:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2361189E50
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 15:40:57 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id 192so9588031ywy.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 07:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I248Y/8CNKtvbdDU65iHEJA0YHjR0t7vqNEgoLY+B1s=;
 b=WeWtpm9kTJSBEPiyNFaeNwC6F2RaibZ+MfkHsBsyh/MUGthW1iNE27yIn0zCYP6FKC
 weYdD1htj9X6P9gIozWkPlgFWWsW1/WkrZUQyVk2x6uxHkCH8DxIIifJDMBDjR5tgIAk
 NMhMmrUnZy4e7AE2aBPjk4Yyrq/5RURaIdyhluDNbZPvNA4twGCjTxTOmCipCT/IV87v
 H36vcaZ2hgqT3OIeUIn+uDJjITwcpjhHiNBmnDb7y2IEqUT/710AZ0S4ducY7Dmmn0Mn
 esKqNcYSFx3A5NtHV3U1m/53qxGIa/ZJfakWndAW77WsDqq7TVWIxmELKBmFFplMzAy6
 ZvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I248Y/8CNKtvbdDU65iHEJA0YHjR0t7vqNEgoLY+B1s=;
 b=droFOZrVb9yeYx5aJnRATaXyxjl0lrF4ChBWttSWhItxzasucEbYwpRynbpCv1iK9R
 +1sgZhqC9AoMObLnz++ZK4oAsMZlulTQ4pBjFyuYGD+fsSg6J4KIRBvmW8wCfr7yxsom
 OTewoAtC8SSpwKksFUUZUPGKCjQSUFQbtAuj3sYnlvdoV8r4KbL0pfGABhH2dVzDyB/3
 GqKpnPDDgAgtQ3swvE/h719Hb4paPZ4OK5yR2xeJwFJQixdEXwn+r9DNUbJGw4YWIxPW
 /+dhTsGqUXKQcKQwOjmnC9Joqd6apPl34F2LvFnXMj/VHo69ukjDz7byDm+lhRba8gBF
 Gylg==
X-Gm-Message-State: APjAAAXvr171hRa/xla5qaqTazFy6rwmPPocEK54mGQR8K7VpFOIH+9P
 eHaVfAUlJPj7faBv2M0cL47kxg==
X-Google-Smtp-Source: APXvYqx5jg70pCttNc9cCAh7/sTI3pZN/NBBjZ4mQUqhEvJ6rm0TvTO0+Gz6uH/X7McaVG+jqa3PUg==
X-Received: by 2002:a81:444:: with SMTP id 65mr16442467ywe.171.1582040455404; 
 Tue, 18 Feb 2020 07:40:55 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id p2sm1650587ywd.58.2020.02.18.07.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 07:40:54 -0800 (PST)
Date: Tue, 18 Feb 2020 10:40:53 -0500
From: Sean Paul <sean@poorly.run>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915: dont retry stream
 management at seq_num_m roll over
Message-ID: <20200218154053.GB253734@art_vandelay>
References: <20200212102942.26568-1-ramalingam.c@intel.com>
 <20200212102942.26568-5-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212102942.26568-5-ramalingam.c@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 03:59:41PM +0530, Ramalingam C wrote:
> When roll over detected for seq_num_m, we shouldn't continue with stream
> management with rolled over value.
> 
> So we are terminating the stream management retry, on roll over of the
> seq_num_m.
> 
> v2:
>   using drm_dbg_kms instead of DRM_DEBUG_KMS [Anshuman]
> v3:
>   dev_priv is used as i915 [JaniN]
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index b24d12efae0a..b35f50d4a0e9 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1419,11 +1419,6 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
>  
>  err_exit:
>  	hdcp->seq_num_m++;
> -	if (hdcp->seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
> -		DRM_DEBUG_KMS("seq_num_m roll over.\n");
> -		ret = -1;
> -	}
> -
>  	return ret;
>  }
>  
> @@ -1618,8 +1613,11 @@ hdcp2_propagate_stream_management_info(struct intel_connector *connector)
>  
>  	for (i = 0; i < tries; i++) {
>  		ret = _hdcp2_propagate_stream_management_info(connector);
> -		if (!ret)
> +		if (!ret || connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
> +			if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX)
> +				drm_dbg_kms(&i915->drm, "seq_num_m roll over.\n");
>  			break;
> +		}

IMO it doesn't read quite right bunching up a success outcome and a failure,
and it's actually less code (character-wise) to do:

                if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
                        drm_dbg_kms(&i915->drm, "seq_num_m roll over.\n");
                        break;
                } else if (!ret) {
                        break;
                }

feel free to add

Reviewed-by: Sean Paul <sean@poorly.run>

with this addressed

>  
>  		drm_dbg_kms(&i915->drm,
>  			    "HDCP2 stream management %d of %d Failed.(%d)\n",
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
