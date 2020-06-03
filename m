Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA51EC8B0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 07:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9F16E4BB;
	Wed,  3 Jun 2020 05:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E666E4BA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 05:20:41 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id c15so423419uar.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 22:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2n9BfkEY1rmf3Q835VdRqSJk6hRzkzoIY/yoU4RHHA=;
 b=b5UNG1IYFly/OLvHyUfhEzR8XmniNhg6sJUiGr0ivkHSztACrjiE+l2/t4Oe+hp+ad
 OOPsJYWB2D3PSNIuPNWM6YIzuED55BAkpn18Y7SbavTm0YgaUgrfq0jVAjF7lIaPl/wg
 hczlWn3bsFYaY+ckN/M5tGfVGI6pFpPqB6Q+pVN6LM8at30S+K1KxrgQSVRiwd7FamKh
 UljPcZNBpy4I7sQUtF/Va++fh2ZeIbVwSCQStS21aV67oPRhwHO+1HBoAS+hIyPeF3Zv
 UfwefjQW9zfJNJnRbVxKFv4AHAPTF0QVK0EtHFJu+I5L75LcPFqHWH0R1Y6BsYOckOLx
 L5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2n9BfkEY1rmf3Q835VdRqSJk6hRzkzoIY/yoU4RHHA=;
 b=gPq8Unu4yWm2WGSv8nXdmZpXjw2bvRKKhWFX6mR77i7W0k+40MfllVjC/3/mA7LSOC
 w6O0rLMCdZsWNpCcDAdOjkEeFnYUFCDWr7SMsjZ9GSXlikdBgVdeF0BNgpCfZb1OvNVN
 XHdyLwOyB4X5kba97sr2X22RB9YCzYO/BXAqj7iQpbcAu94cjbBb/dJ0N9UGhLv7n6HN
 8PSl7DNS3a9cHEN0MlpAjZ+ud/lJ8/aJYtBbHHngdlAzSkTXdisUe6TQUpjhV7a64bEY
 fFhpE+LP4B6QgXolfXcjXZA9ZMjWJDKCIukbIELqLwt9k9VH0M9s0G8h4UP4rxDkBUjr
 AtZg==
X-Gm-Message-State: AOAM5324b1TSPOAvoUDcZfaagrXkRoefyc9btj2kbDcJpk6SnvcLhTFA
 EUhwA0/QWhMUid0mPb1/g8AYNvPF9cxA6oT4Wm0=
X-Google-Smtp-Source: ABdhPJzCln5kdfIPLN9AECVaYScJjK6Z+wHJ6JLixSfjgrBHe8Df8U/46roYvX/hGXJ3M+ok8Aoz5blrVbXQOIy/sFU=
X-Received: by 2002:ab0:6855:: with SMTP id a21mr20603850uas.30.1591161639999; 
 Tue, 02 Jun 2020 22:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
 <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
 <20200528154804.02fb8901@eldfell.localdomain>
 <CAL3Fm-Jspwx7=famPO5nOzPwL2wrBnMtZj0FTDjypvwdWZXPiA@mail.gmail.com>
 <20200601114942.5ae2d3ad@eldfell.localdomain>
In-Reply-To: <20200601114942.5ae2d3ad@eldfell.localdomain>
From: Yogish Kulkarni <yogishkulkarni@gmail.com>
Date: Wed, 3 Jun 2020 10:50:28 +0530
Message-ID: <CAL3Fm-K215Ws7y2sA6zFvMUxQCN0G58kWd5uvvT=Bek+LfgLZg@mail.gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1709377278=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1709377278==
Content-Type: multipart/alternative; boundary="000000000000551c1005a7273058"

--000000000000551c1005a7273058
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Inline..

