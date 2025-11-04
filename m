Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE76C328FB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5950710E660;
	Tue,  4 Nov 2025 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bV0OzFVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A9B10E660
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:12:25 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3717780ea70so64760291fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279944; x=1762884744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfboT1HRbq+3rQiXHdhZQOYYLi1wTFtTVKTz7vRyT3Q=;
 b=bV0OzFVI15z4+hgaWkMB6UF/QCnlKNxcIgOeFYBCl7uwIlEe8G2Cn/PtfruJZlshdp
 iRFhJVpBIg8sPEfORCNHpfR8dXNPMC8zsBl8ro5IKmKbcUqGMj3mOqch4fqMbJ0EQwTo
 O+/xUk7BRHgG23J8lBfv3U/wF0mGFqOcXD2CXKJHPSnkCR7ilHus8aFW3OflcCRW1Wdy
 C5NrXvNugCYd9CfHT5aYDIU0ZDq4qoT1CA8cI14+w5nLo+9r1YrbP3rmrWb1nB95/0wn
 qIyEZKv8dNjJeHcAx4SRTTCIjbnTnoPS+goZ8gK9DiqmwVgmP4Klg1cAONWN2zB8oePB
 eSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279944; x=1762884744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfboT1HRbq+3rQiXHdhZQOYYLi1wTFtTVKTz7vRyT3Q=;
 b=AtwT/6b2jjORl5Z4m8T5DBDDjuyNypQZyop9Fjr/cSOcHcbAPu8wP4DzkPxceElMD6
 fm8NM6Wix1E7rgou1FsA+wZLmKqk4CCzIyODLijFb5XDylRZmHxB0IOBi3wkq1Ic4yhZ
 9YQLduLprKtwpCoW+gI83Gowf1NhFeGx0oY1VKoAQrtv89Or5HFt0BZnYCDBI/GmrsrF
 TUNOnASgEE+rCuuUjUI7KkLDMqaiwpXI4u4BH60cq79YJSlMTutMXuLg7HUDW/C1omDx
 OyuBBckaeKBjd7wrHmHHR05fIgd5UBXRN2dZrBT9AZAhfXSjt6Ji/gfE6FaWOVI2N8FT
 HdoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9vu9dXupWbweCVU/Grz6Svku532eX+w4KOk7//HcIoKCycGZfEA1ve9faXxXWWooi4c6gIbqR4yM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmuBcjha0CulJm1nfUkof5vevJZCOKSTIec705n7OijvRZAjHX
 mUZhTeUpsI2C5m3zAriWdu1mxrxLiT053KdVmAT4qAts2qg5ySzchB2pbD3WRnBoDFokrRHbYt/
 tceoxdg6DsNkEJQhO5XQ/ePVo7ddgBzE=
X-Gm-Gg: ASbGncs6NfzupLB+YOTuTWAl1oCUfhnGwtYxwOI0SbLsI2knVBl5o3llzDchoFd3jrM
 n7jonHKO4oNindTsfD+VyS59w0brSRFA1A6WV2R4xVikfjjymQSWLuPzrTz0aliYSCk9aVKmGXO
 oJn7fgV+Z23gtw/7q/HMlVIwF01OoG/2xsxs4dbk7N7UKkTuwHOrjixOfBrtkHkg5Cv0gtWUQMx
 0cBWe+YlgGaY3fHVZcva7yXRLpPlYEwyhDQG+gWJ1XbhsJmdJ4wcH2D31ma
X-Google-Smtp-Source: AGHT+IGPRcVYUFkbfND1yCrXsYjPphzvBXM9kevVuqhVKPN4rVG7BAHQZtqPWdFIdx6QTyf/wx86XLa5cCF/q3DF/D4=
X-Received: by 2002:a05:651c:25da:20b0:378:e88e:70b7 with SMTP id
 38308e7fff4ca-37a513db58bmr649531fa.8.1762279943566; Tue, 04 Nov 2025
 10:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
In-Reply-To: <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 4 Nov 2025 12:12:11 -0600
X-Gm-Features: AWmQ_bndq3GXj9nT0T7kbDH5M6YrNLEoNzE-jIY8SE3xqTqpn3-DYrXuXrQFrrc
Message-ID: <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> > On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay wr=
ote:
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > Without the cmu, nvdisplay will display colors that are notably dar=
ker
> > > > than intended. The vendor bootloader and the downstream display dri=
ver
> > > > enable the cmu and sets a sRGB table. Loading that table here resul=
ts in
> > > > the intended colors.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/dc.h  |  13 +++
> > > >  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++++=
++++++++++++
> > > >  2 files changed, 219 insertions(+)
> > >
> > > What does "darker than intended" mean? Who defines the intention? How=
 do
> > > we know what the intention is? What this patch ultimately seems to be
> > > doing is define sRGB to be the default colorspace. Is that always the
> > > right default choice? What if people want to specify a different
> > > colorspace?
> >
> > I reported this issue almost a month ago. See kernel lore [0] and
> > freedesktop issue [1]. The pictures in the latter show what nvdisplay
> > looks like right now. It's nigh unusably dark. When booted into
> > Android with a tv launcher that has a black background, as is default
> > for LineageOS, it is really hard to read anything. Is it correct as a
> > default? Well, cboot hardcodes this, so... presumably? It would be
> > more ideal to expose this and csc to userspace, but I'm not sure if
> > drm has a standardized interface for that or if tegra would have to
> > make something vendor specific. I think that would be a separate
> > change concept compared to setting this default, though.
>
> The reason I'm asking is because I don't recall ever seeing "broken"
> colors like you do. So I suspect that this may also be related to what
> display is connected, or the mode that we're setting. It could perhaps
> also be related to what infoframes we're sending and how these are
> supported/interpreted by the attached display.
>
> All of that is to say that maybe this looks broken on the particular
> setup that you have but may works fine on other setups. Changing the
> default may fix your setup and break others.

Do you have a device set up so you can check? Or does the regression
test bench have a display that can be forwarded?

My current setup is a rack of units plugged via hdmi to a kvm which is
then plugged to a pikvm. I also observed this issue before I had this
setup, plugged directly to a 1080p monitor. I have not checked
displayport. I can cycle through a couple other displays without this
patch to see if I get any other result. I am fairly certain I have
consistently seen this issue since I started trying to work with
tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work to
allow for a bisect.

I am in contact with one other person with a tx2 devkit, who
replicated the issue when I asked. Who plans to reply to this thread
with setup info later.

Aaron
