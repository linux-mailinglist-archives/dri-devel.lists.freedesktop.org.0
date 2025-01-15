Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F158EA12A27
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 18:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19A10E0CD;
	Wed, 15 Jan 2025 17:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TCUFTUox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CCF10E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:52:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e384e3481so58814e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736963488; x=1737568288;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jf0C1EdXFVyiKlR4LIF25BZIuEEFofWyden3/X2nPs=;
 b=TCUFTUoxl0yBbHilJsInV451wEcBiC4zWDbXTZ3swjZ2gHPbYoBve8XpS1KjLqSmes
 Gm1wu2QR234I3jkBHrkgJnaHWa2j/eZjdMLUKZ1Rl1GnR0spWSI7aWSELjW5KYR3qhZs
 aRQJGzIDz70pUV44/svmC/UDysFSe0/w2NoNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736963488; x=1737568288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jf0C1EdXFVyiKlR4LIF25BZIuEEFofWyden3/X2nPs=;
 b=pMDzx33Cm7Q2g3Hm1MhtbnX9czqj99+AJO1d/QXSlzyDurXQmke/ktKl47beO5KUCU
 A/oZppR1sknXQuvFDosBGOWEGWJINxV00brrk+e8uXxCOk9rNcp85GZOD5Z9kA++33a7
 tU88RDUQDCrT/YO1lh5TRULwBmMQOJWVrK+CoLVE7GwvH7SCITpPChsrDJvTO0eiJVEO
 0zEq9F3mX9YzXQcpDOoysOf51Itt7q/CziWQ02RLIpgtzmfxZgHbTTWP6k4iWrRGxFUs
 u8M3LMLJ9VPRJ6A9tKNaLe0n03IVwBX1RTpXJzpGxTQxgpstdp0llJOJzZdjd5KJlc0T
 FVCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyjsymEeRYCHrOpcuZoDg8+qbcom89SyoCGyJCRH94EAV2J3qWROEnJZmC1xpcewxOSzTZMPeojRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjY9QMdipPiexj9PW+AC5xBdonEBNg6Iu6IhxsM8EIKvoiGoD4
 DLJyojzY3Mjx67qb+JC2DL/wZKBz47Tm5mzXHlPwbSmahvaCRktKFzHqIWKi5ZCrx4Nlqt09UHN
 H1g==
X-Gm-Gg: ASbGncvsdiraUIvzwmppRtxvzZDhTzEePS9VY0ohXgyrcANMYOiHfYOGb4HgLpPlWPA
 d/T9TSL8vASm5AZ9D2eWRy2oXFiloP8EZO54rXSr821cnCpYIRxbBGqQXq/yjKlqpcMnF35XKc2
 ePC5Ytz95kRiVqvS2y32r4OVDRKbkeXqyAPALtM3Wzb7TTvA1FLeLpwtyaLWXxuRjGU5WSGGx02
 UwUGs8EIqetu9t7OzKhyPLBCNCEJHO4eEB9JYDXFgCGfPWeDxSn+hk/2bsRhrBjB98Q3jv9E/6d
 r8GKjPqptX7ebXUZaOSSCpFb
X-Google-Smtp-Source: AGHT+IGE9C4cOm4tUY0FVXPq08urXqLG+pNSvpfynFgpPcSyyKbzt5BZeXu1c8JKwEYKqPF3+df0mQ==
X-Received: by 2002:a05:6512:3a83:b0:540:3561:8897 with SMTP id
 2adb3069b0e04-542847fe870mr9916132e87.39.1736963488052; 
 Wed, 15 Jan 2025 09:51:28 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0659sm2094396e87.185.2025.01.15.09.51.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 09:51:27 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-305d843d925so406261fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUp8/gW1rNMvdQR7I+6bjG285Of81wfOeCi+kN9hKeeFaQMm8sN1vt1d1AzzWrxXQ1v1qJO16dY84A=@lists.freedesktop.org
