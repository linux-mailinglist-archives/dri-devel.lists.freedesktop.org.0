Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33EA3A31E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 17:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7FA10E3D4;
	Tue, 18 Feb 2025 16:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="i7/A1tPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98810E3D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 16:46:56 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fc20e0f0ceso7382460a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1739897215; x=1740502015;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IOylOGK8+KXVlSKwEjhOkQ9Uo6qP5iYjwH/vqYLvpOc=;
 b=i7/A1tPxXanaF/nwldIlEComMvBA8dn6DjZc7IIOARMpxNevIfigxwPF7cWPU0Zrgp
 dgG2H+6CZWbMG/6TEoy77DPZfmX1pfUgrWt9UQ/9+imtalinOLdUgdmJatrg5dbZrMXD
 fCIlp8sBoK9+FNuFZBDrH12LtjYHOG85iJ0vBcJqqm4ZC/iyrYXWcnlOCJT80dq535oh
 BZ/AfNiGHPyGMyv47qmzipBcxSkf5qirgKinKj/IBap9QZK5uoqpRqHWXAgWA7x486Fk
 +Re7hXWiiWrC6+eWUbfNMQzjOefwN7Oj3GRxFvgehCt/fh2T8gOiFB79dsb/Euzte7hv
 jZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897215; x=1740502015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOylOGK8+KXVlSKwEjhOkQ9Uo6qP5iYjwH/vqYLvpOc=;
 b=aSh4eLnBRj/fk3NWpv2uL4uNQo/pzFU2kvs9HwWRakaNDAYoZrGEwBf5ZDb6XX1q5n
 IN4bjkw1gQ4JTY1kblk1DeHs1Lr6A7CrWZlCHQHDY02OlHsco1WQHPHJE1Sb16YfWnfZ
 3DBp+cRcXsMnoTtzK7azD2bfbrjNOF2QWEqR01KuDpmyOZ8bH/9DvzjTGiMbjRnafHN8
 3v7LPDtptNnGGt4VKWXvanWT3Kg/Cj+15OcFejsZhsu/PNay79W6AFpOJlS1MF5Giup1
 rdKwCFiSmCh4pZPtheYLiFAR3ULGs93+qS9gekBnaE1n3CjppV2tZrkxl3tGCSHBQj5c
 ke+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX65SBYVfu7aiyqEhx5YsWGtPh3RRJICYzbEhdR7iLLh8N9pe4Td6ObsvCAe73AMcZtEW3Cp49JCuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjJq6KLTrrovKpgAt356TnGJqYkW/gDDlNxWuG+guEdiy1Ji9m
 mKCWrxlPpWkM/WUGhf7ITxRjxOUaKgeaaFF1K5c8UyDsEeZloZOhuObU5OOb9bkhSrHmvnc5Yz9
 e4P05NtewUpbfkqZvXo53iJxrZjuezrgTXDjVng==
X-Gm-Gg: ASbGncsH4OiyN5BMk1xw8Hfeio9qvZjVW6cCrjrf+e2YyFnbQ2lj/AL2ThVxZuGSx4R
 UIie4Vk0ih85j1L4QQJUMYppyvvxAsAtfan14agugnoLKADjJ/iS3rIPjV6TJ1kOsnVnK9g==
X-Google-Smtp-Source: AGHT+IGHwzBsO/GBPkHZczfaNaO/9Fri81n9XYQ1ztlxgGE0CRA4HOyjovvD+vqgo/EOu8/IM5aMJO/ERmz9uK+U4xE=
X-Received: by 2002:a17:90b:2783:b0:2ee:b875:6d30 with SMTP id
 98e67ed59e1d1-2fcb5a17ccfmr165222a91.9.1739897215586; Tue, 18 Feb 2025
 08:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 18 Feb 2025 16:46:41 +0000
X-Gm-Features: AWEUYZkKtmN_-KWMeq06D2l9RZUatLIu9Ka5J6k3tL8rcVyNTYGe730GhgI3bME
Message-ID: <CAPj87rN7QQ2XRa4KnaH9MZrvyRcRWWrihSKousR1j7GD+bEQtg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 18 Feb 2025 at 14:35, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> This can be tested on a RockPi 4B+ with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
>         -b prototype/sdp-v5
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make all -j$(nproc)
> # Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
> # Connect a monitor to the RockPi
> # login and at the prompt:
> gst-launch-1.0 videotestsrc ! \
>         aesenc key=1f9423681beb9a79215820f6bda73d0f \
>                 iv=e9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=true ! \
>         aesdec key=1f9423681beb9a79215820f6bda73d0f ! \
>         kmssink
>
> The aesdec module has been hacked to use an OP-TEE TA to decrypt the stream
> into restricted DMA-bufs which are consumed by the kmssink.

Thanks so very much for putting this together btw. This is the exact
thing we were just starting on, but you beat us to it by a few weeks
it seems. It's awesome to have an implementation of 'real' (if
useless) SVP, so we can actually exercise these codepaths in open
generic code.

Cheers,
Daniel