On Mon, Jun 1, 2020 at 2:19 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Mon, 1 Jun 2020 09:22:27 +0530
> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
>
> > Hi,
> >
> > For letting DRM clients to select output encoding:
> > Sink can support certain display timings with high output bit-depths
> using
> > multiple output encodings, e.g. sink can support a particular timing wi=
th
> > RGB 10-bit, YCbCr422 10-bit and YCbCr420 10-bit. So DRM client may want
> to
> > select YCbCr422 10-bit over RBG 10-bit output to reduce the link
> bandwidth
> > (and in turn reduce power/voltage). If DRM driver automatically selects
> > output encoding then we are restricting DRM clients from making
> appropriate
> > choice.
>
> Hi,
>
> right, that seems to be another reason.
>
> > For selectable output color range:
> > Certain applications (typically graphics) usually rendered in full rang=
e
> > while some applications (typically video) have limited range content.
> Since
> > content can change dynamically, DRM driver does not have enough
> information
> > to choose correct quantization. Only DRM client can correctly select
> which
> > quantization to set (to preserve artist's intent).
>
> Now this is an interesting topic for me. As far as I know, there is no
> window system protocol to tell the display server whether the
> application provided content is using full or limited range. This means
> that the display server cannot tell DRM about full vs. limited range
> either. It also means that when not fullscreen, the display server
> cannot show the limited range video content correctly, because it would
> have to be converted to full-range (or vice versa).
>
> Right, but there could be DRM client which doesn't use window system (e.g=
.
Gstreamer video sink) and wants to select between full/limited color range.
I agree that there is no window system protocol yet but maybe Wayland
protocol could be added/extended for this purpose once we finalize things
that needs to be done in DRM.

But why would an application produce limited range pixels anyway? Is it
> common that hardware video decoders are unable to produce full-range
> pixels?
>

The primary reason for why content producer masters video/gfx content as
limited range is for compatibility with sinks which only support limited
range, and not because video decoders are not capable of decoding
full-range content. Also, certain cinema-related content (e.g., movies) may
be better suited for limited range encoding due to the level of detail that
they need to present/hide (see "Why does limited RGB even exist?" section
in
https://www.benq.com/en-us/knowledge-center/knowledge/full-rgb-vs-limited-r=
gb-is-there-a-difference.html#:~:text=3DFull%20RGB%20means%20the%20ability,=
less%20dark)%20than%20full%20RGB
).

I am asking, because I have a request to add limited vs. full range
> information to Wayland.
>
> What about video sinks, including monitors? Are there devices that
> accept limited-range only, full-range only, or switchable?
>

Yes, there are sinks which support selectable quantization range and there
are sinks which don't. If the quantization range is not selectable, then in
general, sources should output full-range for IT timings, and output
limited for CE timings. At a high-level, IT timings are part of a standard
developed by VESA for computer monitor-like displays. CE (Consumer
Electronics) timings are a separate standard for timings more applicable to
sinks like consumer TVs, etc.

>
> Why not just always use full-range everywhere?
>
> Or if a sink supports only limited-range, have the display chip
> automatically convert from full-range, so that software doesn't have to
> convert in software.
>

I think it is ok to convert from limited range to full range in display HW
pipeline. By "automatically" if you mean display HW or DRM driver should
look at the content to figure out whether it is limited range content and
then program display pipeline to do the conversion, I don't think that is a
good idea since we would need to inspect each pixel. Also, there may be
some post-processing done to full-range content that happens to cause the
pixel component values to fall within the limited quantization range. How
about adding a new DRM KMS plane property to let client convey the driver
about input content range? More details on this below.

>
> If you actually have a DRM KMS property for the range, does it mean that:
> - the sink is configured to accept that range, and the pixels in the
>   framebuffer need to comply, or
> - the display chip converts to that range while framebuffer remains in
>   full-range?
>

I would imagine this as:
(1) Add new read DRM KMS connector property which DRM client will read to
know whether sink support selectable quantization range.
(2) Add new read/write DRM KMS connector property which DRM client will
write to set output quantization range and read to know the current output
quantization range.
(3) Add new read/write DRM KMS plane property which DRM client will write
to set input quantization range and read to know the current input
quantization range.

