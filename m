Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C91ED743
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 22:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A94489CBC;
	Wed,  3 Jun 2020 20:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC08C89CBC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=RCSYinieiPZVhwrn1RG6ZKU/ET5GhWzvGVR6I+BXBmI=;
 b=ci5tFHP4q9aCEhY/wfamq6niF8ubZPdugu3Kwlr8l6PxY7vms5dQul1hYZbTTYPeGw5A
 1RpTth0YhSRCFeKRZFBEREVUtb+p5P4Ko84SPnGJEJlgMc2yS6wTsEC0h9uV6nprDqelta
 cPuGsMqkh6UMaBZ/0ujQMcG9N00X9+5W8=
Received: by filter0073p3las1.sendgrid.net with SMTP id
 filter0073p3las1-5471-5ED8061C-1B
 2020-06-03 20:20:44.189281409 +0000 UTC m=+75442.288620736
Received: from [192.168.1.14] (unknown)
 by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
 id y4c-UXckSVCGZ2TvtQ6oVg Wed, 03 Jun 2020 20:20:43.633 +0000 (UTC)
Subject: Re: Dynamically change enumeration list of DRM enumeration property
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
 <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
 <20200528154804.02fb8901@eldfell.localdomain>
 <CAL3Fm-Jspwx7=famPO5nOzPwL2wrBnMtZj0FTDjypvwdWZXPiA@mail.gmail.com>
 <20200601114942.5ae2d3ad@eldfell.localdomain>
 <CAL3Fm-K215Ws7y2sA6zFvMUxQCN0G58kWd5uvvT=Bek+LfgLZg@mail.gmail.com>
 <20200603121223.70fe0416@eldfell.localdomain>
From: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <9f8d8c47-e8a0-d3ea-a913-db550199d31f@kwiboo.se>
Date: Wed, 03 Jun 2020 20:20:44 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603121223.70fe0416@eldfell.localdomain>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h7n3jstSsVcPeddlI?=
 =?us-ascii?Q?bUlMPSoetaUlDIsh1DWb3DpVGitlYwl2MutCou=2F?=
 =?us-ascii?Q?Wr1NILXoEHSLPg6v4viYcduzPOpHLumWo7l6TbU?=
 =?us-ascii?Q?OXzkYHUJSI59C8yul+kepfJds9CC4gpz=2FbKZROD?=
 =?us-ascii?Q?xGYF3E0RyA1JCfweleDWk7keWTTnShhPBFsLiU?=
To: Pekka Paalanen <ppaalanen@gmail.com>, Yogish Kulkarni
 <yogishkulkarni@gmail.com>
Content-Language: sv
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2020-06-03 11:12, Pekka Paalanen wrote:
> On Wed, 3 Jun 2020 10:50:28 +0530
> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> =

>> Inline..
>>
>> On Mon, Jun 1, 2020 at 2:19 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
>>
>>> On Mon, 1 Jun 2020 09:22:27 +0530
>>> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
>>>  =

>>>> Hi,
>>>>
>>>> For letting DRM clients to select output encoding:
>>>> Sink can support certain display timings with high output bit-depths  =

>>> using  =

>>>> multiple output encodings, e.g. sink can support a particular timing w=
ith
>>>> RGB 10-bit, YCbCr422 10-bit and YCbCr420 10-bit. So DRM client may wan=
t  =

>>> to  =

>>>> select YCbCr422 10-bit over RBG 10-bit output to reduce the link  =

>>> bandwidth  =

>>>> (and in turn reduce power/voltage). If DRM driver automatically selects
>>>> output encoding then we are restricting DRM clients from making  =

>>> appropriate  =

>>>> choice.  =

>>>
>>> Hi,
>>>
>>> right, that seems to be another reason.
>>>  =

>>>> For selectable output color range:
>>>> Certain applications (typically graphics) usually rendered in full ran=
ge
>>>> while some applications (typically video) have limited range content.  =

>>> Since  =

>>>> content can change dynamically, DRM driver does not have enough  =

>>> information  =

>>>> to choose correct quantization. Only DRM client can correctly select  =

>>> which  =

