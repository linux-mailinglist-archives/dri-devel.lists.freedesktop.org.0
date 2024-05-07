Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C0D8BE47A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445DC10E5EB;
	Tue,  7 May 2024 13:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I12LtL5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F4410E5EB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:42:41 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51fc01b6fe7so2883276e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715089359; x=1715694159; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ofLWh7+7lynH4ssD7W2H3GNyThDD7FYWFzKSbNNIGKY=;
 b=I12LtL5KBCoLf8T1U1Fw8MP2EDRDjcDndMktDnp7ulUXuR2FkcuBNQJpurFFYaJ86A
 Gmgfn9Lte+zxtsw8ZnjHWtIwPNUvuWLSXI17w37QaPihMv7VnUckJGGdoLvdi58zjKLM
 BIcEyS12VsQy9quUyJvbantY3f6HvGdBZN1EOGJVGI+dArk6BnbvRDDqYtGQA6lWWDat
 699j4tgElEHUtOV3Ucmd4GtkcE0Sun1AjhiQ+5m97wPaon3XylmSUtjEQ9iOJDAiCmMl
 dC8m1uAv39M3iuSaNxRp3+x0wgP/7X6I53vwHlkklYSktsKDLM/PHcdji8k+EctrVFkm
 vl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715089359; x=1715694159;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofLWh7+7lynH4ssD7W2H3GNyThDD7FYWFzKSbNNIGKY=;
 b=Xs8ckhWqeY/w0LYctSGAowlDSEoazlSq3oMiva6IddbYwOYLbsYuOiz5ageva5lldr
 8QVpC8I11XXLpCHo1yl7JkNV/zBu1gX6rm1idyGbTRRZkRorfEhXSh6TvXsVy+I/IgDs
 8N6ui93JD4Gpsa3j6VvNXk+iy9J/wfkwzPyZYDPZaGF6JP71NqWb6wF8pqKftxFP5TJt
 7rL1yHV8I+D2ZzkDgy4LOPrvQ2LMHFwsE3ZXCQBYCChuDbH2EKV9grzb5+dqtcCMB1o2
 I5bODRsQ3lgzZklcCF3Zoq6i7QrPrke9uRrb//OkVGm0qDKgtvY1fsMCz7fBdKFhnheO
 ppOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq1Uv2+aM54KDaNkwYQb5Csdf+GMx/SFxrbIrFSViajP8MIXp8cROP+2Q5/Txr0VfmGp+J/L/lsH+yzdHr5ZB0cx/xwQbbDoWpFEAv2fIh
X-Gm-Message-State: AOJu0YwGsiWAQr/78q8u552IxAEOU8txwx98FDoeooYZKcy2iOSzOx3P
 839q1dJ7PNd5EEbRwY76xSpQ8A1RR7212bhM+kqAOGMFzCQZzT7PD6w2zzl2Vp4=
X-Google-Smtp-Source: AGHT+IEcEQ1M88NR4vmUiqGMt8ZxsM659IZuZ4CO8gzi53YrJgC5MzydtewGy6QWY5cBxG7eM8j7VQ==
X-Received: by 2002:ac2:483a:0:b0:51e:11d5:bca3 with SMTP id
 26-20020ac2483a000000b0051e11d5bca3mr8661395lft.18.1715089359358; 
 Tue, 07 May 2024 06:42:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 j6-20020ac24546000000b0051da3abd6c8sm2109596lfm.150.2024.05.07.06.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:42:39 -0700 (PDT)
Date: Tue, 7 May 2024 16:42:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ashok Kumar <ashokemailat@yahoo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [RFC] CamelCase can it be fixed per Checkpatch.pl script
Message-ID: <uewpqrf2hkczmxftsl5pb2lx4tylxcntxqn5cwmlcrx3w54mu5@bc7nta7chbkm>
References: <ZjmsAVlZmA5sje/Y.ref@c>
 <ZjmsAVlZmA5sje/Y@c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjmsAVlZmA5sje/Y@c>
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

On Mon, May 06, 2024 at 09:20:17PM -0700, Ashok Kumar wrote:
> Found some files in Staging Drivers for which checkpatch.pl throws a CHECK to
> +remove CamelCase.
> 
> For instance in program vt6655/card.c find the usage of CamelCase as
> i) Variable names eg: &priv->apTD0Rings[0]
> ii) Function names eg: void CARDvSafeResetRx(
> 
> Note: some of the functions are
> +static functions
> 
> Reviewed lore and seems in some instances removing CamelCase was allowed and in
> +some case removing them was disallowed.
> 
> Hence wanted comments if we should change them or not.

It's better to work with the corresponding driver maintainer. Generic
comment is that functions must be renamed, while variables / fields
naming usually depends on the maintainer's decision.

-- 
With best wishes
Dmitry
