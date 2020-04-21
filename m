Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F581B2651
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721CD6E0C8;
	Tue, 21 Apr 2020 12:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62156E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:40:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g12so3501578wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P+CYdOvcYRpVB/rCm5BlIvAYauBftC7COi4EcLkDXeM=;
 b=SsBQHdCH5PTeMie0o4bJaMc92pMVWevCDz66O12Z1jT5ndcikSDn8ZET5mN5IBm6Ts
 RHBHOnXcN8CV0LgzbisLB9V2BM0gLpQjEwEthnX4ujlSw2i1A8iD9AICwyaKvQyr0lM7
 OF1jS7S3m8x9T3fTwxIuEXvRSemsF3Un/F49I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P+CYdOvcYRpVB/rCm5BlIvAYauBftC7COi4EcLkDXeM=;
 b=MN6li8pUpOB0ZFx287cYUBVtcyn5GEYxSooQFpmh6MU5TEGImJfc/U9glWUIvUATWk
 b+cfm7p0vib7VzwPkOnLoNJ3GTqJMMqcpFv8gNgq9eB76A1BXM+004ars1xvqDKZuJs+
 681WqRSSusyYaXqtETY2I2bxY5pASy6O9IeysplxVFJd6PAHTf2ZRIS4cRFYZezXRShm
 1U8eGnqwEz+xaVVd4nI57BfRx898H2bNolJpAq5dapxS9YyrkgjbD7LxZApnGGtQP1Cz
 7MM/mY7lIgyuQXS1jPRKlVF08jMft6HeOGJG5ngy1tJ3pMF9h3lnxy/ZB6TUGFra9jQY
 NKfw==
X-Gm-Message-State: AGi0PubrSVG7YpzdEsE4rQtdZ0KeM3x4tALAuFtTC39hP4ErgPmuewDp
 nz1tcIdqHu1Yjbtgly455TR3gQ==
X-Google-Smtp-Source: APiQypL39N5zMD8zHrdZCzFXYuFI++fSDCYVX+Q1BXg3/fus8ZvAOGsxDgeIzLC4mSWyeMJmfmByQw==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr4671860wmm.9.1587472838447; 
 Tue, 21 Apr 2020 05:40:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s14sm3371026wme.33.2020.04.21.05.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:40:37 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:40:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200421124035.GA3456981@phenom.ffwll.local>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <87k12e2uoa.fsf@intel.com>
 <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 02:37:41PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/17/20 1:55 PM, Jani Nikula wrote:
> > On Fri, 17 Apr 2020, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > On Wed, 15 Apr 2020 17:40:46 +0200
> > > Hans de Goede <hdegoede@redhat.com> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > On 4/15/20 5:28 PM, Jani Nikula wrote:
> > > > > On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> > > > > > ii. Currently the "privacy-screen" property added by Rajat's
> > > > > > patch-set is an enum with 2 possible values:
> > > > > > "Enabled"
> > > > > > "Disabled"
> > > > > > 
> > > > > > We could add a third value "Not Available", which would be the
> > > > > > default and then for internal panels always add the property
> > > > > > so that we avoid the problem that detecting if the laptop has
> > > > > > an internal privacy screen needs to be done before the connector
> > > > > > is registered. Then we can add some hooks which allow an
> > > > > > lcdshadow-driver to register itself against a connector later
> > > > > > (which is non trivial wrt probe order, but lets ignore that for now).
> > > > > 
> > > > > I regret dropping the ball on Rajat's series (sorry!).
> > > > > 
> > > > > I do think having the connector property for this is the way to go.
> > > > 
> > > > I 100% agree.
> > > > 
> > > > > Even
> > > > > if we couldn't necessarily figure out all the details on the kernel
> > > > > internal connections, can we settle on the property though, so we could
> > > > > move forward with Rajat's series?
> > > > 
> > > > Yes please, this will also allow us to move forward with userspace
> > > > support even if for testing that we do some hacks for the kernel's
> > > > internal connections for now.
> > > > 
> > > > > Moreover, do we actually need two properties, one which could indicate
> > > > > userspace's desire for the property, and another that tells the hardware
> > > > > state?
> > > > 
> > > > No I do not think so. I would expect there to just be one property,
> > > > I guess that if the state is (partly) firmware controlled then there
> > > > might be a race, but we will need a notification mechanism (*) for
> > > > firmware triggered state changes anyways, so shortly after loosing
> > > > the race userspace will process the notification and it will know
> > > > about it.
> > > > 
> > > > One thing which might be useful is a way to signal that the property
> > > > is read-only in case we ever hit hw where that is the case.
> > > > 
> > > > > I'd so very much like to have no in-kernel/in-firmware shortcuts
> > > > > to enable/disable the privacy screen, and instead have any hardware
> > > > > buttons just be events that the userspace could react to. However I
> > > > > don't think that'll be the case unfortunately.
> > > > 
> > > > In my experience with keyboard-backlight support, we will (unfortunately)
> > > > see a mix and in some case we will get a notification that the firmware
> > > > has adjusted the state, rather then just getting a keypress and
> > > > dealing with that ourselves.  In some cases we may even be able to
> > > > choose, so the fw will deal with it by default but we can ask it
> > > > to just send a key-press.  But I do believe that we can *not* expect
> > > > that we will always just get a keypress for userspace to deal with.
> > > 
> > > Hi,
> > > 
> > > let's think about how userspace uses atomic KMS UAPI. The simplest way
> > > to use atomic correctly is that userspace will for every update send the
> > > full, complete set of all properties that exist, both known and unknown
> > > to userspace (to recover from temporarily VT-switching to another KMS
> > > program that changes unknown properties). Attempting to track which
> > > properties already have their correct values in the kernel is extra
> > > work for just extra bugs.
> > > 
> > > Assuming the property is userspace-writable: if kernel goes and
> > > changes the property value on its own, it will very likely be just
> > > overwritten by userspace right after if userspace does not manage to
> > > process the uevent first. If that happens and userspace later
> > > processes the uevent, userspace queries the kernel for the current
> > > proprerty state which is now what userspace wrote, not what firmware
> > > set.
> > > 
> > > Therefore you end up with the firmware hotkey working only randomly.
> > > 
> > > It would be much better to have the hotkey events delivered to
> > > userspace so that userspace can control the privacy screen and
> > > everything will be reliable, both the hotkeys and any GUI for it.
> > 
> > I'd like this too. However I fear this is out of our control, and OEMs
> > have and will anyway fiddle with the privacy screen directly no matter
> > what we say, and we can't prevent that. From their POV it's easier for
> > them to do their value-add in components they have total control over. I
> > emphatize with that view, even if it's counter-productive from the Linux
> > ecosystem POV.
> > 
> > So we'll just have to deal with it.
> 
> Ack, at least that is the case for the current generation Lenovo devices.
> 
> > > The other reliable option is that userspace must never be able to
> > > change privacy screen state, only the hardware hotkeys can.
> > 
> > That, in turn, discourages anyone from doing the right thing, and blocks
> > us from adding any nice additional features for privacy screens that
> > only the userspace is capable of managing. For example, controlling
> > privacy screen based on content, which seems like an obvious feature.
> 
> Right.
> 
> So we have the case here were both the firmware and userspace may change
> the privacyscreen state (on/off) at any time.
> 
> This means that the atomic API use described by Pekka for this, where
> userspace keeps all properties in memory, updates the one which it
> wants to change and then commits simply cannot work here.
> 
> Userspace should only include this property in the transaction if
> it actually wants to change it. Or it should do a read of it
> and update its internal state before committing that state unless
> it wants to change it. But always blindly committing the last value
> used by userspace will simply not work, because then there is no
> way for the kernel to know if userspace is just repeating itself
> or actually wants to change the property.
> 
> As for the one vs two properties. For the current hw userspace can
> always change the state at any time. But I can envision devices
> where there is a hardware override forcing the privacy screen to
> be on. So I guess that a r/w "software state" + a ro "hardware state"
> property would make sense. Note that with the current gen. Lenovo
> devices the hw-state will simply be a mirror of the sw-state and
> the sw-state will be toggled by the firmware independently of
> the last value requested by userspace.
> 
> I guess we could add a third ro firmware-state property, which
> would reflect the last firmware requested value, but I cannot
> really come up with clear semantics for this; nor can I come
> up with how this actually helps.
> 
> TL;DR: Yes there will be races, because of both userspace +
> the firmware having; and potentially using r/w access to
> the privacy-screen state. But in practice I expect these
> to not really be an issue. Important here is that userspace
> only commits the property in a transaction to commit if
> it actually intends to change the property so as to not
> needlessly create a situation where we might hit the race.
> 
> As for 1 vs 2 properties for this I guess that in preparation
> for potential devices where the state is locked, having a
> r/w sw-state + a ro hw-state property makes sense.
> 
> So I suggest that we replace the current "privacy-screen" property
> from Rajat's patch-set with 2 props named:
> 
> "privacy-screen-sw-state" (r/w)
> "privacy-screen-hw-state" (ro)
> 
> Where for current gen hardware the privacy-screen-hw-state is
> just a mirror of the sw-state.

Yup. I think internally we should have some kind of explicit update
function perhaps, that's at least how immutable (by userspace) properties
work. Or we'll change that to a callback, so that there's no inversion
going on.
-Daniel

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
