Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D07E4344
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 16:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10110E609;
	Tue,  7 Nov 2023 15:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EB910E609
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 15:18:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C86136122C;
 Tue,  7 Nov 2023 15:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD475C433C9;
 Tue,  7 Nov 2023 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699370328;
 bh=uVJ645+VuEHxOP8w8Z+6y5IMCcpafxtnwjwVfF8N4mU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dKF+RYhHYzGOqcc1tWqUcEHmYDXpwsOrbAPC0yyuBAC+FmY+KiW8k1twqUiw9zVM/
 4NszSo7oeGlhDJ0QDUWeEroGyvH39RSeYtNxEKjLYspDnM+9TFfn2P+8eawyLYwDLV
 rkJ0wmZY7CTaXE8Af37cxvAJpKgbq2OS2aYNuW1wIfpM+k4RldibtyBVTIiaLMDua3
 idleeFra2A2zzNvhvhOus0gA+WQq52RQ0NzrWnhoRNyxQ43/bPTbehHVmGOhK3mXoZ
 ZoqUp6BHE0tGlbhtCwApBg0oH0UHqHK+OwY7GoCwzTbr8n78uD8uXyGTN6P05KicNz
 UwDkCXNYumttw==
Message-ID: <bbdedbf7-efad-48a2-8e27-53d03156fe17@kernel.org>
Date: Tue, 7 Nov 2023 08:18:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/12] Device Memory TCP
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mina Almasry <almasrymina@google.com>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 linux-kselftest@vger.kernel.org, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Is there a policy about cc'ing moderated lists on patch sets? I thought
there was, but not finding anything under Documentation/. Getting a
'needs moderator approval response' on every message is rather annoying.
