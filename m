Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E535F1208D0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B8C6E5B0;
	Mon, 16 Dec 2019 14:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9A96E5B0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 14:43:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 06:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="217187099"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 16 Dec 2019 06:43:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 16:43:24 +0200
Date: Mon, 16 Dec 2019 16:43:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: display/ingenic: Add compatible
 string for JZ4770
Message-ID: <20191216144324.GW1208@intel.com>
References: <20191210144142.33143-1-paul@crapouillou.net>
 <20191214105418.GA5687@ravnborg.org>
 <20191216131529.GN1208@intel.com> <1576503593.3.2@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576503593.3.2@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 02:39:53PM +0100, Paul Cercueil wrote:
> Hi Ville,
> =

> =

> Le lun., d=E9c. 16, 2019 at 15:15, Ville Syrj=E4l=E4 =

> <ville.syrjala@linux.intel.com> a =E9crit :
> > On Sat, Dec 14, 2019 at 11:54:18AM +0100, Sam Ravnborg wrote:
> >>  Hi Paul.
> >> =

> >>  On Tue, Dec 10, 2019 at 03:41:37PM +0100, Paul Cercueil wrote:
> >>  > Add a compatible string for the LCD controller found in the =

> >> JZ4770 SoC.
> >>  >
> >>  > v2: No change
> >>  >
> >>  > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  > Acked-by: Rob Herring <robh@kernel.org>
> >> =

> >>  Whole series looks good.
> >>  Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > =

> > Paul, looks like you forgot to git commit --amend after adding the =

> > tags.
> > Now the commit messages have and extra "# *** extracted tags ***" in =

> > them.
> =

> Sorry, I'm still relatively new to this :(
> =

> I thought they were going to be automatically removed since they are =

> comments.

They will be of you commit --amend. But not without that.

People tend to typo these things quite often so I made dim extract-tags
rather liberal in what it accepts. And sometimes that means it'll pull
in all kinds of crap when people put a ':' in the wrong place. And
that's the reason I added the extra marker so it's trivial to see what
got pulled in by dim and what was there already. But it does mean you
always have to do the --amend to get rid of the markers.

I guess there are at least two options to improve the situation:
a) make dim extract-tags more strict and risk missing typoed tags
b) make dim push check that there marker has been removed from the
   commit msg

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
