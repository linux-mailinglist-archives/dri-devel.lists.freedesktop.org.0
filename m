Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EBB2676D1
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 02:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D483A6EADF;
	Sat, 12 Sep 2020 00:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230EA6E186
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 00:30:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599870619; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=00/Cp6TPII4teABqv/9KVMPggZeN60uO7V3CCnIA+bg=;
 b=DBudj87T6KKIGyKw2DcX4j/EV4dcbdJTZJRJJSFe55xAqmpet3xXHMmqeY1DSyD+H/YlmjdB
 d6wTiR2L7qvymTGX5o+jyU+S0r+Q5AJF6F1nuWXSAAd6uPSimvXCXFKBehiPH568DBMENOcJ
 KG8uUpZkDE8O28rHt6Hq4cOKu1E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f5c16994ba82a82fd846e00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 00:30:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 78C51C433F0; Sat, 12 Sep 2020 00:30:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wxiaowen)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 319F6C433C6;
 Sat, 12 Sep 2020 00:30:16 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 20:30:16 -0400
From: Xiaowen Wu <wxiaowen@codeaurora.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: backend-drm and scanning really large resolutions
In-Reply-To: <20200213101655.GT2363188@phenom.ffwll.local>
References: <20d5d2e0af60ca486fc31fb09e6f4aa4@codeaurora.org>
 <20200213113740.07af1263@eldfell.localdomain>
 <20200213101655.GT2363188@phenom.ffwll.local>
