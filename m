Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C827373A16C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 15:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF82610E560;
	Thu, 22 Jun 2023 13:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02D610E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 13:05:37 +0000 (UTC)
Received: (qmail 18934 invoked by uid 990); 22 Jun 2023 13:05:34 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Thu, 22 Jun 2023 13:05:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <c451cea0e0541f786e06d771afeb4112d3349dbc@lausen.nl>
TLS-Required: No
Subject: Re: [Freedreno] [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Kuogee Hsieh"
 <quic_khsieh@quicinc.com>, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>, regressions@lists.linux.dev
In-Reply-To: <f98dcffe4b1dc91edf692fbaa766a263910f2c5b@lausen.nl>
References: <f98dcffe4b1dc91edf692fbaa766a263910f2c5b@lausen.nl>
 <932ee149-c524-25e7-ee49-5ea1a7e6708c@quicinc.com>
 <e547edf4-1b48-5d12-1600-45f78e7cab49@quicinc.com>
 <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
 <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
 <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
 <49d175ec16e3f65a18265063e51092ee8d0d79c1@lausen.nl>
 <f2d1bb37-ea83-4d5d-6ef5-ae84c26d6ac1@quicinc.com>
 <b9c8243ed53c5c9d7c1b5711237f6130976ea99b@lausen.nl>
X-Rspamd-Bar: /
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-1.376189) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: 0.02381
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Thu, 22 Jun 2023 15:05:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=vccUnMmIqdngT99oaK8My7B6NiGz9nspCO7ChiAPVtI=;
 b=BvxzYWRr6A5zJe+/S9o10zNf9FhFlriFlWDTcyToHnftwViksxL3QK1bAlfDH72t91Kp870plW
 ebKanfqnUQWFRbAz6WvO1SIcpplgaC+qQLl2Nyd506fL376PY8epR3gBxeFSd92R3IvBQT9rU+2o
 RKEgKDlHsbNszoREiduTSgTqvuJxE5vW377XXDZRqKhcqJV+ZsbgtWRfPsQpgtPFDEJNetCDqloJ
 tl+ohiZfk3R5DFLBwimlIuBC+nbRHGKBbU6XUlXzMxEx0+uBxXd6mU8ffydJaIEyxxpx9iK9VF21
 XG2Hg0TAuqEvHW3sOJRigerZPXAUQibGgHKwgaKxPZsxD+gAGHnmfGpzwGnlXjfrq8UZg/o6uCRg
 37pkIDED7SE9BN1fwBe5KYk7oxHJi/FNBOEpSXA2VV5GEwBh3/+NmFtwrIJKrYT/BKYzCFJYOkA4
 EfYCpPvv/SVrgoptTxrfcE5kwhEk35GdQlzGvJ26makQmTglqgiQhoIJ8Q6ZT6nbSKognSFQAHuk
 jQ3ktfuskG8gKMYxTzEqDgJObOQ6gJCgS04B6w4j/lYSgtjP9xC8qPzKIHVxg+ChR0I2OeU2quso
 NKa+AWqiKVVtxBx7+txGbHlmeyQiPp2tIw3bPMkr0Rszuy4z0ID3cN3wRtW8p87qOvrFuNWX3Z7L
 Q=
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
Cc: Sean
 Paul <sean@poorly.run>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Nikita   Travkin <nikita@trvn.ru>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > https://patchwork.freedesktop.org/patch/538601/?series=3D118148&rev=
=3D3
> >  Apologies if you were not CCed on this, if a next version is CCed,
> >=20
>=20>  will ask kuogee to cc you.
> >=20
>=20>  Meanwhile, will be great if you can verify if it works for you and
> >=20
>=20>  provide Tested-by tags.
> >=20
>=20
> I see Bjorn also tested the patch. As it fixes a serious USB-C DP regre=
ssion which broke USB-C DP completely on lazor for v6.3, can it be includ=
ed in upcoming 6.3.y release?

Kuogee's fix has since been committed to drm-tip on 2023-06-08 as a8e981a=
c2d0eb9dd53a4c173e29ca0c99c88abe2. Since it fixes a serious regression in=
 6.3 and 6.4 kernels, can we include it for the stable releases?

Thank you
Leonard