>>>> quantization to set (to preserve artist's intent).  =

>>>
>>> Now this is an interesting topic for me. As far as I know, there is no
>>> window system protocol to tell the display server whether the
>>> application provided content is using full or limited range. This means
>>> that the display server cannot tell DRM about full vs. limited range
>>> either. It also means that when not fullscreen, the display server
>>> cannot show the limited range video content correctly, because it would
>>> have to be converted to full-range (or vice versa).
>>>
>> Right, but there could be DRM client which doesn't use window system (e.=
g.  =

>> Gstreamer video sink) and wants to select between full/limited color ran=
ge.
>> I agree that there is no window system protocol yet but maybe Wayland
>> protocol could be added/extended for this purpose once we finalize things
>> that needs to be done in DRM.
> =

> Hi,
> =

> right. If you have that use case and a userspace project welcomes such
> feature, you're good.

Kodi is a userspace application that is very interested in being able to
control or set preferred HDMI output format (rgb444/yuv444/422/420) and
quantization range (full/limited).

Main reason is to allow end-users to make overrides when sink EDID don't
fully match the TV/AVR features or when drm driver makes a bad automatic
choice. Hans Verkuil's conclusion in HDMI RGB Quantization Range Lessons
at [1] hold ture, it is total chaos.

Right now, Kodi set the COLOR_ENCODING and COLOR_RANGE plane properties
to let kernel know color encoding and color range of a YUV framebuffer.

A single active plane showing a YUV framebuffer with limited range
could hint a drm driver that end-user might want to use YUV and limited
range output to prevent any banding effect when watching a movie.
But in the case of when there is a second overlay plane for OSD or subtitles
it may become very hard to guess what configuration works best for end-user.

I have piggybacked on the "content type" connector property in [2] for my
personal use to signal my drm driver if YUV (Movie) or RGB (Graphics) output
is preferred this far but proper drm properties would really help :-)

[1] https://elinux.org/images/5/53/Elce2017_0-hdmi.pdf
[2] https://github.com/xbmc/xbmc/pull/14358

> =

> If you propose a KMS property for this, I would hope the patches
> document or have links pointing to answers to all my questions here.
> That would help both driver and userspace implementations to get into
> the same mindset.
> =

>>> But why would an application produce limited range pixels anyway? Is it
>>> common that hardware video decoders are unable to produce full-range
>>> pixels?
>>>  =

>>
>> The primary reason for why content producer masters video/gfx content as
>> limited range is for compatibility with sinks which only support limited
>> range, and not because video decoders are not capable of decoding
>> full-range content.
> =

> What I was asking is, even if the video content is limited range, why
> would one not decode it into full-range pixels always and if the sink
> need limited range, then convert again in hardware? When done right, it
> makes no difference in output compared to using limited range
> through-out if both content and sink use limited range.

For the Allwinner/Amlogic/Rockchip arm devices I mainly play with the
video decoder does not support range conversion (to my knowledge) and will
produce NV12/YU12 framebuffers in the range the video was encoded in.

These devices typically lack a high-performance GPU/3D-accelerator
and may have limited CSC capabilities in the display controller.
The HDMI block can usually do simple RGB/YUV and full/limited conversions,
but using these conversions typically produce banding effects.

Being able to passthrough decoded framebuffers in the entire pipeline from
decoder, display controller and hdmi block typically produce best results.

Regards,
Jonas

> =

>> Also, certain cinema-related content (e.g., movies) may
>> be better suited for limited range encoding due to the level of detail t=
hat
>> they need to present/hide (see "Why does limited RGB even exist?" section
>> in
>> https://www.benq.com/en-us/knowledge-center/knowledge/full-rgb-vs-limite=
d-rgb-is-there-a-difference.html#:~:text=3DFull%20RGB%20means%20the%20abili=
ty,less%20dark
>> ).
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

>>> I am asking, because I have a request to add limited vs. full range
>>> information to Wayland.
>>>
>>> What about video sinks, including monitors? Are there devices that
>>> accept limited-range only, full-range only, or switchable?
>>>  =

>>
>> Yes, there are sinks which support selectable quantization range and the=
re
>> are sinks which don't. If the quantization range is not selectable, then=
 in
>> general, sources should output full-range for IT timings, and output
>> limited for CE timings. At a high-level, IT timings are part of a standa=
rd
>> developed by VESA for computer monitor-like displays. CE (Consumer
>> Electronics) timings are a separate standard for timings more applicable=
 to
>> sinks like consumer TVs, etc.
> =

> Very good. How is this achieved with KMS today? Does the kernel driver
> automatically make the display chip convert to full-range or
> limited-range based on the mode information?
> =