Now lets say if client has limited range content that it wants to display
using limited range, it will perform below steps:
(A) Set plane's input range property to LIMITED.
(B) Set connector's output range property to LIMITED.
(C) Read connector property to know whether sink support selectable
quantization range:
       (i) If no, validate HW timing + output range (LIMITED) using atomic
test commit, if validation doesn't pass, client should choose another HW
timing and revalidate.
       (ii) if yes, it is not necessary to validate HW timing + output
range.

Now lets say if client has limited range content that it wants to display
using full range, it will perform below steps:
(A) Set plane's input range property to LIMITED
(B) Set connector's output range property to FULL
(C) Read connector property to know whether sink support selectable
quantization range:
       (i) if no, validate HW timing + output range (FULL) using atomic
test commit, if validation doesn't pass, client should choose another HW
timing and revalidate
       (ii) if yes, it is not necessary to validate HW timing + output
range.
In this example DRM driver will automatically set up display pipeline to do
limited to full-range conversion.

Out of the three new properties mentioned above there is another choice for
property (1): Instead of expecting client to read whether sink support
selectable quantization range and perform validations as mentioned above
when quantization range is not selectable, how about adding new flags to
drmModeModeInfo->flags and let DRM driver to inform client using this flag
whether given HW timing is supported with full range, limited range or
both? This will avoid validation step mentioned in (C)(i).

Let me know what you think about the overall proposal mentioned above. If
there is no strong disagreement about adding new DRM KMS properties for
output quantization range (and output encoding), I'll plan to start working
on the changes.

Thanks,
-Yogish

