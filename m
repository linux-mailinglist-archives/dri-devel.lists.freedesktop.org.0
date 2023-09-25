Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD57B7ADAF5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 17:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF4410E286;
	Mon, 25 Sep 2023 15:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7309D10E27B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 15:07:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso600429566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695654469; x=1696259269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tEZ5TYqKj7Xpyqh7LsqYS+cjUynAUZpYFGDV9Q2kYbI=;
 b=jCVrpa6m0mPUztQ0XW8A2JmKyygUyBm0xb6TZ5OKYYkv0GpTpiOUdfSPcIZz7+su8t
 zfgL7X3AwdAJytbLbMQCk6OiZtGzPxKwYZqS7sjVR+EA0l9avE66P/ZZCqTGo+b8f+f9
 eKx138Mt+gGASDDDi7e/P5UxklVKMwM4jXADPc0fxT7Ff+uKHMr4Uxn6zqv1hDP+ea6V
 s2OLtVbp4pMGxRVSuEwb1llDQWp1xi1fXXMBxtKi6DNlqIgl10aH4FUbnVguDBlUnEVk
 RSyHJz6rF7t+F6ZQ/3jwdCthb/ArXnJKHxWZnG1UfO9BAv6etzyy5+diXTZa9bR3lY6Z
 oBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695654469; x=1696259269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tEZ5TYqKj7Xpyqh7LsqYS+cjUynAUZpYFGDV9Q2kYbI=;
 b=VxgPHfesT59U7xOA5xv9n5Xs0zhkaoKCjiKMZHnwWnw1bjJ+2lpYWRAosBvpjRhPwW
 OQcIjSHFHlTmm/yK45Hu2H3fWjVkixpZH5AlinKTyYa6WlqBZ0zclrMDpIOmm4gpBzwB
 sBS6/Eb/4lcUkR2ibXlFUmYAvXVy1ax+x6AINpwGOR9iNiy7hD4OkKjsyQ2CBzJrAsKT
 CrI8uwQGyzjJNdkFgqPs1QbF8yyPUy30cTkrlqhsGOjA9iDMY45LlJLgDYdPKAUSP82i
 CvDHoSmtQsPYgf3Zm0lxZvEvZVFl5PKdisQAAf25IJWmVTPhjP5Iwhb1ipuhbL/dwww9
 FnAg==
X-Gm-Message-State: AOJu0Ywu387NY87Jn+cmUv8lwnhA3cr8YT3bUSPSUorEwVPRUVzVrKqx
 8vKjp+B+RzDoM81CHtBCyOs=
X-Google-Smtp-Source: AGHT+IHuvDsUyVa2O8phaopW7XqF8puZjg9QRjHcigLXniRoG9KatTQvuRnfy0vTM9Vw7eaMxEcKbQ==
X-Received: by 2002:a17:907:7288:b0:9ae:50ec:bd81 with SMTP id
 dt8-20020a170907728800b009ae50ecbd81mr15679987ejc.21.1695654468639; 
 Mon, 25 Sep 2023 08:07:48 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 s4-20020a170906168400b009ad829ed144sm6409010ejd.130.2023.09.25.08.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 08:07:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Date: Mon, 25 Sep 2023 17:07:45 +0200
Message-ID: <3441738.QJadu78ljV@jernej-laptop>
In-Reply-To: <rvqcfohw4i4y7amod3a5e4u4tkorqmaekvikyqg3fibvy53dsd@be4lk4ae35hq>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <20230924192604.3262187-6-jernej.skrabec@gmail.com>
 <rvqcfohw4i4y7amod3a5e4u4tkorqmaekvikyqg3fibvy53dsd@be4lk4ae35hq>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 25. september 2023 ob 09:47:15 CEST je Maxime Ripard napisal(a):
> On Sun, Sep 24, 2023 at 09:26:02PM +0200, Jernej Skrabec wrote:
> > There is no reason to register two drivers in same place. Using macro
> > lowers amount of boilerplate code.
> 
> There's one actually: you can't have several module_init functions in
> the some module, and both files are compiled into the same module.

Yeah, I figured as much. However, I think code clean up is good enough reason
to add hidden option in Kconfig and extra entry in Makefile (in v2).

Do you agree?

Best regards,
Jernej 




