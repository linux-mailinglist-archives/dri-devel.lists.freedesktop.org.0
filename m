Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD//LyHhjGmcugAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:05:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF712750D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D1210E0D8;
	Wed, 11 Feb 2026 20:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c5YiXmJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446D010E0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:05:48 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-503347dea84so67250061cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 12:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840347; cv=none;
 d=google.com; s=arc-20240605;
 b=aYBoIHPDBnMRMM3FeNJpvYNhtXQnq7HTbgHzhiqU3YEutVjd8EjeoMQeO59pGLQMTR
 Y/S3iiBYJrwZ6UHn2IeGnr3UtwGri7zcRPcVToZjJQ1piKoZ6jX6ZQ+FORVptEillHmb
 6rT3gl4ErbsG9IMAOZsGupXoxfkNWiqPsmYP7/DheseoP7OBZb9wCIzN4ngGnKOzYGEh
 INAtn7QlAyQ6lXJFQ9tAOnpJVZOfHKzyZUzsCEjnh1S6cVwnayAhqjz+HRq7YfarM+2Q
 FsnJeBzbL4qWvp58qqKBSRzVM282yPyrZpIxAgXA2hM/yf4wSi7geIQjJNYAhoXt+N4L
 UiJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bFg8phj+Bxov8gR26gAeP1XLfTHU3qB+0OqnuPI8zAI=;
 fh=aCXs3yCY6uL5bGp7zgz8cciXYTtJKYNL6yPzd8Y0eRE=;
 b=hozeOYuWahoSxpZaexAwfTL0zCqihSwyi9+468ryk4GRVmrYlNRSe7pRw/tdJUzFyv
 jQogXCIj7TIx0kv1i0i7hg2heKuGzn0NEkr0RgbT1HG7klf920wD+f25YcLIUITV3Cgq
 T/G1LVSxA8HLzSdPIuL/XYLGAspHKuFWRd4K5VBth1ImjBBWZcOGbroh0oPFd3zq56+4
 4CA5YvAuxcoWOi/fef+eImEu3mZ9sHvUYEm5M8QOHjyEeEexGP3almThIPDOq+v7VbVG
 6fZmcoSya/GFpXKrbNVurDu4uyrzgVHArVTeulgl3UW13J9fqC9nsfIRX/fbi1tVn74t
 fV4A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770840347; x=1771445147; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bFg8phj+Bxov8gR26gAeP1XLfTHU3qB+0OqnuPI8zAI=;
 b=c5YiXmJF4dm1WAUkq8cxoIJp0NAXc7IgQOXeg1IZRVZBZJak85W0vIhETu8LsLr252
 HJCDlimOhYWyVdfNqC/RCvWdrNY7bIVhAU5Zh5ud7GewonAKAxjK9BKcC7M7DTIaJ/qj
 UPMflQudh9JwXsjZ7oXI4RZ0OjonpCTapkUErzgZ6OtdJEgd/EgeTaXzXFjwbEWiY2lK
 FSLjriMYQQrpIOsUHZk7vYuD03HTLGXpAgcQjHD2lrndfBY7E2HmJdI7YrE2/v78S5gF
 pyBf4kCxHU4QFanBibUM8NqBfs7LPcTN+SAPcs32733JsR6zO27FljYIxX0zSxtPcz2q
 OZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770840347; x=1771445147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFg8phj+Bxov8gR26gAeP1XLfTHU3qB+0OqnuPI8zAI=;
 b=kI5NPBKL0tcNQMFNTChqMH7mmMYVl+7EjhttD35mML/gWoR3IwmGpEQe9gz7nt0gNQ
 k8EmprXuvrqVPjiaT5ZEpSUju9jEqlcVDd5JYoatsmkOk3HxMNHGQ6Z3iB9jebPKRLcE
 x+uQoUmrIINIs1AgY6sXGCEKSGUr+ngAKKRkgRh6Ni/OuLyD1M8zwVg3x5Ycpweasx3E
 IC44rQT68HdsAThOlTFaxk4VFPUQlQtouWwUhF7qG4c93c73TO/1DK4E2+K5zua4MVzg
 9I6bkJEcqBU5k0ylkHVVjeyGrMH+6wPQTaSAIja24vzWDviPfxTz0dc2HzyAGVW7kkls
 US6g==
