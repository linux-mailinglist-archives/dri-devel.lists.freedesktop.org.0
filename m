Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D703CB9A7A7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3823010E752;
	Wed, 24 Sep 2025 15:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="m8JX20G0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D0C10E752
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1758726522; x=1759331322; i=markus.elfring@web.de;
 bh=Fxtcx4A1lIkBA+fnaYrI+5nN3wIMjoN2Kn6vJd6kzOg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:Cc:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=m8JX20G0Z5T/yaReHQNndEHofQqCM2lvX0rw2l9sy/Wt78/bOJDfI/hhg+ShEgHq
 mfHj6mM8B6HPGOzqYrP0bbiqxkYCUgmDhKOku6acHyttAy2plKI3DeIJg2m9Xqign
 lrpNwmgO21vthUFEaCKPpFumukR4VHKaWHD/cwsZVhtsrMxXzOmo7KTwcYm2+e2b8
 t8xg+tFfMbFjVKoD/cD9gBfiWdpm3TXNiRIE4yku4djdE9aNF7dGqh3Lk1JA8lUKE
 uKx88TwqHBt1ElKaXZW/jNQcleKJV9LgbVsGHxmCaR0YAVhKnEIs9OQ7eaaHfuDzI
 Wn054SAqQ1yn1Ri8nQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.191]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJWsc-1um6533Xei-00Yx6f; Wed, 24
 Sep 2025 17:08:41 +0200
Message-ID: <1071f2af-39be-425b-bdb0-7f004a6e8f65@web.de>
Date: Wed, 24 Sep 2025 17:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH] cocci: drm: report devm-allocated arguments and
 fields
To: Oleg Petrov <o.petrov@ispras.ru>, cocci@inria.fr,
 dri-devel@lists.freedesktop.org, lvc-project@linuxtesting.org,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250924140126.23027-1-o.petrov@ispras.ru>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vadim Mutilin <mutilin@ispras.ru>
In-Reply-To: <20250924140126.23027-1-o.petrov@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uZrWTvaoGpbDSZWsF91sFFye+hH7BZIZdED6uBooGDJEiUcJfaE
 7UACdoAp5MMPfoQMjAZ+r6Zj+UgH9dthLqgBDL/un/peke4LAq5DduG8chUXdJZCZIU+Qc+
 QBwUG8Iyc/2gn9DBG36YEGj+s3/pD3AcW8sYy9LeFnQ0WAHkffA1sr8LZXwMAU3e/bPudWy
 19whwCdVwJht8mnxv6O4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8tbrgLiUt60=;1mJvOUB5Vk9P8qigUFuC9CamA7Z
 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
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

> Add two Coccinelle rules: (1) flag a devres-managed pointer
> passed to a drm-init function, and (2) flag a devres-managed
> pointer assigned to a field of drm-managed struct. =E2=80=A6

I suggest to start each enumeration item on a separate text line.


Would you like to refer to =E2=80=9CCoccinelle: api:=E2=80=9D in the patch=
 prefix?


=E2=80=A6> +// Copyright: (C) 2025 Oleg Petrov ISPRAS

Would another delimiter be helpful between the personal name and the organ=
isation identifier?


=E2=80=A6> +virtual report
> +virtual org

The restriction on the support for two operation modes will need further d=
evelopment considerations.


=E2=80=A6> +devm =3D \(devm_kzalloc\|devm_kcalloc\|devm_kmalloc\|devm_kmal=
loc_array\)(...);

Would it be nicer to write such SmPL disjunctions on multiple lines?


=E2=80=A6> +@script:python depends on report@
> +p << badarg.p;
> +@@
> +msg =3D "WARNING devm-allocated argument in a drm-init; use drmm-init f=
amily (or drmm-alloc)."
> +coccilib.report.print_report(p[0], msg)

I would like to point out once more that such data can be printed
also without an extra variable like =E2=80=9Cmsg=E2=80=9D.


> +@script:python depends on org@
> +p << badarg.p;
> +@@
> +msg =3D "WARNING devm-allocated argument in a drm-init; use drmm-init f=
amily (or drmm-alloc)."
> +coccilib.org.print_report(p[0], msg)

Would the following method call be more appropriate?

coccilib.org.print_todo(p[0],
                        "WARNING: devm-allocated argument in a drm-init; u=
se drmm-init family (or drmm-alloc).")


Regards,
Markus
