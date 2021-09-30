Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E441D77F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2066EB5E;
	Thu, 30 Sep 2021 10:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A496EB5D;
 Thu, 30 Sep 2021 10:17:33 +0000 (UTC)
Date: Thu, 30 Sep 2021 10:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1632997050;
 bh=omu6kUN/ZbjN/MA32O0UnYTGse061XaoIw5SVvXsMJg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kFLPl7HPxuXTisHVHRjo3tmjECLclF4sbz9BepfxOoj+K+F3V6xyK+RCwvy4v8zLY
 CUadODmeZxu+MWJsdu6xVmzimRpEfHQQbP+4IAtabwp9Y106PoqMvngC0QmY4kVW4I
 DKE9KzxLLNtMZcjOka56mhNvJQSkEwM7ddIhrNxJCWyZtEhcMixRZ30ufpj0PkAdtT
 LgTLVOKJ/wv5O1TW1ip1u4D0qQZgizRv6MBbKf/Q07JShMJzgufNX8HkCRCTFvyilB
 v8Gq+JBb0AY9bPx4nxZgo5G0baPoy88aluPiK6d7YuDxqRmZHcg9y8SDR+WHCkPts2
 GzjrPYCFQs0rg==
To: Guo Zhengkui <guozhengkui@vivo.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Guchun Chen <guchun.chen@amd.com>,
 Peng Ju Zhou <PengJu.Zhou@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Likun GAO <Likun.Gao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel@vivo.com
Subject: Re: [PATCH] drm/amdgpu: fix some repeated includings
Message-ID: <AGiYadRf5XyGUqLxwu3ykKzfwM2BgZo4yCAaEXdQiYfH2dbyKmipDNrclnI2lZH3HzNh71VBy5QKz3O4fFvQETjTI9hoKzKHjZNBz9ERKI8=@emersion.fr>
In-Reply-To: <20210930094239.7435-1-guozhengkui@vivo.com>
References: <20210930094239.7435-1-guozhengkui@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One include is v2, the other is v3, or am I missing something?
