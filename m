Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970A829831
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31F510E5AC;
	Wed, 10 Jan 2024 11:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6399710E5AC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:00:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-555f95cc2e4so4393960a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704884424; x=1705489224; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONi/SB9nLqgwdclaMN3RyBOpRG19jO44sGJgFACT67g=;
 b=VV76ojVZwjtXy7+ZmNYtjrQApFrxrc2qeyx2bgeHvFe7iHYVzUJWaFf/8j+CyOM/np
 2ehxO0OTo+Vmpu+l1UUfp299F5hOMlKpLEhfua3+Ep6wkeE2g3PbZbi5IFYuNbNFG43B
 y7I36t3d61OjQ9B4NEUiNG6C+Y8d0xWZzGQn4CsvvQvU6Q1wenE9c9EE2dW6GI0iVH4N
 mawR6dqcW0PeJ/1ffr7x6SERET7z8WtkXVR8J/KuDqE+f7K0wrdYhUTc+ujXs3UbeOmo
 TA7WeCPRX74+8taXuCTWxAZCL2jWYn/C4RWM/TjxtNHc5IariO8gomLF6OH872hIZ1gc
 HyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704884424; x=1705489224;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ONi/SB9nLqgwdclaMN3RyBOpRG19jO44sGJgFACT67g=;
 b=jbPWP1pQtPga7CUF2U0+V2jTcCzWj/j1K5JkFz5Nz6yeFwY5tLTl8bS0D3uTC9c99t
 bmHo4K4zjwl1NdYCD4TbVLVfXqHpTwFrg0Swt9Hn0QR5Bj3R33cUBxRmMcFXKYniOmZP
 mJShsRakCVM09ky2QRrxEfvvmRTF4UWU/8PKE63kF0yvLdYW5uysDTukJZkilMo8Zwfr
 XPQq0SSv7MbIyTDvJnIQssrNXogELwQw+UwtFQW861UORMZTbHDCHNyPm3F9HBovnAjp
 YNQ55Mw8HQAwBq7WT0gAkCkXM22uqQ+CTYBFGEjXN/cJsjexbEXSycyDZOGDOf+h74kJ
 qZJg==
X-Gm-Message-State: AOJu0YzRiasHYS1q+1HqJkZHy3zU0Bkg2fCaHfp9jinAU9yHEP0ZaKk3
 KXvUXSyjoOiIfrxIi8nz9ssrLL6erdgXBg==
X-Google-Smtp-Source: AGHT+IF5G3ti7drOafPhH/oJnH4OEjkohZU5G6wl1Gh/kLq1Rluh5+3uo+b16GQfeNr7IUyy5r+CMw==
X-Received: by 2002:a17:907:9017:b0:a28:e3b6:ae4a with SMTP id
 ay23-20020a170907901700b00a28e3b6ae4amr400415ejc.57.1704884423732; 
 Wed, 10 Jan 2024 03:00:23 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 lh13-20020a170906f8cd00b00a2bd425eab2sm464326ejb.2.2024.01.10.03.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:00:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jan 2024 12:00:23 +0100
Message-Id: <CYAZ37LBKG4E.2096GKVUXN8Y2@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
 <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
 <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
In-Reply-To: <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed Jan 10, 2024 at 11:58 AM CET, Konrad Dybcio wrote:
>
>
> On 1/5/24 15:29, Luca Weiss wrote:
> > Add the description for the display panel found on this phone and remov=
e
> > the simple-framebuffer that was in place until now
>
> Why? They should be able to coexist with a smooth-ish handoff

Does that work upstream? I'm aware that downstream can do this but
thought this was still missing upstream.

Didn't check what happens when you have both enabled.

>
> [...]
>
> >  =20
> > +&gmu {
> > +	status =3D "okay";
>
> Please kick the disablement from the SoC dtsi instead, it won't
> probe without the GPU being enabled

Ack, will include a patch in v2 for that.

>
> Konrad

