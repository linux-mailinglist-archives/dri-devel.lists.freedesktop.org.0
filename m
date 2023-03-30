Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6C6CFCDF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E0910ED0A;
	Thu, 30 Mar 2023 07:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4628010ED0A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:35:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l27so18059850wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680161723;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wUsyas2g7pXcAt6kmQAIPXQR1m5yxNLHw2NuTLXyTvA=;
 b=kj4dR7j8wi9fDhWyKWSUz+RC1XBKZvSgaMCcAQ+KOse0mSvFQKB8sp7NeUTSFwhnik
 fZW4TBqEnfVlKiZXDb/bJKiFRYlTYwXRV2otd/oS+0jbbGTHjPDHByOlrtpYMpUuaDoU
 PU29VgNQ/OVsmS8Dqfm2BYnlSb89gkR0lGLZrnOQCIncKup/tSA4As/0Mx08PmAIR05v
 AM6oqzKRJYpN7IATxmoxY8ESZ/iKYNB/mtF/0s3kjuCq4Pn7Gz0KF+HKqGq3fbBg+jHy
 ShqN/lQ/3qTRCwRPW2HrGJQR46lL7a+Vqs8jiFqTfHmhMaDRQ7H4X0YS+o/06179jX6A
 OHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680161723;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wUsyas2g7pXcAt6kmQAIPXQR1m5yxNLHw2NuTLXyTvA=;
 b=E2nYSjJdjeR/ffrf6zBzhgZOfajXMqYNf3JlEunCEMnv7Sa0pgTHGtIE3gEnuQSDvT
 R3VStIHMdscGPlQMnFAHAbnnqNfjhSIXOlT2rRX9PwIHKP5GjT4PWv59rohGsn0icndt
 y681R8Vc92Kdm0Shm+ICd8aLpDnpNIalXUjkfk/oTQ7prknI0vaMa22m5w1hXmdfUQO5
 mssjv5yzAKYkTiWXq8paW8d02d1Ie7UbFS7Winrd6OK0Y0eEurIH41iMk/c5gq5QjOwh
 FzTyKJo9HKhf1EQHrYTnwQ/rnTpyYpE5dBSZE++zHBCt6RHBfEKrDejWrh4m6ubIlQdA
 2CXw==
X-Gm-Message-State: AAQBX9f5snioH30OrtLqKQ5VdyQKiK9CXE3eQgY1U6Bvi3M1H3ApLxsa
 QTSQKMt0CjXKYyiXEmKgbzrdjBWJZoxK3IXzBLv9xQ==
X-Google-Smtp-Source: AKy350Zhek0IM8+FPIzpitnwEAtcdRvQCBSMF25dquE+PRBVL/WxyWP8+w3v36GzzaPpUoEPJaeODg==
X-Received: by 2002:adf:ea49:0:b0:2ce:82f8:812d with SMTP id
 j9-20020adfea49000000b002ce82f8812dmr16663518wrn.54.1680161723155; 
 Thu, 30 Mar 2023 00:35:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a5d6b0d000000b002daf0b52598sm18885206wrw.18.2023.03.30.00.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 00:35:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20230329201150.741106-1-festevam@gmail.com>
References: <20230329201150.741106-1-festevam@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: seiko,43wvf1g: Change the
 maintainer's contact
Message-Id: <168016172250.3866055.13177104315800219942.b4-ty@linaro.org>
Date: Thu, 30 Mar 2023 09:35:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: marcofrk@gmail.com, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 29 Mar 2023 17:11:50 -0300, Fabio Estevam wrote:
> Marco's NXP email is no longer valid.
> 
> Marco told me offline that he has no interest to be listed as the
> maintainer contact for this binding, so add my contact.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: display: seiko,43wvf1g: Change the maintainer's contact
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b2d2d8decc8d239875420af6e412158ac5a2cb1f

-- 
Neil

