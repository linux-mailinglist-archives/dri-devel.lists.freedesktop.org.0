Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196AA9E2AB0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0910EAF9;
	Tue,  3 Dec 2024 18:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ntYXKM0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6305610EAF9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 18:21:50 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ffb0bbe9c8so68558761fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733250108; x=1733854908; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZJCWi9rKRDOBhclHyemM+Mxc7DIQmHNKfSr2PzsWGSo=;
 b=ntYXKM0QH6DdeCJ6fyUIsYMZQd+IMTCduthAmlmEdMfYb0+Y30vE7Q6ExRIVDhAFUN
 8meCtnUshqntL7U5dmzaDisHw512trgOrKmgIn7YPz7fYCHBJOQzkORMM6XTlbhqTyeo
 Sq/PU9p2RF8NxRFq0iLG11VOECRiNwE0U4JclJv2uu0VYvCuvyB/czhOPh/RAFSeRzGx
 bmmbzzorqMaLXzq9LBgyjY5idxCYUblafbADhZUT5hUrce3Sf2bweh2+TC9nzw965kc3
 7VUD2v2VHdHWO1I0ddxlrvqrroqF3kHngVl9C7JyFxbasMFyNsawHQUf4i3yBlPW/Bqz
 f+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733250108; x=1733854908;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJCWi9rKRDOBhclHyemM+Mxc7DIQmHNKfSr2PzsWGSo=;
 b=X+Mn5YAa3hyHd0XZ52HxkPps+JH4WIAW/0U8IW648bDcflVe08mmMox0GMbZjkyqYW
 eKWeQDIHVpzuz+73jJAA6KVxgZSTpflKdrkFSmUcdHGXwc21yhOJ+YDJuFndaGls4c9D
 NJ2YXJLJ+ohxM+43DQpoSYT42D34AsAYT1DHrjvWUZ/9isFJuVt66z0DuYgJvgQnaBEe
 +djZQabAvsXO04HemmSPDwaASuqfRtRt6ncHi6QEp5PL9J+wU8Z5PoOfHao1aEo5txvH
 DjjMOS36SpkXVyLkaTJ37rMmmZB9pbQze74yVc3oXYmywZFE81oFVDn6IcCgrMkb0xgi
 nIbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHbSrRp3OIdaVAfJxHO5kuA8Sg/PJGFJzrD5W819DESwv/qgetSkIa1Jlr8iOKbliTk9zrCo4QNxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMR9wNBZBNYz5gGgyKERBDA0R12R2xhCsyKltW4X9Fy3SimM7b
 78iHB5YSanIPP7cZt47UY8MD5pW4wzlYpyfEH5Z8oimLk11rD3EV
X-Gm-Gg: ASbGncvPA/prFGW/GFQKNqeHJVcJdOxwWaNQ9iRtcoeZVXuDF8D14sIo+dyZVch9Aa5
 G8ypPHgUXRxl81iLZE6uDmGz6IYTzn4NY4TGKrH7uCLIVmwz9L/DknfiWF1EBVtdlwoBZqTT6ou
 XTZQef3IKHv6ejfS5NN7o9Cz8r9/eP8EzyZ3B04HYgnWIFG+w5IRMYR3pL4QyY9AI0vVAEYK3Hr
 dhzvQUqZeMsJnwGWRmp/7tli2+ljyPVOGReZAvmVMF2KXkddeVACIYRvBoWkB6KjOtUvhrZnHIS
 7KBm1WDB52B5
X-Google-Smtp-Source: AGHT+IH/t1xDrgZUtdW1eiPpOz3X84Y+Y3JGuASFkB4EnPmppgzbsJjke9zFVvsXrVrR7kCUE+AT3w==
X-Received: by 2002:a2e:a554:0:b0:2ff:d49f:dd50 with SMTP id
 38308e7fff4ca-30009c6c8acmr24864641fa.30.1733250108184; 
 Tue, 03 Dec 2024 10:21:48 -0800 (PST)
