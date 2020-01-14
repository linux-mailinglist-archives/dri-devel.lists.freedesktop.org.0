Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5AC13BADD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FAB6E87C;
	Wed, 15 Jan 2020 08:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDF36E416;
 Tue, 14 Jan 2020 15:00:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w15so12518297wru.4;
 Tue, 14 Jan 2020 07:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+qcTtpjLdwac5k5EYn23GxGLXA92skPIBQz0SFrnbO8=;
 b=JKEQGXeP/kN1Ag/gRI3bOB4Vm+h9vQNDMTHF3ViLbdQ3STFGkVIIhncJic0qkBQxmE
 2YOW+2S34QnlsbVPeiwIKkpM+2qcr5kz+vJZkf+FqdhGkanWDTrFq2DJOF5ffxDyHm+e
 oCs/FXw1oCKp2EWS0A53vapsuF1sihrcbUxM7nYZK/klNc7DmUuDaDPRWyfgf+rpHZIh
 0XVff0dv5tBGEyY2sDNEZWMAKItMU4liNYchZi1WGeoAvJK9vQ+q9p+1uftf/XD7RdWh
 0Fm5h0fcTTsBH2OXTI8dSvvzTgDS1yNR9u+if6kRDSf1z8BKpV+WWDsobMVe3At9AFHy
 WpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+qcTtpjLdwac5k5EYn23GxGLXA92skPIBQz0SFrnbO8=;
 b=iBMO1J8XgLpyfJmNTMMkmGDPPJ+1Q02uwOka6Wto1bZ6VR6S83aEb3AMvLpmW8l9JU
 hkhJKoTjJAYSotxdRdqQCZQUH7zOiE2DWhUkZ8/jAkqI5P4mRcM5/yqDXP2XdH6zAMl4
 hoWwtIeIvqG17HqAmLotRxsSyNnM10fNhavp70Pur/JZWk15TOj1N63xZ0TR0UVBgaXs
 06OBZwIZvT0ZOI9OOPYYUwZhEyJhw+XVENbxEYUxr5R9QOyXnDvogMZBtYkXc/UBksaW
 ie8tnnxaTlTHPmw15umTZR4GvBD2qc8kHH4FvHWUPPPbO4e1OGr/uRSlwlAMI6pgW46w
 LkhQ==
X-Gm-Message-State: APjAAAWfjZoXSmbDjy1Fd7ts/MFKdSc6VcRhaeJ9E5a+epMCxh/s1C/G
 RNv5lcuVhkrCjNsT9LSHKr8=
X-Google-Smtp-Source: APXvYqxX9R6Qy8fwdZglrl0qwd9LZcll3xyMAL5I3HR9cegZRAAv5KInGgGiw5hyyT2dKxXf1kKgbQ==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr25948544wrn.29.1579014022025; 
 Tue, 14 Jan 2020 07:00:22 -0800 (PST)
Received: from wambui.local ([41.220.112.70])
 by smtp.googlemail.com with ESMTPSA id v22sm18746071wml.11.2020.01.14.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 07:00:20 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Tue, 14 Jan 2020 18:00:08 +0300 (EAT)
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/i915/audio: convert to new drm logging macros.
In-Reply-To: <87a76qktez.fsf@intel.com>
Message-ID: <alpine.LNX.2.21.99999.375.2001141759220.29778@wambui>
References: <20200114095107.21197-1-wambui.karugax@gmail.com>
 <20200114095107.21197-3-wambui.karugax@gmail.com> <87d0bmktgy.fsf@intel.com>
 <87a76qktez.fsf@intel.com>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, sean@poorly.run,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tue, 14 Jan 2020, Jani Nikula wrote:

> On Tue, 14 Jan 2020, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Tue, 14 Jan 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
>>> Converts the printk based logging macros in i915/display/intel_audio.c
>>> to the struct drm_device based logging macros.
>>
>> Couple of comments inline.
>
> PS. This is
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> and I'm fine with the requested changes being applied as separate
> patches as long as they happen.
>
>
Sure, I think a separate patch for those changes might be best.
I'll do that.

