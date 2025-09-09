Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D04B50141
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FC410E7A8;
	Tue,  9 Sep 2025 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uTNMEaJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0746810E605
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 02:28:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so2470290f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757384906; x=1757989706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJBOD8IkKU8HrE1Azq7n6vDJNYZogNLJnaPVYbnTp3Y=;
 b=uTNMEaJmdior3WUxics1zTMxqZ8hS8LVajvH5RxyrV8/NTT6u5cjup+zf0w3FHZzLx
 YIZzzPXpV5Qkg1GD2c6q0pf+lu3cdAyQXr/gl6SP+0MS5JYbqhH5o6oYKUZEGaJAvkFz
 2AX/Jr/javRZduUispJbCoW71PALwwM13t5i9jNhkC5y+QSp0u8ADia34Jgtm2jc5ebh
 202tJ4BFLRkBNHP3ByOHjcOlyt+YumF3MHl9HdanQPGnmJLvQflIvYUoIKUO+JMS9BLZ
 NZtUd16OjN8EPCCsyTkb3yRngB9OGJxuk1pZHCiEXfUcNSV7+WRj4U7J9iRFAP2vOzcJ
 T9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757384906; x=1757989706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJBOD8IkKU8HrE1Azq7n6vDJNYZogNLJnaPVYbnTp3Y=;
 b=vYHF0szO9br1PxEhNZ613gX4BmSCS4dYPnwMYsecj77n+YJkTBhmdNRewTwdf0ypHf
 WFQJayPwedC/QR/2PKA8ZFLWRATO5bPvLZiG0ibGrDBr8UfLAw3jUrFgV2e1rX1nNvGx
 SZY5olSsZvB8sW8X/kdhLrxUFyTjHcRrQtGA1uwjU2yKZfhVklZBO4IceCEwcj68KEmb
 o1fgShVTCxeJmt+TB3x1ffmBBPxqSCMPbVtpuaIfwaOwpyNh553PTCMf3Wxeym4MLCsO
 Gqhh0tfJcoqBKQs8XPEIHqNrJotabZlYO5n/t9gHmIBzIpX8PreTvdTzHFduy0+kqmJr
 DWhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKJYFPKtFRh7pK6HPXNnVIh8iX9RiEBD+o4if3JMB0kvP1W091D8YnIeyXAPfVkxNQGNvThrepAWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymCyz7C4XeCv5Fn9S2Ye6PnK4etdLdRyFqBPOBUiljyYLKjRY6
 RQ/An1jfBwhYZQcIVydt6vPaF1BUaeHABwDfwLfDCLyyWlo1hK3FnqfAJiGf+cyQiUoxqaQvHYk
 xlxLGDZ3xd8AKXymHDU/J92q2vON2O7DWY2LmNQ33Bg==
X-Gm-Gg: ASbGncsWxpKpVQ9s4/vRNZnQYLtFelomoWzxL/3BcVsq1O8V9ZAItv6DkvA5GbCzZ9/
 dEHHAAi2hkSlS1AbgEVEHapKNurT/+5aEjqCy7ckhMnWxPP30+ip7ntgyIxi5Wr/irfZSt3IvT2
 NVabkBVX1k2DgKgSne/u9rf++L/s3aGlmRRMpy/wDSh/PWJgAUL3GJ3sQK4hxTGP1EetQdJxjxQ
 vE2f/av/+kVtNYsbw==
X-Google-Smtp-Source: AGHT+IHwYp6SYclYWSmS86XGBCa6NT9PSPqdtZTxIkstcBCzdrCYANuM1MAFZPIHdfMtTnGEKjXegHkRsnzEOQniwLY=
X-Received: by 2002:a05:6000:4022:b0:3db:b975:dba with SMTP id
 ffacd0b85a97d-3e64bfd7047mr7586750f8f.63.1757384906453; Mon, 08 Sep 2025
 19:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250908063732.764289-1-wuzhongtian@huaqin.corp-partner.google.com>
 <CAD=FV=U5CYQ8x7jya6y=eqEY4Zi87unrRTKfexEahVeBXMD5yA@mail.gmail.com>
In-Reply-To: <CAD=FV=U5CYQ8x7jya6y=eqEY4Zi87unrRTKfexEahVeBXMD5yA@mail.gmail.com>
From: zhongtian wu <wuzhongtian@huaqin.corp-partner.google.com>
Date: Tue, 9 Sep 2025 10:28:15 +0800
X-Gm-Features: AS18NWCuU7K2tEuEd2T-9GEjCvDBJJZJYM3vHjpBXuI_N6ttFf3FBPcENRzWUMY
Message-ID: <CAJUL2LNw6y2-za2ghLO3LYynbTf0KuR4_owJqSb8Ec8FJ61WzQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel-edp: Add 4 more panels needed by mt8189
 Chromebooks
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 09 Sep 2025 15:29:21 +0000
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

