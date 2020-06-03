Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35611ECD05
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 11:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5D289BA9;
	Wed,  3 Jun 2020 09:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124E889BA9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 09:57:23 +0000 (UTC)
IronPort-SDR: IyYHsDW4PZvBaOxcJFikPKiVNXTfj7fQTkSb1H+O8Fkwq6gsbo1f1tjkqgRQZoQMYYw660fJLy
 wPmbTZYltHqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 02:57:22 -0700
IronPort-SDR: QUp6JLvgRTCZthVbgolVtkmdiwIduoRsk1B4rKdMoxSwqKv45yWr+nFTYTDNhAG+dWdhp2eSeK
 8WN6Dt6C432w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="312551098"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 03 Jun 2020 02:57:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jun 2020 12:57:19 +0300
Date: Wed, 3 Jun 2020 12:57:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
Message-ID: <20200603095719.GM6112@intel.com>
References: <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
 <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
 <20200528154804.02fb8901@eldfell.localdomain>
 <CAL3Fm-Jspwx7=famPO5nOzPwL2wrBnMtZj0FTDjypvwdWZXPiA@mail.gmail.com>
 <20200601114942.5ae2d3ad@eldfell.localdomain>
 <CAL3Fm-K215Ws7y2sA6zFvMUxQCN0G58kWd5uvvT=Bek+LfgLZg@mail.gmail.com>
 <20200603121223.70fe0416@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603121223.70fe0416@eldfell.localdomain>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Yogish Kulkarni <yogishkulkarni@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 12:12:23PM +0300, Pekka Paalanen wrote:
> On Wed, 3 Jun 2020 10:50:28 +0530
> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> =

> > Inline..
> > =

> > On Mon, Jun 1, 2020 at 2:19 PM Pekka Paalanen <ppaalanen@gmail.com> wro=
te:
> > =

> > > On Mon, 1 Jun 2020 09:22:27 +0530
> > > Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> > >  =

> > > > Hi,
> > > >
> > > > For letting DRM clients to select output encoding:
> > > > Sink can support certain display timings with high output bit-depth=
s  =

> > > using  =

> > > > multiple output encodings, e.g. sink can support a particular timin=
g with
> > > > RGB 10-bit, YCbCr422 10-bit and YCbCr420 10-bit. So DRM client may =
want  =

> > > to  =

> > > > select YCbCr422 10-bit over RBG 10-bit output to reduce the link  =

> > > bandwidth  =

> > > > (and in turn reduce power/voltage). If DRM driver automatically sel=
ects
> > > > output encoding then we are restricting DRM clients from making  =

> > > appropriate  =

> > > > choice.  =

> > >
> > > Hi,
> > >
> > > right, that seems to be another reason.
> > >  =

> > > > For selectable output color range:
> > > > Certain applications (typically graphics) usually rendered in full =
range
> > > > while some applications (typically video) have limited range conten=
t.  =

> > > Since  =

> > > > content can change dynamically, DRM driver does not have enough  =

> > > information  =

> > > > to choose correct quantization. Only DRM client can correctly selec=
t  =

> > > which  =

> > > > quantization to set (to preserve artist's intent).  =

> > >
> > > Now this is an interesting topic for me. As far as I know, there is no
> > > window system protocol to tell the display server whether the
> > > application provided content is using full or limited range. This mea=
ns
> > > that the display server cannot tell DRM about full vs. limited range
> > > either. It also means that when not fullscreen, the display server
> > > cannot show the limited range video content correctly, because it wou=
ld
> > > have to be converted to full-range (or vice versa).
> > >
> > Right, but there could be DRM client which doesn't use window system (e=
.g.  =

> > Gstreamer video sink) and wants to select between full/limited color ra=
nge.
> > I agree that there is no window system protocol yet but maybe Wayland
> > protocol could be added/extended for this purpose once we finalize thin=
gs
> > that needs to be done in DRM.
> =

> Hi,
> =

> right. If you have that use case and a userspace project welcomes such
> feature, you're good.
> =

