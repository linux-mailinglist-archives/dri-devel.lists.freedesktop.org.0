Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD66452D1B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05096F3F2;
	Tue, 16 Nov 2021 08:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BD46F3F2;
 Tue, 16 Nov 2021 08:46:41 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e7so27086564ljq.12;
 Tue, 16 Nov 2021 00:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=B+4475Nz0EJEw1btKnS6lbGHGzgnMTR6vRIDIHfcqkg=;
 b=AHjnsSgzVUrwMtIn2hzKlQ7zcUO9w2GxgF7iClKlNlQkjIwFGpO584TH3tmeXy97zF
 gZBJJiZtURTMLV9CzFsoOrn3DlNdSYs06nMlEIMpVhxTnKRawq3Cg5WiAnHG9H/r7afV
 i2BMBtpJiDhzO/y5stgpGkCV59rHJPJ7IkMBOKJ/dSTinie5byqIB7sjXwlvYH9sNnjr
 vKGy8b1l7meUPMQ/M9RlZd416KZNlN+bRznsZ3+YzywCmOBAgkgoCb9BkuqunSH1/hQL
 ITC2w/0pAXLOHmjwxGuNkfSqM3QgAObfTJpMBcPSF4fDDwLbI6GC2gcRxsy9vpjFYC+J
 VDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=B+4475Nz0EJEw1btKnS6lbGHGzgnMTR6vRIDIHfcqkg=;
 b=Ffz8gYrO0I1DzBl/tMVdbOY4bCIZYnV5svMg3SpgF+mZF3RUujcvBhuAsDz0sEb6Lp
 8OYCE8GfNxF/Y7Y8kJMf7Ss+eEyQtalKRDOq+4C6vc8MEyvYVRz5xuVlQbxgzmwGKCuv
 ihLf8ZaSThMaVyCUlP7pU90UnTo60Wj4FpmrTWpFomzkBJMhYhVv6klmrYAPBPN4pdbw
 YduGnJV/3Cn3C0rVU3ubeNRVsz7NjxWRgzMKxm9Jrrp9rZXKMmy7MqR96GyhGRsMbH66
 kNq+AxRW5Fizkq635CWRh32F2rWwGtXZzPAd/V1luFZ8whP91vuCe8hJ9buP+L5HQYV1
 CNzg==
X-Gm-Message-State: AOAM532HTgCh20PkFBqfo4caq8ge2aAl6KeGNZ0OqhHaijGT3jmpLkrd
 qHLyj02pFxgiQuZqsL6VFV0=
X-Google-Smtp-Source: ABdhPJx+P8W2uhzddSw3fnTmEhpfFIZRj2/R8Je3b+El+xG49yzo/zN4B9vsrQxVsH5Cm9iD/9YFHw==
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr5295292ljp.362.1637052399848; 
 Tue, 16 Nov 2021 00:46:39 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d23sm1692776lfm.107.2021.11.16.00.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 00:46:39 -0800 (PST)
Date: Tue, 16 Nov 2021 10:46:31 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jason Baron <jbaron@akamai.com>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with
 it - RFC
Message-ID: <20211116104631.195cbd0b@eldfell>
In-Reply-To: <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y5Z_1H8x236jEerk/fTWs86";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, will@kernel.org,
 intel-gvt-dev@lists.freedesktop.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 amd-gfx@lists.freedesktop.org, mingo@redhat.com, daniel.vetter@ffwll.ch,
 arnd@arndb.de, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, Jim Cromie <jim.cromie@gmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 quic_psodagud@quicinc.com, maz@kernel.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Y5Z_1H8x236jEerk/fTWs86
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Nov 2021 10:08:41 -0500
Jason Baron <jbaron@akamai.com> wrote:

