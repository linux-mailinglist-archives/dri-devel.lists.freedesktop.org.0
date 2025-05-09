Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411EAB13A3
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5488F10EA30;
	Fri,  9 May 2025 12:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l+tIuma4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796710EA48
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:40:39 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54fc36323c5so1481654e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746794438; x=1747399238;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
 b=l+tIuma4gMCCuZk+aPDdr+5b09fHtGy8AAUv+7lyRf7eKlxRCa4+Qk+zwBa+LKQaL0
 K+wDxheD+Tu/DZtoOJtXcD5jf54BP1OuOVEGQwWW1bRBhD68JnPkgoO9v/C1cpbVLP+V
 yUa9QSXrA2l7hmaBXooXwCQ+CecY4ztRsfS0pvmd9KT+GzdVpoIEycxdfvd+e9l5fjDV
 3tj+2nVJESZbgvcBsJyKRvMjKMnL0YhnF8kx+Y+9v6DPNPNcOE9H2Gb6yS9PIfQOTCHr
 d6Yk+TMUxvongzO25uIobHMFpMDf/NUNlyZdkZw5CUwJck6XPlmRHkNDxF9iICy8S4rr
 6Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794438; x=1747399238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
 b=D4Pw5VbzbXWV+xnJPf5KMPmxExFE9Or9+hL2N/ZlR/djxrAeskQFK80FOGD9dpCM+7
 i2C9GTK05/UQyWIECziRv+lOMxKVNMAIJgwgOlCsgOOB1WVHEXRZ308RYfOAfqGwF32U
 +zItWhd7VHte3CGB8Hpo3h3e6vvme4xh11UnWlVLdPoDA2b9XwXzX7sHSTZqad1Er0H7
 Y0SJej4KE8kiRIjqtqhH7QIBtFyCIt1xbxSFD1bR+b2gkIbfDOfUITbOV8STjuzjqaLH
 JIPp8ufcOdgX8o9qqpTCprN9DqH3oiRMHzdI2uj47GOF+7ZNplVvGJPzy0e6+zjJF6OQ
 HwJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMVSBU5ohXT2NmiQYtZMYHJIWYnWks9Nkjl3HTXUpFSztojNTSTS/wXfJE29olpyukFKCSftteOGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw0vnBxVFZZHtcS5QtfRoaO3HlbirFKHdDtepAqsfzhzT9DH/I
 2Dh/RMNFY6+Y10D2BAvQlqwtdfavkbIEficlVQRYAYnOaQrccOIKNpRvx55INAsu3U4AGZCe4lc
 hWn/lZeIsV3fGG2pUpSfOutmX9fqOOfPWo0Q6GQ==
X-Gm-Gg: ASbGnctdV4OXKkvGwCm7akKDPIte+0TOMrPqipCWs3rLRPwScEh/lYd8WpG9LQ9Eiga
 Gxxl0CJv631PDLeUjiCPeYrxr1ZAMJmWYdVTUFTuUNyxqNx5qOnu6OqN3cENyipNmCUicIGRfym
 fgQ/Z7qut2Az+Q51CNRpAeElK+Q2f4ZlhlE0P7CIcbb18DZMPAsEpZgw==
X-Google-Smtp-Source: AGHT+IFdaNoxSwXadZPcFSu3s1a5OECzl0nPHiRim09tz00SJAtaxjhMC0Ms7Db/M0w/VxGQVS1tNGzED+Wljh/WZKI=
X-Received: by 2002:a05:6512:695:b0:549:8b4d:bd47 with SMTP id
 2adb3069b0e04-54fbe407821mr2923115e87.9.1746794438053; Fri, 09 May 2025
 05:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-5-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-5-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 14:40:26 +0200
X-Gm-Features: ATxdqUE7pXlfCMv5H1Kgd5pteF0BctNTVcpk-CgS0AiKblrCPf4IDIEcE-yR17c
Message-ID: <CAMRc=MeYYUc=FKJdArpqv0D2fUt1vyCJiZzjYyN95aMv0-b1WA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpio: fix potential out-of-bound write
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 "Oliver O'Halloran" <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
 linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
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

On Thu, May 8, 2025 at 3:07=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Check that the input size does not exceed the buffer size.
> If a caller write more characters, count is truncated to the max availabl=
e
> space in "simple_write_to_buffer".
> Write a zero termination afterwards.
>
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---

Looks good and does fix an issue that can be easily reproduced with
KASAN enabled. Please fix the issues reported by the build bot and
resend (as a patch separate from the rest of this series). Thanks.

Bartosz
