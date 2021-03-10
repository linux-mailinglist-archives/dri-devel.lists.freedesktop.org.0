Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCC33479E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 20:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7881F6E2A3;
	Wed, 10 Mar 2021 19:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1D56E2A3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 19:11:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id f12so24573542wrx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZ2N8G7X3AIS0KqmQoEuSmRBCn/+/0Pu32tG/WH4BOw=;
 b=TRjIUEPsdVFdehtlILSAg5T+jHSQgjqcb0VnAvRZO5vnRKBep1Xm9FkspShYO959lF
 mdHCdObY3hKgRfMrhzKtkE+PLxsFqfWzng4U6IBfMjYTDasXkMFojYuW6UDmC9egyGke
 Ma0z9tmeMLoAsRl3K9JKE5mqwSORunty5x267VL215YLmlYt5byTTGKPk+DKw7klSyW/
 jxuMWYSNxMP11At8R9TV595G36jFr64/eK4ZOBRVZRXBCPlflT9pyPdmbRArMmZ65FHh
 nq7sZGhKW+HAfJbVDXDIGDLfdTIzeqFj/bOYNSMgxVb7xaGFvWGvGAyVZ8fc2k6nUSoo
 NG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZ2N8G7X3AIS0KqmQoEuSmRBCn/+/0Pu32tG/WH4BOw=;
 b=W7D9u+5p7TkuXtWvN0J8R3RuhjUujn4jdtCWvfYFDhwCrnhfaFp3NCjYyy8f6nfllK
 gPOEM2n7NdSrA/FbQSFVtoGv+cRSdLxnMqBSAm2Y+zi7FHQ29VndD9LWWjUi0B+p6ZjC
 RDyFaJAizsuTx3JV1NWrkYAVE8DJhe5e6ZI4xz+gdN/UX/bCXzayF9hgbgL+FaiHfBWs
 ocyClDwvtApv91Q/UAPIw8FHKyJTl3nEmnefcvu8Awa87cCNgSKvGa+6VV6K2Xe7ot/b
 zCldJ+g3LCLh3wQcQEJFcmY0InNCJqyobNiIq6a9KxXQyLWuTtfjtMefnH+OvAuiuHde
 ze1g==
X-Gm-Message-State: AOAM531h7LE30QmyYqbXpRps2F6oOkroS36o3Jmj9TRR60BcFL4E4G5v
 v/f8G0OWiQjj9OyHET1RXrNjJ3Vuo6cjsE0o40M=
X-Google-Smtp-Source: ABdhPJyfzY35biliH49MAj/mEjspbsMQ3GXQgXrIQLY0nr7yuNRryfECpCxNI6I08BlQqKVDixNeEW+P5zSVrSLaVIU=
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr5080908wrx.150.1615403508464; 
 Wed, 10 Mar 2021 11:11:48 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyZF=seWUswnp7M3RbDQC2hLUc0wjpYYyEfn3dgpOf4zw@mail.gmail.com>
 <20210310074851.x4lo4ymkq25e2iw2@gilmour>
In-Reply-To: <20210310074851.x4lo4ymkq25e2iw2@gilmour>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 11 Mar 2021 05:11:36 +1000
Message-ID: <CAPM=9tym-LbpFhFCyezYRZeOv6ryEcGj-Jh5yH_87x45g8NN_w@mail.gmail.com>
Subject: Re: don't base trees on 5.12-rc1
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Mar 2021 at 17:48, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Wed, Mar 10, 2021 at 09:50:29AM +1000, Dave Airlie wrote:
> > I'm mostly sending this to the -misc maintainers because
> > drm-misc-fixes is based on rc1 at present.
> >
> > This needs to be *rebased* not merged up to 5.12-rc2. Merging will
> > still have the bad landmine commits in the bisect history. This is a
> > very special case.
>
> I'm sorry, I'm not entirely sure I get this. -rc1 is still in the -rc2
> history, so how would that change anything in the bisect history?
>

We can't get rid of the bad commit range, we can reduce the amount of
times someone accidentally bisects into it, by not using it as a base
commit for future changes.

If in the future a bisect happens to want to test one of the patches
in drm-misc-fixes that is based on rc1, it will land the user with an
rc1 test kernel and could eat their swapfile/disk. We can avoid that
problem by not using rc1 as a base for drm-misc-fixes.

We can't avoid them bisecting into the broken commits between when
this landed and was fixed, but rebasing trees can minimise the chances
of this when bisecting other changesets.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
