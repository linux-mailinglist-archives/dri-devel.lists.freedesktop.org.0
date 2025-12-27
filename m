Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92486CDFD78
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA29E10E287;
	Sat, 27 Dec 2025 14:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VcSjalXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0FE10E287
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 14:23:50 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so1611048066b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 06:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766845429; x=1767450229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
 b=VcSjalXu9oEnBkMjCuFdr6f9L2ZppPy2cA1NOrTwqVz5Cg11rCtlw0GYHXqbC4i9ix
 wV5Vo9kOqPiNl6/rjuZ/9u9OFq0pBItqSY7KNJpv1uKM9PxUlAVdHJkp5/gn0GTdt+Ev
 MKu16TXurg4BJdxusnaimqaI3A+23zfsJigBgPWBt2XaHJ9n7BlCIYlyT5DiQBlBJ/fs
 OAcBs14fvdvWLnYcS6d5bEZX4nnz2bU+5IIbSJMCmupvzIe7rzXw5yMD99RGE5KLr+h6
 5FVNvIQJm1m34zml+CKuq0mpM7F9ZYxpZqF7K5/NR2iW/sPMf3j8+tHJ7uUWV+Hjf034
 LR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766845429; x=1767450229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
 b=Q51ne5LxrrNgmZ+azCCZ3kq3JMZFRTV4ipEZ/SsOc1NiFO4Rz68XKEFntIr6RPWJzR
 LEzdXLMSLjoLeM1YWffFm0LrJFH6jMlbzZF9rBkJzGPh4WPM1sPI0gi6KINXNCCmIe9k
 yXpS7/JZG/LOzgZFkrhEaybud0j5tcgz6LSKCkxTJ57B30eGmwFvW5DIbg+nzGyZxNNb
 7d+nTCHIPB1ORm2n75ULeB3R7IQ02YrVZGIRktOM/0hDtpfPtrwGj5FnVTmvB8FoMm0W
 HHRlBCT2Cdrd34/kkB8T8jxMP1Q5p9ma5fVnlDrQV6NQOcKzgS0OAPH6DsfxqGPNM0CS
 /QGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI9PaNSTrhX0jTusA2R8V8guycibBuMBKNxOv2eD8fdZk+YHnXW2fycHmO9uZhkKY2jXypwVa0dFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKD6XH+mn1wbOhJL0Mpwvky62InrWdUSqdkeeIXeF4Kkk/s5hu
 eq09S6016q+FDihcFmA/Oa9l3dHPhSSSKJ13nQQI7GOQwKl0ybG+s2AUGQ3/3l+AQQsSaKTDWia
 TynCeNlqD2JKBVDfz6aNNDDHccr5EfRU=
X-Gm-Gg: AY/fxX4Jfwufvi2mL0Mp1oocRTLXHmeKI2aGJ/Foa3FnRwGZRNrgRecVAzSNpyRSOAK
 VwYi8O3YUlec4kIGl1yH21P7XJ/r4dvyO3IPsFiG4MuDxNRXxidouslzZma07mFhPWI1jAcRBZw
 wZ7uCWOigcNR/F1oqjDkVt5TpVNAG6htafO8JpZjQ1XawolkBJh/Y7ib37ZsSPiGTCzaRfTwgx2
 0jq7Ja4ORBQ1MAMVIY2EfqFK+SP7AThMRDAulmD8+w3kYvMSQyZ40H+AW0F1kgm9EBDpXe/LiJu
 ufyVUTxrsJ+P9CZNeha4Rsbjjjq7koQWL17E8iJW2zSlDxJaSj9Mo3CKfuun57LgiMNMn9A=
X-Google-Smtp-Source: AGHT+IEI+L27X3VYBwtvTtbD//tUK1cqRstOGm0x8A+wsW6Dy/BBoKlQjPvPMQaVva0Dsb4BJJYbeSNL+99aFRZdUpk=
X-Received: by 2002:a17:907:2da0:b0:b73:5958:7e6c with SMTP id
 a640c23a62f3a-b8036f0add4mr2974716566b.3.1766845428952; Sat, 27 Dec 2025
 06:23:48 -0800 (PST)
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com>
 <20251219054320.447281-2-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-2-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:23:12 +0200
X-Gm-Features: AQt7F2oJx9_5rStc5In55eyBv3lfUDojQOUDP7FelHM31gT78_xqzMu7r2M2phQ
Message-ID: <CAHp75VcumPK00xv4R1XKOspTf-8G76dmx16BG3y5G=tJ5v_b4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
 deller@gmx.de, gregkh@linuxfoundation.org
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

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> Add dev_of_fbinfo() to return the framebuffer struct device when
> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
>
> This allows fbdev drivers to use sysfs interfaces via runtime checks
> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
> remaining fully buildable.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
