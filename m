Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC8B812892
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 07:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C372A10E27D;
	Thu, 14 Dec 2023 06:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F237810E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 06:51:41 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a1f8a1e9637so55040966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 22:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702536700; x=1703141500;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHsxzvl396B9TsbSvTEJt3J2hBdAgjNAT8bOMCH4v2w=;
 b=jLaBjxh27Jt2LdUz3Xg3BQp+EkxuH/BrNJhLYWkfISzTfSb1Aq+53flK33pxSnqH1+
 bfvrYq4cS7M07jfXUaVRn4SiYAUAgJ5X2oooGsG16zoiIncoxefZ2flX5eXVGiiqa5L4
 9QOwllh4omcSFAv0bfDpgHEnz1/y9npcl+q6j4816Av4WiWtrpnI7D2PmYMUydAe7o8m
 BjBTZpbqOKAZDlkSxNVxfZVEaSTHCXBHJ+LLYZDM4tQ9vnbM8nl4dnDBQx1GRFcmvlb4
 zYe1oLwshAXJWsDPJ5aqXRidJGuqLtjzYzwmVmBwt+zLLqo988pV5Edis52ney5wIXHs
 C5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702536700; x=1703141500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHsxzvl396B9TsbSvTEJt3J2hBdAgjNAT8bOMCH4v2w=;
 b=uVsi1AUZE4rkmQ7Xd/yZD8gfSChIO8I/RYQPsMufLVEj1HSve3Uw+BtdbSqgIxGXcC
 Mu0j2H7sFJoaw0kF1yD2xwMzptNBxRqftE6xvd+71cZ0MnkFA4pynxnuQEJP3r64kZnH
 tfYv1a0fI5w4sK7LZNbEu+40K8gVRCUvVanFc5rZEgXwD41L/6b89xWeJ4m5z6R81ZEJ
 cXbY/getqWbEY9f82BPvOdKtnB8DSYicxhdMW/Z/F3Jv+bNhw4pgi+iJGbJWe9V0+hAs
 ty+nRKbF2usRTx9qYT0hOeCHvM/Xa6iEfvwbwqvVHRCYNN260eCzFik7kGxvnGa7LjoL
 hSoQ==
X-Gm-Message-State: AOJu0YzMRGuQpsnz2JdnuN9eZBM9UI8vs3UIbBGILtykc5hcVa+mlo9/
 4To7vzhmdGrzBUOTT4PSU8aXsoC6ZytaVxPhweNSRA==
X-Google-Smtp-Source: AGHT+IFhKjoYARnFGO13ApN7eSk09nSCJTSeKyT66yoX39zQ2bSsEmHScKXeMW+UKEwtUalYt70IEOQCcn29bH3NZ24=
X-Received: by 2002:a17:906:5197:b0:9ee:295:5693 with SMTP id
 y23-20020a170906519700b009ee02955693mr8600960ejk.7.1702536700141; Wed, 13 Dec
 2023 22:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <170253482786.28524.10625748175644260187.git-patchwork-notify@kernel.org>
 <ZXqlWT2JYg0sa7IF@infradead.org>
In-Reply-To: <ZXqlWT2JYg0sa7IF@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 13 Dec 2023 22:51:25 -0800
Message-ID: <CAHS8izNCvxuTsKV73oTu3xS7ZVr0riBdYGbKnsHptVe_e-t5MQ@mail.gmail.com>
Subject: Re: [net-next v1 00/16] Device Memory TCP
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 edumazet@google.com, linux-kselftest@vger.kernel.org,
 patchwork-bot+netdevbpf@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org,
 linux-arch@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 jeroendb@google.com, corbet@lwn.net, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, hawk@kernel.org, arnd@arndb.de,
 shailend@google.com, shakeelb@google.com, hramamurthy@google.com,
 netdev@vger.kernel.org, dsahern@kernel.org, ilias.apalodimas@linaro.org,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com, linyunsheng@huawei.com,
 pkaligineedi@google.com, bpf@vger.kernel.org, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 10:49=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Thu, Dec 14, 2023 at 06:20:27AM +0000, patchwork-bot+netdevbpf@kernel.=
org wrote:
> > Hello:
> >
> > This series was applied to netdev/net-next.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
>
> Umm, this is still very broken in intraction with other subsystems.
> Please don't push ahead so quickly.
>

The bot is just a bit optimistic. Only this first patch was applied.
It does not interact with other subsystems.

  - [net-next,v1,01/16] net: page_pool: factor out releasing DMA from
releasing the page

--=20
Thanks,
Mina
