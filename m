Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB2DBsj2p2mtmwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:09:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774921FD440
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DA110E107;
	Wed,  4 Mar 2026 09:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NFYWt+nX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD18410E107
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:09:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so77038075e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772615362; x=1773220162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZ/Jm3ZTuzxCI3S6sfQeg+h/tN3BN6x7OrgQZSzJtuw=;
 b=NFYWt+nXRQLXkE5hQrzsHacbwBITMw2GIqdtx7B+Jh84nVLID0DM5a1Q+iy+9PjkJQ
 Qg/hGwRo3bk+lTHhD2X0S98HYtOMrQQaJtNlMScWDYJ4+JzsnQw+e23+Ha+sQe8dNzex
 yIpv965jfr4HMSLCoUGmGJIfzzJtnEyfVD06rFtKDZxe9VfpdlDeknJPstASXJTuqEWy
 5pqQMOwzGDXdUoHKSapU39e03LboRmVBjtRmuN5kdIUlVGsnrwPwGkg2l/MRGP79r5+2
 OxvEjRlF6neFUVJxRtNIseP0IeDO2ytNAUhjKjTswuDeeobQooc1K3cthL3fsuwJcCA2
 sYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772615362; x=1773220162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CZ/Jm3ZTuzxCI3S6sfQeg+h/tN3BN6x7OrgQZSzJtuw=;
 b=gwywklngRZbzVhTQ02hlNZAcFeewHb/EAYF8TON72KnwxkCQqL9b4p0+obZPf+YQoW
 NXL8zLjTZKSliVBl+y1klzaZFpn/tUfa9tUIuer8/2VS9z66gN7yhjfT2GnPoQAQZw6b
 eQfzwm9eYd0Ur6SmfmfgwdirmrBS0sXkKgYTSgOM/PbukyfH7TxLUbPWQHLFoQfOk9fh
 4n08umnC1Cj683xI1yIBWNmv+slEXVRv1gvuHqaRN2i55Qnttvv3XaFI0AOcP5jDWo+Q
 AiJeio88KjaFt3Nr06VlWMjnc09spy3q4PJ3tAjENKuzfeFiCSo1AJr3+Q5/fsprs85V
 vwQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0kdbweMdnAQHQMS7/AfynAhvCWCGqRgmHFwOKkuUTjWxUN6VcB5H28abUMxNYk9GCnOlagJYNyCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2kw6vYFwhytEMipokE3aRiRmj5v59guJNh6NR7LK2ckqytzV0
 gLh9xBhAjVTkR8UwDONrfebkC3oafL9Qoi6v3fYem6AmksWwEusMzjtF
X-Gm-Gg: ATEYQzyEFDxn4Hu1Byq8Bx8ZUq3gfSULhxlx/3kNtLssNRg/17MrNkaFTmeDJcuyids
 kgPPdIyioy4VQrxsv5Tj26S4ONuWzEqQpmCkfnfvkNdr6F93Sp1JDQAU3LW13MvdKLAeq9tNowL
 Pel35S/YzPisX4XON2JPBd8EgVcOCHB7+8Vj8aR6R7wrBuqU3AuRn19tDruvwd2XGUxe5ixRdHE
 QS70jiPyGqvYEKDG+rZ+ZltAqIja98DtBaWvdxE5YBrB9pgWkGKff3Yo3Hkj93vmzw1g2gqE13m
 ypddtBgqjaPJLqz2heAgnRILRGj5ZrnU2h0PycwhATL0WN6wz1QBN6f6AXUEwKIsnaWqSYeWiIz
 gos/2ojnut/W+ZyO59dpDc8Nhf7VS9tS/RvvpjFxwEEe/VRetHJuXhxhoOK9mfecaxXoQUpmWra
 6OFHaRqiuC/TlEWpvKruyBQKtpoIlx3xLYI2aRynTVwJqT5C/KjwbQlpn18gVBdyWAVGlLdA==