> Or is this something that simply doesn't exist yet, and it needs
> userspace to make the decision on which range to program the display
> hardware to emit into the wire? Hence the need for a range property.
> =

>>>
>>> Why not just always use full-range everywhere?
>>>
>>> Or if a sink supports only limited-range, have the display chip
>>> automatically convert from full-range, so that software doesn't have to
>>> convert in software.
>>>  =

>>
>> I think it is ok to convert from limited range to full range in display =
HW
>> pipeline.
> =

> But that is a conversion that would practically never be used at that
> point in the pipeline. If a display server works internally
> (composites) in limited range, it means it will always lose detail from
> full-range applications, regardless of whether the monitor is full- or
> limited-range. The display server must always work in full-range (or
> monitor's range) to avoid that. If the sink/monitor accepts only
> limited-range, then convert full-range to limited-range as the very last
> step.
> =

> If the sink accepts only limited-range, then necessarily it cannot
> present full-range content accurately and loss of detail is
> unavoidable, so the lossy conversion at scanout is ok.
> =

>> By "automatically" if you mean display HW or DRM driver should
>> look at the content to figure out whether it is limited range content and
>> then program display pipeline to do the conversion, I don't think that i=
s a
>> good idea since we would need to inspect each pixel. Also, there may be
>> some post-processing done to full-range content that happens to cause the
>> pixel component values to fall within the limited quantization range. How
>> about adding a new DRM KMS plane property to let client convey the driver
>> about input content range? More details on this below.
> =

> Sorry, a bad choice of word.
> =

> I mean "automatically" in the sense that the display server (or KMS
> app) inspects the sink properties and sets up the display scanout
> pipeline to convert to the right range. Then the display server does
> not need to care about compositing in limited-range or to tell apps to
> produce content in limited-range.
> =

>>>
>>> If you actually have a DRM KMS property for the range, does it mean tha=
t:
>>> - the sink is configured to accept that range, and the pixels in the
>>>   framebuffer need to comply, or
>>> - the display chip converts to that range while framebuffer remains in
>>>   full-range?
>>>  =

>>
>> I would imagine this as:
>> (1) Add new read DRM KMS connector property which DRM client will read to
>> know whether sink support selectable quantization range.
> =

> Good.
> =

>> (2) Add new read/write DRM KMS connector property which DRM client will
>> write to set output quantization range and read to know the current outp=
ut
>> quantization range.
> =

> Yes, programming the sink's expectation is good.
> =

> Btw. just in case, try not to create KMS properties that are both
> writable by userspace and arbitrarily writable by the kernel as well.
> It often leads to awkward or racy usage patterns. If the read and write
> values are completely disconnected, it also might make blind KMS state
> save/restore impossible. Blind KMS state save/restore is necessary for
> KMS apps and display servers to ensure they continue running with the
> same KMS state they had before, e.g. after VT-switching or reboot, even
> if there are writable properties they do not recognise.
> =

> If it's just reading back what userspace last wrote, it's good.
> =

>> (3) Add new read/write DRM KMS plane property which DRM client will write
>> to set input quantization range and read to know the current input
>> quantization range.
> =

> Ok, so these two properties together would define what automatic
> conversion the display chip does to framebuffer content during scanout.
> =

> But there are already other ways too, DEGAMMA/GAMMA LUTs or CTM could
> be used for it already. Is there a benefit from adding more ways to
> achieve the same?
> =

> You'd have to define how all these properties interact, regardless of
> whether any driver actually exposes them all at the same time. Plus the
> existing "Broadcast RGB" property. Or, you have to document what
> combinations of properties are forbidden for drivers to expose, so that
> userspace has the correct expectations and know how to use them right.
> =

>>
>> Now lets say if client has limited range content that it wants to display
>> using limited range, it will perform below steps:
>> (A) Set plane's input range property to LIMITED.
>> (B) Set connector's output range property to LIMITED.
>> (C) Read connector property to know whether sink support selectable
>> quantization range:
>>        (i) If no, validate HW timing + output range (LIMITED) using atom=
ic
>> test commit, if validation doesn't pass, client should choose another HW
>> timing and revalidate.
> =

> Is the assumption here that the timing implies range, like you
> explained with IT vs. CE? IOW, the kernel can tell the difference
> between IT and CE timings just from the timing parameters themselves?
> =

>>        (ii) if yes, it is not necessary to validate HW timing + output
>> range.
> =

> Given the nature of the atomic KMS UAPI, I'd say it is always necessary
> to validate. Just because a setting is possible does not imply the
> combination of all property values you picked is valid.
> =

>> Now lets say if client has limited range content that it wants to display
>> using full range, it will perform below steps:
>> (A) Set plane's input range property to LIMITED
>> (B) Set connector's output range property to FULL
>> (C) Read connector property to know whether sink support selectable
>> quantization range:
>>        (i) if no, validate HW timing + output range (FULL) using atomic
>> test commit, if validation doesn't pass, client should choose another HW
>> timing and revalidate
>>        (ii) if yes, it is not necessary to validate HW timing + output
>> range.
>> In this example DRM driver will automatically set up display pipeline to=
 do
>> limited to full-range conversion.
> =

> Right.
> =

>> Out of the three new properties mentioned above there is another choice =
for
>> property (1): Instead of expecting client to read whether sink support
>> selectable quantization range and perform validations as mentioned above
>> when quantization range is not selectable, how about adding new flags to
>> drmModeModeInfo->flags and let DRM driver to inform client using this fl=
ag
>> whether given HW timing is supported with full range, limited range or
>> both? This will avoid validation step mentioned in (C)(i).
> =

> I can't tell if that is a good idea or not, but I don't think the
> validation can be avoided in any case. With atomic, userspace should
> always validate before assuming.
> =

>> Let me know what you think about the overall proposal mentioned above. If
>> there is no strong disagreement about adding new DRM KMS properties for
>> output quantization range (and output encoding), I'll plan to start work=
ing
>> on the changes.
> =

> From my opinion as a Weston maintainer, I think having quantization
> range and wire encoding would be good to have. The devil is in the
> details though, as always.
> =

> =

> Thanks,
> pq
> =

> =

>>
>> Thanks,
>> -Yogish
>>
>>>
>>> If we look at I915 driver's "Broadcast RGB" property, it seems to say
>>> to me that the framebuffer is always primarily assumed to be in
>>> full-range, and the conversion to limited-range happens in the scanout
>>> circuitry. So that property would not help with video content that is
>>> already in limited-range.
>>>
>>> To recap, there are two orthogonal things: application content or
>>> framebuffer range, and video sink / monitor range. The display server
>>> between the two, at last if it is a Wayland compositor, would be able to
>>> convert as necessary.
>>>  =

>>>> For how to use selectable output encoding with Weston:
>>>> I was thinking that DRM should have separate property to list the  =

>>> encodings  =

>>>> supported by sink and Weston will present this list to its client. You=
r  =

>>>
>>> Not client. A configuration tool perhaps, but not generically to all
>>> Wayland clients, not as a directly settable knob at least.
>>>  =

>>>> idea to validate encodings using TEST_ONLY commit and present a list of
>>>> timings along with encodings supported by particular timing seems bett=
er.
>>>> Instead of validating all possible encodings, does it make sense to
>>>> validate  only those supported by sink? Irrespective of this we would  =

>>>
>>> Yes, having a list of what the sink actually supports would be nice.
>>>
>>> As for Wayland clients, there is an extension brewing at
>>> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_reques=
ts/8
>>> that would allow suggesting the optimal encoding (pixel format and
>>> modifier really) in flight.
>>>
>>> That said, we are talking about the two different things here:
>>> framebuffer format vs. encoding on the wire. Whether making them match
>>> has benefits is another matter.
>>>  =

>>>> anyway need some mechanism which will allow user to select particular
>>>> encoding for a particular mode. I was thinking to allow this using new=
  =

>>> DRM  =

>>>> property "Encoding". Do you have anything better in mind?  =

>>>
>>> I think that is a reasonable and useful goal and idea. Just remember to
>>> document it when proposing, even if it seems obvious. The details on
>>> how to formulate that into UAPI is up for debate.
>>>
>>> As said, changing KMS properties after they have been exposed to
>>> userspace won't really work from either kernel or userspace point of
>>> view. So you'd probably need to expose one blob type property listing
>>> the encodings that may work as an array, and another property for
>>> setting the one to use. IN_FORMATS property is somewhat similar,
>>> although more complicated because it is the combination of format and
>>> modifier.
>>>  =

>>>> (Since I am using my Gmail Id, I feel I should mention that I work at
>>>> Nvidia)  =

>>>
>>> Nice to know the source of interest. :-)
>>>
>>>
>>> Thanks,
>>> pq
>>>  =

