Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8DC76593C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606AF10E5CA;
	Thu, 27 Jul 2023 16:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7388110E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:52:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so12631965e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690476778; x=1691081578;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dE6jWvi9ES9FlLhNwcsG73K7eRLn9XSXyTw76xSm/hk=;
 b=GZHYYQ1u713KEN4x6sFqw/yW7lXomjd8pQB0ka1vy4W6ZE+HyBQJnS6ZKPDWWYjHiK
 LhPejrL8VRhbkRmp56BLiRud1a0fe9+A9/Yfp9zJfKMikQq6LRCO9OUoJz/hECA21qRY
 ZAEBLBOnAdIJUykdtmDABIze6nLSioHprGgJUQhBXLpjJSUvjqY2PUOhMHPHvjbN71iU
 xi4CXw/nXMSKlxQOKUiPStI/B2YjfBsUTskmOPhvEiuqBZ/d22KCpmnDHNqaHddGLM5r
 Kyr8/aiPCO4UmdPaAhbL6Zq8I/Q8Oy7NgiJsyu8igI3VfpNvEPMRouPywkIWZ4Bn0SRb
 jjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690476778; x=1691081578;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dE6jWvi9ES9FlLhNwcsG73K7eRLn9XSXyTw76xSm/hk=;
 b=XCfEG2uq8VVqs/oW5xA0qcR87b2Yyy/X+39WEUhjQGacui1uAAtKHEKWst55yZxE8z
 xwPSq6VI7/V8COfumkcmhTnmK7DQzSwXyrNWc+klMVbhh9AAv7AmRtakDGGE0ZbCVtQo
 stLCSDdM2Ue0izMigsZvJa8sj9CxzAJSDMfEN9xuuoHdDJPq+qiwK0e7vWSQgptd0IMg
 GUK+C6Q/T9A3J6H1HhR6FUvTO6N/mkZtpoDheky5ilbFGuIveXblzjhpRnFPUC15zsOY
 6PQRo9AdKBKG7esU0uehluF2/F408C+cAKVqx1MfTRwPcgQlMpfbLm+EQPoSYRZ7Jq9Z
 u2tA==
X-Gm-Message-State: ABy/qLbrbKMFtWjNQw32gYmob8OOvKQ9JeXiAfR3wgPfeT0mMeHn9mww
 f0MSqX6VbMhL7HgQSQQExUI=
X-Google-Smtp-Source: APBJJlEmxny/T+WyRQXlH4iIrdke4/GzM0dw64UJ1UjCHYFWGmQcxO8ZPCJC/dslJcGcNBXnbkpyPA==
X-Received: by 2002:a05:600c:22d7:b0:3fb:a102:6d7a with SMTP id
 23-20020a05600c22d700b003fba1026d7amr2137226wmg.28.1690476777523; 
 Thu, 27 Jul 2023 09:52:57 -0700 (PDT)
Received: from [127.0.0.1] ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c1d0500b003fbb1ce274fsm17812269wms.0.2023.07.27.09.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 09:52:57 -0700 (PDT)
Date: Thu, 27 Jul 2023 19:52:56 +0300
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
User-Agent: K-9 Mail for Android
In-Reply-To: <ZMKgW6eYpJVqeZJM@orome>
References: <20230618085046.10081-1-clamor95@gmail.com>
 <20230618085046.10081-3-clamor95@gmail.com> <ZMKJE1G87-jWeg2_@orome>
 <5A2447D3-DB49-4788-AA05-182AF0F04ED2@gmail.com> <ZMKgW6eYpJVqeZJM@orome>
Message-ID: <D38329D2-D6EC-4DEA-A47A-B4FAEA6DB399@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



27 =D0=BB=D0=B8=D0=BF=D0=BD=D1=8F 2023 =D1=80=2E 19:50:35 GMT+03:00, Thier=
ry Reding <thierry=2Ereding@gmail=2Ecom> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
>On Thu, Jul 27, 2023 at 07:26:28PM +0300, Svyatoslav Ryhel wrote:
>>=20
>>=20
>> 27 =D0=BB=D0=B8=D0=BF=D0=BD=D1=8F 2023 =D1=80=2E 18:11:15 GMT+03:00, Th=
ierry Reding <thierry=2Ereding@gmail=2Ecom> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=B2(-=D0=BB=D0=B0):
>> >On Sun, Jun 18, 2023 at 11:50:46AM +0300, Svyatoslav Ryhel wrote:
>> >> All ASUS Transformers have micro-HDMI connector directly available=
=2E
>> >> After Tegra HDMI got bridge/connector support, we should use connect=
or
>> >> framework for proper HW description=2E
>> >>=20
>> >> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo=2Ecom> # ASUS TF T3=
0
>> >> Tested-by: Robert Eckelmann <longnoserob@gmail=2Ecom> # ASUS TF101 T=
20
>> >> Tested-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom> # ASUS TF201 T30
>> >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> >> ---
>> >>  arch/arm/boot/dts/tegra20-asus-tf101=2Edts      | 22 ++++++++++++++=
++---
>> >>  =2E=2E=2E/dts/tegra30-asus-transformer-common=2Edtsi  | 21 ++++++++=
++++++++--
>> >>  2 files changed, 38 insertions(+), 5 deletions(-)
>> >>=20
>> >> diff --git a/arch/arm/boot/dts/tegra20-asus-tf101=2Edts b/arch/arm/b=
oot/dts/tegra20-asus-tf101=2Edts
>> >> index c2a9c3fb5b33=2E=2E97350f566539 100644
>> >> --- a/arch/arm/boot/dts/tegra20-asus-tf101=2Edts
>> >> +++ b/arch/arm/boot/dts/tegra20-asus-tf101=2Edts
>> >> @@ -82,9 +82,11 @@ hdmi@54280000 {
>> >>  			pll-supply =3D <&hdmi_pll_reg>;
>> >>  			hdmi-supply =3D <&vdd_hdmi_en>;
>> >> =20
>> >> -			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
>> >> -			nvidia,hpd-gpio =3D <&gpio TEGRA_GPIO(N, 7)
>> >> -				GPIO_ACTIVE_HIGH>;
>> >> +			port@0 {
>> >> +				hdmi_out: endpoint {
>> >> +					remote-endpoint =3D <&connector_in>;
>> >> +				};
>> >> +			};
>> >
>> >Does this need a bindings change? nvidia,tegra20-hdmi currently doesn'=
t
>> >support OF graphs, so this would probably fail to validate if we merge
>> >it without a corresponding DT bindings update=2E
>>=20
>> drm/tegra patch is backwards compatible and connector node is optional=
=2E
>
>We still need to document the connector node, otherwise the DT
>validation will complain about port@0 being used here, won't it?

Honestly? I have no idea, linux dt yamls are my nightmare and a reason why=
 most of my patches still are hanging in the void of mailing lists=2E

>Thierry
