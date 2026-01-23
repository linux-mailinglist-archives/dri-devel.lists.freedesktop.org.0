Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDMqNAY9c2kztgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:19:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6273E731DF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D53210EA76;
	Fri, 23 Jan 2026 09:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dkw2rkBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4082610EA78
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:18:58 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4801d21c280so13871865e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769159937; x=1769764737;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zdFhogTevc2NiNVJCy1e6VQGbYTDXskZxMvL8rxPQKg=;
 b=dkw2rkBtl/YwDkqgFvaKCyI02Tk9ICnGdgtZbkH45WnM9CBUFb38qGBTf/VqrhB6cy
 eMvNNdnNVvZMbWaeN+EDT0yYjLsLxvbKc2UoPhZbGOUE+0q3h/ClX/ACpdRexSr/038V
 AVRcUuSeKoI34bB5DzVPd94rWQ5es6hVYwq394qP2l05XzXd96N9gcqIXKs0F4JBvmeI
 ftpLoBMycU0HQrpC+7ca8ndOQsb+0Y+OaGvMi+wu9zofDgjaDmlhRaUBwYp7nxyyR7ls
 1G0ZNXKR70a4+I7+K8nXzX6oF53CtBT9wJ2v1YIXfMOQ+w0WdeyaO24ZXYhSxBQEVfzT
 tlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769159937; x=1769764737;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zdFhogTevc2NiNVJCy1e6VQGbYTDXskZxMvL8rxPQKg=;
 b=aPo+t2D+dQs49O6OviLNI/rFWFxkSb5Yy2QtG040FJ+wtOfLyKV/diz4QGMA40IxhN
 Xn+0y6Wdb8E+y49rVEvDFM3rWUeMtwRoG7oVVP0tDbzrHNghDmLrlnOumJsrsuwJkhpb
 JExWTEx/541Aqu/STgPaFR+d8+Snu+fgC1FnrN4UzHbaIYbU3z0iCorjmKrlUkSbKfoP
 F6tobu85E2yITmVsWgSkfylK+ybWgbZiwJgC8avIhhbCzpW8dgbECSOrKt9UuJ0B2lNd
 sQeWIxLl9z4/QwyzoW/3IkkcjqHOI3FnapdC6WHpQf/6WP+DOCdcEhr8p2icPMZKoJ8i
 NXeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2DcbuQ+jsw5cPFci2yMAK698Orc66SD8CGLxZEFvQKHbGnf+td8G/Pf6BSYafNfvxWuLDJSAZ8p0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRQyNIrXM28JZ9OiGiZRH0G1cpx1gL2axKyaZmA9imxnUiKijY
 aCk6gCK/YgkQ96AD3ZM3ARjOL32CPhYpv62obkPNClKyRn7ZgAjXB4l2/9MLUn3B3j+XDLklq2a
 DCctxhIbMlw3O/Xj9dw==
X-Received: from wmbb3.prod.google.com ([2002:a05:600c:5883:b0:47a:7874:d5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5253:b0:47a:8154:33e3 with SMTP id
 5b1f17b1804b1-48051256401mr10649045e9.28.1769159936687; 
 Fri, 23 Jan 2026 01:18:56 -0800 (PST)
Date: Fri, 23 Jan 2026 09:18:55 +0000
In-Reply-To: <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com> <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
Message-ID: <aXM8_-8trM6FqQWu@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org, 
 miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6273E731DF
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 07:32:55PM +0000, Gary Guo wrote:
> On Thu Jan 22, 2026 at 8:42 AM GMT, Alice Ryhl wrote:
> > On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> >>  #[pin_data]
> >>  struct Regulators {
> >> +    #[allow(dead_code)]
> >>      mali: Regulator<regulator::Enabled>,
> >> +    #[allow(dead_code)]
> >>      sram: Regulator<regulator::Enabled>,
> >
> > I don't think we intend to ever use these fields - they exist only for
> > their destructor. In that case, please prefix them with an underscore
> > instead:
> >
> > #[pin_data]
> > struct Regulators {
> >     _mali: Regulator<regulator::Enabled>,
> >     _sram: Regulator<regulator::Enabled>,
> > }
> 
> I wonder if it makes sense to request a feature to mute `dead_code` lint on
> certain types which we know are there to represent a registration or resource
> enablement.
> 
> Currently rustc's dead_code lint has a builtin exception for `PhantomData`, but
> I think a lot other types should have the same treatment, this can be useful
> even for other core types, e.g `PhantomPinned`.

That'd be an interesting rustc feature. I don't think it's possible
today.

Alice