>>>>
>>>> Thanks,
>>>> -Yogish
>>>>
>>>> On Thu, May 28, 2020 at 6:18 PM Pekka Paalanen <ppaalanen@gmail.com>  =

>>> wrote:  =

>>>>  =

>>>>> On Thu, 28 May 2020 17:38:59 +0530
>>>>> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
>>>>>  =

>>>>>> I am trying to find a way through Weston which will allow setting  =

>>>>> specific  =

>>>>>> encoding at display output.  =

>>>>>
>>>>> Hi,
>>>>>
>>>>> why do *you* want to control that?
>>>>>
>>>>> Why not let the driver always choose the highest possible encoding
>>>>> given the video mode and hardware capability?
>>>>>
>>>>> I can understand userspace wanting to know what it got, but why should
>>>>> userspace be able to control it?
>>>>>
>>>>> Would people want to pick the encoding first, and then go for the
>>>>> highest possible video mode?
>>>>>  =

>>>>>> Could you please elaborate on  why it is best
>>>>>> to let DRM driver automatically configure which encoding to choose  =

>>> rather  =

>>>>>> than making it selectable by DRM client ? I am not able to find  =

>>> reference  =

>>>>>> to past discussion about this. I was only able to find a proposed  =

>>> change  =

>>>>> -  =

