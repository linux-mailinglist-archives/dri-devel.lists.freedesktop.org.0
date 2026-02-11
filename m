Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCdjN/vmjGnquwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:30:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0345812767B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CE610E0E7;
	Wed, 11 Feb 2026 20:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="biFE+Qhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDFB10E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:30:46 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-896f44dc48dso37194706d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 12:30:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770841845; cv=none;
 d=google.com; s=arc-20240605;
 b=KGL2S/20lKXzNnEGY2J6G5vlXfoXt72OwBrHOGXUdWd3STXD9pyAxfBXHAurHb81Xm
 T2+4ryiImo5zrWk6NhiWPizRD7PidQLm1zOV5T0nph+/Alr9qvqwubn1RwjT/Ll99Bm6
 r0OZWRxRDLx/DPS2vNbkW7owLhIVT9Um4ZI3Q6pEYoOKQCbKs+yzvwoVpGt9s1V5Fpe4
 xPP3yodcI9JL9yE61TkvozF6pHAgNoRMx+ewZBFSBNP3T6k4uezEQbQKiRc5d9TaVKAV
 ItjVFGVk5IIzboxd8ZcQVXRiI30aM5s8xMbj4/2SOAotVtyPx0gPCO4ffywCEuFvikaS
 72xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VRaFbfqDruPW4VLyYcglO5ETK1UzyUh22ftxXtRuibE=;
 fh=M5qAdDwfvzzQt1WotrMDW4VP3bKmn5dLCvjb/MkeeRc=;
 b=OQUryOh1phTh2tvePn0BHtax3KqcF6wtuMeRdSrvpUFZNS4lq+mpx7qqMC0eJVovqg
 dPBxgkUFUv9Y45SS0EzIQ1kGY15KKvmHS4Ipc2MXq9Rk+GRBN1MI4kbl7a0yU6E1jog3
 sYedlLLmaV6LSWt3YGZQL8auebpUxgJ+Zbq2dvyULfQSoD4OoFJJxAjvDjq+33/eFZcu
 svodx/zXo67km1BygLWXwBU24LZZYFAvjojc80gNWGydO1LNHZpkGp6SZxo4ZMTBmhnb
 Xhe3sffixNSKEu66ISAqeC8Duug0FJD7rm9f0ISgm0+DduNBVclbbLF3GYJ0LuyeeqZg
 T+fw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770841845; x=1771446645; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VRaFbfqDruPW4VLyYcglO5ETK1UzyUh22ftxXtRuibE=;
 b=biFE+Qhbh93UTkO3CkxHErBwbwsewkf5gcuM3zVMB2+7DWukX/4ow7MW4j3pc6P1EL
 gH3N61g+Cd9IMwtYsaT7k0xh1SxuyAZiZnxvy3exMEkUD1vbc3ymHSN8OnlOUX9ULtGr
 i5m1IvRIDbDy0/CLZCbmQSRGmgzMAzhPaonO7MXy+S4+4+pgR8Ku8ZNns1nQUiuPSUUO
 rrTbzvheOCBGz6+SmmFrf7WtT7JYYJ8e3EadarwsV7ii/M3Q4qi+iizZHMYD6ZbEn3r7
 rURGld1tf00LEd0Dd94HtVN/Nbus012dwQV9VIgk6RRW5QW19pgJ64wGbm/EMZmLeYgt
 BH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770841845; x=1771446645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRaFbfqDruPW4VLyYcglO5ETK1UzyUh22ftxXtRuibE=;
 b=D5KQ1CmSS2WgkVEaMKaPcUvVHWZtqCG++G3N+fQKRaZaBzFs08d60X6pLK/e4rbevp
 6DuCg/svag2AJ3B9cGFbCYU6r+MlIvTUftNL7l4ip+GvxXsId1/q0HI/ZCT7NHgo6K9K
 FeyfwNaP1h8mTirrcKmudQt72qVU55bCJYYjTwg0a5X0qICsF6Slv8xXl/1MEoXm7k2L
 TP4dV9y5WCFU10LkKXTSR9vM6XCa9Ca/9xiDdBjBf+oeozZZTiYRqsbPE/g+6qCYxgr0
 MEJwjxKOZFIF1xPgWmpOswE4KU6rAMLOxgFp6ex2X1u4dohoMpaUZ7zqvMjs61SGgXwh
 yfZQ==
