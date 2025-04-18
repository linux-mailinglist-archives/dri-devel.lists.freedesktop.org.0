Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2443DA93CB5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B5210E257;
	Fri, 18 Apr 2025 18:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZJFE1Rm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D5110E257
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:21:39 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-736b98acaadso2142107b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745000499; x=1745605299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
 b=ZJFE1Rm1TYP2n6HYp6KfsuuxnjkS97MWTUU/lzVltJqVpaixzUWOXlPy8rdjDXZhN3
 TNJU6AONBubKvrQoW0g1ojlEF/IVrv30pze4VATTSbrXA+GUC/eJjUDF6dlwm9dOB8Wq
 W2H6r98bOtX0DntX45z5wosrXXh9NvxgwWwrQicRk7rGxpc176y3W5hhhMkPqJTzquga
 RIndi4bAALBotEVrThuGSGfF5I/FAM5ZzZQ6mroGG99YwQmkwjYx1EPTarEdZ90m1qG3
 pGlnQ6KtLfsy9SxJoM3s/Sq3wXHEy86s5y8ZoridNN86j1HbKvUTzM/ZfQmp+4Al7g62
 C6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745000499; x=1745605299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
 b=MxinenH5DFqJrWooFBElz18Lhatyv9aZI/p7KWX0aax5wxwtedtRcUKzlcuPNaGZwC
 FXFC3Ky8XK33y5lXbqh9WY8N7BeWsoAw1HSjTcIy4Pu6GqxSUKV7A+b4+xs0ilVB2YCh
 XFowsaGhosUarO82IpnsWAMngOVhIgvlR1m8f/m7UDwUPW5s47PkSxGggUxxfc63zlAf
 w9fZ/JfYJraHlGbtDB5nH768JT1f05PAouz0XH7AwetN8p+H8u+efj+iGKxQKxDAURkk
 OIncNpcjTylWRPwwsF4246eZUi5HGAuDyjKY0cpj6iBgGrLV+dcAZABcD41tabhffqvu
 8/yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5TKHkA7k8yV6ZW+5ufGmisR6be22MaFfS8ctkUkgtVRG8AVL+LZ302YcWfJK4EB24fowjRgdMdw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXEwdeb6LjlMzsQpWUrBqcMk+RCOZharNmWOAqUPIx58Ab/jWh
 GzHp9I9YWVuDPcpFxl52sRyQ1MXQ3ujuSPPwv0aUhbLE4ehHPumz
X-Gm-Gg: ASbGnctAWJgLRMprLNjGJpLDYsrn7DgPANj/aVKlnq2G/s1nvXhcHleq/4/oXZnz2jB
 2lp6sMLyYb3e4rQfFG10AnybuBcBS/yXsqAwdgWe6mqrMpBlcsbvaZF3DbC2xKwVk0mKaOxxAZJ
 NY2gOUyhI2viQmhnoeajNG47gLWjpIv7FL7GuF9bIvL2WmvO36TqxFfExnb1aL9aAZlLEDDK2r6
 iTPT4y97gfZfSDvWQJlHa8IaTwdnAvICuG9FioGWyuGywjYvOYeAwfusb5jcVDuUyLqGvWt+FM9
 7W/Xz6u/b+0HGBp4AkUhmqAhIfZFnVrHchfahbw=
X-Google-Smtp-Source: AGHT+IFRC9j6wJeAYD2mwF+2keu5K1ZF/SaRY/zWPxP4EBLUKFqAOPsnj41Veel0R8nXbo7wP6uWWw==
X-Received: by 2002:a05:6a20:158f:b0:1f0:e706:1370 with SMTP id
 adf61e73a8af0-203cbd59cb0mr6805648637.35.1745000499288; 
 Fri, 18 Apr 2025 11:21:39 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b0db13a3e63sm1684024a12.29.2025.04.18.11.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:21:38 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: daniel@riscstar.com
Cc: conor+dt@kernel.org, danielt@kernel.org, deller@gmx.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jingoohan1@gmail.com, krzk+dt@kernel.org, lee@kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, lujianhua000@gmail.com, mitltlatltl@gmail.com,
 pavel@kernel.org, robh@kernel.org
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
Date: Sat, 19 Apr 2025 02:19:09 +0800
Message-ID: <20250418181927.208018-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <Z_P9AEGq2sBYShgv@aspen.lan>
References: <Z_P9AEGq2sBYShgv@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Tue, Apr 8, 2025 at 12:27 AM Daniel Thompson <daniel@riscstar.com> wrote:
> On Mon, Apr 07, 2025 at 05:51:17PM +0800, Pengyu Luo wrote:
> > Kinetic ktz8866, found in many android devices, nowadays, some oem use
> > dual ktz8866 to support a larger panel and  higher brightness, original
> > driver would only handle half backlight region on these devices,
> > registering it twice is unreasonable, so adding the slave handler to
> > support it.
> 
> Is there anything unique about KTZ8866 that allows it to be used like
> this? I think it would be better to add support for secondary backlight
> controllers into the backlight framework, rather than having to
> implement driver specific hacks for every backlight controller that
> appears in a primary/secondary configuration.
> 

According to my understanding, if I add the new api to backlight framework,
with a minimal modification, then I either do A or do B(I doubt it is my
fixed mindset)

A:
Tied two devices, registering the primary and the secondary device during
one probe, to do that, I access another KTZ8866 when probing. Those hack
is still here, that doesn't seem to help.

B:
Uncoupled, probing separately, the later one is registered as the
secondary one. Brightness control is a little uncoupled, there are two
sysfs, I doubt if userspace programs will write brightness to two
devices. Then we need synchronization, write primary => write primary
and write secondary, viceversa.

> Also, the kernel seeks to avoid adding new instances of master/slave
> terminology. See the coding style doc for suggested alternatives:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#naming
> 

Agree.

Best wishes,
Pengyu
