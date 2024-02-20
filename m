Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6A85B223
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 06:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93FD10E12E;
	Tue, 20 Feb 2024 05:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GBiZWsqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AE610E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 05:12:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-512bce554a5so1577919e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 21:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708405921; x=1709010721; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ho97+Z9XyV0V3EKFp1nj4w01pW7dIUQTWF51opt+P0k=;
 b=GBiZWsqZfrMNk0YjCClZtffcakx4fX/g1zgFtCYUQoPbBADcflx1f0v4zkZm9OuDnS
 Lm5TlH5VdXy44OrXuRihNkPorfClFdvAJqUMNyVizSEpC3EAotS0l8BtIrAD0M0xVrYD
 k6G0BGGKfGCnJ9VwshOB5v0FCXHQLx1+/X8wFCbcTXQzNfJdu20Yvw1Ub2Q83HDAPGdz
 anWHEewX72/DFeKLQJ6HMiG+W98N4hzBT+f2nwkq0Lhy3nL+PW7RzmS7BgpuzEnYQriY
 acpKhNsxFOHXEC9294IHnO7gcWFYZK0R5yo3K8aKzxzlqLtUyP0B9FAa4EOBPQEwCgOa
 SY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708405921; x=1709010721;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ho97+Z9XyV0V3EKFp1nj4w01pW7dIUQTWF51opt+P0k=;
 b=B6knZZgu5HH8H1OI5/fs7QDr9qCg7QQhKy7GQMwTpWaqyHTDRs0sX+Qygr5IK8J2mL
 AKa39IMCy7saqsdmmc8jQN+D7ZQpBf3gO4/9/tVMCpjFvX9XaluRNOvXXlIqz9gQi0w0
 lj98BjJ7mENyxJlaR5kVypgU7+wNLo740KXbGGRQp/0MyE51xDim1xrAJaDGZ8/DIL+x
 CdofVaV7YTH40O7KK30m659dErpv3DvnZf0+/foBREJC6bu59KZhCLKastLks3x8Vu7K
 pUtLReOX3FYlEtLaNK0oLukN9LTb9uXb2oam3IbSNByn9HTjb8RFf8jMnGqxl6G6uTg1
 E31A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLbBAU0FxkFNnJtLgokit/PMPHBS+pynDDLzaY42j0WVW5usgC49IkUtjr9h+U5gpqrAK3RQ960yFbc07GlTA1cvlwACXquBaCQFJbBNH+
X-Gm-Message-State: AOJu0Yy+LuIpd8lvEkKDi/WxvI5ZRRmXy1IEfRg1cIsoNLynqQ0oLns4
 aShPM+4VJvCiuluz1mxA8o24neFRyoASFRTInLXdGi98VaOXuuARnt0poyOwkIQbxH7DbpB3Y0S
 p
X-Google-Smtp-Source: AGHT+IHbqUb2KIKvVKoBjpRJDXqck41PHOxDu5LU7Bz4meGHEBaEjCnZ2bAV7RwH8TMbR2gh5uA+eA==
X-Received: by 2002:a19:f706:0:b0:511:9746:6794 with SMTP id
 z6-20020a19f706000000b0051197466794mr9220992lfe.60.1708405920674; 
 Mon, 19 Feb 2024 21:12:00 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 x19-20020a1709065ad300b00a3e786d8729sm2082419ejs.168.2024.02.19.21.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 21:12:00 -0800 (PST)
Date: Tue, 20 Feb 2024 08:11:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Message-ID: <bc59a084-73bb-46a8-b02b-0ef990020458@moroto.mountain>
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
 <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
 <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>
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

On Mon, Feb 19, 2024 at 06:59:02PM +0100, Christophe JAILLET wrote:
> Le 19/02/2024 à 09:37, Dan Carpenter a écrit :
> > On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
> > > If 'list_limit' is set to a very high value, 'lsize' computation could
> > > overflow if 'head.count' is big enough.
> > > 
> > 
> > The "list_limit" is set via module parameter so if you set that high
> > enough to lead to an integer overflow then you kind of deserve what
> > you get.
> > 
> > This patch is nice for kernel hardening and making the code easier to
> > read/audit but the real world security impact is negligible.
> 
> Agreed.
> 
> That is what I meant by "and unlikely".
> Maybe the commit message could be more explicit if needed.
> 
> Let me know if ok as-is or if I should try to re-word the description.

No, it's fine.  But in the future if there is an integer overflow then
lets mention in the commit message who it affects or what the impact is.

regards,
dan carpenter

