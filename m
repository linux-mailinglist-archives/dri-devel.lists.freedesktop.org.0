Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A4ONs1zkWluiwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 08:20:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A713E368
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 08:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202A310E233;
	Sun, 15 Feb 2026 07:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtUeT0Cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B6B10E233
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 07:20:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso1550867f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 23:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771140039; cv=none;
 d=google.com; s=arc-20240605;
 b=ZfgEdN2gSbe1tLPgPCOYGp2Y1n2r/zFgzw3M+yecOMeDnPeD3rnpErAedYCXCGkcIs
 bOm4vseXAcRQ2whdQuobYFAyvNAEhOpqg2QAAmpaL1Uj/eO4R3erfsvTX5MV20TKnci0
 fSRbOeU7YByJbbaLVEB9AIygUcA/4K+yNq4yuVDkD/DbkE8bLGHJXC74K0DRUn1HdTAh
 Np42lV7yHgfLbyvuOs4mUenc2sKCNJpFotHxZU7E+pLkBFhrhprXXuFZW38UYDl9aZrE
 uboRDMmyjEi3559ud+E4UTp1VUd1HL42wgIclA0JLV5clcKmKgs2uaoiux9+PHgQnymo
 SgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zrl8aWdaaVOiH5RwKkza6kCyl+a95ccxt2cwlIZXNr0=;
 fh=2ANSFcy3wH+8asE9RLjuI/gD50gRb5FGnNN/KYbm7+Y=;
 b=h1wKgl4w453cI9UBkL7hq6jrzfM76P2/djTdIqRQLRUrp4bkBFIWE/tmQyexQN5Vr8
 fb4e3dTJQql9IBvhc+yTV2XJQXMfX/SzH5kAuYvdCygNuygs6EJxEgl1ikGy1TdfiSw3
 IF2+jbha+DAmWZB4XKqTrqjiVcBlEmWgCcEYBqQ0qV7i+HCInIp3aIqJtfmjAJ83YuIs
 9VAC2U1BSSVwNawiRw2JBLlBiopsvfKf2aJkemgz76CiDL3v0/6LFFJf/JOzcbA7Puo5
 Uj9aH5OggV45NUKIwxEOAul4XxfSuKVE43by8EpVhkLqYW0LCS7tSBYNFP3eWw4/vNLs
 Ezmg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771140039; x=1771744839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrl8aWdaaVOiH5RwKkza6kCyl+a95ccxt2cwlIZXNr0=;
 b=JtUeT0CnGK7Ts6SvxucjabjBs3zJb2K565xO4HsKc6BJ4wDb6/qAO1iJB8q1dUkqel
 1xYVGpGO9xkUkEy0bvtLzuNqlIWTM1w0JNompNQNrPUT3Wvye3jA+DngvMqIdYJe6Klj
 LhRPeVW2IDufU5NsJbs1DDGYVDh0k6P3BuilbRSrJK7DUkWGqFXbXD/oxYqsBAUEPEMT
 lBlCbEpeEu5htZMi41AlJSWXd/p1DsCN30MIV+KICSQbcuZi/i5rw/lvxnljGrcqiK6e
 1UkKj8nwcZ6Qx4U+oqFgRNBVk79yXM5RnmYBhysUpRqbZ/wEMLcpT+0L8bfaG/7ZyBVo
 P1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771140039; x=1771744839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zrl8aWdaaVOiH5RwKkza6kCyl+a95ccxt2cwlIZXNr0=;
 b=KoDnyRK2M6StgLuaMyHoz4shQl4D2TkQH4boC7F+UPwqUWhjvLkKJ0mflpcXwwgM9V
 AMHju/a7ys1KwulROKQAd+DEG+gcbxH8npBEXDcvQ2k1iWtbiBJ+BBYVMHzFusUXbk12
 qQ+WYOeOV4hcB8EvZbjyMCWolQ1Y/FiPU+Zjkg8bhmL+uVfWQY+3MupmZ6Lrmxap+8ln
 h3MoCMcayky2fnVTrP4XMXf6VkLlpXgKuRxEwsTX0s01bNJbLyqjk4dGXRHPaZjAJEkb
 IGa3aofsgS/x9C8m6cMP+yGOOzwRy+DUWcTmyIprPhhZ/wAOyf7CnZ293dhlUoKjkHES
 skXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSUOnFgAEUmwD1dkuK9AuLmTVN/pQTbOUEp5JBF4bvq7Wx/PBWZ4IpeK12mmUQQ/cHbsdFNxHsLTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn7NIvJD08ONBj0gac3oX7oKykcaOBz95O85T2bfLAGmfBuQyi
 UrD8FX/XgxtvnUPrzCMKAmSuWnZ+vZ1baWHR/80yvsHvgyIQspKOu2XZK6Sm7vb6NRKdvuQ5zVK
 u1azvkp7xLUy0W4yNW6qWRxm2vuhVO1w=