>
> If we look at I915 driver's "Broadcast RGB" property, it seems to say
> to me that the framebuffer is always primarily assumed to be in
> full-range, and the conversion to limited-range happens in the scanout
> circuitry. So that property would not help with video content that is
> already in limited-range.
>
> To recap, there are two orthogonal things: application content or
> framebuffer range, and video sink / monitor range. The display server
> between the two, at last if it is a Wayland compositor, would be able to
> convert as necessary.
>
> > For how to use selectable output encoding with Weston:
> > I was thinking that DRM should have separate property to list the
> encodings
> > supported by sink and Weston will present this list to its client. Your
>
> Not client. A configuration tool perhaps, but not generically to all
> Wayland clients, not as a directly settable knob at least.
>
> > idea to validate encodings using TEST_ONLY commit and present a list of
> > timings along with encodings supported by particular timing seems bette=
r.
> > Instead of validating all possible encodings, does it make sense to
> > validate  only those supported by sink? Irrespective of this we would
>
> Yes, having a list of what the sink actually supports would be nice.
>
> As for Wayland clients, there is an extension brewing at
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests=
/8
> that would allow suggesting the optimal encoding (pixel format and
> modifier really) in flight.
>
> That said, we are talking about the two different things here:
> framebuffer format vs. encoding on the wire. Whether making them match
> has benefits is another matter.
>
> > anyway need some mechanism which will allow user to select particular
> > encoding for a particular mode. I was thinking to allow this using new
> DRM
> > property "Encoding". Do you have anything better in mind?
>
> I think that is a reasonable and useful goal and idea. Just remember to
> document it when proposing, even if it seems obvious. The details on
> how to formulate that into UAPI is up for debate.
>
> As said, changing KMS properties after they have been exposed to
> userspace won't really work from either kernel or userspace point of
> view. So you'd probably need to expose one blob type property listing
> the encodings that may work as an array, and another property for
> setting the one to use. IN_FORMATS property is somewhat similar,
> although more complicated because it is the combination of format and
> modifier.
>
> > (Since I am using my Gmail Id, I feel I should mention that I work at
> > Nvidia)
>
> Nice to know the source of interest. :-)
>
>
> Thanks,
> pq
>
> >
> > Thanks,
> > -Yogish
> >
> > On Thu, May 28, 2020 at 6:18 PM Pekka Paalanen <ppaalanen@gmail.com>
> wrote:
> >
> > > On Thu, 28 May 2020 17:38:59 +0530
> > > Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> > >
> > > > I am trying to find a way through Weston which will allow setting
> > > specific
> > > > encoding at display output.
> > >
> > > Hi,
> > >
> > > why do *you* want to control that?
> > >
> > > Why not let the driver always choose the highest possible encoding
> > > given the video mode and hardware capability?
> > >
> > > I can understand userspace wanting to know what it got, but why shoul=
d
> > > userspace be able to control it?
> > >
> > > Would people want to pick the encoding first, and then go for the
> > > highest possible video mode?
> > >
> > > > Could you please elaborate on  why it is best
> > > > to let DRM driver automatically configure which encoding to choose
> rather
> > > > than making it selectable by DRM client ? I am not able to find
> reference
> > > > to past discussion about this. I was only able to find a proposed
> change
> > > -
> > > >
> https://lists.freedesktop.org/archives/intel-gfx/2017-April/125451.html
> > > but
> > > > am not able to find why it got rejected.
> > > >
> > > > Alternatively, is there existing way through which DRM clients can
> > > specify
> > > > preference for output encoding ? Or currently it's all up to the
> DRM
> > > driver
> > > > to choose what output encoding to use.
> > >
> > > There must be some reason why userspace needs to be able to control i=
t.
> > > I'm also asking as a Weston maintainer, since I'm interested in how
> > > this affects e.g. color reproduction or HDR support.
> > >
> > > One thing that comes to my mind is using atomic TEST_ONLY commits to
> > > probe all the possible video modes =C3=97 encodings for presenting a =
list to
> > > the user to choose from, if you have a display configuration GUI. E.g
> > > with some TV use cases, maybe the user wants to avoid sub-sampling, u=
se
> > > the native resolution, but limit refresh rate to what's actually
> > > possible. Or any other combination of the three.
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > > >
> > > > Thanks,
> > > > -Yogish
> > > >
> > > > On Thu, May 28, 2020 at 1:54 PM Daniel Vetter <daniel@ffwll.ch>
> wrote:
> > > >
> > > > > On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote:
> > > > > > For creating new source property, is it good to follow
> > > > > > "drm_mode_create_hdmi_colorspace_property()"  as an example ?
> It
> > > seems
> > > > > that
> > > > > > currently there is no standard DRM property which allows DRM
> client
> > > to
> > > > > set
> > > > > > a specific output encoding (like YUV420, YUV422 etc). Also,
> there is
> > > no
> > > > > > standard property for letting client select YUV/RGB color range=
.
> I
> > > see
> > > > > > there are two ways to introduce new properties, 1. do something
> like
> > > > > > drm_mode_create_hdmi_colorspace_property 2. create custom
> property
> > > > > similar
> > > > > > to "Broadcast RGB". Is there opinion on which is a preferable
> way
> > > to
> > > > > expose
> > > > > > encoding and color rage selection property ?
> > > > >
> > > > > I guess first question is "why?" Thus far we've gone with the
> opinion
> > > that
> > > > > automatically configuring output stuff as much as possible is
> best.
> > > What's
> > > > > the use-case where the driver can't select this?
> > > > > -Daniel
> > >
>
>

