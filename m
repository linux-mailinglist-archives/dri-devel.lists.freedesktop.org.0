Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992B370D6D9
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCDA10E03C;
	Tue, 23 May 2023 08:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CB110E3C8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 02:39:58 +0000 (UTC)
Received: (qmail 7637 invoked by uid 990); 23 May 2023 02:39:55 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Tue, 23 May 2023 02:39:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <49d175ec16e3f65a18265063e51092ee8d0d79c1@lausen.nl>
TLS-Required: No
Subject: Re: [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>
In-Reply-To: <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
References: <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
 <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
 <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
X-Rspamd-Bar: +
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-0.000128) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: 1.399871
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Tue, 23 May 2023 04:39:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=2py7sSWEr5LcTyrtnazJBVn2Bb0q8G3RqcXydECid+g=;
 b=n4BaIr5cgPGpaY3VsxvHYwHY2OFbcIsnsLMF+WZjO5zBzudI+hklJbnyT3jwDCylB5xzHTyulc
 JOVSV42wZ5o4b1XlCxXjGdnDNuldhk/KDYlYP/MgEiyLO9tBS/G2EAFnO1K6AldFnRqjtygruD6L
 PLFLjlUOfT164e+5rgxSNZrizg/e8xjQIt1ecLsaHFI/ZMN0Sk/pVca7q9inPYHMqpnIN/5/dZFn
 PhPlW2THAPx4G6AmJt8Zkz0oEoNVbZ0xmxr1QNUTFMn9pQorqNBh7kcIsYHpXLDLi5Rd0pqAEf4P
 g75xmDs+EtWpH28yQr9koJBcUT4dCL/dWG1wmMbSzox0xSwyisovpBGEKlY+PtS3sR83n/dQ0BrU
 IEJwvelq7LqPQ9eUFSY4FRCaM1ap4wEvinBpIG0m2CwKh7WdU5XOMD8s4CTB1FUPHaeu/Ae1iwqs
 mUT6EG9Yx3yWQuh8CHucbntKbiWXvo7WlJe0L+Jdy/vJDvp5z2+YeDTOkkHxnLlyjSACv/g2cApk
 hrRsqGIwWbqBT9L6qczY857RL7xdmY2kkgY3osn2YK2At/UgUriA51to6ZIq1VKZ7C75W4fyH9Tm
 0ENPzUD92avmLXqnHoYJJMLzgMNPVkfwji/OGLgBOHY6yfym4aYvucjEQsrqQTx9MNFHs+DxoJi/
 A=
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 Nikita Travkin <nikita@trvn.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abhinav Kumar <quic_abhinavk@quicinc.com> writes:
>>>> There is no need to add the 100ms delay back yet.
>>>>
>>>> thanks for posting this but NAK on this patch till we post the fix t=
his
>>>> week.
>>>>
>>>> Appreciate a bit of patience till then.
>>>
>>> This regression is already part of the 6.3 stable release series. Wil=
l
>>> the new patch qualify for inclusion in 6.3.y? Or will it be part of 6=
.4
>>> and this revert should go into 6.3.y?
>>=20
>>=20This is a tough situation, as landing a revert will break x13s, as n=
oted=20
>>=20by Bjorn. Given that the workaround is known at this moment, I would=
=20
>>=20like to wait for the patch from Abhinav to appear, then we can decid=
e=20
>>=20which of the fixes should go to the stable kernel.

I wasn't able to find new patches, though may have missed them. Is there
a decision yet how to proceed with this regression? 6.2 now being EOL
may make this a good moment to decide on the next steps.

>>> [=C2=A0 275.025497] [drm:dpu_encoder_phys_vid_wait_for_commit_done:48=
8]=20
>>>=20[dpu error]vblank timeout
>>> [=C2=A0 275.025514] [drm:dpu_kms_wait_for_commit_done:510] [dpu error=
]wait=20
>>>=20for commit done returned -110
>>> [=C2=A0 275.064141] [drm:dpu_encoder_frame_done_timeout:2382] [dpu=20
>>>=20error]enc33 frame done timeout
>
> This is a different crash but the root-cause of both the issues is the=
=20
>=20bridge hpd_enable/disable series.
>
> https://patchwork.freedesktop.org/patch/514414/
>
> This is breaking the sequence and logic of internal hpd as per my=20
>=20discussion with kuogee.
>
> We are analyzing the issue and the fix internally first and once we=20
>=20figure out all the details will post it.

Thank you!
