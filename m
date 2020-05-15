Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6E71D4ACC
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA4D6EC65;
	Fri, 15 May 2020 10:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B696EC65
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:23:33 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jZXV2-0005tE-8z; Fri, 15 May 2020 12:23:28 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 30/38] drm/rockchip: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 12:23:27 +0200
Message-ID: <3540787.OpBcxyUbzj@diego>
In-Reply-To: <20200515095118.2743122-31-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-31-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 15. Mai 2020, 11:51:10 CEST schrieb Emil Velikov:
> From: Emil Velikov <emil.velikov@collabora.com>
> =

> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
> =

> Just drop the suffix. It makes the API cleaner.
> =

> Done via the following script:
> =

> __from=3Ddrm_gem_object_put_unlocked
> __to=3Ddrm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>   sed -i  "s/$__from/$__to/g" $__file;
> done
> =

> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: David Airlie <airlied@linux.ie>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
