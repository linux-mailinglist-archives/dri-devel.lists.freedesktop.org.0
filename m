Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619B24CE88
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F5A6EA97;
	Fri, 21 Aug 2020 07:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272736EA82
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 00:18:48 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id j13so47948pjd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 17:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=s+gefwGGLS4RZ9aAtxwt9F/Q7T9fxHVOG5Dd2Edw1yI=;
 b=a925dQD7UAnI2WEHBuEp1k6vs46a15EXpwoO8/XlJ2KVU7wPk+MkHan4VwcKlaJ7UT
 j5OgC4nnfa03FnISqr4Pz0w98qcVngy8HTRZ5tGwyTFBFsLslNIIE4JkLP0ozADvhQGx
 NcGR0SsMTlfRtOjLWJyfTfIaXNw9PBCWPqYxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=s+gefwGGLS4RZ9aAtxwt9F/Q7T9fxHVOG5Dd2Edw1yI=;
 b=rl/ogog0VgBA/PfKpYZ/T7tQQufzH8Yr7HZMFfq3vcV5Y/cF4oHM7NX0DsAFMTI8Jy
 Qlhv+IKtZvWQmj4vxCv6EJgqo5OC3H3EnW3NQ7S/6Kt/2o61WSn76v9DibbPRU25Jc7t
 VK+4ZFtPqiashvxqerm1TYGIBfbOL1dxN1kAqquObE3U8nSonYlFnC5jAKNl3i9UWvM1
 VdqT2WsBU3XcF/Zw0ji0XKAvOxNXC8r28vJbUgSgdQpoZblSQp0Z7WmZ30eD1nv3iyhZ
 vpEPHbEeTNZMxslsSE8AwF1XixlO0aPwBYx1mvM71tvM+4EbvKtRW5aZyE2IUSTaAH9t
 IZlw==
X-Gm-Message-State: AOAM533AADC+NwPmJbHXQ2/0BhUuyDy+yIJO2XXc1W2HEE1duDeXKSGs
 S6jZLuSPUVUKidpqRns1N5cAGA1BcjIhoQ==
X-Google-Smtp-Source: ABdhPJycAJIRRlSrBG3gbwhGKoE6fAYeLdDcGy0d95wxs2vWn2H649ZQ/s3tg7y+5yjnbfnHBOKx8w==
X-Received: by 2002:a17:90a:1749:: with SMTP id 9mr249662pjm.127.1597969127726; 
 Thu, 20 Aug 2020 17:18:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id w14sm221421pfi.211.2020.08.20.17.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 17:18:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200820103522.26242-2-rojay@codeaurora.org>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-2-rojay@codeaurora.org>
Subject: Re: [PATCH V2 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in
 geni_i2c_dev struct
From: Stephen Boyd <swboyd@chromium.org>
To: Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date: Thu, 20 Aug 2020 17:18:45 -0700
Message-ID: <159796912574.334488.10846610259602895929@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, akashast@codeaurora.org, mka@chromium.org,
 agross@kernel.org, msavaliy@qti.qualcomm.com, linux-media@vger.kernel.org,
 skakit@codeaurora.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Roja Rani Yarubandi (2020-08-20 03:35:21)
> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
> data scope. For example during shutdown callback to unmap DMA mapping,
> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
> and geni_se_rx_dma_unprep functions.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Can this be squashed with the next patch? I don't see how this stands on
its own.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
