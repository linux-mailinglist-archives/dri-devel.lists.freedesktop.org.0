Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJZBCLPshGkj6gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 20:17:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF5F6C3E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 20:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8620F10E0BF;
	Thu,  5 Feb 2026 19:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FA86oDfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A352310E0A3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 19:17:01 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-894674a4c4aso21544946d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 11:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770319020; cv=none;
 d=google.com; s=arc-20240605;
 b=WKDcpvu5o96QC77x9VmTpAaOlzlsxbVM4n5WQev8dpm5sQi4vjDKELMQ7TUEd0xRGJ
 7g3IXEOT8gdsy0T7ABxvEQkaYrSOvNHdAFi6TnmRGuATY32X18sPxGfrAfYSbKhrQVm+
 Oghl7OZQf1PwU1o8Dbn962GcoV4doXyVKAD+pWcn5EZItgMjJN3M4P+Dm5TCtnaEeuZ9
 HsV+EfvLv0Ou8OcEw0GmZekRmYC97+zmKW8+erfragJ+n817hIfUDiNmj7rLp2VWhh6P
 HEePRpZlHpYVtWmM6najqbrYKWuRWZdLSzWqYpuxv/qorEQEx8RaLNfcAlpgwAtWV4M+
 dKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=P2cu2LaqjKk/iHOyXMDpBb/9EjbCB9O39mcEVZVjW00=;
 fh=WwhSUuckEfcbUsdksH3yVLKbqwJyG+mtyyyG0W7N/T8=;
 b=jAMYVFbTHfW6rrVJGKs6aQGND3dniYl68Oxkie1JAkmUDWnpCU1FWphX7rgjzwUnyH
 d0k0ydlJXWK62PMNnPNx/bRuX6ZbL51dpqPZKflmsQXtVTYscFhpjD6p6q4lJT1KlwV9
 wGNErG2r+0RiEVL3VOBVVy94KxYBc3m0oK1YsF/TxQbGx33PGjzE6WOSdw7TtR+/ALvg
 ZufNQf7ER8g58A08RzZYXei1M1MV0+kOym8OBixkAvDfgDkU15VJiPjioFPptNdMgTAZ
 72Q/PS0wumkH6UNgpaI7CJHz4WMjqnadM4ANaLyZzVw//2iSyO4JSStt5LasqKy5C4p9
 wQGg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770319020; x=1770923820; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P2cu2LaqjKk/iHOyXMDpBb/9EjbCB9O39mcEVZVjW00=;
 b=FA86oDfTsNXoYD42Sz/j3eS2AjT+qYvcNMPeOggf8V1e9d3kr5QRHKdkcbVVfVJToO
 kvUBfg8t6QHkRo1pKKyCd3ubEhYAZQ1MkWu/mQ0eGOkNMCMZwo5RsPw7I1ArDVpWHlcE
 lwM4fYeG1n1k53LuMWjSWgoVVtEqsaP9WNCByod+Vj54Bkzpq/LO7wEXH8/6rknthu+z
 jfNB1AOS98ma24xjnz0xU6nF/aTbEgXWkYd2gAiRBayYpynVHQOjZhk3zGzDyFYUkLk4
 8QsfBe1nvMiZPXRfhliQFXzt2qA5uQnaWFfirUiQvQT21Gzry+nLUcNJoTpOH7aPAo+W
 Ar+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770319020; x=1770923820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2cu2LaqjKk/iHOyXMDpBb/9EjbCB9O39mcEVZVjW00=;
 b=wZ6nqOpPZEhDI7HQxo/TS1H1t2gP78w8/2sARFeBhgKl6SbnE2aHe3RxTaiwlexnvJ
 WeddaWfeEr029cEkAQHbJUJXCbcfngr97zBJg5ANC5bBGTIfDDNaDn2vtsTajQxAl7Y0
 AB5SOFDSGf/vw4Ij+0tpg+q0ea84oEBVk3vZCw1miPhgHBJCD6UBPgeMleEaVo2hxiaU
 iB/DlyqWrTJASWNlySc4iYQeRqelGzpI6SSRDBezKtJ3fyzdFnli6C5h5d69yz6WBgqf
 1DdTgg7xkmvDO1Y4SUrA8MI8Jabpzd78EaEyLqCT9cFAp4EJuOZ2vDfkAYf7DSlYwM/y
 65Mg==
