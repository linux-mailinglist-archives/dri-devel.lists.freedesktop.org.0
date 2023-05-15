Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A297025E1
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FE810E13D;
	Mon, 15 May 2023 07:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DA010E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:17:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so65871055e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 00:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684135026; x=1686727026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MPLWP3CUj7nXbwK1eig/zxowYW15P1YnC8aJ9O61dnk=;
 b=Xb6ItDRVMlzOOtJl7GbVYbqyugpgd2ZNrxB/ClgRnmCk7h7W076rSAs1VA2Zcrb9aE
 gXUgfq0+SF3gsgOjxNzXuawUHKpF+yXh90bm17bBHlgo/b8hKVyem/S6U/SeCLeVSCgL
 L7KwQuDD0FRFRf2qQSzATtju13vPd1YIZBPwcMq1b1sQtO+k2CnO/0k6QEsNe9DunfYo
 srzP1gDjTGkrN0mVdVkbiv45gZxf1qH8PK6DAp3pmz6lC4c3aCaOhr3lg/bQm3us9dy5
 +JIMBEG02AwoQRx21icwGZzw4EAJeTBe/7rR5zF81bk2eGCwut7dc6ahRmul00bQqfzH
 Z/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684135026; x=1686727026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPLWP3CUj7nXbwK1eig/zxowYW15P1YnC8aJ9O61dnk=;
 b=S+CNEPcGVTvWGrIfKY2snmCmbW4ibt+TLa19QMNdzcCBys3Z2I/RvaS5qd/Jm4hYM8
 e70dQFpJBuoY+NN9N0pgfl5jQoifGrs0+Ims9HSn+AWcqAE0wLpQrezjqek5aCjxwWLj
 QQhc06JZq2nqn/KOqaSUrGbRntNz4FGiNqVZiOMtb63UyRSTLtqcXUQltMuG6YFtew7D
 D4fWb2tCT2ZdK1qm5iMQovH4EjHLuIkRAFNs0/Nth2nZum+t+SFgCBZJWbQaNVB5oX/F
 v8nYNN39JUaZyUjJomlFkvTpiX4Nf+IrWFRhp+v0N7AQBVkzMuYu7WizRQCWNZ/OtZ1P
 y3aQ==
X-Gm-Message-State: AC+VfDwM43N6ALlq1q1IalqgtlhPKkV554JqRGx64PHl3cj4bdKUJZn1
 r3HL1WTXDGVscI0Ne4ZYCtObEA==
X-Google-Smtp-Source: ACHHUZ5VZHyW5V3zus65QYbAGDvzqPzVTRPUULpm8xMzYTaQO0OkqbPRJU0vTIbpP43eCZs0g/0c4Q==
X-Received: by 2002:a05:600c:2195:b0:3f4:e4cd:f6e with SMTP id
 e21-20020a05600c219500b003f4e4cd0f6emr9797595wme.17.1684135026626; 
 Mon, 15 May 2023 00:17:06 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003f43f82001asm16132768wmi.31.2023.05.15.00.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 00:17:04 -0700 (PDT)
Date: Mon, 15 May 2023 10:17:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] drm/amdgpu: remove unnecessary (void*) conversions
Message-ID: <ebe9d98c-148d-4694-8f97-96bacd0b9f7d@kili.mountain>
References: <20230515013428.38798-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515013428.38798-1-suhui@nfschina.com>
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
Cc: Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 09:34:28AM +0800, Su Hui wrote:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index f60753f97ac5..c837e0bf2cfc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1470,7 +1470,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
>  
>  static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>  {
> -	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
> +	struct amdgpu_device *adev = m->private;
>  	struct drm_device *dev = adev_to_drm(adev);
>  	int r = 0, i;
>  

This declaration block was originally written in reverse Christmas tree
order:

	long long long variable name;
	medium length name;
	short name;

So you probably want to change the order now that the lengths have
changed.  Same in the other places as well.

regards,
dan carpenter

