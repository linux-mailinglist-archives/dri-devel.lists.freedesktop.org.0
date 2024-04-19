Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A68AB547
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 20:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE3E10E4D6;
	Fri, 19 Apr 2024 18:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jvlpi2z8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BE010E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 18:52:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6ed01c63657so2178810b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713552768; x=1714157568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:subject:in-reply-to
 :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
 :reply-to; bh=U09zZHjB+LeME5+ai5JqJLnKOWOODtaYa79Abej4COY=;
 b=jvlpi2z89vMDaFqSpTY8TWKOH8Zyid9raAWTx5Os4tYW3QcquBmKQFm37ebehTn0dX
 M9WBfqzrmu4A8p3zMEGV4i18qIkNIv4DRiln6GvXWo1nVwtDeHVWU4bVYv3SYf+fJBuC
 rl75+MkL4Un0ldgc5Q+Lz784WmnhShLY00Ke3rXcIzwtaPbEq4AtLzTMSxXYJopJTQIG
 VazrosvIwZ6eKb9vAy2J2rrL3lKs/zTvGzbjB222anFHIB4+6FT34evAPIXJWdzAz3+O
 ZZc/elGhCNLuLM2hLaFEX4UNkc3lI0kof107PsEvi214XuY78SEjWkigtURsJtc9ghY4
 QTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713552768; x=1714157568;
 h=content-transfer-encoding:mime-version:subject:in-reply-to
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U09zZHjB+LeME5+ai5JqJLnKOWOODtaYa79Abej4COY=;
 b=c0X4HgsyyuY8ZqYjch34zpeCEdlEuw5dBESGtQ5P8v5EGlCsPCBEEj6Gr4gLlCZhfB
 6ulSgnhFeNuwFpcJnQF5Kmkp4gGd/V/0v5T8Duq5m+m4cxYChV95uFSwwcw3OiU+kBvr
 BJXBWFhJKKkiOd0A/HkKfysKR5GmzRLXjs13OnQpReM8FNUislVMzltBUL8QjdG2MsR0
 Zz+p2VrhV7aTmG0PrIyBmj3Tl6vXes5GDgwcVCQ2g34se0oh6D6rFo42a2gwPv1OWPRl
 cxAaXXi42RO64FlvrebVOK0NWIAe6S0LhO2KDSaqnpgqHZ7MtoPuPoyBQ+OmOQRTvg/0
 MySQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6v1fUDDlWg+aCEb6n6zK8CRhArLTsLIHkH4wNO9zKQ6jHNYFsFV/qJWIMq3M4YyvnZmvWucayBM7d6L2HhlfnyC4KrtaamVHT/KYtEnIo
X-Gm-Message-State: AOJu0Yzr04bTZ9QPHfevFrEG0STZ4iWuvd9LXg3g80IaAjIml/QtnL+b
 UqWf6iFcp+cZTHsVIw5pAh/16BnXwcYuu/fmqFB6Dg43iu3gTNTV
X-Google-Smtp-Source: AGHT+IHEQHOBvKuseE8etys53e1nv+ZkHGMM/0X950aYj5fjviZRpom/z8ITcLkYd++IcqbesMEaPw==
X-Received: by 2002:a05:6a00:1794:b0:6ee:1b6e:662a with SMTP id
 s20-20020a056a00179400b006ee1b6e662amr4300891pfg.32.1713552767935; 
 Fri, 19 Apr 2024 11:52:47 -0700 (PDT)
Received: from [127.0.0.1] ([106.194.121.201])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a056a000cd300b006f0af5bfda5sm2272744pfv.102.2024.04.19.11.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 11:52:47 -0700 (PDT)
Date: Sat, 20 Apr 2024 00:22:41 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: daniel.thompson@linaro.org
Cc: deller@gmx.de, dri-devel@lists.freedesktop.org,
 javier.carrasco.cruz@gmail.com, jingoohan1@gmail.com,
 julia.lawall@inria.fr, lee@kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, shresthprasad7@gmail.com,
 skhan@linuxfoundation.org
Message-ID: <819a56c3-bbaf-4d5e-87de-78c1312c56d1@gmail.com>
In-Reply-To: <20240419111613.GA12884@aspen.lan>
Subject: Re: [PATCH][next] drivers: video: Simplify device_node cleanup
 using __free
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <819a56c3-bbaf-4d5e-87de-78c1312c56d1@gmail.com>
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


> Please fix the subject line to be "backlight: <driver>: ...". I came
> very close to deleting this patch without reading it ;-) .

Really sorry about that, I'll fix it.

> Do we need to get dev->of_node at all? The device, which we are
> borrowing, already owns a reference to the node so I don't see
> any point in this function taking an extra one.
>
> So why not simply make this:
>
> =C2=A0=C2=A0=C2=A0 struct device_node *np =3D dev->of_node;

Looking at it again, I'm not sure why the call to `of_node_put` is there in=
 the first place. I think removing it will be fine.

I'll fix both of these issues and send a patch v2.

Regards,
Shresth
