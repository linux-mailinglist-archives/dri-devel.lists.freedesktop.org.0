Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9B92D42F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162EE10E7F5;
	Wed, 10 Jul 2024 14:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eVl3qPf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B13F10E7F3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 14:29:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-58be2b8b6b2so8104859a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720621750; x=1721226550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=;
 b=eVl3qPf5XSsCED9ukSTZsGN/16AqEw2m6l+3I5W3MUqoMI1Xp896jDPj5vEi5MfpVq
 WdQKMluClQ75QH+Vw8Xa8F6UjyCr62qvt19PVqDlwp0yXR7LjuUJ8wPyH7cLw3bjCiqf
 Zwz4mz0HoSNY37VqFJ32X3M6BW1QbPGs3E/JwMZL2p69YpXmynFja/Urglh1nFYreKee
 ZfjfeLkgpLOiqvIMhu5v8qwCSmDPP3P629mWPPc81GGyHU8zs2UqYsqM5Gynksx5oSCe
 Yy96jLPexShtDwgc6P7imGS70DqTCfmZFdDFS1spGFvoLQn5VOkzC9QD9Gx51l7Dxbtv
 VXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720621750; x=1721226550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=;
 b=OUgXjZC75Vj3xFg5NflTjAoGtboVWq5cuDpUw9zlmu9AhVRxsqfBhudIfp4vqqKC4K
 cbM96eLxPvrrMAqWwAcZ2u8w2ukUdBMfP5V6v2j80VH43BeHuoVkpBnVEKHkBNM2liT5
 L/0PDM6xDR6Rc0XM3OTBbBzXpBVkgDIzlWh6VQdhkqfZhvRRiAkGgMSI5u8qmMiZmhHf
 ZCb1K5f4STZ2kUV4+NlUtutd8ljpaJl+E0RyZD7a8A4BJX05chSMgYg/N8LCGPCin+ww
 Osv/gWnLygY755Af7m1hJVa7S8HdqVPjiD5uAjZqy0zzX/8mb4bqoq4tdFMExRcI9w1s
 z68Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKI/5R0ymhitaEpYY3QuXukPlKmtcBE1AdRQDdWGWx6OG2K+cMoUvQspWzvNXJQmQ2w2CnnCP1IlAmOoOgnbq6eZAflqAvW/xdLBK4aQbw
X-Gm-Message-State: AOJu0YygxHob4IXexg1woUY3eFFo6mU3RjQgDqvmOyktB31FyW9xlfwT
 v/FeJ9CtC7J6gp2uVSxR1XvRpTZHqOff+TemiqUF41ZO2jUY6S4DLuOpEgZcFO+1vBUuX+qv4lJ
 T9oe5D+7DgTUcSoIlcAEavif4GUs=
X-Google-Smtp-Source: AGHT+IFA5+m5xZv4TYCT5QPxWx1vJf/iXq68BQ4T7QErwC03UwTWky2h2CUAYZOmGS5DJLngCY+qzVcAGRFLZMxsAl8=
X-Received: by 2002:a17:907:868e:b0:a72:4d91:6223 with SMTP id
 a640c23a62f3a-a780b8849cbmr438447066b.62.1720621749595; Wed, 10 Jul 2024
 07:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
 <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
In-Reply-To: <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Jul 2024 09:28:58 -0500
Message-ID: <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, 
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "fshao@chromium.org" <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, May 26, 2024 at 10:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> Hi Angelo, Jassi,
>
> Could you help me apply this series?
> Thanks!
>
Please get it reviewed by DT maintainers .... Rob or Krzysztof.

-Jassi
