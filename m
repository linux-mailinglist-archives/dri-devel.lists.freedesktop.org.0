Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D59E2C93
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 21:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7F810E262;
	Tue,  3 Dec 2024 20:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLI2TijL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213B410E262
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 20:01:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53df119675dso7304370e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733256078; x=1733860878; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=to5ZFlWgg38bZfjwn4ShlrDcUYU2eqDzDS/cbprL62s=;
 b=GLI2TijLD89bxo/buNH6h5uJkw05bmRUh/A+BoG1aOm1avhunrJk050sK+YTfSaEa1
 gohV1UcilHNChB+/Onnh0G2IYIx3BRU7GPVaWla+mQrWIi2uQsLFQog4c0eUCUlGdNOI
 0cS7dZnjyJXJ6iTxvU2b5P5ZcUMBC29+X3VoBDkh04qyv8oxKICLrKLuBH8ZWC7pM4nl
 hV7eOysiYnZsKDE8UksN21KvD0ghXdfRhohKfuYapN9NkBnyXEr7BPDXHEDI7gD52wl9
 T69LubEIrlozt5smCFgV3HrcWQFAxK5pQKDDqk0nZAfeTtWxb5exH8xbzdMnPoLVhGPW
 C+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733256078; x=1733860878;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=to5ZFlWgg38bZfjwn4ShlrDcUYU2eqDzDS/cbprL62s=;
 b=Di1Uql41j3lMwEZB6cXMR5HxxCfmO8Y6F+347/CFvsEUygqgbHjzeMWkLzH6JJzF95
 n0k4QdmhiUrEzWowJhuyRktGXwduJYJbZhDECoJyFh+aEy8M62/W1zWOUTDxU4Ikq1sl
 d/2w5gyGrXbZ3ut50u+f4hiOH4GRIfhY2TdX2By1GkZDr14GCXa94qAfDixJLiBhQC1R
 WZk2Nbs5LcLo1AlqIEiWLOM1xCKKvQXy8Lrm99YUVTO1U1L3goau9h/IiGK5dkb14L9n
 jb5AVfTqPonPqnLTq1gmvPOxtQ8C14KtoIcjPTMD1fxM+sSFed9vHdQk9UwQKJzxHXFe
 Cf2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Xxkp7xXe0xFJQ55LIwM1qSnwZMXMBZOzUjEzpDg+O9jB1XNYF5ivYv+9S2YEsCBv1KOGd/oqirA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbEqePs+Ha3A099bJeMr4SXQ1XrhrBBYlpTwUJ7a/SVJ87L+Zr
 3q3VOOa8gs0/SP9lInp5i1oY53rtI8/LKzek9LCEnggXzFh2Nht4
X-Gm-Gg: ASbGncu9RDOBMf1/yd7IRNC++bA/iX47UtmEQ6XOMfbasCE9vAomoWA0DsxOcs/3Wt8
 0iSdK1KDq2u9meG3ZsN3HUh4HBcrc8IQr4rFbG4IJTjTZhik4RvVfmP4NR5BJs3BPLBv4B4faYi
 EXktzZ5LOSiOaHFpv31LKRKzJvZjC99Aqc8nBRQ+T8TjzjsXeuGz1W7mBZA18q7q6zTdtgqtbtJ
 VaNHY+Dz5U3HZ/oFA8/I1PYS/oxHqQCcjS8tO3AO8BcoN98DsQ2dTSSC3Mea+lvL3hUARROSQdf
 sx5Yv3m5Yv24
X-Google-Smtp-Source: AGHT+IH5xT5ODa5tgm3DZkT5/w7iPTA0h9KKi4upSp9JkDrlBeKwURiwmPNSfpbfr02R72/P5msW1w==
X-Received: by 2002:a05:6512:3b0e:b0:53e:16ed:eac1 with SMTP id
 2adb3069b0e04-53e16edeb85mr2141545e87.45.1733256077643; 
 Tue, 03 Dec 2024 12:01:17 -0800 (PST)
