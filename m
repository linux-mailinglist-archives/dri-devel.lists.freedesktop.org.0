Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0237971B
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 20:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5A26E4F3;
	Mon, 10 May 2021 18:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Mon, 10 May 2021 18:39:02 UTC
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3222E6E4F3;
 Mon, 10 May 2021 18:39:02 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4Ff8ls4f25zDq5m;
 Mon, 10 May 2021 11:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1620671513; bh=1WmiYGFYHwz2Ey9kA+sjJu7lMJMQvvU5pj7tMDBkcZQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IoTS9VF0wnTE3Kbjqu1bYB0XnmCEpNq09qACtAxBa2S+vKUOGk4+pfVmM07Xlywtb
 62qlKr8ZN6pzE0AsOaSHcnvP48P/F9LYhE0yQ2uuBdqG1pVbg682HPxi8okxfI9/hw
 hWMc/hos19Svbmrtxp+rUWc1TIWKiiVh9V7xK5Ic=
X-Riseup-User-ID: 4726C9D363275A186D2F052EFB6D08078D14F6A79D2582A7B7CA4470C27AEC72
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Ff8ls2WfPz5vlK;
 Mon, 10 May 2021 11:31:53 -0700 (PDT)
From: Francisco Jerez <currojerez@riseup.net>
To: Daniel Vetter <daniel@ffwll.ch>, Martin Peres <martin.peres@free.fr>
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in
 the i915
In-Reply-To: <CAKMK7uETcM38sjPYJLdxpGcZcx=tHdGUPe0WTgnGoZfPQvEJFQ@mail.gmail.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
 <17953669798.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <546e4ee4-9aa4-1967-cdcb-a561cac582ef@free.fr>
 <CAKMK7uETcM38sjPYJLdxpGcZcx=tHdGUPe0WTgnGoZfPQvEJFQ@mail.gmail.com>
Date: Mon, 10 May 2021 11:30:59 -0700
Message-ID: <87sg2u7864.fsf@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="==-=-=";
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> writes:

