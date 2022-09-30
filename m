Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D975F0D93
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DB310ED2F;
	Fri, 30 Sep 2022 14:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C70210ED2C;
 Fri, 30 Sep 2022 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664548252; x=1696084252;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oufD8BZmnpv8wgWKCnlcglzjHsLGmQ+i+igYEkDkONU=;
 b=dsaJhYx2bnMmoQkz79XfsZpT1bhVGLkMEQ8fMU5UHJkP2P0JY9nxtloS
 4GaIQYjc/GsRoZEJehc+BsgnA5q80xJdoA9sCzP7HRR7Fqhat6TUZlRYR
 WBnezd6zWJUeV4WIqJ7CN1CsF5o6cX+OZv0+cafvYcpgzEBEY0HIly8ZQ
 RkYeVumMDE2X5tZIvjWYG9J48EjCLM/1DO3N1mgmMAR8ed4aUCf2EU45i
 ZKrguaHdKoQwjER6hlwR+4vtWa9pGZLEx1DC1AvfGybpv055iI0CBUCq6
 djVC9pDES6qsSoBRya3/vZU3XTlI+sfgOQgzEpoyAyyhbW7kG5ZTAew7t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="302175508"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="302175508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 07:30:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="726878331"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="726878331"
Received: from rrogov-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.37.237])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 07:30:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
In-Reply-To: <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
Date: Fri, 30 Sep 2022 17:30:45 +0300
Message-ID: <87bkqxvsru.fsf@intel.com>
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
Cc: Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Sep 2022, Sebastian Wick <sebastian.wick@redhat.com> wrote:
> On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
>>
>> On Thu, 29 Sep 2022 20:06:50 +0200
>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>
>> > If it is supposed to be a non-linear luminance curve, which one is it?
>> > It would be much clearer if user space can control linear luminance
>> > and use whatever definition of perceived brightness it wants. The
>> > obvious downside of it is that it requires bits to encode changes that
>> > users can't perceive. What about backlights which only have a few
>> > predefined luminance levels? How would user space differentiate
>> > between the continuous and discrete backlight? What about
>> > self-emitting displays? They usually increase the dynamic range when
>> > they increase in brightness because the black level doesn't rise. They
>> > also probably employ some tonemapping to adjust for that. What about
>> > the range of the backlight? What about the absolute luminance of the
>> > backlight? I want to know about that all in user space.
>> >
>> > I understand that most of the time the kernel doesn't have answers to
>> > those questions right now but the API should account for all of that.
>>
>> Hi,
>>
>> if the API accounts for all that, and the kernel doesn't know, then how
>> can the API not lie? If the API sometimes lies, how could we ever trust
>> it at all?
>
> Make it possible for the API to say "I don't know". I'd much rather
> have an API tell me explicitly what it does and doesn't know instead
> of having to guess what data I can actually rely on.
>
> For example if the kernel knows the luminance is linear on one display
> and doesn't know anything about the other display and it exposes them
> both in the same way I can not possibly write any code which relies on
> exact control over the luminance for either display.

My idea has been all along that you'd have an API for defining points on
a curve, a kind of mapping, and the kernel would linear intrapolate
between the set points.

If the kernel knows how to pre-fill the information, it would do
so. Otherwise, it would just be linear. The userspace could adjust in
either case.

For i915, in some cases we'd be able to pre-fill the curve, and have a
better brightness adjustment experience. Ville has done something like
this for himself, but IIUC has not polished it into an interface.


BR,
Jani.


>
>>
>> Personally I have the feeling that if we can even get to the level of
>> "each step in the value is a more or less perceivable change", that
>> would be good enough. Think of UI, e.g. hotkeys to change brightness.
>> You'd expect almost every press to change it a bit.
>
> The nice thing is that you can have that even if you have no further
> information about the brightness control and it might be good enough
> for some use cases but it isn't for others.
>
>> If an end user wants defined and controlled luminance, I'd suggest they
>> need to profile (physically measure) the response of the display at
>> hand. This is no different from color profiling displays, but you need
>> a measurement device that produces absolute measurements if absolute
>> control is what they want.
>
> If that's the kind of user experience you're after, good for you. I
> certainly want things to work out of the box which makes this just a
> big no-go.
>
>>
>> If there ever becomes an industry standard and conformance test
>> definitions for luminance levels and backlight control, then things
>> could be different. But until that, I believe trying to make one in the
>> kernel is futile, because I have got the impression that there is
>> practically no consistency between different displays in general.
>
> I'm aware that this is the current situation but it's one that must
> change and we should at least try to create an API which still works
> when we get more and better data.
>
>>
>> Besides, I would expect some backlights to wear over time, grow dimmer
>> for the same input value. Without a physical active feedback loop
>> (measurements), it just won't work.
>>
>> If this is mostly for laptop displays, would end users even care?
>>
>>
>> Thanks,
>> pq
>>
>> > On Wed, Sep 28, 2022 at 1:14 PM Ville Syrj=C3=A4l=C3=A4
>> > <ville.syrjala@linux.intel.com> wrote:
>> > >
>> > > On Wed, Sep 28, 2022 at 01:57:18PM +0300, Ville Syrj=C3=A4l=C3=A4 wr=
ote:
>> > > > On Wed, Sep 28, 2022 at 01:04:01PM +0300, Jani Nikula wrote:
>> > > > > On Fri, 09 Sep 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> > > > > > Hi all,
>> > > > > >
>> > > > > > Here is v2 of my "drm/kms: control display brightness through =
drm_connector properties" RFC:
>>
>> ...
>>
>> > > > > > Unlike the /sys/class/backlight/foo/brightness this brightness=
 property
>> > > > > > has a clear definition for the value 0. The kernel must ensure=
 that 0
>> > > > > > means minimum brightness (so 0 should _never_ turn the backlig=
ht off).
>> > > > > > If necessary the kernel must enforce a minimum value by adding
>> > > > > > an offset to the value seen in the property to ensure this beh=
avior.
>> > > > > >
>> > > > > > For example if necessary the driver must clamp 0-255 to 10-255=
, which then
>> > > > > > becomes 0-245 on the brightness property, adding 10 internally=
 to writes
>> > > > > > done to the brightness property. This adding of an extra offse=
t when
>> > > > > > necessary must only be done on the brightness property,
>> > > > > > the /sys/class/backlight interface should be left unchanged to=
 not break
>> > > > > > userspace which may rely on 0 =3D off on some systems.
>> > > > > >
>> > > > > > Note amdgpu already does something like this even for /sys/cla=
ss/backlight,
>> > > > > > see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
>> > > > > >
>> > > > > > Also whenever possible the kernel must ensure that the brightn=
ess range
>> > > > > > is in perceived brightness, but this cannot always be guarante=
ed.
>> > > > >
>> > > > > Do you mean every step should be a visible change?
>> > > >
>> > > > Hmm. I guess due to this. I'd prefer the opposite tbh so I could
>> > > > just put in my opregion BCLM patch. It's annoying to have to
>> > > > carry it locally just to have reasonable backlight behaviour
>> > >
>> > > After second though I guess I'm actually agreeing with Hans here.
>> > > The current situation is where small change in the value near one
>> > > end of the range does basically nothing, while a small change at
>> > > the other of the range causes a massive brightness change. That
>> > > is no good.
>> > >
>> > > --
>> > > Ville Syrj=C3=A4l=C3=A4
>> > > Intel
>> > >
>> >
>>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