--000000000000551c1005a7273058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Inline..</div><div><br></d=
iv><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Jun 1, 2020 at 2:19 PM Pekka Paalanen &lt;<a href=3D"mailto:ppaalanen=
@gmail.com">ppaalanen@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, 1 Jun 2020 09:22:27 +0530<br>
Yogish Kulkarni &lt;<a href=3D"mailto:yogishkulkarni@gmail.com" target=3D"_=
blank">yogishkulkarni@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi,<br>
&gt; <br>
&gt; For letting DRM clients to select output encoding:<br>
&gt; Sink can support certain display timings with high output bit-depths u=
sing<br>
&gt; multiple output encodings, e.g. sink can support a particular timing w=
ith<br>
&gt; RGB 10-bit, YCbCr422 10-bit and YCbCr420 10-bit. So DRM client may wan=
t to<br>
&gt; select YCbCr422 10-bit over RBG 10-bit output to reduce the link bandw=
idth<br>
&gt; (and in turn reduce power/voltage). If DRM driver automatically select=
s<br>
&gt; output encoding then we are restricting DRM clients from making approp=
riate<br>
&gt; choice.<br>
<br>
Hi,<br>
<br>
right, that seems to be another reason.<br>
<br>
&gt; For selectable output color range:<br>
&gt; Certain applications (typically graphics) usually rendered in full ran=
ge<br>
&gt; while some applications (typically video) have limited range content. =
Since<br>
&gt; content can change dynamically, DRM driver does not have enough inform=
ation<br>
&gt; to choose correct quantization. Only DRM client can correctly select w=
hich<br>
&gt; quantization to set (to preserve artist&#39;s intent).<br>
<br>
Now this is an interesting topic for me. As far as I know, there is no<br>
window system protocol to tell the display server whether the<br>
application provided content is using full or limited range. This means<br>
that the display server cannot tell DRM about full vs. limited range<br>
either. It also means that when not fullscreen, the display server<br>
cannot show the limited range video content correctly, because it would<br>
have to be converted to full-range (or vice versa).<br>
<br></blockquote><div>Right, but there could be DRM client which doesn&#39;=
t use window system (e.g. Gstreamer video sink) and wants to select between=
 full/limited color range. I agree that there is no window system protocol =
yet but maybe Wayland protocol could be added/extended for this purpose onc=
e we finalize things that needs to be done in DRM.<br></div><div></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
But why would an application produce limited range pixels anyway? Is it<br>
common that hardware video decoders are unable to produce full-range<br>
pixels?<br></blockquote><div><br></div><div>The primary reason for why cont=
ent producer masters video/gfx content as limited range is for compatibilit=
y with sinks which only support limited range, and not because video decode=
rs are not capable of decoding full-range content. Also, certain cinema-rel=
ated content (e.g., movies) may be better suited for limited range encoding=
 due to the level of detail that they need to present/hide (see &quot;Why d=
oes limited RGB even exist?&quot; section in <a href=3D"https://www.benq.co=
m/en-us/knowledge-center/knowledge/full-rgb-vs-limited-rgb-is-there-a-diffe=
rence.html#:~:text=3DFull%20RGB%20means%20the%20ability,less%20dark)%20than=
%20full%20RGB">https://www.benq.com/en-us/knowledge-center/knowledge/full-r=
gb-vs-limited-rgb-is-there-a-difference.html#:~:text=3DFull%20RGB%20means%2=
0the%20ability,less%20dark)%20than%20full%20RGB</a>).<br></div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
I am asking, because I have a request to add limited vs. full range<br>
information to Wayland.<br>
<br>
What about video sinks, including monitors? Are there devices that<br>
accept limited-range only, full-range only, or switchable?<br></blockquote>=
<div>=C2=A0</div><div>Yes, there are sinks which support selectable quantiz=
ation range and there are sinks which don&#39;t. If the quantization range =
is not selectable, then in general, sources should output full-range for IT=
 timings, and output limited for CE timings. At a high-level, IT timings ar=
