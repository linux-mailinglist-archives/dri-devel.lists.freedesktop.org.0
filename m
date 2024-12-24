Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EAE9FBBC7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 11:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2F710E29E;
	Tue, 24 Dec 2024 10:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xgualRog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396DF10E29E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 10:00:36 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30219437e63so62677861fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 02:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735034434; x=1735639234; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CaXLFhyvddY8J2ykAWjPDBthPNDj/QrO8YN8626lces=;
 b=xgualRogUA8MitO1jfhpMKJv76XHOAef5AI+JJXhzGUqIT7xz9eejpkjvqqpYSjZ4g
 n6ne41jdm519jPEzXFlvOqP2eWTgeEzqREInkg7KwWh4VieySFvEgA7qrif3ec2dL2Rg
 epolaZfo2su40gozmRl9qOGzlZLqD8uQqixHA68m7OJkoJh8W4O+rtqSytsmFlG2xrl+
 jhayjpvRWITCqLsBUJuIXIK+vmUQxP1nBlTz/Qi1c+Nrc+K4WB2ggW+8fgbCTa4l6q/I
 3CjUOM3Masj4fq/HJHMIylAn4RUyfIHox3UM2kfKawF3W04Yh4EsOba1ICOGKznz89Zm
 Rxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735034434; x=1735639234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaXLFhyvddY8J2ykAWjPDBthPNDj/QrO8YN8626lces=;
 b=kq6nxxYtYZ1JZAk5p9+8ciysUsI8XD9AGUDk8k+KcSrS+A0HAsFe2ULvCuRdWk9OPA
 5XX0ql/2YwcG7dRrTCz9Ohe0moHo5LKkhZ2sn9VVG5oJ8Wg7w+EJVDpTpFLFu+ueriUc
 1H94V5wvdtDfCN2Ix4+hXe3yTpj7GVHgANpUwe3fhZmPw3UTCfpKZDkWDlscMtCYNYMq
 H6Qj5r2tdbPKf1UJhzSWDaLNm562sLR/y4a9NhtlTMcYjqhl3kTNsA8TuH0OQV1WMRLe
 vPD0JZp0EtMApS6HZj0PfpSTZjw/ra0+A/GtYaHeNyL1dFS9dA9NLAkkGm2SsJvk74P/
 AyiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtP+v244eAXXtvQbYKxtCa+eHSYEk+KLlwaeMfvMNbwVdz8z7bTG8Fq1TVW8fUfYStHNhHn83X42Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj1ymEglVKEQLtrTuNTXdc9F+KiK4DwIscY36cXTavvDrJC5Y7
 kSQYqbZeSrm18A+EAlLmoGtj5D11dvE2mMceIHN58H/wFRyAj0yksIj0/EhhHSI=
X-Gm-Gg: ASbGncuWUj6W6jANF9IcAexLBbYV/ppjTddvIPYt8G+KUkxVDYS7gsLB/n5LvVjtQ3V
 myyjyEJ6vrw6qrbg72qW57U2syVax9JiluZyczte94f+vNrTpenmjAodJmCJanFtEo+0W4c+TnV
 Zt/Q49Ktorj2vjXDNkuIpJ989TdtmF9G6kVb7ih6PEoa1ocqUVjyIDvsLWBa3TMNoRJbrkLbg8r
 apQvUJecJ7vaYW/vYO8Lc8stZdDUD+hENw2oxCtxdS1+L8FrAj919nStuRswzQpwrK4iQ0R2DHc
 WovCFGybCqap4SHORArJXmA0Qhrg4k8DPwLd
X-Google-Smtp-Source: AGHT+IEtJ2E9FABbPtAZzZbxNdp+y65cylCWsCGjfOG/8r7Qoah/U7UWd9bnkQBDUU5mmh+x9lgJYA==
X-Received: by 2002:a05:6512:6cc:b0:542:28af:814 with SMTP id
 2adb3069b0e04-54228af083cmr5136432e87.19.1735034434112; 
 Tue, 24 Dec 2024 02:00:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813882sm1556243e87.168.2024.12.24.02.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 02:00:32 -0800 (PST)
Date: Tue, 24 Dec 2024 12:00:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, simona.vetter@ffwll.ch, 
 Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <omjfxg4gftxubikx5ynu6if6fupby3nulcilw6dhwtuetpgl7i@2gwiupvg2coh>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de> <Z2p_ucfNOyKcbWhH@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2p_ucfNOyKcbWhH@wunner.de>
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

On Tue, Dec 24, 2024 at 10:32:41AM +0100, Lukas Wunner wrote:
> On Tue, Dec 24, 2024 at 10:28:31AM +0100, Lukas Wunner wrote:
> > I did raise a concern about this to the maintainer, but to no avail:
> > https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/
> 
> Sorry, wrong link.  This is the one I meant to copy-paste... :(
> 
> https://lore.kernel.org/r/Z0rPxCGdD7r8HFKb@wunner.de/

Herbert asked a logical question, which got no response from your side.

-- 
With best wishes
Dmitry
