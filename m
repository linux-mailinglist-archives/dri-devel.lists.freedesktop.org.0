Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2FBB3F63D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DC210E19B;
	Tue,  2 Sep 2025 07:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LxWUWNxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14EA10E19B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:12:03 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45b883aa3c9so13891215e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756797122; x=1757401922; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
 b=LxWUWNxjmS71wzrARop3rZsuC9QCyIq+M44E649x+z7IY+GUYemStnySunTPvkMDcb
 G2xB/8Hvgud7hYmFZQ/RmvRjVM6WOXGZ0QOkFCh6brJMTr6sMlst2HF3ABUg7NC0vigO
 I4k2P7SejKXz1bKPr0WKv8Gkcff9+9g/az+GvmzDfNmzYcKpOGk06DzzGEj72IhNO98E
 43nwz6TdpnSw7Kw/QjDLXvc4VRv/fY3fxytE3PVMoghqiANrp/ZzHsBvk+rEYCaeWGBP
 aqB9k7QbJ0+N2Uyoch0vCZTsOkiPnbzv8BjD2dRWfIdVRVqS5yjWIfCXZUkY4F5kd7Ee
 RnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756797122; x=1757401922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
 b=IEUYDwXjUZ33Q+2Ruc//pZ//fn4hpoh8rRDzMXgxJbdyYqJj5IKHIETgytyf+eQoVt
 czngdlZ2UF/Lxn+kFYcOZeWD49W2KnmvHWszcw7AQkCX05Uquv+osctcLwmpgnglsJEc
 TQWCEDKOEdiT8dqrHC65R+UdTLqz/0wjgfkCLSL0Q/VqnkeDRMzoQIrCdHuYzLUNIsix
 hUVRMwYtGQqq9WZYB7CTC4nncEOvmT6+80MtLspCbD9+b9qOgTZFXdBaoyD/7F+tigfn
 hBrC9zirrfjxQ2Vxm4k4fx5s00npY3jsw+UnJZEskrdjg+bBlZww7exD5HSTmxcGRqYR
 7wPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaYBLlx8rF5cv2XCgAo6QZW+ooeE0mKBtxKluAh0Uz1VgvuLki0chPrgIXBMahjdxeiEBHwe/eiYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXy5iVPtaja9McRpdZwP8TfmUEYbIQT8k8m/Dvs0pWCee3jhok
 FZaCsAGGf6jB1uByEizDhV0d7+KBWeMNUt+JHn+PyCNMuLe2PgptaitU/8VTiF8iJSk=
X-Gm-Gg: ASbGncs6PtNN7KG+epo4a85dd7+iv4NbHYvGAL76tadQ1ZeQQIG5pArDYZ6G7/hVwD+
 VB/BoJvJ99Z8TIiU9qD8VaVD+FF2ewfexsv4RwO/Pk3/1YhZVs/9VeEWV1T/4LerCU64IxLs2QC
 IcRB4cXesdLs8W0R3ZSLd+sGFg9kcYBVYIi6rxAuDGphXQXzsujnMGu4Me96YLAlsCcdnYQw5v3
 E40ye+IUTBo0Zcpp0p6+uuZxDX9R+gTmOCd9+trVMEA4PtDorf2Yd46lytgs7rab8VjrBNvcRPp
 WaS3846895FQ5H01J9iucNLnescQ3mME6R9GzDj+SlnGiNtEhMXcimvunLcqOpY5k4VWXfZsaNW
 lezeRloiJv2c9auC6I/MRuMxVqx485zI0mYszdQ==
X-Google-Smtp-Source: AGHT+IFYuCWJOgHXp+J/kYURbVc6VnwzlfI13ByiraVfMdlwIoA3Pz1WV9KjlyYQt58VCk3unM9JLQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:43c:dcdc with SMTP id
 5b1f17b1804b1-45b8558baefmr77527515e9.33.1756797122251; 
 Tue, 02 Sep 2025 00:12:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6f0c6dc1sm267152735e9.1.2025.09.02.00.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 00:12:01 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 19/19] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <aLaYvsh1sCF7uF6Z@stanley.mountain>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-20-clamor95@gmail.com>
 <3643424.irdbgypaU6@senjougahara>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3643424.irdbgypaU6@senjougahara>
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

On Tue, Sep 02, 2025 at 11:38:18AM +0900, Mikko Perttunen wrote:
> > @@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
> >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
> >  {
> >  	struct tegra_vi *vi = chan->vi;
> > -	struct host1x_syncpt *out_sp;
> > +	struct host1x_syncpt *out_sp, *fs_sp;
> >  
> >  	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
> >  	if (!out_sp)
> > -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
> > +		return dev_err_probe(vi->dev, -ENOMEM, "failed to request mw ack syncpoint\n");
> 
> Existing issue, but dev_err_probe doesn't print anything when the error is
> -ENOMEM, since "there is already enough output". But that's not necessarily
> the case with failing syncpoint allocation. Maybe we should be using a
> different error code like EBUSY?
> 

I'm not sure I love the rule that -ENOMEM doesn't print a message.
Deleting error messages is fine because it makes the code simpler and
saves a little memory.  But with dev_err_probe() the message is still
there in the memory, we just don't print it.  Printing the error message
doesn't hurt anything.

But if we go down that road, we should make it make it a checkpatch
warning to pass a hard coded -ENOMEM to dev_err_probe().

regards,
dan carpenter
