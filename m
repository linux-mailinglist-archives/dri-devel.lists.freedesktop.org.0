Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D073228A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C486710E55C;
	Thu, 15 Jun 2023 22:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A456C10E55B;
 Thu, 15 Jun 2023 22:12:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5151934a4e3so33229a12.1; 
 Thu, 15 Jun 2023 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686867125; x=1689459125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtSoYMRgTlu/L3Ko+hzV5x4F6aBChamUxp1o4AEO+Vc=;
 b=kuzE9wD21rrxTjFExigYwVskOkViq9Q0jyeNFAxXCPdD6iuq6yi34EW8LbMdgt0WZu
 yVoLpsACHyCYyVLQ929xSuygranigsDPG6I+YJJUQZYHj4a5gXV8rpkRvt2YYLW11C4d
 gAfyyxCA4huAYY3XCyoQhP2pB3CwFzMJjPo8fJPYyJEDekrqAny581MyTARDzlEN1CT/
 NyXEhQ4ZgX3E9coR23ML4vQzaxrTcLVLipt+D7QLCE/L8j+RsfAIRvAyyef09jqawowx
 Is57Ta5ringPbGB0CBCbQIuMo1h7Uld2DjAr9GTGLkg2J7djcpZByKVch1/ItKRW/crA
 39wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686867125; x=1689459125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CtSoYMRgTlu/L3Ko+hzV5x4F6aBChamUxp1o4AEO+Vc=;
 b=FOIo8gQKMEBsgg2EKD7utUO6TXU9fdi9hu3Vi1iTn6IOaj+EO8MqjmLVybhyk4EXoe
 6GD7FnoPl7G9uT8+2O5qDeqXqzIjf1oFBJf+0IIvBaEL7fFeAMfnizFNXXfQCLlaooIS
 hzLL/1iK/qOyZ3YG+sQQxfXXiM2skcWhmUb6uJX/UmVgets9SxYvBw3MNY02Er7dfMla
 hMA6zv33hcf9ow6/NnarQIwRsm1xXyD8wrUwC1XybHfzovlSrVB9jlL6Ye5HywvzgUI+
 9QIjrSdCxedZHkodyKho9t0oUBtItNdctu1Z/kzVJtCT1gqVTc0XmRPokW2eseldub0b
 /MKg==
X-Gm-Message-State: AC+VfDwtD/vr71kcqq36fy32fBH97cUz1iI0L3Es08rl4WrjQqPqxZxI
 7EBKvdXemaEqIaYKsMpA/TtWMHpgtztbPR60+ms=
X-Google-Smtp-Source: ACHHUZ4Xx7UROivJOCLEV60WBPrGPjX3joCLkvS6ST9e3m+2YEQj8FMMjTFzel1p1pv5x6c/uQkiRJ/IzmMuBmdaMzY=
X-Received: by 2002:a17:907:2d28:b0:973:940e:a01b with SMTP id
 gs40-20020a1709072d2800b00973940ea01bmr295614ejc.60.1686867125236; Thu, 15
 Jun 2023 15:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-3-ville.syrjala@linux.intel.com>
 <ZFIPCm+k9TCyfMfS@intel.com>
 <ZFJAWCGuWcLDQOfS@intel.com> <ZFJSLwVrlE8ABtei@intel.com>
In-Reply-To: <ZFJSLwVrlE8ABtei@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Jun 2023 08:11:53 +1000
Message-ID: <CAPM=9tyXRsBBeykVFLFJ6fMz_eYHXwxKuzVYjUHyk4x6b45PZw@mail.gmail.com>
Subject: Re: [PATCH 02/11] drm/i915/mst: Remove broken MST DSC support
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Vinod Govindapillai <vinod.govindapillai@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 May 2023 at 22:23, Lisovskiy, Stanislav
<stanislav.lisovskiy@intel.com> wrote:
>
> On Wed, May 03, 2023 at 02:07:04PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Wed, May 03, 2023 at 10:36:42AM +0300, Lisovskiy, Stanislav wrote:
> > > On Tue, May 02, 2023 at 05:38:57PM +0300, Ville Syrjala wrote:
> > > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > >
> > > > The MST DSC code has a myriad of issues:
> > > > - Platform checks are wrong (MST+DSC is TGL+ only IIRC)
> > > > - Return values of .mode_valid_ctx() are wrong
> > > > - .mode_valid_ctx() assumes bigjoiner might be used, but ther rest
> > > >   of the code doesn't agree
> > > > - compressed bpp calculations don't make sense
> > > > - FEC handling needs to consider the entire link as opposed to just
> > > >   the single stream. Currently FEC would only get enabled if the
> > > >   first enabled stream is compressed. Also I'm not seeing anything
> > > >   that would account for the FEC overhead in any bandwidth calculat=
ions
> > > > - PPS SDP is only handled for the first stream via the dig_port
> > > >   hooks, other streams will not be transmittitng any PPS SDPs
> > > > - PPS SDP readout is missing (also missing for SST!)
> > > > - VDSC readout is missing (also missing for SST!)
> > > >
> > > > The FEC issues is really the big one since we have no way currently
> > > > to apply such link wide configuration constraints. Changing that is
> > > > going to require a much bigger rework of the higher level modeset
> > > > .compute_config() logic. We will also need such a rework to properl=
y
> > > > distribute the available bandwidth across all the streams on the
> > > > same link (which is a must to eg. enable deep color).
> > >
> > > Also all the things you mentioned are subject for discussion, for exa=
mple
> > > I see that FEC overhead is actually accounted for bpp calculation for=
 instance.