> If you propose a KMS property for this, I would hope the patches
> document or have links pointing to answers to all my questions here.
> That would help both driver and userspace implementations to get into
> the same mindset.
> =

> > > But why would an application produce limited range pixels anyway? Is =
it
> > > common that hardware video decoders are unable to produce full-range
> > > pixels?
> > >  =

> > =

> > The primary reason for why content producer masters video/gfx content as
> > limited range is for compatibility with sinks which only support limited
> > range, and not because video decoders are not capable of decoding
> > full-range content.
> =

> What I was asking is, even if the video content is limited range, why
> would one not decode it into full-range pixels always and if the sink
> need limited range, then convert again in hardware? When done right, it
> makes no difference in output compared to using limited range
> through-out if both content and sink use limited range.
> =

> > Also, certain cinema-related content (e.g., movies) may
> > be better suited for limited range encoding due to the level of detail =
that
> > they need to present/hide (see "Why does limited RGB even exist?" secti=
on
> > in
> > https://www.benq.com/en-us/knowledge-center/knowledge/full-rgb-vs-limit=
ed-rgb-is-there-a-difference.html#:~:text=3DFull%20RGB%20means%20the%20abil=
ity,less%20dark)%20than%20full%20RGB
> > ).
> =

> That is a very nice link, thanks!
> =

> But to me it seems the section "Why is this a problem?" gets "crushed
> blacks" backwards, so maybe I just don't get it.
> =

> I would assume that if the source (computer) sends full-range pixel
> values on the wire and the sink (monitor) works in limited-range mode,
> then you would get crushed blacks and crushed whites.
> =

> But if the source sends limited-range data and the sink works in
> full-range more, you'd get the "washed out" image.
> =

> My thinking comes from the mapping of channel values: if 0-16 and
> 235-255 ranges show no difference within them, I'd call that "crushed".
> Similarly if one assumes 16 is darkest black and it's actually not,
> you'd get "washed out" (I might call it compressed instead, because it
> affects both black and white ends, unable to achieve both the darkest
> black and the brightest white).
> =

> Anyway, I believe I do understand that if you have content in one
> range and the sink assumes a different range, the content will show
> poorly. I don't doubt that.
> =

> My question instead is: why would it be bad to always convert
> everything to full-range inside the source (e.g. decoder -> app ->
> display server all in full-range), and then convert for the wire into
> what the sink expects?
> =

> Because that is how Wayland color management is going to handle
> differing color spaces, more or less. (Actually, quite likely the
> compositor internal per-output color space will be the sink's color
> space but in linear encoding (e.g. fp16 data type) for proper blending.)
> =

> > > I am asking, because I have a request to add limited vs. full range
> > > information to Wayland.
> > >
> > > What about video sinks, including monitors? Are there devices that
> > > accept limited-range only, full-range only, or switchable?
> > >  =

> > =

> > Yes, there are sinks which support selectable quantization range and th=
ere
> > are sinks which don't. If the quantization range is not selectable, the=
n in
> > general, sources should output full-range for IT timings, and output
> > limited for CE timings. At a high-level, IT timings are part of a stand=
ard
> > developed by VESA for computer monitor-like displays. CE (Consumer
> > Electronics) timings are a separate standard for timings more applicabl=
e to
> > sinks like consumer TVs, etc.
> =

> Very good. How is this achieved with KMS today? Does the kernel driver
> automatically make the display chip convert to full-range or
> limited-range based on the mode information?
> =

> Or is this something that simply doesn't exist yet, and it needs
> userspace to make the decision on which range to program the display
> hardware to emit into the wire? Hence the need for a range property.

At least i915 handles it all automagically. Older hw generations are
nicer and have a simple bit to tell the hardware to do the full->limited
range compression, or modern hw we use the csc matrix to achieve the
same result. The latter does cause some headaches when this gets
combined with user provided gamma/degamma/ctm, and I think we still
get some of the more esoteric combinations wrong.

A few years back there was a proposal to extend the 'Broadcast RGB'
range prop with a new knob to allow passthrough limited range content
(ie. no range compression done during scanout, but sink gets told =

the content is limited range), but it fell through the cracks.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