X-Received: by 2002:a05:600c:4e0b:b0:483:71f9:37f3 with SMTP id
 5b1f17b1804b1-485198311c7mr20105555e9.1.1772615361768; 
 Wed, 04 Mar 2026 01:09:21 -0800 (PST)
Received: from timur-hyperion.localnet (540018D2.dsl.pool.telekom.hu.
 [84.0.24.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c60f764sm42846932f8f.3.2026.03.04.01.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:09:21 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Rosen Penev <rosenp@gmail.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Hung <alex.hung@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
Date: Wed, 04 Mar 2026 10:09:19 +0100
Message-ID: <2596902.XAFRqVoOGU@timur-hyperion>
In-Reply-To: <7d3a4090-06bf-40b0-8c80-ca08625608d7@amd.com>
References: <20260228045356.3561-1-rosenp@gmail.com>
 <CAKxU2N_FbB_d6ntXEOFzE2u-sfu9sRRFwaDnb3P=RfTwE5yuDA@mail.gmail.com>
 <7d3a4090-06bf-40b0-8c80-ca08625608d7@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 774921FD440
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:alexander.deucher@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:alex.hung@amd.com,m:gregkh@linuxfoundation.org,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wednesday, March 4, 2026 9:10:02=E2=80=AFAM Central European Standard Ti=
me=20
Christian K=C3=B6nig wrote:
> -stable +Greg
>=20
> On 3/4/26 05:03, Rosen Penev wrote:
> > On Fri, Feb 27, 2026 at 8:54=E2=80=AFPM Rosen Penev <rosenp@gmail.com> =
wrote:
> >> Because of incomplete backports to stable kernels, DC ended up breaking
> >> on older GCN 1 GPUs. This patchset adds the missing upstream commits to
> >> at least fix the panic/black screen on boot.
> >>=20
> >> They are applicable to 6.12, 6.6, and 6.1 as those are the currently
> >> supported kernels that 7009e3af0474aca5f64262b3c72fb6e23b232f9b got
> >> backported to.
> >>=20
> >> 6.1 needs two extra backports for these two commits to be cherry-picked
> >> cleanly. Those are
> >>=20
> >> 96ce96f8773da4814622fd97e5226915a2c30706
> >> d09ef243035b75a6d403ebfeb7e87fa20d7e25c6
> >>=20
> >> v2: Add Signed-off-by.
> >=20
> > Do I need to resend?
>=20
> Well first of all please stop sending those patches at all.
>=20
> When you want something backported then add the CC: stable tag to the
> original patch.
>=20
> If you find that some patch is already upstream which isn't correctly tag=
ged
> then ping the relevant maintainers if that patch can be backported.
>=20
> But don't send stuff to the stable list all by yourself.
>=20
> Regards,
> Christian.

Hi Everyone,

The patches actually come from a branch of mine:
https://gitlab.freedesktop.org/Venemo/linux/-/commits/v6.12.74_si_dc_fixes

=46or context:

The crash comes from a patch that I wrote for 6.18 that fixes some issues o=
n=20
the default, non-DC code path, that was backported to stable kernels. DC wa=
s=20
not the default code path before Linux 6.19, so I didn't mark the patches t=
hat=20
also fix DC for backporting, because I had assumed nobody uses the DC code =
path=20
on these kernel versions.

After a user reported to me that this causes issues for him with DC on 6.17=
=20
and older kernels, I sent a backported series to Greg and Sasha, in an emai=
l=20
thread with the subject line "Fixing an amdgpu crash caused by a backported=
=20
patch". The fixes were backported to 6.17 then.

I assumed that the stable maintainers would backport the fixes to all older=
=20
kernels that were also affected, but Rosen brought it to my attention that =
it=20
didn't happen. So I made the backports in the above branch. Rosen then deci=
ded=20
to send them to the mailing list.

Hope that helps clear up the situation.

Thanks & best regards,
Timur



