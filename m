Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DCA0ABCC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 21:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF55E10E1CD;
	Sun, 12 Jan 2025 20:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j4M4tYZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FA310E1B6
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 20:27:12 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e460717039fso5055793276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 12:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736713631; x=1737318431; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=;
 b=j4M4tYZXhetLWrOP9g24QyodnfhKxU47yc0ESPhlbFPt+FeSJCZSTaCsf8VmDzZ4pw
 9ZGeWSxih5pCA1HvCsGJ02edeiYUOKN4qdQBhCq04TK2+Pf0lzaf3wp5JHq+xwjsqKmV
 SMX5pM1TvH6ZxFu1VmZNMSqte/65a8D6L0W5zbdkQfBNdAmHeto0HvW/h2ldGq3SZjkF
 QyT4orTNkoZkulbSiYGpvKveE0i+iTZWk4LxFSe8aukc8nkV/t+jemyWNRV2LM/OWUMq
 ydtr7nDGNjMI6XC5e82yilToYSZjiyFENCIQs3Q2BdKCCOHvs/OWtCnrs+zlWC068UJy
 5v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736713631; x=1737318431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=;
 b=LUUzBwGEhWDbMlTcCQhCbKSJGc/HzmIEQAMA9ON5sq4DTT6BOkPxcFEC/MBSAzWTjo
 RTFtirFMlkjys7vMSxY0wNqcLrq0Uj9S+F+3/T+mYYcjwtHcgyAZXlZNbDIo13PaU7co
 Vn5A0y/BDz0TkEUZ+XWLR4kr/2G5y3AEadi4m+Cro9ys+cbh3EbvsMoMQDt+yqzf022G
 1w6nUf0tIARWYyg9+rLSDzu0tRI4SJzCF5oJjYM+3mWtts05i5mbhdUDKI/ddvsJR/eF
 1XjUvnOEzs6NuXi+ztRS6jgXKBu9aAwNVYmXJ+YJNY1vy7Mi7oSaQkuxMRHnrKBOwMAv
 XzfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOdjyT+5r1Ev6sFQGfGesEDpWnxEtp7JS3Th1bQn0Wj0G/C+Fd1h5i1ZvRy/HcbX+qcs8i66Uf3HA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT6W5AOehDnytsJYVvXUdNvfGuL5PHzLoc4UvPnJSuamxma8TN
 z2Uh7WF6Y1D4iL80HiM9m2ZJe79HQ5NF55JcAuZuRT4qjJi8SCwUMykbZPR7GVQMgJFDqLMx8hB
 kzlImbtlKbIWk+0IW+huL5JsDCDY=
X-Gm-Gg: ASbGnctnS2UsYFTesALhOYAET3L28GyOfDK8QrPsZIPWfrGsn4bQwtA6GUGCJboRCBE
 OqScqy2+sC8jhDXSmaJ1s3o0wPtf8KMdeq6by6qU=
X-Google-Smtp-Source: AGHT+IGZaC/OlbRbsNvYaMYjxRBnL+2yYyfV0AIbRIBDdrnHp3fqv3tpczf0rasT8ptHihHYsOZGlHD6v1QG5rnyZfw=
X-Received: by 2002:a05:690c:c8c:b0:6f1:5591:2c6a with SMTP id
 00721157ae682-6f5311ef109mr147703997b3.3.1736713631265; Sun, 12 Jan 2025
 12:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
 <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
 <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
In-Reply-To: <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sun, 12 Jan 2025 21:27:00 +0100
X-Gm-Features: AbW1kvY_ntIDfWPnmKQupEStaGCx1YY-X1bjoh686czSMiCWmY8vjsKf9KrYKtY
Message-ID: <CAMT+MTTOeyAKUDYYwN+hO_QVBhPK4w7cktx5LQyrxrfDTq-wcw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit
 display
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 30 Nov 2024 at 12:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> Please add BL_CORE_SUSPENDRESUME option to the backlight device.
> But interestingly enough, none of the panels set that flag.

It appears that setting that option re-orders something in the resume process
in such a way that the entire display locks up and becomes unusable until
the machine is rebooted. I will be sending v3 without this change.
