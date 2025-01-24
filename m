Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F03A1C8AD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B719910E377;
	Sun, 26 Jan 2025 14:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dn+YJje1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B418210E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:50:40 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-219f8263ae0so48224535ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737751840; x=1738356640; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pdzsCT8xL6jHZ+tnR3Hwgg863MADe4016kWtdjp4rcw=;
 b=dn+YJje1RUd8xZ616s01j3bxl42lnDW/tTWjIQ8SdhEiIF7dbbdqGlFS9Qvq3popGs
 7nK9G9T2e9UTen4k5fGipPsKgmmjqzpAPmTr6qEiefQ0h5OyurtE1jnnCziECJroyz9Y
 hAIwOC5NMTZPWV61JyUCXaTkFiZ1LbtgrdgeyftB+E/m1uqR/nhJ4eSV9m0xsBz2xJMD
 787eQ3Eq1ajEqArOQzWXdHFJeSJRIm9fpTdQgZyTznD1mv5/dEZtgKA6Yp32xVl7ZHXK
 IdQx9EAKynFS4e4bYmWh/dOVPxbiUrrjQk3P2tH9/ZthFXNKLd7KZybZ9loi6e5qTtor
 KWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737751840; x=1738356640;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pdzsCT8xL6jHZ+tnR3Hwgg863MADe4016kWtdjp4rcw=;
 b=mwIqpKHVTOApNojc8HMWrTz+dxZqnLN5urVdyildtsYdUjyeiZpHtUczH4IE1SY/1f
 1VM1K4fiin9jOXGbVKWD0M+RS1eL4s9nEzzb78gPQu4okoD2SFU9bYzGk1pSLuBeBhVB
 Y3M7lNW+lKsRZ0ppA9g67kR9aaebTLCCMhGwni8w31m0iYc4qF6M9NTI8VvW1BvD5cfX
 NsKjQ7C6FQfu7KHn/Tr8pedq7ARG4jYPs7Yl5YlWllZEXxhZGXLyOtcAtArO27zOWBMS
 0+6ccnzngalA3qX7D5BkzUf7ATklcKUNcTzulcrc97lpFg3zCFrQWt8G3Lxycq+ZBpuX
 ikzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlEX2vqfoeBPB3rNITnRpZDIHWrdRpfgKKE2J/JvEqdZN/zhf0BDbFwOvBek3jbRFRIJJTUMKHBQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnVsbkuEu20TNjcucT0RDAlzO188rKlqjYTaqH3w20BtePtL+Y
 WsqnviIFhykTtw8+ME+DjUPQs/Q5h+Oj2ZDUWt0/wQQUm/jH6kXH
X-Gm-Gg: ASbGnctVpZWfzTNVQIiVBJXM/qKP9vlLB1xomX0KkqX0o62ML/C09gF53tJI4hENLt4
 TtIPLKGJfnKh99S4Agc0XQeTpuaVmid4eb+G1yKwGrQb8KWMt2DVyuj2MKLxOswO2xJoJxn6Lyp
 zTR6VqxN9VZ+sO9fKQGknIqQgPRKXWKXhrDy5+o8kkCR3bYjS1l6J7mNWYpDvIu25nEaVT42Zkg
 ST7Lz2+MVduzuUGmwFiJmACxRyYH9dQqa6ocavAT91wH0s1ERNB1TsfxY7Fm/X3FPQtXJNVtwbW
 01wXrFPGsGntGmSmeodHf3h6SO9VWgVVeLS+W1fDZSginoP+rV8=
X-Google-Smtp-Source: AGHT+IGwvSer+unLlVc6WTlhBYxGObsMsLAI7zUMsLtcBkSVhBWiPYvxWe7dxKBqk+OHgzBCgn4BNg==
X-Received: by 2002:a17:903:2449:b0:211:7156:4283 with SMTP id
 d9443c01a7336-21c355fcb7emr524423085ad.43.1737751840090; 
 Fri, 24 Jan 2025 12:50:40 -0800 (PST)
Received: from ?IPv6:2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb?
 ([2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da555a428sm18349685ad.84.2025.01.24.12.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:50:39 -0800 (PST)
Message-ID: <5acfbe92315d93aceb467fec1d239d6a7a7ba499.camel@gmail.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev, 
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com, 
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, 	nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, 	Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, 	torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com, 
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, 	nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, 	hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, 	Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, 	geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, 	jarkko@kernel.org
Date: Fri, 24 Jan 2025 17:50:29 -0300
In-Reply-To: <20250124135203.040d0852@foz.lan>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <20250124135203.040d0852@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

On Fri, 2025-01-24 at 13:52 +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 24 Jan 2025 10:12:50 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>=20
> > > It's been a few years since I first thought on finding a good way of =
helping
> > > kernel developers testing their patches, while making use of the free=
 runner
> > > minutes Gitlab offers. It can greatly simplify the testing for people=
 who are
> > > new to kernel development, or students trying to understand it better=
.
> > >=20
> > > And this patchset allows that to happen :)
> > >=20
> > > Actually, I spoke to Helen last year, and to enable it to run on the =
free
> > > Gitlab-CI runners, there is a small extra patch which is needed:
> > >=20
> > > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.co=
m/ =20
>=20
> Sounds interesting!

Thanks! :)

>=20
> > Gitlab as an open-source software project (the community edition) is on=
e
> > thing, but can we please avoid advertising specific proprietary service=
s
> > in the kernel documentation ?
>=20
> Every time Gitlab is mentioned, the brand of the company that
> developed it and has been providing proprietary services is also
> advertised. If you're not happy with that, you should move to use
> a git forge developed by some open source community.
>=20
> The way I see, the best would be if the CI integration could work
> with more than one type of forge and being able to use any
> free Git??b-CI runners that would be available for developers to
> use, as this would allow testing more subsystems with CI, thus
> increasing code quality.

Completely agree!
I think that this Gitlab contribution will set a base for implementing othe=
r
forges / CI systems as well, and allow us to make use of those resources fo=
r
better kernel testing.=20

Thanks!
Leo

>=20
> Thanks,
> Mauro

