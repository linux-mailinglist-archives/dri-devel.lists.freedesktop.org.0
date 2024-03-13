Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538087AC91
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECDF10EF27;
	Wed, 13 Mar 2024 17:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QG0mgzDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0808310EF27
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:11:40 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a466a256726so29535866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710349899; x=1710954699; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4989NFoTQ07zq5PnHdZf2zLYVP+OOsZrZkI627DoQM=;
 b=QG0mgzDPoTGyyF1077JMq6VLz0Z3h3jfBWZvTWWtmOqFqrC9mU9Oz+ErhqmyGr2BQj
 XMmB37GZwtqkb9BxrPrhYTeLTwlAFuDeczamfMkRICHWutKgN0W0AlCV2k1W/drf1h7z
 XW4R3pUwx3HnMndY5IEi9+KGbyDCoJT1gIN4luA23Wdwg5WiznY8VoB87GW3mRspC6hb
 1Ky9mg/9INl/+7EoyxIa4PRhRb8n+7jGg9o7SUFnnH5UiyZ+G5940zdjZnwXlF0lbkr4
 4ugwmSdrhL1srn3g1rIdUIEDoNCFYzV1eW8CtGjhW2J2Qm7OqszLJIE0sRwfhKFDj5Oo
 hy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710349899; x=1710954699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4989NFoTQ07zq5PnHdZf2zLYVP+OOsZrZkI627DoQM=;
 b=m9ymGV0M2Aie7eu3WBVfmqiKLRWDmZu83oAh1NIcOQGvj9IzNbfwuRmOvlAQQ4ECgN
 pdQaLBQ6w6tMh9FdZHjN+IXYwJo9Pf2IeFyFaOOMrBYwJxwHTTzYSMi8rt97sMltYabG
 BvmbfD1/0d1vIcY2MZEyiiFsRVxM1dth3aXzDdOGxVCKGge858hEixlZFa7kH+VxnhbA
 poiPM1WT31ad0LfZSSbtazIVJNRhY+PI9+2k8W2SxVf5qIBtRzYO0aFyVb+N6bSrYMh5
 039Fm7D2/Xu94yEtFQaZ6GfbmAI6hTt5Noc11okXelsf+dxvh9zi2oshcQau9qOYdDCF
 zerA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNrlxFy23HVbabeirUwNnbaZto7/Y0B3J+E/Cz1HdXGkMNWkc+EX/0Qgc9Gj4GbGlA3GMs56b9vqfkJq76+kz6v21PEVIugQVTMAZX9tlH
X-Gm-Message-State: AOJu0Yzp53xY0ee3m9XPH7gj6by2f33VbbKqkLW6s+UJdTZGxKTIkm5l
 78dC7iPLiPoGJieMjaZ8Lb7FSGjdvi0plbivCF8MQ8bfn2bPkiTZOATLgRx9Xgk=
X-Google-Smtp-Source: AGHT+IE+IqeM0K8AvqOGHDpdNt4JlH9jV1CrUlPPX5RdEaGIo5go5N8DZ6CKG209IIMOIcNXF7bviA==
X-Received: by 2002:a17:906:c7d0:b0:a46:1f91:7078 with SMTP id
 dc16-20020a170906c7d000b00a461f917078mr2730655ejb.20.1710349898986; 
 Wed, 13 Mar 2024 10:11:38 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 kv20-20020a17090778d400b00a4600ca3098sm4809644ejc.43.2024.03.13.10.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:11:38 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:11:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
Message-ID: <03ea1afa-e54b-4f31-bf07-03d9cdbacaea@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
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

On Wed, Mar 13, 2024 at 05:08:08PM +0100, Miguel Ojeda wrote:
> > -       int brightness = bl->props.brightness;
> > +       int brightness = backlight_get_brightness(bl);
> 
> This can be `const` now (or even removed and have the call embedded below).
> 

Is there an advantage to making this const?

regards,
dan carpenter