Thanks,
wambui.
>>
>> BR,
>> Jani.
>>
>>
>>> This transformation was achieved using the following coccinelle script
>>> that matches the existence of the struct drm_i915_private device:
>>>
>>> @rule1@
>>> identifier fn, T;
>>> @@
>>>
>>> fn(struct drm_i915_private *T,...) {
>>> <+...
>>> (
>>> -DRM_INFO(
>>> +drm_info(&T->drm,
>>> ...)
>>> |
>>> -DRM_ERROR(
>>> +drm_err(&T->drm,
>>> ...)
>>> |
>>> -DRM_WARN(
>>> +drm_warn(&T->drm,
>>> ...)
>>> |
>>> -DRM_DEBUG(
>>> +drm_dbg(&T->drm,
>>> ...)
>>> |
>>> -DRM_DEBUG_DRIVER(
>>> +drm_dbg(&T->drm,
>>> ...)
>>> |
>>> -DRM_DEBUG_KMS(
>>> +drm_dbg_kms(&T->drm,
>>> ...)
>>> )
>>> ...+>
>>> }
>>>
>>> @rule2@
>>> identifier fn, T;
>>> @@
>>>
>>> fn(...) {
>>> ...
>>> struct drm_i915_private *T = ...;
>>> <+...
>>> (
>>> -DRM_INFO(
>>> +drm_info(&T->drm,
>>> ...)
>>> |
>>> -DRM_ERROR(
>>> +drm_err(&T->drm,
>>> ...)
>>> |
>>> -DRM_WARN(
>>> +drm_warn(&T->drm,
>>> ...)
>>> |
>>> -DRM_DEBUG(
>>> +drm_dbg(&T->drm,
>>> ...)
>>> |
>>> -DRM_DEBUG_KMS(
>>> +drm_dbg_kms(&T->drm,
>>> ...)
>>> |
>>> -DRM_DEBUG_DRIVER(
>>> +drm_dbg(&T->drm,
>>> ...)
>>> )
>>> ...+>
>>> }
>>>
>>> Checkpatch warnings were manually fixed.
>>>
>>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_audio.c | 71 ++++++++++++----------
>>>  1 file changed, 40 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
>>> index e406719a6716..57208440bf6d 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_audio.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
>>> @@ -315,7 +315,7 @@ static void g4x_audio_codec_disable(struct intel_encoder *encoder,
>>>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>>>  	u32 eldv, tmp;
>>>
>>> -	DRM_DEBUG_KMS("Disable audio codec\n");
>>> +	drm_dbg_kms(&dev_priv->drm, "Disable audio codec\n");
>>>
>>>  	tmp = I915_READ(G4X_AUD_VID_DID);
>>>  	if (tmp == INTEL_AUDIO_DEVBLC || tmp == INTEL_AUDIO_DEVCL)
>>> @@ -340,7 +340,8 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
>>>  	u32 tmp;
>>>  	int len, i;
>>>
>>> -	DRM_DEBUG_KMS("Enable audio codec, %u bytes ELD\n", drm_eld_size(eld));
>>> +	drm_dbg_kms(&dev_priv->drm, "Enable audio codec, %u bytes ELD\n",
>>> +		    drm_eld_size(eld));
>>>
>>>  	tmp = I915_READ(G4X_AUD_VID_DID);
>>>  	if (tmp == INTEL_AUDIO_DEVBLC || tmp == INTEL_AUDIO_DEVCL)
>>> @@ -360,7 +361,7 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
>>>  	I915_WRITE(G4X_AUD_CNTL_ST, tmp);
>>>
>>>  	len = min(drm_eld_size(eld) / 4, len);
>>> -	DRM_DEBUG_DRIVER("ELD size %d\n", len);
>>> +	drm_dbg(&dev_priv->drm, "ELD size %d\n", len);
>>
>> Please convert this to drm_dbg_kms() while at it.
>>
>>>  	for (i = 0; i < len; i++)
>>>  		I915_WRITE(G4X_HDMIW_HDMIEDID, *((const u32 *)eld + i));
>>>
>>> @@ -384,9 +385,10 @@ hsw_dp_audio_config_update(struct intel_encoder *encoder,
>>>  	rate = acomp ? acomp->aud_sample_rate[port] : 0;
>>>  	nm = audio_config_dp_get_n_m(crtc_state, rate);
>>>  	if (nm)
>>> -		DRM_DEBUG_KMS("using Maud %u, Naud %u\n", nm->m, nm->n);
>>> +		drm_dbg_kms(&dev_priv->drm, "using Maud %u, Naud %u\n", nm->m,
>>> +			    nm->n);
>>>  	else
>>> -		DRM_DEBUG_KMS("using automatic Maud, Naud\n");
>>> +		drm_dbg_kms(&dev_priv->drm, "using automatic Maud, Naud\n");
>>>
>>>  	tmp = I915_READ(HSW_AUD_CFG(cpu_transcoder));
>>>  	tmp &= ~AUD_CONFIG_N_VALUE_INDEX;
>>> @@ -437,13 +439,13 @@ hsw_hdmi_audio_config_update(struct intel_encoder *encoder,
>>>
>>>  	n = audio_config_hdmi_get_n(crtc_state, rate);
>>>  	if (n != 0) {
>>> -		DRM_DEBUG_KMS("using N %d\n", n);
>>> +		drm_dbg_kms(&dev_priv->drm, "using N %d\n", n);
>>>
>>>  		tmp &= ~AUD_CONFIG_N_MASK;
>>>  		tmp |= AUD_CONFIG_N(n);
>>>  		tmp |= AUD_CONFIG_N_PROG_ENABLE;
>>>  	} else {
>>> -		DRM_DEBUG_KMS("using automatic N\n");
>>> +		drm_dbg_kms(&dev_priv->drm, "using automatic N\n");
>>>  	}
>>>
>>>  	I915_WRITE(HSW_AUD_CFG(cpu_transcoder), tmp);
>>> @@ -476,8 +478,8 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
>>>  	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
>>>  	u32 tmp;
>>>
>>> -	DRM_DEBUG_KMS("Disable audio codec on transcoder %s\n",
>>> -		      transcoder_name(cpu_transcoder));
>>> +	drm_dbg_kms(&dev_priv->drm, "Disable audio codec on transcoder %s\n",
>>> +		    transcoder_name(cpu_transcoder));
>>>
>>>  	mutex_lock(&dev_priv->av_mutex);
>>>
>>> @@ -511,8 +513,9 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
>>>  	u32 tmp;
>>>  	int len, i;
>>>
>>> -	DRM_DEBUG_KMS("Enable audio codec on transcoder %s, %u bytes ELD\n",
>>> -		      transcoder_name(cpu_transcoder), drm_eld_size(eld));
>>> +	drm_dbg_kms(&dev_priv->drm,
>>> +		    "Enable audio codec on transcoder %s, %u bytes ELD\n",
>>> +		     transcoder_name(cpu_transcoder), drm_eld_size(eld));
>>>
>>>  	mutex_lock(&dev_priv->av_mutex);
>>>
>>> @@ -561,9 +564,10 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
>>>  	u32 tmp, eldv;
>>>  	i915_reg_t aud_config, aud_cntrl_st2;
>>>
>>> -	DRM_DEBUG_KMS("Disable audio codec on [ENCODER:%d:%s], pipe %c\n",
>>> -		      encoder->base.base.id, encoder->base.name,
>>> -		      pipe_name(pipe));
>>> +	drm_dbg_kms(&dev_priv->drm,
>>> +		    "Disable audio codec on [ENCODER:%d:%s], pipe %c\n",
>>> +		     encoder->base.base.id, encoder->base.name,
>>> +		     pipe_name(pipe));
>>>
>>>  	if (WARN_ON(port == PORT_A))
>>>  		return;
>>> @@ -611,9 +615,10 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
>>>  	int len, i;
>>>  	i915_reg_t hdmiw_hdmiedid, aud_config, aud_cntl_st, aud_cntrl_st2;
>>>
>>> -	DRM_DEBUG_KMS("Enable audio codec on [ENCODER:%d:%s], pipe %c, %u bytes ELD\n",
>>> -		      encoder->base.base.id, encoder->base.name,
>>> -		      pipe_name(pipe), drm_eld_size(eld));
>>> +	drm_dbg_kms(&dev_priv->drm,
>>> +		    "Enable audio codec on [ENCODER:%d:%s], pipe %c, %u bytes ELD\n",
>>> +		    encoder->base.base.id, encoder->base.name,
>>> +		    pipe_name(pipe), drm_eld_size(eld));
>>>
>>>  	if (WARN_ON(port == PORT_A))
>>>  		return;
>>> @@ -701,14 +706,13 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
>>>
>>>  	/* FIXME precompute the ELD in .compute_config() */
>>>  	if (!connector->eld[0])
>>> -		DRM_DEBUG_KMS("Bogus ELD on [CONNECTOR:%d:%s]\n",
>>> -			      connector->base.id, connector->name);
>>> +		drm_dbg_kms(&dev_priv->drm,
>>> +			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
>>> +			    connector->base.id, connector->name);
>>>
>>> -	DRM_DEBUG_DRIVER("ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
>>> -			 connector->base.id,
>>> -			 connector->name,
>>> -			 connector->encoder->base.id,
>>> -			 connector->encoder->name);
>>> +	drm_dbg(&dev_priv->drm, "ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
>>> +		connector->base.id, connector->name,
>>> +		connector->encoder->base.id, connector->encoder->name);
>>
>> Please convert this to drm_dbg_kms() while at it.
>>
>>>
>>>  	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
>>>
>>> @@ -851,8 +855,9 @@ static unsigned long i915_audio_component_get_power(struct device *kdev)
>>>  	if (dev_priv->audio_power_refcount++ == 0) {
>>>  		if (IS_TIGERLAKE(dev_priv) || IS_ICELAKE(dev_priv)) {
>>>  			I915_WRITE(AUD_FREQ_CNTRL, dev_priv->audio_freq_cntrl);
>>> -			DRM_DEBUG_KMS("restored AUD_FREQ_CNTRL to 0x%x\n",
>>> -				      dev_priv->audio_freq_cntrl);
>>> +			drm_dbg_kms(&dev_priv->drm,
>>> +				    "restored AUD_FREQ_CNTRL to 0x%x\n",
>>> +				    dev_priv->audio_freq_cntrl);
>>>  		}
>>>
>>>  		/* Force CDCLK to 2*BCLK as long as we need audio powered. */
>>> @@ -992,7 +997,8 @@ static int i915_audio_component_sync_audio_rate(struct device *kdev, int port,
>>>  	/* 1. get the pipe */
>>>  	encoder = get_saved_enc(dev_priv, port, pipe);
>>>  	if (!encoder || !encoder->base.crtc) {
>>> -		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
>>> +		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
>>> +			    port_name(port));
>>>  		err = -ENODEV;
>>>  		goto unlock;
>>>  	}
>>> @@ -1023,7 +1029,8 @@ static int i915_audio_component_get_eld(struct device *kdev, int port,
>>>
>>>  	intel_encoder = get_saved_enc(dev_priv, port, pipe);
>>>  	if (!intel_encoder) {
>>> -		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
>>> +		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
>>> +			    port_name(port));
>>>  		mutex_unlock(&dev_priv->av_mutex);
>>>  		return ret;
>>>  	}
>>> @@ -1119,15 +1126,17 @@ static void i915_audio_component_init(struct drm_i915_private *dev_priv)
>>>  				  &i915_audio_component_bind_ops,
>>>  				  I915_COMPONENT_AUDIO);
>>>  	if (ret < 0) {
>>> -		DRM_ERROR("failed to add audio component (%d)\n", ret);
>>> +		drm_err(&dev_priv->drm,
>>> +			"failed to add audio component (%d)\n", ret);
>>>  		/* continue with reduced functionality */
>>>  		return;
>>>  	}
>>>
>>>  	if (IS_TIGERLAKE(dev_priv) || IS_ICELAKE(dev_priv)) {
>>>  		dev_priv->audio_freq_cntrl = I915_READ(AUD_FREQ_CNTRL);
>>> -		DRM_DEBUG_KMS("init value of AUD_FREQ_CNTRL of 0x%x\n",
>>> -			      dev_priv->audio_freq_cntrl);
>>> +		drm_dbg_kms(&dev_priv->drm,
>>> +			    "init value of AUD_FREQ_CNTRL of 0x%x\n",
>>> +			    dev_priv->audio_freq_cntrl);
>>>  	}
>>>
>>>  	dev_priv->audio_component_registered = true;
>
> -- 
> Jani Nikula, Intel Open Source Graphics Center
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
