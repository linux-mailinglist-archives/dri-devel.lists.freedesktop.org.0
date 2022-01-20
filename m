Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 515C149528E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 17:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2C410E77F;
	Thu, 20 Jan 2022 16:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D122D10E823;
 Thu, 20 Jan 2022 16:44:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c66so13356055wma.5;
 Thu, 20 Jan 2022 08:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6bGGWWAkPScw/nF5E0aexbWCBYiypBi+OS/+Pgiq9/E=;
 b=RyrC5CNLVW8GGudpOc8Q9saVXzgaiyPgkBh+qKCZOoA6lrkA5+KeFEopfaUkcO1wIw
 VcHss7TbYWzcMFFuCRDhmZREjeIwKdwMDNThB3AzvyFadUipEoIfibT8//b3pbqxMdH0
 rj/bOa9w8M2sLdQgAEJPD8DRFCI5G1iMjVEA7dePQ5FpVp2roFTyliCcJr519mA7sslJ
 MkP3OcB5b9+yphNHR2NwQwKUPPo3PM30FBhCWRnQkayKqoxMmqaVHUtFTgVtF7iAt4ne
 0GrQil6uImYxa15YLSuckd45dHU3HJcJrnBeZ2BT8gYYvaAp3YIo6SPvSu+UJZPcQttv
 PVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6bGGWWAkPScw/nF5E0aexbWCBYiypBi+OS/+Pgiq9/E=;
 b=rcO9K/jtRJJkr/C+Xb7wMtZhTw+Dn1O4JtCGCx4vNSYiH4yoyAYMGpd0ZGOCYBNyx8
 YC7EBqOq4MOw/q8XRGF9X7IlN6UMY8NJpq57j7hfcOALt2t2WvzBnE5N9clRLNMWgC6k
 8xEnEfSV9WZ8RLr0GhfkAI+AtpgvaJSgGODOOJsBDZl/YgRykn1zSE/1v9xpv2IzuDoF
 ab0ofJSF5VRELr1U1GBaZxWADcIt9yucwX8bAs1NTEugnRasze0lVLDtwccffAQXleQ0
 UcqNcSzh7zD+fTW0eMhK+wHKrHWlGKzTRqQLrOu+H3oxmxFc57hry2YRB4TOI2ir/+Aj
 sceg==
X-Gm-Message-State: AOAM533qYKDCPVvK7na04h3YpsWPoAhcU+koFEE6e4CF2pwXCXWpwaPT
 oRVG/872Cit9jI2wNbnLklZYhcwlXeDHh+OxUe8=
X-Google-Smtp-Source: ABdhPJxgNQKrROyGrdudEEYOcXGhT/3EJfmcWrqfPLY3XGH6iK/scudVO7ooBqMuT9AmfLWOA0xiyDbX0EPLptuifV4=
X-Received: by 2002:a5d:5917:: with SMTP id v23mr34671201wrd.418.1642697083117; 
 Thu, 20 Jan 2022 08:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
 <YegpiY3MU15RsEfk@phenom.ffwll.local>
In-Reply-To: <YegpiY3MU15RsEfk@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jan 2022 08:44:39 -0800
Message-ID: <CAF6AEGs58S7U=1nso=0BAURUuobeUam4V0j1W7ZsrK5W7MqRvw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 6/7] drm: Document fdinfo format specification
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Chris Healy <cphealy@gmail.com>, David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 7:09 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 06, 2022 at 04:55:35PM +0000, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >
> > Proposal to standardise the fdinfo text format as optionally output by =
DRM
> > drivers.
> >
> > Idea is that a simple but, well defined, spec will enable generic
> > userspace tools to be written while at the same time avoiding a more he=
avy
> > handed approach of adding a mid-layer to DRM.
> >
> > i915 implements a subset of the spec, everything apart from the memory
> > stats currently, and a matching intel_gpu_top tool exists.
> >
> > Open is to see if AMD can migrate to using the proposed GPU utilisation
> > key-value pairs, or if they are not workable to see whether to go
> > vendor specific, or if a standardised  alternative can be found which i=
s
> > workable for both drivers.
> >
> > Same for the memory utilisation key-value pairs proposal.
> >
> > v2:
> >  * Update for removal of name and pid.
> >
> > v3:
> >  * 'Drm-driver' tag will be obtained from struct drm_driver.name. (Dani=
el)
> >
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: David M Nieto <David.Nieto@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > Cc: Chris Healy <cphealy@gmail.com>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> I'm assuming this ack here and later on is a "amdgpu plans to use this
> too" kind of affair. Especially also in the lights of eventually using
> matching semantics for cgroups and everything else tied to gpu execution
> resource management.
>
> If not I'm mildly worried that we're creating fake-standard stuff here
> which cannot actually be used by anything resembling driver-agnostic
> userspace.

