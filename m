Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3F74F699
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 19:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F147010E40F;
	Tue, 11 Jul 2023 17:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496610E40C;
 Tue, 11 Jul 2023 17:09:25 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a337ddff16so4560820b6e.0; 
 Tue, 11 Jul 2023 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689095364; x=1691687364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hV73qAM5jf9inKvx6csq0KqHjwvvDMcIY0RseRx4sHw=;
 b=KsnguWp1cL02BOOOoJ1TaTf8Y0SafDGcsBF5GfTf6pumKDoV9KOB0sXU2v+Bhhh5BH
 WJHTTADm9CJU58zMfwF3UemrqZc5RZatpYy6a6SdG5IKkQHyL/z5ggzAQQx4/6njGDo/
 XqghiRvyFULKM2LCrRfrpLv3a/TJ/SbevxzYfup+8Px4XYB7l489NuGj9HKdUqUlMS+E
 5NzB8eF7AbmPKWdqzS3KL/DlySqUzi7jkR8+ZgK8XttrYJ12nJxBjTxnMF6xLaX2AXqq
 ZgFlciYcpFEt3gju1mEhxoIrZx7Lyol5bWJV2+2tyBq4/dJhB0q4hSU+yVl1oAsfmOAs
 7a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689095364; x=1691687364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hV73qAM5jf9inKvx6csq0KqHjwvvDMcIY0RseRx4sHw=;
 b=VUdTgk4QHhzL6ho3nE+5WXcx5ZuIWUjM8bMOfoBoKErCowm6Fifn8k/vtGrMnrMkiN
 oJSL3TKx7IxD1J20WJDfJONRTrhmKBv20CbXsaO40djhTpXKm3CMR2Fiiv2fZFvMYecC
 cDm0vT/d8VzzTQ6EUqWwstfkLlC+s0qUPuaF+6ORc2eMWx6/w/5Kx03toZW70FYx92oI
 o4rRAAk6g5IC4aTlIu/7MxunbUpS+tekE/8bzXOsdzaPRYQMiDg3xblDbwYrjfuwrsPD
 2bd9qx4O5ZVCDq3wdzRYuEPv7ojvsmGCH8zvD1dNKWuKj8r1YutiT608GA73mIb7tTL9
 hgLA==
X-Gm-Message-State: ABy/qLZOKyYRDEpiX4KCOzwaXn6YQmk0KsZyTOxaB7cB2e0XeFFvDK1x
 vIER+Ps5CK5UnQ0FPEP2g4mZfabpKw7x2FIKlGs=
X-Google-Smtp-Source: APBJJlFcGmgXTywqVKLKdpeTp/QyH1M6Jm5sM4BnLQk42aLUECLGYLnq5nAd87yE/9rrzgT2kkOqb0gmmexb9nhmbyo=
X-Received: by 2002:a54:4d9a:0:b0:3a4:12ba:fde4 with SMTP id
 y26-20020a544d9a000000b003a412bafde4mr2718510oix.33.1689095364314; Tue, 11
 Jul 2023 10:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230711133122.3710-1-christian.koenig@amd.com>
In-Reply-To: <20230711133122.3710-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Jul 2023 13:09:13 -0400
Message-ID: <CADnq5_Mr-Fnt7H=SDxYSFcLSYxSyWeCK8At7QDtJh3CJLA09cA@mail.gmail.com>
Subject: Re: drm_exec context for amdgpu
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 9:31=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi Alex,
>
> so apart from some RADV semaphore issue which seems to be unrelated to
> this changes our CI systems are happy with the changes.
>
> Can I get some ack to push them through drm-misc-next?

For the series:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