e part of a standard developed by VESA for computer monitor-like displays. =
CE (Consumer Electronics) timings are a separate standard for timings more =
applicable to sinks like consumer TVs, etc. <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Why not just always use full-range everywhere?<br>
<br>
Or if a sink supports only limited-range, have the display chip<br>
automatically convert from full-range, so that software doesn&#39;t have to=
<br>
convert in software.<br></blockquote><div><br></div><div>I think it is ok t=
o convert from limited range to full range in display HW pipeline. By &quot=
;automatically&quot; if you mean display HW or DRM driver should look at th=
e content to figure out whether it is limited range content and then progra=
m display pipeline to do the conversion, I don&#39;t think that is a good i=
dea since we would need to inspect each pixel. Also, there may be some post=
-processing done to full-range content that happens to cause the pixel comp=
onent values to fall within the limited quantization range. How about addin=
g a new DRM KMS plane property to let client convey the driver about input =
content range? More details on this below.<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
If you actually have a DRM KMS property for the range, does it mean that:<b=
r>
- the sink is configured to accept that range, and the pixels in the<br>
=C2=A0 framebuffer need to comply, or<br>
- the display chip converts to that range while framebuffer remains in<br>
=C2=A0 full-range?<br></blockquote><div><br></div><div>I would imagine this=
 as:</div><div>(1) Add new read DRM KMS connector property which DRM client=
 will read to know whether sink support selectable quantization range.</div=
><div>(2) Add new read/write DRM KMS connector property which DRM client wi=
ll write to set output quantization range and read to know the current outp=
ut quantization range.</div><div>(3) Add new read/write DRM KMS plane prope=
rty which DRM client will write to set input quantization range and read to=
 know the current input quantization range.<br></div><div><br></div><div>No=
w lets say if client has limited range content that it wants to display usi=
ng limited range, it will perform below steps:</div><div>(A) Set plane&#39;=
s input range property to LIMITED.</div><div>(B) Set connector&#39;s output=
 range property to LIMITED.<br></div><div>(C) Read connector property to kn=
ow whether sink support selectable quantization range:</div><div>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (i) If no, validate HW timing + output range (L=
IMITED) using atomic test commit, if validation doesn&#39;t pass, client sh=
ould choose another HW timing and revalidate.</div><div>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (ii) if yes, it is not necessary to validate HW timing +=
 output range.</div><div><br></div><div>Now lets say if client has limited =
range content that it wants to display using full range, it will perform be=
low steps:</div><div>(A) Set plane&#39;s input range property to LIMITED</d=
iv><div>(B) Set connector&#39;s output range property to FULL</div><div>(C)=
 Read connector property to know whether sink support selectable quantizati=
on range:</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (i) if no, validat=
e HW timing + output range (FULL) using atomic test commit, if validation d=
oesn&#39;t pass, client should choose another HW timing and revalidate</div=
><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ii)  if yes, it is not necessar=
y to validate HW timing + output range.</div><div>In this example DRM drive=
r will automatically set up display pipeline to do limited to full-range co=
nversion.<br></div><div></div><div><br></div><div>Out of the three new prop=
erties mentioned above there is another choice for property (1): Instead of=
 expecting client to read whether sink support selectable quantization rang=
e and perform validations as mentioned above when quantization range is not=
 selectable, how about adding new flags to<span style=3D"font-family:Calibr=
i,Arial,Helvetica,sans-serif;background-color:white"> drmModeModeInfo-&gt;f=
lags and let DRM driver to inform client using this flag whether given HW t=
iming is supported with full range, limited range or both? This will avoid =
validation step mentioned in (C)(i). <br></span></div><div><span style=3D"f=
ont-family:Calibri,Arial,Helvetica,sans-serif;background-color:white"><br><=
/span></div><div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-se=
rif;background-color:white">Let me know what you think about the overall pr=
oposal mentioned above. If there is no strong disagreement about adding new=
 DRM KMS properties for output quantization range (and output encoding), I&=