Received: from gmail.com (host-95-193-101-79.mobileonline.telia.com.
 [95.193.101.79]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e167a08e7sm264588e87.255.2024.12.03.12.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 12:01:16 -0800 (PST)
Date: Tue, 3 Dec 2024 21:01:14 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
Message-ID: <Z09jin_TgT96Lijb@gmail.com>
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de>
 <878qte2oj3.fsf@intel.com>
 <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
 <Z08qdJUuerXOV-dR@gmail.com>
 <CABQX2QOy0sD3QrmG-hxdDgwTrffz0tnPzqvs2BhORQ1w2pTgww@mail.gmail.com>
 <Z08ygwwkmNp8dnHy@gmail.com>
 <CABQX2QPah6M0jY38cTUO4D=kO9_aYDdaJ5hbX8Ah3z2zAucj9w@mail.gmail.com>
 <Z09MN-9qXeQrAXRc@gmail.com>
 <CABQX2QPwASbDMJf85XQfcEF4bjeSfULrqhDjQih9GZj73aE=9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QPwASbDMJf85XQfcEF4bjeSfULrqhDjQih9GZj73aE=9w@mail.gmail.com>
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

On Tue, Dec 03, 2024 at 02:46:10PM -0500, Zack Rusin wrote:
> On Tue, Dec 3, 2024 at 1:21 PM Jonas Ådahl <jadahl@gmail.com> wrote:
> >
> > On Tue, Dec 03, 2024 at 11:39:05AM -0500, Zack Rusin wrote:
> > > On Tue, Dec 3, 2024 at 11:32 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> > > >
> > > > On Tue, Dec 03, 2024 at 11:27:52AM -0500, Zack Rusin wrote:
> > > > > On Tue, Dec 3, 2024 at 10:57 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Nov 20, 2024 at 07:52:18AM -0500, Zack Rusin wrote:
> > > > > > > On Wed, Nov 20, 2024 at 5:22 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, 20 Nov 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > > > > > Hi
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Am 19.11.24 um 20:40 schrieb Ian Forbes:
> > > > > > > > >> Most compositors are using a change in EDID as an indicator to
> > > > > > > > >> refresh their connector information on hotplug regardless of whether the
> > > > > > > > >> connector was previously connected. Originally the hotplug_mode_update
> > > > > > > > >> property was supposed to provide a hint to userspace to always refresh
> > > > > > > > >> connector info on hotplug as virtual devices such as vmwgfx and QXL
> > > > > > > > >> changed the connector without disconnecting it first. This was done to
> > > > > > > > >> implement Autofit. Unfortunately hotplug_mode_update was not widely
> > > > > > > > >> adopted and compositors used other heuristics to determine whether to
> > > > > > > > >> refresh the connector info.
> > > > > > > > >>
> > > > > > > > >> Currently a change in EDID is the one heuristic that seems to be universal.
> > > > > > > > >> No compositors currently implement hotplug_mode_update correctly or at all.
> > > > > > > > >> By implementing a fake EDID blob we can ensure that our EDID changes on
> > > > > > > > >> hotplug and therefore userspace will refresh the connector info so that
> > > > > > > > >> Autofit will work. This is the approach that virtio takes.
> > > > > > > > >>
> > > > > > > > >> This also removes the need to add hotplug_mode_update support for all
> > > > > > > > >> compositors as traditionally this niche feature has fallen on
> > > > > > > > >> virtualized driver developers to implement.
> > > > > > > > >
> > > > > > > > > Why don't you fix the compositors instead?
> > > > > > > > >
> > > > > > > > > I feel like NAK'ing this patch. The code itself is not so much a
> > > > > > > > > problem, but the commit message.
> > > > > > > >
> > > > > > > > Oh, I think the code is problematic too.
> > > > > > > >
> > > > > > > > Please avoid all struct edid based interfaces, in this case
> > > > > > > > drm_connector_update_edid_property(). They will be removed in the
> > > > > > > > future, and adding more is counter-productive. Everything should be
> > > > > > > > struct drm_edid based going forward.
> > > > > > > >
> > > > > > > > Of course, actually grafting the EDID needs struct edid. And that's kind
> > > > > > > > of annoying too. Do we really want to spread the EDID details all over
> > > > > > > > the place? This one combines drm_edid.h structs and magic numbers in a
> > > > > > > > jumble. I'm kind of hoping we'd get rid of driver usage of struct edid,
> > > > > > > > though that's a long road. But we've made a lot of progress towards it,
> > > > > > > > there aren't that many places left that directly look at the guts of
> > > > > > > > EDID, and most of it is centralized in drm_edid.c.
> > > > > > > >
> > > > > > > > Of course, not using the standard drm_edid_read* interfaces also lacks
> > > > > > > > on features such as providing the EDID via the firmware loader or
> > > > > > > > debugfs, which can be handy for testing and debugging, but that's a
> > > > > > > > minor issue.
> > > > > > > >
> > > > > > > > > Maybe it resolves problems with
> > > > > > > > > compositors, but it is a step backwards for the overall ecosystem. If
> > > > > > > > > the connector changes, your driver should increment the epoch counter.
> > > > > > > > > [1] That will send a hotplug event to userspace. The EDID alone does not
> > > > > > > > > say anything about connector status.
> > > > > > > >
> > > > > > > > Yeah, unplugging and replugging the same display with the same EDID
> > > > > > > > isn't a problem for other drivers, and they don't have to do this kind
> > > > > > > > of stuff to trick userspace. Maybe vmwgfx should handle (or simulate)
> > > > > > > > hotplugs better?
> > > > > > >
> > > > > > > I don't think that's what Ian is trying to fix. There's two different issues:
> > > > > > > 1) The code using struct edid which is frowned upon.
> > > > > > > 2) The virtualized drivers not behaving like real GPU's and thus
> > > > > > > breaking userspace.
> > > > > > >
> > > > > > > vmwgfx and qxl do not provide edid at all. It's null. But every time
> > > > > > > someone resizes a host side window in which the para-virtualized
> > > > > > > driver is displaying, the preferred mode changes. Userspace kept
> > > > > > > checking whether the edid changes on each hotplug event to figure out
> > > > > > > if it got new modes and refresh if it noticed that edid changed.
> > > > > > > Because on qxl and vmwgfx the edid never changes (it's always null)
> > > > > > > Dave added hotplug_mode_update property which only qxl and vmwgfx send
> > > > > > > and its presence indicates that the userspace should refresh modes
> > > > > > > even if edid didn't change.
> > > > > > >
> > > > > > > Because that property is only used by qxl and vmwgfx everyone gets it
> > > > > > > wrong. The property was specifically added to fix gnome and Ian
> > > > > > > noticed that currently even gnome is broken:
> > > > > > > https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/meta-kms-connector.c#L940
> > > > > > > hotplug_mode_update doesn't change, it's just a flag that indicates
> > > > > > > that userspace needs a  full mode rescan.
> > > > > >
> > > > > > The linked line just means the property value itself not changing
> > > > > > doesn't result in a full compositor side monitor reconfiguration.
> > > > >
> > > > > Right, that's exactly the point I'm making :) The property isn't used
> > > > > correctly because the full-rescan is expected when that property is
> > > > > present, not if it changed.
> > > >
> > > > Well, a full rescan did happen, and the linked code only determines if
> > > > anything actually did change, including currently advertised modes, that
> > > > will have any potential effect on the final monitor configuration.
> > >
> > > The point I'm making is that no one is using this property correctly.
> > > Mutter triggering a full-rescan as a result of other changes doesn't
> > > change the fact that its usage of that property is broken.
> > > I think
> > > you're interpreting my comment that usage of that property is broken
> > > (or not used at all) everywhere as "Mutter is not refreshing
> > > correctly" which is not the case. Mutter does resize correctly despite
> > > the fact that the property check is broken.
> >
> > Ah, yes, I interpret it as something was broken, but I suppose it is
> > working as expected.
> >
> > We're indeed apparently using it incorrectly by reading the property
> > value. After having seen this thread, I went and checked the commit
> > history, and it seems the implementation has flip flopped between
> > reading the property, and checking its existence, for more than a
> > decade. I suspect a reason for this might have been that the property
> > itself doesn't seem to be documented anywhere. Or is it? I have not yet
> > found that it is.
> 
> Yea, I think Ian was planning to update docs for it at some point.
> It's a confusing one because it's really just a flag. For most
> properties it's the fact that they changed between the old and the
> current state that implies that a rescan is needed, for
> hotplug_mode_update it's the presence i.e. if the property is present
> a full-rescan is needed and when it's absent the regular paths can be
> taken (i.e. just comparing edid's would be enough).

It would be great if it could be documented, so usperspace can stop
guessing what the correct behavior is :)

