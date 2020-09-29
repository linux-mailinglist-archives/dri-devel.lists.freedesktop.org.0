Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094127D828
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 22:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC116E04A;
	Tue, 29 Sep 2020 20:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEFB6E04A;
 Tue, 29 Sep 2020 20:30:27 +0000 (UTC)
IronPort-SDR: N000oSknGO0L29h9NOGfCpE7x9AwsmEbzebGeUP+fL6MNweH70/dw/kk5oRLVR8QOfens38stt
 XBAiDRxPL+fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="149940386"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="149940386"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 13:30:25 -0700
IronPort-SDR: 3ZFvFHFJg44c279cYTrvjd55OKOuH65TKUArFGMlkdn+psza8LAJz+Osj2IhP0u3HY3/qZha7e
 JHzzY98OTBqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="350402239"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 29 Sep 2020 13:30:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Sep 2020 23:30:22 +0300
Date: Tue, 29 Sep 2020 23:30:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Message-ID: <20200929203022.GI6112@intel.com>
References: <20200929121127.254086-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
 <20200929200201.GH6112@intel.com>
 <a4a075597c7d3e65b25598ab696a59eccbd2a069.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4a075597c7d3e65b25598ab696a59eccbd2a069.camel@intel.com>
X-Patchwork-Hint: comment
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 08:20:22PM +0000, Souza, Jose wrote:
> On Tue, 2020-09-29 at 23:02 +0300, Ville Syrj=E4l=E4 wrote:
> > On Tue, Sep 29, 2020 at 07:33:45PM +0000, Souza, Jose wrote:
> > > On Tue, 2020-09-29 at 17:41 +0530, Tejas Upadhyay wrote:
> > > > JSL has update in vswing table for eDP
> > > =

> > > Would be nice to mention in the commit description why PCH is being u=
sed, that would avoid Ville's question.
> > =

> > If the thing has nothing to do PCH then it should not use the PCH type
> > for the the check. Instead we should just do the EHL/JSL split.
> =

> In the first version Matt Roper suggested to use PCH to differentiate bet=
ween EHL and JSL, Jani also agreed with this solution.This 2 PCHs can only =
be
> associate with EHL and JSL respectively, so no downsides here.

The downside is that the code makes no sense on the first glance.
It's going to generate a "wtf?" exception in the brain and require
me to take a second look to figure what is going on. Exception
handling is expensive and shouldn't be needed in cases where it's
trivial to make the code 100% obvious.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
