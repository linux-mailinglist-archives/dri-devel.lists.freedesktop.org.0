Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4D1A2C64B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4D210EB34;
	Fri,  7 Feb 2025 14:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TDbS5yAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A1910E327
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:53:04 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7b6f0afda3fso253106885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738939983; x=1739544783; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DV9o9goETRTTHamg5bDzp8IkrA888vE6pS41VeSZ7p4=;
 b=TDbS5yAPRXE0//pRZos2Hl+5lPIjfx7O+prY7dGJZGjtMhwkNywzXEWnQBEN/pRs6N
 fmRoKzKAlfv98r3l99u1677wFW6wkv2DqyqDjPVFT3qQB3Tl1QpenzRSQEzseiOI1zFT
 4bWJjUb4Lnid6C31CdZIZ57+zMulvmGSGYV8Y16Lh52SL5y1lvTsU4hgdS1GjcmUNHcW
 0jTRG9KyuP7JnqAAwppbWNeYln5yPmtWAlFt2E42ULa7ZEmHaKrScD1V9Qs6epGNWIpC
 TajuiwVxB5NtMKOk3AuBwUrehtw+bIhXz8UtILJsyza9AfnneCkwOt3SJyYKBxN16/oG
 pXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738939983; x=1739544783;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DV9o9goETRTTHamg5bDzp8IkrA888vE6pS41VeSZ7p4=;
 b=Lh0sUj7YpRnSP6MeP0bWrpXgZls+ZetYdN6nguTzEzWITmuphaWkatiRApaQbTDhdk
 D/pFQ7cG286vnVHfDAlGtv6y5yYXizm3P7jI199uviD/wv8+iHpNlKf2N+h5wn9zaiKl
 0wgkcz3yITFKyjuH/yHvlBpa6UWTp6uZZnhB6MiyP9x35X84hWhWit0n0VkVYQtqqaAF
 jkS2Mwo71MJPABaDeCW429FoR4h+g9EoGrBGHkZnIJjVk84FiCAz1rvZ0b3sX4VdoZlH
 +MuqbZGUtxZ/V7DVGk/9LY7ZlIFDKbQ0ILSyU25ESIRDA04dv4K2XlA4YBNMScC/eds5
 R9Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEDb3yAIwuv8cRDjiZVHm9pV+LsVIkdALUCskBPfePVs/t7GyZE8zI1oxvcBgEOKavDeyt7A+Mexg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylp1igWqHlzuCBwZUixQ7p1sP/MqeAlLqHM2HwdT3m+QHz7T0J
 ZEqTWIzvWWBp8d63R3h3CClP/7prEp1I2qAtQjF+dTOmO3xx/BD9
X-Gm-Gg: ASbGncsYPp9sLc0ikEiUbaRVVNDp+8lhrcmP2A2OWn6TvV5EBIV4CLxPrMXDM3L5yGi
 sRbsXlwAwUnR+XUdVOgCDXCQwihui064ZWeiWP0K1BFZmPsOh5AHEEjxl/IuJZbNTQ6fXQWaAGV
 W8+cjDv5jJAXX33NKyxy9U/5AA9o/BaoKPh8TCsCxxB4zYYfhRUxFVY1K2q316QDsPEGGy9m5ls
 cwrJgbLrAd4Iv68BeGAlGDjpCyRP0XyX71BXzxqcfzqlMVKikUB5g4melLkWUWTYz7NiUgIdQ9o
 J/jsJXB/R4mCZW9fyRyd5tcUqrlFoS5IVJJpVJx80A==
X-Google-Smtp-Source: AGHT+IGoiiCJ3n/pbgmmOrQnPSxeXqaVOfcRLZYGAumxhDORSDYhkaBsRprw5XL5yC1F996n1NUUEQ==
X-Received: by 2002:a05:620a:4316:b0:7b6:d6e5:ac6e with SMTP id
 af79cd13be357-7c047c1f5f8mr445244085a.4.1738939983070; 
 Fri, 07 Feb 2025 06:53:03 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c041dfb0f7sm197994185a.27.2025.02.07.06.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 06:53:02 -0800 (PST)
Date: Fri, 7 Feb 2025 09:53:00 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, 
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: lanzano.alex@gmail.com
Subject: Maintaining Repaper and MI0283QT
Message-ID: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I saw that Noralf has to unfortunately step down from maintaining the
repaper and mi0283qt drivers. I would be more than happy to maintain
these two if need be. The repaper device is very similar to the
sharp-memory display I currently maintain and I've worked with mi0283qt
displays before.

best regards,
Alex