X-Gm-Message-State: AOJu0YzU2lg1G7THcTdOnlwiXqN/uMpmqQVeYsyNETsbqaGp6NU1vdlS
 jGLPZLhEb6Vno60oBTruHwH6SlC+N3op3RSii0pJ4By8TzKEnWzJ3XSG5oR7RA9w/ZenJkSRtXI
 cPft7IMVkwcyNGFgCZn7Vh+I8gvTcgGS1KSKtICcYFQ==
X-Gm-Gg: AZuq6aISKWTpQSzxDfvm3ZKodlApP2qRQ9KBVj7juofX3NpEYxExfiXtVTr9KK76cc8
 91GT1OvkPriVXBMJMvjLdj4cGxZj6sC+RcDVD/QdUBes2QtMk9qzsx4eLNocsWqRLHeMx9Pek9s
 NoX/RiKY8/w2Gt3L/XcjVQpvU9HTKSx2j49ga36u7CLX77Gm18kqVnNUvzIOrWvRe7+VOmIFrpa
 kqTOoU+gmxZEqBvCuD/x6YzQSVqpflZvxa+Z6oHhFwfXPiV021ymOMzIcfUic21cthdmws3YttA
 ua4soZGPwcz3F9qhOA2rLwVI2iZ+ipN33t5TJ2FjsjsMH+WaYSUPY5mtmT4JTnoDHeA=
X-Received: by 2002:a05:6214:4003:b0:895:5dd:3d48 with SMTP id
 6a1803df08f44-89727af0679mr10772026d6.59.1770841845210; Wed, 11 Feb 2026
 12:30:45 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
 <CAHk-=whJtUu+L9hs9m1n7p1XYRRQPuzCU9RBMF=ssadxznXUJg@mail.gmail.com>
In-Reply-To: <CAHk-=whJtUu+L9hs9m1n7p1XYRRQPuzCU9RBMF=ssadxznXUJg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 12 Feb 2026 06:30:33 +1000
X-Gm-Features: AZwV_Qhu6sM04sZhODztQYV0ioUju2Lh1-OQJ1K851RYPTKNo12MP_yE8w-fRK4
Message-ID: <CAPM=9tztnoeyBM+vK7kO8mupyx9U2D2mKcTCgPgq=AvyVPHHyw@mail.gmail.com>
Subject: Re: drm AI patch review hacks
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>, 
 "clm@meta.com" <clm@meta.com>
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
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:sima@ffwll.ch,m:clm@meta.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0345812767B
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 at 06:17, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 11 Feb 2026 at 11:45, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Hi all,
> > This is a public inbox, you can also git clone
> >
> > https://gitlab.freedesktop.org/drm/ai-reviews-public-inbox
>
> What an odd format that is, and I don't have anything that reads it
> natively, so I just did a one-liner script for it:
>
>   git show $(git rev-list HEAD | sed 's/$/:m/')

public-inbox-v2 I think it's called.

lei q -o ai-rev -I https://lore.gitlab.freedesktop.org/drm-ai-reviews
"(rt:1.day.ago..)"

will produce a local mailbox with the reviews in it that you can point
mutt at as well

There are also tools I think that will inject things from lei into
gmail, but I haven't played there yet.

>
> and having done that I think the review output format is not exactly
> lovely, but whatever.

Well the idea is to have it use lore so that users can get it using
lei/b4 into mboxes so it fits their workflow.
I just published the public inbox git tree in case it makes it easier
for someone to use lei with.

> But the details in reviews look mostly pretty good to me. I don't know
> the code in question well enough to say whether they are useful to
> *you*, but it certainly doesn't look bad to me.
>
> The one review I reacted to was because I *do* know the code enough.
> So when Claude reacted to this nonsense patch with that whole "Fix
> passing zero to ERR_PTR" thing:
>
>   -       return ERR_PTR(err);
>   +       return err ? ERR_PTR(err) : NULL;
>
> *muy* reaction is that it's the opposite of a "fix" and we should get
> rid of that whole

And I think as I figure out using the prompts properly etc these sort
of things will go away.

> However, Claude's other reaction to it is actually much more
> interesting than my initial "that's just a nonsense patch".  So while
> I disagree with the claude on a detail, I don't think it was overall
> bad.

Dave.
