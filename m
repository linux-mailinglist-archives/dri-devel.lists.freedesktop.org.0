Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECCAB2D397
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 07:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B7810E361;
	Wed, 20 Aug 2025 05:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="biz3bKLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BB810E361
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 05:37:02 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3c380aa1ad0so96421f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755668221; x=1756273021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
 b=biz3bKLJFzPXs7azEwH3shNzBKPrXkl25tAm7Z5JHeEz4VDlbGB8g0KkDS+Bt22LoN
 MBPzau/XuVCFsutiMaaqhSW9/X8MYa0I8uZQ5oGiRjSg3gFGr11CATNriif+P1yITxPr
 XmHTbc6+qqEtDi8DyOkaub/PIWWhhFg8DyMcI8JDkz0MhwFr3jUUuaO5IR4ZJvRXmX9t
 seay4pU9a20ICuxpDWdfFR3Tf5UQb+GOux7FNCDsp7JvJgOZWj8x3tnUE7tTeYMfJYGk
 oJBdsQ6gHBPThgQp8D+ek6xR9E+A+jUYmPFQUxD7H68A4BoUROrMlxpeRiTSDbQ9+7U3
 yCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755668221; x=1756273021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
 b=twa4S9IVsCRZvzCaBC3yfl0V3OOw6bcuQH4FYv2XgsGF2LQAhNomVQ8++S2wvs1VDS
 Lk1Vu08gcmb1ddnRADjMzlFVJf1ZuMunEW07WV4RYguvusNADDoHwiTTNhbRvhwIE7rL
 sSXO93+440PTZh9kmXtK5Ee7ik8U9cyeXEFIno6V9ZMuifxR2PqEPMws8EZfm4giiUfA
 KQ4/CqH5vzHEkWaNHOxyI0NtodyWl6p00NGymlaLWLVZI1lDo+4I5bWqFlgxl9W/3KRG
 ihMotJKeJuYroOpM7uN2a4COvptgsy2CO8pCMk0n0cSZgWn7uDqCh5zlfwSAxqKuCuX0
 PsfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnC3/kbrK03PKR7mRvTi9v4MOh5dNqZ92L0q2tGS9AbkT5IV1Vun5HrMIHbCRa1zLBiYLvvjt21ws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUbbO5/q/E5AJYxdSOEXE3Yx8Lu+jiAfIo7eCcCdE5Njw8BUGW
 BhDfx14FwGm0Y3lGQ3xQoYoFNjrZhX71F4rJNOqKmNeHexgQwcjrXzuTqaMmI8KqqgW8uCBaqIz
 RtdQyQT9/Ep+KG2AOlw4GjDcA1mVkQ2M=
X-Gm-Gg: ASbGncu5KKl11xCcZP1wI37LiXao66o6mnQt5OmMdJ/5+NJH9UDI1IdWlPw+KZZgxuR
 6LJcR7lBkQuMxm07N2QyRqGccJXKl1aaTcQ4NiLn4eOcEY9OUjRgT2HFqVpM7XBAQV6Naha0YAG
 zCGlsm+66D7+QOCMCjYKQX3d0Ayx9vGRF0pKn9PBr3twOuSTgIBcDt/+W0v2K1WLVubphKHfQIB
 jxGFV9U1WCEti6W4ZI=
X-Google-Smtp-Source: AGHT+IEV4H6vaBjmF9//jxvsy0f2IPX46V6T4SJQdX0TD7nXqj91eKUZEBuSglg4gtxux4A8T7pdQvDuhbFvozPrkmk=
X-Received: by 2002:a05:6000:2f82:b0:3b8:ffd2:6745 with SMTP id
 ffacd0b85a97d-3c32fe1a0f0mr1054185f8f.44.1755668220666; Tue, 19 Aug 2025
 22:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-5-clamor95@gmail.com>
 <20250819202722.GA1264491-robh@kernel.org>
In-Reply-To: <20250819202722.GA1264491-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 Aug 2025 08:36:49 +0300
X-Gm-Features: Ac12FXwkyBBfR9rShdkWvufqBh2fUhj3y4r2YpvDmS3nJ98Pel0j9Thm5sQ5jzo
Message-ID: <CAPVz0n2CQ14DDFAhAHsxm_-nkDRTrGbBKVRkwzs_2eo0p+6NVw@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org, 
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:2=
7 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:16PM +0300, Svyatoslav Ryhel wrote:
> > Parallel VI interface found in Tegra30 is exactly the same as Tegra20 h=
as.
>
> That's not what the compatible schema says. 'exactly the same' implies a
> fallback to whatever it is exactly the same as.
>

I will reword commit message. Thank you.
