Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686D763FEB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 21:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5290910E4B7;
	Wed, 26 Jul 2023 19:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981D410E4B7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 19:44:55 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2680a031283so143590a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690400695; x=1691005495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8ddmRIb4i/h+sjn7hQWE5kAmGSnaaAcWeE6O6HXJcxs=;
 b=gTgJOOjmXViRqVB8PWx1C9q4AcB39FhekgiPKuNA8kB2Q71Pde1NI4BKgUScEtJCbe
 kl1eJ9ksh/y4Bc8/B+WEPxrDnblB+nBEJakz6cAwRMbZboK6ar/+R3frF0nxEp49LRfw
 Gz7HRVS32tML0iuoV1fu3mDU6YJe0mbE4rISg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690400695; x=1691005495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ddmRIb4i/h+sjn7hQWE5kAmGSnaaAcWeE6O6HXJcxs=;
 b=dOtc11YvNFVJe6KhGB2xCKCbaTDKZeA7TWM6RP3NGTi0x/9vhzq1kMnG+9tm70L2Ol
 XYE2Pjx5jKbRsIYKnrTrPq/p57bgNILT7NtxAXtqDxsdTolrtZCtLCxMmTqjA9t1IO4Z
 C/rfPG9nnDnf83i4VkSxD2F/jnuXxSYzPeNjIv67SbZDtAZn4Bme6sI0kkTj5LD+9v1j
 1roaZoKM69AB6KwVh9inQRqACytcJaSprNsqc22Kv0ZhcvdUECnBPtTkVyshsxBYp57y
 55Z9zKnq8LY7klRuQRfVHLVS60XbL/hGTfwG8sC77t4fz2K8z0QrPa8BSIbqiK8FNc2i
 1AVA==
X-Gm-Message-State: ABy/qLbyB7Q5a5Vqg4he3c3Bge4dho0aIIeY7A0TBf+m/c+fM0isp95J
 2CAVojqS9IviArONfuKxcf/+sVfZediLGNPp6zVLHA==
X-Google-Smtp-Source: APBJJlEJiBzzS/3WnvQvdTP3lCShgQFzMzH77QVBiBNzQKo3iuikMlbL7E6NEzCyaiK8QlkeUFF4IkacY/8lgbRPL08=
X-Received: by 2002:a17:90a:542:b0:267:f9ab:15bb with SMTP id
 h2-20020a17090a054200b00267f9ab15bbmr2317243pjf.14.1690400695143; Wed, 26 Jul
 2023 12:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
In-Reply-To: <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 26 Jul 2023 15:44:44 -0400
Message-ID: <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Would it make more sense to commmonize function mtk_plane_format_mod_supported()
> and call that one here instead?
I had considered that, but mtk_plane_format_mod_supported() is
required to take a drm_plane as a parameter in order to conform to the
type signature defined in drm_plane_funcs, but
mtk_drm_mode_fb_create() does not have a drm_plane to provide, since
the framebuffer is created later in the function. Technically we don't
actually use the drm_plane in the implementation of
mtk_plane_format_mod_supported() today, so we could just use a null
pointer, but I figured we may one day need to add per-plane logic.

> This is not DRM_FORMAT_MOD_INVALID. Please either explicitly compare against INVALID if that's what you meant, or against LINEAR if that's what you meant, or both.
Ack, I meant to use LINEAR. Will update for the next version of the patch.