> On 11/12/21 6:49 AM, Vincent Whitchurch wrote:
> > On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote: =20
> >> Sean Paul proposed, in:
> >> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/7=
8133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRA=
8Dki4A$=20
> >> drm/trace: Mirror DRM debug logs to tracefs
> >>
> >> His patchset's objective is to be able to independently steer some of
> >> the drm.debug stream to an alternate tracing destination, by splitting
> >> drm_debug_enabled() into syslog & trace flavors, and enabling them
> >> separately.  2 advantages were identified:
> >>
> >> 1- syslog is heavyweight, tracefs is much lighter
> >> 2- separate selection of enabled categories means less traffic
> >>
> >> Dynamic-Debug can do 2nd exceedingly well:
> >>
> >> A- all work is behind jump-label's NOOP, zero off cost.
> >> B- exact site selectivity, precisely the useful traffic.
> >>    can tailor enabled set interactively, at shell.
> >>
> >> Since the tracefs interface is effective for drm (the threads suggest
> >> so), adding that interface to dynamic-debug has real potential for
> >> everyone including drm.
> >>
> >> if CONFIG_TRACING:
> >>
> >> Grab Sean's trace_init/cleanup code, use it to provide tracefs
> >> available by default to all pr_debugs.  This will likely need some
> >> further per-module treatment; perhaps something reflecting hierarchy
> >> of module,file,function,line, maybe with a tuned flattening.
> >>
> >> endif CONFIG_TRACING
> >>
> >> Add a new +T flag to enable tracing, independent of +p, and add and
> >> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
> >> the flag checks.  Existing code treats T like other flags. =20
> >=20
> > I posted a patchset a while ago to do something very similar, but that
> > got stalled for some reason and I unfortunately didn't follow it up:
> >=20
> >  https://urldefense.com/v3/__https://lore.kernel.org/lkml/2020082515333=
8.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5=
aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$=20
> >=20
> > A key difference between that patchset and this patch (besides that
> > small fact that I used +x instead of +T) was that my patchset allowed
> > the dyndbg trace to be emitted to the main buffer and did not force them
> > to be in an instance-specific buffer. =20
>=20
> Yes, I agree I'd prefer that we print here to the 'main' buffer - it
> seems to keep things simpler and easier to combine the output from
> different sources as you mentioned.

Hi,

I'm not quite sure I understand this discussion, but I would like to
remind you all of what Sean's original work is about:

Userspace configures DRM tracing into a flight recorder buffer (I guess
this is what you refer to "instance-specific buffer").

Userspace runs happily for months, and then hits a problem: a failure
in the DRM sub-system most likely, e.g. an ioctl that should never
fail, failed. Userspace handles that failure by dumping the flight
recorder buffer into a file and saving or sending a bug report. The
flight recorder contents give a log of all relevant DRM in-kernel
actions leading to the unexpected failure to help developers debug it.

I don't mind if one can additionally send the flight recorder stream to
the main buffer, but I do want the separate flight recorder buffer to
be an option so that a) unrelated things cannot flood the interesting
bits out of it, and b) the scope of collected information is relevant.

The very reason for this work is problems that are very difficult to
reproduce in practice, either because the problem itself is triggered
very rarely and randomly, or because the end users of the system have
either no knowledge or no access to reconfigure debug logging and then
reproduce the problem with good debug logs.

Thank you very much for pushing this work forward!


Thanks,
pq

>=20
> Thanks,
>=20
> -Jason
>=20
> >=20
> > That feature is quite important at least for my use case since I often
> > use dyndbg combined with function tracing, and the latter doesn't work
> > on non-main instances according to Documentation/trace/ftrace.rst.
> >=20
> > For example, here's a random example of a bootargs from one of my recent
> > debugging sessions:
> >=20
> >  trace_event=3Dprintk:* ftrace_filter=3D_mmc*,mmc*,sd*,dw_mci*,mci*
> >  ftrace=3Dfunction trace_buf_size=3D20M dyndbg=3D"file drivers/mmc/* +x"
> >  =20


--Sig_/Y5Z_1H8x236jEerk/fTWs86
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGTb+cACgkQI1/ltBGq
qqdRKg/+JPfzhGvv0UVAPJ+OJ9EYLVCYiKfXrGgNS2ks5BZLaBFB2l4WeRLmL59R
wqm2UkmeiIAnR+tWVZ5YPBPm5nhaHMfwNdOR2J9AHxI3goTZoJkGNeizBSLVi0jb
QK6RTGsy2CdF4se9MO7e6IS6nGu+Qb4W6MrSZSCCiTwQMjAPYgxOCeMngdlTjkOp
CRen7osuGgeRhm74yyyhX/BPg2WKORPFPL80sBiw6IET1IxPen5DgGJ4Nc0jXc7r
62bncv0J74eOe+w3XRpwwlz1Gm3rNlBQ9zQfkYtsWJe9oA6cD7+cJ6W2SvDSjZi6
utYM7hnrLbOK/XBkAFcetb8dHAQ/uuaIq75hcz3nho9/P2Hk+5SnwtzzYYcwvV5A
UIrq96U6r4mWKoGaBySkdBQ0qvi+YUzDDX6SVCTGKcfncjHNcZNyryO7F7/CDMlr
3yEvgr+8gOIcgWAhKpHgF5DsY8GfKfcgHf0USwDZVmDNmrkProTf3MeFSryXeEiI
867arY2KKHcGUVvfyfwT28/W+Y+LK7aD9UhUyvnMIVd0IbZ7+Adl9Q/F1wYikYW8
QtlynecLTKZACjYRqUe2Wow4b9Uqlz7bsexOFE8xGoV/+Z7wsYFKm7wx732ZBy/V
E9sUEn/oqiTQSv0/gi5U2e2g9Sv0N8wotSgs1ENwb+2ixHc2i/w=
=CCnA
-----END PGP SIGNATURE-----

--Sig_/Y5Z_1H8x236jEerk/fTWs86--
