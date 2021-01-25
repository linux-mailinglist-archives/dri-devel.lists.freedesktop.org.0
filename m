Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FA3024A9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 13:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333B189C88;
	Mon, 25 Jan 2021 12:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F80289C88
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 12:09:42 +0000 (UTC)
IronPort-SDR: j3LHJqY8OgzsSxVtc92RG+zXk43L5kE6XE4mI/ajH9iYypIfbqj9UY2z+uoFMP/gQT9l5vO6MQ
 bY1jOSwTlNxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="264537617"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="264537617"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 04:09:41 -0800
IronPort-SDR: UZdLQCt/K3Q0auGZyXchkLr+mb13dpfzJrmqYdNyO132XNV4Rxhdjg+UnTl1RS1A/jFy7StBqZ
 JycaSoCmFh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="393324909"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 25 Jan 2021 04:09:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Jan 2021 14:09:37 +0200
Date: Mon, 25 Jan 2021 14:09:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <YA61Aa07PhDucMyG@intel.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 24, 2021 at 10:04:54PM +0100, Mario Kleiner wrote:
> On Sun, Jan 24, 2021 at 9:24 PM Simon Ser <contact@emersion.fr> wrote:
> =

> > On Sunday, January 24th, 2021 at 9:10 PM, Mario Kleiner <
> > mario.kleiner.de@gmail.com> wrote:
> >
> > > But it still needs to be fixed if we want working HDR. I thought
> > > libdrm copies the definitions from the kernel periodically, so the
> > > fix should propagate?
> >
> > There will always be user-space that sends 1 instead of 0. This
> > shouldn't fail on more recent kernels or it will be a regression.
> >
> =

> Yes, i know, regressing user-space is bad, but in this very specific case=
 a
> "good" one, if ever. At the moment, it wouldn't regress userspace simply
> because the kernel doesn't actually check for the correct value in its HDR
> metadata handling. But the value itself is sent as HDMI HDR metadata to t=
he
> attached HDR display monitor, so if the monitors firmware checks, it will
> classify the wrong value of 1 as invalid and disable HDR mode on the
> display, which is certainly not what a HDR client application wants. And
> future HDR standards which will actually allocate the value 1 to a
> different mode of HDR operation will switch to the wrong mode /
> misinterpret the sent HDR metadata with hillarious results, which is also
> not in the interest of a HDR client application, or a HDR capable
> compositor.
> =

> Iow. if clients continue to use the wrong value 1 then HDR display will
> break in various ways on correctly implemented HDR displays, but in a
> mystifying and hard to debug way. The kernel rejecting a wrong setting
> explicitly and forcing a bug fix in the client would be a blessing in this
> case.
> =

> I spent weeks last year, going in circles and hunting ghost bugs related =
to
> HDR because much of the HDR stuff, both drivers and monitor firmware seems
> to be in not a great shape. "Less wrong" would be a big step forward.
> Especially with the cheaper HDR monitors it is difficult to see when thin=
gs
> go wrong, because we don't have good expectations on how proper HDR should
> look and the lower end HDR displays don't help.

This is not an uapi defintion anyway so fixing should be fine.
I don't think we even check any of the client provided values, or do we?
EOTF I think we do check, but IMO that check should probably just be
nuked as well if we don't bother checking anything else.

I was in fact going to suggest nuking this entire hdr_sink_metadata
parsing as unused, but looks like amdgpu has started to use it for
some backlight stuff of all things.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
