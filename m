Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E77FD89B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 14:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86A10E1DD;
	Wed, 29 Nov 2023 13:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566A310E1DD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 13:49:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D9EAF3200B89;
 Wed, 29 Nov 2023 08:49:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Nov 2023 08:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701265784; x=1701352184; bh=AY
 qR2FYNis+6ueG4BiHliUkj1RWJ5ay7P8i59rrCpAg=; b=ile7QmuUZmWrI3cizj
 d1ghvvS1eN9S7laIFLS2dxvGN7XzQm2kxREyuAVjR4KVronGybkMW6RWh9DhFMw5
 Dov3BaQ9TLMyGT7RsTmAoJDJ8LJklLldBx5tH1wekA+sS7KhhsMOSNKHXZNlwCmW
 NLV8ItJvAemgGNMa4L2EUGuhKY0xjMJuMj3bXPwCidTRGNVIc3vzCI0y8aaYXeaw
 duuwBV5E5WcV2+f995w2EjG3IF5OfHebxX58NNqzTUEezHc8IPwjB8JGz4wcJ0fW
 NuThq8IScaDIK6eBdf9SJMZS/A3DAtS8mhksQouEubA3orjmJ1jsx1PpW0MG+IHj
 ZqyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701265784; x=1701352184; bh=AYqR2FYNis+6u
 eG4BiHliUkj1RWJ5ay7P8i59rrCpAg=; b=nXDxsk1ZZUBEWtNL9NEaiDLOzuMva
 RcQlwA5K/nEJatpZ4xF/pk3VUNsI2BeMVp9b6mbZ8HRVMyKiMP6Nit6npe+5s2rI
 UlLhoW/LnkYxDSVckOUlI0bNga7RjcsCLg1R+vI2uAW+y+AnAYLiCiQhNuzZzDho
 eWogFDuXbBkI4FACd30OnGlrlIEGzx/cwDS5bwLgSrf9h3xWtoJT8JvCWvDRTGTP
 LXQn0sw2T3RUQYUGMaJBW/JvkWBgOXslsKso9Qjyu7lXqkbCFUfFemgdXxgsTGXd
 bH2fj2CAmu2IoEU6gwyCscOQzfN6GAArVVUX7dSC0xQInIfyQ26EtrX4w==
X-ME-Sender: <xms:eEFnZSrMVTJXUdy6oB07k5M_A0xcealI40sVL8jqNFzScoJovEtXug>
 <xme:eEFnZQrGo245rWPHAnkiOZEpzMjygQtETrBGOd_KZ-4CHXSENm8KJkOX8hWJWJUGz
 Gboj6wuBRp2Qxc1bw>
X-ME-Received: <xmr:eEFnZXOmQHSA2eVzLjnBGZJjBIAEp1qa3EJlexy5VvU7BMo77VLxpb11WvR9HC-r_m56oy8T2QZZf2xnlmCd7B05_ACI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefujghffffkgggtsehgtderredttdejnecuhfhrohhmpeetlhihshhs
 rgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpedtke
 dvfedvvdetheehueeifeelieeggeefgedtvefgvdfhvdethedvkedtheevvdenucffohhm
 rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhs
X-ME-Proxy: <xmx:eEFnZR6d-QXR5jcV9TFoLBmWP-t5jtgeP9ecX984nyv5ykaMBiAkqw>
 <xmx:eEFnZR6eXObcDA3Ki7qM0_XY6SGAkkjqZhUbB-Hfb5OyT17OMXEyWg>
 <xmx:eEFnZRjjDJRclFSDX054GDvolDsnMhcim84TO4YXWPpT4QAIqWLnRA>
 <xmx:eEFnZbmT1bYU1QkL6WGAdpfPEMn9E1eqzXT-NRdNz6G45S4NOkASZw>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Nov 2023 08:49:43 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id 73FC56216; Wed, 29 Nov 2023 14:49:42 +0100 (CET)
From: Alyssa Ross <hi@alyssa.is>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/atomic-helpers: Invoke end_fb_access while
 owning plane state
In-Reply-To: <1093023d-1e9a-422f-bb5d-e716c0789f70@suse.de>
References: <20231127142042.17815-1-tzimmermann@suse.de>
 <874jh740zb.fsf@alyssa.is> <1093023d-1e9a-422f-bb5d-e716c0789f70@suse.de>
