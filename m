Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCuEIb9LlGm/CAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:06:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A314B285
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8126710E034;
	Tue, 17 Feb 2026 11:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gfzXJhas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFCE10E034
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 11:06:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-65c01595082so2498539a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 03:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771326394; x=1771931194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8lEc5xzFe2JfewkM3XcVcd3+y1q4x0K1q5cHfsFpVx4=;
 b=gfzXJhasCoJiXof9JYyR9MJAA1YEPDFDiLbJPPGPnIEM7yyrArtdiVyDkBFlLCFis1
 qDHpIatj46/YXQ/QGTzI1QNd2jHyDhi4FM9TbzoFVwEwXzlUz5EGGopZnm1c1/9LFglY
 3qECOcNkoBN0f473W4+OT/d+igsZ/9u946L5sVQI8y7OADp5knW6Iezn48xzspDrmgec
 FC4ABX/EvtJft/DK3eoTofGbOu09uSv+u60EKmneXlqWVN2g4vPlZ55VLIuqvbBzAECf
 pi02l/CgXpioH31qhX4QGx5u5PABcEwgMrTw397cfRO0at8LyCyp4iTQWXWMysm5moci
 kDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771326394; x=1771931194;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8lEc5xzFe2JfewkM3XcVcd3+y1q4x0K1q5cHfsFpVx4=;
 b=kGKu/20SVGyzsfEQNeoyqQ0HD7mHiABkTZm/xfra4+wuL4A4GPLLpH/aOLxc7GVazB
 8s+3woBtpjY72w0qxENlJFv5gZnp7rVca/JyNxQYX91uuTC/IsZYlucDOFOOdBdD9IPK
 8ykIMA5XvFdUH1kEQakz9n4VzQi5tzTavkcJt4fMegk2GKI4q5lHhwQjJeqlm8PUrNrs
 AYPJR1ynasmKs6+ALC0huw//mMXxaD7psQaLMeg9my+3jhXrU7BoBiq0EcbGOAkVVIrY
 ZniCP/QaoppGlNZFdX5iIRjRhMJMWx14WlYPSElkcgtc/V6VDu5FC6BsuuYh4W7bi5mc
 Qr8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3C17bEMH21UcTAjdV4pcnh8GrjAW+jICtqril1vdA9eumHDWjLF7Iw+Wcm9QhlfXsd0n5drCgJ04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFKXOcR2LgIWxb0BHzuim22iEhnMaHTRCod6otce+PsWg4+40B
 xILZvF4AfL4YeIXuT+NknAQ46QqVq/uzRP6r6VNX1cka1mPrs6X7geRX
X-Gm-Gg: AZuq6aIdR0+Yp92KwU/Nc4Yw2eafIs5zagEU+Xg0RBM4xJa9/PM5VSiZIQFd5ItyPwl
 bDXpN350emHMmwaptrjMUJLk+2ZbyTXgxNxCItMidGhrKQobM4+MMWwIGYDV8qOEZgxsDNyMDzF
 wrOsGTuZdIUl/CaY81FoehGYeSUfrtQG5ijWH4kxfqJDaMde9nKh8c4Q2nztxbZst+k5GhXc8Qg
 JdvmPnG4fCffZO57Gb7ek4tLNf/r6TvJiZ2erqKIEzyt9osNQM1ctPdK4wbxoMjzujYZDJyNsIR
 BPTYJYEkPQOWozIRZbw8TBS4Nw6Vz2vuz3gPDWDUKvnvtZUzE2ctTJK+AZDjkV0SPLNfFVklMqn
 w034tNlpVzf7q25dY7yq7qlIIJl2h4PrzrG6sqitiHiunnWhnz0OJwjzmefXFlxLLOc2uNIRFw+
 AE2HwSE5T6bWLJgFAboRU61LxAjbC2Uhw=
X-Received: by 2002:a05:6402:40cc:b0:65c:972:707f with SMTP id
 4fb4d7f45d1cf-65c0972752dmr3331588a12.10.1771326393840; 
 Tue, 17 Feb 2026 03:06:33 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.63.129])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3f137dsm2248870a12.27.2026.02.17.03.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:06:33 -0800 (PST)
