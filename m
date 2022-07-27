Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645C45820EA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD67C1BA1;
	Wed, 27 Jul 2022 07:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FCEC1A91
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:18:46 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id os14so30000021ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 00:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSx3wHVt7xAJmmMmIb8aW81Pol+b+vBcAqVHpxDw1YE=;
 b=vPPLAZkTvD5XkCEzh4ztZJr02ihnqDWfDjpcz48VEmrwOWsLCg3FbCUYkjTXGdxVSp
 0cJtZzJeEHur6jCRjr7TEOfindV2xd1V35jiE9fns0aon/JS2EtxRxTzbYQv7hS7/DXs
 qm/LSQVdfa4nztx6M0i7j62iyrdw8j1Fv/a2KSPxyoeLAThVj6I6+RAqwxdL/cLDCVvr
 mEh6xLr7a089GE97jcX7ScTz/xpCKQy8M8ozOXxqGOL4ho81ggdYr2L7C1XkEFib9c6D
 Dx+v5rVAfO1J4jZBZyskFmzd8i90dC6ua2ft2udBjL0n7l5W3RagPeK7UNX3fMV1S0e7
 b13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSx3wHVt7xAJmmMmIb8aW81Pol+b+vBcAqVHpxDw1YE=;
 b=FN5i8OJ0lK8BSxaF1ZnOfun6T3c6akuA4F3+LeeiI5xcr5vfe/mSpAppPmlr8EbhXx
 bTK2eBMQ+Qe0IKsoUpMa28M5CuW7GGVi8SNJiiMj0vxHbhFBRCICGCnHChivAqjr7RMd
 dpv6mGM2Ccwi0cRTFefBhCah+QTr1JglgjK/yePetDHnjpLJ4iimBzVOQIN6V+C7LnlV
 boXBTKUNau54Lvesu1aOcJB/mRcOoVO3WlEEi4CSLTaVn0rpnijnDKEwYCQwOw0Xnlh0
 RZSeNhodx2tVJzkcgdQVoyTpXyUPKbI2ju3JeyzhCj6kvRjIdc5U+/Tfe1Pi4urBZEKg
 rDAQ==
X-Gm-Message-State: AJIora811FNduHd4BxUNjve/vyuXHL0SZc2KcvpxCr0YTw3dKyVUJcqm
 3RaDNgUsWn6vaZbzruGxNjT7PcVPPc47a9Cpo6gLtg==
X-Google-Smtp-Source: AGRyM1uOWuMb7hdqzBwxTZzJsWfLCr5rBYpu5OaNGOvW35Amyw+j4mlWvcvZj18uXu+oCVQcqT4sPb/HyrW/OICyuuE=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr17036681ejs.190.1658906324665; Wed, 27
 Jul 2022 00:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220721062345.46842-1-slark_xiao@163.com>
In-Reply-To: <20220721062345.46842-1-slark_xiao@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 Jul 2022 09:18:33 +0200
Message-ID: <CACRpkdbM+RHcOrdzdfVE3qMb9-YJGqL8b1i0bqyMnFXEsSJQrA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix typo 'the the' in comment
To: Slark Xiao <slark_xiao@163.com>
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, sam@ravnborg.org,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 21, 2022 at 8:24 AM Slark Xiao <slark_xiao@163.com> wrote:

> Replace 'the the' with 'the' in the comment.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Patch applied!

Yours,
Linus Walleij
