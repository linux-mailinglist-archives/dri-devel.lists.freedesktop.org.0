Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A6762EDE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2D910E0D7;
	Wed, 26 Jul 2023 07:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5637910E0D7;
 Wed, 26 Jul 2023 07:55:14 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5222bc916acso4156060a12.3; 
 Wed, 26 Jul 2023 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690358113; x=1690962913;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=d7QOnvKrfMfPuvNBhOGu4xW+tXNWmX6DFQBAZIM9kfY=;
 b=Wy+TCQdL26knY2e/j2nECKLaAva/TSyOE44TwASfTFzw6xb6+V10JP/EhFIL+jmgK/
 YsiwCG6NkVzHjALq5yvV3oBAne8C2vCaDcAndSerFKb4MZmaHBlbh0A/q3kESukVAQUR
 JdCYQyopYirbr0yYto58cviQKxN0nBpC4fK0JEE2KyFi0F6d2Vcy8Po9iZ0OvX/NLhU2
 FWbtzer7SBgPsTuo4RTr7FwxmwqFFfIpErEbKiXsnoD6PEFnEjRWT9Mni+dSelZN5k1n
 bsGHInDQZceizHj7HPUSE2mPkII+jQEsXD49jExn70v45Sxgr58+3iHa8Ib2XFMlYo7s
 s+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690358113; x=1690962913;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d7QOnvKrfMfPuvNBhOGu4xW+tXNWmX6DFQBAZIM9kfY=;
 b=Ja4lrT9Hlb7Vd3r4FiYfxPGp/uM4R11zLjsSKXWBbVPCm6umtcscP2PmUp2N+e8HLG
 bZb3U3Groh8eAe8+3i+RlimFIV2PIR/5O8wSj1ZGMov/hmgKGexSYkM3NllECY5PCtMl
 2tUdk/LZsMdoe3prHlC581afX97zNyLNXKBhRd2cq5MHEWoL/kEE9hj5trnACL2xICg4
 jQh8fEqDXhcklfPWuHmfF5RHHYiDHixCPuUPQbltO883tM/OhBJ6tgeNQJ1bWRnxmApy
 I5nqEo8e8VxF0VVlHliHu1TV8lgvA3RZv2OgFGaDAYohL52AykqwujWxTEsKeUT3gGPG
 9pww==
X-Gm-Message-State: ABy/qLY7p5LPeQIMQyy/I0WwW7g8julObbjOxsSV539bDHcLdATd5zYW
 OVgZGuK1+tFWkvNrs6mQtSm62MhHql2WWA==
X-Google-Smtp-Source: APBJJlFGocUFJ8sh5KJvcCwa5CUXeceoVuzHq1oJnaq5n25KmyNR0wLVUki587Ec9KEKVMq8B33Eag==
X-Received: by 2002:a17:906:3296:b0:970:c9f:2db6 with SMTP id
 22-20020a170906329600b009700c9f2db6mr992284ejw.63.1690358112373; 
 Wed, 26 Jul 2023 00:55:12 -0700 (PDT)
Received: from ?IPv6:2a0a:f640:1900:2df4:8cfd:779f:f22d:4029?
 ([2a0a:f640:1900:2df4:8cfd:779f:f22d:4029])
 by smtp.gmail.com with ESMTPSA id
 va6-20020a17090711c600b00992c4103cb5sm9192980ejb.129.2023.07.26.00.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:55:11 -0700 (PDT)
Message-ID: <3e38ebb1695d0b5df8c2ebbae37eccab2fcfdc39.camel@gmail.com>
Subject: Re: Non-robust apps and resets (was Re: [PATCH v5 1/1] drm/doc:
 Document DRM device reset expectations)
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, Marek
 =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
Date: Wed, 26 Jul 2023 09:55:08 +0200
In-Reply-To: <36bc5f30-dc72-10a3-c9cb-de9cb5400eb3@mailbox.org>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
 <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
 <CAAxE2A6OhFVKSm8VY1iNJx_FvDH-ojfgxvSjTmJUwtcmouoLMw@mail.gmail.com>
 <36bc5f30-dc72-10a3-c9cb-de9cb5400eb3@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com,
 =?ISO-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-07-25 at 19:00 +0200, Michel D=C3=A4nzer wrote:
> On 7/25/23 17:05, Marek Ol=C5=A1=C3=A1k wrote:
> > On Tue, Jul 25, 2023 at 4:03=E2=80=AFAM Michel D=C3=A4nzer
> > <michel.daenzer@mailbox.org> wrote:
> > > On 7/25/23 04:55, Andr=C3=A9 Almeida wrote:
> > > > Hi everyone,
> > > >=20
> > > > It's not clear what we should do about non-robust OpenGL apps
> > > > after GPU resets, so I'll try to summarize the topic, show some
> > > > options and my proposal to move forward on that.
> > > >=20
> > > > Em 27/06/2023 10:23, Andr=C3=A9 Almeida escreveu:
> > > > > +Robustness
> > > > > +----------
> > > > > +
> > > > > +The only way to try to keep an application working after a
> > > > > reset is if it
> > > > > +complies with the robustness aspects of the graphical API
> > > > > that it is using.
> > > > > +
> > > > > +Graphical APIs provide ways to applications to deal with
> > > > > device resets. However,
> > > > > +there is no guarantee that the app will use such features
> > > > > correctly, and the
> > > > > +UMD can implement policies to close the app if it is a
> > > > > repeating offender,
> > > > > +likely in a broken loop. This is done to ensure that it does
> > > > > not keep blocking
> > > > > +the user interface from being correctly displayed. This
> > > > > should be done even if
> > > > > +the app is correct but happens to trigger some bug in the
> > > > > hardware/driver.
> > > > > +
> > > > Depending on the OpenGL version, there are different robustness
> > > > API available:
> > > >=20
> > > > - OpenGL ABR extension [0]
> > > > - OpenGL KHR extension [1]
> > > > - OpenGL ES extension=C2=A0 [2]
> > > >=20
> > > > Apps written in OpenGL should use whatever version is available
> > > > for them to make the app robust for GPU resets. That usually
> > > > means calling GetGraphicsResetStatusARB(), checking the status,
> > > > and if it encounter something different from NO_ERROR, that
> > > > means that a reset has happened, the context is considered lost
> > > > and should be recreated. If an app follow this, it will likely
> > > > succeed recovering a reset.
> > > >=20
> > > > What should non-robustness apps do then? They certainly will
> > > > not be notified if a reset happens, and thus can't recover if
> > > > their context is lost. OpenGL specification does not explicitly
> > > > define what should be done in such situations[3], and I believe
> > > > that usually when the spec mandates to close the app, it would
> > > > explicitly note it.
> > > >=20
> > > > However, in reality there are different types of device resets,
> > > > causing different results. A reset can be precise enough to
> > > > damage only the guilty context, and keep others alive.
> > > >=20
> > > > Given that, I believe drivers have the following options:
> > > >=20
> > > > a) Kill all non-robust apps after a reset. This may lead to
> > > > lose work from innocent applications.
> > > >=20
> > > > b) Ignore all non-robust apps OpenGL calls. That means that
> > > > applications would still be alive, but the user interface would
> > > > be freeze. The user would need to close it manually anyway, but
> > > > in some corner cases, the app could autosave some work or the
> > > > user might be able to interact with it using some alternative
> > > > method (command line?).
> > > >=20
> > > > c) Kill just the affected non-robust applications. To do that,
> > > > the driver need to be 100% sure on the impact of its resets.
> > > >=20
> > > > RadeonSI currently implements a), as can be seen at [4], while
> > > > Iris implements what I think it's c)[5].
> > > >=20
> > > > For the user experience point-of-view, c) is clearly the best
> > > > option, but it's the hardest to archive. There's not much gain
> > > > on having b) over a), perhaps it could be an optional env var
> > > > for such corner case applications.
> > >=20
> > > I disagree on these conclusions.
> > >=20
> > > c) is certainly better than a), but it's not "clearly the best"
> > > in all cases. The OpenGL UMD is not a privileged/special
> > > component and is in no position to decide whether or not the
> > > process as a whole (only some thread(s) of which may use OpenGL
> > > at all) gets to continue running or not.
> >=20
> > That's not true.
>=20
> Which part of what I wrote are you referring to?
>=20
>=20
> > I recommend that you enable b) with your driver and then hang the
> > GPU under different scenarios and see the result.
>=20
> I've been doing GPU driver development for over two decades, I'm
> perfectly aware what it means. It doesn't change what I wrote above.
>=20

Michel, I understand that you disagree with the proposed solutions in
this email thread but from your mails it is unclear to me what exactly
is the solution that you would actually recommend, can you please
clarify?

Thanks,
Timur

