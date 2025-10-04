Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A951ABB8EF5
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 16:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CC410E162;
	Sat,  4 Oct 2025 14:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZkBXJq6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBF510E162
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 14:39:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DEB226042D;
 Sat,  4 Oct 2025 14:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AFBC4CEF1;
 Sat,  4 Oct 2025 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759588743;
 bh=CU4IyP59fvnnZfxva5otQfWg9Fb1lMlbNTZnIUrWsf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkBXJq6qkbO7i6nf0aUd10sBTVDkCgTv3MM5KKGAFvMNe+LrTaZkZVUqcQwC9PYiF
 Wb3KBkVtzxQ7OVS52dpogzHlKwU5Y+f09n0kqG5h3wioBK4mzkgvbMAOD8uKBtakD5
 noKvQQzr9PDABPOFAC6snZmrYUpJpIZynIiivBCXGU7AlydsgEx3T4QVTS8J1V/M8H
 BRwBjlKjEn/Fn8rtq5S/5Fgyqrntx4VJ7Ye0Q1dWJrFT2/V8Kbo6Zzs7Cn32Cz8hV7
 oh5rliLhdCjU4hTqSTBvOjDxjty6V33MStSgNShrZgu/LcaYnLvLp/EGjsr8mpPhqg
 7MQpJXHhWpSDw==
Date: Sat, 4 Oct 2025 10:39:01 -0400
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 konstantin@linuxfoundation.org
Cc: Dave Airlie <airlied@gmail.com>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Miguel Ojeda <ojeda@kernel.org>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.18-rc1
Message-ID: <aOExhd-d1Eq-X_uw@laps>
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
 <CAPM=9txjNo==nMA7XcjzLWLO155+1bk2THwPs_BmTLu_5kU_bQ@mail.gmail.com>
 <CAHk-=wgR61VxiHyOKXBJv_HinoFVA2av1EuSHg5NcRGC1fNq3w@mail.gmail.com>
 <CAHk-=wgX-2+hH5fM344_wKYNZS5CSf4ispS4X+s5xkma_Mdu_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgX-2+hH5fM344_wKYNZS5CSf4ispS4X+s5xkma_Mdu_Q@mail.gmail.com>
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

On Fri, Oct 03, 2025 at 01:02:43PM -0700, Linus Torvalds wrote:
>On Fri, 3 Oct 2025 at 11:09, Linus Torvalds
><torvalds@linux-foundation.org> wrote:
>>
>> If you get pull requests from the people you pull from that make it
>> harder for you to do a better job, please push back on them too.
>
>Side note: this is actually an area where maybe it's worth looking
>into just having automation.
>
>I've actually been fairly impressed with some of the more recent
>AUTOSEL AI summaries, and I wonder if it might help maintainers to
>have some kind of "summarize this pull request" infrastructure. I'm
>not so convinced about the code-writing side, but summarizing
>changelogs sounds useful but also rather less scary.
>
>And I'm not suggesting that because I would use it to summarize other
>peoples pull requests, but as a way to make it easier for maintainers
>to write summaries of their own pull requests when they have lots of
>different things going on.
>
>Adding Sasha to the participants, since he's been doing the AUTOSEL summaries.
>
>(Some of them have been just garbage, but a lot of them have seemed
>quite reasonable. So as a starting point - rather than as the final
>case - I think maybe some of those LLM's might be useful for other
>things than making amusing fake videos)

Thanks for looping me in and for the prod on consistency. I agree that writing
a clear commit message or pull request summary is often harder than the code
change itself.

With AUTOSEL we’ve seen that AI can help when it’s grounded: recent agentic RAG
approaches let us draft summaries from the actual commits, tags, diffstats, and
paths rather than free-form guesses. We still treat the result as a bot-edited
draft, not an authority.

Looping in Konstantin who looked at adding extensions such as these to b4 - we
should definitely look at adding more AI tools to support maintainer workflows
with good guardrails (including sourcing every claim from the input data,
failing closed on low confidence, ...).

Some more b4 ai ideas:

- b4 ai summarize <range|branch>: Draft a maintainer editable summary
   (headline, grouped highlights, notable fixes/reverts, stats), with links to
   source commits.

- b4 ai cover <series>: Generate a first-pass cover letter for a series or
   topic branch, preserving style knobs (indentation, bullets, length).

- b4 ai risks <range>: Surface cross-subsystem touches, large churn, and code
   with prior regression history.

- b4 ai validate <range>: Check that summary claims are supported by
   commits/tags. Flag low-confidence sections.

- b4 ai style --indent=2 --max-lines=...: Apply consistent formatting to the
   generated text without changing content.

-- 
Thanks,
Sasha
