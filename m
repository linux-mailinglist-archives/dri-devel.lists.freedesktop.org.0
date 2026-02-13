Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLMpCrLLjmm/EwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 07:58:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8692813359D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 07:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FE510E214;
	Fri, 13 Feb 2026 06:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kyo8gdCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051FC10E214
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 06:58:51 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8cb40149037so58099385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 22:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770965930; cv=none;
 d=google.com; s=arc-20240605;
 b=kXtuZIolVUDpVATz1bljlexQI6Lb5Y97FYmeui7UW5Ea4p6J3xloQJi0+gEFRt3SHP
 ASwNgOMukbdzL4kbBmbfIUF3KErsQlEsmBdU9hJ1S/zBOgwWHgEY5B1qpgcfsnX0oxzc
 rh4dBNm5kCCcPdKppayo+V8ff4pCIqK8BCJCx9lVG5jMShhZ8Kkia7kl5OIKXhrAG34V
 c9y8Jv+3XQYwHD9balAxkhgDy9JuQkb7lW9IaHPkbJwqVdKK1ivqpmOItmENi2r2jHZ7
 3F6D2unfimCUvDTeydrbXGCsQGpjREJp5xsOo2AMBHaYl7TTvhEmro7PD8Hl0VjebA8I
 qt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GBJVZjzNlCoEJAfZmXlUH90EMO75YyNJ/8tA4j+wxTc=;
 fh=aCXs3yCY6uL5bGp7zgz8cciXYTtJKYNL6yPzd8Y0eRE=;
 b=FB5S8ecfUmOCa0u/N4OncqdPTMhCBLcI7alp5oc6w733ixHJhDgDiI5yTn81ERFlHi
 SUwEqlySFJV+x4OrUOIZKJMHu+oZvuYUrSnkO4HOiy0dfNvg4FdLsPnimv7U7XfSuNUI
 XQnAAZkl1KJPMl40yP5iUp7vGLBZ6QmutTahnQFnR+t6mS0iSQxoliNIv8nqHEHlapvX
 d4ngIvlkgPTZrUHVF1LN8QW+tijGLPbQ061FF6Nvb1a+sltdkoetx/fHLb4ASg94LKtA
 73/A21+9oXTI79uYnSdf00TlRqv4a+C6lE+lcn978Sjr0saidDKXzkgr5IMqTnCRSoFx
 QZoQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770965930; x=1771570730; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GBJVZjzNlCoEJAfZmXlUH90EMO75YyNJ/8tA4j+wxTc=;
 b=kyo8gdCeRzIvUytBSHR7Pu/Q9fM5Tto+yVzJRID8SWMEGSmtMhu/PJaVxuOpwiOvQP
 cSWiJXf3U9c1u9+N32HTxnfmEnwRC4+8AcwKYRHJca+ysl68fnVra5u/KZ929GofGj3s
 Yab7+uApVzsYBUycwawDBQJomyaiN7oBjbl9+5LZymu+QqY5q5bHdeg9cESAYC6YukvT
 Rd2tzX10RLTu/WZpMrpoPRw2O310XTrK1/B5Q+d9cQI3Zd1W1eviU51dl8AdKrNFx9e2
 Bkefe8mpYWgPbgpA6W9ik4Lkw+AR03qZP6jBNVpV/3J38JbOo7B5XJRYiQdnfKqb9xg0
 r26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770965930; x=1771570730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBJVZjzNlCoEJAfZmXlUH90EMO75YyNJ/8tA4j+wxTc=;
 b=EP+Pg65o/YUP7h9cKMiJAiQEAbGdEtyLOxm8S/CXPVQ+d02N8+RxkyHC2YS6uidroE
 gQtt+1DISBpJZbx4T/CkuA3r3DsYYG5euYY0a0QbfBRn1a6j0Bv5mJ+TCDMqRf/seFcr
 DR6rnJept8/hVJKrnqi78ukPwQh0la11YLDI201H23jiT6G15bQUt/ANf4GFZkEDZOG/
 wYGei8dIY61Hj0Q1WPnO6JFrPvjG6+awXycYbCNEHwER7v1iZIcSuM9C3y0fxAOURCRq
 IWFIelKHDAIC25eC5XvJZH0uG9I38uEGba9XOy9pYDi9oq3xYoZFnF0jjQF2Quf8fyAg
 65Vw==
