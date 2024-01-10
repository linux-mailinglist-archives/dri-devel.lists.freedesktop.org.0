Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF931829911
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53C10E763;
	Wed, 10 Jan 2024 11:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1A010E763
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:30:39 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5572a9b3420so8511853a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704886238; x=1705491038; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wtz+7SKzz9hrXYk9v1Im5ZeLktUFRpb9DhH87gAT8QU=;
 b=aBtKmkCNbsYCRrv5yNW5q9AzNc3GfhH563n9IGstRaeE0iFGykvNrdguHKlS/vvnp6
 BL9yvGKAI80WEJHQ+A0xht9l8LgHGUnxsGwvs7W6eEqgBN+E8B7bWzCM1jP5gCqp1Im2
 KsNOpTcJKapXy/BWQz9FdaBtOkYVsaVFUxRzPRxJh9KwJ74IhTPZb2JJpmjzOviRx9mw
 KM1f83cCPE4Js/4j0uEyttO0Q2OEFNR5iL6O9mp6N7i5/BSbyPvC3MNekUGaGMHMt+Dt
 wvVz66rZtscFKz/XQ68TNQfPGc6qhEYbKCoCcIQSLpyN1zkDuQe4gN9Z5/Tl/PA8FVwj
 1ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704886238; x=1705491038;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Wtz+7SKzz9hrXYk9v1Im5ZeLktUFRpb9DhH87gAT8QU=;
 b=R7WZ33Mijje20NUDW2f7pEMAfkVPz2PoYBzbkDodiXkWoQpHTLKC6LCQJB1eJ8Km8s
 JPaFRyeSuGdinH/kBYSL6XWWqOX7bsrPpx33IzS3febyFzLQVHzq8vzjkpXuyHmL8e5S
 ZYqkQg/nh73gtnpp+tAsRnr83WnXR6LyXNG5gw2bpi1ZjiB3ESPqPTbk0GIy5oDXX4rg
 MpEaspW4BCIqa3JuLwnZICJJ82HdK9fNCPrZHwuBSnodn/m/dvvOFlnsHCQ7oHf8GPTz
 jhyxTvcntjNj8p2Acd3dQ3PR6p05AXrbto38Qsm1wqFWORsJPwf5fZNxRBQIXd39u/X4
 HbHg==
X-Gm-Message-State: AOJu0Yz6Yi+dcXy8Udg6oeXBZlgsPLxU+yKm+Tm8EmNxB+1NIfJrecEz
 eFwALtDHepelr95Cwp3Rq4+WLmdYRJY1eQ==
X-Google-Smtp-Source: AGHT+IEB3j3STyR03J4HjEjLzAll3scW8AwBkIZIUi1cKmGpqPuNFR86aXfkJfwks7yIurkH8kGntA==
X-Received: by 2002:a17:906:f82:b0:a28:26e9:a13d with SMTP id
 q2-20020a1709060f8200b00a2826e9a13dmr919135ejj.55.1704886238293; 
 Wed, 10 Jan 2024 03:30:38 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 hb21-20020a170906b89500b00a28d438a1b0sm1992896ejb.83.2024.01.10.03.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:30:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jan 2024 12:30:37 +0100
Message-Id: <CYAZQD6AWM6J.10P13VNGRYNPR@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
 <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
 <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
 <CYAZ37LBKG4E.2096GKVUXN8Y2@fairphone.com>
 <2zkiop7xg7w4vkpjpol25qna5wwbq4ja5o6iwuqh25m34k6mgd@aemrbzqgx2oe>
In-Reply-To: <2zkiop7xg7w4vkpjpol25qna5wwbq4ja5o6iwuqh25m34k6mgd@aemrbzqgx2oe>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed Jan 10, 2024 at 12:23 PM CET, Maxime Ripard wrote:
> On Wed, Jan 10, 2024 at 12:00:23PM +0100, Luca Weiss wrote:
> > On Wed Jan 10, 2024 at 11:58 AM CET, Konrad Dybcio wrote:
> > >
> > >
> > > On 1/5/24 15:29, Luca Weiss wrote:
> > > > Add the description for the display panel found on this phone and r=
emove
> > > > the simple-framebuffer that was in place until now
> > >
> > > Why? They should be able to coexist with a smooth-ish handoff
> >=20
> > Does that work upstream? I'm aware that downstream can do this but
> > thought this was still missing upstream.
>
> It depends what you call smooth-ish I guess, but KMS handles the
> handover just fine. You're likely to get a flicker during the transition
> though.

Right, seems to work. Also visually looks okay.

fairphone-fp4:~$ dmesg | grep "frame buffer device"
[    0.250511] Console: switching to colour frame buffer device 135x146
[    0.284146] simple-framebuffer a0000000.framebuffer: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    2.576712] Console: switching to colour frame buffer device 135x146
[    2.604907] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb fram=
e buffer device

I thought before that having two outputs like this would cause two
different framebuffers/display devices to appear, but yeah as I said
seems okay. Will change in v2.

Regards
Luca

>
> Either way, the DT isn't the right place to choose, you should enable
> both, and the distro will choose its policy through configuration.
>
> Maxime

