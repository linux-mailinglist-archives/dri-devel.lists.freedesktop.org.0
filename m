Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FCC9EAAF3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 09:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E68910E159;
	Tue, 10 Dec 2024 08:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kWeyoWAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB810E159
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 08:47:16 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-21631789fcdso15884485ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733820436; x=1734425236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
 b=kWeyoWAXwdgaDyZQ6wHBMSzn+NaOnjAwNJyibPB15WmpfjTjrB8s2TlMtQFhfGq73p
 LYO+chxCFwVQwTkV44ftUbLKdXaYmQgpskJ+0PajHntCla8nrR1ZT65sAW7UvRDT6TcU
 XJqCk/a58sRK9mgJ7KMqVQG77DHSyaUsPh7tkz2WlrIwFGivEgIp78y3BEB21dOULeD5
 jHMMC5GhSyN0PPt75w//FH+XY6g6MW/Rhj2+REnyuOE0mDW4yVCnbyPI+yQPjv8m+3lH
 +Mxn34AAt0SC8zUr5u+CF8oXEpEwM0AO1RtZzW8zU9Uk2vT148XLzTbXZyAdKmpasqNy
 5npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733820436; x=1734425236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
 b=NRb8JKnUiidAA1RxpleE6tf9++ChuGwF8XdG7b3xPxA8G0Yg49qAPIWIHeIzSWtCoX
 2OhZwwInDFMTbl/GLj3oHLfBJaAOc72gwWD2dvu8kYuEI8bhw47axsBSqKYGqFXpxieC
 OAsIG1fcqfQVkzpGfNOKNccmUCx2DVzld98mgq1D4d+iyxd40YKZG9hxudw54IDOUKWu
 AGEz1RKWgAj1lA4t+sa1L1oRcQkem/rbRieA307zZrTnUwDmQyFVhGZwG+ehNVFcJUKP
 8r4pyPbk4A6bIjmc7pzhZ38ePXs379g/JLn1dKr1wPZ0gvirnx435NGyhbaXopAQMeAt
 wpCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDfzzoBu/6vZ2dWn3WW8pK4VE14BPHOoOL1aZ8eXPZf6RIlo9qqsl9R/DYsSQntgJX4xv8sYWofZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4o/YOc3sIgYBIdM7eOH3lJBKhYzlZ6MAr58CjuZSP+t3wwfHZ
 d1npiPnb7Stho6NooaCqH+hdFHSjXVcVwMcyZTLEqDmLeohi1DBu
X-Gm-Gg: ASbGncvrIbGd5ePffIu30t1VN6WtMxJ8M8ebP2aGUs5FrbNG7bX0JXgWZIlgWhmTkAF
 EpWdOSJstH/asCrfSq/p8rvyM2ZZlOLltlaSLHiDdjwSCJmvc224602cRcmQtH1tgLXe4Xjlsa9
 I+aAX0bH1yMtg8sjM2lWe4+NBor4RxtRFSE3GqgItVc6qYo1EQ7qBmgMmbR2LyxB7uXlebdSKS6
 UuGZ1UDaCNLNDYVLriryJnaVXnmBfmEoByfvkASZwq6aiPtQSOvJNDVvIGOfw6HdQJ4SWoaD5yX
 zw==
X-Google-Smtp-Source: AGHT+IFyFx9u2Q8EBc+BBmDXtC22UJjW0IxAAzdnx72zpqdewbRBPV5UQPIkvDpar7059Mt3H6VwCQ==
X-Received: by 2002:a17:903:187:b0:215:a808:61cf with SMTP id
 d9443c01a7336-21670a47b3dmr40495715ad.25.1733820435973; 
 Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8f26c6csm85230675ad.233.2024.12.10.00.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Message-ID: <23e6d9c0-c3d6-40c1-b933-01c5a9ef43f8@gmail.com>
Date: Tue, 10 Dec 2024 16:47:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-3-towinchenmi@gmail.com>
 <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
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



Krzysztof Kozlowski 於 2024/12/10 下午4:32 寫道:

> Nothing improved here.


This is sent before you left any review, v4 will have improvements

Nick Chan
