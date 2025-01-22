Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F7AA198D0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 19:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C069F10E72F;
	Wed, 22 Jan 2025 18:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f2+99VQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECC810E72F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 18:53:33 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3043e84c687so211621fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 10:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737571952; x=1738176752; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=47EfM4ewVZOR1hXBHkBwrdrA6zHbkcECh3NcS2frWc4=;
 b=f2+99VQ/GZwDonNNX8azHpxLShMX5qxhTL7Is4fuByoOd9fhpkPgJxoiW8XA1jfgd7
 AaKmqeZxSR566gaDtPwhvLn5dir+0wVzK6xBKWUMiC4EhZRNcYERp+D5Zhf57ESrT2ar
 jzq1WfNH8LYZTPbHiNtcQwP6wwz7XkP+7P9rqYTkFSMDggijKGW4bz6zRbZXZyR3FeJr
 muTdcxxodprFOM/59WRAdH5eEvZstTID2GkPWd8JJHj+H3KbI3wsydm3iemWLOuYYAlV
 /Bkfylb+n91bJaMoqHloVj9zb5ENGWrX3kufJyrL0JneakUqNJz0xPicYlx9rkbXZjMP
 iAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737571952; x=1738176752;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47EfM4ewVZOR1hXBHkBwrdrA6zHbkcECh3NcS2frWc4=;
 b=D6k91wqkCxhg0tIicIAp//3IfZ3FlF/g95aj3jK6ZSaklDBJVHs3HSVKlqApvCUQM2
 zzcGW9ZUmdzV6yD04xF1IV27NTXj0tdzcviI3cQohqBcCixBUnDC8APb+NO3uZ3oqRFZ
 fffDvtehz6z7S/lS4elwH68p2p7sMWa8gje5HdLTMxGuSF6wInE6EtfYq8yeKrmWHWOr
 cnEah6zwsn6CkX7yNxspjNUIC8BTT4AZLZKsENS/SbynDHrIXKCa1Z4a9mj/Aapq0PVY
 IOGStm6oCVUIRnfbrj2bcSWwcByRtiAI2JxbXkfkWfPBCJ2CCIQJtisRimLsz9HIp9Sh
 ToTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsQStwH6uxmWebhyyFkhsv/u7ngcKywiEBnuALTELsQUynqZRRWHF1PBCrjyeHCpVL882I96ZJ1i4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywyu/2KOkexPVF9FErAM44Q6qn8xd4rwL1t73HclmpKupmldibJ
 l3sJgDIqL6tqtEnuKn/WH4au6jmyRvIuV80IQUmfKlf0QeSoVOEzNSVKiQznt4g=
X-Gm-Gg: ASbGncsRONwDyeJi4lYLiS0qMEob/xmIIwnE4d0ZXa5w4RkbDrm2k/nwbPx/9RasECg
 2S9uVguAUZQc4DWQJE0WuzzTmb1jWQQhhTlfu8VIZZy6PdU/S4jAHg4Hq0OJMqLYoQv+fbpvWUa
 VaSHjwcDoNHtP6NDSBRbgmlKtS+8Fko4j9BcszUGlhpA+Slmpz9GnzYVQe6KkE+VXpTQ2HCBTet
 wcXUQ/hX1gSklIDijfjUYkA+XoqquYpmqTm69fs8QZC+1/poCOd4wfmxKSgEusr03G/cisVx/6z
 X7SFjviAxDGe/MMlWfZO8GyGVWEfkJbVYNkX8HQNo5k/BOaLtg==
X-Google-Smtp-Source: AGHT+IE3EDm7wv4jCkNZdaiwQQ2AGo8JcXsq1mg0NjOa/Kt+krzSnrpzbntaHjQxbskhwASEZ3Ro9A==
X-Received: by 2002:a2e:be21:0:b0:302:1dd5:6b34 with SMTP id
 38308e7fff4ca-3072cb1f983mr80371581fa.29.1737571951564; 
 Wed, 22 Jan 2025 10:52:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a27218asm27018491fa.0.2025.01.22.10.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 10:52:30 -0800 (PST)
Date: Wed, 22 Jan 2025 20:52:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, arun.r.murthy@intel.com
Subject: Re: [PATCH 2/3] drm/display/dp: Define function to setup Extended
 wake time
Message-ID: <dlmz7fn3ln7qcnb5ehae3nuzsauxunp4gqibuqwsqmjwrxfcdr@rrtybfduszrq>
References: <20250122053358.1545039-1-suraj.kandpal@intel.com>
 <20250122053358.1545039-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122053358.1545039-3-suraj.kandpal@intel.com>
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

On Wed, Jan 22, 2025 at 11:03:57AM +0530, Suraj Kandpal wrote:
> Extended wake timeout request helps to give additional
> time by reading the DPCD register through which sink requests the
> minimal amount of time required to wake the sink up.
> Source  device shall keep retying the AUX tansaction till the
> extended timeout that is being granted for LTTPRs from the
> sink device.
> 
> --v2
> -Add documentation [Dmitry]
> 
> Spec: DP v2.1 Section 3.6.12.3
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 58 +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 59 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you!

-- 
With best wishes
Dmitry
