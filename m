Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EE889BEA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C6210E229;
	Mon, 25 Mar 2024 11:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RynF1yLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D3510E229
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:05:35 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso489564066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711364734; x=1711969534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FRILSzvwAIpvZwjiJmtXP3wS29AHppU0XGaszbPtEV8=;
 b=RynF1yLpIxtX4/9eaksYkpLY7H/EofvQcESqd+hOBIs3azMLHYkT+xlZelmm1J3J6X
 gYP726E5KBEcpBflaKTLgKgjeavmdTOrYbK7D03jra0eyAz/Qkz5So//nRijfAiELfo0
 I3HiUnqNHAqwNUdVmOyVTTZCKVaXhAdR2sBX1JPtXGau0lZcaLWzYJ//7eL129JHMomS
 vEztA1Y3w3MIeyuiLpREKD+8038lfJYNPZY31qScipdI3EBNjceAxtIdX1+nfqGlYiaD
 yxrf+qxcI444kK9Sp7F5LRmDsQmNCkuxqG3T2TRWozOSkgHhqUtLmnbq+fDkamF+DxNR
 dyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711364734; x=1711969534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRILSzvwAIpvZwjiJmtXP3wS29AHppU0XGaszbPtEV8=;
 b=k54k0UZbWbDftEJvIFGMZkcngslZsqn+mRDJVUJiYSwZRDEE6X3Ir4q58gPA94FZrv
 1qFGWO5LDQrrUPpXHPdD+pzN9/r2jwxeKYzUqzalWAuXt0WqlVyDSSq/7DKu4f1bNWYi
 PZ2FZ/psrsK6guTFVyXeEBE53wYpZeN66R/sHs58scU/SpmjNj7aQNJpOwe29R7SXF3o
 b8Pgg1ywzdGueIdFt0rq+yPsR5/W3Xg+Web1/lirrULIUhes8N1yp7qZkbZX6mbiT17P
 NJqKNo1kN8Ch0hspyh8Cra5q6hE6ESAizPa1RGmDl/1RueooPGOq8GrlMJYDA0bAXSpD
 cHcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzOCuaAwwCR1Kkw9/szX8wZESKiLw5NfCbdEQNrkAI6T828Es4GZKAepET4++OsmUAfuh5J8GH601HWHpd2lnAXCfPApB+H39xpY2YS+iS
X-Gm-Message-State: AOJu0Yw43gRQ+nuiT2mCvKx+OznrnGB1/tRgCfLso6hlW+YjtZgKpPB+
 GZtPJYqNoJoMy0Rqz/WEIU9uJSrqihkq8RkrWBN4jJbc8SoOvPxBmftGaVVOxKg=
X-Google-Smtp-Source: AGHT+IEhtdf7x6x6qjqq4K75Nxdbj/nJMl44w91CE9A41I8PB9hLaFhw4s15oV2TjS9l0ZLDyPjoIA==
X-Received: by 2002:a17:906:40ca:b0:a47:206b:5951 with SMTP id
 a10-20020a17090640ca00b00a47206b5951mr4770720ejk.59.1711364733579; 
 Mon, 25 Mar 2024 04:05:33 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 m3-20020a1709061ec300b00a449026672esm2901792ejj.81.2024.03.25.04.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 04:05:33 -0700 (PDT)
Date: Mon, 25 Mar 2024 14:05:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Jonathan.Cameron@huawei.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com, arm@kernel.org,
 arnd@arndb.de, bamv2005@gmail.com, brgl@bgdev.pl, daniel@ffwll.ch,
 davem@davemloft.net, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
 gaurav.jain@nxp.com, gregory.clement@bootlin.com,
 hdegoede@redhat.com, herbert@gondor.apana.org.au,
 horia.geanta@nxp.com, james.clark@arm.com, james@equiv.tech,
 jdelvare@suse.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linus.walleij@linaro.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@roeck-us.net,
 maarten.lankhorst@linux.intel.com, mazziesaccount@gmail.com,
 mripard@kernel.org, naresh.solanki@9elements.com,
 neil.armstrong@linaro.org, pankaj.gupta@nxp.com,
 patrick.rudolph@9elements.com, rfoss@kernel.org, soc@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <486947a7-98fc-4884-a5fd-354677fa66ce@moroto.mountain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
 <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
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

On Sat, Mar 23, 2024 at 10:10:40PM +0100, Christophe JAILLET wrote:
> >   static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
> >   {
> > -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> > +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> > +	if (IS_ERR(pvt->dbgfs_dir))
> > +		return PTR_ERR(pvt->dbgfs_dir);
> 
> Not sure if the test and error handling should be added here.

Yep.  debugfs_create_dir() is not supposed to be checked here.  It
breaks the driver if CONFIG_DEBUGFS is disabled.  I have written a blog
about this:

https://staticthinking.wordpress.com/2023/07/24/debugfs-functions-are-not-supposed-to-be-checked/

regards,
dan carpenter

