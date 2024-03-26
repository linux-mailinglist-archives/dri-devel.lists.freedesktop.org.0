Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD488BD67
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 10:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3692B10EE02;
	Tue, 26 Mar 2024 09:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="17He3t5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8AC10EDF3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1711444534; x=1711703734;
 bh=uHkjh4wo6VYxK6JVfU3FNXjUFPyNrDTyCb8FrZZAQDc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=17He3t5jf/YJcqQ+xITAi1/j4sVJbJ9wHTNOzavkZpiI5BMpFkjUd52htbAwSq6i8
 Ct8Szvrqq1fFT6c8aPvWXFrOwhCAO5WyEohafBaAz1/QPMZuooYM8b51fHGI24evJv
 7G8Sl1mSU5gMwOeD7UIrl5+LWmAU/uPZqBivLpSonhL0yYITVbCqoiHSxAu5tTYlzb
 q1ByBh5iEuo/Eye3G7LANNOwUZXT7cqDTLUwn880JWqxYpJUyZByXGDBHax6D83Q5V
 Jgdbi2o9Yg2D5WtUbTiVsr8d0taJTZ6WjmglypTNc1nhPB7mrNacmXaFbvY+y4wFnR
 PSa8xHj9idpdg==
Date: Tue, 26 Mar 2024 09:15:15 +0000
To: Rob Clark <robdclark@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Dominik Behr <dbehr@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
Message-ID: <1Wwj_q3RYer6np0Orz0wJd9dlF82iBSX-PIVSlhCgJbpfVBMHF_CF04gHojkvqnvz9NXH6kACZGXQG9yXwtkbjIzLmdi-GNDkO5Nz2E-J9Y=@emersion.fr>
In-Reply-To: <20240322214801.319975-1-robdclark@gmail.com>
References: <20240322214801.319975-1-robdclark@gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Makes sense to me!

Reviewed-by: Simon Ser <contact@emersion.fr>
