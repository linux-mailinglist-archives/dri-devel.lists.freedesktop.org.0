Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C246487B60
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 18:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80D810EB94;
	Fri,  7 Jan 2022 17:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2C610EBC7;
 Fri,  7 Jan 2022 17:26:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so1029442wmi.4; 
 Fri, 07 Jan 2022 09:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ht1OfskK18Tncu8hyQlhD7qZAAQL5kUIMY/RPcI5GWg=;
 b=ovBuHMMnaNmXki6e8ZuoIbwSgvKSbD1rksXRBmgyYUmyP/xeQbqX4CMXw2qDxMN1Vj
 v7Bki5RCHpIU0e56V7Y7EQ3kE2ZXPFmptqvRvDxQZ7chM4UIxRpXdp4o+0LjlKd7pW8q
 cXEGNj0CLps7TCexKvhCcrnl6NC6GUvVbPn8655XITD+oVFX6A77Yf0ibTqVflUqhgVm
 PGjvs5ZFG+72tWQn2lyUd3vH8tp3g1Iw+bUZuz3gxylapUn9yZgbIyZOi1em49vjoi94
 cNXMt0hYVQD9rJAfir0whVAbi7g644rWd6NP5cRkYKgohSf4SMg+HMJ/SIjKzTUI7Shm
 kngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ht1OfskK18Tncu8hyQlhD7qZAAQL5kUIMY/RPcI5GWg=;
 b=i9DBCsOYLDZO37P6QpfMWDWlrh653HsdKCiqXz6W/zPdVLzNiybYnEK7GORpwFpcWa
 QgZ3EvMNBwT7U1dpD1PsBCwB4pW4Y8qZ75REktan+WaRHLROUGvc+WK0BtAObn4YZyfi
 Bqr9ZdY6dW+Ve4M6hBda+YvLexLXKtSJv9WRdVmOFT8nYOe3MmCUHK5SVGKtxFKp0aFi
 NzrTz3LKOWen6+UhrK4+YY145F0HDA7y1cZRcwbOeY98l2tqLuinTZMX0Zu6NdIGIfLY
 m8IOAgM3BZZ6mtjmZNkAGIlubxFJ/3qNSI55Dk9l6yj3+zEFrjIukZXvNsipbpQ5D4kR
 KWvQ==
X-Gm-Message-State: AOAM533qQtJnhFyKTx9itenkKqkXf3MqfWJI/34WqbGrZkOSC6bOaZMB
 vjIlhuM2Br2u4Xebhj0nTWc=
X-Google-Smtp-Source: ABdhPJxKyHsrAgQTVgZgLm+52z4ULS2Pqwjxj4lcuAMX76VGeJnjfcycUSa/PS919Hvdw9jf9FQEkg==
X-Received: by 2002:a1c:5403:: with SMTP id i3mr10241280wmb.66.1641576368115; 
 Fri, 07 Jan 2022 09:26:08 -0800 (PST)
Received: from elementary ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id s10sm8325202wmr.30.2022.01.07.09.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:26:07 -0800 (PST)
Date: Fri, 7 Jan 2022 18:26:01 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 2/6] drm/plane: Fix typo in format_mod_supported
 documentation
Message-ID: <20220107172601.GA122757@elementary>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
 <20211226112503.31771-3-jose.exposito89@gmail.com>
 <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 s.hauer@pengutronix.de, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On Wed, Jan 05, 2022 at 11:54:43PM +0000, Simon Ser wrote:
> Pushed patches 1 & 2 to drm-misc-next. Thanks for your contribution!

Thanks a lot for the review and for applying the changes, appreciate it.

Is there something that needs to improve in the other 4 patches?
Or just waiting on maintainers input?

Thanks,
José Expósito