X-Gm-Message-State: AOJu0YydQX1dB5raPwGbpJlcMSoUsy6kDv6ncT5Lt+d/EWDIIUAnl81n
 I5mqWJFKhwReDlmIiiWxiYrKAcc+ep2m15Pp2XB1AQ/ljarsKD+Vv3SN7B0X8jEofUO037HjCR+
 nor+lF1tLYrCb6LXzJhETe/aoy17fGsSnyGiSgss=
X-Gm-Gg: AZuq6aL7miPZX9+eHJZNb6s+7q338PFtV02B8uGvQD/5ke59xfuJS4IuRjfejHRwc7z
 wmLlHeKKXHxMCz/vjkkKyRLAj8d/Ns0kvWVuKpuvaWR0Zm4GHNcR/47YjmzqaiS0hqW36vj1Mh1
 afYNdOg1SxHiL8QLsXxGGjTj2oHS8zes6nTDAXr8shhWYA2TxjYdiiF1KN0kMGi53XILrKNBghk
 QSuojtHzBybOUicm/dfYtK/eoT6918pePkZP0YD2robl2Wbdl0G8l5vbek8rANEX+8sbTuM3Hcm
 st6WlDF6ZBlocdn4U3e13o2WASam+YF+JgpXzQN8RwIt7wuCIlbrrXWbTIz7ezPe0rYcK0Yyeh6
 hEg==
X-Received: by 2002:ac8:7d4c:0:b0:506:1d7a:7250 with SMTP id
 d75a77b69052e-50691f5e7b3mr9438881cf.66.1770840347087; Wed, 11 Feb 2026
 12:05:47 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
 <7de4b6c4-f230-4c66-87d8-7766a95cd10b@meta.com>
In-Reply-To: <7de4b6c4-f230-4c66-87d8-7766a95cd10b@meta.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 12 Feb 2026 06:05:35 +1000
X-Gm-Features: AZwV_QjjMgDcj1YVaok6aT5I8updy_ogP5z-cMaTNcmnemGe703uk7ZuXD6TLtU
Message-ID: <CAPM=9tyPS=B9WEwn8BydwfpY1qLY+umUQxsJBbXT13nqxK1aTA@mail.gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:clm@meta.com,m:sima@ffwll.ch,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,urldefense.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,meta.com:email]
X-Rspamd-Queue-Id: 16FF712750D
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 at 06:02, Chris Mason <clm@meta.com> wrote:
>
>
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
> >
> > https://urldefense.com/v3/__https://lore.gitlab.freedesktop.org/drm-ai-reviews/__;!!Bt8RZUm9aw!7ZGHjZ_cowu_q5cPVL_mOXmzkCeCUgALho-xJLBTCSi_FtnWbpG5rNYrxBZfhrfg24G7LkJ4$
> >
> > This is a public inbox, you can also git clone
> >
> > https://urldefense.com/v3/__https://gitlab.freedesktop.org/drm/ai-reviews-public-inbox__;!!Bt8RZUm9aw!7ZGHjZ_cowu_q5cPVL_mOXmzkCeCUgALho-xJLBTCSi_FtnWbpG5rNYrxBZfhrfg27r4vy3o$
> >
> > I'm currently just using my Red Hat provided claude with opus 4.6,
> > until I get told I've burned enough money.
> >
> > The list below are the patches with reviews, if someone wants to look
> > and give feedback on whether the reviews for their series are useful,
> > find any bugs or regressions, that would be cool.
> >
> > I've bcc'd anyone who has a patch on the list.
> >
> > This is also just an experiment to see what might stick, it might
> > disappear at any time, and it probably needs a lot of tuning.
>
> The output is pretty different from netdev/bpf:
>
> https://lore.kernel.org/bpf/?q=AI+reviewed+your+patch
>
> Which might be what you want so it's fine of course.  But it looks like
> it didn't actually go through the report generation from the review
> prompts, so I'm worried it didn't use the rest of the prompts either.
>
> My stuff should be creating a review-inline.txt which is the lkml
> formatted review.
>
> I'm happy to try things out here if it'll help.

My plan over the next few days is to refine the code to make sure it's
doing this, my prompt asks it to load the patch and the kernel
prompts, then do a review across the series and individual patches,

I'm guessing some of the results aren't making it back out the other side.

Dave.
