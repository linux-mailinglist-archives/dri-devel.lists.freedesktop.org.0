Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2CD2EBB62
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD3F89DBF;
	Wed,  6 Jan 2021 08:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E64899E6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 01:55:36 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id hk16so766610pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 17:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M2SnuavxPcXUJasCexKnjXWwhRBi46twzYFZCFVtxIA=;
 b=jaDmkjxUvv933vnXaE4le+w+4C0Bd4foHxhGcP6dcW/tNQyBdvdC1uMwWxXqUJtanL
 h/JnWWeoprKpQ5HR8NxHvwUySBVL7w0jELn2jUrKjC7FlK89tbyez+y1IiScIIvPhxc8
 AiXvSOYqXH3Np15o8MSmUnThKxABfQxLT4vZq83I3lWVJISw1kh2vfPKoNvJc1xvaOJB
 fEPXTm6XgOztjw7QJS08uxTdw6zqn8T3nnquHMHqFjI5ukqv+HRTwSJmCpQOx1bV3Xkd
 NG2cHtrZOP+7buEgNt6n5rNGFG8hzxitWbJV1V3FRmCJPCs/DS99SJmJmqTU06qHid4e
 DJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M2SnuavxPcXUJasCexKnjXWwhRBi46twzYFZCFVtxIA=;
 b=QSVZ13GxsBjMdWnBUtklwH53q4RMCO0CNE6ttm+61yndd8faiBnLU/UYTLa71zK3nr
 1GSccIkU/0nuO+yGUemsCuh40Me0phaXwkRdIAnjYXuYeS0cNd+kEjsKAZJlijGtzaib
 JFBEnmGr5nBTdUBrzKX24WNCvksXR8xovuRJAXU4xojZtAlmQ3QMOMls6Q81cH9UBJ5O
 WDQRelwwJuejwgtNY7oHkKDbpmZb/FvtECx9MeaeR5YzPEmbiQtKM2hQ++E+ulbNrGa8
 dmRHAq4VFbBLsMJWeGsHEc/0aWuvrCA81E+YBLRGE4BTdJc+RIjb491YcNEfS7MjdtVV
 3T+Q==
X-Gm-Message-State: AOAM530m1/pcH3Cl6CG7uGCa0n+Zn/SNsbFGJdNnEkWKxzWH27R31M+v
 5I0w8qKBi8Fq3jPHyK6Yl/g=
X-Google-Smtp-Source: ABdhPJyBKCiWl8KqpA3d/9qhuLzYJM2/8URZ+PH/AyWme2ojcsE4nRsA6SZa1w/6+Y6vqjUiBP87Hg==
X-Received: by 2002:a17:902:6e02:b029:dc:8e14:a928 with SMTP id
 u2-20020a1709026e02b02900dc8e14a928mr1938073plk.24.1609898136435; 
 Tue, 05 Jan 2021 17:55:36 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id gm18sm425052pjb.55.2021.01.05.17.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 17:55:35 -0800 (PST)
Date: Tue, 5 Jan 2021 17:55:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
Message-ID: <X/UYk4RESSfjCIPI@google.com>
References: <20210104230253.2805217-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 netdev@vger.kernel.org, linux-clk@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, Marc Zyngier <maz@kernel.org>,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-media@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 04, 2021 at 04:02:53PM -0700, Rob Herring wrote:
>  .../input/touchscreen/elan,elants_i2c.yaml    |  1 +

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
