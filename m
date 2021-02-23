Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D13222E5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 01:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC526E7F5;
	Tue, 23 Feb 2021 00:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB0E8913E;
 Tue, 23 Feb 2021 00:00:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97E0360C41;
 Tue, 23 Feb 2021 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614038446;
 bh=af3kVTgsG+nH3bM3IYnJBqeSQYehgcaCIygkIvqVjeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nV6TYhL/oZNC9ifaFgtV5DjQUEKW4ct/RZXzL5cEAO+OEiYaRVvJB6MnQTc1GgLDg
 ZxZPHOSv1bmmm50hjEKCBKAdJy06dDuQgJws05+gPJ7vhenuXz0IbFL9AHEcQCGmZu
 imEAdGj/OEhQSAKHAz3rHudTUwkOAJGTbcsmgQ3E4mnIeJk4ydl08iGkjwUVUAN1X+
 gpuniD1QjbCS0WDVI9g2unaM1LUFoC9It+wtjRh0GXnNVsd+VoG5YBbI4/JwHcPTrq
 FRtTYoRRzhd2gk02YLalZuf1ZGsh62b0eufN0g4UGVYTpcrawf1WR9HZdvEwjFLc3p
 nD7cOeD11urKg==
Date: Mon, 22 Feb 2021 17:00:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu/display: initialize the variable 'i'
Message-ID: <20210223000045.GA4304@24bbad8f3778>
References: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
 <32vjVDssCxltB75h5jHin2U3-cvNjmd_HFnRLiKohhbXkTfZea3hw2Knd80SgcHoyIFldMNwqh49t28hMBvta0HeWed1L0q_efLJ8QCgNw8=@emersion.fr>
 <20210222234457.GA36153@24bbad8f3778>
 <yHvp7KbQD2pF5dR6krMc_Zuq9a8GxkYSSiIpjBenuiCjwpFmFxpAOpfzhp0DfHQhH2Z3P81-CGpwmmXp0zjifT93vBXXYd5kJsSucQgXFZI=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yHvp7KbQD2pF5dR6krMc_Zuq9a8GxkYSSiIpjBenuiCjwpFmFxpAOpfzhp0DfHQhH2Z3P81-CGpwmmXp0zjifT93vBXXYd5kJsSucQgXFZI=@emersion.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: stylon.wang@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, airlied@linux.ie, aurabindo.pillai@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Bhawanpreet.Lakha@amd.com, nicholas.kazlauskas@amd.com,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 11:50:06PM +0000, Simon Ser wrote:
> On Tuesday, February 23rd, 2021 at 12:44 AM, Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > On Mon, Feb 22, 2021 at 11:05:17PM +0000, Simon Ser wrote:
> > > On Monday, February 22nd, 2021 at 8:25 PM, Souptick Joarder <jrdr.linux@gmail.com> wrote:
> > >
> > > > >> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9804:38:
> > > > >> warning: variable 'i' is uninitialized when used here
> > > > >> [-Wuninitialized]
> > > >                            timing  = &edid->detailed_timings[i];
> > > >                                                              ^
> > > >    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9714:7:
> > > > note: initialize the variable 'i' to silence this warning
> > > >            int i;
> > > >                 ^
> > > >                  = 0
> > > >    1 warning generated.
> > > >
> > > > Initialize the variable 'i'.
> > >
> > > Hm, I see this variable already initialized in the loop:
> > >
> > >     for (i = 0; i < 4; i++) {
> > >
> > > This is the branch agd5f/drm-next.
> >
> > That is in the
> >
> > 	if (amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT
> > 		|| amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_EDP) {
> >
> > branch not the
> >
> > 	} else if (edid && amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> >
> > branch, where i is indeed used uninitialized like clang complains about.
> >
> > I am not at all familiar with the code so I cannot say if this fix is
> > the proper one but it is definitely a legitimate issue.
> 
> I think you have an outdated branch. In my checkout, i is not used in the first
> branch, and is initialized in the second one.
> 
> https://cgit.freedesktop.org/~agd5f/linux/tree/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c?h=drm-next#n9700

That branch is the outdated one:

https://git.kernel.org/linus/a897913a819191550ab2fa2784d3c3ada3a096d3

Please see:

https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L9854

It was introduced by commit f9b4f20c4777 ("drm/amd/display: Add Freesync
HDMI support to DM").

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
