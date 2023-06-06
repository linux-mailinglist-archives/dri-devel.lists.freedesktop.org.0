Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F737236D3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 07:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF46210E207;
	Tue,  6 Jun 2023 05:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7541610E207
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 05:28:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f7ebb2b82cso713195e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 22:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686029313; x=1688621313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mJOXSF88DjPrnCYvhp794YSBiOIag1Qb+70cCdfwYxU=;
 b=kPBHfTSe+3iTgyI53dScjnFVlv+5aI5Dq2IL68wZAwPflgnKzBa09ymP0f7PGhDCZX
 CrqY3Jlrpz2aX1JIXn/3FX+D/nRO2hcfOZI6PaMbbOlNIMoNvzO305kQaMJaAWjpH7Gx
 PWfaDq871RrRGMSrPWtOSI5GOstsH9UNXUegz2AVPdcc0DYDa7SVK0V2LhLq1rCL5/Rj
 CMEm+84URhyrfyZ4zlxBlxDZxstC+d5zEMsTVICDBCOK/OToigswOLCtsiFJoA3NjumT
 iPH6Uo0dSBFMa9CA0dMPHfyM9TtnsdladS07MzE+lJnRjEP1u6Mzt6XLhlioBaAXsvtO
 wCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686029313; x=1688621313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJOXSF88DjPrnCYvhp794YSBiOIag1Qb+70cCdfwYxU=;
 b=PAm572IXuEhlXwY4HQj/Cqo5b7lsnJQWJs+Of6jAZ9QhFEiAxFMIlH9PQYkn/f1SAT
 +XtoO3YOzO4KikUIwjSvBSQFLzARz1sBpud62wDuccmu2abaJBKvDz0Br/g1WfogVT0P
 gAa4HJEEK6H9t0+qxXT8uO099U1g3QuHBnlT5yv8FZe8RfYCwZU6FXsBC7zVRqGz/Qg+
 ayDH4vJB1eTgM2onbO1QkLCqT2wDZ2kVvBD2xHYDhXzYnJbb6vClm66olXZLPs1Yn2kq
 +xIimZETLK1VAXPqq36kJmT46pOGov8oMh4pkVpnAubSZbDPB1CNZXj3ACyXjNsjaPQp
 cZdQ==
X-Gm-Message-State: AC+VfDyWfkOmrzPIK6zr88yNBiD2xR88Nf4lgs8wRopBU9egp72EpQM8
 kifhjU5TLQh5Q6g0fIHBi1ujlQ==
X-Google-Smtp-Source: ACHHUZ53mQ64foMYdD4WiJ9aXcXW/Mh9UVrYMszuUl5utsyKjRZqTF91fgc6UpYXQ5nOqZPoVHtjhQ==
X-Received: by 2002:a1c:770d:0:b0:3f4:2770:f7e9 with SMTP id
 t13-20020a1c770d000000b003f42770f7e9mr976047wmi.17.1686029313452; 
 Mon, 05 Jun 2023 22:28:33 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f4-20020a7bc8c4000000b003f7e717c770sm3198157wml.23.2023.06.05.22.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 22:28:31 -0700 (PDT)
Date: Tue, 6 Jun 2023 08:28:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
Message-ID: <f1bb576e-88cb-4c5d-a7a6-d45ffc48edb3@kadam.mountain>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-19-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 04:48:00PM +0200, Thomas Zimmermann wrote:
> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Benjamin Herrenschmidt <benh@kernel.crashing.org>

You left out the Cc:

regards,
dan carpenter