> 
> Plus a lot has changed since that property was introduced e.g.
> userspace often performs more checks than just comparing edid's which
> means that using the property incorrectly or not using it at all
> doesn't necessarily mean that anything is visibly broken.
> 
> > The following would probably make the implementation conform to the
> > expectations of the property:
> >
> > ```
> > diff --git a/src/backends/native/meta-kms-connector.c b/src/backends/native/meta-kms-connector.c
> > index cc6cd89f56..a4b9deb85e 100644
> > --- a/src/backends/native/meta-kms-connector.c
> > +++ b/src/backends/native/meta-kms-connector.c
> > @@ -369,7 +369,7 @@ state_set_properties (MetaKmsConnectorState *state,
> >
> >    prop = &props[META_KMS_CONNECTOR_PROP_HOTPLUG_MODE_UPDATE];
> >    if (prop->prop_id)
> > -    state->hotplug_mode_update = prop->value;
> > +    state->hotplug_mode_update = TRUE;
> 
> It's closer. In Mutter there's no reason to compare it at all, e.g. instead of
> if (state->hotplug_mode_update != new_state->hotplug_mode_update)
>     return META_KMS_RESOURCE_CHANGE_FULL;
> it should probably be:
> if (state->hotplug_mode_update)
>     return META_KMS_RESOURCE_CHANGE_FULL;

I suspect not, since we already did a full rescan of all things KMS
prior to ending up here. The purpose of the function here is to
"optimize" away changes we don't care about, and if e.g. there were no
relevant changes, might as well not do anything. FWIW, it was added as
a necessity due to how hotplugs and the privacy screen kernel uAPI is
designed.

The check here, if the above diff would be applied, would treat the
property going away or appearing as "lets reconfigure everything from
scratch again".

But anyhow, perhaps a bit off topic to this thread.


Jonas

> 
> z


