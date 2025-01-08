Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCDEA05C7A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 14:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8C210EBB9;
	Wed,  8 Jan 2025 13:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QK69zbtC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743E10EBCC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 13:17:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso8821016f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 05:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736342197; x=1736946997; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=go7fn8G/ymJBJOoBu9CCL9fg2QtY/C41teH6UPJDvwo=;
 b=QK69zbtCRAA+1GbXFsdce6Yh9N/oP0+jwYoyp5JabhXb+JdC5iyogPgn/fZs91LXs+
 WHkKvfXdD6bV8a+2sTQ7/65Ppx2kcv0sxY1J1pYpCybAfVWmsqOSBfEiPwLgSLPsh8it
 Sxmecnuk/PyG3GZ9f3CEjbj5T7v9I+8aTDuneI/0mqkVIb0JhTx94gDH9rnEgG2xTpGk
 qJE67OQu3w4WBOeuCHvmgpyECc3ImX2DuqUrwQzeWRuqmlgF56EJrULV3zRUh8tOKu0C
 fDpdaCZXQ91ztUtE5L7XT7c1iGZGyXK6DoietEa9hEme8Mzk2Z2GKxp5HXLBX92f8a6T
 nBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736342197; x=1736946997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=go7fn8G/ymJBJOoBu9CCL9fg2QtY/C41teH6UPJDvwo=;
 b=dWwBvCmSGoLvTAjhRUAfrB7UPxSQ4LuUCjn/kreak4Qn4pNAklzMMsoYwQfwf8oraD
 JXI3tdgx2vWMKeW7iwalWrbggAakGX7WlLm9sSpmFVllxk8dQ851CdG0XqwVHcVNLPkQ
 fYnr+RdbOgFaIrmJBvz2mwoDovzNm+4IXYxFl/tAsSoNkN4Jf0vROXZuxF9RyiN7hOG/
 PihROIKg4VWZ4uTlAtSHUpEKCcUPkdTa8pLMXiglDM1Hp0qbpUxvSYKmQYTnIM7Ndz+p
 D1SLR9GtzRayrqCmBoVywBSqk7NcW04/+4E1Fx5jQsPBC6q/QwxQVK8jnDD46HbQ3RnQ
 sCgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+lyHQ/QXqG+bv6E0IXclMdSMuNDEf0YV8HIt/Q/aHgKDgtjkELGIU75cafyQrCZi+FoEepndedQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYPdv/SS2UbLqVP/pomThl7X9y1yi7iLC1BwOMHXOAwIdjzjhW
 +Ngy/mRaQwmoNZ026Ujf9odWd5W6bHPUuC8LcTJ5Vyts6+qW80GSeGVKThCdeB0=
X-Gm-Gg: ASbGncukm3qbF9NvoQVyecFgMRxdgShc15diIYgAVnC48UfIVvCEQscsALPYVQLjjga
 KwAbnlQmGuaFtatk3neCs7WwZglkd4tTclmF9rpd/gL1qfhM294Gb8H63h2BG/4o0v0QdVygCe4
 ZySfmJblxgj4fQ31biByW3AC8xrMrR9D1GC0okQ2HMc1riyKVD4F9uXTwolWstsoVW9UT62ZOTD
 so+5AE24VtguE45Q12h3WpXg+PFLM25AD0SycFOtJD1N1AzNBTG6As=
X-Google-Smtp-Source: AGHT+IHuzod8aMhCQ+n6NVLGNnPNVKNs6REXYs0yamrClbVZfZoa7djflMAszxH2qhTaAW4scrTx/w==
X-Received: by 2002:a5d:64ed:0:b0:385:e303:8dd8 with SMTP id
 ffacd0b85a97d-38a872e8b18mr2604012f8f.26.1736342197530; 
 Wed, 08 Jan 2025 05:16:37 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832c45sm52417065f8f.32.2025.01.08.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 05:16:37 -0800 (PST)
Date: Wed, 8 Jan 2025 15:16:29 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z356ra0IDQ4SMbfN@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
 <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>
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

On 25-01-07 10:30:29, Johan Hovold wrote:
> On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > Add a generic helper that allows switching between these modes.
> > 
> > Also add a generic wrapper for the helper that handles the explicit
> > disabling of non-transparent mode and its disable->enable sequence
> > mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> > to move this handling out of the vendor specific driver implementation
> > into the generic framework.
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
> > + *               Negative error code for any non-valid number.
> > + *               See drm_dp_lttpr_count().
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	int ret;
> > +
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (lttpr_count < 0)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed
> 
> typo: transparent (2x)

Will fix.

> 
> > +	 */
> 
> I think this comment now needs to go inside the conditional, if you want
> to keep it at all.

Yes, will move it.

> 
> > +	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
> > +		drm_dp_lttpr_set_transparent_mode(aux, true);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> 
> This looks much better to me now, so with the above addressed: 
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for reviewing!

Abel

