Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998D7B4CAE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAAB10E218;
	Mon,  2 Oct 2023 07:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302AC10E029
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:26:57 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id D11FC1865484;
 Mon,  2 Oct 2023 10:26:53 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id EGJ8tBZbybyi; Mon,  2 Oct 2023 10:26:53 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id 6B7D51865147;
 Mon,  2 Oct 2023 10:26:53 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id emH8Na_9A7FH; Mon,  2 Oct 2023 10:26:53 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.177.185.102])
 by mail.astralinux.ru (Postfix) with ESMTPS id A843518639B7;
 Mon,  2 Oct 2023 10:26:52 +0300 (MSK)
Received: from [10.177.232.254] (unknown [10.177.232.254])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4RzXZg5tKQzYcn0;
 Mon,  2 Oct 2023 10:26:51 +0300 (MSK)
Message-ID: <9e6d5cba-d40a-ff44-3400-d86d8257e98a@astralinux.ru>
Date: Mon, 2 Oct 2023 10:26:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH v2] drm: rcar-du: turn rcar_du_group_get() into void and
 remove its return value check
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <169383224922.277971.15400887308406098634@ping.linuxembedded.co.uk>
 <20230927104438.30628-1-adiupina@astralinux.ru>
 <20230930145032.GD31829@pendragon.ideasonboard.com>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGA0LAg0JTRjtC/0LjQvdCw?=
 <adiupina@astralinux.ru>
In-Reply-To: <20230930145032.GD31829@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 02 Oct 2023 07:39:32 +0000
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

I'm sorry, my mistake. Thank you for your comment, I will be more=20
careful in the future

30.09.2023 17:50, Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Using tools to find issues is fine in principle, but not even
> compile-testing the resulting patch before submitting it is not.



Alexandra

