Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E49D9342
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DA110E7DE;
	Tue, 26 Nov 2024 08:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hjuYCZpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6418210E60B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:28:30 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e3873c7c9b4so4694271276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732534109; x=1733138909; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SFECZUVYn+5chgSQNbqMPjSGONkR4VwEA2mP4hQOs0U=;
 b=hjuYCZprxYEY6nxRxQHAnIitsr7yoYB+lNiXs0uLxXQ4+v+xKNdDqUfX+Jo2MZA4P1
 iSQOAP70zjzif9Pzld/AjytRzMzMlURCWTMv3nFOx02H29l+pR7VaJBbeZ+PGPzkuMk7
 +ct+XhApV9ZyuR+BqONu+r3Ggdybze7G6ZhBFRkCxY4Jmo483ZBock96osHBW6Cn+LNh
 UjZMadAar4EKzUf7DViykxLtdvrQjQYpaEJObwjiZ5huEjVz50pSDaZmaoequN05gslr
 toKO98Y1eNADmIVUFIVGzPV+Cp+U9ALHA+qMgwHF2hVFikXgIw2dwrQUkCKyPXFH6Sa+
 KLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732534109; x=1733138909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFECZUVYn+5chgSQNbqMPjSGONkR4VwEA2mP4hQOs0U=;
 b=hmWWV1s85APh1oqo+L64Pi5jCTdLboOsUg/xYIrPSi18Wl9dqGi7EGfn78wfXQsl3i
 r3RwIehUObjKEG7y1MIPbBPcoJtEnJ4EebomIGVIE4z4Ydk3dhZGvV/gYdIPauXGaaCB
 cE2yXpTRIDOo47D74KxoieWBvEawDkuCmpoI93eLiVSrT374qF05ZfaurUoxRkZng15A
 qMcWDIuZAPTyvZxuCM/UggQ/bjubdNqockYRBt+dkZLY+BhgIGML06SqSGGuoZsssj4U
 g3vEUT/Ws1+HYmggZ4azpBkzwUT4CVZJWyFuDF3NWgz2RzGFsJAWhmzXrdHBO0IqTfoP
 uC3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYOKafFPa2tdbnTNH0rkIhQYTBCOBp2S4O4t1gOq7zv+1GUI8w5JjMtQhh4ArakuxZ+2kmXidpA28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4godVIm5sokK11b8Cm8PTgTi2vwh6MGzz1JjnNut9yaWwXI3m
 NPZDQI33tiHuMbw8IInho0hmo29w48R8oXo1ED+ZWYN6qw9x6mlWv17X3N2vIn5jQ2AHbJ04f8T
 eRiCywf93cdD8jcpDIAvJpEvkhw4=
X-Gm-Gg: ASbGncsz3P+MoGfCEK9cmTlIm5Za7eg7iU33O4GXW6YoBNMxXJGGL6YmQuQ3UNHmtXg
 EeymOFE2vDY0pMEHExhq0anjnQN+EIwqq
X-Google-Smtp-Source: AGHT+IEvMXbz/ATLbtPNpdoZq7utk3jT6G8l9B0pfvfJrNTPtha9rgk1sBFORpJxaDQfmVMujvdo14mu83hAF3M4v5c=
X-Received: by 2002:a05:6902:1503:b0:e38:a34f:ff91 with SMTP id
 3f1490d57ef6-e38f8ad814dmr9422644276.6.1732534109466; Mon, 25 Nov 2024
 03:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <3bac31fc-57aa-4234-b10b-d48d3bbfa344@linaro.org>
In-Reply-To: <3bac31fc-57aa-4234-b10b-d48d3bbfa344@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 12:28:18 +0100
Message-ID: <CAMT+MTSDWK1dwgMHbNxAHab5_45xDn7YTfZDUdUL5Zjx++X4kw@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit
 LCD
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

On Mon, 25 Nov 2024 at 09:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > +static int summit_suspend(struct device *dev)
> > +{
> > +     struct summit_data *panel = dev_get_drvdata(dev);
> > +
> > +     int err = mipi_dsi_dcs_set_display_brightness(panel->dsi, 0);
> > +
> > +     if (err < 0)
> > +             return err;
> > +     return 0;
>
> Just return err here, add a common function to set a brighness value and
> avoid duplicate code like here.

I felt that mipi_dsi_dcs_set_display_brightness is common enough, is it not?
Ack on all other changes, will be done for v2.
