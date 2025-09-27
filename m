Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A9BA5C83
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 11:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADE910E376;
	Sat, 27 Sep 2025 09:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="pPFXo2O7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A94110E376
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1758965631; x=1759570431; i=markus.elfring@web.de;
 bh=/1u+8sTR3V72H77qUnr2FeN0KokPITGVnFfledBDv7Y=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:Cc:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pPFXo2O7x70whVCIhPyMRpzKQ4vWcydAyCBtuZL08YIfGVlGgTDhXWzBa04/RK4N
 F91dvQVHPLjOJeAulSpgQ+chdoL35csCGOZ7XRtfq1IKGH4OhPT4uCYW1eZbHqUGe
 7puWQTvYCGBXCSra9D2+mtnUQtQkbuQGVhOvbtQ1LmqCqEylgO+y9tT/xZ6T0D7ls
 lLpRExGnIrtNVlrF3YYQA6k4hCBPPmDe17wD96vzsZmXN33lKsHJBcsqJX8qLkQPw
 pZa6CduSqSzAWPqhz1nRfXd8xVBEHXybPZZh2HeE4xRkk4kdOtqqsEs0pDeLz3CXs
 Y/pGIqF+YWrpR81yYQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.221]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHVal-1v6Xtv42DZ-001l4o; Sat, 27
 Sep 2025 11:33:51 +0200
Message-ID: <b994f006-552b-41a8-9714-5efef68f2f12@web.de>
Date: Sat, 27 Sep 2025 11:33:47 +0200
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
X-Provags-ID: V03:K1:71UA9sLb3/4N2kgrxV5wtqmcFepCKuA18AEhzGF0nUvfaZdmNGU
 16e3IOhQJjiY7J9OXdOH6RvcOTWHGdggqnGssIJK51l1WqMisQZOH70im6sO9qTCGhH0Ra0
 CGTejKhaqhPE86JtBFqHSfZMo3LpiZjjKJk01mtDXN2zTOkbnu3wU07j8vqACKyjeS1rBw+
 jifTNX3OfmMLbuHUNX0jA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9AjejW254dk=;3rK4r3f2e9XASgGM8HIuN/IKzc6
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

=E2=80=A6> +// find devm-allocated (devres-managed) second arg for drm*ini=
t functions
> +@badarg exists@
> +position p;
> +expression devm,e;
> +@@
> +// only devm_kzalloc is really used
> +devm =3D \(devm_kzalloc\|devm_kcalloc\|devm_kmalloc\|devm_kmalloc_array=
\)(...);
> +...
=E2=80=A6> +// same as above, but with an intermediate local variable
> +@badarg2 exists@
> +position p;
> +expression devm,e;
> +identifier vitm;
> +@@
> +// only devm_kzalloc is really used
> +devm =3D \(devm_kzalloc\|devm_kcalloc\|devm_kmalloc\|devm_kmalloc_array=
\)(...);
> +...
> +vitm =3D <+...devm...+>;
=E2=80=A6

Your source code search approach affects recurring development concerns.

The shown rules start with the same SmPL code.
Thus I would find it nicer if such duplicate code can be avoided.
I imagine that software run time characteristics would be more desirable
if selected data processing does not need to be repeated.

The search should obviously be continued after a relevant source code plac=
e was found.


=E2=80=A6> +@script:python depends on report@
> +p << badarg.p;
=E2=80=A6> +@script:python depends on report@
> +p << badarg2.p;
=E2=80=A6> +@script:python depends on report@
> +p << badfield.p;
=E2=80=A6

Will development interests grow for another clarification approach?

Support for SmPL rule groups
2019-04-07
https://github.com/coccinelle/coccinelle/issues/164

Regards,
Markus
