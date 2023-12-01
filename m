Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E962C80070B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3F410E0DD;
	Fri,  1 Dec 2023 09:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D183910E0DD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1701423100; x=1701682300;
 bh=R40xwJ5ZXVWF75wuJrURSlyJ6mwzxYaMIF9gQCcOzTI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=MzFOy8KC7MDm3loAEnPVEYW2PETiOOlVVyJU8Kh0ujd4bm99RgBdlxscGMLUE3XJT
 LJgJ61e6Tj6rg0yyKRfAiFQg68tG+qVidn54rRuVTOU4ZtV317FI0W3q9L9ohBecFp
 WH/jJV3u/aU2t97/6r0pR9O2Dp+lY+YewIMP5a3W+vd+qdTxMESQkV5MDHmPsqZXu2
 Pr3+LaA5lgEzo+v32Z83dThcjI6Kp1H+axJqJ/wtPCpeDCviBxVVzzFNck5TjN8rXc
 WptADAIdXIMPCkHaKem7VulOrHMrA31kM3ndscdq9iQeEiu5D0XEw4Aeo3oEIctaSV
 sfljdjJL+JG1A==
Date: Fri, 01 Dec 2023 09:31:23 +0000
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <40gonZRoP7FjDn_ugL_LpXsqwoSCZtypIe7jiWg0t8lkTx94-gESc60Cuu5eWxivJoZCNg3i-cUG9kNpKQZeYdCJPawDpTSIXivJ_t_a87E=@emersion.fr>
In-Reply-To: <20231130200740.53454-1-andrealmeid@igalia.com>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for writing these docs! A few comments below.

On Thursday, November 30th, 2023 at 21:07, Andr=C3=A9 Almeida <andrealmeid@=
igalia.com> wrote:

> +KMS atomic state
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion=
,
> +without ever applying intermediate or partial state changes.  Either the=
 whole
> +commit succeeds or fails, and it will never be applied partially. This i=
s the
> +fundamental improvement of the atomic API over the older non-atomic API =
which is
> +referred to as the "legacy API".  Applying intermediate state could unex=
pectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which me=
ans the

It would be nice to link DRM_MODE_ATOMIC_TEST_ONLY to the actual docs here.
This can be done with markup such as:

    :c:macro:`DRM_MODE_ATOMIC_TEST_ONLY`

Same applies to other #defines.

> +complete state change is validated but not applied.  Userspace should us=
e this

I'd s/should/can/ here, because there are valid cases where user-space does=
n't
really need to test before applying. Applying a state first validates it in=
 the
kernel anwyays.

> +flag to validate any state change before asking to apply it. If validati=
on fails
> +for any reason, userspace should attempt to fall back to another, perhap=
s
> +simpler, final state.  This allows userspace to probe for various config=
urations
> +without causing visible glitches on screen and without the need to undo =
a
> +probing change.
> +
> +The changes recorded in an atomic commit apply on top the current KMS st=
ate in
> +the kernel. Hence, the complete new KMS state is the complete old KMS st=
ate with
> +the committed property settings done on top. The kernel will try to avoi=
d
> +no-operation changes, so it is safe for userspace to send redundant prop=
erty
> +settings.  However, not every situation allows for no-op changes, due to=
 the
> +need to acquire locks for some attributes. Userspace needs to be aware t=
hat some
> +redundant information might result in oversynchronization issues.  No-op=
eration
> +changes do not count towards actually needed changes, e.g.  setting MODE=
_ID to a
> +different blob with identical contents as the current KMS state shall no=
t be a
> +modeset on its own. As a special exception for VRR needs, explicitly set=
ting
> +FB_ID to its current value is not a no-op.

I'm not sure talking about FB_ID is the right thing to do here. There is
nothing special about FB_ID in particular. For instance, setting CRTC_ID to=
 the
same value as before has the same effect. Talking specifically about FB_ID =
here
can be surprising for user-space: reading these docs, I'd assume setting
CRTC_ID to the same value as before is a no-op, but in reality it's not.

Instead, I'd suggest explaining how referencing a plane/CRTC/connector in a=
n
atomic commit adds it to the new state, even if there are no effective prop=
erty
value changes.

> +A "modeset" is a change in KMS state that might enable, disable, or temp=
orarily
> +disrupt the emitted video signal, possibly causing visible glitches on s=
creen. A
> +modeset may also take considerably more time to complete than other kind=
s of
> +changes, and the video sink might also need time to adapt to the new sig=
nal
> +properties. Therefore a modeset must be explicitly allowed with the flag
> +DRM_MODE_ATOMIC_ALLOW_MODESET.  This in combination with
> +DRM_MODE_ATOMIC_TEST_ONLY allows userspace to determine if a state chang=
e is
> +likely to cause visible disruption on screen and avoid such changes when=
 end
> +users do not expect them.
> +
> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
> +effectively change only the FB_ID property on any planes. No-operation c=
hanges
> +are ignored as always. Changing any other property will cause the commit=
 to be
> +rejected. Each driver may relax this restriction if they have guarantees=
 that
> +such property change doesn't cause modesets. Userspace can use TEST_ONLY=
 commits
> +to query the driver about this.

This doesn't 100% match reality at the moment, because core DRM now rejects=
 any
async commit which changes FB_ID on a non-primary plane. And there is no wa=
y
for drivers to relax this currently.

I'm not sure this is a good place to state such a rule. In the end, it's th=
e
same as always: the kernel will reject commits it can't perform.
DRM_MODE_PAGE_FLIP_ASYNC does not need to be a special case here. Even when
changing only FB_ID, the kernel might reject the commit (e.g. i915 does in =
some
cases).
