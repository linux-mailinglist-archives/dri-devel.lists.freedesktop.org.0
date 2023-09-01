Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C09790274
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 21:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F05F10E081;
	Fri,  1 Sep 2023 19:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0177510E1E2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 19:25:49 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so38661121fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693596348; x=1694201148;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJ/ishiIn3JxmQOEHy0DHiBRTINC9YIvKpTdUY+CNC8=;
 b=UaRAB+SjYpBF84TrMRTo9B/Ohv9ZnBzwvtHzQkfC9Yqwbzav/A7wD6LlkYU6IM82gV
 xMuxm91Dw63jRiixq6hg3tA0QBhrwc11jfSLXEyguBMVic8behWBxHCB+rPsaEV2BAZt
 fWqXKKUUKfTtiHh27jnMubcSBYvro6Pre+Z64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693596348; x=1694201148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJ/ishiIn3JxmQOEHy0DHiBRTINC9YIvKpTdUY+CNC8=;
 b=HWPi1ZlA8Gsh/GBzwKLWUEu0oqumM+kvehtJAnvEAfczC2zEiCFiva+JsQOGd+C1Hv
 oBSznGvVFfO0cDKJAfyRQ3lUOHBBhbnCfZx96zkkAa6AaY9oYLo92+hZYmXI1uPoT1Gm
 g0ODBSfBcZyexmlb9933iOJ3r89MexJ/cQbnM4o/DdC0I5xhHC5wNA43+26zAvF0sLdC
 SOfz2V6U2ruipbIoUUwxKl6YDtORE//W4FsG4+VflcHL2PcUsQIOym6N772fkVbIorKQ
 Xsj0lCnT/kqEIfr1PCbmVFk6Oyn3DUxoR01DI89jlaMLaT1yUTq7qW9W2L+mBId95q6A
 QJrA==
X-Gm-Message-State: AOJu0YyuL9BMgX7de7YJqWOFq5mzIL7wwGp6IaIbcfY+y7fYqDfRkkoc
 VTTku9w9UUtY+bcfKZpB/GhKw6U9WB2Lk057ZMeNzA==
X-Google-Smtp-Source: AGHT+IHpuz9dCii1tLuYzt3IBA8dA5jspLE2Z22lc4Vn5LFCcJHOMvHN+M4VNOfTj0ImW0IalHWfvkvJlDs9R18JHQc=
X-Received: by 2002:a2e:b052:0:b0:2b9:e701:ac48 with SMTP id
 d18-20020a2eb052000000b002b9e701ac48mr2468018ljl.32.1693596347888; Fri, 01
 Sep 2023 12:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230824205335.500163-1-gildekel@chromium.org>
 <06b50235b6bb02d0774fe0bdf5186ab999c0940a.camel@redhat.com>
 <ZPIvk08uB4Zg57ED@intel.com> <ZPI18me/Qxf07UWo@intel.com>
In-Reply-To: <ZPI18me/Qxf07UWo@intel.com>
From: Gil Dekel <gildekel@chromium.org>
Date: Fri, 1 Sep 2023 15:25:36 -0400
Message-ID: <CAOD+-Q5o7jjVVjVu6CZnZaWtLis1Tx0SNSQk_wUtbm7on1CqEA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v4 0/6] drm/i915/dp_link_training: Define a
 final failure state when link training fails
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 1, 2023 at 3:05=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
>
> On Fri, Sep 01, 2023 at 02:38:11PM -0400, Rodrigo Vivi wrote:
> > On Wed, Aug 30, 2023 at 05:41:37PM -0400, Lyude Paul wrote:
> > > Other then the name typo (s/Pual/Paul):
> > >
> > > Signed-off-by: Lyude Paul <lyude@redhat.com> (just since I co-authore=
d
> > > things~)
> >
> > I believe having the Co-developed-by: in the patches that you helped
> > out would be nice.
> >
Agreed. I think I'll set Lyude as the author of the two patches she origina=
lly
wrote, and set myself as the co-developer. Thank you both for pointing this=
 out.

> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > >
> > > I think we definitely want to make sure we get intel's opinions on th=
is
> > > though, especially regarding the usage of link-status. I think we're =
close
> > > enough to link-status's intended purpose, but I definitely would like=
 to know
> > > what others think about that since userspace will definitely have to =
handle
> > > situations like this a bit differently than with SST.
>
> I'd like to get Jani, or Ville, or Imre's eyes here. I believe this
> series has a good potential to solve some bad lingering MST issues,
> but I'm indeed concerned with the impact on depending on userspace
> behavior here.
>
I would love to have other userspaces reviewing (or at least ACKing)
this series. Any thoughts on who should be added on the next revision?

> (Besides that potential dead-lock...)
>
Response is on patch 4/5.
> > >
> > > Also - definitely make sure you take a look at Imre's patch series th=
at's
> > > currently on the list (I just finished reviewing it), since it adds s=
ome
> > > things to the helpers that might end up being useful here :)
> > >
> > > https://patchwork.freedesktop.org/series/122589/
> > >
Do you have anything particular in mind?

> > > On Thu, 2023-08-24 at 16:50 -0400, Gil Dekel wrote:
> > > > Next version of https://patchwork.freedesktop.org/series/122850/
> > > >
> > > > v4:
> > > >   Another blunder. I uploaded the patches from my ChromeiumOS kerne=
l dev repo
> > > >   instead of drm-tip/drm-tip. Apologies for the noise :(
> > > >
> > > > v3:
> > > >   Still learning the ropes of upstream workflow. Apologies for muck=
ing up v2.
> > > >   This is just a re-upload.
> > > >
> > > > v2:
> > > >   Reorganize into:
> > > >   1) Add for final failure state for SST and MST link training fall=
back.
> > > >   2) Add a DRM helper for setting downstream MST ports' link-status=
 state.
