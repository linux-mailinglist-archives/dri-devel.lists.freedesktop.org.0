Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E04463FB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 14:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F876E284;
	Fri,  5 Nov 2021 13:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA6F6E212
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 13:18:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u1so13658586wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7/iipoqAGtlWfjdTn7pIa/UV1IVALV2EMEK2Ldis3ok=;
 b=ifXSu3YxdOWGJi9BpmMWnOWrVxdbHBjFXP/MC6gBHwOfp/tRp602TJzZp83L8zi9gC
 4TIiZETw5Zfvmnlrgma13J0NB9/IY0RnIftxjY3qyORHJOa5ft2S1MDCKespwqBDHy5X
 2fSiRlliFxIdbfA/46iK/DBjX9P8+jmEVwNSbaw7U6MYM/0VZFN9X1l18+oV7is/ugE/
 Ldzd1ayvE5qOPCENJlcA2S9ktEb3FwxBlyvHejTgnGM5nsut7MW47QXuVPlY2SYQ5iaN
 EZ/N4vTS6X4oKsJhsaaQ1ItC5COwZR3Gc4xUwW9jGB+JnS8YzhUZ98BISrACH8u0YqK7
 74rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7/iipoqAGtlWfjdTn7pIa/UV1IVALV2EMEK2Ldis3ok=;
 b=kz8MLRXGG8vaOAe71LovsgfdCvQ+GrI9wOb9qkntZjoKdh55OrNa0ThF6MxmEgv5yQ
 DFs8cqc6w9yjNOZ6YzV7bhSBRuZ6pe5wh9Fqb24gFf63kPgZI+JpS+UgS97DJ1drN4ug
 jEANGb9THROjS3BekEYDZx9zZt8O1948FlJFFqwFWMI77bNoFc98Yu7jXrq7EKp4q0hK
 uazjLKu/+NGdvYT3g8vXYc4qCHdICorAcq6bkDAM0KWcDitfVwYpCA625oTjMHL2flyY
 Um4MLnmaFzGgqGYz4PTCY5/dIRyFUjhIpCJaJ2p/HRzz72fsiQgjaSMuqrs4CX5+9JuG
 srWg==
X-Gm-Message-State: AOAM532/zR0wMPtkJWGR2fdtZEtzBzkuc9K2QWC8Hx+0ZDM/hhlo0MQ0
 WbtFURKPzwvWVxkBh73+C/sAnw==
X-Google-Smtp-Source: ABdhPJwQHnoAVNWxU1bfYrJ+W2Anf3+K6IUO09ZgJAtRW1a3a3m9FMJj2FO8krg/xKbG0Vzc18WZlg==
X-Received: by 2002:adf:f10d:: with SMTP id r13mr74756968wro.414.1636118333680; 
 Fri, 05 Nov 2021 06:18:53 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o26sm11155063wmc.17.2021.11.05.06.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 06:18:53 -0700 (PDT)
Date: Fri, 5 Nov 2021 13:18:51 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: =?utf-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>
Subject: Re: [PATCH v6] backlight: lp855x: Switch to atomic PWM API
Message-ID: <20211105131851.6p2jmo54b4jts2mo@maple.lan>
References: <YYQfThRqabp4A7Dz@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYQfThRqabp4A7Dz@fedora>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 02:58:38PM -0300, Maíra Canal wrote:
> Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> replace it for the atomic PWM API.
> 
> Signed-off-by: Maíra Canal <maira.canal@usp.br>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
