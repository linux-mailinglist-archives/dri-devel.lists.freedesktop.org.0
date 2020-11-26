Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933982C5B21
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 18:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE226E997;
	Thu, 26 Nov 2020 17:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE056E997
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 17:55:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u12so3060392wrt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 09:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=22A8008SF+j3m02WPixLhh5zA9H2rktS0Eax77xtEYc=;
 b=LLkhVJoYc94oOLoLm6Klgnd/ru+dl/eFUv51kMtY+jg6T/TqGDhKkqPLPU3klJ7xtN
 esV7jJ7L4Vb99Lzm8rripIAeCaVM7UCv5f8mRRkcAE6Om4nhh4sxqOVTG2QJsZONtT/B
 K2ZjiJ7EipMJ0GOag/miGTN2I6KcY79mED7PCFZJgbxITDeCyBnPrJEM2Wtj7Yrfh8Q6
 Y2uoXfdmSVCBlFsnSxbfojJE3z7SpRcLh1HxvNmwFDLEJiILGFp6iWIQDy7eXN8E6/8U
 FW6gJvE5aajii3Wc6W8iUAdOz6sr2jf6aUFPDJkuwEQm4XyK92WN+4iTYAqtGVYR3Nw2
 RdYA==
X-Gm-Message-State: AOAM532DvUG1OvghexOQwpuSh6h5q7THtTLCESjm5nDmh/Bp0/cO+SsM
 dEViu/GoshSsgqvI3G5L9Wc=
X-Google-Smtp-Source: ABdhPJwNUIHnG8LMlsBBMZ5FRqQJJ8L8r06hEZvqK5zRQlbvc8KsciA63I86UtCkk2Y6O7KWRU4KSA==
X-Received: by 2002:a5d:668d:: with SMTP id l13mr5129682wru.279.1606413329031; 
 Thu, 26 Nov 2020 09:55:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id d16sm10977272wrw.17.2020.11.26.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 09:55:27 -0800 (PST)
Date: Thu, 26 Nov 2020 18:55:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v7 17/47] dt-bindings: memory: tegra20: Add memory client
 IDs
Message-ID: <20201126175526.GA17141@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-18-digetx@gmail.com> <X7/lLaZJNp+Vfczk@ulmo>
 <20201126173922.GA7048@kozik-lap>
 <CAJKOXPfbmvUi3uWmX=qiiBxpCK_2oTWPY1JVxiVMuiv=RtwdKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPfbmvUi3uWmX=qiiBxpCK_2oTWPY1JVxiVMuiv=RtwdKw@mail.gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 26, 2020 at 06:45:51PM +0100, Krzysztof Kozlowski wrote:
> On Thu, 26 Nov 2020 at 18:39, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Thu, Nov 26, 2020 at 06:26:05PM +0100, Thierry Reding wrote:
> > > On Wed, Nov 04, 2020 at 07:48:53PM +0300, Dmitry Osipenko wrote:
> > > > Each memory client has unique hardware ID, add these IDs.
> > > >
> > > > Acked-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > > ---
> > > >  include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
> > > >  1 file changed, 53 insertions(+)
> > >
> > > Is there any chance you could drop these dt-bindings include patches
> > > (17, 18 and 19) so that I can pick them up into the Tegra tree? The
> > > device tree changes that I was going to pick up depend on this and
> > > fail to build if applied as-is.
> > >
> > > I was looking at your linux-mem-ctrl tree and had initially thought I
> > > could just pull in one of the branches to get these dependencies, but it
> > > looks like the dt-bindings patches are on the for-v5.11/tegra-mc branch,
> > > which the ARM SoC maintainers wouldn't like to see me pull in for a
> > > dependency on device tree changes.
> >
> > Partially you answered here. :) Since you should not pull my branch into
> > a DT branch, you also should not put these include/dt-bindings patches
> > there.  SoC guys will complain about this as well.
> >
> > These patches are also needed for the driver, so if you take them, I
> > would need them back in a pull request. SoC folks could spot it as well
> > and point that such merge should not happen.
> 
> It seems I was wrong - these patches are not needed for the driver
> code. Neither in applied parts nor in upcoming Dmitry's work. In such
> case I could rework my branches and send a new pull request. The
> patches would stay only in your tree.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