Received: from gmail.com (host-95-193-101-79.mobileonline.telia.com.
 [95.193.101.79]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfc745b6sm17042861fa.74.2024.12.03.10.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 10:21:47 -0800 (PST)
Date: Tue, 3 Dec 2024 19:21:43 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
Message-ID: <Z09MN-9qXeQrAXRc@gmail.com>
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de>
 <878qte2oj3.fsf@intel.com>
 <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
 <Z08qdJUuerXOV-dR@gmail.com>
 <CABQX2QOy0sD3QrmG-hxdDgwTrffz0tnPzqvs2BhORQ1w2pTgww@mail.gmail.com>
 <Z08ygwwkmNp8dnHy@gmail.com>
 <CABQX2QPah6M0jY38cTUO4D=kO9_aYDdaJ5hbX8Ah3z2zAucj9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QPah6M0jY38cTUO4D=kO9_aYDdaJ5hbX8Ah3z2zAucj9w@mail.gmail.com>
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

On Tue, Dec 03, 2024 at 11:39:05AM -0500, Zack Rusin wrote:
> On Tue, Dec 3, 2024 at 11:32 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> >
> > On Tue, Dec 03, 2024 at 11:27:52AM -0500, Zack Rusin wrote:
> > > On Tue, Dec 3, 2024 at 10:57 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> > > >
> > > > On Wed, Nov 20, 2024 at 07:52:18AM -0500, Zack Rusin wrote:
> > > > > On Wed, Nov 20, 2024 at 5:22 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > > > >
> > > > > > On Wed, 20 Nov 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > > > Hi
> > > > > > >
> > > > > > >
> > > > > > > Am 19.11.24 um 20:40 schrieb Ian Forbes:
> > > > > > >> Most compositors are using a change in EDID as an indicator to
> > > > > > >> refresh their connector information on hotplug regardless of whether the
> > > > > > >> connector was previously connected. Originally the hotplug_mode_update
> > > > > > >> property was supposed to provide a hint to userspace to always refresh
> > > > > > >> connector info on hotplug as virtual devices such as vmwgfx and QXL
> > > > > > >> changed the connector without disconnecting it first. This was done to
> > > > > > >> implement Autofit. Unfortunately hotplug_mode_update was not widely
> > > > > > >> adopted and compositors used other heuristics to determine whether to
> > > > > > >> refresh the connector info.
> > > > > > >>
> > > > > > >> Currently a change in EDID is the one heuristic that seems to be universal.
> > > > > > >> No compositors currently implement hotplug_mode_update correctly or at all.
> > > > > > >> By implementing a fake EDID blob we can ensure that our EDID changes on
> > > > > > >> hotplug and therefore userspace will refresh the connector info so that
> > > > > > >> Autofit will work. This is the approach that virtio takes.
> > > > > > >>
> > > > > > >> This also removes the need to add hotplug_mode_update support for all
> > > > > > >> compositors as traditionally this niche feature has fallen on
> > > > > > >> virtualized driver developers to implement.
> > > > > > >
> > > > > > > Why don't you fix the compositors instead?
> > > > > > >
> > > > > > > I feel like NAK'ing this patch. The code itself is not so much a
> > > > > > > problem, but the commit message.
> > > > > >
> > > > > > Oh, I think the code is problematic too.
> > > > > >
> > > > > > Please avoid all struct edid based interfaces, in this case
> > > > > > drm_connector_update_edid_property(). They will be removed in the
> > > > > > future, and adding more is counter-productive. Everything should be
> > > > > > struct drm_edid based going forward.
> > > > > >
> > > > > > Of course, actually grafting the EDID needs struct edid. And that's kind
> > > > > > of annoying too. Do we really want to spread the EDID details all over
> > > > > > the place? This one combines drm_edid.h structs and magic numbers in a
> > > > > > jumble. I'm kind of hoping we'd get rid of driver usage of struct edid,
> > > > > > though that's a long road. But we've made a lot of progress towards it,
> > > > > > there aren't that many places left that directly look at the guts of
> > > > > > EDID, and most of it is centralized in drm_edid.c.
> > > > > >
> > > > > > Of course, not using the standard drm_edid_read* interfaces also lacks
> > > > > > on features such as providing the EDID via the firmware loader or
> > > > > > debugfs, which can be handy for testing and debugging, but that's a
> > > > > > minor issue.
> > > > > >
> > > > > > > Maybe it resolves problems with
> > > > > > > compositors, but it is a step backwards for the overall ecosystem. If
> > > > > > > the connector changes, your driver should increment the epoch counter.
> > > > > > > [1] That will send a hotplug event to userspace. The EDID alone does not
> > > > > > > say anything about connector status.
> > > > > >
> > > > > > Yeah, unplugging and replugging the same display with the same EDID
> > > > > > isn't a problem for other drivers, and they don't have to do this kind
> > > > > > of stuff to trick userspace. Maybe vmwgfx should handle (or simulate)
> > > > > > hotplugs better?
> > > > >
> > > > > I don't think that's what Ian is trying to fix. There's two different issues:
> > > > > 1) The code using struct edid which is frowned upon.
> > > > > 2) The virtualized drivers not behaving like real GPU's and thus
> > > > > breaking userspace.
> > > > >
> > > > > vmwgfx and qxl do not provide edid at all. It's null. But every time
> > > > > someone resizes a host side window in which the para-virtualized
> > > > > driver is displaying, the preferred mode changes. Userspace kept
> > > > > checking whether the edid changes on each hotplug event to figure out
> > > > > if it got new modes and refresh if it noticed that edid changed.
> > > > > Because on qxl and vmwgfx the edid never changes (it's always null)
> > > > > Dave added hotplug_mode_update property which only qxl and vmwgfx send
> > > > > and its presence indicates that the userspace should refresh modes
> > > > > even if edid didn't change.
> > > > >
> > > > > Because that property is only used by qxl and vmwgfx everyone gets it
> > > > > wrong. The property was specifically added to fix gnome and Ian
> > > > > noticed that currently even gnome is broken:
> > > > > https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/meta-kms-connector.c#L940
> > > > > hotplug_mode_update doesn't change, it's just a flag that indicates
> > > > > that userspace needs a  full mode rescan.
> > > >
> > > > The linked line just means the property value itself not changing
> > > > doesn't result in a full compositor side monitor reconfiguration.
> > >
> > > Right, that's exactly the point I'm making :) The property isn't used
> > > correctly because the full-rescan is expected when that property is
> > > present, not if it changed.
> >
> > Well, a full rescan did happen, and the linked code only determines if
> > anything actually did change, including currently advertised modes, that
> > will have any potential effect on the final monitor configuration.
> 
> The point I'm making is that no one is using this property correctly.
> Mutter triggering a full-rescan as a result of other changes doesn't
> change the fact that its usage of that property is broken.
> I think
> you're interpreting my comment that usage of that property is broken
> (or not used at all) everywhere as "Mutter is not refreshing
> correctly" which is not the case. Mutter does resize correctly despite
> the fact that the property check is broken.