Date: Wed, 29 Nov 2023 14:49:36 +0100
Message-ID: <87r0k8vfdb.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: mripard@kernel.org, stable@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 27.11.23 um 17:25 schrieb Alyssa Ross:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>=20
>>> Invoke drm_plane_helper_funcs.end_fb_access before
>>> drm_atomic_helper_commit_hw_done(). The latter function hands over
>>> ownership of the plane state to the following commit, which might
>>> free it. Releasing resources in end_fb_access then operates on undefined
>>> state. This bug has been observed with non-blocking commits when they
>>> are being queued up quickly.
>>>
>>> Here is an example stack trace from the bug report. The plane state has
>>> been free'd already, so the pages for drm_gem_fb_vunmap() are gone.
>>>
>>> Unable to handle kernel paging request at virtual address 0000000100000=
049
>>> [...]
>>>   drm_gem_fb_vunmap+0x18/0x74
>>>   drm_gem_end_shadow_fb_access+0x1c/0x2c
>>>   drm_atomic_helper_cleanup_planes+0x58/0xd8
>>>   drm_atomic_helper_commit_tail+0x90/0xa0
>>>   commit_tail+0x15c/0x188
>>>   commit_work+0x14/0x20
>>>
>>> For aborted commits, it is still ok to run end_fb_access as part of the
>>> plane's cleanup. Add a test to drm_atomic_helper_cleanup_planes().
>>>
>>> v2:
>>> 	* fix test in drm_atomic_helper_cleanup_planes()
>>>
>>> Reported-by: Alyssa Ross <hi@alyssa.is>
>>> Closes: https://lore.kernel.org/dri-devel/87leazm0ya.fsf@alyssa.is/
>>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>>> Fixes: 94d879eaf7fb ("drm/atomic-helper: Add {begin,end}_fb_access to p=
lane helpers")
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: <stable@vger.kernel.org> # v6.2+
>>> ---
>>>   drivers/gpu/drm/drm_atomic_helper.c | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>=20
>> Got this basically immediately. :(
>
> I've never seen such problems on other systems. Is there anything=20
> different about the Mac systems? How do you trigger these errors?

My understanding is that all sorts of things are different, but I don't
know too much about the details.  There's of course a chance that there
could be some other change in the Asahi Linux kernel that causes this
problem to surface =E2=80=94 as I said, I reviewed the diff with mainline a=
nd
didn't see anything that looked relevant, but I could well have missed
something.  I don't think I can test mainline directly, as it doesn't
yet support enough of the hardware =E2=80=94 for slightly older Apple Silic=
on
Mac models, I think enough is upstream that this would be possible, but
I don't have access to any.

I started off encountering these errors every few days.  I noticed them
because they would sometimes result in my system either starting to
freeze for 10 seconds at a time, or until I switched VT.  They seem to
correlate with the system being under high CPU load.  I was also able to
substantially increase the frequency with which they occurred by adding
logging to the kernel =E2=80=94 even just drm.debug=3D0x10 makes a big diff=
erence,
and when I also added a few dump_backtrace() calls when I was trying to
understand the code and diagnose the problem, I would relatively
consistently encounter an Oops within a few minutes of load.

BTW: v3 is looking good so far.  I've only been testing it since this
morning, though, so I'll keep trying it out for a bit longer before I
declare the problem to have been solved and send a Tested-by.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmVnQXAACgkQ+dvtSFmy
ccBLew/9EYgQ+cjqBKHE8We3AvbqEotI3p2kF/38oLy9MCQ7jw3tCgtVZy7KEvd/
jAgvU7tk0iaP9Ob9RiybckA5vxpHU+xWQqnx1vSzNp29g1jhkYiX0uBZI0ZpH5pi
+g2R1b2i4kleqNRtfxZcUVY0zaajWzVp+Fw3qHjtygN61mRRabti/l5HVgeOmROk
qTJ9XfKwQsocnkMq1pPq1NOhlJFgblZohXwnCdgacFo+vt0bBL31aTe+ydYXY3HY
0tdoOVV8md1ejlm5ObSzL0oiN8On4Mm3NbmiEKBCqCA1mZ8JFwSbqAVo8PnlF9h0
L3jexx/DND92hmLet6XvxlbRMZFPu5Rn9UGIMnv31b6A4n/Le3mTmD7Z33ozE8wr
0Ioft2cVC3qZVSPR7K2d5Anfp5v+TqNtEuKwj2DgFIdOJlBeKGjBchy+QGFbaSV8
/XYgpfNXUaowBGzIxN+veJgSO2GmT8xLP3+OkXCyOZ9mewEi8Yfy3UOTxp72yjcs
fO0QBR6Vor+mOpmdGWwPEP89cS9qJlwfcha6BBgCEoHL/LIhruC1ITFqDfZ3oZmN
XxhmAsXctPqdBL/MjMLWn4GQXEtBvly/movEpe7H91Y4iyrQELkdVag52Akj1rQA
ljqZ2t3ueswHvgCKT9UjzHU+8zBp2KdHIIHp12Ptl58MJG+CqU4=
=CtLf
-----END PGP SIGNATURE-----
--=-=-=--