Hi Doug,

I'm very sorry for my incorrect operation and thank you for your
support and corrections.

On Tue, Sep 9, 2025 at 12:01=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Sep 7, 2025 at 11:37=E2=80=AFPM Zhongtian Wu
> <wuzhongtian@huaqin.corp-partner.google.com> wrote:
> >
> > Add a few generic edp panels used by mt8189 chromebooks. For
> > BOE-NV140WUM-N44 , the enable timing required 80ms. For
> > CSW-MNE007QB3-1, the hpd_absent timing rquired 80ms, the enable timing
> > required 50ms, the disable timing required 50ms. For CSW-MNE007QS3-6,
> > the enable timing required 50ms. For CMN-N140JCA-ELK, the enable timing
> > required 80ms and disable timing required 50ms.
> >
> > BOE NV140WUM-N44 V8.2
> > edid-decode (hex):
> >
> > 00 ff ff ff ff ff ff 00 09 e5 6a 0a 00 00 00 00
> > 2e 20 01 04 a5 1e 13 78 03 fb f5 96 5d 5a 91 29
> > 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 61 40 80 04 71 b0 3c 40 30 20
> > 36 00 2d bc 10 00 00 1a 81 33 80 04 71 b0 3c 40
> > 30 20 36 00 2d bc 10 00 00 1a 00 00 00 fd 00 28
> > 3c 4c 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> > 00 4e 56 31 34 30 57 55 4d 2d 4e 34 34 0a 01 7c
> >
> > 02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06
> >
> > CSW MNE007QB3-1:
> > edid-decode (hex):
> >
> > 00 ff ff ff ff ff ff 00 0e 77 6e 14 00 00 00 00
> > 00 23 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
> > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
> > 36 00 2d bc 10 00 00 18 2b 30 80 a0 70 b0 23 40
> > 30 20 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28
> > 3c 4a 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fc
> > 00 4d 4e 45 30 30 37 51 42 33 2d 31 0a 20 01 69
> >
> > 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> > 00 3d 8a 54 cd a4 99 66 62 0f 02 45 54 40 5e 40
> > 5e 00 44 12 78 2e 00 06 00 44 40 5e 40 5e 81 00
> > 20 74 1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c
> > 00 00 00 00 8d 00 e3 05 04 00 e6 06 01 00 60 60
> > ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 68 90
> >
> > CSW MNE007QS3-6:
> > edid-decode (hex):
> >
> > 00 ff ff ff ff ff ff 00 0e 77 3f 14 00 00 00 00
> > 00 22 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
> > 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
> > 36 00 2e bd 10 00 00 1a 88 31 80 c8 70 b0 2e 40
> > 30 20 36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28
> > 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fc
> > 00 4d 4e 45 30 30 37 51 53 33 2d 36 0a 20 01 80
> >
> > 70 20 79 02 00 81 00 14 74 1a 00 00 03 01 28 3c
> > 00 00 00 00 00 00 3c 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e 90
> >
> > CMN N140JCA-ELK:
> > edid-decode (hex):
> >
> > 00 ff ff ff ff ff ff 00 0d ae 41 14 00 00 00 00
> > 25 21 01 04 a5 1e 13 78 03 28 65 97 59 54 8e 27
> > 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
> > a6 00 2d bc 10 00 00 18 35 30 80 a0 70 b0 24 40
> > 30 20 a6 00 2d bc 10 00 00 18 00 00 00 fd 00 28
> > 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> > 00 4e 31 34 30 4a 43 41 2d 45 4c 4b 0a 20 01 14
> >
> > 02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com=
>
>
> Note that I hadn't actually provided my Reviewed-by tag on your
> previous version, so you shouldn't have included it here. Even if I
> responded to the patch, the Reviewed-by tag means that I've happy with
> it and I did not provide that on your previous version.
>
> ...in this particular case it turns out that I _am_ happy with the
> current version, but you should have still let me say that and not
> added the tag yourself...
>
> ...hmmm, and then I tried to apply your patch and it didn't apply
> cleanly. :( Please post your patches for edp-panel against
> drm-misc-next. This makes it so I don't need to manually fix things
> up... I've fixed it up myself this time, but next time I'll ask you to
> send a new version.
>
> In any case, I've gone ahead and pushed it to drm-misc-next:
>
>
> [1/1] drm/panel-edp: Add 4 more panels needed by mt8189 Chromebooks
>       commit: 490b30fbaca2abbd6afa8bdc7e2df329b5d82412
