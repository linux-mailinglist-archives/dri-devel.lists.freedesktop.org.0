Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FDC92F8B3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 12:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C3E10ECA4;
	Fri, 12 Jul 2024 10:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jlbPP9eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B619710ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 10:12:09 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ee77db6f97so30883631fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779128; x=1721383928; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0Je+bWklzCKJuneNY6cNlT9UWbwrWRFKxzVY5soo7Kg=;
 b=jlbPP9eg1xGTaAvPrl0TBiS/nvGmlA6M8DRmPHLQaNYaCfJvQKUh5s6u9NVvyIkjWe
 ICOS8owi5IZ3POGx11jjsEiqRybNfZkeae00jPt5uGaKRTTjJWbyIu6I2f8hoe1xDAef
 Ijs0z2X31IYhJpkCinou9mAS5dNeGYAow8E55YnWRxa24weRoY77O/91DwvlORkDxaoe
 nj7hYzqcJ1lSnaCBpaSQj12kYqsViUxK738UyycltZM2pwkW1J9k3cHDFD3tKgPD2Uc4
 hIuVBz3toKC84NXSaPmp5S1NTAIxPoeZ6KU2lD7hNUFj3dF9hxKWhLffskt9DIxPKZVi
 258w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779128; x=1721383928;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Je+bWklzCKJuneNY6cNlT9UWbwrWRFKxzVY5soo7Kg=;
 b=n4g7UUVlY5SDecV0JQSZ/vNo0ezCnjzVo8bsw4FJkdze1qDGRyPhGq1ifgLyumNQw1
 XMQpEI8zQbIbkhT5pvI5bS/XzsSv21QkfQZEUsM0BqelE9bEGgyHVQEoaUvho4Vy1ZoS
 QbyF2HuVvbVtnl/yYMUyWcto5EC7SX64ODLx1qe8pMyJEUhQ8182Y6O+nDu7BE3wAKwZ
 I9HTr4RqrVUhHuzsIL79joIQRo5Pk1S0nLeor6DpZxFZRoIqyIYSDzw0NVrG+Y+9ZK6m
 pGDPV7iznc0Q3c6czG1VCo1Jui/oFz5meCKh6hvgldNyhX9IXO2Mb6LUHsMm7QJvSPEi
 W6dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoBRvy2tHLsOl7BQkez117euj0o2Iy/NGXBe9gaduow+hUQvj2a5SungVH8yY8bhVnI9KO2pv0q9w9OSqLZi0gXlLo/Lby3+G+olgqFxwI
X-Gm-Message-State: AOJu0YwP9eLXyeBJ94883B2zWONyxI/JGy+1h02O+NH9g7M17gDcS/WN
 IfRdYf4LJsTDT/WYgMwX1oME5l3ddhtsx5/Hk2N4XDKqd4Ub3IogNH3BrPp5qdM=
X-Google-Smtp-Source: AGHT+IF7JW+Kh8tLh+UYC/9/ItXhPzDMCdfMbKPA2aVcrplOv+QP5gAkqvXAWcsCdpyUaEH7C2owmA==
X-Received: by 2002:a2e:a4ad:0:b0:2ee:5ed4:7930 with SMTP id
 38308e7fff4ca-2eeb316afaemr89114451fa.37.1720779127859; 
 Fri, 12 Jul 2024 03:12:07 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b240:cbc0:d3ac:530e:4e1d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23984fsm18562155e9.7.2024.07.12.03.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:12:07 -0700 (PDT)
Date: Fri, 12 Jul 2024 12:11:59 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
Message-ID: <ZpEBb6A06dDU55RB@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
 <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
 <Zo7a6qso7RZ2pkmb@linaro.org>
 <CAD=FV=U_knZPsM3jnpUOqK7rcBjJeqPAHDG9QRgWhLVeKGZwGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U_knZPsM3jnpUOqK7rcBjJeqPAHDG9QRgWhLVeKGZwGg@mail.gmail.com>
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

On Wed, Jul 10, 2024 at 12:16:58PM -0700, Doug Anderson wrote:
> On Wed, Jul 10, 2024 at 12:03 PM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > > 2. In theory you could make your compatible look like this:
> > >
> > > compatible = "samsung,atna45af01", "samsung,atna33xc20"
> > >
> > > ...which would say "I have a 45af01 but if the OS doesn't have
> > > anything special to do that it would be fine to use the 33xc20
> > > driver". That would allow device trees to work without the kernel
> > > changes and would allow you to land the DT changes in parallel with
> > > the driver changes and things would keep working.
> > >
> > > ...and, in fact, that would mean you _didn't_ need to add the new
> > > compatible string to the driver, which is nice.
> > >
> >
> > Yeah, I considered this. I mentioned the reason why I decided against
> > this in patch 2:
> >
> > > While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallback
> > > compatible, the original submission of the compatible in commit
> > > 4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timings
> > > and resolution hardcoded. These would not work for ATNA45AF01.
> >
> > Basically, it works with the current driver. But if you would run the
> > kernel at the state of the original submission then it would behave
> > incorrectly. This is why I considered the resolution and timings to be
> > part of the "samsung,atna33xc20" "ABI". The new panel would not be
> > compatible with that.
> 
> Ah, oops. My eyes totally glazed over the description since the patch
> was so simple. :-P Sorry about that.
> 
> IMO I'd still prefer using the fallback compatible, but happy to hear
> other opinions. In the original commit things were pretty broken still
> (sorta like how it's broken for you using "edp-panel") and the
> resolution hasn't been hardcoded for a long while...

I briefly discussed this with Krzysztof on IRC yesterday and we
concluded that a fallback compatible is better. If one considers just
the non-discoverable part of the interface for the binding (i.e. the
non-standard power sequence), then the two panels are indeed compatible.

I will send a v2 with the fallback compatible on Monday. I think this
can also simplify backporting the backlight fix as you mentioned, since
then no driver change is required to make it work.

Thanks,
Stephan
