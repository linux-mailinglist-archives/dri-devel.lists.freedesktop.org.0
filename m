Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FED94A240
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 09:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A4810E450;
	Wed,  7 Aug 2024 07:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WHBpBF2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADE510E450
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 07:59:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so9669275e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723017555; x=1723622355;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7ZRyH1wZ8UABMYeIFk4r7hWP8ATe10mkdDCBs15OCtE=;
 b=WHBpBF2uZ2yiYqC/DZ9wkfvRmgLmceNEHAAfcQiJcuAhy2F0/qLHe4M05WeVVnDxEP
 85iWhXxbm9yj3ydsnlC35SmxwGKi6A+cHep+gObdNerIZ8L2uLnC3xE5X9q3i0Ty22YH
 OQ2MSoJUIPDLovEZgNUZ+cjmtETsArgrRTY4E+EEoQx+bw49ifp9ZLjv2FRDO023Y299
 smqMmof3TJw4NwCeUQdhphXMox2nV+pmNglEmWfkFPrxuJbHVlhqD0H8PTDfDxNSnJxm
 uY0cLEA7dRbPfIiZqsq/erc6BVzPrATW7UheGF3uLR20GKx9ssekv+FFa3s8+Ie2z3UD
 bdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723017555; x=1723622355;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ZRyH1wZ8UABMYeIFk4r7hWP8ATe10mkdDCBs15OCtE=;
 b=ez+xFwFFJbThmwyPTE2xpsxZNPLxFKCq0qsu51nfA9ZzLlwCqXP6gs9BF/Zt1plN/3
 cq1BT45cBBcjQ5HJ3AEJ0g7qQXkbkysOj9KOzWc5AXER47Bu+3JheFtv2cRhcXb9/f87
 Z2yiQidlPGHigXbC3mQo30INrpQ7Bsh2Q7bZCRwgFj9VGQ0BtJHAS7m+5EIIw6zM+vw4
 036mEIEvzH7+RF3i8TjnamjN0oeMLXpLKY8B9//C2/chfTjD6WGB9eS45FVCbOGw9IFm
 LQkKc3kNqkrS3JeFgqwnRsI61oY9R94BXe/7HWevgSo4paZNz5SJvUauqwkje8dP1J0I
 3YEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN7B22x7RerqvM6LcOnWeKv7XfF4rXxORLedzIok8Akq6nonnrBpanCsudwPbCI+jXfTUhJs6yE6Ookfcva6VJuxtGdkDatWCq6+huOTJi
X-Gm-Message-State: AOJu0YxvQxvqAB8UwoXKSboLAKEPpFncwfH0WGgTt7hq2xR03mIA3Gzm
 EsPcIyL6g7tLC0t/TIreRRCR3UknnA9ed8uhOA25BssCwU+YACL7GtJkVuOwyXg=
X-Google-Smtp-Source: AGHT+IEWEBDIMErakCRpWAkvv/5YGsQlzUNSq19w3HIbKjzjEPjUi7r2MOgifYzImGGtUTOKZi13Ag==
X-Received: by 2002:a05:600c:4ed1:b0:427:ff7a:794 with SMTP id
 5b1f17b1804b1-428e6af1d48mr117202915e9.4.1723017554278; 
 Wed, 07 Aug 2024 00:59:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429057966ffsm17007505e9.3.2024.08.07.00.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 00:59:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Kevin Hilman
 <khilman@baylibre.com>,  dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] drm/meson: dw-hdmi: use generic clock helpers
In-Reply-To: <CAFBinCCW9bNtHLRaJNBvqLXN_vCm4mFSVhhV6OcrUb+j-0x3kg@mail.gmail.com>
 (Martin Blumenstingl's message of "Tue, 6 Aug 2024 22:28:10 +0200")
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-4-jbrunet@baylibre.com>
 <CAFBinCCW9bNtHLRaJNBvqLXN_vCm4mFSVhhV6OcrUb+j-0x3kg@mail.gmail.com>
Date: Wed, 07 Aug 2024 09:59:13 +0200
Message-ID: <1jed70zru6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue 06 Aug 2024 at 22:28, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
>>
>> The Amlogic HDMI phy driver is not doing anything with the clocks
>> besides enabling on probe. CCF provides generic helpers to do that.
>>
>> Use the generic clock helpers rather than using a custom one to get and
>> enable clocks.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> note to self: even if we need to manage one of the clocks specifically
> we can do it with clk_bulk_data

Honestly I've gone for bulk variant only because calling
devm_clk_get_enabled() 3 times in row and do nothing with the clocks
looks odd.

In I had to do something specific with a clock later on, personnaly I
would back to plain 'struct clk' and use devm_clk_get_enabled()

--=20
Jerome
