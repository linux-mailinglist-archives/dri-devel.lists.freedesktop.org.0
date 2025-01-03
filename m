Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBEA00428
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 07:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEE210E804;
	Fri,  3 Jan 2025 06:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qal4dHIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BD210E804
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 06:20:30 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aab925654d9so2077748966b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 22:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735885169; x=1736489969; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
 b=Qal4dHIL7vcrWeIvOLGH3v29XKVEmFTXNxGoqhWIT8AtcHd5Yq0FkT7ebIYlIBH2Yd
 HDQ9lYfjkXJdeic4IpoFXO3LanAlflv6cZQrRUs460niB3GJibwoqIBjBFst+N1dXMmR
 Rzg35sVhkuz5gc6WbiHT1T/z6Z6eycdzT0vL8ekCo31xOkP0pBK2rxhiSBiT+3waV1yy
 keL4+pwcRV7RHndMt5p85LxKyNC0Vfd23U55uh744ZvqCAkEuiQEb1YWkqXXgGOYUsNu
 vGkxAsCDXMrbQ8JH6VIDO4NG6NYJnfbckNjRW9LOMD4qkSWpxVao2oA1tg3Ri4lRiaAE
 pDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735885169; x=1736489969;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
 b=TsQtMQ0MMrb3fGofDn78KAC6PRjyNdE5nLZVm3lrdIhDn46IBMC6JxB+v2zl83D4SI
 xCg4v+5rqmNwojQzfm2WSkuUNz7J4iB4XD0ZefJm3SoDB2RG5V7TgAraLCFSZPMJUydT
 9IJIjd/17XxJo5JTDMyK0Tr1h1IKdOrKBwUcveLxZOtQ8hhotlVWsD50jJlFnRsJVwR/
 JmL5ShA05dlRKCtHEnZuVH8/gsISSQk4o7A1d/GyZO7a5uYT6KEv62Tif8FTM8AkRlds
 FqvzYkwZK4ZG0wp1ih0magj2yVjE7tQsFpXM7k6eAWCRuO0Cb/YcAc+47afj92TvTxWc
 7PFw==
X-Gm-Message-State: AOJu0YwLTj0opeQzjMt9bZR6XkCcnqBubTchpScuOBwI9/rdaHCQQu2Z
 WmqreugNQXBExrIHgo2fLY7Knes4IKAJUtKgxo/Qz91GbPqXcAta9EpdCqoPkJDqG0XusIF8/Eg
 w
X-Gm-Gg: ASbGncvN1Y9yWxKWCNZOhnvm3w91Ipo9H1NDZaHGfLy6j6XCjYEZshU3J/Ooe9h6rBN
 lMweB5uUQH6F3e77X5lv4x4HswMZ6q0cqTBzbOF5WAZhTPm7OE1P8lpSckyryWcpvACbj1yd9fn
 cDg1pTwaT46Tuns1qrkIN+iJm/sCHaKyYcZ1AtHPAqBYd2vTLvgeV6lQqKNJSpJ7yR4RIPFtzC1
 mKzHu+kxm7I7FCaGBBSlRc+qpMkQr1Vyc3hY6YO3dfdKd9cxSYm6RXjDJHsl9cgiicO1HBvtQ5X
 4CqTKxWC8LpynvlUorS5d+ISXdvc2n+j26XY
X-Google-Smtp-Source: AGHT+IE6y4JdTtlzcbrnGGg7v7FjSgwU7e/vWxQ7TgNE5uhhWt7BpBzFop0XHrbVtbgwiv0CXbLJOQ==
X-Received: by 2002:a2e:bc1a:0:b0:302:3a46:10a7 with SMTP id
 38308e7fff4ca-3046851f9cemr129431821fa.5.1735883938405; 
 Thu, 02 Jan 2025 21:58:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3049ec4ca6bsm26165151fa.56.2025.01.02.21.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 21:58:57 -0800 (PST)
Date: Fri, 3 Jan 2025 07:58:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: uprev IGT
Message-ID: <dj2r22upxnj2aicjnsvoqnhd4n73tyfgm36jtvixxp4vphocev@gggcjakm3xge>
References: <20241217160655.2371138-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217160655.2371138-1-vignesh.raman@collabora.com>
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

On Tue, Dec 17, 2024 at 09:36:52PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> v2:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
>     Updated flake test bug report links.
> 

What is the current state of this patch? It would have been really nice
to get it in, we have patches depending on updated IGT.

-- 
With best wishes
Dmitry
