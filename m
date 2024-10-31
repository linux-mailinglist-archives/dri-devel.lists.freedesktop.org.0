Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9569B7FB8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF83810E0C4;
	Thu, 31 Oct 2024 16:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LcwzPiE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892BF10E0C4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:13:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43169902057so9176125e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730391228; x=1730996028; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7CakDXS6c1DhzA9TEtNxJdDyagqdPs+BWOzw82gUl7A=;
 b=LcwzPiE8FDxHhDJJPF4OoJNS0vhtwrvfV9AykSkxc8fZnLQdCVKjg7+GAZZzJrbiZX
 +CWz+ixCIxjbXaw11mTLVgk16Z8pCYNcfVEzKcL9FOTux2Z78MtyxlS8ai5jNYzBsilG
 S9hIZ46zBeu+fXhI8/P1+sUUvZvyoDLxwdQT3HMo5rF/x2BnIuBw2AqpsylxJ2AGztye
 rCg+tTbYKZJ4S58Ok6a8lkb4g6iV/emAfwXVMsnD6S7NGMiuG+TPwNIucuhcpgmvw7iU
 SGWBnVBhVoKjXdJFsUyOuYAzULYW+wcJk19qz6PY5wg5KOBo/lXwEUNQc4IXiwiDlzgu
 6qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730391228; x=1730996028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CakDXS6c1DhzA9TEtNxJdDyagqdPs+BWOzw82gUl7A=;
 b=OntoPtUBvNdmbR1FNPvLn18CGZDCMCirJegD1LK8RNf42H6trtsrNkTgdFVoTZYill
 sgTYWFENb6UgaaszMzzEOZPLdSCHN66k9o8oSV8XstmihPg4RUgAg5LeyXb/JmPoO9sO
 nov4MgQHeKE+uzEUk/1L928kYt6EZYJc2IK4skl+i8yZn5+M/aSg3Ofqara/rPag1w9L
 EdLxsUay3Wt4EzsixIDbKKI3YOyZGihbknx03lc1+7X7xVVbf5LOmHggSc0e/VH3Cg0P
 MQhTLJKRta4nyaQXKsYeLM/CiY0JSlwrepA6Ky9VG5W3g1VjeqSmhEPcKHBKxJz0aSUS
 Tfaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzie8MmfLjHD8DtU3vVyFOJ8vPD5xe+Z/TAJOOewr9Q4E2v5m8S3nd2Wry59w+6mLXVkmOsz0GXHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6prdKdyPyoD44GhT5Bfw0r5Y0aq/aK/4G2jTwM3DsN9vdaR5W
 YC3KFfig+Pxx66xbPeqIApSR6rax6RPzn/GmWgmvjZzTmjnloU+hsAEJYmT0dT0=
X-Google-Smtp-Source: AGHT+IHCYxSGmVXNdG6HbEGSCE6KOxPf10odxndDOKvnEQsVM7GhMv1g4/6VDhU24xOmBDFWwJuNug==
X-Received: by 2002:a05:600c:a04:b0:42c:b80e:5e50 with SMTP id
 5b1f17b1804b1-431bb8a01dfmr66125375e9.0.1730391227625; 
 Thu, 31 Oct 2024 09:13:47 -0700 (PDT)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d6852fdsm31030365e9.34.2024.10.31.09.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:13:47 -0700 (PDT)
Date: Thu, 31 Oct 2024 18:13:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ZyOsuTr4XBU3ogRx@linaro.org>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
 <ZyOOwEPB9NLNtL4N@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyOOwEPB9NLNtL4N@hovoldconsulting.com>
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

On 24-10-31 15:05:52, Johan Hovold wrote:
> On Mon, Oct 21, 2024 at 09:23:24AM +0200, Johan Hovold wrote:
> > On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
> > > The assignment of the of_node to the aux bridge needs to mark the
> > > of_node as reused as well, otherwise resource providers like pinctrl will
> > > report a gpio as already requested by a different device when both pinconf
> > > and gpios property are present.
> > 
> > I don't think you need a gpio property for that to happen, right? And
> > this causes probe to fail IIRC?

Yes, I think this is actually because of the pinctrl property in the node,
so no gpio needed.

Yes, probe fails.

> > 
> > > Fix that by using the device_set_of_node_from_dev() helper instead.
> > > 
> > > Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> > 
> > This is not the commit that introduced the issue.

The proper fixes tag here is actually:

Fixes: 2a04739139b2 ("drm/bridge: add transparent bridge helper")

> > 
> > > Cc: stable@vger.kernel.org      # 6.8

> > 
> > I assume there are no existing devicetrees that need this since then we
> > would have heard about it sooner. Do we still need to backport it?

None of the DTs I managed to scan seem to have this problem.

Maybe backporting it is not worth it then.

> > 
> > When exactly are you hitting this?

Here is one of the examples.

[    5.768283] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-185 (aux_bridge.aux_bridge.3)
[    5.768289] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 185 (GPIO_185) from group gpio185 on device f100000.pinctrl
[    5.768293] aux_bridge.aux_bridge aux_bridge.aux_bridge.3: Error applying setting, reverse things back

> 
> Abel, even if Neil decided to give me the finger here, please answer the
> above so that it's recorded in the archives at least.
> 
> Johan
> 

Sorry for not replying in time before the patch was merge.

Abel.