> >
> > AFAICS FEC is only accounted for in the data M/N calculations,
> > assuming that particular stream happened to be compressed. I'm
> > not sure if that actually matters since at least the link M/N
> > are not even used by the MST sink. I suppose the data M/N might
> > still be used for something though. For any uncompressed stream
> > on the same link the data M/N values will be calculated
> > incorrectly without FEC.
> >
> > And as mentioned, the FEC bandwidth overhead doesn't seem to
> > be accounted anywhere so no guarantee that we won't try to
> > oversubcribe the link.
> >
> > And FEC will only be enabled if the first stream to be enabled
> > is compressed, otherwise we will enable the link without FEC
> > and still try to cram other compressed streams through it
> > (albeit without the PPS SDP so who knows what will happen)
> > and that is illegal.
> >
> > > We usually improve things by gradually fixing, because if we act same=
 way towards
> > > all wrong code in the driver, we could end up removing the whole i915=
.
> >
> > We ususally don't merge code that has this many obvious and/or
> > fundemental issues.
>
> Well, this is arguable and subjective judgement. Fact is that, so far we =
had more MST hubs
> working with that code than without. Also no regressions or anything like=
 that.
> Moreover we usually merge code after code review, in particular those pat=
ches
> did spend lots of time in review, where you could comment also.
>
> Regarding merging code with fundamental issues, just recently you had adm=
itted yourself
> that bigjoiner issue for instance, we had recently, was partly caused by =
your code, because
> we don't anymore copy the pll state to slave crtc.
> I would say that words like "obvious" and "fundamental"
> issues can be applied to many things, however I thought that we always fi=
x things in constructive,
> but not destructive/negative way.
> Should I call also all code completely broken and remove it, once we disc=
over some flaws
> there? Oh, we had many regressions, where I could say the same.
>
> And once again I'm completely okay, if you did introduce better functiona=
lity instead
> AND I know you have some valid points there, but now we are just removing=
 everything completely,
> without providing anything better.
>
> But okay, I've mentioned what I think about this and from side this is na=
k.
> And once the guys to whom those patches helped will pop up from gitlab,
> asking why their MST hubs stopped working - I will just refer them here.
>
> >
> > Now, most of the issues I listed above are probably fixable
> > in a way that could be backported to stable kernels, but
> > unfortunately the FEC issue is not one of those. That one
> > will likely need massive amounts of work all over the driver
> > modeset code, making a backport impossible.
> >
> > > So from my side I would nack it, at least until you have a code which=
 handles
> > > all of this better - I have no doubt you probably have some ideas in =
your mind, so lets be constructive at least and propose something better fi=
rst.
> > > This code doesn't cause any regressions, but still provides "some" su=
pport to DP MST DSC to say the least and even if that would be removed, if =
some of those users
> > > refer to me, I would probably then just point to this mail discussion=
 everytime.
> >
> > It seems very likely that it will cause regressions at some point,
> > it just needs a specific multi-display MST setup. The resulting
> > problems will be very confusing to debug since the order in which
> > you enable/disable the outputs will have an impact on what actually
> > goes wrong on account of the FEC and PPS SDP issues. The longer
> > we wait disabling this the harder it will be to deal with those
> > regressions since we the probably can't revert anymore (a straight
> > revert was already not possible) but also can't fix it in a way
> > that can be backported (due to the FEC issues in particular).

I don't think we can reasonably disable this either.

If there are any existant systems which work due to this even if it's
crap, merging this will regress them and Linus will make us revert it.

Sorry this isn't an engineering solution to the problem, going to have
to go around the long way.

Dave.
