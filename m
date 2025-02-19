Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC901A3C960
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA1D10E079;
	Wed, 19 Feb 2025 20:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fz8zrpK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40ECE10E079;
 Wed, 19 Feb 2025 20:12:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30761be8fcfso1856051fa.0; 
 Wed, 19 Feb 2025 12:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739995933; x=1740600733; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=neQSskfwyREar5ANcNe3kBzHKLTcu2V5yytBDjdfqoQ=;
 b=Fz8zrpK64LXnDmssUn+UQODzL3DWDTyRKOYlXeB0feDFXyBtuk0z1kUKi/llBeDqcZ
 3h1LUpdRYvl97hID/Pq6o3za3kuA7cUPBWkRknJvCOgWkSJe109oW9LVmY5lbEJBjQgv
 YMoAR0YUUyqySQWn5n8t05MPlxtxRC+g6RQmYaFx0Srtlh5nB9kFq/Gx8s7ssDIn+dAt
 Mht7ZwtrfomLPPcLJR8zvO1qqwBuGP3LuSkIpzVgxnFu8m+msPmrvJfDgckU1GRcYBOG
 RQV00C6cvLZp8JU+PDb7sj6ho3wkT+Hy56vkbyyVXnlALlPn0yIOWRFH+LxQ6UKlgAdK
 v6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739995933; x=1740600733;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neQSskfwyREar5ANcNe3kBzHKLTcu2V5yytBDjdfqoQ=;
 b=wa2atSZOgyzg++sKHK1dm7awRSkyFXDA2jVZN/rVBPXloOpKa5N7hkhY9+azmlBcKW
 gc2e0mUTQEWNXhjsBk3++TVVb8ESoo+dT3DBqJ25K5LhShDvR2JsIPCKSdPbKMM6r4tP
 Yc1m2BcFYUgls7Pi2nwMGmKrcwpz0WHMErw0j5JcVeCqF5VVntZWpl02bjf9M+ZY8XDk
 /fvjw8t6HIO4ZnVzFpA4Ru9kXDpqGRWe0h8OORiuIHlEakz2mz5ptH1hanXscfRKVrrZ
 vTDwutujcYWHkYPQUl1ZnqkEfc1blv0M3EjhaTT0zx4suCSocKVyyQrJacDwNECy/9Ub
 ssmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV714YUJn0Q9qmkTx6Y2LRduPW7akQVe/DYBQK8k2/Yzqqgsl6H2eiUY6YIuO1KK9tuYS63h2wJGw==@lists.freedesktop.org,
 AJvYcCWjAZT+oej7pav4TqbzwTOKN2KuQS2R2lclg1E4kP4Zgl6vWSl2A4PfaTeEFMpxjWUoE2hxR5IEnPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl0AWog42/2ouk/Sa+6x9FR3BmkK5UxjHaTiyvpwB5FEQ9g0iH
 7wFwMlLWI80L6fnr8cN8bGhatbaUcLdDGKeBRlINA9t0QPIq9CckW84CWpOZA6LfyhEl8jnwIat
 PjJeCvpRSb8RVulgCkHdX+4As7Ss=
X-Gm-Gg: ASbGncvjOdibjJI2wtfKcAzG5YxDHwyvDQBPUrYrYi4uXe9wSefFBLQ36yEuckRTEiJ
 F6dGNpdIAOJhgX9oFU8ldrAa8a8/tDpsiWL3TAXOolQCIPtRQKo5QVvIRt3vQsfDPhBbBVLw=
X-Google-Smtp-Source: AGHT+IERkudwXdnctKCgwhQh5wIiHi3K6oTUjfFkhMs7gAVx3ULMl2XN8GGFtfg5cPmz9EyULRsi8kFR1EpVe7rcdLc=
X-Received: by 2002:a2e:9802:0:b0:306:10d6:28a5 with SMTP id
 38308e7fff4ca-30927a57955mr54400011fa.1.1739995933190; Wed, 19 Feb 2025
 12:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
In-Reply-To: <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Wed, 19 Feb 2025 21:11:37 +0100
X-Gm-Features: AWEUYZlZ1YDFSsTTD8a_D8x7UaFQgtz2z5a-DCduNTwEVhrCsa7kpu99tLk_xgE
Message-ID: <CAA76j92DXbCrMoW1sta32TS5nnbTrgyXoOH=twwFeO1bzo-gSA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, 
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 John Hubbard <jhubbard@nvidia.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>
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

> Actually. How about adding methods to this trait that return either
> component?
>
>   let some_u32 = some_u64.high_half();
>   let another_u32 = some_u64.low_half();
>
> These should be used most of the times, and using destructuring/tuple
> would only be useful for a few select cases.
>

Indeed very nice!