>>>>>>  =

>>> https://lists.freedesktop.org/archives/intel-gfx/2017-April/125451.html=
  =

>>>>> but  =

>>>>>> am not able to find why it got rejected.
>>>>>>
>>>>>> Alternatively, is there existing way through which DRM clients can  =

>>>>> specify  =

>>>>>> preference for output encoding ? Or currently it's all up to the  =

>>> DRM  =

>>>>> driver  =

>>>>>> to choose what output encoding to use.  =

>>>>>
>>>>> There must be some reason why userspace needs to be able to control i=
t.
>>>>> I'm also asking as a Weston maintainer, since I'm interested in how
>>>>> this affects e.g. color reproduction or HDR support.
>>>>>
>>>>> One thing that comes to my mind is using atomic TEST_ONLY commits to
>>>>> probe all the possible video modes =D7 encodings for presenting a lis=
t to
>>>>> the user to choose from, if you have a display configuration GUI. E.g
>>>>> with some TV use cases, maybe the user wants to avoid sub-sampling, u=
se
>>>>> the native resolution, but limit refresh rate to what's actually
>>>>> possible. Or any other combination of the three.
>>>>>
>>>>>
>>>>> Thanks,
>>>>> pq
>>>>>  =

>>>>>>
>>>>>> Thanks,
>>>>>> -Yogish
>>>>>>
>>>>>> On Thu, May 28, 2020 at 1:54 PM Daniel Vetter <daniel@ffwll.ch>  =

>>> wrote:  =

>>>>>>  =

>>>>>>> On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote:  =

>>>>>>>> For creating new source property, is it good to follow
>>>>>>>> "drm_mode_create_hdmi_colorspace_property()"  as an example ?  =

>>> It  =

>>>>> seems  =

>>>>>>> that  =

>>>>>>>> currently there is no standard DRM property which allows DRM  =

>>> client  =

>>>>> to  =

>>>>>>> set  =

>>>>>>>> a specific output encoding (like YUV420, YUV422 etc). Also,  =

>>> there is  =

>>>>> no  =

>>>>>>>> standard property for letting client select YUV/RGB color range.  =

>>> I  =

>>>>> see  =

>>>>>>>> there are two ways to introduce new properties, 1. do something  =

>>> like  =

>>>>>>>> drm_mode_create_hdmi_colorspace_property 2. create custom  =

>>> property  =

>>>>>>> similar  =

>>>>>>>> to "Broadcast RGB". Is there opinion on which is a preferable  =

>>> way  =

>>>>> to  =

>>>>>>> expose  =

>>>>>>>> encoding and color rage selection property ?  =

>>>>>>>
>>>>>>> I guess first question is "why?" Thus far we've gone with the  =

>>> opinion  =

>>>>> that  =

>>>>>>> automatically configuring output stuff as much as possible is  =

>>> best.  =

>>>>> What's  =

>>>>>>> the use-case where the driver can't select this?
>>>>>>> -Daniel  =

>>>>>  =

>>>
>>>  =

> =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