Message-ID: <6cce68f3039f9d8cc9460c698f4827c9@codeaurora.org>
X-Sender: wxiaowen@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-13 05:16, Daniel Vetter wrote:
> On Thu, Feb 13, 2020 at 11:37:40AM +0200, Pekka Paalanen wrote:
>> Adding Rob back in CC, I don't know if he is subscribed to
>> wayland-devel@. You forgot to CC dri-devel@ too.
>> 
>> 
>> On Tue, 11 Feb 2020 17:18:52 -0500
>> Xiaowen Wu <wxiaowen@codeaurora.org> wrote:
>> 
>> > Hi Rob,
>> >
>> > If the vendor driver doesn't have the hwpipe sub-object and kms plane is
>> > one-to-one mapped to hwpipe (sspp),
>> > do you think if below approach is acceptable if we still want to
>> > virtualize the kms plane to support 4K/8K scanout?
>> >
>> > 1. At kms atomic check before calling drm_atomic_helper_check, depending
>> > on scanout width of plane A in state, add idle planes B (C,D,...)
>> > into the same atomic state, backup and then modify
>> > src_x/src_w/crtc_x/crtc_w of plane A and the affected planes B (C,D,...)
>> > to meet scanout
>> > width limits, and set crtc/fb of the affected planes B (C,D,...) same as
>> > plane A.
>> >
>> > 2. At plane's state duplicate function, check if plane's
>> > src_x/src_w/crtc_x/crtc_w are updated at step 1), if so revert the
>> > change to
>> > plane A's backup value to allow plane A's scanout to update again. These
>> > value will again be updated in step 1) so nothing really changes
>> > if plane A continues updating.
>> >
>> > 3. If plane A's scanout is updated or detached from crtc, detach
>> > affected planes B (C,D,...) in the same atomic state in step 1) and then
>> > run step 1) again.
>> >
>> > 4. If user want to commit plane B (C,D,...), the commit/test will fail
>> > if planes are already used as sister plane of plane A. This failure is
>> > same
>> > as insufficient hwpipe from plane B (C,D,...).
>> >
>> > With above change, any downstream driver can support virtualized plane.
>> > Also as the above approach is generic and not h/w specific, we can make
>> > it a helper function and it's up to vendor to choose if they want to use
>> > or not, if they don't have logic like drm/msm/disp/mdp5/mdp5_plane in
>> > their downstream driver.
>> >
>> > Conceptional above changes didn't borrow hwpipe resources from other
>> > plane but borrow planes themselves directly, however from user point of
>> > view
>> > they should not feel any difference.
>> >
>> > What do you think?
> 
> The trouble with modifying the real plane states (instead of a 2nd 
> layer
> of hw objects) is that changes the userspace visible state. Which could
> confuse the heck out of userspace. That's why in all these cases where 
> the
> hw needs 2 things in gang mode (we have other examples where you need 
> to
> double up clocks or crtcs or whatever in other drivers/hw) we've made a
> driver specific layer - that way you can store the stuff you exactly 
> need,
> and not something generic.
> 
> Maybe there is some room for generic helpers, but you'd need to prove 
> your
> case by converting a few drivers over to this model. There's a lot
> already which virtualize planes in one way or another, but they're all
> slightly different. Thus far simply rolling your own in each driver
> proved to be quicker.
> -Daniel
> 
>> >
>> > BR,
>> > Xiaowen Wu
>> >
>> >
>> > On Tue Jan 21, 2020 at 4:12 PM Rob Clark <robdclark at gmail.com> wrote:
>> > > On Fri, Jan 17, 2020 at 8:52 AM Matt Hoosier <matt.hoosier at
>> > > gmail.com> wrote:
>> > >>
>> > >> Hi all,
>> > >>
>> > >> I'm confronting a situation where the hardware with which I work is
>> > >> capable of driving connectors at 4K or 8K, but doing so requires
>> > >> bonding the scanning of multiple planes together.
>> > >>
>> > >> The scenario is that you'd have a big primary framebuffer whose size
>> > >> is too large for an individual hardware scanning pipeline on the
>> > >> display controller to traverse within its maximum allowed clock rate.
>> > >>
>> > >> The hardware supplier's approach is to assign multiple planes, which
>> > >> in the KMS driver map to hardware scanning pipelines, to each be
>> > >> responsible for scanning a smaller section of the framebuffer. The
>> > >> planes are all assigned to the same CRTC, and in concert with each
>> > >> other they cover the whole area of the framebuffer and CRTC.
>> > >>
>> > >> This sounds a little bit wild to me. I hadn't been aware it's even
>> > >> legal to have more than one plane treated a the source of scanout for
>> > >> a single framebuffer. Maybe that distinction isn't really relevant
>> > >> nowadays with universal plane support.
>> > >>
>> > >
>> > > fwiw, have a look at drm/msm/disp/mdp5/mdp5_plane, which will allocate
>> > > one or two hwpipe's from the devices global atomic state, depending on
>> > > scanout width.. the hwpipe (sspp) is the physical resource behind a
>> > > plane, so essentially the kms planes are virtualized.  At some point
>> > > if you have too many wide layers, the atomic test step will fail due
>> > > to insufficient hwpipe's.  But this sort of scenario is the reason for
>> > > the test step.
>> > >
>> > > BR,
>> > > -R
>> > >
>> > >> I'm wondering if anybody here knows whether this a legit approach for
>> > >> a compositor's DRM backend to take?
>> > >>
>> > _______________________________________________
>> > wayland-devel mailing list
>> > wayland-devel@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/wayland-devel
>> 
> 
> 
> 
>> _______________________________________________
>> wayland-devel mailing list
>> wayland-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/wayland-devel

Hi Daniel,

Sorry the email was buried among others for half a year... I hope it's 
still not too late to continue the discussion...

Yes I agree directly modifying the real plane may confuse the user, 
however this is not the first time DRM is doing such thing. When 
handling conflicted encoders in handle_conflicting_encoders(), DRM 
atomic helper is already doing in such a way that:

1. Add connector/crtc that has conflicted encoder to state
2. Set these affected connectors' CRTC_ID to 0
3. Set these affected crtcs' active to false

Above 2) and 3) are also state that are visible to user.

So if 2) and 3) is allowed for CRTC and connector, I don't see why 
updating affected plane would be a problem? This is just another 
conflict handling, but this time it's on plane resource.

As a comparison, when do it in a second level under plane without 
updating plane's visible state, as internally the resource is still 
stolen, user will get failure during atomic check. In this model user 
also get the failure, although the failure reason in this model is CRTC 
conflict.

I can make a helper function for this, in the same way as 
handle_conflicting_encoders(). As the helper only steals plane that is 
currently idle to all CRTCs, do you foresee any existing driver will be 
affected by this model? Driver should treat it as configuration from 
user so they don't need to do anything in extra.

-Xiaowen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