#39;ll plan to start working on the changes.<br></span></div><div><span sty=
le=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-color:white=
"><br></span></div><div><span style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif;background-color:white">Thanks,</span></div><div><span style=3D"=
font-family:Calibri,Arial,Helvetica,sans-serif;background-color:white">-Yog=
ish<br></span></div><div></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
If we look at I915 driver&#39;s &quot;Broadcast RGB&quot; property, it seem=
s to say<br>
to me that the framebuffer is always primarily assumed to be in<br>
full-range, and the conversion to limited-range happens in the scanout<br>
circuitry. So that property would not help with video content that is<br>
already in limited-range.<br>
<br>
To recap, there are two orthogonal things: application content or<br>
framebuffer range, and video sink / monitor range. The display server<br>
between the two, at last if it is a Wayland compositor, would be able to<br=
>
convert as necessary.<br>
<br>
&gt; For how to use selectable output encoding with Weston:<br>
&gt; I was thinking that DRM should have separate property to list the enco=
dings<br>
&gt; supported by sink and Weston will present this list to its client. You=
r<br>
<br>
Not client. A configuration tool perhaps, but not generically to all<br>
Wayland clients, not as a directly settable knob at least.<br>
<br>
&gt; idea to validate encodings using TEST_ONLY commit and present a list o=
f<br>
&gt; timings along with encodings supported by particular timing seems bett=
er.<br>
&gt; Instead of validating all possible encodings, does it make sense to<br=
>
&gt; validate=C2=A0 only those supported by sink? Irrespective of this we w=
ould<br>
<br>
Yes, having a list of what the sink actually supports would be nice.<br>
<br>
As for Wayland clients, there is an extension brewing at<br>
<a href=3D"https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge=
_requests/8" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskto=
p.org/wayland/wayland-protocols/-/merge_requests/8</a><br>
that would allow suggesting the optimal encoding (pixel format and<br>
modifier really) in flight.<br>
<br>
That said, we are talking about the two different things here:<br>
framebuffer format vs. encoding on the wire. Whether making them match<br>
has benefits is another matter.<br>
<br>
&gt; anyway need some mechanism which will allow user to select particular<=
br>
&gt; encoding for a particular mode. I was thinking to allow this using new=
 DRM<br>
&gt; property &quot;Encoding&quot;. Do you have anything better in mind?<br=
>
<br>
I think that is a reasonable and useful goal and idea. Just remember to<br>
document it when proposing, even if it seems obvious. The details on<br>
how to formulate that into UAPI is up for debate.<br>
<br>
As said, changing KMS properties after they have been exposed to<br>
userspace won&#39;t really work from either kernel or userspace point of<br=
>
view. So you&#39;d probably need to expose one blob type property listing<b=
r>
the encodings that may work as an array, and another property for<br>
setting the one to use. IN_FORMATS property is somewhat similar,<br>
although more complicated because it is the combination of format and<br>
modifier.<br>
<br>
&gt; (Since I am using my Gmail Id, I feel I should mention that I work at<=
br>
&gt; Nvidia)<br>
<br>
Nice to know the source of interest. :-)<br>
<br>
<br>
Thanks,<br>
pq<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -Yogish<br>
&gt; <br>
&gt; On Thu, May 28, 2020 at 6:18 PM Pekka Paalanen &lt;<a href=3D"mailto:p=
paalanen@gmail.com" target=3D"_blank">ppaalanen@gmail.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt; &gt; On Thu, 28 May 2020 17:38:59 +0530<br>
&gt; &gt; Yogish Kulkarni &lt;<a href=3D"mailto:yogishkulkarni@gmail.com" t=
arget=3D"_blank">yogishkulkarni@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; I am trying to find a way through Weston which will allow se=
tting=C2=A0 <br>
&gt; &gt; specific=C2=A0 <br>
&gt; &gt; &gt; encoding at display output.=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; why do *you* want to control that?<br>
&gt; &gt;<br>
&gt; &gt; Why not let the driver always choose the highest possible encodin=
g<br>
&gt; &gt; given the video mode and hardware capability?<br>
&gt; &gt;<br>
&gt; &gt; I can understand userspace wanting to know what it got, but why s=
hould<br>
&gt; &gt; userspace be able to control it?<br>
&gt; &gt;<br>
&gt; &gt; Would people want to pick the encoding first, and then go for the=
<br>
&gt; &gt; highest possible video mode?<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Could you please elaborate on=C2=A0 why it is best<br>
&gt; &gt; &gt; to let DRM driver automatically configure which encoding to =
choose rather<br>
&gt; &gt; &gt; than making it selectable by DRM client ? I am not able to f=
ind reference<br>
&gt; &gt; &gt; to past discussion about this. I was only able to find a pro=
posed change=C2=A0 <br>
&gt; &gt; -=C2=A0 <br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/intel-gfx/=
2017-April/125451.html" rel=3D"noreferrer" target=3D"_blank">https://lists.=
freedesktop.org/archives/intel-gfx/2017-April/125451.html</a>=C2=A0 <br>
&gt; &gt; but=C2=A0 <br>
&gt; &gt; &gt; am not able to find why it got rejected.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Alternatively, is there existing way through which DRM clien=
ts can=C2=A0 <br>
&gt; &gt; specify=C2=A0 <br>
&gt; &gt; &gt; preference for output encoding ? Or currently it&#39;s all u=
p to the DRM=C2=A0 <br>
&gt; &gt; driver=C2=A0 <br>
&gt; &gt; &gt; to choose what output encoding to use.=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; There must be some reason why userspace needs to be able to contr=
ol it.<br>
&gt; &gt; I&#39;m also asking as a Weston maintainer, since I&#39;m interes=
ted in how<br>
&gt; &gt; this affects e.g. color reproduction or HDR support.<br>
&gt; &gt;<br>
&gt; &gt; One thing that comes to my mind is using atomic TEST_ONLY commits=
 to<br>
