Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C814014A366
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 12:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E645E6EB34;
	Mon, 27 Jan 2020 11:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED3B6EB34
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 11:59:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 03:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="221711981"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 27 Jan 2020 03:59:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Jan 2020 13:59:01 +0200
Date: Mon, 27 Jan 2020 13:59:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200127115901.GC13686@intel.com>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
 <20200126071724.GA3520745@kroah.com>
 <CAMuHMdU32gF89zz86WH3AqkoPK7hdSjWMexJ1aLU9woe0qF0YA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU32gF89zz86WH3AqkoPK7hdSjWMexJ1aLU9woe0qF0YA@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 11:40:24AM +0100, Geert Uytterhoeven wrote:
> Hi Greg,
> =

> On Sun, Jan 26, 2020 at 8:44 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Jan 25, 2020 at 02:55:06PM -0500, Rich Felker wrote:
> > > Signed-off-by: Rich Felker <dalias@libc.org>
> > > --
> >
> > I know I don't accept patches without any changelog text, don't know
> > about other subsystem maintainers...
> =

> FTR, I do, iff the one-line summary says everything that needs to be said.
> =

> What's the point in writing a full paragraph like:
> =

>    Currently the foo driver does not support the bar device.
>    As users may want to use the bar device, it makes perfect sense
>    to add support for the bar device to the foo driver.
>    Hence add support for the bar device to the foo driver.
> =

> if this doesn't add any value on top of the one-line summary?

At least it allows one to reply to *something*. If there's just a
subject line you have zero quoted context for the reply apart from
the patch itself. So rather confusing if you want to comment on
the overall thing rather than on any specific changes in the diff.


The other bad commit message style I dislike is the:

"Subject: Do something...

 ...because whatever."

As if the subject was a part of the first sentence of the commit
message. Often makes replies even more confusing since now you
have just a part of the sentece quoted.

I do understand why new people make this mistake though; There
should probably be a more explicit indication that the first
line is the subject when editing the commit message.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
