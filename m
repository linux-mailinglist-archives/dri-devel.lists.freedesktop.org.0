Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F6A9A432D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 18:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD6210E376;
	Fri, 18 Oct 2024 16:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JuKxIlkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C3810E376
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 16:05:44 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so24912471fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729267543; x=1729872343; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8lHZpTCnaSttFJL3uIXwXWK6iRmjck9Nu4C1mKRZ028=;
 b=JuKxIlkthnSBvqL7GiL1DnRKaT7o40vdySWvdXM/dHb3sXzOAgQS4elp/0hu7Da2+X
 3zuGKf4AP4RBNGAUc88l1rQIjnhRbmGXip2KAEw+DqVI+lazdGbsH2PxZDfZ6wbI/sHz
 +fByyO/zLeAKNn7KBtTRdIXYQnXOEnsHqpnzxv19KRT9putXOEozwbBTmTI4zNrjQMef
 y4EXM/Z80Kd/SWvvTrDjhOZ0saThJTEeedwWTprVZbc91DMiJjPGbwXvelWip+IV8m+i
 rL+JuZHVzf6J6XHmwD7SAjLFZne4/EMbQy+8QRp1VvET22O6R5MNdCFqSKUHZ7jMW9t8
 SB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729267543; x=1729872343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lHZpTCnaSttFJL3uIXwXWK6iRmjck9Nu4C1mKRZ028=;
 b=aYJJpy1Pgl6nW+Ee1YtqHRpK6tjTBNzqOZxe/zedYRV2HFkbZDxKy2rqO5T3z+M4vE
 pqr5JaCwB/cOEIsU0kS6JyP+06jCb1Nqj34I3/0hGRV7XstxItS3lyIbgSK0+0UHiU9K
 9xKQ5eZEXia1Lnklulf3cw2QgybjqjZSLdV9wFv9mQH08JN912nm43wlvVZupimE7V9P
 sobbS2GOqcpOz2tf8lwWDWKklNFMu17O5FsL0LgzFNEo8WrnMTTF8lAfVyQDA4jra83I
 4qI6ej/nclmr9Nh8raIZA0zmAP7w1bbd86/LTFiuPScEZqkkaegPIuCgJ4JhrH/2bmFo
 Sl5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyBgIeaJmF25N8LlwB3M0rpl355B8MwoR97mQZ6uTe97PYHzLJEgZDTkfFMUvdHMmsXwrX+JrWXUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrIgUsZtMtY6eEn81kkcqNsBs/F9ijL2cnPeC17irp3mWiaH0/
 gOPgY+VNh+PsECxgI2BWHdDLpX8s6hrLjjTmHYRUM+Vu3CMLWi6R6l2r536P6qw=
X-Google-Smtp-Source: AGHT+IEpeWFLJ8yL29qE6iphuWnFhSa96/H/Y2vX/YZ6kUiZe2MzqHfEFttDD3Eg9ojiGCjOGWPbXw==
X-Received: by 2002:a2e:712:0:b0:2fb:5504:7966 with SMTP id
 38308e7fff4ca-2fb831e92aemr16524871fa.30.1729267542646; 
 Fri, 18 Oct 2024 09:05:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809a69f3sm2445361fa.26.2024.10.18.09.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 09:05:41 -0700 (PDT)
Date: Fri, 18 Oct 2024 19:05:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/imx: parallel-display: add legacy bridge Kconfig
 dependency
Message-ID: <ccpkyf46bbfe4z4lo76kokixocgfofc4gltifnlesnvfuj4ndc@q66ke2mf5uqu>
References: <20241015073004.4066457-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015073004.4066457-1-arnd@kernel.org>
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

On Tue, Oct 15, 2024 at 07:29:57AM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver now uses the legacy bridge helper code but can be configured
> to get built without it:
> 
> ERROR: modpost: "devm_imx_drm_legacy_bridge" [drivers/gpu/drm/imx/ipuv3/parallel-display.ko] undefined!
> 
> Add the required dependency, same as in the ldb driver.
> 
> Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/imx/ipuv3/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