> On Mon, May 10, 2021 at 3:55 PM Martin Peres <martin.peres@free.fr> wrote:
>>
>> On 10/05/2021 02:11, Jason Ekstrand wrote:
>> > On May 9, 2021 12:12:36 Martin Peres <martin.peres@free.fr> wrote:
>> >
>> >> Hi,
>> >>
>> >> On 06/05/2021 22:13, Matthew Brost wrote:
>> >>> Basic GuC submission support. This is the first bullet point in the
>> >>> upstreaming plan covered in the following RFC [1].
>> >>>
>> >>> At a very high level the GuC is a piece of firmware which sits betwe=
en
>> >>> the i915 and the GPU. It offloads some of the scheduling of contexts
>> >>> from the i915 and programs the GPU to submit contexts. The i915
>> >>> communicates with the GuC and the GuC communicates with the GPU.
>> >>
>> >> May I ask what will GuC command submission do that execlist won't/can=
't
>> >> do? And what would be the impact on users? Even forgetting the troubl=
ed
>> >> history of GuC (instability, performance regression, poor level of us=
er
>> >> support, 6+ years of trying to upstream it...), adding this much code
>> >> and doubling the amount of validation needed should come with a
>> >> rationale making it feel worth it... and I am not seeing here. Would =
you
>> >> mind providing the rationale behind this work?
>> >>
>> >>>
>> >>> GuC submission will be disabled by default on all current upstream
>> >>> platforms behind a module parameter - enable_guc. A value of 3 will
>> >>> enable submission and HuC loading via the GuC. GuC submission should
>> >>> work on all gen11+ platforms assuming the GuC firmware is present.
>> >>
>> >> What is the plan here when it comes to keeping support for execlist? I
>> >> am afraid that landing GuC support in Linux is the first step towards
>> >> killing the execlist, which would force users to use proprietary
>> >> firmwares that even most Intel engineers have little influence over.
>> >> Indeed, if "drm/i915/guc: Disable semaphores when using GuC schedulin=
g"
>> >> which states "Disable semaphores when using GuC scheduling as semapho=
res
>> >> are broken in the current GuC firmware." is anything to go by, it mea=
ns
>> >> that even Intel developers seem to prefer working around the GuC
>> >> firmware, rather than fixing it.
>> >
>> > Yes, landing GuC support may be the first step in removing execlist
>> > support. The inevitable reality is that GPU scheduling is coming and
>> > likely to be there only path in the not-too-distant future. (See also
>> > the ongoing thread with AMD about fences.) I'm not going to pass
>> > judgement on whether or not this is a good thing.  I'm just reading the
>> > winds and, in my view, this is where things are headed for good or ill.
>> >
>> > In answer to the question above, the answer to "what do we gain from
>> > GuC?" may soon be, "you get to use your GPU."  We're not there yet and,
>> > again, I'm not necessarily advocating for it, but that is likely where
>> > things are headed.
>>
>> This will be a sad day, especially since it seems fundamentally opposed
>> with any long-term support, on top of taking away user freedom to
>> fix/tweak their system when Intel won't.
>>
>> > A firmware-based submission model isn't a bad design IMO and, aside fr=
om
>> > the firmware freedom issues, I think there are actual advantages to the
>> > model. Immediately, it'll unlock a few features like parallel submissi=
on
>> > (more on that in a bit) and long-running compute because they're
>> > implemented in GuC and the work to implement them properly in the
>> > execlist scheduler is highly non-trivial. Longer term, it may (no
>> > guarantees) unlock some performance by getting the kernel out of the w=
ay.
>>
>> Oh, I definitely agree with firmware-based submission model not being a
>> bad design. I was even cheering for it in 2015. Experience with it made
>> me regret that deeply since :s
>>
>> But with the DRM scheduler being responsible for most things, I fail to
>> see what we could offload in the GuC except context switching (like
>> every other manufacturer). The problem is, the GuC does way more than
>> just switching registers in bulk, and if the number of revisions of the
>> GuC is anything to go by, it is way too complex for me to feel
>> comfortable with it.
>
> We need to flesh out that part of the plan more, but we're not going
> to use drm scheduler for everything. It's only to handle the dma-fence
> legacy side of things, which means:
> - timeout handling for batches that take too long
> - dma_fence dependency sorting/handling
> - boosting of context from display flips (currently missing, needs to
> be ported from drm/i915)
>
> The actual round-robin/preempt/priority handling is still left to the
> backend, in this case here the fw. So there's large chunks of
> code/functionality where drm/scheduler wont be involved in, and like
> Jason says: The hw direction winds definitely blow in the direction
> that this is all handled in hw.
>

I agree with Martin on this.  Given that using GuC currently involves
making your open-source graphics stack rely on a closed-source
cryptographically-protected blob in order to submit commands to the GPU,
and given that it is /still/ possible to use the GPU without it, I'd
expect some strong material justification for making the switch (like,
it improves performance of test-case X and Y by Z%, or, we're truly
sorry but we cannot program your GPU anymore with a purely open-source
software stack).  Any argument based on the apparent direction of the
wind doesn't sound like a material engineering reason to me, and runs
the risk of being self-fulfilling if it leads us to do the worse thing
for our users just because we have the vague feeling that it is the
general trend, even though we may have had the means to obtain a better
compromise for them.

>> >> In the same vein, I have another concern related to the impact of GuC=
 on
