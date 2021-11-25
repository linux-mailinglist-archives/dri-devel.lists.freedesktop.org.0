Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37B45D607
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 09:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858EA6EAD9;
	Thu, 25 Nov 2021 08:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509536EAD7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 08:16:38 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 71so4558165pgb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 00:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lfriBRcXpshyF1kq92nAu2kh1POupA3b+vD7MqpK/Bk=;
 b=M7CDb2za+voTT19XexwjvCjECDIDANFnViMmvcQvXI2lwzNojH/a1gHUacduX5+9LF
 GovyuL4OsKFxv26LWRO/OB1Bz18zBE5vfFVFzCXwtpBcAb07TxtbvV1LL64K1aKrLkgi
 NCtFsEnWlPqxajd6KIby45BD5sdulZPQjmXG6REQlq9nLxWEG1EmQtYCSxr8YKpfldCf
 sXSo+FWyFKM4X7WrbUdK40N3bB9aGyvTzZykclhW9bzCuEo1hvsGFRPs8y6dP3DzH6S9
 ezqKj+SREBDBHeeoBJuJwjUijEfH2ZV4Pz7pU5OKperI/ap7OmvCgJk7Rnx2ESTlmNSz
 KRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lfriBRcXpshyF1kq92nAu2kh1POupA3b+vD7MqpK/Bk=;
 b=STw6b+2e9IPbnb3Z6ZLKDtP0yu6PKIArFgA3bSCZPitfdMe7cgTUUSzTw3Phs+r0ji
 PCTidg6e2uh14LOxoonnh1tGZ9ikCZ/se4gEGfDrp17Ab+j6BeJJ01Zx7GPW8xuBAb9Y
 vFLcUU2NpbG3y0sC0eXztGlEwotBKCY+EzVsCAjCz1Y+mJsxFDtXeE2+y4OjM01XIk9K
 wyDs2FsG4/vhh8pTqfHOUG9BSytckdt+BQo4u/SzT+V20ORzJqdrGpqtdyK6c8CTqVrz
 k1VmchPTD07IEC1LHKFyNrdrXqxcv/SH/TQceXEglxMpEPzqxZNP2M/h3qFx1DAzPD5Z
 LUVg==
X-Gm-Message-State: AOAM531MTOFgY9YiTNYNaO6+j9EO+qd6aAho7K1of3ACCR8h0miwHBvv
 8+dcgne/MmCua0T2gNJNrresMQ==
X-Google-Smtp-Source: ABdhPJyyASzkTVmZnTpKVd0QOD0Uo0JG8HVXPrFLTOWG5xoT0mHr7GP8AuxnMVLFiEIUBIaBuAe9Qw==
X-Received: by 2002:aa7:8b14:0:b0:4a3:a714:30ed with SMTP id
 f20-20020aa78b14000000b004a3a71430edmr12324262pfd.2.1637828197688; 
 Thu, 25 Nov 2021 00:16:37 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
 by smtp.gmail.com with ESMTPSA id c18sm2385652pfl.201.2021.11.25.00.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 00:16:37 -0800 (PST)
Date: Thu, 25 Nov 2021 16:16:33 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/bridge: anx7625: fix an error code in
 anx7625_register_audio()
Message-ID: <YZ9GYUrBvmCQaZtg@google.com>
References: <20211124145219.GD13656@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124145219.GD13656@kili>
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 05:52:19PM +0300, Dan Carpenter wrote:
> This code accidentally returns IS_ERR(), which is 1, instead of
> propagating the negative error code.  The caller doesn't check for
> errors so it doesn't affect run time at all.
> 
> Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
