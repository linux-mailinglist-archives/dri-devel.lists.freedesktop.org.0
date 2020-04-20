Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB41B095E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 14:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468556E527;
	Mon, 20 Apr 2020 12:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8986E527
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:33:31 +0000 (UTC)
Date: Mon, 20 Apr 2020 12:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1587386009;
 bh=2dNCrji2nfWSXbRntkLSr+YuZJaEchR72GQhOEhxMDo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=REiQ0S97rHb4cGGLHTX/lpihgPEQyd/061QpgTLep0sRfn82mOwpuI7ucWH7T9MCL
 llZQnIXpa1sH0MAleCR9z2vAU5vbRkMohdHF9wZFAE71QmmSqHljtwzFdmmbSMsB+W
 tg/kRgZyGUxbTe15rqlEYf70J4jT7iW9wJq0kn78=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <uJ44RSX2HiIaTgyv5Ja8mUntCnl4rtbjBapdV4IqubIHEauj_CWYMjDHztQdus6U75hUwdUd5AdxEV0HnZSdQboV0ai5mIlO_wmdxwcDfnU=@emersion.fr>
In-Reply-To: <20200420152235.3473851f@eldfell.localdomain>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <eT7Xq1DV3kIBOemufORRm39_VF3D9VD08jWCOHvl2IcqmNXqpgtgDGtPcpT_CnQjhIzqth_VdU_A8U1dCFj02JzayLcYCdUlz_5Y-i2tNXk=@emersion.fr>
 <20200420152235.3473851f@eldfell.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Pearson <mpearson@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, April 20, 2020 2:22 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Mon, 20 Apr 2020 10:15:39 +0000
> Simon Ser contact@emersion.fr wrote:
>
> > On Monday, April 20, 2020 10:27 AM, Pekka Paalanen ppaalanen@gmail.com wrote:
> >
> > > The only "random" KMS state is the properties the userspace KMS
> > > program does not know that are set on start-up. I have been assuming
> > > that as long as you had fbdev active before the KMS program started,
> > > the unknown properties have "harmless" default values. And maybe even at
> > > driver device init if fbdev does not exist?
>
> I meant fbcon, not fbdev above.
>
> > Note, this is not the case when using e.g. a display manager. In the
> > past there have been cases of a display manager setting a hw cursor
> > and launching a compositor not supporting hw cursors. This results in
> > a stuck hw cursor.
>
> Indeed. So the display manager might get sensible defaults, but the
> session compositor might not. Or maybe boot splash uses KMS already, so
> even display manager doesn't get all-defaults state.
>
> It seems we really do need "sane defaults" from the kernel explicitly.
> Writing a userspace tool to save it at boot time before any KMS program
> runs would be awkward.

Agreed.

> > > Btw. I searched for all occurrences of link_status in
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html and it seems it
> > > only has two possible values, good and bad, and no mention whether it
> > > is writable. Looks like it's writable. There does not seem to be a) an
> > > explanation how exactly it needs to the handled (writing it does
> > > something? what can you write?) or b) any way discern between kernel
> > > and userspace set values like HDCP "Content Protection" has.
> >
> > User-space needs to reset the value to GOOD when recovering from a BAD
> > value.
>
> What if userspace writes BAD?
>
> BAD cannot be default state, so getting default state from somewhere
> would solve this property's restoring as well. Reading back the true
> current value could accidentally return BAD.


Interestingly, setting it to BAD is a no-op (BAD is silently
discarded):

	/* Never downgrade from GOOD to BAD on userspace's request here,
	 * only hw issues can do that.
	 *
	 * For an atomic property the userspace doesn't need to be able
	 * to understand all the properties, but needs to be able to
	 * restore the state it wants on VT switch. So if the userspace
	 * tries to change the link_status from GOOD to BAD, driver
	 * silently rejects it and returns a 0. This prevents userspace
	 * from accidently breaking  the display when it restores the
	 * state.
	 */
	if (state->link_status != DRM_LINK_STATUS_GOOD)
		state->link_status = val;

So restoring the "sane default" would be work, even if the link happens
to be BAD when saving said "sane defaults".

> Just to reiterate for everyone, the important thing here is to figure
> out how userspace is supposed to reset unknown properties to sensible
> defaults. Once we know how that should work, we can review whether new
> properties support or break that.

Yes, that's a good description of the problem.

I see two main solutions here: either the kernel provides the default
values in its property descriptions (e.g. drmModeGetProperty), either
user-space can ask the kernel to reset properties to their default
values.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
