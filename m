Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDtPLCa1cWkzLgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:27:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548261FD6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E98D10E871;
	Thu, 22 Jan 2026 05:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N5+miDRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1AD10E149
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 05:26:56 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8c69ffb226eso81745185a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 21:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769059615; cv=none;
 d=google.com; s=arc-20240605;
 b=YwIl0LNA88V/A5cOSpGAS6pcSs/0ZNIdWp4jMMODP4wk9XnXv/3X7oHQqIlaMLPg8q
 APYIEIfjVHm/2EfGpXw0USwXVEjicE8qavq9+cEjRWw0Elalu6NlpvprWK376qR6mea3
 GXtDl8ealr8upTfSM1ejyJRr6MvFgF0meK7XJHJ733Xgg0rJSgBGewYyJVMbGhoqV/Xo
 MBrMVmw1LK9YSnsz+bh3E5RJgeLxVb+QcSQ4vRtpQxM6CqoBniTY65VdiBOZXZaFcu4Q
 2n5mdsHHvJlq/jCZLLOaWxiu3TpvyGGRBAUs9eXQmzmI2KJVZta2JLE327lu4akf9iwv
 1I2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fBla1J9dueqeZqv+IKTvLuoBDmXhHc5I5EAmZqUprIo=;
 fh=YPg+7buHGjb/wNjfLlULxXan1tovcMOSbGJkwcg84m4=;
 b=d3eRR7Ws30FLIqMKobAFD2WVWodqiyq9ncd+vHYMhpbFUzJFpVljUSCkUx/4f5y0ym
 CY65aKjWw9MWrSU0lEtpEPjebrxVaY0FmVkbarHCXKF082Lvy1vPoRqiq0DfxI13x2Ot
 CJ4Cp+2zE8mYzOOiArA8wl5MvcWS3KTL2u32nAFeqf33wx5sqxw+yLpgVIBcBtan1ZLD
 v2VU1dRTyU7FALk/6oaLX4qA0FiXjqG/ndRbdPbplTXGMkMfylPUWJiXdHNC9xhc5PDb
 bHYgPAUC1lPBeqlz1lbkONNL7i7cuOgrbCJ0hW0tICeHlZ/HXu9BLQMw0aUwH+tU7ANf
 0lqw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769059615; x=1769664415; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fBla1J9dueqeZqv+IKTvLuoBDmXhHc5I5EAmZqUprIo=;
 b=N5+miDRnIbO2kJWioFuKBnGJzeXbR0SrYApLYYXK408/6kF8yCtgXhVLC2hRNt6rWx
 wH5CWhvnuoqDT4KV+1Lm9E5esBXCMOmsr9eoCeE9KyTg4jMlubsZUTKh087juuEv12D7
 4QTDEPbNcruaDiniMRxWid7GdU8pU8MEu+N/EV0oxLx/Fj07gloAY+HsAJe59EVgu6zf
 ZlBORGdRIBf03knVTQI4clfhL1GdkCBC3EnjwXd/1808f2aStoTB1i/+piGkzjraofHc
 wxDsVp0SXMI7+Y/pQP4jqTZT/52yO7Mc70IrK0UNki73zYBVbCXwxsdkyZsFZ4RZgkP6
 ukaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769059615; x=1769664415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBla1J9dueqeZqv+IKTvLuoBDmXhHc5I5EAmZqUprIo=;
 b=VohbCf2ihp8KjsDLi1esBXFM2DOezv4eYe2v7jF6k3OKkyejADitI72yX+2gkybb1X
 KFaYH0l91jsKX9oe2LMDzBzQMDjQvnke5RPKLIKDfM+oHiNzkZ3V5OQ2AMWYcrtmGIpc
 1zH1pe+gDgyPZa9LUuzRMpxjQ9hEll5i6joCYZcmJWUWbHNO9aO/Gya8MFVNcbTXeZb7
 XsCV6rGl9iDabIDmKbVyoTMMQ6RniUHq5WzZsBCJtbRMs+L6NnDk0A2PZpP52e5jwbGd
 2OAbDb4xRN3MnHc4p0UCxfQjHnYb2xWddZakyBgYn40zK8rLZRmytm+XsO/5P3SJqVwI
 UTAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKe9XoC3gdw+J2oOoGBe+0zpXiMu2AR1A5/678bBlliybq/MwKhvR/lHxLDYR7nO8m5mCyLHxBSkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSsM+L8pgggQ9GAkQTBYrmO1Zf0OQxROt5bdqP7n3nqWgBk++G
 jyyYSxcONp/yAbdGgVvoiTftR+dIb0cTl/Vo8s2L0ne1owPUXtESJmYc0ReuW+bs31J7XLY1q7h
 Dot93EoTIxN0zIhLghtPJ6sbLgTIMWV8=
