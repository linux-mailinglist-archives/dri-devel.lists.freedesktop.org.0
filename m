Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF81B383B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C3E6E9BC;
	Wed, 22 Apr 2020 06:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0E16E895;
 Tue, 21 Apr 2020 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587467549;
 bh=O5UFoBp/u/YGve2539Ml1suvS962s7VYeI16yybZvPs=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=fr+vNmxvF6ksTrRXdZK4j5atjhg2vhao13RM4Ppg20XbCXSsutf+cN6EBspZT/WyG
 uWYJIqKKcVVluYAxcrLJPco5hDKyGSAwL9Y6JqY7Jh9bug0T1nMdSy4MqX+8w5WCfh
 g0lmlKKuJUSCvIHQDIZyRzYTlnvzm+jQdMzyDeII=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.91.59]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M9XM3-1jW7E33KOd-00D1e6; Tue, 21
 Apr 2020 13:12:28 +0200
Subject: Re: [V3] amdgpu: remove unnecessary condition check
To: =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <AIsA-wCZCFCxiq0WKb3WjKr*.3.1587458683834.Hmail.bernard@vivo.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <c12c2bfe-785a-3279-721e-3efd2e0f7b2c@web.de>
Date: Tue, 21 Apr 2020 13:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AIsA-wCZCFCxiq0WKb3WjKr*.3.1587458683834.Hmail.bernard@vivo.com>
Content-Language: en-US
X-Provags-ID: V03:K1:mCPUfKMzwUiOkjUTV5F70mtnY9PpBoYAwL6Vc5A1nyuUxnokLJA
 TKqhFejjfmU1T/A/0WsYdV3do9OwELrcIioUHURJ9EkSzwsBCfzctvY1a8V+a70GWTFcdxd
 foCVKbcaPlim5xA0GbRH9rrGNNexa6L1/MO5heq1uKVww5EehFEEJr7qtTQs6eo1COqLHE2
 J+34otu69y2xq9aISg2hg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dya4Us5oLyU=:mCwa85+cUoC74r+ODmJtK9
 3IktGA0M6a4qXuHi2rnC13RGVR7OYOnenC06SkYnsX//MGRUs+wgqEab4iAcCR0d5342wFDfN
 dk+fOJInAdBdpnjg2/f3VLQ3hHW+y1Ubd/v5ejQmzaXQFvsweXXYTlXuJmOe4NotJKQBvZ/7T
 CM347BMEen7iBEeu0cxinWBEn6z+8/Gwcl/xgBpHDPm1KXLoa8hJK78mUnHM21IbwV6K7ePo7
 ziBSdUkuuQk1duiEjskgTvM6ppXFC5R12Skm9EUCnrbwy6yG7yhbeJGqy+icBUa/JBUiNpJxD
 dqPyzRX0KO4raZSlc21BtCKpVq+OjFR627f1MrTZlNpzRzzhU4nHqENhtR69c7dBRIn4bDcJc
 FdpsxWzTRXHnV/x4izp8vS3TEl0ihr0GRXiCPA8BcpNQUw3OMye/TWa0qiBo9v7NBiTdLUb2P
 kuKayIgYydA1EKcFX0H1eXzUZpSyJ3YEeA3Npef1LWpZ7GmvnEgvqXHysFF3+HnP+vKjbYW/s
 5mZ7J54tTeTDJL39kddWqi58c9meTtrQKhIwEUlyafbWh6Td5FdB5zESI7fe4qdf+hVUfJYQB
 jnhd3rVVtcQCqHS9bcU5WiBNzrnCjeiKUtcdup/vkDGj257HlewCryakTA4/h9t0h/rbhrdST
 mrE9BynDQNhCp2wJuDc9m1YAuti/2k1GTq+D1nocFOQ76nskfAEHZL3TdZtBSjqg+Cr6dTJDH
 JEjEofGDL5o0NXd/DHJMkk7wyDrQo3+oNcVY5ieaf24V5tYxk+66KPVcDrzqfgYI0d2wkVy2A
 flGw0TtivNkjfwWQRyN/NvNwusrjs9NoWR0iGkWcbks62U+hvOpoNEywz6i2mBG2DsPM7vtWt
 9nCLjO0gfoXVulHPwT73Xz4ftuUAnVIFxO9561ufTiQTQHFDP2S0JTFAihOjiNXZF1e5GPtBJ
 YdRZvP5DprdD6a24ii0nObrHlEdR8lySSQNsW6UZCHBwhDXy1F/M35PIgCqsXmF9XslQ7N+MZ
 mSr69H+tixc7gg4tU8FR1WSyTcSbVc431mTpLklI/WnvI6ROBPA0ziyecoEapwClaizfoF786
 mJ+rrs1KDrcThhFWYE6VW+mARpBrnJvruuDCbQEI7iIMyx1MPhzu7fMEdCIVoID8+6X/EsYvV
 n1CbacYxkUYKg2SHewoGOTVPBPOey0Krujf1fm8oWixjscDkJuBjsDdCZdafHQxDG8dIdlbqu
 YPiYhR3cMcue0F7+8
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>>> There is no need to if check again, maybe we could merge
>>> into the above else branch.

I find also this commit message still improvable (besides the mentioned
implementation details around coding style concerns).
How will corresponding review comments be taken better into account?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
