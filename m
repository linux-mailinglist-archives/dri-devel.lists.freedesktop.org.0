Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGvtFbt1eWkSxQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 03:34:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4959C4E9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 03:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E926110E60C;
	Wed, 28 Jan 2026 02:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bptr7qIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A899410E60C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 02:34:30 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-352c414bbbeso290188a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 18:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769567670; cv=none;
 d=google.com; s=arc-20240605;
 b=iK0A+A8YfJquze6KaTP2u79z0b0EJctfF/rlJuq1wcnNP9ktAP3x47eUeeuIpND5Mi
 m8LsobN+/lGIMWj6cbMVYu8t9LHz/2qrRs/RxabNfKScuYliKzetXOdNoaS120MYE1M+
 IUOAA5fEzSwz5Vd3weMeyC31VGCed0GmE7Ee5EQBHpdnDZafrdevLn58PklDcCdzQnav
 bA21RjBoZlNSrRAGoQvoHNdwLn3HbFj1fHT7m0nvRa3vefRzymM2ejnYFE9jWNun5xhA
 xKYdWLIYId5kO03EgST9/eA/d0FVjNVcCFDAgKb4X6/lQWFYamNkEdi5Uh4TbSQ9WaP4
 QJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=dGLoE/NeejzA6sB9YstMck4e/gYW8IxT2c4DWJ+XiVc=;
 fh=X0Ki5x8Yo4mErnTKWN8u4OE1mubqjH8c4uLZXg1sQmo=;
 b=lkBrWpGGbzGkg8qC6y3IrpuNwRH4wvAl4I4frW2dANUmIQ95jhYVX3BmcSBzBIZLl1
 3oy97917yj0RU55P/VSRJIXAwh/RPfyXNd+4Gi5AVnlS4tBCvHu6eqstRKtbUPKWAm7D
 wN5kDvzzD5QUHURtMpvcrnlEx6keCB2bpN5CqteLEdD0WZlHjXpDNq20exwwF3Nkl0aA
 o/uD5FyNmdW1QpRQjgVDZiUmQXYN5jsr4UxQrMCAd1sxZL9QWw4Tn8SRqF2AVw+3Nne6
 +gRrdYbEusMhxxOrK3DohB4A0h13kYub1xchyLZ5mrFk4omHwJTu6GiPO1KfbFG66roU
 iQbQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769567670; x=1770172470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dGLoE/NeejzA6sB9YstMck4e/gYW8IxT2c4DWJ+XiVc=;
 b=bptr7qILL1lJFgumsqp3brcVndKXDrFPhpz/FtYB3972NkYHxsTKHvjPzImZV/IeLN
 K0NkTn2akz+h7cREdCLTfOhyMtGBadMHr4wrnE+DlxMt8FoLWHIVyiOI9qmXLUiqMCgm
 TC+3yGDCLy/zJQQWpvOv8if55IFFUX32qLYEf9wqU7ZpAsCeaXp+DfF3hPl8ry9jrdl9
 2hBAJIhG8hsGD1Hz85LMdUXqrBYm7hvuWbLrGuOUwb4n5VSdJfipu7UzTIIs5x0hzY7E
 vQp+Dxzk43rx+fJpa2Idi+yD6pIs0JGeQNMGgqdbLDUVCBCZrWOHdlLEeiFYERywXAqu
 CPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769567670; x=1770172470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGLoE/NeejzA6sB9YstMck4e/gYW8IxT2c4DWJ+XiVc=;
 b=cEsuGw9K9WReATnorVfhk7q2VtdL+a6CWvWkYt+2j1pcwMQpR7euzaaZauJcI7tM3G
 q8vjsbXpaxo7SAQnrktxP5FRR3Zw632+siVOoVuh1Vvd4K6ZrSk3ZQ3Cd+XJbPwwFmYG
 w+v3KRbtNYPCD5ESngBB0Uo8Xxc2XW7VR+r+eCU5iK94YCpc/9x4gQaglf8rsVmsHtsG
 FB/vSknKGhcGuPxyDS0Qs+6f+gl3NRvTsKXx86QtXFiUo9hR/YLHQcAygSXJhtgbQMVv
 f3R98QU87SdU4b78mmYWp/3jjC1NH2SIeWzgB1WxwrB0wiOls4u1qAVw0pLv/uYTts5t
 EEMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0tISs8gd5iYxEJz6t20/aNWmSPmKujCuLBBUqoY1depKUay9ETHTezQpJlIIZp/XKylXedAZJgWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIMCi0b7W8Hckzys6BSAmmV5KyVryNME3/8Cx/dniIysRZWnXa
 jsEt0DJd6Jyfd54aXkasmGJLAkgEAqlqqHyxt0fLiX6p/3sweMG2Q+JZjNPZN/maM7YzAgW2043
 Tk2xK314Msjz3Rm4kkKCxKhEBaeAyOtA=