X-Gm-Message-State: AOJu0Yz5UwbFEnjjIG2fwZE3Rk2ihKccjZoKiWhW0vuQpkG3ItKjw7Fl
 BaieGmVnDvwdpU6j8TcwSm3enZ/YvspxPYnf608dx3PcQFmxmxw1scgqL+sgMZQYmx8T8ur7591
 EUyfGt6OhHcdqfzsTueQcXKetQErPcv8=
X-Gm-Gg: AZuq6aLbZG1l5T+pRpVfKbmN5Z7vUL7SOkGK9SFPtMqlsNdklo5V4NVeLJYe8FN/pvP
 TD5wTmvKcvFhnc045zgk6SAO1bfNpJDHW5daLa32lnRFrld0QI+Kq63Sz7HE4e/bpncFBYdiGcH
 DC5VN++65cQv3ZwLxz1xJ7EmRGI3z0YOvi4WeCMcWkmZLDj0ya9EaGjD9QJ62g6dHLpEnGN3KGB
 VohXEbuekoSLfM9EWbkV/HBntgD9s8VCaEnWPqPXgqCJMD3thISw90LBm3lbuOL1wRzNu8=
X-Received: by 2002:a05:6214:4017:b0:894:79f2:db00 with SMTP id
 6a1803df08f44-8953c83ae3cmr2562026d6.30.1770319020581; Thu, 05 Feb 2026
 11:17:00 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
In-Reply-To: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
From: Gregory Carter <gjcarter2@gmail.com>
Date: Thu, 5 Feb 2026 12:16:49 -0700
X-Gm-Features: AZwV_QhJnU3PMpjjPKF2DHVOJ2PGlym_H7moo0vpTpCU6LfzBsYljzmq3sxcOc4
Message-ID: <CAE4jU7jfKWtvvgRiY2fTM466en3JgRNg58DW4D1aWwCtXGm-WQ@mail.gmail.com>
Subject: Re: Accelerator/GPU top
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 David Francis <David.Francis@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="0000000000005c67ec064a188483"
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
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjcarter2@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:David.Francis@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,amd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjcarter2@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: A5DF5F6C3E
X-Rspamd-Action: no action

--0000000000005c67ec064a188483
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There are all kinds of accelerators out there for various sorts of things.
It would be a shame if you chose an approach just for GPU's.

On Thu, Feb 5, 2026 at 11:58=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:

> Has anyone given any thought on how to support something like top for
> accelerators or GPUs?  We have fdinfo, but using fdinfo requires extra
> privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
> way to even discover what processes are using the GPU.  There is the
> clients list in debugfs, but that is also admin only.  Tools like ps
> and top use /proc/<pid>/stat and statm.  Do you think there would be
> an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
> This would duplicate much of what is in fdinfo, but would be available
> to regular users.
>
> Thanks,
>
> Alex
>

--0000000000005c67ec064a188483
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There are all kinds of accelerators=C2=A0out there fo=
r various sorts of things.=C2=A0 It would be a shame if you chose an approa=
ch just for GPU&#39;s.</div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 5, 2026 at 11=
:58=E2=80=AFAM Alex Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.com">al=
exdeucher@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Has anyone given any thought on how to support something=
 like top for<br>
accelerators or GPUs?=C2=A0 We have fdinfo, but using fdinfo requires extra=
<br>
privileges (CAP_SYS_PTRACE) and there is not a particularly efficient<br>
way to even discover what processes are using the GPU.=C2=A0 There is the<b=
r>
clients list in debugfs, but that is also admin only.=C2=A0 Tools like ps<b=
r>
and top use /proc/&lt;pid&gt;/stat and statm.=C2=A0 Do you think there woul=
d be<br>
an appetite for something like /proc/&lt;pid&gt;/drm/stat, statm, etc.?<br>
This would duplicate much of what is in fdinfo, but would be available<br>
to regular users.<br>
<br>
Thanks,<br>
<br>
Alex<br>
</blockquote></div>

--0000000000005c67ec064a188483--
