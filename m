Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NpeMUsDnGkn/AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:35:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE426172BEE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F22890B2;
	Mon, 23 Feb 2026 07:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R8HH3YcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD48890B2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:35:34 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-8947e6ffd20so42374826d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 23:35:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771832133; cv=none;
 d=google.com; s=arc-20240605;
 b=S1KN8HbPhm/pD43V3qI6FU+rUoL3UtAInSRFcW/iCdzJykPXgNE1u5a1Q5swaThBbG
 mYIWeqayHWX7DtJfn9ObP4mDItb0nAnV1sDK406P3pmu9SrBGyytYGcb74Ffas3SCZ1n
 pBx7YucRNfBldebUcm9dqg37Qe29qZvnFhyeJGtiPSScUkgaejOkXMURX58TpKSvDhR0
 ZsLnLjGVUXsrFFhvxBwoqy1T+xFnk67uo0USSKX7YVbNya5gc1zTv1OokH/KwvRYIFPY
 rDcmw8vsB7ottpoWKykRlfOiumh/xvvpulvwXA/WZXWZEy4AqmrdlfwIbZhXh6n/bCM5
 RQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=u/+sGHWdHQsQbTpB0zpyZezxspevMl5GMG9viG6SmtQ=;
 fh=3gN1P4D1cP/GC13DemBqvPPd9MWPvLclO+eFmObZVmc=;
 b=TK8CGTVVug1aHkH2ns/No+tk1P7HSi4dmGvEpI7WTGgwakEr4wSIzP6p9LDLYyaWGR
 RDEVbR7cQxUdHghuPzXZdnVJv/lm8AsYHgmijRn9Z9c0hTjgYt275VKNvccTZkIyDYZY
 iyNbfzOfsgQoVlUVTy1KDDhwuE+voyLeTxhiDLxoshFld1efD3vJt4vrFMuV4JpRLvvD
 J6YffKWsAtLcjdzQ4Q71RnkZjZ3x9msOunUxl4XD5BtutdKDQjaEFuyct4pT3kBKxFT/
 cY+/LU65/3vIKzo0dni+VzojdzWXFNq7JFtmqYxe/KyiQfuokgmi2G0QgduNi/kfo1/j
 jsQw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771832133; x=1772436933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/+sGHWdHQsQbTpB0zpyZezxspevMl5GMG9viG6SmtQ=;
 b=R8HH3YcJjYbllG1VolW2IwjHAiu39RfBsApQaOB20MEdKQjU/EQFfvjAor4IVJuxlL
 8D4oy+CZ2A7OXR6jG5+M5vcejGaueRznZ+IyOm3tnuGkMEYVy0ta2dQWp8mZQDfLfKNF
 YEC76cAPoovLBOlglFd8ma2ofKdQfOG/8TWWwrShkfJGFhLHXqDbrOloKjWd65otSf8v
 0Co8fR/IbwdHEeJ4rE5GU+jE2bAb95xezRuG2iN+1Gg+95YSBtm5H9x1t3VYVf9iRILh
 MEyTWg/vziAhu3r9oE0OcnoDphFsKTQP3hy/euiT7nboK3MYd1aYZW7e6XW3gO+CPrPs
 iaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771832133; x=1772436933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u/+sGHWdHQsQbTpB0zpyZezxspevMl5GMG9viG6SmtQ=;
 b=jFnD0N/eAXMiuB71yOV2tsbiCxK2w0wW1A8ujMjswWKlOaK28nQqS91pbLrIisNKHl
 3tEetrJFBiH6DfvirC0fgQZKdjnmIZR2TTh27lrXG5d/d9igQ7DnvLDl+JQehShKgBhi
 UbzQJHsv7+9rl22QfHuNGqFKx38FNSht4jdbuWjMxAI7NISthPmjMSv+nJbWjHNHTo4h
 Z6RF+sX91lDRCyqArzuxHaqvm9jHDoGU3c2ct7A21BwnWwS/S5stlg6Ye5ooeqx/C0Rv
 2/0jpppbkR6+Cn2yXVnpNIsmFpT7qN08XNHIIxNIAE/vViO7klLF3TapBnXBKACH+J9a
 cC6g==
