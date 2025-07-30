Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDBB161E6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B87410E224;
	Wed, 30 Jul 2025 13:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="Z43Io18d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36AB10E224
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:53:37 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4ab814c4f2dso125818311cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1753883617; x=1754488417;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vtgksuO6hykHnoNmq1iFn0TxRbhqfR0C34eckzuDpoI=;
 b=Z43Io18dcXK96h62gfHRHTZDSiwhCcW0jbti7Octbs0JvwF6rGisS5KDepis+b0bWr
 JocDi/7A2Tclu59BN/uUKUhPCrIwzAEE4mznRL9uKCpGng0e5HOfqs3ym72VMv8i12zx
 hV7y3eMAyrkU1nJ+HDD51GfNtVS7BlH2uNQugfU7JIM17QcbjQ7kZUQHkxX9hBl7/Spk
 m02eI6hJTYsr9XsVIzE6oi/X8J2SI8MmJfQFprS4d78xjlwcTxZS5LqHyM3MImK8gdvq
 tqV634Zvrsg2cPwBq2Ouz3FAmyGXmvEAwRq6/haLIRsC2kCIyEMhpm1BUUBunTSvltbH
 jJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753883617; x=1754488417;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vtgksuO6hykHnoNmq1iFn0TxRbhqfR0C34eckzuDpoI=;
 b=eODNBiIyaM+iY4bF50rK9jAPo82CAlhzw740pRz1wR1kdtspyk8+VB6LvVDY8jKWLb
 ttYOyKilrtK9Jfx3ybq4Wp2ZiMWmpx/SQPIYzrKAzw9z0SGzQ1eowJdkKh1yS1Fc44Ho
 GwYYN8I+CDKioTvTrQPvYlrIiIdpvUe2kVflFyUN8gVtUqNM+CxJMKBqtHYguHReaN6r
 4xXPTNWtTLIBwhe/qoeRNN2PRfRkga5MuODfheu5wGyLToPABA2LCBxgCKtJ6kpucfvk
 ysG5TsDxuVmSqdt30p4hLtKtXM3m317+my4uJwO4oW2zdZ0bujZJseDMvTwzwHYCBavJ
 1UEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3k/FeLuFqdI5X0MpVYl052JJmlkseZ9OZ5uQquMy24hemBLhbrnLrvpkDnX6m9V93cCH77Pk9tQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwppUoYcgS5rp85aJIDMky83Hxwb5WFAtWPE/gOqm/krT3e89mE
 RIpcTsKLX173xPPRm6MOiwBdntrlDOMbEKeEkKj9VbMpaGm3SGMRJMnPgoXFVocY55i6kXrnf1k
 7WHG9imlTwCltpSFMd3zJ40kNP1z1RnAuoB54lAYFuA==
X-Gm-Gg: ASbGncvKG6eaB3F1MhKTWwLvbXjvYzd3VdZ7gGyIeAxIzEL6mOoZhEsdiqcVAY0fPSM
 BAtOH101NcbXGMd83OUd+wiqKtNFJa8W80fVzaxiO5gMcYLXgfOj+PvIVIx4q9t6DDM4cg5ZDBr
 /4TI9KFXaQAnbr4UWkyCy64FqUBHBexIrA7P4WIU5EFNVel1ePzZN623i84s4f6WdmWwSxNgubb
 GEhaDliuVlsZ18=
X-Google-Smtp-Source: AGHT+IEIQhExdDr4IKQExvv0orhOVhkECA1aSs0d6odXMaL4dWzG19C7jkn8agUo/YEkRE1/ySb6/ndtjxxgYgLkvhg=
X-Received: by 2002:a05:622a:342:b0:4ab:3a21:c08f with SMTP id
 d75a77b69052e-4aedbc826b7mr51999961cf.47.1753883616833; Wed, 30 Jul 2025
 06:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250730133457.2076784-1-colin.i.king@gmail.com>
In-Reply-To: <20250730133457.2076784-1-colin.i.king@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 30 Jul 2025 14:53:25 +0100
X-Gm-Features: Ac12FXx55sEzySCoos6kjkVRDMdpbePHcxwOGpuWags5QI6mVL28NlrpkS_nyF0
Message-ID: <CAPj87rMcb-m_-ek3JqFiY19Xfwwym8mbn3V0tLog434Uc-Wc7Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/kmb: Fix dereference of pointer plane before a
 null check
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 30 Jul 2025 at 14:35, Colin Ian King <colin.i.king@gmail.com> wrote:
> Currently pointer plane is being dereferenced on the calls to
> drm_atomic_get_old_plane_state and drm_atomic_get_new_plane_state
> when assigning old_plane_state and new_plane_state, this could
> lead to a null pointer dereference. Fix this by first performing
> a null pointer check on plane, then assigning old_plane_state and
> new_plance_state and then null pointer checking these.

plane cannot be NULL, so that check should just be deleted instead.

Cheers,
Daniel