>> >> Linux's stable releases. Let's say that in 3 years, a new application
>> >> triggers a bug in command submission inside the firmware. Given that =
the
>> >> Linux community cannot patch the GuC firmware, how likely is it that
>> >> Intel would release a new GuC version? That would not be necessarily
>> >> such a big problem if newer versions of the GuC could easily be
>> >> backported to this potentially-decade-old Linux version, but given th=
at
>> >> the GuC seems to have ABI-breaking changes on a monthly cadence (we a=
re
>> >> at major version 60 *already*? :o), I would say that it is
>> >> highly-unlikely that it would not require potentially-extensive chang=
es
>> >> to i915 to make it work, making the fix almost impossible to land in =
the
>> >> stable tree... Do you have a plan to mitigate this problem?
>> >>
>> >> Patches like "drm/i915/guc: Disable bonding extension with GuC
>> >> submission" also make me twitch, as this means the two command
>> >> submission paths will not be functionally equivalent, and enabling GuC
>> >> could thus introduce a user-visible regression (one app used to work,
>> >> then stopped working). Could you add in the commit's message a proof
>> >> that this would not end up being a user regression (in which case, why
>> >> have this codepath to begin with?).
>> >
>> > I'd like to address this one specifically as it's become something of a
>> > speciality of mine the past few weeks. The current bonded submission
>> > model is bad. It provides a plethora of ways for a client to back itse=
lf
>> > into a corner and doesn't actually provide the guarantees the media
>> > driver needs for its real-time high-resolution decode. It's bad enough
>> > we're seriously considering ripping it out, backwards compatibility or
>> > not. The good news is that very little that your average desktop user
>> > does depends on it: basically just real-time >4K video decode.
>> >
>> > The new parallel submit API is much better and should be the path
>> > forward. (We should have landed parallel submit the first time around.)
>> > It isn't full of corners and does let us provides actual parallel
>> > execution guarantees. It also gives the scheduler the information it
>> > needs to reliably provide those guarantees. >
>> > If we need to support the parallel submit API with the execlist
>> > back-end, that's totally possible. The choice to only implement the
>> > parallel submit API with GuC is a pragmatic one. We're trying to get
>> > upstream back on it's feet and get all the various up-and-coming bits =
of
>> > hardware enabled. Enabling the new API in the execlist back-end makes
>> > that pipeline longer.
>>
>> I feel your pain, and wish you all the best to get GEM less complex
>> and more manageable.
>>
>> So, if I understood correctly, the plan is just to regress 4K+ video
>> decoding for people who do not enable GuC scheduling, or did not also
>> update to a recent-enough media driver that would support this new
>> interface? If it is indeed only for over 4K videos, then whatever. If it
>> is 4K, it starts being a little bad, assuming graceful fallback to
>> CPU-based decoding. What's the test plan for this patch then? The patch
>> in its current form is definitely not making me confident.
>
> Only if they don't scream loudly enough. If someone screams loud
> enough we'll bite the bullet and enable the new interface on execlist
> backend.
>
> Cheers, Daniel
>
>> >> Finally, could you explain why IGT tests need to be modified to work =
the
>> >> GuC [1], and how much of the code in this series is covered by
>> >> existing/upcoming tests? I would expect a very solid set of tests to
>> >> minimize the maintenance burden, and enable users to reproduce potent=
ial
>> >> issues found in this new codepath (too many users run with enable_guc=
=3D3,
>> >> as can be seen on Google[2]).
>> >
>> > The IGT changes, as I understand them, are entirely around switching to
>> > the new parallel submit API. There shouldn't be a major effect to most
>> > users.
>>
>> Right, this part I followed, but failed to connect it to the GuC...
>> because I couldn't see why it would be needed (execlist requiring a lot
>> more work).
>>
>> I sincerely wish for the GuC to stay away from upstream because of the
>> above concerns (which are yet to be addressed), but if Intel were to
>> push forward with the plan to drop execlist, I can foresee a world of
>> trouble for users... That is of course unless the GuC were to be open
>> sourced, with people outside of Intel able to sign their own builds or
>> run unsigned. Failing that, let's hope the last 6 years were just a bad
>> start, and the rapid climb in major version of the GuC will magically
>> stop! I hope execlists will remain at feature parity with the GuC when
>> possible... but deplore the increase in validation needs which will only
>> hurt users in the end.
>>
>> Thanks for your honest answer,
>> Martin
>>
>> >
>> > --Jason
>
>
>
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIwEAREIADQWIQST8OekYz69PM20/4aDmTidfVK/WwUCYJl74xYcY3Vycm9qZXJl
ekByaXNldXAubmV0AAoJEIOZOJ19Ur9b+MYA/2RQhHPU38WGF6iSDph+Bjr10J4c
XQfUYgW8n27hCoFxAP4i+385VP18KzW5Q6e2JY4krVJPKMbKVSVFkTrNjjSUgA==
=ZpHz
-----END PGP SIGNATURE-----
--==-=-=--
