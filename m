Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8797ABAB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 08:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6381C10E421;
	Tue, 17 Sep 2024 06:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4Z6WQ5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191AD10E089
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 15:46:20 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso10618100a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726501578; x=1727106378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CzBVpjhXKUoL0xgLw1etM9xeyX7HCpA0ArG5AFuON5A=;
 b=Q4Z6WQ5/ptIwHBygEQt+Pkl6RIHaMhL8r0d2BW7gOJv20ai4LDnYI4qnQ+qMAN8ZHW
 Q8ZdjqTDGoj9p6NlaiDkrhcqUOXb+pvjzw380f/npb8LiVfaqlyUi6I6DdRLDH3EyshM
 OywhzfqbdilZqAHI8uJelNGytxHi8RU8FfsNQMrz99yVa9NCU9aGlwFsVsQGk2A1DcZ8
 WaqK6GsCb7ktRfwuErzQ2IKHng6YfQCkl89YY8keZxYH2xwvt6dfZ9X9IiJzxhtGxPez
 YUmmuOkECcJ8zq57G8osdTEoP+nCtATe04tBzejdveGc2CmgFzxBO0MTRxEet9BTt6ZG
 QTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726501578; x=1727106378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CzBVpjhXKUoL0xgLw1etM9xeyX7HCpA0ArG5AFuON5A=;
 b=EssSIHFNwrsr+AgQvJl8N6FFxO7mVdcZMlkbcnp8ahVSmGXc+sa2ea3DBaBhGK41YA
 vSn6Eb/TZilqFfJ2LNyDjPIezL+PRXHXBsBYHvwTozt1LIzxCb9vC2anUf0Jb5xWOr7s
 MguIy7tq71Kk0w0vzYIkJEtR1YJeYsxseYVoPZXH3qPOX7084iHKk6MuaAHk/JWNtQUU
 jZbpUp0AaM2MFE7hWgzwsMoAQxUi2rr/qYbxYtXMv1KbG7xbavmoxKfihXaRHGktpAtJ
 PHU3rGEvkiEV/cjUXcokkFubSkPRM4OJdXcRM9zR4t5LAxMj+PLC5xMTOfDzRzZWmQqk
 I0cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/xF59DMvCeJk3yI1ch9BjkAuh/k2xraR2wLaaftnkO1tk0uh7OEY074tyEz56D68cFuMPgqWFxvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzT5TJ/x7K8h8Q/hDoHHl7Pu1yn78ycYHb/EAWxECgZyS0+riI
 qsXAet6JjEZMMFcl9kESskQZnY+wsC3A7Ompu+2A6hG91/O2PG50nDetuInf/TAUgPrRk3rHD7c
 5sTimwjPg8LwX9xbkjIy/ATeqW2U=
X-Google-Smtp-Source: AGHT+IFitERibNlCs69b508h8u87CaCZ1BGQnopfANJdJvpfiAa/nXWo8c9qjy6z7F1P46s7d1u6H27Kfm1EdACCW3U=
X-Received: by 2002:a05:6402:42c2:b0:5c4:24ce:4f8 with SMTP id
 4fb4d7f45d1cf-5c424ce075fmr9998636a12.12.1726501578015; Mon, 16 Sep 2024
 08:46:18 -0700 (PDT)
MIME-Version: 1.0
From: YJ Lin <0xff07@gmail.com>
Date: Mon, 16 Sep 2024 23:46:07 +0800
Message-ID: <CAHhBtNqB=jQTnY1eu8or=toczr93ehUeuBkAZ7axFPr4ZHPjCQ@mail.gmail.com>
Subject: Intend to work on the DRM_* logging macro conversion
To: sean@poorly.run, rodrigosiqueiramelo@gmail.com, mairacanal@riseup.net, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, YJ Lin <0xff07@gmail.com>
Cc: ricardo@marliere.net, skhan@linuxfoundation.org, 
 Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 17 Sep 2024 06:50:48 +0000
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

Hi Sean and the vkms maintainers:

I=E2=80=99m Leo, currently one of the mentees of the Linux Kernel Bug Fixin=
g
Program 2024 Summer Unpaid[1]. I saw an item on the DRM TODO list
regarding "Convert logging to drm_* functions with drm_device
parameter"[2]. It also suggests reaching out to the driver maintainers
beforehand. So I=E2=80=99d like to understand your opinions toward making t=
his
conversion on the vkms driver, and I=E2=80=99d like to start working on it =
if
you consider it suitable. Thank you!

(Also, do feel free to share tips for DRM and kernel development in general=
.)

Best,
Leo

[1] https://mentorship.lfx.linuxfoundation.org/project/9c354ea7-f08e-4d85-a=
93d-94d2a3cb30c8
[2] https://www.kernel.org/doc/html/latest/gpu/todo.html#convert-logging-to=
-drm-functions-with-drm-device-parameter
