Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF1AC4520
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 00:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A301910E27C;
	Mon, 26 May 2025 22:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DECQ+tC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3132D10E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:41:53 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6046ecc3e43so1677225a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748248911; x=1748853711; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zHd2wRcQ7lTQF+yNodZJWejVqs2eiPfPDjLrNwQ5rWI=;
 b=DECQ+tC3+MK9isJ68/9FUtooEx5jE6xLLehiZ0k3IU8iWKAM95PwHCFJKoaCGbz+mE
 AdhLzzvG8CSqrBzdEdTGu+9dDfBn7ytO9CWadBfhDJglATIHlGWlsmAcisR7INJ5skru
 egIax4DIWqS3p79qzNGBv1NWBhmw+gAFEBHP+eAQ2pMWIZE7tEbPqkWYKtkoR2mekGaq
 evltCMsQohqQMNK6lX9RjYsOBr5RIwjyd4MsD/YOO3t8458asKxNvqGAdtjCB3qg5yrS
 rDb8FSmDrVK3X8KTV2yEJ0a0Nq0G6uO3KLJ3qWwAg97wnU308Js+3gjVMl9AJDRuM38G
 fpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748248911; x=1748853711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHd2wRcQ7lTQF+yNodZJWejVqs2eiPfPDjLrNwQ5rWI=;
 b=PIxtkxY8yxofpzJU/WwJbmedP3h5x+piQy1VPlzJbm8SNzxAOK1pFX+Hd9yqacaT2B
 u3Ss0TTy5MezQEjhQPEUBg1hO0ZgS41uLxQdIkKEnBQlQE+0pX6cRz4wGfAcigyfZyiw
 9oJelDuG/4foNfBOPQfFn9X3zGbT8mwNj1KeWKnelYFMcN/AW5UHCxwNddPg3A4o+WaC
 6D9LPgm8+dc3L18zqgAFFmlDt9e1OXsTw5j2ZE6ec/yDlnQ/fZe2cl8fGoEyWBimx9WN
 Q0/4Vbm91gIZeb94PjAYODeJfWSBs6irOLaqEGM6KH10FiNxKcMXOJbOpaaAqZOPv89Q
 NEnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtTw4pBYisSDVbp+5aJfOngh4drNECb3xH0D7VExidl1hAvaVhGn5KCNd/UtdtPzWovOQoyJLOybI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGi+Hh7j7hEMmvVV5tvROUos+iPFzqoIyve+NIzPRw6S1DRmes
 gz3fFkcvw4F6cSw6YR3wAbP7gkoQEZrgG/nmvAauGvl6LjN6rucB3a2a
X-Gm-Gg: ASbGnct+vtP/9X51KRZVnEDM0nTgGM91/ua6bp3qybbZploG6Zu2oUR3C9PsD++LSqS
 QhjvuN1sxhcobebP2dqf9GFpQ7H18qMwk8Pi24e2YpwNs5WOkLTY501Rt9yU/Xl3hET+gTVsgY4
 r8xYKXOFR2SozqE1sspOj62MQnfTS4BNAL1az9Hr6ksxxHAgon16+b1ncBbwOmgwVmTrG5WOTKI
 jwQN9x+xxsFYBhC5T2sfxd/sXy5tmSnHRvrLVogWI9clfO4sjZKmX9YblTUwfMeCkYm8wqwgfEE
 S8HvK7CZO7T8ctk5jVfQMxCcQ2crvjUsVT5WK29seSKowkN0tjMBT4Y44uXTHyfxKfuV3zb8r9u
 X8XZDb5FNeXkAB3nttc/MF1QM+UtxpUKLWl5CjlDNbpANh6/XztZm/E7pibxEpQ==
X-Google-Smtp-Source: AGHT+IEA0HtNH2/yfq0/4CR8rO3eifkbDjYANMHuMRrKyZxNIUC7hbOEfWleKBj2frFPCciiKM9vAQ==
X-Received: by 2002:a17:907:3d93:b0:ad5:42bd:dfab with SMTP id
 a640c23a62f3a-ad85b1300e6mr711144366b.30.1748248911385; 
 Mon, 26 May 2025 01:41:51 -0700 (PDT)
Received: from ernest.hoecke-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498737sm1643583866b.138.2025.05.26.01.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 01:41:50 -0700 (PDT)
Date: Mon, 26 May 2025 10:41:49 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
 max.krummenacher@toradex.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 max.oss.09@gmail.com, devarsht@ti.com, dmitry.baryshkov@oss.qualcomm.com,
 ernest.vanhoecke@toradex.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
References: <20250508115433.449102-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508115433.449102-1-j-choudhary@ti.com>
X-Mailman-Approved-At: Mon, 26 May 2025 22:03:02 +0000
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

Hi Jayesh,

First of all, thanks for your patch. I applied it to our 6.6-based
downstream kernel supporting a board I have here, and noticed some
strange behaviour with eDP now.

On Thu, May 08, 2025 at 05:24:33PM +0530, Jayesh Choudhary wrote:
> +	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> +		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +				   HPD_DISABLE);
>  

On my setup it seems that `pdata->bridge.type` is not yet set here,
because it executes before `ti_sn_bridge_probe`. For the DP use case,
this is not a problem because the type field is 0 (i.e., not
DRM_MODE_CONNECTOR_eDP) in that case. But for eDP, it means that we are
unexpectedly not disabling HDP.

With working HDP, everything is fine in the end for both DP and eDP. But
when the HDP line is not connected, eDP no longer works. So I wonder if
this breaks some functionality for weird eDP panels or board
implementations.

I could certainly be missing something; from my understanding it looks
like without a good HPD signal, the `ti_sn_bridge_probe` and quoted code
are stuck in a loop. `ti_sn65dsi86_enable_comms` runs but does not
disable HDP, after which the probe runs but fails and does not set the
type field, so the next `enable_comms` run fails to disable HDP again,
etc.

Kind regards,
Ernest

