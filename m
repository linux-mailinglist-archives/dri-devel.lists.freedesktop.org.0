Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPamM5p0eWkSxQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 03:29:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD29C43C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 03:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF1E10E60D;
	Wed, 28 Jan 2026 02:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CvT2FqkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC7A10E60C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 02:29:42 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-352dda4a34eso3116960a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 18:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769567382; cv=none;
 d=google.com; s=arc-20240605;
 b=CaNdukhlESQOHNPtZsKqeKn3TUqXXUlnmlkYAF8vO425jFXm2lYzrycJH6aSZ9Tmxq
 U8wqJllqQQf2MKJpckqEpDerEt+1npbqzzJFC1cXBTKkH0Dz99GGWsxTE1TtSbFIZPIo
 d2gOCSjudKqKbKzsudtAP8z8E1Xzk9s+3Uyvwscl3urdDuw6s4dV6oGxpS1NH2YPHzmJ
 sg337HjwanZzWOSBxNci1IWXZSvatWooPImvXcj8BYWJMCDFX1DNm/EUYuPq9ZQfs9Xs
 ZSeBeTeMf84XOqacFkHE1FAYe7oOeYKUOlGSdphMn2aqNkL7SEqHqUOPNBZscD0K+96g
 xNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=kqR0EGH0s+NDWAFGm/wPUPQe81g+9pCgJbwXCpHmMJA=;
 fh=+FGcl3Ej3dk4gwdU0x2S4tM2Hu4g+9Z7wk1xzKikERs=;
 b=WD0Htg2vwpIkbgog2mSxQ9YYibIoLvb5c+iHIkA15Cg0G04x9wWY/byMW4LuSNua6h
 W1/TS7YGL3FhUmgUEt/7U7IwHKiMMkkIHmIklIncNR91TpuYuIE9IwSuP3SR1hNHe+wV
 oIifnM6rHq3VvCWt3mwgJdCLwGuTfFXfEL5SZvguf5dSAkyIoljDH3j+zXOX1WXTAsu3
 VvFmgXXwG11mxfaxS1S05tL+kdfIc/8CShEu8XPCKW+AGGqEfIjiMx2bVwuS6L/z99K7
 j2Qa5/gr4djUiDoWdUsQyHhYj6iwlWMV9a9gWq7hAnrd+OiKQ1c4cwYiXZEAPFftqiyh
 cJ+A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769567382; x=1770172182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kqR0EGH0s+NDWAFGm/wPUPQe81g+9pCgJbwXCpHmMJA=;
 b=CvT2FqkFu7I2o9hsCrE2BSQA/mahK9u0lpX0egwC/ct0vDuekQ6GLNvGqUWkeVy9oI
 Zh6QURIizf/qzu1jd0VYGltJbb8AseHp+rdpNMzg3cPC3MKwVRzJlOpedaz6KkcEmDg3
 5opd7ZNt+UZEdXMcua65HOm/NOmNdxjcwPTQrnl+sJzJJezu05xVWawqgF5tjtj6GK18
 v2J4Xk7hlq1ULo9Yno6RZXxNmlDPe+f96aWiSsowxDDU1uGHnVYqflbN7IriomBwDeYB
 y8/wKDP8kj8CZfSKqdGX7eUvVMXiumem5rPLZIh3ebSXmJGAVOv6c8j7qMgFbccpT/f9
 lVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769567382; x=1770172182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqR0EGH0s+NDWAFGm/wPUPQe81g+9pCgJbwXCpHmMJA=;
 b=oVln9q004ZA6IGhjITlH1X3yKo2qf8V1O0qGY/MjUN3wuz6iAsrm7atfDWsdY+pPz5
 4IOYYiyypHUFfVU2DkgoTl78UHoNAJ99/MXbTTgI5MnojmEBIlCRo7qTFMy4RrF3SJQc
 B/8ajaDH+aeLyqtAGu4YuFhqphmRYf+lnD9I3sGAyDK205qWU24NjRnIIZtw6KduoEpy
 DDGFGpgmwDaSIW9pSOokOM5uAgk5OP4L0GZp90DWFfXnL1A2x5TrOQ3SqZHwJE2Lxbnp
 n66KHp1kKhtOdcrNrKf6EE5P3HIRO4hWZV+Kdi+2UpgSy/nBJWPrRv0JxfAuEbMCkCxi
 ky2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6eP1iZerQ1YcASHpU5YPl5XLLdp4zwqE4cqO6uxFuT4jufBjQlDu01dENV3sX8fZB4LCdLJCwT2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZlPI37jJ2WaeulgOelF5kIavgqnErEPlZJn8yv27N2HcBK5O+
 kEx0Qed8kcGXqXHNjxyUGQV82tRBt33184Mljobl52lh6gxUReGz9D+30v6ohDyAZOEJxNOWMG+
 v3/BQQlgCuWLyaVsghhcYR0sHbFhjzzE=
X-Gm-Gg: AZuq6aJ1T55hPffyiWt9VGbIdDId7FvUx4Wqv4vluCvHiNLetPH45ODlxR+arXnFHjk
 b5YaN+mNZpHVr2R/QHpX5uEgUHzogx6v2NI4iqLZY208hmg3Xf4A2IRhTP95NRrrOkb6T7KHHbA
 AunImrP5OWyMkPKe1XnXOh4TYybCNyPu1I0CkcdT9NLH1gm3HWpLycFbz2GCGM5o2ufbzY89IjO
 c3MEOfd6dgFTPI0OZxtau904S29vvOTbae6VBHYWp7JnDwaxChWRfM5G30zN9AhNu9k1Q==
X-Received: by 2002:a17:90b:268a:b0:349:7f0a:381b with SMTP id
 98e67ed59e1d1-353feccfdb6mr3408881a91.8.1769567381930; Tue, 27 Jan 2026
 18:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn>
 <2026012631-suffice-enforcer-8553@gregkh>
 <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
 <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com>
 <2026012758-sacred-slouchy-45ca@gregkh>
In-Reply-To: <2026012758-sacred-slouchy-45ca@gregkh>
From: Xingjing Deng <micro6947@gmail.com>
Date: Wed, 28 Jan 2026 10:29:31 +0800
X-Gm-Features: AZwV_QhYBrCrfZR_nULpn7Nxu--kk-dx2_AX7m36P0tiMnJ_cLqdnNHjxHvj35c
Message-ID: <CAK+ZN9pBSY1bCbMQMoOj0qNQKvEwO_j=zxLnDcA_4O9AyL+uHA@mail.gmail.com>
Subject: Re: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, srini@kernel.org,
 amahesh@qti.qualcomm.com, 
 arnd@arndb.de, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 24DD29C43C
X-Rspamd-Action: no action

I understand the current situation. I need to record which static
analysis tool I used to identify this issue and clarify that no actual
testing was performed. However, I have a question: my static analysis
tool is not open-source, so how should I document this?

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8827=E6=
=97=A5=E5=91=A8=E4=BA=8C 15:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jan 27, 2026 at 10:18:38AM +0800, Xingjing Deng wrote:
> > I identified this issue through static program analysis. All other
> > callers of this function validate its return value, so I believe a
> > validation check should also be added here.
>
> Please don't top-post :(
>
> Anyway, you MUST properly document the tools used to find issues like
> this in your changelog text, as our rules require.  Please do so.
>
> thanks,
>
> greg k-h