X-Gm-Gg: AZuq6aJ4cuZzVFrCuf0Ezo9PtNjheYxMBWzbC93flwAmfSMREHmhJMBwAb8T/EaQjVv
 Qh07eWc/ipkgyD4nt/que5CiXEXRjY3yDmeILIIF7R6Qdo2uT8Ygk4s+Cr4zQsblRHqZAbik9OV
 te+sY9ZjU35+lBR5fI9joo0KFvXESK7OQrb4s4enruomND/+/le0lSBnDAAT5JILmrYbigDBCbh
 eTw5AgBCONy2owSozdduvk4hoWGV86Tl4dt9bhFHumfcWsWdDs57k4PEHoz61s9EiLgrFoSKfKD
 CWihLNQj
X-Received: by 2002:a05:6000:1843:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-437978dd2fcmr12170774f8f.25.1771140039258; Sat, 14 Feb 2026
 23:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20251204060627.4727-1-clamor95@gmail.com>
 <20251204060627.4727-4-clamor95@gmail.com>
 <10344542.CDJkKcVGEf@senjougahara>
In-Reply-To: <10344542.CDJkKcVGEf@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 15 Feb 2026 09:20:27 +0200
X-Gm-Features: AaiRm51pnGpJ3XDXTbcvtaOsnyvgv9p2WlCbpT_dV5xTzz18pENDfpMLAaczCh0
Message-ID: <CAPVz0n20hHAf9tFqUNYSO18rvvPbbY5nyVRB-KpiKD2ih=Vfpg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mperttunen@nvidia.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:dianders@chromium.org,m:sam@ravnborg.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,nvidia.com,kernel.org,suse.de,gmail.com,ffwll.ch,chromium.org,ravnborg.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 446A713E368
X-Rspamd-Action: no action

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:15 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, December 4, 2025 3:06=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Adjust panel node in Tegra Note 7 according to the updated schema.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra114-tn7.dts | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/=
dts/nvidia/tegra114-tn7.dts
> > index bfbdb345575a..75fbafb4a872 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> > @@ -43,7 +43,9 @@ panel@0 {
> >                               compatible =3D "lg,ld070wx3-sl01";
> >                               reg =3D <0>;
> >
> > -                             power-supply =3D <&vdd_lcd>;
> > +                             vdd-supply =3D <&avdd_lcd>;
> > +                             vcc-supply =3D <&dvdd_lcd>;
> > +
> >                               backlight =3D <&backlight>;
> >                       };
> >               };
> > @@ -101,11 +103,10 @@ smps45 {
> >                                               regulator-boot-on;
> >                                       };
> >
> > -                                     smps6 {
> > +                                     avdd_lcd: smps6 {
> >                                               regulator-name =3D "va-lc=
d-hv";
> > -                                             regulator-min-microvolt =
=3D <3000000>;
> > -                                             regulator-max-microvolt =
=3D <3000000>;
> > -                                             regulator-always-on;
> > +                                             regulator-min-microvolt =
=3D <3160000>;
> > +                                             regulator-max-microvolt =
=3D <3160000>;
> >                                               regulator-boot-on;
> >                                       };
> >
> > @@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
> >               regulator-boot-on;
> >       };
> >
> > -     vdd_lcd: regulator-lcd {
> > +     dvdd_lcd: regulator-lcd {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "VD_LCD_1V8";
> >               regulator-min-microvolt =3D <1800000>;
> >
>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>

Hi Thierry!

This is the only remaining patch from the original series. May you
please pick it or should I resend it?
