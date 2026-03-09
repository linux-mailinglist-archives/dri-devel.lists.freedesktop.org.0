Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KNMBsRWrmmbCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 06:12:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BD233DC9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 06:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2F610E0E6;
	Mon,  9 Mar 2026 05:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UkzyPq/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E714F10E0E6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 05:12:30 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-89a0ecbc713so78572276d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 22:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773033150; cv=none;
 d=google.com; s=arc-20240605;
 b=WngxJLrxKd8gns5nXdT+qiU06Dqpaj7yAP5vqVmIgAbFUgjZY1woZJRaVp8Riw8lSU
 t8rbLtorh2ULSKrvEJ2HdpJFbgDm4n5noHdKD3bU07D5A6tHhT/0D0FXNXOM5Dfri+FY
 +4VncKcUT40DQXqpQ832yfe2OtcVm1JYmz056px/BoPa2Lft069NhrysPYPBL6NcvKat
 MBq4EZRVYRhvBIMJGAyvC1IJtZejePXv6Nml4ksNecImM1eea0gVT7UM1+ibZZ8uRE4L
 SjYp9rSBEQ76bGdIGc6Y5ZqSs5vgR8KMKON0HCnE4AuZ+8US4CXmQxoZaMXEGgiaRkwM
 UMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KPiAeNqeqIse1l2aVvOzahkJsafH4m2oi+owieC9R0U=;
 fh=MVMBXF+b/NEPoKg/ykld8+p4g/gfga65NxNadBaONOw=;
 b=CJlF6ovCK/zkfhC46LikPlO1GpSa5+KUazNh426Ln0YmPhAYI5pxV7agjew1nxsQCn
 gR4VOyLhQA6w4eaVqnRcSChnVsZb3DjdMxyzPlt5bCzp2YeBQGdAc80DIAoGHP4XKFco
 2NwinYN+ZD0rNXu0BTYin/wRUbjJvKpxY3087yOfegg1aMJz7iCztiAlgoOZPSKb8azO
 8039kIWuaQ08PU0UffvLXT4DhlbpKR3oO0IzQYGbDlVTEc9pq4E3m6ZHkiTvNYWsc1Bk
 79X6B0aIfPss8P8zXzNjuEToc9oPoPpnTBhwC2eed2WLjZpNv9Y2HHocBMq4x52z7Tl6
 C1tQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773033150; x=1773637950; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KPiAeNqeqIse1l2aVvOzahkJsafH4m2oi+owieC9R0U=;
 b=UkzyPq/AiQQXvtI4d292iX8hU5tH9UQVYYiS0K36WKCstPEtcKTuDxbXm3FEuJmvbo
 KKukt0YC0+TzAVaPMZGuLvriqipHPvXyHyu44lueLbR4DLvozwoCqk9kRPjLRiEE2R9V
 Limk3AxVzi5P33iuWB6/bx971gMlH9eFsqOv46IrH2ZIiLwCFntG0QaUiP0JzfbvFxq9
 DvS25x28jG7xIIUB6b2JwsmOgTa9o6SK9lZAjTqtwPKsMESE1+n70Dh/NRjl6tnuidvP
 DID+VLvNbGirNBYmchjAHsCj0iKLC/4I5KWmvnrCBPAuB6fMeL/W+LDfbskU+EE2S1LK
 oBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773033150; x=1773637950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KPiAeNqeqIse1l2aVvOzahkJsafH4m2oi+owieC9R0U=;
 b=E4Y4BP1S0reXANnBygZnX1BKpisqJ3Boz0NbO+lBUUnH4n4dpABDX22ppiJx4Dt5HA
 7geNpYcgf0ZTmZhJEwCCUJW915GH/zS9xx0iajx9lnkFisaDZN3YeBvooK5OzYLLJ2aO
 th1A6R0PzDwXcsD6JQ5qowpvhRVh7oPZtHR2M+a57pqqqk037Z2HmQQ6pQ8WhnGB+gXs
 dP3z22LcLRDG214qDUvEzQ95hRF154uEoY5oOxXkYxbO6LFtFKXZI03Mylpkzdz5+yxa
 QjzpfJIcT6wk/Z6BGHhT68vm6ngl24BKWeKnEpGSkcfj5L+sAhVnUAbpGLafQiUmnDI2
 UqtA==
X-Gm-Message-State: AOJu0YwQaCZW6V9i4RqLC6dnpkV3ILl/xAxlFlJCI3eALUnmCSKWX3e7
 dUy154E2NIdeNVmIkQD6YrRiQBR5YhKicpQ52PC0gfuTBlsYOS2x+tTzLdGHMNZ+ITyBq3YHAZb
 VQJS0Qqeu+iCh7Trknf8VauYK0QMGVzQ=
X-Gm-Gg: ATEYQzzPWIS1EEK/rehfAufaShpleOV6EhydjrDnvX9KE2ue9QZSe3evkTI5+irrDyr
 08rhNI6JwtZ8ugl9ourx6Q2mK5xE/0/yKtTWwkLCYoUU1y6KMW1Y+s0lKCsSwhU9YHdw4STHcAd
 bZqdmGu/V0AKKGcYHAR5w25oA6PJFCyEJM1El90sGmN593M6xlXGo6HHHOca/ht/lgJ6Igj8N9j
 mKhahOAgGEXTPC2K5YV4Z9iIjlsspPCFQovxPa2EB5lv7mipVEea9UKe0GZpRMtgFK8gGTSn0f8
 VuwSuRGChPtGBRRWHqbOpmyEYjQP3LZa6gzh/Z/32TpWHcX9tLmnqqYrHX+7QKAfbw3dDuRS6r4
 WoA==
X-Received: by 2002:a05:6214:5083:b0:894:68e1:5fc7 with SMTP id
 6a1803df08f44-89a308e25f6mr146541266d6.31.1773033149699; Sun, 08 Mar 2026
 22:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
 <127da2b15f3b748cbc1985847cb318b9699b9682.camel@iscas.ac.cn>
In-Reply-To: <127da2b15f3b748cbc1985847cb318b9699b9682.camel@iscas.ac.cn>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 9 Mar 2026 15:12:17 +1000
X-Gm-Features: AaiRm53qmV5c4zQCCAM_fmJXku3KzVb13RRW2CNkr6gyjtZ7q5-1EqiGBrUeBhU
Message-ID: <CAPM=9tyN16VWpDAm81kb4KkYUZNVfG2yDnTj5PbEc4SC2VW1Bg@mail.gmail.com>
Subject: Re: drm AI patch review hacks
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>, 
 "clm@meta.com" <clm@meta.com>,
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
X-Rspamd-Queue-Id: 757BD233DC9
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
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:sima@ffwll.ch,m:clm@meta.com,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.973];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 17:40, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
>
> Hi Dave,
>
> It looks like the review bot does not see any extra contexts than those
> included in the patch file?

It has access to the latest drm-next, and should try and reference it
in reviews.

But if something has changed in drm-misc-next for example, it won't
know about it, it's hard to pick a base that is consistent and won't
chew tokens every time it needs to update.

Dave.
