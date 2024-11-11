Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDAF9C4920
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 23:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6177010E18F;
	Mon, 11 Nov 2024 22:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IiYhMPGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168CB10E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 22:35:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01E489EC;
 Mon, 11 Nov 2024 23:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1731364534;
 bh=LNLIpxgWDeRZwYMNEDQJS9xtSX8A18fT8tKoB1xGWGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IiYhMPGQ2Gi+XJLzKbkHi0TryCUcqXWyfIm+yk3et+lUipEJKKycUZpJuAUjrz+pv
 ZB7d8xyFnSVwo96FL+XHrsiAc0NBuHLEnWwUZD4P1NX1MWw2VfTmrvgYTDRnOkXZse
 z+VdBGasZqYtRejeaurDRTrIQTgipYz6vBj8npX4=
Date: Tue, 12 Nov 2024 00:35:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dan Williams <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
Message-ID: <20241111223538.GD17916@pendragon.ideasonboard.com>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
 <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
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

Hi Shuah,

On Mon, Nov 11, 2024 at 02:50:45PM -0700, Shuah Khan wrote:
> On 11/11/24 13:07, Simona Vetter wrote:
> > On Fri, Nov 08, 2024 at 09:18:53AM -0700, Shuah Khan wrote:
> >> The Code of Conduct committee's goal first and foremost is to bring about
> >> change to ensure our community continues to foster respectful discussions.
> >>
> >> In the interest of transparency, the CoC enforcement policy is formalized
> >> for unacceptable behaviors.
> >>
> >> Update the Code of Conduct Interpretation document with the enforcement
> >> information.
> >>
> >> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
> >> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> >> Acked-by: Jonathan Corbet <corbet@lwn.net>
> >> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> >> Acked-by: Dan Williams <dan.j.williams@intel.com>
> >> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> > 
> > I think it's really good to document these details. The freedesktop coc
> > team is going through the same process, we've also done a talk at XDC
> > about all these changes, and I think this helps a lot in transparency and
> > accountability in practice. With that, some thoughts below.

I've been thinking about replying to this patch for a few days now. I
think I managed to sleep over it enough to make that possible.

I share Sima's opinion here. There is FUD around the CoC and its
enforcement process due to lack of transparency, so I believe
documenting the goals and means is important and will help.

> Thank you Simona for your review and feedback.
> 
> >> ---
> >>   .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
> >>   1 file changed, 52 insertions(+)
> >>
> >> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
> >> index 66b07f14714c..21dd1cd871d2 100644
> >> --- a/Documentation/process/code-of-conduct-interpretation.rst
> >> +++ b/Documentation/process/code-of-conduct-interpretation.rst
> >> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
> >>   Because how we interpret and enforce the Code of Conduct will evolve over
> >>   time, this document will be updated when necessary to reflect any
> >>   changes.
> >> +
> >> +Enforcement for Unacceptable Behavior Code of Conduct Violations
> >> +----------------------------------------------------------------
> >> +
> >> +The Code of Conduct committee works to ensure that our community continues
> >> +to be inclusive and fosters diverse discussions and viewpoints, and works
> >> +to improve those characteristics over time. The Code of Conduct committee
> >> +takes measures to restore productive and respectful collaboration when an
> >> +unacceptable behavior has negatively impacted that relationship.
> >> +
> >> +Seek public apology for the violation
> >> +*************************************
> >> +
> >> +The Code of Conduct Committee publicly calls out the behavior in the
> >> +setting in which the violation has taken place, seeking public apology
> >> +for the violation.
> >> +
> >> +A public apology for the violation is the first step towards rebuilding
> >> +the trust. Trust is essential for the continued success and health of the
> >> +community which operates on trust and respect.
> > 
> > Personal take, but I think a forced public apology as the primary or at
> > least initial coc enforcement approach is one of the worst.
> 
> Seeking public apology is in response to unacceptable behaviors which are
> serious in nature. These incidents are exceedingly rare. When these incidents
> happen, they usually resolve when another developer/community member points
> out the behavior. The individual responds with a voluntary apology to
> mend fences and repair harm.
> 
> The CoC  gets involved only when it receives a report which is the case
> when normal paths such as peers pointing out the behavior to repair the
> harm haven't been successful.
> 
> This document isn't intended to be a complete summary of all actions the
> CoC takes in response to reports. There is a lot of back and forth with
> the individuals to bring about change before the CoC asks for an apology.
>
> The CoC seeks public apology only when it is essential to repair the harm.

