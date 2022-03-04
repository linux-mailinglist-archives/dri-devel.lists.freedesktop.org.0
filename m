Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D518B4CD066
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 09:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE6310F21B;
	Fri,  4 Mar 2022 08:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE8810E266
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 08:45:20 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id f5so15475191ybg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 00:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PLF7+bq13iQ5C6/SzqxABIu1vzDvMD471Sme1AILTpE=;
 b=FDx3RhqzN3RFl3Cv8oh4d+TzVJtWwOB0i/leEqwYQexpR/8zByxiwZ0oLnG4/9Rgve
 jMvd3rAb0WmGWEurbaFtSE/4aRoE42g35TjB8kYG8mcNbXv8ah/sMRvUkLKZ6DKTVYZC
 a7e/jp1iFWKYSy3r5Cn4v5GVwOVbnB+95WxVFZ0F1Ub13KTwuObTr4ixzfyIYZ10v8xf
 27+sjZg27353IgS40N1MpQ5ovM7DazHLTO3UTGEVSGN2rPqg895aoWa3En786jmJEN60
 ofadJeWLWePID3P7YOBjVrVuS2wcnlQpnRjNTQoWuQbvTmIC7KRF0DjXh2JbdoUp9BLr
 DhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PLF7+bq13iQ5C6/SzqxABIu1vzDvMD471Sme1AILTpE=;
 b=dXmzkr7CQ0O13yLyN3yA1OsYdWuU3ZgrQrc8A8D7fcgEwZtjSWEycNcqG1Q1eWgzwC
 uU4C3/1v82lWjNmrw3Osm+AcfauQ5Cy03Df44EAb/yVTwWD5aLyK3JjzyVnO3N1iXZXx
 FoEhMc9092Ja8YdUZohiRNr4gwOF+AOIzsHgOtFPn6qp9ffuToiM9/G64mUyGU/N0CCf
 Bn0i42Td+nFI9265jMBx7qnXF4JucOA7hUHVjIFTRjuXzABxerUl0gDKb8feseCS4AGT
 O4PFP+qgjrES5hnE6Po7Ku0il0fre0onkdI0pNWdK2eQ6U4bQKE3e98GxLOaFpeS3GQC
 If+w==
X-Gm-Message-State: AOAM533Yp2jsMYsoPXrCf+17OAPO4mTx6nbumX6koYTlR3crcvJoVxGA
 5om37voesUheNXQuZkqsaOfcDSd49XrDggCNUwQOKg==
X-Google-Smtp-Source: ABdhPJws5Mfn1T8KkyQDUvTKU6lQNDtGx0yKpQzP7ZRAJQ6LzcHh4Eybu4jfkr3KyrTuokV11JHn+PmboMh3EY+1np0=
X-Received: by 2002:a25:8d07:0:b0:61d:b996:44b3 with SMTP id
 n7-20020a258d07000000b0061db99644b3mr36958127ybl.111.1646383518906; Fri, 04
 Mar 2022 00:45:18 -0800 (PST)
MIME-Version: 1.0
References: <20220303090507.grenwdro7u4fzmoe@houat>
 <YiCeCeNobS2FCiQB@intel.com>
In-Reply-To: <YiCeCeNobS2FCiQB@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 4 Mar 2022 08:45:07 +0000
Message-ID: <CAPj87rOjof_WMT32G3-mb-ukVmOxVWJfXEVB4hYbUj0_VCV6ng@mail.gmail.com>
Subject: Re: [igt-dev] Mandatory Test Suite for KMS Drivers?
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 3 Mar 2022 at 10:53, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> > Back at XDC we floated the idea of creating a test suite for IGT that we
> > expect any KMS driver to pass, similar to what v4l2-compliance and
> > cec-compliance provide for v4l2 and CEC respectively.
> >
> > I was looking at the list of tests, and it's fairly massive, so it's not
> > clear to me what tests we could start this suite with. I can only assume
> > all the KMS (but the chamelium ones) and fbdev related ones would be a
> > good start?
> >
> > What do you think?
>
> I believe we should start with the group of the tests that we know that
> are reliably passing today on most of the platforms and then increase
> the list as the tests and drivers become more reliable.
>
> For instance, many of these would be candidate to be filtered out for now
> https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=kms
>
> compared to the whole view of kms tests:
> https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=kms

We are running some of IGT on Panfrost + amdgpu + i915 as part of
KernelCI as well: go to https://linux.kernelci.org/test/ and search
for 'igt-gpu'. This gets run for mainline, next, and whatever other
kernel trees push into i915.

There is a Grafana-based dashboard that the KernelCI team have been
working on to visualise test runs, but it's currently having some
backend issues so I can't show you a link for that. I did raise a
suggestion in their design discussion for a proper testing dashboard
for making it easier to see the status, so feel free to pile in there:
https://github.com/kernelci/kernelci-project/discussions/28#discussioncomment-2293696

Cheers,
Daniel