I think I could implement something like this for drm/msm.  I am a bit
uncertain about the memory stats (ie. how are we intended to account
for imported/exported/shared bo's)?  But we already track cycles+time
per submit for devfreq, it would be pretty easy to add per drm_file
counters to accumulate the per-submit results.  We could even track
per-context (submitqueue) for processes that have more than a single
context, although not sure if that is useful.

And I think there is probably some room for shared helper to print
parts other than the per-engine stats (and maybe memory stats,
although even that could be a shared implementation for some
drivers).. with a driver callback for the non-generic parts, ie.
something like:

   drm_driver::show_client_stats(struct drm_file *, struct drm_printer *)

but that can come later.

If there is a tool somewhere that displays this info, that would be
useful for testing my implementation.

BR,
-R

> -Daniel
>
> > ---
> >  Documentation/gpu/drm-usage-stats.rst | 97 +++++++++++++++++++++++++++
> >  Documentation/gpu/index.rst           |  1 +
> >  2 files changed, 98 insertions(+)
> >  create mode 100644 Documentation/gpu/drm-usage-stats.rst
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/=
drm-usage-stats.rst
> > new file mode 100644
> > index 000000000000..c669026be244
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -0,0 +1,97 @@
> > +.. _drm-client-usage-stats:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +DRM client usage stats
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +DRM drivers can choose to export partly standardised text output via t=
he
> > +`fops->show_fdinfo()` as part of the driver specific file operations r=
egistered
> > +in the `struct drm_driver` object registered with the DRM core.
> > +
> > +One purpose of this output is to enable writing as generic as practica=
ly
> > +feasible `top(1)` like userspace monitoring tools.
> > +
> > +Given the differences between various DRM drivers the specification of=
 the
> > +output is split between common and driver specific parts. Having said =
that,
> > +wherever possible effort should still be made to standardise as much a=
s
> > +possible.
> > +
> > +File format specification
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +- File shall contain one key value pair per one line of text.
> > +- Colon character (`:`) must be used to delimit keys and values.
> > +- All keys shall be prefixed with `drm-`.
> > +- Whitespace between the delimiter and first non-whitespace character =
shall be
> > +  ignored when parsing.
> > +- Neither keys or values are allowed to contain whitespace characters.
> > +- Numerical key value pairs can end with optional unit string.
> > +- Data type of the value is fixed as defined in the specification.
> > +
> > +Key types
> > +---------
> > +
> > +1. Mandatory, fully standardised.
> > +2. Optional, fully standardised.
> > +3. Driver specific.
> > +
> > +Data types
> > +----------
> > +
> > +- <uint> - Unsigned integer without defining the maximum value.
> > +- <str> - String excluding any above defined reserved characters or wh=
itespace.
> > +
> > +Mandatory fully standardised keys
> > +---------------------------------
> > +
> > +- drm-driver: <str>
> > +
> > +String shall contain the name this driver registered as via the respec=
tive
> > +`struct drm_driver` data structure.
> > +
> > +Optional fully standardised keys
> > +--------------------------------
> > +
> > +- drm-pdev: <aaaa:bb.cc.d>
> > +
> > +For PCI devices this should contain the PCI slot address of the device=
 in
> > +question.
> > +
> > +- drm-client-id: <uint>
> > +
> > +Unique value relating to the open DRM file descriptor used to distingu=
ish
> > +duplicated and shared file descriptors. Conceptually the value should =
map 1:1
> > +to the in kernel representation of `struct drm_file` instances.
> > +
> > +Uniqueness of the value shall be either globally unique, or unique wit=
hin the
> > +scope of each device, in which case `drm-pdev` shall be present as wel=
l.
> > +
> > +Userspace should make sure to not double account any usage statistics =
by using
> > +the above described criteria in order to associate data to individual =
clients.
> > +
> > +- drm-engine-<str>: <uint> ns
> > +
> > +GPUs usually contain multiple execution engines. Each shall be given a=
 stable
> > +and unique name (str), with possible values documented in the driver s=
pecific
> > +documentation.
> > +
> > +Value shall be in specified time units which the respective GPU engine=
 spent
> > +busy executing workloads belonging to this client.
> > +
> > +Values are not required to be constantly monotonic if it makes the dri=
ver
> > +implementation easier, but are required to catch up with the previousl=
y reported
> > +larger value within a reasonable period. Upon observing a value lower =
than what
> > +was previously read, userspace is expected to stay with that larger pr=
evious
> > +value until a monotonic update is seen.
> > +
> > +- drm-memory-<str>: <uint> [KiB|MiB]
> > +
> > +Each possible memory type which can be used to store buffer objects by=
 the
> > +GPU in question shall be given a stable and unique name to be returned=
 as the
> > +string here.
> > +
> > +Value shall reflect the amount of storage currently consumed by the bu=
ffer
> > +object belong to this client, in the respective memory region.
> > +
> > +Default unit shall be bytes with optional unit specifiers of 'KiB' or =
'MiB'
> > +indicating kibi- or mebi-bytes.
> > diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> > index b9c1214d8f23..b99dede9a5b1 100644
> > --- a/Documentation/gpu/index.rst
> > +++ b/Documentation/gpu/index.rst
> > @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
> >     drm-kms
> >     drm-kms-helpers
> >     drm-uapi
> > +   drm-usage-stats
> >     driver-uapi
> >     drm-client
> >     drivers
> > --
> > 2.32.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
