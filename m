Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308095E4FE
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 21:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8F10E076;
	Sun, 25 Aug 2024 19:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OlOjMbmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8202510E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 18:32:38 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4280bca3960so30775415e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724610757; x=1725215557; darn=lists.freedesktop.org;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=aEj6ln3KL/n8ompwaFMCBU3sFiSDp9wAHsxwXZ6X42Y=;
 b=OlOjMbmAbxH80BE+s68zEDHXzJLALvdM36Es/zA9W4/qYKgJlXdGQRkY/yMPsTtqWn
 lk/RkXGj5I6OYkgbroFfFu+meDua5nijolxZerk28QhzYPCeybUT8vNWX5ku7GjR4Ffu
 TP71728B/cpGfB6qlVRR7YrNvA7pMFt698rjxUoLdZeHQ9n+jY8S8fLqbl6V83pfLQ5b
 7qJN/Vv+Lygr1N1uP397k1E6BgwmpogmWwjDbR6bKeMHMYneZm2w0hZ668HVxtpDvecn
 uymu/gMWmRyE7xx7cHr3EVbAuS5RHj4wsrd9OlkZuTFyLXIf7n5yDTJ4iibKpq+E1ApE
 afHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724610757; x=1725215557;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEj6ln3KL/n8ompwaFMCBU3sFiSDp9wAHsxwXZ6X42Y=;
 b=K5ttmo43oMMPTlrV+VsjyPJ0WEjDULaxbf9oC3N9faRcrvenmF+KVt21qHlIvF8g0X
 /W9e5LP0vs9FWTgzZ4Hy+9pkhCz3wavORPzS3AS7Iqm8BhKNcuZ7zNO64X6bRXy/HiFY
 zDW54GwY2o+SMtb8yssAXYalV6xGcKws4LoXKeHmuDzPBlBZtZctHed+snf0jhs9HaLw
 VCfBgcRqacWUG5zZG96D5hnNrxmzrUCsxcWSJv+AHau21SYA2d9IftbDqKZihCqy2wmB
 w2UDNbaCeY9kGY/4rNvUPj+UIBFBN5yO2/c3BJWKV6DAzZ75pXVeZKcSCWtMd8OU923t
 FodA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDxV0v6Oo9Jm7rFKTLr3LQCcucan1OuQmqLeLa9myHO+9nOXAu89flH9bxnMcOwhkCxrD1CnpmMto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk5lX2YQUUOOdrFQ6H6l2LlqduWM3BtMl5IPysu3ylyYqb/wvl
 s1P6V2/8c/CEDIPlAzPmjAgF+Jimee3C35CaWEusEzjiie8n/ahM
X-Google-Smtp-Source: AGHT+IG9//1RnAx1LZhIPr1jWhdrxzqZLaUEoK8jxDsuu8MhCivYthi79W9byIhECX/m9jh7iJJlVQ==
X-Received: by 2002:a05:600c:15ca:b0:428:fcb:95c with SMTP id
 5b1f17b1804b1-42acc9fe1ccmr54512465e9.23.1724610756151; 
 Sun, 25 Aug 2024 11:32:36 -0700 (PDT)
