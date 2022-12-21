Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF83654DB6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F2F10E612;
	Fri, 23 Dec 2022 08:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2A510E036
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 15:15:36 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d7so15797119pll.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jc5eDGVyhtibsn5U7Nyazut8bgaj8E3IqiFSQtZt3Go=;
 b=WMDx94ZMr8fHmkJdKn5N9JwmPyJn/vd7jux4NU3S/bIqCxxmrq+lQrn0cdIzXoGJyP
 TPA7TWL07kzis8M6TUWGXMk/HhNHCbrHObFgSW2qLMgVltgeJzFAOogHyXAbBp/ieaM7
 kTGk4d1HP7JiQ8g5RiXZ5QqQPxaETV8GOMfisvRq1hKa+CQnNWKLrM1aDUGgtTKPq/Wt
 Wzr3Thz8xPd3McGlNp25gS8UjO3UWpR2gVq49f0IIuGD/Wv7wKsv7hzugA/4YScXTj/x
 toDkxJqBeZFlGG1cxAg/uuzn4xYUeEldDJ2TAgA7zPeRESb7ggJSkKlWfQ93xd33yKxd
 bBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jc5eDGVyhtibsn5U7Nyazut8bgaj8E3IqiFSQtZt3Go=;
 b=slNwkkgGP5c+IWpUccu6eD7VKc99DliaSz02GXyVQxB+6Xb+LLFJPkK0/4rskDCcea
 v76aoML19/jbjcveCP/vNHe5fn145S6RwI/is5f0CNvrbWts36qC9+0ap7jV3juNEHOy
 vDA3oXKVcjgSn5cW3eR69eVKmfPXg/GPaqV5sq6u0P9UaBV9O8/f4q7W2J8ZrG7Z+LUU
 sRMf6LlOD4+gKqzUF7QSWkxl0NBoE1qmAPc303HCnUoqRI0VfZmdPpO4Vv3SpnJmy8LX
 metsPL4UVvSpopATyfghCf0m/Sm7SKU70nCM8ynEcrKnOXNBv0d4j9xLDTkbb3BZEzr+
 acow==
X-Gm-Message-State: AFqh2kqn8hVwSEmwpwUc177fyO9zf/MqLsott8gQEGWiiITAMlVylAwv
 hoKb03pBYquDo+31Q5a2Se4=
X-Google-Smtp-Source: AMrXdXsZQBNI25Ae9BLGieRQCGxuijBT8Y+qKP1egliNdCifxno+Ad6aNK32701OvgBVXGMrXlN8YQ==
X-Received: by 2002:a17:902:74cc:b0:191:4149:27f6 with SMTP id
 f12-20020a17090274cc00b00191414927f6mr2602255plt.37.1671635735060; 
 Wed, 21 Dec 2022 07:15:35 -0800 (PST)
Received: from Gentoo ([45.62.172.3]) by smtp.gmail.com with ESMTPSA id
 n7-20020a170902e54700b0018997f6fc88sm11608550plf.34.2022.12.21.07.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 07:15:34 -0800 (PST)
Date: Wed, 21 Dec 2022 23:15:27 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y6MjDxxi8CunFLmM@Gentoo>
References: <20221221132428.702-1-lujianhua000@gmail.com>
 <4c37d74d-aaa2-242f-a25f-bf5f92d50756@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c37d74d-aaa2-242f-a25f-bf5f92d50756@linaro.org>
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:26 +0000
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 21, 2022 at 04:03:44PM +0100, Krzysztof Kozlowski wrote:
> On 21/12/2022 14:24, Jianhua Lu wrote:
> > Add Kinetic KTZ8866 backlight binding documentation.
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> 
> Do not resend. You need to fix everything, test and send a new patchset
> (entire) with the changelog.

Ok, I got it. I was just a bit confused about "Need to resend with proper
thread".
> 
> Best regards,
> Krzysztof
> 