X-Gm-Message-State: AOJu0Yx389eklvXKzu3o/LgyVFVrRl0OPLT9sFvNJXzryMwTIJhEkat6
 NGf1dxjCPehppLfBVwKOdcHPqdu/++7SJ6JavRvUYbDeFXWiWcsMiCXhbYvfW+zI2ZUxJXtaG8V
 yuHow2LNnnpkgaza5LnNKoM7uVIi/S3s=
X-Gm-Gg: AZuq6aIvJW8r3ctMaOUJYgYGHW/JeDXPoAHEaM3Xm1ebfVYB5Z7mpSNyLchluDUtJBP
 yJVVXpbIHVURJPMMJKrKYvKNU1r1CPtd2bXtoXTuyBlnTLSWOxRLx2ka5Vf/KEOznm6XN3wJgKL
 q/Phyl4jsW/5eQ5eSykiF2UW54zXQ6gmzSCVIltZJK7On/mw+dmGR7v04NdqLyGQsbkhofccxaF
 BLyXmk6FKdaSRJUPl99Khh7Z9BzOubFIyByOapNWVQpxKzRT8E/eWS30DOeJhqZpqmrH0VGapBI
 +d/5BQdkzQS52CuNljObAhwVMfN5nHizgluS9X8nHf01vD3pM5YLIV21CZGSwKHKWI0=
X-Received: by 2002:a05:6214:c2e:b0:895:4b79:83a5 with SMTP id
 6a1803df08f44-89979e1bb72mr111189736d6.5.1771832133366; Sun, 22 Feb 2026
 23:35:33 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twkqUu=CJ6+AotavnDga5F=2SGRcjLeZNRy1soFbrO6cA@mail.gmail.com>
 <aZv1XP3vkXQrdFxs@intel.com>
In-Reply-To: <aZv1XP3vkXQrdFxs@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 23 Feb 2026 17:35:22 +1000
X-Gm-Features: AaiRm53ySCpF7FtD4YNtoN1Szw2DGVlqQgxLI3pk4mZtp1TNRit64bIGU890HFg
Message-ID: <CAPM=9twLVo3reNhokXdUH7j7rSWe=JspaF4=Up9ziVMo1kC4uQ@mail.gmail.com>
Subject: Re: power saving, dpcd access and fwupd/userspace expectations
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Hughes <hughsient@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:hughsient@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: EE426172BEE
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 16:36, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Mon, Feb 23, 2026 at 08:54:43AM +1000, Dave Airlie wrote:
> > I've been hitting a problem on the laptop I used as my desktop for the
> > last while, and I finally has the inspiration to track it down this
> > morning at 5am.
> >
> > The problem is when nouveau goes into runtime pm suspend, and fwupd
> > hits the /dev/drm_dp_aux* nothing wakes up nouveau, we get to sending
> > a message to GSP and it times out and I get an oops and things fail.
> >
> > Now the question I have is what do we want to do in this situation, do
> > we really want to restore power to the GPU because fwupd is probing
> > possibly attached docks, or whatever. Like do we want to integrate the
> > drm_dp_aux stuff into the power domains properly so we can have a
> > proper hierarchy so it wakes up the parent device when it gets used,
> > or do we just want to return -EBUSY from the driver when the device is
> > dynamically off.
> >
> > I'll probably submit a patch doing the latter when I get to writing it
> > and test it on my laptop.
>
> FWIW i915 has always woken up the device for any kind of userspace
> access that needs to poke the hardware.
>
> Simply returning -EBUSY or something doesn't sound very safe in
> case the hardware powers down while the DPCD access for some
> firmware update has already started. I suppose at the very least
> you'd need to hold some kind of power reference even if you don't
> wake the hardware. Though if you already have to figure out the
> correct power reference then I'm not sure why you wouldn't just
> wake it up anyway.

Well waking up a power well is very different from waking up a
complete GPU with post equiv and complete VRAM migration and
modesetting.

I'd rather not wake up the discrete GPU on the off-chance there is
something plugged into displayport that needs a firmware update.

But you do point out some other actual problems if a firmware update
is required to happen while the powerwell isn't open.

In that case we should probably hook the dpcd device into runtime
power and have it make sure that the parent is awake, so if someone
opens the dpcd device and keeps it open, we keep the power on?

>
> I've also occasionally wondered what happens to the thing whose
> firmware is being updated if other AUX transfers are happening at
> the same time...

That is a good question also.

Dave.
