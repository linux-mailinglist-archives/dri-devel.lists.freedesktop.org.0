Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GkJBS9ImWklSgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:52:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5022316C37F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398410E05C;
	Sat, 21 Feb 2026 05:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NWozmT46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAD110E122
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 05:52:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so512054466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 21:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771653161; cv=none;
 d=google.com; s=arc-20240605;
 b=QfWud1ZXqbntneC5dhFM3FWx85wmCTuxqFc3PDKagQgKr+bhJL3uiIFkHH+x5flcfQ
 zi883eBjcK/WdiSpY93jdkdTnCFJHuKr5VUf+Hgw8yGPBK47AmrDxX6LHBslklH5TUOp
 yxrvAMSfwzAqlBWm7dwdAuyeQFAXRX96gUcPv8pisS302YQ7i2Civ/nudK+hHhk9Xjbg
 WIolLEoM3A39NTjCgiZlJRO2rf6q2qs98U4SMfkyufL+oTR2v1KSRL4eFhrI36YdHfF7
 dfbGe31skfEa7xla9XxTqeq3bwbpMRGc4HbHJ+LLpt1FSsELgViktn4XALc5jlvDFNs/
 KYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OOzh+KrsYoddiPyG6kL8Mz1PkVqo/f20UpIdm5py4zM=;
 fh=U+KrbTXouAqpirQQsw7Zqh+PUtbE3qsfrQXQeevBxvQ=;
 b=SX4C/Vbs4ln3AofS1uRwZRDOhMq2SkOkgR8XEvzHFVzsRLaRRvKaOMlfJkww3n2u4v
 liTJSWOh+3s8oufMIa9SYUSQ++cOApv430Umbj3TSVYZQacA8VQyyne5AalgGDXDu7Hw
 EQmZNaXBis/cJ4k6WsmmxKwjfDNy4q/Ly9Btt4yrTF+ZsZAHKtA2ysuWL7H89if4Z3wP
 o6H0kVqoUBknp2L0rAjggfzpSapsDtg7o41BNc/3cChV194Ka/uJqJfwTvg6uvpXfJWK
 YiUR2wzgISplUd6550ug7mm0wRPnhLMYXXctyK2YAF1dHH0YnEncM3hTca+s4TGSmMYm
 vW+w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771653161; x=1772257961; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOzh+KrsYoddiPyG6kL8Mz1PkVqo/f20UpIdm5py4zM=;
 b=NWozmT46MdIr1VGEtin8v8LERadDOBM9gJz9/yATPN4gUB3RAwxuwdz0EdyOpFLKax
 SxOWR0KHA9KAevVTj7cTIlpd5DQ7ESt3vpfMEPTServ/RxFky0He1FQyJcXGPkC2K8rH
 Dgelo7ncyWSgn6atFXPFfYiu+mIwgzNiNpZcKLSm+hw0eyeSjpxJuNsixSXKnHTsfqkP
 OdqqB7MDcZ7Y3b2L+0UovKBBesVNF/gwScFFPG53TR6TWaZ4lAcXAGmEDe+jyLpNbRr/
 knp7BzLY8bWqzjPgjaMo2Zc1zc7QBDlnVbtqrNxc98bMnpDFobyqy+K144EmT5biOTFk
 zDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771653161; x=1772257961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OOzh+KrsYoddiPyG6kL8Mz1PkVqo/f20UpIdm5py4zM=;
 b=kLjO7vHffwlGpEFoQNDHp45/BORh95gwunMQuOv1edqMDAMyEB3QeTX6pxEPqnPT1U
 fZyEfXqgqIklxdIf5CpQoP1DHz7Z9rS0VEOSrTS6VDZUmHTc6KsI1nWXIEVg8Xo8f2nX
 olPixujaxTGzU6d20UVzKVmzQ04V8WVe3bH+rH2rgKgnBbdnWjEEmemtXHeee7L66IdW
 jk66f9aFWBbElOrk/lsIZW/hNL64jYPj4GRC5amjwwOYbyuu5JRMJkn6noVvWB5u210U
 uUECHWdl+t9HDBFr7ip3r5QGfHB96vWjGrH8QzUneUiOev+l1KmaKzigcvyTK5dN7Zyq
 BgoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdV8DzpqLYFx7BWXaMvu+Wn2Oy1GdVVGbt7EbMKeF4FyofbOG1SGweSyIhj7FIXomOcx700a4v4LA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3V8XWk85BMXlsBSQuu0fSYSJxPv3Zk69XdBOvyNQ6qVgUaV4x
 nDOp1A0AIA5/Ne0fDtW4LOYURMmplmSzM6t1yXDkhPVLeuFLoPZ9+UlAwW7EYaiIpGrEzn0qUMD
 neLTPtmtqQ6B9dmogLEZuoQ+a+YZP6w8=
X-Gm-Gg: AZuq6aL47TRBFpvXeshCmsYFAnmERR4gaPcZmmn5ixqsr+HJpS25BYWrKCVSc2dNYTp
 gKJ4zxl9gsI737ddBurq2i59TCo7ECptTyIF9zXLjaQRUTsQfmZ7p7ISEa7+zgOqNUDiOG5ONMg
 kVD97qxFneeIEAVjS5rxAgvEQMCnERtwGBwfn9ohCoxcfKYp65Xzjhi2wkkqt5sLbuGAhqTbVmq
 s7b5laQd0DoA02OB+Exxw74wlkobX+n3NJGCaC83LdGkCupjn6C4w38OG3oCk96tI06vY4lkD93
 XBel+JCyASRfa4NfSpFrYe3Apvie5vFyNvd4ZAyvQPvsm9Wl2kg41DsWcfjpYH8xdulv73sQQWV
 N/Kqa2w==
X-Received: by 2002:a17:907:a43:b0:b90:a99:6ab5 with SMTP id
 a640c23a62f3a-b90819947dcmr118481066b.7.1771653160995; Fri, 20 Feb 2026
 21:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20260221034402.69537-1-rosenp@gmail.com>
 <20260221034402.69537-3-rosenp@gmail.com>
 <2026022148-unsorted-pushover-8262@gregkh>
In-Reply-To: <2026022148-unsorted-pushover-8262@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Feb 2026 21:52:29 -0800
X-Gm-Features: AaiRm51kvzm1-uW1evSUVzI8gGGopob0vMQaVVrKbOjRlGOELAe0rmEnSeUjXGI
Message-ID: <CAKxU2N9dJg9dy05h6oGgWidc81-kdGw=jUuM-i4KL1=EhevrZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm/amd/pm: Disable SCLK switching on Oland
 with high pixel clocks (v3)"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "open list:AMD POWERPLAY AND SWSMU" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5022316C37F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 9:41=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Feb 20, 2026 at 07:44:02PM -0800, Rosen Penev wrote:
> > This reverts commit 0bb91bed82d414447f2e56030d918def6383c026.
> >
> > This commit breaks stable kernels older than 6.18 that are booted with
> > radeon.si_support=3D0 amdgpu.si_support=3D1 amdgpu.dc=3D1
> >
> > In 6.17, threre are further commits that are needed to get the DC
> > codepath in amdgpu for Southern Islands GPUs working but they seem to b=
e
> > too much of a hastle to backport cleanly. The simplest solution is to
> > revert this problematic commit
>
> Ok, this is better, but still, this only applies to 6.12.y, right?
The reverted commit (or rather the one from master) was backported to
at least 6.12 and 6.6. I didn't check what other kernels include it.
>
> thanks,
>
> greg k-h