Date: Tue, 17 Feb 2026 13:06:32 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
User-Agent: K-9 Mail for Android
In-Reply-To: <aZRCamxP5JfS8OsO@orome>
References: <20251204060627.4727-1-clamor95@gmail.com>
 <20251204060627.4727-4-clamor95@gmail.com> <10344542.CDJkKcVGEf@senjougahara>
 <CAPVz0n20hHAf9tFqUNYSO18rvvPbbY5nyVRB-KpiKD2ih=Vfpg@mail.gmail.com>
 <aZRCamxP5JfS8OsO@orome>
Message-ID: <58C37053-93EF-4EDB-80E3-C066DD6E3964@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:thierry.reding@gmail.com,m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mperttunen@nvidia.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:dianders@chromium.org,m:sam@ravnborg.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,linux.intel.com,nvidia.com,kernel.org,suse.de,ffwll.ch,chromium.org,ravnborg.org,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E40A314B285
X-Rspamd-Action: no action



17 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 12:28:06 GM=
T+02:00, Thierry Reding <thierry=2Ereding@kernel=2Eorg> =D0=BF=D0=B8=D1=88=
=D0=B5:
>On Sun, Feb 15, 2026 at 09:20:27AM +0200, Svyatoslav Ryhel wrote:
>> =D1=87=D1=82, 15 =D1=81=D1=96=D1=87=2E 2026=E2=80=AF=D1=80=2E =D0=BE 09=
:15 Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5:
>> >
>> > On Thursday, December 4, 2025 3:06=E2=80=AFPM Svyatoslav Ryhel wrote:
>> > > Adjust panel node in Tegra Note 7 according to the updated schema=
=2E
>> > >
>> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> > > ---
>> > >  arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts | 13 +++++++------
>> > >  1 file changed, 7 insertions(+), 6 deletions(-)
>> > >
>> > > diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts b/arch/arm=
/boot/dts/nvidia/tegra114-tn7=2Edts
>> > > index bfbdb345575a=2E=2E75fbafb4a872 100644
>> > > --- a/arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts
>> > > +++ b/arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts
>> > > @@ -43,7 +43,9 @@ panel@0 {
>> > >                               compatible =3D "lg,ld070wx3-sl01";
>> > >                               reg =3D <0>;
>> > >
>> > > -                             power-supply =3D <&vdd_lcd>;
>> > > +                             vdd-supply =3D <&avdd_lcd>;
>> > > +                             vcc-supply =3D <&dvdd_lcd>;
>> > > +
>> > >                               backlight =3D <&backlight>;
>> > >                       };
>> > >               };
>> > > @@ -101,11 +103,10 @@ smps45 {
>> > >                                               regulator-boot-on;
>> > >                                       };
>> > >
>> > > -                                     smps6 {
>> > > +                                     avdd_lcd: smps6 {
>> > >                                               regulator-name =3D "v=
a-lcd-hv";
>> > > -                                             regulator-min-microvo=
lt =3D <3000000>;
>> > > -                                             regulator-max-microvo=
lt =3D <3000000>;
>> > > -                                             regulator-always-on;
>> > > +                                             regulator-min-microvo=
lt =3D <3160000>;
>> > > +                                             regulator-max-microvo=
lt =3D <3160000>;
>> > >                                               regulator-boot-on;
>> > >                                       };
>> > >
>> > > @@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
>> > >               regulator-boot-on;
>> > >       };
>> > >
>> > > -     vdd_lcd: regulator-lcd {
>> > > +     dvdd_lcd: regulator-lcd {
>> > >               compatible =3D "regulator-fixed";
>> > >               regulator-name =3D "VD_LCD_1V8";
>> > >               regulator-min-microvolt =3D <1800000>;
>> > >
>> >
>> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia=2Ecom>
>> >
>>=20
>> Hi Thierry!
>>=20
>> This is the only remaining patch from the original series=2E May you
>> please pick it or should I resend it?
>
>No need to resend=2E I can pick it up, but it won't show up in linux-next
>until after the merge window closes=2E
>

Fine by me, thank you!

>Thierry
