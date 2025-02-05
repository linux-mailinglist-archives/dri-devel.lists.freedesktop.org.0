Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED17A290A0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5827410E19D;
	Wed,  5 Feb 2025 14:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gjxyy+Ys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3098910E19D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:38:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-543d8badc30so7227084e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 06:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738766313; x=1739371113; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/3s/LLOq0dPV7UNCIkOxXe+oy85qndr/lTrPV05GR6w=;
 b=Gjxyy+YsJErUBaoSEV/TVg+cYFw81pEj+tFq4TjmnrdWqKLj498oqbwDUKHusbEKLZ
 u0MR7rMrOguDMAr9gW/5NaMpIBx0NCeYcTfPXPCjIhTpfqVfdbuv3l1obrvCGh8v+Adc
 r1n27AJoYFg3t9vejnJm4s9Awnyza5Z7MCUCuk3BGWJpuEKr8vs/L4/ucsH31arar17f
 pi+phlgjtKv55Hk8+WY4QvTRPe0THCc20FtuvZWZ+D1rp4AmVscXfheWTXldQHu5RHv8
 aVkATMTyEFpQu0i4Sh2KEVuDSRS4NTFPQ6/53aYZjt2PLaWehP1rq+o6p1BvCZKu2UBi
 /raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738766313; x=1739371113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3s/LLOq0dPV7UNCIkOxXe+oy85qndr/lTrPV05GR6w=;
 b=ioKgSNiFjj7zx8oz4y8VX8HBaOhYTP0tI9xDMlrhP9yQdyi7GzjzAOkLZamM9RLj9T
 rIWxMzRR0l+1FdZiKMAJm/F/6jk3oA6iIz5mmVR8ApKPFmf4V+7b9nCfx/peijm0+cfW
 EtLrt6DedlH3r5U6LvxbKXEdhh3OYq1FRi4J351wljuFSkNmqmw2WZusKglbVw8C2rKv
 g9GKZmDhtZuuDyg4GXbiHZH4nvfQyRGipR0h7o98ATmX3EV3g0e7LUt9vZxk3CtA7VlH
 4jHbesf/JCbQlMk0hi3V6h0dzrcv2tW4RPszjUGKzdukFK3N1G1N5nUb2mLbJgogtChs
 ueeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkDzbgWIePcrJCnxxmylVzbB+Z5u7vdR97IIETCc828vnIzycGoLSUm4pn42xSjMN+fCh8NfAZ1jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1b/5pwBi4ynso6E4j/ftMJtM9pJDHKLRmPfMpv0Lackr5Ya6K
 Rq51mZw/2sK0v3CLhDCB1FeCHsQLcqjcXu4nuC98fcCGTC9Sm/vw98QJpVx78IQ=
X-Gm-Gg: ASbGnctcRpJyrfZtgrXyTd7VmCnE1tXGJo3GfsmPr4FBvR5b4kPneVD1h90FfKr4gsz
 ZerLHo4F9Os1oVrh6AWD7UJeXOkveqwVvfBOUXXAQYW13chT4dL0hFF7+XEtJNyYpl3T/2L61ZJ
 eM+VPid2nm1rq8h1yce/2qY9Obdf4i0bBmb+83/hAD1dFV2Xm6kIwoSGjWlYYzTC3JBI4mhucBt
 9YClTgj+FTpillFAVAY9b68BCi+qcQCsAVRX1PxS38S6n++pdxxbs6hK+Zu+6ietM5jKreNk2ID
 0npAvAlTnuRTf0bWeGYjDQsgkfrrBpHxwYnykb8TAs9BipRc4Q9YclD1MtT4pjmNPFflUBI=
X-Google-Smtp-Source: AGHT+IE6siSiYqoCqQTIpeksExMipCrLJz+JIWoi0AVtVuBjC0/DHoH67kNXH9JZjIrWHluYAMlZXw==
X-Received: by 2002:a05:6512:3e15:b0:53e:38fd:7518 with SMTP id
 2adb3069b0e04-54405a0c4ccmr1152151e87.3.1738766313153; 
 Wed, 05 Feb 2025 06:38:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe219e8sm1918090e87.106.2025.02.05.06.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 06:38:31 -0800 (PST)
Date: Wed, 5 Feb 2025 16:38:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw
Subject: Re: [PATCH v3 1/2] drm/bridge: it6505: add support
 DRM_BRIDGE_OP_HDMI to drm_bridge
Message-ID: <t2nd3xjgb4nomasdlb5cmgxxystyo66si7gdqafzi56noknzvc@6i366tvzpfl7>
References: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
 <20250205-add-audio-codec-v3-1-26cfadb2d81f@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-add-audio-codec-v3-1-26cfadb2d81f@ite.com.tw>
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

On Wed, Feb 05, 2025 at 02:41:03PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Add DRM_BRIDGE_OP_HDMI to bridge.ops and implement necessary callback
> functions.

Wait.... Now I feel really sorry. I stumbled upon HDMI_related bits and
then I thought that it's a HDMI bridge without actually checking the
datasheet. When you have a hammer, everything looks like a nail...
Except that IT6505 is neither a nail nor an HDMI bridge.

I'm really sorry for pushing you into the wrong way of OP_HDMI. However
I still think that DisplayPort bridges should not implement codec
callbacks directly. Let me play with that over the next few days. I
think in the end we should be able to use .hdmi_audio_*() callbacks
and drm_hdmi_audio_helper.c while not (over)using the OP_HDMI. I'll ping
you in the next few days.

> The native AVI and AUDIO infoframe configuration API are removed.
> 
> In .atomic_enable use
> drm_atomic_helper_connector_hdmi_update_infoframes().
> for infoframe updates.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 185 ++++++++++++++++++++++--------------
>  1 file changed, 115 insertions(+), 70 deletions(-)
> 
-- 
With best wishes
Dmitry