Received: from smtpclient.apple ([2001:8f8:183b:7523:d557:d53c:567a:37ed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abeffe43esm164602735e9.44.2024.08.25.11.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Aug 2024 11:32:35 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-1A3EB32A-89AF-44A1-B46E-DBECE8974494
Content-Transfer-Encoding: 7bit
From: Alexey Charkov <alchark@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 11/12] arm64: dts: rockchip: Add rk3576 SoC base DT
Date: Sun, 25 Aug 2024 22:32:23 +0400
Message-Id: <201E9E25-0FF4-4A01-9B20-4853134608BD@gmail.com>
References: <20240825140824.200453-1-amadeus@jmu.edu.cn>
Cc: detlev.casanova@collabora.com, airlied@gmail.com, andi.shyti@kernel.org,
 andyshrk@163.com, broonie@kernel.org, cl@rock-chips.com, conor+dt@kernel.org, 
 daniel@ffwll.ch, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dsimic@manjaro.org, efectn@protonmail.com, finley.xiao@rock-chips.com,
 gregkh@linuxfoundation.org, heiko@sntech.de, honyuenkwun@gmail.com,
 jagan@edgeble.ai, jamie@jamieiles.com, jic23@kernel.org, jirislaby@kernel.org, 
 jonas@kwiboo.se, jszhang@kernel.org, kernel@collabora.com, krzk+dt@kernel.org, 
 lars@metafoo.de, lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux@roeck-us.net, maarten.lankhorst@linux.intel.com,
 macromorgan@hotmail.com, megi@xff.cz, michael.riesch@wolfvision.net,
 mripard@kernel.org, robh@kernel.org, tim@feathertop.org, tzimmermann@suse.de, 
 ulf.hansson@linaro.org, wim@linux-watchdog.org
In-Reply-To: <20240825140824.200453-1-amadeus@jmu.edu.cn>
To: Chukun Pan <amadeus@jmu.edu.cn>
X-Mailer: iPhone Mail (21F90)
X-Mailman-Approved-At: Sun, 25 Aug 2024 19:51:10 +0000
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


--Apple-Mail-1A3EB32A-89AF-44A1-B46E-DBECE8974494
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 25 Aug 2024, at 18:10, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>=20
> =EF=BB=BFHi,
>=20
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> ...
>> +        opp-1416000000 {
>> +            opp-hz =3D /bits/ 64 <1416000000>;
>> +            opp-microvolt =3D <725000 725000 950000>;
>> +            opp-microvolt-L1 =3D <712500 712500 950000>;
>> +            opp-microvolt-L2 =3D <700000 700000 950000>;
>> +            opp-microvolt-L3 =3D <700000 700000 950000>;
>> +            opp-microvolt-L4 =3D <700000 700000 950000>;
>> +            opp-microvolt-L5 =3D <700000 700000 950000>;
>> +            clock-latency-ns =3D <40000>;
>> +        };
>> ...
>=20
> I'm curious if these frequencies work properly. On the bsp kernel,
> 'opp-microvolt-L<name>' is used by the PVTM driver, I don't know
> if it works on the upstream kernel. Sorry but have you tested it
> with mhz (https://github.com/wtarreau/mhz)?

These are for voltage-frequency binning, and they at least require reading a=
nd interpreting =E2=80=98leakage=E2=80=99 values from efuse, which the mainl=
ine generic cpufreq-dt driver does not. So maybe drop the (.+)-L[0-9]+ value=
s until we have something in the mainline tree to test them with?

Best regards,
Alexey=

--Apple-Mail-1A3EB32A-89AF-44A1-B46E-DBECE8974494
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr"><br=
></div><div dir=3D"ltr"><br><blockquote type=3D"cite">On 25 Aug 2024, at 18:=
10, Chukun Pan &lt;amadeus@jmu.edu.cn&gt; wrote:<br><br></blockquote></div><=
blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi,</span><br><span=
></span><br><blockquote type=3D"cite"><span>--- /dev/null</span><br></blockq=
uote><blockquote type=3D"cite"><span>+++ b/arch/arm64/boot/dts/rockchip/rk35=
76.dtsi</span><br></blockquote><blockquote type=3D"cite"><span>...</span><br=
></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp;o=
pp-1416000000 {</span><br></blockquote><blockquote type=3D"cite"><span>+ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opp-hz =3D /bits/ 64 &lt;1416000000&gt=
;;</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;opp-microvolt =3D &lt;725000 725000 950000&gt;;</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;opp-microvolt-L1 =3D &lt;712500 712500 950000&gt;;</span>=
<br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;opp-microvolt-L2 =3D &lt;700000 700000 950000&gt;;</span><br=
></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;opp-microvolt-L3 =3D &lt;700000 700000 950000&gt;;</span><br></b=
lockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;opp-microvolt-L4 =3D &lt;700000 700000 950000&gt;;</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;opp-microvolt-L5 =3D &lt;700000 700000 950000&gt;;</span><br></blockquo=
te><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;clock-latency-ns =3D &lt;40000&gt;;</span><br></blockquote><blockquote typ=
e=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp;};</span><br></blockquote><blo=
ckquote type=3D"cite"><span>...</span><br></blockquote><span></span><br><spa=
n>I'm curious if these frequencies work properly. On the bsp kernel,</span><=
br><span>'opp-microvolt-L&lt;name&gt;' is used by the PVTM driver, I don't k=
now</span><br><span>if it works on the upstream kernel. Sorry but have you t=
ested it</span><br><span>with mhz (https://github.com/wtarreau/mhz)?</span><=
br></div></blockquote><div><br></div><span style=3D"font-size: 16px; -webkit=
-text-size-adjust: auto; caret-color: rgb(212, 212, 213); font-family: -appl=
e-system, &quot;Helvetica Neue&quot;; word-spacing: 1px; -webkit-tap-highlig=
ht-color: rgba(255, 255, 255, 0.25); border-color: rgb(49, 49, 49); color: r=
gb(49, 49, 49);">These are for voltage-frequency binning, and they at least r=
equire reading and interpreting =E2=80=98leakage=E2=80=99 values from efuse,=
 which the mainline generic cpufreq-dt driver does not. So maybe drop the (.=
+)-L[0-9]+ values until we have something in the mainline tree to test them w=
ith?</span><br style=3D"font-size: 16px; -webkit-text-size-adjust: auto; car=
et-color: rgb(212, 212, 213); color: rgb(212, 212, 213); font-family: -apple=
-system, &quot;Helvetica Neue&quot;; word-spacing: 1px; -webkit-tap-highligh=
t-color: rgba(255, 255, 255, 0.25);"><br style=3D"font-size: 16px; -webkit-t=
ext-size-adjust: auto; caret-color: rgb(212, 212, 213); color: rgb(212, 212,=
 213); font-family: -apple-system, &quot;Helvetica Neue&quot;; word-spacing:=
 1px; -webkit-tap-highlight-color: rgba(255, 255, 255, 0.25);"><span style=3D=
"font-size: 16px; -webkit-text-size-adjust: auto; caret-color: rgb(212, 212,=
 213); font-family: -apple-system, &quot;Helvetica Neue&quot;; word-spacing:=
 1px; -webkit-tap-highlight-color: rgba(255, 255, 255, 0.25); border-color: r=
gb(49, 49, 49); color: rgb(49, 49, 49);">Best regards,</span><br style=3D"fo=
nt-size: 16px; -webkit-text-size-adjust: auto; caret-color: rgb(212, 212, 21=
3); color: rgb(212, 212, 213); font-family: -apple-system, &quot;Helvetica N=
eue&quot;; word-spacing: 1px; -webkit-tap-highlight-color: rgba(255, 255, 25=
5, 0.25);"><span style=3D"font-size: 16px; -webkit-text-size-adjust: auto; c=
aret-color: rgb(212, 212, 213); font-family: -apple-system, &quot;Helvetica N=
eue&quot;; word-spacing: 1px; -webkit-tap-highlight-color: rgba(255, 255, 25=
5, 0.25); border-color: rgb(49, 49, 49); color: rgb(49, 49, 49);">Alexey</sp=
an></body></html>=

--Apple-Mail-1A3EB32A-89AF-44A1-B46E-DBECE8974494--