X-Gm-Gg: AZuq6aIl4B/DYtimknwVwZD9Q6n7DhMZrnfhowKETzpgk+OX5jITfKhIobnF/u4ly4v
 2/TJB2nStkiv3uHvzZ8ydBbB3WBtBKdvx0TuYIe1nSgig+ChqCauw9JWF4rouBc5IUukWHg+rHT
 cdOebecoE9/k7uPMuUHM8aUE4QAtodEuHmKA+1CkipWVBC6Nzs3gcHEB2UBFVjx931EblSSOeuD
 4VWfb4z3l3GLIoluRV69IphsArQWLHCXP3tfaVaqnt1d5Z+AyGQK6R3DLibYCxdxiLJoRifNO2x
 ygbv5emaI661nnSQWgbTo+bsqYYIHdyA8fFUedwSY3t3xBF+nzOkSdryT3fHmoAD2g==
X-Received: by 2002:a05:620a:46a2:b0:854:442a:f568 with SMTP id
 af79cd13be357-8c6a6944d59mr2795593685a.43.1769059615381; Wed, 21 Jan 2026
 21:26:55 -0800 (PST)
MIME-Version: 1.0
References: <aWkNThVRSkGAfUVv@intel.com> <aXDgaporPS3I6T4J@intel.com>
In-Reply-To: <aXDgaporPS3I6T4J@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 Jan 2026 15:26:42 +1000
X-Gm-Features: AZwV_Qhm-U17H0bkhJqLuJLvX10NZw20MoPnZ2d0NLMam21ljZjcsyaU1GyUslw
Message-ID: <CAPM=9tx-3UWevjzbJyDTGzQ=WR3KvVDU8M2xqek39fs4zJZhnw@mail.gmail.com>
Subject: Re: [PULL] drm-intel-next
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.vivi@intel.com,m:simona.vetter@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:ogabbay@kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:dim-tools@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 6548261FD6
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 at 00:19, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Thu, Jan 15, 2026 at 10:52:46AM -0500, Rodrigo Vivi wrote:
> > Hi Dave and Sima,
> >
> > Here goes our likely last drm-intel-next PR towards 7.0.
> >
> > Thanks,
> > Rodrigo.
> >
> > drm-intel-next-2026-01-15:
>
> Dave, Sima, anything wrong with this one?
>
> I noticed this was not picked up yet.

It should be in drm-next?

commit 9d10cd526111a989eb353c3a4df9d4c79695ea8d
Merge: 37b812b7fdc2 d30f75d2dba9
Author: Dave Airlie <airlied@redhat.com>
Date:   Fri Jan 16 12:57:20 2026 +1000

    Merge tag 'drm-intel-next-2026-01-15' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next

    Beyond Display:
     - Make 'guc_hw_reg_state' static as it isn't exported (Ben)
     - Fix doc build on mei related interface header (Jani)

    Display related:
     - Fix ggtt fb alignment on Xe display (Tvrtko)
     - More display clean-up towards deduplication and full separation (Jani)
     - Use the consolidated HDMI tables (Suraj)
     - Account for DSC slice overhead (Ankit)
     - Prepare GVT for display modularization (Ankit, Jani)
     - Enable/Disable DC balance along with VRR DSB (Mitul, Ville)
     - Protection against unsupported modes in LT PHY (Suraj)
     - Display W/a addition and fixes (Gustavo)
     - Fix many SPDX identifier comments (Ankit)
     - Incorporate Xe3_LPD changes for CD2X divider (Gustavo)
     - Clean up link BW/DSC slice config computation (Imre)

    Signed-off-by: Dave Airlie <airlied@redhat.com>

    From: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Link: https://patch.msgid.link/aWkNThVRSkGAfUVv@intel.com


Dave.