> > > >   3) Make handling SST and MST connectors simpler via intel_dp.
> > > >   4) Update link-status for downstream MST ports.
> > > >   5) Emit a uevent with the "link-status" trigger property.
> > > >
> > > > v1:
> > > > Currently, when link training fails after all fallback values have =
been
> > > > exhausted, the i915 driver seizes to send uevents to userspace. Thi=
s leave
> > > > userspace thinking that the last passing atomic commit was successf=
ul, and that
> > > > all connectors (displays) are connected and operational, when in fa=
ct, the last
> > > > link failed to train and the displays remain dark. This manifests a=
s "zombie"
> > > > displays in userspace, in which users observe the displays appear i=
n their
> > > > display settings page, but they are dark and unresponsive.
> > > >
> > > > Since, at the time of writing, MST link training fallback is not im=
plemented,
> > > > failing MST link training is a significantly more common case then =
a complete
> > > > SST link training failure. And with users using MST hubs more than =
ever to
> > > > connect multiple displays via their USB-C ports we observe this cas=
e often.
> > > >
> > > > This patchset series suggest a solution, in which a final failure s=
tate is
> > > > defined. In this final state, the connector's bit rate capabilities=
, namely
> > > > max_link_rate and max_link_lane_count, are set to 0. This effective=
ly set the
> > > > connector's bandwidth to 0Gbps, thus causing all its modes to be pr=
uned in the
> > > > following connector probing.
> > > >
> > > > Next, with this state defined, we emit a link-status=3DBad uevent. =
The next time
> > > > userspace probes the connector, it should recognize that the connec=
tor has no
> > > > modes and ignore it since it is in a bad state.
> > > >
> > > > I am aware that always sending a uevent and never stopping may resu=
lt in some
> > > > userspaces having their expectations broken and enter an infinite l=
oop of
> > > > modesets and link-training attempts. However, per DRM link-status s=
pec:
> > > > ```
> > > >  * link-status:
> > > >  *      Connector link-status property to indicate the status of li=
nk. The
> > > >  *      default value of link-status is "GOOD". If something fails =
during or
> > > >  *      after modeset, the kernel driver may set this to "BAD" and =
issue a
> > > >  *      hotplug uevent. Drivers should update this value using
> > > >  *      drm_connector_set_link_status_property().
> > > >  *
> > > >  *      When user-space receives the hotplug uevent and detects a "=
BAD"
> > > >  *      link-status, the sink doesn't receive pixels anymore (e.g. =
the screen
> > > >  *      becomes completely black). The list of available modes may =
have
> > > >  *      changed. User-space is expected to pick a new mode if the c=
urrent one
> > > >  *      has disappeared and perform a new modeset with link-status =
set to
> > > >  *      "GOOD" to re-enable the connector.
> > > > ```
> > > > (form drivers/gpu/drm/drm_connector.c - DOC: standard connector pro=
perties)
> > > >
> > > > it seems reasonable to assume that the suggested state is an extens=
ion of the
> > > > spec's guidelines, in which the next new mode userspace picks for a=
 connector
> > > > with no modes is - none, thus breaking the cycle of failed link-tra=
ining
> > > > attempts.
> > > >
> > > > I suspect that, maybe, zeroing out the bit rate capabilities is not=
 the right
> > > > way to go, and perhaps marking the connector as disconnected instea=
d may be a
> > > > better solution. However, if marking a connector disconnected is th=
e way to go,
> > > > We will have to iterate over all MST ports in the MST case and mark=
 the spawned
> > > > connectors as disconnected as well.
> > >
> > > I -think- this is probably fine, that's likely how I'd
> > >
> > > >
> > > > As a final note I should add that this approach was tested with Chr=
omeOS as
> > > > userspace, and we observed that the zombie displays stop showing up=
 once the
> > > > connectors are pruned of all their modes and are ignored by userspa=
ce.
> > > >
> > > > For your consideration and guidance.
> > > > Thanks,
> > > >
> > > > Gil Dekel (6):
> > > >   drm/i915/dp_link_training: Add a final failing state to link trai=
ning
> > > >     fallback
> > > >   drm/i915/dp_link_training: Add a final failing state to link trai=
ning
> > > >     fallback for MST
> > > >   drm/dp_mst: Add drm_dp_set_mst_topology_link_status()
> > > >   drm/i915: Move DP modeset_retry_work into intel_dp
> > > >   drm/i915/dp_link_training: Set all downstream MST ports to BAD be=
fore
> > > >     retrying
> > > >   drm/i915/dp_link_training: Emit a link-status=3DBad uevent with t=
rigger
> > > >     property
> > > >
> > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++
> > > >  drivers/gpu/drm/i915/display/intel_display.c  | 14 +++-
> > > >  .../drm/i915/display/intel_display_types.h    |  6 +-
> > > >  drivers/gpu/drm/i915/display/intel_dp.c       | 75 ++++++++++++---=
----
> > > >  drivers/gpu/drm/i915/display/intel_dp.h       |  2 +-
> > > >  .../drm/i915/display/intel_dp_link_training.c | 11 ++-
> > > >  include/drm/display/drm_dp_mst_helper.h       |  3 +
> > > >  7 files changed, 110 insertions(+), 40 deletions(-)
> > > >
> > > > --
> > > > Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphic=
s
> > > >
> > >
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> > >

Thanks for your time and comments!
--
Best,
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
