Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035B596A5C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ABC10F35C;
	Wed, 17 Aug 2022 07:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3022510F528
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:31:34 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id z20so12767781ljq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=n866UwlVQsvEsNFKCS8hnoSDwI11hrtsqigMztK4PUg=;
 b=P5fgpWe4cPrzCJusVO6q5+NjmimvA7suGtowiRgC7IkHvYFbrYfNOz3kmbiEgRSIqR
 QgY/zeWNw9ClHhckGsh20186cIiVx0tu5qb1/MQKpmVn57BDLMUKxzSjurdDIOXNPfF9
 5IO/YzPq2vbW9I7rCdS2atffVlubqHXp64UdJpyhhSFFXOATF0er+Xr7Qyu50X3yQqmG
 yKAlqqUxb/132vkBY8sqygKsbExmhkXiFF5f3184FqLM5PUWKIXQPVQcLAROrWxq49wn
 yJBB7rR/yDMrzxwD2y/RBRwuSHD/sLgC2DANofXZdrgQLTWA7aEVVNvKwWhspgrk7z4B
 TCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=n866UwlVQsvEsNFKCS8hnoSDwI11hrtsqigMztK4PUg=;
 b=Af5zjNVmnWnPkmHqW5Cs3WYdDQs4kQie9TWV8MT+HJ2FHWckeIPI+5K679haD6GjlA
 4GjxOf0U571G4qXlMF0el8XSyQkJ/SnQ7Nv3LncZljvfWEhXg3uhq/UqaT+BFj1ndVR2
 qbqs0g0xOAc5/UlXcBrAS0ZKKeBUR6s645qMFcya9xpYO7XibGhMMFficKnvi/VdwEEo
 1AvDQPA22/WQbuL44+13CGfZWznaoilTxZMpqHkjy1REHlojkWCGWHn5G4n0oyiePhN4
 /2iOi4BIOLaGfrIWKXma529s8xPKTDKzzw5eHa2rUI+EkxH0YpA7o5vnUQAQl46pNTFR
 yhow==
X-Gm-Message-State: ACgBeo0RjznWJ7gh6mJyH5VORvUJI/tGJuPGyJ3mfiN0o8mJQh7HB5UN
 LghFt9dhFWyB+CYGVNx3z4YaGA==
X-Google-Smtp-Source: AA6agR4ZRa7kPXpKMgSEeReObwfLq016wKe9tLYdc9p31rQ9SyozcH3P6Vxjtg66mc6ooTXwgNS2Ow==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id
 o10-20020a2e944a000000b0024f10bdb7e8mr8241865ljh.238.1660721492560; 
 Wed, 17 Aug 2022 00:31:32 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 j24-20020ac253b8000000b0048b2f079cf7sm1591957lfh.239.2022.08.17.00.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 00:31:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 daniel.lezcano@linaro.org, hdegoede@redhat.com,
 krzysztof.kozlowski+dt@linaro.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lee@kernel.org, robh+dt@kernel.org, cw00.choi@samsung.com,
 linux-fbdev@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] MAINTAINERS: Drop Bartlomiej Zolnierkiewicz
Date: Wed, 17 Aug 2022 10:31:28 +0300
Message-Id: <166072148468.30126.5293143761869366053.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
References: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: bzolnier@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Aug 2022 13:15:24 +0300, Krzysztof Kozlowski wrote:
> Bartlomiej's Samsung email address is not working since around last
> year and there was no follow up patch take over of the drivers, so drop
> the email from maintainers.
> 
> 

Applied, thanks!

[1/3] MAINTAINERS: Drop Bartlomiej Zolnierkiewicz
      https://git.kernel.org/krzk/linux/c/20b02590a3f76ee4895a917da28897736b20eda9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