Ah, yes, I interpret it as something was broken, but I suppose it is
working as expected.

We're indeed apparently using it incorrectly by reading the property
value. After having seen this thread, I went and checked the commit
history, and it seems the implementation has flip flopped between
reading the property, and checking its existence, for more than a
decade. I suspect a reason for this might have been that the property
itself doesn't seem to be documented anywhere. Or is it? I have not yet
found that it is.

The following would probably make the implementation conform to the
expectations of the property:

```
diff --git a/src/backends/native/meta-kms-connector.c b/src/backends/native/meta-kms-connector.c
index cc6cd89f56..a4b9deb85e 100644
--- a/src/backends/native/meta-kms-connector.c
+++ b/src/backends/native/meta-kms-connector.c
@@ -369,7 +369,7 @@ state_set_properties (MetaKmsConnectorState *state,

   prop = &props[META_KMS_CONNECTOR_PROP_HOTPLUG_MODE_UPDATE];
   if (prop->prop_id)
-    state->hotplug_mode_update = prop->value;
+    state->hotplug_mode_update = TRUE;

   prop = &props[META_KMS_CONNECTOR_PROP_SCALING_MODE];
   if (prop->prop_id)
```

In mutter, it has primarily been interpreted as a hint when implementing
policy to decide when to avoid look up monitor configurations from
persistent storage.


Jonas


> 
> z