X-Gm-Gg: AZuq6aLHmskecMiWViN+og+mYIRz+8J0ajnLK6PioTEgI1BFB3aUya8YyEpZrNvrS3J
 mXFnsqaDOlEoDd0B+uiAtx2gpfZ3/Dal2QRepZIL1VSvn24jH+mZfqDQc1IbgVTnXCVXcU2EJ/7
 XZo4+11AWKu05fzjbTkwIw1zwGD3a6M8RMddwlm8LNYgpwhAPQX5EIBv2evPxuCzNpDmPvWe4Sa
 MQkWyHTgnnYkc6q5ZaMQACm2Bmh9OATaXnn4PIJNts9/CpevSchq5da8rh1zVudNnPp8w==
X-Received: by 2002:a17:90b:3a46:b0:34c:ab9b:76c4 with SMTP id
 98e67ed59e1d1-353ff78df17mr3373892a91.0.1769567669973; Tue, 27 Jan 2026
 18:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn>
 <2026012631-suffice-enforcer-8553@gregkh>
 <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
 <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com>
 <2026012758-sacred-slouchy-45ca@gregkh>
 <CAK+ZN9pBSY1bCbMQMoOj0qNQKvEwO_j=zxLnDcA_4O9AyL+uHA@mail.gmail.com>
In-Reply-To: <CAK+ZN9pBSY1bCbMQMoOj0qNQKvEwO_j=zxLnDcA_4O9AyL+uHA@mail.gmail.com>
From: Xingjing Deng <micro6947@gmail.com>
Date: Wed, 28 Jan 2026 10:34:20 +0800
X-Gm-Features: AZwV_QgKuKRcpsXe8dfYdrfpgo1e1IaTnMhWFeHo_x-lnpYaAwu_rh3UTSxMlEE
Message-ID: <CAK+ZN9qAbX0+VeA-6DMJcSY6wehSvOdM9NGu53wRYoM0j5i8sQ@mail.gmail.com>
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
X-Rspamd-Queue-Id: 9E4959C4E9
X-Rspamd-Action: no action

I got it, I'll note that this is a private static analysis tool, and
I'll release the next version of the patch

Xingjing Deng <micro6947@gmail.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=B8=89 10:29=E5=86=99=E9=81=93=EF=BC=9A
>
> I understand the current situation. I need to record which static
> analysis tool I used to identify this issue and clarify that no actual
> testing was performed. However, I have a question: my static analysis
> tool is not open-source, so how should I document this?
>
> Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=8C 15:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Jan 27, 2026 at 10:18:38AM +0800, Xingjing Deng wrote:
> > > I identified this issue through static program analysis. All other
> > > callers of this function validate its return value, so I believe a
> > > validation check should also be added here.
> >
> > Please don't top-post :(
> >
> > Anyway, you MUST properly document the tools used to find issues like
> > this in your changelog text, as our rules require.  Please do so.
> >
> > thanks,
> >
> > greg k-h