X-Received: by 2002:a05:651c:2222:b0:302:4130:e19d with SMTP id
 38308e7fff4ca-305f4547cffmr107013661fa.9.1736963486784; Wed, 15 Jan 2025
 09:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
 <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
 <224024ea.917c.19469759369.Coremail.andyshrk@163.com>
In-Reply-To: <224024ea.917c.19469759369.Coremail.andyshrk@163.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Jan 2025 09:51:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHvSn1ZLHXvkmsic1xyryYYhnTAFNUeNRYjN-JdR5jRA@mail.gmail.com>
X-Gm-Features: AbW1kvYS7QOi1QL0JUVzaWK3m15h3aewHlNN-MQy9NjVohAFS3Z8GYajDJ3VzB4
Message-ID: <CAD=FV=WHvSn1ZLHXvkmsic1xyryYYhnTAFNUeNRYjN-JdR5jRA@mail.gmail.com>
Subject: Re: Re: Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Wed, Jan 15, 2025 at 2:15=E2=80=AFAM Andy Yan <andyshrk@163.com> wrote:
>
>
> Hi Doug,
>
> =E5=9C=A8 2025-01-15 00:44:41=EF=BC=8C"Doug Anderson" <dianders@chromium.=
org> =E5=86=99=E9=81=93=EF=BC=9A
> >Hi,
> >
> >On Tue, Jan 14, 2025 at 1:05=E2=80=AFAM Andy Yan <andyshrk@163.com> wrot=
e:
> >>
> >>
> >> Hi All,
> >>
> >> At 2025-01-13 18:17:38, "Andy Yan" <andyshrk@163.com> wrote:
> >> >
> >> >Sorry, please don't merge this patch. after further testing,
> >> >I found that there are still some changce, it can't read edid.
> >>
> >> It turns out that we need set hpd-reliable-delay-ms =3D 120 in dts to =
ensure
> >> the right time to access edid.
> >
> >That seems awfully high and feels likely to be a problem with your
> >board design and not the panel. Are you sure HPD is even hooked up
> >properly on your board? Maybe you're missing a pullup/pulldown config
> >somewhere? Would it be better to just specify "no-hpd" and get the
> >full "HPD absent" delay?
> >
> >
> >> So the patch is ok, it is ready for review.
> >>
> >> >
> >> >At 2025-01-13 16:59:54, "Andy Yan" <andyshrk@163.com> wrote:
> >> >>Add an eDP panel entry for BOE NV140FHM-N4Z.
> >> >>
> >> >>No datasheet found for this panel.
> >
> >I seem to be able to find a datasheet for something that calls itself
> >NV140FHM-N4Z, but it might be a different HW version since it has a
> >different ID. In my datasheet, though, "prepare_to_enable" should be
> >80 for this panel, not 200. That matches another nearby panel
> >"NV140WUM-N41". Are you sure you need 200?
>
> I am not sure about that value,
> I searched on the internet, and can't find a datasheet match BOE NV140FHM=
-NZ
> I set this value according: NV140FHM-N41, and then do many tests to see i=
f it has
> any problem.
>
> http://www.tfinno.com/PIC/PIC/20215121628440.pdf
>
> [    3.021700] panel-simple-dp-aux aux-fded0000.edp: Detected BOE NV140FH=
M-NZ (0x0b09)

Thanks for the pointer. I will note that the datasheet there shows:

200ms < T3+T4+T5+T6+T8

This is different than I saw in my datasheet, which said:

T4+T5+T6+T8>80ms

Specifically, your time includes T3 and mine doesn't. That's
important. If you want to add support based on your datasheet then the
200ms should be in `powered_on_to_enable`, not in `prepare_to_enable`.

Said another way, you have:

delay_200_500_e50_p2e200

If you want timings based on your datasheet of a similar product:

delay_200_500_e50_po2e200

If you want timings based on my datasheet of a similar product:

delay_200_500_e50_p2e80

I'll let you pick whichever you feel more comfortable with.

-Doug