X-Gm-Message-State: AOJu0YxfA92QYRbDb7gg1cJIayTtBmWFvgNhwcSvWUUNP7Ju9X/rwHtN
 nsiN1lVZqBlGYwhnqzYOGpEQwWtMiqWUbBDCa3eKrWsyYaEUg86ENpHE76OUkgllccaODhwnYBB
 VpUh+XBPqQYPdZhpZ6zbTodiXGLgn558=
X-Gm-Gg: AZuq6aIm5TayxT84ESvUh131GnuQ7ZB76IZIOlgT3F8GzgCm6aiFYYlOmDs+0pbaxgq
 zGgsTRRmECBNWUSI0u6gEzqm4eDWMhUFkRhZHoks9BT3/fKba/JHGy70rTJAY2CjyXP0Qaqh0f9
 NZ1FSTMZqxerp8gPtpIp0kxASJl+AtE+mlJkdpOrHEmNc3soztfsKUaS+f/MTVpKV8P/Ksn7g0v
 LeDUY1jlmdSzQAe5BJSIOKHiSko6oq/0Yu6juBPnybl5ZM8Lx+n9WRJpgusRszU9TgcjU5xVXxl
 neRsHE3v3lDC+VhkX3zlxQS6nVJVDtto+zNSXL27AxeoNZLPA3wwcXFSk4w9ei8+azKmfzFUvDy
 pbw==
X-Received: by 2002:a05:620a:1917:b0:8cb:3f0e:7740 with SMTP id
 af79cd13be357-8cb4245d09emr99027285a.51.1770965930015; Thu, 12 Feb 2026
 22:58:50 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
 <09baeab9-6aa8-4de4-a200-3091bfff1867@meta.com>
In-Reply-To: <09baeab9-6aa8-4de4-a200-3091bfff1867@meta.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Feb 2026 16:58:38 +1000
X-Gm-Features: AZwV_Qjyq0JVQhfl6J5j_jowHd-oczoIjY41VfqRd9oQ_EXqVsSVGfDAaRGrmJE
Message-ID: <CAPM=9tzTzddGbXZ48tCs+uoZfx51_n111YP4-G+-=yWCFAF+Kg@mail.gmail.com>
Subject: Re: drm AI patch review hacks
To: Chris Mason <clm@meta.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>, 
 Linus Torvalds <torvalds@linux-foundation.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:clm@meta.com,m:sima@ffwll.ch,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8692813359D
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 at 11:29, Chris Mason <clm@meta.com> wrote:
>
> On 2/11/26 2:44 PM, Dave Airlie wrote:
> > Hi all,
> >
> > This came up at kernel maintainers summit, so I've been trying to see
> > what I can piece together, and have a small demonstration that may be
> > useful to some people.
> >
> > I didn't want to pollute the mailing list with AI patch reviews, so I
> > decided to set up a public-inbox that the reviews are pushed into.
> > This isn't currently automated, I'm just asking claude to pull the
> > last 2-3 days of patches and review what is new every so often.
> >
> > The workflow use lei to pull mails to local PC, use review-prompts +
> > my own prompt to try and review a patch series, both as a complete
> > work, and per-patch reviews, then create the reply emails and put them
> > into a public inbox git tree for publishing.
> >
> > I've no idea if it's using review-prompts properly or at all, this is
> > all very vibe coded so far.
>
> Speaking of vibe coding, I took some commits with Fixes: tags and ran
> them through claude to identify subsystem specific knowledge that would
> make it more effective at reviewing.  The results for drm are here:
>
> https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/drm.md
>
> I'm happy to adjust of course, this is just a basic starting point.

Oh interesting, I might try folding that into my prompts next week,

I've written a blog post with what I've been doing

https://airlied.blogspot.com/2026/02/drm-subsystem-ai-patch-review.html

and a link to the current claude generated reviewer script and prompts
I'm using.

Dave.