&gt; &gt; probe all the possible video modes =C3=97 encodings for presentin=
g a list to<br>
&gt; &gt; the user to choose from, if you have a display configuration GUI.=
 E.g<br>
&gt; &gt; with some TV use cases, maybe the user wants to avoid sub-samplin=
g, use<br>
&gt; &gt; the native resolution, but limit refresh rate to what&#39;s actua=
lly<br>
&gt; &gt; possible. Or any other combination of the three.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; pq<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; -Yogish<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, May 28, 2020 at 1:54 PM Daniel Vetter &lt;<a href=3D=
"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<b=
r>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkar=
ni wrote:=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; For creating new source property, is it good to fo=
llow<br>
&gt; &gt; &gt; &gt; &gt; &quot;drm_mode_create_hdmi_colorspace_property()&q=
uot;=C2=A0 as an example ? It=C2=A0 <br>
&gt; &gt; seems=C2=A0 <br>
&gt; &gt; &gt; &gt; that=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; currently there is no standard DRM property which =
allows DRM client=C2=A0 <br>
&gt; &gt; to=C2=A0 <br>
&gt; &gt; &gt; &gt; set=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; a specific output encoding (like YUV420, YUV422 et=
c). Also, there is=C2=A0 <br>
&gt; &gt; no=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; standard property for letting client select YUV/RG=
B color range. I=C2=A0 <br>
&gt; &gt; see=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; there are two ways to introduce new properties, 1.=
 do something like<br>
&gt; &gt; &gt; &gt; &gt; drm_mode_create_hdmi_colorspace_property 2. create=
 custom property=C2=A0 <br>
&gt; &gt; &gt; &gt; similar=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; to &quot;Broadcast RGB&quot;. Is there opinion on =
which is a preferable way=C2=A0 <br>
&gt; &gt; to=C2=A0 <br>
&gt; &gt; &gt; &gt; expose=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; encoding and color rage selection property ?=C2=A0=
 <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I guess first question is &quot;why?&quot; Thus far we&=
#39;ve gone with the opinion=C2=A0 <br>
&gt; &gt; that=C2=A0 <br>
&gt; &gt; &gt; &gt; automatically configuring output stuff as much as possi=
ble is best.=C2=A0 <br>
&gt; &gt; What&#39;s=C2=A0 <br>
&gt; &gt; &gt; &gt; the use-case where the driver can&#39;t select this?<br=
>
&gt; &gt; &gt; &gt; -Daniel=C2=A0 <br>
&gt; &gt;=C2=A0 <br>
<br>
</blockquote></div></div></div>

--000000000000551c1005a7273058--

--===============1709377278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1709377278==--