Limiting the CoC committee to seeking public apology, due to what it
means in terms of both process and goal, would deprive the committee
from many useful courses of action. I was expecting you were not limited
to this, and I appreciate that you are stating it clearly here. It is
not however clear from this patch, and I believe it would benefit the
whole community if this was explained better in the document. A more
detailed description of the different means of action and outcomes would
help balance the fact that the proceedings of the CoC committe are not
public.

I would like to add that I appreciate the emphasis on rebuilding trust
as a goal, as I also believe trust and respect are essential. This
includes trust that victims will receive the support and protection they
need, trust that authors of behaviour deemed unfit by the community will
be treated fairly, and trust that the community will continuously work
on improving inclusiveness. All three aspects are needed to avoid
driving current and prospective community members away.

> > First, a ban or temporary suspension seems too mechanical and not in
> > proportion with the offence of failing to apologize. In my enforcement
> > thus far as maintainer and now also freedesktop.org CoC member we only use
> > punishment if behavior has failed to change _and_ we need to protect the
> > community from further harm. Usually it takes years to get to that point,
> > unless in extremely severe cases (like public harrassment campaigns) or
> > when the person stated that they refuse to even consider changing behavior
> > at all.
> 
> Please see above. Public apology is necessary to repair and restore the
> health of the community in these rare cases when an individual doesn't
> understand that their behavior could cause harm. The CoC tries to get
> the individual to realize that offering a public apology is necessary
> to repair the harm and resume respectful and productive discussions.
> 
> > Public means you're amping up the stakes and massively increase the odds
> > of people being afraid of their reputation and losing face. In my
> > experience people are a lot more reasonable when you discuss their
> > behavior and what needs to change in private. This even includes the case
> > where a temporary suspension had to be put in place already first, to
> > protect others.
> 
> Please see above. The CoC works with the individual prior to taking the step
> of asking for an apology. It is a balancing act between repairing
> the harm caused to the individuals at the receiving end of the public
> unacceptable behavior and working with the individual to understand the
> harm done by such a behavior.
> 
> The CoC is mindful of the negative impact of seeking public apology and
> instituting ban could have on individuals.

It could also be worth adding that, as Sima pointed out below, public
apology is sometimes not the best option for the victim. Some people may
be afraid to report bad behaviours if they thought that the story would
be made public by a requirement to apologize publicly. I have total
confidence that the CoC committee will consult with the victim to
determine the best course of action, and that is worth documenting
explicitly.

> It is a tough balancing act because not taking such actions would lead to
> longer term harm to the health of the community. These actions aren't taken
> lightly.
> 
> > Lastly, a forced apology puts any victim into the awkward position that
> > they're forced to decide whether they want to accept the apology, or
> > reject it. This essentially offloads part of the CoC enforcement work onto
> > victims, which often are not the ones with the power to actually stand up
> > to problematic behavior.
> 
> This scenario seems to be based on the assumption that the CoC's first
> go to action is seeking public apology. This is not the case. The CoC works
> towards reaching an understanding between the parties behind the scenes.
> 
> As mentioned earlier public apologies and bans are actions taken when
> the CoC deems they are absolutely necessary. Bans are instituted only
> when the TAB agrees with 2/3 vote.
> 
> > Note that I don't see this as a nack, just a heads up that there's a
> > potential conflict. I'm not worried though since Dave and me know pretty
> > much everyone involved in both CoC teams. I'm sure if this ever becomes a
> > real issue we can bridge things and figure out a solution.
> 
> Thank you for you feedback and input. The CoC relies on the trust and respect
> from the community to the work it needs to do to ensure kernel community stays
> healthy as it continues its development work.

-- 
Regards,

Laurent Pinchart
