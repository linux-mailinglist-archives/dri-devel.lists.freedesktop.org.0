Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0328455476
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 06:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C406E9AF;
	Thu, 18 Nov 2021 05:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59F16E9AF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 05:54:59 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso4667375pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 21:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bOAzmattOkvcfruVl5Z67av2Rvch+fLPuFTukNGwe3A=;
 b=o8h2sWYLd5XWa+md7lQ/hE89BFxTwwUy4XtrHQu9S0JIDZGO8ox3+0eJbDE04t1IVI
 QfGKFkKmdZf33E1TfOUEvlI1zqG3UEkM6Az6oMMJvLP7hbpHQ0tP6owlxHjzYt6SuXbD
 nSUe71E8Ju++ko9hxCNARkyZhSyf6qCV17RGI70zGHMmPXR9H1EApZCGjeecZbgjLoh8
 lssQ/sVQgHVde0xAD3zZiGN4bjLbEIlv5cTYMnMoJ703XVPoBh6eTu+OgctxMnsIJRtp
 wH0p1+OyiuB1CmqRxlzDR/MiIZh6EfsyY00chfU1D5cT1M+mTRRpEdVj7ona4+VTilrZ
 Nc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bOAzmattOkvcfruVl5Z67av2Rvch+fLPuFTukNGwe3A=;
 b=CvxcZlwyKqHBlgVnTUt567iTAgAsl20/CRfTpDznrpUGh/ZOSz0i8geVL8eqpIP+i+
 uTKXy/yszckHW+G2a0EglP9aVG6RpSsDbjFyVJrarkVmvbKSFQS23XKLHHJM8tcP857s
 RYz6DvI7XvSgSMuF+eNF6WviWo/U6IbzRv5sduHBhfxLizmIKdC9kb4bVsasShDpulGJ
 IRkuLuSN1yvxsXEJOAaPn1YkjutCoMly4EfoQfAnI8h9XKsOUs1qTdyicjVjCdJgZdQj
 V0MRp+eMj4sKmhZ61/kG1xkUnZNpwB05WKf0ba/fb6pNHfZ70m7zm5GjHebnx377u+5O
 TFjA==
X-Gm-Message-State: AOAM531yxEon+ZLhG5QSoBp7Cm8uNLObD7aY0TZ8v/uXbu5HhE1ZM+iO
 sOLb8TBeCoZBX3YOG/HiSf0+/Q==
X-Google-Smtp-Source: ABdhPJwUFsDmgl5qVC3k86jpjBVIz7wwm8wMnpc/baXerv1B56NwCz9bhbQbqVjLau27J/nIr7NuBg==
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr7493988pjb.10.1637214899232; 
 Wed, 17 Nov 2021 21:54:59 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8f8:11d:a96a:74d2])
 by smtp.gmail.com with ESMTPSA id n1sm1504736pfj.193.2021.11.17.21.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 21:54:58 -0800 (PST)
Date: Thu, 18 Nov 2021 13:54:55 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Subject: Re: Fix drm suspend and resume issue
Message-ID: <YZXqrxinyBZkBgfq@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 02:41:55PM +0800, jason-jh.lin wrote:
> Subject: [PATCH 0/3] Fix drm suspend and resume issue

You have 2 Subjects.  The first one takes precedence.
